unit U_User;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DB, ADODB, Grids, DBGrids, ComCtrls, Mask,
  DBCtrls, Buttons;

type
  TfrmUse = class(TForm)
    Panel1: TPanel;
    tyqmp: TADOQuery;
    dstmp: TDataSource;
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    Panel2: TPanel;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    Panel4: TPanel;
    btn_refresh: TSpeedButton;
    btn_insert: TSpeedButton;
    btn_edit: TSpeedButton;
    btn_cancel: TSpeedButton;
    btn_save: TSpeedButton;
    DBNavigator: TDBNavigator;
    Panel5: TPanel;
    dbcmbType: TDBComboBox;
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    btn_delete: TSpeedButton;
    sbtnsetup: TSpeedButton;
    procedure btn_saveClick(Sender: TObject);
    procedure btn_refreshClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_deleteClick(Sender: TObject);
    procedure btn_insertClick(Sender: TObject);
    procedure btn_editClick(Sender: TObject);
    procedure btn_cancelClick(Sender: TObject);
    procedure sbtnsetupClick(Sender: TObject);
  private
    { Private declarations }
     procedure btn_valid;
  public
    { Public declarations }
  end;

var
  frmUse: TfrmUse;

implementation
    uses main,u_public,U_DM,U_pwd;
{$R *.dfm}
 procedure TfrmUse.btn_valid;
begin
  DBNavigator.enabled := not dbnavigator.enabled;
  btn_insert.enabled := not btn_insert.enabled;
  btn_delete.enabled := not btn_delete.enabled;
  btn_edit.enabled := not btn_edit.enabled;
  btn_cancel.enabled := not btn_cancel.enabled;
  btn_Save.enabled := not btn_Save.enabled;
  btn_refresh.enabled := not btn_refresh.enabled;
  sbtnsetup.Enabled:=not sbtnsetup.Enabled;
  Panel5.Enabled :=NOT Panel5.Enabled ;
end;
procedure TfrmUse.btn_saveClick(Sender: TObject);
begin
if (length(dbedit1.Text)=0) or (length(dbcmbType.Text)=0)then
begin
    application.MessageBox('人员编码和操作类型不为空，请重新输入新的人员ID号!', '材料租赁系统', mb_iconinformation + mb_defbutton1);
    dbedit1.SetFocus;
    exit;
end;
if dm.ADO_USESZ.state = dsinsert then
begin
if findundo('log_id','usesz',trim(dbedit1.Text),frmmain.adoqytmp) then
begin
    application.MessageBox('人员编码已存在，请重新输入新的人员ID号!', '材料租赁系统', mb_iconinformation + mb_defbutton1);
    dbedit1.SetFocus;
    exit;
end;
 if not CurrentParam.tmpFind then
 begin
    application.MessageBox('你没有设置人员密码，请重新设置密码！', '材料租赁系统', mb_iconinformation + mb_defbutton1);

    dbedit1.SetFocus;
    exit;
end;
end;
  dm.ADO_USESZ.Post;
  //设置数据显示组件为不可用状态
  btn_valid;

end;

procedure TfrmUse.btn_refreshClick(Sender: TObject);
begin

close;
dm.ADO_USESZ.Close ;
end;

procedure TfrmUse.FormCreate(Sender: TObject);
begin
dm.ADO_USESZ.Active :=true;

end;

procedure TfrmUse.btn_deleteClick(Sender: TObject);
begin
  //判断是否有记录可删除
  if dm.ADO_USESZ.recordcount = 0 then
  begin
    application.MessageBox('没有记录可删除', '材料租赁系统', mb_iconinformation + mb_defbutton1);
    exit;
  end;
  //确认删除
if trim(dbedit1.Text)='SYSTEM' then
begin
application.MessageBox('对不起你没有删除此用户的权限！', '材料租赁系统', mb_iconinformation + mb_defbutton1);
exit;
end;

  if application.messagebox('请确认是否要删除', '材料租赁系统', mb_iconinformation + mb_yesno) = idyes then
    dm.ADO_USESZ.delete;

end;

procedure TfrmUse.btn_insertClick(Sender: TObject);
begin
  //取消过滤
  dm.ADO_USESZ.Filter := '';
  dm.ADO_USESZ.Filtered := true;
  //数据集处于添加状态
  dm.ADO_USESZ.Insert;
  //改变组件的有效性
  btn_valid;
  dbedit1.SetFocus;
end;

procedure TfrmUse.btn_editClick(Sender: TObject);
begin
  //先判断是否有记录可编辑
//  dm.tbsys_log.Close ;
//  dm.tbsys_log.Open ;
  if dm.ADO_USESZ.recordcount = 0 then
  begin
    application.MessageBox('没有记录不能编辑', '材料租赁系统', mb_iconinformation + mb_defbutton1);
    exit;
  end;
    //使数据集处于编辑状态
  dm.ADO_USESZ.edit;
  //设置组件有效性
  btn_valid;
  dbedit1.setfocus;
 // dbedit1.Enabled :=false;
end;

procedure TfrmUse.btn_cancelClick(Sender: TObject);
begin
dm.ADO_USESZ.CancelUpdates ;
 btn_valid;
end;

procedure TfrmUse.sbtnsetupClick(Sender: TObject);
var
frmPwd:TfrmPwd;
begin
if dm.ADO_USESZ.state = dsinsert then
begin
   CurrentParam.tmpFind :=false;
   frmPwd:=TfrmPwd.Create(self);
   frmPwd.ShowModal ;
end;   
end;

end.
