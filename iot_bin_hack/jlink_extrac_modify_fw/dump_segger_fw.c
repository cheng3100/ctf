/* Dump Segger debug probes firmware 
 * using the jlinkarm library */

#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <unistd.h>
#include <sys/stat.h>
#include <sys/wait.h>
#include <time.h>
#include <getopt.h>
#include <dirent.h>
#include <malloc.h>
#include <elf.h>
#define __USE_GNU
#include <link.h>
#include <dlfcn.h>
#include <sys/mman.h>

typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;

extern void  *__libc_malloc( size_t size );
extern void  *__libc_free( void *ptr );

#define AFTER_720 1
// #define LIB_OVERLAY 1

#define BUFSZ 0x1800
#define tbl_e1 "J-Trace ARM Rev.1"
#define tbl_e2 "J-Trace ARM CS Rev.1"
#define tbl_v9 "J-Link V9"
#define decomp_fn "EMU_Firmware: FW image buffer"
#define LIB_NAME "/opt/SEGGER/JLink/libjlinkarm.so"
#define FW_DIR   "/opt/SEGGER/JLink/Firmwares/"
#define BIN_NAME "J-Link_V9_image.bin"
#define BLDR_NAME "jlink_v9_bootloader.bin"
#define OCD_PGM    "ocd_program"
#define OCD_ERASE  "ocd_erase"
#define OCD_UNLOCK "ocd_unlock"
#define OCD_CMD    "openocd -f interface/stlink.cfg -f target/stm32f2x.cfg "

//  ":10C050004A2D4C696E6B2056392E3320506C757307",
//  ":10C0600000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDF",

char         *ihex_v9[] = {
  ":020000040800F2",
  ":10BF200047444200FFFFFFFFFFFFFFFFFFFFFFFF50",
  ":10BF300052444900FFFFFFFFFFFFFFFFFFFFFFFF2E",
  ":10BF4000466C617368425000FFFFFFFFFFFFFFFF79",
  ":10BF5000466C617368444C00FFFFFFFFFFFFFFFF6B",
  ":10BF60004A466C61736800FFFFFFFFFFFFFFFFFFA2",
  ":10C000000001FFFFFFFFFFFFFFFFFFFFFFFFFFFF3D",
  ":10C08000FFFFFFFFFFFFFFFFFF01FFFFFFFFFFFFBE",
  ":020000040803EF",
  ":10FF00007777772E7365676765722E636F6D004331",
  ":10FF10006F707972696768742028632920323030E5",
  ":10FF200033202D203230313220534547474552206F",
  ":10FF30004D6963726F636F6E74726F6C6C65722E55",
  ":10FF4000204D6179206265207573656420696E209B",
  ":10FF50006F726967696E616C204A2D4C696E6B73B4",
  ":10FF600020616E642070726F6475637473206D61BC",
  ":10FF70006E75666163747572656420756E64657212",
  ":10FF8000206C6963656E7365206F6E6C792E00FF5F",
  ":00000001FF", NULL
};

int           malloc_hook_active, firmware_dumped;
char          dump_fn[128];
char         *replace_fw;
u8            buf[BUFSZ];
u8            checksum;
// and     r12d, 0FFFFFC00h
u8            find_instr[7] = { 0x41, 0x81, 0xe4, 0x00, 0xfc, 0xff, 0xff };
// mov     r12d, [rax+1Ch] ; nop ; nop ; nop
u8            replace_instr[7] = { 0x44, 0x8b, 0x60, 0x1c, 0x90, 0x90, 0x90 };

struct
{
  unsigned int  extr_nr:8;
  unsigned int  extract:1;
  unsigned int  extract_all:1;
  unsigned int  pad:1;
  unsigned int  replace:1;
  unsigned int  list:1;
  unsigned int  v9:1;
  unsigned int  verbose:2;
} sw;

struct fw_entry
{
  char         *p_name;
#ifdef AFTER_720
  char         *fw_name;
#endif
  u8           *p_firmware;
  u32           length;
  u32           align1;
  u8           *p_decomp_fn;
  u32           exp_length;
  u32           nrb[7];
  u64           nrx;
  u8           *p_fn1;
  u64           lenx;
  u8           *p_fn2;
  u32           nre;
  u32           flags;
} __attribute__( ( packed ) );

struct
{
  void         *ptr;
  size_t        size;
}
mem_pointers[16];
int           pnr;
size_t        exp_size;

void         *
malloc( size_t size )
{
  void         *ptr;
  ptr = __libc_malloc( size );
  if( malloc_hook_active )
  {
    mem_pointers[pnr].ptr = ptr;
    mem_pointers[pnr].size = size;
    pnr++;
    pnr %= 16;
  }
  return ptr;
}

void
free( void *ptr )
{
  int           i, l, len;
  FILE         *f;
  if( malloc_hook_active )
  {
    for( i = 0; i < pnr; i++ )
      if( mem_pointers[i].ptr == ptr )
        break;
    if( i != pnr )
    {
      malloc_hook_active = 0;
      if( ( f = fopen( dump_fn, "wb" ) ) != NULL )
      {
        fwrite( ptr, 1, mem_pointers[i].size, f );
        if( sw.pad && exp_size > mem_pointers[i].size )
        {
          if( sw.verbose > 1 )
            printf( "Exp 0x%lx Alloc 0x%lx \n", exp_size,
                mem_pointers[i].size );
          len = exp_size - mem_pointers[i].size;
          memset( buf, 0xff, BUFSZ );
          for( i = 0; i < len; i += BUFSZ )
          {
            l = ( len - i > BUFSZ ) ? BUFSZ : len - i;
            l = fwrite( buf, 1, l, f );
          }
        }
        fclose( f );
        firmware_dumped++;
      }
      malloc_hook_active = 1;
    }
  }
  __libc_free( ptr );
}

u8
get_ihex_byte( char **pp )
{
  u8            h, l;
  h = ( *( *pp )++ | 0x20 ) - '0';
  if( h > 9 )
    h -= 0x27;
  l = ( *( *pp )++ | 0x20 ) - '0';
  if( l > 9 )
    l -= 0x27;
  h = ( h << 4 ) | l;
  checksum += h;
  return h;
}

int
read_ihex( FILE * fo )
{
  char         *p;
  int           i, nr, l, haddr, laddr, type;

  nr = 0;
  haddr = 0x800;
  while( ( p = ihex_v9[nr] ) != NULL )
  {
    nr++;
    if( *p++ != ':' )
      continue;
    checksum = 0;
    l = get_ihex_byte( &p );
    laddr = ( get_ihex_byte( &p ) << 8 ) | get_ihex_byte( &p );
    type = get_ihex_byte( &p );
    switch ( type )
    {
      case 4:                  // extended address
        haddr = ( get_ihex_byte( &p ) << 8 ) | get_ihex_byte( &p );
        break;
      case 1:                  // end of file
        break;
      case 0:
        for( i = 0; i < l; i++ )
          buf[i] = ( get_ihex_byte( &p ) );
        fseek( fo, ( haddr << 16 | laddr ) - 0x8000000, SEEK_SET );
        fwrite( buf, 1, l, fo );
        break;
    }
    get_ihex_byte( &p );        // get checksum byte
    if( checksum )
    {
      printf( "Checksum error in line %d : %x\n", nr, checksum );
      return 0;
    }
  }
  return 1;
}

#ifdef OLD_SEARCH
static int
get_elf_section( FILE * f, char *s_name, Elf64_Shdr * s_ptr )
{
  Elf64_Ehdr   *elf;
  Elf64_Shdr   *sect, *e;
  u64           e_shoff;
  u16           e_shnum, e_shstrndx;
  char         *n, names[BUFSZ];
  int           i;

  fseek( f, 0L, SEEK_SET );
  fread( buf, 1, BUFSZ, f );
  elf = ( Elf64_Ehdr * ) buf;
  e_shoff = elf->e_shoff;
  e_shnum = elf->e_shnum;
  e_shstrndx = elf->e_shstrndx;
  if( sw.verbose > 2 )
    printf( "OFF 0x%lx NUM 0x%x STRNDX 0x%x\n", e_shoff, e_shnum,
        e_shstrndx );
  sect = malloc( e_shnum * sizeof( Elf64_Shdr ) );
  fseek( f, e_shoff, SEEK_SET );
  fread( sect, 1, BUFSZ, f );
  e = sect;
  fseek( f, e[e_shstrndx].sh_offset, SEEK_SET );
  fread( names, 1, e[e_shstrndx].sh_size, f );
  for( i = 0; i < e_shnum; i++, e++ )
  {
    n = &names[e->sh_name];
    if( !strcmp( s_name, n ) )
    {
      if( sw.verbose )
        printf( "%2d Addr 0x%lx Off 0x%lx Size 0x%lx %s\n",
            i, e->sh_addr, e->sh_offset, e->sh_size, n );
      memcpy( s_ptr, e, sizeof( Elf64_Shdr ) );
      return 1;
    }

  }
  return 0;
}
#endif

struct ref
{
  int           step_struct;
  char        **c;
  char        **e1;
  char        **e2;
  u64           off_tbl;
  u64           off_fw;
};

struct sections
{
  void         *addr;
  uintmax_t     size;
  uintmax_t     flags;
  uintmax_t     type;
}
Sect[32];

int
extract_firmware( void *lib, struct ref *ref, char *firm_name,
    struct fw_entry *e )
{
#ifdef LIB_OVERLAY
  FILE         *fo;
  struct stat   statbuf;
  pid_t         c_pid;
  u32           fw_len;
  char         *new_name;
  int           i;
#endif
  FILE         *f;
  int           len, ret;
  u8           *b, *m;
  int           ( *fw ) ( char *, char *, int );
  char          version_str[256], fw_name[256];
  struct fw_entry *ee;

  // find the firmware decompression function
  fw = NULL;
  fw = dlsym( lib, "JLINK_GetEmbeddedFWString" );
  if( sw.verbose )
    printf( "JLINK_GetEmbeddedFWString @ %p\n", fw );
  if( sw.extract )
  {
    if( fw && e->fw_name == NULL )
    {
      exp_size = e->exp_length;
      pnr = 0;
      malloc_hook_active = 1;
      ret = fw( firm_name, version_str, 256 );
      printf( "%s\n", version_str );
      malloc_hook_active = 0;
      if( sw.verbose > 1 )
        printf( "malloc return %d\n", ret );
    }
    printf( "Extract " );
    if( firmware_dumped )
      printf( "compressed " );
    // firmware is not compressed or decomp function not found, just dump it from memory
    if( !firmware_dumped )
    {
      ee = ( struct fw_entry * ) ref->c;
      m = NULL;
      b = ee->p_firmware;
      len = ee->length;
      if( b == NULL && e->fw_name )
      {
        strcpy( fw_name, FW_DIR );
        strcat( fw_name, e->fw_name );
        if( ( f = fopen( fw_name, "rb" ) ) != NULL )
        {
          fseek( f, 0, SEEK_END );
          len = ftell( f );
          fseek( f, 0, SEEK_SET );
          m = malloc( len );
          b = m;
          fread( b, 1, len, f );
          fclose( f );
        }
      }
      if( ( f = fopen( dump_fn, "wb" ) ) != NULL )
      {
        fwrite( b, 1, len, f );
        fclose( f );
        firmware_dumped++;
        printf( "plain " );
      }
      if( m )
        free( m );
    }
    if( firmware_dumped )
      printf( "firmwware for %s\n", firm_name );
  }
#ifdef LIB_OVERLAY
  if( sw.replace )
  {
    // get the length of the replacement firmware
    if( ( f = fopen( replace_fw, "rb" ) ) == NULL )
    {
      printf( "Firmware %s not found\n", replace_fw );
      return 0;
    }
    fseek( f, 0, SEEK_END );
    fw_len = ftell( f );
    if( fw_len > e->length )
    {
      printf( "Not enough space to overlay firmware (%d > %d )\n",
          fw_len, e->length );
      return 0;
    }
    // make a backup copy of the library 
    new_name = malloc( sizeof( LIB_NAME ) + 5 );
    strcpy( new_name, LIB_NAME );
    strcat( new_name, ".bak" );
    if( stat( new_name, &statbuf ) == -1 )
    {
      c_pid = fork(  );
      if( c_pid == 0 )          // child
        execl( "/bin/cp", "/bin/cp", LIB_NAME, new_name, NULL );
      else
        wait( NULL );           // wait for child to finish
    }
    if( ( fo = fopen( LIB_NAME, "r+b" ) ) == NULL )
    {
      printf( "Cannot open library file %s\n", LIB_NAME );
      return 0;
    }
    fseek( fo, ref->off_fw, SEEK_SET );
    fseek( f, 0, SEEK_SET );
    len = fw_len;
    while( len )
    {
      i = len > BUFSZ ? BUFSZ : len;
      fread( buf, 1, i, f );
      fwrite( buf, 1, i, fo );
      len -= i;
    }
    fclose( f );
    fseek( fo, ref->off_tbl + ref->step_struct * sw.extr_nr, SEEK_SET );
    fread( buf, 1, sizeof( struct fw_entry ), fo );
    e = ( struct fw_entry * ) buf;
    e->length = e->exp_length = fw_len;
    e->p_decomp_fn = NULL;
    fseek( fo, ref->off_tbl + ref->step_struct * sw.extr_nr, SEEK_SET );
    fwrite( buf, 1, sizeof( struct fw_entry ), fo );
    fclose( fo );
    printf( "Library %s overlayed with firmware %s\n", new_name, replace_fw );
  }
#endif
  if( !sw.extract_all )
    dlclose( lib );
  return 1;
}

static int
callback( struct dl_phdr_info *info, size_t size, void *data )
{
  int           j;
  if( strcmp( info->dlpi_name, LIB_NAME ) )
    return 0;
#if 0
  printf( "Name: \"%s\" (%d segments)\n", info->dlpi_name, info->dlpi_phnum );
#endif
  for( j = 0; j < info->dlpi_phnum; j++ )
  {
    Sect[j].addr =
        ( void * ) ( info->dlpi_addr + info->dlpi_phdr[j].p_vaddr );
    Sect[j].size = ( uintmax_t ) info->dlpi_phdr[j].p_memsz;
    Sect[j].flags = ( uintmax_t ) info->dlpi_phdr[j].p_flags;
    Sect[j].type = ( uintmax_t ) info->dlpi_phdr[j].p_type;
#if 0
    printf( "    %2d: [%14p; memsz:%7jx] flags: %#jx; type: %#jx\n", j,
        Sect[j].addr, Sect[j].size, Sect[j].flags, Sect[j].type );
#endif
  }
  Sect[j].addr = NULL;
  return 0;
}

int
get_firmware( char *replace_fw )
{
  int           i;
  void         *lib;
  char         *firm_name;
  char         *c, *d, *ad_e1, *ad_e2, *ad_decomp;
  u8           *off, *ref_decomp;
  struct ref    Ref;
  struct fw_entry *e = NULL;
  struct sections *sc;
#ifdef OLD_SEARCH
  FILE         *f;
  Elf64_Shdr    Init, Code, Rodata, Dataro, Datarw;
#endif

#ifdef OLD_SEARCH
  if( ( f = fopen( LIB_NAME, "rb" ) ) == NULL )
    return -1;
  get_elf_section( f, ".init", &Init );
  get_elf_section( f, ".text", &Code );
  get_elf_section( f, ".rodata", &Rodata );
  get_elf_section( f, ".data.rel.ro", &Dataro );
  get_elf_section( f, ".data", &Datarw );
  fclose( f );
#endif
  if( ( lib = dlopen( LIB_NAME, RTLD_NOW ) ) == NULL )
  {
    printf( "dlopen: %s\n", dlerror(  ) );
    return -1;
  }
  dl_iterate_phdr( callback, NULL );
  ad_e1 = ad_e2 = ad_decomp = NULL;
  for( sc = Sect; sc->addr; sc++ )
  {
    if( sc->type != PT_LOAD || sc->flags & SHF_WRITE )
      continue;
    for( c = sc->addr; c < ( char * ) ( sc->addr + sc->size - 0x20 ); c++ )
    {
      if( *c == *tbl_e1 )
      {
        if( !strncmp( c, tbl_e1, 1 + strlen( tbl_e1 ) ) )
          ad_e1 = c;
        else if( !strncmp( c, tbl_e2, 1 + strlen( tbl_e2 ) ) )
          ad_e2 = c;
      }
      if( *c == *decomp_fn )
      {
        if( !strncmp( c, decomp_fn, 1 + strlen( decomp_fn ) ) )
          ad_decomp = c;
      }
      if( ad_e1 && ad_e2 && ad_decomp )
        break;
    }
    if( ad_e1 && ad_e2 && ad_decomp )
      break;
  }
  if( sw.verbose )
    printf( "Device_names %p %p\n", ad_e1, ad_e2 );
  if( sw.verbose > 1 )
    printf( "Decomp string %p\n", ad_decomp );
  // find the string decompression reference
  ref_decomp = NULL;
  for( sc = Sect; sc->addr; sc++ )
  {
    if( sc->type != PT_LOAD || !( sc->flags & SHF_WRITE ) )     // .text section
      continue;
    for( off = sc->addr; off < ( u8 * ) ( sc->addr + sc->size - 0x20 );
        off++ )
    {
      if( off + 4 + *( u32 * ) off == ( u8 * ) ad_decomp )
      {
        ref_decomp = off;
        break;
      }
    }
    if( ref_decomp )
      break;
  }
  if( sw.verbose > 1 )
    printf( "Decomp reference %p\n", ref_decomp );
  // try to patch the lenght instruction in memory
  // is the previous instruction a call?
  if( ref_decomp && *( ref_decomp - 8 ) == 0xe8 )
  {
    // find instruction
    for( i = 0; i < 7; i++ )
      if( *( ref_decomp - 17 + i ) != find_instr[i] )
        break;
    if( i == 7 )
    {
      // make the .text section temporarily writable
      if( mprotect( sc->addr, sc->size, PROT_READ | PROT_WRITE ) == 0 )
      {
        // patch instruction
        for( i = 0; i < 7; i++ )
          *( ref_decomp - 17 + i ) = replace_instr[i];
	// restore protection
        if( mprotect( sc->addr, sc->size, PROT_READ | PROT_EXEC ) == 0 )
          if( sw.verbose > 1 )
            printf( "Length instruction patched in memory\n" );
      }
    }
  }
  memset( &Ref, 0, sizeof( struct ref ) );
  // find the firmware table 
  for( sc = Sect; sc->addr; sc++ )
  {
    if( sc->type != PT_GNU_RELRO || sc->flags & SHF_WRITE )
      continue;
    for( Ref.c = sc->addr; Ref.c < ( char ** ) ( sc->addr + sc->size - 0x20 );
        Ref.c++ )
    {
      if( *Ref.c == ad_e1 )
        Ref.e1 = Ref.c;
      else if( *Ref.c == ad_e2 )
        Ref.e2 = Ref.c;
      if( Ref.e1 && Ref.e2 )
      {
        Ref.step_struct = ( u8 * ) Ref.e2 - ( u8 * ) Ref.e1;
        if( Ref.step_struct != sizeof( struct fw_entry ) )
          printf( "Warning step is 0x%x while structure is 0x%lx in size\n",
              Ref.step_struct, sizeof( struct fw_entry ) );
        break;
      }
    }
    if( Ref.e1 && Ref.e2 )
      break;
  }
  Ref.off_tbl = ( u64 ) Ref.e1; // missing code for LIB_OVERLAY 
  if( sw.verbose )
    printf
        ( "Fw table %p Step 0x%x StructSize 0x%lx\n",
        Ref.e1, Ref.step_struct, sizeof( struct fw_entry ) );
  strcpy( dump_fn, "firmware.bin" );
  firm_name = NULL;
  for( i = 0, Ref.c = Ref.e1; *Ref.c;
      Ref.c = ( char ** ) ( ( u8 * ) Ref.c + Ref.step_struct ), i++ )
  {
    firmware_dumped = 0;
    if( sw.list )
    {
      e = ( struct fw_entry * ) Ref.c;
      printf( "[%2d] [0x%06x->0x%06x] %s", i, e->length, e->exp_length,
          e->p_name );
#ifdef AFTER_720
      if( e->fw_name )
        printf( " (%s)", e->fw_name );
#endif
      putchar( '\n' );
      if( sw.verbose )
      {
        printf( "\t%p [0x%x] %p [0x%x]\n"
            "\t0x%x 0x%x 0x%x %d %d %d %d "
            "%ld %p [0x%lx] %p %d 0x%x\n",
            e->p_firmware, e->length, e->p_decomp_fn, e->exp_length,
            e->nrb[0], e->nrb[1], e->nrb[2], e->nrb[3], e->nrb[4], e->nrb[5],
            e->nrb[6], e->nrx, e->p_fn1, e->lenx, e->p_fn2, e->nre,
            e->flags );
      }
    }
    if( sw.v9 )
    {
      if( !strncmp( *Ref.c, tbl_v9, strlen( tbl_v9 ) ) )
      {
        sw.extract = 1;
        sw.extr_nr = i;
      }
    }
    if( sw.extract_all || ( ( sw.extract || sw.replace ) && i == sw.extr_nr ) )
    {
      e = ( struct fw_entry * ) Ref.c;
      Ref.off_fw = ( u64 ) e->p_firmware;
      if( sw.verbose )
        printf( "Firmware offset in lib file 0x%lx\n", Ref.off_fw );
      firm_name = strdup( *Ref.c );
      strcpy( dump_fn, firm_name );
      c = d = dump_fn;
      while( *c )
      {
        if( *c == '/' )
          d -= 2;
        else if( *c == ' ' )
          *d = '_';
        else
          *d = *c;
        c++;
        d++;
      }
      while( *( d - 1 ) == '_' )
        d--;
      strcpy( d, ".bin" );
      if( sw.extract_all )
      {
	sw.extr_nr = i;
	extract_firmware( lib, &Ref, firm_name, e );
      }
      else
        break;
    }
  }

  if( sw.extract_all || sw.list || firm_name == NULL )
  {
    dlclose( lib );
    return 1;
  }
  if( sw.extract_all )
    return 1;
  return extract_firmware( lib, &Ref, firm_name, e );
}

#define POLY 0x8408

u16
crc16( u8 * data_p, int length )
{
  int           i;
  u8            data;
  u16           crc = 0;

  do
  {
    for( i = 0, data = *data_p++; i < 8; i++, data >>= 1 )
    {
      if( ( crc & 1 ) ^ ( data & 1 ) )
        crc = ( crc >> 1 ) ^ POLY;
      else
        crc >>= 1;
    }
  }
  while( --length );
  return crc;
}

int
generate_v9_firmware( void )
{
  int           l, len;
  char          str_serial[20], str_hw_rev[8];
  u32           serial, hw_rev;
  u16           crc;
  u8           *zone, y;
  FILE         *fi, *fo;

  if( ( fo = fopen( OCD_UNLOCK, "wt" ) ) == NULL )
    return 0;
  fprintf( fo, "add_script_search_dir %s\n", getcwd( ( char * ) buf,
      BUFSZ ) );
  fprintf( fo,
      "init\nreset halt\nsleep 1000\nstm32f2x unlock 0\nshutdown\n" );
  fclose( fo );
  if( ( fo = fopen( OCD_ERASE, "wt" ) ) == NULL )
    return 0;
  fprintf( fo, "add_script_search_dir %s\n", getcwd( ( char * ) buf,
      BUFSZ ) );
  fprintf( fo,
      "init\nreset halt\nsleep 1000\nstm32f2x mass_erase 0\nshutdown\n" );
  fclose( fo );
  if( ( fo = fopen( OCD_PGM, "wt" ) ) == NULL )
    return 0;
  fprintf( fo, "add_script_search_dir %s\n", getcwd( ( char * ) buf,
      BUFSZ ) );
  fprintf( fo, "program %s 0x8000000\n", BIN_NAME );
  fprintf( fo, "shutdown\n" );
  fclose( fo );
  if( ( fi = fopen( dump_fn, "rb" ) ) == NULL )
    return 0;
  if( ( fo = fopen( BIN_NAME, "wb" ) ) == NULL )
    return 0;
  fseek( fi, 0, SEEK_SET );
  fseek( fo, 0, SEEK_SET );
  fread( buf, 1, 0x200, fi );   // copy the IVT at address 0
  fwrite( buf, 1, 0x200, fo );
  memset( buf, 0xff, BUFSZ );
  // fill flash space with FF
  len = 0x40000 - 0x200;
  while( len )
  {
    l = len > BUFSZ ? BUFSZ : len;
    len -= fwrite( buf, 1, l, fo );
  }
  // place firmware at offset 0x10000 ( 0x8010000 address )
  fseek( fi, 0, SEEK_END );
  len = ftell( fi );
  fseek( fi, 0, SEEK_SET );
  fseek( fo, 0x10000, SEEK_SET );
  while( ( l = fread( buf, 1, BUFSZ, fi ) ) )
    fwrite( buf, 1, l, fo );
  fclose( fi );
  if( !read_ihex( fo ) )
  {
    fclose( fo );
    return 0;
  }
  fo = freopen( NULL, "r+b", fo );      // reopen so we can read from the file
  // if we have a local copy of the bootloader include that in the image
  if( ( fi = fopen( BLDR_NAME, "rb" ) ) != NULL )
  {
    fseek( fo, 0, SEEK_SET );
    while( ( l = fread( buf, 1, BUFSZ, fi ) ) )
      fwrite( buf, 1, l, fo );
    fclose( fi );
  }
  else                          // set the firmware datestamp 100 years in advance
  {
    fseek( fo, 0x1022b, SEEK_SET );
    fread( &y, 1, 1, fo );
    y++;
    fseek( fo, -1, SEEK_CUR );
    fwrite( &y, 1, 1, fo );
  }
  if( ( zone = malloc( 0x2fffe ) ) == NULL )
    return 0;
  fseek( fo, 0x10000, SEEK_SET );
  fread( zone, 1, 0x2fffe, fo );
  crc = crc16( zone, 0x2fffe ); // calculate the new crc
  free( zone );
  fseek( fo, 0x3fffe, SEEK_SET );
  fwrite( &crc, 2, 1, fo );
  fseek( fo, 0xbf00, SEEK_SET );        // serial number offset
  hw_rev = 94;
//  read( fo, &serial, 4 );
//  printf( "Current serial number: %d\n", serial );
  printf( "\nEnter serial number or press enter to set to a random value: " );
  fflush( stdout );
  fgets( str_serial, 20, stdin );
  serial = atoi( str_serial );
  if( !serial )
  {
    srand( time( NULL ) );
    serial = rand(  ) % 1000000000;
    printf( "\nEnter the hardware revision (9.2 to 9.7, default is 9.4): " );
    fflush( stdout );
    fgets( str_hw_rev, 8, stdin );
    hw_rev = atof( str_hw_rev ) * 10.;
    if( hw_rev < 92 || hw_rev > 97 )
      hw_rev = 94;
    // 2 digits of hardware version are encoded in the serial number
    serial =
        ( serial / 10000000 * 10000000 ) + hw_rev * 100000 +
        ( serial % 100000 );
  }
  printf( "Current serial number: %d\n", serial );
  fwrite( &serial, 4, 1, fo );
  sprintf( buf, "J-Link V%.1f Plus", hw_rev / 10. );
  fseek( fo, 0xc050, SEEK_SET );
  fwrite( buf, 1, 1 + strlen( buf ), fo );
  fclose( fo );
  return 1;
}

void
usage( char *progname )
{
  fprintf( stderr, "\n%s ", progname );
#ifdef LIB_OVERLAY
  fputs( "[options] fw_to_overlay.bin\n", stderr );
#else
  fputs( "[options]\n", stderr );
#endif
  fputs( "\t-l\tlist all firmwares\n"
      "\t-x #\textract firmware number #\n"
      "\t-a\textract all firmwares\n"
      "\t-p #\tpad extracted firmware with 'ff' to full length\n"
#ifdef LIB_OVERLAY
      "\t-r #\treplace firmware number # in lib\n"
#endif
      "\t-9\textract firmware for J-Link V9 and make a flashable image\n"
      "\t-v\tincrease verbose level\n\n", stderr );
  exit( 0 );
}

int
main( int argc, char *argv[] )
{
  char         *p;
  int           option;
  p = strrchr( argv[0], '/' );
  if( p == NULL )
    p = argv[0];
  else
    p++;
  do
  {
    option = getopt( argc, argv, "hvl9pax:r:" );
    switch ( option )
    {
      case 'v':
        sw.verbose++;
        break;
      case 'l':
        sw.list = 1;
        break;
      case 'x':
        sw.extract = 1;
        sw.extr_nr = atoi( optarg );
        break;
      case 'a':
        sw.extract = 1;
        sw.extract_all = 1;
        break;
      case 'p':
        sw.pad = 1;
        break;
#ifdef LIB_OVERLAY
      case 'r':
        sw.replace = 1;
        sw.extr_nr = atoi( optarg );
        break;
#endif
      case '9':
        sw.v9 = 1;
        break;
      case EOF:                // no more options
        break;
      default:
        fprintf( stderr, "getopt returned impossible value: %d ('%c')",
            option, option );
      case 'h':                // fall through
        usage( p );
    }
  }
  while( option != EOF );
  if( ( sw.list || sw.extract || sw.replace || sw.v9 ) == 0 )
    usage( p );
  replace_fw = NULL;
  if( sw.replace )
  {
    if( optind == argc )
      usage( p );
    replace_fw = argv[optind++];
  }
  get_firmware( replace_fw );
  if( sw.v9 )
  {
    if( !generate_v9_firmware(  ) )
      printf( "Failed to create binary firmware file\n" );
    else
    {
      printf( "\nUse the following command to:\n"
          "- unlock your device (if needed)\n\t"
          OCD_CMD "-f " OCD_UNLOCK "\n\n"
          "- erase your device (if needed)\n\t"
          OCD_CMD "-f " OCD_ERASE "\n\n"
          "- program your device:\n\t" OCD_CMD "-f " OCD_PGM "\n\n" );
    }
  }
}
