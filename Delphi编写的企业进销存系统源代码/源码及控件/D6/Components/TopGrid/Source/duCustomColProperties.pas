unit duCustomColProperties;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, TypInfo, tsGrid, Registry
  {$IFDEF TSVER_V6}, Variants {$ENDIF};

type
  TdgCustomColProperties = class(TForm)
    Panel1: TPanel;
    btOk: TButton;
    btCancel: TButton;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Panel3: TPanel;
    Label1: TLabel;
    gbColProperties: TGroupBox;
    lbColProperties: TListBox;
    lbCustomColProperties: TListBox;
    Label2: TLabel;
    Panel4: TPanel;
    btPick: TButton;
    btUnpick: TButton;
    procedure btPickClick(Sender: TObject);
    procedure btUnpickClick(Sender: TObject);
    procedure lbColPropertiesDblClick(Sender: TObject);
    procedure lbCustomColPropertiesDblClick(Sender: TObject);
  private
    { Private declarations }
    FCol : TtsCol;

    procedure SaveCustomProperties;
    procedure LoadColProperties;
    procedure LoadCustomProperties;
    procedure AddProperty;
    procedure RemoveProperty;
  public
    { Public declarations }
    procedure Edit(aCol : TtsCol);
  end;

var
  dgCustomColProperties: TdgCustomColProperties;

implementation

{$R *.dfm}

procedure TdgCustomColProperties.Edit(aCol : TtsCol);
begin
  FCol := aCol;
  LoadCustomProperties;
  LoadColProperties;
  if ShowModal = mrOk then
     SaveCustomProperties;
end;

procedure TdgCustomColProperties.LoadColProperties;
var
  PropertyIndex,
  PropertyCount : Integer;
  PropList      : TPropList;
  sName : String;
begin
  lbColProperties.Items.Clear;
  PropertyCount := GetPropList(FCol.ClassInfo, tkProperties, @PropList) ;
  for PropertyIndex := 0 to PropertyCount -1 do
  begin
    sName := PropList[PropertyIndex].Name;
    if lbCustomColProperties.Items.IndexOf(sName) = -1 then
       lbColProperties.Items.Add(sName);
  end;
end;

procedure TdgCustomColProperties.LoadCustomProperties;
var Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    Reg.OpenKey('\Software\ObjectSight\TopGrid\CustomColProperties', True);
    lbCustomColProperties.Items.CommaText := Reg.ReadString('CustomColProperties');
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
end;

procedure TdgCustomColProperties.SaveCustomProperties;
var Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    Reg.OpenKey('\Software\ObjectSight\TopGrid\CustomColProperties', True);
    Reg.WriteString('CustomColProperties', lbCustomColProperties.Items.CommaText);
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
end;

procedure TdgCustomColProperties.AddProperty;
var i : integer;
begin
  if lbColProperties.ItemIndex >= 0 then
  begin
    lbCustomColProperties.ItemIndex := lbCustomColProperties.Items.Add(lbColProperties.Items[lbColProperties.ItemIndex]);
    i := lbColProperties.ItemIndex;
    lbColProperties.Items.Delete(i);
    if i < lbColProperties.Items.Count then
       lbColProperties.ItemIndex := i
    else
       lbColProperties.ItemIndex := i - 1;
  end;
end;

procedure TdgCustomColProperties.RemoveProperty;
var i : integer;
begin
  if lbCustomColProperties.ItemIndex >= 0 then
  begin
    lbColProperties.ItemIndex := lbColProperties.Items.Add(lbCustomColProperties.Items[lbCustomColProperties.ItemIndex]);
    i := lbCustomColProperties.ItemIndex;
    lbCustomColProperties.Items.Delete(i);
    if i < lbCustomColProperties.Items.Count then
       lbCustomColProperties.ItemIndex := i
    else
       lbCustomColProperties.ItemIndex := i - 1;
  end;
end;

procedure TdgCustomColProperties.btPickClick(Sender: TObject);
begin
  AddProperty;
end;

procedure TdgCustomColProperties.btUnpickClick(Sender: TObject);
begin
  RemoveProperty;
end;

procedure TdgCustomColProperties.lbColPropertiesDblClick(
  Sender: TObject);
begin
  AddProperty;
end;

procedure TdgCustomColProperties.lbCustomColPropertiesDblClick(
  Sender: TObject);
begin
  RemoveProperty;
end;

end.
