unit U_zlflr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, DBCtrls, Buttons, Grids, DBGridEh;

type
  TfrmZlflr = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    btnClose: TSpeedButton;
    DBGridEh1: TDBGridEh;
    btn_insert: TSpeedButton;
    btn_edit: TSpeedButton;
    btn_delete: TSpeedButton;
    DBNavigator1: TDBNavigator;
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btn_deleteClick(Sender: TObject);
    procedure btn_editClick(Sender: TObject);
    procedure btn_insertClick(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmZlflr: TfrmZlflr;

implementation
     uses main,u_dm,u_public,utLeasehold,common,u_Zlflr_input;
{$R *.dfm}

procedure TfrmZlflr.btnCloseClick(Sender: TObject);
begin

close;
end;

procedure TfrmZlflr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree;
  frmzlflr := nil;
end;

procedure TfrmZlflr.FormCreate(Sender: TObject);
begin
left:=0;
top:=0;
DBGridEh1.Align :=alclient;
dm.ADO_CLJXB.Filter :='YNQC=1';
dm.ADO_CLJXB.Filtered :=true;
dm.ADO_CLJXB.Active :=true;
end;

procedure TfrmZlflr.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
DBGridEh1.Free ;
dm.ADO_CLJXB.Filter :='';
dm.ADO_CLJXB.Filtered :=false;
dm.ADO_CLJXB.Close ;
end;

procedure TfrmZlflr.btn_deleteClick(Sender: TObject);
var
  s_value:string;
begin
s_value:=trim(dm.ADO_CLJXB.Fieldbyname('sfno').AsString);
 if dm.ADO_CLJXB.recordcount <> 0 then
 begin
  if Application.messagebox('请确认是否要删除?', '材料租赁系统', mb_iconinformation + mb_yesno) = idyes then
  begin
   dm.ADO_CLJXB.Delete;
   deledata('sfno','sfdj',s_value,frmmain.adoqytmp);
 end;
 end else
  begin
   Application.messagebox('已无记录可删除', '材料租赁系统', mb_iconinformation + mb_defbutton1);
   exit;
  end;
end;

procedure TfrmZlflr.btn_editClick(Sender: TObject);
begin
if dm.ADO_CLJXB.recordcount <> 0 then
begin
if application.MessageBox('是否要修改此记录吗?！','材料租赁系统!',MB_YESNO)=IDYES then
begin
 dm.ADO_CLJXB.edit;
 CurrentParam.blnADD:=TRUE;
 ShowModalForm(TfrmZlflr_input);
end;
   //设置按扭的有效性
end
else
  begin
   Application.messagebox('已无记录可编辑!', '材料租赁系统', mb_iconinformation + mb_defbutton1);
   exit;
  end;
end;

procedure TfrmZlflr.btn_insertClick(Sender: TObject);
begin
dm.ADO_CLJXB.Insert ;
dm.ADO_CLJXB.FieldByName('zlts').AsInteger :=1;
dm.ADO_CLJXB.FieldByName('ynqc').AsBoolean :=true;
dm.ADO_CLJXB.FieldByName('ynsf').AsBoolean :=false;
CurrentParam.blnADD :=False;
ShowModalForm(TfrmZlflr_input);
end;

procedure TfrmZlflr.DBGridEh1DblClick(Sender: TObject);
begin
//if application.MessageBox('是否要修改此记录吗?！','材料租赁系统!',MB_YESNO)=IDYES then
   btn_edit.Click ;
end;

end.
