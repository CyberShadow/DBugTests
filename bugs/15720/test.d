import std.range;
import std.stdio;
void main() {
        writeln(iota(long.max, long.min, -1).length);
        writeln(iota(long.max, long.min, -2).length);
        writeln(iota(long.max, long.min, -3).length);
}
