struct X(T)
{
    this(S)(in S[] arr) // inferred pure
    { }
}

void main() pure
{
    X!uint mut = [ 1, 2 ]; // proves inference (cf. main is pure)
    immutable X!uint imm1 = [ 1, 2 ];
    auto imm2 = immutable X!uint([1, 2]);
}
