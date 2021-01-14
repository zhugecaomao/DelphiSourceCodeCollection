unit PInput;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids;

type
  TF_Input = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    DBGrid2: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Input: TF_Input;

implementation

uses DataModule, Main, Query ,DB;

{$R *.dfm}

procedure TF_Input.FormShow(Sender: TObject);
begin  {*****药品入库管理窗体OnShow事件*****}
    DM.AT_Assis.Active := false;        //挂起T_Assis数据表控件
    DM.AT_Assis.TableName := 'Company';  //表格名赋值
//    DBLookupComboBox1.KeyField := 'CUnit_Name';   //赋计量单位编号字段
//    DBLookupComboBox1.ListField := 'CUnit_Name';  //赋计量单位名称字段
    DM.AT_Assis.Active := true;         //启动T_Assis数据表控件
end;

procedure TF_Input.BitBtn1Click(Sender: TObject);
var  {*****药品入库单增加按钮单击事件*****}
    RecordID:integer;
begin
    DM.AT_Count.Filter := 'Count_Name=''PInputB''';  //设置过滤器，提取药品入库单信息表计数值
    DM.AT_Count.Filtered := true;                  //开启过滤器
    DM.AT_Count.Open;                           //打开记录编号计数表
    RecordID := DM.AT_CountCount_Value.Value;    //提取计数值，注意使用AT_CountCount_Value提取记录值是因为在AT_Count控件的字段编辑器中添加了这个字段
    DM.AQ_PInputB.Append;                       //药品入库单信息表进入插入数据记录状态
    DM.AQ_PInputB.FieldByName('PINB_PID').Value := RecordID;  //入库单编号字段赋值
    DM.AQ_PInputB.FieldByName('PINB_Operator').Value := F_Main.Operator; //操作员字段赋值  
    DM.AQ_PInputB.FieldByName('PINB_Date').Value := Now;  //日期字段赋值
    DM.AQ_PInputB.Post;   //药品入库单信息表提交数据集
    DM.AT_Count.Edit;     //编辑记录号计数数据表
    DM.AT_CountCount_Value.Value := RecordID+1;  //记录号加1再赋值
    DM.AT_Count.Post;     //提交编辑数据
    DM.AT_Count.Close;    //关闭记录号计数数据表
end;

procedure TF_Input.BitBtn2Click(Sender: TObject);
begin  {*****药品入库单删除按钮单击事件*****}
    if Application.MessageBox('真要删除选择的记录','确认对话框',mrOk) = mrOk then
      DM.AQ_PInputB.Delete;   //删除一条记录
end;

procedure TF_Input.BitBtn6Click(Sender: TObject);
var  {*****查找按钮单击事件*****}
    str1,str2:TStringList;
begin
    str1 := TStringList.Create;
    str2 := TStringList.Create;
    F_Query.Q_Table := 'PInputB';   //赋查找表名
    str1.Add('药品入库单编号');    //添加药品入库单编号查找字段
    str2.Add('PINB_PID');          //添加药品入库单编号在数据表中的字段名
    F_Query.T_Field[0] := 0;        //添加药品编号类型代号，为整数类型
    str1.Add('操作员');            //添加操作员查找字段
    str2.Add('PINB_Operator');     //添加操作员在数据表中的字段名
    F_Query.T_Field[1] := 1;        //添加药品名称字段类型代号，为字符串类型
    str1.Add('入库日期');          //添加入库日期查找字段
    str2.Add('PINB_Date');         //添加入库日期在数据表中的字段名
    F_Query.T_Field[2] := 2;        //添加入库日期字段类型代号，为日期类型
    F_Query.S_Field := str1;        //查询窗体上S_Field公有变量赋值
    F_Query.N_Field := str2;        //查询窗体上N_Field公有变量赋值
    F_Query.Query := DM.AQ_PInputB;  //设定查找数据集为药品入库单信息表
    F_Query.ShowModal;           //打开数据记录查询窗口
end;

procedure TF_Input.BitBtn10Click(Sender: TObject);
begin  {*****打印按钮单击事件*****}

end;

procedure TF_Input.BitBtn9Click(Sender: TObject);
begin  {*****帮助按钮单击事件*****}
    ShowMessage('第一步：单击增加按钮，增加一条药品入库单  第二步：单击插入近钮，可以增加左边对应药品入库单的药品入库记录');
end;

procedure TF_Input.BitBtn5Click(Sender: TObject);
begin  {*****退出按钮单击事件*****}
    DM.AT_Assis.Active := false;  //挂起T_Assis数据表控件
    F_Input.Close;
//    F_Input.Free;     //释放药品入库管理窗体对象
//    F_Input := nil;
end;

procedure TF_Input.BitBtn7Click(Sender: TObject);
var  {*****插入按钮单击事件*****}
    RecordID:integer;
begin
    with DM.AT_Count do
    begin
      Filter := 'Count_Name=''PInput''';   //设置过滤器，提取药品入库单信息表计数值
      Filtered := true;                  //开启过滤器
      Open;                           //打开记录编号计数表
    end;
    RecordID := DM.AT_CountCount_Value.Value;    //提取计数值，注意使用AT_CountCount_Value提取记录值是因为在AT_Count控件的字段编辑器中添加了这个字段
    DM.AT_PInput.Append;                        //药品入库记录信息表进入插入数据记录状态
    DM.AT_PInputPIN_ID.AsInteger := RecordID + 1;  //入库记录编号字段赋值
    DM.AT_PInput.FieldByName('PIN_PID').Value := DM.AQ_PInputB.FieldByName('PINB_PID').Value;  //药品入库单字段赋值，此字段与AQ_PInputB的PINB_PID字段构成主从关系
    with DM.AT_Count do
    begin
      Edit;     //编辑记录号计数数据表
      FieldByName('Count_Value').Value := RecordID+1;  //记录号加1再赋值
      Post;     //提交编辑数据
      Close;    //关闭记录号计数数据表
    end;  
end;

procedure TF_Input.BitBtn8Click(Sender: TObject);
begin  {*****删除按钮单击事件*****}
    if Application.MessageBox('真要删除选择的记录','确认对话框',mrOk) = mrOk then
      DM.AT_PInput.Delete;   //删除一条记录
end;

procedure TF_Input.BitBtn11Click(Sender: TObject);
begin  {*****保存按钮单击事件*****}
    if(DM.DS_PInput.State = dsEdit)or(DM.DS_PInput.State = dsInsert) then
      DM.AT_PInput.Post;      //递交操作的数据集
end;

procedure TF_Input.BitBtn12Click(Sender: TObject);
begin  {*****取消按钮单击事件*****}
    DM.AT_PInput.Cancel;      //取消回复到前一次递交的数据集
end;

end.
