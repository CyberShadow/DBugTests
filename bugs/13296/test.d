template t(T) {
//  pragma(msg, "T ", T.stringof);
    static assert(false);
    alias t = T;
}

template t(alias T) {
//  pragma(msg, "alias ", T.stringof);
    alias t = T;
}

void main() {
    struct S {}
//  t!int i; // 2.065: T,     2.066: T
    t!S s;   // 2.065: alias, 2.066: T
}
