import std.algorithm;
import std.array;
import std.conv;
import std.datetime;
import std.file;
import std.regex;
import std.stdio;
import std.string;
import std.typetuple;

enum expr = `;.*`;
enum repl = "";
enum fn = `alice30.txt`;
enum N = 5000;

string[] lines;

void regexInline()
{
    lines
        .map!(line => line
            .replaceAll(regex(expr), repl)
        )
        .array
    ;
}

void regexAuto()
{
    auto r = regex(expr);
    lines
        .map!(line => line
            .replaceAll(r, repl)
        )
        .array
    ;
}

void regexStatic()
{
    static r = regex(expr);
    lines
        .map!(line => line
            .replaceAll(r, repl)
        )
        .array
    ;
}

void regexEnum()
{
    enum r = regex(expr);
    lines
        .map!(line => line
            .replaceAll(r, repl)
        )
        .array
    ;
}

void ctRegexInline()
{
    lines
        .map!(line => line
            .replaceAll(ctRegex!expr, repl)
        )
        .array
    ;
}

void ctRegexAuto()
{
    auto r = ctRegex!expr;
    lines
        .map!(line => line
            .replaceAll(r, repl)
        )
        .array
    ;
}

void ctRegexStatic()
{
    static r = ctRegex!expr;
    lines
        .map!(line => line
            .replaceAll(r, repl)
        )
        .array
    ;
}

void ctRegexEnum()
{
    enum r = ctRegex!expr;
    lines
        .map!(line => line
            .replaceAll(r, repl)
        )
        .array
    ;
}

Regex!char re(string pattern)()
{
    static Regex!char r;
    if (r.empty)
        r = regex(pattern);
    return r;
}

void reInline()
{
    lines
        .map!(line => line
            .replaceAll(re!expr, repl)
        )
        .array
    ;
}

alias funcs = TypeTuple!(
    regexInline,
    regexAuto,
    regexStatic,
    regexEnum,
    ctRegexInline,
    ctRegexAuto,
    ctRegexStatic,
    ctRegexEnum,
    reInline,
);

void main()
{
    auto text = cast(string)read(fn);
    lines = text.splitLines();
    auto results = benchmark!funcs(N);
    foreach (i, func; funcs)
        writeln(
            __traits(identifier, func),
            "\t",
            to!Duration(results[i]),
        );
}
