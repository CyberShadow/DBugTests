unittest
{
    with(factory){
 // !!! Notice unbalanced parenthesis !!!
        auto matcher = seq(name("First", star(value(4)));
        assert(matcher(records));
        assert(records == [ Rec("Last", 8) ]);
    }
}


/// Generic matcher interface
interface Matcher(Stream)
    if(isForwardRange!Stream)
{

}

// The more code the longer is the insane diagnostic

/// Generic matcher interface
interface Matcher(Stream)
    if(isForwardRange!Stream)
{

}

/// Generic matcher interface
interface Matcher(Stream)
    if(isForwardRange!Stream)
{

}

/// Generic matcher interface
interface Matcher(Stream)
    if(isForwardRange!Stream)
{

}
