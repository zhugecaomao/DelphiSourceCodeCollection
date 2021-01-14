unit lkcycj_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, Mask, DBCtrls, DB, DBTables,
  ComCtrls, Grids, DBGridEh, frxClass, frxDBSet, frxDesgn, frxChBox;

type
  Tlkcycj = class(TForm)
    Label1: TLabel;
    DataSource1: TDataSource;
    Table1: TTable;
    Database1: TDatabase;
    Table1BDEDesigner2: TStringField;
    Table1BDEDesigner3: TStringField;
    Table1BDEDesigner4: TStringField;
    Table1BDEDesigner5: TStringField;
    Table1BDEDesigner6: TStringField;
    DataSource2: TDataSource;
    Table2: TTable;
    Table2BDEDesigner: TStringField;
    Table2BDEDesigner2: TBooleanField;
    Table2BDEDesigner3: TDateTimeField;
    Table2BDEDesigner4: TBooleanField;
    Table2BDEDesigner30CM: TBooleanField;
    Table2BDEDesigner5: TBooleanField;
    Table2BDEDesigner6: TBooleanField;
    Table2BDEDesigner7: TBooleanField;
    Table2BDEDesigner8: TBooleanField;
    Table2BDEDesigner9: TBooleanField;
    Table2BDEDesigner10: TBooleanField;
    Table2BDEDesigner11: TBooleanField;
    Table2BDEDesigner12: TBooleanField;
    Table2BDEDesigner13: TBooleanField;
    Table2BDEDesigner14: TBooleanField;
    Table2BDEDesigner15: TBooleanField;
    Table2BDEDesigner16: TBooleanField;
    Table2BDEDesigner17: TBooleanField;
    Table2BDEDesigner18: TBooleanField;
    Table2BDEDesigner19: TBooleanField;
    Table2BDEDesigner20: TBooleanField;
    Table2BDEDesigner21: TBooleanField;
    Table2BDEDesigner22: TBooleanField;
    Table2BDEDesigner23: TBooleanField;
    Table2BDEDesigner24: TBooleanField;
    Table2BDEDesigner25: TBooleanField;
    Table2BDEDesigner26: TBooleanField;
    Table2BDEDesigner27: TBooleanField;
    Table2BDEDesigner50CM: TBooleanField;
    Table2BDEDesigner30CM2: TBooleanField;
    Table2BDEDesigner28: TBooleanField;
    Table2BDEDesigner20KM: TBooleanField;
    Table2BDEDesigner29: TBooleanField;
    Table2BDEDesigner30: TBooleanField;
    Table2BDEDesigner31: TBooleanField;
    Table2BDEDesigner32: TBooleanField;
    Table2BDEDesigner33: TBooleanField;
    Table2BDEDesigner34: TBooleanField;
    Table2BDEDesigner35: TBooleanField;
    Table2BDEDesigner36: TBooleanField;
    Table2BDEDesigner37: TBooleanField;
    Table2BDEDesigner38: TStringField;
    Table2BDEDesigner39: TDateTimeField;
    Table1BDEDesigner: TStringField;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label8: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    SpeedButton2: TSpeedButton;
    Label6: TLabel;
    SpeedButton3: TSpeedButton;
    Edit5: TEdit;
    Edit4: TEdit;
    Edit3: TEdit;
    Edit2: TEdit;
    Edit1: TEdit;
    DBEdit6: TDBEdit;
    DateTimePicker1: TDateTimePicker;
    DBRadioGroup1: TDBRadioGroup;
    GroupBox2: TGroupBox;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    DBCheckBox5: TDBCheckBox;
    DBCheckBox6: TDBCheckBox;
    DBCheckBox7: TDBCheckBox;
    DBCheckBox8: TDBCheckBox;
    DBCheckBox9: TDBCheckBox;
    DBCheckBox10: TDBCheckBox;
    DBCheckBox11: TDBCheckBox;
    DBCheckBox12: TDBCheckBox;
    DBCheckBox13: TDBCheckBox;
    DBCheckBox14: TDBCheckBox;
    DBCheckBox15: TDBCheckBox;
    DBCheckBox16: TDBCheckBox;
    DBCheckBox17: TDBCheckBox;
    DBCheckBox18: TDBCheckBox;
    DBCheckBox19: TDBCheckBox;
    DBCheckBox20: TDBCheckBox;
    DBCheckBox21: TDBCheckBox;
    DBCheckBox22: TDBCheckBox;
    DBCheckBox23: TDBCheckBox;
    DBCheckBox24: TDBCheckBox;
    DBCheckBox25: TDBCheckBox;
    DBCheckBox26: TDBCheckBox;
    DBCheckBox27: TDBCheckBox;
    DBCheckBox28: TDBCheckBox;
    DBCheckBox29: TDBCheckBox;
    DBCheckBox30: TDBCheckBox;
    DBCheckBox31: TDBCheckBox;
    DBCheckBox32: TDBCheckBox;
    DBCheckBox33: TDBCheckBox;
    DBCheckBox34: TDBCheckBox;
    DBCheckBox35: TDBCheckBox;
    DBCheckBox36: TDBCheckBox;
    DBCheckBox37: TDBCheckBox;
    DBCheckBox38: TDBCheckBox;
    Panel1: TPanel;
    DBNavigator1: TDBNavigator;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    TabSheet2: TTabSheet;
    Panel2: TPanel;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Panel3: TPanel;
    DBNavigator3: TDBNavigator;
    Label10: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Label11: TLabel;
    Edit6: TEdit;
    BitBtn5: TBitBtn;
    DBGridEh1: TDBGridEh;
    DataSource3: TDataSource;
    Query1: TQuery;
    frxDesigner1: TfrxDesigner;
    frxDBDataset1: TfrxDBDataset;
    frxReport1: TfrxReport;
    frxCheckBoxObject1: TfrxCheckBoxObject;
    procedure DateTimePicker1Change(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Table2BeforePost(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure Table2AfterInsert(DataSet: TDataSet);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4Exit(Sender: TObject);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Edit5Exit(Sender: TObject);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Table2AfterScroll(DataSet: TDataSet);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure frxReport1ProgressStart(Sender: TfrxReport;
      ProgressType: TfrxProgressType; Progress: Integer);
    procedure frxReport1GetValue(const VarName: String;
      var Value: Variant);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  lkcycj: Tlkcycj;
  //comitem_clsname:string;

implementation

uses pub_search_u, public_var;

{$R *.dfm}

procedure Tlkcycj.DateTimePicker1Change(Sender: TObject);
begin
    dbedit6.Text:=datetostr(datetimepicker1.date);
end;

procedure Tlkcycj.Table2BeforePost(DataSet: TDataSet);
begin
  with table2 do
  begin
    FieldValues['学号']:=table1.FieldValues['学号'];
    FieldValues['不关车门']:=DBCheckBox1.Checked;
    FieldValues['后溜大于30CM']:=DBCheckBox2.Checked;
    FieldValues['跑方向']:=DBCheckBox3.Checked;
    FieldValues['双手脱把']:=DBCheckBox4.Checked;
    FieldValues['低头看档']:=DBCheckBox5.Checked;
    FieldValues['空档滑行']:=DBCheckBox6.Checked;
    FieldValues['挂错档']:=DBCheckBox7.Checked;
    FieldValues['熄火']:=DBCheckBox8.Checked;
    FieldValues['响齿']:=DBCheckBox9.Checked;
    FieldValues['协调差']:=DBCheckBox10.Checked;
    FieldValues['掉桥']:=DBCheckBox11.Checked;
    FieldValues['抢档不入']:=DBCheckBox12.Checked;
    FieldValues['扎中心线']:=DBCheckBox13.Checked;
    FieldValues['强行超车']:=DBCheckBox14.Checked;
    FieldValues['不鸣号']:=DBCheckBox15.Checked;
    FieldValues['车身位置感觉差']:=DBCheckBox16.Checked;
    FieldValues['不拉手刹']:=DBCheckBox17.Checked;
    FieldValues['不松手刹']:=DBCheckBox18.Checked;
    FieldValues['不检查仪表']:=DBCheckBox19.Checked;
    FieldValues['制动不平顺']:=DBCheckBox20.Checked;
    FieldValues['不会使用转向灯']:=DBCheckBox21.Checked;
    FieldValues['不会使用二脚离合器']:=DBCheckBox22.Checked;
    FieldValues['起步油门过大']:=DBCheckBox23.Checked;
    FieldValues['车轮出线']:=DBCheckBox24.Checked;
    FieldValues['定点停车过点']:=DBCheckBox25.Checked;
    FieldValues['停车横纵向距离大于50CM']:=DBCheckBox26.Checked;
    FieldValues['停车距右边线大于30CM']:=DBCheckBox27.Checked;
    FieldValues['不系保险带']:=DBCheckBox28.Checked;
    FieldValues['过限制门车速低于20KM']:=DBCheckBox29.Checked;
    FieldValues['百米不能完成加减档']:=DBCheckBox30.Checked;
    FieldValues['抢道行驶']:=DBCheckBox31.Checked;
    FieldValues['违返路口规定']:=DBCheckBox32.Checked;
    FieldValues['不按导向线行车']:=DBCheckBox33.Checked;
    FieldValues['加档不加油']:=DBCheckBox34.Checked;
    FieldValues['减档不松油']:=DBCheckBox35.Checked;
    FieldValues['空油时机与大小欠准']:=DBCheckBox36.Checked;
    FieldValues['起步窜动']:=DBCheckBox37.Checked;
    FieldValues['不能根据目标做相应动作']:=DBCheckBox38.Checked;
  end;
end;

procedure Tlkcycj.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    query1.Close;
    lkcycj.Destroy;
end;

procedure Tlkcycj.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure Tlkcycj.Table2AfterInsert(DataSet: TDataSet);
var
  i:integer;
begin
  dbedit7.Text:=''; //建档人
  dbedit8.Text:=datetostr(date);
  //初始化edit为空
  for i:=0 to groupbox1.ControlCount-1 do
    if (groupbox1.Controls[i] is TEdit) then
      (groupbox1.controls[i] as TEdit).Text:='';

  //初始化DBCheckBox为'false'
  for i:=0 to groupbox2.ControlCount-1 do
    if  (groupbox2.Controls[i] is TDBCheckBox) then
      (groupbox2.Controls[i] as TDBCheckBox).Checked:=false;
end;

procedure Tlkcycj.Edit1Exit(Sender: TObject);
begin
with table1 do
 begin
    if (edit1.Text<>'') and (locate('姓名',edit1.Text,[loCaseInsensitive])) then
     begin
         edit1.Text:=fieldbyname('姓名').AsString;
         edit2.Text:=fieldbyname('性别').AsString;
         edit3.Text:=fieldbyname('学习车型').AsString;
         edit4.Text:=fieldbyname('身份证号').AsString;
         edit5.Text:=fieldbyname('准考证编号').AsString;
         exit;
     end;
    if (edit1.Text<>'') and (not locate('姓名',edit1.Text,[locaseinsensitive])) then
    begin
    MessageDlg('没有此人！', mtWarning, [mbOk], 0);
    exit;
    end;
   end;
end;

procedure Tlkcycj.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then
      dbradiogroup1.SetFocus
   else
      if table2.state<>dsedit then table2.Edit;
end;

procedure Tlkcycj.Edit4Exit(Sender: TObject);
begin
with table1 do
 begin
    if (edit4.Text<>'') and (locate('身份证号',edit4.Text,[loCaseInsensitive])) then
     begin
         edit1.Text:=fieldbyname('姓名').AsString;
         edit2.Text:=fieldbyname('性别').AsString;
         edit3.Text:=fieldbyname('学习车型').AsString;
         edit4.Text:=fieldbyname('身份证号').AsString;
         edit5.Text:=fieldbyname('准考证编号').AsString;
         exit;
     end;
    if (edit4.Text<>'') and (not locate('身份证号',edit4.Text,[locaseinsensitive])) then
    begin
    MessageDlg('无此记录！', mtWarning, [mbOk], 0);
    exit;
    end;
   end;
end;

procedure Tlkcycj.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then
      dbradiogroup1.SetFocus
   else
      if table2.state<>dsedit then table2.Edit;
end;

procedure Tlkcycj.Edit5Exit(Sender: TObject);
begin
with table1 do
 begin
    if (edit5.Text<>'') and (locate('准考证编号',edit5.Text,[loCaseInsensitive])) then
     begin
         edit1.Text:=fieldbyname('姓名').AsString;
         edit2.Text:=fieldbyname('性别').AsString;
         edit3.Text:=fieldbyname('学习车型').AsString;
         edit4.Text:=fieldbyname('身份证号').AsString;
         edit5.Text:=fieldbyname('准考证编号').AsString;
         exit;
     end;
    if (edit5.Text<>'') and (not locate('准考证编号',edit5.Text,[locaseinsensitive])) then
    begin
    MessageDlg('无此记录！', mtWarning, [mbOk], 0);
    exit;
    end;
   end;
end;

procedure Tlkcycj.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then
      dbradiogroup1.SetFocus
   else
      if table2.state<>dsedit then table2.Edit;
end;

procedure Tlkcycj.SpeedButton1Click(Sender: TObject);
var
  mysqlstr:string;
  search_tmpstr:variant;
begin
  search_tmpstr:=Edit1.Text;
  pub_search:=Tpub_search.Create(self);
  mysqlstr:='select 学号,姓名,性别,学习车型 as 证别,身份证号,准考证编号 from student';
  pub_search.myselect(mysqlstr,'学员档案');
  pub_search.ShowModal;
  if (search_tmpstr<>myarr[1]) and (myarr[1]<>'') then
  begin
    Edit1.Text:=myarr[1];
    table2.Edit;
  end;
  //设置自身为有焦点
  if not Edit1.Focused then edit1.SetFocus;
    dbradiogroup1.SetFocus; //设置下一控件焦点
end;

procedure Tlkcycj.SpeedButton2Click(Sender: TObject);
var
  mysqlstr:string;
  search_tmpstr:variant;
begin
  search_tmpstr:=Edit4.Text;
  pub_search:=Tpub_search.Create(self);
  mysqlstr:='select 学号,姓名,性别,学习车型 as 证别,身份证号,准考证编号 from student';
  pub_search.myselect(mysqlstr,'学员档案');
  pub_search.ShowModal;
  if (search_tmpstr<>myarr[1]) and (myarr[1]<>'') then
  begin
    Edit4.Text:=myarr[4];
    table2.Edit;
  end;
  //设置自身为有焦点
  if not Edit4.Focused then edit4.SetFocus;
    dbradiogroup1.SetFocus;  //设置下一控件焦点
end;

procedure Tlkcycj.SpeedButton3Click(Sender: TObject);
var
  mysqlstr:string;
  search_tmpstr:variant;
begin
  search_tmpstr:=Edit5.Text;
  pub_search:=Tpub_search.Create(self);
  mysqlstr:='select 学号,姓名,性别,学习车型 as 证别,身份证号,准考证编号 from student';
  pub_search.myselect(mysqlstr,'学员档案');
  pub_search.ShowModal;
  if (search_tmpstr<>myarr[1]) and (myarr[1]<>'') then
  begin
    Edit5.Text:=myarr[5];
    table2.Edit;
  end;
  //设置自身为有焦点
  if not Edit5.Focused then edit5.SetFocus;
    dbradiogroup1.SetFocus;  //设置下一控件焦点
end;

procedure Tlkcycj.Table2AfterScroll(DataSet: TDataSet);
begin
  if table2.state<>dsinsert then
  begin
    with table1 do
    begin
      Locate('学号',table2.fieldbyname('学号').AsString,[]);
      edit1.Text:=fieldbyname('姓名').AsString;
      edit2.Text:=fieldbyname('性别').AsString;
      edit3.Text:=fieldbyname('学习车型').AsString;
      edit4.Text:=fieldbyname('身份证号').AsString;
      edit5.Text:=fieldbyname('准考证编号').AsString;
    end;
  end;
end;

procedure Tlkcycj.FormCreate(Sender: TObject);
var
  sqlstr:string;
  wherestr:string;
  i:integer;
begin
  //初始化combobox_items
  with query1 do
  begin
    close;
    sql.Clear;
    sqlstr:='SELECT a.姓名, a.性别, a.身份证号, a.学习车型, a.准考证编号, b.* FROM Student a, 路考测验成绩 b';
    wherestr:='WHERE  a.学号 = b.学号 ';
    sql.Add(sqlstr);
    sql.Add(wherestr);
    open;
    for i:=0 to FieldCount-1 do
      combobox1.Items.Add(Fields[i].FieldName);
    combobox1.ItemIndex:=0;
    close;
  end;
end;

procedure Tlkcycj.BitBtn5Click(Sender: TObject);
var
  comitem_clsname:string;
  wherestr:string;
begin
  query1.Open;
  comitem_clsname:=query1.FieldByName(combobox1.Text).ClassName;
  with query1 do
  begin
    close;
    sql.Clear;
    wherestr:='WHERE  a.学号 = b.学号 ';
    sql.Add('SELECT a.姓名, a.性别, a.身份证号, a.学习车型, a.准考证编号, case b.成绩 when True then '+'及格'+' else '+'不及格'+' end  as 成绩,b.测验时间, b.建档人, b.建档日期,');
    sql.add('b.不关车门, b.后溜大于30CM, b.跑方向, b.双手脱把, b.低头看档, b.空档滑行, b.挂错档, b.熄火, b.响齿, 协调差, b.掉桥, b.抢档不入, b.扎中心线, b.强行超车, b.不鸣号, b.车身位置感觉差, b.不拉手刹, b.不松手刹, b.不检查仪表, b.制动不平顺, ');
    sql.add('b.不会使用转向灯, b.不会使用二脚离合器,b.起步油门过大, b.车轮出线, b.定点停车过点, b.停车横纵向距离大于50CM, b.停车距右边线大于30CM, b.不系保险带, b.过限制门车速低于20KM, b.百米不能完成加减档, b.抢道行驶, ');
    sql.Add('b.违返路口规定, b.不按导向线行车, b.加档不加油, b.减档不松油, b.空油时机与大小欠准, b.起步窜动, b.不能根据目标做相应动作 from Student a,路考测验成绩 b');
    sql.Add(wherestr);
    if edit6.text<>'' then
    begin
      showmessage(comitem_clsname);
      if comitem_clsname='TStringField' then
        wherestr:='and '+combobox1.Text+' '+combobox2.Text+' '+''''+edit6.Text+'''';
      if comitem_clsname='TDateTimeField' then
        wherestr:='and b.'+combobox1.Text+' '+combobox2.Text+' #'+edit6.Text+'#';
      if (comitem_clsname='TIntegerField') or (comitem_clsname='TBooleanField') then
        wherestr:='and '+combobox1.Text+' '+combobox2.Text+' '+edit6.Text;
      sql.add(wherestr);
    end;
    if not Prepared then Prepare;
    open;
  end;
  if query1.RecordCount=0 then
    showmessage('无记录')
  else
    dbgrideh1.datasource:=datasource3;
end;



procedure Tlkcycj.frxReport1ProgressStart(Sender: TfrxReport;
  ProgressType: TfrxProgressType; Progress: Integer);
begin
  if frxdbDataSet1.Value['成绩'] then
    //frxreport1.page.comco['成绩']:='及格'
  else
    //frVariables['成绩']:='不及格';
    
end;

procedure Tlkcycj.frxReport1GetValue(const VarName: String;
  var Value: Variant);
begin
  {
  if VarName='Memo9' then
    if query1.FieldByName('成绩').AsBoolean then
      Value:='及格'
    else
      Value:='不及格';
   }
end;

end.
