/* THIS FILE GENERATED BY bcd.gen */
module bcd.libxml2.schemasInternals;
align(4):
const int XML_SCHEMAS_ANYATTR_SKIP = 1;
const int XML_SCHEMAS_ANYATTR_LAX = 2;
const int XML_SCHEMAS_ANYATTR_STRICT = 3;
const int XML_SCHEMAS_ANY_SKIP = 1;
const int XML_SCHEMAS_ANY_LAX = 2;
const int XML_SCHEMAS_ANY_STRICT = 3;
const int XML_SCHEMAS_ATTR_USE_PROHIBITED = 0;
const int XML_SCHEMAS_ATTR_USE_REQUIRED = 1;
const int XML_SCHEMAS_ATTR_USE_OPTIONAL = 2;
const int XML_SCHEMAS_ATTR_GLOBAL = 1;
const int XML_SCHEMAS_ATTR_NSDEFAULT = 1;
const int XML_SCHEMAS_ATTR_INTERNAL_RESOLVED = 1;
const int XML_SCHEMAS_ATTR_FIXED = 1;
const int XML_SCHEMAS_WILDCARD_COMPLETE = 1;
const int XML_SCHEMAS_ATTRGROUP_WILDCARD_BUILDED = 1;
const int XML_SCHEMAS_ATTRGROUP_GLOBAL = 1;
const int XML_SCHEMAS_ATTRGROUP_MARKED = 1;
const int XML_SCHEMAS_TYPE_MIXED = 1;
const int XML_SCHEMAS_TYPE_DERIVATION_METHOD_EXTENSION = 1;
const int XML_SCHEMAS_TYPE_DERIVATION_METHOD_RESTRICTION = 1;
const int XML_SCHEMAS_TYPE_GLOBAL = 1;
const int XML_SCHEMAS_TYPE_OWNED_ATTR_WILDCARD = 1;
const int XML_SCHEMAS_TYPE_VARIETY_ABSENT = 1;
const int XML_SCHEMAS_TYPE_VARIETY_LIST = 1;
const int XML_SCHEMAS_TYPE_VARIETY_UNION = 1;
const int XML_SCHEMAS_TYPE_VARIETY_ATOMIC = 1;
const int XML_SCHEMAS_TYPE_FINAL_EXTENSION = 1;
const int XML_SCHEMAS_TYPE_FINAL_RESTRICTION = 1;
const int XML_SCHEMAS_TYPE_FINAL_LIST = 1;
const int XML_SCHEMAS_TYPE_FINAL_UNION = 1;
const int XML_SCHEMAS_TYPE_FINAL_DEFAULT = 1;
const int XML_SCHEMAS_TYPE_BUILTIN_PRIMITIVE = 1;
const int XML_SCHEMAS_TYPE_MARKED = 1;
const int XML_SCHEMAS_TYPE_BLOCK_DEFAULT = 1;
const int XML_SCHEMAS_TYPE_BLOCK_EXTENSION = 1;
const int XML_SCHEMAS_TYPE_BLOCK_RESTRICTION = 1;
const int XML_SCHEMAS_TYPE_ABSTRACT = 1;
const int XML_SCHEMAS_TYPE_FACETSNEEDVALUE = 1;
const int XML_SCHEMAS_TYPE_INTERNAL_RESOLVED = 1;
const int XML_SCHEMAS_TYPE_INTERNAL_INVALID = 1;
const int XML_SCHEMAS_TYPE_WHITESPACE_PRESERVE = 1;
const int XML_SCHEMAS_TYPE_WHITESPACE_REPLACE = 1;
const int XML_SCHEMAS_TYPE_WHITESPACE_COLLAPSE = 1;
const int XML_SCHEMAS_TYPE_HAS_FACETS = 1;
const int XML_SCHEMAS_TYPE_NORMVALUENEEDED = 1;
const int XML_SCHEMAS_ELEM_NILLABLE = 1;
const int XML_SCHEMAS_ELEM_GLOBAL = 1;
const int XML_SCHEMAS_ELEM_DEFAULT = 1;
const int XML_SCHEMAS_ELEM_FIXED = 1;
const int XML_SCHEMAS_ELEM_ABSTRACT = 1;
const int XML_SCHEMAS_ELEM_TOPLEVEL = 1;
const int XML_SCHEMAS_ELEM_REF = 1;
const int XML_SCHEMAS_ELEM_NSDEFAULT = 1;
const int XML_SCHEMAS_ELEM_INTERNAL_RESOLVED = 1;
const int XML_SCHEMAS_ELEM_CIRCULAR = 1;
const int XML_SCHEMAS_ELEM_BLOCK_ABSENT = 1;
const int XML_SCHEMAS_ELEM_BLOCK_EXTENSION = 1;
const int XML_SCHEMAS_ELEM_BLOCK_RESTRICTION = 1;
const int XML_SCHEMAS_ELEM_BLOCK_SUBSTITUTION = 1;
const int XML_SCHEMAS_ELEM_FINAL_ABSENT = 1;
const int XML_SCHEMAS_ELEM_FINAL_EXTENSION = 1;
const int XML_SCHEMAS_ELEM_FINAL_RESTRICTION = 1;
const int XML_SCHEMAS_ELEM_SUBST_GROUP_HEAD = 1;
const int XML_SCHEMAS_ELEM_INTERNAL_CHECKED = 1;
const int XML_SCHEMAS_FACET_UNKNOWN = 0;
const int XML_SCHEMAS_FACET_PRESERVE = 1;
const int XML_SCHEMAS_FACET_REPLACE = 2;
const int XML_SCHEMAS_FACET_COLLAPSE = 3;
const int XML_SCHEMAS_QUALIF_ELEM = 1;
const int XML_SCHEMAS_QUALIF_ATTR = 1;
const int XML_SCHEMAS_FINAL_DEFAULT_EXTENSION = 1;
const int XML_SCHEMAS_FINAL_DEFAULT_RESTRICTION = 1;
const int XML_SCHEMAS_FINAL_DEFAULT_LIST = 1;
const int XML_SCHEMAS_FINAL_DEFAULT_UNION = 1;
const int XML_SCHEMAS_BLOCK_DEFAULT_EXTENSION = 1;
const int XML_SCHEMAS_BLOCK_DEFAULT_RESTRICTION = 1;
const int XML_SCHEMAS_BLOCK_DEFAULT_SUBSTITUTION = 1;
const int XML_SCHEMAS_INCLUDING_CONVERT_NS = 1;
public import bcd.libxml2.xmlregexp;
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
public import bcd.libxml2.dict;
public import bcd.libxml2.tree;
public import bcd.libxml2.xmlmemory;
public import bcd.libxml2.xmlstring;
public import bcd.libxml2.xmlversion;
alias _xmlSchemaAnnot xmlSchemaAnnot;
alias _xmlSchemaAnnot * xmlSchemaAnnotPtr;
alias _xmlSchemaNotation xmlSchemaNotation;
alias _xmlSchemaNotation * xmlSchemaNotationPtr;
enum xmlSchemaTypeType {
XML_SCHEMA_TYPE_BASIC=1,
XML_SCHEMA_TYPE_ANY=2,
XML_SCHEMA_TYPE_FACET=3,
XML_SCHEMA_TYPE_SIMPLE=4,
XML_SCHEMA_TYPE_COMPLEX=5,
XML_SCHEMA_TYPE_SEQUENCE=6,
XML_SCHEMA_TYPE_CHOICE=7,
XML_SCHEMA_TYPE_ALL=8,
XML_SCHEMA_TYPE_SIMPLE_CONTENT=9,
XML_SCHEMA_TYPE_COMPLEX_CONTENT=10,
XML_SCHEMA_TYPE_UR=11,
XML_SCHEMA_TYPE_RESTRICTION=12,
XML_SCHEMA_TYPE_EXTENSION=13,
XML_SCHEMA_TYPE_ELEMENT=14,
XML_SCHEMA_TYPE_ATTRIBUTE=15,
XML_SCHEMA_TYPE_ATTRIBUTEGROUP=16,
XML_SCHEMA_TYPE_GROUP=17,
XML_SCHEMA_TYPE_NOTATION=18,
XML_SCHEMA_TYPE_LIST=19,
XML_SCHEMA_TYPE_UNION=20,
XML_SCHEMA_TYPE_ANY_ATTRIBUTE=21,
XML_SCHEMA_TYPE_IDC_UNIQUE=22,
XML_SCHEMA_TYPE_IDC_KEY=23,
XML_SCHEMA_TYPE_IDC_KEYREF=24,
XML_SCHEMA_TYPE_PARTICLE=25,
XML_SCHEMA_FACET_MININCLUSIVE=1000,
XML_SCHEMA_FACET_MINEXCLUSIVE=1001,
XML_SCHEMA_FACET_MAXINCLUSIVE=1002,
XML_SCHEMA_FACET_MAXEXCLUSIVE=1003,
XML_SCHEMA_FACET_TOTALDIGITS=1004,
XML_SCHEMA_FACET_FRACTIONDIGITS=1005,
XML_SCHEMA_FACET_PATTERN=1006,
XML_SCHEMA_FACET_ENUMERATION=1007,
XML_SCHEMA_FACET_WHITESPACE=1008,
XML_SCHEMA_FACET_LENGTH=1009,
XML_SCHEMA_FACET_MAXLENGTH=1010,
XML_SCHEMA_FACET_MINLENGTH=1011,
XML_SCHEMA_EXTRA_QNAMEREF=2000,
}
alias _xmlSchemaElement xmlSchemaElement;
alias _xmlSchemaElement * xmlSchemaElementPtr;
alias _xmlSchemaType xmlSchemaType;
alias _xmlSchemaType * xmlSchemaTypePtr;
alias _xmlSchemaAttribute xmlSchemaAttribute;
alias _xmlSchemaAttribute * xmlSchemaAttributePtr;
enum xmlSchemaContentType {
XML_SCHEMA_CONTENT_UNKNOWN=0,
XML_SCHEMA_CONTENT_EMPTY=1,
XML_SCHEMA_CONTENT_ELEMENTS=2,
XML_SCHEMA_CONTENT_MIXED=3,
XML_SCHEMA_CONTENT_SIMPLE=4,
XML_SCHEMA_CONTENT_MIXED_OR_ELEMENTS=5,
XML_SCHEMA_CONTENT_BASIC=6,
XML_SCHEMA_CONTENT_ANY=7,
}
alias void xmlSchemaVal;
alias void * xmlSchemaValPtr;
alias _xmlSchemaFacetLink xmlSchemaFacetLink;
alias _xmlSchemaFacetLink * xmlSchemaFacetLinkPtr;
alias _xmlSchemaFacet xmlSchemaFacet;
alias _xmlSchemaFacet * xmlSchemaFacetPtr;
alias _xmlSchemaTypeLink xmlSchemaTypeLink;
alias _xmlSchemaTypeLink * xmlSchemaTypeLinkPtr;
alias _xmlSchemaAttributeGroup xmlSchemaAttributeGroup;
alias _xmlSchemaAttributeGroup * xmlSchemaAttributeGroupPtr;
alias _xmlSchemaWildcard xmlSchemaWildcard;
alias _xmlSchemaWildcard * xmlSchemaWildcardPtr;
alias _xmlSchemaWildcardNs xmlSchemaWildcardNs;
alias _xmlSchemaWildcardNs * xmlSchemaWildcardNsPtr;
alias _xmlSchemaAttributeLink xmlSchemaAttributeLink;
alias _xmlSchemaAttributeLink * xmlSchemaAttributeLinkPtr;
enum xmlSchemaValType {
XML_SCHEMAS_UNKNOWN=0,
XML_SCHEMAS_STRING=1,
XML_SCHEMAS_NORMSTRING=2,
XML_SCHEMAS_DECIMAL=3,
XML_SCHEMAS_TIME=4,
XML_SCHEMAS_GDAY=5,
XML_SCHEMAS_GMONTH=6,
XML_SCHEMAS_GMONTHDAY=7,
XML_SCHEMAS_GYEAR=8,
XML_SCHEMAS_GYEARMONTH=9,
XML_SCHEMAS_DATE=10,
XML_SCHEMAS_DATETIME=11,
XML_SCHEMAS_DURATION=12,
XML_SCHEMAS_FLOAT=13,
XML_SCHEMAS_DOUBLE=14,
XML_SCHEMAS_BOOLEAN=15,
XML_SCHEMAS_TOKEN=16,
XML_SCHEMAS_LANGUAGE=17,
XML_SCHEMAS_NMTOKEN=18,
XML_SCHEMAS_NMTOKENS=19,
XML_SCHEMAS_NAME=20,
XML_SCHEMAS_QNAME=21,
XML_SCHEMAS_NCNAME=22,
XML_SCHEMAS_ID=23,
XML_SCHEMAS_IDREF=24,
XML_SCHEMAS_IDREFS=25,
XML_SCHEMAS_ENTITY=26,
XML_SCHEMAS_ENTITIES=27,
XML_SCHEMAS_NOTATION=28,
XML_SCHEMAS_ANYURI=29,
XML_SCHEMAS_INTEGER=30,
XML_SCHEMAS_NPINTEGER=31,
XML_SCHEMAS_NINTEGER=32,
XML_SCHEMAS_NNINTEGER=33,
XML_SCHEMAS_PINTEGER=34,
XML_SCHEMAS_INT=35,
XML_SCHEMAS_UINT=36,
XML_SCHEMAS_LONG=37,
XML_SCHEMAS_ULONG=38,
XML_SCHEMAS_SHORT=39,
XML_SCHEMAS_USHORT=40,
XML_SCHEMAS_BYTE=41,
XML_SCHEMAS_UBYTE=42,
XML_SCHEMAS_HEXBINARY=43,
XML_SCHEMAS_BASE64BINARY=44,
XML_SCHEMAS_ANYTYPE=45,
XML_SCHEMAS_ANYSIMPLETYPE=46,
}
extern (C) void xmlSchemaFreeWildcard(_xmlSchemaWildcard *);
extern (C) void xmlSchemaFreeType(_xmlSchemaType *);
alias void function(void *, char *, void *, void *) _BCD_func__1878;
alias void function(_xmlNode *) _BCD_func__1923;
alias _xmlOutputBuffer * function(char *, _xmlCharEncodingHandler *, int) _BCD_func__1924;
alias _xmlParserInputBuffer * function(char *, int) _BCD_func__1925;
alias void function(void *, _xmlNode *, int, char * *, char * *, int, char * *, char * *) _BCD_func__1931;
alias void function(void *, _xmlNode *, int, char * *, char * *, int, char * *, char * *, int *, int *, int, char * *, char * *) _BCD_func__1932;
alias void function(void *, _xmlNode *, char *, char *, char *) _BCD_func__1933;
alias void function(void *, _xmlNode *) _BCD_func__1934;
alias int function(void *, void *) _BCD_func__1951;
alias int function(void *) _BCD_func__1446;
alias int function(void *, char *, int) _BCD_func__2100;
alias void * function(char *) _BCD_func__2101;
alias int function(char *) _BCD_func__2102;
alias int function(void *, char *, int) _BCD_func__2103;
alias int function(char *, int *, char *, int *) _BCD_func__2113;
alias _xmlParserInput * function(char *, char *, _xmlParserCtxt *) _BCD_func__2116;
alias void function(void *, char *, char *, char *) _BCD_func__2147;
alias void function(void *, char *, char *, char *, int, char * *, int, int, char * *) _BCD_func__2148;
alias void function(void *, char *, ...) _BCD_func__2149;
alias void function(void *, char *, int) _BCD_func__2150;
alias void function(void *, char *) _BCD_func__2151;
alias void function(void *, char *, char *) _BCD_func__2152;
alias void function(void *, char *, char * *) _BCD_func__2153;
alias void function(void *) _BCD_func__2154;
alias void function(void *, _xmlSAXLocator *) _BCD_func__2155;
alias void function(void *, char *, char *, char *, char *) _BCD_func__2156;
alias void function(void *, char *, int, _xmlElementContent *) _BCD_func__2157;
alias void function(void *, char *, char *, int, int, char *, _xmlEnumeration *) _BCD_func__2158;
alias void function(void *, char *, int, char *, char *, char *) _BCD_func__2159;
alias _xmlEntity * function(void *, char *) _BCD_func__2160;
alias _xmlParserInput * function(void *, char *, char *) _BCD_func__2161;
alias void function(char *) _BCD_func__2174;
alias void function(void *) _BCD_func__2194;
alias void function(void *, _xmlError *) _BCD_func__2195;
alias void function(void *, void *, char *, char *, char *) _BCD_func__2211;
alias void function(void *, void *, char *) _BCD_func__2212;
alias void * function(void *, char *) _BCD_func__2213;
alias void function(void *, char *) _BCD_func__2214;
alias char * function(char *) _BCD_func__2219;
alias void * function(void *, uint) _BCD_func__2220;
alias void * function(uint) _BCD_func__2221;
alias int function(void *, long *, int) _BCD_func__1448;
alias int function(void *, char *, uint) _BCD_func__1450;
alias int function(void *, char *, uint) _BCD_func__1452;
alias int function(void * *, char *) _BCD_func__2611;
alias int function(char *, char * * *, uint *) _BCD_func__2612;
alias int function(void *, char *, char *, char *, char *) _BCD_func__2613;
struct _xmlSchema {
char * name;
char * targetNamespace;
char * version_;
char * id;
_xmlDoc * doc;
_xmlSchemaAnnot * annot;
int flags;
void * typeDecl;
void * attrDecl;
void * attrgrpDecl;
void * elemDecl;
void * notaDecl;
void * schemasImports;
void * _private;
void * groupDecl;
void * dict;
void * includes;
int preserve;
int counter;
void * idcDef;
void * volatiles;
}
struct _xmlSchemaNotation {
int type;
char * name;
_xmlSchemaAnnot * annot;
char * identifier;
char * targetNamespace;
}
struct _xmlSchemaElement {
int type;
_xmlSchemaType * next;
char * name;
char * id;
char * ref;
char * refNs;
_xmlSchemaAnnot * annot;
_xmlSchemaType * subtypes;
_xmlSchemaAttribute * attributes;
_xmlNode * node;
int minOccurs;
int maxOccurs;
int flags;
char * targetNamespace;
char * namedType;
char * namedTypeNs;
char * substGroup;
char * substGroupNs;
char * scope_;
char * value;
_xmlSchemaElement * refDecl;
void * contModel;
int contentType;
char * refPrefix;
void * defVal;
void * idcs;
}
struct _xmlSchemaFacetLink {
_xmlSchemaFacetLink * next;
_xmlSchemaFacet * facet;
}
struct _xmlSchemaTypeLink {
_xmlSchemaTypeLink * next;
_xmlSchemaType * type;
}
struct _xmlSchemaAttributeGroup {
int type;
_xmlSchemaAttribute * next;
char * name;
char * id;
char * ref;
char * refNs;
_xmlSchemaAnnot * annot;
_xmlSchemaAttribute * attributes;
_xmlNode * node;
int flags;
_xmlSchemaWildcard * attributeWildcard;
char * refPrefix;
_xmlSchemaAttributeGroup * refItem;
char * targetNamespace;
}
struct _xmlSchemaWildcard {
int type;
char * id;
_xmlSchemaAnnot * annot;
_xmlNode * node;
int minOccurs;
int maxOccurs;
int processContents;
int any;
_xmlSchemaWildcardNs * nsSet;
_xmlSchemaWildcardNs * negNsSet;
int flags;
}
struct _xmlSchemaWildcardNs {
_xmlSchemaWildcardNs * next;
char * value;
}
struct _xmlSchemaAttributeLink {
_xmlSchemaAttributeLink * next;
_xmlSchemaAttribute * attr;
}
struct _xmlSchemaAttribute {
int type;
_xmlSchemaAttribute * next;
char * name;
char * id;
char * ref;
char * refNs;
char * typeName;
char * typeNs;
_xmlSchemaAnnot * annot;
_xmlSchemaType * base;
int occurs;
char * defValue;
_xmlSchemaType * subtypes;
_xmlNode * node;
char * targetNamespace;
int flags;
char * refPrefix;
void * defVal;
_xmlSchemaAttribute * refDecl;
}
struct _xmlSchemaAnnot {
_xmlSchemaAnnot * next;
_xmlNode * content;
}
struct _xmlSchemaFacet {
int type;
_xmlSchemaFacet * next;
char * value;
char * id;
_xmlSchemaAnnot * annot;
_xmlNode * node;
int fixed;
int whitespace;
void * val;
void * regexp;
}
struct _xmlSchemaType {
int type;
_xmlSchemaType * next;
char * name;
char * id;
char * ref;
char * refNs;
_xmlSchemaAnnot * annot;
_xmlSchemaType * subtypes;
_xmlSchemaAttribute * attributes;
_xmlNode * node;
int minOccurs;
int maxOccurs;
int flags;
int contentType;
char * base;
char * baseNs;
_xmlSchemaType * baseType;
_xmlSchemaFacet * facets;
_xmlSchemaType * redef;
int recurse;
_xmlSchemaAttributeLink * attributeUses;
_xmlSchemaWildcard * attributeWildcard;
int builtInType;
_xmlSchemaTypeLink * memberTypes;
_xmlSchemaFacetLink * facetSet;
char * refPrefix;
_xmlSchemaType * contentTypeDef;
void * contModel;
char * targetNamespace;
}
