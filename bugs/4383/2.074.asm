
     file format elf32-i386





	83 ec 0c             	sub    esp,0xc
	83 7c 24 10 02       	cmp    DWORD PTR [esp+0x10],0x2
	75 08                	jne    12 <_Dmain+0x12>
	db 2d 00 00 00 00    	fld    TBYTE PTR ds:0x0
	eb 06                	jmp    18 <_Dmain+0x18>
	db 2d 0c 00 00 00    	fld    TBYTE PTR ds:0xc
	db 3c 24             	fstp   TBYTE PTR [esp]
	db 2c 24             	fld    TBYTE PTR [esp]
	db 2c 24             	fld    TBYTE PTR [esp]
	de c1                	faddp  st(1),st
	66 c7 44 24 0a 00 00 	mov    WORD PTR [esp+0xa],0x0
	83 ec 08             	sub    esp,0x8
	d9 7c 24 04          	fnstcw WORD PTR [esp+0x4]
	d9 2d 18 00 00 00    	fldcw  WORD PTR ds:0x18
	db 1c 24             	fistp  DWORD PTR [esp]
	d9 6c 24 04          	fldcw  WORD PTR [esp+0x4]
	58                   	pop    eax
	83 c4 10             	add    esp,0x10
	c3                   	ret    
	...




	55                   	push   ebp
	8b ec                	mov    ebp,esp
	83 ec 10             	sub    esp,0x10
	b8 00 00 00 00       	mov    eax,0x0
	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
	89 4d f4             	mov    DWORD PTR [ebp-0xc],ecx
	89 55 f0             	mov    DWORD PTR [ebp-0x10],edx
	e8 fc ff ff ff       	call   1b <main+0x1b>
	8b e5                	mov    esp,ebp
	5d                   	pop    ebp
	c3                   	ret    
	...




	55                   	push   ebp
	8b ec                	mov    ebp,esp
	81 ec 08 00 00 00    	sub    esp,0x8
	b8 00 00 00 00       	mov    eax,0x0
	50                   	push   eax
	b8 00 00 00 00       	mov    eax,0x0
	50                   	push   eax
	b8 00 00 00 00       	mov    eax,0x0
	50                   	push   eax
	6a 01                	push   0x1
	54                   	push   esp
	e8 fc ff ff ff       	call   1f <.text.d_dso_init+0x1f>
	c9                   	leave  
	c3                   	ret    
	00 00                	add    BYTE PTR [eax],al
	...
