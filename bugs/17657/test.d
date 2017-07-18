import std.stdio;
import std.typecons;

void main ()
{
   Nullable!int i;
   if (i.isNull) {
      "X".writeln;
      int j = i;
   }
}
