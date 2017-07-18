struct V
{
    W w;
    
    struct W
    {
        this(scope ref V v)
        {
            this.v = &v;
        }
        V* v;
    }
}

void main()
{
	V v;
}
