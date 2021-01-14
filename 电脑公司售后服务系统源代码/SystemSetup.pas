unit SystemSetup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TFlatEditUnit, ExtCtrls, TFlatPanelUnit,
  TFlatButtonUnit, TFlatTitlebarUnit, DB, ADODB, ComCtrls;

type
  TFrmSystemSetup = class(TForm)
    SystemSetupTitle: TFlatTitlebar;
    BtnExit: TFlatButton;
    Panel1: TFlatPanel;
    BtnOk: TFlatButton;
    BtnExit1: TFlatButton;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    PageControl1: TPageControl;
    Tab_basicInfo: TTabSheet;
    Tab_CNInfo: TTabSheet;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    EditInc: TFlatEdit;
    EditAddr: TFlatEdit;
    EditPhone: TFlatEdit;
    EditFax: TFlatEdit;
    EditWeb: TFlatEdit;
    Label6: TLabel;
    EditPhone1: TFlatEdit;
    EditMail: TFlatEdit;
    Label7: TLabel;
    Panel3: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    EditCN1: TFlatEdit;
    EditCN2: TFlatEdit;
    EditCN3: TFlatEdit;
    Label11: TLabel;
    Label12: TLabel;
    procedure BtnExitClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
  private
    { Private declarations }
    procedure DBConnection;
    procedure WriteIncInfo;
    Procedure readIncInfo;
  public
    { Public declarations }
  end;

var
  FrmSystemSetup: TFrmSystemSetup;

implementation

uses global, Reg;

{$R *.dfm}

procedure TFrmSystemSetup.BtnExitClick(Sender: TObject);
begin
close;
end;

procedure TFrmSystemSetup.DBConnection;
var
  DataPath:string;
begin
  if ADOConnection1.Connected then ADOConnection1.Close;
  //防止被重复打开而导到数据连接错误

  DataPath:=ExtractFilePath(Application.ExeName)+'Data\mgr.db';
  {登录加密的数据库}

  ADOConnection1.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+DataPath+';

  ADOConnection1.Open();

end;

procedure TFrmSystemSetup.FormActivate(Sender: TObject);
begin
readIncInfo;
if checkreg=0 then
  begin
    EditInc.Text :='未注册版本';
  end
  else
    EditInc.Text :=tempInc;

end;

procedure TFrmSystemSetup.FormCreate(Sender: TObject);
begin
  EditAddr.Clear; EditPhone.Clear; EditFax.Clear; Editweb.Clear;EditMail.Clear;EditPhone1.Clear;
  EditCn1.Clear;  EditCn2.Clear;  Editcn3.Clear;
end;

procedure TFrmSystemSetup.readIncInfo;
begin
DBConnection;
ADOQuery1.Close;
ADOQuery1.SQL.Clear;
ADOQuery1.SQL.Text :='select * from inc';
ADOQuery1.Open ;
if ADOQuery1.FieldValues['addr']<> null then
  EditAddr.Text :=ADOQuery1.FieldValues['addr'];
if ADOQuery1.FieldValues['phone']<> null then
  EditPhone.Text :=ADOQuery1.FieldValues['phone'];
if ADOQuery1.FieldValues['phone1']<> null then
  EditPhone1.Text :=ADOQuery1.FieldValues['phone1'];
if ADOQuery1.FieldValues['Fax']<> null then
  EditFax.Text :=ADOQuery1.FieldValues['Fax'];
if ADOQuery1.FieldValues['Mail']<> null then
  EditMail.Text :=ADOQuery1.FieldValues['Mail'];
if ADOQuery1.FieldValues['web']<> null then
  EditWeb.Text :=ADOQuery1.FieldValues['web'];

if ADOQuery1.FieldValues['cn1']<> null then
  Editcn1.Text :=ADOQuery1.FieldValues['cn1'];
if ADOQuery1.FieldValues['cn2']<> null then
  Editcn2.Text :=ADOQuery1.FieldValues['cn2'];
if ADOQuery1.FieldValues['cn3']<> null then
  Editcn3.Text :=ADOQuery1.FieldValues['cn3'];
ADOQuery1.Close;

end;

procedure TFrmSystemSetup.WriteIncInfo;
begin
DBConnection;
ADOQuery1.Close;
ADOQuery1.SQL.Clear;
ADOQuery1.SQL.Text :='select * from inc';
ADOQuery1.Open ;
ADOQuery1.Edit;
ADOQuery1.FieldByName('name').AsString :=EditInc.Text ;
ADOQuery1.FieldByName('addr').AsString :=EditAddr.Text ;
ADOQuery1.FieldByName('Phone').AsString :=EditPhone.Text ;
ADOQuery1.FieldByName('Phone1').AsString :=EditPhone1.Text ;
ADOQuery1.FieldByName('Fax').AsString :=EditFax.Text ;
ADOQuery1.FieldByName('Mail').AsString :=EditMail.Text;
ADOQuery1.FieldByName('Web').AsString :=EditWeb.Text;
ADOQuery1.FieldByName('cn1').AsString :=EditCn1.Text ;
ADOQuery1.FieldByName('cn2').AsString :=EditCn2.Text ;
ADOQuery1.FieldByName('cn3').AsString :=EditCn3.Text ;
ADOQuery1.Post;
ADOQuery1.Close;
end;

procedure TFrmSystemSetup.BtnOkClick(Sender: TObject);
begin
if checkreg=1 then
  begin
    writeIncInfo;
    showmessage('数据己写入成功！');
  end
  else
  begin
    messagebox(handle,PChar('您是未注册用户，不能使用本功能！'),Pchar('数据写入失败'),mb_Ok+MB_ICONERROR);
    FrmRegistry.showmodal;
  end;
end;

end.
