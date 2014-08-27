version(unittest){
  struct A1(T){}
  struct A2{}
  template A3(T){
    struct A{}
  }
  struct A4(alias fun,T...){}
}

template GetTemplateParent(T : TI!TP, alias TI, TP...)
{
  alias GetTemplateParent = TI;
}
template GetTemplateParent(alias T : TI!TP, alias TI, TP...)
{
  //TODO: how come this doesn't work with functions?
  alias GetTemplateParent = TI;
}

template isTemplateInstantiation(T...) if(T.length==1)
{
  enum isTemplateInstantiation=is(typeof(GetTemplateParent!T));
}
unittest
{
  static assert(isTemplateInstantiation!(A1!double));
  static assert(!isTemplateInstantiation!(A1));
  static assert(!isTemplateInstantiation!(A2));
  static assert(!isTemplateInstantiation!(A3));
  static assert(isTemplateInstantiation!(A3!double));
  static assert(!isTemplateInstantiation!(A3!double.A)); //CT error
  static assert(!isTemplateInstantiation!(int));
}
