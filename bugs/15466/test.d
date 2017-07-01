import std.stdio;
import std.datetime;

alias real T;     // Must be 'real'
enum testCount = 7; // Must be > 6

T foo() {           // Must return a value
    return 42;
}

void main() {
                    // Must cast to void
    const m = benchmark!(() => cast(void)foo)(testCount);
    writeln(m[0].msecs);
}
