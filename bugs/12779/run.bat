@echo off
dmd.exe -lib -version=defined lib.d
if errorlevel 1 exit 1
dmd.exe -g  -inline inlinebug.d lib.lib
if errorlevel 1 exit 1
inlinebug.exe
