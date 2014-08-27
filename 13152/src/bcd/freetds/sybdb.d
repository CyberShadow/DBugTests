/* THIS FILE GENERATED BY bcd.gen */
module bcd.freetds.sybdb;
const int FALSE = 0;
const int TRUE = 1;
const int DBSAVE = 1;
const int DBNOSAVE = 0;
const int DBNOERR = -1;
const int INT_EXIT = 0;
const int INT_CONTINUE = 1;
const int INT_CANCEL = 2;
const int INT_TIMEOUT = 3;
const int DBMAXNUMLEN = 33;
const int DBMAXNAME = 30;
const int DBVERSION_UNKNOWN = 0;
const int DBVERSION_46 = 1;
const int DBVERSION_100 = 2;
const int DBVERSION_42 = 3;
const int DBVERSION_70 = 4;
const int DBVERSION_80 = 5;
const int DBTDS_UNKNOWN = 0;
const int DBTDS_2_0 = 1;
const int DBTDS_3_4 = 2;
const int DBTDS_4_0 = 3;
const int DBTDS_4_2 = 4;
const int DBTDS_4_6 = 5;
const int DBTDS_4_9_5 = 6;
const int DBTDS_5_0 = 7;
const int DBTDS_7_0 = 8;
const int DBTDS_8_0 = 9;
const int DBTXPLEN = 16;
const int BCPMAXERRS = 1;
const int BCPFIRST = 2;
const int BCPLAST = 3;
const int BCPBATCH = 4;
const int BCPKEEPIDENTITY = 8;
const int BCPLABELED = 5;
const int BCPHINTS = 6;
const int DBCMDNONE = 0;
const int DBCMDPEND = 1;
const int DBCMDSENT = 2;
const double SYBAOPSUMU = 0x4e;
const int SYBAOPAVGU = 0x50;
const int SYBAOPMIN = 0x51;
const int SYBAOPMAX = 0x52;
const int SYBAOPCNT_BIG = 0x09;
const int SYBAOPSTDEV = 0x30;
const int SYBAOPSTDEVP = 0x31;
const int SYBAOPVAR = 0x32;
const int SYBAOPVARP = 0x33;
const int SYBAOPCHECKSUM_AGG = 0x72;
const int DBPARSEONLY = 0;
const int DBESTIMATE = 1;
const int DBSHOWPLAN = 2;
const int DBNOEXEC = 3;
const int DBARITHIGNORE = 4;
const int DBNOCOUNT = 5;
const int DBARITHABORT = 6;
const int DBTEXTLIMIT = 7;
const int DBBROWSE = 8;
const int DBOFFSET = 9;
const int DBSTAT = 10;
const int DBERRLVL = 11;
const int DBCONFIRM = 12;
const int DBSTORPROCID = 13;
const int DBBUFFER = 14;
const int DBNOAUTOFREE = 15;
const int DBROWCOUNT = 16;
const int DBTEXTSIZE = 17;
const int DBNATLANG = 18;
const int DBDATEFORMAT = 19;
const int DBPRPAD = 20;
const int DBPRCOLSEP = 21;
const int DBPRLINELEN = 22;
const int DBPRLINESEP = 23;
const int DBLFCONVERT = 24;
const int DBDATEFIRST = 25;
const int DBCHAINXACTS = 26;
const int DBFIPSFLAG = 27;
const int DBISOLATION = 28;
const int DBAUTH = 29;
const int DBIDENTITY = 30;
const int DBNOIDCOL = 31;
const int DBDATESHORT = 32;
const int DBCLIENTCURSORS = 33;
const int DBSETTIME = 34;
const int DBQUOTEDIDENT = 35;
const int DBNUMOPTIONS = 36;
const int DBPADOFF = 0;
const int DBPADON = 1;
const int OFF = 0;
const int ON = 1;
const int NOSUCHOPTION = 2;
const int MAXOPTTEXT = 32;
const int DBRESULT = 1;
const int DBNOTIFICATION = 2;
const int DBTIMEOUT = 3;
const int DBINTERRUPT = 4;
const int DBTXTSLEN = 8;
const int CHARBIND = 0;
const int STRINGBIND = 1;
const int NTBSTRINGBIND = 2;
const int VARYCHARBIND = 3;
const int TINYBIND = 6;
const int SMALLBIND = 7;
const int INTBIND = 8;
const int FLT8BIND = 9;
const int REALBIND = 10;
const int DATETIMEBIND = 11;
const int SMALLDATETIMEBIND = 12;
const int MONEYBIND = 13;
const int SMALLMONEYBIND = 14;
const int BINARYBIND = 15;
const int BITBIND = 16;
const int NUMERICBIND = 17;
const int DECIMALBIND = 18;
const int DBRPCRETURN = 1;
const int DBRPCDEFAULT = 2;
const int REG_ROW = -1;
const int MORE_ROWS = -1;
const int NO_MORE_ROWS = -2;
const int BUF_FULL = -3;
const int NO_MORE_RESULTS = 2;
const int SUCCEED = 1;
const int FAIL = 0;
const int DB_IN = 1;
const int DB_OUT = 2;
const int DB_QUERYOUT = 3;
const int DBSINGLE = 0;
const int DBDOUBLE = 1;
const int DBBOTH = 2;
const int SYBEICONVIU = 2400;
const int SYBEICONVAVAIL = 2401;
const int SYBEICONVO = 2402;
const int SYBEICONVI = 2403;
const int SYBEICONV2BIG = 2404;
const int SYBESYNC = 20001;
const int SYBEFCON = 20002;
const int SYBETIME = 20003;
const int SYBEREAD = 20004;
const int SYBEBUFL = 20005;
const int SYBEWRIT = 20006;
const int SYBEVMS = 20007;
const int SYBESOCK = 20008;
const int SYBECONN = 20009;
const int SYBEMEM = 20010;
const int SYBEDBPS = 20011;
const int SYBEINTF = 20012;
const int SYBEUHST = 20013;
const int SYBEPWD = 20014;
const int SYBEOPIN = 20015;
const int SYBEINLN = 20016;
const int SYBESEOF = 20017;
const int SYBESMSG = 20018;
const int SYBERPND = 20019;
const int SYBEBTOK = 20020;
const int SYBEITIM = 20021;
const int SYBEOOB = 20022;
const int SYBEBTYP = 20023;
const int SYBEBNCR = 20024;
const int SYBEIICL = 20025;
const int SYBECNOR = 20026;
const int SYBENPRM = 20027;
const int SYBEUVDT = 20028;
const int SYBEUFDT = 20029;
const int SYBEWAID = 20030;
const int SYBECDNS = 20031;
const int SYBEABNC = 20032;
const int SYBEABMT = 20033;
const int SYBEABNP = 20034;
const int SYBEAAMT = 20035;
const int SYBENXID = 20036;
const int SYBERXID = 20037;
const int SYBEICN = 20038;
const int SYBENMOB = 20039;
const int SYBEAPUT = 20040;
const int SYBEASNL = 20041;
const int SYBENTLL = 20042;
const int SYBEASUL = 20043;
const int SYBERDNR = 20044;
const int SYBENSIP = 20045;
const int SYBEABNV = 20046;
const int SYBEDDNE = 20047;
const int SYBECUFL = 20048;
const int SYBECOFL = 20049;
const int SYBECSYN = 20050;
const int SYBECLPR = 20051;
const int SYBECNOV = 20052;
const int SYBERDCN = 20053;
const int SYBESFOV = 20054;
const int SYBEUNT = 20055;
const int SYBECLOS = 20056;
const int SYBEUAVE = 20057;
const int SYBEUSCT = 20058;
const int SYBEEQVA = 20059;
const int SYBEUDTY = 20060;
const int SYBETSIT = 20061;
const int SYBEAUTN = 20062;
const int SYBEBDIO = 20063;
const int SYBEBCNT = 20064;
const int SYBEIFNB = 20065;
const int SYBETTS = 20066;
const int SYBEKBCO = 20067;
const int SYBEBBCI = 20068;
const int SYBEKBCI = 20069;
const int SYBEBCRE = 20070;
const int SYBETPTN = 20071;
const int SYBEBCWE = 20072;
const int SYBEBCNN = 20073;
const int SYBEBCOR = 20074;
const int SYBEBCIS = 20075;
const int SYBEBCPI = 20076;
const int SYBEBCPN = 20077;
const int SYBEBCPB = 20078;
const int SYBEVDPT = 20079;
const int SYBEBIVI = 20080;
const int SYBEBCBC = 20081;
const int SYBEBCFO = 20082;
const int SYBEBCVH = 20083;
const int SYBEBCUO = 20084;
const int SYBEBCUC = 20085;
const int SYBEBUOE = 20086;
const int SYBEBUCE = 20087;
const int SYBEBWEF = 20088;
const int SYBEASTF = 20089;
const int SYBEUACS = 20090;
const int SYBEASEC = 20091;
const int SYBETMTD = 20092;
const int SYBENTTN = 20093;
const int SYBEDNTI = 20094;
const int SYBEBTMT = 20095;
const int SYBEORPF = 20096;
const int SYBEUVBF = 20097;
const int SYBEBUOF = 20098;
const int SYBEBUCF = 20099;
const int SYBEBRFF = 20100;
const int SYBEBWFF = 20101;
const int SYBEBUDF = 20102;
const int SYBEBIHC = 20103;
const int SYBEBEOF = 20104;
const int SYBEBCNL = 20105;
const int SYBEBCSI = 20106;
const int SYBEBCIT = 20107;
const int SYBEBCSA = 20108;
const int SYBENULL = 20109;
const int SYBEUNAM = 20110;
const int SYBEBCRO = 20111;
const int SYBEMPLL = 20112;
const int SYBERPIL = 20113;
const int SYBERPUL = 20114;
const int SYBEUNOP = 20115;
const int SYBECRNC = 20116;
const int SYBERTCC = 20117;
const int SYBERTSC = 20118;
const int SYBEUCRR = 20119;
const int SYBERPNA = 20120;
const int SYBEOPNA = 20121;
const int SYBEFGTL = 20122;
const int SYBECWLL = 20123;
const int SYBEUFDS = 20124;
const int SYBEUCPT = 20125;
const int SYBETMCF = 20126;
const int SYBEAICF = 20127;
const int SYBEADST = 20128;
const int SYBEALTT = 20129;
const int SYBEAPCT = 20130;
const int SYBEXOCI = 20131;
const int SYBEFSHD = 20132;
const int SYBEAOLF = 20133;
const int SYBEARDI = 20134;
const int SYBEURCI = 20135;
const int SYBEARDL = 20136;
const int SYBEURMI = 20137;
const int SYBEUREM = 20138;
const int SYBEURES = 20139;
const int SYBEUREI = 20140;
const int SYBEOREN = 20141;
const int SYBEISOI = 20142;
const int SYBEIDCL = 20143;
const int SYBEIMCL = 20144;
const int SYBEIFCL = 20145;
const int SYBEUTDS = 20146;
const int SYBEBUFF = 20147;
const int SYBEACNV = 20148;
const int SYBEDPOR = 20149;
const int SYBENDC = 20150;
const int SYBEMVOR = 20151;
const int SYBEDVOR = 20152;
const int SYBENBVP = 20153;
const int SYBESPID = 20154;
const int SYBENDTP = 20155;
const int SYBEXTN = 20156;
const int SYBEXTDN = 20157;
const int SYBEXTSN = 20158;
const int SYBENUM = 20159;
const int SYBETYPE = 20160;
const int SYBEGENOS = 20161;
const int SYBEPAGE = 20162;
const int SYBEOPTNO = 20163;
const int SYBEETD = 20164;
const int SYBERTYPE = 20165;
const int SYBERFILE = 20166;
const int SYBEFMODE = 20167;
const int SYBESLCT = 20168;
const int SYBEZTXT = 20169;
const int SYBENTST = 20170;
const int SYBEOSSL = 20171;
const int SYBEESSL = 20172;
const int SYBENLNL = 20173;
const int SYBENHAN = 20174;
const int SYBENBUF = 20175;
const int SYBENULP = 20176;
const int SYBENOTI = 20177;
const int SYBEEVOP = 20178;
const int SYBENEHA = 20179;
const int SYBETRAN = 20180;
const int SYBEEVST = 20181;
const int SYBEEINI = 20182;
const int SYBEECRT = 20183;
const int SYBEECAN = 20184;
const int SYBEEUNR = 20185;
const int SYBERPCS = 20186;
const int SYBETPAR = 20187;
const int SYBETEXS = 20188;
const int SYBETRAC = 20189;
const int SYBETRAS = 20190;
const int SYBEPRTF = 20191;
const int SYBETRSN = 20192;
const int SYBEBPKS = 20193;
const int SYBEIPV = 20194;
const int SYBEMOV = 20195;
const int SYBEDIVZ = 20196;
const int SYBEASTL = 20197;
const int SYBESEFA = 20198;
const int SYBEPOLL = 20199;
const int SYBENOEV = 20200;
const int SYBEBADPK = 20201;
const int SYBESECURE = 20202;
const int SYBECAP = 20203;
const int SYBEFUNC = 20204;
const int SYBERESP = 20205;
const int SYBEIVERS = 20206;
const int SYBEONCE = 20207;
const int SYBERPNULL = 20208;
const int SYBERPTXTIM = 20209;
const int SYBENEG = 20210;
const int SYBELBLEN = 20211;
const int SYBEUMSG = 20212;
const int SYBECAPTYP = 20213;
const int SYBEBNUM = 20214;
const int SYBEBBL = 20215;
const int SYBEBPREC = 20216;
const int SYBEBSCALE = 20217;
const int SYBECDOMAIN = 20218;
const int SYBECINTERNAL = 20219;
const int SYBEBTYPSRV = 20220;
const int SYBEBCSET = 20221;
const int SYBEFENC = 20222;
const int SYBEFRES = 20223;
const int SYBEISRVPREC = 20224;
const int SYBEISRVSCL = 20225;
const int SYBEINUMCL = 20226;
const int SYBEIDECCL = 20227;
const int SYBEBCMTXT = 20228;
const int SYBEBCPREC = 20229;
const int SYBEBCBNPR = 20230;
const int SYBEBCBNTYP = 20231;
const int SYBEBCSNTYP = 20232;
const int SYBEBCPCTYP = 20233;
const int SYBEBCVLEN = 20234;
const int SYBEBCHLEN = 20235;
const int SYBEBCBPREF = 20236;
const int SYBEBCPREF = 20237;
const int SYBEBCITBNM = 20238;
const int SYBEBCITBLEN = 20239;
const int SYBEBCSNDROW = 20240;
const int SYBEBPROCOL = 20241;
const int SYBEBPRODEF = 20242;
const int SYBEBPRONUMDEF = 20243;
const int SYBEBPRODEFID = 20244;
const int SYBEBPRONODEF = 20245;
const int SYBEBPRODEFTYP = 20246;
const int SYBEBPROEXTDEF = 20247;
const int SYBEBPROEXTRES = 20248;
const int SYBEBPROBADDEF = 20249;
const int SYBEBPROBADTYP = 20250;
const int SYBEBPROBADLEN = 20251;
const int SYBEBPROBADPREC = 20252;
const int SYBEBPROBADSCL = 20253;
const int SYBEBADTYPE = 20254;
const int SYBECRSNORES = 20255;
const int SYBECRSNOIND = 20256;
const int SYBECRSVIEW = 20257;
const int SYBECRSVIIND = 20258;
const int SYBECRSORD = 20259;
const int SYBECRSBUFR = 20260;
const int SYBECRSNOFREE = 20261;
const int SYBECRSDIS = 20262;
const int SYBECRSAGR = 20263;
const int SYBECRSFRAND = 20264;
const int SYBECRSFLAST = 20265;
const int SYBECRSBROL = 20266;
const int SYBECRSFROWN = 20267;
const int SYBECRSBSKEY = 20268;
const int SYBECRSRO = 20269;
const int SYBECRSNOCOUNT = 20270;
const int SYBECRSTAB = 20271;
const int SYBECRSUPDNB = 20272;
const int SYBECRSNOWHERE = 20273;
const int SYBECRSSET = 20274;
const int SYBECRSUPDTAB = 20275;
const int SYBECRSNOUPD = 20276;
const int SYBECRSINV = 20277;
const int SYBECRSNOKEYS = 20278;
const int SYBECRSNOBIND = 20279;
const int SYBECRSFTYPE = 20280;
const int SYBECRSINVALID = 20281;
const int SYBECRSMROWS = 20282;
const int SYBECRSNROWS = 20283;
const int SYBECRSNOLEN = 20284;
const int SYBECRSNOPTCC = 20285;
const int SYBECRSNORDER = 20286;
const int SYBECRSNOTABLE = 20287;
const int SYBECRSNUNIQUE = 20288;
const int SYBECRSVAR = 20289;
const int SYBENOVALUE = 20290;
const int SYBEVOIDRET = 20291;
const int SYBECLOSEIN = 20292;
const int SYBEBOOL = 20293;
const int SYBEBCPOPT = 20294;
const int SYBEERRLABEL = 20295;
const int SYBEATTNACK = 20296;
const int SYBEBBFL = 20297;
const int SYBEDCL = 20298;
const int SYBECS = 20299;
const int SYBEBULKINSERT = 20599;
const int DBSETHOST = 1;
const int DBSETUSER = 2;
const int DBSETPWD = 3;
const int DBSETHID = 4;
const int DBSETAPP = 5;
const int DBSETBCP = 6;
const int DBSETNATLANG = 7;
const int DBSETNOSHORT = 8;
const int DBSETHIER = 9;
const int DBSETCHARSET = 10;
const int DBSETPACKET = 11;
const int DBSETENCRYPT = 12;
const int DBSETLABELED = 13;
import bcd.freetds.tds_sysdep_public;
alias void DBPROCESS;
alias int function(void *, int, int, int, char *, char *, char *, int) _BCD_func__460;
alias _BCD_func__460 MHANDLEFUNC;
alias int function(void *, int, int, int, char *, char *) _BCD_func__461;
alias _BCD_func__461 EHANDLEFUNC;
alias dbdaterec DBDATEREC;
alias int DBINT;
alias dboption DBOPTION;
alias dbstring DBSTRING;
alias ushort DBUSMALLINT;
alias char DBBOOL;
alias char DBCHAR;
alias short SHORT;
alias char BYTE;
alias int BOOL;
enum CI_TYPE {
CI_REGULAR=1,
CI_ALTERNATE=2,
CI_CURSOR=3,
}
enum __7 {
MAXCOLNAMELEN=512,
}
const int MAXCOLNAMELEN = 512;
alias dbtypeinfo DBTYPEINFO;
alias void LOGINREC;
alias DBNUMERIC DBDECIMAL;
alias double DBFLT8;
alias float DBREAL;
alias char DBBINARY;
alias short DBSMALLINT;
alias char DBTINYINT;
alias char DBBIT;
enum __0 {
SYBCHAR=47,
SYBVARCHAR=39,
SYBINTN=38,
SYBINT1=48,
SYBINT2=52,
SYBINT4=56,
SYBINT8=127,
SYBFLT8=62,
SYBDATETIME=61,
SYBBIT=50,
SYBTEXT=35,
SYBIMAGE=34,
SYBMONEY4=122,
SYBMONEY=60,
SYBDATETIME4=58,
SYBREAL=59,
SYBBINARY=45,
SYBVARBINARY=37,
SYBNUMERIC=108,
SYBDECIMAL=106,
SYBFLTN=109,
SYBMONEYN=110,
SYBDATETIMN=111,
}
const int SYBCHAR = 47;
const int SYBVARCHAR = 39;
const int SYBINTN = 38;
const int SYBINT1 = 48;
const int SYBINT2 = 52;
const int SYBINT4 = 56;
const int SYBINT8 = 127;
const int SYBFLT8 = 62;
const int SYBDATETIME = 61;
const int SYBBIT = 50;
const int SYBTEXT = 35;
const int SYBIMAGE = 34;
const int SYBMONEY4 = 122;
const int SYBMONEY = 60;
const int SYBDATETIME4 = 58;
const int SYBREAL = 59;
const int SYBBINARY = 45;
const int SYBVARBINARY = 37;
const int SYBNUMERIC = 108;
const int SYBDECIMAL = 106;
const int SYBFLTN = 109;
const int SYBMONEYN = 110;
const int SYBDATETIMN = 111;
alias int STATUS;
alias int function(void *) _BCD_func__530;
alias _BCD_func__530 DB_DBHNDLINTR_FUNC;
alias _BCD_func__530 DB_DBCHKINTR_FUNC;
alias int function() _BCD_func__533;
alias void function(_BCD_func__533, void *) _BCD_func__531;
alias _BCD_func__531 DB_DBIDLE_FUNC;
alias _BCD_func__533 DBWAITFUNC;
alias _BCD_func__533 function(void *) _BCD_func__532;
alias _BCD_func__532 DB_DBBUSY_FUNC;
alias ushort USHORT;
alias void * DBVOIDPTR;
alias void DBLOGINFO;
alias void DBSORTORDER;
alias void DBXLATE;
alias void DBCURSOR;
alias int RETCODE;
extern (C) int stat_xact(void * connect, int commid);
extern (C) int start_xact(void * connect, char * application_name, char * xact_name, int site_count);
extern (C) int scan_xact(void * connect, int commid);
extern (C) void * open_commit(void * login, char * servername);
extern (C) int commit_xact(void * connect, int commid);
extern (C) void close_commit(void * connect);
extern (C) int abort_xact(void * connect, int commid);
extern (C) int remove_xact(void * connect, int commid, int n);
extern (C) void build_xact_string(char * xact_name, char * service_name, int commid, char * result);
extern (C) int bcp_writefmt(void * dbproc, char * filename);
extern (C) int bcp_sendrow(void * dbproc);
extern (C) int bcp_readfmt(void * dbproc, char * filename);
extern (C) int bcp_options(void * dbproc, int option, char * value, int valuelen);
extern (C) int bcp_moretext(void * dbproc, int size, char * text);
extern (C) char bcp_getl(void * login);
extern (C) int bcp_exec(void * dbproc, int * rows_copied);
extern (C) int bcp_control(void * dbproc, int field, int value);
extern (C) int bcp_colptr(void * dbproc, char * colptr, int table_column);
extern (C) int bcp_colfmt_ps(void * dbproc, int host_column, int host_type, int host_prefixlen, int host_collen, char * host_term, int host_termlen, int colnum, dbtypeinfo * typeinfo);
extern (C) int bcp_colfmt(void * dbproc, int host_column, int host_type, int host_prefixlen, int host_collen, char * host_term, int host_termlen, int colnum);
extern (C) int bcp_columns(void * dbproc, int host_colcount);
extern (C) int bcp_collen(void * dbproc, int varlen, int table_column);
extern (C) int bcp_bind(void * dbproc, char * varaddr, int prefixlen, int varlen, char * terminator, int termlen, int type, int table_column);
extern (C) int bcp_batch(void * dbproc);
extern (C) int bcp_done(void * dbproc);
extern (C) int bcp_init(void * dbproc, char * tblname, char * hfile, char * errfile, int direction);
extern (C) int dbsetlversion(void * login, char version_);
extern (C) int dbsetllong(void * login, int value, int which);
extern (C) int dbsetlshort(void * login, int value, int which);
extern (C) int dbsetlbool(void * login, int value, int which);
extern (C) int dbsetlname(void * login, char * value, int which);
extern (C) int dbxlate(void * dbprocess, char * src, int srclen, char * dest, int destlen, void * xlt, int * srcbytes_used, char srcend, int status);
extern (C) int dbwritetext(void * dbproc, char * objname, char * textptr, char textptrlen, char * timestamp, char log, int size, char * text);
extern (C) int dbwritepage(void * dbprocess, char * p_dbname, int pageno, int size, char * buf);
extern (C) char dbwillconvert(int srctype, int desttype);
extern (C) char * dbversion();
extern (C) int dbuse(void * dbproc, char * name);
extern (C) int dbtxtsput(void * dbprocess, char newtxts, int colnum);
extern (C) char * dbtxtsnewval(void * dbprocess);
extern (C) char * dbtxtimestamp(void * dbproc, int column);
extern (C) char * dbtxptr(void * dbproc, int column);
extern (C) int dbtsput(void * dbprocess, char * newts, int newtslen, int tabnum, char * tabname);
extern (C) char * dbtsnewval(void * dbprocess);
extern (C) int dbtsnewlen(void * dbprocess);
extern (C) int dbtextsize(void * dbprocess);
extern (C) int dbtds(void * dbprocess);
extern (C) int dbvarylen(void * dbproc, int column);
extern (C) char * dbtabsoruce(void * dbprocess, int colnum, int * tabnum);
extern (C) char * dbtabname(void * dbprocess, int tabnum);
extern (C) int dbtabcount(void * dbprocess);
extern (C) char dbtabbrowse(void * dbprocess, int tabnum);
extern (C) int dbstrsort(void * dbprocess, char * s1, int l1, char * s2, int l2, void * sort);
extern (C) int dbstrlen(void * dbproc);
extern (C) int dbstrcpy(void * dbproc, int start, int numbytes, char * dest);
extern (C) int dbstrcmp(void * dbprocess, char * s1, int l1, char * s2, int l2, void * sort);
extern (C) int dbstrbuild(void * dbproc, char * charbuf, int bufsize, char * text, char * formats, ...);
extern (C) int dbsqlsend(void * dbproc);
extern (C) int dbsqlok(void * dbproc);
extern (C) int dbsqlexec(void * dbproc);
extern (C) int dbsprline(void * dbproc, char * buffer, int buf_len, char line_char);
extern (C) int dbsprhead(void * dbproc, char * buffer, int buf_len);
extern (C) int dbspr1rowlen(void * dbproc);
extern (C) int dbspr1row(void * dbproc, char * buffer, int buf_len);
extern (C) int dbspid(void * dbproc);
extern (C) int dbsetversion(int version_);
extern (C) void dbsetuserdata(void * dbproc, char * ptr);
extern (C) int dbsettime(int seconds);
extern (C) int dbsetrow(void * dbprocess, int row);
extern (C) int dbsetopt(void * dbproc, int option, char * char_param, int int_param);
extern (C) int dbsetnull(void * dbprocess, int bindtype, int bindlen, char * bindval);
extern (C) int dbsetmaxprocs(int maxprocs);
extern (C) int dbsetlogintime(int seconds);
extern (C) int dbsetloginfo(void * loginrec, void * loginfo);
extern (C) void dbsetinterrupt(void * dbproc, _BCD_func__530 chkintr, _BCD_func__530 hndlintr);
extern (C) void dbsetifile(char * filename);
extern (C) void dbsetidle(void * dbprocess, _BCD_func__531 idlefunc);
extern (C) int dbsetdeflang(char * language);
extern (C) int dbsetdefcharset(char * charset);
extern (C) void dbsetbusy(void * dbprocess, _BCD_func__532 busyfunc);
extern (C) void dbsetavail(void * dbprocess);
extern (C) char * dbservcharset(void * dbprocess);
extern (C) int dbsendpassthru(void * dbprocess, void * bufp);
alias int function(void *, void *) _BCD_func__534;
extern (C) int * dbsechandle(int type, _BCD_func__534 handler);
extern (C) int dbsafestr(void * dbproc, char * src, int srclen, char * dest, int destlen, int quotetype);
extern (C) int dbrpwset(void * login, char * srvname, char * password, int pwlen);
extern (C) void dbrpwclr(void * login);
extern (C) int dbrpcsend(void * dbproc);
extern (C) int dbrpcparam(void * dbproc, char * paramname, char status, int type, int maxlen, int datalen, char * value);
extern (C) int dbrpcinit(void * dbproc, char * rpcname, short options);
extern (C) int dbrowtype(void * dbprocess);
extern (C) int dbrows(void * dbproc);
extern (C) int dbrettype(void * dbproc, int retnum);
extern (C) int dbretstatus(void * dbproc);
extern (C) char * dbretname(void * dbproc, int retnum);
extern (C) int dbretlen(void * dbproc, int retnum);
extern (C) char * dbretdata(void * dbproc, int retnum);
extern (C) int dbresults_r(void * dbproc, int recursive);
extern (C) int dbresults(void * dbproc);
extern (C) int dbregwatchlist(void * dbprocess);
extern (C) int dbregwatch(void * dbprocess, char * procnm, short namelen, ushort options);
extern (C) int dbregparam(void * dbproc, char * param_name, int type, int datalen, char * data);
extern (C) int dbregnowatch(void * dbprocess, char * procnm, short namelen);
extern (C) int dbreglist(void * dbproc);
extern (C) int dbreginit(void * dbproc, char * procedure_name, short namelen);
extern (C) int dbreghandle(void * dbprocess, char * procnm, short namelen, _BCD_func__534 handler);
extern (C) int dbregexec(void * dbproc, ushort options);
extern (C) int dbregdrop(void * dbprocess, char * procnm, short namelen);
extern (C) int dbrecvpassthru(void * dbprocess, void * * bufp);
extern (C) void dbrecftos(char * filename);
extern (C) int dbreadtext(void * dbproc, void * buf, int bufsize);
extern (C) int dbreadpage(void * dbprocess, char * p_dbname, int pageno, char * buf);
extern (C) char DRBUF(void * dbprocess);
extern (C) char * dbqual(void * dbprocess, int tabnum, char * tabname);
extern (C) char * dbprtype(int token);
extern (C) int dbprrow(void * dbproc);
extern (C) void dbprhead(void * dbproc);
extern (C) int dbpoll(void * dbproc, int milliseconds, void * * ready_dbproc, int * return_reason);
extern (C) int dbordercol(void * dbprocess, int order);
extern (C) void * dbopen(void * login, char * server);
extern (C) void * tdsdbopen(void * login, char * server, int msdblib);
extern (C) int dbnumrets(void * dbproc);
extern (C) int DBNUMORDERS(void * dbprocess);
extern (C) int dbnumcompute(void * dbprocess);
extern (C) int dbnumcols(void * dbproc);
extern (C) int dbnumalts(void * dbproc, int computeid);
extern (C) int dbnullbind(void * dbproc, int column, int * indicator);
extern (C) int dbnpdefine(void * dbprocess, char * procedure_name, short namelen);
extern (C) int dbnpcreate(void * dbprocess);
extern (C) int dbnextrow(void * dbproc);
extern (C) char * dbname(void * dbproc);
extern (C) _BCD_func__460 dbmsghandle(_BCD_func__460 handler);
extern (C) int dbmoretext(void * dbproc, int size, char * text);
extern (C) int dbmorecmds(void * dbproc);
extern (C) char * dbmonthname(void * dbproc, char * language, int monthnum, char shortform);
extern (C) int dbmnyzero(void * dbproc, DBMONEY * dest);
extern (C) int dbmnysub(void * dbproc, DBMONEY * m1, DBMONEY * m2, DBMONEY * diff);
extern (C) int dbmnyscale(void * dbproc, DBMONEY * dest, int multiplier, int addend);
extern (C) int dbmnydigit(void * dbprocess, DBMONEY * m1, char * value, char * zero);
extern (C) int dbmnymul(void * dbproc, DBMONEY * m1, DBMONEY * m2, DBMONEY * prod);
extern (C) int dbmnyminus(void * dbproc, DBMONEY * src, DBMONEY * dest);
extern (C) int dbmnymaxpos(void * dbproc, DBMONEY * dest);
extern (C) int dbmnyndigit(void * dbproc, DBMONEY * mnyptr, char * value, char * zero);
extern (C) int dbmnymaxneg(void * dbproc, DBMONEY * dest);
extern (C) int dbmnyinit(void * dbproc, DBMONEY * mnyptr, int trim, char * negative);
extern (C) int dbmnyinc(void * dbproc, DBMONEY * mnyptr);
extern (C) int dbmnydown(void * dbproc, DBMONEY * mnyptr, int divisor, int * remainder);
extern (C) int dbmnydivide(void * dbproc, DBMONEY * m1, DBMONEY * m2, DBMONEY * quotient);
extern (C) int dbmnydec(void * dbproc, DBMONEY * mnyptr);
extern (C) int dbmnycopy(void * dbproc, DBMONEY * src, DBMONEY * dest);
extern (C) int dbmnycmp(void * dbproc, DBMONEY * m1, DBMONEY * m2);
extern (C) int dbmnyadd(void * dbproc, DBMONEY * m1, DBMONEY * m2, DBMONEY * sum);
extern (C) int dbmny4zero(void * dbproc, DBMONEY4 * dest);
extern (C) int dbmny4sub(void * dbproc, DBMONEY4 * m1, DBMONEY4 * m2, DBMONEY4 * diff);
extern (C) int dbmny4mul(void * dbproc, DBMONEY4 * m1, DBMONEY4 * m2, DBMONEY4 * prod);
extern (C) int dbmny4minus(void * dbproc, DBMONEY4 * src, DBMONEY4 * dest);
extern (C) int dbmny4divide(void * dbproc, DBMONEY4 * m1, DBMONEY4 * m2, DBMONEY4 * quotient);
extern (C) int dbmny4copy(void * dbprocess, DBMONEY4 * m1, DBMONEY4 * m2);
extern (C) int dbmny4cmp(void * dbproc, DBMONEY4 * m1, DBMONEY4 * m2);
extern (C) int dbmny4add(void * dbproc, DBMONEY4 * m1, DBMONEY4 * m2, DBMONEY4 * sum);
extern (C) void dbloginfree(void * login);
extern (C) void * dblogin();
extern (C) void * dbloadsort(void * dbprocess);
extern (C) int dbload_xlate(void * dbprocess, char * srv_charset, char * clt_name, void * * xlt_tosrv, void * * xlt_todisp);
extern (C) int dblastrow(void * dbproc);
extern (C) char dbisopt(void * dbproc, int option, char * param);
extern (C) char dbisavail(void * dbprocess);
extern (C) int dbiowdesc(void * dbproc);
extern (C) int dbiordesc(void * dbproc);
extern (C) int dbinit();
extern (C) char dbhasretstat(void * dbproc);
extern (C) char * dbgetuserdata(void * dbproc);
extern (C) int dbgetrow(void * dbproc, int row);
extern (C) int dbgetpacket(void * dbproc);
extern (C) int dbgetoff(void * dbprocess, ushort offtype, int startfrom);
extern (C) char * dbgetnatlanf(void * dbprocess);
extern (C) int dbgetmaxprocs();
extern (C) int dbgetlusername(void * login, char * name_buffer, int buffer_len);
extern (C) int dbgetloginfo(void * dbprocess, void * * loginfo);
extern (C) char * dbgetcharset(void * dbprocess);
extern (C) char * dbgetchar(void * dbprocess, int n);
extern (C) int dbfreesort(void * dbprocess, void * sortorder);
extern (C) void dbfreequal(char * qualptr);
extern (C) void dbfreebuf(void * dbproc);
extern (C) int dbfree_xlate(void * dbprocess, void * xlt_tosrv, void * clt_todisp);
extern (C) int dbfirstrow(void * dbproc);
extern (C) int dbfcmd(void * dbproc, char * fmt, ...);
extern (C) void dbexit();
extern (C) _BCD_func__461 dberrhandle(_BCD_func__461 handler);
extern (C) char dbdead(void * dbproc);
extern (C) char * dbdayname(void * dbprocess, char * language, int daynum);
extern (C) int dbdatlen(void * dbproc, int column);
extern (C) int dbdatezero(void * dbprocess, DBDATETIME * d1);
extern (C) int dbdatepart(void * dbprocess, int datepart, DBDATETIME * datetime);
extern (C) char * dateorder(void * dbprocess, char * language);
extern (C) int dbdatename(void * dbprocess, char * buf, int date, DBDATETIME * datetime);
extern (C) int dbdatecrack(void * dbproc, dbdaterec * di, DBDATETIME * dt);
extern (C) int dbdatecmp(void * dbproc, DBDATETIME * d1, DBDATETIME * d2);
extern (C) int dbdatechar(void * dbprocess, char * buf, int datepart, int value);
extern (C) int dbdate4zero(void * dbprocess, DBDATETIME4 * d1);
extern (C) int dbdate4cmp(void * dbprocess, DBDATETIME4 * d1, DBDATETIME4 * d2);
extern (C) char * dbdata(void * dbproc, int column);
extern (C) void * dbcursoropen(void * dbprocess, char * stmt, short scollopt, short concuropt, ushort nrows, int * pstatus);
extern (C) int dbcursorinfo(void * hc, int * ncols, int * nrows);
extern (C) int dbcursorfetch(void * hc, int fetchtype, int rownum);
extern (C) int dbcursorcolinfo(void * hc, int column, char * colname, int * coltype, int * collen, int * usertype);
extern (C) void dbcursorclose(void * hc);
extern (C) int dbcursorbind(void * hc, int col, int vartype, int varlen, int * poutlen, char * pvaraddr, dbtypeinfo * typeinfo);
extern (C) int dbcursor(void * hc, int optype, int bufno, char * table, char * values);
extern (C) int dbcurrow(void * dbproc);
extern (C) int dbcurcmd(void * dbproc);
extern (C) int dbcount(void * dbproc);
extern (C) int dbconvert_ps(void * dbprocess, int srctype, char * src, int srclen, int desttype, char * dest, int destlen, dbtypeinfo * typeinfo);
extern (C) int dbconvert(void * dbproc, int srctype, char * src, int srclen, int desttype, char * dest, int destlen);
extern (C) int dbcolutype(void * dbprocess, int column);
extern (C) dbtypeinfo * dbcoltypeinfo(void * dbproc, int column);
extern (C) int dbcoltype(void * dbproc, int column);
extern (C) char * dbcolsource(void * dbproc, int colnum);
extern (C) char * dbcolname(void * dbproc, int column);
extern (C) int dbcollen(void * dbproc, int column);
extern (C) int dbtablecolinfo(void * dbproc, int column, DBCOL * pdbcol);
extern (C) int dbcolinfo(void * dbproc, int type, int column, int computeid, DBCOL * pdbcol);
extern (C) char dbcolbrowse(void * dbprocess, int colnum);
extern (C) int dbcmdrow(void * dbproc);
extern (C) int dbcmd(void * dbproc, char * cmdstring);
extern (C) int dbclropt(void * dbproc, int option, char * param);
extern (C) void dbclrbuf(void * dbproc, int n);
extern (C) void dbclose(void * dbproc);
extern (C) char dbcharsetconv(void * dbprocess);
extern (C) char * dbchange(void * dbprocess);
extern (C) int dbcanquery(void * dbproc);
extern (C) int dbcancel(void * dbproc);
extern (C) char * dbbylist(void * dbproc, int computeid, int * size);
extern (C) int dbbufsize(void * dbprocess);
extern (C) int dbbind_ps(void * dbprocess, int column, int vartype, int varlen, char * varaddr, dbtypeinfo * typeinfo);
extern (C) int dbbind(void * dbproc, int column, int vartype, int varlen, char * varaddr);
extern (C) int dbanullbind(void * dbprocess, int computeid, int column, int * indicator);
extern (C) int dbaltutype(void * dbproc, int computeid, int column);
extern (C) int dbalttype(void * dbproc, int computeid, int column);
extern (C) int dbaltop(void * dbproc, int computeid, int column);
extern (C) int dbaltlen(void * dbproc, int computeid, int column);
extern (C) int dbaltcolid(void * dbproc, int computeid, int column);
extern (C) int dbaltbind_ps(void * dbprocess, int computeid, int column, int vartype, int varlen, char * varaddr, dbtypeinfo * typeinfo);
extern (C) int dbaltbind(void * dbprocess, int computeid, int column, int vartype, int varlen, char * varaddr);
extern (C) int dbadlen(void * dbproc, int computeid, int column);
extern (C) char * dbadata(void * dbproc, int computeid, int column);
extern (C) char db12hour(void * dbprocess, char * language);
struct dbdaterec {
int dateyear;
int datemonth;
int datedmonth;
int datedyear;
int datedweek;
int datehour;
int dateminute;
int datesecond;
int datemsecond;
int datetzone;
}
struct dboption {
char [32] opttext;
dbstring * optparam;
ushort optstatus;
char optactive;
dboption * optnext;
}
struct DBCOL {
int SizeOfStruct;
char [514] Name;
char [514] ActualName;
char [514] TableName;
short Type;
int UserType;
int MaxLength;
char Precision;
char Scale;
int VarLength;
char Null;
char CaseSensitive;
char Updatable;
int Identity;
}
struct dbstring {
char * strtext;
int strtotlen;
dbstring * strnext;
}
struct dbtypeinfo {
int precision;
int scale;
}
struct DBDATETIME4 {
ushort days;
ushort minutes;
}
struct DBDATETIME {
int dtdays;
int dttime;
}
struct DBMONEY4 {
int mny4;
}
struct DBMONEY {
int mnyhigh;
uint mnylow;
}
struct DBNUMERIC {
char precision;
char scale;
char [33] array;
}
struct DBVARYCHAR {
int len;
char [256] str;
}
extern (C) void * [2] no_unused_sybdb_h_warn;
extern (C) char [59] rcsid_sybdb_h;