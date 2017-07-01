void main() {
    import std.typecons: Typedef;
    alias T = Typedef!int;
    T x;
    x = 10;
    int y = 10;
    x = y;
    T[5] arr;
    arr[0] = 10;
}
