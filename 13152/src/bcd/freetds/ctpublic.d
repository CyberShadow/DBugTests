/* THIS FILE GENERATED BY bcd.gen */
module bcd.freetds.ctpublic;
import bcd.freetds.cspublic;
import bcd.freetds.cstypes;
import bcd.freetds.tds_sysdep_public;
extern (C) int ct_diag(void * conn, int operation, int type, int idx, void * buffer);
extern (C) int ct_cursor(void * cmd, int type, char * name, int namelen, char * text, int tlen, int option);
extern (C) int ct_poll(void * ctx, void * connection, int milliseconds, void * * compconn, void * * compcmd, int * compid, int * compstatus);
extern (C) int ct_options(void * con, int action, int option, void * param, int paramlen, int * outlen);
extern (C) int ct_setparam(void * cmd, _cs_datafmt * datafmt, void * data, int * datalen, short * indicator);
extern (C) int ct_param(void * cmd, _cs_datafmt * datafmt, void * data, int datalen, short indicator);
extern (C) int ct_dynamic(void * cmd, int type, char * id, int idlen, char * buffer, int buflen);
extern (C) int ct_capability(void * con, int action, int type, int capability, void * value);
extern (C) int ct_data_info(void * cmd, int action, int colnum, _cs_iodesc * iodesc);
extern (C) int ct_send_data(void * cmd, void * buffer, int buflen);
extern (C) int ct_get_data(void * cmd, int item, void * buffer, int buflen, int * outlen);
extern (C) int ct_compute_info(void * cmd, int type, int colnum, void * buffer, int buflen, int * outlen);
extern (C) int ct_cmd_props(void * cmd, int action, int property, void * buffer, int buflen, int * outlen);
extern (C) int ct_config(void * ctx, int action, int property, void * buffer, int buflen, int * outlen);
extern (C) int ct_results_dyn(void * cmd, int * result_type);
extern (C) int ct_send_dyn(void * cmd);
extern (C) int ct_callback(void * ctx, void * con, int action, int type, void * func);
extern (C) int ct_describe(void * cmd, int item, _cs_datafmt * datafmt);
extern (C) int ct_res_info(void * cmd, int type, void * buffer, int buflen, int * out_len);
extern (C) int ct_res_info_dyn(void * cmd, int type, void * buffer, int buflen, int * out_len);
extern (C) int ct_fetch(void * cmd, int type, int offset, int option, int * rows_read);
extern (C) int ct_bind(void * cmd, int item, _cs_datafmt * datafmt, void * buffer, int * copied, short * indicator);
extern (C) int ct_results(void * cmd, int * result_type);
extern (C) int ct_send(void * cmd);
extern (C) int ct_command(void * cmd, int type, void * buffer, int buflen, int option);
extern (C) int ct_exit(void * ctx, int unused);
extern (C) int ct_con_drop(void * con);
extern (C) int ct_close(void * con, int option);
extern (C) int ct_cmd_drop(void * cmd);
extern (C) int ct_cancel(void * conn, void * cmd, int type);
extern (C) int ct_cmd_alloc(void * con, void * * cmd);
extern (C) int ct_connect(void * con, char * servername, int snamelen);
extern (C) int ct_con_props(void * con, int action, int property, void * buffer, int buflen, int * out_len);
extern (C) int ct_con_alloc(void * ctx, void * * con);
extern (C) int ct_init(void * ctx, int version_);
extern (C) void * [2] no_unused_ctpublic_h_warn;
extern (C) char [58] rcsid_ctpublic_h;
