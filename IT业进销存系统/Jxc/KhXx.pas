unit KhXx;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, CheckLst, dbgrids, ExtCtrls, Mask, DBCtrls, ComCtrls,
  DB, DBClient;

type
  TfrmKhXx = class(TForm)
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
    procedure FormShow(Sender: TObject);
    procedure btnCloseTsClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    intKHID: integer;
  end;

var
  frmKhXx: TfrmKhXx;

implementation

uses ComFun, Common;

{$R *.DFM}

procedure TfrmKhXx.FormShow(Sender: TObject);
begin
  with CurDs do
  begin
    CommandText := 'select * from KH where ID = ' + Float2Str(intKHID);
    Open;
    Label1.Caption := FieldByName('QC').AsString;
    Label2.Caption := FieldByName('DZ').AsString;
    Label3.Caption := FieldByName('DH').AsString;
    Label4.Caption := FieldByName('NSH').AsString;
    Label5.Caption := FieldByName('KHYH').AsString;
    Label6.Caption := FieldByName('YHZH').AsString;
    Close;
  end;
end;

procedure TfrmKhXx.btnCloseTsClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmKhXx.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

end.
