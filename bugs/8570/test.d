import std.typecons;

void bar( ) {
    Tuple!( int, "a", float, "b" ) t = tuple( 1, 2.0 );
}

// And this does not:

Tuple!( int, "a", float, "b" ) foo( ) {
    return tuple( 1, 2.0 );
}
