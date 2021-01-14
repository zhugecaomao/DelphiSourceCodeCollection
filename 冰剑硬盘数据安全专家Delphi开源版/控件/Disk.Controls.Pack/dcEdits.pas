{*******************************************************************************

  Disk Controls pack v3.5
  FILE: dcEdits.pas - dcFileEdit and dcFolderEdit components.

  Copyright (c) 1999-2002 UtilMind Solutions
  All rights reserved.
  E-Mail: info@appcontrols.com, info@utilmind.com
  WWW: http://www.appcontrols.com, http://www.utilmind.com

  The entire contents of this file is protected by International Copyright
Laws. Unauthorized reproduction, reverse-engineering, and distribution of all
or any portion of the code contained in this file is strictly prohibited and
may result in severe civil and criminal penalties and will be prosecuted to
the maximum extent possible under the law.

*******************************************************************************}
{$I umDefines.inc}

unit dcEdits;

interface

uses
  Windows, Messages, SysUtils, StdCtrls, Classes, Controls,
  Buttons, Graphics, Forms, Dialogs {$IFDEF D3}, ExtDlgs, dcBrowseDialog {$ENDIF};

type
  TdcCustomEdit = class;

  { TdcEditButton }
  TdcEditButton = class(TPersistent)
  private
    { for internal use }
    Edit: TdcCustomEdit;
    Btn: TSpeedButton;

    function  GetCursor: TCursor;
    procedure SetCursor(Value: TCursor);
    {$IFDEF D3}
    function  GetFlat: Boolean;
    procedure SetFlat(Value: Boolean);
    {$ENDIF}
    function  GetGlyph: TBitmap;
    procedure SetGlyph(Value: TBitmap);
    function  GetNumGlyphs: TNumGlyphs;
    procedure SetNumGlyphs(Value: TNumGlyphs);
    function  GetHint: String;
    procedure SetHint(Value: String);
    function  GetWidth: Word;
    procedure SetWidth(Value: Word);
    function  GetVisible: Boolean;
    procedure SetVisible(Value: Boolean);
  public
    constructor Create(AEdit: TdcCustomEdit; ABtn: TSpeedButton);
  published
    property Cursor: TCursor read GetCursor write SetCursor;
    {$IFDEF D3}
    property Flat: Boolean read GetFlat write SetFlat;
    {$ENDIF}
    property Glyph: TBitmap read GetGlyph write SetGlyph;
    property NumGlyphs: TNumGlyphs read GetNumGlyphs write SetNumGlyphs;
    property Hint: String read GetHint write SetHint;
    property Width: Word read GetWidth write SetWidth default 20;
    property Visible: Boolean read GetVisible write SetVisible default False;
  end;

  TdcCustomEdit = class(TEdit)
  private
    FAbout: String;

    FAlignment: TAlignment;
    FAutoSelect: Boolean;
    FButton: TdcEditButton;
    FColor, FColorDisabled: TColor;
    FCursorBorder: TCursor;

    FOnButtonClick: TNotifyEvent;
    FOnMouseEnter, FOnMouseLeave: TNotifyEvent;

    { for internal use }
    FBtn: TSpeedButton;
    FBtnControl: TWinControl;
    FValidChars: String;
    FValidateChars: Boolean;

    procedure UpdateBtnBounds;
    procedure UpdateEditRect;
    procedure UpdateBkColor;

    procedure SetAlignment(Value: TAlignment);
    procedure SetColor(Value: TColor);
    procedure SetColorDisabled(Value: TColor);

    procedure WMChar(var Message: TWMChar); message WM_CHAR;
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    procedure CMEnter(var Message: TCMEnter); message CM_ENTER;
    procedure CMExit(var Message: TCMExit); message CM_EXIT;
    procedure CMCtl3DChanged(var Message: TMessage); message CM_Ctl3DChanged;
    procedure CMEnableChanged(var Message: TMessage); message CM_ENABLEDCHANGED;
    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
  protected
    procedure WndProc(var Message: TMessage); override;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWnd; override;
    procedure KeyPress(var Key: Char); override;

    procedure ButtonClick(Sender: TObject); virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    property About: String read FAbout write FAbout stored False;
    property Alignment: TAlignment read FAlignment write SetAlignment default taLeftJustify;
    property AutoSelect: Boolean read FAutoSelect write FAutoSelect default True;
    property Button: TdcEditButton read FButton write FButton;
    property Color: TColor read FColor write SetColor;
    property ColorDisabled: TColor read FColorDisabled write SetColorDisabled default clBtnFace;
    property CursorBorder: TCursor read FCursorBorder write FCursorBorder;
    property ValidChars: String read FValidChars write FValidChars;
    property ValidateChars: Boolean read FValidateChars write FValidateChars default True;

    { not for publishing }
    property EditButton: TSpeedButton read FBtn;

    property OnButtonClick: TNotifyEvent read FOnButtonClick write FOnButtonClick;
    property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
    property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
  end;

  { TdcFileEdit }
  TdcFileEditDlgTypes = (dtOpen, dtSave {$IFDEF D3}, dtOpenPicture, dtSavePicture {$ENDIF});
  TdcFileEdit = class(TdcCustomEdit)
  private
    FDlgType: TdcFileEditDlgTypes;
    FDlgDefaultExt, FDlgFilter, FDlgTitle: String;
    FDlgOptions: TOpenOptions;

    FOnDlgOk, FOnDlgCancel: TNotifyEvent;

    FOpenDialog: TOpenDialog;
    FSaveDialog: TSaveDialog;
{$IFDEF D3}
    FOpenPictureDialog: TOpenPictureDialog;
    FSavePictureDialog: TSavePictureDialog;
{$ENDIF}
  protected
    procedure ButtonClick(Sender: TObject); override;
  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;

    property ODialog: TOpenDialog read FOpenDialog; 
  published
    property DlgType: TdcFileEditDlgTypes read FDlgType write FDlgType;
    property DlgDefaultExt: String read FDlgDefaultExt write FDlgDefaultExt;
    property DlgFilter: String read FDlgFilter write FDlgFilter;
    property DlgTitle: String read FDlgTitle write FDlgTitle;
    property DlgOptions: TOpenOptions read FDlgOptions write FDlgOptions;

    property OnDlgOk: TNotifyEvent read FOnDlgOk write FOnDlgOk;
    property OnDlgCancel: TNotifyEvent read FOnDlgCancel write FOnDlgCancel;

    property About;
    property Align;
    property Alignment;
    property AutoSelect;
    property Button;
    property Color;
    property ColorDisabled;
    property CursorBorder;
    property OnButtonClick;
    property OnMouseEnter;
    property OnMouseLeave;
  end;

{$IFDEF D3}
  { TdcFolderEdit }
  TdcFolderEdit = class(TdcCustomEdit)
  private
    FBrowseDialog: TdcBrowseDialog;
    FDlgOptions: TdcBrowseDialogOptions;
    FDlgSpecialLocation: TdcBrowseDialogSpecialLocation;
    FDlgStatusText, FDlgTitle: String;
    FNewFolder: TdcNewFolderBtn;

    FOnDlgOk, FOnDlgCancel: TNotifyEvent;
  protected
    procedure ButtonClick(Sender: TObject); override;
  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;
  published
    property DlgOptions: TdcBrowseDialogOptions read FDlgOptions write FDlgOptions;
    property DlgSpecialLocation: TdcBrowseDialogSpecialLocation read FDlgSpecialLocation write FDlgSpecialLocation;
    property DlgStatusText: String read FDlgStatusText write FDlgStatusText;
    property DlgTitle: String read FDlgTitle write FDlgTitle;
    property NewFolder: TdcNewFolderBtn read FNewFolder write FNewFolder;

    property OnDlgOk: TNotifyEvent read FOnDlgOk write FOnDlgOk;
    property OnDlgCancel: TNotifyEvent read FOnDlgCancel write FOnDlgCancel;

    property About;
    property Align;
    property Alignment;
    property AutoSelect;
    property Button;
    property Color;
    property ColorDisabled;
    property CursorBorder;
    property OnButtonClick;
    property OnMouseEnter;
    property OnMouseLeave;
  end;
{$ENDIF}  

implementation

{$R *.res}

uses dcUtils;

{ TdcEditButton }
constructor TdcEditButton.Create(aEdit: TdcCustomEdit; aBtn: TSpeedButton);
begin
  inherited Create;
  Edit := aEdit;
  Btn := aBtn;
end;

function  TdcEditButton.GetCursor: TCursor;
begin
  Result := Btn.Cursor;
end;

procedure TdcEditButton.SetCursor(Value: TCursor);
begin
  Btn.Cursor := Value;
end;

{$IFDEF D3}
function  TdcEditButton.GetFlat: Boolean;
begin
  Result := Btn.Flat;
end;

procedure TdcEditButton.SetFlat(Value: Boolean);
begin
  Btn.Flat := Value;
end;
{$ENDIF}

function  TdcEditButton.GetGlyph: TBitmap;
begin
  Result := Btn.Glyph;
end;

procedure TdcEditButton.SetGlyph(Value: TBitmap);
begin
  Btn.Glyph := Value;
end;

function  TdcEditButton.GetNumGlyphs: TNumGlyphs;
begin
  Result := Btn.NumGlyphs;
end;

procedure TdcEditButton.SetNumGlyphs(Value: TNumGlyphs);
begin
  Btn.NumGlyphs := Value;
end;

function  TdcEditButton.GetHint: String;
begin
  Result := Btn.Hint;
end;

procedure TdcEditButton.SetHint(Value: String);
begin
  Btn.Hint := Value;
  Btn.ShowHint := Value <> '';
end;

function  TdcEditButton.GetWidth: Word;
begin
  Result := Btn.Width;
end;

procedure TdcEditButton.SetWidth(Value: Word);
begin
  if Btn.Width <> Value then
   with Edit do
    begin
     FBtnControl.Visible := Value > 1;
     Btn.Width := Value;
     if HandleAllocated then RecreateWnd;
   end;
end;

function  TdcEditButton.GetVisible: Boolean;
begin
  Result := Edit.FBtnControl.Visible;
end;

procedure TdcEditButton.SetVisible(Value: Boolean);
begin
  with Edit do
   begin
    FBtnControl.Visible := Value;
    UpdateBtnBounds;
    Invalidate;
   end;
end;


{ TdcCustomEdit }
constructor TdcCustomEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FBtnControl := TWinControl.Create(Self);
  with FBtnControl do
    ControlStyle := ControlStyle + [csReplicatable];
  FBtnControl.Height := 17;
  FBtnControl.Parent := Self;

  FBtn := TSpeedButton.Create(Self);
  FButton := TdcEditButton.Create(Self, FBtn);
  FBtn.Parent := FBtnControl;
  FBtn.OnClick := ButtonClick;
  FBtn.SetBounds(0, 0, 20, FBtnControl.Height);
  try
    FBtn.Glyph.Handle := LoadBitmap(hInstance, 'DC_ELLIPSIS');
  except
  end;

  FButton.Visible := False;
  FBtnControl.Width := 0;

  AutoSize := False;
  Height := 21;
  FAlignment := taLeftJustify;
  FAutoSelect := True;
  FColor := clWindow;
  FColorDisabled := clBtnFace;
end;

destructor TdcCustomEdit.Destroy;
begin
  FButton.Free;
  FBtn.Free;
  FBtnControl.Free;
  inherited Destroy;
end;

procedure TdcCustomEdit.CreateParams(var Params: TCreateParams);
const
  Alignments: Array[TAlignment] of DWord = (ES_LEFT, ES_RIGHT, ES_CENTER);
begin
  inherited CreateParams(Params);

  Params.Style := Params.Style or ES_MULTILINE or WS_CLIPCHILDREN
    or Alignments[FAlignment];
end;

procedure TdcCustomEdit.CreateWnd;
begin
  inherited CreateWnd;
  UpdateEditRect;
end;

procedure TdcCustomEdit.KeyPress(var Key: Char);
begin
  if (Key = Char(VK_RETURN)) or (Key = Char(VK_ESCAPE)) then
   begin
    { must catch and remove this, since is actually multi-line }
    GetParentForm(Self).Perform(CM_DIALOGKEY, Byte(Key), 0);
    if Key = Char(VK_RETURN) then
     begin
      inherited KeyPress(Key);
      Key := #0;
      Exit;
     end;
   end;
  inherited KeyPress(Key);
end;

procedure TdcCustomEdit.UpdateEditRect;
var
  R: TRect;
  BtnWidth: Integer;
begin
 if not HandleAllocated then Exit;

 if FButton.Visible then
    BtnWidth := FBtnControl.Width
  else
    BtnWidth := 0;
  R := Rect(0, 0, ClientWidth - BtnWidth - 2, ClientHeight + 1);
  SendMessage(Handle, EM_SETRECTNP, 0, LongInt(@R));
end;

procedure TdcCustomEdit.UpdateBtnBounds;
var
  BtnRect: TRect;
  BtnWidth: Integer;
begin
  if NewStyleControls then
   begin
    if Ctl3D and (BorderStyle = bsSingle) then
      BtnRect := Bounds(Width - FBtn.Width - 4, 0,
        FBtn.Width, Height - 4)
    else
     begin
      if BorderStyle = bsSingle then
        BtnRect := Bounds(Width - FBtn.Width - 2, 2,
          FBtn.Width, Height - 4)
      else
        BtnRect := Bounds(Width - FBtn.Width, 0,
          FBtn.Width, Height);
     end;
   end
  else
    BtnRect := Bounds(Width - FBtn.Width, 0, FBtn.Width, Height);

  with BtnRect do
   begin
    if FButton.Visible then
      BtnWidth := Right - Left
    else
      BtnWidth := 0;  
    FBtnControl.SetBounds(Left, Top, BtnWidth, Bottom - Top);
   end; 
  FBtn.Height := FBtnControl.Height;

  UpdateEditRect;
end;

procedure TdcCustomEdit.UpdateBkColor;
begin
  if Enabled then inherited Color := FColor
  else inherited Color := FColorDisabled;
end;

procedure TdcCustomEdit.WndProc(var Message: TMessage);
begin
  if (Message.Msg = WM_SETCURSOR) and
     (TWMSetCursor(Message).HitTest = htBorder) then
   begin
    SetCursor(Screen.Cursors[FCursorBorder]);
    Exit;
   end;

  inherited;
end;

procedure TdcCustomEdit.ButtonClick(Sender: TObject);
begin
  if Assigned(FOnButtonClick) then
    FOnButtonClick(Self);
end;

procedure TdcCustomEdit.SetAlignment(Value: TAlignment);
begin
  if FAlignment <> Value then
   begin
    FAlignment := Value;
    RecreateWnd;
   end;
end;

procedure TdcCustomEdit.SetColor(Value: TColor);
begin
  if FColor <> Value then
   begin
    FColor := Value;
    UpdateBkColor;
   end;
end;

procedure TdcCustomEdit.SetColorDisabled(Value: TColor);
begin
  if FColorDisabled <> Value then
   begin
    FColorDisabled := Value;
    UpdateBkColor;
   end;
end;

procedure TdcCustomEdit.WMChar(var Message: TWMChar);
var
  I: Integer;
begin
  if FValidateChars and (Char(Message.CharCode) <> #8) then
   begin
    I := Length(FValidChars);
    if I <> 0 then
     for I := 1 to I do
      if FValidChars[I] = Char(Message.CharCode) then inherited
   end
  else inherited;
end;

procedure TdcCustomEdit.WMSize(var Message: TWMSize);

  function GetTextHeight: Integer;
  var
    DC: HDC;
    SaveFont: HFont;
    SysMetrics, Metrics: TTextMetric;
  begin
    DC := GetDC(0);
    try
      GetTextMetrics(DC, SysMetrics);
       SaveFont := SelectObject(DC, Font.Handle);
      GetTextMetrics(DC, Metrics);
      SelectObject(DC, SaveFont);
    finally
      ReleaseDC(0, DC);
    end;
    if SysMetrics.tmHeight < Metrics.tmHeight then
      Result := SysMetrics.tmHeight
    else
      Result := Metrics.tmHeight;
  end;

var
  MinHeight: Integer;
begin
  inherited;
  if not (csLoading in ComponentState) then
   begin
    MinHeight := GetTextHeight + GetSystemMetrics(SM_CYBORDER) * 4 + 1;
    if Height < MinHeight then
     begin
      Height := MinHeight;
      Exit;
     end;
   end;  

  UpdateBtnBounds;
end;

procedure TdcCustomEdit.CMCtl3DChanged(var Message: TMessage);
begin
  inherited;
  UpdateBtnBounds;
end;

procedure TdcCustomEdit.CMEnter(var Message: TCMEnter);
begin
  if FAutoSelect and not (csLButtonDown in ControlState) then SelectAll
  else Invalidate;
  inherited;
end;

procedure TdcCustomEdit.CMExit(var Message: TCMExit);
begin
  inherited;
  Invalidate;
end;

procedure TdcCustomEdit.CMEnableChanged(var Message: TMessage);
begin
  inherited;
  FBtn.Enabled := Enabled;
  UpdateBkColor;    
end;

procedure TdcCustomEdit.CMMouseEnter(var Message: TMessage);
begin
  inherited;
  if Assigned(FOnMouseEnter) then FOnMouseEnter(Self);
end;

procedure TdcCustomEdit.CMMouseLeave(var Message: TMessage);
begin
  inherited;
  if Assigned(FOnMouseLeave) then FOnMouseLeave(Self);
end;


{ TdcFileEdit }
constructor TdcFileEdit.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);
  FOpenDialog := TOpenDialog.Create(Self);
  FSaveDialog := TSaveDialog.Create(Self);
{$IFDEF D3}
  FOpenPictureDialog := TOpenPictureDialog.Create(Self);
  FSavePictureDialog := TSavePictureDialog.Create(Self);
{$ENDIF}

  with FOpenDialog do
   begin
    FDlgFilter := 'All files (*.*)|*.*';
    FDlgOptions := Options;
   end;

  try
    FBtn.Glyph.Handle := LoadBitmap(hInstance, 'DC_FILEOPEN');
  except
  end;
  FButton.Visible := True;
end;

destructor TdcFileEdit.Destroy;
begin
{$IFDEF D3}
  FSavePictureDialog.Free;
  FOpenPictureDialog.Free;
{$ENDIF}
  FSaveDialog.Free;
  FOpenDialog.Free;
  inherited Destroy;
end;

procedure TdcFileEdit.ButtonClick(Sender: TObject);
var
  Res: Boolean;
begin
  inherited ButtonClick(Sender);
  Res := False;
  case FDlgType of
    dtOpen: with FOpenDialog do
             begin
              DefaultExt := FDlgDefaultExt;
              Filter := FDlgFilter;
              Title := FDlgTitle;
              Options := FDlgOptions;
              Filename := Text;
              Res := Execute;
              if Res then
               Text := Filename;
             end;
    dtSave: with FSaveDialog do
             begin
              DefaultExt := FDlgDefaultExt;
              Filter := FDlgFilter;
              Title := FDlgTitle;
              Options := FDlgOptions;
              Filename := Text;
              Res := Execute;
              if Res then
               Text := Filename;
             end;
{$IFDEF D3}
    dtOpenPicture: with FOpenPictureDialog do
                    begin
                     DefaultExt := FDlgDefaultExt;
                     Filter := FDlgFilter;
                     Title := FDlgTitle;
                     Options := FDlgOptions;
                     Filename := Text;
                     Res := Execute;
                     if Res then
                      Text := Filename;
                    end;
    dtSavePicture: with FSavePictureDialog do
                    begin
                     DefaultExt := FDlgDefaultExt;
                     Filter := FDlgFilter;
                     Title := FDlgTitle;
                     Options := FDlgOptions;
                     Filename := Text;
                     Res := Execute;
                     if Res then
                      Text := Filename;
                    end;
{$ENDIF}                    
   end;
  if Res then
   begin
    if Assigned(FOnDlgOk) then FOnDlgOk(Self);
    SetFocus;
    SendMessage(Handle, EM_SETSEl, Length(Text), Length(Text));
   end
  else
   if Assigned(FOnDlgCancel) then FOnDlgCancel(Self);
end;


{$IFDEF D3}
{ TdcFolderEdit }
constructor TdcFolderEdit.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);
  FBrowseDialog := TdcBrowseDialog.Create(Self);

  with FBrowseDialog do
   begin
    FDlgOptions := Options;
    FDlgSpecialLocation := SpecialLocation;
    FDlgStatusText := StatusText;
    FDlgTitle := Title;
   end;

  FNewFolder := TdcNewFolderBtn.Create;

  try
    FBtn.Glyph.Handle := LoadBitmap(hInstance, 'DC_FOLDERBROWSE');
  except
  end;
  FButton.Visible := True;
end;

destructor TdcFolderEdit.Destroy;
begin
  FNewFolder.Free;
  FBrowseDialog.Free;
  inherited Destroy;
end;

procedure TdcFolderEdit.ButtonClick(Sender: TObject);
begin
  inherited ButtonClick(Sender);
  with FBrowseDialog do
   begin
    Options := FDlgOptions;
    SpecialLocation := FDlgSpecialLocation;
    StatusText := FDlgStatusText;
    Title := FDlgTitle;

    NewFolder.Caption := FNewFolder.Caption;
    NewFolder.Prompt := FNewFolder.Prompt;    
    NewFolder.Visible := FNewFolder.Visible;

    Folder := Text;
    if Execute then
     begin
      Text := Folder;
      if Assigned(FOnDlgOk) then FOnDlgOk(Self);
      SetFocus;
      SendMessage(Handle, EM_SETSEl, Length(Text), Length(Text));
     end
    else
     if Assigned(FOnDlgCancel) then FOnDlgCancel(Self);
   end;
end;
{$ENDIF}

end.
