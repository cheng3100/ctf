#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <libusb-1.0/libusb.h>

uint8_t       endpoints[2];
struct
{
  long		address;
  long		length;
  int           devices:1;
  int           verbose:2;
} sw;

#define RETRY_MAX 5
#define USB_BUF_SIZE 0x200
uint8_t       usb_buf[USB_BUF_SIZE];

static void
print_endpoint_comp( const struct libusb_ss_endpoint_companion_descriptor
    *ep_comp )
{
  printf( "      USB 3.0 Endpoint Companion:\n" );
  printf( "	bMaxBurst:	  %d\n", ep_comp->bMaxBurst );
  printf( "	bmAttributes:	  0x%02x\n", ep_comp->bmAttributes );
  printf( "	wBytesPerInterval: %d\n", ep_comp->wBytesPerInterval );
}

static void
print_endpoint( const struct libusb_endpoint_descriptor *endpoint )
{
  int           i, ret;

  if( sw.verbose )
  {
    printf( "      Endpoint:\n" );
    printf( "	bEndpointAddress: %02xh\n", endpoint->bEndpointAddress );
    printf( "	bmAttributes:	  %02xh\n", endpoint->bmAttributes );
    printf( "	wMaxPacketSize:	  %d\n", endpoint->wMaxPacketSize );
    printf( "	bInterval:	  %d\n", endpoint->bInterval );
    printf( "	bRefresh:	  %d\n", endpoint->bRefresh );
    printf( "	bSynchAddress:	  %d\n", endpoint->bSynchAddress );
  }
  for( i = 0; i < endpoint->extra_length; )
  {
    if( LIBUSB_DT_SS_ENDPOINT_COMPANION == endpoint->extra[i + 1] )
    {
      struct libusb_ss_endpoint_companion_descriptor *ep_comp;

      ret =
	  libusb_get_ss_endpoint_companion_descriptor( NULL, endpoint,
	  &ep_comp );
      if( LIBUSB_SUCCESS != ret )
      {
	continue;
      }
      if( sw.verbose )
	print_endpoint_comp( ep_comp );

      libusb_free_ss_endpoint_companion_descriptor( ep_comp );
    }

    i += endpoint->extra[i];
  }
}

static void
print_altsetting( const struct libusb_interface_descriptor *interface )
{
  uint8_t       i;

  if( sw.verbose )
  {
    printf( "    Interface:\n" );
    printf( "      bInterfaceNumber:	  %d\n",
	interface->bInterfaceNumber );
    printf( "      bAlternateSetting:  %d\n", interface->bAlternateSetting );
    printf( "      bNumEndpoints:	  %d\n", interface->bNumEndpoints );
    printf( "      bInterfaceClass:	  %d\n", interface->bInterfaceClass );
    printf( "      bInterfaceSubClass: %d\n", interface->bInterfaceSubClass );
    printf( "      bInterfaceProtocol: %d\n", interface->bInterfaceProtocol );
    printf( "      iInterface:	  %d\n", interface->iInterface );
  }
  if( interface->bInterfaceClass == 255 && interface->bNumEndpoints == 2 )
  {
    // memorize this class endpoints
    endpoints[0] = interface->endpoint[0].bEndpointAddress;
    endpoints[1] = interface->endpoint[1].bEndpointAddress;
  }
  for( i = 0; i < interface->bNumEndpoints; i++ )
    print_endpoint( &interface->endpoint[i] );
}

static void
print_2_0_ext_cap( struct libusb_usb_2_0_extension_descriptor
    *usb_2_0_ext_cap )
{
  printf( "    USB 2.0 Extension Capabilities:\n" );
  printf( "      bDevCapabilityType: %d\n",
      usb_2_0_ext_cap->bDevCapabilityType );
  printf( "      bmAttributes:	  0x%x\n", usb_2_0_ext_cap->bmAttributes );
}

static void
print_ss_usb_cap( struct libusb_ss_usb_device_capability_descriptor
    *ss_usb_cap )
{
  printf( "    USB 3.0 Capabilities:\n" );
  printf( "      bDevCapabilityType: %d\n", ss_usb_cap->bDevCapabilityType );
  printf( "      bmAttributes:	  0x%x\n", ss_usb_cap->bmAttributes );
  printf( "      wSpeedSupported:	  0x%x\n",
      ss_usb_cap->wSpeedSupported );
  printf( "      bFunctionalitySupport: %d\n",
      ss_usb_cap->bFunctionalitySupport );
  printf( "      bU1devExitLat:	  %d\n", ss_usb_cap->bU1DevExitLat );
  printf( "      bU2devExitLat:	  %d\n", ss_usb_cap->bU2DevExitLat );
}

static void
print_bos( libusb_device_handle * handle )
{
  struct libusb_bos_descriptor *bos;
  int           ret;

  ret = libusb_get_bos_descriptor( handle, &bos );
  if( 0 > ret )
  {
    return;
  }

  if( sw.verbose )
  {
    printf( "  Binary Object Store (BOS):\n" );
    printf( "    wTotalLength:	%d\n", bos->wTotalLength );
    printf( "    bNumDeviceCaps:	%d\n", bos->bNumDeviceCaps );
  }
  if( bos->dev_capability[0]->bDevCapabilityType ==
      LIBUSB_BT_USB_2_0_EXTENSION )
  {

    struct libusb_usb_2_0_extension_descriptor *usb_2_0_extension;
    ret =
	libusb_get_usb_2_0_extension_descriptor( NULL, bos->dev_capability[0],
	&usb_2_0_extension );
    if( 0 > ret )
    {
      return;
    }

    if( sw.verbose )
      print_2_0_ext_cap( usb_2_0_extension );
    libusb_free_usb_2_0_extension_descriptor( usb_2_0_extension );
  }

  if( bos->dev_capability[0]->bDevCapabilityType ==
      LIBUSB_BT_SS_USB_DEVICE_CAPABILITY )
  {

    struct libusb_ss_usb_device_capability_descriptor *dev_cap;
    ret =
	libusb_get_ss_usb_device_capability_descriptor( NULL,
	bos->dev_capability[0], &dev_cap );
    if( 0 > ret )
    {
      return;
    }

    if( sw.verbose )
      print_ss_usb_cap( dev_cap );
    libusb_free_ss_usb_device_capability_descriptor( dev_cap );
  }

  libusb_free_bos_descriptor( bos );
}

static void
print_interface( const struct libusb_interface *interface )
{
  int           i;

  for( i = 0; i < interface->num_altsetting; i++ )
  {
    print_altsetting( &interface->altsetting[i] );
  }
}

static void
print_configuration( struct libusb_config_descriptor *config )
{
  uint8_t       i;

  if( sw.verbose )
  {
    printf( "  Configuration:\n" );
    printf( "    wTotalLength:	  %d\n", config->wTotalLength );
    printf( "    bNumInterfaces:	  %d\n", config->bNumInterfaces );
    printf( "    bConfigurationValue:  %d\n", config->bConfigurationValue );
    printf( "    iConfiguration:	  %d\n", config->iConfiguration );
    printf( "    bmAttributes:	  %02xh\n", config->bmAttributes );
    printf( "    MaxPower:		  %d\n", config->MaxPower );
  }
  for( i = 0; i < config->bNumInterfaces; i++ )
    print_interface( &config->interface[i] );
}

static int
xchg( libusb_device_handle * handle, uint8_t ep, uint8_t * buf, int len )
{
  int           i, r, size;
  i = 0;
  do
  {
    r = libusb_bulk_transfer( handle, ep, buf, len, &size, 1000 );
    if( r == LIBUSB_ERROR_PIPE )
    {
      libusb_clear_halt( handle, ep );
    }
    i++;
  }
  while( ( r == LIBUSB_ERROR_PIPE ) && ( i < RETRY_MAX ) );
  if( r != LIBUSB_SUCCESS )
  {
    fprintf( stderr, "    xchg error.\n" );
    return -1;
  }
  return size;
}

struct
{
  uint8_t       cmd;
  uint32_t      addr;
  uint32_t      len;
  uint32_t      para2;
  uint32_t      para3;
} __attribute__( ( packed ) ) jlink_usb;

static int
dump_segger_flash_memory( libusb_device * dev, libusb_device_handle * handle )
{
  int           i, r, len;
  char         *s, dump_name[80];
  uint32_t     *p;
  uint32_t      seed;
  FILE         *f;

  strcpy( dump_name, "fw_dump.bin" );
  libusb_set_auto_detach_kernel_driver( handle, 1 );
  jlink_usb.cmd = 1;		// get firmware version
  r = xchg( handle, endpoints[1], &jlink_usb.cmd, 1 );
  r = xchg( handle, endpoints[0], usb_buf, 2 );
  if( r == 2 )
  {
    len = ( usb_buf[1] << 8 ) | usb_buf[0];
    if( len > USB_BUF_SIZE )
      return -1;
    r = xchg( handle, endpoints[0], usb_buf, len );
    if( r == len )
    {
      printf( "Firmware version: %s\n", usb_buf );
      if( ( s = strstr( ( char * ) usb_buf, "compiled" ) ) != NULL )
      {
	sprintf( s, "fw_0x%x.bin", sw.address );
	strcpy( dump_name, ( char * ) usb_buf );
	s = dump_name;
	while( *s )
	{
	  if( *s == ' ' )
	    *s = '_';
	  s++;
	}
      }
    }
  }
  jlink_usb.cmd = 0xe6;		// get licenses
  r = xchg( handle, endpoints[1], &jlink_usb.cmd, 1 );
  r = xchg( handle, endpoints[0], usb_buf, 0x101 );
  if( r == 0x100 )
  {
    printf( "Serial: %d\n", *( uint32_t * ) usb_buf );
    printf( "Licenses:" );
    for( i = 0x20; i < 0x100; i += 0x10 )
    {
      if( usb_buf[i] == 0xff )
	break;
      printf( " %s", &usb_buf[i] );
    }
    printf( "\n" );
  }
  if( !sw.length ) 
    return 0;
  jlink_usb.cmd = 0xf2;		// get c000
  r = xchg( handle, endpoints[1], &jlink_usb.cmd, 1 );
  r = xchg( handle, endpoints[0], usb_buf, 0x101 );
  if( r == 0x100 )
  {
    if( sw.verbose )
    {
      printf( "Nr: 0x%x\n", *( uint16_t * ) usb_buf );
      if( usb_buf[0x50] != 0xff )
        printf( "Type: %s\n", &usb_buf[0x50] );
    }
  }
  seed = 0x4f455701;
  jlink_usb.cmd = 0x0e;		// set emu options
  jlink_usb.addr = 0x182;	// set seed
  jlink_usb.len = seed;		// seed value
  r = xchg( handle, endpoints[1], ( uint8_t * ) & jlink_usb,
      sizeof( jlink_usb ) );
  r = xchg( handle, endpoints[0], usb_buf, 4 + 1 );
  if( r != 4 || *( uint32_t * ) usb_buf != 0 )
  {
    fprintf( stderr, "Set seed failed.\n" );
    return -1;
  }
  if( ( f = fopen( dump_name, "wb" ) ) == NULL )
  {
    fprintf( stderr, "Cannot create firmware file %s.\n", dump_name );
    return -1;
  }
  jlink_usb.cmd = 0xfe;		// dump firmware
  jlink_usb.len = 0x100;	// USB_BUF_SIZE
  for( jlink_usb.addr = sw.address; jlink_usb.addr < sw.address + sw.length;
      jlink_usb.addr += jlink_usb.len )
  {
    r = xchg( handle, endpoints[1], ( uint8_t * ) & jlink_usb, 9 );
    r = xchg( handle, endpoints[0], usb_buf, jlink_usb.len + 1 );
    if( r == jlink_usb.len )
    {
      seed = 0x4f455701;
      p = ( uint32_t * ) usb_buf;
      for( i = 0; i < jlink_usb.len / sizeof( uint32_t ); i++ )
      {
	*p ^= seed;
	seed = *p ^ 0xa5a5a5a5;
	p++;
      }
      fwrite( usb_buf, 1, jlink_usb.len, f );
#if 0
      for( i = 0; i < r; i++ )
      {
	printf( "%02x ", usb_buf[i] );
	if( ( i & 0xf ) == 0xf )
	  printf( "\n" );
      }
      printf( "\n" );
#endif
    }
  }
  fclose( f );
  printf( "Firmware saved in '%s' file.\n", dump_name );
  return 0;
}

static int
print_device( libusb_device * dev, int level )
{
  struct libusb_device_descriptor desc;
  libusb_device_handle *handle = NULL;
  char          description[256];
  uint8_t       string[256];
  int           ret;
  uint8_t       i;

  ret = libusb_get_device_descriptor( dev, &desc );
  if( ret < 0 )
  {
    fprintf( stderr, "failed to get device descriptor" );
    return -1;
  }

  ret = libusb_open( dev, &handle );
  if( LIBUSB_SUCCESS == ret )
  {
    if( desc.iManufacturer )
    {
      ret =
	  libusb_get_string_descriptor_ascii( handle, desc.iManufacturer,
	  string, sizeof( string ) );
      if( ret > 0 )
	snprintf( description, sizeof( description ), "%s - ", string );
      else
	snprintf( description, sizeof( description ), "%04X - ",
	    desc.idVendor );
    }
    else
      snprintf( description, sizeof( description ), "%04X - ",
	  desc.idVendor );

    if( desc.iProduct )
    {
      ret =
	  libusb_get_string_descriptor_ascii( handle, desc.iProduct, string,
	  sizeof( string ) );
      if( ret > 0 )
	snprintf( description + strlen( description ),
	    sizeof( description ) - strlen( description ), "%s", string );
      else
	snprintf( description + strlen( description ),
	    sizeof( description ) - strlen( description ), "%04X",
	    desc.idProduct );
    }
    else
      snprintf( description + strlen( description ), sizeof( description ) -
	  strlen( description ), "%04X", desc.idProduct );
  }
  else
  {
    snprintf( description, sizeof( description ), "%04X - %04X",
	desc.idVendor, desc.idProduct );
  }

  if( sw.verbose )
    printf( "%.*sDev (bus %d, device %d): %s\n", level * 2, "		    ",
	libusb_get_bus_number( dev ),
	libusb_get_device_address( dev ), description );

  if( handle )
  {
    if( desc.iSerialNumber && sw.verbose )
    {
      ret =
	  libusb_get_string_descriptor_ascii( handle, desc.iSerialNumber,
	  string, sizeof( string ) );
      if( ret > 0 )
	printf( "%.*s  - Serial Number: %s\n", level * 2,
	    "		     ", string );
    }
  }

  for( i = 0; i < desc.bNumConfigurations; i++ )
  {
    struct libusb_config_descriptor *config;
    ret = libusb_get_config_descriptor( dev, i, &config );
    if( LIBUSB_SUCCESS != ret )
    {
      if( sw.verbose )
	printf( "  Couldn't retrieve descriptors\n" );
      continue;
    }

    print_configuration( config );

    libusb_free_config_descriptor( config );
  }

  if( handle && desc.bcdUSB >= 0x0201 )
  {
    print_bos( handle );
  }

  if( !strncmp( description, "SEGGER", 6 ) )
    dump_segger_flash_memory( dev, handle );

  if( handle )
    libusb_close( handle );

  return 0;
}


void
usage( char *progname )
{
  fprintf( stderr, "\n%s ", progname );
  fputs( "[options]\n", stderr );
  fputs( "\t-u\tlist all USB devices\n"
      "\t-a #\taddress of firmware to extract\n"
      "\t-l #\tlength of firmware to extract\n"
      "\t-v\tincrease debug level\n\n", stderr );
  fprintf( stderr, "For example to extract the complete flash image "
      "of a J-Link V9 you should use:\n%s -a 0x08000000 -l 0x40000\n\n", progname );
  exit( 0 );
}

int
main( int argc, char *argv[] )
{
  libusb_device **devs;
  ssize_t       cnt;
  int           r, i;
  char         *p;
  int           option;
  p = strrchr( argv[0], '/' );
  if( p == NULL )
    p = argv[0];
  else
    p++;
  do
  {
    option = getopt( argc, argv, "hvua:l:" );
    switch ( option )
    {
      case 'v':
	sw.verbose++;
	break;
      case 'u':
	sw.devices = 1;
	break;
      case 'a':
	sw.address = strtol(optarg, NULL, 0 );
	break;
      case 'l':
	sw.length = strtol(optarg, NULL, 0 );
	break;
      case EOF:		// no more options
	break;
      default:
	fprintf( stderr, "getopt returned impossible value: %d ('%c')",
	    option, option );
      case 'h':		// fall through
	usage( p );
    }
  }
  while( option != EOF );
  if( sw.devices == 0 && sw.length == 0 )
    usage( p );

  r = libusb_init( NULL );
  if( r < 0 )
    return r;

  cnt = libusb_get_device_list( NULL, &devs );
  if( cnt < 0 )
    return ( int ) cnt;

  for( i = 0; devs[i]; ++i )
  {
    print_device( devs[i], 0 );
  }

  libusb_free_device_list( devs, 1 );

  libusb_exit( NULL );
  return 0;
}
