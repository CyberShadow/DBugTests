import JH;
import weka.SK.TK;
import weka.KB;
bool UL(WI)(WI , IL , ZK , bool ) {
    alias VL = WI;
    enum WL = XL!VL;
        foreach(YL; WL) __traits(getOverloads, WI, YL);
}

void AM() {
}

struct BM(WI, ushort CM) {
    WI DM;
UK EM(YK* FM, IL GM) {
        auto HM = FM.AL!"RPC_SERVER"(GM.QL);
UL(DM, GM, HM, false);
    }
}

template SJ() {
static KM(LM)() {
        string s ;
        alias WL = XL!RPCService;
        foreach(YL; WL)                 s ~= "auto " ~ YL ~ "(OutToRefParamTypeTuple!(RPCService." ~ YL ~ ") args) {\n"                 "    return doNestedDispatch!(\"" ~ YL ~ "\")(args);\n"                 "}\n";
        return s;
    }

    mixin(KM!(typeof(this)));
}


