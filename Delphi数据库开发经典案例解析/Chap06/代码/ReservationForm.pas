unit ReservationForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ParentForm, ADODB, DB, ImgList, Grids, DBGrids, ComCtrls,
  ToolWin, StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls;

type
  TReservation = class(TParent)
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
    DBEdit13: TDBEdit;
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
    procedure ToolButton8Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
   
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Reservation: TReservation;

implementation

{$R *.dfm}
uses RoomStatusForm,MainForm;

//----------窗体显示时，设置类型名称的下拉列表选项-------------
procedure TReservation.FormCreate(Sender: TObject);
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

//----------------设置表格宽度和显示客房类型名称--------------------
procedure TReservation.DataSource1DataChange(Sender: TObject;
  Field: TField);
var
 i:integer;
begin
  inherited;
  //根据客房的类型编号显示客房类型名称
  adoquery1.Close;
  adoquery1.SQL.Clear;
  adoquery1.SQL.Add('select 类型名称 from 客房类型 where 类型编号='''+dbedit2.Text+'''');
  adoquery1.Open;
  combobox1.Text:=adoquery1.fieldbyname('类型名称').AsString;

  //设置表格宽度
  dbgrid1.Columns[0].Width:=100;
  for i:=1 to 20 do
   dbgrid1.Columns[i].Width:=64;
end;


//----------根据选择的客房类型名称反查并修改客房类型编号---------
procedure TReservation.ComboBox1Select(Sender: TObject);
begin
  inherited;
  adoquery1.Close;
  adoquery1.SQL.Clear;
  adoquery1.SQL.Add('select 类型编号 from 客房类型 where 类型名称='''+combobox1.Text+'''');
  adoquery1.Open;
  dbedit2.Text:=adoquery1.fieldbyname('类型编号').AsString;
end;

//-------------------------------------------------------------
//------------以下代码处理抵店时间和离店时间与日历显示------
procedure TReservation.MonthCalendar1DblClick(Sender: TObject);
begin
  inherited;
  //根据单击的下拉列表框来确定把选择的时间输入到那个列表框中
  if dbcombobox1.Focused then
    dbcombobox1.SelText:=datetostr(monthcalendar1.Date);
  if dbcombobox2.Focused then
    dbcombobox2.SelText:=datetostr(monthcalendar1.Date);
    monthcalendar1.Visible:=false;
end;

procedure TReservation.DBComboBox1DropDown(Sender: TObject);
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

procedure TReservation.DBComboBox2DropDown(Sender: TObject);
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

procedure TReservation.DBComboBox1Exit(Sender: TObject);
begin
  inherited;
  monthcalendar1.Visible:=false;
end;

procedure TReservation.DBComboBox2Exit(Sender: TObject);
begin
  inherited;
  monthcalendar1.Visible:=false;
end;
//-----------------------------------------------------------

//--------------------编辑时，只有选择了加床才能输入加床价格-------------------------
procedure TReservation.DBCheckBox1Click(Sender: TObject);
begin
  inherited;
  if dbcheckbox1.Checked then
   dbedit10.Enabled:=true
   else
   dbedit10.Enabled:=false;
end;

//--------------新增预定单-------------------------
procedure TReservation.ToolButton6Click(Sender: TObject);
var
  maxnum,num:string;
  newnum:integer;
begin
  inherited;
  adoquery1.Close;
  adoquery1.SQL.Clear;
  adoquery1.SQL.Add('select max(预定单号) 最大编号 from 预定单');
  adoquery1.Open;
  maxnum:=trim(adoquery1.fieldbyname('最大编号').AsString);
  if maxnum='' then maxnum:='YD0';
  //将预定单前面的YD两个字母删除后转为整数
  Delete(maxnum,1,2);
  newnum:=strtoint(maxnum)+1;
  //重新编号并生成新的预定单号
  if length(inttostr(newnum))=1 then num:='YD0000000'+inttostr(newnum);
  if length(inttostr(newnum))=2 then num:='YD000000'+inttostr(newnum);
  if length(inttostr(newnum))=3 then num:='YD00000'+inttostr(newnum);
  //设置新增订单的默认值
  dbedit1.Text:=num;
  dbcombobox1.SelText:=datetostr(date);
  dbcombobox2.SelText:=datetostr(date);
  dbedit12.Text:='预定';
  dbedit13.Text:=' ';
end;

//-----------选择客房编号----------
procedure TReservation.BitBtn2Click(Sender: TObject);
var
 newform:Troomstatus;
begin
  inherited;
  newform:=Troomstatus.Create(application);
  newform.Button2.Enabled:=false;
  newform.Caption:='双击房态图选择房间号';
  if combobox1.Text<>'' then//如果客户提出了客房类型要求
    newform.preOrder:=dbedit2.Text
    else
    newform.preOrder:='no preorder';
  //只有双击某个房间号后才能退出该选择窗体
  newform.BorderIcons:=newform.BorderIcons-[biSystemMenu]

end;

//--------------在选择客房时读入双击选择的客房编号---------------
procedure TReservation.FormActivate(Sender: TObject);
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
    end;
end;


//--------------保存数据，并检查一些必须输入的字段--------------------
procedure TReservation.ToolButton10Click(Sender: TObject);
begin
  if dbedit4.Text='' then
   begin
    showmessage('客房编号不允许为空');
    exit;
   end;

   //请注意该行代码的位置，此处先提交保存
   inherited;

   //先把所有状态为将到的房间改为空房
   adocommand1.CommandText:='update 客房信息 set 状态=''空房'' where 状态=''将到''';
   adocommand1.Execute;
   //然后根据预定单中的信息，将有预定的房间状态改为将到
   datasource1.DataSet.First;
   while not datasource1.DataSet.Eof do
    begin
      adocommand1.CommandText:='update 客房信息 set 状态=''将到'' where 客房编号='''+dbedit4.Text+'''';
      adocommand1.Execute;
      datasource1.DataSet.Next;
    end;
end;

//--------------------删除预定单--------------------
procedure TReservation.ToolButton8Click(Sender: TObject);
begin
  if application.MessageBox('是否删除预定单？','确认',MB_OKCANCEL)=IDOK then
    begin
    //先将该订单对应的房间状态改回空房状态，再删除订单
    adocommand1.CommandText:='update 客房信息 set 状态=''空房'' where 客房编号='''+dbedit4.Text+'''';
    adocommand1.Execute;
    datasource1.DataSet.Delete;
    end;
  //inherited; 不执行父窗体中的代码

end;
//-------------------供其他窗体调用时选择预定单号和客房编号--------------------
procedure TReservation.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  if self.Caption='双击表格选择预定单号' then
    if dbgrid1.Fields[0].Text<>'' then
    begin
      main.YDNum:=dbgrid1.Fields[0].Text;
      main.RoomNum:=strtoint(trim(dbgrid1.Fields[1].Text));
      close;
    end;
end;



end.
