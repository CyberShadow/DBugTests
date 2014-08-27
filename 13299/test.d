struct Foo
{
  Foo opDispatch(string name)(int a, int[] b...)
    if(name == "bar")
  {
    return Foo();
  } 

  Foo opDispatch(string name)()
    if(name != "bar")
  {
    return Foo();
  }
}

void main()
{
  Foo().bar(0).bar(0).bar(0);
}
