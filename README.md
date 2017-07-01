Curated D issue test case database
==================================

This repository contains curated test cases from the
[D issue tracker](http://issues.dlang.org/).
It contains machine-readable code snippets and test scripts
necessary to reproduce the reported bugs.

Motivation
----------

 - Automatically finding open issues that have already been fixed
 - Automatically detecting if a filed bug is actually a regression
 - Aiding assisted regression search and test case minimization

Structure
---------

Each issue's files reside in a subdirectory (under the `bugs`
directory) named by the issue number.

Each subdirectory can contain the following files:

 - `*.d` - test case code.
 - `bisect.ini` - [Digger][2] configuration for regression search.
 - `test.sh` - a test command usable by Digger or [DustMite][3].
   Should exit with non-zero status if the bug occurs with the DMD
   instance in `$PATH`, and zero status otherwise.
   Note that the exit status is reversed for DustMite usage:
   DustMite expects a zero exit status if the bug is still present.
 - `comments.txt` - the comments from the issue's discussion,
   including the original issue description. Created by the
   `populate` program.
 - `issue.url`, `issue.desktop` - an Internet shortcut file linking to
   the respective issue. Created for convenience by the `populate`
   program.
 - `bug.json` - machine readable data of the bug. Created by the
   `populate` program.

The `populate` program
----------------------

In the `populate` directory is a program which attempts to dump the
D issue repository to your disk, using the [Bugzilla Webservice API][1].

Run this program to populate the `bugs` directory as described above.

On the first run, it will download the entire Bugzilla database, but
on successive runs it will only download incremental updates of the
bugs modified since the previous run.

  [1]: https://www.bugzilla.org/docs/4.4/en/html/api/Bugzilla/WebService.html
  [2]: https://github.com/CyberShadow/Digger
  [3]: https://github.com/CyberShadow/DustMite

Current goals
-------------

 - Move test commands from existing `bisect.ini` files into `test.sh`
   files
 - General cleanup of existing files
 - Extract test cases from open bugs with keywords:
    - ice
    - rejects-valid
    - accepts-invalid
    - wrong-code
    - link-failure
