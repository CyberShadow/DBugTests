const size_t n = 8;

struct S1 { long l; }       // good
struct S2 { byte[n] arr; }  // causes errors

static assert(S1.sizeof == n);
static assert(S2.sizeof == n);

extern(C):
size_t getN() { return n; }
S1 getS1() { return S1(); } // correct code
S2 getS2() { return S2(); } // wrong code
