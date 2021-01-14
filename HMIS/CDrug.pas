unit CDrug;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, Mask, ExtCtrls, Grids, DBGrids;

type
  TF_CDrug = class(TForm)
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
    procedure FormShow(Sender: TObject);
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
  F_CDrug: TF_CDrug;

implementation

uses DataModule,Query,DB;

{$R *.dfm}

procedure TF_CDrug.FormShow(Sender: TObject);
begin  {*****药品分类管理窗体OnShow事件*****}
    ((DM.AQ_CDrug.FieldByName('CDrug_No')) as TIntegerField).Alignment := taLeftJustify;  //规定药品分类编号显示为左对齐
    ((DM.AQ_CDrug.FieldByName('CDrug_Money')) as TBCDField).Alignment := taLeftJustify;
end;

procedure TF_CDrug.DBLookupComboBox1Enter(Sender: TObject);
begin  {*****计量单位DBLookupComboBox1控件OnEnter事件*****}
    DM.AT_Assis.Active := false;        //挂起T_Assis数据表控件
    DM.AT_Assis.TableName := 'CUnit';  //表格名赋值
    DBLookupComboBox1.KeyField := 'CUnit_Name';   //赋计量单位编号字段
    DBLookupComboBox1.ListField := 'CUnit_Name';  //赋计量单位名称字段
    DM.AT_Assis.Active := true;         //启动T_Assis数据表控件
end;

procedure TF_CDrug.DBLookupComboBox2Enter(Sender: TObject);
begin  {*****药别分类DBLookupComboBox2控件OnEnter事件*****}
    DM.AT_Assis.Active := false;      //挂起T_Assis数据表控件
    DM.AT_Assis.TableName := 'KDrug';  //表格名赋值
    DBLookupComboBox2.KeyField := 'KDrug_Name';   //赋药品类别编号字段
    DBLookupComboBox2.ListField := 'KDrug_Name';  //赋药品类别名称字段
    DM.AT_Assis.Active := true;         //启动T_Assis数据表控件
end;

procedure TF_CDrug.DBLookupComboBox1Exit(Sender: TObject);
begin  {*****计量单位DBLookupComboBox1控件OnExit事件*****}
    DBLookupComboBox1.KeyField := '';  //先赋空值的目的是为了防止系统抛出异常
    DBLookupComboBox1.ListField := '';
end;

procedure TF_CDrug.DBLookupComboBox2Exit(Sender: TObject);
begin  {*****药品类别DBLookupComboBox2控件OnExit事件*****}
    DBLookupComboBox2.KeyField := '';    //先赋空值的目的是为了防止系统抛出异常
    DBLookupComboBox2.ListField := '';
end;

procedure TF_CDrug.BitBtn6Click(Sender: TObject);
var  {*****查找按钮单击事件*****}
    str1,str2:TStringList;
begin
    str1 := TStringList.Create;
    str2 := TStringList.Create;
    F_Query.Q_Table := 'CDrug';   //赋查找表名
    str1.Add('药品编号');         //添加药品编号查找字段
    str2.Add('CDrug_No');         //添加药品编号在数据表中的字段名
    F_Query.T_Field[0] := 0;      //添加药品编号类型代号，为整数类型
    str1.Add('药品名称');         //添加药品名称查找字段
    str2.Add('CDrug_Name');       //添加药品名称在数据表中的字段名
    F_Query.T_Field[1] := 1;      //添加药品名称字段类型代号，为字符串类型
    str1.Add('药品类别');         //添加药品类别查找字段
    str2.Add('CDrug_Kind');       //添加药品类别在数据表中的字段名
    F_Query.T_Field[2] := 1;      //添加药品类别字段类型代号，为字符串类型
    F_Query.S_Field := str1;      //查询窗体上S_Field公有变量赋值
    F_Query.N_Field := str2;      //查询窗体上N_Field公有变量赋值
    F_Query.Query := DM.AQ_CDrug; //设定查找数据集为员工信息表
    F_Query.ShowModal;            //打开数据记录查询窗口
end;

procedure TF_CDrug.BitBtn5Click(Sender: TObject);
begin  {*****退出按钮单击事件*****}
    Close;
end;

procedure TF_CDrug.BitBtn1Click(Sender: TObject);
begin  {*****增加按钮单击事件*****}
    DM.AQ_CDrug.Insert;  //进入插入一条记录状态
end;

procedure TF_CDrug.BitBtn2Click(Sender: TObject);
begin  {*****删除按钮单击事件*****}
    if Application.MessageBox('真要删除选择的记录','确认对话框',mrOk) = mrOk then
      DM.AQ_CDrug.Delete;   //删除一条记录
end;

procedure TF_CDrug.BitBtn3Click(Sender: TObject);
begin  {*****保存按钮单击事件*****}
    if (DM.DS_CDrug.State = dsEdit)or(DM.DS_CDrug.State = dsInsert) then
      DM.AQ_CDrug.Post;      //递交操作的数据集
end;

procedure TF_CDrug.BitBtn4Click(Sender: TObject);
begin  {*****取消按钮单击事件*****}
    DM.AQ_CDrug.Cancel;      //取消回复到前一次递交的数据集
end;

procedure TF_CDrug.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    DM.AT_Assis.Active := false;  //挂起T_Assis数据表控件
    Action := caFree;
    F_CDrug := nil;
end;

end.
