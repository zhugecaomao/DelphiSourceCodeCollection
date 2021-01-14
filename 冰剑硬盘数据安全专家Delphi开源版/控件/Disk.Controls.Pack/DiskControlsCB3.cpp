//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop
USERES("DiskControlsCB3.res");
USEPACKAGE("vcl35.bpi");
USEPACKAGE("vclx35.bpi");
USEPACKAGE("dclstd35.bpi");
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
