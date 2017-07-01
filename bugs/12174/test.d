import std.stdio, std.algorithm, std.range, std.conv;
void main() {
    enum foo1 = (int n) => n.text.map!(d => d - '0').reduce!q{a + b};
    enum bar1 = iota(1, int.max).filter!(n => n % foo1(n) == 0);
    bar1.take(20).writeln; // OK
    auto foo2 = (int n) => n.text.map!(d => d - '0').sum;
    auto bar2 = iota(1, int.max).filter!(n => n % foo2(n) == 0);
    bar2.take(20).writeln; // OK
    enum foo3 = (int n) => n.text.map!(d => d - '0').sum;
    enum bar3 = iota(1, int.max).filter!(n => n % foo3(n) == 0);
    bar3.take(20).writeln; // object.Error: Integer Divide by Zero
}
