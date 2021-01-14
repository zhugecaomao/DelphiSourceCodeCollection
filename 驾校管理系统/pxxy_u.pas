unit pxxy_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask, ComCtrls, TabNotBk, DB, DBTables,
  Buttons, ExtCtrls, Grids, DBGridEh, PrnDbgeh;

type
  Tpxxy = class(TForm)
    DataSource1: TDataSource;
    Table1: TTable;
    Database1: TDatabase;
    Table1BDEDesigner: TStringField;
    Table1BDEDesigner2: TStringField;
    Table1BDEDesigner3: TStringField;
    Table1BDEDesigner4: TStringField;
    Table1BDEDesigner5: TDateTimeField;
    Table1BDEDesigner6: TFloatField;
    Table1BDEDesigner7: TFloatField;
    Table1BDEDesigner8: TFloatField;
    Table1BDEDesigner9: TDateTimeField;
    Table2: TTable;
    Table2BDEDesigner: TStringField;
    Table2BDEDesigner2: TStringField;
    Table2BDEDesigner3: TFloatField;
    Table2BDEDesigner4: TFloatField;
    Table2BDEDesigner5: TFloatField;
    Table2BDEDesigner6: TFloatField;
    Table2BDEDesigner7: TStringField;
    Table2BDEDesigner8: TDateTimeField;
    Table2BDEDesigner9: TStringField;
    DataSource2: TDataSource;
    Table3: TTable;
    Table3BDEDesigner2: TStringField;
    DataSource3: TDataSource;
    Label18: TLabel;
    Table3BDEDesigner: TMemoField;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
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
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    SpeedButton1: TSpeedButton;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit3: TEdit;
    GroupBox2: TGroupBox;
    DBMemo1: TDBMemo;
    GroupBox3: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    Panel1: TPanel;
    DBNavigator1: TDBNavigator;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    TabSheet2: TTabSheet;
    DataSource4: TDataSource;
    Query1: TQuery;
    DBGridEh1: TDBGridEh;
    Panel2: TPanel;
    Label19: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Edit13: TEdit;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    PrintDBGridEh1: TPrintDBGridEh;
    procedure Edit1Exit(Sender: TObject);
    procedure Table2BeforePost(DataSet: TDataSet);
    procedure Table2AfterInsert(DataSet: TDataSet);
    procedure Table2BeforeScroll(DataSet: TDataSet);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure ComboBox1DropDown(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  pxxy: Tpxxy;

implementation

uses pub_search_u, public_var;

{$R *.dfm}

procedure Tpxxy.Edit1Exit(Sender: TObject);
begin
  with table1 do
  begin
     if (edit1.Text<>'') and (Locate('学号',edit1.Text,[locaseinsensitive])) then
     begin
       edit1.text:=fieldbyname('学号').AsString;
       edit2.Text:=fieldbyname('姓名').AsString;
       edit3.Text:=fieldbyname('身份证号').AsString;
       edit4.Text:=fieldbyname('学习车型').AsString;
       edit6.Text:=fieldbyname('应付学费').AsString;
       edit7.Text:=fieldbyname('首付').AsString;
       edit8.Text:=fieldbyname('第二次付费').AsString;
       edit9.text:=fieldbyname('第二次付费日期').AsString;
       edit10.Text:=fieldbyname('报名时间').AsString;
       exit;
     end;
     if (edit1.Text<>'') and (not locate('学号',edit1.Text,[locaseinsensitive])) then
     begin
       MessageDlg('没有此学号！', mtWarning, [mbOk], 0);
     end;
  end;
end;

procedure Tpxxy.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then edit5.setfocus;
end;

procedure Tpxxy.SpeedButton1Click(Sender: TObject);
var
  mysqlstr:string;
  search_tmpstr:variant;
begin
  search_tmpstr:=Edit1.Text;
  pub_search:=Tpub_search.Create(self);
  mysqlstr:='select 学号,姓名,身份证号,学习车型,应付学费,第二次付费,第二次付费日期,报名时间 from student';
  pub_search.myselect(mysqlstr,'学员档案');
  pub_search.ShowModal;
  if (search_tmpstr<>myarr[0]) and (myarr[0]<>'') then
  begin
    Edit1.Text:=myarr[0];
    table2.Edit;
  end;
  //判断edit1是否有焦点
  if not Edit1.Focused then edit1.SetFocus;
    Edit5.SetFocus;
end;

procedure Tpxxy.Table2BeforePost(DataSet: TDataSet);
begin
   table2.FieldValues['学号']:=edit1.Text;
end;

procedure Tpxxy.Table2AfterInsert(DataSet: TDataSet);
begin
   edit1.text:='';
   edit2.Text:='';
   edit3.Text:='';
   edit4.Text:='';
   edit5.Text:='';
   edit6.Text:='';
   edit7.Text:='';
   edit8.text:='';
   edit9.Text:='';
   edit10.text:='';
   edit11.Text:='';
   edit12.text:='';
   table2.FieldValues['建档人']:='';
   table2.FieldValues['建档日期']:=datetostr(now);
end;

procedure Tpxxy.Table2BeforeScroll(DataSet: TDataSet);
begin
   table1.Locate('学号',table2.FieldValues['学号'],[locaseinsensitive]);
  with table1 do
  begin
    edit1.text:=FieldValues['学号'];
    if fieldvalues['姓名']<>null then
    edit2.Text:=fieldvalues['姓名']
    else
    edit2.Text:='';
    if fieldvalues['身份证号']<>null then
    edit3.Text:=fieldvalues['身份证号']
    else
    edit3.Text:='';
    if fieldvalues['学习车型']<>null then
    edit4.Text:=fieldvalues['学习车型']
    else
     edit4.Text:='';
     if fieldvalues['应付学费']<>null then
         edit6.Text:=inttostr(fieldvalues['应付学费'])
     else
         edit6.Text:='';
     if fieldvalues['首付']<>null then
         edit7.Text:=inttostr(fieldvalues['首付'])
     else
         edit7.Text:='';
     if fieldvalues['第二次付费']<>null then
        edit8.Text:=inttostr(fieldvalues['第二次付费'])
     else
        edit8.Text:='';
     if fieldvalues['第二次付费日期']<>null then
         edit9.text:=datetostr(fieldvalues['第二次付费日期'])
     else
         edit9.text:='';
     if fieldvalues['报名时间']<>null then
         edit10.Text:=datetostr(fieldvalues['报名时间'])
     else
         edit10.Text:='';
    edit11.Text:='0'; //inttostr(fieldvalues['补考费']);
    edit12.Text:='0';  //inttostr(fieldvalues['重考费']);
  end;
end;

procedure Tpxxy.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   pxxy.free;
end;

procedure Tpxxy.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure Tpxxy.BitBtn3Click(Sender: TObject);
var
   sqlstr:string;
begin
 if combobox1.text<>'' then
 begin
   sqlstr:='SELECT Stu.姓名,Stu.身份证号,Stu.学习车型,pxxy.学号,pxxy.训练方式,pxxy.补考费,pxxy.重考费,pxxy.缴费金额大写,pxxy.缴费金额小写,pxxy.法人代表,pxxy.建档日期,pxxy.建档人 FROM student stu,培训协议 pxxy WHERE (pxxy.学号=Stu.学号)';
   query1.Close;
   query1.SQL.Clear;
   if edit1.text<>'' then
   begin
     sqlstr:=sqlstr+'and '+ComboBox1.Text+ComboBox2.Text+''''+Edit13.Text+'''';
     query1.SQL.Add(sqlstr)
   end
   else
     query1.SQL.Add(sqlstr);
   //if not Prepared then  Prepare; //做好准备
   query1.Open;
   if query1.RecordCount=0 then
      showmessage('无相关记录！');
 end
 else
   showmessage('没有选择查询条件！');
end;

procedure Tpxxy.BitBtn5Click(Sender: TObject);
begin
  printdbgrideh1.Preview;
end;

procedure Tpxxy.ComboBox1DropDown(Sender: TObject);
var
  i:integer;
begin
  for i:=0 to table1.Fields.Count-6 do
      combobox1.Items.Add(table1.Fields[i].FieldName);

  for i:=1 to table2.Fields.Count-1 do
      combobox1.Items.Add(table2.Fields[i].FieldName);
end;

end.
