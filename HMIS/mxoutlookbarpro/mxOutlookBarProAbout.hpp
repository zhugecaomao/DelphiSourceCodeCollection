// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'mxOutlookBarProAbout.pas' rev: 6.00

#ifndef mxOutlookBarProAboutHPP
#define mxOutlookBarProAboutHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <ExtCtrls.hpp>	// Pascal unit
#include <ShellAPI.hpp>	// Pascal unit
#include <Buttons.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <Dialogs.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Mxoutlookbarproabout
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS Tfrm_OutlookProAboutBox;
class PASCALIMPLEMENTATION Tfrm_OutlookProAboutBox : public Forms::TForm 
{
	typedef Forms::TForm inherited;
	
__published:
	Stdctrls::TLabel* lbl_Copyright;
	Stdctrls::TLabel* Lbl_ComponentName;
	Stdctrls::TLabel* Label1;
	Stdctrls::TLabel* Label4;
	Stdctrls::TLabel* Label3;
	Extctrls::TPanel* Panel1;
	Buttons::TSpeedButton* btn_WebSite;
	Buttons::TSpeedButton* btn_Close;
	Extctrls::TPanel* Panel2;
	Buttons::TSpeedButton* SpeedButton1;
	Stdctrls::TLabel* Label2;
	Stdctrls::TLabel* Label7;
	void __fastcall Panel2MouseDown(System::TObject* Sender, Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	void __fastcall btn_CloseClick(System::TObject* Sender);
	void __fastcall btn_WebSiteClick(System::TObject* Sender);
	void __fastcall SpeedButton1Click(System::TObject* Sender);
public:
	#pragma option push -w-inl
	/* TCustomForm.Create */ inline __fastcall virtual Tfrm_OutlookProAboutBox(Classes::TComponent* AOwner) : Forms::TForm(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TCustomForm.CreateNew */ inline __fastcall virtual Tfrm_OutlookProAboutBox(Classes::TComponent* AOwner, int Dummy) : Forms::TForm(AOwner, Dummy) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TCustomForm.Destroy */ inline __fastcall virtual ~Tfrm_OutlookProAboutBox(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall Tfrm_OutlookProAboutBox(HWND ParentWindow) : Forms::TForm(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE void __fastcall ShowAboutBox(const AnsiString ComponentName);

}	/* namespace Mxoutlookbarproabout */
using namespace Mxoutlookbarproabout;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// mxOutlookBarProAbout
