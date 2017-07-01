template A(T...) {
    template B(alias T) { }
}

void main() {
    void fv() {}
    alias A!(fv) F;
    F.B!F;
}
