unit duCustomMasks;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, TsCommon, Registry
  {$IFDEF TSVER_V6}, Variants {$ENDIF};

type
  TdgCustomMasks = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    btOk: TButton;
    btCancel: TButton;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Panel4: TPanel;
    btPick: TButton;
    btUnpick: TButton;
    lbKnownMasks: TListBox;
    lbCustomMasks: TListBox;
    procedure btPickClick(Sender: TObject);
    procedure lbKnownMasksDblClick(Sender: TObject);
    procedure btUnpickClick(Sender: TObject);
    procedure lbCustomMasksDblClick(Sender: TObject);
  private
    { Private declarations }
    FItems : TStringList;

  public
    { Public declarations }
    procedure RemoveMask;
    procedure AddMask;
    procedure SaveCustomMasks;
    procedure LoadCustomMasks;
    procedure LoadKnownMasks;
    procedure Edit(Items : TStrings);
  end;

var
  dgCustomMasks: TdgCustomMasks;

implementation

{$R *.dfm}

procedure TdgCustomMasks.Edit(Items : TStrings);
begin
  LoadCustomMasks;
  FItems := TStringList(Items);
  LoadKnownMasks;
  if ShowModal = mrOk then
     SaveCustomMasks;
end;

procedure TdgCustomMasks.LoadKnownMasks;
var i : Integer;
begin
  if FItems = Nil then exit;

  for i := 0 to FItems.Count - 1 do
  begin
    if (FItems.Objects[i] <> Nil) and
       (not TosMaskEntry(FItems.Objects[i]).System) then
    begin
      if lbCustomMasks.Items.IndexOf(TosMaskEntry(FItems.Objects[i]).Name) = -1 then
         lbKnownMasks.Items.AddObject(TosMaskEntry(FItems.Objects[i]).Name, FItems.Objects[i]);
    end;
  end;
end;


procedure TdgCustomMasks.LoadCustomMasks;
var Reg: TRegistry;
    sText, sMask : String;
    i, iLen : Integer;
    Mask : TosMaskEntry;

  procedure IncludeMask;
  begin
    Mask := TosMaskEntry.Create;
    Mask.StorageText := sMask;
    lbCustomMasks.Items.AddObject(Mask.Name, Mask);
    sMask := '';
  end;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    Reg.OpenKey('\Software\ObjectSight\TopGrid\CustomMasks', True);
    sText := Reg.ReadString('CustomMasks');
    iLen := Length(sText);
    i := 1;
    sMask := '';
    while (i <= iLen) do
    begin
      sMask := sMask + sText[i];
      if (sText[i] = #13) then
         IncludeMask;
      Inc(i);
    end;
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
end;

procedure TdgCustomMasks.SaveCustomMasks;
var Reg: TRegistry;
    sText : String;
    i : Integer;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    Reg.OpenKey('\Software\ObjectSight\TopGrid\CustomMasks', True);
    sText := '';
    for i := 0 to lbCustomMasks.Items.Count - 1 do
      sText := sText + TosMaskEntry(lbCustomMasks.Items.Objects[i]).StorageText;
    Reg.WriteString('CustomMasks', sText);
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
end;

procedure TdgCustomMasks.btPickClick(Sender: TObject);
begin
  AddMask;
end;

procedure TdgCustomMasks.lbKnownMasksDblClick(Sender: TObject);
begin
  AddMask;
end;

procedure TdgCustomMasks.btUnpickClick(Sender: TObject);
begin
  RemoveMask;
end;

procedure TdgCustomMasks.lbCustomMasksDblClick(Sender: TObject);
begin
  RemoveMask;
end;

procedure TdgCustomMasks.AddMask;
var i : integer;
    Mask : TosMaskEntry;
begin
  if lbKnownMasks.ItemIndex >= 0 then
  begin
    Mask := TosMaskEntry(lbKnownMasks.Items.Objects[lbKnownMasks.ItemIndex]);
    lbCustomMasks.ItemIndex := lbCustomMasks.Items.AddObject(Mask.Name, Mask);
    i := lbKnownMasks.ItemIndex;
    lbKnownMasks.Items.Delete(i);
    if i < lbKnownMasks.Items.Count then
       lbKnownMasks.ItemIndex := i
    else
       lbKnownMasks.ItemIndex := i - 1;
  end;
end;

procedure TdgCustomMasks.RemoveMask;
var i : integer;
    mask : TosMaskEntry;
begin
  if lbCustomMasks.ItemIndex >= 0 then
  begin
    Mask := TosMaskEntry(lbCustomMasks.Items.Objects[lbCustomMasks.ItemIndex]);
    lbKnownMasks.ItemIndex := lbKnownMasks.Items.AddObject(Mask.Name, Mask);
    i := lbCustomMasks.ItemIndex;
    lbCustomMasks.Items.Delete(i);
    if i < lbCustomMasks.Items.Count then
       lbCustomMasks.ItemIndex := i
    else
       lbCustomMasks.ItemIndex := i - 1;
  end;
end;

end.
