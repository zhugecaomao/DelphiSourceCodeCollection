{ TODO -ovicalloy : 在hook里加一个判断，在窗口销毁的时候销毁窗口状态纪录。 }
unit ufrmBar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Contnrs, JclContainerIntf, JclHashMaps,
  ImgList, Buttons, CoolTrayIcon, Menus;

type
  TfrmBar = class;

  TLinks = class(TJclStrHashMap)
  end;
  
  //被修改的窗口的信息，做恢复等操作用
  //被缩小的窗口，只有在被激活的时候才能安上标题。
  TVXHookedFormInfo = class(TObject)
  private
    FHandle: THandle;
    FHeight: Integer;
    FIsBar: Boolean;
    FIsTopMost: Boolean;
    FTrayIcon: TCoolTrayIcon;
    FWidth: Integer;
    FX: Integer;
    FY: Integer;
    FZOrder: Integer;
  public
    destructor Destroy; override;
    property Handle: THandle read FHandle write FHandle;
    property Height: Integer read FHeight write FHeight;
    property IsBar: Boolean read FIsBar write FIsBar;
    property IsTopMost: Boolean read FIsTopMost write FIsTopMost;
    property TrayIcon: TCoolTrayIcon read FTrayIcon write FTrayIcon;
    property Width: Integer read FWidth write FWidth;
    property X: Integer read FX write FX;
    property Y: Integer read FY write FY;
    property ZOrder: Integer read FZOrder write FZOrder;
  end;
  
  TTopmostBitBtn = class(TBitBtn)
  private
    FParentForm: TfrmBar;
  public
    constructor Create(AOwner: TComponent); override;
    procedure Click; override;
    property ParentForm: TfrmBar read FParentForm write FParentForm;
  end;
  
  TMiniBitBtn = class(TBitBtn)
  private
    FParentForm: TfrmBar;
  public
    constructor Create(AOwner: TComponent); override;
    procedure Click; override;
    property ParentForm: TfrmBar read FParentForm write FParentForm;
  end;
  
  TTrayBitBtn = class(TBitBtn)
  private
    FHookedTrayPopupMenu: TPopupMenu;
    FOnTrayIconMouseClick: TNotifyEvent;
    FParentForm: TfrmBar;
    procedure TrayIconMouseDown(Sender: TObject; Button: TMouseButton; Shift:
            TShiftState; X, Y: Integer);
  protected
    procedure DoTrayIconMouseClick(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    procedure Click; override;
    procedure ShowHookedForm(Sender: TObject);
    property HookedTrayPopupMenu: TPopupMenu read FHookedTrayPopupMenu write
            FHookedTrayPopupMenu;
    property ParentForm: TfrmBar read FParentForm write FParentForm;
  published
    property OnTrayIconMouseClick: TNotifyEvent read FOnTrayIconMouseClick
            write FOnTrayIconMouseClick;
  end;
  
  TfrmBar = class(TForm)
    ilBarIcon: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    FBarKitList: TObjectList;
    FHookedFormBaseWidth: Integer;
    FHookedForms: TLinks;
    FHookedHandle: THandle;
  protected
    procedure CreateParams(var Params:TCreateParams); override;
    procedure WMNCHitTest(var Msg: TMessage); message WM_NCHITTEST;
  public
    procedure RemoveHookedForm(aHandle: THandle);
    property HookedFormBaseWidth: Integer read FHookedFormBaseWidth write
            FHookedFormBaseWidth;
    property HookedForms: TLinks read FHookedForms write FHookedForms;
    property HookedHandle: THandle read FHookedHandle write FHookedHandle;
  end;
  
var
  frmBar: TfrmBar;

implementation

uses
  ufrmMain, uUtils, DbugIntf;

{$R *.dfm}

procedure GetDLLData(var aReceiveStruct: PReceiveStruct); stdcall; external 'BarButton.DLL';
function SetHook(aHandle: THandle) : BOOL; external 'BarButton.DLL';
function RemoveHook : BOOL ; external 'BarButton.DLL';

{
****************************** TVXHookedFormInfo *******************************
}
destructor TVXHookedFormInfo.Destroy;
begin
  FreeObject(FTrayIcon);
  inherited Destroy;
end;

{
******************************** TTopmostBitBtn ********************************
}
constructor TTopmostBitBtn.Create(AOwner: TComponent);
begin
  inherited;
  Self.Glyph.LoadFromResourceName( HInstance, 'BAR_STAY_ON' );
end;

procedure TTopmostBitBtn.Click;
var
  style: DWORD;
  HookedFormInfo: TVXHookedFormInfo;
begin
  HookedFormInfo := TVXHookedFormInfo(FParentForm.HookedForms.GetValue(IntToStr(ParentForm.HookedHandle)));
  if not Assigned(HookedFormInfo) then
  begin
    HookedFormInfo := TVXHookedFormInfo.Create;
    HookedFormInfo.Handle := ParentForm.HookedHandle;
  end;
  if not HookedFormInfo.IsTopMost then
  begin
    SetWindowPos(ParentForm.HookedHandle, HWND_TOPMOST,
                 0, 0, 0, 0,
                 SWP_NOMOVE or SWP_NOSIZE);
    Self.Glyph.LoadFromResourceName( HInstance, 'BAR_STAY_OFF' );
    HookedFormInfo.IsTopMost := True;
  { TODO -ovicalloy :
  这里是直接取消最前选项，但真实情况应当纪录窗口的原始状态。
  现在API还没找到，先这样处理。 }
    HookedFormInfo.ZOrder := HWND_NOTOPMOST;
  end
  else begin
    SetWindowPos(ParentForm.HookedHandle, HookedFormInfo.ZOrder,
                0, 0, 0, 0,
                SWP_NOMOVE or SWP_NOSIZE);
    Self.Glyph.LoadFromResourceName( HInstance, 'BAR_STAY_ON' );
    HookedFormInfo.IsTopMost := False;
  end;
  ParentForm.HookedForms.PutValue(IntToStr(ParentForm.HookedHandle), HookedFormInfo);
  
  inherited;
end;

{
*********************************** TfrmBar ************************************
}
procedure TfrmBar.CreateParams(var Params:TCreateParams);
begin
  inherited;
  With Params do
  begin
    wndParent := GetDesktopwindow;
    ExStyle:=ExStyle or WS_EX_TOPMOST or WS_EX_TOOLWINDOW;
  end;
end;

procedure TfrmBar.FormCreate(Sender: TObject);
var
  TopmostBitBtn: TTopmostBitBtn;
  MiniBitBtn: TMiniBitBtn;
  TrayBitBtn: TTrayBitBtn;
begin
  Self.BringToFront;
  FHookedForms := TLinks.Create;
  FBarKitList := TObjectList.Create;
  
  //--Test
  MiniBitBtn := TMiniBitBtn.Create(Self);
  with MiniBitBtn do
  begin
    Parent := Self;
    Left := 33;
    Top := 0;
    Width := 33;
    Height := 17;
    ParentForm := Self;
  end;
  
  TopmostBitBtn := TTopmostBitBtn.Create(Self);
  with TopmostBitBtn do
  begin
    Parent := Self;
    Left := 66;
    Top := 0;
    Width := 33;
    Height := 17;
    ParentForm := Self;
  end;
  
  TrayBitBtn := TTrayBitBtn.Create(Self);
  with TrayBitBtn do
  begin
    Parent := Self;
    Left := 0;
    Top := 0;
    Width := 33;
    Height := 17;
    ParentForm := Self;
  end;
  
  Self.AutoSize := False;
  Self.AutoSize := True;
  Self.AutoSize := False;// 设置回false，因为需要调整高度。
end;

procedure TfrmBar.FormDestroy(Sender: TObject);
begin
  FBarKitList.Free;
  FHookedForms.Free;
end;

procedure TfrmBar.FormResize(Sender: TObject);
var
  i: Integer;
begin
  { TODO -ovicalloy : 遍历窗口上的相关控件，设置其高度。 }
  for i := 0 to Self.ComponentCount - 1 do
  begin
    if components[i] is TControl then
    begin
      try
        TControl(Self.Components[i]).Height := Self.Height;
      finally
      end;
    end;
  end;
end;

procedure TfrmBar.RemoveHookedForm(aHandle: THandle);
var
  HookedFormInfo: TObject;
begin
  HookedFormInfo := FHookedForms.Remove(IntToStr(aHandle));
  FreeObject(HookedFormInfo);
end;

procedure TfrmBar.WMNCHitTest(var Msg: TMessage);
begin
  Msg.Result := 0;
end;

{ TMiniBitBtn }

{
********************************* TMiniBitBtn **********************************
}
constructor TMiniBitBtn.Create(AOwner: TComponent);
begin
  inherited;
  Self.Glyph.LoadFromResourceName( HInstance, 'BAR_ROLL_DOWN' );
end;

procedure TMiniBitBtn.Click;
var
  HookedFormInfo: TVXHookedFormInfo;
  HookedFormRect: TRect;
begin
  HookedFormInfo := TVXHookedFormInfo(FParentForm.HookedForms.GetValue(IntToStr(FParentForm.HookedHandle)));
  if not Assigned(HookedFormInfo) then
  begin
    HookedFormInfo := TVXHookedFormInfo.Create;
    HookedFormInfo.Handle := FParentForm.HookedHandle;
  end;
  if not HookedFormInfo.IsBar then
  begin
    //最小化的时候只保留一个还原的按钮
    //必须加入过滤列表
    GetWindowRect(FParentForm.HookedHandle, HookedFormRect);
    SetWindowPos(FParentForm.HookedHandle,
                 0, 0, 0, FParentForm.HookedFormBaseWidth, 0,
                 SWP_NOMOVE or SWP_NOOWNERZORDER);
    Self.Glyph.LoadFromResourceName( HInstance, 'BAR_ROLL_DOWN' );
    HookedFormInfo.IsBar := True;
    HookedFormInfo.X := HookedFormRect.Left;
    HookedFormInfo.Y := HookedFormRect.Top;
    HookedFormInfo.Width := HookedFormRect.Right - HookedFormRect.Left;
    HookedFormInfo.Height := HookedFormRect.Bottom - HookedFormRect.Top;
  end
  else begin
    SetWindowPos(FParentForm.HookedHandle, 0,
                 0, 0, HookedFormInfo.Width, HookedFormInfo.Height,
                 SWP_NOMOVE or SWP_NOOWNERZORDER);
    Self.Glyph.LoadFromResourceName( HInstance, 'BAR_ROLL_UP' );
    HookedFormInfo.IsBar := False;
  end;
  FParentForm.HookedForms.PutValue(IntToStr(FParentForm.HookedHandle), HookedFormInfo);
  
  inherited;
end;

{ TTrayBitBtn }

{
********************************* TTrayBitBtn **********************************
}
constructor TTrayBitBtn.Create(AOwner: TComponent);
var
  pmiAdd: TMenuItem;
begin
  inherited;
  FHookedTrayPopupMenu := TPopupMenu.Create(nil);
  pmiAdd := TMenuItem.Create(FHookedTrayPopupMenu);
  pmiAdd.Name := 'pmiShow';
  pmiAdd.Caption := '显示';
  pmiAdd.OnClick := ShowHookedForm;
  FHookedTrayPopupMenu.Items.Add(pmiAdd);
end;

procedure TTrayBitBtn.Click;
var
  HookedFormInfo: TVXHookedFormInfo;
begin
  HookedFormInfo := TVXHookedFormInfo(FParentForm.HookedForms.GetValue(IntToStr(ParentForm.HookedHandle)));
  if not Assigned(HookedFormInfo) then
  begin
    HookedFormInfo := TVXHookedFormInfo.Create;
    HookedFormInfo.Handle := ParentForm.HookedHandle;
  end;
  if not Assigned(HookedFormInfo.TrayIcon) then
  begin
    SendDebug('add icon');
    HookedFormInfo.TrayIcon := TCoolTrayIcon.Create(nil);
    HookedFormInfo.TrayIcon.Icon := Application.Icon;
    HookedFormInfo.TrayIcon.PopupMenu := FHookedTrayPopupMenu;
    RemoveHook; //if didn't remove hook, this app while "dead" for few time. why?
    HookedFormInfo.TrayIcon.IconVisible := True;
    HookedFormInfo.TrayIcon.Tag := HookedFormInfo.FHandle;
    HookedFormInfo.TrayIcon.OnMouseDown := TrayIconMouseDown;
    HookedFormInfo.TrayIcon.OnDblClick := ShowHookedForm;
    SetHook(frmMain.Handle);
  end;
  FParentForm.HookedForms.PutValue(IntToStr(FParentForm.HookedHandle), HookedFormInfo);
  ShowWindow( HookedFormInfo.Handle, SW_HIDE );
  
  inherited;
end;

procedure TTrayBitBtn.DoTrayIconMouseClick(Sender: TObject);
begin
  if Assigned(FOnTrayIconMouseClick) then
  begin
    FOnTrayIconMouseClick(Sender);
  end;
end;

procedure TTrayBitBtn.ShowHookedForm(Sender: TObject);
var
  HookedFormHandle: THandle;
  pmiTmp: TMenuItem;
  TrayIcon: TCoolTrayIcon;
  HookedFormInfo: TVXHookedFormInfo;
begin
  HookedFormHandle := 0;
  if Sender is TMenuItem then
  begin
    pmiTmp := TMenuItem(Sender);
    HookedFormHandle := pmiTmp.Owner.Tag;
    SendDebug('tray show hookedform:' + IntToStr(HookedFormHandle));
  end;
  if Sender is TCoolTrayIcon then
  begin
    TrayIcon := TCoolTrayIcon(Sender);
    HookedFormHandle := TrayIcon.Tag;
  end;
  if HookedFormHandle = 0 then
  begin
    Exit;
  end;
  SendDebug('tray show hookedform:' + IntToStr(HookedFormHandle));
  //show it;
  ShowWindow( HookedFormHandle, SW_SHOWNA );
  //free the trayicon
  HookedFormInfo := TVXHookedFormInfo(FParentForm.HookedForms.GetValue(IntToStr(HookedFormHandle)));
  if Assigned(HookedFormInfo) then
  begin
    RemoveHook;
    FreeObject(HookedFormInfo.TrayIcon);
    HookedFormInfo.TrayIcon := nil;//why need it?
    SetHook(frmMain.Handle);
  end;
end;

procedure TTrayBitBtn.TrayIconMouseDown(Sender: TObject; Button: TMouseButton;
        Shift: TShiftState; X, Y: Integer);
var
  TrayIcon: TCoolTrayIcon;
begin
  {设置tag为hookedform的handle0。
  其实可以用Tray的uid保存hookedform.handle。
  不过这里懒得修改控件代码}
  if Sender is TCoolTrayIcon then
  begin
    TrayIcon := TCoolTrayIcon(Sender);
    TrayIcon.PopupMenu.Tag := TrayIcon.Tag;
  end;
  //DoTrayIconMouseClick(Sender);
end;

end.







