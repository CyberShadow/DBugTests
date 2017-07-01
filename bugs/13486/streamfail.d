/*
    Compiling it the following way:

    dmd streamfail.d
    ./streamfail < input.txt

    Contents of `input.txt`
    9
    11 2
    3 4
    5 6
    7 8
    9 10

    Expected Output:
    [11, 2]
    [3, 4]
    [5, 6]
    [7, 8]
    [9, 10]

    Current Output:
    []
    [11, 2]
    [3, 4]
    [5, 6]
    [7, 8]
    [9, 10]


*/

import std.stdio;
import std.array;
import std.conv;

int main()
{
    int num, x, y;

    readf("%d\n", &num);
    foreach (string line; lines(stdin)) {
      auto coords = to!(double[])(split(line));
      writeln(coords);
    }
    return true;
}
