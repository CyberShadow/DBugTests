import std.algorithm.comparison;
import std.algorithm.iteration;
import std.algorithm.searching;
import std.algorithm.sorting;
import std.array;
import std.base64;
import std.conv;
import std.file;
import std.format;
import std.path;
import std.regex;
import std.stdio;
import std.string;

import ae.sys.file : ensurePathExists;
import ae.utils.text.html : encodeHtmlEntities;

import bugzilla;
import data;

enum outputDir = "../website";

void main()
{
	stderr.writeln("Reading bugs...");
	auto bugs = readBugs();

	auto ids = bugs.keys.sort().release();
	stderr.writefln("Loaded %d bugs.", ids.length);

	stderr.writeln("Writing stylesheet...");
	writeStylesheet();

	stderr.writeln("Generating bug pages...");
	foreach (i, id; ids)
	{
		if (i % 500 == 0)
			stderr.writefln("  %d / %d ...", i, ids.length);
		writeBugPage(id, bugs[id]);
	}

	stderr.writeln("Generating index page...");
	writeIndexPage(ids, bugs);

	stderr.writeln("Done.");
}

struct GitHubLink
{
	string url;
	string label; // e.g. "dmd#1234"
}

/// Detect GitHub migration URL from comments.
GitHubLink detectGitHubUrl(ref BugInfo info)
{
	enum re = ctRegex!(`THIS ISSUE HAS BEEN MOVED TO GITHUB\s+(https://github\.com/dlang/([^/]+)/issues/(\d+))`);
	foreach (ref comment; info.comments)
	{
		auto m = comment.text.matchFirst(re);
		if (m)
			return GitHubLink(m[1], m[2] ~ "#" ~ m[3]);
	}
	return GitHubLink.init;
}

/// Strip email to display name: use real_name if available, otherwise local part before @.
string displayName(string email, string realName = null)
{
	if (realName.length)
		return realName;
	auto idx = email.indexOf('@');
	if (idx >= 0)
		return email[0 .. idx];
	return email;
}

/// Encode HTML entities (not in attribute context).
string htmlEsc(string s)
{
	return encodeHtmlEntities!false(s);
}

/// Encode HTML entities for use in attributes.
string attrEsc(string s)
{
	return encodeHtmlEntities!true(s);
}

/// HTML-escape plain text with URLs auto-linked.
string htmlEscapeAndLinkUrls(string text)
{
	enum re = ctRegex!(`https?://[^\s<>"]+`);
	auto app = appender!string;
	size_t last = 0;
	foreach (m; text.matchAll(re))
	{
		auto pre = m.pre[last .. $];
		app ~= htmlEsc(pre);
		auto url = m.hit;
		app ~= `<a href="` ~ attrEsc(url) ~ `">` ~ htmlEsc(url) ~ `</a>`;
		last = m.pre.length + m.hit.length;
	}
	app ~= htmlEsc(text[last .. $]);
	return app[];
}

void writeStylesheet()
{
	enum css = `* { box-sizing: border-box; }
body { font-family: system-ui, -apple-system, sans-serif; margin: 0; padding: 20px; background: #fafafa; color: #222; }
.container { max-width: 1200px; margin: 0 auto; }
h1 { margin-top: 0; }
h1 a { color: inherit; text-decoration: none; }
table { width: 100%; border-collapse: collapse; font-size: 14px; }
th, td { padding: 6px 10px; border: 1px solid #ddd; text-align: left; }
th { background: #f0f0f0; position: sticky; top: 0; cursor: pointer; }
tr.open { background: #fffde7; }
tr.resolved { background: #e8f5e9; }
a { color: #1565c0; }
.bug-header { background: #fff; border: 1px solid #ddd; padding: 16px; margin-bottom: 16px; border-radius: 4px; }
.bug-header h1 { font-size: 22px; }
.meta-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(250px, 1fr)); gap: 4px 24px; margin: 12px 0; }
.meta-grid dt { font-weight: 600; margin: 0; }
.meta-grid dd { margin: 0 0 8px 0; }
.github-link { display: inline-block; background: #24292e; color: #fff !important; padding: 4px 10px; border-radius: 4px; font-size: 13px; margin-top: 8px; text-decoration: none; }
.comment { background: #fff; border: 1px solid #ddd; margin-bottom: 12px; border-radius: 4px; }
.comment-header { background: #f6f8fa; padding: 8px 12px; font-size: 13px; border-bottom: 1px solid #ddd; }
.comment-body { padding: 12px; white-space: pre-wrap; word-wrap: break-word; font-family: monospace; font-size: 13px; }
.attachments { background: #fff; border: 1px solid #ddd; padding: 12px; border-radius: 4px; margin-bottom: 16px; }
.attachments table { font-size: 13px; }
.nav { margin-bottom: 12px; font-size: 14px; }
`;

	auto fn = buildPath(outputDir, "style.css");
	ensurePathExists(fn);
	std.file.write(fn, css);
}

void writeIndexPage(int[] ids, ref BugInfo[int] bugs)
{
	auto app = appender!string;

	app ~= `<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>D Language Bugzilla Archive</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<div class="container">
<h1>D Language Bugzilla Archive</h1>
<p>` ~ ids.length.text ~ ` bugs archived from <a href="` ~ site ~ `">` ~ htmlEsc(site) ~ `</a>.</p>
<table>
<thead>
<tr><th>ID</th><th>Status</th><th>Resolution</th><th>Severity</th><th>Component</th><th>GitHub</th><th>Summary</th></tr>
</thead>
<tbody>
`;

	foreach (id; ids)
	{
		auto bug = &bugs[id].bug;
		auto gh = detectGitHubUrl(bugs[id]);
		auto rowClass = bug.is_open ? "open" : "resolved";

		app ~= format!`<tr class="%s">`(rowClass);
		app ~= format!`<td><a href="bugs/%d/">%d</a></td>`(id, id);
		app ~= `<td>` ~ htmlEsc(bug.status) ~ `</td>`;
		app ~= `<td>` ~ htmlEsc(bug.resolution) ~ `</td>`;
		app ~= `<td>` ~ htmlEsc(bug.severity) ~ `</td>`;
		app ~= `<td>` ~ htmlEsc(bug.component) ~ `</td>`;
		if (gh.url.length)
			app ~= `<td><a href="` ~ attrEsc(gh.url) ~ `">` ~ htmlEsc(gh.label) ~ `</a></td>`;
		else
			app ~= `<td></td>`;
		app ~= `<td>` ~ htmlEsc(bug.summary) ~ `</td>`;
		app ~= "</tr>\n";
	}

	app ~= `</tbody>
</table>
</div>
<script>
document.querySelectorAll("th").forEach((th, i) => {
  th.addEventListener("click", () => {
    const table = th.closest("table");
    const tbody = table.querySelector("tbody");
    const rows = Array.from(tbody.querySelectorAll("tr"));
    const dir = th.dataset.dir === "asc" ? "desc" : "asc";
    th.closest("thead").querySelectorAll("th").forEach(h => delete h.dataset.dir);
    th.dataset.dir = dir;
    rows.sort((a, b) => {
      const av = a.children[i].textContent;
      const bv = b.children[i].textContent;
      const an = Number(av), bn = Number(bv);
      if (!isNaN(an) && !isNaN(bn)) return dir === "asc" ? an - bn : bn - an;
      return dir === "asc" ? av.localeCompare(bv) : bv.localeCompare(av);
    });
    rows.forEach(r => tbody.appendChild(r));
  });
});
</script>
</body>
</html>
`;

	auto fn = buildPath(outputDir, "index.html");
	ensurePathExists(fn);
	std.file.write(fn, app[]);
}

void writeBugPage(int id, ref BugInfo info)
{
	auto bug = &info.bug;
	auto gh = detectGitHubUrl(info);

	auto app = appender!string;
	app ~= `<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bug ` ~ id.text ~ ` &ndash; ` ~ htmlEsc(bug.summary) ~ `</title>
<link rel="stylesheet" href="../../style.css">
</head>
<body>
<div class="container">
<div class="nav"><a href="../../">&larr; Back to index</a> | <a href="` ~ attrEsc(site ~ "show_bug.cgi?id=" ~ id.text) ~ `">Original Bugzilla link</a></div>
<div class="bug-header">
<h1>Bug ` ~ id.text ~ ` &ndash; ` ~ htmlEsc(bug.summary) ~ `</h1>
<dl class="meta-grid">
`;

	void meta(string label, string value)
	{
		if (value.length)
			app ~= `<dt>` ~ htmlEsc(label) ~ `</dt><dd>` ~ htmlEsc(value) ~ `</dd>` ~ "\n";
	}

	void metaHtml(string label, string html)
	{
		if (html.length)
			app ~= `<dt>` ~ htmlEsc(label) ~ `</dt><dd>` ~ html ~ `</dd>` ~ "\n";
	}

	meta("Status", bug.status);
	meta("Resolution", bug.resolution);
	meta("Severity", bug.severity);
	meta("Priority", bug.priority);
	meta("Component", bug.component);
	meta("Product", bug.product);
	meta("Version", bug.version_);
	meta("Platform", bug.platform);
	meta("OS", bug.op_sys);
	meta("Creation time", bug.creation_time);
	meta("Last change time", bug.last_change_time);
	meta("Keywords", bug.keywords.join(", "));
	meta("Assigned to", displayName(bug.assigned_to, bug.assigned_to_detail.real_name));
	meta("Creator", displayName(bug.creator, bug.creator_detail.real_name));

	if (bug.depends_on.length)
		metaHtml("Depends on", bug.depends_on.map!(d =>
			format!`<a href="../%d/">%d</a>`(d, d)).join(", "));
	if (bug.blocks.length)
		metaHtml("Blocks", bug.blocks.map!(b =>
			format!`<a href="../%d/">%d</a>`(b, b)).join(", "));
	if (bug.see_also.length)
		metaHtml("See also", bug.see_also.map!(u =>
			`<a href="` ~ attrEsc(u) ~ `">` ~ htmlEsc(u) ~ `</a>`).join(", "));

	app ~= `</dl>` ~ "\n";

	if (gh.url.length)
		app ~= `<a class="github-link" href="` ~ attrEsc(gh.url) ~ `">Moved to GitHub: ` ~ htmlEsc(gh.label) ~ ` &rarr;</a>` ~ "\n";

	app ~= `</div>` ~ "\n";

	// Attachments
	if (info.attachments.length)
	{
		app ~= `<div class="attachments"><h3>Attachments</h3><table>
<tr><th>ID</th><th>Filename</th><th>Summary</th><th>Content-Type</th><th>Size</th></tr>
`;
		foreach (ref att; info.attachments)
		{
			auto attPath = format!"%s/bugs/%d/attachments/%d/%s"(outputDir, id, att.id, att.file_name);
			ensurePathExists(attPath);
			std.file.write(attPath, Base64.decode(att.data));

			auto attHref = format!"attachments/%d/%s"(att.id, att.file_name);
			app ~= `<tr>`;
			app ~= `<td>` ~ att.id.text ~ `</td>`;
			app ~= `<td><a href="` ~ attrEsc(attHref) ~ `">` ~ htmlEsc(att.file_name) ~ `</a></td>`;
			app ~= `<td>` ~ htmlEsc(att.summary) ~ `</td>`;
			app ~= `<td>` ~ htmlEsc(att.content_type) ~ `</td>`;
			app ~= `<td>` ~ att.size.text ~ `</td>`;
			app ~= "</tr>\n";
		}
		app ~= `</table></div>` ~ "\n";
	}

	// Comments
	if (info.comments.length)
	{
		app ~= `<h2>Comments</h2>` ~ "\n";
		foreach (ref comment; info.comments)
		{
			auto author = displayName(comment.creator);
			app ~= `<div class="comment">`;
			app ~= `<div class="comment-header"><strong>Comment #` ~ comment.count.text ~ `</strong> by ` ~ htmlEsc(author) ~ ` &mdash; ` ~ htmlEsc(comment.creation_time) ~ `</div>`;
			app ~= `<div class="comment-body">` ~ htmlEscapeAndLinkUrls(comment.text) ~ `</div>`;
			app ~= "</div>\n";
		}
	}

	app ~= `</div>
</body>
</html>
`;

	auto fn = format!"%s/bugs/%d/index.html"(outputDir, id);
	ensurePathExists(fn);
	std.file.write(fn, app[]);
}
