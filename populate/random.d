import core.sys.windows.windows;

import std.algorithm.iteration;
import std.array;
import std.file;
import std.process;
import std.random;

import ae.utils.meta;

void main()
{
	dirEntries("", SpanMode.shallow)
		.filter!(de => de.isDir && (de.attributes & FILE_ATTRIBUTE_HIDDEN) == 0)
		.array
		[uniform(0, $)]
		.I!(de => "https://issues.dlang.org/show_bug.cgi?id=" ~ de.name)
		.browse();
}
