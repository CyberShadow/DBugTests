/* THIS FILE GENERATED BY bcd.gen */
module bcd.libxml2.xmlmodule;
align(4):
public import bcd.libxml2.xmlversion;
enum xmlModuleOption {
XML_MODULE_LAZY=1,
XML_MODULE_LOCAL=2,
}
alias void xmlModule;
alias void * xmlModulePtr;
extern (C) int xmlModuleFree(void *);
extern (C) int xmlModuleClose(void *);
extern (C) int xmlModuleSymbol(void *, char *, void * *);
extern (C) void * xmlModuleOpen(char *, int);
