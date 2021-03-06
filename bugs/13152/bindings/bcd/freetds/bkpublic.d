/* THIS FILE GENERATED BY bcd.gen */
module bcd.freetds.bkpublic;
const int BLK_IDENTITY = 1;
import bcd.freetds.cspublic;
import bcd.freetds.cstypes;
import bcd.freetds.tds_sysdep_public;
extern (C) int blk_textxfer(void * blkdesc, char * buffer, int buflen, int * outlen);
extern (C) int blk_srvinit(void * srvproc, void * blkdescp);
extern (C) int blk_sendtext(void * blkdesc, void * row, char * buffer, int buflen);
extern (C) int blk_sendrow(void * blkdesc, void * row);
extern (C) int blk_rowxfer_mult(void * blkdesc, int * row_count);
extern (C) int blk_rowxfer(void * blkdesc);
extern (C) int blk_rowdrop(void * srvproc, void * row);
extern (C) int blk_rowalloc(void * srvproc, void * * row);
extern (C) int blk_props(void * blkdesc, int action, int property, void * buffer, int buflen, int * outlen);
extern (C) int blk_init(void * blkdesc, int direction, char * tablename, int tnamelen);
extern (C) int blk_gettext(void * srvproc, void * blkdescp, void * rowp, int bufsize, int * outlenp);
extern (C) int blk_getrow(void * srvproc, void * blkdescp, void * rowp);
extern (C) int blk_drop(void * blkdesc);
extern (C) int blk_done(void * blkdesc, int type, int * outrow);
extern (C) int blk_describe(void * blkdesc, int colnum, _cs_datafmt * datafmt);
extern (C) int blk_default(void * blkdesc, int colnum, void * buffer, int buflen, int * outlen);
extern (C) int blk_colval(void * srvproc, void * blkdescp, void * rowp, int colnum, void * valuep, int valuelen, int * outlenp);
extern (C) int blk_bind(void * blkdesc, int colnum, _cs_datafmt * datafmt, void * buffer, int * datalen, short * indicator);
extern (C) int blk_alloc(void * connection, int version_, void * * blk_pointer);
extern (C) void * [2] no_unused_bkpublic_h_warn;
extern (C) char [57] rcsid_bkpublic_h;
