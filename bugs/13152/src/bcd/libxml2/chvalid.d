/* THIS FILE GENERATED BY bcd.gen */
module bcd.libxml2.chvalid;
align(4):
public import bcd.libxml2.xmlstring;
public import bcd.libxml2.xmlversion;
alias _xmlChRangeGroup xmlChRangeGroup;
alias _xmlChRangeGroup * xmlChRangeGroupPtr;
alias _xmlChSRange xmlChSRange;
alias _xmlChSRange * xmlChSRangePtr;
alias _xmlChLRange xmlChLRange;
alias _xmlChLRange * xmlChLRangePtr;
extern (C) int xmlIsPubidChar(uint);
extern (C) int xmlIsIdeographic(uint);
extern (C) int xmlIsExtender(uint);
extern (C) int xmlIsDigit(uint);
extern (C) int xmlIsCombining(uint);
extern (C) int xmlIsChar(uint);
extern (C) int xmlIsBlank(uint);
extern (C) int xmlIsBaseChar(uint);
extern (C) int xmlCharInRange(uint, _xmlChRangeGroup *);
struct _xmlChRangeGroup {
int nbShortRange;
int nbLongRange;
_xmlChSRange * shortRange;
_xmlChLRange * longRange;
}
struct _xmlChLRange {
uint low;
uint high;
}
struct _xmlChSRange {
ushort low;
ushort high;
}
extern (C) extern char [256] xmlIsPubidChar_tab;
extern (C) extern _xmlChRangeGroup xmlIsIdeographicGroup;
extern (C) extern _xmlChRangeGroup xmlIsExtenderGroup;
extern (C) extern _xmlChRangeGroup xmlIsDigitGroup;
extern (C) extern _xmlChRangeGroup xmlIsCombiningGroup;
extern (C) extern _xmlChRangeGroup xmlIsCharGroup;
extern (C) extern _xmlChRangeGroup xmlIsBaseCharGroup;
