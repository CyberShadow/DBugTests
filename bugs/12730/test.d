import std.stdio;

void main() {
    uint a = 1;
    uint b = 2;
    uint c;
    asm {
        mov EAX, a;
        mov EBX, b;
        lea ECX, [EBX - EAX];
        mov c, ECX;
    }

    writeln(c);  // Prints 3 on both 32-bit and 64-bit
}
