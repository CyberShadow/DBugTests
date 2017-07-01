@safe:

unittest {
    struct OpApply {
        int delegate(int) @safe myDlg;
        int opApply(int delegate(int) @safe dlg) {
            myDlg = dlg;
            return 0;
        }
    }
    struct Foo {
        OpApply o;
        int i;
        this(int x) {
            o = OpApply();
            foreach(_; o) {
                i = 0;
            }
            i = x;
        }

        int call(int delegate(int) @safe dlg) {
            dlg(0);
            return i;
        }
    }
    auto foo1 = Foo(1);
    auto foo2 = Foo(2);
    import std.stdio;
    writeln(foo2.call(foo1.o.myDlg));
}
