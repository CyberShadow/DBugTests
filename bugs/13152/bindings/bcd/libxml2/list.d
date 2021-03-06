/* THIS FILE GENERATED BY bcd.gen */
module bcd.libxml2.list;
align(4):
public import bcd.libxml2.xmlversion;
alias int function(void *, void *) _BCD_func__164;
alias _BCD_func__164 xmlListWalker;
alias _BCD_func__164 xmlListDataCompare;
alias void xmlLink;
alias void function(void *) _BCD_func__165;
alias _BCD_func__165 xmlListDeallocator;
alias void xmlList;
alias void * xmlListPtr;
alias void * xmlLinkPtr;
extern (C) void * xmlLinkGetData(void *);
extern (C) int xmlListCopy(void *, void *);
extern (C) void * xmlListDup(void *);
extern (C) void xmlListMerge(void *, void *);
extern (C) void xmlListReverseWalk(void *, _BCD_func__164, void *);
extern (C) void xmlListWalk(void *, _BCD_func__164, void *);
extern (C) void xmlListSort(void *);
extern (C) void xmlListReverse(void *);
extern (C) int xmlListPushBack(void *, void *);
extern (C) int xmlListPushFront(void *, void *);
extern (C) void xmlListPopBack(void *);
extern (C) void xmlListPopFront(void *);
extern (C) int xmlListSize(void *);
extern (C) void * xmlListEnd(void *);
extern (C) void * xmlListFront(void *);
extern (C) int xmlListEmpty(void *);
extern (C) void xmlListClear(void *);
extern (C) int xmlListRemoveAll(void *, void *);
extern (C) int xmlListRemoveLast(void *, void *);
extern (C) int xmlListRemoveFirst(void *, void *);
extern (C) int xmlListAppend(void *, void *);
extern (C) int xmlListInsert(void *, void *);
extern (C) void * xmlListReverseSearch(void *, void *);
extern (C) void * xmlListSearch(void *, void *);
extern (C) void xmlListDelete(void *);
extern (C) void * xmlListCreate(_BCD_func__165, _BCD_func__164);
