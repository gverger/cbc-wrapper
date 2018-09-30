%module cbc_wrapper

%include "typemaps.i"
%include "carrays.i"

%{
#include "coin/Coin_C_defines.h"
#include "coin/Cbc_C_Interface.h"
%}

%array_class(int, IntArray)
%array_class(double, DoubleArray)

%include "coin/Coin_C_defines.h"
%include "coin/Cbc_C_Interface.h"
