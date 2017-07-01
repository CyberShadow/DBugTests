@echo off

cd src
C:\cygwin\bin\timeout 5 dmd -o- test/libxml2.d bcd/bind.d -oflibxml2exa
if errorlevel 125 exit 0
if errorlevel 124 exit 1
exit 0
