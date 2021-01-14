unit LastRunUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TLastRunFrm = class(TForm)
    GroupBox1: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Button3 : Tbutton;
    LR: TMemo;
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LastRunFrm: TLastRunFrm;

implementation
Uses MainUnit;

{$R *.dfm}

procedure TLastRunFrm.Button3Click(Sender: TObject);
begin
LR.SelectAll;
LR.CopyToClipboard;
LR.SelLength := 0;
MessageDlg('Copy Complete',MtInformation,[MBOK],0);
end;

end.
