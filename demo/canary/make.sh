# gcc -m32 target.c -o target -no-pie -fno-stack-protector -fomit-frame-pointer
gcc target.c -o target -fno-stack-protector -fomit-frame-pointer 
