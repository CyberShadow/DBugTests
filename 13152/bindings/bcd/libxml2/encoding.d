/* THIS FILE GENERATED BY bcd.gen */
module bcd.libxml2.encoding;
align(4):
public import bcd.libxml2.threads;
public import bcd.libxml2.globals;
public import bcd.libxml2.SAX2;
public import bcd.libxml2.SAX;
public import bcd.libxml2.xlink;
public import bcd.libxml2.parser;
public import bcd.libxml2.xmlIO;
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
alias _xmlCharEncodingHandler xmlCharEncodingHandler;
alias _xmlCharEncodingHandler * xmlCharEncodingHandlerPtr;
alias int function(char *, int *, char *, int *) _BCD_func__2456;
alias _BCD_func__2456 xmlCharEncodingInputFunc;
alias _BCD_func__2456 xmlCharEncodingOutputFunc;
enum xmlCharEncoding {
XML_CHAR_ENCODING_ERROR=-1,
XML_CHAR_ENCODING_NONE=0,
XML_CHAR_ENCODING_UTF8=1,
XML_CHAR_ENCODING_UTF16LE=2,
XML_CHAR_ENCODING_UTF16BE=3,
XML_CHAR_ENCODING_UCS4LE=4,
XML_CHAR_ENCODING_UCS4BE=5,
XML_CHAR_ENCODING_EBCDIC=6,
XML_CHAR_ENCODING_UCS4_2143=7,
XML_CHAR_ENCODING_UCS4_3412=8,
XML_CHAR_ENCODING_UCS2=9,
XML_CHAR_ENCODING_8859_1=10,
XML_CHAR_ENCODING_8859_2=11,
XML_CHAR_ENCODING_8859_3=12,
XML_CHAR_ENCODING_8859_4=13,
XML_CHAR_ENCODING_8859_5=14,
XML_CHAR_ENCODING_8859_6=15,
XML_CHAR_ENCODING_8859_7=16,
XML_CHAR_ENCODING_8859_8=17,
XML_CHAR_ENCODING_8859_9=18,
XML_CHAR_ENCODING_2022_JP=19,
XML_CHAR_ENCODING_SHIFT_JIS=20,
XML_CHAR_ENCODING_EUC_JP=21,
XML_CHAR_ENCODING_ASCII=22,
}
extern (C) int isolat1ToUTF8(char *, int *, char *, int *);
extern (C) int UTF8Toisolat1(char *, int *, char *, int *);
extern (C) int xmlCharEncCloseFunc(_xmlCharEncodingHandler *);
extern (C) int xmlCharEncFirstLine(_xmlCharEncodingHandler *, _xmlBuffer *, _xmlBuffer *);
extern (C) int xmlCharEncInFunc(_xmlCharEncodingHandler *, _xmlBuffer *, _xmlBuffer *);
extern (C) int xmlCharEncOutFunc(_xmlCharEncodingHandler *, _xmlBuffer *, _xmlBuffer *);
extern (C) int xmlDetectCharEncoding(char *, int);
extern (C) char * xmlGetCharEncodingName(int);
extern (C) int xmlParseCharEncoding(char *);
extern (C) void xmlCleanupEncodingAliases();
extern (C) char * xmlGetEncodingAlias(char *);
extern (C) int xmlDelEncodingAlias(char *);
extern (C) int xmlAddEncodingAlias(char *, char *);
extern (C) _xmlCharEncodingHandler * xmlNewCharEncodingHandler(char *, _BCD_func__2456, _BCD_func__2456);
extern (C) _xmlCharEncodingHandler * xmlFindCharEncodingHandler(char *);
extern (C) _xmlCharEncodingHandler * xmlGetCharEncodingHandler(int);
extern (C) void xmlRegisterCharEncodingHandler(_xmlCharEncodingHandler *);
extern (C) void xmlCleanupCharEncodingHandlers();
extern (C) void xmlInitCharEncodingHandlers();
alias void function(_xmlNode *) _BCD_func__1691;
alias _xmlOutputBuffer * function(char *, _xmlCharEncodingHandler *, int) _BCD_func__1692;
alias _xmlParserInputBuffer * function(char *, int) _BCD_func__1693;
alias void function(void *, _xmlNode *, int, char * *, char * *, int, char * *, char * *) _BCD_func__1701;
alias void function(void *, _xmlNode *, int, char * *, char * *, int, char * *, char * *, int *, int *, int, char * *, char * *) _BCD_func__1702;
alias void function(void *, _xmlNode *, char *, char *, char *) _BCD_func__1703;
alias void function(void *, _xmlNode *) _BCD_func__1704;
alias int function(void *, void *) _BCD_func__1721;
alias int function(void *) _BCD_func__1383;
alias int function(void *, char *, int) _BCD_func__1871;
alias void * function(char *) _BCD_func__1872;
alias int function(char *) _BCD_func__1873;
alias int function(void *, char *, int) _BCD_func__1874;
alias _xmlParserInput * function(char *, char *, _xmlParserCtxt *) _BCD_func__1875;
alias void function(void *, char *, char *, char *) _BCD_func__1906;
alias void function(void *, char *, char *, char *, int, char * *, int, int, char * *) _BCD_func__1907;
alias void function(void *, char *, ...) _BCD_func__1908;
alias void function(void *, char *, int) _BCD_func__1909;
alias void function(void *, char *) _BCD_func__1910;
alias void function(void *, char *, char *) _BCD_func__1911;
alias void function(void *, char *, char * *) _BCD_func__1912;
alias void function(void *) _BCD_func__1913;
alias void function(void *, _xmlSAXLocator *) _BCD_func__1914;
alias void function(void *, char *, char *, char *, char *) _BCD_func__1915;
alias void function(void *, char *, int, _xmlElementContent *) _BCD_func__1916;
alias void function(void *, char *, char *, int, int, char *, _xmlEnumeration *) _BCD_func__1917;
alias void function(void *, char *, int, char *, char *, char *) _BCD_func__1918;
alias _xmlEntity * function(void *, char *) _BCD_func__1919;
alias _xmlParserInput * function(void *, char *, char *) _BCD_func__1920;
alias void function(char *) _BCD_func__1933;
alias void function(void *) _BCD_func__1953;
alias void function(void *, _xmlError *) _BCD_func__1954;
alias void function(void *, void *, char *, char *, char *) _BCD_func__1970;
alias void function(void *, void *, char *) _BCD_func__1971;
alias void * function(void *, char *) _BCD_func__1972;
alias void function(void *, char *) _BCD_func__1973;
alias char * function(char *) _BCD_func__1978;
alias void * function(void *, uint) _BCD_func__1979;
alias void * function(uint) _BCD_func__1980;
alias void function(void *, char *, void *, void *) _BCD_func__2099;
alias int function(void *, long *, int) _BCD_func__1385;
alias int function(void *, char *, uint) _BCD_func__1387;
alias int function(void *, char *, uint) _BCD_func__1389;
alias int function(void * *, char *) _BCD_func__2374;
alias int function(char *, char * * *, uint *) _BCD_func__2375;
alias int function(void *, char *, char *, char *, char *) _BCD_func__2376;
struct _xmlCharEncodingHandler {
char * name;
_BCD_func__2456 input;
_BCD_func__2456 output;
void * iconv_in;
void * iconv_out;
}
