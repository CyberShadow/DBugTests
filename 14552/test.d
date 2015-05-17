import std.algorithm : map;
class Outer {
    auto test() {
        return [1, 2, 3].map!( j => new Inner );
    }
    class Inner {}
}
