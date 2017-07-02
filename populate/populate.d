import core.time;

version(Windows) import core.sys.windows.windows;

import std.algorithm.iteration;
import std.algorithm.searching;
import std.array;
import std.base64;
import std.conv;
import std.datetime.systime;
import std.exception;
import std.file;
import std.format;
import std.getopt;
import std.path;
import std.stdio;
import std.string;
import std.typecons;
import std.uni;

import ae.sys.file : ensurePathExists;
import ae.utils.array;
import ae.utils.json;
import ae.utils.time;

import bugzilla;

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

struct BugInfo
{
	Bug bug;
	Comment[] comments;
	Attachment[] attachments;
}

BugInfo[int] updateBugs()
{
	auto startTime = getTime() - 1.seconds;

	enum lastTimeFileName = "last-update.txt";
	auto lastTime = lastTimeFileName.exists
		? lastTimeFileName.readText.to!StdTime.SysTime()
		: SysTime.fromUnixTime(0);
	scope(success)
		startTime.stdTime.text.toFile(lastTimeFileName);

	stderr.writefln("Fetching bugs...");
	Bug[] bugs = getBugs(lastTime);

	stderr.writefln("Fetching comments...");
	auto comments = getComments(bugs.map!(bug => bug.id).array);

	stderr.writefln("Fetching attachments...");
	auto attachments = getAttachments(bugs.map!(bug => bug.id).array);

	BugInfo[int] result;
	foreach (bug; bugs)
		result[bug.id] = BugInfo(
			bug,
			comments.get(bug.id, null),
			attachments.get(bug.id, null),
		);

	stderr.writeln("Saving bug data...");
	foreach (id, ref data; result)
	{
		auto fn = format!"../bugs/%d/data.json"(id);
		ensurePathExists(fn);
		data.toPrettyJson().toFile(fn);
	}

	return result;
}

BugInfo[int] readBugs()
{
	BugInfo[int] result;
	foreach (de; dirEntries("../bugs", SpanMode.shallow))
		if (de.isDir && de.buildPath("data.json").exists)
			result[de.baseName.to!int] = de.buildPath("data.json").readText.jsonParse!BugInfo;
	return result;
}

void saveResults(BugInfo[int] bugs)
{
	enum descriptionFile = "../bugs/descript.ion";
	string[int] descriptions;
	if (descriptionFile.exists)
		descriptions = descriptionFile
			.readText
			.splitLines
			.map!(line => tuple(line.findSplit(" ")[0].to!int, line))
			.assocArray;

	foreach (n, ref bug; bugs)
	{
		auto dir = format!"../bugs/%d"(n);

		auto status = bug.bug.status;
		auto severity = bug.bug.severity;

		auto subject = "[%s] %s".format(
			severity,
			bug.bug.summary,
		);

		bool relevant = true;
		if (relevant && status == "RESOLVED")
		{
			relevant = false;
			subject = "[%s:%s]%s".format(
				status.toLower(),
				bug.bug.resolution.toLower(),
				subject,
			);
		}
		if (relevant && bug.bug.keywords.contains("pull"))
		{
			relevant = false;
			subject = "[pull]" ~ subject;
		}
		if (relevant && bug.bug.version_ == "D1 (retired)")
		{
			relevant = false;
			subject = "[" ~ bug.bug.version_ ~ "]" ~ subject;
		}

		if (!relevant && !dir.exists && n < 12100)
			continue;

		bool important = relevant && severity == "regression";

		mkdirRecurse(dir);

		version(Windows)
		dir.setAttributes(FILE_ATTRIBUTE_DIRECTORY
			| (!relevant ? FILE_ATTRIBUTE_HIDDEN : 0)
			| (important ? FILE_ATTRIBUTE_OFFLINE : 0)
		);

		string comments = bug.comments.map!(comment =>
			format!"--- Comment #%d from <%s> %s ---\n%s\n"(
				comment.count,
				comment.creator,
				comment.creation_time,
				comment.text,
			))
			.join();

		auto url = site ~ "show_bug.cgi?id=" ~ text(n);
		writeIfNecessary("%s/comments.txt".format(dir), comments);
		writeIfNecessary("%s/issue.url".format(dir), "[InternetShortcut]\r\nURL=%s".format(url));
		writeIfNecessary("%s/issue.desktop".format(dir), "[Desktop Entry]\nURL=%s\nType=Link".format(url));

		foreach (attach; bug.attachments)
		{
			enforce(!attach.file_name.contains('/'), "Bad file name: " ~ attach.file_name);

			auto path = dir.buildPath("attachments", attach.id.text, attach.file_name);
			ensurePathExists(path);
			writeIfNecessary(path, Base64.decode(attach.data));
		}

		/*{
			auto ct = SysTimeToFILETIME(creationTimes[n]);
			auto mt = SysTimeToFILETIME(modificationTimes[n]);
			SetFileTime
		}*/

		synchronized descriptions[n] = "%s %s".format(n, subject);
	}
	writeIfNecessary(descriptionFile, descriptions.sortedValues.join("\n"));
}

void writeIfNecessary(string fn, const(void)[] data)
{
	if (!fn.exists || fn.getSize() != data.length || fn.read() != data)
		std.file.write(fn, data);
}
