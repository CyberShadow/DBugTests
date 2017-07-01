import std.algorithm, std.conv, std.stdio;
void main () {
    auto arr = [1];
    version (S1) sort (arr);
    version (S2) sort !(q{a < b}, SwapStrategy.stable) (arr);
    auto s = map !(to !(string)) (arr);
    if (s.front != "1") {
        writeln ("?");
    }
}
