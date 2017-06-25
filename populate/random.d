import std.algorithm.iteration;
import std.algorithm.searching;
import std.array;
import std.file;
import std.path;
import std.process;
import std.random;
import std.string;

import ae.sys.file;
import ae.utils.meta;

alias seenFile = issue =>
	thisExePath
	.dirName
	.dirName
	.buildPath(issue)
	.buildPath(".seen");

void main()
{
	auto issue =
		thisExePath
		.dirName
		.dirName
		.buildPath("descript.ion")
		.readText()
		.splitLines()
		.randomCover
		.filter!(line => !line.canFind("[resolved:") && !line.canFind("[?]") && !line.canFind("[pull]"))
		.map!(line => line.split[0])
		.filter!(issue => !issue.seenFile.exists)
		.front;

	issue
		.seenFile
		.touch;

	issue
		.I!(issue => "https://issues.dlang.org/show_bug.cgi?id=" ~ issue)
		.browse();
}
