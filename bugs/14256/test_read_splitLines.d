import std.stdio;
import std.string;
import std.file;

int main(string[] args)
{
  if (args.length < 2) {
    return 1;
  }
  auto c = cast(string) read(args[1]);
  auto l = splitLines(c);
  writeln("There are ", l.length, " lines.");
  return 0;
}
