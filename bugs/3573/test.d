pure foo () {}
pure bar () { return 1; }

pragma(msg, typeof(foo()).stringof);
pragma(msg, typeof(bar()).stringof);
