unit UnitLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDialog, DsFancyButton, ExtCtrls, ComCtrls, MenuBar, ToolWin,
  StdCtrls, DB, DBTables;

type
  TfrmLogin = class(TBaseDialogFrm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    lblUserName: TLabel;
    Image1: TImage;
    Q: TQuery;
    procedure FormCreate(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
  private
    iCount:integer;
    sUserName,sPassWd:string;
    { Private declarations }
    function CheckPassWd:Boolean;
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

uses UnitData, UnitDM;

{$R *.dfm}

function TfrmLogin.CheckPassWd: Boolean;
begin
result:=false;
if (Edit2.Text=sPassWd)and(Edit1.Text<>'') then
    result:=true;
sOperator:=Edit1.Text;

end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  inherited;
self.Caption:='登录';
Edit1.Text:='';
Edit2.Text:='';
iCount:=0;
end;

procedure TfrmLogin.OKBtnClick(Sender: TObject);
begin
  inherited;
if not CheckPassWd then
begin
    Msgs('密码不正确，请重新录入。,您还有'+IntToStr(2-iCount)+'机会。');
    Edit2.Text:='';
    inc(iCount);
    if iCount>2 then
    begin
        self.ModalResult:=mrCancel;
        Msgs('对不起，您无权登录此系统。');
        Close;
    end;
end else
    self.ModalResult:=mrOk;


end;

procedure TfrmLogin.CancelBtnClick(Sender: TObject);
begin
  inherited;
    self.ModalResult:=mrCancel;

end;

procedure TfrmLogin.Edit1Exit(Sender: TObject);
begin
  inherited;
Q.Close;
Q.SQL.Text:='select OPERATOR_MC,PASSWD,WARRANT,BH from T_OPERATOR '
    +'WHERE OPERATOR_BH='+QuotedStr(Edit1.Text);
Q.Open;
if Q.RecordCount=0 then
begin
    Msgs('对不起，没有该用户。');
    Edit1.Text:='';
    Edit1.SetFocus;
end else
begin
    sUserName:=Q.FieldByName('OPERATOR_MC').AsString;
    sPassWd:=Q.FieldByName('PASSWD').AsString;
    sWarrant:=Q.FieldByName('WARRANT').AsString;
    sWorker:=Q.FieldByName('BH').AsString;
    lblUserName.Caption:=sUserName;
    Edit2.Text:='';
    Edit2.SetFocus;
end;
end;

procedure TfrmLogin.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
if Key=#13 then
    Edit2.SetFocus;
end;

procedure TfrmLogin.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
if Key=#13 then
    OKBtnClick(nil);
end;

end.
