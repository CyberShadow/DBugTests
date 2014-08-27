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

Each issue's files reside in a directory named by the issue number.
Each directory can contain the following files:

 - `*.d` - test case code.
 - `bisect.ini` - [Digger][4] configuration for regression search.
 - `test.sh` - a test command usable by Digger or [DustMite][5].
   Should exit with non-zero status if the bug occurs with the DMD
   instance in `$PATH`, and zero status otherwise.
   Note that the exit status is reversed for DustMite usage:
   DustMite expects a zero exit status if the bug is still present.
 - `comments.txt` - the comments from the issue's discussion,
   including the original issue description. Created by the
   `populate` program.
 - `issue.url` - an Internet shortcut file linking to the respective
   issue. Created for convenience by the `populate` program.

The `populate` program
----------------------

In the `populate` directory is a program which attempts to dump the
D issue repository to your disk. It does so by parsing messages sent
to the [digitalmars.D.bugs group][1], which it obtains from
[DFeed][2]'s (forum.dlang.org) cache. This is done to avoid excessive
load on the server hosting the D Bugzilla instance: fetching messages
from the NNTP server is considerably more efficient than issuing
tens of thousands of HTTP requests to a PHP webapp.

Usage:

 1. Follow the [DFeed setup instructions][3]
 2. Copy `populate.ini.sample` to `populate.ini` and set the location
    of DFeed's `dfeed.s3db` database file.
 3. Create a script which will run DFeed's `nntpdownload` program,
    and then the `populate` program.

  [1]: http://forum.dlang.org/group/digitalmars.D.bugs
  [2]: https://github.com/CyberShadow/DFeed
  [3]: https://github.com/CyberShadow/DFeed#readme
  [4]: https://github.com/CyberShadow/Digger
  [5]: https://github.com/CyberShadow/DustMite

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
