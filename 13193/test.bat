@echo off
cd Tango-D2
C:\cygwin\bin\timeout 10 dmd -c -I. -inline -O  -of./objs/tango-net-util-cOpenSSL-O--inline--release.o tango/net/util/c/OpenSSL.d
if errorlevel 124 exit 1
exit 0
