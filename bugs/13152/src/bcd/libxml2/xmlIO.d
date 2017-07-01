/* THIS FILE GENERATED BY bcd.gen */
module bcd.libxml2.xmlIO;
align(4):
public import bcd.libxml2.globals;
public import bcd.libxml2.threads;
public import bcd.libxml2.xmlmemory;
public import bcd.libxml2.SAX2;
public import bcd.libxml2.SAX;
public import bcd.libxml2.xlink;
public import bcd.libxml2.parser;
public import bcd.libxml2.encoding;
public import bcd.libxml2.entities;
public import bcd.libxml2.hash;
public import bcd.libxml2.valid;
public import bcd.libxml2.xmlautomata;
public import bcd.libxml2.list;
public import bcd.libxml2.xmlerror;
public import bcd.libxml2.tree;
public import bcd.libxml2.xmlregexp;
public import bcd.libxml2.dict;
public import bcd.libxml2.xmlstring;
public import bcd.libxml2.xmlversion;
alias int function(void *, char *, int) _BCD_func__2302;
alias _BCD_func__2302 xmlOutputWriteCallback;
alias int function(void *) _BCD_func__1370;
alias _BCD_func__1370 xmlOutputCloseCallback;
alias int function(void *, char *, int) _BCD_func__2305;
alias _BCD_func__2305 xmlInputReadCallback;
alias _BCD_func__1370 xmlInputCloseCallback;
alias void * function(char *) _BCD_func__2303;
alias _BCD_func__2303 xmlOutputOpenCallback;
alias int function(char *) _BCD_func__2304;
alias _BCD_func__2304 xmlOutputMatchCallback;
alias _BCD_func__2303 xmlInputOpenCallback;
alias _BCD_func__2304 xmlInputMatchCallback;
extern (C) int xmlIOFTPClose(void *);
extern (C) int xmlIOFTPRead(void *, char *, int);
extern (C) void * xmlIOFTPOpen(char *);
extern (C) int xmlIOFTPMatch(char *);
extern (C) int xmlIOHTTPClose(void *);
extern (C) int xmlIOHTTPRead(void *, char *, int);
extern (C) void * xmlIOHTTPOpenW(char *, int);
extern (C) void * xmlIOHTTPOpen(char *);
extern (C) int xmlIOHTTPMatch(char *);
extern (C) int xmlFileClose(void *);
extern (C) int xmlFileRead(void *, char *, int);
extern (C) void * xmlFileOpen(char *);
extern (C) int xmlFileMatch(char *);
extern (C) int xmlCheckFilename(char *);
extern (C) char * xmlNormalizeWindowsPath(char *);
extern (C) _xmlParserInput * xmlNoNetExternalEntityLoader(char *, char *, _xmlParserCtxt *);
extern (C) _xmlParserInput * xmlCheckHTTPInput(_xmlParserCtxt *, _xmlParserInput *);
extern (C) void xmlRegisterHTTPPostCallbacks();
extern (C) _xmlOutputBuffer * __xmlOutputBufferCreateFilename(char *, _xmlCharEncodingHandler *, int);
extern (C) int xmlRegisterOutputCallbacks(_BCD_func__2304, _BCD_func__2303, _BCD_func__2302, _BCD_func__1370);
extern (C) int xmlOutputBufferClose(_xmlOutputBuffer *);
extern (C) int xmlOutputBufferFlush(_xmlOutputBuffer *);
alias int function(char *, int *, char *, int *) _BCD_func__1859;
extern (C) int xmlOutputBufferWriteEscape(_xmlOutputBuffer *, char *, _BCD_func__1859);
extern (C) int xmlOutputBufferWriteString(_xmlOutputBuffer *, char *);
extern (C) int xmlOutputBufferWrite(_xmlOutputBuffer *, int, char *);
extern (C) _xmlOutputBuffer * xmlOutputBufferCreateIO(_BCD_func__2302, _BCD_func__1370, void *, _xmlCharEncodingHandler *);
extern (C) _xmlOutputBuffer * xmlOutputBufferCreateFd(int, _xmlCharEncodingHandler *);
extern (C) _xmlOutputBuffer * xmlOutputBufferCreateFile(_IO_FILE *, _xmlCharEncodingHandler *);
extern (C) _xmlOutputBuffer * xmlOutputBufferCreateFilename(char *, _xmlCharEncodingHandler *, int);
extern (C) _xmlOutputBuffer * xmlAllocOutputBuffer(_xmlCharEncodingHandler *);
extern (C) void xmlRegisterDefaultOutputCallbacks();
extern (C) void xmlCleanupOutputCallbacks();
extern (C) _xmlParserInputBuffer * __xmlParserInputBufferCreateFilename(char *, int);
extern (C) int xmlRegisterInputCallbacks(_BCD_func__2304, _BCD_func__2303, _BCD_func__2305, _BCD_func__1370);
extern (C) char * xmlParserGetDirectory(char *);
extern (C) void xmlFreeParserInputBuffer(_xmlParserInputBuffer *);
extern (C) int xmlParserInputBufferPush(_xmlParserInputBuffer *, int, char *);
extern (C) int xmlParserInputBufferGrow(_xmlParserInputBuffer *, int);
extern (C) int xmlParserInputBufferRead(_xmlParserInputBuffer *, int);
extern (C) _xmlParserInputBuffer * xmlParserInputBufferCreateIO(_BCD_func__2305, _BCD_func__1370, void *, int);
extern (C) _xmlParserInputBuffer * xmlParserInputBufferCreateStatic(char *, int, int);
extern (C) _xmlParserInputBuffer * xmlParserInputBufferCreateMem(char *, int, int);
extern (C) _xmlParserInputBuffer * xmlParserInputBufferCreateFd(int, int);
extern (C) _xmlParserInputBuffer * xmlParserInputBufferCreateFile(_IO_FILE *, int);
extern (C) _xmlParserInputBuffer * xmlParserInputBufferCreateFilename(char *, int);
extern (C) _xmlParserInputBuffer * xmlAllocParserInputBuffer(int);
extern (C) void xmlRegisterDefaultInputCallbacks();
extern (C) int xmlPopInputCallbacks();
extern (C) void xmlCleanupInputCallbacks();
alias void function(_xmlNode *) _BCD_func__1664;
alias _xmlOutputBuffer * function(char *, _xmlCharEncodingHandler *, int) _BCD_func__1665;
alias _xmlParserInputBuffer * function(char *, int) _BCD_func__1666;
alias char * function(char *) _BCD_func__1671;
alias void * function(void *, uint) _BCD_func__1672;
alias void * function(uint) _BCD_func__1673;
alias void function(void *) _BCD_func__1674;
alias void function(void *, _xmlNode *, int, char * *, char * *, int, char * *, char * *) _BCD_func__1681;
alias void function(void *, _xmlNode *, int, char * *, char * *, int, char * *, char * *, int *, int *, int, char * *, char * *) _BCD_func__1682;
alias void function(void *, _xmlNode *, char *, char *, char *) _BCD_func__1683;
alias void function(void *, _xmlNode *) _BCD_func__1684;
alias int function(void *, void *) _BCD_func__1701;
alias _xmlParserInput * function(char *, char *, _xmlParserCtxt *) _BCD_func__1862;
alias void function(void *, char *, char *, char *) _BCD_func__1893;
alias void function(void *, char *, char *, char *, int, char * *, int, int, char * *) _BCD_func__1894;
alias void function(void *, char *, ...) _BCD_func__1895;
alias void function(void *, char *, int) _BCD_func__1896;
alias void function(void *, char *) _BCD_func__1897;
alias void function(void *, char *, char *) _BCD_func__1898;
alias void function(void *, char *, char * *) _BCD_func__1899;
alias void function(void *, _xmlSAXLocator *) _BCD_func__1900;
alias void function(void *, char *, char *, char *, char *) _BCD_func__1901;
alias void function(void *, char *, int, _xmlElementContent *) _BCD_func__1902;
alias void function(void *, char *, char *, int, int, char *, _xmlEnumeration *) _BCD_func__1903;
alias void function(void *, char *, int, char *, char *, char *) _BCD_func__1904;
alias _xmlEntity * function(void *, char *) _BCD_func__1905;
alias _xmlParserInput * function(void *, char *, char *) _BCD_func__1906;
alias void function(char *) _BCD_func__1919;
alias void function(void *) _BCD_func__1939;
alias void function(void *, _xmlError *) _BCD_func__1940;
alias void function(void *, void *, char *, char *, char *) _BCD_func__1956;
alias void function(void *, void *, char *) _BCD_func__1957;
alias void * function(void *, char *) _BCD_func__1958;
alias void function(void *, char *) _BCD_func__1959;
alias void function(void *, char *, void *, void *) _BCD_func__2078;
alias int function(void *, long *, int) _BCD_func__1372;
alias int function(void *, char *, uint) _BCD_func__1374;
alias int function(void *, char *, uint) _BCD_func__1376;
alias int function(void * *, char *) _BCD_func__2355;
alias int function(char *, char * * *, uint *) _BCD_func__2356;
alias int function(void *, char *, char *, char *, char *) _BCD_func__2357;
struct _xmlOutputBuffer {
void * context;
_BCD_func__2302 writecallback;
_BCD_func__1370 closecallback;
_xmlCharEncodingHandler * encoder;
_xmlBuffer * buffer;
_xmlBuffer * conv;
int written;
int error;
}
struct _xmlParserInputBuffer {
void * context;
_BCD_func__2305 readcallback;
_BCD_func__1370 closecallback;
_xmlCharEncodingHandler * encoder;
_xmlBuffer * buffer;
_xmlBuffer * raw;
int compressed;
int error;
uint rawconsumed;
}