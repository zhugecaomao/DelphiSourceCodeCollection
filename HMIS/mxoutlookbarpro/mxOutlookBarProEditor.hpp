// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'mxOutlookBarProEditor.pas' rev: 6.00

#ifndef mxOutlookBarProEditorHPP
#define mxOutlookBarProEditorHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <ImgList.hpp>	// Pascal unit
#include <ToolWin.hpp>	// Pascal unit
#include <ComCtrls.hpp>	// Pascal unit
#include <mxOutlookBarPro.hpp>	// Pascal unit
#include <DesignEditors.hpp>	// Pascal unit
#include <DesignWindows.hpp>	// Pascal unit
#include <DesignIntf.hpp>	// Pascal unit
#include <Menus.hpp>	// Pascal unit
#include <Grids.hpp>	// Pascal unit
#include <ExtCtrls.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <Dialogs.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Mxoutlookbarproeditor
{
//-- type declarations -------------------------------------------------------
typedef IDesigner TDesigner;
;

typedef IDesigner TFormDesigner;
;

class DELPHICLASS TmxHeaderEditor;
class PASCALIMPLEMENTATION TmxHeaderEditor : public Designwindows::TDesignWindow 
{
	typedef Designwindows::TDesignWindow inherited;
	
__published:
	Extctrls::TPanel* ClientPanel;
	Grids::TDrawGrid* grid_Headers;
	Menus::TPopupMenu* PopupMenu;
	Menus::TMenuItem* mnu_Delete;
	Menus::TMenuItem* N1;
	Menus::TMenuItem* mnu_New;
	Controls::TImageList* ImageList;
	Controls::TImageList* ImageList_Gray;
	Extctrls::TSplitter* Splitter1;
	Comctrls::TStatusBar* StatusBar;
	Comctrls::TCoolBar* CoolBar;
	Comctrls::TToolBar* ToolBar;
	Comctrls::TToolButton* btn_New;
	Comctrls::TToolButton* btn_Delete;
	Comctrls::TToolButton* ToolButton1;
	Comctrls::TToolButton* btn_Clear;
	Comctrls::TToolButton* ToolButton4;
	Comctrls::TToolButton* btn_Close;
	Comctrls::TToolButton* btn_DeleteButton;
	Grids::TDrawGrid* grid_Buttons;
	Comctrls::TToolButton* ToolButton2;
	Comctrls::TToolButton* btn_NewButton;
	Menus::TPopupMenu* PopupMenu1;
	Menus::TMenuItem* mnu_DelButton;
	Menus::TMenuItem* MenuItem2;
	Menus::TMenuItem* MenuItem3;
	void __fastcall FormClose(System::TObject* Sender, Forms::TCloseAction &Action);
	void __fastcall grid_HeadersDrawCell(System::TObject* Sender, int Col, int Row, const Types::TRect &Rect, Grids::TGridDrawState State);
	void __fastcall grid_HeadersSelectCell(System::TObject* Sender, int Col, int Row, bool &CanSelect);
	void __fastcall btn_CloseClick(System::TObject* Sender);
	void __fastcall btn_DeleteClick(System::TObject* Sender);
	void __fastcall grid_HeadersKeyDown(System::TObject* Sender, Word &Key, Classes::TShiftState Shift);
	void __fastcall FormResize(System::TObject* Sender);
	void __fastcall FormCreate(System::TObject* Sender);
	void __fastcall btn_NewClick(System::TObject* Sender);
	void __fastcall btn_ClearClick(System::TObject* Sender);
	void __fastcall Splitter1Moved(System::TObject* Sender);
	void __fastcall ClientPanelResize(System::TObject* Sender);
	void __fastcall FormShow(System::TObject* Sender);
	void __fastcall Grid_ButtonsDrawCell(System::TObject* Sender, int ACol, int ARow, const Types::TRect &Rect, Grids::TGridDrawState State);
	void __fastcall Grid_ButtonsKeyDown(System::TObject* Sender, Word &Key, Classes::TShiftState Shift);
	void __fastcall btn_DeleteButtonClick(System::TObject* Sender);
	void __fastcall Grid_ButtonsSelectCell(System::TObject* Sender, int ACol, int ARow, bool &CanSelect);
	void __fastcall btn_NewButtonClick(System::TObject* Sender);
	
private:
	bool FDeleting;
	Mxoutlookbarpro::TmxHeader* FActiveHeader;
	Mxoutlookbarpro::TmxOutlookBarPro* FOutlookBarPro;
	Forms::TCustomForm* __fastcall GetForm(void);
	bool __fastcall CheckCollection(void);
	Mxoutlookbarpro::TmxHeader* __fastcall HeaderByRow(int ARow);
	Mxoutlookbarpro::TmxButton* __fastcall ButtonByRow(int ARow);
	void __fastcall SelectHeader(Mxoutlookbarpro::TmxHeader* AHeader);
	void __fastcall SelectButton(Mxoutlookbarpro::TmxButton* AButton);
	void __fastcall UpdateData(void);
	void __fastcall SetHeaderList(Mxoutlookbarpro::TmxOutlookBarPro* AValue);
	
protected:
	DYNAMIC void __fastcall Activated(void);
	virtual AnsiString __fastcall UniqueName(Classes::TComponent* Component);
	
public:
	virtual void __fastcall ItemDeleted(const Designintf::_di_IDesigner ADesigner, Classes::TPersistent* Item);
	virtual bool __fastcall EditAction(Designintf::TEditAction Action);
	virtual void __fastcall ItemsModified(const Designintf::_di_IDesigner Designer);
	virtual void __fastcall DesignerClosed(const Designintf::_di_IDesigner ADesigner, bool AGoingDormant);
	__property Forms::TCustomForm* OwnerForm = {read=GetForm};
	virtual Designintf::TEditState __fastcall GetEditState(void);
	__property Mxoutlookbarpro::TmxOutlookBarPro* OutlookBarPro = {read=FOutlookBarPro, write=SetHeaderList};
public:
	#pragma option push -w-inl
	/* TDesignWindow.Create */ inline __fastcall virtual TmxHeaderEditor(Classes::TComponent* AOwner) : Designwindows::TDesignWindow(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TDesignWindow.Destroy */ inline __fastcall virtual ~TmxHeaderEditor(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TCustomForm.CreateNew */ inline __fastcall virtual TmxHeaderEditor(Classes::TComponent* AOwner, int Dummy) : Designwindows::TDesignWindow(AOwner, Dummy) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TmxHeaderEditor(HWND ParentWindow) : Designwindows::TDesignWindow(ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Mxoutlookbarproeditor */
using namespace Mxoutlookbarproeditor;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// mxOutlookBarProEditor
