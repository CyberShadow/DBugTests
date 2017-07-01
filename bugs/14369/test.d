import std.datetime, std.traits;

void main() {
    interface IKeysAPI {
        string create(SysTime expiry = 0);
    }

    alias ParameterDefaultValueTuple!(IKeysAPI.create) ParamDefaults;
}
