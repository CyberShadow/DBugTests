import std.algorithm.iteration;
import std.algorithm.searching;
import std.array;
import std.file;
import std.path;
import std.process;
import std.random;
import std.string;

import ae.utils.meta;

void main()
{
	thisExePath
		.dirName
		.dirName
		.buildPath("descript.ion")
		.readText()
		.splitLines()
		.filter!(line => !line.canFind("[resolved:") && !line.canFind("[?]") && !line.canFind("[pull]"))
		.array
		[uniform(0, $)]
		.I!(line => "https://issues.dlang.org/show_bug.cgi?id=" ~ line.split[0])
		.browse();
}
