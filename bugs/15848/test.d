import std.stdio;

void foo(out Test x) {
    writeln("x.n = ", x.n);
}

struct Test {
    int n;
    ~this() {
        writeln("~this()");
    }
    int opAssign(int val) {
        writefln("opAssign(%s)", val);
        return n = val + 1;
    }
}

void main() {
    Test t;
    foo(t);
    writeln("done");
}
