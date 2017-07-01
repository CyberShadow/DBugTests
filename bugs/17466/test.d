import std.stdio;

//alias T = int; //work
alias long T; //not work

int main() {
    T[2][] d = new T[2][](3);
    d[] = [1L, 2L];
    writeln(d);
    return 0;
}
