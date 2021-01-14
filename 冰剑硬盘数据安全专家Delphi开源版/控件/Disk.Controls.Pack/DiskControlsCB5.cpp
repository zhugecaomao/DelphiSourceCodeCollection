//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
USERES("DiskControlsCB5.res");
USEPACKAGE("vcl50.bpi");
USEPACKAGE("dclstd50.bpi");
USEUNIT("_DCReg.pas");
USERES("_DCReg.dcr");
//---------------------------------------------------------------------------
#pragma package(smart_init)
//---------------------------------------------------------------------------

//   Package source.
//---------------------------------------------------------------------------

#pragma argsused
int WINAPI DllEntryPoint(HINSTANCE hinst, unsigned long reason, void*)
{
        return 1;
}
//---------------------------------------------------------------------------
