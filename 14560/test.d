import std.traits;

struct JsonStringSerializer
{
    void getSerializedResult() { }
}

void serializeToJson(T)(T value)
{
    serialize!(JsonStringSerializer)(value);
}

auto serialize(Serializer, T)(T value)
{
    auto serializer = Serializer();
    serialize(serializer, value);
    return serializer.getSerializedResult;
}

void serialize(Serializer, T)(Serializer serializer, T value)
{
    serializeImpl!(Serializer, T)(serializer, value);
}

void serializeImpl(Serializer, T)(Serializer , T value)
{
    foreach (i; value) { }
}

int main()
{
    serializeToJson(["test"]);
    return 0;
}

