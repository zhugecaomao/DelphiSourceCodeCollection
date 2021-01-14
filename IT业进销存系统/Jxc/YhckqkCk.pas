unit YhckqkCk;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, CheckLst, dbgrids, ExtCtrls, Mask, DBCtrls, ComCtrls,
  DB, DBClient;

type
  TfrmYhckqkCk = class(TForm)
    btnCloseTs: TButton;
    Bevel1: TBevel;
    Label18: TLabel;
    Label19: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label111: TLabel;
    Label7: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnCloseTsClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    intID: integer;
  end;

var
  frmYhckqkCk: TfrmYhckqkCk;

implementation

uses ComFun, Common;

{$R *.DFM}

procedure TfrmYhckqkCk.FormShow(Sender: TObject);
begin
  with CurDs do
  begin
    CommandText :=
      'select Z.*, ZC.MC as aZCZHMC, ZR.MC as aZRZHMC ' +
      'from YHCKQK Z, ZH ZC, ZH ZR, ' +
      'Z left join ZC on Z.ZCZHID = ZC.ID, ' +
      'Z left join ZR on Z.ZRZHID = ZR.ID ' +
      'where Z.ID = ' + IntToStr(intID);
    Open;
    Label1.Caption := FieldByName('RQ').AsString;
    Label2.Caption := FieldByName('JSR').AsString;
    Label3.Caption := FieldByName('aZCZHMC').AsString;
    Label4.Caption := FieldByName('aZRZHMC').AsString;
    Label5.Caption := FieldByName('PH').AsString;
    Label6.Caption := FormatFloat('#,0.00', FieldByName('JE').AsFloat);
    Label7.Caption := FieldByName('BZ').AsString;
    Close;
  end;
end;

procedure TfrmYhckqkCk.btnCloseTsClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmYhckqkCk.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

end.
