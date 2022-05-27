
target:     file format elf64-x86-64


Disassembly of section .init:

0000000000401000 <_init>:
  401000:	f3 0f 1e fa          	endbr64 
  401004:	48 83 ec 08          	sub    $0x8,%rsp
  401008:	48 8b 05 e9 2f 00 00 	mov    0x2fe9(%rip),%rax        # 403ff8 <__gmon_start__>
  40100f:	48 85 c0             	test   %rax,%rax
  401012:	74 02                	je     401016 <_init+0x16>
  401014:	ff d0                	callq  *%rax
  401016:	48 83 c4 08          	add    $0x8,%rsp
  40101a:	c3                   	retq   

Disassembly of section .plt:

0000000000401020 <.plt>:
  401020:	ff 35 e2 2f 00 00    	pushq  0x2fe2(%rip)        # 404008 <_GLOBAL_OFFSET_TABLE_+0x8>
  401026:	f2 ff 25 e3 2f 00 00 	bnd jmpq *0x2fe3(%rip)        # 404010 <_GLOBAL_OFFSET_TABLE_+0x10>
  40102d:	0f 1f 00             	nopl   (%rax)
  401030:	f3 0f 1e fa          	endbr64 
  401034:	68 00 00 00 00       	pushq  $0x0
  401039:	f2 e9 e1 ff ff ff    	bnd jmpq 401020 <.plt>
  40103f:	90                   	nop
  401040:	f3 0f 1e fa          	endbr64 
  401044:	68 01 00 00 00       	pushq  $0x1
  401049:	f2 e9 d1 ff ff ff    	bnd jmpq 401020 <.plt>
  40104f:	90                   	nop
  401050:	f3 0f 1e fa          	endbr64 
  401054:	68 02 00 00 00       	pushq  $0x2
  401059:	f2 e9 c1 ff ff ff    	bnd jmpq 401020 <.plt>
  40105f:	90                   	nop
  401060:	f3 0f 1e fa          	endbr64 
  401064:	68 03 00 00 00       	pushq  $0x3
  401069:	f2 e9 b1 ff ff ff    	bnd jmpq 401020 <.plt>
  40106f:	90                   	nop
  401070:	f3 0f 1e fa          	endbr64 
  401074:	68 04 00 00 00       	pushq  $0x4
  401079:	f2 e9 a1 ff ff ff    	bnd jmpq 401020 <.plt>
  40107f:	90                   	nop
  401080:	f3 0f 1e fa          	endbr64 
  401084:	68 05 00 00 00       	pushq  $0x5
  401089:	f2 e9 91 ff ff ff    	bnd jmpq 401020 <.plt>
  40108f:	90                   	nop
  401090:	f3 0f 1e fa          	endbr64 
  401094:	68 06 00 00 00       	pushq  $0x6
  401099:	f2 e9 81 ff ff ff    	bnd jmpq 401020 <.plt>
  40109f:	90                   	nop
  4010a0:	f3 0f 1e fa          	endbr64 
  4010a4:	68 07 00 00 00       	pushq  $0x7
  4010a9:	f2 e9 71 ff ff ff    	bnd jmpq 401020 <.plt>
  4010af:	90                   	nop
  4010b0:	f3 0f 1e fa          	endbr64 
  4010b4:	68 08 00 00 00       	pushq  $0x8
  4010b9:	f2 e9 61 ff ff ff    	bnd jmpq 401020 <.plt>
  4010bf:	90                   	nop
  4010c0:	f3 0f 1e fa          	endbr64 
  4010c4:	68 09 00 00 00       	pushq  $0x9
  4010c9:	f2 e9 51 ff ff ff    	bnd jmpq 401020 <.plt>
  4010cf:	90                   	nop
  4010d0:	f3 0f 1e fa          	endbr64 
  4010d4:	68 0a 00 00 00       	pushq  $0xa
  4010d9:	f2 e9 41 ff ff ff    	bnd jmpq 401020 <.plt>
  4010df:	90                   	nop
  4010e0:	f3 0f 1e fa          	endbr64 
  4010e4:	68 0b 00 00 00       	pushq  $0xb
  4010e9:	f2 e9 31 ff ff ff    	bnd jmpq 401020 <.plt>
  4010ef:	90                   	nop
  4010f0:	f3 0f 1e fa          	endbr64 
  4010f4:	68 0c 00 00 00       	pushq  $0xc
  4010f9:	f2 e9 21 ff ff ff    	bnd jmpq 401020 <.plt>
  4010ff:	90                   	nop
  401100:	f3 0f 1e fa          	endbr64 
  401104:	68 0d 00 00 00       	pushq  $0xd
  401109:	f2 e9 11 ff ff ff    	bnd jmpq 401020 <.plt>
  40110f:	90                   	nop
  401110:	f3 0f 1e fa          	endbr64 
  401114:	68 0e 00 00 00       	pushq  $0xe
  401119:	f2 e9 01 ff ff ff    	bnd jmpq 401020 <.plt>
  40111f:	90                   	nop
  401120:	f3 0f 1e fa          	endbr64 
  401124:	68 0f 00 00 00       	pushq  $0xf
  401129:	f2 e9 f1 fe ff ff    	bnd jmpq 401020 <.plt>
  40112f:	90                   	nop

Disassembly of section .plt.sec:

0000000000401130 <recv@plt>:
  401130:	f3 0f 1e fa          	endbr64 
  401134:	f2 ff 25 dd 2e 00 00 	bnd jmpq *0x2edd(%rip)        # 404018 <recv@GLIBC_2.2.5>
  40113b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000401140 <puts@plt>:
  401140:	f3 0f 1e fa          	endbr64 
  401144:	f2 ff 25 d5 2e 00 00 	bnd jmpq *0x2ed5(%rip)        # 404020 <puts@GLIBC_2.2.5>
  40114b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000401150 <inet_ntoa@plt>:
  401150:	f3 0f 1e fa          	endbr64 
  401154:	f2 ff 25 cd 2e 00 00 	bnd jmpq *0x2ecd(%rip)        # 404028 <inet_ntoa@GLIBC_2.2.5>
  40115b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000401160 <strlen@plt>:
  401160:	f3 0f 1e fa          	endbr64 
  401164:	f2 ff 25 c5 2e 00 00 	bnd jmpq *0x2ec5(%rip)        # 404030 <strlen@GLIBC_2.2.5>
  40116b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000401170 <htons@plt>:
  401170:	f3 0f 1e fa          	endbr64 
  401174:	f2 ff 25 bd 2e 00 00 	bnd jmpq *0x2ebd(%rip)        # 404038 <htons@GLIBC_2.2.5>
  40117b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000401180 <send@plt>:
  401180:	f3 0f 1e fa          	endbr64 
  401184:	f2 ff 25 b5 2e 00 00 	bnd jmpq *0x2eb5(%rip)        # 404040 <send@GLIBC_2.2.5>
  40118b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000401190 <printf@plt>:
  401190:	f3 0f 1e fa          	endbr64 
  401194:	f2 ff 25 ad 2e 00 00 	bnd jmpq *0x2ead(%rip)        # 404048 <printf@GLIBC_2.2.5>
  40119b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000004011a0 <memset@plt>:
  4011a0:	f3 0f 1e fa          	endbr64 
  4011a4:	f2 ff 25 a5 2e 00 00 	bnd jmpq *0x2ea5(%rip)        # 404050 <memset@GLIBC_2.2.5>
  4011ab:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000004011b0 <close@plt>:
  4011b0:	f3 0f 1e fa          	endbr64 
  4011b4:	f2 ff 25 9d 2e 00 00 	bnd jmpq *0x2e9d(%rip)        # 404058 <close@GLIBC_2.2.5>
  4011bb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000004011c0 <inet_addr@plt>:
  4011c0:	f3 0f 1e fa          	endbr64 
  4011c4:	f2 ff 25 95 2e 00 00 	bnd jmpq *0x2e95(%rip)        # 404060 <inet_addr@GLIBC_2.2.5>
  4011cb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000004011d0 <listen@plt>:
  4011d0:	f3 0f 1e fa          	endbr64 
  4011d4:	f2 ff 25 8d 2e 00 00 	bnd jmpq *0x2e8d(%rip)        # 404068 <listen@GLIBC_2.2.5>
  4011db:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000004011e0 <ntohs@plt>:
  4011e0:	f3 0f 1e fa          	endbr64 
  4011e4:	f2 ff 25 85 2e 00 00 	bnd jmpq *0x2e85(%rip)        # 404070 <ntohs@GLIBC_2.2.5>
  4011eb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000004011f0 <bind@plt>:
  4011f0:	f3 0f 1e fa          	endbr64 
  4011f4:	f2 ff 25 7d 2e 00 00 	bnd jmpq *0x2e7d(%rip)        # 404078 <bind@GLIBC_2.2.5>
  4011fb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000401200 <accept@plt>:
  401200:	f3 0f 1e fa          	endbr64 
  401204:	f2 ff 25 75 2e 00 00 	bnd jmpq *0x2e75(%rip)        # 404080 <accept@GLIBC_2.2.5>
  40120b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000401210 <fork@plt>:
  401210:	f3 0f 1e fa          	endbr64 
  401214:	f2 ff 25 6d 2e 00 00 	bnd jmpq *0x2e6d(%rip)        # 404088 <fork@GLIBC_2.2.5>
  40121b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000401220 <socket@plt>:
  401220:	f3 0f 1e fa          	endbr64 
  401224:	f2 ff 25 65 2e 00 00 	bnd jmpq *0x2e65(%rip)        # 404090 <socket@GLIBC_2.2.5>
  40122b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .text:

0000000000401230 <_start>:
  401230:	f3 0f 1e fa          	endbr64 
  401234:	31 ed                	xor    %ebp,%ebp
  401236:	49 89 d1             	mov    %rdx,%r9
  401239:	5e                   	pop    %rsi
  40123a:	48 89 e2             	mov    %rsp,%rdx
  40123d:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  401241:	50                   	push   %rax
  401242:	54                   	push   %rsp
  401243:	49 c7 c0 10 16 40 00 	mov    $0x401610,%r8
  40124a:	48 c7 c1 a0 15 40 00 	mov    $0x4015a0,%rcx
  401251:	48 c7 c7 ea 13 40 00 	mov    $0x4013ea,%rdi
  401258:	ff 15 92 2d 00 00    	callq  *0x2d92(%rip)        # 403ff0 <__libc_start_main@GLIBC_2.2.5>
  40125e:	f4                   	hlt    
  40125f:	90                   	nop

0000000000401260 <_dl_relocate_static_pie>:
  401260:	f3 0f 1e fa          	endbr64 
  401264:	c3                   	retq   
  401265:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40126c:	00 00 00 
  40126f:	90                   	nop

0000000000401270 <deregister_tm_clones>:
  401270:	b8 a8 40 40 00       	mov    $0x4040a8,%eax
  401275:	48 3d a8 40 40 00    	cmp    $0x4040a8,%rax
  40127b:	74 13                	je     401290 <deregister_tm_clones+0x20>
  40127d:	b8 00 00 00 00       	mov    $0x0,%eax
  401282:	48 85 c0             	test   %rax,%rax
  401285:	74 09                	je     401290 <deregister_tm_clones+0x20>
  401287:	bf a8 40 40 00       	mov    $0x4040a8,%edi
  40128c:	ff e0                	jmpq   *%rax
  40128e:	66 90                	xchg   %ax,%ax
  401290:	c3                   	retq   
  401291:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  401298:	00 00 00 00 
  40129c:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004012a0 <register_tm_clones>:
  4012a0:	be a8 40 40 00       	mov    $0x4040a8,%esi
  4012a5:	48 81 ee a8 40 40 00 	sub    $0x4040a8,%rsi
  4012ac:	48 89 f0             	mov    %rsi,%rax
  4012af:	48 c1 ee 3f          	shr    $0x3f,%rsi
  4012b3:	48 c1 f8 03          	sar    $0x3,%rax
  4012b7:	48 01 c6             	add    %rax,%rsi
  4012ba:	48 d1 fe             	sar    %rsi
  4012bd:	74 11                	je     4012d0 <register_tm_clones+0x30>
  4012bf:	b8 00 00 00 00       	mov    $0x0,%eax
  4012c4:	48 85 c0             	test   %rax,%rax
  4012c7:	74 07                	je     4012d0 <register_tm_clones+0x30>
  4012c9:	bf a8 40 40 00       	mov    $0x4040a8,%edi
  4012ce:	ff e0                	jmpq   *%rax
  4012d0:	c3                   	retq   
  4012d1:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4012d8:	00 00 00 00 
  4012dc:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004012e0 <__do_global_dtors_aux>:
  4012e0:	f3 0f 1e fa          	endbr64 
  4012e4:	80 3d bd 2d 00 00 00 	cmpb   $0x0,0x2dbd(%rip)        # 4040a8 <__TMC_END__>
  4012eb:	75 13                	jne    401300 <__do_global_dtors_aux+0x20>
  4012ed:	55                   	push   %rbp
  4012ee:	48 89 e5             	mov    %rsp,%rbp
  4012f1:	e8 7a ff ff ff       	callq  401270 <deregister_tm_clones>
  4012f6:	c6 05 ab 2d 00 00 01 	movb   $0x1,0x2dab(%rip)        # 4040a8 <__TMC_END__>
  4012fd:	5d                   	pop    %rbp
  4012fe:	c3                   	retq   
  4012ff:	90                   	nop
  401300:	c3                   	retq   
  401301:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  401308:	00 00 00 00 
  40130c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000401310 <frame_dummy>:
  401310:	f3 0f 1e fa          	endbr64 
  401314:	eb 8a                	jmp    4012a0 <register_tm_clones>

0000000000401316 <pwned>:
  401316:	f3 0f 1e fa          	endbr64 
  40131a:	48 83 ec 58          	sub    $0x58,%rsp
  40131e:	89 7c 24 0c          	mov    %edi,0xc(%rsp)
  401322:	48 8d 44 24 10       	lea    0x10(%rsp),%rax
  401327:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  40132e:	48 c7 40 08 00 00 00 	movq   $0x0,0x8(%rax)
  401335:	00 
  401336:	48 c7 40 10 00 00 00 	movq   $0x0,0x10(%rax)
  40133d:	00 
  40133e:	48 c7 40 18 00 00 00 	movq   $0x0,0x18(%rax)
  401345:	00 
  401346:	48 c7 40 20 00 00 00 	movq   $0x0,0x20(%rax)
  40134d:	00 
  40134e:	48 c7 40 28 00 00 00 	movq   $0x0,0x28(%rax)
  401355:	00 
  401356:	48 c7 40 30 00 00 00 	movq   $0x0,0x30(%rax)
  40135d:	00 
  40135e:	48 c7 40 38 00 00 00 	movq   $0x0,0x38(%rax)
  401365:	00 
  401366:	48 8d 74 24 10       	lea    0x10(%rsp),%rsi
  40136b:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  40136f:	b9 00 00 00 00       	mov    $0x0,%ecx
  401374:	ba 00 04 00 00       	mov    $0x400,%edx
  401379:	89 c7                	mov    %eax,%edi
  40137b:	e8 b0 fd ff ff       	callq  401130 <recv@plt>
  401380:	48 8d 44 24 10       	lea    0x10(%rsp),%rax
  401385:	0f b6 00             	movzbl (%rax),%eax
  401388:	84 c0                	test   %al,%al
  40138a:	74 3e                	je     4013ca <pwned+0xb4>
  40138c:	48 8d 44 24 10       	lea    0x10(%rsp),%rax
  401391:	48 89 c6             	mov    %rax,%rsi
  401394:	48 8d 3d 6d 0c 00 00 	lea    0xc6d(%rip),%rdi        # 402008 <_IO_stdin_used+0x8>
  40139b:	b8 00 00 00 00       	mov    $0x0,%eax
  4013a0:	e8 eb fd ff ff       	callq  401190 <printf@plt>
  4013a5:	48 8d 44 24 10       	lea    0x10(%rsp),%rax
  4013aa:	48 89 c7             	mov    %rax,%rdi
  4013ad:	e8 ae fd ff ff       	callq  401160 <strlen@plt>
  4013b2:	48 89 c2             	mov    %rax,%rdx
  4013b5:	48 8d 74 24 10       	lea    0x10(%rsp),%rsi
  4013ba:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  4013be:	b9 00 00 00 00       	mov    $0x0,%ecx
  4013c3:	89 c7                	mov    %eax,%edi
  4013c5:	e8 b6 fd ff ff       	callq  401180 <send@plt>
  4013ca:	90                   	nop
  4013cb:	48 83 c4 58          	add    $0x58,%rsp
  4013cf:	c3                   	retq   

00000000004013d0 <win>:
  4013d0:	f3 0f 1e fa          	endbr64 
  4013d4:	48 83 ec 08          	sub    $0x8,%rsp
  4013d8:	48 8d 3d 3b 0c 00 00 	lea    0xc3b(%rip),%rdi        # 40201a <_IO_stdin_used+0x1a>
  4013df:	e8 5c fd ff ff       	callq  401140 <puts@plt>
  4013e4:	90                   	nop
  4013e5:	48 83 c4 08          	add    $0x8,%rsp
  4013e9:	c3                   	retq   

00000000004013ea <main>:
  4013ea:	f3 0f 1e fa          	endbr64 
  4013ee:	53                   	push   %rbx
  4013ef:	48 81 ec 40 04 00 00 	sub    $0x440,%rsp
  4013f6:	ba 00 00 00 00       	mov    $0x0,%edx
  4013fb:	be 01 00 00 00       	mov    $0x1,%esi
  401400:	bf 02 00 00 00       	mov    $0x2,%edi
  401405:	e8 16 fe ff ff       	callq  401220 <socket@plt>
  40140a:	89 84 24 3c 04 00 00 	mov    %eax,0x43c(%rsp)
  401411:	48 8d 84 24 20 04 00 	lea    0x420(%rsp),%rax
  401418:	00 
  401419:	ba 10 00 00 00       	mov    $0x10,%edx
  40141e:	be 00 00 00 00       	mov    $0x0,%esi
  401423:	48 89 c7             	mov    %rax,%rdi
  401426:	e8 75 fd ff ff       	callq  4011a0 <memset@plt>
  40142b:	66 c7 84 24 20 04 00 	movw   $0x2,0x420(%rsp)
  401432:	00 02 00 
  401435:	bf cf 56 00 00       	mov    $0x56cf,%edi
  40143a:	e8 31 fd ff ff       	callq  401170 <htons@plt>
  40143f:	66 89 84 24 22 04 00 	mov    %ax,0x422(%rsp)
  401446:	00 
  401447:	48 8d 3d e4 0b 00 00 	lea    0xbe4(%rip),%rdi        # 402032 <_IO_stdin_used+0x32>
  40144e:	e8 6d fd ff ff       	callq  4011c0 <inet_addr@plt>
  401453:	89 84 24 24 04 00 00 	mov    %eax,0x424(%rsp)
  40145a:	48 8d 8c 24 20 04 00 	lea    0x420(%rsp),%rcx
  401461:	00 
  401462:	8b 84 24 3c 04 00 00 	mov    0x43c(%rsp),%eax
  401469:	ba 10 00 00 00       	mov    $0x10,%edx
  40146e:	48 89 ce             	mov    %rcx,%rsi
  401471:	89 c7                	mov    %eax,%edi
  401473:	e8 78 fd ff ff       	callq  4011f0 <bind@plt>
  401478:	89 84 24 38 04 00 00 	mov    %eax,0x438(%rsp)
  40147f:	8b 84 24 3c 04 00 00 	mov    0x43c(%rsp),%eax
  401486:	be 0a 00 00 00       	mov    $0xa,%esi
  40148b:	89 c7                	mov    %eax,%edi
  40148d:	e8 3e fd ff ff       	callq  4011d0 <listen@plt>
  401492:	85 c0                	test   %eax,%eax
  401494:	75 0e                	jne    4014a4 <main+0xba>
  401496:	48 8d 3d 9f 0b 00 00 	lea    0xb9f(%rip),%rdi        # 40203c <_IO_stdin_used+0x3c>
  40149d:	e8 9e fc ff ff       	callq  401140 <puts@plt>
  4014a2:	eb 0c                	jmp    4014b0 <main+0xc6>
  4014a4:	48 8d 3d a3 0b 00 00 	lea    0xba3(%rip),%rdi        # 40204e <_IO_stdin_used+0x4e>
  4014ab:	e8 90 fc ff ff       	callq  401140 <puts@plt>
  4014b0:	48 8d 94 24 0c 04 00 	lea    0x40c(%rsp),%rdx
  4014b7:	00 
  4014b8:	48 8d 8c 24 10 04 00 	lea    0x410(%rsp),%rcx
  4014bf:	00 
  4014c0:	8b 84 24 3c 04 00 00 	mov    0x43c(%rsp),%eax
  4014c7:	48 89 ce             	mov    %rcx,%rsi
  4014ca:	89 c7                	mov    %eax,%edi
  4014cc:	e8 2f fd ff ff       	callq  401200 <accept@plt>
  4014d1:	89 84 24 34 04 00 00 	mov    %eax,0x434(%rsp)
  4014d8:	0f b7 84 24 12 04 00 	movzwl 0x412(%rsp),%eax
  4014df:	00 
  4014e0:	0f b7 c0             	movzwl %ax,%eax
  4014e3:	89 c7                	mov    %eax,%edi
  4014e5:	e8 f6 fc ff ff       	callq  4011e0 <ntohs@plt>
  4014ea:	0f b7 d8             	movzwl %ax,%ebx
  4014ed:	8b 84 24 14 04 00 00 	mov    0x414(%rsp),%eax
  4014f4:	89 c7                	mov    %eax,%edi
  4014f6:	e8 55 fc ff ff       	callq  401150 <inet_ntoa@plt>
  4014fb:	89 da                	mov    %ebx,%edx
  4014fd:	48 89 c6             	mov    %rax,%rsi
  401500:	48 8d 3d 61 0b 00 00 	lea    0xb61(%rip),%rdi        # 402068 <_IO_stdin_used+0x68>
  401507:	b8 00 00 00 00       	mov    $0x0,%eax
  40150c:	e8 7f fc ff ff       	callq  401190 <printf@plt>
  401511:	e8 fa fc ff ff       	callq  401210 <fork@plt>
  401516:	89 84 24 30 04 00 00 	mov    %eax,0x430(%rsp)
  40151d:	83 bc 24 30 04 00 00 	cmpl   $0x0,0x430(%rsp)
  401524:	00 
  401525:	75 49                	jne    401570 <main+0x186>
  401527:	8b 84 24 3c 04 00 00 	mov    0x43c(%rsp),%eax
  40152e:	89 c7                	mov    %eax,%edi
  401530:	e8 7b fc ff ff       	callq  4011b0 <close@plt>
  401535:	8b 84 24 34 04 00 00 	mov    0x434(%rsp),%eax
  40153c:	89 c7                	mov    %eax,%edi
  40153e:	e8 d3 fd ff ff       	callq  401316 <pwned>
  401543:	8b 84 24 34 04 00 00 	mov    0x434(%rsp),%eax
  40154a:	b9 00 00 00 00       	mov    $0x0,%ecx
  40154f:	ba 03 00 00 00       	mov    $0x3,%edx
  401554:	48 8d 35 2c 0b 00 00 	lea    0xb2c(%rip),%rsi        # 402087 <_IO_stdin_used+0x87>
  40155b:	89 c7                	mov    %eax,%edi
  40155d:	e8 1e fc ff ff       	callq  401180 <send@plt>
  401562:	48 8d 3d 22 0b 00 00 	lea    0xb22(%rip),%rdi        # 40208b <_IO_stdin_used+0x8b>
  401569:	e8 d2 fb ff ff       	callq  401140 <puts@plt>
  40156e:	eb 13                	jmp    401583 <main+0x199>
  401570:	8b 84 24 34 04 00 00 	mov    0x434(%rsp),%eax
  401577:	89 c7                	mov    %eax,%edi
  401579:	e8 32 fc ff ff       	callq  4011b0 <close@plt>
  40157e:	e9 2d ff ff ff       	jmpq   4014b0 <main+0xc6>
  401583:	b8 00 00 00 00       	mov    $0x0,%eax
  401588:	48 81 c4 40 04 00 00 	add    $0x440,%rsp
  40158f:	5b                   	pop    %rbx
  401590:	c3                   	retq   
  401591:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  401598:	00 00 00 
  40159b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000004015a0 <__libc_csu_init>:
  4015a0:	f3 0f 1e fa          	endbr64 
  4015a4:	41 57                	push   %r15
  4015a6:	4c 8d 3d 63 28 00 00 	lea    0x2863(%rip),%r15        # 403e10 <__frame_dummy_init_array_entry>
  4015ad:	41 56                	push   %r14
  4015af:	49 89 d6             	mov    %rdx,%r14
  4015b2:	41 55                	push   %r13
  4015b4:	49 89 f5             	mov    %rsi,%r13
  4015b7:	41 54                	push   %r12
  4015b9:	41 89 fc             	mov    %edi,%r12d
  4015bc:	55                   	push   %rbp
  4015bd:	48 8d 2d 54 28 00 00 	lea    0x2854(%rip),%rbp        # 403e18 <__do_global_dtors_aux_fini_array_entry>
  4015c4:	53                   	push   %rbx
  4015c5:	4c 29 fd             	sub    %r15,%rbp
  4015c8:	48 83 ec 08          	sub    $0x8,%rsp
  4015cc:	e8 2f fa ff ff       	callq  401000 <_init>
  4015d1:	48 c1 fd 03          	sar    $0x3,%rbp
  4015d5:	74 1f                	je     4015f6 <__libc_csu_init+0x56>
  4015d7:	31 db                	xor    %ebx,%ebx
  4015d9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  4015e0:	4c 89 f2             	mov    %r14,%rdx
  4015e3:	4c 89 ee             	mov    %r13,%rsi
  4015e6:	44 89 e7             	mov    %r12d,%edi
  4015e9:	41 ff 14 df          	callq  *(%r15,%rbx,8)
  4015ed:	48 83 c3 01          	add    $0x1,%rbx
  4015f1:	48 39 dd             	cmp    %rbx,%rbp
  4015f4:	75 ea                	jne    4015e0 <__libc_csu_init+0x40>
  4015f6:	48 83 c4 08          	add    $0x8,%rsp
  4015fa:	5b                   	pop    %rbx
  4015fb:	5d                   	pop    %rbp
  4015fc:	41 5c                	pop    %r12
  4015fe:	41 5d                	pop    %r13
  401600:	41 5e                	pop    %r14
  401602:	41 5f                	pop    %r15
  401604:	c3                   	retq   
  401605:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40160c:	00 00 00 00 

0000000000401610 <__libc_csu_fini>:
  401610:	f3 0f 1e fa          	endbr64 
  401614:	c3                   	retq   

Disassembly of section .fini:

0000000000401618 <_fini>:
  401618:	f3 0f 1e fa          	endbr64 
  40161c:	48 83 ec 08          	sub    $0x8,%rsp
  401620:	48 83 c4 08          	add    $0x8,%rsp
  401624:	c3                   	retq   
