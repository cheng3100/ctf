# ctf site list
- https://ropemporium.com/challenge
- http://pwnable.kr/play.php
- https://azeria-labs.com/part-3-stack-overflow-challenges/


# ret2win
done.

# split

## TODO
- how to search string/symbol by `rabin2` or other [done]
- how to dump binary at a address 
- how use gdb watch stack change 
- pwntools more usage method [done]
- gdb debug coredump file

> here is a example solution to refer the more skillful tool usage
> https://bananamafia.dev/post/x64-bof/

## solution
- find the cmd string `cat xx`

by use this found a symbol `usefulString`
`rabin2 -E ./split` 

But better use this to list all string at ./rodata
`rabin -z ./split`

- found the need asm instruction from end to start
	- need a system call `system`
		by watch the code found it. But seem need a better method
	- need to ready the parameter, here only set the `rdi` to the addr of the cmd str
		by `ropper` search the `pop` cmd found a `pop rdi; ret;` great!
	- check the stack 16byte align to see if need a extra `ret` to make stack align,		seem no need to (this only need for x64)
- write the python code to generate the shell code byte bin file. Note not print but sys.write

- `./split < test.sc`, done!


## tip
### gdb
* watch the asm instruction
`display/Ni $pc`
`undisplay [N]` to cancel it

* search asm instruction by ropper
`ropper -f [binfile] --search ["call "]`

# callme & write4
see note

# badchars
## trick
'flag.txt' has all the 4 `bad char`. The method to bypass it is to xor the `badchars` then use the gadget to xor back.

another trick is the address cann't set to the beginning of `.data` section. Because this address + 4 will has a `\x2e` bytes which equals the `.`. So I choose the `.data` + 8 as the address to save the path string
