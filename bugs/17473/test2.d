struct S {
    int f(int delegate(char a) dlg) {
        char c = cast(char)50;
        return dlg(c);
    }
}

unittest {
    S s;
    pragma(msg, typeof(&s.f));  // int delegate(int delegate(char a) dlg)
    foreach(ref x; &s.f) {}

    int delegate(int delegate(char a) dlg) g = &s.f;
    pragma(msg, typeof(g));     // int delegate(int delegate(char a) dlg)
    // foreach(x; g) {}            // FAILS
}
