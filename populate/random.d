import std.algorithm.iteration;
import std.algorithm.searching;
import std.array;
import std.conv;
import std.datetime.date;
import std.datetime.systime;
import std.exception;
import std.file;
import std.getopt;
import std.math;
import std.path;
import std.process;
import std.random;
import std.range.primitives;
import std.stdio;
import std.string;

import ae.sys.file;
import ae.utils.meta;
import ae.utils.time;

alias seenFile = issue =>
	thisExePath
	.dirName
	.dirName
	.buildPath("bugs", issue, ".seen");

alias openIssue = line => !line.canFind("[resolved:") && !line.canFind("[?]") && !line.canFind("[pull]");

void main(string[] args)
{
	bool progress;
	getopt(args,
		"progress", &progress,
	);

	auto lines =
		thisExePath
		.dirName
		.dirName
		.buildPath("bugs/descript.ion")
		.readText()
		.splitLines()
	;

	if (progress)
	{
		enum topIssue = 17500;
		long totalIssues = lines
			.filter!openIssue
			.map!(line => line.split[0])
			.filter!(issue => issue.to!int < topIssue)
			.walkLength;
		long seenIssues = lines
			.filter!openIssue
			.map!(line => line.split[0])
			.filter!(issue => issue.to!int < topIssue)
			.filter!(issue => issue.seenFile.exists)
			.walkLength;
		auto issueProgress = real(seenIssues) / totalIssues;

		writefln("Progress: %d/%d (%d%%)", seenIssues, totalIssues, cast(int)(issueProgress * 100));

		SysTime startTime = SysTime(Date(2017, 06, 15));
		SysTime endTime   = SysTime(Date(2018, 04, 01));
		SysTime now = Clock.currTime();
		auto totalTime = endTime - startTime;
		auto elapsed = now - startTime;
		auto timeProgress = real(elapsed.stdTime) / totalTime.stdTime;

		writefln("Time: %d%%", cast(int)(100*timeProgress));

		auto delta = timeProgress - issueProgress;
		writefln!"You are %s (by %d%% / %d days / %d issues)"(
			delta > 0 ? "behind" : "ahead",
			cast(int)(100 * abs(delta)),
			cast(long)(abs(delta) * totalTime.stdTime).hnsecs.total!"days",
			cast(long)(abs(delta) * totalIssues),
		);

		return;
	}

	auto issue = lines
		.randomCover
		.filter!openIssue
		.map!(line => line.split[0])
		.filter!(issue => !issue.seenFile.exists)
		.front
	;

	spawnProcess(["emacsclient",
			"--no-wait",
			thisExePath
			.dirName
			.dirName
			.buildPath("bugs", issue)])
		.wait()
		.I!(code => enforce(code == 0, "emacsclient failed"));

	issue
		.I!(issue => "https://issues.dlang.org/show_bug.cgi?id=" ~ issue)
		.browse();

	issue
		.seenFile
		.touch;
}
