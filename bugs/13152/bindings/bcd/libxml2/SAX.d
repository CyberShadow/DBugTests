/* THIS FILE GENERATED BY bcd.gen */
module bcd.libxml2.SAX;
align(4):
public import bcd.libxml2.parser;
public import bcd.libxml2.xmlIO;
public import bcd.libxml2.globals;
public import bcd.libxml2.threads;
public import bcd.libxml2.xmlmemory;
public import bcd.libxml2.SAX2;
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
extern (C) void initdocbDefaultSAXHandler(_xmlSAXHandlerV1 *);
extern (C) void inithtmlDefaultSAXHandler(_xmlSAXHandlerV1 *);
extern (C) void initxmlDefaultSAXHandler(_xmlSAXHandlerV1 *, int);
extern (C) void cdataBlock(void *, char *, int);
extern (C) void comment(void *, char *);
extern (C) void namespaceDecl(void *, char *, char *);
extern (C) int checkNamespace(void *, char *);
extern (C) _xmlNs * getNamespace(void *);
extern (C) void setNamespace(void *, char *);
extern (C) void globalNamespace(void *, char *, char *);
extern (C) void processingInstruction(void *, char *, char *);
extern (C) void ignorableWhitespace(void *, char *, int);
extern (C) void characters(void *, char *, int);
extern (C) void reference(void *, char *);
extern (C) void endElement(void *, char *);
extern (C) void startElement(void *, char *, char * *);
extern (C) void attribute(void *, char *, char *);
extern (C) void endDocument(void *);
extern (C) void startDocument(void *);
extern (C) void unparsedEntityDecl(void *, char *, char *, char *, char *);
extern (C) void notationDecl(void *, char *, char *, char *);
extern (C) void elementDecl(void *, char *, int, _xmlElementContent *);
extern (C) void attributeDecl(void *, char *, char *, int, int, char *, _xmlEnumeration *);
extern (C) void entityDecl(void *, char *, int, char *, char *, char *);
extern (C) _xmlParserInput * resolveEntity(void *, char *, char *);
extern (C) _xmlEntity * getParameterEntity(void *, char *);
extern (C) _xmlEntity * getEntity(void *, char *);
extern (C) void externalSubset(void *, char *, char *, char *);
extern (C) void internalSubset(void *, char *, char *, char *);
extern (C) int hasExternalSubset(void *);
extern (C) int hasInternalSubset(void *);
extern (C) int isStandalone(void *);
extern (C) int getColumnNumber(void *);
extern (C) int getLineNumber(void *);
extern (C) void setDocumentLocator(void *, _xmlSAXLocator *);
extern (C) char * getSystemId(void *);
extern (C) char * getPublicId(void *);
alias void function(_xmlNode *) _BCD_func__1671;
alias _xmlOutputBuffer * function(char *, _xmlCharEncodingHandler *, int) _BCD_func__1672;
alias _xmlParserInputBuffer * function(char *, int) _BCD_func__1673;
alias char * function(char *) _BCD_func__1678;
alias void * function(void *, uint) _BCD_func__1679;
alias void * function(uint) _BCD_func__1680;
alias void function(void *) _BCD_func__1681;
alias void function(void *, _xmlNode *, int, char * *, char * *, int, char * *, char * *) _BCD_func__1687;
alias void function(void *, _xmlNode *, int, char * *, char * *, int, char * *, char * *, int *, int *, int, char * *, char * *) _BCD_func__1688;
alias void function(void *, _xmlNode *, char *, char *, char *) _BCD_func__1689;
alias void function(void *, _xmlNode *) _BCD_func__1690;
alias int function(void *) _BCD_func__1370;
alias int function(void *, char *, int) _BCD_func__1691;
alias void * function(char *) _BCD_func__1692;
alias int function(char *) _BCD_func__1693;
alias int function(void *, char *, int) _BCD_func__1694;
alias int function(char *, int *, char *, int *) _BCD_func__1704;
alias _xmlParserInput * function(char *, char *, _xmlParserCtxt *) _BCD_func__1709;
alias void function(void *, char *, char *, char *) _BCD_func__1740;
alias void function(void *, char *, char *, char *, int, char * *, int, int, char * *) _BCD_func__1741;
alias void function(void *, char *, ...) _BCD_func__1742;
alias void function(void *, char *, int) _BCD_func__1743;
alias void function(void *, char *) _BCD_func__1744;
alias void function(void *, char *, char *) _BCD_func__1745;
alias void function(void *, char *, char * *) _BCD_func__1746;
alias void function(void *, _xmlSAXLocator *) _BCD_func__1747;
alias void function(void *, char *, char *, char *, char *) _BCD_func__1748;
alias void function(void *, char *, int, _xmlElementContent *) _BCD_func__1749;
alias void function(void *, char *, char *, int, int, char *, _xmlEnumeration *) _BCD_func__1750;
alias void function(void *, char *, int, char *, char *, char *) _BCD_func__1751;
alias _xmlEntity * function(void *, char *) _BCD_func__1752;
alias _xmlParserInput * function(void *, char *, char *) _BCD_func__1753;
alias void function(char *) _BCD_func__1766;
alias int function(void *, void *) _BCD_func__1787;
alias void function(void *) _BCD_func__1788;
alias void function(void *, _xmlError *) _BCD_func__1789;
alias void function(void *, void *, char *, char *, char *) _BCD_func__1805;
alias void function(void *, void *, char *) _BCD_func__1806;
alias void * function(void *, char *) _BCD_func__1807;
alias void function(void *, char *) _BCD_func__1808;
alias void function(void *, char *, void *, void *) _BCD_func__1927;
alias int function(void *, long *, int) _BCD_func__1372;
alias int function(void *, char *, uint) _BCD_func__1374;
alias int function(void *, char *, uint) _BCD_func__1376;
alias int function(void * *, char *) _BCD_func__2355;
alias int function(char *, char * * *, uint *) _BCD_func__2356;
alias int function(void *, char *, char *, char *, char *) _BCD_func__2357;
