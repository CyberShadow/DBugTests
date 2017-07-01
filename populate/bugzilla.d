module bugzilla;

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
	auto jsonText = url.get();
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
static struct Bug
{
	string priority;
	int[] blocks;
	string creator;
	string last_change_time;
	bool is_cc_accessible;
	string[] keywords;
	string[] cc;
	string url;
	string assigned_to;
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
	string alias_;
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

	foreach (chunk; ids.chunks(100))
	{
		stderr.writefln("  Fetching comments for bugs %d through %d...", chunk[0], chunk[$-1]);
		auto result = apiCall!Result("Bug.comments", Params(chunk));
		foreach (id, bugComments; result.bugs)
			comments[id.to!int] = bugComments.comments;
	}

	return comments;
}
