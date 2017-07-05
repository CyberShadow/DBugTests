import std.stdio;

long post = 0;

struct Node
{
  uint val;

  this(this) { ++post; }
}

union POD(T)
{
  T val;
}

POD!Node g;

void Put(ref Node val)
{
  g = cast(POD!Node)val;
}

void main()
{
  auto x = Node(5);
  x.Put();
  post.writeln;
}
