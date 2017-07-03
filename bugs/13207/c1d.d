const size_t n = 8; // yes, even fits in a register

struct S1 { long l; }       // good
struct S2 { byte[n] arr; }  // causes errors

static assert(S1.sizeof == n);
static assert(S2.sizeof == n);

extern(C++) interface I
{
    size_t getN();
    S1 getS1();
    S2 getS2();
}

class C: I
{
extern(C++):
    size_t getN() { return n; }
    S1 getS1() { return S1(); } // correct code
    S2 getS2() { return S2(); } // wrong code
}

extern(C) I getI() { return new C; }
