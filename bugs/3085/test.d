import std.typetuple;
template Trait(alias v) { alias typeof(v) Type; }
alias TypeTuple!(Trait!(42)) List;
List[0].Type var; // -> "no identifier for declarator List[0]"
