void main() {
    immutable size_t x = 10;
    asm {
        mov EDI, x;
    }
}
