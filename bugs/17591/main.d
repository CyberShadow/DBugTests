void main(){
  string file=`./libfoo.so`;
  import core.sys.posix.dlfcn;
  import std.string:toStringz;
  auto flag=RTLD_LAZY | RTLD_LOCAL;
  auto handle=dlopen(file.toStringz, flag);
  assert(handle);
  int ret=dlclose(handle);
  assert(!ret);
  import std.stdio;
  writeln("ok");
  // segfaults before process finishes
}
