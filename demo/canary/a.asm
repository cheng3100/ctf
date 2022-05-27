
a.out:     file format elf64-x86-64


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
  401130:	f3 0f 1e fa          	endbr64 
  401134:	68 10 00 00 00       	pushq  $0x10
  401139:	f2 e9 e1 fe ff ff    	bnd jmpq 401020 <.plt>
  40113f:	90                   	nop

Disassembly of section .plt.sec:

0000000000401140 <recv@plt>:
  401140:	f3 0f 1e fa          	endbr64 
  401144:	f2 ff 25 cd 2e 00 00 	bnd jmpq *0x2ecd(%rip)        # 404018 <recv@GLIBC_2.2.5>
  40114b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000401150 <puts@plt>:
  401150:	f3 0f 1e fa          	endbr64 
  401154:	f2 ff 25 c5 2e 00 00 	bnd jmpq *0x2ec5(%rip)        # 404020 <puts@GLIBC_2.2.5>
  40115b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000401160 <inet_ntoa@plt>:
  401160:	f3 0f 1e fa          	endbr64 
  401164:	f2 ff 25 bd 2e 00 00 	bnd jmpq *0x2ebd(%rip)        # 404028 <inet_ntoa@GLIBC_2.2.5>
  40116b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000401170 <strlen@plt>:
  401170:	f3 0f 1e fa          	endbr64 
  401174:	f2 ff 25 b5 2e 00 00 	bnd jmpq *0x2eb5(%rip)        # 404030 <strlen@GLIBC_2.2.5>
  40117b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000401180 <__stack_chk_fail@plt>:
  401180:	f3 0f 1e fa          	endbr64 
  401184:	f2 ff 25 ad 2e 00 00 	bnd jmpq *0x2ead(%rip)        # 404038 <__stack_chk_fail@GLIBC_2.4>
  40118b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000401190 <htons@plt>:
  401190:	f3 0f 1e fa          	endbr64 
  401194:	f2 ff 25 a5 2e 00 00 	bnd jmpq *0x2ea5(%rip)        # 404040 <htons@GLIBC_2.2.5>
  40119b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000004011a0 <send@plt>:
  4011a0:	f3 0f 1e fa          	endbr64 
  4011a4:	f2 ff 25 9d 2e 00 00 	bnd jmpq *0x2e9d(%rip)        # 404048 <send@GLIBC_2.2.5>
  4011ab:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000004011b0 <printf@plt>:
  4011b0:	f3 0f 1e fa          	endbr64 
  4011b4:	f2 ff 25 95 2e 00 00 	bnd jmpq *0x2e95(%rip)        # 404050 <printf@GLIBC_2.2.5>
  4011bb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000004011c0 <memset@plt>:
  4011c0:	f3 0f 1e fa          	endbr64 
  4011c4:	f2 ff 25 8d 2e 00 00 	bnd jmpq *0x2e8d(%rip)        # 404058 <memset@GLIBC_2.2.5>
  4011cb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000004011d0 <close@plt>:
  4011d0:	f3 0f 1e fa          	endbr64 
  4011d4:	f2 ff 25 85 2e 00 00 	bnd jmpq *0x2e85(%rip)        # 404060 <close@GLIBC_2.2.5>
  4011db:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000004011e0 <inet_addr@plt>:
  4011e0:	f3 0f 1e fa          	endbr64 
  4011e4:	f2 ff 25 7d 2e 00 00 	bnd jmpq *0x2e7d(%rip)        # 404068 <inet_addr@GLIBC_2.2.5>
  4011eb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000004011f0 <listen@plt>:
  4011f0:	f3 0f 1e fa          	endbr64 
  4011f4:	f2 ff 25 75 2e 00 00 	bnd jmpq *0x2e75(%rip)        # 404070 <listen@GLIBC_2.2.5>
  4011fb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000401200 <ntohs@plt>:
  401200:	f3 0f 1e fa          	endbr64 
  401204:	f2 ff 25 6d 2e 00 00 	bnd jmpq *0x2e6d(%rip)        # 404078 <ntohs@GLIBC_2.2.5>
  40120b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000401210 <bind@plt>:
  401210:	f3 0f 1e fa          	endbr64 
  401214:	f2 ff 25 65 2e 00 00 	bnd jmpq *0x2e65(%rip)        # 404080 <bind@GLIBC_2.2.5>
  40121b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000401220 <accept@plt>:
  401220:	f3 0f 1e fa          	endbr64 
  401224:	f2 ff 25 5d 2e 00 00 	bnd jmpq *0x2e5d(%rip)        # 404088 <accept@GLIBC_2.2.5>
  40122b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000401230 <fork@plt>:
  401230:	f3 0f 1e fa          	endbr64 
  401234:	f2 ff 25 55 2e 00 00 	bnd jmpq *0x2e55(%rip)        # 404090 <fork@GLIBC_2.2.5>
  40123b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000401240 <socket@plt>:
  401240:	f3 0f 1e fa          	endbr64 
  401244:	f2 ff 25 4d 2e 00 00 	bnd jmpq *0x2e4d(%rip)        # 404098 <socket@GLIBC_2.2.5>
  40124b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .text:

0000000000401250 <_start>:
  401250:	f3 0f 1e fa          	endbr64 
  401254:	31 ed                	xor    %ebp,%ebp
  401256:	49 89 d1             	mov    %rdx,%r9
  401259:	5e                   	pop    %rsi
  40125a:	48 89 e2             	mov    %rsp,%rdx
  40125d:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  401261:	50                   	push   %rax
  401262:	54                   	push   %rsp
  401263:	49 c7 c0 40 16 40 00 	mov    $0x401640,%r8
  40126a:	48 c7 c1 d0 15 40 00 	mov    $0x4015d0,%rcx
  401271:	48 c7 c7 2f 14 40 00 	mov    $0x40142f,%rdi
  401278:	ff 15 72 2d 00 00    	callq  *0x2d72(%rip)        # 403ff0 <__libc_start_main@GLIBC_2.2.5>
  40127e:	f4                   	hlt    
  40127f:	90                   	nop

0000000000401280 <_dl_relocate_static_pie>:
  401280:	f3 0f 1e fa          	endbr64 
  401284:	c3                   	retq   
  401285:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40128c:	00 00 00 
  40128f:	90                   	nop

0000000000401290 <deregister_tm_clones>:
  401290:	b8 b0 40 40 00       	mov    $0x4040b0,%eax
  401295:	48 3d b0 40 40 00    	cmp    $0x4040b0,%rax
  40129b:	74 13                	je     4012b0 <deregister_tm_clones+0x20>
  40129d:	b8 00 00 00 00       	mov    $0x0,%eax
  4012a2:	48 85 c0             	test   %rax,%rax
  4012a5:	74 09                	je     4012b0 <deregister_tm_clones+0x20>
  4012a7:	bf b0 40 40 00       	mov    $0x4040b0,%edi
  4012ac:	ff e0                	jmpq   *%rax
  4012ae:	66 90                	xchg   %ax,%ax
  4012b0:	c3                   	retq   
  4012b1:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4012b8:	00 00 00 00 
  4012bc:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004012c0 <register_tm_clones>:
  4012c0:	be b0 40 40 00       	mov    $0x4040b0,%esi
  4012c5:	48 81 ee b0 40 40 00 	sub    $0x4040b0,%rsi
  4012cc:	48 89 f0             	mov    %rsi,%rax
  4012cf:	48 c1 ee 3f          	shr    $0x3f,%rsi
  4012d3:	48 c1 f8 03          	sar    $0x3,%rax
  4012d7:	48 01 c6             	add    %rax,%rsi
  4012da:	48 d1 fe             	sar    %rsi
  4012dd:	74 11                	je     4012f0 <register_tm_clones+0x30>
  4012df:	b8 00 00 00 00       	mov    $0x0,%eax
  4012e4:	48 85 c0             	test   %rax,%rax
  4012e7:	74 07                	je     4012f0 <register_tm_clones+0x30>
  4012e9:	bf b0 40 40 00       	mov    $0x4040b0,%edi
  4012ee:	ff e0                	jmpq   *%rax
  4012f0:	c3                   	retq   
  4012f1:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4012f8:	00 00 00 00 
  4012fc:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000401300 <__do_global_dtors_aux>:
  401300:	f3 0f 1e fa          	endbr64 
  401304:	80 3d a5 2d 00 00 00 	cmpb   $0x0,0x2da5(%rip)        # 4040b0 <__TMC_END__>
  40130b:	75 13                	jne    401320 <__do_global_dtors_aux+0x20>
  40130d:	55                   	push   %rbp
  40130e:	48 89 e5             	mov    %rsp,%rbp
  401311:	e8 7a ff ff ff       	callq  401290 <deregister_tm_clones>
  401316:	c6 05 93 2d 00 00 01 	movb   $0x1,0x2d93(%rip)        # 4040b0 <__TMC_END__>
  40131d:	5d                   	pop    %rbp
  40131e:	c3                   	retq   
  40131f:	90                   	nop
  401320:	c3                   	retq   
  401321:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  401328:	00 00 00 00 
  40132c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000401330 <frame_dummy>:
  401330:	f3 0f 1e fa          	endbr64 
  401334:	eb 8a                	jmp    4012c0 <register_tm_clones>

0000000000401336 <pwned>:
  401336:	f3 0f 1e fa          	endbr64 
  40133a:	48 83 ec 68          	sub    $0x68,%rsp
  40133e:	89 7c 24 0c          	mov    %edi,0xc(%rsp)
  401342:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  401349:	00 00 
  40134b:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
  401350:	31 c0                	xor    %eax,%eax
  401352:	48 8d 44 24 10       	lea    0x10(%rsp),%rax
  401357:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  40135e:	48 c7 40 08 00 00 00 	movq   $0x0,0x8(%rax)
  401365:	00 
  401366:	48 c7 40 10 00 00 00 	movq   $0x0,0x10(%rax)
  40136d:	00 
  40136e:	48 c7 40 18 00 00 00 	movq   $0x0,0x18(%rax)
  401375:	00 
  401376:	48 c7 40 20 00 00 00 	movq   $0x0,0x20(%rax)
  40137d:	00 
  40137e:	48 c7 40 28 00 00 00 	movq   $0x0,0x28(%rax)
  401385:	00 
  401386:	48 c7 40 30 00 00 00 	movq   $0x0,0x30(%rax)
  40138d:	00 
  40138e:	48 c7 40 38 00 00 00 	movq   $0x0,0x38(%rax)
  401395:	00 
  401396:	48 8d 74 24 10       	lea    0x10(%rsp),%rsi
  40139b:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  40139f:	b9 00 00 00 00       	mov    $0x0,%ecx
  4013a4:	ba 00 04 00 00       	mov    $0x400,%edx
  4013a9:	89 c7                	mov    %eax,%edi
  4013ab:	e8 90 fd ff ff       	callq  401140 <recv@plt>
  4013b0:	48 8d 44 24 10       	lea    0x10(%rsp),%rax
  4013b5:	0f b6 00             	movzbl (%rax),%eax
  4013b8:	84 c0                	test   %al,%al
  4013ba:	74 3e                	je     4013fa <pwned+0xc4>
  4013bc:	48 8d 44 24 10       	lea    0x10(%rsp),%rax
  4013c1:	48 89 c6             	mov    %rax,%rsi
  4013c4:	48 8d 3d 3d 0c 00 00 	lea    0xc3d(%rip),%rdi        # 402008 <_IO_stdin_used+0x8>
  4013cb:	b8 00 00 00 00       	mov    $0x0,%eax
  4013d0:	e8 db fd ff ff       	callq  4011b0 <printf@plt>
  4013d5:	48 8d 44 24 10       	lea    0x10(%rsp),%rax
  4013da:	48 89 c7             	mov    %rax,%rdi
  4013dd:	e8 8e fd ff ff       	callq  401170 <strlen@plt>
  4013e2:	48 89 c2             	mov    %rax,%rdx
  4013e5:	48 8d 74 24 10       	lea    0x10(%rsp),%rsi
  4013ea:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  4013ee:	b9 00 00 00 00       	mov    $0x0,%ecx
  4013f3:	89 c7                	mov    %eax,%edi
  4013f5:	e8 a6 fd ff ff       	callq  4011a0 <send@plt>
  4013fa:	90                   	nop
  4013fb:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
  401400:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  401407:	00 00 
  401409:	74 05                	je     401410 <pwned+0xda>
  40140b:	e8 70 fd ff ff       	callq  401180 <__stack_chk_fail@plt>
  401410:	48 83 c4 68          	add    $0x68,%rsp
  401414:	c3                   	retq   

0000000000401415 <win>:
  401415:	f3 0f 1e fa          	endbr64 
  401419:	48 83 ec 08          	sub    $0x8,%rsp
  40141d:	48 8d 3d f6 0b 00 00 	lea    0xbf6(%rip),%rdi        # 40201a <_IO_stdin_used+0x1a>
  401424:	e8 27 fd ff ff       	callq  401150 <puts@plt>
  401429:	90                   	nop
  40142a:	48 83 c4 08          	add    $0x8,%rsp
  40142e:	c3                   	retq   

000000000040142f <main>:
  40142f:	f3 0f 1e fa          	endbr64 
  401433:	53                   	push   %rbx
  401434:	48 81 ec 50 04 00 00 	sub    $0x450,%rsp
  40143b:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  401442:	00 00 
  401444:	48 89 84 24 48 04 00 	mov    %rax,0x448(%rsp)
  40144b:	00 
  40144c:	31 c0                	xor    %eax,%eax
  40144e:	ba 00 00 00 00       	mov    $0x0,%edx
  401453:	be 01 00 00 00       	mov    $0x1,%esi
  401458:	bf 02 00 00 00       	mov    $0x2,%edi
  40145d:	e8 de fd ff ff       	callq  401240 <socket@plt>
  401462:	89 44 24 10          	mov    %eax,0x10(%rsp)
  401466:	48 8d 44 24 20       	lea    0x20(%rsp),%rax
  40146b:	ba 10 00 00 00       	mov    $0x10,%edx
  401470:	be 00 00 00 00       	mov    $0x0,%esi
  401475:	48 89 c7             	mov    %rax,%rdi
  401478:	e8 43 fd ff ff       	callq  4011c0 <memset@plt>
  40147d:	66 c7 44 24 20 02 00 	movw   $0x2,0x20(%rsp)
  401484:	bf cf 56 00 00       	mov    $0x56cf,%edi
  401489:	e8 02 fd ff ff       	callq  401190 <htons@plt>
  40148e:	66 89 44 24 22       	mov    %ax,0x22(%rsp)
  401493:	48 8d 3d 98 0b 00 00 	lea    0xb98(%rip),%rdi        # 402032 <_IO_stdin_used+0x32>
  40149a:	e8 41 fd ff ff       	callq  4011e0 <inet_addr@plt>
  40149f:	89 44 24 24          	mov    %eax,0x24(%rsp)
  4014a3:	48 8d 4c 24 20       	lea    0x20(%rsp),%rcx
  4014a8:	8b 44 24 10          	mov    0x10(%rsp),%eax
  4014ac:	ba 10 00 00 00       	mov    $0x10,%edx
  4014b1:	48 89 ce             	mov    %rcx,%rsi
  4014b4:	89 c7                	mov    %eax,%edi
  4014b6:	e8 55 fd ff ff       	callq  401210 <bind@plt>
  4014bb:	89 44 24 14          	mov    %eax,0x14(%rsp)
  4014bf:	8b 44 24 10          	mov    0x10(%rsp),%eax
  4014c3:	be 0a 00 00 00       	mov    $0xa,%esi
  4014c8:	89 c7                	mov    %eax,%edi
  4014ca:	e8 21 fd ff ff       	callq  4011f0 <listen@plt>
  4014cf:	85 c0                	test   %eax,%eax
  4014d1:	75 0e                	jne    4014e1 <main+0xb2>
  4014d3:	48 8d 3d 62 0b 00 00 	lea    0xb62(%rip),%rdi        # 40203c <_IO_stdin_used+0x3c>
  4014da:	e8 71 fc ff ff       	callq  401150 <puts@plt>
  4014df:	eb 0c                	jmp    4014ed <main+0xbe>
  4014e1:	48 8d 3d 66 0b 00 00 	lea    0xb66(%rip),%rdi        # 40204e <_IO_stdin_used+0x4e>
  4014e8:	e8 63 fc ff ff       	callq  401150 <puts@plt>
  4014ed:	48 8d 54 24 0c       	lea    0xc(%rsp),%rdx
  4014f2:	48 8d 4c 24 30       	lea    0x30(%rsp),%rcx
  4014f7:	8b 44 24 10          	mov    0x10(%rsp),%eax
  4014fb:	48 89 ce             	mov    %rcx,%rsi
  4014fe:	89 c7                	mov    %eax,%edi
  401500:	e8 1b fd ff ff       	callq  401220 <accept@plt>
  401505:	89 44 24 18          	mov    %eax,0x18(%rsp)
  401509:	0f b7 44 24 32       	movzwl 0x32(%rsp),%eax
  40150e:	0f b7 c0             	movzwl %ax,%eax
  401511:	89 c7                	mov    %eax,%edi
  401513:	e8 e8 fc ff ff       	callq  401200 <ntohs@plt>
  401518:	0f b7 d8             	movzwl %ax,%ebx
  40151b:	8b 44 24 34          	mov    0x34(%rsp),%eax
  40151f:	89 c7                	mov    %eax,%edi
  401521:	e8 3a fc ff ff       	callq  401160 <inet_ntoa@plt>
  401526:	89 da                	mov    %ebx,%edx
  401528:	48 89 c6             	mov    %rax,%rsi
  40152b:	48 8d 3d 36 0b 00 00 	lea    0xb36(%rip),%rdi        # 402068 <_IO_stdin_used+0x68>
  401532:	b8 00 00 00 00       	mov    $0x0,%eax
  401537:	e8 74 fc ff ff       	callq  4011b0 <printf@plt>
  40153c:	e8 ef fc ff ff       	callq  401230 <fork@plt>
  401541:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
  401545:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%rsp)
  40154a:	75 59                	jne    4015a5 <main+0x176>
  40154c:	8b 44 24 10          	mov    0x10(%rsp),%eax
  401550:	89 c7                	mov    %eax,%edi
  401552:	e8 79 fc ff ff       	callq  4011d0 <close@plt>
  401557:	8b 44 24 18          	mov    0x18(%rsp),%eax
  40155b:	89 c7                	mov    %eax,%edi
  40155d:	e8 d4 fd ff ff       	callq  401336 <pwned>
  401562:	8b 44 24 18          	mov    0x18(%rsp),%eax
  401566:	b9 00 00 00 00       	mov    $0x0,%ecx
  40156b:	ba 03 00 00 00       	mov    $0x3,%edx
  401570:	48 8d 35 10 0b 00 00 	lea    0xb10(%rip),%rsi        # 402087 <_IO_stdin_used+0x87>
  401577:	89 c7                	mov    %eax,%edi
  401579:	e8 22 fc ff ff       	callq  4011a0 <send@plt>
  40157e:	48 8d 3d 06 0b 00 00 	lea    0xb06(%rip),%rdi        # 40208b <_IO_stdin_used+0x8b>
  401585:	e8 c6 fb ff ff       	callq  401150 <puts@plt>
  40158a:	90                   	nop
  40158b:	b8 00 00 00 00       	mov    $0x0,%eax
  401590:	48 8b 9c 24 48 04 00 	mov    0x448(%rsp),%rbx
  401597:	00 
  401598:	64 48 33 1c 25 28 00 	xor    %fs:0x28,%rbx
  40159f:	00 00 
  4015a1:	74 17                	je     4015ba <main+0x18b>
  4015a3:	eb 10                	jmp    4015b5 <main+0x186>
  4015a5:	8b 44 24 18          	mov    0x18(%rsp),%eax
  4015a9:	89 c7                	mov    %eax,%edi
  4015ab:	e8 20 fc ff ff       	callq  4011d0 <close@plt>
  4015b0:	e9 38 ff ff ff       	jmpq   4014ed <main+0xbe>
  4015b5:	e8 c6 fb ff ff       	callq  401180 <__stack_chk_fail@plt>
  4015ba:	48 81 c4 50 04 00 00 	add    $0x450,%rsp
  4015c1:	5b                   	pop    %rbx
  4015c2:	c3                   	retq   
  4015c3:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  4015ca:	00 00 00 
  4015cd:	0f 1f 00             	nopl   (%rax)

00000000004015d0 <__libc_csu_init>:
  4015d0:	f3 0f 1e fa          	endbr64 
  4015d4:	41 57                	push   %r15
  4015d6:	4c 8d 3d 33 28 00 00 	lea    0x2833(%rip),%r15        # 403e10 <__frame_dummy_init_array_entry>
  4015dd:	41 56                	push   %r14
  4015df:	49 89 d6             	mov    %rdx,%r14
  4015e2:	41 55                	push   %r13
  4015e4:	49 89 f5             	mov    %rsi,%r13
  4015e7:	41 54                	push   %r12
  4015e9:	41 89 fc             	mov    %edi,%r12d
  4015ec:	55                   	push   %rbp
  4015ed:	48 8d 2d 24 28 00 00 	lea    0x2824(%rip),%rbp        # 403e18 <__do_global_dtors_aux_fini_array_entry>
  4015f4:	53                   	push   %rbx
  4015f5:	4c 29 fd             	sub    %r15,%rbp
  4015f8:	48 83 ec 08          	sub    $0x8,%rsp
  4015fc:	e8 ff f9 ff ff       	callq  401000 <_init>
  401601:	48 c1 fd 03          	sar    $0x3,%rbp
  401605:	74 1f                	je     401626 <__libc_csu_init+0x56>
  401607:	31 db                	xor    %ebx,%ebx
  401609:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  401610:	4c 89 f2             	mov    %r14,%rdx
  401613:	4c 89 ee             	mov    %r13,%rsi
  401616:	44 89 e7             	mov    %r12d,%edi
  401619:	41 ff 14 df          	callq  *(%r15,%rbx,8)
  40161d:	48 83 c3 01          	add    $0x1,%rbx
  401621:	48 39 dd             	cmp    %rbx,%rbp
  401624:	75 ea                	jne    401610 <__libc_csu_init+0x40>
  401626:	48 83 c4 08          	add    $0x8,%rsp
  40162a:	5b                   	pop    %rbx
  40162b:	5d                   	pop    %rbp
  40162c:	41 5c                	pop    %r12
  40162e:	41 5d                	pop    %r13
  401630:	41 5e                	pop    %r14
  401632:	41 5f                	pop    %r15
  401634:	c3                   	retq   
  401635:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40163c:	00 00 00 00 

0000000000401640 <__libc_csu_fini>:
  401640:	f3 0f 1e fa          	endbr64 
  401644:	c3                   	retq   

Disassembly of section .fini:

0000000000401648 <_fini>:
  401648:	f3 0f 1e fa          	endbr64 
  40164c:	48 83 ec 08          	sub    $0x8,%rsp
  401650:	48 83 c4 08          	add    $0x8,%rsp
  401654:	c3                   	retq   
