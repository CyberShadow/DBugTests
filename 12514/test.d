void main() {
    ulong x = 10_000_000;
    uint y = (x <= uint.max) ? x : 0;
}
