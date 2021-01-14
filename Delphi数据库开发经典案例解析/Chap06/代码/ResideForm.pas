unit ResideForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ParentForm, ADODB, DB, ImgList, Grids, DBGrids, ComCtrls,
  ToolWin, StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls;

type
  TReside = class(TParent)
    Label9: TLabel;
    Label7: TLabel;
    Label6: TLabel;
    Label12: TLabel;
    Label11: TLabel;
    Label10: TLabel;
    DBEdit6: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit1: TDBEdit;
    ComboBox1: TComboBox;
    Label8: TLabel;
    Label14: TLabel;
    DBEdit7: TDBEdit;
    Label15: TLabel;
    Label16: TLabel;
    DBEdit8: TDBEdit;
    Label17: TLabel;
    DBEdit9: TDBEdit;
    Label13: TLabel;
    DBEdit10: TDBEdit;
    Label18: TLabel;
    DBEdit11: TDBEdit;
    Label19: TLabel;
    DBEdit12: TDBEdit;
    Label20: TLabel;
    Label21: TLabel;
    DBEdit14: TDBEdit;
    Label22: TLabel;
    DBEdit15: TDBEdit;
    Label23: TLabel;
    DBEdit16: TDBEdit;
    Label24: TLabel;
    DBEdit17: TDBEdit;
    Label25: TLabel;
    Label26: TLabel;
    DBCheckBox1: TDBCheckBox;
    DBComboBox1: TDBComboBox;
    DBComboBox2: TDBComboBox;
    BitBtn2: TBitBtn;
    MonthCalendar1: TMonthCalendar;
    ADOCommand1: TADOCommand;
    DBComboBox3: TDBComboBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    DBCheckBox5: TDBCheckBox;
    DBEdit13: TDBEdit;
    BitBtn3: TBitBtn;
    Label27: TLabel;
    DBEdit18: TDBEdit;
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    
    procedure ComboBox1Select(Sender: TObject);
    procedure MonthCalendar1DblClick(Sender: TObject);
    procedure DBComboBox1DropDown(Sender: TObject);
    procedure DBComboBox2DropDown(Sender: TObject);
    procedure DBComboBox1Exit(Sender: TObject);
    procedure DBComboBox2Exit(Sender: TObject);
    procedure DBCheckBox1Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ToolButton10Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

   
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Reside: TReside;

implementation

{$R *.dfm}
uses RoomStatusForm,MainForm,ReservationForm;

//----根据客房的类型编号显示客房类型名称-----------
procedure TReside.DataSource1DataChange(Sender: TObject;
  Field: TField);
var
i:integer;
begin
  inherited;

  adoquery1.Close;
  adoquery1.SQL.Clear;
  adoquery1.SQL.Add('select 类型名称 from 客房类型 where 类型编号='''+dbedit2.Text+'''');
  adoquery1.Open;
  combobox1.Text:=adoquery1.fieldbyname('类型名称').AsString;
  //设置表格宽度
  dbgrid1.Columns[0].Width:=100;
  dbgrid1.Columns[1].Width:=100;
  for i:=2 to 31 do
   dbgrid1.Columns[i].Width:=64;
end;


//----------根据选择的客房类型名称反查并修改客房类型编号---------
procedure TReside.ComboBox1Select(Sender: TObject);
begin
  inherited;
  adoquery1.Close;
  adoquery1.SQL.Clear;
  adoquery1.SQL.Add('select 类型编号 from 客房类型 where 类型名称='''+combobox1.Text+'''');
  adoquery1.Open;
  dbedit2.Text:=adoquery1.fieldbyname('类型编号').AsString;
end;

//-------------------------------------------------------------
//-----------以下代码处理抵店时间和离店时间与日历显示-----------
procedure TReside.MonthCalendar1DblClick(Sender: TObject);
begin
  inherited;
  //根据单击的下拉列表框来确定把选择的时间输入到那个列表框中
  if dbcombobox1.Focused then
    dbcombobox1.SelText:=datetostr(monthcalendar1.Date);
  if dbcombobox2.Focused then
    dbcombobox2.SelText:=datetostr(monthcalendar1.Date);
  monthcalendar1.Visible:=false;

end;

procedure TReside.DBComboBox1DropDown(Sender: TObject);
begin
  inherited;
  //将数据文本框中的时间赋给日历
  if dbcombobox1.Text<>'' then
    monthcalendar1.Date:=strtodate(dbcombobox1.Text);
  //确定日历显示的位置
    monthcalendar1.Top:=dbcombobox1.Top+panel2.Top-monthcalendar1.Height;
    monthcalendar1.Left:=dbcombobox1.Left;
    monthcalendar1.Visible:=true;
end;

procedure TReside.DBComboBox2DropDown(Sender: TObject);
begin
  inherited;
    //将数据文本框中的时间赋给日历
    if dbcombobox2.Text<>'' then
    monthcalendar1.Date:=strtodate(dbcombobox2.Text);
    //确定日历显示的位置
    monthcalendar1.Top:=dbcombobox2.Top+panel2.Top-monthcalendar1.Height;
    monthcalendar1.Left:=dbcombobox2.Left;
    monthcalendar1.Visible:=true;
end;

procedure TReside.DBComboBox1Exit(Sender: TObject);
begin
  inherited;
  monthcalendar1.Visible:=false;
end;

procedure TReside.DBComboBox2Exit(Sender: TObject);
begin
  inherited;
  monthcalendar1.Visible:=false;
end;
//-----------------------------------------------------------

//--------------------编辑时，只有选择了加床才能输入加床价格-------------------------
procedure TReside.DBCheckBox1Click(Sender: TObject);
begin
  inherited;
  if dbcheckbox1.Checked then
   dbedit10.Enabled:=true
   else
   dbedit10.Enabled:=false;
end;

//--------------新增入住单-------------------------
procedure TReside.ToolButton6Click(Sender: TObject);
var
  maxnum,num:string;
  newnum:integer;
begin
  inherited;
  adoquery1.Close;
  adoquery1.SQL.Clear;
  adoquery1.SQL.Add('select max(入住单号) 最大编号 from 入住单');
  adoquery1.Open;
  maxnum:=trim(adoquery1.fieldbyname('最大编号').AsString);
  if maxnum='' then maxnum:='RZ0'; //如果当前入住单为空的话，则初始化一个编号
  //将预定单前面的RZ两个字母删除后转为整数
  Delete(maxnum,1,2);
  newnum:=strtoint(maxnum)+1;
  //重新编号并生成新的入住单号
  if length(inttostr(newnum))=1 then num:='RZ0000000'+inttostr(newnum);
  if length(inttostr(newnum))=2 then num:='RZ000000'+inttostr(newnum);
  if length(inttostr(newnum))=3 then num:='RZ00000'+inttostr(newnum);
  //设置新增入住的默认值
  dbedit1.Text:=num;
  dbcombobox1.SelText:=datetostr(date);
  dbcombobox2.SelText:=datetostr(date);
  dbedit12.Text:='入住';
  //允许直接输入房号或从预定单中导入
  bitbtn2.Enabled:=true;
  bitbtn3.Enabled:=true;
end;

//-----------选择客房编号----------
procedure TReside.BitBtn2Click(Sender: TObject);
var
 newform:Troomstatus;
begin
  inherited;
   bitbtn3.Enabled:=false;//直接选择房间则不可以再从预定单中导入
  newform:=Troomstatus.Create(application);
  newform.Button2.Enabled:=false;
  newform.Caption:='双击房态图选择房间号';
    if combobox1.Text<>'' then//如果客户提出了客房类型要求
    newform.preOrder:=dbedit2.Text
    else
    newform.preOrder:='no preorder';
  //只有双击某个房间号后才能退出该选择窗体
  newform.BorderIcons:=newform.BorderIcons-[biSystemMenu];
  dbedit13.Text:='';//直接选择客房，则不需要从预定单中导入
end;

//------------------在新增和修改时，读入双击选择窗体得到的信息------------------
procedure TReside.FormActivate(Sender: TObject);
begin
  inherited;
  if panel2.Enabled=true then
    begin
      //读入选择的房间号
      dbedit4.Text:='0'+inttostr(main.RoomNum);

      //根据房间号，确定房间类型，价格
      adoquery1.Close;
      adoquery1.SQL.Clear;
      adoquery1.SQL.Add('select a.价格,a.类型名称,a.类型编号 from 客房类型 a,客房信息 b');
      adoquery1.SQL.Add(' where (a.类型编号=b.类型编号)and(b.客房编号='''+dbedit4.Text+''')');
      adoquery1.Open;
      dbedit2.Text:=trim(adoquery1.fieldbyname('类型编号').AsString);
      combobox1.Text:=trim(adoquery1.fieldbyname('类型名称').AsString);
      dbedit5.Text:=trim(adoquery1.fieldbyname('价格').AsString);
      dbedit6.Text:=dbedit5.Text;
      if bitbtn3.Enabled=true then
      begin
      //读入选择的预定单号
      dbedit13.Text:=trim(main.YDNum);
      adoquery1.Close;
      adoquery1.SQL.Clear;
      adoquery1.SQL.Add('select * from 预定单 where 预定单号='''+trim(main.YDNum)+'''');
      adoquery1.Open;
      dbcombobox1.Text:=datetostr(adoquery1.FieldByName('抵店时间').AsDateTime);
      //导入预定单中的信息
      dbcombobox2.Text:=datetostr(adoquery1.FieldByName('离店时间').AsDateTime);
      dbedit3.Text:=trim(adoquery1.FieldByName('联系电话').AsString);
      dbedit6.Text:=trim(adoquery1.FieldByName('入住价格').AsString);
      dbedit7.Text:=trim(adoquery1.FieldByName('折扣').AsString);
      dbedit8.Text:=trim(adoquery1.FieldByName('折扣原因').AsString);
      dbedit9.Text:=trim(adoquery1.FieldByName('入住人数').AsString);
      dbcheckbox1.Checked:=adoquery1.FieldByName('是否加床').AsBoolean;
      dbedit10.Text:=trim(adoquery1.FieldByName('加床价格').AsString);
      dbedit11.Text:=trim(adoquery1.FieldByName('预收款').AsString);
      dbedit14.Text:=trim(adoquery1.FieldByName('业务员').AsString);
      dbedit15.Text:=trim(adoquery1.FieldByName('操作员').AsString);
      dbedit16.Text:=trim(adoquery1.FieldByName('会员编号').AsString);
      dbedit17.Text:=trim(adoquery1.FieldByName('预定公司').AsString);
      end;
    end;
end;


//--------------------保存入住单-------------------
procedure TReside.ToolButton10Click(Sender: TObject);
begin

  if dbedit4.Text='' then
   begin
    showmessage('客房编号不允许为空');
    exit;
   end;

    inherited;
   //先把所有状态为已经入住的房间改为空房
   adocommand1.CommandText:='update 客房信息 set 状态=''空房'' where 状态=''住房''';
   adocommand1.Execute;
   //然后根据入住单中的信息，调用储存过程，保存入住单和清除已经入住的预定单
   datasource1.DataSet.First;
   while not datasource1.DataSet.Eof do
    begin
      adocommand1.CommandText:='exec sf_保存入住单 '''+dbedit1.Text+'''';
      adocommand1.Execute;
      datasource1.DataSet.Next;
    end;
    
end;

//---------------从预定单中导入------------------
procedure TReside.BitBtn3Click(Sender: TObject);
var
  newform:Treservation;
begin
  inherited;
  //从预定单中导入预定房间则不允许再指定房间
  bitbtn2.Enabled:=false;
  newform:=Treservation.Create(application);
  newform.Caption:='双击表格选择预定单号';
  newform.BorderIcons:=newform.BorderIcons-[biSystemMenu];//不允许未选择就关闭
  //只能使用导航条和选择数据
  newform.ToolButton6.Enabled:=false;
  newform.ToolButton7.Enabled:=false;
  newform.ToolButton8.Enabled:=false;
  newform.ToolButton10.Enabled:=false;
  newform.ToolButton11.Enabled:=false;
end;

//-----------修改入住单-----------------
procedure TReside.ToolButton7Click(Sender: TObject);
begin
  inherited;
  //已经入住的客人修改时不能再从预定单导入
  bitbtn3.Enabled:=false;
  //但是允许改变入住房间
  bitbtn2.Enabled:=true;
end;

//-----------供其他窗体调用选择入住单编号-----------------
procedure TReside.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  if (toolbutton6.Enabled=false)and(toolbutton10.Enabled=false) then
   if dbgrid1.Fields[0].Text<>'' then
    begin
      main.RZNum:=trim(dbgrid1.Fields[0].Text);
      close;
    end;
end;

//----------窗体显示时，设置类型名称的下拉列表选项-------------
procedure TReside.FormCreate(Sender: TObject);
begin
  inherited;
  adoquery1.Close;
  adoquery1.SQL.Clear;
  adoquery1.SQL.Add('select distinct 类型名称 from 客房类型');
  adoquery1.Open;
  combobox1.Items.Clear;
  while not adoquery1.Eof do
   begin
    combobox1.Items.Add(adoquery1.fieldbyname('类型名称').AsString);
    adoquery1.Next
   end;
end;

end.
