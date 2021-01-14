//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop
USERES("DiskControlsCB4.res");
USEPACKAGE("vcl40.bpi");
USEPACKAGE("dclstd40.bpi");
USEUNIT("_DCReg.pas");
USERES("_DCReg.dcr");
//---------------------------------------------------------------------------
#pragma package(smart_init)
//---------------------------------------------------------------------------
//   Package source.
//---------------------------------------------------------------------------
int WINAPI DllEntryPoint(HINSTANCE hinst, unsigned long reason, void*)
{
        return 1;
}
//---------------------------------------------------------------------------
