import std.range;

struct NotRange
{
    int moveAt(T)(T index) { return 0; }
}

struct Range
{
    @property int front() { return 0; }
    void popFront() { }
    @property bool empty() { return false; }

    int moveFront()() { assert(0); }  // never called because it's a template!
}

void main()
{
    NotRange nr;
    // Internal error:
    // std\range.d(6870): Error: template std.array.front does not match any function template declaration. Candidates are:
    nr.moveFront();

    Range r;
    moveFront(r);
}
