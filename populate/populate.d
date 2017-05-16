version(Windows) import core.sys.windows.windows;

import std.algorithm;
import std.array;
import std.datetime;
import std.file;
import std.parallelism;
import std.range;
import std.stdio;
import std.string;

import ae.sys.sqlite3;
import ae.utils.sini;

import bugzilla;

void main(string[] args)
{
	stderr.writeln("Querying database...");

	auto db = new SQLite(config.dfeedDbPath);

	string[] messages;
	foreach (string message; db.prepare("SELECT [Message] FROM [Groups] LEFT JOIN [Posts] ON [Posts].[ID]=[Groups].[ID] WHERE [Group]='digitalmars.D.bugs' ORDER BY [ArtNum]").iterate())
		messages ~= message;

	stderr.writeln("Parsing messages...");
	BugzillaMessage[] bugzillaMessages = new BugzillaMessage[messages.length];
	foreach (i; messages.length.iota.parallel)
		if (!parseMessage(messages[i], bugzillaMessages[i]))
			bugzillaMessages[i].id = 0;

	stderr.writeln("Adding up results...");
	foreach (bm; bugzillaMessages)
		if (bm.id)
			processMessage(bm);

	stderr.writeln("Creating tree...");
	saveResults();
}

__gshared string[string][uint] properties;
__gshared string[uint] comments, subjects, urls;
__gshared SysTime[uint] creationTimes, modificationTimes;

void processMessage(ref BugzillaMessage bm)
{
	comments[bm.id] ~= bm.comment;
	subjects[bm.id] = bm.subject;
	urls[bm.id] = bm.url;
	foreach (k, v; bm.properties)
		properties[bm.id][k] = v;
	if (bm.id !in creationTimes)
		creationTimes[bm.id] = bm.time;
	modificationTimes[bm.id] = bm.time;
}

void saveResults()
{
	string[] descriptions;
	foreach (n; (properties.keys ~ comments.keys).array.sort().uniq.parallel)
	{
		auto dir = "../%d".format(n);

		auto p = properties.get(n, null);
		auto status = p.get("Status", "NEW");
		auto severity = p.get("Severity", "?");

		auto subject = "[%s] %s".format(
			severity,
			subjects.get(n, "?"),
		);

		bool relevant = true;
		if (relevant && status == "RESOLVED")
		{
			relevant = false;
			subject = "[%s:%s]%s".format(
				status.toLower(),
				p.get("Resolution", "?").toLower(),
				subject,
			);
		}
		if (relevant && p.get("Keywords", null).canFind("pull"))
		{
			relevant = false;
			subject = "[pull]" ~ subject;
		}
		if (relevant && p.get("Version", null) == "D1")
		{
			relevant = false;
			subject = "[" ~ p["Version"] ~ "]" ~ subject;
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

		writeIfNecessary("%s/comments.txt".format(dir), comments.get(n, null));
		writeIfNecessary("%s/issue.url".format(dir), "[InternetShortcut]\r\nURL=%s".format(urls[n]));
		writeIfNecessary("%s/issue.desktop".format(dir), "[Desktop Entry]\nURL=%s\nType=Link".format(urls[n]));

		/*{
			auto ct = SysTimeToFILETIME(creationTimes[n]);
			auto mt = SysTimeToFILETIME(modificationTimes[n]);
			SetFileTime
		}*/

		synchronized descriptions ~= "%s %s".format(n, subject);
	}
	std.file.write("../descript.ion", descriptions.join("\n"));
}

void writeIfNecessary(string fn, string data)
{
	if (!fn.exists || fn.getSize() != data.length)
		std.file.write(fn, data);
}

struct ConfigFile
{
	string dfeedDbPath;
}
immutable ConfigFile config;

shared static this()
{
	config = "populate.ini"
		.readText()
		.splitLines()
		.parseStructuredIni!ConfigFile();
}
