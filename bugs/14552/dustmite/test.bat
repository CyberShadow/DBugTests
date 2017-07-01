@echo off
dmd -c test.d
if errorlevel 1 exit 1
nocrashdialog "C:\Downloads\!dmd\dmd.2.067.0\dmd2\windows\bin\dmd.exe" -c test.d
if errorlevel 1 exit 0
exit 1
