import std.stdio;

import std.bitmanip;

int main() {
	foreach (s; [0, 63, 64]) {
    bool[] buf = new bool[64*3];
    buf[0..64] = true;
    BitArray b = BitArray(buf);
    //writeln(b);
    if (s)
	    b <<= s;
    writeln(b);
	}
    return 0;
}
