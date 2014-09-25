import std.typecons;

mixin template WorkingTypedef(string i,T,T init=T.init)/+if(...)+/{
    mixin Typedef!(T,init);
    mixin(`alias Typedef `~i~`;`);
}
version(A) mixin WorkingTypedef!("Name2",int,2);
version(B) mixin WorkingTypedef!("Name1",int);
