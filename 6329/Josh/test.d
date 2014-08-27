import std.algorithm;
import std.array;
import std.conv;
import std.datetime;
import std.exception;
import std.file;
import std.process;
import std.stdio;
import std.string;

void main()
{
	writeln(scanDrive("C:\\Users", true).data.length);
}

alias Appender!(DirEntry[]) DirEntryAppender;

DirEntryAppender scanDrive(string drive, bool saving)
{
	bool b = (drive == "C:\\Users\\All Users\\Application Data");
	string[] names;
	DirEntryAppender entries;
	try
	{
		foreach (d; dirEntries(drive, SpanMode.shallow))//this is the line that causes the error
		{
		}
	}
	catch (FileException fe)
	{
		return DirEntryAppender([]);
	}
	foreach (d; dirEntries(drive, SpanMode.shallow))
	{
		names ~= d.name;
	}
	if (saving)
	{
		DirEntry d = dirEntry(drive);
		entries.put(d);
		foreach (n; names)
		{
			try
			{
				d = dirEntry(n);
				if (d.isDir && !canFind(d.name, "Windows") && !canFind(d.name, "Program Files") && !canFind(d.name, "ProgramData") && !canFind(d.name, "Vladimir"))
					entries.put(scanDrive(n, saving).data);
				else
					entries.put(d);
			}
			catch (FileException fe)
			{
			}
		}
	}
	return entries;
}

