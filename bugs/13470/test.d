public final struct Object
{
    @safe public final pure
    {
        mixin(__ObjCtor("Tangible"));
        mixin(__ObjCtor("Entity"));
        mixin(__ObjCtor("Item"));

        mixin(__ObjChk("is_entity", "OBJ_Entity"));
        mixin(__ObjChk("is_tangible", "OBJ_Tangible"));
        mixin(__ObjChk("is_item", "OBJ_Item"));
    }
    private enum : uint8
    {
        OBJ_Tangible = 0,
        OBJ_Item,
        OBJ_Entity
    }
    uint8 identity=0;
    uint8 flags=0;
    union
    {
        Item Item_;
        Entity Entity_;
        Tangible Tangible_;
    };
}
