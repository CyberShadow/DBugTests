@echo off
"C:\Downloads\!dmd\dmd.2.067.1\dmd2\windows\bin\dmd.exe" -O -m64 test.d
if errorlevel 1 exit 1
C:\cygwin\bin\timeout 3 ./test.exe > a.txt
if errorlevel 1 exit 1
C:\cygwin\bin\timeout 3 ./test.exe > b.txt
if errorlevel 1 exit 1
C:\cygwin\bin\diff.exe a.txt b.txt
if errorlevel 1 exit 0
exit 1
