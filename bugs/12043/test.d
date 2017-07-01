import std.stdio;

struct F {
    T opCall(T = int)(int a, int b, int c) {
        return cast(T)(a * b * c);
    }
}

void main() {
    F f;
    int i = f(3,4,5);
    float f_ = f!float(6, 7, 8);
}
