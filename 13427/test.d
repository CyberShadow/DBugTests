import core.stdc.stdlib;

enum allocaLimit = 1024;

auto wcharPtr(alias str)(void* buffer = 2*(str.length+1) <= allocaLimit ? alloca(2*(str.length+1)) : null)
{
    // ...
}

void main()
{
    wcharPtr!"abc"w;
}
