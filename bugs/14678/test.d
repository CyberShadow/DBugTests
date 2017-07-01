enum AstTypeKind {
    Foo,
    Bar,
}

struct AstType {
    mixin TypeMixin!(AstTypeKind, Payload);

    this(AstTypeKind) {
    }

    import othermodule;
}

alias ParamAstType = AstType.ParamType;

union Payload {
    ParamAstType* params;
}

template TypeMixin(K, Payload) {

    Payload payload;

    alias ParamType = PackedType!(typeof(this));

    struct PackedType(T, U...) {

        Payload payload;

        auto getType() {
            return T(AstTypeKind.Foo);
        }
    }
}
