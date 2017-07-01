/* THIS FILE GENERATED BY bcd.gen */
module bcd.libxml2.parserInternals;
align(4):
const int XML_MAX_NAMELEN = 100;
const int INPUT_CHUNK = 250;
const int XML_SUBSTITUTE_NONE = 0;
const int XML_SUBSTITUTE_REF = 1;
const int XML_SUBSTITUTE_PEREF = 2;
const int XML_SUBSTITUTE_BOTH = 3;
public import bcd.libxml2.chvalid;
public import bcd.libxml2.HTMLparser;
public import bcd.libxml2.parser;
public import bcd.libxml2.xmlIO;
public import bcd.libxml2.globals;
public import bcd.libxml2.threads;
public import bcd.libxml2.xmlmemory;
public import bcd.libxml2.SAX2;
public import bcd.libxml2.SAX;
public import bcd.libxml2.xlink;
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
alias void function(_xmlEntity *, _xmlNode *, _xmlNode *) _BCD_func__1824;
alias _BCD_func__1824 xmlEntityReferenceFunc;
extern (C) void xmlHandleEntity(_xmlParserCtxt *, _xmlEntity *);
extern (C) char * xmlDecodeEntities(_xmlParserCtxt *, int, int, char, char, char);
extern (C) char * xmlNamespaceParseQName(_xmlParserCtxt *, char * *);
extern (C) void xmlParserHandleReference(_xmlParserCtxt *);
extern (C) char * xmlNamespaceParseNCName(_xmlParserCtxt *);
extern (C) char * xmlScanName(_xmlParserCtxt *);
extern (C) char * xmlNamespaceParseNSDef(_xmlParserCtxt *);
extern (C) void xmlParseNamespace(_xmlParserCtxt *);
extern (C) char * xmlParseQuotedString(_xmlParserCtxt *);
extern (C) void xmlSetEntityReferenceFunc(_BCD_func__1824);
extern (C) _xmlParserCtxt * htmlCreateFileParserCtxt(char *, char *);
extern (C) void htmlInitAutoClose();
extern (C) void xmlParserInputShrink(_xmlParserInput *);
extern (C) void xmlNextChar(_xmlParserCtxt *);
extern (C) int xmlCopyChar(int, char *, int);
extern (C) int xmlCopyCharMultiByte(char *, int);
extern (C) int xmlCurrentChar(_xmlParserCtxt *, int *);
extern (C) int xmlCheckLanguageID(char *);
extern (C) void xmlParserHandlePEReference(_xmlParserCtxt *);
extern (C) int xmlStringCurrentChar(_xmlParserCtxt *, char *, int *);
extern (C) int xmlSkipBlankChars(_xmlParserCtxt *);
extern (C) int namePush(_xmlParserCtxt *, char *);
extern (C) char * namePop(_xmlParserCtxt *);
extern (C) _xmlParserInput * inputPop(_xmlParserCtxt *);
extern (C) int inputPush(_xmlParserCtxt *, _xmlParserInput *);
extern (C) _xmlNode * nodePop(_xmlParserCtxt *);
extern (C) int nodePush(_xmlParserCtxt *, _xmlNode *);
extern (C) char * xmlStringLenDecodeEntities(_xmlParserCtxt *, char *, int, int, char, char, char);
extern (C) char * xmlStringDecodeEntities(_xmlParserCtxt *, char *, int, char, char, char);
extern (C) void xmlParseExternalSubset(_xmlParserCtxt *, char *, char *);
extern (C) void xmlParseMisc(_xmlParserCtxt *);
extern (C) void xmlParseTextDecl(_xmlParserCtxt *);
extern (C) void xmlParseXMLDecl(_xmlParserCtxt *);
extern (C) int xmlParseSDDecl(_xmlParserCtxt *);
extern (C) char * xmlParseEncodingDecl(_xmlParserCtxt *);
extern (C) char * xmlParseEncName(_xmlParserCtxt *);
extern (C) char * xmlParseVersionInfo(_xmlParserCtxt *);
extern (C) char * xmlParseVersionNum(_xmlParserCtxt *);
extern (C) void xmlParseElement(_xmlParserCtxt *);
extern (C) void xmlParseContent(_xmlParserCtxt *);
extern (C) void xmlParseCDSect(_xmlParserCtxt *);
extern (C) void xmlParseEndTag(_xmlParserCtxt *);
extern (C) char * xmlParseStartTag(_xmlParserCtxt *);
extern (C) char * xmlParseAttribute(_xmlParserCtxt *, char * *);
extern (C) void xmlParseDocTypeDecl(_xmlParserCtxt *);
extern (C) void xmlParsePEReference(_xmlParserCtxt *);
extern (C) void xmlParseReference(_xmlParserCtxt *);
extern (C) _xmlEntity * xmlParseEntityRef(_xmlParserCtxt *);
extern (C) int xmlParseCharRef(_xmlParserCtxt *);
extern (C) void xmlParseMarkupDecl(_xmlParserCtxt *);
extern (C) int xmlParseElementDecl(_xmlParserCtxt *);
extern (C) int xmlParseElementContentDecl(_xmlParserCtxt *, char *, _xmlElementContent * *);
extern (C) _xmlElementContent * xmlParseElementChildrenContentDecl(_xmlParserCtxt *, int);
extern (C) _xmlElementContent * xmlParseElementMixedContentDecl(_xmlParserCtxt *, int);
extern (C) void xmlParseAttributeListDecl(_xmlParserCtxt *);
extern (C) int xmlParseAttributeType(_xmlParserCtxt *, _xmlEnumeration * *);
extern (C) int xmlParseEnumeratedType(_xmlParserCtxt *, _xmlEnumeration * *);
extern (C) _xmlEnumeration * xmlParseEnumerationType(_xmlParserCtxt *);
extern (C) _xmlEnumeration * xmlParseNotationType(_xmlParserCtxt *);
extern (C) int xmlParseDefaultDecl(_xmlParserCtxt *, char * *);
extern (C) void xmlParseEntityDecl(_xmlParserCtxt *);
extern (C) void xmlParseNotationDecl(_xmlParserCtxt *);
extern (C) void xmlParsePI(_xmlParserCtxt *);
extern (C) char * xmlParsePITarget(_xmlParserCtxt *);
extern (C) void xmlParseComment(_xmlParserCtxt *);
extern (C) char * xmlParseExternalID(_xmlParserCtxt *, char * *, int);
extern (C) void xmlParseCharData(_xmlParserCtxt *, int);
extern (C) char * xmlParsePubidLiteral(_xmlParserCtxt *);
extern (C) char * xmlParseSystemLiteral(_xmlParserCtxt *);
extern (C) char * xmlParseAttValue(_xmlParserCtxt *);
extern (C) char * xmlParseEntityValue(_xmlParserCtxt *, char * *);
extern (C) char * xmlParseNmtoken(_xmlParserCtxt *);
extern (C) char * xmlParseName(_xmlParserCtxt *);
extern (C) char * xmlSplitQName(_xmlParserCtxt *, char *, char * *);
extern (C) _xmlParserInput * xmlNewInputStream(_xmlParserCtxt *);
extern (C) _xmlParserInput * xmlNewInputFromFile(_xmlParserCtxt *, char *);
extern (C) void xmlFreeInputStream(_xmlParserInput *);
extern (C) char xmlPopInput(_xmlParserCtxt *);
extern (C) void xmlPushInput(_xmlParserCtxt *, _xmlParserInput *);
extern (C) _xmlParserInput * xmlNewEntityInputStream(_xmlParserCtxt *, _xmlEntity *);
extern (C) _xmlParserInput * xmlNewStringInputStream(_xmlParserCtxt *, char *);
extern (C) int xmlSwitchInputEncoding(_xmlParserCtxt *, _xmlParserInput *, _xmlCharEncodingHandler *);
extern (C) int xmlSwitchToEncoding(_xmlParserCtxt *, _xmlCharEncodingHandler *);
extern (C) int xmlSwitchEncoding(_xmlParserCtxt *, int);
extern (C) _xmlParserCtxt * xmlCreateEntityParserCtxt(char *, char *, char *);
extern (C) _xmlParserCtxt * xmlCreateMemoryParserCtxt(char *, int);
extern (C) _xmlParserCtxt * xmlCreateURLParserCtxt(char *, int);
extern (C) _xmlParserCtxt * xmlCreateFileParserCtxt(char *);
extern (C) int xmlIsLetter(int);
alias void function(_xmlNode *) _BCD_func__2070;
alias _xmlOutputBuffer * function(char *, _xmlCharEncodingHandler *, int) _BCD_func__2071;
alias _xmlParserInputBuffer * function(char *, int) _BCD_func__2072;
alias char * function(char *) _BCD_func__2077;
alias void * function(void *, uint) _BCD_func__2078;
alias void * function(uint) _BCD_func__2079;
alias void function(void *) _BCD_func__2080;
alias void function(void *, _xmlNode *, int, char * *, char * *, int, char * *, char * *) _BCD_func__2086;
alias void function(void *, _xmlNode *, int, char * *, char * *, int, char * *, char * *, int *, int *, int, char * *, char * *) _BCD_func__2087;
alias void function(void *, _xmlNode *, char *, char *, char *) _BCD_func__2088;
alias void function(void *, _xmlNode *) _BCD_func__2089;
alias int function(void *, void *) _BCD_func__2106;
alias int function(void *) _BCD_func__1574;
alias int function(void *, char *, int) _BCD_func__2249;
alias void * function(char *) _BCD_func__2250;
alias int function(char *) _BCD_func__2251;
alias int function(void *, char *, int) _BCD_func__2252;
alias int function(char *, int *, char *, int *) _BCD_func__2260;
alias _xmlParserInput * function(char *, char *, _xmlParserCtxt *) _BCD_func__2263;
alias void function(void *, char *, char *, char *) _BCD_func__2294;
alias void function(void *, char *, char *, char *, int, char * *, int, int, char * *) _BCD_func__2295;
alias void function(void *, char *, ...) _BCD_func__2296;
alias void function(void *, char *, int) _BCD_func__2297;
alias void function(void *, char *) _BCD_func__2298;
alias void function(void *, char *, char *) _BCD_func__2299;
alias void function(void *, char *, char * *) _BCD_func__2300;
alias void function(void *, _xmlSAXLocator *) _BCD_func__2301;
alias void function(void *, char *, char *, char *, char *) _BCD_func__2302;
alias void function(void *, char *, int, _xmlElementContent *) _BCD_func__2303;
alias void function(void *, char *, char *, int, int, char *, _xmlEnumeration *) _BCD_func__2304;
alias void function(void *, char *, int, char *, char *, char *) _BCD_func__2305;
alias _xmlEntity * function(void *, char *) _BCD_func__2306;
alias _xmlParserInput * function(void *, char *, char *) _BCD_func__2307;
alias void function(char *) _BCD_func__2313;
alias void function(void *) _BCD_func__2333;
alias void function(void *, _xmlError *) _BCD_func__2334;
alias void function(void *, void *, char *, char *, char *) _BCD_func__2350;
alias void function(void *, void *, char *) _BCD_func__2351;
alias void * function(void *, char *) _BCD_func__2352;
alias void function(void *, char *) _BCD_func__2353;
alias void function(void *, char *, void *, void *) _BCD_func__2471;
alias int function(void *, long *, int) _BCD_func__1576;
alias int function(void *, char *, uint) _BCD_func__1578;
alias int function(void *, char *, uint) _BCD_func__1580;
alias int function(void * *, char *) _BCD_func__2609;
alias int function(char *, char * * *, uint *) _BCD_func__2610;
alias int function(void *, char *, char *, char *, char *) _BCD_func__2611;
extern (C) extern char [1] xmlStringComment;
extern (C) extern char [1] xmlStringTextNoenc;
extern (C) extern char [1] xmlStringText;
extern (C) extern uint xmlParserMaxDepth;