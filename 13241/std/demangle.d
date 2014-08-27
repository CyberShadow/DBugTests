// Written in the D programming language.

/**
 * Demangle D mangled names.
 *
 * Macros:
 *  WIKI = Phobos/StdDemangle
 *
 * Copyright: Copyright Digital Mars 2000 - 2009.
 * License:   <a href="http://www.boost.org/LICENSE_1_0.txt">Boost License 1.0</a>.
 * Authors:   $(WEB digitalmars.com, Walter Bright),
 *                        Thomas Kuehne, Frits van Bommel
 * Source:    $(PHOBOSSRC std/_demangle.d)
 */
/*
 *          Copyright Digital Mars 2000 - 2009.
 * Distributed under the Boost Software License, Version 1.0.
 *    (See accompanying file LICENSE_1_0.txt or copy at
 *          http://www.boost.org/LICENSE_1_0.txt)
 */
module std.demangle;

private import core.demangle;
private import std.exception;

private class MangleException : Exception
{
    this()
    {
        super("MangleException");
    }
}

/*****************************
 * Demangle D mangled names.
 *
 * If it is not a D mangled name, it returns its argument name.
 * Example:
 *        This program reads standard in and writes it to standard out,
 *        pretty-printing any found D mangled names.
-------------------
import core.stdc.stdio : stdin;
import std.stdio;
import std.ascii;
import std.demangle;

void test(int x, float y) { }

int main()
{
    string buffer;
    bool inword;
    int c;

    writefln("Try typing in: %s", test.mangleof);
    while ((c = fgetc(stdin)) != EOF)
    {
        if (inword)
        {
            if (c == '_' || isAlphaNum(c))
                buffer ~= cast(char) c;
            else
            {
                inword = false;
                write(demangle(buffer), cast(char) c);
            }
        }
        else
        {   if (c == '_' || isAlpha(c))
            {
                inword = true;
                buffer.length = 0;
                buffer ~= cast(char) c;
            }
            else
                write(cast(char) c);
        }
    }
    if (inword)
        write(demangle(buffer));
    return 0;
}
-------------------
 */

string demangle(string name)
{
    auto ret = core.demangle.demangle(name);
    return assumeUnique(ret);
}
