import std.getopt;
import std.stdio : stderr;

import bugzilla;
import data;

void main(string[] args)
{
	bool rebuild;
	getopt(args,
		"rebuild", &rebuild,
	);

	BugInfo[int] bugs;
	if (rebuild)
		bugs = readBugs();
	else
		bugs = updateBugs();

	stderr.writeln("Creating tree...");
	saveResults(bugs);
}
