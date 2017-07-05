struct Bug {
    float[] elements = new float[4];

    public this(float[] elements...) {
        this.elements[] = elements[];
    }

    public bool opEquals(const Bug other) {
        return other.elements[] == this.elements[];
    }
}

unittest {
    import std.stdio;
    auto a = Bug(1,2,3,4);

    writeln(a.elements); // Bug([1, 2, 3, 4])
    writeln(a == Bug(0,0,0,0)); // true?? <-- This is where the bug happens.
    writeln(a.elements); // Bug([0, 0, 0, 0])
    assert(a.elements[0] == 1);
}
