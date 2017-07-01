module example;

import std.meta: staticIndexOf;

struct Attrib {}

@Attrib enum TEST = 123;

pragma(msg, __traits(getAttributes, 
                     __traits(getMember, example, "TEST")));
