import weka.AK;
import weka.BXX.service_interface;
import weka.BXX.UD;
import weka.CK;
import weka.DK.node;
import weka.DK.node_services;
alias GK = EB!(ME, "thisBucket");
struct IK {
    alias RPCService = KK;
    mixin LK!(MK.ME);

auto doNestedDispatch(string OB)(OutToRefParamTypeTuple!(__traits(getMember, KK, OB))[1 .. $] SK) {
        try __traits(getMember, GK, OB)(SK);
catch             TK;
    }

    mixin UK;

}

