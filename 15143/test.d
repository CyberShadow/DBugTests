void function() fun;
import std.demangle;
pragma(msg, demangle(fun.mangleof));
