module KB;

import std.traits;
import std.conv;
import std.typetuple;
template XL(VL) {
    alias XM = TypeTuple!(__traits(allMembers, VL));

    template AN(int BN) {
            alias AN = XM;
    }

    alias XL = AN!0;
}


template CN(alias DN, bool EN) {
    alias PTT = ParameterTypeTuple!DN;
    alias HN = ParameterStorageClassTuple!DN;
    alias R = ReturnType!DN;

    mixin({
        string s = "alias G = R function(";
        foreach(BN, WI; PTT) static if (HN[BN] == ParameterStorageClass.none)                     s ~= "PTT[" ~ text(BN) ~ "], ";
        s ~= ");";
        return s;
    }());

    alias CN = G;
}


alias OutToRefParamTypeTuple(alias DN, bool EN=false) = ParameterTypeTuple!(CN!(DN, EN));

