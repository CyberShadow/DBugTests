import std.algorithm : map;
import std.array : join;
struct Test 
{
  pragma(msg, ["a", "b", "c", "d"].map!(a => a).join("\n"));
}
