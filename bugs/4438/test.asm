
test.o:     file format elf32-i386


Disassembly of section .text._D4test10masked_dotFAdAdAhZd:

00000000 <_D4test10masked_dotFAdAdAhZd>:
   0:	83 ec 14             	sub    $0x14,%esp
   3:	31 d2                	xor    %edx,%edx
   5:	8b 4c 24 1c          	mov    0x1c(%esp),%ecx
   9:	89 1c 24             	mov    %ebx,(%esp)
   c:	8b 5c 24 18          	mov    0x18(%esp),%ebx
  10:	85 db                	test   %ebx,%ebx
  12:	89 74 24 04          	mov    %esi,0x4(%esp)
  16:	8b 74 24 24          	mov    0x24(%esp),%esi
  1a:	89 7c 24 08          	mov    %edi,0x8(%esp)
  1e:	8b 7c 24 2c          	mov    0x2c(%esp),%edi
  22:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  29:	00 
  2a:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
  31:	00 
  32:	74 19                	je     4d <_D4test10masked_dotFAdAdAhZd+0x4d>
  34:	80 3c 0a 00          	cmpb   $0x0,(%edx,%ecx,1)
  38:	74 0e                	je     48 <_D4test10masked_dotFAdAdAhZd+0x48>
  3a:	dd 04 d7             	fldl   (%edi,%edx,8)
  3d:	dc 0c d6             	fmull  (%esi,%edx,8)
  40:	dc 44 24 0c          	faddl  0xc(%esp)
  44:	dd 5c 24 0c          	fstpl  0xc(%esp)
  48:	42                   	inc    %edx
  49:	39 da                	cmp    %ebx,%edx
  4b:	72 e7                	jb     34 <_D4test10masked_dotFAdAdAhZd+0x34>
  4d:	dd 44 24 0c          	fldl   0xc(%esp)
  51:	8b 1c 24             	mov    (%esp),%ebx
  54:	8b 74 24 04          	mov    0x4(%esp),%esi
  58:	8b 7c 24 08          	mov    0x8(%esp),%edi
  5c:	83 c4 14             	add    $0x14,%esp
  5f:	c2 18 00             	ret    $0x18
	...

Disassembly of section .text._Dmain:

00000000 <_Dmain>:
   0:	55                   	push   %ebp
   1:	8b ec                	mov    %esp,%ebp
   3:	83 ec 50             	sub    $0x50,%esp
   6:	89 5d c4             	mov    %ebx,-0x3c(%ebp)
   9:	b8 e8 03 00 00       	mov    $0x3e8,%eax
   e:	8d 4d f0             	lea    -0x10(%ebp),%ecx
  11:	89 75 c8             	mov    %esi,-0x38(%ebp)
  14:	89 7d cc             	mov    %edi,-0x34(%ebp)
  17:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1d:	89 4d b8             	mov    %ecx,-0x48(%ebp)
  20:	c7 45 b4 02 00 00 00 	movl   $0x2,-0x4c(%ebp)
  27:	c7 45 b0 00 00 00 00 	movl   $0x0,-0x50(%ebp)
  2e:	e8 fc ff ff ff       	call   2f <_Dmain+0x2f>
  33:	31 db                	xor    %ebx,%ebx
  35:	89 45 e8             	mov    %eax,-0x18(%ebp)
  38:	89 55 ec             	mov    %edx,-0x14(%ebp)
  3b:	39 5d e8             	cmp    %ebx,-0x18(%ebp)
  3e:	74 25                	je     65 <_Dmain+0x65>
  40:	8b 55 ec             	mov    -0x14(%ebp),%edx
  43:	8d 3c da             	lea    (%edx,%ebx,8),%edi
  46:	8b 0f                	mov    (%edi),%ecx
  48:	89 4d bc             	mov    %ecx,-0x44(%ebp)
  4b:	dd 05 00 00 00 00    	fldl   0x0
  51:	dd 5d b4             	fstpl  -0x4c(%ebp)
  54:	8b 57 04             	mov    0x4(%edi),%edx
  57:	89 55 b0             	mov    %edx,-0x50(%ebp)
  5a:	e8 fc ff ff ff       	call   5b <_Dmain+0x5b>
  5f:	43                   	inc    %ebx
  60:	3b 5d e8             	cmp    -0x18(%ebp),%ebx
  63:	72 db                	jb     40 <_Dmain+0x40>
  65:	c7 45 b4 02 00 00 00 	movl   $0x2,-0x4c(%ebp)
  6c:	b8 e8 03 00 00       	mov    $0x3e8,%eax
  71:	8d 75 f8             	lea    -0x8(%ebp),%esi
  74:	89 45 f8             	mov    %eax,-0x8(%ebp)
  77:	89 45 fc             	mov    %eax,-0x4(%ebp)
  7a:	89 75 b8             	mov    %esi,-0x48(%ebp)
  7d:	c7 45 b0 00 00 00 00 	movl   $0x0,-0x50(%ebp)
  84:	e8 fc ff ff ff       	call   85 <_Dmain+0x85>
  89:	31 db                	xor    %ebx,%ebx
  8b:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8e:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  91:	39 5d e0             	cmp    %ebx,-0x20(%ebp)
  94:	74 25                	je     bb <_Dmain+0xbb>
  96:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  99:	8d 3c d9             	lea    (%ecx,%ebx,8),%edi
  9c:	8b 17                	mov    (%edi),%edx
  9e:	89 55 bc             	mov    %edx,-0x44(%ebp)
  a1:	dd 05 08 00 00 00    	fldl   0x8
  a7:	dd 5d b4             	fstpl  -0x4c(%ebp)
  aa:	8b 4f 04             	mov    0x4(%edi),%ecx
  ad:	89 4d b0             	mov    %ecx,-0x50(%ebp)
  b0:	e8 fc ff ff ff       	call   b1 <_Dmain+0xb1>
  b5:	43                   	inc    %ebx
  b6:	3b 5d e0             	cmp    -0x20(%ebp),%ebx
  b9:	72 db                	jb     96 <_Dmain+0x96>
  bb:	c7 45 b4 e8 03 00 00 	movl   $0x3e8,-0x4c(%ebp)
  c2:	c7 45 b0 00 00 00 00 	movl   $0x0,-0x50(%ebp)
  c9:	e8 fc ff ff ff       	call   ca <_Dmain+0xca>
  ce:	89 45 d0             	mov    %eax,-0x30(%ebp)
  d1:	8b 4d d0             	mov    -0x30(%ebp),%ecx
  d4:	b8 01 01 01 01       	mov    $0x1010101,%eax
  d9:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  dc:	8b 7d d4             	mov    -0x2c(%ebp),%edi
  df:	f3 aa                	rep stos %al,%es:(%edi)
  e1:	31 db                	xor    %ebx,%ebx
  e3:	89 4d d8             	mov    %ecx,-0x28(%ebp)
  e6:	89 4d dc             	mov    %ecx,-0x24(%ebp)
  e9:	39 4d e8             	cmp    %ecx,-0x18(%ebp)
  ec:	74 2b                	je     119 <_Dmain+0x119>
  ee:	8b 55 ec             	mov    -0x14(%ebp),%edx
  f1:	ff 74 da 04          	pushl  0x4(%edx,%ebx,8)
  f5:	ff 34 da             	pushl  (%edx,%ebx,8)
  f8:	8b 75 e4             	mov    -0x1c(%ebp),%esi
  fb:	ff 74 de 04          	pushl  0x4(%esi,%ebx,8)
  ff:	ff 34 de             	pushl  (%esi,%ebx,8)
 102:	ff 75 d4             	pushl  -0x2c(%ebp)
 105:	ff 75 d0             	pushl  -0x30(%ebp)
 108:	e8 fc ff ff ff       	call   109 <_Dmain+0x109>
 10d:	43                   	inc    %ebx
 10e:	dc 45 d8             	faddl  -0x28(%ebp)
 111:	3b 5d e8             	cmp    -0x18(%ebp),%ebx
 114:	dd 5d d8             	fstpl  -0x28(%ebp)
 117:	72 d5                	jb     ee <_Dmain+0xee>
 119:	c7 45 b0 10 00 00 00 	movl   $0x10,-0x50(%ebp)
 120:	dd 45 d8             	fldl   -0x28(%ebp)
 123:	dd 5d b4             	fstpl  -0x4c(%ebp)
 126:	e8 fc ff ff ff       	call   127 <_Dmain+0x127>
 12b:	8b 5d c4             	mov    -0x3c(%ebp),%ebx
 12e:	8b 75 c8             	mov    -0x38(%ebp),%esi
 131:	8b 7d cc             	mov    -0x34(%ebp),%edi
 134:	8b e5                	mov    %ebp,%esp
 136:	31 c0                	xor    %eax,%eax
 138:	5d                   	pop    %ebp
 139:	c3                   	ret    
	...

Disassembly of section .text.main:

00000000 <main>:
   0:	55                   	push   %ebp
   1:	8b ec                	mov    %esp,%ebp
   3:	83 ec 10             	sub    $0x10,%esp
   6:	b8 00 00 00 00       	mov    $0x0,%eax
   b:	8b 4d 0c             	mov    0xc(%ebp),%ecx
   e:	8b 55 08             	mov    0x8(%ebp),%edx
  11:	89 45 f8             	mov    %eax,-0x8(%ebp)
  14:	89 4d f4             	mov    %ecx,-0xc(%ebp)
  17:	89 55 f0             	mov    %edx,-0x10(%ebp)
  1a:	e8 fc ff ff ff       	call   1b <main+0x1b>
  1f:	8b e5                	mov    %ebp,%esp
  21:	5d                   	pop    %ebp
  22:	c3                   	ret    
	...

Disassembly of section .text.d_dso_init:

00000000 <.text.d_dso_init>:
   0:	55                   	push   %ebp
   1:	8b ec                	mov    %esp,%ebp
   3:	81 ec 08 00 00 00    	sub    $0x8,%esp
   9:	b8 00 00 00 00       	mov    $0x0,%eax
   e:	50                   	push   %eax
   f:	b8 00 00 00 00       	mov    $0x0,%eax
  14:	50                   	push   %eax
  15:	b8 00 00 00 00       	mov    $0x0,%eax
  1a:	50                   	push   %eax
  1b:	6a 01                	push   $0x1
  1d:	54                   	push   %esp
  1e:	e8 fc ff ff ff       	call   1f <.text.d_dso_init+0x1f>
  23:	c9                   	leave  
  24:	c3                   	ret    
  25:	00 00                	add    %al,(%eax)
	...
