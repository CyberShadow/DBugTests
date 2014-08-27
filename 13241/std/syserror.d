// Written in the D programming language
// Placed in public domain.
// Written by Walter Bright

/**
 Convert Win32 error code to string

 Source:    $(PHOBOSSRC std/_syserror.d)
*/

module std.syserror;

// Deprecated - instead use std.windows.syserror.sysErrorString()

deprecated("Please use std.windows.syserror.sysErrorString instead")
class SysError
{
    private import std.c.stdio;
    private import core.stdc.string;
    private import std.string;

    static string msg(uint errcode)
    {
        string result;

        switch (errcode)
        {
            case 2:     result = "file not found";      break;
            case 3:     result = "path not found";      break;
            case 4:     result = "too many open files"; break;
            case 5:     result = "access denied";       break;
            case 6:     result = "invalid handle";      break;
            case 8:     result = "not enough memory";   break;
            case 14:    result = "out of memory";       break;
            case 15:    result = "invalid drive";       break;
            case 21:    result = "not ready";           break;
            case 32:    result = "sharing violation";   break;
            case 87:    result = "invalid parameter";   break;

            default:
                auto r = new char[uint.sizeof * 3 + 1];
                auto len = sprintf(r.ptr, "%u", errcode);
                result = cast(string) r[0 .. len];
                break;
        }

        return result;
    }
}
