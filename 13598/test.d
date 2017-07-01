module test;

enum isPublic(alias e) = __traits(getProtection, e) == "public";

template Params(this MyType)
{
  string[] Params()
  {
    pragma(msg, "Reference: " ~ MyType.stringof);
    /*pragma(msg, __traits(getProtection, __traits(getMember, MyType,
"childStr")));*/
    pragma(msg, isPublic!(__traits(getMember, MyType, "childStr")));            
    return [];
  }
}


mixin template ComponentTemplate()
{
  private enum parameters = Params!(typeof(this));
  string[] getParameters()
  {
     return parameters;
  }
}

class Parent
{
  @property string parentStr(){return "";}
}
