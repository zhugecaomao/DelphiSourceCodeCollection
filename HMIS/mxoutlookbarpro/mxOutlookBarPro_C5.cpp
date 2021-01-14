//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
USERES("mxOutlookBarPro_C5.res");
USEPACKAGE("vcl50.bpi");
USEPACKAGE("vcldbx50.bpi");
USEPACKAGE("vcldb50.bpi");
USEPACKAGE("vclbde50.bpi");
USEPACKAGE("vclx50.bpi");
USEUNIT("mxOutlookBarProReg.pas");
USERES("mxOutlookBarProReg.dcr");
USEFORMNS("mxOutlookBarProAbout.pas", Mxoutlookbarproabout, frm_OutlookProAboutBox);
USEFORMNS("mxOutlookBarProEditor.pas", Mxoutlookbarproeditor, mxHeaderEditor);
USEUNIT("mxOutlookBarPro.pas");
/////////////////////////////////////////////////////////////////////////////
#pragma package(smart_init)
//---------------------------------------------------------------------------

//   Package source.
//---------------------------------------------------------------------------

#pragma argsused
int WINAPI DllEntryPoint(HINSTANCE hinst, unsigned long reason, void*)
{
return 1;
}
/////////////////////////////////////////////////////////////////////////////
