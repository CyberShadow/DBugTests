@echo off
C:\Soft\Tools\nocrashdialog.exe dmd -o- test.d
echo EXIT STATUS = %ERRORLEVEL%
if errorlevel 2 exit 1
exit 0
