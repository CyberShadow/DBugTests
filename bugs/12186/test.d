void main() {
    import std.algorithm: map;
    immutable int[][] mat;
    mat.map!((in r) => 0);              // OK
    mat.map!((const r) => 0);           // OK
    mat.map!((immutable int[] r) => 0); // OK
    mat.map!((immutable r) => 0);       // Error
}
