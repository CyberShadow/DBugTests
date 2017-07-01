struct HasUnion
{  
    union
    {
        int a, b;
    }
}

void main()
{
    auto x = new HasUnion();
}
