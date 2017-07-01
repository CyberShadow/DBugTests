void main() {
    int[] x = new int[5];
    x[$] = 1; // easy
    x[x.length] = 1; // idem
    enum size_t n = 2;
    x[$ + n] = 2; // not too much hard if n is unsigned
    x[x.length + n] = 2; // idem
}
