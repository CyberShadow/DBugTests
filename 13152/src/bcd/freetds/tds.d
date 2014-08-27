/* THIS FILE GENERATED BY bcd.gen */
module bcd.freetds.tds;
import std.c.stdio;
alias FILE _IO_FILE;
const int TDS_SUCCEED = 1;
const int TDS_FAIL = 0;
const int TDS_NO_MORE_RESULTS = 2;
const int TDS_CANCELLED = 3;
const int TDS_INT_EXIT = 0;
const int TDS_INT_CONTINUE = 1;
const int TDS_INT_CANCEL = 2;
const int TDS_INT_TIMEOUT = 3;
const int TDS_NO_COUNT = -1;
const int TDS_ROW_RESULT = 4040;
const int TDS_PARAM_RESULT = 4042;
const int TDS_STATUS_RESULT = 4043;
const int TDS_MSG_RESULT = 4044;
const int TDS_COMPUTE_RESULT = 4045;
const int TDS_CMD_DONE = 4046;
const int TDS_CMD_SUCCEED = 4047;
const int TDS_CMD_FAIL = 4048;
const int TDS_ROWFMT_RESULT = 4049;
const int TDS_COMPUTEFMT_RESULT = 4050;
const int TDS_DESCRIBE_RESULT = 4051;
const int TDS_DONE_RESULT = 4052;
const int TDS_DONEPROC_RESULT = 4053;
const int TDS_DONEINPROC_RESULT = 4054;
const int TDS_OTHERS_RESULT = 4055;
const int TDS_ERROR = 3;
const int TDS_DONT_RETURN = 42;
const int TDS5_PARAMFMT2_TOKEN = 32;
const int TDS_LANGUAGE_TOKEN = 33;
const int TDS_ORDERBY2_TOKEN = 34;
const int TDS_ROWFMT2_TOKEN = 97;
const int TDS_LOGOUT_TOKEN = 113;
const int TDS_RETURNSTATUS_TOKEN = 121;
const int TDS_PROCID_TOKEN = 124;
const int TDS7_RESULT_TOKEN = 129;
const int TDS7_COMPUTE_RESULT_TOKEN = 136;
const int TDS_COLNAME_TOKEN = 160;
const int TDS_COLFMT_TOKEN = 161;
const int TDS_DYNAMIC2_TOKEN = 163;
const int TDS_TABNAME_TOKEN = 164;
const int TDS_COLINFO_TOKEN = 165;
const int TDS_OPTIONCMD_TOKEN = 166;
const int TDS_COMPUTE_NAMES_TOKEN = 167;
const int TDS_COMPUTE_RESULT_TOKEN = 168;
const int TDS_ORDERBY_TOKEN = 169;
const int TDS_ERROR_TOKEN = 170;
const int TDS_INFO_TOKEN = 171;
const int TDS_PARAM_TOKEN = 172;
const int TDS_LOGINACK_TOKEN = 173;
const int TDS_CONTROL_TOKEN = 174;
const int TDS_ROW_TOKEN = 209;
const int TDS_CMP_ROW_TOKEN = 211;
const int TDS5_PARAMS_TOKEN = 215;
const int TDS_CAPABILITY_TOKEN = 226;
const int TDS_ENVCHANGE_TOKEN = 227;
const int TDS_EED_TOKEN = 229;
const int TDS_DBRPC_TOKEN = 230;
const int TDS5_DYNAMIC_TOKEN = 231;
const int TDS5_PARAMFMT_TOKEN = 236;
const int TDS_AUTH_TOKEN = 237;
const int TDS_RESULT_TOKEN = 238;
const int TDS_DONE_TOKEN = 253;
const int TDS_DONEPROC_TOKEN = 254;
const int TDS_DONEINPROC_TOKEN = 255;
const int TDS_CURCLOSE_TOKEN = 128;
const int TDS_CURFETCH_TOKEN = 130;
const int TDS_CURINFO_TOKEN = 131;
const int TDS_CUROPEN_TOKEN = 132;
const int TDS_CURDECLARE_TOKEN = 134;
const int IS_DECLARE = 100;
const int IS_CURROW = 200;
const int IS_OPEN = 300;
const int IS_CLOSE = 400;
const int PROCESS_ROWS = 0;
const int PROCESS_RESULTS = 1;
const int CANCEL_PROCESS = 2;
const int GOTO_1ST_ROW = 3;
const int LOGIN = 4;
const int TDS_ENV_DATABASE = 1;
const int TDS_ENV_LANG = 2;
const int TDS_ENV_CHARSET = 3;
const int TDS_ENV_PACKSIZE = 4;
const int TDS_ENV_LCID = 5;
const int TDS_ENV_SQLCOLLATION = 7;
const int TDS_NULLTERM = -9;
const int TDS_SP_CURSOR = 1;
const int TDS_SP_CURSOROPEN = 2;
const int TDS_SP_CURSORPREPARE = 3;
const int TDS_SP_CURSOREXECUTE = 4;
const int TDS_SP_CURSORPREPEXEC = 5;
const int TDS_SP_CURSORUNPREPARE = 6;
const int TDS_SP_CURSORFETCH = 7;
const int TDS_SP_CURSOROPTION = 8;
const int TDS_SP_CURSORCLOSE = 9;
const int TDS_SP_EXECUTESQL = 10;
const int TDS_SP_PREPARE = 11;
const int TDS_SP_EXECUTE = 12;
const int TDS_SP_PREPEXEC = 13;
const int TDS_SP_PREPEXECRPC = 14;
const int TDS_SP_UNPREPARE = 15;
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
const int TDS_MAX_CAPABILITY = 22;
const int MAXPRECISION = 80;
const int TDS_MAX_CONN = 4096;
const int TDS_MAX_DYNID_LEN = 30;
const int TDS_DEF_BLKSZ = 512;
const int TDS_DEF_MAJOR = 5;
const int TDS_DEF_MINOR = 0;
const int TDS_DEF_PORT = 4000;
const int TDS_MAX_LOGIN_STR_SZ = 30;
const int TDS_UT_TIMESTAMP = 80;
const int TDS_DBGFLAG_FUNC = 0x80;
const int TDS_DBGFLAG_INFO2 = 0x40;
const int TDS_DBGFLAG_INFO1 = 0x20;
const int TDS_DBGFLAG_NETWORK = 0x10;
const int TDS_DBGFLAG_WARN = 0x08;
const int TDS_DBGFLAG_ERROR = 0x04;
const int TDS_DBGFLAG_SEVERE = 0x02;
const int TDS_DBGFLAG_PID = 0x1000;
const int TDS_DBGFLAG_TIME = 0x2000;
const int TDS_DBGFLAG_SOURCE = 0x4000;
const int TDS_DBGFLAG_THREAD = 0x8000;
import bcd.freetds.tds_sysdep_public;
import bcd.freetds.tdsver;
alias tds_answer TDSANSWER;
alias void function(char *, char *, void *) _BCD_func__740;
alias _BCD_func__740 TDSCONFPARSE;
enum TDS_ICONV_ENTRY {
client2ucs2=0,
client2server_chardata=1,
iso2server_metadata=2,
initial_char_conv_count=3,
}
alias tds_context TDSCONTEXT;
alias tds_locale TDSLOCALE;
alias tds_socket TDSSOCKET;
alias tds_message TDSMESSAGE;
alias int function(tds_context *, tds_socket *, tds_message *) _BCD_func__1382;
alias tds_multiple TDSMULTIPLE;
enum TDS_MULTIPLE_TYPE {
TDS_MULTIPLE_QUERY=0,
TDS_MULTIPLE_EXECUTE=1,
TDS_MULTIPLE_RPC=2,
}
alias tds_dynamic TDSDYNAMIC;
alias int TDS_INT;
alias tds_result_info TDSRESULTINFO;
alias tds_result_info TDSPARAMINFO;
alias tds_env TDSENV;
alias _tds_cursor TDSCURSOR;
alias char TDS_TINYINT;
alias ushort TDS_USMALLINT;
alias tds_upd_col TDSUPDCOL;
alias _tds_cursor_status TDS_CURSOR_STATUS;
alias short TDS_SMALLINT;
enum TDS_CURSOR_STATE {
TDS_CURSOR_STATE_UNACTIONED=0,
TDS_CURSOR_STATE_REQUESTED=1,
TDS_CURSOR_STATE_SENT=2,
TDS_CURSOR_STATE_ACTIONED=3,
}
alias uint TDS_UINT;
alias char TDS_CHAR;
alias tds_result_info TDSCOMPUTEINFO;
enum TDS_DBG_LOG_STATE {
TDS_DBG_LOGIN=1,
TDS_DBG_API=2,
TDS_DBG_ASYNC=4,
TDS_DBG_DIAG=8,
TDS_DBG_error=16,
TDS_DBG_PACKET=32,
TDS_DBG_LIBTDS=64,
TDS_DBG_CONFIG=128,
TDS_DBG_DEFAULT=254,
}
enum _TDS_STATE {
TDS_IDLE=0,
TDS_QUERYING=1,
TDS_PENDING=2,
TDS_READING=3,
TDS_DEAD=4,
}
alias int TDS_STATE;
alias tds_column TDSCOLUMN;
alias void TDSICONV;
alias char TDS_UCHAR;
alias _tds_bcpcoldata BCPCOLDATA;
enum __18 {
TDS_SYSNAME_SIZE=512,
}
const int TDS_SYSNAME_SIZE = 512;
alias _tds_encoding TDS_ENCODING;
alias tds_blob TDSBLOB;
alias tds_connection TDSCONNECTION;
alias DSTR_STRUCT * DSTR;
alias tds_login TDSLOGIN;
enum tds_packet_type {
TDS_QUERY=1,
TDS_RPC=3,
TDS_CANCEL=6,
TDS_BULK=7,
TDS_NORMAL=15,
}
alias int TDS_PACKET_TYPE;
enum TDS_OPT_ISOLATION_CHOICE {
TDS_OPT_LEVEL1=1,
TDS_OPT_LEVEL3=3,
}
enum TDS_OPT_DATEFORMAT_CHOICE {
TDS_OPT_FMTMDY=1,
TDS_OPT_FMTDMY=2,
TDS_OPT_FMTYMD=3,
TDS_OPT_FMTYDM=4,
TDS_OPT_FMTMYD=5,
TDS_OPT_FMTDYM=6,
}
enum TDS_OPT_DATEFIRST_CHOICE {
TDS_OPT_MONDAY=1,
TDS_OPT_TUESDAY=2,
TDS_OPT_WEDNESDAY=3,
TDS_OPT_THURSDAY=4,
TDS_OPT_FRIDAY=5,
TDS_OPT_SATURDAY=6,
TDS_OPT_SUNDAY=7,
}
enum __15 {
TDS_OPT_ARITHOVERFLOW=1,
TDS_OPT_NUMERICTRUNC=2,
}
const int TDS_OPT_ARITHOVERFLOW = 1;
const int TDS_OPT_NUMERICTRUNC = 2;
alias tds_option_arg TDS_OPTION_ARG;
enum TDS_OPTION {
TDS_OPT_DATEFIRST=1,
TDS_OPT_TEXTSIZE=2,
TDS_OPT_STAT_TIME=3,
TDS_OPT_STAT_IO=4,
TDS_OPT_ROWCOUNT=5,
TDS_OPT_NATLANG=6,
TDS_OPT_DATEFORMAT=7,
TDS_OPT_ISOLATION=8,
TDS_OPT_AUTHON=9,
TDS_OPT_CHARSET=10,
TDS_OPT_SHOWPLAN=13,
TDS_OPT_NOEXEC=14,
TDS_OPT_ARITHIGNOREON=15,
TDS_OPT_ARITHABORTON=17,
TDS_OPT_PARSEONLY=18,
TDS_OPT_GETDATA=20,
TDS_OPT_NOCOUNT=21,
TDS_OPT_FORCEPLAN=23,
TDS_OPT_FORMATONLY=24,
TDS_OPT_CHAINXACTS=25,
TDS_OPT_CURCLOSEONXACT=26,
TDS_OPT_FIPSFLAG=27,
TDS_OPT_RESTREES=28,
TDS_OPT_IDENTITYON=29,
TDS_OPT_CURREAD=30,
TDS_OPT_CURWRITE=31,
TDS_OPT_IDENTITYOFF=32,
TDS_OPT_AUTHOFF=33,
TDS_OPT_ANSINULL=34,
TDS_OPT_QUOTED_IDENT=35,
TDS_OPT_ARITHIGNOREOFF=36,
TDS_OPT_ARITHABORTOFF=37,
TDS_OPT_TRUNCABORT=38,
}
enum TDS_OPTION_CMD {
TDS_OPT_SET=1,
TDS_OPT_DEFAULT=2,
TDS_OPT_LIST=3,
TDS_OPT_INFO=4,
}
enum TDS_USER_TYPE {
USER_UNICHAR_TYPE=34,
USER_UNIVARCHAR_TYPE=35,
}
enum TDS_SERVER_TYPE {
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
SYBNTEXT=99,
SYBIMAGE=34,
SYBMONEY4=122,
SYBMONEY=60,
SYBDATETIME4=58,
SYBREAL=59,
SYBBINARY=45,
SYBVOID=31,
SYBVARBINARY=37,
SYBNVARCHAR=103,
SYBBITN=104,
SYBNUMERIC=108,
SYBDECIMAL=106,
SYBFLTN=109,
SYBMONEYN=110,
SYBDATETIMN=111,
XSYBCHAR=175,
XSYBVARCHAR=167,
XSYBNVARCHAR=231,
XSYBNCHAR=239,
XSYBVARBINARY=165,
XSYBBINARY=173,
SYBLONGBINARY=225,
SYBSINT1=64,
SYBUINT2=65,
SYBUINT4=66,
SYBUINT8=67,
SYBUNIQUE=36,
SYBVARIANT=98,
}
enum __10 {
TDS_CUR_ISTAT_UNUSED=0,
TDS_CUR_ISTAT_DECLARED=1,
TDS_CUR_ISTAT_OPEN=2,
TDS_CUR_ISTAT_CLOSED=4,
TDS_CUR_ISTAT_RDONLY=8,
TDS_CUR_ISTAT_UPDATABLE=16,
TDS_CUR_ISTAT_ROWCNT=32,
TDS_CUR_ISTAT_DEALLOC=64,
}
const int TDS_CUR_ISTAT_UNUSED = 0;
const int TDS_CUR_ISTAT_DECLARED = 1;
const int TDS_CUR_ISTAT_OPEN = 2;
const int TDS_CUR_ISTAT_CLOSED = 4;
const int TDS_CUR_ISTAT_RDONLY = 8;
const int TDS_CUR_ISTAT_UPDATABLE = 16;
const int TDS_CUR_ISTAT_ROWCNT = 32;
const int TDS_CUR_ISTAT_DEALLOC = 64;
enum tds_end {
TDS_DONE_FINAL=0,
TDS_DONE_MORE_RESULTS=1,
TDS_DONE_ERROR=2,
TDS_DONE_INXACT=4,
TDS_DONE_PROC=8,
TDS_DONE_COUNT=16,
TDS_DONE_CANCELLED=32,
TDS_DONE_EVENT=64,
TDS_DONE_SRVERROR=256,
TDS_DONE_NO_TRAN=0,
TDS_DONE_TRAN_SUCCEED=1,
TDS_DONE_TRAN_PROGRESS=2,
TDS_DONE_STMT_ABORT=3,
TDS_DONE_TRAN_ABORT=4,
}
enum tds_token_flags {
TDS_HANDLE_ALL=0,
TDS_RETURN_OTHERS=1,
TDS_STOPAT_OTHERS=2,
TDS_RETURN_ROWFMT=4,
TDS_STOPAT_ROWFMT=8,
TDS_RETURN_COMPUTEFMT=16,
TDS_STOPAT_COMPUTEFMT=32,
TDS_RETURN_PARAMFMT=64,
TDS_STOPAT_PARAMFMT=128,
TDS_RETURN_DONE=256,
TDS_STOPAT_DONE=512,
TDS_RETURN_ROW=1024,
TDS_STOPAT_ROW=2048,
TDS_RETURN_COMPUTE=4096,
TDS_STOPAT_COMPUTE=8192,
TDS_RETURN_PROC=16384,
TDS_STOPAT_PROC=32768,
TDS_RETURN_MSG=65536,
TDS_STOPAT_MSG=131072,
TDS_TOKEN_RESULTS=26900,
TDS_TOKEN_TRAILING=141354,
}
enum tds_token_results {
TDS_TOKEN_RES_OTHERS=0,
TDS_TOKEN_RES_ROWFMT=1,
TDS_TOKEN_RES_COMPUTEFMT=2,
TDS_TOKEN_RES_PARAMFMT=3,
TDS_TOKEN_RES_DONE=4,
TDS_TOKEN_RES_ROW=5,
TDS_TOKEN_RES_COMPUTE=6,
TDS_TOKEN_RES_PROC=7,
TDS_TOKEN_RES_MSG=8,
}
alias tdsdaterec TDSDATEREC;
alias tdsunique TDS_UNIQUE;
alias tdsvarchar TDS_VARCHAR;
alias tdsvarbinary TDS_VARBINARY;
alias tdsdatetime4 TDS_DATETIME4;
alias tdsdatetime TDS_DATETIME;
alias tdsmoney4 TDS_MONEY4;
alias tdsmoney TDS_MONEY;
alias tdsoldmoney TDS_OLD_MONEY;
alias long TDS_INT8;
alias tdsnumeric TDS_NUMERIC;
alias int TDS_INTPTR;
alias ulong TDS_UINT8;
alias double TDS_FLOAT;
alias float TDS_REAL;
alias _tds_compiletime_settings TDS_COMPILETIME_SETTINGS;
alias int function(void *, uint) _BCD_func__1416;
alias void function(tds_socket *, int, char *, char *) _BCD_func__1417;
extern (C) void tds_answer_challenge(char * passwd, char * challenge, tds_answer * answer);
extern (C) void tds_getmac(int s, char * mac);
extern (C) int tds_numeric_change_prec_scale(tdsnumeric * numeric, char new_prec, char new_scale);
extern (C) int tds_numeric_to_string(tdsnumeric * numeric, char * s);
extern (C) char * tds_money_to_string(tdsmoney * money, char * s);
extern (C) int tds_vstrbuild(char * buffer, int buflen, int * resultlen, char * text, int textlen, char * formats, int formatlen, char * ap);
extern (C) void tds_ssl_deinit(tds_socket * tds);
extern (C) int tds_ssl_init(tds_socket * tds);
extern (C) int tds7_get_instance_port(char * ip_addr, char * instance);
extern (C) int tds_write_packet(tds_socket * tds, char final_);
extern (C) int tds_read_packet(tds_socket * tds);
extern (C) int tds_close_socket(tds_socket * tds);
extern (C) int tds_open_socket(tds_socket * tds, char * ip_addr, uint port, int timeout);
extern (C) void tdsdump_log(char * file, uint level_line, char * fmt, ...);
extern (C) void tdsdump_dump_buf(char * file, uint level_line, char * msg, void * buf, int length);
extern (C) void tdsdump_close();
extern (C) int tdsdump_open(char * filename);
extern (C) void tdsdump_on();
extern (C) void tdsdump_off();
extern (C) int tds_version(tds_socket * tds_socket, char * pversion_string);
extern (C) int tds_swap_bytes(char * buf, int bytes);
extern (C) void * tds_get_parent(tds_socket * tds);
extern (C) void tds_set_parent(tds_socket * tds, void * the_parent);
extern (C) int tds_set_state(tds_socket * tds, int state);
extern (C) int tds_get_size_by_type(int servertype);
extern (C) void * tds_get_n(tds_socket * tds, void * dest, int n);
extern (C) int tds_get_char_data(tds_socket * tds, char * dest, uint wire_size, tds_column * curcol);
extern (C) int tds_get_string(tds_socket * tds, int string_len, char * dest, uint dest_size);
extern (C) int tds_get_int(tds_socket * tds);
extern (C) short tds_get_smallint(tds_socket * tds);
extern (C) char tds_peek(tds_socket * tds);
extern (C) void tds_unget_byte(tds_socket * tds);
extern (C) char tds_get_byte(tds_socket * tds);
extern (C) int tds_put_buf(tds_socket * tds, char * buf, int dsize, int ssize);
extern (C) int tds_flush_packet(tds_socket * tds);
extern (C) int tds_get_conversion_type(int srctype, int colsize);
extern (C) int tds_datecrack(int datetype, void * di, tdsdaterec * dr);
extern (C) void tds_set_column_type(tds_column * curcol, int type);
extern (C) void tds_set_param_type(tds_socket * tds, tds_column * curcol, int type);
extern (C) int tds_process_tokens(tds_socket * tds, int * result_type, int * done_flags, uint flag);
extern (C) int tds_client_msg(tds_context * tds_ctx, tds_socket * tds, int msgno, int severity, int state, int line, char * message);
extern (C) int tds5_send_optioncmd(tds_socket * tds, int tds_command, int tds_option, tds_option_arg * tds_argument, int * tds_argsize);
extern (C) int tds_process_simple_query(tds_socket * tds);
extern (C) void tds_add_row_column_size(tds_result_info * info, tds_column * curcol);
extern (C) int tds_process_login_tokens(tds_socket * tds);
extern (C) int tds_get_token_size(int marker);
extern (C) void tds_swap_numeric(tdsnumeric * num);
extern (C) void tds_swap_datatype(int coltype, char * buf);
extern (C) int tds_process_cancel(tds_socket * tds);
extern (C) int tds_multiple_execute(tds_socket * tds, tds_multiple * multiple, tds_dynamic * dyn);
extern (C) int tds_multiple_query(tds_socket * tds, tds_multiple * multiple, char * query, tds_result_info * params);
extern (C) int tds_multiple_done(tds_socket * tds, tds_multiple * multiple);
extern (C) int tds_multiple_init(tds_socket * tds, tds_multiple * multiple, int type);
extern (C) int tds_cursor_dealloc(tds_socket * tds, _tds_cursor * cursor);
extern (C) int tds_cursor_close(tds_socket * tds, _tds_cursor * cursor);
extern (C) int tds_cursor_fetch(tds_socket * tds, _tds_cursor * cursor);
extern (C) int tds_cursor_open(tds_socket * tds, _tds_cursor * cursor, int * send);
extern (C) int tds_cursor_setrows(tds_socket * tds, _tds_cursor * cursor, int * send);
extern (C) int tds_cursor_declare(tds_socket * tds, _tds_cursor * cursor, int * send);
extern (C) char * tds_skip_quoted(char * s);
extern (C) int tds_quote_string(tds_socket * tds, char * buffer, char * str, int len);
extern (C) int tds_quote_id(tds_socket * tds, char * buffer, char * id, int idlen);
extern (C) int tds_submit_optioncmd(tds_socket * tds, int command, int option, tds_option_arg * param, int param_size);
extern (C) int tds_submit_rpc(tds_socket * tds, char * rpc_name, tds_result_info * params);
extern (C) int tds_submit_unprepare(tds_socket * tds, tds_dynamic * dyn);
extern (C) int tds_get_dynid(tds_socket * tds, char * * id);
extern (C) int tds_count_placeholders(char * query);
extern (C) char * tds_next_placeholder(char * start);
extern (C) int tds_send_cancel(tds_socket * tds);
extern (C) int tds_submit_execute(tds_socket * tds, tds_dynamic * dyn);
extern (C) int tds_submit_execdirect(tds_socket * tds, char * query, tds_result_info * params);
extern (C) int tds_submit_prepare(tds_socket * tds, char * query, char * id, tds_dynamic * * dyn_out, tds_result_info * params);
extern (C) int tds_submit_queryf(tds_socket * tds, char * queryf, ...);
extern (C) int tds_submit_query_params(tds_socket * tds, char * query, tds_result_info * params);
extern (C) int tds_submit_query(tds_socket * tds, char * query);
extern (C) int tds_connect(tds_socket * tds, tds_connection * connection);
extern (C) void tds_set_capabilities(tds_login * tds_login, char * capabilities, int size);
extern (C) void tds_set_version(tds_login * tds_login, short major_ver, short minor_ver);
extern (C) void tds_set_language(tds_login * tds_login, char * language);
extern (C) void tds_set_client_charset(tds_login * tds_login, char * charset);
extern (C) void tds_set_server(tds_login * tds_login, char * server);
extern (C) void tds_set_library(tds_login * tds_login, char * library);
extern (C) void tds_set_server_addr(tds_login * tds_login, char * server_addr);
extern (C) void tds_set_host(tds_login * tds_login, char * hostname);
extern (C) void tds_set_app(tds_login * tds_login, char * application);
extern (C) void tds_set_user(tds_login * tds_login, char * username);
extern (C) void tds_set_bulk(tds_login * tds_login, char enabled);
extern (C) void tds_set_passwd(tds_login * tds_login, char * password);
extern (C) void tds_set_port(tds_login * tds_login, int port);
extern (C) void tds_set_packet(tds_login * tds_login, int packet_size);
extern (C) int tds7_send_auth(tds_socket * tds, char * challenge);
extern (C) void tds_free_row(tds_result_info * res_info, char * row);
extern (C) _tds_cursor * tds_alloc_cursor(tds_socket * tds, char * name, int namelen, char * query, int querylen);
extern (C) void tds_free_locale(tds_locale * locale);
extern (C) tds_locale * tds_alloc_locale();
extern (C) tds_connection * tds_alloc_connection(tds_locale * locale);
extern (C) void tds_free_login(tds_login * login);
extern (C) tds_dynamic * tds_alloc_dynamic(tds_socket * tds, char * id);
extern (C) tds_login * tds_alloc_login();
extern (C) char * tds_alloc_lookup_sqlstate(tds_socket * tds, int msgno);
extern (C) char * tds_alloc_client_sqlstate(int msgno);
extern (C) char * tds_alloc_param_row(tds_result_info * info, tds_column * curparam);
extern (C) tds_socket * tds_realloc_socket(tds_socket * tds, int bufsize);
extern (C) void tds_free_dynamic(tds_socket * tds, tds_dynamic * dyn);
extern (C) void tds_free_input_params(tds_dynamic * dyn);
extern (C) tds_result_info * tds_alloc_param_result(tds_result_info * old_param);
extern (C) char * tds_get_homedir();
extern (C) void * tds_getservbyname_r(char * name, char * proto, void * result, char * buffer, int buflen);
extern (C) void * tds_gethostbyaddr_r(char * addr, int len, int type, void * result, char * buffer, int buflen, int * h_errnop);
extern (C) void * tds_gethostbyname_r(char * servername, void * result, char * buffer, int buflen, int * h_errnop);
extern (C) char * tds_timestamp_str(char * str, int maxlen);
extern (C) void * tds_iconv_from_collate(tds_socket * tds, int sql_collate, int lcid);
extern (C) void tds_iconv_free(tds_socket * tds);
extern (C) int tds_iconv_alloc(tds_socket * tds);
extern (C) void tds7_srv_charset_changed(tds_socket * tds, int sql_collate, int lcid);
extern (C) void tds_srv_charset_changed(tds_socket * tds, char * charset);
extern (C) void tds_iconv_close(tds_socket * tds);
extern (C) void tds_iconv_open(tds_socket * tds, char * charset);
extern (C) char * tds_prtype(int token);
extern (C) tds_dynamic * tds_lookup_dynamic(tds_socket * tds, char * id);
extern (C) char * tds7_crypt_pass(char * clear_pass, int len, char * crypt_pass);
extern (C) int tds_alloc_get_string(tds_socket * tds, char * * string, int len);
extern (C) _tds_bcpcoldata * tds_alloc_bcp_column_data(int column_size);
extern (C) char * tds_alloc_compute_row(tds_result_info * res_info);
extern (C) char * tds_alloc_row(tds_result_info * res_info);
extern (C) tds_locale * tds_get_locale();
extern (C) int tds_set_interfaces_file_loc(char * interfloc);
extern (C) void tds_lookup_host(char * servername, char * ip);
extern (C) void tds_config_verstr(char * tdsver, tds_connection * connection);
extern (C) void tds_fix_connection(tds_connection * connection);
extern (C) tds_connection * tds_read_config_info(tds_socket * tds, tds_login * login, tds_locale * locale);
extern (C) int tds_read_conf_file(tds_connection * connection, char * server);
extern (C) int tds_read_conf_section(_IO_FILE * in_, char * section, _BCD_func__740 tds_conf_parse, void * parse_param);
extern (C) _tds_compiletime_settings * tds_get_compiletime_settings();
extern (C) tds_socket * tds_alloc_socket(tds_context * context, int bufsize);
extern (C) void tds_free_context(tds_context * locale);
extern (C) tds_context * tds_alloc_context(void * parent);
extern (C) tds_result_info * * tds_alloc_compute_results(tds_socket * tds, int num_cols, int by_cols);
extern (C) tds_result_info * tds_alloc_results(int num_cols);
extern (C) int tds_put_byte(tds_socket * tds, char c);
extern (C) int tds_put_smallint(tds_socket * tds, short si);
extern (C) int tds_put_int8(tds_socket * tds, long i);
extern (C) int tds_put_int(tds_socket * tds, int i);
extern (C) int tds_put_string(tds_socket * tds, char * buf, int len);
extern (C) int tds_put_n(tds_socket * tds, void * buf, int n);
extern (C) void tds_free_bcp_column_data(_tds_bcpcoldata * coldata);
extern (C) void tds_free_cursor(tds_socket * tds, _tds_cursor * cursor);
extern (C) void tds_free_msg(tds_message * message);
extern (C) void tds_free_param_result(tds_result_info * param_info);
extern (C) void tds_free_param_results(tds_result_info * param_info);
extern (C) void tds_free_results(tds_result_info * res_info);
extern (C) void tds_free_all_results(tds_socket * tds);
extern (C) void tds_free_connection(tds_connection * connection);
extern (C) void tds_free_socket(tds_socket * tds);
extern (C) void tds_free_result_info(tds_result_info * info);
extern (C) int tds_init_write_buf(tds_socket * tds);
struct tds_answer {
char [24] lm_resp;
char [24] nt_resp;
}
struct tds_context {
tds_locale * locale;
void * parent;
_BCD_func__1382 msg_handler;
_BCD_func__1382 err_handler;
}
struct tds_multiple {
int type;
uint flags;
}
struct tds_dynamic {
tds_dynamic * next;
char [30] id;
int dyn_state;
int num_id;
tds_result_info * res_info;
tds_result_info * params;
int emulated;
char * query;
}
struct tds_env {
int block_size;
char * language;
char * charset;
char * database;
}
struct _tds_cursor {
_tds_cursor * next;
int length;
char cursor_name_len;
char * cursor_name;
int cursor_id;
char options;
char hasargs;
ushort query_len;
char * query;
char number_upd_cols;
int cursor_rows;
tds_upd_col * cur_col_list;
_tds_cursor_status status;
short srv_status;
tds_result_info * res_info;
}
struct _tds_cursor_status {
int declare;
int cursor_row;
int open;
int fetch;
int close;
int dealloc;
}
struct tds_upd_col {
tds_upd_col * next;
int colnamelength;
char * columnname;
}
struct tds_message {
short priv_msg_type;
short line_number;
uint msgno;
short state;
short severity;
char * server;
char * message;
char * proc_name;
char * sql_state;
}
struct tds_result_info {
short num_cols;
tds_column * * columns;
int row_size;
int ref_count;
char * current_row;
short rows_exist;
int row_count;
char more_results;
short computeid;
short * bycolumns;
short by_cols;
}
struct N10tds_column4__19E {
short column_type;
int column_size;
}
struct tds_column {
short column_type;
int column_usertype;
int column_flags;
int column_size;
char column_varint_size;
char column_prec;
char column_scale;
short column_namelen;
short table_namelen;
N10tds_column4__19E on_server;
void * char_conv;
char [512] table_name;
char [512] column_name;
int column_offset;
uint column_nullable;
uint column_writeable;
uint column_identity;
uint column_key;
uint column_hidden;
uint column_output;
uint column_timestamp;
char [5] column_collation;
char column_operator;
short column_operand;
int column_cur_size;
short column_bindtype;
short column_bindfmt;
uint column_bindlen;
short * column_nullbind;
char * column_varaddr;
int * column_lenbind;
int column_textpos;
int column_text_sqlgetdatapos;
_tds_bcpcoldata * bcp_column_data;
int bcp_prefix_len;
int bcp_term_len;
char * bcp_terminator;
}
struct _tds_bcpcoldata {
char * data;
int datalen;
int null_column;
}
struct _tds_encoding {
char * name;
char min_bytes_per_char;
char max_bytes_per_char;
}
struct TDS8_COLLATION {
ushort locale_id;
ushort flags;
char charset_id;
}
struct tds_blob {
char * textvalue;
char [16] textptr;
char [8] timestamp;
}
struct tds_locale {
char * language;
char * char_set;
char * date_fmt;
}
struct tds_connection {
DSTR_STRUCT * server_name;
int port;
char major_version;
char minor_version;
int block_size;
DSTR_STRUCT * language;
DSTR_STRUCT * server_charset;
int connect_timeout;
DSTR_STRUCT * host_name;
DSTR_STRUCT * app_name;
DSTR_STRUCT * user_name;
DSTR_STRUCT * password;
DSTR_STRUCT * library;
char bulk_copy;
char suppress_language;
char encrypted;
int query_timeout;
char [22] capabilities;
DSTR_STRUCT * client_charset;
DSTR_STRUCT * ip_addr;
DSTR_STRUCT * instance_name;
DSTR_STRUCT * database;
DSTR_STRUCT * dump_file;
int debug_flags;
int text_size;
int broken_dates;
int broken_money;
int emul_little_endian;
}
struct tds_login {
DSTR_STRUCT * server_name;
DSTR_STRUCT * server_addr;
int port;
char major_version;
char minor_version;
int block_size;
DSTR_STRUCT * language;
DSTR_STRUCT * server_charset;
int connect_timeout;
DSTR_STRUCT * host_name;
DSTR_STRUCT * app_name;
DSTR_STRUCT * user_name;
DSTR_STRUCT * password;
DSTR_STRUCT * library;
char bulk_copy;
char suppress_language;
char encrypted;
int query_timeout;
char [22] capabilities;
DSTR_STRUCT * client_charset;
}
union tds_align_struct {
void * p;
int i;
}
union tds_option_arg {
char ti;
int i;
char * c;
}
struct tdsdaterec {
int year;
int month;
int day;
int dayofyear;
int weekday;
int hour;
int minute;
int second;
int millisecond;
int tzone;
}
struct tdsunique {
uint Data1;
ushort Data2;
ushort Data3;
char [8] Data4;
}
struct tdsvarchar {
int len;
char [256] array;
}
struct tdsvarbinary {
short len;
char [256] array;
}
struct tdsdatetime4 {
ushort days;
ushort minutes;
}
struct tdsdatetime {
int dtdays;
int dttime;
}
struct tdsmoney4 {
int mny4;
}
union tdsmoney {
tdsoldmoney tdsoldmoney_;
long mny;
}
struct tdsoldmoney {
int mnyhigh;
uint mnylow;
}
struct tdsnumeric {
char precision;
char scale;
char [33] array;
}
struct DSTR_STRUCT {
char [1] dstr_s;
}
struct _tds_compiletime_settings {
char * freetds_version;
char * last_update;
int msdblib;
int sybase_compat;
int threadsafe;
int libiconv;
char * tdsver;
int iodbc;
int unixodbc;
}
struct tds_socket {
int s;
short major_version;
short minor_version;
uint product_version;
char * product_name;
char [22] capabilities;
char broken_dates;
char option_flag2;
char * in_buf;
char * out_buf;
uint in_buf_max;
uint in_pos;
uint out_pos;
uint in_len;
char in_flag;
char out_flag;
char last_packet;
void * parent;
tds_result_info * current_results;
tds_result_info * res_info;
int num_comp_info;
tds_result_info * * comp_info;
tds_result_info * param_info;
_tds_cursor * cur_cursor;
_tds_cursor * cursors;
char has_status;
int ret_status;
int state;
char in_cancel;
int rows_affected;
int query_timeout;
_BCD_func__1416 query_timeout_func;
void * query_timeout_param;
int query_start_time;
tds_env env;
tds_dynamic * cur_dyn;
tds_dynamic * dyns;
int emul_little_endian;
char * date_fmt;
tds_context * tds_ctx;
int char_conv_count;
void * * char_convs;
tds_connection * connection;
int spid;
char [5] collation;
_BCD_func__1417 env_chg_func;
int internal_sp_called;
void * tls_session;
void * tls_credentials;
int option_value;
}
extern (C) int tds_debug_flags;
extern (C) char [1] tds_hex_digits;
extern (C) int [1] tds_numeric_bytes_per_prec;
extern (C) void * [2] no_unused_tds_h_warn;
extern (C) char [54] rcsid_tds_h;
