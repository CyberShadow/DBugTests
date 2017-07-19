
test.o:     file format elf64-x86-64


Disassembly of section .text._D4test3Foo4mulsMFdZS4test3Foo:

0000000000000000 <_D4test3Foo4mulsMFdZS4test3Foo>:
   0:	50                   	push   %rax
   1:	48 89 f9             	mov    %rdi,%rcx
   4:	48 89 f0             	mov    %rsi,%rax
   7:	f2 0f 10 d0          	movsd  %xmm0,%xmm2
   b:	f2 48 0f 10 09       	rex.W movsd (%rcx),%xmm1
  10:	f2 0f 59 ca          	mulsd  %xmm2,%xmm1
  14:	f2 48 0f 11 08       	rex.W movsd %xmm1,(%rax)
  19:	f2 48 0f 10 59 08    	rex.W movsd 0x8(%rcx),%xmm3
  1f:	f2 0f 59 da          	mulsd  %xmm2,%xmm3
  23:	f2 48 0f 11 58 08    	rex.W movsd %xmm3,0x8(%rax)
  29:	f2 48 0f 10 61 10    	rex.W movsd 0x10(%rcx),%xmm4
  2f:	f2 0f 59 e2          	mulsd  %xmm2,%xmm4
  33:	f2 48 0f 11 60 10    	rex.W movsd %xmm4,0x10(%rax)
  39:	59                   	pop    %rcx
  3a:	c3                   	retq   
	...

Disassembly of section .text._D4test3Foo11__xopEqualsFKxS4test3FooKxS4test3FooZb:

0000000000000000 <_D4test3Foo11__xopEqualsFKxS4test3FooKxS4test3FooZb>:
   0:	50                   	push   %rax
   1:	48 89 f9             	mov    %rdi,%rcx
   4:	48 89 f2             	mov    %rsi,%rdx
   7:	f2 48 0f 10 02       	rex.W movsd (%rdx),%xmm0
   c:	f2 48 0f 10 09       	rex.W movsd (%rcx),%xmm1
  11:	66 0f 2e c8          	ucomisd %xmm0,%xmm1
  15:	75 2a                	jne    41 <_D4test3Foo11__xopEqualsFKxS4test3FooKxS4test3FooZb+0x41>
  17:	7a 28                	jp     41 <_D4test3Foo11__xopEqualsFKxS4test3FooKxS4test3FooZb+0x41>
  19:	f2 48 0f 10 52 08    	rex.W movsd 0x8(%rdx),%xmm2
  1f:	f2 48 0f 10 59 08    	rex.W movsd 0x8(%rcx),%xmm3
  25:	66 0f 2e da          	ucomisd %xmm2,%xmm3
  29:	75 16                	jne    41 <_D4test3Foo11__xopEqualsFKxS4test3FooKxS4test3FooZb+0x41>
  2b:	7a 14                	jp     41 <_D4test3Foo11__xopEqualsFKxS4test3FooKxS4test3FooZb+0x41>
  2d:	f2 48 0f 10 62 10    	rex.W movsd 0x10(%rdx),%xmm4
  33:	f2 48 0f 10 41 10    	rex.W movsd 0x10(%rcx),%xmm0
  39:	66 0f 2e c4          	ucomisd %xmm4,%xmm0
  3d:	7a 02                	jp     41 <_D4test3Foo11__xopEqualsFKxS4test3FooKxS4test3FooZb+0x41>
  3f:	74 04                	je     45 <_D4test3Foo11__xopEqualsFKxS4test3FooKxS4test3FooZb+0x45>
  41:	31 c0                	xor    %eax,%eax
  43:	eb 05                	jmp    4a <_D4test3Foo11__xopEqualsFKxS4test3FooKxS4test3FooZb+0x4a>
  45:	b8 01 00 00 00       	mov    $0x1,%eax
  4a:	59                   	pop    %rcx
  4b:	c3                   	retq   

Disassembly of section .text._D4test3Foo9__xtoHashFNbNeKxS4test3FooZm:

0000000000000000 <_D4test3Foo9__xtoHashFNbNeKxS4test3FooZm>:
   0:	55                   	push   %rbp
   1:	48 8b ec             	mov    %rsp,%rbp
   4:	48 83 ec 10          	sub    $0x10,%rsp
   8:	48 89 5d f0          	mov    %rbx,-0x10(%rbp)
   c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  10:	48 89 fe             	mov    %rdi,%rsi
  13:	bf 00 00 00 00       	mov    $0x0,%edi
  18:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 1f <_D4test3Foo9__xtoHashFNbNeKxS4test3FooZm+0x1f>
  1f:	48 ff 50 28          	rex.W callq *0x28(%rax)
  23:	48 89 c3             	mov    %rax,%rbx
  26:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
  2a:	48 8d 71 08          	lea    0x8(%rcx),%rsi
  2e:	bf 00 00 00 00       	mov    $0x0,%edi
  33:	48 8b 15 00 00 00 00 	mov    0x0(%rip),%rdx        # 3a <_D4test3Foo9__xtoHashFNbNeKxS4test3FooZm+0x3a>
  3a:	48 ff 52 28          	rex.W callq *0x28(%rdx)
  3e:	48 01 c3             	add    %rax,%rbx
  41:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  45:	48 8d 70 10          	lea    0x10(%rax),%rsi
  49:	bf 00 00 00 00       	mov    $0x0,%edi
  4e:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 55 <_D4test3Foo9__xtoHashFNbNeKxS4test3FooZm+0x55>
  55:	48 ff 51 28          	rex.W callq *0x28(%rcx)
  59:	48 01 c3             	add    %rax,%rbx
  5c:	48 8b c3             	mov    %rbx,%rax
  5f:	48 8b 5d f0          	mov    -0x10(%rbp),%rbx
  63:	48 8b e5             	mov    %rbp,%rsp
  66:	5d                   	pop    %rbp
  67:	c3                   	retq   

Disassembly of section .text._Dmain:

0000000000000000 <_Dmain>:
   0:	50                   	push   %rax
   1:	31 c0                	xor    %eax,%eax
   3:	59                   	pop    %rcx
   4:	c3                   	retq   
   5:	00 00                	add    %al,(%rax)
	...

Disassembly of section .text.main:

0000000000000000 <main>:
   0:	55                   	push   %rbp
   1:	48 8b ec             	mov    %rsp,%rbp
   4:	ba 00 00 00 00       	mov    $0x0,%edx
   9:	e8 00 00 00 00       	callq  e <main+0xe>
   e:	5d                   	pop    %rbp
   f:	c3                   	retq   

Disassembly of section .text.d_dso_init:

0000000000000000 <.text.d_dso_init>:
   0:	55                   	push   %rbp
   1:	48 8b ec             	mov    %rsp,%rbp
   4:	b8 00 00 00 00       	mov    $0x0,%eax
   9:	50                   	push   %rax
   a:	b8 00 00 00 00       	mov    $0x0,%eax
   f:	50                   	push   %rax
  10:	b8 00 00 00 00       	mov    $0x0,%eax
  15:	50                   	push   %rax
  16:	6a 01                	pushq  $0x1
  18:	48 8b fc             	mov    %rsp,%rdi
  1b:	e8 00 00 00 00       	callq  20 <.text.d_dso_init+0x20>
  20:	c9                   	leaveq 
  21:	c3                   	retq   
  22:	00 00                	add    %al,(%rax)
  24:	00 00                	add    %al,(%rax)
	...
