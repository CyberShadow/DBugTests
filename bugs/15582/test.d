struct S {
    int[10] data;
    auto opSlice() { return data[]; }
}

void main() {
    S s;
    s[] = 10;   // Error: s[] is not an lvalue
    s[][] = 10; // works
}
