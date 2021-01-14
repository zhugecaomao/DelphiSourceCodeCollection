unit CMoney;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, Grids, DBGrids, Mask, StdCtrls, Buttons, DBCtrls,
  ExtCtrls, ComCtrls, ToolWin;

type
  TF_CMoney = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    Panel1: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Panel2: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    StaticText1: TStaticText;
    DBEdit11: TDBEdit;
    MaskEdit1: TMaskEdit;
    DBEdit12: TDBEdit;
    DBGrid2: TDBGrid;
    ImageList1: TImageList;
    DBLookupComboBox1: TDBLookupComboBox;
    ListBox1: TListBox;
    DBGrid1: TDBGrid;
    MaskEdit2: TMaskEdit;
    procedure ToolButton1Click(Sender: TObject);
    procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure DBLookupComboBox1Enter(Sender: TObject);
    procedure DBLookupComboBox1Exit(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure ToolButton9Click(Sender: TObject);
    procedure ToolButton10Click(Sender: TObject);
    procedure ToolButton11Click(Sender: TObject);
    procedure ToolButton12Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure MaskEdit2KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure ButtonState(iState : integer);  //用户自定义工具条按钮状态设置过程
  public
    { Public declarations }
  end;

var
  F_CMoney: TF_CMoney;

implementation

uses DataModule, DB;  //引用DB自己增加

{$R *.dfm}

procedure TF_CMoney.ButtonState(iState : integer);
begin
  if iState = 0 then
  begin
    ToolButton1.Enabled := false;
    ToolButton2.Enabled := false;
    ToolButton3.Enabled := false;
    ToolButton4.Enabled := true;
    ToolButton5.Enabled := true;
    ToolButton6.Enabled := false;
    ToolButton7.Enabled := false;
    ToolButton8.Enabled := false;
    ToolButton9.Enabled := false;
    ToolButton10.Enabled := false;
    ToolButton11.Enabled := false;
    DBEdit3.Enabled := true;
    DBEdit4.Enabled := true;
    DBEdit5.Enabled := true;
    Panel2.Enabled := true;
    DBGrid1.Enabled := false;
    DBGrid2.Enabled := true;
  end
  else if iState = 1 then
  begin
    ToolButton1.Enabled := true;
    ToolButton2.Enabled := true;
    ToolButton3.Enabled := true;
    ToolButton4.Enabled := false;
    ToolButton5.Enabled := false;
    ToolButton6.Enabled := true;
    ToolButton7.Enabled := true;
    ToolButton8.Enabled := true;
    ToolButton9.Enabled := true;
    ToolButton10.Enabled := true;
    ToolButton11.Enabled := true;
    DBEdit3.Enabled := false;
    DBEdit4.Enabled := false;
    DBEdit5.Enabled := false;
    Panel2.Enabled := false;
    DBGrid1.Enabled := true;
    DBGrid2.Enabled := false;
  end
  else if iState = 2 then
  begin
    BitBtn1.Enabled := false;
    BitBtn2.Enabled := false;
    BitBtn3.Enabled := true;
    BitBtn4.Enabled := true;
  end
  else if iState = 3 then
  begin
    BitBtn1.Enabled := true;
    BitBtn2.Enabled := true;
    BitBtn3.Enabled := false;
    BitBtn4.Enabled := false;
  end;
end;

procedure TF_CMoney.DBEdit1KeyPress(Sender: TObject; var Key: Char);
begin  {*****门诊编辑数据输入框OnKeyPress事件*****}
    if (Key = #13) then        //按下回车键执行
       ToolButton1Click(self);     //调用BitBtn1按钮点击事件
end;

procedure TF_CMoney.DBLookupComboBox1Enter(Sender: TObject);
begin  {*****收费项目DBLookupComboBox控件OnEnter事件*****}
    DM.AT_Assis.Active := false;        //挂起T_Assis数据表控件
    DM.AT_Assis.TableName := 'ICure';  //表格名赋值
    DBLookupComboBox1.KeyField := 'ICure_Name';   //赋收费项目编号字段
    DBLookupComboBox1.ListField := 'ICure_Name';  //赋收费项目名称字段
    DM.AT_Assis.Active := true;         //启动T_Assis数据表控件
end;

procedure TF_CMoney.DBLookupComboBox1Exit(Sender: TObject);
begin  {*****收费项目DBLookupComboBox控件OnExit事件*****}
    DBLookupComboBox1.KeyField := '';  //先赋空值的目的是为了防止系统抛出异常
    DBLookupComboBox1.ListField := '';
end;

procedure TF_CMoney.DBLookupComboBox1Click(Sender: TObject);
var  {*****收费项目DBLookupComboBox控件OnClick事件*****}
    i:integer;
begin
    if Trim(DBLookupComboBox1.Text) = '药品' then
      begin
      DM.AQ_CDrug.Open;
      DM.AQ_CDrug.First;   //当前记录为第一条记录
      for i:=0 to DM.AQ_CDrug.RecordCount-1 do
        begin
        ListBox1.Items.Add(TrimRight(DM.AQ_CDrug.FieldByName('CDrug_Name').Value)+'  '+TrimRight(DM.AQ_CDrug.FieldByName('CDrug_Unit').Value)+'  '+FloatToStr(DM.AQ_CDrug.FieldByName('CDrug_Money').Value));
        DM.AQ_CDrug.Next;  //当前记录下移一条
        end;
      end;
end;

procedure TF_CMoney.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    if DM.DS_TCMoney.State in [dsInsert, dsEdit] then  //如果收费项目总表数据集处于插入或者编辑状态时
      DM.AQ_TCMoney.Cancel;  //取消数据集的操作 
    if DM.DS_CMoney.State in [dsInsert, dsEdit] then  //如果收费项目明细表数据集处于插入或者编辑状态时
      DM.AT_CMoney.Cancel;  //取消数据集的操作
    Action := caFree;  //释放窗体对象
    F_CMoney := nil;
end;

procedure TF_CMoney.ToolButton1Click(Sender: TObject);
var  {*****增加快捷按钮单击事件*****}
    RecordID:integer;
begin
    if Trim(MaskEdit2.Text) <> '' then
      begin
      try
        DM.AT_CReg.Close;
        DM.AT_CReg.Filter := 'CReg_ID=' + Trim(MaskEdit2.Text);  //设置过滤器，提取病人挂号编号
        DM.AT_CReg.Filtered := true;  //开启过滤器
        DM.AT_CReg.Open;
      except
        ShowMessage('打开门诊挂号数据表时出错');
      end;
      if DM.AT_CReg.RecordCount <> 1 then
        begin
        ShowMessage('输入的门诊编号不存在，请确认');
        exit;
        end;
      with DM.AT_Count do
      begin
        Close;   
        Filter := 'Count_Name=''POutputB'''; //设置过滤器，提取药品出库单信息表计数值
        Filtered := true;               //开启过滤器
        Open;                           //打开记录编号计数表
        RecordID := DM.AT_CountCount_Value.Value;   //提取计数值，注意使用AT_CountCount_Value提取记录值是因为在AT_Count控件的字段编辑器中添加了这个字段
        Edit;
        DM.AT_CountCount_Value.Value := RecordID + 1;
        Post;
      end;  
      DM.AQ_TCMoney.Insert;  //增加一条病人收费单记录
      DM.AQ_TCMoneyTCM_ID.Value := RecordID + 1;    //出库单编辑赋值
      DM.AQ_TCMoneyTCM_RID.Value := DM.AT_CReg.FieldByName('CReg_ID').Value;  //门诊挂号编号赋值
      DM.AQ_TCMoneyTCM_Name.Value := DM.AT_CReg.FieldByName('CReg_Name').Value;  //姓名
      DM.AQ_TCMoneyTCM_Date.Value := DM.AT_CReg.FieldByName('CReg_Date').Value;  //日期
      end
    else
    begin
      Application.MessageBox('门诊编号不能为空，请输入', '提示', MB_ICONINFORMATION + MB_OK);
      exit;
    end;
    ButtonState(0);  //工具条按钮使能设置过程
end;

procedure TF_CMoney.ToolButton2Click(Sender: TObject);
begin  {*****编辑快捷按钮单击事件*****}
    if not DM.AQ_TCMoney.IsEmpty then  //收费单数据表非空
    begin
      DM.AQ_TCMoney.Edit;  //编辑一条病人收费单记录
      ButtonState(0);  //工具条按钮使能设置过程
    end;  
end;

procedure TF_CMoney.ToolButton3Click(Sender: TObject);
var
    iMsgFlag : integer;
begin  {*****删除快捷按钮单击事件*****}
  iMsgFlag  := Application.MessageBox('您确信要删除当前数据吗？', '确认', MB_ICONQUESTION + MB_OKCANCEL +MB_DEFBUTTON2) ;
  if iMsgFlag  = IDOK then
    DM.AQ_TCMoney.Delete;
end;

procedure TF_CMoney.ToolButton4Click(Sender: TObject);
begin  {*****提交快捷按钮单击事件*****}
    DM.AQ_TCMoney.Post;  //提交病人收费单记录数据集
    ButtonState(1);  //工具条按钮使能设置过程
end;

procedure TF_CMoney.ToolButton5Click(Sender: TObject);
begin  {*****取消快捷按钮单击事件*****}
    DM.AQ_TCMoney.Cancel;  //提交病人收费单记录数据集
    ButtonState(1);  //工具条按钮使能设置过程
end;

procedure TF_CMoney.ToolButton6Click(Sender: TObject);
begin  {*****最前条快捷按钮单击事件*****}
    DM.AQ_TCMoney.First;
end;

procedure TF_CMoney.ToolButton7Click(Sender: TObject);
begin  {*****前一条快捷按钮单击事件*****}
    if not DM.AQ_TCMoney.Eof then
      DM.AQ_TCMoney.Prior;
end;

procedure TF_CMoney.ToolButton8Click(Sender: TObject);
begin  {*****后一条快捷按钮单击事件*****}
    if not DM.AQ_TCMoney.Bof then
      DM.AQ_TCMoney.Next;
end;

procedure TF_CMoney.ToolButton9Click(Sender: TObject);
begin  {*****最后条快捷按钮单击事件*****}
    DM.AQ_TCMoney.Last;
end;

procedure TF_CMoney.ToolButton10Click(Sender: TObject);
begin  {*****查找快捷按钮单击事件*****}

end;

procedure TF_CMoney.ToolButton11Click(Sender: TObject);
begin  {*****打印快捷按钮单击事件*****}

end;

procedure TF_CMoney.ToolButton12Click(Sender: TObject);
begin  {*****退出快捷按钮单击事件*****}
   Close;
end;


procedure TF_CMoney.BitBtn1Click(Sender: TObject);
begin  {*****增加按钮单击事件*****}
    DM.AT_CMoney.Append;  //增加收费项目记录
    DM.AT_CMoney['CM_ID'] := DM.AQ_TCMoneyTCM_ID.Value;
    ButtonState(2);
end;

procedure TF_CMoney.BitBtn2Click(Sender: TObject);
var
    iMsgFlag : integer;
begin  {*****删除收费项目按钮单击事件*****}
    iMsgFlag  := Application.MessageBox('您确信要删除当前数据吗？', '确认', MB_ICONQUESTION + MB_OKCANCEL +MB_DEFBUTTON2) ;
    if iMsgFlag  = IDOK then
      DM.AT_CMoney.Delete;
end;

procedure TF_CMoney.BitBtn3Click(Sender: TObject);
begin  {*****提交收费项目数据集按钮单击事件*****}
    DM.AT_CMoney.Post;
    ButtonState(3);
end;

procedure TF_CMoney.BitBtn4Click(Sender: TObject);
begin  {*****取消提交收费项目数据集按钮单击事件*****}
    DM.AT_CMoney.Cancel;
    ButtonState(3);    
end;

procedure TF_CMoney.MaskEdit2KeyPress(Sender: TObject; var Key: Char);
begin  {*****门诊编辑数据输入框OnKeyPress事件*****}
    if (Key = #13) then        //按下回车键执行
       ToolButton1Click(self);     //调用BitBtn1按钮点击事件
end;

end.
