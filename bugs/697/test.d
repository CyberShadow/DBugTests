void main()
{
    const byte z = 35;
    asm { db z; }
    asm { db 1+2; }
}
