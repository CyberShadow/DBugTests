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

#include "bind.h"

DReflectedClass::DReflectedClass()
{ dptr = (void *) 0; }

DReflectedClass::DReflectedClass(void *sdptr)
{ dptr = sdptr; }

DReflectedClass DReflectedClass::operator-()
{ return DReflectedClass(CXXReflectedClass_opNeg(dptr)); }
DReflectedClass DReflectedClass::operator+()
{ return DReflectedClass(CXXReflectedClass_opPos(dptr)); }
DReflectedClass DReflectedClass::operator++(int x)
{ return DReflectedClass(CXXReflectedClass_opPostInc(dptr)); }
DReflectedClass DReflectedClass::operator--(int x)
{ return DReflectedClass(CXXReflectedClass_opPostDec(dptr)); }
    
DReflectedClass DReflectedClass::operator+(DReflectedClass x)
{ return DReflectedClass(CXXReflectedClass_opAdd(dptr, x.dptr)); }
DReflectedClass DReflectedClass::operator-(DReflectedClass x)
{ return DReflectedClass(CXXReflectedClass_opSub(dptr, x.dptr)); }
DReflectedClass DReflectedClass::operator*(DReflectedClass x)
{ return DReflectedClass(CXXReflectedClass_opMul(dptr, x.dptr)); }
DReflectedClass DReflectedClass::operator/(DReflectedClass x)
{ return DReflectedClass(CXXReflectedClass_opDiv(dptr, x.dptr)); }
DReflectedClass DReflectedClass::operator%(DReflectedClass x)
{ return DReflectedClass(CXXReflectedClass_opMod(dptr, x.dptr)); }
DReflectedClass DReflectedClass::operator&(DReflectedClass x)
{ return DReflectedClass(CXXReflectedClass_opAnd(dptr, x.dptr)); }
DReflectedClass DReflectedClass::operator|(DReflectedClass x)
{ return DReflectedClass(CXXReflectedClass_opOr(dptr, x.dptr)); }
DReflectedClass DReflectedClass::operator^(DReflectedClass x)
{ return DReflectedClass(CXXReflectedClass_opXor(dptr, x.dptr)); }
DReflectedClass DReflectedClass::operator<<(DReflectedClass x)
{ return DReflectedClass(CXXReflectedClass_opShl(dptr, x.dptr)); }
DReflectedClass DReflectedClass::operator>>(DReflectedClass x)
{ return DReflectedClass(CXXReflectedClass_opShr(dptr, x.dptr)); }
int DReflectedClass::operator==(DReflectedClass x)
{ return CXXReflectedClass_opEquals(dptr, x.dptr); }
int DReflectedClass::operator!=(DReflectedClass x)
{ return CXXReflectedClass_opNotEquals(dptr, x.dptr); }
int DReflectedClass::operator<(DReflectedClass x)
{ return CXXReflectedClass_opLT(dptr, x.dptr); }
int DReflectedClass::operator<=(DReflectedClass x)
{ return CXXReflectedClass_opLE(dptr, x.dptr); }
int DReflectedClass::operator>(DReflectedClass x)
{ return CXXReflectedClass_opGT(dptr, x.dptr); }
int DReflectedClass::operator>=(DReflectedClass x)
{ return CXXReflectedClass_opGE(dptr, x.dptr); }
DReflectedClass DReflectedClass::operator+=(DReflectedClass x)
{ return DReflectedClass(CXXReflectedClass_opAddAssign(dptr, x.dptr)); }
DReflectedClass DReflectedClass::operator-=(DReflectedClass x)
{ return DReflectedClass(CXXReflectedClass_opSubAssign(dptr, x.dptr)); }
DReflectedClass DReflectedClass::operator*=(DReflectedClass x)
{ return DReflectedClass(CXXReflectedClass_opMulAssign(dptr, x.dptr)); }
DReflectedClass DReflectedClass::operator/=(DReflectedClass x)
{ return DReflectedClass(CXXReflectedClass_opDivAssign(dptr, x.dptr)); }
DReflectedClass DReflectedClass::operator%=(DReflectedClass x)
{ return DReflectedClass(CXXReflectedClass_opModAssign(dptr, x.dptr)); }
DReflectedClass DReflectedClass::operator&=(DReflectedClass x)
{ return DReflectedClass(CXXReflectedClass_opAndAssign(dptr, x.dptr)); }
DReflectedClass DReflectedClass::operator|=(DReflectedClass x)
{ return DReflectedClass(CXXReflectedClass_opOrAssign(dptr, x.dptr)); }
DReflectedClass DReflectedClass::operator^=(DReflectedClass x)
{ return DReflectedClass(CXXReflectedClass_opXorAssign(dptr, x.dptr)); }
