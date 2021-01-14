unit OpSysUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ExtCtrls, TntComCtrls,IniFiles, StdCtrls;

type
  TOpsys = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TV: TTntTreeView;
    Splitter1: TSplitter;
    Label1: TLabel;
    PC2: TPageControl;
    TabSheet2: TTabSheet;
    HLV: TTntListView;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    procedure FormShow(Sender: TObject);
    procedure TVClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
  Procedure RetrieveOpSysInfo(Name : string; Index : Integer);
  Procedure CalcOpSys;
    { Public declarations }
  end;

var
  Opsys: TOpsys;

implementation
Uses MainUnit, NewOpsysUnit;
{$R *.dfm}


Procedure TOpSys.CalcOpsys;
var
i,j : Integer;
Begin
TV.Items.Clear;
if(TV.Items.Count = 0) then
  begin
  with TV.Items.AddFirst(nil,'Operating Systems') do
	  begin
    Selected := true;
    end;
  end
else Exit;
If Main.OpSysDB.ISEmpty = False Then
  Begin
  Main.OpSysDB.First;
  Repeat
  with tv.Items.AddChildFirst(TV.Selected,Main.OpSysDBName.Text) do
    Begin
    ImageIndex := 0;
    SelectedIndex := 0;
    MakeVisible;
    End;
  Main.OpSysDB.Next;
  Until Main.OpSysDB.EOF = True;
  TV.Refresh;
  End;
End;


Procedure TOpSys.RetrieveOpSysInfo(Name : string; Index : Integer);
var
I,j : Integer;
ListItem : TTNTListItem;
S : String;
Begin
PC2.Visible := true;
If Main.OpSysDB.IsEmpty = false Then
  Begin
  Main.OpSysDB.First;
  Repeat
  If Main.OpSysDBName.Text = Tv.Selected.Text Then
    Begin
    HLV.Clear;
    ListItem := HLV.Items.Add; Listitem.Caption := 'Operating System Name'; ListItem.SubItems.Add(TV.Selected.Text);  ListItem.ImageIndex := 0;
    ListItem := HLV.Items.Add; Listitem.Caption := 'RAM'; ListItem.SubItems.Add(Main.OpSysDBRam.Text);  ListItem.ImageIndex := 2;
    ListItem := HLV.Items.Add; Listitem.Caption := 'Hard Disk Size'; ListItem.SubItems.Add(Main.OpsysDBDisk.Text);ListItem.ImageIndex := 16;
//    ListItem := HLV.Items.Add; Listitem.Caption := 'Machine Type'; ListItem.SubItems.Add(Main.OpSysDBhardware.Text);ListItem.ImageIndex := 28;
    End;
  Main.OpsysDB.Next;
  Until Main.OpSYSDB.EOF = True;
  End;
End;


procedure TOpsys.FormShow(Sender: TObject);
begin
CalcOpSys;
end;

procedure TOpsys.TVClick(Sender: TObject);
begin

if Tv.selected.text= 'Operating Systems' Then PC2.Visible := false Else
  Begin
  RetrieveOpSysInfo(tv.Selected.Text,tv.selected.Index);
  End;

end;

procedure TOpsys.ToolButton1Click(Sender: TObject);
begin
With NewOpSys Do
  Begin
  Name.Text := ''; Ram.Text := '128'; Drive.Text := '1000';
  showModal;
  If ModalResult = MROk Then
    Begin
    Main.OpSysDB.Insert;
    Main.OpSysDBName.Text := Name.Text;
    Main.OpSysDBRam.Text := Ram.Text;
    Main.OpSysDBDisk.Text := Drive.Text;
//    main.OpSysDBHardware.Text := CB.Text;
//    Main.OpSysDBIndex.Text := IntToStr(CB.ItemIndex);
    Main.OpSysDB.Post;
    End;
  CalcOpSys;
  PC2.Visible := false;
  End;

end;

procedure TOpsys.ToolButton2Click(Sender: TObject);
var
cc : Boolean;
begin
if MessageDlg('Are you sure you wish to delete this operating system definition ?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
  CC := False;
  If Main.OpSysDB.IsEmpty = False Then
    Begin
    Main.OpsysDB.First;
    Repeat
    If Main.OpSysDBName.Text = Tv.Selected.Text Then
      Begin
      Main.OpSysDB.Delete;
      CC := True
      End Else Main.OpsysDB.Next;
    Until (Main.OpSYSDB.EOF = True) or (CC = True);
    CalcOpsys;
    PC2.Visible := False;
    End;
  End;
end;

procedure TOpsys.ToolButton3Click(Sender: TObject);
var
i,j : Integer;
cc : Boolean;
Begin
With NewOpSys Do
  Begin
  IF PC2.Visible = True Then
    Begin
    Main.OpSysDB.First;
    CC := False;
    If Main.OpSysDB.IsEmpty = False Then
      Begin
      Repeat
      If Main.OpSysDBName.Text = tv.Selected.text Then CC := True Else Main.OpSysDB.Next;
      Until (Main.OpSysDB.EOF = True) or (CC = True);
      End;
    If CC = True Then
      Begin
      Name.Text := ''; Ram.Text := '128'; Drive.Text := '1000';
      Name.Text := Main.OpSysDBName.Text;
      Ram.Text := Main.OpSysDBRam.Text;
      Main.OpSysDBDisk.Text := Drive.Text;
      showModal;
      If ModalResult = MROK Then
        Begin
        Main.OpSysDB.edit;
        Main.OpSysDBName.Text := Name.Text;
        Main.OpSysDBRam.Text := Ram.Text;
        Main.OpSysDBDisk.Text := Drive.Text;
        Main.OpSysDB.Post;
        End;
        CalcOpSys
      End;
    end;
end;
End;

end.


