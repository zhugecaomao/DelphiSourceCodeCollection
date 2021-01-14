unit AutoListComboBox;

interface

uses
  Windows, SysUtils, Classes,
  Controls, IniFiles, StdCtrls;

type
  TAutoListComboBox = class(TComboBox)
  private
    SText: String;
    FReadOnly: Boolean;
  protected
    procedure KeyPress(var Key: Char); override;
    procedure Change; override;
    procedure DoEnter; override;
  public
    Strings: THashedStringList;
    procedure SetStrings(Strs: TStrings);
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property ReadOnly: Boolean read FReadOnly write FReadOnly;
    //其实现还在在Change中改进
  end;

procedure Register;

implementation

uses {FunAndProc_String, }Messages;

const
  SepStr = '; ';        

procedure Register;
begin
  RegisterComponents('Data ExControls', [TAutoListComboBox]);
end;   


{ TAutoListComboBox }

procedure TAutoListComboBox.Change;
var
  I,ISelStart: Integer;
  IWidth,MaxWidth,IndexMaxWidth: Integer;
begin
  inherited Change;
  if Text = '' then
  begin
    Items.Assign(Strings);
    Exit;
  end;
  if Items.IndexOf(Text) <> -1 then Exit;

  SText := Text;
  ISelStart := SelStart;
  Items.Clear;  //不能放在上两句之前
  MaxWidth := 0;
  IndexMaxWidth := -1;
  for I := 0 to Strings.Count-1 do
  if Pos(SText, Strings[I]) > 0 then
  begin
    Items.Add(Strings[I]);
    IWidth := Length(Strings[I]);
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
  Text := SText;
  SelStart := ISelStart;
end;


constructor TAutoListComboBox.Create(AOwner: TComponent);
begin
  inherited;
  AutoComplete := False;
  Strings := THashedStringList.Create;
end;

destructor TAutoListComboBox.Destroy;
begin
  FreeAndNil(Strings);
  inherited;
end;

procedure TAutoListComboBox.DoEnter;
begin
  inherited;
  if not Strings.Sorted then Strings.Sort;
  //PackStrings(Strings);
  Items.Assign(Strings);
end;

procedure TAutoListComboBox.KeyPress(var Key: Char);
var
  I: Integer;
begin
  if ReadOnly then
  begin
    Key := #0;
    Exit;
  end;
  if (not (Ord(Key) in [VK_ESCAPE,VK_RETURN])) and
     (not ((Ord(Key) =3) and ((GetKeyState(VK_CONTROL) and $80) = $80))) then
  begin
    if Strings.Count = 0 then
      Strings.Assign(Items);
    for I := 1 to 8-Items.Count do
      Items.Add('');
    if not DroppedDown then
      DroppedDown := True;
  end;
  inherited;
end;

procedure TAutoListComboBox.SetStrings(Strs: TStrings);
var
  I: Integer;
begin
  Strings.BeginUpdate;
  Strings.Clear;
  for I := 0 to Strs.Count-1 do
    Strings.Add(Strs[I]);
  Strings.EndUpdate;
end;

end.
