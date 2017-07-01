/* THIS FILE GENERATED BY bcd.gen */
module bcd.freetds.tdsconvert;
const int TDS_CONVERT_FAIL = -1;
const int TDS_CONVERT_NOAVAIL = -2;
const int TDS_CONVERT_SYNTAX = -3;
const int TDS_CONVERT_NOMEM = -4;
const int TDS_CONVERT_OVERFLOW = -5;
import bcd.freetds.tds;
import bcd.freetds.tds_sysdep_public;
import bcd.freetds.tdsver;
alias conv_result CONV_RESULT;
extern (C) uint tds_strftime(char * buf, uint maxsize, char * format, tdsdaterec * timeptr);
extern (C) int tds_convert(tds_context * context, int srctype, char * src, uint srclen, int desttype, conv_result * cr);
extern (C) int tds_get_null_type(int srctype);
extern (C) char tds_willconvert(int srctype, int desttype);
struct tds_time {
int tm_year;
int tm_mon;
int tm_mday;
int tm_hour;
int tm_min;
int tm_sec;
int tm_ms;
}
union conv_result {
char ti;
short si;
int i;
long bi;
double f;
float r;
char * c;
tdsmoney m;
tdsmoney4 m4;
tdsdatetime dt;
tdsdatetime4 dt4;
tdsnumeric n;
char * ib;
tdsunique u;
}
extern (C) void * [2] no_unused_tdsconvert_h_warn;
extern (C) char [60] rcsid_tdsconvert_h;