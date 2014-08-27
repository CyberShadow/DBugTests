/* THIS FILE GENERATED BY bcd.gen */
module bcd.libxml2.schematron;
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
alias void xmlSchematronValidCtxt;
alias void * xmlSchematronValidCtxtPtr;
alias void xmlSchematronParserCtxt;
alias void * xmlSchematronParserCtxtPtr;
alias void function(void *, char *, ...) _BCD_func__1669;
alias _BCD_func__1669 xmlSchematronValidityWarningFunc;
alias _BCD_func__1669 xmlSchematronValidityErrorFunc;
alias void xmlSchematron;
alias void * xmlSchematronPtr;
enum xmlSchematronValidOptions {
XML_SCHEMATRON_OUT_QUIET=1,
XML_SCHEMATRON_OUT_TEXT=2,
XML_SCHEMATRON_OUT_XML=4,
XML_SCHEMATRON_OUT_FILE=256,
XML_SCHEMATRON_OUT_BUFFER=512,
XML_SCHEMATRON_OUT_IO=1024,
}
extern (C) int xmlSchematronValidateDoc(void *, _xmlDoc *);
extern (C) void xmlSchematronFreeValidCtxt(void *);
extern (C) void * xmlSchematronNewValidCtxt(void *, int);
extern (C) void xmlSchematronFree(void *);
extern (C) void * xmlSchematronParse(void *);
extern (C) void xmlSchematronFreeParserCtxt(void *);
extern (C) void * xmlSchematronNewDocParserCtxt(_xmlDoc *);
extern (C) void * xmlSchematronNewMemParserCtxt(char *, int);
extern (C) void * xmlSchematronNewParserCtxt(char *);
alias void function(_xmlNode *) _BCD_func__1714;
alias _xmlOutputBuffer * function(char *, _xmlCharEncodingHandler *, int) _BCD_func__1715;
alias _xmlParserInputBuffer * function(char *, int) _BCD_func__1716;
alias void function(void *, _xmlNode *, int, char * *, char * *, int, char * *, char * *) _BCD_func__1724;
alias void function(void *, _xmlNode *, int, char * *, char * *, int, char * *, char * *, int *, int *, int, char * *, char * *) _BCD_func__1725;
alias void function(void *, _xmlNode *, char *, char *, char *) _BCD_func__1726;
alias void function(void *, _xmlNode *) _BCD_func__1727;
alias int function(void *, void *) _BCD_func__1744;
alias int function(void *) _BCD_func__1420;
alias int function(void *, char *, int) _BCD_func__1894;
alias void * function(char *) _BCD_func__1895;
alias int function(char *) _BCD_func__1896;
alias int function(void *, char *, int) _BCD_func__1897;
alias int function(char *, int *, char *, int *) _BCD_func__1907;
alias _xmlParserInput * function(char *, char *, _xmlParserCtxt *) _BCD_func__1910;
alias void function(void *, char *, char *, char *) _BCD_func__1941;
alias void function(void *, char *, char *, char *, int, char * *, int, int, char * *) _BCD_func__1942;
alias void function(void *, char *, int) _BCD_func__1943;
alias void function(void *, char *) _BCD_func__1944;
alias void function(void *, char *, char *) _BCD_func__1945;
alias void function(void *, char *, char * *) _BCD_func__1946;
alias void function(void *) _BCD_func__1947;
alias void function(void *, _xmlSAXLocator *) _BCD_func__1948;
alias void function(void *, char *, char *, char *, char *) _BCD_func__1949;
alias void function(void *, char *, int, _xmlElementContent *) _BCD_func__1950;
alias void function(void *, char *, char *, int, int, char *, _xmlEnumeration *) _BCD_func__1951;
alias void function(void *, char *, int, char *, char *, char *) _BCD_func__1952;
alias _xmlEntity * function(void *, char *) _BCD_func__1953;
alias _xmlParserInput * function(void *, char *, char *) _BCD_func__1954;
alias void function(char *) _BCD_func__1967;
alias void function(void *) _BCD_func__1987;
alias void function(void *, _xmlError *) _BCD_func__1988;
alias void function(void *, void *, char *, char *, char *) _BCD_func__2004;
alias void function(void *, void *, char *) _BCD_func__2005;
alias void * function(void *, char *) _BCD_func__2006;
alias void function(void *, char *) _BCD_func__2007;
alias char * function(char *) _BCD_func__2012;
alias void * function(void *, uint) _BCD_func__2013;
alias void * function(uint) _BCD_func__2014;
alias void function(void *, char *, void *, void *) _BCD_func__2133;
alias int function(void *, long *, int) _BCD_func__1422;
alias int function(void *, char *, uint) _BCD_func__1424;
alias int function(void *, char *, uint) _BCD_func__1426;
alias int function(void * *, char *) _BCD_func__2406;
alias int function(char *, char * * *, uint *) _BCD_func__2407;
alias int function(void *, char *, char *, char *, char *) _BCD_func__2408;
