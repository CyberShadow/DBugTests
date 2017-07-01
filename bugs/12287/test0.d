import std.stdio;
import std.traits;

struct X(T) {
    T i;
}

void main(){

    writeln(moduleName!((X!int).i));

}