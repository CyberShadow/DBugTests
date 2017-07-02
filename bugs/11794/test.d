import std.stdio : writeln;
import std.conv : to;
void main() {
    auto x = std.conv.to!double("7.3");
    writeln(x - 2.2);
}
