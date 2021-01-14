unit NewVMUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TntStdCtrls, Spin;

type
  TNewVM = class(TForm)
    GroupBox1: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    VMName: TEdit;
    Label2: TLabel;
    SE: TSpinEdit;
    SE2: TSpinEdit;
    Label17: TTntLabel;
    Label19: TTntLabel;
    DType: TTntComboBox;
    TntLabel1: TTntLabel;
    OpSys: TTntComboBox;
    GB: TTntLabel;
    TntLabel2: TTntLabel;
    CB: TComboBox;
    procedure SE2Change(Sender: TObject);
    procedure OpSysChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NewVM: TNewVM;

implementation

uses MainUnit;

{$R *.dfm}

procedure TNewVM.SE2Change(Sender: TObject);
var
I,j :LongInt;
begin
I := SE2.Value;
j := I div 1000;
GB.caption := 'MB. ('+IntTOstr(j)+' GB)';
end;

procedure TNewVM.OpSysChange(Sender: TObject);
var
CC : Boolean;
begin
CC := false;
IF OPSys.ItemIndex > - 1 Then
  Begin
  If Main.OpSysDB.IsEmpty = False Then
    Begin
    Main.OpSysDB.First;
    Repeat
    If OpSys.Text = Main.OpsysDBName.Text Then
      Begin
      SE.Text := Main.OpSysDBRam.Text;
      SE2.Text := Main.OpSysDBDisk.Text;
      CB.ItemIndex := StrToInt(Main.OpSysDBIndex.Text);
      CC := True;
      End Else Main.OpSysDB.Next;
    Until (Main.OpSysDB.EOF = True) or (CC = True);
    End;
  End;

end;

procedure TNewVM.FormShow(Sender: TObject);
var
SL : TStringList;
j : Integer;
begin
Main.QMVersDB.First;
CB.Clear;
If Main.QMVersDB.IsEmpty = false Then
  Begin
  SL := TStringList.Create;
  Repeat
  If Main.QMVersDBDefault.Text = 'Yes' Then CB.Items.Add(Main.QMversDBDesc.text) Else SL.Add(Main.QMVersDBDesc.Text);
  Main.QMversDB.Next;
  Until Main.QMVersDB.EOF = True;
  IF SL.Count > 0 Then
  For J := 0 To SL.Count-1 Do CB.Items.Add(SL.Strings[j]);
  CB.ItemIndex := 0;
  SL.Free;
  End;
VMName.SetFocus;
end;
end.
