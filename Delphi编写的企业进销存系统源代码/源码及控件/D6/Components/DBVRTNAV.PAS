unit DBVrtNav;

interface

uses SysUtils, WinTypes, WinProcs, Messages, Classes, Controls, Forms,
  Graphics, Menus, StdCtrls, ExtCtrls, DB, DBTables, Mask, Buttons, VDBConsts;

const
  InitRepeatPause = 400;  { pause before repeat timer (ms) }
  RepeatPause     = 100;  { pause before hint window displays (ms)}
  SpaceSize       =  5;   { size of space between special buttons }

type
  TVertNavButton = class;
  TVertNavDatalink = class;

  TVertNavGlyph = (ngEnabled, ngDisabled);
  TVertNavigateBtn = (nbFirst, nbPrior, nbNext, nbLast,
                  nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh);
  TVertButtonSet = set of TVertNavigateBtn;
  TVertNavButtonStyle = set of (nsAllowTimer, nsFocusRect);

  EVertNavClick = procedure (Sender: TObject; Button: TVertNavigateBtn) of object;

{ TDBVertNavigator }

  TDBVertNavigator = class (TCustomPanel)
  private
    FDataLink: TVertNavDatalink;
    FVisibleButtons: TVertButtonSet;
    FHints: TStrings;
    ButtonWidth: Integer;
	 ButtonHeight: Integer;
    MinBtnSize: TPoint;
    FOnNavClick: EVertNavClick;
    FocusedButton: TVertNavigateBtn;
    FConfirmDelete: Boolean;
    function GetDataSource: TDataSource;
    procedure SetDataSource(Value: TDataSource);
    procedure InitButtons;
    procedure InitHints;
    procedure Click(Sender: TObject);
    procedure BtnMouseDown (Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SetVisible(Value: TVertButtonSet);
    procedure AdjustSize (var W: Integer; var H: Integer);
    procedure SetHints(Value: TStrings);
    procedure WMSize(var Message: TWMSize);  message WM_SIZE;
    procedure WMSetFocus(var Message: TWMSetFocus); message WM_SETFOCUS;
    procedure WMKillFocus(var Message: TWMKillFocus); message WM_KILLFOCUS;
    procedure WMGetDlgCode(var Message: TWMGetDlgCode); message WM_GETDLGCODE;
    procedure CMEnabledChanged(var Message: TMessage); message CM_ENABLEDCHANGED;
  protected
    Buttons: array[TVertNavigateBtn] of TVertNavButton;
    procedure DataChanged;
    procedure EditingChanged;
    procedure ActiveChanged;
    procedure Loaded; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); override;
    procedure BtnClick(Index: TVertNavigateBtn);
  published
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property VisibleButtons: TVertButtonSet read FVisibleButtons write SetVisible
      default [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete,
        nbEdit, nbPost, nbCancel, nbRefresh];
    property Align;
    property DragCursor;
    property DragMode;
    property Enabled;
    property Ctl3D;
    property Hints: TStrings read FHints write SetHints;
    property ParentCtl3D;
    property ParentShowHint;
    property PopupMenu;
    property ConfirmDelete: Boolean read FConfirmDelete write FConfirmDelete default True;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnClick: EVertNavClick read FOnNavClick write FOnNavClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnResize;
  end;

{ TVertNavButton }

  TVertNavButton = class(TSpeedButton)
  private
    FIndex: TVertNavigateBtn;
    FNavStyle: TVertNavButtonStyle;
    FRepeatTimer: TTimer;
    procedure TimerExpired(Sender: TObject);
  protected
    procedure Paint; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
  public
    destructor Destroy; override;
    property NavStyle: TVertNavButtonStyle read FNavStyle write FNavStyle;
    property Index : TVertNavigateBtn read FIndex write FIndex;
  end;

{ TVertNavDatalink }

  TVertNavDatalink = class(TDataLink)
  private
    FNavigator: TDBVertNavigator;
  protected
    procedure EditingChanged; override;
    procedure DataSetChanged; override;
    procedure ActiveChanged; override;
  public
    constructor Create(ANav: TDBVertNavigator);
    destructor Destroy; override;
  end;

procedure Register;

implementation

uses DBIErrs, DBITypes, Clipbrd, Dialogs,dbconsts;



{ TDBVertNavigator }

//var
const
  BtnStateName: array[TVertNavGlyph] of PChar = ('EN', 'DI');
  BtnTypeName: array[TVertNavigateBtn] of PChar = ('FIRST', 'PRIOR', 'NEXT',
    'LAST', 'INSERT', 'DELETE', 'EDIT', 'POST', 'CANCEL', 'REFRESH');
//  BtnHintId: array[TNavigateBtn] of Pointer = (@SFirstRecord, @SPriorRecord,
//    @SNextRecord, @SLastRecord, @SInsertRecord, @SDeleteRecord, @SEditRecord,
//    @SPostEdit, @SCancelEdit, @SRefreshRecord);

  BtnHintId: array[TVertNavigateBtn] of string=(SFirstRecord,SPriorRecord,
       SNextRecord,SLastRecord,SInsertRecord,SDeleteRecord,SEditRecord,
       SPostEdit,SCancelEdit,SRefreshRecord);

constructor TDBVertNavigator.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle - [csAcceptsControls, csSetCaption] +
    [csFramed, csOpaque];
  FDataLink := TVertNavDatalink.Create(Self);
  FVisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbInsert,
    nbDelete, nbEdit, nbPost, nbCancel, nbRefresh];
  FHints := TStringList.Create;
  InitButtons;
  BevelOuter := bvNone;
  BevelInner := bvNone;
  Width := 25;
  Height := 241;
  ButtonWidth := 0;
  ButtonHeight := 0;
  FocusedButton := nbFirst;
  FConfirmDelete := True;
end;

destructor TDBVertNavigator.Destroy;
begin
  FDataLink.Free;
  FDataLink := nil;
  inherited Destroy;
end;

procedure TDBVertNavigator.InitButtons;
var
  I: TVertNavigateBtn;
  Btn: TVertNavButton;
  X: Integer;
  ResName: array[0..40] of Char;
begin
  MinBtnSize := Point(20, 18);
  X := 0;
  for I := Low(Buttons) to High(Buttons) do
  begin
    Btn := TVertNavButton.Create (Self);
    Btn.Index := I;
    Btn.Visible := I in FVisibleButtons;
    Btn.Enabled := True;
    Btn.SetBounds (X, 0, MinBtnSize.X, MinBtnSize.Y);
    Btn.Glyph.Handle := LoadBitmap(HInstance,
        StrFmt(ResName, 'dbn_%s', [BtnTypeName[I]]));
    Btn.NumGlyphs := 2;
    Btn.OnClick := Click;
    Btn.OnMouseDown := BtnMouseDown;
    Btn.Parent := Self;
    Buttons[I] := Btn;
    X := X + MinBtnSize.X;
  end;
  InitHints;
  Buttons[nbPrior].NavStyle := Buttons[nbPrior].NavStyle + [nsAllowTimer];
  Buttons[nbNext].NavStyle  := Buttons[nbNext].NavStyle + [nsAllowTimer];
end;

procedure TDBVertNavigator.InitHints;
var
  I: Integer;
  J: TVertNavigateBtn;
begin
  for J := Low(Buttons) to High(Buttons) do
    Buttons[J].Hint := BtnHintId[J];
  //  Buttons[J].Hint := LoadStr (BtnHintId[J]);
  J := Low(Buttons);
  for I := 0 to (FHints.Count - 1) do
  begin
    if FHints.Strings[I] <> '' then Buttons[J].Hint := FHints.Strings[I];
    if J = High(Buttons) then Exit;
    Inc(J);
  end;
end;

procedure TDBVertNavigator.SetHints(Value: TStrings);
begin
  FHints.Assign(Value);
  InitHints;
end;

procedure TDBVertNavigator.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (FDataLink <> nil) and
    (AComponent = DataSource) then DataSource := nil;
end;

procedure TDBVertNavigator.SetVisible(Value: TVertButtonSet);
var
  I: TVertNavigateBtn;
  W, H: Integer;
begin
  W := Width;
  H := Height;
  FVisibleButtons := Value;
  for I := Low(Buttons) to High(Buttons) do
    Buttons[I].Visible := I in FVisibleButtons;
  AdjustSize (W, H);
  if (W <> Width) or (H <> Height) then
    inherited SetBounds (Left, Top, W, H);
  Invalidate;
end;

procedure TDBVertNavigator.AdjustSize (var W: Integer; var H: Integer);
var
  Count: Integer;
  MinW: Integer;
  MinH: Integer;
  I: TVertNavigateBtn;
  LastBtn: TVertNavigateBtn;
  Space, Temp, Remain: Integer;
  X: Integer;
  Y: Integer;
begin
  if (csLoading in ComponentState) then Exit;
  if Buttons[nbFirst] = nil then Exit;

  Count := 0;
  LastBtn := High(Buttons);
  for I := Low(Buttons) to High(Buttons) do
  begin
    if Buttons[I].Visible then
    begin
      Inc(Count);
      LastBtn := I;
    end;
  end;
  if Count = 0 then Inc(Count);

  if W >= H then

  	begin

	  MinW := Count * (MinBtnSize.X - 1) + 1;
	  if W < MinW then
		 W := MinW;
	  if H < MinBtnSize.Y then
		 H := MinBtnSize.Y;

	  ButtonWidth := ((W - 1) div Count) + 1;
	  Temp := Count * (ButtonWidth - 1) + 1;
	  if Align = alNone then
		 W := Temp;

	  X := 0;
	  Remain := W - Temp;
	  Temp := Count div 2;
	  for I := Low(Buttons) to High(Buttons) do
	  begin
		 if Buttons[I].Visible then
		 begin
			Space := 0;
			if Remain <> 0 then
			begin
			  Dec (Temp, Remain);
			  if Temp < 0 then
			  begin
				 Inc (Temp, Count);
				 Space := 1;
			  end;
			end;
			Buttons[I].SetBounds (X, 0, ButtonWidth + Space, Height);
			Inc (X, ButtonWidth - 1 + Space);
			LastBtn := I;
		 end
		 else
			Buttons[I].SetBounds (Width + 1, 0, ButtonWidth, Height);
	  end;
	end

	else

	begin
	  MinH := Count * (MinBtnSize.Y - 1) + 1;
	  if H < MinH then
		 H := MinH;
	  if W < MinBtnSize.X then
		 W := MinBtnSize.X;

	  ButtonHeight := ((H - 1) div Count) + 1;
	  Temp := Count * (ButtonHeight - 1) + 1;
	  if Align = alNone then
		 H := Temp;

	  Y := 0;
	  Remain := H - Temp;
	  Temp := Count div 2;
	  for I := Low(Buttons) to High(Buttons) do
	  begin
		 if Buttons[I].Visible then
		 begin
			Space := 0;
			if Remain <> 0 then
			begin
			  Dec (Temp, Remain);
			  if Temp < 0 then
			  begin
				 Inc (Temp, Count);
				 Space := 1;
			  end;
			end;
			Buttons[I].SetBounds (0, Y, Width, ButtonHeight + Space);
			Inc (Y, ButtonHeight - 1 + Space);
			LastBtn := I;
		 end
		 else
			Buttons[I].SetBounds (0, Height + 1, ButtonHeight, Width);
	  end;
	end;
	
end;

procedure TDBVertNavigator.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
var
  W, H: Integer;
begin
  W := AWidth;
  H := AHeight;
  AdjustSize (W, H);
  inherited SetBounds (ALeft, ATop, W, H);
end;

procedure TDBVertNavigator.WMSize(var Message: TWMSize);
var
  W, H: Integer;
begin
  inherited;

  { check for minimum size }
  W := Width;
  H := Height;
  AdjustSize (W, H);
  if (W <> Width) or (H <> Height) then
    inherited SetBounds(Left, Top, W, H);
  Message.Result := 0;
end;

procedure TDBVertNavigator.Click(Sender: TObject);
begin
  BtnClick (TVertNavButton (Sender).Index);
end;

procedure TDBVertNavigator.BtnMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  OldFocus: TVertNavigateBtn;
  Form: TForm;
begin
  OldFocus := FocusedButton;
  FocusedButton := TVertNavButton (Sender).Index;
  if TabStop and (GetFocus <> Handle) and CanFocus then
  begin
    SetFocus;
    if (GetFocus <> Handle) then
      Exit;
  end
  else if TabStop and (GetFocus = Handle) and (OldFocus <> FocusedButton) then
  begin
    Buttons[OldFocus].Invalidate;
    Buttons[FocusedButton].Invalidate;
  end;
end;

procedure TDBVertNavigator.BtnClick(Index: TVertNavigateBtn);
begin
  if (DataSource <> nil) and (DataSource.State <> dsInactive) then
  begin
    with DataSource.DataSet do
    begin
      case Index of
        nbPrior: Prior;
        nbNext: Next;
        nbFirst: First;
        nbLast: Last;
        nbInsert: Insert;
        nbEdit: Edit;
        nbCancel: Cancel;
        nbPost: Post;
        nbRefresh: Refresh;
        nbDelete:
          begin
            if not FConfirmDelete or
                (MessageDlg (SDeleteRecordQuestion,
                mtConfirmation, mbOKCancel, 0) <> idCancel) then
              Delete;
          end;
      end;
    end;
  end;
  if not (csDesigning in ComponentState) and Assigned(FOnNavClick) then
    FOnNavClick(Self, Index);
end;

procedure TDBVertNavigator.WMSetFocus(var Message: TWMSetFocus);
begin
  Buttons[FocusedButton].Invalidate;
end;

procedure TDBVertNavigator.WMKillFocus(var Message: TWMKillFocus);
begin
  Buttons[FocusedButton].Invalidate;
end;

procedure TDBVertNavigator.KeyDown(var Key: Word; Shift: TShiftState);
var
  NewFocus: TVertNavigateBtn;
  OldFocus: TVertNavigateBtn;
begin
  OldFocus := FocusedButton;
  case Key of
    VK_RIGHT:
      begin
        NewFocus := FocusedButton;
        repeat
          if NewFocus < High(Buttons) then
            NewFocus := Succ(NewFocus);
        until (NewFocus = High(Buttons)) or (Buttons[NewFocus].Visible);
        if NewFocus <> FocusedButton then
        begin
          FocusedButton := NewFocus;
          Buttons[OldFocus].Invalidate;
          Buttons[FocusedButton].Invalidate;
        end;
      end;
    VK_LEFT:
      begin
        NewFocus := FocusedButton;
        repeat
          if NewFocus > Low(Buttons) then
            NewFocus := Pred(NewFocus);
        until (NewFocus = Low(Buttons)) or (Buttons[NewFocus].Visible);
        if NewFocus <> FocusedButton then
        begin
          FocusedButton := NewFocus;
          Buttons[OldFocus].Invalidate;
          Buttons[FocusedButton].Invalidate;
        end;
      end;
    VK_SPACE:
      begin
        if Buttons[FocusedButton].Enabled then
          Buttons[FocusedButton].Click;
      end;
  end;
end;

procedure TDBVertNavigator.WMGetDlgCode(var Message: TWMGetDlgCode);
begin
  Message.Result := DLGC_WANTARROWS;
end;

procedure TDBVertNavigator.DataChanged;
var
  UpEnable, DnEnable: Boolean;
begin
  UpEnable := Enabled and FDataLink.Active and not FDataLink.DataSet.BOF;
  DnEnable := Enabled and FDataLink.Active and not FDataLink.DataSet.EOF;
  Buttons[nbFirst].Enabled := UpEnable;
  Buttons[nbPrior].Enabled := UpEnable;
  Buttons[nbNext].Enabled := DnEnable;
  Buttons[nbLast].Enabled := DnEnable;
  Buttons[nbDelete].Enabled := Enabled and FDataLink.Active and 
    FDataLink.DataSet.CanModify and 
    not (FDataLink.DataSet.BOF and FDataLink.DataSet.EOF);
end;

procedure TDBVertNavigator.EditingChanged;
var
  CanModify: Boolean;
begin
  CanModify := Enabled and FDataLink.Active and FDataLink.DataSet.CanModify;
  Buttons[nbInsert].Enabled := CanModify;
  Buttons[nbEdit].Enabled := CanModify and not FDataLink.Editing;
  Buttons[nbPost].Enabled := CanModify and FDataLink.Editing;
  Buttons[nbCancel].Enabled := CanModify and FDataLink.Editing;
  Buttons[nbRefresh].Enabled := not (FDataLink.DataSet is TQuery);
end;

procedure TDBVertNavigator.ActiveChanged;
var
  I: TVertNavigateBtn;
begin
  if not (Enabled and FDataLink.Active) then
    for I := Low(Buttons) to High(Buttons) do
      Buttons[I].Enabled := False
  else
  begin
    DataChanged;
    EditingChanged;
  end;
end;

procedure TDBVertNavigator.CMEnabledChanged(var Message: TMessage);
begin
  inherited;
  if not (csLoading in ComponentState) then
    ActiveChanged;
end;

procedure TDBVertNavigator.SetDataSource(Value: TDataSource);
begin
  FDataLink.DataSource := Value;
  if not (csLoading in ComponentState) then
    ActiveChanged;
end;

function TDBVertNavigator.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

procedure TDBVertNavigator.Loaded;
var
  W, H: Integer;
begin
  inherited Loaded;
  W := Width;
  H := Height;
  AdjustSize (W, H);
  if (W <> Width) or (H <> Height) then
    inherited SetBounds (Left, Top, W, H);
  InitHints;
  ActiveChanged;
end;

{TVertNavButton}

destructor TVertNavButton.Destroy;
begin
  if FRepeatTimer <> nil then
    FRepeatTimer.Free;
  inherited Destroy;
end;

procedure TVertNavButton.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  inherited MouseDown (Button, Shift, X, Y);
  if nsAllowTimer in FNavStyle then
  begin
    if FRepeatTimer = nil then
      FRepeatTimer := TTimer.Create(Self);

    FRepeatTimer.OnTimer := TimerExpired;
    FRepeatTimer.Interval := InitRepeatPause;
    FRepeatTimer.Enabled  := True;
  end;
end;

procedure TVertNavButton.MouseUp(Button: TMouseButton; Shift: TShiftState;
                                  X, Y: Integer);
begin
  inherited MouseUp (Button, Shift, X, Y);
  if FRepeatTimer <> nil then
    FRepeatTimer.Enabled  := False;
end;

procedure TVertNavButton.TimerExpired(Sender: TObject);
begin
  FRepeatTimer.Interval := RepeatPause;
  if (FState = bsDown) and MouseCapture then
  begin
    try
      Click;
    except
      FRepeatTimer.Enabled := False;
      raise;
    end;
  end;
end;

procedure TVertNavButton.Paint;
var
  R: TRect;
begin
  inherited Paint;
  if (GetFocus = Parent.Handle) and
     (FIndex = TDBVertNavigator (Parent).FocusedButton) then
  begin
    R := Bounds(0, 0, Width, Height);
    InflateRect(R, -3, -3);
    if FState = bsDown then
      OffsetRect(R, 1, 1);
    DrawFocusRect(Canvas.Handle, R);
  end;
end;

{ TVertNavDatalink }

constructor TVertNavDatalink.Create(ANav: TDBVertNavigator);
begin
  inherited Create;
  FNavigator := ANav;
end;

destructor TVertNavDatalink.Destroy;
begin
  FNavigator := nil;
  inherited Destroy;
end;

procedure TVertNavDatalink.EditingChanged;
begin
  if FNavigator <> nil then FNavigator.EditingChanged;
end;

procedure TVertNavDatalink.DataSetChanged;
begin
  if FNavigator <> nil then FNavigator.DataChanged;
end;

procedure TVertNavDatalink.ActiveChanged;
begin
  if FNavigator <> nil then FNavigator.ActiveChanged;
end;


{******************************************************************************}
procedure Register;
begin
  RegisterComponents('Data Controls', [TDBVertNavigator]);
end; {of Register}


end.
