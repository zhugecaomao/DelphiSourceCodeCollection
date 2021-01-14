unit ClinicRegForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ADODB, StdCtrls, DB, ExtCtrls, ComCtrls, ToolWin, ImgList;

type
  TClinicReg = class(TForm)
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    ToolButton5: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton12: TToolButton;
    ToolButton4: TToolButton;
    GroupBox1: TGroupBox;
    Bevel1: TBevel;
    Bevel2: TBevel;
    ADOConnection1: TADOConnection;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
    ComboBox6: TComboBox;
    Edit3: TEdit;
    Edit4: TEdit;
    ADOCommand1: TADOCommand;
    ADOQuery1: TADOQuery;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    procedure ToolButton1Click(Sender: TObject);

    procedure ComboBox5Select(Sender: TObject);
    procedure ComboBox4Select(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ClinicReg: TClinicReg;
  maxClinic,maxPatient:string;//门诊挂号最大编号和病人信息库最大编号

implementation

{$R *.dfm}

//-----新增病人挂号------
procedure TClinicReg.ToolButton1Click(Sender: TObject);
var
temp:string;
num:integer;
begin
 //设置挂号科室下拉菜单
 adoquery1.Close;
 adoquery1.SQL.Clear;
 adoquery1.SQL.Add('select distinct 名称 from 科室资料');
 adoquery1.Open;
 combobox5.Items.Clear;
 while not adoquery1.Eof do
  begin
   combobox5.Items.Add(trim(adoquery1.FieldByName('名称').AsString));
   adoquery1.Next;
  end;
  combobox5.ItemIndex:=0;
  //设置必填字段的默认选项
  combobox3.Text:=combobox3.Items.Strings[0];
  combobox4.Text:=combobox4.Items.Strings[0];
  combobox5.Text:=combobox5.Items.Strings[0];
  combobox6.Text:=combobox6.Items.Strings[0];
  edit3.Text:='1';
  edit4.Text:=datetostr(date)+' '+timetostr(time);

  toolbutton2.Enabled:=true;
  toolbutton3.Enabled:=true;
  toolbutton1.Enabled:=false;
  groupbox1.Enabled:=true;

  //计算门诊挂号最大编号和病人信息库最大编号
 adoquery1.Close;
 adoquery1.SQL.Clear;
 adoquery1.SQL.Add('select max(编号) 最大编号 from 门诊挂号');
 adoquery1.Open;
 if adoquery1.RecordCount>0 then//编号规则：年份+7位数字编号
  begin
  temp:=copy(trim(adoquery1.fieldbyname('最大编号').AsString),5,7);
  num:=strtoint(temp)+1;
  if num<10 then maxClinic:=copy(datetostr(date),1,4)+'000000'+inttostr(num);
  if num>9 then maxClinic:=copy(datetostr(date),1,4)+'00000'+inttostr(num);
  if num>99 then maxClinic:=copy(datetostr(date),1,4)+'0000'+inttostr(num);
  if num>999 then maxClinic:=copy(datetostr(date),1,4)+'000'+inttostr(num);
  if num>9999 then maxClinic:=copy(datetostr(date),1,4)+'00'+inttostr(num);
  if num>99999 then maxClinic:=copy(datetostr(date),1,4)+'0'+inttostr(num);
  if num>999999 then maxClinic:=copy(datetostr(date),1,4)+inttostr(num);
  end
 else
  maxClinic:=copy(datetostr(date),1,4)+'0000001';

 adoquery1.Close;
 adoquery1.SQL.Clear;
 adoquery1.SQL.Add('select max(编号) 最大编号 from 病人信息库');
 adoquery1.Open;
 if adoquery1.RecordCount>0 then
  begin
  temp:=copy(trim(adoquery1.fieldbyname('最大编号').AsString),5,7);
  num:=strtoint(temp)+1;
  if num<10 then maxPatient:=copy(datetostr(date),1,4)+'000000'+inttostr(num);
  if num>9 then maxPatient:=copy(datetostr(date),1,4)+'00000'+inttostr(num);
  if num>99 then maxPatient:=copy(datetostr(date),1,4)+'0000'+inttostr(num);
  if num>999 then maxPatient:=copy(datetostr(date),1,4)+'000'+inttostr(num);
  if num>9999 then maxPatient:=copy(datetostr(date),1,4)+'00'+inttostr(num);
  if num>99999 then maxPatient:=copy(datetostr(date),1,4)+'0'+inttostr(num);
  if num>999999 then maxPatient:=copy(datetostr(date),1,4)+inttostr(num);
  end
 else
  maxPatient:=copy(datetostr(date),1,4)+'0000001';

end;


//----设置医生下拉菜单，仅显示属于所选的挂号科室的医生名单-------
procedure TClinicReg.ComboBox5Select(Sender: TObject);
begin

 adoquery1.Close;
 adoquery1.SQL.Clear;
 adoquery1.SQL.Add('select distinct 姓名 from 医生资料 where 科室='''+combobox5.Text+'''');
 adoquery1.Open;
 combobox6.Clear;
 combobox6.Items.Clear;
 while not adoquery1.Eof do
  begin
   combobox6.Items.Add(trim(adoquery1.FieldByName('姓名').AsString));
   adoquery1.Next;
  end;
  if combobox6.Items.Count>0 then
   combobox6.ItemIndex:=0;
end;

//-----根据不同挂号类型显示不同的挂号费用------
procedure TClinicReg.ComboBox4Select(Sender: TObject);
begin
 if combobox4.ItemIndex=0 then
  edit3.Text:='1';
 if combobox4.ItemIndex=1 then
  edit3.Text:='20';
 if combobox4.ItemIndex=2 then
  edit3.Text:='5';
end;

//----------将病人信息保存到病人信息库-------------
procedure TClinicReg.ToolButton2Click(Sender: TObject);
var
sql1,sql2,sql3,sql4:string;
begin
 //检查必填字段
 if combobox6.Text='' then //保存时必须选择医生
  begin
   showmessage('请选择医生');
   exit;
  end;

 if edit1.Text='' then  //保存时必须输入病人姓名
  begin
   showmessage('请输入病人姓名');
   exit;
  end;


  sql1:='insert into 病人信息库 values(''';
  sql2:=maxPatient+''','''+edit1.Text+''','''+combobox1.Text+''','''+edit2.Text;
  sql3:=''','''+combobox2.Text+''','''+combobox3.Text+''','''','''')';
  adocommand1.CommandText:=sql1+sql2+sql3;
  adocommand1.Execute;

  //将挂号信息保存如门诊挂号数据库
  sql1:='insert into 门诊挂号 values('''+maxClinic;
  sql2:=''','''+maxPatient+''','''+edit1.Text+''','''+combobox1.Text;
  sql3:=''','''+combobox5.Text+''','''+combobox3.Text+''','''+combobox4.Text;
  sql4:=''',CAST('''+edit3.Text+''' as DECIMAL(12,2)),'''+combobox6.Text+''','''+edit4.Text+''','''+'否'')';
  adocommand1.CommandText:=sql1+sql2+sql3+sql4;

  adocommand1.Execute;

  //设置工具栏按钮状态
  toolbutton1.Enabled:=true;
  toolbutton2.Enabled:=false;
  toolbutton3.Enabled:=false;
  groupbox1.Enabled:=false;

  edit1.Clear;
  edit2.Clear;
end;

//--------取消保存-----------
procedure TClinicReg.ToolButton3Click(Sender: TObject);
begin

  toolbutton1.Enabled:=true;
  toolbutton2.Enabled:=false;
  toolbutton3.Enabled:=false;
  groupbox1.Enabled:=false;
  edit1.Clear;
  edit2.Clear;
end;
//----------关闭窗体-------------
procedure TClinicReg.ToolButton4Click(Sender: TObject);
begin
close;
end;

procedure TClinicReg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
end;

end.
