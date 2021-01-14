unit duCustomGridProperties;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, TypInfo, tsGrid, Registry
  {$IFDEF TSVER_V6}, Variants {$ENDIF};

type
  TdgCustomGridProperties = class(TForm)
    Panel1: TPanel;
    btOk: TButton;
    btCancel: TButton;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Panel3: TPanel;
    Label1: TLabel;
    gbGridProperties: TGroupBox;
    lbGridProperties: TListBox;
    lbCustomProperties: TListBox;
    Label2: TLabel;
    Panel4: TPanel;
    btPick: TButton;
    btUnpick: TButton;
    procedure btPickClick(Sender: TObject);
    procedure btUnpickClick(Sender: TObject);
    procedure lbGridPropertiesDblClick(Sender: TObject);
    procedure lbCustomPropertiesDblClick(Sender: TObject);
  private
    { Private declarations }
    FGrid : TtsBaseGrid;

    procedure SaveCustomProperties;
    procedure LoadGridProperties;
    procedure LoadCustomProperties;
    procedure AddProperty;
    procedure RemoveProperty;
  public
    { Public declarations }
    procedure Edit(aGrid : TtsBaseGrid);
  end;

var
  dgCustomGridProperties: TdgCustomGridProperties;

implementation

{$R *.dfm}

procedure TdgCustomGridProperties.Edit(aGrid : TtsBaseGrid);
begin
  FGrid := aGrid;
  LoadCustomProperties;
  LoadGridProperties;
  if ShowModal = mrOk then
     SaveCustomProperties;
end;

procedure TdgCustomGridProperties.LoadGridProperties;
var
  PropertyIndex,
  PropertyCount : Integer;
  PropList      : TPropList;
  sName : String;
begin
  lbGridProperties.Items.Clear;
  PropertyCount := GetPropList(FGrid.ClassInfo, tkProperties, @PropList) ;
  for PropertyIndex := 0 to PropertyCount -1 do
  begin
    sName := PropList[PropertyIndex].Name;
    if lbCustomProperties.Items.IndexOf(sName) = -1 then
       lbGridProperties.Items.Add(sName);
  end;
end;

procedure TdgCustomGridProperties.LoadCustomProperties;
var Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    Reg.OpenKey('\Software\ObjectSight\TopGrid\CustomGridProperties', True);
    lbCustomProperties.Items.CommaText := Reg.ReadString('CustomGridProperties');
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
end;

procedure TdgCustomGridProperties.SaveCustomProperties;
var Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    Reg.OpenKey('\Software\ObjectSight\TopGrid\CustomGridProperties', True);
    Reg.WriteString('CustomGridProperties', lbCustomProperties.Items.CommaText);
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
end;

procedure TdgCustomGridProperties.AddProperty;
var i : integer;
begin
  if lbGridProperties.ItemIndex >= 0 then
  begin
    lbCustomProperties.ItemIndex := lbCustomProperties.Items.Add(lbGridProperties.Items[lbGridProperties.ItemIndex]);
    i := lbGridProperties.ItemIndex;
    lbGridProperties.Items.Delete(i);
    if i < lbGridProperties.Items.Count then
       lbGridProperties.ItemIndex := i
    else
       lbGridProperties.ItemIndex := i - 1;
  end;
end;

procedure TdgCustomGridProperties.RemoveProperty;
var i : integer;
begin
  if lbCustomProperties.ItemIndex >= 0 then
  begin
    lbGridProperties.ItemIndex := lbGridProperties.Items.Add(lbCustomProperties.Items[lbCustomProperties.ItemIndex]);
    i := lbCustomProperties.ItemIndex;
    lbCustomProperties.Items.Delete(i);
    if i < lbCustomProperties.Items.Count then
       lbCustomProperties.ItemIndex := i
    else
       lbCustomProperties.ItemIndex := i - 1;
  end;
end;

procedure TdgCustomGridProperties.btPickClick(Sender: TObject);
begin
  AddProperty;
end;

procedure TdgCustomGridProperties.btUnpickClick(Sender: TObject);
begin
  RemoveProperty;
end;

procedure TdgCustomGridProperties.lbGridPropertiesDblClick(
  Sender: TObject);
begin
  AddProperty;
end;

procedure TdgCustomGridProperties.lbCustomPropertiesDblClick(
  Sender: TObject);
begin
  RemoveProperty;
end;

end.
