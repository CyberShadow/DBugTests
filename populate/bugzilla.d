module bugzilla;

import core.thread : Thread;
import core.time;

import std.array;
import std.conv;
import std.datetime.systime;
import std.exception;
import std.range;
import std.stdio : stderr;

import ae.net.ietf.url;
import ae.utils.json;
import ae.utils.time;

enum site = "https://issues.dlang.org/";

T apiCall(T, P)(string method, P params)
{
	import std.net.curl;

	static struct Reply
	{
		string error;
		string id;
		T result;
	}
	string[string] urlParams = [
		"method" : method,
	];
	static if (!is(P == typeof(null)))
		urlParams["params"] = [params].toJson();
	auto url = site ~ "jsonrpc.cgi?" ~ encodeUrlParameters(urlParams);
	scope(failure) stderr.writeln(url);
	char[] jsonText;
	foreach_reverse (attempt; 0 .. 5)
		try
		{
			jsonText = url.get();
			break;
		}
		catch (Exception e)
			if (attempt)
			{
				stderr.writeln("Error: ", e.msg);
				Thread.sleep(15.seconds);
				stderr.writeln("Retrying...");
			}
			else
				throw e;
	scope(failure) stderr.writeln(jsonText);
	auto reply = jsonText.jsonParse!Reply();
	enforce(reply.error is null, "Server error: " ~ reply.error);
	return reply.result;
}

enum timeFormat = `Y-m-d\TH:i:s\Z`;

struct BugMetadata
{
	int id;
	SysTime changedDate;
}

SysTime getTime()
{
	static struct Time
	{
		string db_time;
		string tz_short_name;
		string web_time;
		string tz_name;
		string tz_offset;
		string web_time_utc;
	}
	Time time = apiCall!Time("Bugzilla.time", null);
	return time.db_time.parseTime!timeFormat;
}

static struct Bug
{
	static struct Flag
	{
		int id;
		string name;
		int type_id;
		string creation_date;
		string modification_date;
		string status;
		string setter;
		string requestee;
	}

	struct UserDetail
	{
		string real_name, email, name;
		int id;
	}

	string priority;
	int[] blocks;
	string creator;
	UserDetail creator_detail;
	string last_change_time;
	bool is_cc_accessible;
	string[] keywords;
	string[] cc;
	UserDetail[] cc_detail;
	string url;
	string assigned_to;
	UserDetail assigned_to_detail;
	string[] groups;
	string[] see_also;
	int id;
	string creation_time;
	string whiteboard;
	string qa_contact;
	int[] depends_on;
	int* dupe_of;
	string resolution;
	string classification;
@JSONName("alias")
	string[] aliases;
	string op_sys;
	string status;
	string summary;
	bool is_open;
	string platform;
	string severity;
	Flag[] flags;
@JSONName("version")
	string version_;
	string component;
	bool is_creator_accessible;
	string product;
	string target_milestone;
	bool is_confirmed;
	string deadline;
}

Bug[] getBugs(SysTime since)
{
	/*
	auto url = site ~ "buglist.cgi?" ~ encodeUrlParameters([
			"columnlist" :
			[
				"bug_id",
			//	"product",
			//	"component",
			//	"bug_status",
			//	"resolution",
			//	"short_desc",
				"changeddate",
			//	"longdescs.count",
			].join(","),
			"product" : "D",
			"query_format" : "advanced",
			"ctype" : "csv",
			"limit" : "100000",
		]);
	*/

	Bug[] bugs;

	static struct Params
	{
		int limit = 1000;
		int offset = 0;
		string last_change_time;
	}
	static struct Result
	{
		Bug[] bugs;
	}

	Params params;
	params.last_change_time = since.formatTime!timeFormat;
	while (true)
	{
		stderr.writefln("  Fetching bugs %d through %d...", params.offset, params.offset + params.limit - 1);
		auto result = apiCall!Result("Bug.search", params);
		if (!result.bugs.length)
			break;
		bugs ~= result.bugs;
		params.offset += params.limit;
	}

	return bugs;
}

struct Comment
{
	bool is_private;
	int count;
	string creator;
	int* attachment_id;
	string time;
	int bug_id;
	string author;
	string text;
	string creation_time;
	string id;
	string[] tags;
}

Comment[][int] getComments(int[] ids)
{
	static struct Params
	{
		int[] ids;
	}
	static struct CommentBug
	{
		Comment[] comments;
	}
	static struct Result
	{
		CommentBug[string] bugs;
		Comment[string] comments;
	}

	Comment[][int] comments;

	foreach (chunk; ids.chunks(1000))
	{
		stderr.writefln("  Fetching comments for bugs %d through %d...", chunk[0], chunk[$-1]);
		auto result = apiCall!Result("Bug.comments", Params(chunk));
		foreach (id, bugComments; result.bugs)
			comments[id.to!int] = bugComments.comments;
	}

	return comments;
}

alias base64 = string;
alias dateTime = string;
alias boolean = bool;

struct Attachment
{
	base64 data; /// The raw data of the attachment, encoded as Base64.
	int size; /// The length (in bytes) of the attachment.
	dateTime creation_time; /// The time the attachment was created.
	dateTime last_change_time; /// The last time the attachment was modified.
	int id; /// The numeric id of the attachment.
	int bug_id; /// The numeric id of the bug that the attachment is attached to.
	string file_name; /// The file name of the attachment.
	string summary; /// A short string describing the attachment.
	string description; /// Also returned as description, for backwards-compatibility with older Bugzillas. (However, this backwards-compatibility will go away in Bugzilla 5.0.)
	string content_type; /// The MIME type of the attachment.
	boolean is_private; /// True if the attachment is private (only visible to a certain group called the "insidergroup"), False otherwise.
	boolean is_obsolete; /// True if the attachment is obsolete, False otherwise.
	boolean is_patch; /// True if the attachment is a patch, False otherwise.
	string creator; /// The login name of the user that created the attachment.
	string attacher; /// Also returned as attacher, for backwards-compatibility with older Bugzillas. (However, this backwards-compatibility will go away in Bugzilla 5.0.)
	Flag[] flags; /// An array of hashes containing the information about flags currently set for each attachment.

	///Each flag hash contains the following items:
	struct Flag
	{
		int id; /// The id of the flag.
		string name; /// The name of the flag.
		int type_id; /// The type id of the flag.
		dateTime creation_date; /// The timestamp when this flag was originally created.
		dateTime modification_date; /// The timestamp when the flag was last modified.
		string status; /// The current status of the flag.
		string setter; /// The login name of the user who created or last modified the flag.
		string requestee; /// The login name of the user this flag has been requested to be granted or denied. Note, this field is only returned if a requestee is set.
	}
}

Attachment[][int] getAttachments(int[] ids)
{
	static struct Params
	{
		int[] ids;
	}
	static struct Result
	{
		Attachment[][string] bugs;
		Attachment[string] attachments;
	}

	Attachment[][int] attachments;

	foreach (chunk; ids.chunks(1000))
	{
		stderr.writefln("  Fetching attachments for bugs %d through %d...", chunk[0], chunk[$-1]);
		auto result = apiCall!Result("Bug.attachments", Params(chunk));
		foreach (id, bugAttachments; result.bugs)
			attachments[id.to!int] = bugAttachments;
	}

	return attachments;
}
