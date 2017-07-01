void main() {
    int[256] data;
    foreach (ubyte i; 0 .. data.length) {} // OK
    foreach (ubyte i, x; data) {}          // Error
}
