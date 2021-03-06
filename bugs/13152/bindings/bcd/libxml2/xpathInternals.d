/* THIS FILE GENERATED BY bcd.gen */
module bcd.libxml2.xpathInternals;
align(4):
public import bcd.libxml2.xpath;
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
extern (C) void xmlXPathNodeSetFreeNs(_xmlNs *);
extern (C) void xmlXPathBooleanFunction(_xmlXPathParserContext *, int);
extern (C) void xmlXPathRoundFunction(_xmlXPathParserContext *, int);
extern (C) void xmlXPathCeilingFunction(_xmlXPathParserContext *, int);
extern (C) void xmlXPathFloorFunction(_xmlXPathParserContext *, int);
extern (C) void xmlXPathSumFunction(_xmlXPathParserContext *, int);
extern (C) void xmlXPathNumberFunction(_xmlXPathParserContext *, int);
extern (C) void xmlXPathLangFunction(_xmlXPathParserContext *, int);
extern (C) void xmlXPathFalseFunction(_xmlXPathParserContext *, int);
extern (C) void xmlXPathTrueFunction(_xmlXPathParserContext *, int);
extern (C) void xmlXPathNotFunction(_xmlXPathParserContext *, int);
extern (C) void xmlXPathTranslateFunction(_xmlXPathParserContext *, int);
extern (C) void xmlXPathNormalizeFunction(_xmlXPathParserContext *, int);
extern (C) void xmlXPathSubstringAfterFunction(_xmlXPathParserContext *, int);
extern (C) void xmlXPathSubstringBeforeFunction(_xmlXPathParserContext *, int);
extern (C) void xmlXPathSubstringFunction(_xmlXPathParserContext *, int);
extern (C) void xmlXPathStartsWithFunction(_xmlXPathParserContext *, int);
extern (C) void xmlXPathContainsFunction(_xmlXPathParserContext *, int);
extern (C) void xmlXPathConcatFunction(_xmlXPathParserContext *, int);
extern (C) void xmlXPathStringLengthFunction(_xmlXPathParserContext *, int);
extern (C) void xmlXPathStringFunction(_xmlXPathParserContext *, int);
extern (C) void xmlXPathNamespaceURIFunction(_xmlXPathParserContext *, int);
extern (C) void xmlXPathLocalNameFunction(_xmlXPathParserContext *, int);
extern (C) void xmlXPathIdFunction(_xmlXPathParserContext *, int);
extern (C) void xmlXPathCountFunction(_xmlXPathParserContext *, int);
extern (C) void xmlXPathPositionFunction(_xmlXPathParserContext *, int);
extern (C) void xmlXPathLastFunction(_xmlXPathParserContext *, int);
extern (C) _xmlNode * xmlXPathNextPrecedingSibling(_xmlXPathParserContext *, _xmlNode *);
extern (C) _xmlNode * xmlXPathNextAncestor(_xmlXPathParserContext *, _xmlNode *);
extern (C) _xmlNode * xmlXPathNextPreceding(_xmlXPathParserContext *, _xmlNode *);
extern (C) _xmlNode * xmlXPathNextAttribute(_xmlXPathParserContext *, _xmlNode *);
extern (C) _xmlNode * xmlXPathNextNamespace(_xmlXPathParserContext *, _xmlNode *);
extern (C) _xmlNode * xmlXPathNextFollowing(_xmlXPathParserContext *, _xmlNode *);
extern (C) _xmlNode * xmlXPathNextFollowingSibling(_xmlXPathParserContext *, _xmlNode *);
extern (C) _xmlNode * xmlXPathNextAncestorOrSelf(_xmlXPathParserContext *, _xmlNode *);
extern (C) _xmlNode * xmlXPathNextParent(_xmlXPathParserContext *, _xmlNode *);
extern (C) _xmlNode * xmlXPathNextDescendantOrSelf(_xmlXPathParserContext *, _xmlNode *);
extern (C) _xmlNode * xmlXPathNextDescendant(_xmlXPathParserContext *, _xmlNode *);
extern (C) _xmlNode * xmlXPathNextChild(_xmlXPathParserContext *, _xmlNode *);
extern (C) _xmlNode * xmlXPathNextSelf(_xmlXPathParserContext *, _xmlNode *);
extern (C) int xmlXPathIsNodeType(char *);
extern (C) void xmlXPathModValues(_xmlXPathParserContext *);
extern (C) void xmlXPathDivValues(_xmlXPathParserContext *);
extern (C) void xmlXPathMultValues(_xmlXPathParserContext *);
extern (C) void xmlXPathSubValues(_xmlXPathParserContext *);
extern (C) void xmlXPathAddValues(_xmlXPathParserContext *);
extern (C) void xmlXPathValueFlipSign(_xmlXPathParserContext *);
extern (C) int xmlXPathCompareValues(_xmlXPathParserContext *, int, int);
extern (C) int xmlXPathNotEqualValues(_xmlXPathParserContext *);
extern (C) int xmlXPathEqualValues(_xmlXPathParserContext *);
extern (C) _xmlXPathObject * xmlXPathWrapExternal(void *);
extern (C) _xmlXPathObject * xmlXPathWrapNodeSet(_xmlNodeSet *);
extern (C) _xmlXPathObject * xmlXPathNewNodeSetList(_xmlNodeSet *);
extern (C) void xmlXPathNodeSetRemove(_xmlNodeSet *, int);
extern (C) void xmlXPathNodeSetDel(_xmlNodeSet *, _xmlNode *);
extern (C) _xmlNodeSet * xmlXPathNodeSetMerge(_xmlNodeSet *, _xmlNodeSet *);
extern (C) void xmlXPathRegisterAllFunctions(_xmlXPathContext *);
extern (C) int xmlXPathEvaluatePredicateResult(_xmlXPathParserContext *, _xmlXPathObject *);
extern (C) double xmlXPathStringEvalNumber(char *);
extern (C) char * xmlXPathParseNCName(_xmlXPathParserContext *);
extern (C) char * xmlXPathParseName(_xmlXPathParserContext *);
extern (C) void xmlXPathEvalExpr(_xmlXPathParserContext *);
extern (C) void xmlXPathRoot(_xmlXPathParserContext *);
extern (C) void xmlXPathNodeSetSort(_xmlNodeSet *);
extern (C) void xmlXPathNodeSetAddNs(_xmlNodeSet *, _xmlNode *, _xmlNs *);
extern (C) void xmlXPathNodeSetAddUnique(_xmlNodeSet *, _xmlNode *);
extern (C) void xmlXPathNodeSetAdd(_xmlNodeSet *, _xmlNode *);
extern (C) _xmlXPathObject * xmlXPathNewValueTree(_xmlNode *);
extern (C) _xmlXPathObject * xmlXPathNewNodeSet(_xmlNode *);
extern (C) _xmlXPathObject * xmlXPathNewBoolean(int);
extern (C) _xmlXPathObject * xmlXPathNewFloat(double);
extern (C) _xmlXPathObject * xmlXPathWrapCString(char *);
extern (C) _xmlXPathObject * xmlXPathWrapString(char *);
extern (C) _xmlXPathObject * xmlXPathNewCString(char *);
extern (C) _xmlXPathObject * xmlXPathNewString(char *);
extern (C) int valuePush(_xmlXPathParserContext *, _xmlXPathObject *);
extern (C) _xmlXPathObject * valuePop(_xmlXPathParserContext *);
extern (C) void xmlXPathFreeParserContext(_xmlXPathParserContext *);
extern (C) _xmlXPathParserContext * xmlXPathNewParserContext(char *, _xmlXPathContext *);
extern (C) void xmlXPathRegisteredVariablesCleanup(_xmlXPathContext *);
extern (C) _xmlXPathObject * xmlXPathVariableLookupNS(_xmlXPathContext *, char *, char *);
extern (C) _xmlXPathObject * xmlXPathVariableLookup(_xmlXPathContext *, char *);
extern (C) void xmlXPathRegisteredFuncsCleanup(_xmlXPathContext *);
alias void function(_xmlXPathParserContext *, int) _BCD_func__1855;
extern (C) _BCD_func__1855 xmlXPathFunctionLookupNS(_xmlXPathContext *, char *, char *);
extern (C) _BCD_func__1855 xmlXPathFunctionLookup(_xmlXPathContext *, char *);
extern (C) int xmlXPathRegisterVariableNS(_xmlXPathContext *, char *, char *, _xmlXPathObject *);
extern (C) int xmlXPathRegisterVariable(_xmlXPathContext *, char *, _xmlXPathObject *);
extern (C) int xmlXPathRegisterFuncNS(_xmlXPathContext *, char *, char *, _BCD_func__1855);
extern (C) int xmlXPathRegisterFunc(_xmlXPathContext *, char *, _BCD_func__1855);
extern (C) void xmlXPathRegisteredNsCleanup(_xmlXPathContext *);
extern (C) char * xmlXPathNsLookup(_xmlXPathContext *, char *);
extern (C) int xmlXPathRegisterNs(_xmlXPathContext *, char *, char *);
extern (C) _xmlNodeSet * xmlXPathTrailing(_xmlNodeSet *, _xmlNodeSet *);
extern (C) _xmlNodeSet * xmlXPathNodeTrailing(_xmlNodeSet *, _xmlNode *);
extern (C) _xmlNodeSet * xmlXPathTrailingSorted(_xmlNodeSet *, _xmlNodeSet *);
extern (C) _xmlNodeSet * xmlXPathNodeTrailingSorted(_xmlNodeSet *, _xmlNode *);
extern (C) _xmlNodeSet * xmlXPathLeading(_xmlNodeSet *, _xmlNodeSet *);
extern (C) _xmlNodeSet * xmlXPathNodeLeading(_xmlNodeSet *, _xmlNode *);
extern (C) _xmlNodeSet * xmlXPathLeadingSorted(_xmlNodeSet *, _xmlNodeSet *);
extern (C) _xmlNodeSet * xmlXPathNodeLeadingSorted(_xmlNodeSet *, _xmlNode *);
extern (C) int xmlXPathHasSameNodes(_xmlNodeSet *, _xmlNodeSet *);
extern (C) _xmlNodeSet * xmlXPathDistinct(_xmlNodeSet *);
extern (C) _xmlNodeSet * xmlXPathDistinctSorted(_xmlNodeSet *);
extern (C) _xmlNodeSet * xmlXPathIntersection(_xmlNodeSet *, _xmlNodeSet *);
extern (C) _xmlNodeSet * xmlXPathDifference(_xmlNodeSet *, _xmlNodeSet *);
extern (C) int xmlXPathNodeSetContains(_xmlNodeSet *, _xmlNode *);
extern (C) void xmlXPathDebugDumpCompExpr(_IO_FILE *, void *, int);
extern (C) void xmlXPathDebugDumpObject(_IO_FILE *, _xmlXPathObject *, int);
extern (C) void xmlXPathErr(_xmlXPathParserContext *, int);
extern (C) void xmlXPatherror(_xmlXPathParserContext *, char *, int, int);
alias _BCD_func__1855 function(void *, char *, char *) _BCD_func__1853;
extern (C) void xmlXPathRegisterFuncLookup(_xmlXPathContext *, _BCD_func__1853, void *);
alias _xmlXPathObject * function(void *, char *, char *) _BCD_func__1854;
extern (C) void xmlXPathRegisterVariableLookup(_xmlXPathContext *, _BCD_func__1854, void *);
extern (C) void * xmlXPathPopExternal(_xmlXPathParserContext *);
extern (C) _xmlNodeSet * xmlXPathPopNodeSet(_xmlXPathParserContext *);
extern (C) char * xmlXPathPopString(_xmlXPathParserContext *);
extern (C) double xmlXPathPopNumber(_xmlXPathParserContext *);
extern (C) int xmlXPathPopBoolean(_xmlXPathParserContext *);
alias _xmlXPathObject * function(_xmlXPathParserContext *, _xmlXPathObject *) _BCD_func__1860;
alias int function(_xmlXPathObject *, int) _BCD_func__1873;
alias void function(_xmlNode *) _BCD_func__1993;
alias _xmlOutputBuffer * function(char *, _xmlCharEncodingHandler *, int) _BCD_func__1994;
alias _xmlParserInputBuffer * function(char *, int) _BCD_func__1995;
alias char * function(char *) _BCD_func__2000;
alias void * function(void *, uint) _BCD_func__2001;
alias void * function(uint) _BCD_func__2002;
alias void function(void *) _BCD_func__2003;
alias void function(void *, _xmlNode *, int, char * *, char * *, int, char * *, char * *) _BCD_func__2010;
alias void function(void *, _xmlNode *, int, char * *, char * *, int, char * *, char * *, int *, int *, int, char * *, char * *) _BCD_func__2011;
alias void function(void *, _xmlNode *, char *, char *, char *) _BCD_func__2012;
alias void function(void *, _xmlNode *) _BCD_func__2013;
alias int function(void *, void *) _BCD_func__2029;
alias int function(void *) _BCD_func__1600;
alias int function(void *, char *, int) _BCD_func__2172;
alias void * function(char *) _BCD_func__2173;
alias int function(char *) _BCD_func__2174;
alias int function(void *, char *, int) _BCD_func__2175;
alias int function(char *, int *, char *, int *) _BCD_func__2185;
alias _xmlParserInput * function(char *, char *, _xmlParserCtxt *) _BCD_func__2188;
alias void function(void *, char *, char *, char *) _BCD_func__2219;
alias void function(void *, char *, char *, char *, int, char * *, int, int, char * *) _BCD_func__2220;
alias void function(void *, char *, ...) _BCD_func__2221;
alias void function(void *, char *, int) _BCD_func__2222;
alias void function(void *, char *) _BCD_func__2223;
alias void function(void *, char *, char *) _BCD_func__2224;
alias void function(void *, char *, char * *) _BCD_func__2225;
alias void function(void *, _xmlSAXLocator *) _BCD_func__2226;
alias void function(void *, char *, char *, char *, char *) _BCD_func__2227;
alias void function(void *, char *, int, _xmlElementContent *) _BCD_func__2228;
alias void function(void *, char *, char *, int, int, char *, _xmlEnumeration *) _BCD_func__2229;
alias void function(void *, char *, int, char *, char *, char *) _BCD_func__2230;
alias _xmlEntity * function(void *, char *) _BCD_func__2231;
alias _xmlParserInput * function(void *, char *, char *) _BCD_func__2232;
alias void function(char *) _BCD_func__2245;
alias void function(void *) _BCD_func__2265;
alias void function(void *, _xmlError *) _BCD_func__2266;
alias void function(void *, void *, char *, char *, char *) _BCD_func__2282;
alias void function(void *, void *, char *) _BCD_func__2283;
alias void * function(void *, char *) _BCD_func__2284;
alias void function(void *, char *) _BCD_func__2285;
alias void function(void *, char *, void *, void *) _BCD_func__2404;
alias int function(void *, long *, int) _BCD_func__1602;
alias int function(void *, char *, uint) _BCD_func__1604;
alias int function(void *, char *, uint) _BCD_func__1606;
alias int function(void * *, char *) _BCD_func__2676;
alias int function(char *, char * * *, uint *) _BCD_func__2677;
alias int function(void *, char *, char *, char *, char *) _BCD_func__2678;
