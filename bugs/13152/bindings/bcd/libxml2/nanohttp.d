/* THIS FILE GENERATED BY bcd.gen */
module bcd.libxml2.nanohttp;
align(4):
public import bcd.libxml2.xmlversion;
extern (C) void xmlNanoHTTPClose(void *);
extern (C) int xmlNanoHTTPSave(void *, char *);
extern (C) int xmlNanoHTTPRead(void *, void *, int);
extern (C) char * xmlNanoHTTPMimeType(void *);
extern (C) char * xmlNanoHTTPEncoding(void *);
extern (C) int xmlNanoHTTPContentLength(void *);
extern (C) char * xmlNanoHTTPRedir(void *);
extern (C) char * xmlNanoHTTPAuthHeader(void *);
extern (C) int xmlNanoHTTPReturnCode(void *);
extern (C) void * xmlNanoHTTPOpenRedir(char *, char * *, char * *);
extern (C) void * xmlNanoHTTPOpen(char *, char * *);
extern (C) void * xmlNanoHTTPMethodRedir(char *, char *, char *, char * *, char * *, char *, int);
extern (C) void * xmlNanoHTTPMethod(char *, char *, char *, char * *, char *, int);
extern (C) int xmlNanoHTTPFetch(char *, char *, char * *);
extern (C) void xmlNanoHTTPScanProxy(char *);
extern (C) void xmlNanoHTTPCleanup();
extern (C) void xmlNanoHTTPInit();
