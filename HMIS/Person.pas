unit Person;          //医务人员登记窗体单元

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, Mask, ExtCtrls, Grids, DBGrids;

type
  TF_Person = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit5: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    procedure DBLookupComboBox1Enter(Sender: TObject);
    procedure DBLookupComboBox2Enter(Sender: TObject);
    procedure DBLookupComboBox1Exit(Sender: TObject);
    procedure DBLookupComboBox2Exit(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Person: TF_Person;

implementation

uses DataModule, Query, DB;

{$R *.dfm}

procedure TF_Person.DBLookupComboBox1Enter(Sender: TObject);
begin  {*****部门DBLookupComboBox1控件OnEnter事件*****}
    DM.AT_Assis.Active := false;        //挂起T_Assis数据表控件
    DM.AT_Assis.TableName := 'Branch';  //表格名赋值
    DBLookupComboBox1.KeyField := 'Bra_Name';   //赋部门编号字段
    DBLookupComboBox1.ListField := 'Bra_Name';  //赋部门名称字段
    DM.AT_Assis.Active := true;         //启动T_Assis数据表控件
end;

procedure TF_Person.DBLookupComboBox2Enter(Sender: TObject);
begin  {*****职务DBLookupComboBox2控件OnEnter事件*****}
    DM.AT_Assis.Active := false;      //挂起T_Assis数据表控件
    DM.AT_Assis.TableName := 'Duty';  //表格名赋值
    DBLookupComboBox2.KeyField := 'Duty_Name';   //赋部门编号字段
    DBLookupComboBox2.ListField := 'Duty_Name';  //赋部门名称字段
    DM.AT_Assis.Active := true;         //启动T_Assis数据表控件
end;

procedure TF_Person.DBLookupComboBox1Exit(Sender: TObject);
begin  {*****部门DBLookupComboBox1控件OnExit事件*****}
    DBLookupComboBox1.KeyField := '';  //先赋空值的目的是为了防止系统抛出异常
    DBLookupComboBox1.ListField := '';
end;

procedure TF_Person.DBLookupComboBox2Exit(Sender: TObject);
begin  {*****职务DBLookupComboBox2控件OnExit事件*****}
    DBLookupComboBox2.KeyField := '';    //先赋空值的目的是为了防止系统抛出异常
    DBLookupComboBox2.ListField := '';
end;

procedure TF_Person.BitBtn6Click(Sender: TObject);
var  {*****查找按钮单击事件*****}
    str1,str2:TStringList;
begin
    str1 := TStringList.Create;
    str2 := TStringList.Create;
    F_Query.Q_Table := 'Person';  //赋查找表名
    str1.Add('编号');            //添加医务人员编号查找字段
    str2.Add('Per_ID');          //添加医务人员编号在数据表中的字段名
    F_Query.T_Field[0] := 0;      //添加医务人员编号类型代号，为整数类型
    str1.Add('部门');            //添加部门查找字段
    str2.Add('Per_Bra');         //添加部门在数据表中的字段名
    F_Query.T_Field[1] := 1;      //添加部门字段类型代号，为字符串类型
    str1.Add('职务');            //添加职务查找字段
    str2.Add('Per_Duty');        //添加职务在数据表中的字段名
    F_Query.T_Field[2] := 1;      //添加职务字段类型代号，为字符串类型
    F_Query.S_Field := str1;      //查询窗体上S_Field公有变量赋值
    F_Query.N_Field := str2;      //查询窗体上N_Field公有变量赋值
    F_Query.Query := DM.AQ_Person;  //设定查找数据集为员工信息表
    F_Query.ShowModal;         //打开数据记录查询窗口
end;

procedure TF_Person.BitBtn5Click(Sender: TObject);
begin  {*****退出按钮单击事件*****}
    Close;
end;

procedure TF_Person.BitBtn1Click(Sender: TObject);
begin  {*****增加按钮单击事件*****}
    DM.AQ_Person.Insert;  //进入插入一条记录状态
end;

procedure TF_Person.BitBtn2Click(Sender: TObject);
begin  {*****删除按钮单击事件*****}
    if Application.MessageBox('真要删除选择的记录','确认对话框',mrOk) = mrOk then
      DM.AQ_Person.Delete;   //删除一条记录
end;

procedure TF_Person.BitBtn3Click(Sender: TObject);
begin  {*****保存按钮单击事件*****}
    if(DM.DS_Person.State = dsEdit)or(DM.DS_Person.State = dsInsert) then
      DM.AQ_Person.Post;      //递交操作的数据集
end;

procedure TF_Person.BitBtn4Click(Sender: TObject);
begin  {*****取消按钮单击事件*****}
    DM.AQ_Person.Cancel;      //取消回复到前一次递交的数据集
end;

procedure TF_Person.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    DM.AT_Assis.Active := false;  //挂起T_Assis数据表控件
    Action := caFree;  //释放医务人员登记窗体对象
    F_Person := nil;
end;

end.
