/** Blah
 Params:
    T = some type
    test = something
*/
template case1(T)
{
  void case1(R)(R test) { }
}

///ditto
alias case2 = case1!int;
