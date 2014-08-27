struct A1(T){}
template isAliasable(alias T)
{
  enum isAliasable=true;
}
template isAliasable(T)
{
  enum isAliasable=false;
}
void main(){
  alias foo=A1!double; //this works
  static assert(isAliasable!(A1!double)); //ok in 2.064.2; CT error in 2.065 even though previous line ok
}
