module main;

import core.thread;
import core.memory;

//Broken:
pragma(msg, __traits(allMembers, core));
//Seems to work:
pragma(msg, __traits(allMembers, core.thread));

void main() {}
