import core.demangle;

class Class {
    void c() const; // const(void function()) test.Class.c
    pragma(msg, c.mangleof.demangle);

    void w() inout; // test.Class.winout(void function())
    pragma(msg, w.mangleof.demangle);
}

