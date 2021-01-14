unit Ujetz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolWin, ComCtrls, ExtCtrls, Grids, DBGridEh, StdCtrls, Buttons,
  DBCtrlsEh, DBLookupEh, Mask, DB, ADODB, PrnDbgeh;

type
  Tfrmjetz = class(TForm)
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
  frmjetz: Tfrmjetz;

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
procedure Tfrmjetz.FormCreate(Sender: TObject);
begin
LEFT:=0;
TOP:=0;
dm.ADO_CLJX.Filter :='(yntz=1) and (fcsl=0)' ;
dm.ADO_CLJX.Filtered :=true;
dm.ADO_CLJX.Active :=true;
dm.ADO_BMBMK.Active :=true;
end;

procedure Tfrmjetz.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree;
  frmjeTZ:= nil;

end;

procedure Tfrmjetz.SpeedButton1Click(Sender: TObject);
begin
dm.ADO_SPBMK_INDEX.Active :=true;
ShowModalForm(TfrmSpbm_brw);
if CurrentParam.tmpFind then
begin
  dm.ADO_CLJX.FieldByName('spbh').AsString :=dm.ADO_SPBMK_INDEX.Fieldbyname('spbh').AsString ;
  dm.ADO_CLJX.FieldByName('spmc').AsString :=dm.ADO_SPBMK_INDEX.Fieldbyname('spmc').AsString ;
  dm.ADO_CLJX.FieldByName('jldw').AsString :=dm.ADO_SPBMK_INDEX.Fieldbyname('jldw').AsString ;


end;
dm.ADO_SPBMK_INDEX.Active :=false;
end;

procedure Tfrmjetz.btnSaveClick(Sender: TObject);
var
 sNumber:string;
begin
//sNumber:=inttostr(frmmain.Year)+formatfloat('00',frmmain.month);//+formatfloat('00',frmmain.day);
sNumber:=dtdate.Text;
sNumber:=COPY(sNumber,1,4)+COPY(sNumber,6,2);
dm.ADO_CLJX.FieldByName('fcsl').AsFloat :=0;
dm.ADO_CLJX.FieldByName('sfno').AsString :=datenumber(sNumber,frmmain.adoqytmp);
dm.ADO_CLJX.FieldByName('spdj').AsFloat :=0;
dm.ADO_CLJX.FieldByName('ynqc').AsBoolean  :=false;
dm.ADO_CLJX.FieldByName('yntz').AsBoolean  :=true;

dm.ADO_CLJX.Post ;
dm.ADO_CLJX.Close ;
dm.ADO_CLJX.Active :=true;
btnsave.Enabled :=false;
btnadd.Enabled :=true;
btndele.Enabled :=true;
btnPrint.Enabled :=not btnPrint.Enabled;
Panel3.Enabled :=false;
end;

procedure Tfrmjetz.btnAddClick(Sender: TObject);
begin
Panel3.Enabled :=true;
btnsave.Enabled :=true;
btnadd.Enabled :=false;
btndele.Enabled :=false;
btnPrint.Enabled :=not btnPrint.Enabled;
dm.ADO_CLJX.Insert ;
end;

procedure Tfrmjetz.btnDeleClick(Sender: TObject);
begin
 if dm.ADO_CLJX.recordcount <> 0 then
 begin
  if Application.messagebox('请确认是否要删除?', '材料租赁系统', mb_iconinformation + mb_yesno) = idyes then
  begin
   dm.ADO_CLJX.Delete;
 end;
 end else
  begin
   Application.messagebox('已无记录可删除', '材料租赁系统', mb_iconinformation + mb_defbutton1);
   exit;
  end;
end;

procedure Tfrmjetz.btnCloseClick(Sender: TObject);
begin
CLOSE;
end;

procedure Tfrmjetz.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
if dm.ADO_CLJX.State in [dsedit,dsinsert] then
   dm.ADO_CLJX.CancelUpdates ;
dm.ADO_CLJX.Filter :='' ;
dm.ADO_CLJX.Filtered :=false;
dm.ADO_CLJX.Close ;
dm.ADO_BMBMK.Close ;
end;

procedure Tfrmjetz.btnEditClick(Sender: TObject);
begin
Panel3.Enabled :=true;
btnsave.Enabled :=true;
btnadd.Enabled :=false;
btndele.Enabled :=false;
btnedit.Enabled :=false;
btnPrint.Enabled :=not btnPrint.Enabled;
dm.ADO_CLJX.Edit ;
end;

procedure Tfrmjetz.btnPrintClick(Sender: TObject);
begin
//PrintDBGridEh1.PrinterSetupDialog ;
//PrintDBGridEh1
PrintDBGridEh1.Title.Text := Caption;
PrintDBGridEh1.Preview ;
end;

end.
