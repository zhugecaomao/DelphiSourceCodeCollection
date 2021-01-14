unit AccountSettingForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, DB, ADODB;

type
  TAccountSetting = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    ADOTable2: TADOTable;
    DataSource2: TDataSource;
    ADOCommand1: TADOCommand;
    ADOQuery1: TADOQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure DataSource2DataChange(Sender: TObject; Field: TField);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AccountSetting: TAccountSetting;

implementation

{$R *.dfm}
uses sumaccountform;
procedure TAccountSetting.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

//-------------设置表格-----------------
procedure TAccountSetting.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
 //设置帐簿初始化表列宽
 dbgrid1.Columns[0].Width:=64;
 dbgrid1.Columns[1].Width:=100;
 dbgrid1.Columns[2].Width:=64;
 dbgrid1.Columns[3].Width:=64;
 dbgrid1.Columns[4].Width:=64;
 dbgrid1.Columns[5].Width:=64;
end;

procedure TAccountSetting.DataSource2DataChange(Sender: TObject;
  Field: TField);
begin
//设置系统参数表列宽
 dbgrid2.Columns[0].Width:=32;
 dbgrid2.Columns[1].Width:=112;
 dbgrid2.Columns[2].Width:=32;
end;

//-----------------初始化帐户-----------------------
procedure TAccountSetting.BitBtn1Click(Sender: TObject);
begin
 //执行储存过程，初始化帐户
 adocommand1.CommandText:='EXEC sf_初始化帐户';
 if application.MessageBox('是否清除原帐簿信息，并初始化新帐簿？','确认',MB_OKCANCEL)=IDOK then
 adocommand1.Execute;
 //刷新数据表
 adotable1.Active:=false;
 adotable1.Active:=true;
 adotable2.Active:=false;
 adotable2.Active:=true;
end;

//--------------------启用新帐户-----------------
procedure TAccountSetting.BitBtn2Click(Sender: TObject);
begin

//判断是否试算平衡
adoquery1.Close;
adoquery1.SQL.Clear;
adoquery1.SQL.Add('select sum(累计借方) 借方,sum(累计贷方) 贷方 from 帐簿初始化表');
adoquery1.Open;
if adoquery1.FieldByName('借方').AsString<>adoquery1.FieldByName('贷方').AsString then
 begin
 showmessage('新帐簿初始化不平衡，请检查试算平衡表后重新输入');
 exit;
 end;
//如果试算平衡，则可以新建帐簿
if application.MessageBox('试算结果平衡，启用新帐簿将删除所有历史记录'+#13+'是否继续？','确认',MB_OKCANCEL)=IDOK then
 begin
  //执行储存过程，启用帐户
  adocommand1.CommandText:='EXEC sf_启用帐户';
  adocommand1.Execute;
  //刷新数据表
  adotable1.Active:=false;
  adotable1.Active:=true;
  adotable2.Active:=false;
  adotable2.Active:=true;
  //显示帐户启用成功消息
  showmessage('新帐户启用成功');
 end;

end;

//显示初始化时的试算平衡表
procedure TAccountSetting.BitBtn3Click(Sender: TObject);
var
  newform:Tsumaccount;
begin
    //创建试算平衡窗体
    newform:=Tsumaccount.Create(application);
    newform.Caption:='试算平衡表(初始化)';
    //在初始化时使用
    newform.forinitial;
    
end;

end.
