void main() {
    ubyte[10] a;
    ubyte[20] b;
    b[1 .. a.length + 2] = a[];
}
