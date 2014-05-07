import core.sys.windows.windows;

import std.algorithm;
import std.array;
import std.file;
import std.stdio;
import std.string;

import ae.sys.sqlite3;

import bugzilla;

void main(string[] args)
{
	stderr.writeln("Parsing database...");

	auto db = new SQLite(`C:\Projects\DFeed\data\dfeed.s3db`);

	foreach (string message; db.prepare("SELECT [Message] FROM [Groups] LEFT JOIN [Posts] ON [Posts].[ID]=[Groups].[ID] WHERE [Group]='digitalmars.D.bugs' ORDER BY [ArtNum]").iterate())
		processMessage(message);

	stderr.writeln("Creating tree...");
	saveResults();
}

string[string][uint] properties;
string[uint] comments, subjects, urls;

void processMessage(string message)
{
    scope(failure) writeln(message);

	BugzillaMessage bm;
	if (parseMessage(message, bm))
	{
		comments[bm.id] ~= bm.comment;
		subjects[bm.id] = bm.subject;
		urls[bm.id] = bm.url;
		foreach (k, v; bm.properties)
			properties[bm.id][k] = v;
	}
}

void saveResults()
{
	string[] descriptions;
	foreach (n; (properties.keys ~ comments.keys).array.sort.uniq)
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
		dir.setAttributes(FILE_ATTRIBUTE_DIRECTORY
			| (!relevant ? FILE_ATTRIBUTE_HIDDEN : 0)
			| (important ? FILE_ATTRIBUTE_OFFLINE : 0)
		);

		writeIfNecessary("%s/comments.txt".format(dir), comments.get(n, null));
		writeIfNecessary("%s/issue.url".format(dir), "[InternetShortcut]\r\nURL=%s".format(urls[n]));

		descriptions ~= "%s %s".format(n, subject);
	}
	std.file.write("../descript.ion", descriptions.join("\n"));
}

void writeIfNecessary(string fn, string data)
{
	if (!fn.exists || fn.getSize() != data.length)
		std.file.write(fn, data);
}
