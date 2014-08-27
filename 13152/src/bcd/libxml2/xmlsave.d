/* THIS FILE GENERATED BY bcd.gen */
module bcd.libxml2.xmlsave;
align(4):
public import bcd.libxml2.threads;
public import bcd.libxml2.globals;
public import bcd.libxml2.SAX2;
public import bcd.libxml2.SAX;
public import bcd.libxml2.xlink;
public import bcd.libxml2.parser;
public import bcd.libxml2.xmlIO;
public import bcd.libxml2.encoding;
public import bcd.libxml2.entities;
public import bcd.libxml2.hash;
public import bcd.libxml2.valid;
public import bcd.libxml2.xmlautomata;
public import bcd.libxml2.list;
public import bcd.libxml2.xmlerror;
public import bcd.libxml2.xmlmemory;
public import bcd.libxml2.tree;
public import bcd.libxml2.xmlregexp;
public import bcd.libxml2.dict;
public import bcd.libxml2.xmlstring;
public import bcd.libxml2.xmlversion;
alias void xmlSaveCtxt;
alias void * xmlSaveCtxtPtr;
enum xmlSaveOption {
XML_SAVE_FORMAT=1,
XML_SAVE_NO_DECL=2,
}
alias int function(char *, int *, char *, int *) _BCD_func__1896;
extern (C) int xmlSaveSetAttrEscape(void *, _BCD_func__1896);
extern (C) int xmlSaveSetEscape(void *, _BCD_func__1896);
extern (C) int xmlSaveClose(void *);
extern (C) int xmlSaveFlush(void *);
extern (C) int xmlSaveTree(void *, _xmlNode *);
extern (C) int xmlSaveDoc(void *, _xmlDoc *);
alias int function(void *, char *, int) _BCD_func__1883;
alias int function(void *) _BCD_func__1410;
extern (C) void * xmlSaveToIO(_BCD_func__1883, _BCD_func__1410, void *, char *, int);
extern (C) void * xmlSaveToFilename(char *, char *, int);
extern (C) void * xmlSaveToFd(int, char *, int);
alias void function(_xmlNode *) _BCD_func__1703;
alias _xmlOutputBuffer * function(char *, _xmlCharEncodingHandler *, int) _BCD_func__1704;
alias _xmlParserInputBuffer * function(char *, int) _BCD_func__1705;
alias void function(void *, _xmlNode *, int, char * *, char * *, int, char * *, char * *) _BCD_func__1713;
alias void function(void *, _xmlNode *, int, char * *, char * *, int, char * *, char * *, int *, int *, int, char * *, char * *) _BCD_func__1714;
alias void function(void *, _xmlNode *, char *, char *, char *) _BCD_func__1715;
alias void function(void *, _xmlNode *) _BCD_func__1716;
alias int function(void *, void *) _BCD_func__1733;
alias void * function(char *) _BCD_func__1884;
alias int function(char *) _BCD_func__1885;
alias int function(void *, char *, int) _BCD_func__1886;
alias _xmlParserInput * function(char *, char *, _xmlParserCtxt *) _BCD_func__1899;
alias void function(void *, char *, char *, char *) _BCD_func__1930;
alias void function(void *, char *, char *, char *, int, char * *, int, int, char * *) _BCD_func__1931;
alias void function(void *, char *, ...) _BCD_func__1932;
alias void function(void *, char *, int) _BCD_func__1933;
alias void function(void *, char *) _BCD_func__1934;
alias void function(void *, char *, char *) _BCD_func__1935;
alias void function(void *, char *, char * *) _BCD_func__1936;
alias void function(void *) _BCD_func__1937;
alias void function(void *, _xmlSAXLocator *) _BCD_func__1938;
alias void function(void *, char *, char *, char *, char *) _BCD_func__1939;
alias void function(void *, char *, int, _xmlElementContent *) _BCD_func__1940;
alias void function(void *, char *, char *, int, int, char *, _xmlEnumeration *) _BCD_func__1941;
alias void function(void *, char *, int, char *, char *, char *) _BCD_func__1942;
alias _xmlEntity * function(void *, char *) _BCD_func__1943;
alias _xmlParserInput * function(void *, char *, char *) _BCD_func__1944;
alias void function(char *) _BCD_func__1957;
alias void function(void *) _BCD_func__1977;
alias void function(void *, _xmlError *) _BCD_func__1978;
alias void function(void *, void *, char *, char *, char *) _BCD_func__1994;
alias void function(void *, void *, char *) _BCD_func__1995;
alias void * function(void *, char *) _BCD_func__1996;
alias void function(void *, char *) _BCD_func__1997;
alias char * function(char *) _BCD_func__2002;
alias void * function(void *, uint) _BCD_func__2003;
alias void * function(uint) _BCD_func__2004;
alias void function(void *, char *, void *, void *) _BCD_func__2123;
alias int function(void *, long *, int) _BCD_func__1412;
alias int function(void *, char *, uint) _BCD_func__1414;
alias int function(void *, char *, uint) _BCD_func__1416;
alias int function(void * *, char *) _BCD_func__2396;
alias int function(char *, char * * *, uint *) _BCD_func__2397;
alias int function(void *, char *, char *, char *, char *) _BCD_func__2398;