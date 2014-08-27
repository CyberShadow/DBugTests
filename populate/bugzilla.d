module bugzilla;

import std.algorithm;
import std.array;
import std.ascii;
import std.conv;
import std.exception;
import std.regex : match;
import std.string;

import ae.utils.text;
import ae.net.ietf.headerparse;

struct BugzillaMessage
{
	uint id;
	string url;
	string subject;
	string[string] properties;
	string comment; /// Incl. "header"
}

bool parseMessage(string message, out BugzillaMessage result)
{
	auto lines = message.splitAsciiLines();

	// Parse headers

	auto headerLines = lines.until("").array;
	bool isBugzilla = headerLines.any!(s => s.forceValidUTF8.dup.idup.toUpper.startsWith("X-BUGZILLA-"))();
	if (!isBugzilla)
		return false;

	// Strip "signature"

	auto p = lines.countUntil!(line => line == "--" || line == "-- ");
	enforce(p > 0);
	lines = lines[0..p];

	bool newPost;
	auto headers = parseHeaders(headerLines.join("\n"));
	foreach (name, value; headers)
		if (name.toLower() == "subject")
		{
			auto s = value;
			s.findSkip("] ");
			if (s.startsWith("New: "))
			{
				s = s[5..$];
				newPost = true;
			}
			result.subject = s;
		}

	// First line

	lines = lines[headerLines.length+1..$];
	enforce(lines.length > 2);
	result.url = lines[0];
	enforce(result.url.startsWith("http"));
	result.id = result.url.split("=")[$-1].to!uint();

	// Second line

	if (lines[1].endsWith(", which changed state."))
		return true;
	enforce(lines[1] == "");
	lines = lines[2..$];

	// Properties header

	while (lines.length && lines[0].empty)
		lines = lines[1..$];

	if (lines.length >= 2 && lines[0].endsWith(" changed:") && !isWhite(lines[0][0]))
	{
		enforce(lines[1] == "");
		lines = lines[2..$];
	}

	// Parse properties

	auto meta = lines.until!(s => s.empty || s.match(`^-+ Comment #`)).array;

	string lastName;
	foreach (line; meta)
	{
		string name, value;
		if (line.length > 50 && line[19] == '|')
		{
			auto segments = line.split("|");
			name = segments[0].strip();
			value = segments[2].strip();
		}
		else
		if (line.length > 20 && line[18..20] == ": ")
		{
			name = line[0..18].strip();
			value = line[20..$];
		}
		else
		if (line.length > 21 && line[0..20] == " ".replicate(20) && !isWhite(line[20]))
			value = line[20..$];

		if (name)
		{
			result.properties[name] = value;
			lastName = name;
		}
		else
			result.properties[lastName] ~= " " ~ value;
	}

	lines = lines[meta.length .. $];
	while (lines.length && lines[0].empty)
		lines = lines[1..$];

	// The remaining part must be the comment

	if (lines.length)
		result.comment = lines.map!(s => s~"\n").join();

	//writeln(message);

	return true;
}

/**
 Test TODO:

 Messages:
 - OP
 - Comment without change
 - Comment with change
 - Change without comment?

 Formats:
 - Original (ancient) bugzilla
 - Pre-2014 bugzilla
 - Latest bugzilla
*/

unittest
{
	string msg;
	BugzillaMessage bm;

	/// ###################################### Bugzilla 1/2 ######################################

	// First post

	msg = q"EOF
Path: digitalmars.com!not-for-mail
From: d-bugmail@puremagic.com
Newsgroups: digitalmars.D.bugs
Subject: [Bug 46] New: Included man files should be updated
Date: Mon, 13 Mar 2006 15:19:41 +0000 (UTC)
Organization: Digital Mars
Lines: 29
Message-ID: <bug-46-3@http.d.puremagic.com/bugzilla/>
X-Trace: digitaldaemon.com 1142263181 96179 209.189.198.107 (13 Mar 2006 15:19:41 GMT)
X-Complaints-To: usenet@digitalmars.com
NNTP-Posting-Date: Mon, 13 Mar 2006 15:19:41 +0000 (UTC)
To: digitalmars-d-bugs@puremagic.com
X-Bugzilla-Reason: Forced
X-Bugzilla-Product: D
X-Bugzilla-Component: DMD
Xref: digitalmars.com digitalmars.D.bugs:6653

http://d.puremagic.com/bugzilla/show_bug.cgi?id=46

           Summary: Included man files should be updated
           Product: D
           Version: 0.149
          Platform: All
               URL: http://www.digitalmars.com/d/dcompiler.html
        OS/Version: Linux
            Status: NEW
          Severity: trivial
          Priority: P3
         Component: DMD
        AssignedTo: bugzilla@digitalmars.com
        ReportedBy: unknown@simplemachines.org


The man files included with DMD 0.149 are out of date.  It is my opinion that
if the release contains man files, they should be updated (and, ideally, kept
up to date) with compiler option changes and such.

Updating them is not hard, and I have done so (adding an rdmd as wel); I will
attach them to this bug, if I can, or post a URL in a comment otherwise.

Thanks,
-[Unknown]


-- 
EOF";

	assert(parseMessage(msg, bm));
	assert(bm.comment.startsWith("The man files"), "Unexpected comment: \n" ~ bm.comment);
	assert(bm.comment.strip().endsWith("-[Unknown]"), "Unexpected comment: \n" ~ bm.comment);
	assert(bm.properties["Version"] == "0.149");
	assert(bm.subject == "Included man files should be updated");

	// -------------------------------------------------------------------------------------------

	// Comment (no change)

	msg = q"EOF
Path: digitalmars.com!not-for-mail
From: d-bugmail@puremagic.com
Newsgroups: digitalmars.D.bugs
Subject: [Bug 46] Included man files should be updated
Date: Mon, 13 Mar 2006 15:26:35 +0000 (UTC)
Organization: Digital Mars
Lines: 30
Message-ID: <dv42va$2uhs$1@digitaldaemon.com>
References: <bug-46-3@http.d.puremagic.com/bugzilla/>
X-Trace: digitaldaemon.com 1142263595 96828 209.189.198.107 (13 Mar 2006 15:26:35 GMT)
X-Complaints-To: usenet@digitalmars.com
NNTP-Posting-Date: Mon, 13 Mar 2006 15:26:35 +0000 (UTC)
To: digitalmars-d-bugs@puremagic.com
In-Reply-To: <bug-46-3@http.d.puremagic.com/bugzilla/>
X-Bugzilla-Reason: Forced
X-Bugzilla-Product: D
X-Bugzilla-Component: DMD
Xref: digitalmars.com digitalmars.D.bugs:6654

http://d.puremagic.com/bugzilla/show_bug.cgi?id=46





------- Comment #1 from unknown@simplemachines.org  2006-03-13 09:26 -------
Created an attachment (id=2)
 --> (http://d.puremagic.com/bugzilla/attachment.cgi?id=2&action=view)
Updated man pages for DMD 0.149

The attached archive contains updated man pages, where the changes include:

1. A date and other conventional information added to each page.
2. Pages added for dmd.conf (should go in man5) and rdmd.
3. Page about obj2asm corrected for actual Linux behavior.
4. Spacing and formatting of the source groff changed to make editing easier.
5. Output formatting tweaked to show filenames in italics as convention.
6. New changes, flags, and updated wordings folded in.
7. ENVIRONMENT, BUGS, and DESCRIPTION sections added for dmd.
8. SEE ALSO references added to all pages.

I tried, as much as possible, to stick with "official" phrasings from the
program itself or website.

-[Unknown]


-- 
EOF";

	assert(parseMessage(msg, bm));
	assert(bm.comment.startsWith("------- Comment #1 from unknown"), "Unexpected comment: \n" ~ bm.comment);
	assert(bm.comment.strip().endsWith("-[Unknown]"), "Unexpected comment: \n" ~ bm.comment);
	assert(bm.properties.length == 0);
	assert(bm.subject == "Included man files should be updated");

	/// ####################################### Bugzilla 3 #######################################

	// First post

	msg = q"EOF
Path: digitalmars.com!.POSTED!not-for-mail
From: d-bugmail@puremagic.com
Newsgroups: digitalmars.D.bugs
Subject: [Issue 11865] New: Unhandled exception does not show crash dialog
Date: Sun, 5 Jan 2014 02:16:18 +0000 (UTC)
Organization: Digital Mars
Lines: 57
Message-ID: <bug-11865-3@https.d.puremagic.com/issues/>
Content-Type: text/plain; charset=utf-8
X-Trace: digitalmars.com 1388888178 34715 173.45.241.208 (5 Jan 2014 02:16:18 GMT)
X-Complaints-To: usenet@digitalmars.com
NNTP-Posting-Date: Sun, 5 Jan 2014 02:16:18 +0000 (UTC)
To: digitalmars-d-bugs@puremagic.com
X-Bugzilla-Reason: Forced
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: D
X-Bugzilla-Component: druntime
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jminer7@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Priority: P2
X-Bugzilla-Assigned-To: nobody@puremagic.com
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Changed-Fields: 
Xref: digitalmars.com digitalmars.D.bugs:60562

https://d.puremagic.com/issues/show_bug.cgi?id=11865

           Summary: Unhandled exception does not show crash dialog
           Product: D
           Version: D2
          Platform: All
        OS/Version: Windows
            Status: NEW
          Severity: normal
          Priority: P2
         Component: druntime
        AssignedTo: nobody@puremagic.com
        ReportedBy: jminer7@gmail.com


--- Comment #0 from Jordan Miner <jminer7@gmail.com> 2014-01-04 18:16:11 PST ---
I just spent a couple hours trying to figure out why a Windows program would
run from Command Prompt but not when double clicked from Explorer. Evidently,
trying to write to stdout results in Tango throwing an exception if the program
is started by double clicking, but not when run from the console.

It took me a while to figure out because by default a non-console program
silently swallows an unhandled exception, and the process just disappears.
Programs on Windows normally show a "ProgramName has stopped working" dialog
when they crash. This happens by default for any program (even console
programs) written in C, C++, or .NET without the programmer doing anything. I
believe Windows Error Reporting shows the dialog:

http://msdn.microsoft.com/en-us/library/windows/desktop/bb513641%28v=vs.85%29.aspx

The crash dialog usually supports uploading stack traces to MS servers, but at
a minimum, the native crash dialog should show. (I would want to upload stack
traces to my own server instead of Microsoft's because you have to buy a
VeriSign certificate to access the traces on Microsoft's site. That would
probably take a separate project, like Google Breakpad.)

To reproduce, compile this program:

extern(Windows)
int MessageBoxW(void* hWnd, const(wchar)* lpText, const(wchar)* lpCaption, uint
uType);

void main() {
    throw new Exception("You can't see this.");
    MessageBoxW(null, "The program opened.", "Opened", 0);
}

using this command:

rdmd -ofmain.exe -L/EXETYPE:NT -L/SUBSYSTEM:WINDOWS:4.0 main.d

Try double clicking it in Explorer, and you don't see the message box or a
crash dialog.

-- 
Configure issuemail: https://d.puremagic.com/issues/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
EOF";

	assert(parseMessage(msg, bm));
	assert(bm.id == 11865);
	assert(bm.comment.startsWith("--- Comment #0 from Jordan"), "Unexpected comment: \n" ~ bm.comment);
	assert(bm.comment.strip().endsWith("crash dialog."), "Unexpected comment: \n" ~ bm.comment);
	assert(bm.properties["Version"] == "D2");
	assert(bm.subject == "Unhandled exception does not show crash dialog");

	// Change with comment

	msg = q"EOF
Path: digitalmars.com!.POSTED!not-for-mail
From: d-bugmail@puremagic.com
Newsgroups: digitalmars.D.bugs
Subject: [Issue 11865] Unhandled exception does not show crash dialog
Date: Sun, 5 Jan 2014 06:51:52 +0000 (UTC)
Organization: Digital Mars
Lines: 26
Message-ID: <laave8$1jo6$1@digitalmars.com>
References: <bug-11865-3@https.d.puremagic.com/issues/>
Content-Type: text/plain; charset=utf-8
X-Trace: digitalmars.com 1388904712 52998 173.45.241.208 (5 Jan 2014 06:51:52 GMT)
X-Complaints-To: usenet@digitalmars.com
NNTP-Posting-Date: Sun, 5 Jan 2014 06:51:52 +0000 (UTC)
To: digitalmars-d-bugs@puremagic.com
X-Bugzilla-Reason: Forced
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: D
X-Bugzilla-Component: druntime
X-Bugzilla-Keywords: pull
X-Bugzilla-Severity: normal
X-Bugzilla-Who: thecybershadow@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Priority: P2
X-Bugzilla-Assigned-To: nobody@puremagic.com
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Changed-Fields: Keywords CC
In-Reply-To: <bug-11865-3@https.d.puremagic.com/issues/>
Xref: digitalmars.com digitalmars.D.bugs:60567

https://d.puremagic.com/issues/show_bug.cgi?id=11865


Vladimir Panteleev <thecybershadow@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Keywords|                            |pull
                 CC|                            |thecybershadow@gmail.com


--- Comment #1 from Vladimir Panteleev <thecybershadow@gmail.com> 2014-01-05 08:51:42 EET ---
https://github.com/D-Programming-Language/druntime/pull/703

With this patch, we'll show the uncaught exception details in a standard
Windows message box. These are usually more useful than the standard Windows
crash dialog, since they contain the exception type, the exception message, and
(if the program was compiled with debug info), a stack trace.

Currently it is not possible to disable the D standard top-level exception
handler from within the program or via a compiler/linker switch. It is disabled
automatically if the program was started under a debugger, though.

-- 
Configure issuemail: https://d.puremagic.com/issues/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
EOF";

	assert(parseMessage(msg, bm));
	assert(bm.id == 11865);
	assert(bm.comment.startsWith("--- Comment #1 from Vladimir"), "Unexpected comment start: \n" ~ bm.comment);
	assert(bm.comment.strip().endsWith(", though."), "Unexpected comment end: \n" ~ bm.comment);
	assert(bm.properties["Keywords"] == "pull");
	assert(bm.subject == "Unhandled exception does not show crash dialog");

	/// ####################################### Bugzilla 4 #######################################

	// First post

	msg = q"EOF
Path: digitalmars.com!.POSTED!not-for-mail
From: d-bugmail@puremagic.com
Newsgroups: digitalmars.D.bugs
Subject: [Issue 12550] New: Deprecate -noboundscheck and replace with more useful -boundscheck= option
Date: Tue, 8 Apr 2014 21:47:41 +0000 (UTC)
Organization: Digital Mars
Lines: 39
Message-ID: <bug-12550-3@https.d.puremagic.com/issues/>
Content-Type: text/plain; charset=utf-8
X-Trace: digitalmars.com 1396993661 20412 173.45.241.208 (8 Apr 2014 21:47:41 GMT)
X-Complaints-To: usenet@digitalmars.com
NNTP-Posting-Date: Tue, 8 Apr 2014 21:47:41 +0000 (UTC)
To: digitalmars-d-bugs@puremagic.com
X-Bugzilla-Reason: Forced
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: D
X-Bugzilla-Component: DMD
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: eco@gnuk.net
X-Bugzilla-Status: NEW
X-Bugzilla-Priority: P2
X-Bugzilla-Assigned-To: nobody@puremagic.com
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Changed-Fields: 
Xref: digitalmars.com digitalmars.D.bugs:64164

https://d.puremagic.com/issues/show_bug.cgi?id=12550

           Summary: Deprecate -noboundscheck and replace with more useful
                    -boundscheck= option
           Product: D
           Version: D2
          Platform: All
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: P2
         Component: DMD
        AssignedTo: nobody@puremagic.com
        ReportedBy: eco@gnuk.net


--- Comment #0 from Brad Anderson <eco@gnuk.net> 2014-04-08 14:47:38 PDT ---
-noboundscheck should be deprecated and replaced with
-boundscheck=<all|safe|none> for a couple of reasons.

1. What -noboundscheck actually does is confusing. Its purpose is to turn off
bounds checking in @safe code (and all other code) which comes as a surprise to
a lot of people. -release turns off bounds checking in non-@safe code (which
also surprises some people) but leaves it on for @safe code.
2. There is currently no way to turn on bounds checking for release builds
currently.
3. There is currently no way to turn off bounds checking for non-@safe code
without pulling in everything -release does (or turning off bounds checking for
@safe code too).

If we want to take this one step further there should be command line options
(both enabling and disabling) for every effect -release has and -release should
just be an alias for specifying a set of those options.

(Martin Krejcirik came up with the idea for -boundscheck=)

-- 
Configure issuemail: https://d.puremagic.com/issues/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
EOF";

	assert(parseMessage(msg, bm));
	assert(bm.comment.startsWith("--- Comment #0 from Brad Anderson"), "Bad comment start: \n" ~ bm.comment);
	assert(bm.comment.endsWith("came up with the idea for -boundscheck=)\n\n"), "Bad comment end: \n" ~ bm.comment);
	assert(bm.properties["Severity"] == "normal");
	assert(bm.properties["Summary"] == bm.subject);

	// -------------------------------------------------------------------------------------------

	// Change without comment

	msg = q"EOF
Path: digitalmars.com!.POSTED!not-for-mail
From: via Digitalmars-d-bugs <digitalmars-d-bugs@puremagic.com>
Newsgroups: digitalmars.D.bugs
Subject: [Issue 2634] Function literals are non-constant.
Date: Fri, 18 Apr 2014 09:12:06 +0000
Organization: Digital Mars
Lines: 9
Message-ID: <mailman.273.1397815281.2763.digitalmars-d-bugs@puremagic.com>
References: <bug-2634-3@https.issues.dlang.org/>
Reply-To: "digitalmars.D.bugs" <digitalmars-d-bugs@puremagic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Trace: digitalmars.com 1397815282 16504 173.45.241.208 (18 Apr 2014 10:01:22 GMT)
X-Complaints-To: usenet@digitalmars.com
NNTP-Posting-Date: Fri, 18 Apr 2014 10:01:22 +0000 (UTC)
To: digitalmars-d-bugs@puremagic.com
X-Bugzilla-Reason: Forced
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: D
X-Bugzilla-Component: DMD
X-Bugzilla-Version: D1
X-Bugzilla-Keywords: rejects-valid
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bugzilla@digitalmars.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Priority: P2
X-Bugzilla-Assigned-To: nobody@puremagic.com
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: version
In-Reply-To: <bug-2634-3@https.issues.dlang.org/>
X-Bugzilla-URL: https://issues.dlang.org/
Auto-Submitted: auto-generated
X-Virus-Scanned: clamav-milter 0.97.8 at slice-1.puremagic.com
X-Virus-Status: Clean
X-Spam-Status: No, score=1.3 required=15.0 tests=RDNS_DYNAMIC,SPF_FAIL
 autolearn=no version=3.3.2
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
 slice-1.puremagic.com
X-BeenThere: digitalmars-d-bugs@puremagic.com
X-Mailman-Version: 2.1.16
Precedence: list
List-Id: "digitalmars.D.bugs" <digitalmars-d-bugs.puremagic.com>
List-Unsubscribe: <http://lists.puremagic.com/cgi-bin/mailman/options/digitalmars-d-bugs>, 
 <mailto:digitalmars-d-bugs-request@puremagic.com?subject=unsubscribe>
List-Archive: <http://lists.puremagic.com/pipermail/digitalmars-d-bugs/>
List-Post: <mailto:digitalmars-d-bugs@puremagic.com>
List-Help: <mailto:digitalmars-d-bugs-request@puremagic.com?subject=help>
List-Subscribe: <http://lists.puremagic.com/cgi-bin/mailman/listinfo/digitalmars-d-bugs>, 
 <mailto:digitalmars-d-bugs-request@puremagic.com?subject=subscribe>
Xref: digitalmars.com digitalmars.D.bugs:64538

https://issues.dlang.org/show_bug.cgi?id=2634

Walter Bright <bugzilla@digitalmars.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Version|1.046                       |D1

--
EOF";

	assert(parseMessage(msg, bm));
	assert(bm.comment is null, "Unexpected comment: \n" ~ bm.comment);
	assert(bm.properties["Version"] == "D1");

	// -------------------------------------------------------------------------------------------

	// Change with comment

	msg = q"EOF
Path: digitalmars.com!.POSTED!not-for-mail
From: d-bugmail@puremagic.com
Newsgroups: digitalmars.D.bugs
Subject: [Issue 12467] Regression (2.066 git-head): char[] is implicitly
 convertible to string
Date: Wed, 16 Apr 2014 10:44:23 +0000
Organization: Digital Mars
Lines: 12
Message-ID: <mailman.92.1397645074.2763.digitalmars-d-bugs@puremagic.com>
References: <bug-12467-3@https.issues.dlang.org/>
Reply-To: "digitalmars.D.bugs" <digitalmars-d-bugs@puremagic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Trace: digitalmars.com 1397645074 68506 173.45.241.208 (16 Apr 2014 10:44:34 GMT)
X-Complaints-To: usenet@digitalmars.com
NNTP-Posting-Date: Wed, 16 Apr 2014 10:44:34 +0000 (UTC)
To: digitalmars-d-bugs@puremagic.com
X-Bugzilla-Reason: Forced
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: D
X-Bugzilla-Component: DMD
X-Bugzilla-Version: D2
X-Bugzilla-Keywords: accepts-invalid, pull
X-Bugzilla-Severity: regression
X-Bugzilla-Who: k.hara.pg@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Priority: P2
X-Bugzilla-Assigned-To: nobody@puremagic.com
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: keywords
In-Reply-To: <bug-12467-3@https.issues.dlang.org/>
X-Bugzilla-URL: https://issues.dlang.org/
Auto-Submitted: auto-generated
X-Virus-Scanned: clamav-milter 0.97.8 at slice-1.puremagic.com
X-Virus-Status: Clean
X-Spam-Status: No, score=1.3 required=15.0 tests=RDNS_DYNAMIC,SPF_FAIL
 autolearn=no version=3.3.2
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
 slice-1.puremagic.com
X-BeenThere: digitalmars-d-bugs@puremagic.com
X-Mailman-Version: 2.1.16
Precedence: list
List-Id: "digitalmars.D.bugs" <digitalmars-d-bugs.puremagic.com>
List-Unsubscribe: <http://lists.puremagic.com/cgi-bin/mailman/options/digitalmars-d-bugs>, 
 <mailto:digitalmars-d-bugs-request@puremagic.com?subject=unsubscribe>
List-Archive: <http://lists.puremagic.com/pipermail/digitalmars-d-bugs/>
List-Post: <mailto:digitalmars-d-bugs@puremagic.com>
List-Help: <mailto:digitalmars-d-bugs-request@puremagic.com?subject=help>
List-Subscribe: <http://lists.puremagic.com/cgi-bin/mailman/listinfo/digitalmars-d-bugs>, 
 <mailto:digitalmars-d-bugs-request@puremagic.com?subject=subscribe>
Xref: digitalmars.com digitalmars.D.bugs:64399

https://issues.dlang.org/show_bug.cgi?id=12467

Kenji Hara <k.hara.pg@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Keywords|                            |accepts-invalid, pull

--- Comment #3 from Kenji Hara <k.hara.pg@gmail.com> ---
https://github.com/D-Programming-Language/dmd/pull/3461

--
EOF";

	assert(parseMessage(msg, bm));
	assert(bm.comment == q"EOF
--- Comment #3 from Kenji Hara <k.hara.pg@gmail.com> ---
https://github.com/D-Programming-Language/dmd/pull/3461

EOF", "Wrong comment:\n" ~ bm.comment);
	assert(bm.properties["Keywords"] == "accepts-invalid, pull");

	/// Wrapped headers

	msg = q"EOF
Path: digitalmars.com!.POSTED!not-for-mail
From: via Digitalmars-d-bugs <digitalmars-d-bugs@puremagic.com>
Newsgroups: digitalmars.D.bugs
Subject: [Issue 12685] New: Refused foreach index type to span the whole
 range of the type
Date: Wed, 30 Apr 2014 11:28:49 +0000
Organization: Digital Mars
Lines: 32
Message-ID: <mailman.49.1398857340.2907.digitalmars-d-bugs@puremagic.com>
Reply-To: "digitalmars.D.bugs" <digitalmars-d-bugs@puremagic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Trace: digitalmars.com 1398857340 41034 173.45.241.208 (30 Apr 2014 11:29:00 GMT)
X-Complaints-To: usenet@digitalmars.com
NNTP-Posting-Date: Wed, 30 Apr 2014 11:29:00 +0000 (UTC)
To: digitalmars-d-bugs@puremagic.com
X-Bugzilla-Reason: Forced
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: D
X-Bugzilla-Component: DMD
X-Bugzilla-Version: D2
X-Bugzilla-Keywords: diagnostic, rejects-valid
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bearophile_hugs@eml.cc
X-Bugzilla-Status: NEW
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: nobody@puremagic.com
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status keywords bug_severity priority component assigned_to
 reporter
X-Bugzilla-URL: https://issues.dlang.org/
Auto-Submitted: auto-generated
X-Virus-Scanned: clamav-milter 0.97.8 at slice-1.puremagic.com
X-Virus-Status: Clean
X-Spam-Status: No, score=1.3 required=15.0 tests=RDNS_DYNAMIC,SPF_FAIL
 autolearn=no version=3.3.2
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
 slice-1.puremagic.com
X-BeenThere: digitalmars-d-bugs@puremagic.com
X-Mailman-Version: 2.1.16
Precedence: list
List-Id: "digitalmars.D.bugs" <digitalmars-d-bugs.puremagic.com>
List-Unsubscribe: <http://lists.puremagic.com/cgi-bin/mailman/options/digitalmars-d-bugs>, 
 <mailto:digitalmars-d-bugs-request@puremagic.com?subject=unsubscribe>
List-Archive: <http://lists.puremagic.com/pipermail/digitalmars-d-bugs/>
List-Post: <mailto:digitalmars-d-bugs@puremagic.com>
List-Help: <mailto:digitalmars-d-bugs-request@puremagic.com?subject=help>
List-Subscribe: <http://lists.puremagic.com/cgi-bin/mailman/listinfo/digitalmars-d-bugs>, 
 <mailto:digitalmars-d-bugs-request@puremagic.com?subject=subscribe>
Xref: digitalmars.com digitalmars.D.bugs:65358

https://issues.dlang.org/show_bug.cgi?id=12685

          Issue ID: 12685
           Summary: Refused foreach index type to span the whole range of
                    the type
           Product: D
           Version: D2
          Hardware: x86
                OS: Windows
            Status: NEW
          Keywords: diagnostic, rejects-valid
          Severity: normal
          Priority: P1
         Component: DMD
          Assignee: nobody@puremagic.com
          Reporter: bearophile_hugs@eml.cc

void main() {
    ubyte[2 ^^ 8] data1;
    foreach (ubyte i, x; data1) {}
    ushort[2 ^^ 16] data2;
    foreach (ushort i, x; data2) {}
}



DMD 2.066alpha gives false error messages:

temp.d(3,5): Error: index type 'ubyte' cannot cover index range 0..256
temp.d(5,5): Error: index type 'ushort' cannot cover index range 0..65536

--
EOF";

	assert(parseMessage(msg, bm));
	assert(bm.subject == bm.properties["Summary"]);
}
