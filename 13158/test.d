import std.variant;

struct Node
{
    struct Pair
    {
        Node value;
    }

    alias Algebraic!(Node[], int) Value;
}

void main(string[] args)
{
}
