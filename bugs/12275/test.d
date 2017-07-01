import std.csv;
import std.array;
import std.algorithm;

void main() {
    enum x = "a,b,c\nd,e,f";
    enum r = csvReader!string(x);
    auto a = r.map!"a.array".array;
}
