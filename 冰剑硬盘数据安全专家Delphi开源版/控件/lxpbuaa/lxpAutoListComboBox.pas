unit lxpAutoListComboBox;

interface

uses
  Windows, SysUtils, Classes, Controls, StdCtrls;

type
  TlxpAutoListComboBox = class(TComboBox)
  private
    FText: String;
    FAllStrings: TStrings;
    procedure SetStrings(const Value: TStrings);
  protected
    procedure DoEnter; override;
    procedure KeyPress(var Key: Char); override;
    procedure Change; override;
  public
    property AllStrings: TStrings read FAllStrings write SetStrings;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

procedure Register;  

implementation

uses Messages;

procedure Register;
begin
  RegisterComponents('lxpbuaa', [TlxpAutoListComboBox]);
end;   


{ TlxpAutoListComboBox }

constructor TlxpAutoListComboBox.Create(AOwner: TComponent);
begin
  inherited;
  AutoComplete := False;
  FAllStrings := TStringList.Create;
end;

destructor TlxpAutoListComboBox.Destroy;
begin
  FreeAndNil(FAllStrings);
  inherited;
end;

procedure TlxpAutoListComboBox.SetStrings(const Value: TStrings);
begin
  if Assigned(FAllStrings) then
    FAllStrings.Assign(Value)
  else
    FAllStrings := Value;
end;

procedure PackStrings(Strs: TStrings);
var
  I: Integer;
  S: String;
begin
  if Strs.Count = 0 then Exit;
  Strs.BeginUpdate;
  with TStringList(Strs) do
  begin
    if not Sorted then Sort;
    S := Strings[0];
    I := 1;
    while I < Count do
    begin
      if S = Strings[I] then Delete(I)
      else
      begin
        S := Strings[I];
        Inc(I);
      end;
    end;
  end;
  Strs.EndUpdate;
end;

procedure TlxpAutoListComboBox.DoEnter;
begin
  inherited;
  if FAllStrings.Count <> 0 then with TStringList(FAllStrings) do
    PackStrings(FAllStrings)
  else
    FAllStrings.Assign(Items);
end;

procedure TlxpAutoListComboBox.KeyPress(var Key: Char);
begin
  if not (Ord(Key) in [VK_ESCAPE, VK_RETURN, 3, 22, 24]) then
    if not DroppedDown then
      DroppedDown := True;
  inherited;
end;

procedure TlxpAutoListComboBox.Change;
var
  I,ISelStart: Integer;
  IWidth,MaxWidth,IndexMaxWidth: Integer;
begin
  inherited Change;
  if Text = '' then
  begin
    Items.Assign(FAllStrings);
    Exit;
  end;
  if Items.IndexOf(Text) <> -1 then Exit;

  FText := Text;
  ISelStart := SelStart;
  Items.Clear;  //不能放在上两句之前
  MaxWidth := 0;
  IndexMaxWidth := -1;
  for I := 0 to FAllStrings.Count-1 do
  if Pos(FText, FAllStrings[I]) > 0 then
  begin
    Items.Add(FAllStrings[I]);
    IWidth := Length(FAllStrings[I]);
    if IWidth > MaxWidth then
    begin
      MaxWidth := IWidth;
      Inc(IndexMaxWidth);
    end;
  end;
  for I := 1 to 8-Items.Count do
    Items.Add('');
  Perform(CB_SETDROPPEDWIDTH,Canvas.TextWidth(Items[IndexMaxWidth])+10,0);
  if not DroppedDown then
    DroppedDown := True;
  Text := FText;
  SelStart := ISelStart;
end;
             

end.
