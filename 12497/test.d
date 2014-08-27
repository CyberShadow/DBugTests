void foo() {}
void main()
{
    struct S
    {
        mixin(foo());   // MixinDeclaration
    }
    mixin(foo());       // MixinStatement
}
