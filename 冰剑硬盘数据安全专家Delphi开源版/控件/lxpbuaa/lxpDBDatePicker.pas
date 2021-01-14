unit lxpDBDatePicker;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls,
  ComCtrls, DBCtrls, DB;

type
  TlxpDBDatePicker = class(TDateTimePicker)
  private
    FDataLink: TFieldDataLink;
    PreDate: TDate;  
    PreOnDropDown, PreOnCloseUp: TNotifyEvent;
    procedure NewDropDown(Sender: TObject);
    procedure NewCloseUp(Sender: TObject);
    procedure DataChange(Sender: TObject);
    procedure UpdateData(Sender: TObject);
    procedure CMGetDataLink(var Message: TMessage); message CM_GETDATALINK;
    function GetField: TField;
    function GetDataField: String;
    procedure SetDataField(const Value: String);
    function GetDataSource: TDataSource;
    procedure SetDataSource(Value: TDataSource);
    function GetReadOnly: Boolean;
    procedure SetReadOnly(Value: Boolean);
    procedure SetFormat;
  protected
    procedure Change; override;
    procedure DoExit; override;
    procedure KeyPress(var Key: Char); override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Field: TField read GetField;
  published
    property DataField: String read GetDataField write SetDataField;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property ReadOnly: Boolean read GetReadOnly write SetReadOnly default False;
  end;

procedure Register;

implementation


procedure Register;
begin
  RegisterComponents('lxpbuaa', [TlxpDBDatePicker]);
end;

{ TlxpDBDatePicker }
constructor TlxpDBDatePicker.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  inherited ShowCheckbox := True;
  Date := SysUtils.Date;
  Width := 100;
  FDataLink := TFieldDataLink.Create;
  FDataLink.Control := Self;
  FDataLink.OnDataChange := DataChange;
  FDataLink.OnUpdateData := UpdateData;
  PreOnDropDown := OnDropDown;
  PreOnCloseUp := OnCloseUp;
  OnDropDown := NewDropDown;
  OnCloseUp := NewCloseUp;
end;

destructor TlxpDBDatePicker.Destroy;
begin
  FreeAndNil(FDataLink);
  inherited Destroy;
end;

procedure TlxpDBDatePicker.SetFormat;
begin
  if Checked then Format := ''
  else Format := 'gg';
end;

procedure TlxpDBDatePicker.DataChange(Sender: TObject);
begin
  Checked := Assigned(FDataLink.Field) and (FDataLink.Field.AsString <> '');
  try
    if Checked then
      Date := StrToDateTime(FDataLink.Field.AsString);
  finally
    SetFormat;
  end;
end;

procedure TlxpDBDatePicker.Change;
begin
  if ReadOnly then
  begin
    if Checked <> (FDataLink.Field.AsString <> '') then
      Checked := not Checked;
    Exit;
  end;

  with FDataLink do
  begin
    if not Editing then Edit;
    Modified;
  end;
  inherited;
  SetFormat;
end;

procedure TlxpDBDatePicker.DoExit;
begin
  try
    FDataLink.UpdateRecord;
  except
    SetFocus;
    raise;
  end;
  inherited;
end;

procedure TlxpDBDatePicker.UpdateData(Sender: TObject);
var
  S: String;
begin
  if Checked then
  begin
    try
      DateTimeToString(S, 'YYYY-MM-DD', Date);
      FDataLink.Field.AsString := S;
    except
      MessageBox(0, '不是日期型字段。', '提示', MB_ICONINFORMATION+MB_OK);
    end;
  end else FDataLink.Field.AsString := '';
end;

procedure TlxpDBDatePicker.NewDropDown(Sender: TObject);
begin
  if Assigned(PreOnDropDown) then PreOnDropDown(Sender);
  PreDate := Date;
end;

procedure TlxpDBDatePicker.NewCloseUp(Sender: TObject);
begin
  if Assigned(PreOnCloseUp) then PreOnCloseUp(Sender);
  if ReadOnly then
  begin
    if PreDate <> Date then Date := PreDate;
    Checked := FDataLink.Field.AsString <> '';
  end;
  SetFormat;
end;

procedure TlxpDBDatePicker.KeyPress(var Key: Char);
begin
  if Key = #13 then keybd_event(VK_TAB, 0, 0, 0)
  else if ReadOnly and (Ord(Key) in [48..57, 8, 45, 3, 22, 24]) then Key := #0
  else
    inherited;
end;

function TlxpDBDatePicker.GetField: TField;
begin
  Result := FDataLink.Field;
end;

function TlxpDBDatePicker.GetDataField: String;
begin
  Result := FDataLink.FieldName;
end;

procedure TlxpDBDatePicker.SetDataField(const Value: String);
begin
  FDataLink.FieldName := Value;
end;

function TlxpDBDatePicker.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

procedure TlxpDBDatePicker.SetDataSource(Value: TDataSource);
begin
  if not (FDataLink.DataSourceFixed and (csLoading in ComponentState)) then
    FDataLink.DataSource := Value;
  if Value <> nil then Value.FreeNotification(Self);
end;

function TlxpDBDatePicker.GetReadOnly: Boolean;
begin
  Result := FDataLink.ReadOnly;
end;

procedure TlxpDBDatePicker.SetReadOnly(Value: Boolean);
begin
  FDataLink.ReadOnly := Value;
end;

procedure TlxpDBDatePicker.CMGetDataLink(var Message: TMessage);
begin
  Message.Result := Integer(FDataLink);
end;

procedure TlxpDBDatePicker.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (FDataLink <> nil) and
    (AComponent = DataSource) then DataSource := nil;
end;

end.
