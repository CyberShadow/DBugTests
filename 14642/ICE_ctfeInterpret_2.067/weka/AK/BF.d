module TM.BF;

import std.traits;
import std.conv;
import std.typetuple;
template XM(YM) {
    alias ZM = TypeTuple!(__traits(allMembers, YM));

    template CN(int DN) {
            alias CN = ZM;
    }

    alias XM = CN!0;
}


template EN(alias FN, bool GN) {
    alias PTT = ParameterTypeTuple!FN;
    alias JN = ParameterStorageClassTuple!FN;
    alias R = ReturnType!FN;

    mixin({
        string s = "alias G = R function(";
        foreach(DN, JB; PTT) static if (JN[DN] == ParameterStorageClass.none)                     s ~= "PTT[" ~ text(DN) ~ "], ";
        s ~= ");";
        return s;
    }());

    alias EN = G;
}


alias OutToRefParamTypeTuple(alias FN, bool GN=false) = ParameterTypeTuple!(EN!(FN, GN));

