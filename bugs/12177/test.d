void main() {
    import std.range;
    foreach (s; recurrence!q{a[n - 1] ~ a[n - 2]}("1", "0")) {}
}
