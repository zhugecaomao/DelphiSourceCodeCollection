//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
USERES("AAFont_BCB5.res");
USEPACKAGE("vcl50.bpi");
USEUNIT("AASpin.pas");
USEUNIT("AAFont.pas");
USEUNIT("AAFontDialog.pas");
USEUNIT("AAFontEditor.pas");
USEUNIT("AACtrls.pas");
USERES("AACtrls.dcr");
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
