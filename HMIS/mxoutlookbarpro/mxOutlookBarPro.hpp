// Borland C++ Builder
// Copyright (c) 1995, 2002 by Borland Software Corporation
// All rights reserved

// (DO NOT EDIT: machine generated header) 'mxOutlookBarPro.pas' rev: 6.00

#ifndef mxOutlookBarProHPP
#define mxOutlookBarProHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Consts.hpp>	// Pascal unit
#include <ActiveX.hpp>	// Pascal unit
#include <ImgList.hpp>	// Pascal unit
#include <ActnList.hpp>	// Pascal unit
#include <ExtCtrls.hpp>	// Pascal unit
#include <Menus.hpp>	// Pascal unit
#include <Buttons.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <CommCtrl.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Mxoutlookbarpro
{
//-- type declarations -------------------------------------------------------
#pragma pack(push, 4)
struct TStreamDataHeader
{
	int DataType;
	int DataSize;
} ;
#pragma pack(pop)

#pragma pack(push, 1)
struct TBaseStreamDataBody
{
	int HeaderIndex;
	int ButtonIndex;
} ;
#pragma pack(pop)

#pragma pack(push, 1)
struct TBaseStreamData
{
	TStreamDataHeader Header;
	TBaseStreamDataBody Body;
} ;
#pragma pack(pop)

typedef Exception mxNavigatorException;
;

#pragma option push -b-
enum TmxHeaderScrollType { stNone, stLinear, stAccelerated };
#pragma option pop

#pragma option push -b-
enum TmxBitmapCopy { bcMergeCopy, bcMergePaint, bcSrcCopy, bcSrcErase, bcSrcPaint };
#pragma option pop

#pragma option push -b-
enum TmxBackgroundStyle { btBitmap, btGradient, btSolid, btTileBitmap, btTransparent };
#pragma option pop

#pragma option push -b-
enum TmxGradientDirection { gdNormal, gdInverse };
#pragma option pop

#pragma option push -b-
enum TmxGradientStyle { gtCornerTopLeft, gtCornerTopRight, gtCornerBottomRight, gtCornerBottomLeft, gtDiagonalRising, gtDiagonalFalling, gtEllipse, gtPyramid, gtVerticalToCenter, gtHorizontalToCenter, gtLeftToRight, gtTopToBottom };
#pragma option pop

#pragma option push -b-
enum TmxVerticalAlignment { vaTopJustify, vaCenter, vaBottomJustify };
#pragma option pop

#pragma option push -b-
enum TmxViewStyle { vsExplorerBar, vsOutlook };
#pragma option pop

#pragma option push -b-
enum TmxButtonStyle { bsLarge, bsSmall };
#pragma option pop

#pragma option push -b-
enum TmxButtonView { bvBig, bvExplorer, bvNormal, bvToolBox, bvWindows2000, bvWindowsXP };
#pragma option pop

#pragma option push -b-
enum TmxButtonState { hbsUp, hbsDown, hbsFocused, hbsDisabled };
#pragma option pop

#pragma option push -b-
enum TmxButtonKind { bkButton, bkLabel, bkCheckBox, bkPushButton, bkRadioButton };
#pragma option pop

#pragma option push -b-
enum TmxGlyphLayout { glGlyphLeft, glGlyphRight, glGlyphCenter };
#pragma option pop

#pragma option push -b-
enum TmxHeaderOption { hoActivateOnSelect, hoAlwaysFlat, hoButtonDown, hoCustomSettings, hoDrawBorder, hoDrawCaptionBorder, hoDrawDisabledButton, hoDrawDownButton, hoDrawFocusedButton, hoFocusDisabled, hoNoCaption, hoReadOnlyCaption, hoRoundedHeader, hoShowSelectedImage, hoShowStatusButton, hoUseHighlightFont };
#pragma option pop

typedef Set<TmxHeaderOption, hoActivateOnSelect, hoUseHighlightFont>  TmxHeaderOptions;

#pragma option push -b-
enum TmxCaptionStyle { csButtonStyle, csCustomDraw };
#pragma option pop

#pragma option push -b-
enum TmxExplorerMethod { emStandard, emCloseUp };
#pragma option pop

#pragma option push -b-
enum TmxBarOption { boAcceptOLEDrop, boActivateToolBoxScroller, boAlwaysFlatScroller, boAutoScroll, boAutoChangeHeader, boChangeToDisabled, boExplorerBorder, boFocusOnMouseEnter, boHeaderFrame, boInternalDrop, hoShowFocusRect };
#pragma option pop

typedef Set<TmxBarOption, boAcceptOLEDrop, hoShowFocusRect>  TmxBarOptions;

#pragma option push -b-
enum TmxHeaderState { hsOpened, hsClosed };
#pragma option pop

#pragma option push -b-
enum TmxBorderStyle { mxNone, mxFlat, mxFocusedFlat, mxSolid, mxSingle, mxButton, mxDefault, mxFlatButton, mxFlatButtonDown, mxSpeedUp };
#pragma option pop

#pragma option push -b-
enum TmxButtonOption { boAutoWidthLabel, boCustomFont, boCustomStyle, boCustomView, boUnderlineFont, boReadOnlyCaption };
#pragma option pop

typedef Set<TmxButtonOption, boAutoWidthLabel, boReadOnlyCaption>  TmxButtonOptions;

#pragma option push -b-
enum TmxScrollView { ssNormal, ssExpress, ssToolBox };
#pragma option pop

#pragma option push -b-
enum TmxPreSet { psOutlook, psFlatOutlook, psOutlookExpress, psOffice, psOfficeXP, psOffice2000, psToolBox, psFlatToolBox, psExplorerBar, psExplorerBarXP, psExplorerBar2000 };
#pragma option pop

#pragma option push -b-
enum TmxDropMode { dmNowhere, dmButton };
#pragma option pop

#pragma option push -b-
enum mxOutlookBarPro__1 { tsDragPending, tsDragging, tsClearPending };
#pragma option pop

typedef Set<mxOutlookBarPro__1, tsDragPending, tsClearPending>  TmxOutlookBarStates;

typedef unsigned *PCardinal;

#pragma option push -b-
enum TmxHitPosition { hpUnknown, hpAbove, hpInsert, hpBelow };
#pragma option pop

#pragma option push -b-
enum TmxHitType { xhtNowhere, xhtHeaderButton, xhtHeaderBackground, xhtButton };
#pragma option pop

#pragma option push -b-
enum TmxGlyphPosition { gpTopLeft, gpTopRight, gpBottomLeft, gpBottomRight, gpCenter };
#pragma option pop

struct TmxReference;
typedef TmxReference *PmxReference;

class DELPHICLASS TmxOutlookBarPro;
class DELPHICLASS TmxButton;
typedef void __fastcall (__closure *TmxEventBeforeDrawCommandButton)(System::TObject* Sender, Graphics::TCanvas* ACanvas, Types::TRect &AButtonRect, Types::TRect &AFocusRect, Types::TRect &AImageRect, Types::TRect &ALabelRect);

typedef void __fastcall (__closure *TmxEventDrawCommandButton)(System::TObject* Sender, Graphics::TCanvas* ACanvas, TmxButtonView AView, TmxButtonState AState, const Types::TRect &AImageRect, const Types::TRect &ALabelRect);

typedef void __fastcall (__closure *TmxEventAfterDrawCommandButton)(System::TObject* Sender, Graphics::TCanvas* ACanvas, const Types::TRect &AImageRect, const Types::TRect &ALabelRect);

class DELPHICLASS TmxBarSettings;
class DELPHICLASS TmxHeader;
class PASCALIMPLEMENTATION TmxButton : public Classes::TCollectionItem 
{
	typedef Classes::TCollectionItem inherited;
	
private:
	bool FAllowGrayed;
	bool FPaintGrayed;
	bool FChecked;
	int FMargin;
	TmxButtonKind FButtonKind;
	bool FFlashing;
	bool FAlerted;
	bool FAutoSize;
	Classes::TAlignment FAlignment;
	Controls::TControlActionLink* FActionLink;
	TmxButtonStyle FButtonStyle;
	TmxButtonView FButtonView;
	#pragma pack(push, 1)
	Types::TRect FButtonRect;
	#pragma pack(pop)
	
	#pragma pack(push, 1)
	Types::TRect FCheckBoxRect;
	#pragma pack(pop)
	
	Classes::TBiDiMode FBiDiMode;
	#pragma pack(push, 1)
	Types::TRect FImageRect;
	#pragma pack(pop)
	
	#pragma pack(push, 1)
	Types::TRect FFocusRect;
	#pragma pack(pop)
	
	#pragma pack(push, 1)
	Types::TRect FLabelRect;
	#pragma pack(pop)
	
	TmxHitPosition FDragDropHitStatus;
	AnsiString FCaption;
	Controls::TCursor FCursor;
	Graphics::TColor FColor;
	void *FData;
	bool FEnabled;
	Graphics::TFont* FFont;
	Graphics::TFont* FHighlightFont;
	Classes::THelpContext FHelpContext;
	Word FHeight;
	AnsiString FHint;
	Imglist::TCustomImageList* FImageList;
	Imglist::TImageIndex FImageIndex;
	AnsiString FName;
	bool FParentBiDiMode;
	bool FShowAccelChar;
	int FTag;
	bool FTransparent;
	TmxButtonState FState;
	TmxButtonOptions FOptions;
	AnsiString FUserString;
	bool FVisible;
	Word FWidth;
	bool FWordWrap;
	Menus::TPopupMenu* FPopupMenu;
	Stdctrls::TCheckBoxState FCheckState;
	Classes::TNotifyEvent FOnClick;
	TmxEventBeforeDrawCommandButton FOnBeforeDrawButton;
	TmxEventDrawCommandButton FOnDrawButton;
	TmxEventAfterDrawCommandButton FOnAfterDrawButton;
	Classes::TNotifyEvent FOnChangeParameter;
	void __fastcall SetChangeParameter(Classes::TNotifyEvent AValue);
	__property Classes::TNotifyEvent OnChangeParameter = {read=FOnChangeParameter, write=SetChangeParameter};
	void __fastcall SetTransparent(bool AValue);
	void __fastcall SetHint(AnsiString AValue);
	void __fastcall SetHelpContext(Classes::THelpContext AValue);
	void __fastcall SetImageIndex(Imglist::TImageIndex AValue);
	void __fastcall SetEnabled(bool AValue);
	void __fastcall SetVisible(bool AValue);
	void __fastcall SetData(void * AValue);
	Classes::TBasicAction* __fastcall GetAction(void);
	void __fastcall SetAction(Classes::TBasicAction* AValue);
	void __fastcall SetCaption(AnsiString AValue);
	void __fastcall DoActionChange(System::TObject* Sender);
	void __fastcall ChangeParameter(void);
	int __fastcall GetButtonIndex(void);
	void __fastcall SetButtonIndex(int AValue);
	void __fastcall SetButtonStyle(TmxButtonStyle AValue);
	void __fastcall SetButtonView(TmxButtonView AValue);
	void __fastcall SetAutoSize(bool AValue);
	void __fastcall SetColor(Graphics::TColor AValue);
	void __fastcall SetFont(Graphics::TFont* AValue);
	void __fastcall SetHighlightFont(Graphics::TFont* AValue);
	void __fastcall SetHeight(Word AValue);
	void __fastcall SetWidth(Word AValue);
	void __fastcall SetOptions(TmxButtonOptions AValue);
	void __fastcall SetWordWrap(bool AValue);
	void __fastcall SetAlignment(Classes::TAlignment AValue);
	virtual void __fastcall SetBiDiMode(Classes::TBiDiMode AValue);
	void __fastcall SetShowAccelChar(bool AValue);
	virtual void __fastcall SetParentBiDiMode(bool AValue);
	void __fastcall SetButtonKind(TmxButtonKind AValue);
	void __fastcall SetMargin(int AValue);
	void __fastcall SetCheckState(Stdctrls::TCheckBoxState AValue);
	void __fastcall SetChecked(bool AValue);
	Imglist::TCustomImageList* __fastcall GetButtonImageList(void);
	TmxBarSettings* __fastcall GetSettings(void);
	TmxButtonStyle __fastcall GetStyle(void);
	TmxButtonView __fastcall GetView(void);
	void __fastcall CalculateButtonRect(Types::TRect &ButtonRect, Types::TRect &ImageRect, Types::TRect &FocusRect, Types::TRect &LabelRect);
	Types::TRect __fastcall CalculateImagePositon(const Types::TRect &ButtonRect);
	Types::TRect __fastcall CalculateSmallImagePositon(const Types::TRect &ButtonRect);
	Graphics::TFont* __fastcall GetFont(bool FocusEnabled);
	bool __fastcall IsBiDiModeStored(void);
	virtual void __fastcall DoClick(void);
	int __fastcall GetHeaderIndex(void);
	TmxHeader* __fastcall GetHeader(void);
	bool __fastcall IsTheFirstButton(void);
	bool __fastcall IsTheLastButton(void);
	
protected:
	__property Controls::TControlActionLink* ActionLink = {read=FActionLink, write=FActionLink};
	virtual AnsiString __fastcall GetDisplayName();
	virtual void __fastcall SetDisplayName(const AnsiString AValue);
	virtual void __fastcall ActionChange(System::TObject* Sender, bool CheckDefaults);
	virtual TMetaClass* __fastcall GetActionLinkClass(void);
	virtual void __fastcall DrawCaption(Graphics::TCanvas* ACanvas, bool Pushed, bool Underline);
	virtual void __fastcall DrawCheckStyle(Graphics::TCanvas* ACanvas);
	virtual void __fastcall DrawFocusRect(Graphics::TCanvas* ACanvas, Types::TRect &ARect, TmxButtonState AButtonState);
	virtual void __fastcall DrawXPFocusRect(Graphics::TCanvas* ACanvas, Types::TRect &ARect, TmxButtonState AButtonState);
	virtual void __fastcall DrawImageRect(Graphics::TCanvas* ACanvas, Types::TRect &ARect, bool Pushed);
	virtual void __fastcall DrawXPImageRect(Graphics::TCanvas* ACanvas, Types::TRect &ARect, bool Pushed);
	virtual void __fastcall Draw(Graphics::TBitmap* DrawBitmap, Types::TRect &ARect, int MaxBottom, bool Calcsize);
	virtual void __fastcall DoBeforeDrawButton(Graphics::TCanvas* ACanvas, Types::TRect &AButtonRect, Types::TRect &AFocusRect, Types::TRect &AImageRect, Types::TRect &ALabelRect);
	virtual void __fastcall DoDrawButton(Graphics::TCanvas* ACanvas, TmxButtonView AView, TmxButtonState AState, const Types::TRect &AImageRect, const Types::TRect &ALabelRect);
	virtual void __fastcall DoAfterDrawButton(Graphics::TCanvas* ACanvas, const Types::TRect &AImageRect, const Types::TRect &ALabelRect);
	
public:
	__property TmxHitPosition HitStatus = {read=FDragDropHitStatus, nodefault};
	__property bool IsFirstButton = {read=IsTheFirstButton, nodefault};
	__property bool IsLastButton = {read=IsTheLastButton, nodefault};
	__property int HeaderIndex = {read=GetHeaderIndex, nodefault};
	__property Types::TRect ButtonRect = {read=FButtonRect};
	__property Types::TRect LabelRect = {read=FLabelRect};
	__property void * Data = {read=FData, write=SetData};
	bool __fastcall UseRightToLeftReading(void);
	int __fastcall DrawTextBiDiModeFlags(int Flags);
	bool __fastcall UseRightToLeftAlignment(void);
	int __fastcall DrawTextBiDiModeFlagsReadingOnly(void);
	__fastcall virtual TmxButton(Classes::TCollection* ACollection);
	__fastcall virtual ~TmxButton(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	virtual void __fastcall AssignTo(Classes::TPersistent* Destination);
	void __fastcall Alert(void);
	void __fastcall StopAlert(void);
	
__published:
	__property Classes::TBasicAction* Action = {read=GetAction, write=SetAction};
	__property bool AutoSize = {read=FAutoSize, write=SetAutoSize, nodefault};
	__property Classes::TAlignment Alignment = {read=FAlignment, write=SetAlignment, default=2};
	__property bool AllowGrayed = {read=FAllowGrayed, write=FAllowGrayed, nodefault};
	__property int ButtonIndex = {read=GetButtonIndex, write=SetButtonIndex, nodefault};
	__property TmxButtonKind ButtonKind = {read=FButtonKind, write=SetButtonKind, default=0};
	__property TmxButtonStyle ButtonStyle = {read=FButtonStyle, write=SetButtonStyle, nodefault};
	__property TmxButtonView ButtonView = {read=FButtonView, write=SetButtonView, nodefault};
	__property Classes::TBiDiMode BiDiMode = {read=FBiDiMode, write=SetBiDiMode, stored=IsBiDiModeStored, nodefault};
	__property bool Checked = {read=FChecked, write=SetChecked, nodefault};
	__property AnsiString Caption = {read=FCaption, write=SetCaption};
	__property Graphics::TColor Color = {read=FColor, write=SetColor, nodefault};
	__property Controls::TCursor Cursor = {read=FCursor, write=FCursor, default=0};
	__property Stdctrls::TCheckBoxState CheckState = {read=FCheckState, write=SetCheckState, nodefault};
	__property bool Enabled = {read=FEnabled, write=SetEnabled, nodefault};
	__property Graphics::TFont* Font = {read=FFont, write=SetFont};
	__property Graphics::TFont* HighlightFont = {read=FHighlightFont, write=SetHighlightFont};
	__property Classes::THelpContext HelpContext = {read=FHelpContext, write=SetHelpContext, nodefault};
	__property Word Height = {read=FHeight, write=SetHeight, default=20};
	__property AnsiString Hint = {read=FHint, write=SetHint};
	__property Imglist::TImageIndex ImageIndex = {read=FImageIndex, write=SetImageIndex, nodefault};
	__property int Margin = {read=FMargin, write=SetMargin, default=4};
	__property AnsiString Name = {read=GetDisplayName, write=SetDisplayName};
	__property Menus::TPopupMenu* PopupMenu = {read=FPopupMenu, write=FPopupMenu};
	__property bool ShowAccelChar = {read=FShowAccelChar, write=SetShowAccelChar, default=1};
	__property bool ParentBiDiMode = {read=FParentBiDiMode, write=SetParentBiDiMode, default=1};
	__property int Tag = {read=FTag, write=FTag, default=0};
	__property bool Transparent = {read=FTransparent, write=SetTransparent, nodefault};
	__property TmxButtonOptions Options = {read=FOptions, write=SetOptions, nodefault};
	__property AnsiString UserString = {read=FUserString, write=FUserString};
	__property bool Visible = {read=FVisible, write=SetVisible, nodefault};
	__property Word Width = {read=FWidth, write=SetWidth, default=20};
	__property bool WordWrap = {read=FWordWrap, write=SetWordWrap, default=0};
	__property Classes::TNotifyEvent OnClick = {read=FOnClick, write=FOnClick};
	__property TmxEventBeforeDrawCommandButton OnBeforeDrawButton = {read=FOnBeforeDrawButton, write=FOnBeforeDrawButton};
	__property TmxEventDrawCommandButton OnDrawButton = {read=FOnDrawButton, write=FOnDrawButton};
	__property TmxEventAfterDrawCommandButton OnAfterDrawButton = {read=FOnAfterDrawButton, write=FOnAfterDrawButton};
};


class DELPHICLASS TmxDragDropManager;
class DELPHICLASS TmxFormatEtcList;
typedef DynamicArray<tagFORMATETC >  TmxFormatEtcArray;

class PASCALIMPLEMENTATION TmxFormatEtcList : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	DynamicArray<tagFORMATETC >  FList;
	tagFORMATETC __fastcall Get(int Index);
	void __fastcall Put(int Index, const tagFORMATETC &Item);
	int __fastcall GetCount(void);
	
public:
	int __fastcall Add(const tagFORMATETC &Item);
	void __fastcall Clear(void);
	void __fastcall Delete(int Index);
	TmxFormatEtcList* __fastcall Clone(void);
	__property int Count = {read=GetCount, nodefault};
	__property tagFORMATETC Items[int Index] = {read=Get, write=Put};
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TmxFormatEtcList(void) : System::TObject() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~TmxFormatEtcList(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TmxDragDropManager : public System::TInterfacedObject 
{
	typedef System::TInterfacedObject inherited;
	
private:
	TmxFormatEtcList* FFormatEtcList;
	TmxOutlookBarPro* FOwner;
	TmxOutlookBarPro* FDragSource;
	
public:
	__fastcall virtual TmxDragDropManager(TmxOutlookBarPro* AOwner);
	__fastcall virtual ~TmxDragDropManager(void);
	HIDESBASE int __stdcall _Release(void);
	HRESULT __stdcall DAdvise(const tagFORMATETC &FormatEtc, int advf, const _di_IAdviseSink advSink, /* out */ int &dwConnection);
	HRESULT __stdcall DUnadvise(int dwConnection);
	HRESULT __stdcall EnumDAdvise(/* out */ _di_IEnumSTATDATA &enumAdvise);
	HRESULT __stdcall EnumFormatEtc(int Direction, /* out */ _di_IEnumFORMATETC &EnumFormatEtc);
	HRESULT __stdcall GetCanonicalFormatEtc(const tagFORMATETC &FormatEtc, /* out */ tagFORMATETC &FormatEtcOut);
	HRESULT __stdcall GetData(const tagFORMATETC &FormatEtcIn, /* out */ tagSTGMEDIUM &Medium);
	HRESULT __stdcall GetDataHere(const tagFORMATETC &FormatEtc, /* out */ tagSTGMEDIUM &Medium);
	HRESULT __stdcall QueryGetData(const tagFORMATETC &FormatEtc);
	virtual HRESULT __fastcall RenderData(const tagFORMATETC &FormatEtc, tagSTGMEDIUM &StgMedium);
	HRESULT __stdcall SetData(const tagFORMATETC &FormatEtc, tagSTGMEDIUM &Medium, BOOL DoRelease);
	HRESULT __stdcall GiveFeedback(int Effect);
	HRESULT __stdcall QueryContinueDrag(BOOL EscapePressed, int KeyState);
	HRESULT __stdcall DragEnter(const _di_IDataObject DataObject, int KeyState, const Types::TPoint Pt, int &Effect);
	HRESULT __stdcall DragOver(int KeyState, const Types::TPoint Pt, int &Effect);
	HRESULT __stdcall DragLeave(void);
	HRESULT __stdcall Drop(const _di_IDataObject DataObject, int KeyState, const Types::TPoint Pt, int &Effect);
	__property TmxOutlookBarPro* DragSource = {read=FDragSource};
	TmxOutlookBarPro* __fastcall GetDataSourceTree(_di_IDataObject DataObject);
	void __fastcall SetOLEFormats(void);
private:
	void *__IDataObject;	/* IDataObject */
	void *__IDropSource;	/* IDropSource */
	void *__IDropTarget;	/* IDropTarget */
	
public:
//	operator IDropTarget*(void) { return (IDropTarget*)&__IDropTarget; }  //×¢ÒâÐèÒªÆÁ±Î
//	operator IDropSource*(void) { return (IDropSource*)&__IDropSource; }
//	operator IDataObject*(void) { return (IDataObject*)&__IDataObject; }
	
};


typedef void __fastcall (__closure *TmxEventDragAllowed)(TmxOutlookBarPro* Sender, TmxButton* Button, bool &Allowed);

typedef void __fastcall (__closure *TmxEventDragOver)(TmxOutlookBarPro* Sender, System::TObject* Source, Classes::TShiftState Shift, Controls::TDragState State, const Types::TPoint &Pt, TmxDropMode Mode, int &Effect, bool &Accept);

typedef void __fastcall (__closure *TmxEventDragEnter)(TmxOutlookBarPro* Sender, _di_IDataObject DataObject, System::TObject* Source, Classes::TShiftState Shift, Controls::TDragState State, const Types::TPoint &Pt, TmxDropMode Mode, int &Effect, bool &Accept);

typedef void __fastcall (__closure *TmxEventDragDrop)(TmxOutlookBarPro* Sender, System::TObject* Source, _di_IDataObject DataObject, const Word * Formats, const int Formats_Size, Classes::TShiftState Shift, const Types::TPoint &Pt, int &Effect, TmxDropMode Mode);

class DELPHICLASS TmxBackground;
class DELPHICLASS TmxCustomBackground;
class DELPHICLASS TmxGradient;
class PASCALIMPLEMENTATION TmxGradient : public Classes::TPersistent 
{
	typedef Classes::TPersistent inherited;
	
private:
	#pragma pack(push, 1)
	Types::TRect FOldRect;
	#pragma pack(pop)
	
	TmxGradientDirection FDirection;
	Graphics::TColor FBeginColor;
	Graphics::TColor FEndColor;
	TmxGradientStyle FGradientStyle;
	int FColorTable[256];
	Graphics::TBitmap* FBitmap;
	Classes::TNotifyEvent FOnChangeParameter;
	void __fastcall SetColor(int Index, Graphics::TColor AValue);
	void __fastcall SetGradientStyle(TmxGradientStyle AValue);
	void __fastcall SetDirection(TmxGradientDirection AValue);
	void __fastcall InternalDrawGradient(Graphics::TCanvas* ACanvas, int X, int Y, int Width, int Height);
	
protected:
	void __fastcall LoadColors(void);
	DYNAMIC void __fastcall Change(void);
	
public:
	__property Graphics::TBitmap* GradientBitmap = {read=FBitmap};
	__fastcall virtual TmxGradient(void);
	__fastcall virtual ~TmxGradient(void);
	virtual void __fastcall DrawGradient(Graphics::TCanvas* ACanvas, const Types::TRect &ARect);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	virtual void __fastcall AssignTo(Classes::TPersistent* Destination);
	
__published:
	__property Graphics::TColor BeginColor = {read=FBeginColor, write=SetColor, index=1, default=0};
	__property TmxGradientStyle DrawStyle = {read=FGradientStyle, write=SetGradientStyle, default=10};
	__property TmxGradientDirection Direction = {read=FDirection, write=SetDirection, default=0};
	__property Graphics::TColor EndColor = {read=FEndColor, write=SetColor, index=2, default=16711680};
	__property Classes::TNotifyEvent OnChangeParameter = {read=FOnChangeParameter, write=FOnChangeParameter};
};


class PASCALIMPLEMENTATION TmxCustomBackground : public Classes::TPersistent 
{
	typedef Classes::TPersistent inherited;
	
private:
	Graphics::TBitmap* FBackgroundBitmap;
	Byte FAlphaBlend;
	TmxBitmapCopy FBitmapCopy;
	TmxBackgroundStyle FBackgroundStyle;
	Graphics::TColor FColor;
	bool FDrawing;
	TmxGradient* FGradient;
	bool FGrayscale;
	Classes::TNotifyEvent FOnChangeParameter;
	void __fastcall SetBackgroundBitmap(Graphics::TBitmap* AValue);
	void __fastcall SetBitmapCopy(TmxBitmapCopy AValue);
	void __fastcall SetAlphaBlend(Byte AValue);
	void __fastcall SetBackgroundStyle(TmxBackgroundStyle AValue);
	void __fastcall SetColor(Graphics::TColor AValue);
	void __fastcall SetGrayscale(bool AValue);
	void __fastcall SetOnChangeParameter(Classes::TNotifyEvent AValue);
	
protected:
	virtual void __fastcall DrawSolidBackground(Graphics::TCanvas* ACanvas, const Types::TRect &ARect);
	virtual void __fastcall DrawBitmapBackground(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, bool Tiled);
	virtual void __fastcall AlphaBlendBackground(Graphics::TBitmap* DrawBitmap, const Types::TRect &ARect);
	virtual void __fastcall ConvertToGrayScale(Graphics::TBitmap* DrawBitmap, const Types::TRect &ARect);
	DYNAMIC void __fastcall Change(void);
	__property Byte AlphaBlend = {read=FAlphaBlend, write=SetAlphaBlend, default=0};
	__property Graphics::TBitmap* Bitmap = {read=FBackgroundBitmap, write=SetBackgroundBitmap};
	__property TmxBitmapCopy BitmapCopy = {read=FBitmapCopy, write=SetBitmapCopy, default=2};
	__property Graphics::TColor Color = {read=FColor, write=SetColor, default=-2147483633};
	__property TmxGradient* Gradient = {read=FGradient, write=FGradient};
	__property bool Grayscale = {read=FGrayscale, write=SetGrayscale, default=0};
	__property TmxBackgroundStyle Style = {read=FBackgroundStyle, write=SetBackgroundStyle, default=2};
	
public:
	__fastcall virtual TmxCustomBackground(void);
	__fastcall virtual ~TmxCustomBackground(void);
	virtual void __fastcall DrawBackground(Graphics::TBitmap* DrawBitmap, const Types::TRect &ARect);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	virtual void __fastcall AssignTo(Classes::TPersistent* Destination);
	__property Classes::TNotifyEvent OnChangeParameter = {read=FOnChangeParameter, write=SetOnChangeParameter};
};


class PASCALIMPLEMENTATION TmxBackground : public TmxCustomBackground 
{
	typedef TmxCustomBackground inherited;
	
__published:
	__property AlphaBlend  = {default=0};
	__property Bitmap ;
	__property BitmapCopy  = {default=2};
	__property Color  = {default=-2147483633};
	__property Gradient ;
	__property Grayscale  = {default=0};
	__property Style  = {default=2};
	__property OnChangeParameter ;
public:
	#pragma option push -w-inl
	/* TmxCustomBackground.Create */ inline __fastcall virtual TmxBackground(void) : TmxCustomBackground() { }
	#pragma option pop
	#pragma option push -w-inl
	/* TmxCustomBackground.Destroy */ inline __fastcall virtual ~TmxBackground(void) { }
	#pragma option pop
	
};


class DELPHICLASS TmxBorder;
class PASCALIMPLEMENTATION TmxBorder : public Classes::TPersistent 
{
	typedef Classes::TPersistent inherited;
	
private:
	#pragma pack(push, 1)
	Types::TRect FRect;
	#pragma pack(pop)
	
	Word FSeparator;
	Classes::TNotifyEvent FOnChangeParameter;
	void __fastcall SetData(int Index, Word AValue);
	Word __fastcall GetData(int Index);
	
protected:
	DYNAMIC void __fastcall Change(void);
	
public:
	__property Types::TRect GetAsRect = {read=FRect};
	__fastcall virtual TmxBorder(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	virtual void __fastcall AssignTo(Classes::TPersistent* Destination);
	
__published:
	__property Word Bottom = {read=GetData, write=SetData, index=2, default=0};
	__property Word Left = {read=GetData, write=SetData, index=3, default=0};
	__property Word Right = {read=GetData, write=SetData, index=4, default=0};
	__property Word Separator = {read=GetData, write=SetData, index=5, default=0};
	__property Word Top = {read=GetData, write=SetData, index=1, default=0};
	__property Classes::TNotifyEvent OnChangeParameter = {read=FOnChangeParameter, write=FOnChangeParameter};
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TmxBorder(void) { }
	#pragma option pop
	
};


class DELPHICLASS TmxCloseButton;
class PASCALIMPLEMENTATION TmxCloseButton : public Classes::TPersistent 
{
	typedef Classes::TPersistent inherited;
	
private:
	TmxHeader* FCloseHeader;
	#pragma pack(push, 1)
	Types::TRect FCloseRect;
	#pragma pack(pop)
	
	TmxButtonState FCloseState;
	Classes::TNotifyEvent FOnClose;
	void __fastcall SetVisible(bool AValue);
	bool __fastcall GetVisible(void);
	void __fastcall SetTransparent(bool AValue);
	bool __fastcall GetTransparent(void);
	void __fastcall SetCaption(AnsiString AValue);
	AnsiString __fastcall GetCaption();
	void __fastcall SetFont(Graphics::TFont* AValue);
	Graphics::TFont* __fastcall GetFont(void);
	void __fastcall SetHeight(int AValue);
	int __fastcall GetHeight(void);
	Word __fastcall GetMargin(void);
	void __fastcall SetMargin(Word AValue);
	int __fastcall GetImageIndex(void);
	void __fastcall SetImageIndex(int AValue);
	
public:
	__property Types::TRect CloseRect = {read=FCloseRect};
	__property TmxButtonState CloseState = {read=FCloseState, nodefault};
	__property TmxHeader* CloseHeader = {read=FCloseHeader};
	__fastcall virtual TmxCloseButton(TmxOutlookBarPro* AOwner);
	__fastcall virtual ~TmxCloseButton(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	virtual void __fastcall AssignTo(Classes::TPersistent* Destination);
	
__published:
	__property AnsiString Caption = {read=GetCaption, write=SetCaption};
	__property Graphics::TFont* Font = {read=GetFont, write=SetFont};
	__property int Height = {read=GetHeight, write=SetHeight, nodefault};
	__property int ImageIndex = {read=GetImageIndex, write=SetImageIndex, nodefault};
	__property Word Margin = {read=GetMargin, write=SetMargin, nodefault};
	__property bool Transparent = {read=GetTransparent, write=SetTransparent, nodefault};
	__property bool Visible = {read=GetVisible, write=SetVisible, default=0};
	__property Classes::TNotifyEvent OnClose = {read=FOnClose, write=FOnClose};
};


class DELPHICLASS TmxHeaders;
class PASCALIMPLEMENTATION TmxHeaders : public Classes::TCollection 
{
	typedef Classes::TCollection inherited;
	
public:
	TmxHeader* operator[](int Index) { return Headers[Index]; }
	
private:
	TmxOutlookBarPro* FOutlookBarPro;
	TmxHeader* __fastcall GetHeaderItem(int Index);
	void __fastcall SetHeaderItem(int Index, TmxHeader* AValue);
	
protected:
	DYNAMIC int __fastcall GetAttrCount(void);
	DYNAMIC AnsiString __fastcall GetAttr(int Index);
	DYNAMIC AnsiString __fastcall GetItemAttr(int Index, int ItemIndex);
	virtual void __fastcall SetItemName(Classes::TCollectionItem* Item);
	virtual void __fastcall Update(Classes::TCollectionItem* Item);
	DYNAMIC Classes::TPersistent* __fastcall GetOwner(void);
	
public:
	__fastcall TmxHeaders(TmxOutlookBarPro* AOutlookBarPro, TMetaClass* ItemClass);
	HIDESBASE TmxHeader* __fastcall Add(void);
	__property TmxOutlookBarPro* OutlookBarPro = {read=FOutlookBarPro};
	__property TmxHeader* Headers[int Index] = {read=GetHeaderItem, write=SetHeaderItem/*, default*/};
public:
	#pragma option push -w-inl
	/* TCollection.Destroy */ inline __fastcall virtual ~TmxHeaders(void) { }
	#pragma option pop
	
};


class DELPHICLASS TmxHeaderImages;
class PASCALIMPLEMENTATION TmxHeaderImages : public Classes::TPersistent 
{
	typedef Classes::TPersistent inherited;
	
private:
	Imglist::TCustomImageList* FHot;
	Imglist::TChangeLink* FHotChangeLink;
	Imglist::TCustomImageList* FNormal;
	Imglist::TChangeLink* FNormalChangeLink;
	Classes::TComponent* FOwnerComponent;
	Classes::TNotifyEvent FOnChangeParameter;
	void __fastcall SetImages(int Index, Imglist::TCustomImageList* AValue);
	void __fastcall ImageListChange(System::TObject* Sender);
	
protected:
	DYNAMIC void __fastcall Change(void);
	
public:
	__fastcall virtual TmxHeaderImages(Classes::TComponent* AOwner);
	__fastcall virtual ~TmxHeaderImages(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	virtual void __fastcall AssignTo(Classes::TPersistent* Destination);
	
__published:
	__property Imglist::TCustomImageList* Hot = {read=FHot, write=SetImages, index=2};
	__property Imglist::TCustomImageList* Normal = {read=FNormal, write=SetImages, index=1};
	__property Classes::TNotifyEvent OnChangeParameter = {read=FOnChangeParameter, write=FOnChangeParameter};
};


class DELPHICLASS TmxInplaceEditor;
class DELPHICLASS TmxInplaceEdit;
class PASCALIMPLEMENTATION TmxInplaceEdit : public Stdctrls::TCustomEdit 
{
	typedef Stdctrls::TCustomEdit inherited;
	
private:
	Classes::TAlignment FAlignment;
	bool FActivate;
	Graphics::TColor FBorderColor;
	bool FFlat;
	bool FShowBorder;
	bool FMouseInHeader;
	bool FWordWrap;
	HIDESBASE MESSAGE void __fastcall WMNCPaint(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMMouseEnter(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMMouseLeave(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall WMSetFocus(Messages::TWMSetFocus &Message);
	HIDESBASE MESSAGE void __fastcall WMKillFocus(Messages::TWMKillFocus &Message);
	HIDESBASE MESSAGE void __fastcall WMSize(Messages::TWMSize &Message);
	void __fastcall DrawComponentBorder(Graphics::TColor AColor, Graphics::TColor ABorder, TmxBorderStyle AStyle, Graphics::TCanvas* ACanvas, const Types::TRect &ARect);
	HIDESBASE void __fastcall SetFont(Graphics::TFont* AValue);
	Graphics::TFont* __fastcall GetFont(void);
	void __fastcall SetBorderColor(Graphics::TColor AValue);
	void __fastcall SetFlat(bool AValue);
	void __fastcall SetShowBorder(bool AValue);
	void __fastcall SetWordWrap(bool AValue);
	void __fastcall SetAlignment(Classes::TAlignment AValue);
	
protected:
	virtual void __fastcall CreateParams(Controls::TCreateParams &Params);
	void __fastcall SetControlBorder(void);
	HIDESBASE void __fastcall InvalidateControl(void);
	
public:
	__fastcall virtual TmxInplaceEdit(Classes::TComponent* AOwner);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	virtual void __fastcall AssignTo(Classes::TPersistent* Destination);
	
__published:
	__property Classes::TAlignment Alignment = {read=FAlignment, write=SetAlignment, default=0};
	__property bool Activate = {read=FActivate, write=FActivate, nodefault};
	__property Graphics::TColor BorderColor = {read=FBorderColor, write=SetBorderColor, nodefault};
	__property bool Flat = {read=FFlat, write=SetFlat, nodefault};
	__property bool ShowBorder = {read=FShowBorder, write=SetShowBorder, nodefault};
	__property Graphics::TFont* Font = {read=GetFont, write=SetFont};
	__property bool WordWrap = {read=FWordWrap, write=SetWordWrap, default=1};
	__property PopupMenu ;
	__property OnContextPopup  = {stored=false};
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TmxInplaceEdit(HWND ParentWindow) : Stdctrls::TCustomEdit(ParentWindow) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TWinControl.Destroy */ inline __fastcall virtual ~TmxInplaceEdit(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TmxInplaceEditor : public Classes::TPersistent 
{
	typedef Classes::TPersistent inherited;
	
private:
	bool FHeaderEdit;
	TmxInplaceEdit* FEdit;
	Classes::TCollectionItem* FEditingItem;
	bool FEditing;
	Classes::TNotifyEvent FOnChange;
	void __fastcall SetFont(Graphics::TFont* AValue);
	Graphics::TFont* __fastcall GetFont(void);
	Graphics::TColor __fastcall GetBorderColor(void);
	void __fastcall SetBorderColor(Graphics::TColor AValue);
	bool __fastcall GetFlat(void);
	void __fastcall SetFlat(bool AValue);
	void __fastcall SetShowBorder(bool AValue);
	bool __fastcall GetShowBorder(void);
	void __fastcall SetWordWrap(bool AValue);
	bool __fastcall GetWordWrap(void);
	void __fastcall SetAlignment(Classes::TAlignment AValue);
	Classes::TAlignment __fastcall GetAlignment(void);
	void __fastcall SetPopup(Menus::TPopupMenu* AValue);
	Menus::TPopupMenu* __fastcall GetPopup(void);
	void __fastcall SetOnContextPopup(Controls::TContextPopupEvent AValue);
	Controls::TContextPopupEvent __fastcall GetOnContextPopup();
	void __fastcall DoEndEdit(bool ACancel);
	void __fastcall OnEditExit(System::TObject* Sender);
	void __fastcall DoEditKeyDown(System::TObject* Sender, Word &Key, Classes::TShiftState Shift);
	
protected:
	DYNAMIC void __fastcall Change(void);
	virtual void __fastcall DoProcessEditResults(bool ACancel);
	
public:
	__property bool Editing = {read=FEditing, nodefault};
	__fastcall virtual TmxInplaceEditor(TmxOutlookBarPro* AOwner);
	void __fastcall EditHeader(TmxHeader* AHeader);
	void __fastcall EditButton(TmxButton* AButton);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	virtual void __fastcall AssignTo(Classes::TPersistent* Destination);
	
__published:
	__property Classes::TAlignment Alignment = {read=GetAlignment, write=SetAlignment, nodefault};
	__property Graphics::TColor BorderColor = {read=GetBorderColor, write=SetBorderColor, nodefault};
	__property bool Flat = {read=GetFlat, write=SetFlat, nodefault};
	__property bool ShowBorder = {read=GetShowBorder, write=SetShowBorder, nodefault};
	__property Graphics::TFont* Font = {read=GetFont, write=SetFont};
	__property bool WordWrap = {read=GetWordWrap, write=SetWordWrap, nodefault};
	__property Menus::TPopupMenu* PopupMenu = {read=GetPopup, write=SetPopup};
	__property Controls::TContextPopupEvent OnContextPopup = {read=GetOnContextPopup, write=SetOnContextPopup};
	__property Classes::TNotifyEvent OnChange = {read=FOnChange, write=FOnChange};
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TmxInplaceEditor(void) { }
	#pragma option pop
	
};


typedef void __fastcall (__closure *TmxEventHeaderChange)(System::TObject* Sender, int OldIndex, int NewIndex);

typedef void __fastcall (__closure *TmxEventCanChangeHeader)(System::TObject* Sender, TmxHeader* NewHeader, bool &CanChange);

typedef void __fastcall (__closure *TmxEventChangeViewStyle)(System::TObject* Sender, TmxViewStyle OldStyle, TmxViewStyle NewStyle, bool &CanChange);

typedef void __fastcall (__closure *TmxEventDrawHeaderButtons)(System::TObject* Sender, Graphics::TCanvas* ACanvas, const Types::TRect &ARect, int ActiveIndex);

typedef void __fastcall (__closure *TmxEventDrawButton)(System::TObject* Sender, Graphics::TCanvas* ACanvas, const Types::TRect &ARect, TmxButtonState AState);

typedef void __fastcall (__closure *TmxEventAfterChangeStyle)(System::TObject* Sender, TmxPreSet NewStyle);

class DELPHICLASS TmxButtonImages;
typedef void __fastcall (__closure *TmxEventDrawHeader)(System::TObject* Sender, Graphics::TCanvas* ACanvas, const Types::TRect &ARect);

class PASCALIMPLEMENTATION TmxOutlookBarPro : public Controls::TCustomControl 
{
	typedef Controls::TCustomControl inherited;
	
private:
	bool FAcceptedObject;
	bool FLoaded;
	bool FStopAlerting;
	Graphics::TColor FAlertColor;
	TmxButton* FAlertedButton;
	Graphics::TColor FDropMarkColor;
	TmxDropMode FLastDropMode;
	TmxButton* FDraggedButton;
	int FDragThreshold;
	#pragma pack(push, 1)
	Types::TPoint FDragStartPos;
	#pragma pack(pop)
	
	TmxDragDropManager* FDragManager;
	TmxOutlookBarStates FDragStates;
	TmxButton* FLastVCLDragTarget;
	TmxButton* FCurrentTargetButton;
	TmxHeader* FCurrentTargetHeader;
	unsigned FAutoScrollDelay;
	unsigned FAutoButtonScrollDelay;
	unsigned FAutoChangeDelay;
	unsigned FAlertInterval;
	TmxEventDragAllowed FOnDragAllowed;
	TmxEventDragOver FOnDragOver;
	TmxEventDragEnter FOnDragEnter;
	TmxEventDragDrop FOnDragDrop;
	bool FEachHeaderSelection;
	int FOffset;
	bool FScrollDown;
	#pragma pack(push, 1)
	Types::TRect FScrollUpRect;
	#pragma pack(pop)
	
	TmxButtonState FScrollUpState;
	#pragma pack(push, 1)
	Types::TRect FScrollDownRect;
	#pragma pack(pop)
	
	TmxButtonState FScrollDownState;
	#pragma pack(push, 1)
	Types::TRect FButtonScrollUpRect;
	#pragma pack(pop)
	
	TmxButtonState FButtonScrollUpState;
	#pragma pack(push, 1)
	Types::TRect FButtonScrollDownRect;
	#pragma pack(pop)
	
	TmxButtonState FButtonScrollDownState;
	int FSavedHeaderIndex;
	TmxHeader* FActiveHeader;
	TmxBackground* FBackground;
	Controls::TBevelCut FBevelInner;
	Controls::TBevelCut FBevelOuter;
	Controls::TBevelWidth FBevelWidth;
	TmxBorder* FBorder;
	Forms::TFormBorderStyle FBorderStyle;
	bool FCommonStyle;
	TmxCloseButton* FCloseButton;
	TmxExplorerMethod FExplorerMethod;
	bool FFlat;
	TmxHeaders* FHeaders;
	TmxHeaderImages* FHeaderImages;
	TmxHeader* FMouseInHeader;
	TmxHeader* FMouseInHeaderBody;
	TmxButton* FMouseInButton;
	bool FProcessing;
	bool FPainting;
	bool FReCalcHeaderPositions;
	TmxHeaderScrollType FHeaderScrollType;
	Byte FHeaderScrollValue;
	Byte FHeaderScrollAcceleration;
	int FSequence;
	TmxBarSettings* FSettings;
	Word FScrollChange;
	TmxBarOptions FOptions;
	bool FUpdating;
	int FUpdateCounter;
	int FUpdatedHeaderIndex;
	int FVersion;
	TmxViewStyle FViewStyle;
	TmxInplaceEditor* FEditor;
	bool FReadyToPaint;
	TmxScrollView FScrollView;
	Word FScrollBoxSize;
	TmxPreSet FPreSet;
	Controls::TContextPopupEvent FOnContextPopup;
	Controls::TContextPopupEvent FOnEditorContextPopup;
	TmxEventHeaderChange FOnChange;
	TmxEventCanChangeHeader FOnCanChange;
	TmxEventChangeViewStyle FOnChangeViewStyle;
	TmxEventDrawHeaderButtons FOnDrawHeaderButtons;
	TmxEventDrawHeaderButtons FOnAfterDrawHeaderButtons;
	Classes::TNotifyEvent FOnHide;
	Classes::TNotifyEvent FOnShow;
	TmxEventDrawButton FOnDrawCloseButton;
	TmxEventAfterChangeStyle FOnAfterChangeStyle;
	MESSAGE void __fastcall WMTimer(Messages::TWMTimer &Message);
	HIDESBASE MESSAGE void __fastcall WMLButtonDown(Messages::TWMMouse &Message);
	HIDESBASE MESSAGE void __fastcall WMLButtonUp(Messages::TWMMouse &Message);
	HIDESBASE MESSAGE void __fastcall WMNCDestroy(Messages::TWMNoParams &Message);
	HIDESBASE MESSAGE void __fastcall WMSize(Messages::TWMSize &Message);
	HIDESBASE MESSAGE void __fastcall CMDesignHitTest(Messages::TWMMouse &Msg);
	HIDESBASE MESSAGE void __fastcall WMSetFocus(Messages::TWMSetFocus &Message);
	HIDESBASE MESSAGE void __fastcall WMKillFocus(Messages::TWMSetFocus &Message);
	HIDESBASE MESSAGE void __fastcall CMBorderChanged(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMCtl3DChanged(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMSysColorChange(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMColorChanged(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMEnabledChanged(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMFontChanged(Messages::TMessage &Msg);
	MESSAGE void __fastcall CMTextChanged(Messages::TMessage &Msg);
	HIDESBASE MESSAGE void __fastcall CMVisibleChanged(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMDialogChar(Messages::TWMKey &Message);
	MESSAGE void __fastcall CNNotify(Messages::TWMNotify &Message);
	HIDESBASE MESSAGE void __fastcall CMHintShow(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMDrag(Controls::TCMDrag &Message);
	HIDESBASE MESSAGE void __fastcall CMMouseWheel(Controls::TCMMouseWheel &Message);
	HIDESBASE MESSAGE void __fastcall WMContextMenu(Messages::TWMContextMenu &Message);
	void __fastcall SetBorderStyle(Forms::TBorderStyle AValue);
	void __fastcall SetBevelInner(Controls::TBevelCut AValue);
	void __fastcall SetBevelOuter(Controls::TBevelCut AValue);
	HIDESBASE void __fastcall SetBevelWidth(Controls::TBevelWidth AValue);
	void __fastcall SetScrollView(TmxScrollView AValue);
	int __fastcall GetHeaderCount(void);
	int __fastcall GetVisibleHeaderCount(void);
	int __fastcall GetEnabledHeaderCount(void);
	void __fastcall SetCommonStyle(bool AValue);
	void __fastcall SetViewStyle(TmxViewStyle AValue);
	void __fastcall SetFlat(bool AValue);
	void __fastcall SetHeaderScrollType(TmxHeaderScrollType AValue);
	void __fastcall SetHeaderScrollValue(Byte AValue);
	void __fastcall SetHeaderScrollAcceleration(Byte AValue);
	void __fastcall SetVersion(AnsiString AValue);
	AnsiString __fastcall GetVersion();
	int __fastcall GetNextVisibleIndex(int ActiveIndex);
	int __fastcall GetActiveHeaderIndex(void);
	void __fastcall CheckImages(TmxButtonImages* AImages, Classes::TComponent* AComponent, Classes::TOperation Operation);
	void __fastcall CheckHeaderImages(TmxHeaderImages* AImages, Classes::TComponent* AComponent, Classes::TOperation Operation);
	void __fastcall PropertyChanged(System::TObject* Sender);
	void __fastcall ReadAlign(Classes::TReader* Reader);
	void __fastcall WriteAlign(Classes::TWriter* Writer);
	void __fastcall ReadIndex(Classes::TReader* Reader);
	void __fastcall WriteIndex(Classes::TWriter* Writer);
	TmxEventDrawHeader __fastcall GetOnDrawCloseHeader();
	void __fastcall SetOnDrawCloseHeader(TmxEventDrawHeader AValue);
	TmxEventDrawHeader __fastcall GetOnAfterDrawCloseHeader();
	void __fastcall SetOnAfterDrawCloseHeader(TmxEventDrawHeader AValue);
	Classes::TNotifyEvent __fastcall GetOnClose();
	void __fastcall SetOnClose(Classes::TNotifyEvent AValue);
	void __fastcall SetExplorerMethod(TmxExplorerMethod AValue);
	void __fastcall SetHeaders(TmxHeaders* AValue);
	TmxHeaders* __fastcall GetHeaders(void);
	TmxHeader* __fastcall GetHeader(int Index);
	void __fastcall SetOptions(TmxBarOptions AValue);
	void __fastcall SetScrollChange(Word AValue);
	void __fastcall DoScrollUp(void);
	void __fastcall DoScrollDown(void);
	void __fastcall SetInplaceEditor(TmxInplaceEditor* AValue);
	void __fastcall SetActiveHeader(TmxHeader* ANewHeader);
	void __fastcall SetScrollBoxSize(Word AValue);
	HIDESBASE void __fastcall SetBorderWidth(Controls::TBorderWidth AValue);
	Controls::TBorderWidth __fastcall GetBorderWidth(void);
	void __fastcall SetPreSet(TmxPreSet AValue);
	void __fastcall SetEachHeaderSelection(bool AValue);
	bool __fastcall ProcessOLEData(TmxOutlookBarPro* Source, _di_IDataObject DataObject, TmxButton* TargetButton, TmxHitPosition HitMode, int &Effect);
	void __fastcall SetAlertedButton(TmxButton* AButton);
	void __fastcall SetAlertInterval(unsigned AValue);
	bool __fastcall GetDragging(void);
	virtual HRESULT __fastcall DoDragEnter(const _di_IDataObject DataObject, int KeyState, const Types::TPoint &Pt, int &Effect);
	virtual HRESULT __fastcall DoDragOver(System::TObject* Source, int KeyState, Controls::TDragState DragState, const Types::TPoint &Pt, int &Effect);
	virtual HRESULT __fastcall DoDragDrop(const _di_IDataObject DataObject, int KeyState, const Types::TPoint &Pt, int &Effect);
	void __fastcall DoDragging(const Types::TPoint &P);
	virtual void __fastcall DoDragLeave(void);
	virtual int __fastcall SuggestDropEffect(System::TObject* Source, Classes::TShiftState Shift, const Types::TPoint &Pt, int AllowedEffects);
	TmxButton* __fastcall GetHitTestInfoAt(int X, int Y, TmxHitPosition &HitInfo);
	void __fastcall StopTimer(int ID);
	virtual Types::TRect __fastcall InvalidateButton(TmxButton* Button);
	void __fastcall FinishButtonHeader(Classes::TStream* Stream, int StartPos, int EndPos);
	virtual void __fastcall WriteButton(Classes::TStream* Stream, TmxButton* AButton);
	void __fastcall WriteButtonToStream(Classes::TStream* Stream, TmxButton* AButton);
	TmxButton* __fastcall GetButtonAt(int X, int Y);
	TmxHeader* __fastcall GetHeaderAt(int X, int Y);
	TmxButton* __fastcall GetButtonExactlyAt(int X, int Y);
	TmxHeader* __fastcall GetHeaderButtonAt(int X, int Y);
	HIDESBASE void __fastcall BeginDrag(bool Immediate, int Threshold = 0xffffffff);
	void __fastcall HandleMouseDown(Messages::TWMMouse &Message);
	void __fastcall HandleMouseUp(Messages::TWMMouse &Message);
	virtual void __fastcall DoPaintDropMark(Graphics::TCanvas* Canvas, const Types::TRect &R, TmxHitPosition DragDropHitStatus);
	virtual void __fastcall DoAutoScroll(int X, int Y);
	void __fastcall DoInvalidate(void);
	void __fastcall ProcessMouseLeave(void);
	void __fastcall EditorContext(System::TObject* Sender, const Types::TPoint &MousePos, bool &Handled);
	void __fastcall ConfigureOfficeBackground(TmxHeader* Header);
	void __fastcall ConfigureNormalBackground(Graphics::TColor BackColor, int FirstTop, TmxHeader* Header);
	void __fastcall ConfigureExplorerBackground(Graphics::TColor BackColor, int FirstTop, bool DrawBorder, TmxHeader* Header);
	void __fastcall SetPresetHeader(TmxHeader* AHeader);
	
protected:
	DYNAMIC void __fastcall DoMyContextPopup(System::TObject* Sender, const Types::TPoint &MousePos, bool &Handled);
	virtual void __fastcall AdjustClientRect(Types::TRect &Rect);
	virtual void __fastcall CreateParams(Controls::TCreateParams &Params);
	DYNAMIC void __fastcall Change(void);
	virtual void __fastcall DefineProperties(Classes::TFiler* Filer);
	DYNAMIC void __fastcall KeyDown(Word &Key, Classes::TShiftState Shift);
	virtual void __fastcall Notification(Classes::TComponent* AComponent, Classes::TOperation Operation);
	DYNAMIC void __fastcall MouseMove(Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseDown(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseUp(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int Y);
	virtual void __fastcall Paint(void);
	HIDESBASE MESSAGE void __fastcall WMEraseBkgnd(Messages::TWMEraseBkgnd &Message);
	HIDESBASE MESSAGE void __fastcall CMMouseEnter(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall CMMouseLeave(Messages::TMessage &Message);
	virtual void __fastcall Loaded(void);
	virtual void __fastcall CreateWnd(void);
	virtual void __fastcall DoChange(int OldIndex, int NewIndex);
	virtual void __fastcall DoCanChange(TmxHeader* NewHeader, bool &CanChange);
	virtual bool __fastcall DoChangeViewStyle(System::TObject* Sender, TmxViewStyle OldStyle, TmxViewStyle NewStyle);
	virtual void __fastcall DoDrawHeaderButtons(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, int ActiveIndex);
	virtual void __fastcall DoAfterDrawHeaderButtons(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, int ActiveIndex);
	virtual void __fastcall DoDrawCloseButton(Graphics::TCanvas* ACanvas, const Types::TRect &ARect, TmxButtonState State);
	virtual void __fastcall DoShow(void);
	virtual void __fastcall DoHide(void);
	virtual void __fastcall DoClose(void);
	virtual bool __fastcall DoBeforeDrag(TmxButton* AButton);
	virtual void __fastcall WndProc(Messages::TMessage &Message);
	
public:
	__property int ActiveHeaderIndex = {read=GetActiveHeaderIndex, nodefault};
	__property TmxHeader* MouseInControl = {read=FMouseInHeader};
	__property int HeaderCount = {read=GetHeaderCount, nodefault};
	__property int VisibleHeaderCount = {read=GetVisibleHeaderCount, nodefault};
	__property int EnabledHeaderCount = {read=GetEnabledHeaderCount, nodefault};
	__fastcall virtual TmxOutlookBarPro(Classes::TComponent* AOwner);
	__fastcall virtual ~TmxOutlookBarPro(void);
	int __fastcall CreateHeader(void);
	TmxHeader* __fastcall AddHeader(void);
	void __fastcall RemoveHeader(TmxHeader* AHeader);
	void __fastcall DeleteHeader(int AHeaderIndex);
	void __fastcall ClearHeaders(void);
	__property TmxHeader* Header[int Index] = {read=GetHeader};
	TmxHeader* __fastcall HeaderByIndex(int Index);
	TmxHeader* __fastcall HeaderByName(AnsiString Name);
	int __fastcall HeaderIndexByName(AnsiString Name);
	DYNAMIC bool __fastcall CanFocus(void);
	virtual void __fastcall BeginUpdate(void);
	virtual void __fastcall EndUpdate(void);
	TmxHitType __fastcall GetItemAt(int X, int Y, int &HeaderIndex, int &ButtonIndex);
	TmxHeader* __fastcall GetPrevHeader(TmxHeader* AHeader);
	TmxHeader* __fastcall GetNextHeader(TmxHeader* AHeader);
	void __fastcall CollapseAll(void);
	void __fastcall ExpandAll(void);
	void __fastcall RenameHeader(TmxHeader* AHeader);
	void __fastcall RenameHeaderByIndex(int AHeaderIndex);
	virtual void __fastcall LoadFromFile(const AnsiString FileName);
	virtual void __fastcall LoadFromStream(Classes::TStream* Stream);
	virtual void __fastcall SaveToFile(const AnsiString FileName);
	virtual void __fastcall SaveToStream(Classes::TStream* Stream);
	__property bool Dragging = {read=GetDragging, nodefault};
	bool __fastcall ProcessOuterDrop(_di_IDataObject DataObject, TmxButton* NewButton, TmxButton* TargetButton, int &Effect, TmxHitPosition HitMode);
	bool __fastcall ProcessDrop(_di_IDataObject DataObject, TmxButton* TargetButton, int &Effect, TmxHitPosition HitMode);
	__property TmxButton* CurrentTargetButton = {read=FCurrentTargetButton};
	__property TmxHeader* CurrentTargetHeader = {read=FCurrentTargetHeader};
	
__published:
	__property Graphics::TColor AlertColor = {read=FAlertColor, write=FAlertColor, default=255};
	__property TmxHeader* ActiveHeader = {read=FActiveHeader, write=SetActiveHeader, stored=false};
	__property unsigned AutoButtonScrollDelay = {read=FAutoButtonScrollDelay, write=FAutoButtonScrollDelay, default=600};
	__property unsigned AutoScrollDelay = {read=FAutoScrollDelay, write=FAutoScrollDelay, default=500};
	__property unsigned AutoChangeDelay = {read=FAutoChangeDelay, write=FAutoChangeDelay, default=100};
	__property unsigned AlertInterval = {read=FAlertInterval, write=SetAlertInterval, default=500};
	__property TmxBackground* Background = {read=FBackground, write=FBackground};
	__property Controls::TBevelCut BevelInner = {read=FBevelInner, write=SetBevelInner, default=0};
	__property Controls::TBevelCut BevelOuter = {read=FBevelOuter, write=SetBevelOuter, default=2};
	__property Controls::TBevelWidth BevelWidth = {read=FBevelWidth, write=SetBevelWidth, default=1};
	__property TmxBorder* Border = {read=FBorder, write=FBorder};
	__property Forms::TBorderStyle BorderStyle = {read=FBorderStyle, write=SetBorderStyle, default=1};
	__property bool CommonStyle = {read=FCommonStyle, write=SetCommonStyle, nodefault};
	__property TmxCloseButton* CloseButton = {read=FCloseButton, write=FCloseButton};
	__property Graphics::TColor DropMarkColor = {read=FDropMarkColor, write=FDropMarkColor, default=0};
	__property bool EachHeaderSelection = {read=FEachHeaderSelection, write=SetEachHeaderSelection, default=0};
	__property TmxExplorerMethod ExplorerMethod = {read=FExplorerMethod, write=SetExplorerMethod, default=1};
	__property bool Flat = {read=FFlat, write=SetFlat, default=1};
	__property TmxHeaders* Headers = {read=GetHeaders, write=SetHeaders};
	__property TmxHeaderImages* HeaderImages = {read=FHeaderImages, write=FHeaderImages};
	__property TmxInplaceEditor* InplaceEditor = {read=FEditor, write=SetInplaceEditor};
	__property Byte HeaderScrollAcceleration = {read=FHeaderScrollAcceleration, write=SetHeaderScrollAcceleration, default=5};
	__property Word ScrollChange = {read=FScrollChange, write=SetScrollChange, default=50};
	__property TmxHeaderScrollType HeaderScrollType = {read=FHeaderScrollType, write=SetHeaderScrollType, default=2};
	__property Byte HeaderScrollValue = {read=FHeaderScrollValue, write=SetHeaderScrollValue, default=20};
	__property TmxPreSet PreSet = {read=FPreSet, write=SetPreSet, stored=false, default=0};
	__property Word ScrollBoxSize = {read=FScrollBoxSize, write=SetScrollBoxSize, default=15};
	__property TmxBarSettings* Settings = {read=FSettings, write=FSettings};
	__property TmxScrollView ScrollView = {read=FScrollView, write=SetScrollView, default=0};
	__property TmxBarOptions Options = {read=FOptions, write=SetOptions, nodefault};
	__property AnsiString Version = {read=GetVersion, write=SetVersion};
	__property TmxViewStyle ViewStyle = {read=FViewStyle, write=SetViewStyle, default=1};
	__property TmxEventDrawHeader OnDrawCloseHeader = {read=GetOnDrawCloseHeader, write=SetOnDrawCloseHeader};
	__property TmxEventDrawHeader OnAfterDrawCloseHeader = {read=GetOnAfterDrawCloseHeader, write=SetOnAfterDrawCloseHeader};
	__property TmxEventHeaderChange OnChange = {read=FOnChange, write=FOnChange};
	__property TmxEventCanChangeHeader OnCanChange = {read=FOnCanChange, write=FOnCanChange};
	__property TmxEventDrawButton OnDrawCloseButton = {read=FOnDrawCloseButton, write=FOnDrawCloseButton};
	__property TmxEventDrawHeaderButtons OnDrawHeaderButtons = {read=FOnDrawHeaderButtons, write=FOnDrawHeaderButtons};
	__property TmxEventDrawHeaderButtons OnAfterDrawHeaderButtons = {read=FOnAfterDrawHeaderButtons, write=FOnAfterDrawHeaderButtons};
	__property TmxEventChangeViewStyle OnChangeViewStyle = {read=FOnChangeViewStyle, write=FOnChangeViewStyle};
	__property Classes::TNotifyEvent OnHide = {read=FOnHide, write=FOnHide};
	__property Classes::TNotifyEvent OnShow = {read=FOnShow, write=FOnShow};
	__property Classes::TNotifyEvent OnClose = {read=GetOnClose, write=SetOnClose};
	__property TmxEventAfterChangeStyle OnAfterChangeStyle = {read=FOnAfterChangeStyle, write=FOnAfterChangeStyle};
	__property Controls::TContextPopupEvent OnContextPopup = {read=FOnContextPopup, write=FOnContextPopup};
	__property Controls::TContextPopupEvent OnEditorContextPopup = {read=FOnEditorContextPopup, write=FOnEditorContextPopup};
	__property TmxEventDragAllowed OnDragAllowed = {read=FOnDragAllowed, write=FOnDragAllowed};
	__property TmxEventDragOver OnDragOver = {read=FOnDragOver, write=FOnDragOver};
	__property TmxEventDragEnter OnDragEnter = {read=FOnDragEnter, write=FOnDragEnter};
	__property TmxEventDragDrop OnDragDrop = {read=FOnDragDrop, write=FOnDragDrop};
	__property Align  = {default=0};
	__property Anchors  = {default=3};
	__property BorderWidth  = {read=GetBorderWidth, write=SetBorderWidth, default=0};
	__property Constraints ;
	__property Ctl3D ;
	__property Cursor  = {default=0};
	__property Enabled  = {default=1};
	__property PopupMenu ;
	__property TabStop  = {default=0};
	__property TabOrder  = {default=-1};
	__property Visible  = {default=1};
	__property OnClick ;
	__property OnDblClick ;
	__property DockSite  = {default=0};
	__property DragCursor  = {default=-12};
	__property DragKind  = {default=0};
	__property DragMode  = {default=0};
	__property ShowHint ;
	__property ParentShowHint  = {default=1};
	__property BiDiMode ;
	__property ParentBiDiMode  = {default=1};
	__property OnDockDrop ;
	__property OnEndDock ;
	__property OnEndDrag ;
	__property OnGetSiteInfo ;
	__property OnStartDock ;
	__property OnUnDock ;
	__property OnCanResize ;
	__property OnEnter ;
	__property OnExit ;
	__property OnKeyDown ;
	__property OnKeyPress ;
	__property OnKeyUp ;
	__property OnMouseDown ;
	__property OnMouseMove ;
	__property OnMouseUp ;
	__property OnMouseWheel ;
	__property OnMouseWheelDown ;
	__property OnMouseWheelUp ;
	__property OnResize ;
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TmxOutlookBarPro(HWND ParentWindow) : Controls::TCustomControl(ParentWindow) { }
	#pragma option pop
	
};


#pragma pack(push, 4)
struct TmxReference
{
	unsigned Process;
	TmxOutlookBarPro* Bar;
} ;
#pragma pack(pop)

typedef void __fastcall (__closure *TmxEventDrawStatusButton)(System::TObject* Sender, Graphics::TCanvas* ACanvas, const Types::TRect &ARect, TmxHeaderState AState);

typedef void __fastcall (__closure *TmxEventCheckScroll)(System::TObject* Sender, bool &ScrollUpNeed, bool &ScrollDownNeed, bool &Automatic);

class DELPHICLASS TmxEnumFormatEtc;
class PASCALIMPLEMENTATION TmxEnumFormatEtc : public System::TInterfacedObject 
{
	typedef System::TInterfacedObject inherited;
	
protected:
	TmxFormatEtcList* FFormatEtcList;
	int FCurrentIndex;
	
public:
	__fastcall TmxEnumFormatEtc(TmxFormatEtcList* FormatEtcList);
	__fastcall virtual ~TmxEnumFormatEtc(void);
	HRESULT __stdcall Next(int Celt, /* out */ void *Elt, PLongint PCeltFetched);
	HRESULT __stdcall Skip(int Celt);
	HRESULT __stdcall Reset(void);
	HRESULT __stdcall Clone(/* out */ _di_IEnumFORMATETC &Enum);
private:
	void *__IEnumFORMATETC;	/* IEnumFORMATETC */
	
public:
	operator IEnumFORMATETC*(void) { return (IEnumFORMATETC*)&__IEnumFORMATETC; }
	
};


class DELPHICLASS TmxButtonActionLink;
class PASCALIMPLEMENTATION TmxButtonActionLink : public Controls::TControlActionLink 
{
	typedef Controls::TControlActionLink inherited;
	
protected:
	TmxButton* FClient;
	virtual void __fastcall AssignClient(System::TObject* AClient);
	virtual bool __fastcall IsCaptionLinked(void);
	virtual bool __fastcall IsEnabledLinked(void);
	virtual bool __fastcall IsHelpContextLinked(void);
	virtual bool __fastcall IsHintLinked(void);
	virtual bool __fastcall IsImageIndexLinked(void);
	virtual bool __fastcall IsVisibleLinked(void);
	virtual bool __fastcall IsOnExecuteLinked(void);
	virtual void __fastcall SetCaption(const AnsiString AValue);
	virtual void __fastcall SetEnabled(bool AValue);
	virtual void __fastcall SetHelpContext(Classes::THelpContext AValue);
	virtual void __fastcall SetHint(const AnsiString AValue);
	virtual void __fastcall SetImageIndex(int AValue);
	virtual void __fastcall SetVisible(bool AValue);
	virtual void __fastcall SetOnExecute(Classes::TNotifyEvent AValue);
public:
	#pragma option push -w-inl
	/* TBasicActionLink.Create */ inline __fastcall virtual TmxButtonActionLink(System::TObject* AClient) : Controls::TControlActionLink(AClient) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TBasicActionLink.Destroy */ inline __fastcall virtual ~TmxButtonActionLink(void) { }
	#pragma option pop
	
};


typedef TMetaClass*TmxButtonActionLinkClass;

class PASCALIMPLEMENTATION TmxButtonImages : public Classes::TPersistent 
{
	typedef Classes::TPersistent inherited;
	
private:
	Imglist::TCustomImageList* FHot;
	Imglist::TChangeLink* FHotChangeLink;
	Imglist::TCustomImageList* FHotSmall;
	Imglist::TChangeLink* FHotSmallChangeLink;
	Imglist::TCustomImageList* FDisabled;
	Imglist::TChangeLink* FDisabledChangeLink;
	Imglist::TCustomImageList* FDisabledSmall;
	Imglist::TChangeLink* FDisabledSmallChangeLink;
	Imglist::TCustomImageList* FNormal;
	Imglist::TChangeLink* FNormalChangeLink;
	Imglist::TCustomImageList* FSmall;
	Imglist::TChangeLink* FSmallChangeLink;
	Classes::TComponent* FOwnerComponent;
	Classes::TNotifyEvent FOnChangeParameter;
	void __fastcall SetImages(int Index, Imglist::TCustomImageList* AValue);
	void __fastcall ImageListChange(System::TObject* Sender);
	
protected:
	DYNAMIC void __fastcall Change(void);
	
public:
	__fastcall virtual TmxButtonImages(Classes::TComponent* AOwner);
	__fastcall virtual ~TmxButtonImages(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	virtual void __fastcall AssignTo(Classes::TPersistent* Destination);
	
__published:
	__property Imglist::TCustomImageList* Hot = {read=FHot, write=SetImages, index=2};
	__property Imglist::TCustomImageList* HotSmall = {read=FHotSmall, write=SetImages, index=4};
	__property Imglist::TCustomImageList* Normal = {read=FNormal, write=SetImages, index=1};
	__property Imglist::TCustomImageList* Small = {read=FSmall, write=SetImages, index=3};
	__property Imglist::TCustomImageList* Disabled = {read=FDisabled, write=SetImages, index=5};
	__property Imglist::TCustomImageList* DisabledSmall = {read=FDisabledSmall, write=SetImages, index=6};
	__property Classes::TNotifyEvent OnChangeParameter = {read=FOnChangeParameter, write=FOnChangeParameter};
};


class DELPHICLASS TmxButtonBackground;
class PASCALIMPLEMENTATION TmxButtonBackground : public TmxBackground 
{
	typedef TmxBackground inherited;
	
public:
	__fastcall virtual TmxButtonBackground(void);
public:
	#pragma option push -w-inl
	/* TmxCustomBackground.Destroy */ inline __fastcall virtual ~TmxButtonBackground(void) { }
	#pragma option pop
	
};


class DELPHICLASS TmxGlyph;
class PASCALIMPLEMENTATION TmxGlyph : public Classes::TPersistent 
{
	typedef Classes::TPersistent inherited;
	
private:
	TmxGlyphPosition FPosition;
	Graphics::TBitmap* FBitmap;
	bool FDrawing;
	bool FTransparent;
	bool FVisible;
	Classes::TNotifyEvent FOnChangeParameter;
	void __fastcall SetTransparent(bool AValue);
	void __fastcall SetVisible(bool AValue);
	void __fastcall SetPosition(TmxGlyphPosition AValue);
	void __fastcall SetBitmap(Graphics::TBitmap* AValue);
	void __fastcall SetOnChangeParameter(Classes::TNotifyEvent AValue);
	
protected:
	virtual void __fastcall Change(void);
	
public:
	__fastcall virtual TmxGlyph(void);
	__fastcall virtual ~TmxGlyph(void);
	void __fastcall DrawGlyph(Graphics::TBitmap* DrawBitmap, const Types::TRect &ARect);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	virtual void __fastcall AssignTo(Classes::TPersistent* Destination);
	
__published:
	__property TmxGlyphPosition Position = {read=FPosition, write=SetPosition, default=3};
	__property Graphics::TBitmap* Bitmap = {read=FBitmap, write=SetBitmap};
	__property bool Transparent = {read=FTransparent, write=SetTransparent, default=1};
	__property bool Visible = {read=FVisible, write=SetVisible, default=1};
	__property Classes::TNotifyEvent OnChangeParameter = {read=FOnChangeParameter, write=SetOnChangeParameter};
};


class DELPHICLASS TmxStatusButton;
class PASCALIMPLEMENTATION TmxStatusButton : public Classes::TPersistent 
{
	typedef Classes::TPersistent inherited;
	
private:
	Graphics::TColor FArrowColor;
	Graphics::TColor FBackground;
	Graphics::TColor FBorderColor;
	bool FTransparent;
	Classes::TNotifyEvent FOnChangeParameter;
	void __fastcall SetTransparent(bool AValue);
	void __fastcall SetColor(int Index, Graphics::TColor AValue);
	Graphics::TColor __fastcall GetColor(int Index);
	
protected:
	DYNAMIC void __fastcall Change(void);
	
public:
	__fastcall virtual TmxStatusButton(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	virtual void __fastcall AssignTo(Classes::TPersistent* Destination);
	
__published:
	__property Graphics::TColor ArrowColor = {read=GetColor, write=SetColor, index=1, nodefault};
	__property Graphics::TColor Background = {read=GetColor, write=SetColor, index=2, nodefault};
	__property Graphics::TColor BorderColor = {read=GetColor, write=SetColor, index=3, nodefault};
	__property bool Transparent = {read=FTransparent, write=SetTransparent, default=0};
	__property Classes::TNotifyEvent OnChangeParameter = {read=FOnChangeParameter, write=FOnChangeParameter};
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TmxStatusButton(void) { }
	#pragma option pop
	
};


class DELPHICLASS TmxXPColors;
class PASCALIMPLEMENTATION TmxXPColors : public Classes::TPersistent 
{
	typedef Classes::TPersistent inherited;
	
private:
	Graphics::TColor FBorderColor;
	Graphics::TColor FBackground;
	Graphics::TColor FPressedBackground;
	Graphics::TColor FShadowColor;
	bool FUseShadow;
	Classes::TNotifyEvent FOnChange;
	void __fastcall SetBorderColor(Graphics::TColor AValue);
	void __fastcall SetShadowColor(Graphics::TColor AValue);
	void __fastcall SetBackground(Graphics::TColor AValue);
	void __fastcall SetPressedBackground(Graphics::TColor AValue);
	void __fastcall SetUseShadow(bool AValue);
	
protected:
	DYNAMIC void __fastcall Change(void);
	
public:
	__fastcall virtual TmxXPColors(void);
	__property Classes::TNotifyEvent OnChange = {read=FOnChange, write=FOnChange};
	void __fastcall SetToDefault(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	virtual void __fastcall AssignTo(Classes::TPersistent* Destination);
	
__published:
	__property Graphics::TColor BorderColor = {read=FBorderColor, write=SetBorderColor, nodefault};
	__property Graphics::TColor Background = {read=FBackground, write=SetBackground, nodefault};
	__property Graphics::TColor PressedBackground = {read=FPressedBackground, write=SetPressedBackground, nodefault};
	__property bool UseShadow = {read=FUseShadow, write=SetUseShadow, nodefault};
	__property Graphics::TColor ShadowColor = {read=FShadowColor, write=SetShadowColor, nodefault};
public:
	#pragma option push -w-inl
	/* TPersistent.Destroy */ inline __fastcall virtual ~TmxXPColors(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TmxBarSettings : public Classes::TPersistent 
{
	typedef Classes::TPersistent inherited;
	
private:
	Classes::TAlignment FAlignment;
	Graphics::TFont* FButtonFont;
	Graphics::TFont* FButtonHighlightFont;
	int FButtonDistance;
	int FPicLabDistance;
	int FButtonSizes[3];
	TmxButtonBackground* FButtonUp;
	TmxButtonBackground* FButtonDown;
	TmxButtonBackground* FButtonFocused;
	TmxButtonBackground* FButtonDisabled;
	TmxButtonStyle FButtonStyle;
	TmxButtonView FButtonView;
	TmxCaptionStyle FCaptionStyle;
	Graphics::TPen* FCaptionPen;
	Graphics::TColor FColor;
	Word FExplorerAddOn;
	Graphics::TFont* FFont;
	int FGlyphTop;
	int FHeight;
	Graphics::TPen* FHeaderPen;
	Graphics::TFont* FHighlightFont;
	bool FKeySupport;
	TmxGlyphLayout FLayout;
	TmxStatusButton* FStatusButton;
	TmxXPColors* FXPColors;
	Classes::TNotifyEvent FOnChangeParameter;
	void __fastcall SetColor(Graphics::TColor AValue);
	void __fastcall SetAlignment(Classes::TAlignment AValue);
	void __fastcall SetLayout(TmxGlyphLayout AValue);
	void __fastcall SetHeight(int AValue);
	void __fastcall SetFont(Graphics::TFont* AValue);
	void __fastcall SetHighlightFont(Graphics::TFont* AValue);
	void __fastcall SetButtonFont(Graphics::TFont* AValue);
	void __fastcall SetButtonHighlightFont(Graphics::TFont* AValue);
	void __fastcall SetCaptionPen(Graphics::TPen* AValue);
	void __fastcall SetHeaderPen(Graphics::TPen* AValue);
	void __fastcall SetExplorerAddOn(Word AValue);
	void __fastcall SetCaptionStyle(TmxCaptionStyle AValue);
	void __fastcall PropertyChanged(System::TObject* Sender);
	TmxButtonBackground* __fastcall GetBackground(int Index);
	void __fastcall SetBackground(int Index, TmxButtonBackground* AValue);
	void __fastcall SetStatusButton(TmxStatusButton* AValue);
	void __fastcall SetButtonSize(int Index, int AValue);
	int __fastcall GetButtonSize(int Index);
	void __fastcall SetButtonDistance(int AValue);
	void __fastcall SetButtonStyle(TmxButtonStyle AValue);
	void __fastcall SetButtonView(TmxButtonView AValue);
	void __fastcall SetPicLabDistance(int AValue);
	void __fastcall SetGlyphTop(int AValue);
	void __fastcall SetKeySupport(bool AValue);
	
protected:
	DYNAMIC void __fastcall Change(void);
	
public:
	__fastcall virtual TmxBarSettings(void);
	__fastcall virtual ~TmxBarSettings(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	virtual void __fastcall AssignTo(Classes::TPersistent* Destination);
	
__published:
	__property Classes::TAlignment Alignment = {read=FAlignment, write=SetAlignment, default=2};
	__property TmxButtonBackground* ButtonUp = {read=GetBackground, write=SetBackground, index=1};
	__property TmxButtonBackground* ButtonDown = {read=GetBackground, write=SetBackground, index=2};
	__property TmxButtonBackground* ButtonFocused = {read=GetBackground, write=SetBackground, index=3};
	__property TmxButtonBackground* ButtonDisabled = {read=GetBackground, write=SetBackground, index=4};
	__property Graphics::TFont* ButtonFont = {read=FButtonFont, write=SetButtonFont};
	__property Graphics::TFont* ButtonHighlightFont = {read=FButtonHighlightFont, write=SetButtonHighlightFont};
	__property TmxButtonStyle ButtonStyle = {read=FButtonStyle, write=SetButtonStyle, nodefault};
	__property TmxButtonView ButtonView = {read=FButtonView, write=SetButtonView, nodefault};
	__property TmxCaptionStyle CaptionStyle = {read=FCaptionStyle, write=SetCaptionStyle, default=0};
	__property Graphics::TPen* CaptionPen = {read=FCaptionPen, write=SetCaptionPen};
	__property Graphics::TColor Color = {read=FColor, write=SetColor, default=-2147483633};
	__property int Distance = {read=FButtonDistance, write=SetButtonDistance, default=2};
	__property Word ExplorerAddOn = {read=FExplorerAddOn, write=SetExplorerAddOn, nodefault};
	__property Graphics::TFont* Font = {read=FFont, write=SetFont};
	__property int GlyphTop = {read=FGlyphTop, write=SetGlyphTop, default=10};
	__property Graphics::TPen* HeaderPen = {read=FHeaderPen, write=SetHeaderPen};
	__property Graphics::TFont* HighlightFont = {read=FHighlightFont, write=SetHighlightFont};
	__property int Height = {read=FHeight, write=SetHeight, nodefault};
	__property bool KeySupport = {read=FKeySupport, write=SetKeySupport, default=1};
	__property TmxGlyphLayout Layout = {read=FLayout, write=SetLayout, default=0};
	__property int LargeWidth = {read=GetButtonSize, write=SetButtonSize, index=1, nodefault};
	__property int LargeHeight = {read=GetButtonSize, write=SetButtonSize, index=2, nodefault};
	__property int PicLabDistance = {read=FPicLabDistance, write=SetPicLabDistance, nodefault};
	__property TmxStatusButton* StatusButton = {read=FStatusButton, write=SetStatusButton};
	__property int SmallHeight = {read=GetButtonSize, write=SetButtonSize, index=3, nodefault};
	__property TmxXPColors* XPColors = {read=FXPColors, write=FXPColors};
	__property Classes::TNotifyEvent OnChangeParameter = {read=FOnChangeParameter, write=FOnChangeParameter};
};


class DELPHICLASS TmxButtons;
class PASCALIMPLEMENTATION TmxButtons : public Classes::TCollection 
{
	typedef Classes::TCollection inherited;
	
public:
	TmxButton* operator[](int Index) { return Buttons[Index]; }
	
private:
	TmxHeader* FOwner;
	TmxOutlookBarPro* FOutlookBarPro;
	TmxButton* __fastcall GetButtonItem(int Index);
	void __fastcall SetButtonItem(int Index, TmxButton* AValue);
	
protected:
	DYNAMIC int __fastcall GetAttrCount(void);
	DYNAMIC AnsiString __fastcall GetAttr(int Index);
	DYNAMIC AnsiString __fastcall GetItemAttr(int Index, int ItemIndex);
	virtual void __fastcall SetItemName(Classes::TCollectionItem* Item);
	virtual void __fastcall Update(Classes::TCollectionItem* Item);
	DYNAMIC Classes::TPersistent* __fastcall GetOwner(void);
	
public:
	__fastcall TmxButtons(TmxOutlookBarPro* AOutlookBarPro, TmxHeader* AHeader, TMetaClass* ItemClass);
	HIDESBASE TmxButton* __fastcall Add(void);
	__property TmxOutlookBarPro* OutlookBarPro = {read=FOutlookBarPro};
	__property TmxHeader* Header = {read=FOwner};
	__property TmxButton* Buttons[int Index] = {read=GetButtonItem, write=SetButtonItem/*, default*/};
public:
	#pragma option push -w-inl
	/* TCollection.Destroy */ inline __fastcall virtual ~TmxButtons(void) { }
	#pragma option pop
	
};


class PASCALIMPLEMENTATION TmxHeader : public Classes::TCollectionItem 
{
	typedef Classes::TCollectionItem inherited;
	
private:
	int FFirstVisibleButton;
	int FLastVisibleButton;
	Word FFirstButtonTop;
	TmxButtons* FButtons;
	TmxBackground* FBackground;
	TmxGlyph* FGlyph;
	Classes::TBiDiMode FBiDiMode;
	TmxButtonImages* FButtonImages;
	#pragma pack(push, 1)
	Types::TRect FButtonRect;
	#pragma pack(pop)
	
	#pragma pack(push, 1)
	Types::TRect FBodyRect;
	#pragma pack(pop)
	
	AnsiString FCaption;
	void *FData;
	bool FEnabled;
	TmxHeaderOptions FHeaderOptions;
	TmxHeaderState FHeaderState;
	Imglist::TImageIndex FImageIndex;
	int FIndex;
	Word FMargin;
	AnsiString FName;
	Menus::TPopupMenu* FPopupMenu;
	Word FSpacing;
	TmxButtonState FState;
	#pragma pack(push, 1)
	Types::TRect FGradientRect;
	#pragma pack(pop)
	
	#pragma pack(push, 1)
	Types::TRect FTextRect;
	#pragma pack(pop)
	
	int FTag;
	bool FTransparent;
	Graphics::TBitmap* FOriginalImage;
	TmxBarSettings* FSettings;
	bool FVisible;
	TmxOutlookBarPro* FParentBar;
	bool FAllowSelected;
	int FSelectedIndex;
	Classes::TNotifyEvent FOnChange;
	Classes::TNotifyEvent FOnChangeParameter;
	TmxEventDrawStatusButton FOnDrawStatusButton;
	TmxEventDrawHeader FOnDrawHeaderButton;
	TmxEventDrawHeader FOnDrawHeaderBody;
	TmxEventDrawHeader FOnAfterDrawHeaderButton;
	TmxEventDrawHeader FOnAfterDrawHeaderBody;
	TmxEventCheckScroll FOnCheckScroll;
	void __fastcall SetEnabled(bool AValue);
	void __fastcall SetCaption(AnsiString AValue);
	int __fastcall GetHeaderIndex(void);
	void __fastcall SetHeaderIndex(int AValue);
	void __fastcall SetChangeParameter(Classes::TNotifyEvent AValue);
	void __fastcall SetVisible(bool AValue);
	void __fastcall SetTransparent(bool AValue);
	void __fastcall SetHeaderOptions(TmxHeaderOptions AValue);
	void __fastcall SetImageIndex(Imglist::TImageIndex AValue);
	void __fastcall SetMargin(Word AValue);
	void __fastcall SetSpacing(Word AValue);
	virtual void __fastcall SetBiDiMode(Classes::TBiDiMode AValue);
	DYNAMIC bool __fastcall UseRightToLeftAlignment(void);
	bool __fastcall UseRightToLeftReading(void);
	int __fastcall DrawTextBiDiModeFlagsReadingOnly(void);
	void __fastcall SetHeaderImage(void);
	Imglist::TCustomImageList* __fastcall GetHeaderImageList(void);
	void __fastcall SetData(void * AValue);
	Types::TRect __fastcall GetBodyRect();
	void __fastcall ChangeParameter(void);
	void __fastcall SetHeaderState(TmxHeaderState AValue);
	TmxOutlookBarPro* __fastcall GetParentBar(void);
	bool __fastcall GetEnabled(void);
	bool __fastcall GetOpened(void);
	void __fastcall SetOpened(bool AValue);
	void __fastcall SetButtons(TmxButtons* AValue);
	TmxButtons* __fastcall GetButtons(void);
	TmxButton* __fastcall GetButton(int Index);
	int __fastcall GetButtonCount(void);
	int __fastcall GetVisibleButtonCount(void);
	int __fastcall GetEnabledButtonCount(void);
	void __fastcall SetFirstButtonTop(Word AValue);
	void __fastcall SetAllowSelected(bool AValue);
	void __fastcall SetSelectedIndex(int AValue);
	void __fastcall DoButtonScrollUp(void);
	void __fastcall DoButtonScrollDown(void);
	bool __fastcall IsUpButtonNeed(void);
	bool __fastcall IsDownButtonNeed(void);
	TmxButton* __fastcall GetFirstVisibleButton(void);
	TmxButton* __fastcall GetLastVisibleButton(void);
	bool __fastcall HasAlertedButton(void);
	void __fastcall SetState(TmxButtonState AState);
	void __fastcall SetRadioButton(TmxButton* AButton);
	
protected:
	virtual AnsiString __fastcall GetDisplayName();
	virtual void __fastcall SetDisplayName(const AnsiString AValue);
	DYNAMIC void __fastcall Change(void);
	int __fastcall DrawTextBiDiModeFlags(int Flags);
	TmxBarSettings* __fastcall GetSettings(void);
	int __fastcall GetHeight(void);
	int __fastcall GetExplorerAddon(void);
	virtual void __fastcall CalcHeaderLayout(Graphics::TCanvas* Canvas, const Types::TRect &Client, const Types::TPoint &Offset, const AnsiString Caption, Classes::TAlignment Alignment, TmxGlyphLayout Layout, Word Margin, Word Spacing, Types::TPoint &GlyphPos, Types::TRect &TextBounds, Types::TRect &StatusRect, int BiDiFlags);
	virtual void __fastcall DrawHeaderGlyph(Graphics::TCanvas* Canvas, const Types::TPoint &GlyphPos, TmxButtonState State, bool Transparent);
	virtual void __fastcall DrawHeaderText(Graphics::TCanvas* Canvas, const AnsiString Caption, const Types::TRect &TextBounds, TmxButtonState State, int BiDiFlags);
	virtual Types::TRect __fastcall DrawHeaderFace(Graphics::TCanvas* Canvas, const Types::TRect &Client, const Types::TPoint &Offset, const AnsiString Caption, Classes::TAlignment Alignment, TmxGlyphLayout Layout, Word Margin, Word Spacing, TmxButtonState State, bool Transparent, int BiDiFlags);
	void __fastcall DrawStatusButton(Graphics::TCanvas* Canvas, const Types::TRect &Client);
	virtual void __fastcall DrawHeaderButtons(Graphics::TBitmap* DrawBitmap, const Types::TRect &ARect);
	virtual void __fastcall DoAfterDrawHeaderBody(Graphics::TCanvas* ACanvas, const Types::TRect &ARect);
	virtual void __fastcall DoAfterDrawHeaderButton(Graphics::TCanvas* ACanvas, const Types::TRect &ARect);
	virtual int __fastcall CalculateBodyHeight(const Types::TRect &ARect);
	
public:
	__property bool IsEnabled = {read=GetEnabled, nodefault};
	__property Types::TRect ButtonRect = {read=FButtonRect};
	__property Types::TRect BodyRect = {read=GetBodyRect};
	__property void * Data = {read=FData, write=SetData};
	__property TmxOutlookBarPro* ParentBar = {read=GetParentBar};
	__property int ButtonCount = {read=GetButtonCount, nodefault};
	__property int VisibleHeaderCount = {read=GetVisibleButtonCount, nodefault};
	__property int EnabledHeaderCount = {read=GetEnabledButtonCount, nodefault};
	int __fastcall CreateButton(void);
	TmxButton* __fastcall AddButton(void);
	void __fastcall RemoveButton(TmxButton* AButton);
	void __fastcall DeleteButton(int AButtonIndex);
	void __fastcall ClearButtons(void);
	__property TmxButton* Button[int Index] = {read=GetButton};
	TmxButton* __fastcall ButtonByIndex(int Index);
	TmxButton* __fastcall ButtonByName(AnsiString Name);
	int __fastcall ButtonIndexByName(AnsiString Name);
	__fastcall virtual TmxHeader(Classes::TCollection* ACollection);
	__fastcall virtual ~TmxHeader(void);
	virtual void __fastcall BeginUpdate(void);
	virtual void __fastcall EndUpdate(void);
	virtual void __fastcall Assign(Classes::TPersistent* Source);
	virtual void __fastcall AssignTo(Classes::TPersistent* Destination);
	void __fastcall DrawHeaderButton(Graphics::TBitmap* DrawBitmap, Types::TRect &ARect, int ActiveIndex);
	void __fastcall DrawHeaderBody(Graphics::TBitmap* DrawBitmap, Types::TRect &ARect, int ActiveIndex, int ScrollOffset);
	void __fastcall RenameButton(TmxButton* AButton);
	void __fastcall RenameButtonByIndex(int AButtonIndex);
	
__published:
	__property bool AllowSelected = {read=FAllowSelected, write=SetAllowSelected, default=0};
	__property TmxBackground* Background = {read=FBackground, write=FBackground};
	__property TmxGlyph* Glyph = {read=FGlyph, write=FGlyph};
	__property TmxButtonImages* Images = {read=FButtonImages, write=FButtonImages};
	__property TmxButtons* Buttons = {read=GetButtons, write=SetButtons};
	__property Classes::TBiDiMode BiDiMode = {read=FBiDiMode, write=SetBiDiMode, nodefault};
	__property AnsiString Caption = {read=FCaption, write=SetCaption};
	__property bool Enabled = {read=FEnabled, write=SetEnabled, default=1};
	__property Word FirstButtonTop = {read=FFirstButtonTop, write=SetFirstButtonTop, nodefault};
	__property int HeaderIndex = {read=GetHeaderIndex, write=SetHeaderIndex, default=-1};
	__property TmxHeaderState HeaderState = {read=FHeaderState, write=SetHeaderState, default=0};
	__property TmxBarSettings* Settings = {read=FSettings, write=FSettings};
	__property Imglist::TImageIndex ImageIndex = {read=FImageIndex, write=SetImageIndex, default=-1};
	__property Word Margin = {read=FMargin, write=SetMargin, default=4};
	__property AnsiString Name = {read=GetDisplayName, write=SetDisplayName};
	__property TmxHeaderOptions Options = {read=FHeaderOptions, write=SetHeaderOptions, nodefault};
	__property bool Opened = {read=GetOpened, write=SetOpened, nodefault};
	__property Menus::TPopupMenu* PopupMenu = {read=FPopupMenu, write=FPopupMenu};
	__property int Tag = {read=FTag, write=FTag, default=0};
	__property bool Transparent = {read=FTransparent, write=SetTransparent, default=0};
	__property int SelectedIndex = {read=FSelectedIndex, write=SetSelectedIndex, default=-1};
	__property Word Spacing = {read=FSpacing, write=SetSpacing, default=2};
	__property bool Visible = {read=FVisible, write=SetVisible, default=1};
	__property Classes::TNotifyEvent OnChange = {read=FOnChange, write=FOnChange};
	__property Classes::TNotifyEvent OnChangeParameter = {read=FOnChangeParameter, write=SetChangeParameter};
	__property TmxEventCheckScroll OnCheckScroll = {read=FOnCheckScroll, write=FOnCheckScroll};
	__property TmxEventDrawHeader OnDrawHeaderButton = {read=FOnDrawHeaderButton, write=FOnDrawHeaderButton};
	__property TmxEventDrawStatusButton OnDrawStatusButton = {read=FOnDrawStatusButton, write=FOnDrawStatusButton};
	__property TmxEventDrawHeader OnDrawHeaderBody = {read=FOnDrawHeaderBody, write=FOnDrawHeaderBody};
	__property TmxEventDrawHeader OnAfterDrawHeaderButton = {read=FOnAfterDrawHeaderButton, write=FOnAfterDrawHeaderButton};
	__property TmxEventDrawHeader OnAfterDrawHeaderBody = {read=FOnAfterDrawHeaderBody, write=FOnAfterDrawHeaderBody};
};


//-- var, const, procedure ---------------------------------------------------
static const Word mxOutlookVersion = 0x20d;
#define SubRelease ""
static const Shortint DefaultHeaderHeight = 0x16;
static const Shortint DefaultExplorerAddon = 0xc;
#define CFSTR_MXOUTLOOKBARPRO "mxOutlookBarPro Resource"
#define CFSTR_MXOUTLOOKBARPROREFERENCE "mxOutlookBarPro Reference"
static const Shortint mxStreamData = 0x1;
static const Shortint ButtonStreamData = 0x2;
static const Shortint CloseTimer = 0x1;
static const Shortint ScrollTimer = 0x2;
static const Shortint ChangeTimer = 0x3;
static const Shortint ButtonTimer = 0x4;
static const Shortint AlertTimer = 0x5;
extern PACKAGE System::ResourceString _sDuplicatedHeaderName;
#define Mxoutlookbarpro_sDuplicatedHeaderName System::LoadResourceString(&Mxoutlookbarpro::_sDuplicatedHeaderName)
extern PACKAGE System::ResourceString _sDuplicatedButtonName;
#define Mxoutlookbarpro_sDuplicatedButtonName System::LoadResourceString(&Mxoutlookbarpro::_sDuplicatedButtonName)
extern PACKAGE System::ResourceString _SEtcInvalidItem;
#define Mxoutlookbarpro_SEtcInvalidItem System::LoadResourceString(&Mxoutlookbarpro::_SEtcInvalidItem)
extern PACKAGE Word CF_OUTLOOKBARPRO;
extern PACKAGE Word CF_OUTLOOKBARPROREFERENCE;
extern PACKAGE tagFORMATETC StandardOLEFormat;

}	/* namespace Mxoutlookbarpro */
using namespace Mxoutlookbarpro;
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// mxOutlookBarPro
