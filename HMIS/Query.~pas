unit Query;              //数据记录查询单元

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, Mask,ADODB;  //用户添加ADODB

type
  TF_Query = class(TForm)
    Label2: TLabel;
    Panel1: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    SButton1: TSpeedButton;
    ME_Data: TMaskEdit;
    CB_Cond: TComboBox;
    RG_Cond: TRadioGroup;
    BB_Database: TBitBtn;
    BB_Close: TBitBtn;
    LV_SQL: TListView;
    BB_Add: TBitBtn;
    BB_Delete: TBitBtn;
    BB_Query: TBitBtn;
    CBE_Field: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure BB_AddClick(Sender: TObject);
    procedure BB_DeleteClick(Sender: TObject);
    procedure BB_QueryClick(Sender: TObject);
    procedure BB_CloseClick(Sender: TObject);
    procedure BB_DatabaseClick(Sender: TObject);
    procedure CBE_FieldChange(Sender: TObject);
    procedure SButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    S_Field,N_Field:TStringList;  //定义用来存放查找字段名和查找字段字符串
    Query:TADOQuery;    //定义一个查询控件对象
    Q_Table:AnsiString; //查找表名
    T_Field:array[0..5]of byte;  //用来存放查找字段类型，0表示整数类型，1表示字符串字段,2表示日期字段
  end;

var
  F_Query: TF_Query;

implementation

uses MonthCalendar;



{$R *.dfm}

procedure TF_Query.FormShow(Sender: TObject);
begin  {*****数据记录查询窗体OnShow事件*****}
    LV_SQL.Items.Clear;  //清除ListView对象所有列表项
    CBE_Field.Items := S_Field;  //查找字段赋值
end;

procedure TF_Query.BB_AddClick(Sender: TObject);
var  {*****增加按钮单击事件*****}
    SQL:TListItem;
begin
    if(CBE_Field.Text='')or(CB_Cond.Text='')or(ME_Data.Text='')then
      begin
      ShowMessage('查找字段、查找条件或查找值不能为空');
      ME_Data.SetFocus;  //焦点在查找值输入框
      exit;
      end;
    SQL := LV_SQL.Items.Add;     //增加一条查找字段、查找条件和查找值到ListView内
    if(LV_SQL.Items.Count>1)then
      if RG_Cond.ItemIndex=1 then
        SQL.Caption := '或者'    //增加查找逻辑关系值
      else
        SQL.Caption := '并且';
    SQL.SubItems.Add(CBE_Field.Text); //追加查找字段
    SQL.SubItems.Add(CB_Cond.Text);   //追加查找条件
    SQL.SubItems.Add(ME_Data.Text);   //追加查找值
end;

procedure TF_Query.BB_DeleteClick(Sender: TObject);
var  {*****删除按钮单击事件*****}
    No:integer;
begin
    No := LV_SQL.ItemIndex;  //获得用户选择ListView的记录值
    LV_SQL.Items.Delete(No); //删除用户选择ListView记录
end;

procedure TF_Query.BB_QueryClick(Sender: TObject);
var  {*****查找按钮单击事件*****}
    i,j,No:integer;
    str,buf1,buf2:AnsiString;
begin
    if LV_SQL.Items.Count=0 then
      begin
      ShowMessage('你还没有选择数据记录查找条件，请选择');
      ME_Data.SetFocus;  //焦点在查找值输入框
      exit;
      end;
    Query.Close;  //关闭数据集
    Query.SQL.Clear;   //清除SQL语句
    No := LV_SQL.Items.Count; //获得当前ListView对象中的记录条数
    for i:=0 to No-1 do         //以下所有语句都用来进行转换用户选择查找条件为SQL语句
      begin
      if(i>=1)then              //第二条记录开始需要添加查找逻辑
        begin
        buf1 := LV_SQL.Items.Item[i].Caption;  //通过判断添加对应的逻辑条件
        if(buf1 = '并且') then
          str := str+' AND '
        else
          str := str+' OR ';
        end;
      buf1 := LV_SQL.Items.Item[i].SubItems.Strings[0];  //通过查找字段判断添加对应SQL语句
      for j:=0 to S_Field.Count-1 do
        if(buf1 = S_Field.Strings[j])then
          begin
          str := str+N_Field.Strings[j];
          break;
          end;
      buf2 := LV_SQL.Items.Item[i].SubItems.Strings[1];  //通过查找条件判断添加对应SQL语句
      if(buf2 = '等于')then
        str := str+'='
      else if(buf2 = '不等于') then
          str := str+'<>'
       else if(buf2 = '大于等于') then
            str := str+'>='
        else if(buf2 = '小于等于') then
              str := str+'<=';
      buf2 := LV_SQL.Items.Item[i].SubItems.Strings[2];  //通过查找值判断添加对应SQL语句
      for j:=0 to S_Field.Count-1 do
        begin
        if(buf1 = S_Field.Strings[j])then
          begin
          if(T_Field[j]=1)or(T_Field[j]=2) then
            str := str+'''';  //字符串或者日期字段两边也需要加上'标志
          str := str+buf2;
          if(T_Field[j]=1)or(T_Field[j]=2) then
            str := str+'''';  //字符串或者日期字段两边也需要加上'标志
          break;  
          end;  
        end;
      end;
    Query.SQL.Add('SELECT * FROM '+Q_Table+' WHERE ');  //添加查询语句
    Query.SQL.Add(str); //添加查询条件语句
    Query.Open; //执行SQL语句，打开数据集
    F_Query.Close;        //关闭数据记录查询窗口
end;

procedure TF_Query.BB_CloseClick(Sender: TObject);
begin  {*****关闭按钮单击事件*****}
    F_Query.Close;        //关闭数据记录查询窗口
end;

procedure TF_Query.BB_DatabaseClick(Sender: TObject);
begin  {*****全部数据按钮单击事件*****}
    Query.Close;  //关闭数据集
    Query.SQL.Clear;  //清除SQL语句
    Query.SQL.Add('SELECT * FROM '+Q_Table); //添加SQL语句
    Query.Open; //执行SQL语句，打开数据集
    F_Query.Close;        //关闭数据记录查询窗口
end;

procedure TF_Query.CBE_FieldChange(Sender: TObject);
begin  {*****查找字段ComboBoxEx对象OnChange事件*****}
    if(T_Field[CBE_Field.ItemIndex] = 2)then //T_Field[j]:=:=2表示日期字段
      SButton1.Visible := true
    else
      SButton1.Visible := false;
end;

procedure TF_Query.SButton1Click(Sender: TObject);
begin  {*****日期选择按钮SButton1单击事件*****}
    F_Date.Left := F_Query.Left+SButton1.Left; //控件日期选择窗口显示位置
    F_Date.Top := F_Query.Top+SButton1.Top;
    F_Date.ShowModal;   //弹出日期选择窗口
    if(F_Date.ModalResult=mrOk) then //用户确定选择的日期
      ME_Data.Text := DateToStr(F_Date.MC_Date.Date); //选择的日期赋字段值字段
end;

end.
