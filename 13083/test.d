import std.algorithm;
import std.stdio;

int f(ref int[int] hash) {
  int[] ar = [8, 8, 8, 8];
  writefln("result: %s", ar.map!(x => x + hash[x]).reduce!(min));
  return 0;
}

int main() { 
  int[int] hash = [ 8: 1, 9: 2 ];

  f(hash);
  return 0;
}
