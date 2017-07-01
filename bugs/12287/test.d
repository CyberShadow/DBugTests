//import std.stdio;

template moduleName(alias T)
{
	pragma(msg, T.stringof);

    import std.algorithm : startsWith;

    static assert(!T.stringof.startsWith("package "), "cannot get the module name for a package");

    static if (T.stringof.startsWith("module "))
    {
        static if (__traits(compiles, packageName!T))
            enum packagePrefix = packageName!T ~ '.';
        else
            enum packagePrefix = "";

        enum moduleName = packagePrefix ~ T.stringof[7..$];
    }
    else
        alias moduleName = moduleName!(__traits(parent, T));    // If you use enum, it will cause compiler ICE
}


struct X(T)
{
    T i;
}

//pragma(msg, __traits(parent, (X!int).i));
//pragma(msg, __traits(parent, __traits(parent, __traits(parent, (X!int).i))));

pragma(msg, "RESULT: " ~ moduleName!((X!int).i));
