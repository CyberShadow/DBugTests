void main() {
    int[string] x;
    static if (is(typeof(x) S : T[U], T, U)) { }
    pragma(msg, S, " ", T, " ", U);
}
