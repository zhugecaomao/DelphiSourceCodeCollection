unit CRegister;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DBCtrls, StdCtrls, Buttons, Mask;

type
  TF_CReg = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn10: TBitBtn;
    DBComboBox1: TDBComboBox;
    DBLookupComboBox1: TDBLookupComboBox;
    DBGrid1: TDBGrid;
    Label8: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBComboBox1Change(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure Label8Click(Sender: TObject);
  private
    { Private declarations }
    CMoney:TStringList;  //挂号费用
  public
    { Public declarations }
  end;

var
  F_CReg: TF_CReg;

implementation

uses CRPrint, DataModule, DB, Main;

{$R *.dfm}

procedure TF_CReg.FormCreate(Sender: TObject);
var  {*****门诊挂号窗体创建事件*****}
    i:integer;
begin
    DM.AT_Assis.Active := false;        //挂起T_Assis数据表控件
    DM.AT_Assis.TableName := 'CRKind';  //表格名赋值
    DM.AT_Assis.Active := true;         //启动T_Assis数据表控件
    DM.AT_Assis.First;               //当前活动记录移动到第一条记录
    DBComboBox1.Items.Clear;
    CMoney := TStringList.Create;    //创建TStringList对象 
    for i:=1 to DM.AT_Assis.RecordCount do
      begin
      DBComboBox1.Items.Add(DM.AT_Assis.FieldByName('CRK_Name').AsString);  //取得挂号类别字段值
      CMoney.Add(DM.AT_Assis.Fields.Fields[1].AsString);  //另一种方法取得挂号费用字段值
      DM.AT_Assis.Next;              //当前活动记录下移一条记录
      end;
    DM.AT_Assis.Active := false;        //挂起T_Assis数据表控件
    DM.AT_Assis.TableName := 'Branch';  //表格名赋值
    DBLookupComboBox1.KeyField := 'Bra_Name';    //赋医院科室编号字段
    DBLookupComboBox1.ListField := 'Bra_Name'; //赋医院科室名称字段
    DM.AT_Assis.Active := true;         //启动T_Assis数据表控件
end;

procedure TF_CReg.BitBtn1Click(Sender: TObject);
var  {*****增加按钮单击事件*****}
    RecordID:integer;
begin
    DM.AT_Count.Filter := 'Count_Name=''CRegister'''; //设置过滤器，提取药品入库单信息表计数值
    DM.AT_Count.Filtered := true;                  //开启过滤器
    DM.AT_Count.Open;                           //打开记录编号计数表
    RecordID := DM.AT_CountCount_Value.Value;    //提取计数值，注意使用AT_CountCount_Value提取记录值是因为在AT_Count控件的字段编辑器中添加了这个字段
    DM.AT_CReg.Append;                          //门诊挂号信息表进入插入数据记录状态
    DM.AT_CReg.FieldByName('CReg_ID').Value := RecordID;
    DM.AT_CReg.FieldByName('CReg_Date').Value := Now;
end;

procedure TF_CReg.BitBtn3Click(Sender: TObject);
begin  {*****保存按钮单击事件*****}
    if (DM.DS_CReg.State = dsEdit)or(DM.DS_CReg.State = dsInsert) then
      begin
      DM.AT_CReg.Post;      //递交操作的数据集
      DM.AT_Count.Edit;     //编辑记录号计数数据表
      DM.AT_CountCount_Value.Value := DM.AT_CReg.FieldByName('CReg_ID').Value + 1;  //记录号加1再赋值
      DM.AT_Count.Post;     //提交编辑数据
      DM.AT_Count.Close;    //关闭记录号计数数据表
      end;
end;

procedure TF_CReg.BitBtn4Click(Sender: TObject);
begin  {*****取消按钮单击事件*****}
    DM.AT_CReg.Cancel;      //取消回复到前一次递交的数据集
end;

procedure TF_CReg.BitBtn10Click(Sender: TObject);
begin  {*****打印按钮单击事件*****}
    if F_Main.CreateForm(F_CRPrint) = false then  //判断门诊挂号报表打印窗体是否已经创建
      F_CRPrint := TF_CRPrint.Create(Application);
    F_CRPrint.Hide;  //隐藏存放打印控件QReport的窗体
    F_CRPrint.QuickRep1.Preview;  //浏览和打印挂号单
end;

procedure TF_CReg.BitBtn5Click(Sender: TObject);
begin  {*****退出按钮单击事件*****}
    F_CReg.Close;  //关闭门诊挂号窗口
end;

procedure TF_CReg.FormClose(Sender: TObject; var Action: TCloseAction);
begin  {*****门诊挂号窗口OnClose事件*****}
    DBLookupComboBox1.KeyField := '';    //医院科室编号字段赋空
    DBLookupComboBox1.ListField := '';   //医院科室名称字段赋空
    Action := caFree;  //释放窗体对象
    F_CReg := nil;
end;

procedure TF_CReg.DBComboBox1Change(Sender: TObject);
begin  {*****挂号类别DBComboBox1控件OnChange事件*****}
    if (DM.DS_CReg.State = dsEdit)or(DM.DS_CReg.State = dsInsert) then
      DM.AT_CReg.FieldByName('CReg_Money').Value := StrToFloat(CMoney.Strings[DBComboBox1.ItemIndex]);
end;

procedure TF_CReg.DBLookupComboBox1Click(Sender: TObject);
var  {*****科室DBLookupComboBox1控件OnClick事件*****}
    Day:AnsiString;
begin
    case DayOfWeek(Now) of  //星期几判断
         1: Day := 'Work_Sun';
         2: Day := 'Work_Mon';
         3: Day := 'Work_Tue';
         4: Day := 'Work_Wen';
         5: Day := 'Work_Thu';
         6: Day := 'Work_Fri';
         7: Day := 'Work_Sat';
    end;
    DM.AQ_Person.Close;  //关闭医务人员信息表
    DM.AQ_Person.SQL.Text := 'SELECT * FROM Person WHERE Per_Bra='''+DBLookupComboBox1.KeyValue+''' AND '+Day+'=1';       //
    DM.AQ_Person.Open;   //执行SQL语句，并打开数据集
end;

procedure TF_CReg.Label8Click(Sender: TObject);
begin  {*****今日挂号费总额Label控件OnClick事件*****}
    try
      DM.ASP_HMIS.Parameters.Items[1].Value := DateToStr(Now)+' 00:00:00';  //存储过程开始时间参数赋值
      DM.ASP_HMIS.Parameters.Items[2].Value := DateTimeToStr(Now);  //存储过程开始时间参数赋值
      if DM.ASP_HMIS.Prepared = false then
        DM.ASP_HMIS.Prepared := true;
      DM.ASP_HMIS.ExecProc;  //执行存储过程
      ShowMessage('今天总挂号额为：'+FloatToStr(DM.ASP_HMIS.Parameters.Items[3].Value));  //存储过程开始时间参数赋值
    except
      Application.MessageBox('今天还没有挂号记录', '提示', MB_ICONINFORMATION + MB_OK);
    end;   
end;

end.
