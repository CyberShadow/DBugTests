import core.stdc.stdlib;
import std.process;
import std.stdio;
void main(){
  writeln(environment["PATH"]);
  core.stdc.stdlib.system("echo $PATH");
  spawnShell("echo $PATH").wait;
  spawnShell("echo $0").wait;  
}
