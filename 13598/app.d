module app;

import std.stdio;
import test;

class Child : Parent
{
  mixin ComponentTemplate;
  @property string childStr(){return "";}
}

void main()
{
  auto child = new Child();
  writeln(child.getParameters());
}
