unit Usltz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolWin, ComCtrls, ExtCtrls, Grids, DBGridEh, StdCtrls, Buttons,
  DBCtrlsEh, DBLookupEh, Mask, DB, ADODB, PrnDbgeh;

type
  TfrmSltz = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    StatusBar1: TStatusBar;
    btnAdd: TSpeedButton;
    btnSave: TSpeedButton;
    btnDele: TSpeedButton;
    btnClose: TSpeedButton;
    Panel1: TPanel;
    DBGridEh1: TDBGridEh;
    dtdate: TDBDateTimeEditEh;
    Label1: TLabel;
    Label2: TLabel;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    Label3: TLabel;
    DBEditEh2: TDBEditEh;
    SpeedButton1: TSpeedButton;
    Label4: TLabel;
    DBEditEh3: TDBEditEh;
    DBEditEh4: TDBEditEh;
    Label5: TLabel;
    DBEditEh6: TDBEditEh;
    Label7: TLabel;
    btnEdit: TSpeedButton;
    btnPrint: TSpeedButton;
    PrintDBGridEh1: TPrintDBGridEh;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnDeleClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnEditClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSltz: TfrmSltz;

implementation
   uses main,u_public,u_dm,common,utLeasehold,u_Spbm_brw;
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
procedure TfrmSltz.FormShow(Sender: TObject);
begin
{var
s_value:string;
begin
 //取出材料编码表值
cmbbm.Clear ;
dm.ADO_BMBMK.First ;
while not dm.ADO_BMBMK.Eof do
begin
    s_value:='['+trim(dm.ADO_BMBMK.Fieldbyname('bmbh').AsString)+']';
    s_value:=s_value+trim(dm.ADO_BMBMK.Fieldbyname('bmname').AsString);
    cmbbm.Items.Add(s_value);
  dm.ADO_BMBMK.Next ;
end;
dm.ADO_BMBMK.Close ;
}
end;

procedure TfrmSltz.FormCreate(Sender: TObject);
begin
LEFT:=0;
TOP:=0;
dm.ADO_CLJXB.Filter :='(yntz=1) and (money=0)' ;
dm.ADO_CLJXB.Filtered :=true;
dm.ADO_CLJXB.Active :=true;
dm.ADO_BMBMK.Active :=true;
end;

procedure TfrmSltz.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree;
  frmSLTZ:= nil;

end;

procedure TfrmSltz.SpeedButton1Click(Sender: TObject);
begin
dm.ADO_SPBMK_INDEX.Active :=true;
ShowModalForm(TfrmSpbm_brw);
if CurrentParam.tmpFind then
begin
  dm.ADO_CLJXB.FieldByName('spbh').AsString :=dm.ADO_SPBMK_INDEX.Fieldbyname('spbh').AsString ;
  dm.ADO_CLJXB.FieldByName('spmc').AsString :=dm.ADO_SPBMK_INDEX.Fieldbyname('spmc').AsString ;
  dm.ADO_CLJXB.FieldByName('jldw').AsString :=dm.ADO_SPBMK_INDEX.Fieldbyname('jldw').AsString ;


end;
dm.ADO_SPBMK_INDEX.Active :=false;
end;

procedure TfrmSltz.btnSaveClick(Sender: TObject);
var
 sNumber:string;
begin
//sNumber:=inttostr(frmmain.Year)+formatfloat('00',frmmain.month);//+formatfloat('00',frmmain.day);
sNumber:=dtdate.Text;
sNumber:=COPY(sNumber,1,4)+COPY(sNumber,6,2);
dm.ADO_CLJXB.FieldByName('money').AsFloat :=0;
dm.ADO_CLJXB.FieldByName('sfno').AsString :=datenumber(sNumber,frmmain.adoqytmp);
dm.ADO_CLJXB.FieldByName('spdj').AsFloat :=0;
dm.ADO_CLJXB.FieldByName('ynqc').AsBoolean  :=false;
dm.ADO_CLJXB.FieldByName('yntz').AsBoolean  :=true;

dm.ADO_CLJXB.Post ;
dm.ADO_CLJXB.Close ;
dm.ADO_CLJXB.Active :=true;
btnsave.Enabled :=false;
btnadd.Enabled :=true;
btndele.Enabled :=true;
btnedit.Enabled :=true;
btnPrint.Enabled :=true;
Panel3.Enabled :=false;
end;

procedure TfrmSltz.btnAddClick(Sender: TObject);
begin
Panel3.Enabled :=true;
btnsave.Enabled :=true;
btnadd.Enabled :=false;
btndele.Enabled :=false;
btnedit.Enabled :=false;
btnPrint.Enabled :=false;
dm.ADO_CLJXB.Insert ;
end;

procedure TfrmSltz.btnDeleClick(Sender: TObject);
begin
 if dm.ADO_CLJXB.recordcount <> 0 then
 begin
  if Application.messagebox('请确认是否要删除?', '材料租赁系统', mb_iconinformation + mb_yesno) = idyes then
  begin
   dm.ADO_CLJXB.Delete;
 end;
 end else
  begin
   Application.messagebox('已无记录可删除', '材料租赁系统', mb_iconinformation + mb_defbutton1);
   exit;
  end;
end;

procedure TfrmSltz.btnCloseClick(Sender: TObject);
begin
CLOSE;
end;

procedure TfrmSltz.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
if dm.ADO_CLJXB.State in [dsedit,dsinsert] then
   dm.ADO_CLJXB.CancelUpdates ; 
dm.ADO_CLJXB.Filter :='' ;
dm.ADO_CLJXB.Filtered :=false;
dm.ADO_CLJXB.Close ;
dm.ADO_BMBMK.Close ;
end;

procedure TfrmSltz.btnEditClick(Sender: TObject);
begin
Panel3.Enabled :=true;
btnsave.Enabled :=true;
btnadd.Enabled :=false;
btndele.Enabled :=false;
btnedit.Enabled :=false;
btnPrint.Enabled :=false;
dm.ADO_CLJXB.Edit ;
end;

procedure TfrmSltz.btnPrintClick(Sender: TObject);
begin
PrintDBGridEh1.Title.Text := Caption;
PrintDBGridEh1.Preview ;
end;

end.
