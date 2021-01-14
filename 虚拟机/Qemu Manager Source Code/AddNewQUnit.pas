unit AddNewQUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, TntStdCtrls, Buttons, TntDialogs;

type
  TNewQVersion = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Name: TEdit;
    Button1: TButton;
    Button2: TButton;
    Label3: TLabel;
    fname: TEdit;
    Label4: TLabel;
    path: TEdit;
    client: TCheckBox;
    default: TCheckBox;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    OD: TTntOpenDialog;
    OD2: TOpenDialog;
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NewQVersion: TNewQVersion;

implementation

uses SelQPathUnit,MainUnit;

{$R *.dfm}

procedure TNewQVersion.SpeedButton3Click(Sender: TObject);
var
s : string;
begin
If OD.Execute = True Then
  Begin
  fname.text := ExtractFileName(OD.Filename);
  Path.Text  := ExtractFileDir(OD.Filename);
  End;
end;

procedure TNewQVersion.SpeedButton2Click(Sender: TObject);
Begin
With SelQ Do
  Begin
  ShowModal;
  If ModalResult = MROK Then
    Begin
    fname.text := ExtractFileName(fl.FileName);
    path.Text := '{QM}\qemu\'+TV.Selected.Text;
    End;
  End;

end;

end.
