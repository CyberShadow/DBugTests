import std.digest.crc; 
import std.exception;

//enum buggy1 = foo("Hello World!");
enum buggy2 = crc32Of("Hello World!");

ubyte[4] foo(string str) 
{
    ubyte[4] result = str.crc32Of();
    enforce (result != (ubyte[4]).init, "this should not be thrown");
    return result;
}
