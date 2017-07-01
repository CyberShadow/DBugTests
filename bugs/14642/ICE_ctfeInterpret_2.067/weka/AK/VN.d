import BE;
import weka.DE.HE;
import TM.BF;
bool WN(JB)(JB , ZK , AL , bool ) {
    alias YM = JB;
    enum XN = XM!YM;
        foreach(YN; XN) __traits(getOverloads, JB, YN);
}

void AO() {
}

struct BO(JB, ushort CO) {
    JB DO;
RM EO(KL* FO, ZK GO) {
        auto HO = FO.LL!"RPC_SERVER"(GO.UL);
WN(DO, GO, HO, false);
    }
}

template UK() {
static JO(KO)() {
        string s ;
        alias XN = XM!RPCService;
        foreach(YN; XN)                 s ~= "auto " ~ YN ~ "(OutToRefParamTypeTuple!(RPCService." ~ YN ~ ") args) {\n"                 "    return doNestedDispatch!(\"" ~ YN ~ "\")(args);\n"                 "}\n";
        return s;
    }

    mixin(JO!(typeof(this)));
}


