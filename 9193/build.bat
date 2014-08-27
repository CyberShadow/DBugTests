@echo off
dmd -c b.d
if errorlevel 1 exit 125
dmd -inline a.d b.obj
if errorlevel 1 exit 125
a.exe
