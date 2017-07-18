struct S
{
    this(this) { }
    ~this() { }
}

struct S2
{ S s; }

const S  globalS;  // ok
const S2 globalS2; // ok

void f()
{
    const S  localS;  // ok
    const S2 localS2; // ok
}


struct S3 // or class, or union
{ const S s; } // any qualifier causes errors
