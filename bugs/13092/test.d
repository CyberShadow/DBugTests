void main() {
    import std.typecons: Tuple, Nullable;
    import std.algorithm: cartesianProduct;
    string[] a;
    const Nullable!(Tuple!(string[])) b;
    const string[] c = b.get[0]; // OK
    foreach (ab; cartesianProduct(a, c)) {} // OK
    foreach (ab; cartesianProduct(a, b[0])) {} // fails
    foreach (ab; cartesianProduct(a, b.get[0])) {} // fails
}
