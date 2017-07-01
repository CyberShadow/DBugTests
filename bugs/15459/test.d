#!/usr/bin/rdmd

import std.stdio;
import std.algorithm;

char somefunc(char c)
{
    return c;
}

void main()
{
    stdin
        .byLine
        .each!(map!somefunc);
}
