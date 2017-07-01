import std.conv : to;
import std.stdio;
//import std.getopt;

void main()
{
    string num = "0.108236736784";
    size_t end = num.length;
    double sum = 0.0;
    foreach (i; 0 .. 100_000_000)
    {
        sum += num[0 .. end].to!double;
        end = (end == num.length) ? 1 : end + 1;
    }
    writeln("sum: ", sum);
}
