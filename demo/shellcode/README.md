# TODO
- add arg in test.py to split shellcode output and run pwn test
- try the `bx esp` method on x86/x64
- bootup arm qemu env and  try the `bx esp`

# process

## now
- disbale NX and get the ret address by gdb 
- ret back to the shellcode on stack

## bug
- shellcode run on stack error, confirm not NX problem because can run the shellcode in the `shellcode.c`

