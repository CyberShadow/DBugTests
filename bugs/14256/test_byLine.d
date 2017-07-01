import std.stdio;
import std.string;

int main(string[] args)
{
  if (args.length < 2) {
    return 1;
  }
  auto infile = File(args[1]);
  uint linect = 0;
  foreach (line; infile.byLine())
    linect += 1;
  writeln("There are: ", linect, " lines.");
  return 0;
}
