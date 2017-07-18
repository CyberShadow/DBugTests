import core.sys.posix.sys.stat;
extern(C++):
struct stat;
void myFunc(stat*){}

pragma(msg, myFunc.mangleof);
