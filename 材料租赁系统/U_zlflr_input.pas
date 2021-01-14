unit U_zlflr_input;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, Mask, DBCtrlsEh, DBLookupEh, DB,
  ADODB, DBCtrls;

type
  TfrmZlflr_input = class(TForm)
    Panel1: TPanel;
    btnSave: TSpeedButton;
    btnCancel: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    DBEditEh2: TDBEditEh;
    DBEditEh3: TDBEditEh;
    DBEditEh4: TDBEditEh;
    DBEditEh5: TDBEditEh;
    DBEditEh6: TDBEditEh;
    DBEditEh7: TDBEditEh;
    DBEditEh8: TDBEditEh;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    SpeedButton1: TSpeedButton;
    adoqytmp: TADOQuery;
    Label10: TLabel;
    DBEdit1: TDBEdit;
    procedure btnCancelClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBEditEh5Exit(Sender: TObject);
    procedure DBEditEh6Exit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    
  public
    { Public declarations }
  end;

var
  frmZlflr_input: TfrmZlflr_input;

implementation
     uses u_dm,u_Spbm_brw,u_public,utLeasehold,common, Main;
{$R *.dfm}
function datenumber(const no:string;ado:TADOQuery):string;
var
  sSql,sValue:string;
  nInt:integer;
begin
   strsql:='SELECT MAX(sfno) AS wfno FROM cljxb  WHERE(SUBSTRING(sfno,1,6)='+' '''+no+''')';
   ado.Close ;
   ado.SQL.Clear ;
   ado.SQL.Add(strsql);
   ado.Prepared ;
   ado.Open ;
   sValue:=trim(ado.Fields[0].asstring);
   if sValue<>'' then
   begin
      sSql:=TRIM(COPY(sValue,7,2));
      nInt:=strtoint(sSql)+1;
      result:=copy(sValue,1,6)+formatfloat('00',nInt);
   end else
      result:=no+'01';
end;

procedure TfrmZlflr_input.btnCancelClick(Sender: TObject);
begin
dm.ADO_CLJXB.CancelUpdates ;
close;
end;

procedure TfrmZlflr_input.btnSaveClick(Sender: TObject);
var
 sNumber,
 bmbh,
 strsql,
 sCl:string;
 dsinse:boolean;
begin
if length(dbediteh2.Text)=0 then
begin
 Application.MessageBox('材料编码不为空！', '提示信息', mb_iconInformation + mb_defbutton1);
 exit;
end;
if length(DBLookupComboboxEh1.Text)=0 then
begin
 Application.MessageBox('部门不为空!', '提示信息', mb_iconInformation + mb_defbutton1);
 exit;
end;

if (length(dbediteh6.Text)=0) or (length(dbediteh8.Text)=0) then
begin
 Application.MessageBox('材料的数量和累计金额不为空!', '提示信息', mb_iconInformation + mb_defbutton1);
 exit;
end;

if dm.ADO_CLJXB.State =dsinsert then
     dsinse:=false
else
     dsinse:=true;
sCl:=trim(DBEditEh2.Text);
bmbh:=TRIM(dm.ADO_CLJXB.Fieldbyname('bmbh').AsString) ;
if not CurrentParam.blnADD  then
begin
strsql:='SELECT * FROM cljxb ';
strsql:=strsql+'  WHERE (CLJXB.SPBH='+''''+sCl+''')';
strsql:=strsql+'  AND (cljxb.bmbh='+''''+bmbh+''')';
strsql:=strsql+'  AND (ynqc=1)';
 with adoqytmp do
 begin
 Close ;
 SQL.Clear ;
 SQL.Add(strsql);
 Prepared :=true;
 Open ;
 if RecordCount>0 then
 begin
 Application.MessageBox('项目部和材料的期初数已存在请重新输入新的期初数量!', '提示信息', mb_iconInformation + mb_defbutton1);
 exit;
 end;
 end;
 end;
sNumber:=DBDateTimeEditEh1.Text;
sNumber:=COPY(sNumber,1,4)+COPY(sNumber,6,2);
sNumber:=datenumber(sNumber,frmmain.adoqytmp) ;
if dm.ADO_CLJXB.State =dsinsert then
   dm.ADO_CLJXB.FieldByName('sfno').AsString :=sNumber
else
   sNumber:=dm.ADO_CLJXB.FieldByName('sfno').AsString;
dm.ADO_CLJXB.FieldByName('money').AsFloat :=strtofloat(trim(dbedit1.Text));
dm.ADO_CLJXB.FieldByName('JSJE').AsFloat :=strtofloat(trim(dbediteh8.Text));

try
dm.ADO_CLJXB.Post ;
except
dm.ADO_CLJXB.Cancel ;
end;
bmbh:=trim(dm.ADO_CLJXB.Fieldbyname('bmbh').AsString) ;
strsql:='update cljxb set money=:@money where sfno=:@sfno';
with adoqytmp do
begin
 Close ;
 SQL.Clear ;
 SQL.Add(strsql);

 Parameters.ParamByName('@sfno').Value :=sNumber;
 Parameters.ParamByName('@money').Value :=strtofloat(trim(dbedit1.Text));
 Prepared :=true;
 ExecSQL ;
end;
if CurrentParam.bl=0 then
   CurrentParam.bl:=1;

if not dsinse then
begin
//更新 sfdj表
 strsql:='INSERT INTO SFDJ(sfno, djzy, dj, fcsl, fczj, sfrq, bmbh, spbh, ynsf, ynjs, ynqc,fhr)';
 strsql:=strsql+'VALUES(:sfno, :djzy, :dj, :fcsl, :fczj, :sfrq,:bmbh,:spbh, 0, 1, 1,:fhr)';
 with adoqytmp do
 begin
 Close ;
 SQL.Clear ;
 SQL.Add(strsql);
 Parameters.ParamByName('sfno').Value :=sNumber;
 Parameters.ParamByName('dj').Value :=strtofloat(DBEditEh5.Text);
 Parameters.ParamByName('fcsl').Value :=strtofloat(DBEditEh6.Text)/CurrentParam.bl;
 Parameters.ParamByName('fczj').Value :=strtofloat(DBEditEh8.Text);
 Parameters.ParamByName('sfrq').Value :=strtodatetime(DBDateTimeEditEh1.Text);
 Parameters.ParamByName('bmbh').Value :=trim(bmbh);
 Parameters.ParamByName('spbh').Value :=trim(DBEditEh2.Text);
 Parameters.ParamByName('fhr').Value :=CurrentParam.UserName ;  //"期初"
 Parameters.ParamByName('DJZY').Value :='期初';
 Prepared :=true;
 ExecSQL ;
 end;
end;
close;
//{SELECT sfno, ynqc, djzy, dj, fcsl, fczj, sfrq, bmbh, spbh, ynsf, ynjs FROM sfdj}
end;

procedure TfrmZlflr_input.FormCreate(Sender: TObject);
begin
dm.ADO_BMBMK.Active :=true;
if dm.ADO_CLJXB.State =dsinsert then
   dm.ADO_CLJXB.FieldByName('sdate').Value :=date;  

end;

procedure TfrmZlflr_input.SpeedButton1Click(Sender: TObject);
begin
dm.ADO_SPBMK_INDEX.Active :=true;
ShowModalForm(TfrmSpbm_brw);
if CurrentParam.tmpFind then
begin
  dm.ADO_CLJXB.FieldByName('spbh').AsString :=dm.ADO_SPBMK_INDEX.Fieldbyname('spbh').AsString ;
  dm.ADO_CLJXB.FieldByName('spmc').AsString :=dm.ADO_SPBMK_INDEX.Fieldbyname('spmc').AsString ;
  dm.ADO_CLJXB.FieldByName('jldw').AsString :=dm.ADO_SPBMK_INDEX.Fieldbyname('jldw').AsString ;
  dm.ADO_CLJXB.FieldByName('spdj').AsFloat :=dm.ADO_SPBMK_INDEX.Fieldbyname('spdj').AsFloat;
  CurrentParam.bl:=dm.ADO_SPBMK_INDEX.Fieldbyname('hsbl').AsFloat;
end;
dm.ADO_SPBMK_INDEX.Active :=false;
end;

procedure TfrmZlflr_input.DBEditEh5Exit(Sender: TObject);
begin
//dm.ADO_CLJXB.FieldByName('money').AsFloat :=dm.ADO_CLJXB.FieldByName('spdj').AsFloat*dm.ADO_CLJXB.FieldByName('fcsl').AsFloat*dm.ADO_CLJXB.FieldByName('zlts').AsFloat ;
end;

procedure TfrmZlflr_input.DBEditEh6Exit(Sender: TObject);
begin
//dm.ADO_CLJXB.FieldByName('money').AsFloat :=dm.ADO_CLJXB.FieldByName('spdj').AsFloat*dm.ADO_CLJXB.FieldByName('fcsl').AsFloat*dm.ADO_CLJXB.FieldByName('zlts').AsFloat ;
end;

procedure TfrmZlflr_input.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
dm.ADO_BMBMK.Close ;
end;

end.
