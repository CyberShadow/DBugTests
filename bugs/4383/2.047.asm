
     file format elf32-i386





	c3                   	ret    
	60                   	pusha  
	b8 0d 00 00 00       	mov    eax,0xd
	b9 00 00 00 00       	mov    ecx,0x0
	8b 11                	mov    edx,DWORD PTR [ecx]
	89 10                	mov    DWORD PTR [eax],edx
	89 01                	mov    DWORD PTR [ecx],eax
	61                   	popa   
	c3                   	ret    




	55                   	push   ebp
	8b ec                	mov    ebp,esp
	83 ec 0c             	sub    esp,0xc
	83 7d 08 02          	cmp    DWORD PTR [ebp+0x8],0x2
	75 08                	jne    14 <_Dmain+0x14>
	db 2d 00 00 00 00    	fld    TBYTE PTR ds:0x0
	eb 06                	jmp    1a <_Dmain+0x1a>
	db 2d 0c 00 00 00    	fld    TBYTE PTR ds:0xc
	db 7d f4             	fstp   TBYTE PTR [ebp-0xc]
	db 6d f4             	fld    TBYTE PTR [ebp-0xc]
	db 6d f4             	fld    TBYTE PTR [ebp-0xc]
	de c1                	faddp  st(1),st
	66 c7 45 fe 00 00    	mov    WORD PTR [ebp-0x2],0x0
	83 ec 08             	sub    esp,0x8
	d9 7c 24 04          	fnstcw WORD PTR [esp+0x4]
	d9 2d 18 00 00 00    	fldcw  WORD PTR ds:0x18
	db 1c 24             	fistp  DWORD PTR [esp]
	d9 6c 24 04          	fldcw  WORD PTR [esp+0x4]
	58                   	pop    eax
	8b e5                	mov    esp,ebp
	5d                   	pop    ebp
	c3                   	ret    
