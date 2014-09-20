module b;
bool foo(T)() {
    // Make sure this is not inlined so a.o actually needs
    // to reference it.
    asm { nop; }
    return false;
}
