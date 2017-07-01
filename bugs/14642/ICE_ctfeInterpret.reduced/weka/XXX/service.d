import KB;
import weka.XXX.service_interface;
import weka.XXX.OB;
import weka.PB;
import weka.QB.node;
import weka.QB.node_services;
alias VB = XB!(ZB, "thisBucket");
struct LC {
    alias RPCService = QC;
    mixin VC!(XC.ZB);

auto doNestedDispatch(string DD)(OutToRefParamTypeTuple!(__traits(getMember, QC, DD))[1 .. $] VD) {
        try __traits(getMember, VB, DD)(VD);
catch             WD;
    }

    mixin SJ;

}

