unit QMVersUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, TntComCtrls, StdCtrls, ExtCtrls, ToolWin;

type
  TQemuVers = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Splitter1: TSplitter;
    Label1: TLabel;
    TV: TTntTreeView;
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
  Procedure CalcQVers;
  Procedure RetrieveQEMUInfo(Name : string; Index : Integer);
    { Public declarations }
  end;

var
  QemuVers: TQemuVers;

implementation
Uses MainUnit, AddNewQUnit;

{$R *.dfm}


Procedure TQemuVers.CalcQVers;
var
i,j : Integer;
Begin
TV.Items.Clear;
if(TV.Items.Count = 0) then
  begin
  with TV.Items.AddFirst(nil,'Qemu Versions') do
	  begin
    Selected := true;
    ImageIndex := 21;
    SelectedIndex := 21;
    end;
  end
else Exit;
If Main.QMVersDB.ISEmpty = False Then
  Begin
  Main.QMVersDB.First;
  Repeat
  with tv.Items.AddChildFirst(TV.Selected,Main.QMVersDBDesc.Text) do
    Begin
    ImageIndex := 21;
    SelectedIndex := 21;
    MakeVisible;
    End;
  Main.QMVersDB.Next;
  Until Main.QMVersDB.EOF = True;
  TV.Refresh;
  End;
End;


Procedure TQemuVers.RetrieveQEMUInfo(Name : string; Index : Integer);
var
I,j : Integer;
ListItem : TTNTListItem;
S : String;
Begin
PC2.Visible := true;
If Main.QMVersDB.IsEmpty = false Then
  Begin
  Main.QMVersDB.First;
  Repeat
  If Main.QMVersDBDesc.Text = Tv.Selected.Text Then
    Begin
    HLV.Clear;
    ListItem := HLV.Items.Add; Listitem.Caption := 'Description'; ListItem.SubItems.Add(TV.Selected.Text);  ListItem.ImageIndex := 27;
  //  ListItem := HLV.Items.Add; Listitem.Caption := 'Qemu Version'; ListItem.SubItems.Add(Main.QMVersDBVNO.Text);  ListItem.ImageIndex := 26;
    ListItem := HLV.Items.Add; Listitem.Caption := 'Filename'; ListItem.SubItems.Add(Main.QMVersDBEXE.Text);ListItem.ImageIndex := 16;
    ListItem := HLV.Items.Add; Listitem.Caption := 'Filename Path'; ListItem.SubItems.Add(Main.QMVersDBsubdir.Text);ListItem.ImageIndex := 5;
    ListItem := HLV.Items.Add; Listitem.Caption := 'Use Qemu Manager QEMU Client'; ListItem.SubItems.Add(Main.QMVersDBQMClient.Text);ListItem.ImageIndex := 55;
//    ListItem := HLV.Items.Add; Listitem.Caption := 'Use KQEMU Accelerator'; ListItem.SubItems.Add(Main.QMVersDBKQemu.Text);ListItem.ImageIndex := 10;
    ListItem := HLV.Items.Add; Listitem.Caption := 'Set As Default'; ListItem.SubItems.Add(Main.QMVersDBDefault.Text);ListItem.ImageIndex := 24;
    End;
  Main.QMVersDB.Next;
  Until Main.QMVersDB.EOF = True;
  End;
End;


procedure TQemuVers.FormShow(Sender: TObject);
begin
CalcQVers;
end;

procedure TQemuVers.TVClick(Sender: TObject);
begin

if Tv.selected.text= 'Qemu Versions' Then PC2.Visible := false Else
  Begin
  RetrieveQemuInfo(tv.Selected.Text,tv.selected.Index);
  End;


end;

procedure TQemuVers.ToolButton1Click(Sender: TObject);
begin
With NewQVersion Do
  Begin
  showModal;
  If ModalResult = MROK Then
    Begin
    Main.QMVersDB.Insert;
    Main.QMVersDBDesc.Text := name.text;
    Main.QMVersDBEXE.Text := fname.Text;
    Main.QMVersDBSubDir.Text := path.Text;
    If client.Checked = True Then Main.QMVersDBQMClient.Text := 'Yes' Else Main.QMVersDBQMClient.Text := 'No';
    Main.QMVersDBDefault.Text := 'No';
    Main.QMVersDB.Post;

    If default.checked = True then
      Begin
      Main.QMVersDB.First;
      Repeat
      If Main.QMVersDBDesc.Text = Name.Text Then
        Begin
        Main.QMVersDB.Edit;
        Main.QMVersDBDefault.Text := 'Yes';
        Main.QMVersDB.Post;
        End
      Else
        Begin
        Main.QMVersDB.Edit;
        Main.QMVersDBDefault.Text := 'No';
        Main.QMVersDB.Post;
        End;
      Main.QMVersDB.Next;
      Until Main.QMVersDB.EOF = true;
      End;
    CalcQVers;
    End;
  End;

end;

procedure TQemuVers.ToolButton2Click(Sender: TObject);
var
cc : Boolean;
begin
if MessageDlg('Are you sure you wish to delete this Qemu Version definition ?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
  CC := False;
  If Main.QMVersDB.IsEmpty = False Then
    Begin
    Main.QMVersDB.First;
    Repeat
    If Main.QMVersDBDesc.Text = Tv.Selected.Text Then
      Begin
      Main.QMVersDB.Delete;
      CC := True
      End Else Main.QMVersDB.Next;
    Until (Main.QMVersDB.EOF = True) or (CC = True);
    CalcQVers;
    PC2.Visible := False;
    End;
  End;
end;

procedure TQemuVers.ToolButton3Click(Sender: TObject);
var
i,j : Integer;
cc : Boolean;
Begin
With NewQVersion Do
  Begin
  IF PC2.Visible = True Then
    Begin
    Main.QMVersDB.First;
    CC := False;
    If Main.QMVersDB.IsEmpty = False Then
      Begin
      Repeat
      If Main.QMVersDBDesc.Text = tv.Selected.text Then CC := True Else Main.QMVersDB.Next;
      Until (Main.QMVersDB.EOF = True) or (CC = True);
      End;
    If CC = True Then
      Begin
      Name.text := Main.QMVersDBDesc.Text;
      fname.text := Main.QMVersDBEXE.Text;
      path.text := Main.QMVersDBSUBDIR.Text;
      IF Main.QMVersDBQMClient.Text = 'Yes' Then client.checked := true Else Client.Checked := false;
      if Main.QMVersDBDefault.Text = 'Yes' Then default.checked := True else Default.checked := false;
      showModal;
      If ModalResult = MROK Then
        Begin
        Main.QMVersDB.edit;
        Main.QMVersDBDesc.Text := name.text;
        Main.QMVersDBEXE.Text := fname.Text;
        Main.QMVersDBSubDir.Text := path.Text;
        If client.Checked = True Then Main.QMVersDBQMClient.Text := 'Yes' Else Main.QMVersDBQMClient.Text := 'No';
        Main.QMVersDBDefault.Text := 'No';
        Main.QMVersDB.Post;
          If default.checked = True then
           Begin
          Main.QMVersDB.First;
          Repeat
          If Main.QMVersDBDesc.Text = Name.Text Then
            Begin
            Main.QMVersDB.Edit;
            Main.QMVersDBDefault.Text := 'Yes';
            Main.QMVersDB.Post;
            End
          Else
            Begin
            Main.QMVersDB.Edit;
            Main.QMVersDBDefault.Text := 'No';
            Main.QMVersDB.Post;
            End;
          Main.QMVersDB.Next;
          Until Main.QMVersDB.EOF = true;
          End;
        CalcQVers;
        End;
      End;
    end;
end;
End;
end.

