@echo off

C:\cygwin\bin\timeout 5 dmd -o- test/libxml2.d bcd/bind.d -oflibxml2exa
if errorlevel 125 exit 1
if errorlevel 124 exit 0
exit 1
