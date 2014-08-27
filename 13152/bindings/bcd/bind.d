/**
 * Generic classes et cetera for all BCD-generated C++ bindings.
 * 
 * Authors: Gregor Richards
 * 
 * License:
 *  Copyright (C) 2006  Gregor Richards
 *  
 *  This program is free software; you can redistribute it and/or
 *  modify it under the terms of the GNU General Public License
 *  as published by the Free Software Foundation; either version 2
 *  of the License, or (at your option) any later version.
 *  
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *  
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */

module bcd.bind;

// make sure _IO_FILE gets defined properly
version (Tango) {
    import tango.stdc.stdio;
} else {
    import std.c.stdio;
}
alias FILE _IO_FILE;

class BoundClass {
    this(ifloat ignore) {}
    this(ifloat ignore, void *x) {
        __C_data = x;
    }
    void *__C_data = null;
    bool __C_data_owned = false;
}

class BCDReflectionException : Exception {
    this(char[] msg) {
        super("BCDReflectionException: " ~ msg);
    }
}

struct CXXDelegate {
    void *o;
    void *f;
}

class CXXReflectedClass {
    CXXReflectedClass opNeg() {
        throw new BCDReflectionException("opNeg unimplemented!");
    }
    CXXReflectedClass opPos() {
        throw new BCDReflectionException("opPos unimplemented!");
    }
    CXXReflectedClass opPostInc() {
        throw new BCDReflectionException("opPostInc unimplemented!");
    }
    CXXReflectedClass opPostDec() {
        throw new BCDReflectionException("opPostDec unimplemented!");
    }
    
    CXXReflectedClass opAdd(CXXReflectedClass x) {
        throw new BCDReflectionException("opAdd unimplemented!");
    }
    CXXReflectedClass opSub(CXXReflectedClass x) {
        throw new BCDReflectionException("opSub unimplemented!");
    }
    CXXReflectedClass opMul(CXXReflectedClass x) {
        throw new BCDReflectionException("opMul unimplemented!");
    }
    CXXReflectedClass opDiv(CXXReflectedClass x) {
        throw new BCDReflectionException("opDiv unimplemented!");
    }
    CXXReflectedClass opMod(CXXReflectedClass x) {
        throw new BCDReflectionException("opMod unimplemented!");
    }
    CXXReflectedClass opAnd(CXXReflectedClass x) {
        throw new BCDReflectionException("opAnd unimplemented!");
    }
    CXXReflectedClass opOr(CXXReflectedClass x) {
        throw new BCDReflectionException("opOr unimplemented!");
    }
    CXXReflectedClass opXor(CXXReflectedClass x) {
        throw new BCDReflectionException("opXor unimplemented!");
    }
    CXXReflectedClass opShl(CXXReflectedClass x) {
        throw new BCDReflectionException("opShl unimplemented!");
    }
    CXXReflectedClass opShr(CXXReflectedClass x) {
        throw new BCDReflectionException("opShr unimplemented!");
    }
    int opEquals(CXXReflectedClass x) {
        throw new BCDReflectionException("opEquals unimplemented!");
    }
    int opCmp(CXXReflectedClass x) {
        throw new BCDReflectionException("opCmp unimplemented!");
    }
    CXXReflectedClass opAddAssign(CXXReflectedClass x) {
        throw new BCDReflectionException("opAddAssign unimplemented!");
    }
    CXXReflectedClass opSubAssign(CXXReflectedClass x) {
        throw new BCDReflectionException("opSubAssign unimplemented!");
    }
    CXXReflectedClass opMulAssign(CXXReflectedClass x) {
        throw new BCDReflectionException("opMulAssign unimplemented!");
    }
    CXXReflectedClass opDivAssign(CXXReflectedClass x) {
        throw new BCDReflectionException("opDivAssign unimplemented!");
    }
    CXXReflectedClass opModAssign(CXXReflectedClass x) {
        throw new BCDReflectionException("opModAssign unimplemented!");
    }
    CXXReflectedClass opAndAssign(CXXReflectedClass x) {
        throw new BCDReflectionException("opAndAssign unimplemented!");
    }
    CXXReflectedClass opOrAssign(CXXReflectedClass x) {
        throw new BCDReflectionException("opOrAssign unimplemented!");
    }
    CXXReflectedClass opXorAssign(CXXReflectedClass x) {
        throw new BCDReflectionException("opXorAssign unimplemented!");
    }
}

private {
    // C++'s interface to these
    extern (C) CXXReflectedClass CXXReflectedClass_opNeg(CXXReflectedClass c) {
        return c.opNeg();
    }
    extern (C) CXXReflectedClass CXXReflectedClass_opPos(CXXReflectedClass c) {
        return c.opPos();
    }
    extern (C) CXXReflectedClass CXXReflectedClass_opPostInc(CXXReflectedClass c) {
        return c.opPostInc();
    }
    extern (C) CXXReflectedClass CXXReflectedClass_opPostDec(CXXReflectedClass c) {
        return c.opPostDec();
    }
    
    extern (C) CXXReflectedClass CXXReflectedClass_opAdd(CXXReflectedClass c, CXXReflectedClass x) {
        return c.opAdd(x);
    }
    extern (C) CXXReflectedClass CXXReflectedClass_opSub(CXXReflectedClass c, CXXReflectedClass x) {
        return c.opSub(x);
    }
    extern (C) CXXReflectedClass CXXReflectedClass_opMul(CXXReflectedClass c, CXXReflectedClass x) {
        return c.opMul(x);
    }
    extern (C) CXXReflectedClass CXXReflectedClass_opDiv(CXXReflectedClass c, CXXReflectedClass x) {
        return c.opDiv(x);
    }
    extern (C) CXXReflectedClass CXXReflectedClass_opMod(CXXReflectedClass c, CXXReflectedClass x) {
        return c.opMod(x);
    }
    extern (C) CXXReflectedClass CXXReflectedClass_opAnd(CXXReflectedClass c, CXXReflectedClass x) {
        return c.opAnd(x);
    }
    extern (C) CXXReflectedClass CXXReflectedClass_opOr(CXXReflectedClass c, CXXReflectedClass x) {
        return c.opOr(x);
    }
    extern (C) CXXReflectedClass CXXReflectedClass_opXor(CXXReflectedClass c, CXXReflectedClass x) {
        return c.opXor(x);
    }
    extern (C) CXXReflectedClass CXXReflectedClass_opShl(CXXReflectedClass c, CXXReflectedClass x) {
        return c.opShl(x);
    }
    extern (C) CXXReflectedClass CXXReflectedClass_opShr(CXXReflectedClass c, CXXReflectedClass x) {
        return c.opShr(x);
    }
    extern (C) int CXXReflectedClass_opEquals(CXXReflectedClass c, CXXReflectedClass x) {
        return c.opEquals(x);
    }
    extern (C) int CXXReflectedClass_opNotEquals(CXXReflectedClass c, CXXReflectedClass x) {
        return !(c.opEquals(x));
    }
    extern (C) int CXXReflectedClass_opLT(CXXReflectedClass c, CXXReflectedClass x) {
        return (c.opCmp(x) < 0);
    }
    extern (C) int CXXReflectedClass_opLE(CXXReflectedClass c, CXXReflectedClass x) {
        return (c.opCmp(x) <= 0);
    }
    extern (C) int CXXReflectedClass_opGT(CXXReflectedClass c, CXXReflectedClass x) {
        return (c.opCmp(x) > 0);
    }
    extern (C) int CXXReflectedClass_opGE(CXXReflectedClass c, CXXReflectedClass x) {
        return (c.opCmp(x) >= 0);
    }
    extern (C) CXXReflectedClass CXXReflectedClass_opAddAssign(CXXReflectedClass c, CXXReflectedClass x) {
        return c.opAddAssign(x);
    }
    extern (C) CXXReflectedClass CXXReflectedClass_opSubAssign(CXXReflectedClass c, CXXReflectedClass x) {
        return c.opSubAssign(x);
    }
    extern (C) CXXReflectedClass CXXReflectedClass_opMulAssign(CXXReflectedClass c, CXXReflectedClass x) {
        return c.opMulAssign(x);
    }
    extern (C) CXXReflectedClass CXXReflectedClass_opDivAssign(CXXReflectedClass c, CXXReflectedClass x) {
        return c.opDivAssign(x);
    }
    extern (C) CXXReflectedClass CXXReflectedClass_opModAssign(CXXReflectedClass c, CXXReflectedClass x) {
        return c.opModAssign(x);
    }
    extern (C) CXXReflectedClass CXXReflectedClass_opAndAssign(CXXReflectedClass c, CXXReflectedClass x) {
        return c.opAndAssign(x);
    }
    extern (C) CXXReflectedClass CXXReflectedClass_opOrAssign(CXXReflectedClass c, CXXReflectedClass x) {
        return c.opOrAssign(x);
    }
    extern (C) CXXReflectedClass CXXReflectedClass_opXorAssign(CXXReflectedClass c, CXXReflectedClass x) {
        return c.opXorAssign(x);
    }
}
