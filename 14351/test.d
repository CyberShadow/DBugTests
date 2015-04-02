class B
{
    this(inout int[]) inout { }
}

class D1: B
{
    this(int[] arr) { super(arr); }
}

class D2: B
{
    this(const int[] arr) const { super(arr); }
}

class D3: B
{
    this(inout int[] arr) inout { super(arr); }
}
