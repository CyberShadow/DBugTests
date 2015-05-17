::set PATH=D:\devel\D\dmd2\windows\\bin;C:\Program Files (x86)\Windows Kits\8.1\\\bin;%PATH%
::set DMD_LIB=C:\Program Files (x86)\Microsoft Visual Studio 11.0\VC\\lib\amd64;C:\Program Files (x86)\Windows Kits\8.1\Lib\winv6.3\um\x64
::set WindowsSdkDir=C:\Program Files (x86)\Windows Kits\8.1\
::set VCINSTALLDIR=C:\Program Files (x86)\Microsoft Visual Studio 11.0\VC\
::"C:\Program Files (x86)\VisualD\pipedmd.exe" ^
::

dmd -lib -m64 -g -debug -X ^
-Xf"Debug\dlib.json" -deps="Debug\dlib.dep" -of"Debug\dlib.lib" -map ^
"Debug\dlib.map" lib.d


"CL.exe" ^
 /c /Zi /nologo /W3 /WX- /Od /D WIN32 /D _DEBUG /D ^
_CONSOLE /D _UNICODE /D UNICODE /Gm /EHsc /RTC1 /MDd /GS /fp:precise ^
/Zc:wchar_t /Zc:forScope /Fo"x64\Debug\\" /Fd"x64\Debug\vc110.pdb" /Gd /TP ^
/errorReport:prompt main.cpp

"link.exe" ^
 /ERRORREPORT:PROMPT ^
/OUT:"CppDMix.exe" /INCREMENTAL /NOLOGO ^
/LIBPATH:C:\Soft\dmd2d\windows\lib64 ^
/LIBPATH:Debug ^
phobos64.lib dlib.lib kernel32.lib user32.lib ^
gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib ^
oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /MANIFEST ^
/MANIFESTUAC:"level='asInvoker' uiAccess='false'" /manifest:embed /DEBUG ^
/PDB:"CppDMix.pdb" /SUBSYSTEM:CONSOLE /TLBID:1 ^
/DYNAMICBASE /NXCOMPAT /IMPLIB:"CppDMix.lib" /MACHINE:X64 x64\Debug\main.obj ^
