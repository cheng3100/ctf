
target:     file format elf32-i386


Disassembly of section .init:

08049000 <_init>:
 8049000:	f3 0f 1e fb          	endbr32 
 8049004:	53                   	push   %ebx
 8049005:	83 ec 08             	sub    $0x8,%esp
 8049008:	e8 a3 02 00 00       	call   80492b0 <__x86.get_pc_thunk.bx>
 804900d:	81 c3 f3 2f 00 00    	add    $0x2ff3,%ebx
 8049013:	8b 83 fc ff ff ff    	mov    -0x4(%ebx),%eax
 8049019:	85 c0                	test   %eax,%eax
 804901b:	74 02                	je     804901f <_init+0x1f>
 804901d:	ff d0                	call   *%eax
 804901f:	83 c4 08             	add    $0x8,%esp
 8049022:	5b                   	pop    %ebx
 8049023:	c3                   	ret    

Disassembly of section .plt:

08049030 <.plt>:
 8049030:	ff 35 04 c0 04 08    	pushl  0x804c004
 8049036:	ff 25 08 c0 04 08    	jmp    *0x804c008
 804903c:	0f 1f 40 00          	nopl   0x0(%eax)
 8049040:	f3 0f 1e fb          	endbr32 
 8049044:	68 00 00 00 00       	push   $0x0
 8049049:	e9 e2 ff ff ff       	jmp    8049030 <.plt>
 804904e:	66 90                	xchg   %ax,%ax
 8049050:	f3 0f 1e fb          	endbr32 
 8049054:	68 08 00 00 00       	push   $0x8
 8049059:	e9 d2 ff ff ff       	jmp    8049030 <.plt>
 804905e:	66 90                	xchg   %ax,%ax
 8049060:	f3 0f 1e fb          	endbr32 
 8049064:	68 10 00 00 00       	push   $0x10
 8049069:	e9 c2 ff ff ff       	jmp    8049030 <.plt>
 804906e:	66 90                	xchg   %ax,%ax
 8049070:	f3 0f 1e fb          	endbr32 
 8049074:	68 18 00 00 00       	push   $0x18
 8049079:	e9 b2 ff ff ff       	jmp    8049030 <.plt>
 804907e:	66 90                	xchg   %ax,%ax
 8049080:	f3 0f 1e fb          	endbr32 
 8049084:	68 20 00 00 00       	push   $0x20
 8049089:	e9 a2 ff ff ff       	jmp    8049030 <.plt>
 804908e:	66 90                	xchg   %ax,%ax
 8049090:	f3 0f 1e fb          	endbr32 
 8049094:	68 28 00 00 00       	push   $0x28
 8049099:	e9 92 ff ff ff       	jmp    8049030 <.plt>
 804909e:	66 90                	xchg   %ax,%ax
 80490a0:	f3 0f 1e fb          	endbr32 
 80490a4:	68 30 00 00 00       	push   $0x30
 80490a9:	e9 82 ff ff ff       	jmp    8049030 <.plt>
 80490ae:	66 90                	xchg   %ax,%ax
 80490b0:	f3 0f 1e fb          	endbr32 
 80490b4:	68 38 00 00 00       	push   $0x38
 80490b9:	e9 72 ff ff ff       	jmp    8049030 <.plt>
 80490be:	66 90                	xchg   %ax,%ax
 80490c0:	f3 0f 1e fb          	endbr32 
 80490c4:	68 40 00 00 00       	push   $0x40
 80490c9:	e9 62 ff ff ff       	jmp    8049030 <.plt>
 80490ce:	66 90                	xchg   %ax,%ax
 80490d0:	f3 0f 1e fb          	endbr32 
 80490d4:	68 48 00 00 00       	push   $0x48
 80490d9:	e9 52 ff ff ff       	jmp    8049030 <.plt>
 80490de:	66 90                	xchg   %ax,%ax
 80490e0:	f3 0f 1e fb          	endbr32 
 80490e4:	68 50 00 00 00       	push   $0x50
 80490e9:	e9 42 ff ff ff       	jmp    8049030 <.plt>
 80490ee:	66 90                	xchg   %ax,%ax
 80490f0:	f3 0f 1e fb          	endbr32 
 80490f4:	68 58 00 00 00       	push   $0x58
 80490f9:	e9 32 ff ff ff       	jmp    8049030 <.plt>
 80490fe:	66 90                	xchg   %ax,%ax
 8049100:	f3 0f 1e fb          	endbr32 
 8049104:	68 60 00 00 00       	push   $0x60
 8049109:	e9 22 ff ff ff       	jmp    8049030 <.plt>
 804910e:	66 90                	xchg   %ax,%ax
 8049110:	f3 0f 1e fb          	endbr32 
 8049114:	68 68 00 00 00       	push   $0x68
 8049119:	e9 12 ff ff ff       	jmp    8049030 <.plt>
 804911e:	66 90                	xchg   %ax,%ax
 8049120:	f3 0f 1e fb          	endbr32 
 8049124:	68 70 00 00 00       	push   $0x70
 8049129:	e9 02 ff ff ff       	jmp    8049030 <.plt>
 804912e:	66 90                	xchg   %ax,%ax
 8049130:	f3 0f 1e fb          	endbr32 
 8049134:	68 78 00 00 00       	push   $0x78
 8049139:	e9 f2 fe ff ff       	jmp    8049030 <.plt>
 804913e:	66 90                	xchg   %ax,%ax
 8049140:	f3 0f 1e fb          	endbr32 
 8049144:	68 80 00 00 00       	push   $0x80
 8049149:	e9 e2 fe ff ff       	jmp    8049030 <.plt>
 804914e:	66 90                	xchg   %ax,%ax

Disassembly of section .plt.sec:

08049150 <printf@plt>:
 8049150:	f3 0f 1e fb          	endbr32 
 8049154:	ff 25 0c c0 04 08    	jmp    *0x804c00c
 804915a:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)

08049160 <inet_ntoa@plt>:
 8049160:	f3 0f 1e fb          	endbr32 
 8049164:	ff 25 10 c0 04 08    	jmp    *0x804c010
 804916a:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)

08049170 <htons@plt>:
 8049170:	f3 0f 1e fb          	endbr32 
 8049174:	ff 25 14 c0 04 08    	jmp    *0x804c014
 804917a:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)

08049180 <accept@plt>:
 8049180:	f3 0f 1e fb          	endbr32 
 8049184:	ff 25 18 c0 04 08    	jmp    *0x804c018
 804918a:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)

08049190 <puts@plt>:
 8049190:	f3 0f 1e fb          	endbr32 
 8049194:	ff 25 1c c0 04 08    	jmp    *0x804c01c
 804919a:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)

080491a0 <strlen@plt>:
 80491a0:	f3 0f 1e fb          	endbr32 
 80491a4:	ff 25 20 c0 04 08    	jmp    *0x804c020
 80491aa:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)

080491b0 <__libc_start_main@plt>:
 80491b0:	f3 0f 1e fb          	endbr32 
 80491b4:	ff 25 24 c0 04 08    	jmp    *0x804c024
 80491ba:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)

080491c0 <bind@plt>:
 80491c0:	f3 0f 1e fb          	endbr32 
 80491c4:	ff 25 28 c0 04 08    	jmp    *0x804c028
 80491ca:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)

080491d0 <memset@plt>:
 80491d0:	f3 0f 1e fb          	endbr32 
 80491d4:	ff 25 2c c0 04 08    	jmp    *0x804c02c
 80491da:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)

080491e0 <fork@plt>:
 80491e0:	f3 0f 1e fb          	endbr32 
 80491e4:	ff 25 30 c0 04 08    	jmp    *0x804c030
 80491ea:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)

080491f0 <listen@plt>:
 80491f0:	f3 0f 1e fb          	endbr32 
 80491f4:	ff 25 34 c0 04 08    	jmp    *0x804c034
 80491fa:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)

08049200 <ntohs@plt>:
 8049200:	f3 0f 1e fb          	endbr32 
 8049204:	ff 25 38 c0 04 08    	jmp    *0x804c038
 804920a:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)

08049210 <socket@plt>:
 8049210:	f3 0f 1e fb          	endbr32 
 8049214:	ff 25 3c c0 04 08    	jmp    *0x804c03c
 804921a:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)

08049220 <inet_addr@plt>:
 8049220:	f3 0f 1e fb          	endbr32 
 8049224:	ff 25 40 c0 04 08    	jmp    *0x804c040
 804922a:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)

08049230 <recv@plt>:
 8049230:	f3 0f 1e fb          	endbr32 
 8049234:	ff 25 44 c0 04 08    	jmp    *0x804c044
 804923a:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)

08049240 <close@plt>:
 8049240:	f3 0f 1e fb          	endbr32 
 8049244:	ff 25 48 c0 04 08    	jmp    *0x804c048
 804924a:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)

08049250 <send@plt>:
 8049250:	f3 0f 1e fb          	endbr32 
 8049254:	ff 25 4c c0 04 08    	jmp    *0x804c04c
 804925a:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)

Disassembly of section .text:

08049260 <_start>:
 8049260:	f3 0f 1e fb          	endbr32 
 8049264:	31 ed                	xor    %ebp,%ebp
 8049266:	5e                   	pop    %esi
 8049267:	89 e1                	mov    %esp,%ecx
 8049269:	83 e4 f0             	and    $0xfffffff0,%esp
 804926c:	50                   	push   %eax
 804926d:	54                   	push   %esp
 804926e:	52                   	push   %edx
 804926f:	e8 23 00 00 00       	call   8049297 <_start+0x37>
 8049274:	81 c3 8c 2d 00 00    	add    $0x2d8c,%ebx
 804927a:	8d 83 40 d6 ff ff    	lea    -0x29c0(%ebx),%eax
 8049280:	50                   	push   %eax
 8049281:	8d 83 d0 d5 ff ff    	lea    -0x2a30(%ebx),%eax
 8049287:	50                   	push   %eax
 8049288:	51                   	push   %ecx
 8049289:	56                   	push   %esi
 804928a:	c7 c0 32 94 04 08    	mov    $0x8049432,%eax
 8049290:	50                   	push   %eax
 8049291:	e8 1a ff ff ff       	call   80491b0 <__libc_start_main@plt>
 8049296:	f4                   	hlt    
 8049297:	8b 1c 24             	mov    (%esp),%ebx
 804929a:	c3                   	ret    
 804929b:	66 90                	xchg   %ax,%ax
 804929d:	66 90                	xchg   %ax,%ax
 804929f:	90                   	nop

080492a0 <_dl_relocate_static_pie>:
 80492a0:	f3 0f 1e fb          	endbr32 
 80492a4:	c3                   	ret    
 80492a5:	66 90                	xchg   %ax,%ax
 80492a7:	66 90                	xchg   %ax,%ax
 80492a9:	66 90                	xchg   %ax,%ax
 80492ab:	66 90                	xchg   %ax,%ax
 80492ad:	66 90                	xchg   %ax,%ax
 80492af:	90                   	nop

080492b0 <__x86.get_pc_thunk.bx>:
 80492b0:	8b 1c 24             	mov    (%esp),%ebx
 80492b3:	c3                   	ret    
 80492b4:	66 90                	xchg   %ax,%ax
 80492b6:	66 90                	xchg   %ax,%ax
 80492b8:	66 90                	xchg   %ax,%ax
 80492ba:	66 90                	xchg   %ax,%ax
 80492bc:	66 90                	xchg   %ax,%ax
 80492be:	66 90                	xchg   %ax,%ax

080492c0 <deregister_tm_clones>:
 80492c0:	b8 58 c0 04 08       	mov    $0x804c058,%eax
 80492c5:	3d 58 c0 04 08       	cmp    $0x804c058,%eax
 80492ca:	74 24                	je     80492f0 <deregister_tm_clones+0x30>
 80492cc:	b8 00 00 00 00       	mov    $0x0,%eax
 80492d1:	85 c0                	test   %eax,%eax
 80492d3:	74 1b                	je     80492f0 <deregister_tm_clones+0x30>
 80492d5:	55                   	push   %ebp
 80492d6:	89 e5                	mov    %esp,%ebp
 80492d8:	83 ec 14             	sub    $0x14,%esp
 80492db:	68 58 c0 04 08       	push   $0x804c058
 80492e0:	ff d0                	call   *%eax
 80492e2:	83 c4 10             	add    $0x10,%esp
 80492e5:	c9                   	leave  
 80492e6:	c3                   	ret    
 80492e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 80492ee:	66 90                	xchg   %ax,%ax
 80492f0:	c3                   	ret    
 80492f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 80492f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 80492ff:	90                   	nop

08049300 <register_tm_clones>:
 8049300:	b8 58 c0 04 08       	mov    $0x804c058,%eax
 8049305:	2d 58 c0 04 08       	sub    $0x804c058,%eax
 804930a:	89 c2                	mov    %eax,%edx
 804930c:	c1 e8 1f             	shr    $0x1f,%eax
 804930f:	c1 fa 02             	sar    $0x2,%edx
 8049312:	01 d0                	add    %edx,%eax
 8049314:	d1 f8                	sar    %eax
 8049316:	74 20                	je     8049338 <register_tm_clones+0x38>
 8049318:	ba 00 00 00 00       	mov    $0x0,%edx
 804931d:	85 d2                	test   %edx,%edx
 804931f:	74 17                	je     8049338 <register_tm_clones+0x38>
 8049321:	55                   	push   %ebp
 8049322:	89 e5                	mov    %esp,%ebp
 8049324:	83 ec 10             	sub    $0x10,%esp
 8049327:	50                   	push   %eax
 8049328:	68 58 c0 04 08       	push   $0x804c058
 804932d:	ff d2                	call   *%edx
 804932f:	83 c4 10             	add    $0x10,%esp
 8049332:	c9                   	leave  
 8049333:	c3                   	ret    
 8049334:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8049338:	c3                   	ret    
 8049339:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

08049340 <__do_global_dtors_aux>:
 8049340:	f3 0f 1e fb          	endbr32 
 8049344:	80 3d 58 c0 04 08 00 	cmpb   $0x0,0x804c058
 804934b:	75 1b                	jne    8049368 <__do_global_dtors_aux+0x28>
 804934d:	55                   	push   %ebp
 804934e:	89 e5                	mov    %esp,%ebp
 8049350:	83 ec 08             	sub    $0x8,%esp
 8049353:	e8 68 ff ff ff       	call   80492c0 <deregister_tm_clones>
 8049358:	c6 05 58 c0 04 08 01 	movb   $0x1,0x804c058
 804935f:	c9                   	leave  
 8049360:	c3                   	ret    
 8049361:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8049368:	c3                   	ret    
 8049369:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

08049370 <frame_dummy>:
 8049370:	f3 0f 1e fb          	endbr32 
 8049374:	eb 8a                	jmp    8049300 <register_tm_clones>

08049376 <pwned>:
 8049376:	f3 0f 1e fb          	endbr32 
 804937a:	55                   	push   %ebp
 804937b:	89 e5                	mov    %esp,%ebp
 804937d:	57                   	push   %edi
 804937e:	56                   	push   %esi
 804937f:	53                   	push   %ebx
 8049380:	83 ec 4c             	sub    $0x4c,%esp
 8049383:	e8 28 ff ff ff       	call   80492b0 <__x86.get_pc_thunk.bx>
 8049388:	81 c3 78 2c 00 00    	add    $0x2c78,%ebx
 804938e:	8d 45 a8             	lea    -0x58(%ebp),%eax
 8049391:	89 c6                	mov    %eax,%esi
 8049393:	b8 00 00 00 00       	mov    $0x0,%eax
 8049398:	ba 10 00 00 00       	mov    $0x10,%edx
 804939d:	89 f7                	mov    %esi,%edi
 804939f:	89 d1                	mov    %edx,%ecx
 80493a1:	f3 ab                	rep stos %eax,%es:(%edi)
 80493a3:	6a 00                	push   $0x0
 80493a5:	68 00 04 00 00       	push   $0x400
 80493aa:	8d 45 a8             	lea    -0x58(%ebp),%eax
 80493ad:	50                   	push   %eax
 80493ae:	ff 75 08             	pushl  0x8(%ebp)
 80493b1:	e8 7a fe ff ff       	call   8049230 <recv@plt>
 80493b6:	83 c4 10             	add    $0x10,%esp
 80493b9:	8d 45 a8             	lea    -0x58(%ebp),%eax
 80493bc:	0f b6 00             	movzbl (%eax),%eax
 80493bf:	84 c0                	test   %al,%al
 80493c1:	74 37                	je     80493fa <pwned+0x84>
 80493c3:	83 ec 08             	sub    $0x8,%esp
 80493c6:	8d 45 a8             	lea    -0x58(%ebp),%eax
 80493c9:	50                   	push   %eax
 80493ca:	8d 83 08 e0 ff ff    	lea    -0x1ff8(%ebx),%eax
 80493d0:	50                   	push   %eax
 80493d1:	e8 7a fd ff ff       	call   8049150 <printf@plt>
 80493d6:	83 c4 10             	add    $0x10,%esp
 80493d9:	83 ec 0c             	sub    $0xc,%esp
 80493dc:	8d 45 a8             	lea    -0x58(%ebp),%eax
 80493df:	50                   	push   %eax
 80493e0:	e8 bb fd ff ff       	call   80491a0 <strlen@plt>
 80493e5:	83 c4 10             	add    $0x10,%esp
 80493e8:	6a 00                	push   $0x0
 80493ea:	50                   	push   %eax
 80493eb:	8d 45 a8             	lea    -0x58(%ebp),%eax
 80493ee:	50                   	push   %eax
 80493ef:	ff 75 08             	pushl  0x8(%ebp)
 80493f2:	e8 59 fe ff ff       	call   8049250 <send@plt>
 80493f7:	83 c4 10             	add    $0x10,%esp
 80493fa:	90                   	nop
 80493fb:	8d 65 f4             	lea    -0xc(%ebp),%esp
 80493fe:	5b                   	pop    %ebx
 80493ff:	5e                   	pop    %esi
 8049400:	5f                   	pop    %edi
 8049401:	5d                   	pop    %ebp
 8049402:	c3                   	ret    

08049403 <win>:
 8049403:	f3 0f 1e fb          	endbr32 
 8049407:	55                   	push   %ebp
 8049408:	89 e5                	mov    %esp,%ebp
 804940a:	53                   	push   %ebx
 804940b:	83 ec 04             	sub    $0x4,%esp
 804940e:	e8 b3 01 00 00       	call   80495c6 <__x86.get_pc_thunk.ax>
 8049413:	05 ed 2b 00 00       	add    $0x2bed,%eax
 8049418:	83 ec 0c             	sub    $0xc,%esp
 804941b:	8d 90 1a e0 ff ff    	lea    -0x1fe6(%eax),%edx
 8049421:	52                   	push   %edx
 8049422:	89 c3                	mov    %eax,%ebx
 8049424:	e8 67 fd ff ff       	call   8049190 <puts@plt>
 8049429:	83 c4 10             	add    $0x10,%esp
 804942c:	90                   	nop
 804942d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8049430:	c9                   	leave  
 8049431:	c3                   	ret    

08049432 <main>:
 8049432:	f3 0f 1e fb          	endbr32 
 8049436:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 804943a:	83 e4 f0             	and    $0xfffffff0,%esp
 804943d:	ff 71 fc             	pushl  -0x4(%ecx)
 8049440:	55                   	push   %ebp
 8049441:	89 e5                	mov    %esp,%ebp
 8049443:	56                   	push   %esi
 8049444:	53                   	push   %ebx
 8049445:	51                   	push   %ecx
 8049446:	81 ec 4c 04 00 00    	sub    $0x44c,%esp
 804944c:	e8 5f fe ff ff       	call   80492b0 <__x86.get_pc_thunk.bx>
 8049451:	81 c3 af 2b 00 00    	add    $0x2baf,%ebx
 8049457:	83 ec 04             	sub    $0x4,%esp
 804945a:	6a 00                	push   $0x0
 804945c:	6a 01                	push   $0x1
 804945e:	6a 02                	push   $0x2
 8049460:	e8 ab fd ff ff       	call   8049210 <socket@plt>
 8049465:	83 c4 10             	add    $0x10,%esp
 8049468:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 804946b:	83 ec 04             	sub    $0x4,%esp
 804946e:	6a 10                	push   $0x10
 8049470:	6a 00                	push   $0x0
 8049472:	8d 45 c8             	lea    -0x38(%ebp),%eax
 8049475:	50                   	push   %eax
 8049476:	e8 55 fd ff ff       	call   80491d0 <memset@plt>
 804947b:	83 c4 10             	add    $0x10,%esp
 804947e:	66 c7 45 c8 02 00    	movw   $0x2,-0x38(%ebp)
 8049484:	83 ec 0c             	sub    $0xc,%esp
 8049487:	68 cf 56 00 00       	push   $0x56cf
 804948c:	e8 df fc ff ff       	call   8049170 <htons@plt>
 8049491:	83 c4 10             	add    $0x10,%esp
 8049494:	66 89 45 ca          	mov    %ax,-0x36(%ebp)
 8049498:	83 ec 0c             	sub    $0xc,%esp
 804949b:	8d 83 32 e0 ff ff    	lea    -0x1fce(%ebx),%eax
 80494a1:	50                   	push   %eax
 80494a2:	e8 79 fd ff ff       	call   8049220 <inet_addr@plt>
 80494a7:	83 c4 10             	add    $0x10,%esp
 80494aa:	89 45 cc             	mov    %eax,-0x34(%ebp)
 80494ad:	83 ec 04             	sub    $0x4,%esp
 80494b0:	6a 10                	push   $0x10
 80494b2:	8d 45 c8             	lea    -0x38(%ebp),%eax
 80494b5:	50                   	push   %eax
 80494b6:	ff 75 e4             	pushl  -0x1c(%ebp)
 80494b9:	e8 02 fd ff ff       	call   80491c0 <bind@plt>
 80494be:	83 c4 10             	add    $0x10,%esp
 80494c1:	89 45 e0             	mov    %eax,-0x20(%ebp)
 80494c4:	83 ec 08             	sub    $0x8,%esp
 80494c7:	6a 0a                	push   $0xa
 80494c9:	ff 75 e4             	pushl  -0x1c(%ebp)
 80494cc:	e8 1f fd ff ff       	call   80491f0 <listen@plt>
 80494d1:	83 c4 10             	add    $0x10,%esp
 80494d4:	85 c0                	test   %eax,%eax
 80494d6:	75 14                	jne    80494ec <main+0xba>
 80494d8:	83 ec 0c             	sub    $0xc,%esp
 80494db:	8d 83 3c e0 ff ff    	lea    -0x1fc4(%ebx),%eax
 80494e1:	50                   	push   %eax
 80494e2:	e8 a9 fc ff ff       	call   8049190 <puts@plt>
 80494e7:	83 c4 10             	add    $0x10,%esp
 80494ea:	eb 12                	jmp    80494fe <main+0xcc>
 80494ec:	83 ec 0c             	sub    $0xc,%esp
 80494ef:	8d 83 4e e0 ff ff    	lea    -0x1fb2(%ebx),%eax
 80494f5:	50                   	push   %eax
 80494f6:	e8 95 fc ff ff       	call   8049190 <puts@plt>
 80494fb:	83 c4 10             	add    $0x10,%esp
 80494fe:	83 ec 04             	sub    $0x4,%esp
 8049501:	8d 45 b4             	lea    -0x4c(%ebp),%eax
 8049504:	50                   	push   %eax
 8049505:	8d 45 b8             	lea    -0x48(%ebp),%eax
 8049508:	50                   	push   %eax
 8049509:	ff 75 e4             	pushl  -0x1c(%ebp)
 804950c:	e8 6f fc ff ff       	call   8049180 <accept@plt>
 8049511:	83 c4 10             	add    $0x10,%esp
 8049514:	89 45 dc             	mov    %eax,-0x24(%ebp)
 8049517:	0f b7 45 ba          	movzwl -0x46(%ebp),%eax
 804951b:	0f b7 c0             	movzwl %ax,%eax
 804951e:	83 ec 0c             	sub    $0xc,%esp
 8049521:	50                   	push   %eax
 8049522:	e8 d9 fc ff ff       	call   8049200 <ntohs@plt>
 8049527:	83 c4 10             	add    $0x10,%esp
 804952a:	0f b7 f0             	movzwl %ax,%esi
 804952d:	83 ec 0c             	sub    $0xc,%esp
 8049530:	ff 75 bc             	pushl  -0x44(%ebp)
 8049533:	e8 28 fc ff ff       	call   8049160 <inet_ntoa@plt>
 8049538:	83 c4 10             	add    $0x10,%esp
 804953b:	83 ec 04             	sub    $0x4,%esp
 804953e:	56                   	push   %esi
 804953f:	50                   	push   %eax
 8049540:	8d 83 68 e0 ff ff    	lea    -0x1f98(%ebx),%eax
 8049546:	50                   	push   %eax
 8049547:	e8 04 fc ff ff       	call   8049150 <printf@plt>
 804954c:	83 c4 10             	add    $0x10,%esp
 804954f:	e8 8c fc ff ff       	call   80491e0 <fork@plt>
 8049554:	89 45 d8             	mov    %eax,-0x28(%ebp)
 8049557:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
 804955b:	75 46                	jne    80495a3 <main+0x171>
 804955d:	83 ec 0c             	sub    $0xc,%esp
 8049560:	ff 75 e4             	pushl  -0x1c(%ebp)
 8049563:	e8 d8 fc ff ff       	call   8049240 <close@plt>
 8049568:	83 c4 10             	add    $0x10,%esp
 804956b:	83 ec 0c             	sub    $0xc,%esp
 804956e:	ff 75 dc             	pushl  -0x24(%ebp)
 8049571:	e8 00 fe ff ff       	call   8049376 <pwned>
 8049576:	83 c4 10             	add    $0x10,%esp
 8049579:	6a 00                	push   $0x0
 804957b:	6a 03                	push   $0x3
 804957d:	8d 83 87 e0 ff ff    	lea    -0x1f79(%ebx),%eax
 8049583:	50                   	push   %eax
 8049584:	ff 75 dc             	pushl  -0x24(%ebp)
 8049587:	e8 c4 fc ff ff       	call   8049250 <send@plt>
 804958c:	83 c4 10             	add    $0x10,%esp
 804958f:	83 ec 0c             	sub    $0xc,%esp
 8049592:	8d 83 8b e0 ff ff    	lea    -0x1f75(%ebx),%eax
 8049598:	50                   	push   %eax
 8049599:	e8 f2 fb ff ff       	call   8049190 <puts@plt>
 804959e:	83 c4 10             	add    $0x10,%esp
 80495a1:	eb 13                	jmp    80495b6 <main+0x184>
 80495a3:	83 ec 0c             	sub    $0xc,%esp
 80495a6:	ff 75 dc             	pushl  -0x24(%ebp)
 80495a9:	e8 92 fc ff ff       	call   8049240 <close@plt>
 80495ae:	83 c4 10             	add    $0x10,%esp
 80495b1:	e9 48 ff ff ff       	jmp    80494fe <main+0xcc>
 80495b6:	b8 00 00 00 00       	mov    $0x0,%eax
 80495bb:	8d 65 f4             	lea    -0xc(%ebp),%esp
 80495be:	59                   	pop    %ecx
 80495bf:	5b                   	pop    %ebx
 80495c0:	5e                   	pop    %esi
 80495c1:	5d                   	pop    %ebp
 80495c2:	8d 61 fc             	lea    -0x4(%ecx),%esp
 80495c5:	c3                   	ret    

080495c6 <__x86.get_pc_thunk.ax>:
 80495c6:	8b 04 24             	mov    (%esp),%eax
 80495c9:	c3                   	ret    
 80495ca:	66 90                	xchg   %ax,%ax
 80495cc:	66 90                	xchg   %ax,%ax
 80495ce:	66 90                	xchg   %ax,%ax

080495d0 <__libc_csu_init>:
 80495d0:	f3 0f 1e fb          	endbr32 
 80495d4:	55                   	push   %ebp
 80495d5:	e8 6b 00 00 00       	call   8049645 <__x86.get_pc_thunk.bp>
 80495da:	81 c5 26 2a 00 00    	add    $0x2a26,%ebp
 80495e0:	57                   	push   %edi
 80495e1:	56                   	push   %esi
 80495e2:	53                   	push   %ebx
 80495e3:	83 ec 0c             	sub    $0xc,%esp
 80495e6:	89 eb                	mov    %ebp,%ebx
 80495e8:	8b 7c 24 28          	mov    0x28(%esp),%edi
 80495ec:	e8 0f fa ff ff       	call   8049000 <_init>
 80495f1:	8d 9d 10 ff ff ff    	lea    -0xf0(%ebp),%ebx
 80495f7:	8d 85 0c ff ff ff    	lea    -0xf4(%ebp),%eax
 80495fd:	29 c3                	sub    %eax,%ebx
 80495ff:	c1 fb 02             	sar    $0x2,%ebx
 8049602:	74 29                	je     804962d <__libc_csu_init+0x5d>
 8049604:	31 f6                	xor    %esi,%esi
 8049606:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 804960d:	8d 76 00             	lea    0x0(%esi),%esi
 8049610:	83 ec 04             	sub    $0x4,%esp
 8049613:	57                   	push   %edi
 8049614:	ff 74 24 2c          	pushl  0x2c(%esp)
 8049618:	ff 74 24 2c          	pushl  0x2c(%esp)
 804961c:	ff 94 b5 0c ff ff ff 	call   *-0xf4(%ebp,%esi,4)
 8049623:	83 c6 01             	add    $0x1,%esi
 8049626:	83 c4 10             	add    $0x10,%esp
 8049629:	39 f3                	cmp    %esi,%ebx
 804962b:	75 e3                	jne    8049610 <__libc_csu_init+0x40>
 804962d:	83 c4 0c             	add    $0xc,%esp
 8049630:	5b                   	pop    %ebx
 8049631:	5e                   	pop    %esi
 8049632:	5f                   	pop    %edi
 8049633:	5d                   	pop    %ebp
 8049634:	c3                   	ret    
 8049635:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 804963c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

08049640 <__libc_csu_fini>:
 8049640:	f3 0f 1e fb          	endbr32 
 8049644:	c3                   	ret    

08049645 <__x86.get_pc_thunk.bp>:
 8049645:	8b 2c 24             	mov    (%esp),%ebp
 8049648:	c3                   	ret    

Disassembly of section .fini:

0804964c <_fini>:
 804964c:	f3 0f 1e fb          	endbr32 
 8049650:	53                   	push   %ebx
 8049651:	83 ec 08             	sub    $0x8,%esp
 8049654:	e8 57 fc ff ff       	call   80492b0 <__x86.get_pc_thunk.bx>
 8049659:	81 c3 a7 29 00 00    	add    $0x29a7,%ebx
 804965f:	83 c4 08             	add    $0x8,%esp
 8049662:	5b                   	pop    %ebx
 8049663:	c3                   	ret    
