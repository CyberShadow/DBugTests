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

// D-provided interfaces to reflected classes
extern "C" void *CXXReflectedClass_opNeg(void *c);
extern "C" void *CXXReflectedClass_opPos(void *c);
extern "C" void *CXXReflectedClass_opPostInc(void *c);
extern "C" void *CXXReflectedClass_opPostDec(void *c);
    
extern "C" void *CXXReflectedClass_opAdd(void *c, void *x);
extern "C" void *CXXReflectedClass_opSub(void *c, void *x);
extern "C" void *CXXReflectedClass_opMul(void *c, void *x);
extern "C" void *CXXReflectedClass_opDiv(void *c, void *x);
extern "C" void *CXXReflectedClass_opMod(void *c, void *x);
extern "C" void *CXXReflectedClass_opAnd(void *c, void *x);
extern "C" void *CXXReflectedClass_opOr(void *c, void *x);
extern "C" void *CXXReflectedClass_opXor(void *c, void *x);
extern "C" void *CXXReflectedClass_opShl(void *c, void *x);
extern "C" void *CXXReflectedClass_opShr(void *c, void *x);
extern "C" int CXXReflectedClass_opEquals(void *c, void *x);
extern "C" int CXXReflectedClass_opNotEquals(void *c, void *x);
extern "C" int CXXReflectedClass_opLT(void *c, void *x);
extern "C" int CXXReflectedClass_opLE(void *c, void *x);
extern "C" int CXXReflectedClass_opGT(void *c, void *x);
extern "C" int CXXReflectedClass_opGE(void *c, void *x);
extern "C" void *CXXReflectedClass_opAddAssign(void *c, void *x);
extern "C" void *CXXReflectedClass_opSubAssign(void *c, void *x);
extern "C" void *CXXReflectedClass_opMulAssign(void *c, void *x);
extern "C" void *CXXReflectedClass_opDivAssign(void *c, void *x);
extern "C" void *CXXReflectedClass_opModAssign(void *c, void *x);
extern "C" void *CXXReflectedClass_opAndAssign(void *c, void *x);
extern "C" void *CXXReflectedClass_opOrAssign(void *c, void *x);
extern "C" void *CXXReflectedClass_opXorAssign(void *c, void *x);


// classes reflected into C++ from D
class DReflectedClass {
    public:
    
    DReflectedClass();
    DReflectedClass(void *sdptr);
    
    DReflectedClass operator-();
    DReflectedClass operator+();
    DReflectedClass operator++(int x);
    DReflectedClass operator--(int x);
    
    DReflectedClass operator+(DReflectedClass x);
    DReflectedClass operator-(DReflectedClass x);
    DReflectedClass operator*(DReflectedClass x);
    DReflectedClass operator/(DReflectedClass x);
    DReflectedClass operator%(DReflectedClass x);
    DReflectedClass operator&(DReflectedClass x);
    DReflectedClass operator|(DReflectedClass x);
    DReflectedClass operator^(DReflectedClass x);
    DReflectedClass operator<<(DReflectedClass x);
    DReflectedClass operator>>(DReflectedClass x);
    int operator==(DReflectedClass x);
    int operator!=(DReflectedClass x);
    int operator<(DReflectedClass x);
    int operator<=(DReflectedClass x);
    int operator>(DReflectedClass x);
    int operator>=(DReflectedClass x);
    DReflectedClass operator+=(DReflectedClass x);
    DReflectedClass operator-=(DReflectedClass x);
    DReflectedClass operator*=(DReflectedClass x);
    DReflectedClass operator/=(DReflectedClass x);
    DReflectedClass operator%=(DReflectedClass x);
    DReflectedClass operator&=(DReflectedClass x);
    DReflectedClass operator|=(DReflectedClass x);
    DReflectedClass operator^=(DReflectedClass x);
    
    void *dptr;
};
