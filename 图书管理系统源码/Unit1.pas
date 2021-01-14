unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, Menus, ImgList, Buttons, ExtCtrls, XPMenu, DB
  , ADODB, Grids, DBGrids, StdCtrls, JPEG, IniFiles;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    StatusBar1: TStatusBar;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ImageList1: TImageList;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    Panel1: TPanel;
    ScrollBox1: TScrollBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Panel2: TPanel;
    Panel4: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TreeView1: TTreeView;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    ImageList2: TImageList;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    Edit1: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    Edit3: TEdit;
    Label3: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Image1: TImage;
    DBGrid2: TDBGrid;
    CheckBox1: TCheckBox;
    Edit4: TEdit;
    Button4: TButton;
    Label4: TLabel;
    TabSheet4: TTabSheet;
    DBGrid3: TDBGrid;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Edit12: TEdit;
    Label14: TLabel;
    Button8: TButton;
    SpeedButton6: TSpeedButton;
    TabSheet5: TTabSheet;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    ComboBox3: TComboBox;
    Edit16: TEdit;
    Edit17: TEdit;
    Edit18: TEdit;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Panel5: TPanel;
    Image2: TImage;
    Button9: TButton;
    Button10: TButton;
    DBGrid4: TDBGrid;
    Button11: TButton;
    Edit19: TEdit;
    Button12: TButton;
    Label22: TLabel;
    SpeedButton7: TSpeedButton;
    Button13: TButton;
    TabSheet6: TTabSheet;
    Edit20: TEdit;
    Edit21: TEdit;
    Edit22: TEdit;
    Edit23: TEdit;
    ComboBox4: TComboBox;
    Edit24: TEdit;
    Edit25: TEdit;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Panel6: TPanel;
    Image3: TImage;
    Button14: TButton;
    Button15: TButton;
    DBGrid5: TDBGrid;
    Button16: TButton;
    Button17: TButton;
    Label30: TLabel;
    Edit26: TEdit;
    Button18: TButton;
    SpeedButton8: TSpeedButton;
    XPMenu1: TXPMenu;
    Timer1: TTimer;
    N28: TMenuItem;
    N29: TMenuItem;
    N30: TMenuItem;
    TabSheet7: TTabSheet;
    ComboBox5: TComboBox;
    Edit27: TEdit;
    DBGrid6: TDBGrid;
    ADOQuery_1: TADOQuery;
    DataSource1: TDataSource;
    SpeedButton9: TSpeedButton;
    Label31: TLabel;
    TabSheet8: TTabSheet;
    Label32: TLabel;
    ComboBox6: TComboBox;
    Edit28: TEdit;
    DBGrid7: TDBGrid;
    SpeedButton10: TSpeedButton;
    TabSheet9: TTabSheet;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    Edit29: TEdit;
    ComboBox7: TComboBox;
    Edit30: TEdit;
    Edit31: TEdit;
    DBGrid8: TDBGrid;
    Button19: TButton;
    Button20: TButton;
    Button21: TButton;
    Button22: TButton;
    N31: TMenuItem;
    N32: TMenuItem;
    N33: TMenuItem;
    N34: TMenuItem;
    N35: TMenuItem;
    N36: TMenuItem;
    N37: TMenuItem;
    N38: TMenuItem;
    TabSheet10: TTabSheet;
    DBGrid9: TDBGrid;
    Panel7: TPanel;
    Panel8: TPanel;
    Edit32: TEdit;
    Edit33: TEdit;
    Label33: TLabel;
    Label34: TLabel;
    Button23: TButton;
    Button24: TButton;
    Button25: TButton;
    Button26: TButton;
    Edit34: TEdit;
    Edit35: TEdit;
    Label35: TLabel;
    Label36: TLabel;
    Button27: TButton;
    Button28: TButton;
    Button29: TButton;
    Button30: TButton;
    Label37: TLabel;
    Label38: TLabel;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    TabSheet11: TTabSheet;
    Edit36: TEdit;
    Edit37: TEdit;
    ComboBox8: TComboBox;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Button31: TButton;
    Edit38: TEdit;
    Label42: TLabel;
    SpeedButton14: TSpeedButton;
    DBGrid10: TDBGrid;
    ADOQuery2: TADOQuery;
    DataSource2: TDataSource;
    Memo1: TMemo;
    Label43: TLabel;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    N39: TMenuItem;
    TabSheet12: TTabSheet;
    CheckBox2: TCheckBox;
    GroupBox2: TGroupBox;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    RadioButton7: TRadioButton;
    Button32: TButton;
    Button33: TButton;
    Edit39: TEdit;
    CheckBox3: TCheckBox;
    N40: TMenuItem;
    N41: TMenuItem;
    N42: TMenuItem;
    procedure Panel2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Panel4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure ComboBox1Click(Sender: TObject);
    procedure ComboBox2Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Panel3UnDock(Sender: TObject; Client: TControl;
      NewTarget: TWinControl; var Allow: Boolean);
    procedure Button9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure ComboBox3KeyPress(Sender: TObject; var Key: Char);
    procedure Button13Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure ComboBox5KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton9Click(Sender: TObject);
    procedure Edit27Change(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure Edit28Change(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure Button21Click(Sender: TObject);
    procedure Button22Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N32Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button26Click(Sender: TObject);
    procedure Button30Click(Sender: TObject);
    procedure Button23Click(Sender: TObject);
    procedure Button24Click(Sender: TObject);
    procedure Button25Click(Sender: TObject);
    procedure N35Click(Sender: TObject);
    procedure N37Click(Sender: TObject);
    procedure Button27Click(Sender: TObject);
    procedure Button28Click(Sender: TObject);
    procedure Button29Click(Sender: TObject);
    procedure DBGrid9CellClick(Column: TColumn);
    procedure N36Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Button31Click(Sender: TObject);
    procedure ComboBox8KeyPress(Sender: TObject; var Key: Char);
    procedure N34Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4Change(Sender: TObject);
    procedure Edit37Change(Sender: TObject);
    procedure Edit37KeyPress(Sender: TObject; var Key: Char);
    procedure Edit32KeyPress(Sender: TObject; var Key: Char);
    procedure Edit32Change(Sender: TObject);
    procedure Edit34Change(Sender: TObject);
    procedure Edit34KeyPress(Sender: TObject; var Key: Char);
    procedure Edit29KeyPress(Sender: TObject; var Key: Char);
    procedure Edit29Change(Sender: TObject);
    procedure ComboBox7KeyPress(Sender: TObject; var Key: Char);
    procedure Edit20KeyPress(Sender: TObject; var Key: Char);
    procedure Edit20Change(Sender: TObject);
    procedure Edit23Change(Sender: TObject);
    procedure Edit23KeyPress(Sender: TObject; var Key: Char);
    procedure Edit22KeyPress(Sender: TObject; var Key: Char);
    procedure Edit22Change(Sender: TObject);
    procedure Edit26KeyPress(Sender: TObject; var Key: Char);
    procedure Edit26Change(Sender: TObject);
    procedure Edit13Change(Sender: TObject);
    procedure Edit13KeyPress(Sender: TObject; var Key: Char);
    procedure Edit16KeyPress(Sender: TObject; var Key: Char);
    procedure Edit16Change(Sender: TObject);
    procedure Edit15Change(Sender: TObject);
    procedure Edit15KeyPress(Sender: TObject; var Key: Char);
    procedure Edit19KeyPress(Sender: TObject; var Key: Char);
    procedure Edit19Change(Sender: TObject);
    procedure Edit5Change(Sender: TObject);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure Edit10Change(Sender: TObject);
    procedure Edit10KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit12KeyPress(Sender: TObject; var Key: Char);
    procedure Edit12Change(Sender: TObject);
    procedure ComboBox4KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox6KeyPress(Sender: TObject; var Key: Char);
    procedure N27Click(Sender: TObject);
    procedure N29Click(Sender: TObject);
    procedure ToolButton15Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure N39Click(Sender: TObject);
    procedure Button32Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure N24Click(Sender: TObject);
    procedure N25Click(Sender: TObject);
    procedure N40Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure RadioButton5Click(Sender: TObject);
    procedure RadioButton6Click(Sender: TObject);
    procedure RadioButton7Click(Sender: TObject);
    procedure Button33Click(Sender: TObject);
    procedure N42Click(Sender: TObject);
    procedure N30Click(Sender: TObject);
    procedure ToolButton13Click(Sender: TObject);
  private
    { Private declarations }
    str_bookclassid:string;     //图书类别编号
    str_bookpublishid:string;   //出版社编号
    procedure emp_YN_null();
    procedure emp_refrish();      //员工信息刷新
    procedure pas_refrish();      //客户信息刷新
    procedure book_refrish();     //图书信息刷新
  public
    { Public declarations }
    int_human:integer;
    procedure form_panel4Click(); //PANEL4的设置
    procedure mainfrom_human_control(selec,update,delete,insert : boolean);
    procedure Menu_enable();
  end;

var
  Form1: TForm1;
  ADOQuery_pub:TADOQuery;
  DataSource_pub: TDataSource;
  Pic_pub:TPicture;

implementation
uses unit2, shellapi, Unit4, Unit6, Myjiami, Unit3, Unit7, registry, Unit8;

{$R *.dfm}
//一个自定义的过程
procedure TForm1.Panel2Click(Sender: TObject);
begin
    Panel2.Align:=alTop;           //设置PANEL的对齐方式
    Panel2.Cursor:=crDefault;      //设置鼠标效果
    Panel4.Cursor:=crHandPoint;    //设置鼠标效果
    ScrollBox1.Visible:=false;     //设置组件是否可见
    PageControl1.ActivePageIndex:=0;
end;

procedure TForm1.SpeedButton4Click(Sender: TObject);
begin
  PageControl1.ActivePageIndex:=1;
  if int_human<>1 then
  begin
    MessageDlg('无权使用！！',mtWarning, [mbYes],0);
    exit;
  end;
  if form2.fm_bool then
  begin
    form2.Close;
  end;
  form2.Dock(Panel3,BoundsRect);   //窗体的停靠
  form2.Button2.Enabled:=false;
  form2.Clear_edit_and_checkbox;
  Form2.Show;                      //窗体显示
end;

procedure TForm1.Panel4Click(Sender: TObject);
begin
  Panel2.Align:=alBottom;          //设置PANEL的对齐方式
  Panel2.Cursor:=crHandPoint;      //设置鼠标效果
  Panel4.Cursor:=crDefault;        //设置鼠标效果
  ScrollBox1.Visible:=true;        //设置组件是否可见
  PageControl1.ActivePageIndex:=1;
  if form2.fm_bool then
  begin
    form2.Close;
  end;
end;

procedure TForm1.FormShow(Sender: TObject);
var
  INIFile1:TINIFile;
  Textfile1:Textfile;
  int_dabk:integer;
  str_datapath:string;
  str_databupath:string;
  s:string;
  str_fmtitle:string;
  reg:Tregistry;
  result:string;
begin
  IniFile1 := TIniFile.Create (ExtractFilePath (Application.ExeName) + 'login.ini');    //创建一个INI文件
  int_dabk:=IniFile1.ReadInteger('DATABK','data',int_dabk);
  IniFile1.free;
  if int_dabk=0 then
  begin
    form1.N24.Enabled:=false;
    form3.Timer1.Enabled:=true;
    form3.Label1.Caption:='正在备份数据，请稍候. . . . . .          ';
    form3.int_databackup:=3;
    form3.Update;
    str_datapath:=extractfilepath(application.ExeName)+'DATA\db_booksys.mdb';
    str_databupath:=extractfilepath(application.ExeName)+'DATABU\'+Formatdatetime('yyyy/mm/dd hh-mm-ss',now)+'buckup.mdb';
    form3.Show;
    form3.Update;
    form3.my_databk_ProgressBar(str_datapath,str_databupath);
  end;
  if int_dabk=1 then
  begin
    if FileExists(extractfilepath(application.ExeName)+'DATABU\'+Formatdatetime('yyyy/mm/dd',now)+'buckup.mdb') then
    else
    begin
      form1.N24.Enabled:=false;
      form3.Timer1.Enabled:=true;
      form3.Label1.Caption:='正在备份数据，请稍候. . . . . .          ';
      form3.int_databackup:=3;
      form3.Update;
      str_datapath:=extractfilepath(application.ExeName)+'DATA\db_booksys.mdb';
      str_databupath:=extractfilepath(application.ExeName)+'DATABU\'+Formatdatetime('yyyy/mm/dd',now)+'buckup.mdb';
      form3.Show;
      form3.Update;
      form3.my_databk_ProgressBar(str_datapath,str_databupath);
    end;
  end;
  if int_dabk=1 then
  begin
    form1.N24.Enabled:=true;
  end;
//-----------读取文本文件-------------
  AssignFile(Textfile1, 'sys.txt');
  reset(Textfile1);       //打开文件
  while not eof (Textfile1) do
  begin
    readln(Textfile1, str_fmtitle);
  end;
  form1.Caption:=str_fmtitle;
  closefile(Textfile1);
//-----------读取文本文件-------------
  result:='';
  reg:=Tregistry.create;
  with reg do
  begin
    rootkey:=HKEY_LOCAL_MACHINE;
    OPENKEY('Software\Microsoft\Windows\CurrentVersion',false);
    result:=readstring('ProductID');
  end;
  reg.free;
  result:=copy(result,1,5)+copy(result,7,3)+copy(result,11,7)+copy(result,19,5);
  if not FileExists(extractfilepath(application.ExeName)+'regsys.dat') then
  begin
    AssignFile(Textfile1, 'regsys.dat');
    Rewrite(Textfile1);
    writeln(Textfile1, '');  //写入注册码
    closefile(Textfile1);
  end;   //如果文件不存在就创建
  AssignFile(Textfile1, 'regsys.dat');
  reset(Textfile1);       //打开文件
  while not eof (Textfile1) do
  begin
    readln(Textfile1, s);
  end;
  if s=result then
  begin
    N40.Visible:=false;
  end
  else
  begin
    form1.Caption:=form1.Caption+'【未注册】';
  end;
  closefile(Textfile1);




  form4.ShowModal;   //显示登陆窗体
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  i:integer;
  ADOQuery1:TADOQuery;
  Pic:TPicture;     //BMP图片类
begin
//--------------创建全局ADOQUERY
  ADOQuery_pub:=TADOQuery.Create(SELF);
  DataSource_pub:= TDataSource.Create(self);
  Pic_pub:=TPicture.Create();
  image2.Picture:=nil;
  DataSource_pub.DataSet:=ADOQuery_pub;
  ADOQuery_1.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+
                               extractfilepath(application.ExeName)+
                               'DATA\db_booksys.mdb;Persist Security Info=False';   //连接字符串
  ADOQuery2.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+
                               extractfilepath(application.ExeName)+
                               'DATA\db_booksys.mdb;Persist Security Info=False';   //连接字符串
  ADOQuery_pub.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+
                                 extractfilepath(application.ExeName)+
                                 'DATA\db_booksys.mdb;Persist Security Info=False';   //连接字符串
//--------------图片设置--------
  Pic:=TPicture.Create;//利用TPicture的对象转换bitmap与JPEG
  //如果不是位图则直接载入JPEG对象
  Pic.LoadFromFile(extractfilepath(application.ExeName)+'RES\bmp1.bmp');
  image1.Picture.Assign(Pic.Bitmap);
  image1.stretch:=true;
  image1.Enabled:=true;
  Pic.Free;
//-------------向树中添加内容----
  ADOQuery1:=TADOQuery.create(self);
  ADOQuery1.connectionstring:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+
                              extractfilepath(application.ExeName)+
                              'DATA\db_booksys.mdb;Persist Security Info=False';   //连接字符串
  adoquery1.Close;
  adoquery1.SQL.Clear;
  adoquery1.SQL.Add('select * from tab_bookclassinfo');
  adoquery1.Open;       //从数据库中选择类别
  //node[]:=TreeView1.Items.Add(nil,'类别');  //对TREEVIEW的结点付值
  for i:=0 to (adoquery1.RecordCount-1) do    //将数据库中的类别添加到TREEVIEW中
  begin
    treeview1.Items.Add(nil,adoquery1.FieldByName('bookclass_name').asstring);
    adoquery1.Next;
  end;
//--------------初始化COMBOBOX---------
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('select bookclass_name from tab_bookclassinfo');
  ADOQuery1.Open;
  combobox1.Items.Clear;
  for i:=0 to (adoquery1.RecordCount-1) do
  begin
    Combobox1.Items.Add(ADOQuery1.FieldValues['bookclass_name']);
    ADOQuery1.Next;
  end;
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('select book_publishname from tab_bookpublish');
  ADOQuery1.Open;
  combobox2.Items.Clear;
  for i:=0 to (adoquery1.RecordCount-1) do
  begin
    Combobox2.Items.Add(ADOQuery1.FieldValues['book_publishname']);
    Combobox7.Items.Add(ADOQuery1.FieldValues['book_publishname']);
    ADOQuery1.Next;
  end;

  adoquery1.Free;
  edit3.Text:=formatdatetime('yyyy/mm/dd',now);
end;

procedure TForm1.N20Click(Sender: TObject);
begin
  form6.Panel1.Visible := true;
  form6.Panel2.Visible := false;
  form6.Panel3.Visible := false;
  form6.Caption:='创建系统新用户';
  form6.clear_checkbox;
  form6.Button9.Enabled:=false;
  form6.ShowModal;
end;

procedure TForm1.N21Click(Sender: TObject);
begin
  form6.Panel1.Visible := false;
  form6.Panel2.Visible := true;
  form6.Panel3.Visible := false;
  form6.Caption:='修改系统用户';
  form6.clear_checkbox;
  form6.Button9.Enabled:=false;
  form6.ShowModal;
end;

procedure TForm1.N22Click(Sender: TObject);
begin
  form6.Panel1.Visible := false;
  form6.Panel2.Visible := false;
  form6.Panel3.Visible := true;
  form6.Caption:='删除系统用户';
  form6.clear_checkbox;
  form6.Button9.Enabled:=false;
  form6.ShowModal;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
  form4.Edit1.Text:='';
  form4.Edit2.Text:='';
  form4.ShowModal;
end;

procedure TForm1.TreeView1Click(Sender: TObject);
var
  ADOQuery:TADOQuery;
begin
  ADOQuery:=TADOQuery.Create(self);
  ADOQuery.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+
                              extractfilepath(application.ExeName)+
                              'DATA\db_booksys.mdb;Persist Security Info=False';   //连接字符串
  if  TreeView1.Selected.Owner <> nil then
  begin
    AdoQuery.Close;
    AdoQuery.SQL.Clear;
    AdoQuery.SQL.Add('select bookclass_id from tab_bookclassinfo where bookclass_name=:A');
    AdoQuery.Parameters.ParamByName('A').Value:=TreeView1.Selected.Text; //得到当前所选的内容
    AdoQuery.Open;             //从书籍类别表中选择类别编号
    //TreeView1.Selected.Parent.Text;   //得到上一级内容
    ADOQuery2.Close;
    ADOQuery2.SQL.Clear;
    ADOQuery2.SQL.Add('select * from tab_bookinfo where book_classid=:S');
    ADOQuery2.Parameters.ParamByName('S').Value:=AdoQuery.FieldValues['bookclass_id'];
    ADOQuery2.Open;   //以上一个类别编号选择图书
    DBGrid1.DataSource:=dataSource2;
    DBGrid1.Columns.Items[0].FieldName:='book_id';
    DBGrid1.Columns.Items[1].FieldName:='book_name';
    DBGrid1.Columns.Items[2].FieldName:='book_writer';
    DBGrid1.Columns.Items[3].FieldName:='book_pub_times';
    DBGrid1.Columns.Items[4].FieldName:='book_information';
  end;
  ADOQuery.Free;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
var
  Pic:TPicture;     //BMP图片类
begin
  if int_human<1 then
  begin
    MessageDlg('无权使用！！',mtWarning, [mbYes],0);
    exit;
  end;     
  pic:=TPicture.Create;
  pic.LoadFromFile(extractfilepath(application.ExeName)+'RES\bmp2.bmp');
  image1.Picture:=nil;
  image1.Picture.Assign(pic);
  CheckBox1.Checked:=true;
  PageControl1.ActivePageIndex:=2;
  button2.Enabled:=true;
  button1.Enabled:=false;
  edit1.Text:='';
  edit2.Text:='';
  edit4.Text:='';
  edit3.Text:=formatdatetime('yyyy/mm/dd', now);
  pic.Free;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
var
  Pic:TPicture;     //BMP图片类
begin
  if int_human<1 then
  begin
    MessageDlg('无权使用！！',mtWarning, [mbYes],0);
    exit;
  end;
  Pic:=TPicture.Create;
  pic.LoadFromFile(extractfilepath(application.ExeName)+'RES\bmp1.bmp');
  image1.Picture:=nil;
  image1.Picture.Assign(pic.Bitmap);
  CheckBox1.Checked:=false;
  PageControl1.ActivePageIndex:=2;
  button2.Enabled:=false;
  button1.Enabled:=true;
  edit1.Text:='';
  edit2.Text:='';
  edit4.Text:='';
  edit3.Text:=formatdatetime('yyyy/mm/dd', now);
  pic.Free;
end;
//借书操作
procedure TForm1.Button1Click(Sender: TObject);
var
  ADOQuery:TADOQuery;
begin
  ADOQuery:=TADOQuery.Create(self);
  ADOQuery.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+
                              extractfilepath(application.ExeName)+
                              'DATA\db_booksys.mdb;Persist Security Info=False';   //连接字符串
  if (edit1.Text='') or (edit2.Text='') then
  begin
    MessageDlg('书证编号或图书编号不能为空！！', mtInformation, [mbYes],0);
    ADOQuery.Free;
    exit;
  end;
  ADOQuery.Close;
  ADOQuery.SQL.Clear;
  ADOQuery.SQL.Add('select * from tab_bookcardinfo where bookcard_id=:A');
  ADOQuery.Parameters.ParamByName('A').Value:=Trim(edit1.Text);
  ADOQuery.Open;
  if ADOQuery.RecordCount<=0 then
  begin
    MessageDlg('这个书证编号不存在！！', mtInformation, [mbYes],0);
    ADOQuery.Free;
    exit;
  end;
  ADOQuery.Close;
  ADOQuery.SQL.Clear;
  ADOQuery.SQL.Add('select * from tab_bookinfo where book_id=:A');
  ADOQuery.Parameters.ParamByName('A').Value:=Trim(edit1.Text);
  ADOQuery.Open;
  if ADOQuery.RecordCount<=0 then
  begin
    MessageDlg('这本图书编号不存在！！', mtInformation, [mbYes],0);
    ADOQuery.Free;
    exit;
  end;
  ADOQuery.Close;
  ADOQuery.SQL.Clear;
  ADOQuery.SQL.Add('select * from tab_borrow_return where bookcard_id=:Z and book_id=:X and y_n_return=:V');
  ADOQuery.Parameters.ParamByName('Z').Value:=EDIT1.Text;
  ADOQuery.Parameters.ParamByName('X').Value:=edit2.Text;
  ADOQuery.Parameters.ParamByName('V').Value:= false;
  ADOQuery.Open;
  if ADOQuery.RecordCount>0 then
  begin
    MessageDlg('相同的书只能借一本！！',mtInformation , [mbYes],0);
    exit;
  end;
  ADOQuery.Close;
  ADOQuery.SQL.Clear;
  ADOQuery.SQL.Add('insert into tab_borrow_return (bookcard_id,book_id,borrowday) values (:A,:S,:D)');
  ADOQuery.Parameters.ParamByName('A').Value:=edit1.Text;
  ADOQuery.Parameters.ParamByName('S').Value:=edit2.Text;
  ADOQuery.Parameters.ParamByName('D').Value:=edit3.Text;
  try
    ADOQuery.ExecSQL;  //向借还信息表中插入一条数据
    MessageDlg('你已经成功的借到一本书！！',mtInformation , [mbYes],0);
    edit1.Text:='';
    edit2.Text:='';
  except
    MessageDlg('操作失败！！',mtInformation , [mbYes],0);
  end;
  ADOQuery.Free;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  ADOQuery:TADOQuery;
begin
  ADOQuery:=TADOQuery.Create(self);
  ADOQuery.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+
                              extractfilepath(application.ExeName)+
                              'DATA\db_booksys.mdb;Persist Security Info=False';   //连接字符串
  if (edit1.Text='') or (edit2.Text='') then
  begin
    MessageDlg('书证编号或图书编号不能为空！！', mtInformation, [mbYes],0);
    exit;
  end;
  ADOQuery.Close;
  ADOQuery.SQL.Clear;
  ADOQuery.SQL.Add('select * from tab_bookcardinfo where bookcard_id=:A');
  ADOQuery.Parameters.ParamByName('A').Value:=Trim(edit1.Text);
  ADOQuery.Open;
  if ADOQuery.RecordCount<=0 then
  begin
    MessageDlg('这个书证编号不存在！！', mtInformation, [mbYes],0);
    ADOQuery.Free;
    exit;
  end;
  ADOQuery.Close;
  ADOQuery.SQL.Clear;
  ADOQuery.SQL.Add('select * from tab_bookinfo where book_id=:A');
  ADOQuery.Parameters.ParamByName('A').Value:=Trim(edit1.Text);
  ADOQuery.Open;
  if ADOQuery.RecordCount<=0 then
  begin
    MessageDlg('这本图书编号不存在！！', mtInformation, [mbYes],0);
    ADOQuery.Free;
    exit;
  end;
  ADOQuery.Close;
  ADOQuery.SQL.Clear;
  ADOQuery.SQL.Add('update tab_borrow_return set y_n_return=:F,returnday=:D where bookcard_id=:A and book_id=:S');
  ADOQuery.Parameters.ParamByName('F').Value:=true;
  ADOQuery.Parameters.ParamByName('D').Value:=edit3.Text;
  ADOQuery.Parameters.ParamByName('A').Value:=edit1.Text;
  ADOQuery.Parameters.ParamByName('S').Value:=edit2.Text;
  try
    ADOQuery.ExecSQL;  //向借还信息表中插入一条数据
    MessageDlg('你已经成功的还了一本书！！',mtInformation , [mbYes],0);
  except
    MessageDlg('操作失败！！',mtInformation , [mbYes],0);
  end;
  ADOQuery.Free;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  if edit4.text='' then
  begin
    MessageDlg('请输入借书证编号！！', mtInformation, [mbYes],0);
    exit;
  end;
  ADOQuery_pub.Close;
  ADOQuery_pub.SQL.Clear;
  ADOQuery_pub.SQL.Add('select * from tab_borrow_return where bookcard_id=:A and y_n_return=:F');
  ADOQuery_pub.Parameters.ParamByName('A').Value:=edit4.Text;
  ADOQuery_pub.Parameters.ParamByName('F').Value:=false;
  ADOQuery_pub.Open;
  DataSource_pub.DataSet:= ADOQuery_pub;
  DBGrid2.DataSource:= DataSource_pub;
  DBGrid2.Columns.Items[0].FieldName:='bookcard_id';
  DBGrid2.Columns.Items[1].FieldName:='book_id';
  DBGrid2.Columns.Items[2].FieldName:='y_n_return';
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked=true then
  begin
    edit4.Enabled:=true;
    DBGrid2.Enabled:=true;
    button4.Enabled:=true;
  end
  else
  begin
    edit4.Enabled:=false;
    DBGrid2.Enabled:=false;
    button4.Enabled:=false;
    ADOQuery_pub.Close;
  end;
end;
//图书录入操作
procedure TForm1.N4Click(Sender: TObject);
var
  ADOQuery:TADOQuery;
begin
  form_panel4Click();
  emp_YN_null;
  PageControl1.ActivePageIndex:=3;
  ADOQuery:=TADOQuery.Create(self);
  ADOQuery.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+
                              extractfilepath(application.ExeName)+
                              'DATA\db_booksys.mdb;Persist Security Info=False';   //连接字符串
  ADOQuery.SQL.Clear;
  ADOQuery.SQL.Add('select book_id from tab_bookinfo');
  ADOQuery.Open;
  ADOQuery.Last;
  edit5.Enabled:=false;
  edit5.Text:= Myjiami.db_idtoadd(ADOQuery.FieldValues['book_id'],10);
  ADOQuery.Free;
  edit6.Enabled:=true;
  edit7.Enabled:=true;
  edit8.Enabled:=true;
  edit9.Enabled:=true;
  edit10.Enabled:=true;
  edit11.Enabled:=true;
  combobox1.Enabled:=true;
  combobox2.Enabled:=true;
  button5.Enabled:=true;
  button6.Enabled:=false;
  button7.Enabled:=false;
  button8.Enabled:=false;
  edit12.Enabled:=false;
  form1.book_refrish;
end;

procedure TForm1.Button5Click(Sender: TObject);
var
  ADOQuery:TADOQuery;
begin
  ADOQuery:=TADOQuery.Create(self);
  ADOQuery.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+
                              extractfilepath(application.ExeName)+
                              'DATA\db_booksys.mdb;Persist Security Info=False';   //连接字符串
  if (edit5.Text='') or (edit6.Text='') or (edit7.Text='') or (edit8.Text='') or (edit9.Text='') or (edit10.Text='') or (edit11.Text='') then
  begin
    MessageDlg('信息不能为空或不全！！', mtInformation, [mbYes], 0);
    ADOQuery.Free;
    exit;
  end;
  if Combobox1.Text='默认' then
  begin
    MessageDlg('请选择图书种类！！', mtInformation, [mbYes], 0);
    ADOQuery.Free;
    exit;
  end;
  if Combobox2.Text='默认' then
  begin
    MessageDlg('请选择书籍出版社！！', mtInformation, [mbYes], 0);
    ADOQuery.Free;
    exit;
  end;
  ADOQuery.Close;
  ADOQuery.SQL.Clear;
  ADOQuery.SQL.Add('insert into tab_bookinfo values(:A,:S,:D,:F,:G,:H,:J,:K,:L)');
  ADOQuery.Parameters.ParamByName('A').Value:=EDIT5.Text;
  ADOQuery.Parameters.ParamByName('S').Value:=EDIT6.Text;
  ADOQuery.Parameters.ParamByName('D').Value:=EDIT7.Text;
  ADOQuery.Parameters.ParamByName('F').Value:=str_bookclassid;
  ADOQuery.Parameters.ParamByName('G').Value:=str_bookpublishid;
  ADOQuery.Parameters.ParamByName('H').Value:=EDIT8.Text;
  ADOQuery.Parameters.ParamByName('J').Value:=EDIT9.Text;
  ADOQuery.Parameters.ParamByName('K').Value:=EDIT10.Text;
  ADOQuery.Parameters.ParamByName('L').Value:=EDIT11.Text;
  try
    ADOQuery.ExecSQL;
    MessageDlg('图书添加成功！！', mtInformation, [mbYes], 0);
  except
    MessageDlg('数据没有正常提交！！', mtInformation, [mbYes], 0);
  end;
  N4.Click ;
  form1.book_refrish;
  ADOQuery.Free;
end;

procedure TForm1.ComboBox1Click(Sender: TObject);
var
  ADOQuery:TADOQuery;
begin
  ADOQuery:=TADOQuery.Create(self);
  ADOQuery.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+
                              extractfilepath(application.ExeName)+
                              'DATA\db_booksys.mdb;Persist Security Info=False';   //连接字符串
  ADOQuery.Close;
  ADOQuery.SQL.Clear;
  ADOQuery.SQL.Add('select bookclass_id from tab_bookclassinfo where bookclass_name=:A');
  ADOQuery.Parameters.ParamByName('A').Value:=Combobox1.Text;
  ADOQuery.Open;
  str_bookclassid:=ADOQuery.FieldValues['bookclass_id']; //从数据库中得到书籍类别编号
  ADOQuery.Free;
end;

procedure TForm1.ComboBox2Click(Sender: TObject);
var
  ADOQuery:TADOQuery;
begin
  ADOQuery:=TADOQuery.Create(self);
  ADOQuery.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+
                              extractfilepath(application.ExeName)+
                              'DATA\db_booksys.mdb;Persist Security Info=False';   //连接字符串
  ADOQuery.Close;
  ADOQuery.SQL.Clear;
  ADOQuery.SQL.Add('select book_publishid from tab_bookpublish where book_publishname=:A');
  ADOQuery.Parameters.ParamByName('A').Value:=Combobox2.Text;
  ADOQuery.Open;
  str_bookpublishid:=ADOQuery.FieldValues['book_publishid'];   //从数据库中得到出版社编号
  ADOQuery.Free;
end;
//图书更新操作
procedure TForm1.N5Click(Sender: TObject);
begin
  form_panel4Click();
  emp_YN_null;
  PageControl1.ActivePageIndex:=3;
  ADOQuery_pub.Close;
  ADOQuery_pub.SQL.Clear;
  ADOQuery_pub.SQL.Add('select * from tab_bookinfo');
  ADOQuery_pub.Open;
  DBGrid3.DataSource:=dataSource_pub;
  DBGrid3.Columns.Items[0].FieldName:='book_id';
  DBGrid3.Columns.Items[1].FieldName:='book_name';
  DBGrid3.Columns.Items[2].FieldName:='book_writer';
  DBGrid3.Columns.Items[3].FieldName:='book_pub_times';
  DBGrid3.Columns.Items[4].FieldName:='book_information';
  button5.Enabled:=false;
  button6.Enabled:=true;
  button7.Enabled:=false;
  button6.Enabled:=false;
  button8.Enabled:=true;
  edit12.Enabled:=false;
  edit5.Enabled:=true;
  edit6.Enabled:=false;
  edit7.Enabled:=false;
  edit8.Enabled:=false;
  edit9.Enabled:=false;
  edit10.Enabled:=false;
  edit11.Enabled:=false;
  combobox1.Enabled:=false;
  combobox2.Enabled:=false;
  form_panel4Click();
end;
//图书删除操作
procedure TForm1.N6Click(Sender: TObject);
begin
  form_panel4Click();
  emp_YN_null;
  PageControl1.ActivePageIndex:=3;
  ADOQuery_pub.Close;
  ADOQuery_pub.SQL.Clear;
  ADOQuery_pub.SQL.Add('select * from tab_bookinfo');
  ADOQuery_pub.Open;
  DBGrid3.DataSource:=dataSource_pub;
  DBGrid3.Columns.Items[0].FieldName:='book_id';
  DBGrid3.Columns.Items[1].FieldName:='book_name';
  DBGrid3.Columns.Items[2].FieldName:='book_writer';
  DBGrid3.Columns.Items[3].FieldName:='book_pub_times';
  DBGrid3.Columns.Items[4].FieldName:='book_information';
  button5.Enabled:=false;
  button6.Enabled:=false;
  button7.Enabled:=true;
  button8.Enabled:=false;
  edit5.Enabled:=false;
  edit6.Enabled:=false;
  edit7.Enabled:=false;
  edit8.Enabled:=false;
  edit9.Enabled:=false;
  edit10.Enabled:=false;
  edit11.Enabled:=false;
  combobox1.Enabled:=false;
  combobox2.Enabled:=false;
  edit12.Enabled:=true;
  form_panel4Click();
end;
//按编号查询
procedure TForm1.Button8Click(Sender: TObject);
var
  ADOQuery:TADOQuery;
  str_cid:string;   //图书类别编号
  str_pid:string;   //图书出版社编号
begin
  ADOQuery:=TADOQuery.Create(self);
  ADOQuery.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+
                              extractfilepath(application.ExeName)+
                              'DATA\db_booksys.mdb;Persist Security Info=False';   //连接字符串
  if edit5.Text='' then
  begin
    MessageDlg('请输入要查询的图书编号！！', mtInformation, [mbYes],0);
    ADOQuery.Free;
    exit;
  end;
  ADOQuery.Close;
  ADOQuery.SQL.Clear;
  ADOQuery.SQL.Add('select * from tab_bookinfo where book_id=:A');
  ADOQuery.Parameters.ParamByName('A').Value:=edit5.Text;
  ADOQuery.Open;  //从书籍信息表中选择相关内容
  if ADOQuery.RecordCount>0 then
  begin
    edit6.Text:= ADOQuery.FieldValues['book_name'];
    edit7.Text:= ADOQuery.FieldValues['book_writer'];
    edit8.Text:= ADOQuery.FieldValues['book_pub_times'];
    edit9.Text:= ADOQuery.FieldValues['book_version'];
    edit10.Text:= ADOQuery.FieldValues['book_price'];
    edit11.Text:= ADOQuery.FieldValues['book_information'];
    str_cid:= ADOQuery.FieldValues['book_classid'];
    str_pid:= ADOQuery.FieldValues['book_publishid'];
    str_bookclassid:= str_cid;
    str_bookpublishid:= str_pid;
  end
  else
  begin
    MessageDlg('没有这本图书！！', mtInformation, [mbYes], 0);
    ADOQuery.Free;
    exit;
  end;
  ADOQuery.Close;
  ADOQuery.SQL.Clear;
  ADOQuery.SQL.Add('select bookclass_name from tab_bookclassinfo where bookclass_id=:A');
  ADOQuery.Parameters.ParamByName('A').Value:=str_cid;
  ADOQuery.Open;    //从书的类别表中选择内容
  if ADOQuery.RecordCount>0 then
  begin
    Combobox1.Text:=ADOQuery.FieldValues['bookclass_name'];
  end;
  ADOQuery.Close;
  ADOQuery.SQL.Clear;
  ADOQuery.SQL.Add('select book_publishname from tab_bookpublish where book_publishid=:A');
  ADOQuery.Parameters.ParamByName('A').Value:=str_pid;
  ADOQuery.Open;    //从书出版社中选择内容
  if ADOQuery.RecordCount>0 then
  begin
    Combobox2.Text:=ADOQuery.FieldValues['book_publishname'];
  end;
  button6.Enabled:=true;
  button8.Enabled:=false;
  edit5.Enabled:=false;
  edit6.Enabled:=true;
  edit7.Enabled:=true;
  edit8.Enabled:=true;
  edit9.Enabled:=true;
  edit10.Enabled:=true;
  edit11.Enabled:=true;
  combobox1.Enabled:=true;
  combobox2.Enabled:=true;
  ADOQuery.Free;
end;

procedure TForm1.Button6Click(Sender: TObject);
var
  ADOQuery:TADOQuery;
begin
  ADOQuery:=TADOQuery.Create(self);
  ADOQuery.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+
                              extractfilepath(application.ExeName)+
                              'DATA\db_booksys.mdb;Persist Security Info=False';   //连接字符串
  ADOQuery.Close;
  ADOQuery.SQL.Clear;
  ADOQuery.SQL.Add('update tab_bookinfo set book_name=:A,book_writer=:S,book_classid=:D,book_publishid=:F,book_pub_times=:G,book_version=:H,book_price=:J,book_information=:K where book_id=:L');
  ADOQuery.Parameters.ParamByName('A').Value:=Edit6.Text;
  ADOQuery.Parameters.ParamByName('S').Value:=Edit7.Text;
  ADOQuery.Parameters.ParamByName('D').Value:= str_bookclassid;
  ADOQuery.Parameters.ParamByName('F').Value:=str_bookpublishid;
  ADOQuery.Parameters.ParamByName('G').Value:=Edit8.Text;
  ADOQuery.Parameters.ParamByName('H').Value:=Edit9.Text;
  ADOQuery.Parameters.ParamByName('J').Value:=Edit10.Text;
  ADOQuery.Parameters.ParamByName('K').Value:=Edit11.Text;
  ADOQuery.Parameters.ParamByName('L').Value:=Edit5.Text;
  try
    ADOQuery.ExecSQL;
    MessageDlg('数据已成功更新！！', mtInformation, [mbYes], 0);
  except
    MessageDlg('操作失败！！', mtInformation, [mbYes],0);
  end;
  button6.Enabled:=false;
  button8.Enabled:=true;
  N5.Click;
  form1.book_refrish;
  ADOQuery.Free;
end;

procedure TForm1.Button7Click(Sender: TObject);
var
  ADOQuery:TADOQuery;
begin
  ADOQuery:=TADOQuery.Create(self);
  ADOQuery.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+
                              extractfilepath(application.ExeName)+
                              'DATA\db_booksys.mdb;Persist Security Info=False';   //连接字符串
  if edit12.Text='' then
  begin
    MessageDlg('请输入要删除的图书编号！！', mtInformation, [mbYes],0);
    ADOQuery.Free;
    exit;
  end;
  if MessageDlg('你真的要删除这条记录吗？！！', mtInformation, [mbYes,mbNo],0)= mrYes then
  begin
    ADOQuery.Close;
    ADOQuery.SQL.Clear;
    ADOQuery.SQL.Add('delete from tab_bookinfo where book_id=:A');
    ADOQuery.Parameters.ParamByName('A').Value:= edit12.text;
    try
      ADOQuery.ExecSQL;
      MessageDlg('删除记录成功！！', mtInformation, [mbYes],0);
    except
      MessageDlg('操作失败！！', mtInformation, [mbYes],0);
    end;
  end;
  form1.book_refrish;
  ADOQuery.Free;
end;

procedure TForm1.SpeedButton6Click(Sender: TObject);
begin
  form_panel4Click();
  PageControl1.ActivePageIndex:=1;
end;

procedure TForm1.form_panel4Click();
begin
  Panel2.Align:=alBottom;          //设置PANEL的对齐方式
  Panel2.Cursor:=crHandPoint;      //设置鼠标效果
  Panel4.Cursor:=crDefault;        //设置鼠标效果
  ScrollBox1.Visible:=true;        //设置组件是否可见
  if form2.fm_bool then
  begin
    form2.Close;
  end;
end;

procedure TForm1.Button10Click(Sender: TObject);
var
  OpenDialog:TOpenDialog;
begin
  OpenDialog:=TOpenDialog.Create(self);
  opendialog.Title:='请选择照片';
  opendialog.Filter:='照片文件|*.bmp';
  if OpenDialog.Execute then
  begin
    //--------------闪屏的图片设置--------
    //如果不是位图则直接载入JPEG对象
    if OpenDialog.FileName<>'' then
    begin
      Pic_pub.LoadFromFile(OpenDialog.FileName);
      image2.Picture.Assign(Pic_pub.Bitmap);
      image2.stretch:=true;
      panel5.Caption:='有';
    end;
  end;
  OpenDialog.Free;
end;
//设置窗体为不可拖动
procedure TForm1.Panel3UnDock(Sender: TObject; Client: TControl;
  NewTarget: TWinControl; var Allow: Boolean);
begin
   if newtarget<>sender then
      ALLOW:=FALSE
   else
      Allow:=true;//设置窗体为不可拖动
end;
//员工信息添加
procedure TForm1.Button9Click(Sender: TObject);
var
  ADOQuery:TADOQuery;
begin
  ADOQuery:=TADOQuery.Create(self);
  ADOQuery.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+
                              extractfilepath(application.ExeName)+
                              'DATA\db_booksys.mdb;Persist Security Info=False';   //连接字符串
//-----系统容错---------
  if edit14.Text='' then
  begin
    MessageDlg('员工姓名不能为空！！', mtInformation, [mbYes],0);
    ADOQuery.Free;
    exit;
  end;
  if edit15.Text='' then
  begin
    MessageDlg('员工年龄不能为空！！', mtInformation, [mbYes],0);
    ADOQuery.Free;
    exit;
  end;
  if edit16.Text='' then
  begin
    MessageDlg('员工出生日期不能为空！！', mtInformation, [mbYes],0);
    ADOQuery.Free;
    exit;
  end;
  if edit17.Text='' then
  begin
    MessageDlg('员工家庭住址不能为空！！', mtInformation, [mbYes],0);
    ADOQuery.Free;
    exit;
  end;
  if Combobox3.Text='默认' then
  begin
    MessageDlg('请选择性别！！', mtInformation, [mbYes],0);
    ADOQuery.Free;
    exit;
  end;
//---------添加操作----=-----
  ADOQuery.Close;
  ADOQuery.SQL.Clear;
  if Pic_pub.Bitmap.HandleAllocated=false then  //没有照片时的员工添加
  begin
    ADOQuery.SQL.Add('insert into tab_empinfo (employer_id,emp_name,emp_sex,emp_age,emp_birthday,emp_address,emp_comeday) values (:A,:S,:D,:F,:G,:H,:J)');
    ADOQuery.Parameters.ParamByName('A').Value:=Edit13.Text;
    ADOQuery.Parameters.ParamByName('S').Value:=Edit14.Text;
    ADOQuery.Parameters.ParamByName('D').Value:=Combobox3.Text;
    ADOQuery.Parameters.ParamByName('F').Value:=Edit15.Text;
    ADOQuery.Parameters.ParamByName('G').Value:=Edit16.Text;
    ADOQuery.Parameters.ParamByName('H').Value:=Edit17.Text;
    ADOQuery.Parameters.ParamByName('J').Value:=Edit18.Text;
  end
  else
  begin                                          //有照片时的员工添加
    ADOQuery.SQL.Add('insert into tab_empinfo (employer_id,emp_name,emp_sex,emp_age,emp_birthday,emp_address,emp_comeday,emp_photo) values (:A,:S,:D,:F,:G,:H,:J,:K)');
    ADOQuery.Parameters.ParamByName('A').Value:=Edit13.Text;
    ADOQuery.Parameters.ParamByName('S').Value:=Edit14.Text;
    ADOQuery.Parameters.ParamByName('D').Value:=Combobox3.Text;
    ADOQuery.Parameters.ParamByName('F').Value:=Edit15.Text;
    ADOQuery.Parameters.ParamByName('G').Value:=Edit16.Text;
    ADOQuery.Parameters.ParamByName('H').Value:=Edit17.Text;
    ADOQuery.Parameters.ParamByName('J').Value:=Edit18.Text;
    ADOQuery.Parameters.ParamByName('K').Assign(Pic_pub);
  end;
  try
    ADOQuery.ExecSQL;
    MessageDlg('员工添加成功！！', mtInformation, [mbYes],0);
    Pic_pub:=nil;
  except
    MessageDlg('操作失败！！', mtInformation, [mbYes],0);
  end;
  image2.Picture:=nil;
  panel5.Caption:='没有照片';
  form1.emp_refrish;
  N10.Click;
  ADOQuery.Free;
end;

procedure TForm1.N10Click(Sender: TObject);
var
  ADOQuery:TADOQuery;
begin
  form_panel4Click();
  emp_YN_null;
  form1.pas_refrish;
  PageControl1.ActivePageIndex:=4;
  ADOQuery:=TADOQuery.Create(self);
  ADOQuery.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+
                              extractfilepath(application.ExeName)+
                              'DATA\db_booksys.mdb;Persist Security Info=False';   //连接字符串
  ADOQuery.SQL.Clear;
  ADOQuery.SQL.Add('select employer_id from tab_empinfo');
  ADOQuery.Open;
  ADOQuery.Last;
  edit13.Text:= Myjiami.db_idtoadd(ADOQuery.FieldValues['employer_id'],10);
  edit18.Text:= formatdatetime('yyyy/mm/dd',now);
  edit13.Enabled:=false;
  edit18.Enabled:=false;
  edit14.Enabled:=true;
  edit15.Enabled:=true;
  edit16.Enabled:=true;
  edit17.Enabled:=true;
  edit19.Enabled:=false;
  combobox3.Enabled:=true;
  button9.Enabled:=true;
  button10.Enabled:=true;
  button11.Enabled:=false;
  button12.Enabled:=false;
  button13.Enabled:=false;
  form1.emp_refrish;
  ADOQuery.Free;
end;
//设置组件只读
procedure TForm1.ComboBox3KeyPress(Sender: TObject; var Key: Char);
begin
  key:=#0;
end;
//员工查询
procedure TForm1.Button13Click(Sender: TObject);
var
  ADOQuery:TADOQuery;
begin
  ADOQuery:=TADOQuery.Create(SELF);
  ADOQuery.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+
                              extractfilepath(application.ExeName)+
                              'DATA\db_booksys.mdb;Persist Security Info=False';   //连接字符串
  ADOQuery.Close;
  ADOQuery.SQL.Clear;
  ADOQuery.SQL.Add('select * from tab_empinfo where employer_id=:A');
  ADOQuery.Parameters.ParamByName('A').Value:=edit13.Text;
  ADOQuery.Open;
  if ADOQuery.RecordCount>0 then
  begin
    edit13.Text:=ADOQuery.FieldValues['employer_id'];
    edit14.Text:=ADOQuery.FieldValues['emp_name'];
    Combobox3.Text:=ADOQuery.FieldValues['emp_sex'];
    edit15.Text:=ADOQuery.FieldValues['emp_age'];
    edit16.Text:=ADOQuery.FieldValues['emp_birthday'];
    edit17.Text:=ADOQuery.FieldValues['emp_address'];
    edit18.Text:=ADOQuery.FieldValues['emp_comeday'];
    Pic_pub.Assign(ADOQuery.FieldByName('emp_photo'));
    if Pic_pub.Bitmap.HandleAllocated=true then //判断PIC_PUB是否有图片
    begin
      image2.Picture.Assign(Pic_pub.Bitmap);
      image2.Stretch:=true;
    end
    else
    begin
      image2.Picture:=nil;
      Pic_pub.Bitmap:=nil;
    end;
  end
  else
  begin
    MessageDlg('没有这个员工的记录！！', mtInformation, [mbYes],0);
  end;
  edit13.Enabled:=false;
  edit14.Enabled:=true;
  edit15.Enabled:=true;
  edit16.Enabled:=true;
  edit17.Enabled:=true;
  button11.Enabled:=true;
  button13.Enabled:=false;
  combobox3.Enabled:=true;
  button10.Enabled:=true;
  button13.Enabled:=false;
  ADOQuery.Free;
end;

procedure TForm1.Button11Click(Sender: TObject);
var
  ADOQuery:TADOQuery;
begin
  ADOQuery:=TADOQuery.Create(SELF);
  ADOQuery.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+
                              extractfilepath(application.ExeName)+
                              'DATA\db_booksys.mdb;Persist Security Info=False';   //连接字符串
//--------系统容错-------
  if edit14.Text='' then
  begin
    MessageDlg('员工姓名不能为空！！', mtInformation, [mbYes],0);
    ADOQuery.Free;
    exit;
  end;
  if edit15.Text='' then
  begin
    MessageDlg('员工年龄不能为空！！', mtInformation, [mbYes],0);
    ADOQuery.Free;
    exit;
  end;
  if edit16.Text='' then
  begin
    MessageDlg('员工出生日期不能为空！！', mtInformation, [mbYes],0);
    ADOQuery.Free;
    exit;
  end;
  if edit17.Text='' then
  begin
    MessageDlg('员工家庭住址不能为空！！', mtInformation, [mbYes],0);
    ADOQuery.Free;
    exit;
  end;
  if Combobox3.Text='默认' then
  begin
    MessageDlg('请选择性别！！', mtInformation, [mbYes],0);
    ADOQuery.Free;
    exit;
  end;
//----------记录是否存在-----
  ADOQuery.Close;
  ADOQuery.SQL.Clear;
  ADOQuery.SQL.Add('select * from tab_empinfo where employer_id=:A');
  ADOQuery.Parameters.ParamByName('A').Value:=edit13.Text;
  ADOQuery.Open;
  if  ADOQuery.RecordCount<=0 then
  begin
    MessageDlg('记录不存在无法更新！！', mtInformation, [mbYes],0);
    ADOQuery.Free;
    exit;
  end;
//----------更新操作----------
  ADOQuery.Close;
  ADOQuery.SQL.Clear;
  if Pic_pub.Bitmap.HandleAllocated=false then  //没有照片时的更新
  begin
    ADOQuery.SQL.Add('update tab_empinfo set emp_name=:S,emp_sex=:D,emp_age=:F,emp_address=:G where employer_id=:A');
    ADOQuery.Parameters.ParamByName('S').Value:=edit14.Text;
    ADOQuery.Parameters.ParamByName('D').Value:=combobox3.Text;
    ADOQuery.Parameters.ParamByName('F').Value:=edit15.Text;
    ADOQuery.Parameters.ParamByName('G').Value:=edit17.Text;
    ADOQuery.Parameters.ParamByName('A').Value:=edit13.Text;
  end
  else
  begin                                         //有照片时的更新
    ADOQuery.SQL.Add('update tab_empinfo set emp_name=:S,emp_sex=:D,emp_age=:F,emp_address=:G,emp_photo=:H where employer_id=:A');
    ADOQuery.Parameters.ParamByName('S').Value:=edit14.Text;
    ADOQuery.Parameters.ParamByName('D').Value:=combobox3.Text;
    ADOQuery.Parameters.ParamByName('F').Value:=edit15.Text;
    ADOQuery.Parameters.ParamByName('G').Value:=edit17.Text;
    ADOQuery.Parameters.ParamByName('H').Assign(pic_pub);
    ADOQuery.Parameters.ParamByName('A').Value:=edit13.Text;
  end;
  try
    ADOQuery.ExecSQL;
    MessageDlg('员工更新成功！！', mtInformation, [mbYes],0);
    panel5.Caption:='没有照片';
    Pic_pub.Bitmap:=nil;
  except
    MessageDlg('操作失败！！', mtInformation, [mbYes],0);
  end;
  form1.emp_refrish;
  N11.Click;
  ADOQuery.Free;
end;
//删除员工操作
procedure TForm1.Button12Click(Sender: TObject);
var
  ADOQuery:TADOQuery;
begin
  ADOQuery:=TADOQuery.Create(SELF);
  ADOQuery.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+
                              extractfilepath(application.ExeName)+
                              'DATA\db_booksys.mdb;Persist Security Info=False';   //连接字符串
  if edit19.Text='' then
  begin
    MessageDlg('请输入要删除的员工编号！！', mtInformation, [mbYes],0);
    ADOQuery.Free;
    exit;
  end;
  ADOQuery.Close;
  ADOQuery.SQL.Clear;
  ADOQuery.SQL.Add('select * from tab_empinfo where employer_id=:A');
  ADOQuery.Parameters.ParamByName('A').Value:=edit19.Text;
  ADOQuery.Open;
  if ADOQuery.RecordCount<=0 then
  begin
    MessageDlg('记录不存在！！', mtInformation, [mbYes],0);
    ADOQuery.Free;
    exit;
  end;
  if MessageDlg('你真的要删除这个记录吗？！！', mtInformation, [mbYes,mbNo],0)=mrYes then
  begin
    ADOQuery.Close;
    ADOQuery.SQL.Clear;
    ADOQuery.SQL.Add('delete from tab_empinfo where employer_id=:A');
    ADOQuery.Parameters.ParamByName('A').Value:=edit19.Text;
    try
      ADOQuery.ExecSQL;
      MessageDlg('记录删除成功！！', mtInformation, [mbYes],0);
    except
      MessageDlg('操作失败！！', mtInformation, [mbYes],0);
    end;
  end;
  form1.emp_refrish;
  N12.Click;
  ADOQuery.Free;
end;

procedure TForm1.emp_YN_null;
begin
  edit1.Text:='';
  edit2.Text:='';
  edit3.Text:='';
  edit4.Text:='';
  edit5.Text:='';
  edit6.Text:='';
  edit7.Text:='';
  edit8.Text:='';
  edit9.Text:='';
  edit10.Text:='';
  edit11.Text:='无';
  edit12.Text:='';
  edit13.Text:='';
  edit14.Text:='';
  edit15.Text:='';
  edit16.Text:='';
  edit17.Text:='';
  edit18.Text:='';
  edit19.Text:='';
  edit20.Text:='';
  edit21.Text:='';
  edit22.Text:='';
  edit23.Text:='';
  edit24.Text:='';
  edit25.Text:='';
  edit26.Text:='';
  edit29.Text:='';
  edit32.Text:='';
  edit33.Text:='';
  edit34.Text:='';
  edit35.Text:='';
  edit29.Enabled:=false;
  edit30.Text:='';
  edit30.Enabled:=false;
  edit31.Text:='';
  edit31.Enabled:=false;
  button19.Enabled:=false;
  button20.Enabled:=false;
  button21.Enabled:=false;
  button22.Enabled:=false;
  combobox7.Text:='-----请选择查询类别-----';
  combobox7.Enabled:=false;
  Combobox1.Text:='默认';
  Combobox2.Text:='默认';
  Combobox3.Text:='默认';
  Combobox4.Text:='默认';
  Combobox5.Text:='-----请选择查询类别-----';
  Combobox6.Text:='-----请选择查询类别-----';
  edit27.Text:='';
  edit28.Text:='';
  image2.Picture:=nil;
  image3.Picture:=nil;
end;

procedure TForm1.Button15Click(Sender: TObject);
var
  OpenDialog:TOpenDialog;
begin
  OpenDialog:=TOpenDialog.Create(self);
  opendialog.Title:='请选择照片';
  opendialog.Filter:='照片文件|*.bmp';
  if OpenDialog.Execute then
  begin
    //--------------闪屏的图片设置--------
    //如果不是位图则直接载入JPEG对象
    if opendialog.FileName <> '' then
    begin
      Pic_pub.LoadFromFile(OpenDialog.FileName);
      image3.Picture.Assign(Pic_pub.Bitmap);
      image3.stretch:=true;
    end;
  end;
  OpenDialog.Free;
end;

procedure TForm1.Button14Click(Sender: TObject);
var
  ADOQuery:TADOQuery;
begin
  ADOQuery:=TADOQuery.Create(self);
  ADOQuery.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+
                              extractfilepath(application.ExeName)+
                              'DATA\db_booksys.mdb;Persist Security Info=False';   //连接字符串
//-----系统容错---------
  if edit21.Text='' then
  begin
    MessageDlg('客户姓名不能为空！！', mtInformation, [mbYes],0);
    ADOQuery.Free;
    exit;
  end;
  if edit22.Text='' then
  begin
    MessageDlg('客户年龄不能为空！！', mtInformation, [mbYes],0);
    ADOQuery.Free;
    exit;
  end;
  if edit23.Text='' then
  begin
    MessageDlg('客户出生日期不能为空！！', mtInformation, [mbYes],0);
    ADOQuery.Free;
    exit;
  end;
  if edit24.Text='' then
  begin
    MessageDlg('客户家庭住址不能为空！！', mtInformation, [mbYes],0);
    ADOQuery.Free;
    exit;
  end;
  if Combobox4.Text='默认' then
  begin
    MessageDlg('请选择性别！！', mtInformation, [mbYes],0);
    ADOQuery.Free;
    exit;
  end;
//---------添加操作----=-----
  ADOQuery.Close;
  ADOQuery.SQL.Clear;
  if Pic_pub.Bitmap.HandleAllocated=false then  //没有照片时的员工添加
  begin
    ADOQuery.SQL.Add('insert into tab_pasinfo (passenger_id,pas_name,pas_sex,pas_age,pas_birthday,pas_address,pas_comeday) values (:A,:S,:D,:F,:G,:H,:J)');
    ADOQuery.Parameters.ParamByName('A').Value:=Edit20.Text;
    ADOQuery.Parameters.ParamByName('S').Value:=Edit21.Text;
    ADOQuery.Parameters.ParamByName('D').Value:=Combobox4.Text;
    ADOQuery.Parameters.ParamByName('F').Value:=Edit22.Text;
    ADOQuery.Parameters.ParamByName('G').Value:=Edit23.Text;
    ADOQuery.Parameters.ParamByName('H').Value:=Edit24.Text;
    ADOQuery.Parameters.ParamByName('J').Value:=Edit25.Text;
  end
  else
  begin                                          //有照片时的员工添加
    ADOQuery.SQL.Add('insert into tab_pasinfo (passenger_id,pas_name,pas_sex,pas_age,pas_birthday,pas_address,pas_comeday,pas_photo) values (:A,:S,:D,:F,:G,:H,:J,:K)');
    ADOQuery.Parameters.ParamByName('A').Value:=Edit20.Text;
    ADOQuery.Parameters.ParamByName('S').Value:=Edit21.Text;
    ADOQuery.Parameters.ParamByName('D').Value:=Combobox4.Text;
    ADOQuery.Parameters.ParamByName('F').Value:=Edit22.Text;
    ADOQuery.Parameters.ParamByName('G').Value:=Edit23.Text;
    ADOQuery.Parameters.ParamByName('H').Value:=Edit24.Text;
    ADOQuery.Parameters.ParamByName('J').Value:=Edit25.Text;
    ADOQuery.Parameters.ParamByName('K').Assign(Pic_pub);
  end;
  try
    ADOQuery.ExecSQL;
    MessageDlg('客户添加成功！！', mtInformation, [mbYes],0);
    Pic_pub:=nil;
  except
    MessageDlg('操作失败！！', mtInformation, [mbYes],0);
  end;
  image2.Picture:=nil;
  panel6.Caption:='没有照片';
  form1.emp_refrish;
  N15.Click ;
  ADOQuery.Free;
end;

procedure TForm1.N15Click(Sender: TObject);
var
  ADOQuery:TADOQuery;
begin
  form_panel4Click();
  emp_YN_null;
  PageControl1.ActivePageIndex:=5;
  ADOQuery:=TADOQuery.Create(self);
  ADOQuery.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+
                              extractfilepath(application.ExeName)+
                              'DATA\db_booksys.mdb;Persist Security Info=False';   //连接字符串
  ADOQuery.SQL.Clear;
  ADOQuery.SQL.Add('select passenger_id from tab_pasinfo');
  ADOQuery.Open;
  ADOQuery.Last;
  edit20.Text:= Myjiami.db_idtoadd(ADOQuery.FieldValues['passenger_id'],10);
  edit25.Text:= formatdatetime('yyyy/mm/dd',now);
  edit20.Enabled:=false;
  edit25.Enabled:=false;
  edit21.Enabled:=true;
  edit22.Enabled:=true;
  edit23.Enabled:=true;
  edit24.Enabled:=true;
  combobox4.Enabled:=true;
  button14.Enabled:=true;
  button15.Enabled:=true;
  button16.Enabled:=false;
  button17.Enabled:=false;
  button18.Enabled:=false;
  edit26.Enabled:=false;
  form1.pas_refrish;
  ADOQuery.Free;
end;

procedure TForm1.Button16Click(Sender: TObject);
var
  ADOQuery:TADOQuery;
begin
  ADOQuery:=TADOQuery.Create(SELF);
  ADOQuery.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+
                              extractfilepath(application.ExeName)+
                              'DATA\db_booksys.mdb;Persist Security Info=False';   //连接字符串
//--------系统容错-------
  if edit21.Text='' then
  begin
    MessageDlg('客户姓名不能为空！！', mtInformation, [mbYes],0);
    ADOQuery.Free;
    exit;
  end;
  if edit22.Text='' then
  begin
    MessageDlg('客户年龄不能为空！！', mtInformation, [mbYes],0);
    ADOQuery.Free;
    exit;
  end;
  if edit23.Text='' then
  begin
    MessageDlg('客户出生日期不能为空！！', mtInformation, [mbYes],0);
    ADOQuery.Free;
    exit;
  end;
  if edit24.Text='' then
  begin
    MessageDlg('客户家庭住址不能为空！！', mtInformation, [mbYes],0);
    ADOQuery.Free;
    exit;
  end;
  if Combobox4.Text='默认' then
  begin
    MessageDlg('请选择性别！！', mtInformation, [mbYes],0);
    ADOQuery.Free;
    exit;
  end;
//----------记录是否存在-----
  ADOQuery.Close;
  ADOQuery.SQL.Clear;
  ADOQuery.SQL.Add('select * from tab_pasinfo where passenger_id=:A');
  ADOQuery.Parameters.ParamByName('A').Value:=edit20.Text;
  ADOQuery.Open;
  if  ADOQuery.RecordCount<=0 then
  begin
    MessageDlg('记录不存在无法更新！！', mtInformation, [mbYes],0);
    ADOQuery.Free;
    exit;
  end;
//----------更新操作----------
  ADOQuery.Close;
  ADOQuery.SQL.Clear;
  if Pic_pub.Bitmap.HandleAllocated=false then  //没有照片时的更新
  begin
    ADOQuery.SQL.Add('update tab_pasinfo set pas_name=:S,pas_sex=:D,pas_age=:F,pas_address=:G where passenger_id=:A');
    ADOQuery.Parameters.ParamByName('S').Value:=edit21.Text;
    ADOQuery.Parameters.ParamByName('D').Value:=combobox4.Text;
    ADOQuery.Parameters.ParamByName('F').Value:=edit22.Text;
    ADOQuery.Parameters.ParamByName('G').Value:=edit24.Text;
    ADOQuery.Parameters.ParamByName('A').Value:=edit20.Text;
  end
  else
  begin                                         //有照片时的更新
    ADOQuery.SQL.Add('update tab_pasinfo set pas_name=:S,pas_sex=:D,pas_age=:F,pas_address=:G,pas_photo=:H where passenger_id=:A');
    ADOQuery.Parameters.ParamByName('S').Value:=edit21.Text;
    ADOQuery.Parameters.ParamByName('D').Value:=combobox4.Text;
    ADOQuery.Parameters.ParamByName('F').Value:=edit22.Text;
    ADOQuery.Parameters.ParamByName('G').Value:=edit24.Text;
    ADOQuery.Parameters.ParamByName('H').Assign(pic_pub);
    ADOQuery.Parameters.ParamByName('A').Value:=edit20.Text;
  end;
  try
    ADOQuery.ExecSQL;
    MessageDlg('客户更新成功！！', mtInformation, [mbYes],0);
    panel5.Caption:='没有照片';
    Pic_pub.Bitmap:=nil;
  except
    MessageDlg('操作失败！！', mtInformation, [mbYes],0);
  end;
  form1.emp_refrish;
  N16.Click;
  ADOQuery.Free;
end;

procedure TForm1.Button17Click(Sender: TObject);
var
  ADOQuery:TADOQuery;
begin
  ADOQuery:=TADOQuery.Create(SELF);
  ADOQuery.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+
                              extractfilepath(application.ExeName)+
                              'DATA\db_booksys.mdb;Persist Security Info=False';   //连接字符串
  ADOQuery.Close;
  ADOQuery.SQL.Clear;
  ADOQuery.SQL.Add('select * from tab_pasinfo where passenger_id=:A');
  ADOQuery.Parameters.ParamByName('A').Value:=edit20.Text;
  ADOQuery.Open;
  if ADOQuery.RecordCount>0 then
  begin
    edit20.Text:=ADOQuery.FieldValues['passenger_id'];
    edit21.Text:=ADOQuery.FieldValues['pas_name'];
    Combobox4.Text:=ADOQuery.FieldValues['pas_sex'];
    edit22.Text:=ADOQuery.FieldValues['pas_age'];
    edit23.Text:=ADOQuery.FieldValues['pas_birthday'];
    edit24.Text:=ADOQuery.FieldValues['pas_address'];
    edit25.Text:=ADOQuery.FieldValues['pas_comeday'];
    Pic_pub.Assign(ADOQuery.FieldByName('pas_photo'));
    if Pic_pub.Bitmap.HandleAllocated=true then //判断PIC_PUB是否有图片
    begin
      image3.Picture.Assign(Pic_pub.Bitmap);
      image3.Stretch:=true;
    end
    else
    begin
      image3.Picture:=nil;
      Pic_pub.Bitmap:=nil;
    end;
  end
  else
  begin
    MessageDlg('没有这个客户的记录！！', mtInformation, [mbYes],0);
  end;
  edit20.Enabled:=false;
  edit21.Enabled:=true;
  edit22.Enabled:=true;
  edit23.Enabled:=true;
  edit24.Enabled:=true;
  combobox4.Enabled:=true;
  button14.Enabled:=false;
  button15.Enabled:=true;
  button16.Enabled:=true;
  button17.Enabled:=false;
  button18.Enabled:=false;
  edit26.Enabled:=false;
  ADOQuery.Free;
end;

procedure TForm1.Button18Click(Sender: TObject);
var
  ADOQuery:TADOQuery;
  str:string;
begin
  ADOQuery:=TADOQuery.Create(SELF);
  ADOQuery.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+
                              extractfilepath(application.ExeName)+
                              'DATA\db_booksys.mdb;Persist Security Info=False';   //连接字符串
  if edit26.Text='' then
  begin
    MessageDlg('请输入要删除的客户编号！！', mtInformation, [mbYes],0);
    ADOQuery.Free;
    exit;
  end;
  ADOQuery.Close;
  ADOQuery.SQL.Clear;
  ADOQuery.SQL.Add('select * from tab_pasinfo where passenger_id=:A');
  ADOQuery.Parameters.ParamByName('A').Value:=trim(edit26.Text);
  ADOQuery.Open;
  if ADOQuery.RecordCount<=0 then
  begin
    MessageDlg('记录不存在！！', mtInformation, [mbYes],0);
    ADOQuery.Free;
    exit;
  end;
  if MessageDlg('你真的要删除这个记录吗？！！', mtInformation, [mbYes,mbNo],0)=mrYes then
  begin
    ADOQuery.Close;
    ADOQuery.SQL.Clear;
    ADOQuery.SQL.Add('delete from tab_pasinfo where passenger_id=:A');
    ADOQuery.Parameters.ParamByName('A').Value:= trim(edit26.Text);
    try
      ADOQuery.ExecSQL;
      ADOQuery.Close;
      ADOQuery.SQL.Clear;
      ADOQuery.SQL.Add('select * from tab_bookcardinfo where pas_id=:A');
      ADOQuery.Parameters.ParamByName('A').Value:=trim(edit26.Text);
      ADOQuery.Open;
      str:=ADOQuery.FieldValues['bookcard_id'];
      ADOQuery.Close;
      ADOQuery.SQL.Clear;
      ADOQuery.SQL.Add('delete from tab_bookcardinfo where pas_id=:A');
      ADOQuery.Parameters.ParamByName('A').Value:=trim(edit26.Text);
      ADOQuery.ExecSQL;
      ADOQuery.Close;
      ADOQuery.SQL.Clear;
      ADOQuery.SQL.Add('delete from tab_borrow_return where bookcard_id=:A');
      ADOQuery.Parameters.ParamByName('A').Value:=str;
      ADOQuery.ExecSQL;
      MessageDlg('记录删除成功！！', mtInformation, [mbYes],0);
    except
      MessageDlg('操作失败！！', mtInformation, [mbYes],0);
    end;
  end;
  form1.emp_refrish;
  N17.Click;
  ADOQuery.Free;
end;

procedure TForm1.book_refrish;
begin
  ADOQuery_pub.Close;
  ADOQuery_pub.SQL.Clear;
  ADOQuery_pub.SQL.Add('select * from tab_bookinfo');
  ADOQuery_pub.Open;   //刷新内容
  DBGrid3.DataSource:=nil;
  DBGrid3.DataSource:=dataSource_pub;
  DBGrid3.Columns.Items[0].FieldName:='book_id';
  DBGrid3.Columns.Items[1].FieldName:='book_name';
  DBGrid3.Columns.Items[2].FieldName:='book_writer';
  DBGrid3.Columns.Items[3].FieldName:='book_pub_times';
  DBGrid3.Columns.Items[4].FieldName:='book_information';
end;

procedure TForm1.emp_refrish;
begin
  ADOQuery_pub.Close;
  ADOQuery_pub.SQL.Clear;
  ADOQuery_pub.SQL.Add('select * from tab_empinfo');
  ADOQuery_pub.Open;   //刷新内容
  DBGrid4.DataSource:=nil;
  DBGrid4.DataSource:=dataSource_pub;
  DBGrid4.Columns.Items[0].FieldName:='employer_id';
  DBGrid4.Columns.Items[1].FieldName:='emp_name';
  DBGrid4.Columns.Items[2].FieldName:='emp_sex';
  DBGrid4.Columns.Items[3].FieldName:='emp_age';
  DBGrid4.Columns.Items[4].FieldName:='emp_birthday';
  DBGrid4.Columns.Items[5].FieldName:='emp_address';
  DBGrid4.Columns.Items[6].FieldName:='emp_comeday';
end;

procedure TForm1.pas_refrish;
begin
  ADOQuery_pub.Close;
  ADOQuery_pub.SQL.Clear;
  ADOQuery_pub.SQL.Add('select * from tab_pasinfo');
  ADOQuery_pub.Open;   //刷新内容
  DBGrid5.DataSource:=nil;
  DBGrid5.DataSource:=dataSource_pub;
  DBGrid5.Columns.Items[0].FieldName:='passenger_id';
  DBGrid5.Columns.Items[1].FieldName:='pas_name';
  DBGrid5.Columns.Items[2].FieldName:='pas_sex';
  DBGrid5.Columns.Items[3].FieldName:='pas_age';
  DBGrid5.Columns.Items[4].FieldName:='pas_birthday';
  DBGrid5.Columns.Items[5].FieldName:='pas_address';
  DBGrid5.Columns.Items[6].FieldName:='pas_comeday';
end;

procedure TForm1.N11Click(Sender: TObject);
begin
  form_panel4Click();
  PageControl1.ActivePageIndex:=4;
  edit13.Enabled:=true;
  edit18.Enabled:=false;
  edit14.Enabled:=false;
  edit15.Enabled:=false;
  edit16.Enabled:=false;
  edit17.Enabled:=false;
  edit19.Enabled:=false;
  combobox3.Enabled:=false;
  button9.Enabled:=false;
  button10.Enabled:=false;
  button11.Enabled:=false;
  button12.Enabled:=false;
  button13.Enabled:=true;
  form1.emp_refrish;
  form1.emp_YN_null;
end;

procedure TForm1.N12Click(Sender: TObject);
begin
  form_panel4Click();
  PageControl1.ActivePageIndex:=4;
  form1.pas_refrish;
  edit13.Enabled:=false;
  edit18.Enabled:=false;
  edit14.Enabled:=false;
  edit15.Enabled:=false;
  edit16.Enabled:=false;
  edit17.Enabled:=false;
  edit19.Enabled:=true;
  combobox3.Enabled:=false;
  button9.Enabled:=false;
  button10.Enabled:=false;
  button11.Enabled:=false;
  button12.Enabled:=true;
  button13.Enabled:=false;
  form1.emp_refrish;
  form1.emp_YN_null;
end;

procedure TForm1.N16Click(Sender: TObject);
begin
  form1.pas_refrish;
  PageControl1.ActivePageIndex:=5;
  form1.emp_YN_null;
  form_panel4Click();
  edit20.Enabled:=true;
  edit25.Enabled:=false;
  edit21.Enabled:=false;
  edit22.Enabled:=false;
  edit23.Enabled:=false;
  edit24.Enabled:=false;
  combobox4.Enabled:=false;
  button14.Enabled:=false;
  button15.Enabled:=false;
  button16.Enabled:=false;
  button17.Enabled:=true;
  button18.Enabled:=false;
  edit26.Enabled:=false;
end;

procedure TForm1.N17Click(Sender: TObject);
begin
  form1.pas_refrish;
  PageControl1.ActivePageIndex:=5;
  form1.emp_YN_null;
  form_panel4Click();
  edit20.Enabled:=false;
  edit25.Enabled:=false;
  edit21.Enabled:=false;
  edit22.Enabled:=false;
  edit23.Enabled:=false;
  edit24.Enabled:=false;
  combobox4.Enabled:=false;
  button14.Enabled:=false;
  button15.Enabled:=false;
  button16.Enabled:=false;
  button17.Enabled:=false;
  button18.Enabled:=true;
  edit26.Enabled:=true;
end;

procedure TForm1.ComboBox5KeyPress(Sender: TObject; var Key: Char);
begin
  key:=#0;
end;

procedure TForm1.SpeedButton9Click(Sender: TObject);
begin
  SpeedButton6.Click;
  form1.emp_YN_null;
end;

procedure TForm1.Edit27Change(Sender: TObject);
begin
  if Combobox5.Text='-----请选择查询类别--------' then
  begin
    MessageDlg('请选择查询类别！！', mtInformation, [mbYes],0);
    edit27.Text:='';
    exit;
  end;
  if Combobox5.Text='-----请选择查询类别-----' then
  begin
    Combobox5.Text:='-----请选择查询类别--------';
    exit;
  end;
  ADOQuery_1.Close;
  ADOQuery_1.SQL.Clear;
  if Combobox5.Text='按编号查询' then
    ADOQuery_1.SQL.Add('select * from tab_empinfo where employer_id like :A');
  if Combobox5.Text='按姓名查询' then
    ADOQuery_1.SQL.Add('select * from tab_empinfo where emp_name like :A');
  if Combobox5.Text='按姓别查询' then
    ADOQuery_1.SQL.Add('select * from tab_empinfo where emp_sex like :A');
  if Combobox5.Text='按年龄查询' then
    ADOQuery_1.SQL.Add('select * from tab_empinfo where emp_age like :A');
  if Combobox5.Text='按地址查询' then
    ADOQuery_1.SQL.Add('select * from tab_empinfo where emp_address like :A');
  if Combobox5.Text='按登记日期查询' then
    ADOQuery_1.SQL.Add('select * from tab_empinfo where emp_comeday like :A');
  ADOQuery_1.Parameters.ParamByName('A').Value:=Trim(edit27.Text+'%');
  ADOQuery_1.Open;
  if ADOQuery_1.recordcount>0 then
  begin
    DBGrid6.Columns.Items[0].FieldName:='employer_id';
    DBGrid6.Columns.Items[1].FieldName:='emp_name';
    DBGrid6.Columns.Items[2].FieldName:='emp_sex';
    DBGrid6.Columns.Items[3].FieldName:='emp_age';
    DBGrid6.Columns.Items[4].FieldName:='emp_address';
    DBGrid6.Columns.Items[5].FieldName:='emp_comeday';
  end
  else
  begin
    MessageDlg('没有相关记录！！',mtInformation, [mbYes],0);
    edit27.Text:='';
  end;
end;

procedure TForm1.N13Click(Sender: TObject);
begin
  form_panel4Click();
  emp_YN_null;
  PageControl1.ActivePageIndex:=6;
end;

procedure TForm1.Edit28Change(Sender: TObject);
begin
  if Combobox6.Text='-----请选择查询类别--------' then
  begin
    MessageDlg('请选择查询类别！！', mtInformation, [mbYes],0);
    edit28.Text:='';
    exit;
  end;
  if Combobox6.Text='-----请选择查询类别-----' then
  begin
    Combobox6.Text:='-----请选择查询类别--------';
    exit;
  end;
  ADOQuery_1.Close;
  ADOQuery_1.SQL.Clear;
  if Combobox6.Text='按编号查询' then
    ADOQuery_1.SQL.Add('select * from tab_pasinfo where passenger_id like :A');
  if Combobox6.Text='按姓名查询' then
    ADOQuery_1.SQL.Add('select * from tab_pasinfo where pas_name like :A');
  if Combobox6.Text='按姓别查询' then
    ADOQuery_1.SQL.Add('select * from tab_pasinfo where pas_sex like :A');
  if Combobox6.Text='按年龄查询' then
    ADOQuery_1.SQL.Add('select * from tab_pasinfo where pas_age like :A');
  if Combobox6.Text='按地址查询' then
    ADOQuery_1.SQL.Add('select * from tab_pasinfo where pas_address like :A');
  if Combobox6.Text='按登记日期查询' then
    ADOQuery_1.SQL.Add('select * from tab_pasinfo where pas_comeday like :A');
  ADOQuery_1.Parameters.ParamByName('A').Value:=Trim(edit28.Text+'%');
  ADOQuery_1.Open;
  if ADOQuery_1.recordcount>0 then
  begin
    DBGrid7.Columns.Items[0].FieldName:='passenger_id';
    DBGrid7.Columns.Items[1].FieldName:='pas_name';
    DBGrid7.Columns.Items[2].FieldName:='pas_sex';
    DBGrid7.Columns.Items[3].FieldName:='pas_age';
    DBGrid7.Columns.Items[4].FieldName:='pas_address';
    DBGrid7.Columns.Items[5].FieldName:='pas_comeday';
  end
  else
  begin
    MessageDlg('没有相关记录！！',mtInformation, [mbYes],0);
    edit28.Text:='';
  end;
end;

procedure TForm1.SpeedButton10Click(Sender: TObject);
begin
  SpeedButton6.Click;
  form1.emp_YN_null;
end;

procedure TForm1.N18Click(Sender: TObject);
begin
  form_panel4Click();
  emp_YN_null;
  PageControl1.ActivePageIndex:=7;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  Statusbar1.Panels[2].Text:='当前时间:   '+formatdatetime('yyyy/mm/dd hh:mm:ss',now);
end;

procedure TForm1.Button19Click(Sender: TObject);
begin
  ADOQuery_1.Close;
  ADOQuery_1.SQL.Clear;
  ADOQuery_1.SQL.Add('select book_id,book_name,book_writer,book_publishname from tab_bookinfo,tab_bookpublish where tab_bookinfo.book_publishid=tab_bookpublish.book_publishid and book_id=:A');
  ADOQuery_1.Parameters.ParamByName('A').Value:=Trim(edit29.Text);
  ADOQuery_1.Open;
  DBGrid8.Columns.Items[0].FieldName:='book_id';
  DBGrid8.Columns.Items[1].FieldName:='book_name';
  DBGrid8.Columns.Items[2].FieldName:='book_writer';
  DBGrid8.Columns.Items[3].FieldName:='book_publishname';//DBGRID的字段赋值
  if ADOQuery_1.RecordCount<=0 then
  begin
    MessageDlg('没有记录！！',mtInformation, [mbYes],0);
  end;
end;

procedure TForm1.Button20Click(Sender: TObject);
begin
  ADOQuery_1.Close;
  ADOQuery_1.SQL.Clear;
  ADOQuery_1.SQL.Add('select book_id,book_name,book_writer,book_publishname from tab_bookinfo,tab_bookpublish where tab_bookinfo.book_publishid=tab_bookpublish.book_publishid and book_name=:A');
  ADOQuery_1.Parameters.ParamByName('A').Value:=Trim(edit30.Text);
  ADOQuery_1.Open;
  DBGrid8.Columns.Items[0].FieldName:='book_id';
  DBGrid8.Columns.Items[1].FieldName:='book_name';
  DBGrid8.Columns.Items[2].FieldName:='book_writer';
  DBGrid8.Columns.Items[3].FieldName:='book_publishname';//DBGRID的字段赋值
  if ADOQuery_1.RecordCount<=0 then
  begin
    MessageDlg('没有记录！！',mtInformation, [mbYes],0);
  end;
end;

procedure TForm1.Button21Click(Sender: TObject);
begin
  ADOQuery_1.Close;
  ADOQuery_1.SQL.Clear;
  ADOQuery_1.SQL.Add('select book_id,book_name,book_writer,book_publishname from tab_bookinfo,tab_bookpublish where tab_bookinfo.book_publishid=tab_bookpublish.book_publishid and book_writer=:A');
  ADOQuery_1.Parameters.ParamByName('A').Value:=Trim(edit31.Text);
  ADOQuery_1.Open;
  DBGrid8.Columns.Items[0].FieldName:='book_id';
  DBGrid8.Columns.Items[1].FieldName:='book_name';
  DBGrid8.Columns.Items[2].FieldName:='book_writer';
  DBGrid8.Columns.Items[3].FieldName:='book_publishname';//DBGRID的字段赋值
  if ADOQuery_1.RecordCount<=0 then
  begin
    MessageDlg('没有记录！！',mtInformation, [mbYes],0);
  end;
end;

procedure TForm1.Button22Click(Sender: TObject);
begin
  ADOQuery_1.Close;
  ADOQuery_1.SQL.Clear;
  ADOQuery_1.SQL.Add('select book_id,book_name,book_writer,book_publishname from tab_bookinfo,tab_bookpublish where tab_bookpublish.book_publishname=:A and tab_bookinfo.book_publishid=tab_bookpublish.book_publishid');
  ADOQuery_1.Parameters.ParamByName('A').Value:=Trim(Combobox7.Text);
  ADOQuery_1.Open;
  DBGrid8.Columns.Items[0].FieldName:='book_id';
  DBGrid8.Columns.Items[1].FieldName:='book_name';
  DBGrid8.Columns.Items[2].FieldName:='book_writer';
  DBGrid8.Columns.Items[3].FieldName:='book_publishname';//DBGRID的字段赋值
  if ADOQuery_1.RecordCount<=0 then
  begin
    MessageDlg('没有记录！！',mtInformation, [mbYes],0);
  end;
end;

procedure TForm1.RadioButton1Click(Sender: TObject);
begin
    N8.Click;
    edit29.Enabled:=true;
    edit30.Enabled:=false;
    edit31.Enabled:=false;
    combobox7.Enabled:=false;
    button19.Enabled:=true;
    button20.Enabled:=false;
    button21.Enabled:=false;
    button22.Enabled:=false;
end;

procedure TForm1.RadioButton2Click(Sender: TObject);
begin
  if RadioButton2.Checked=true then
  begin
    N8.Click;
    edit29.Enabled:=false;
    edit30.Enabled:=true;
    edit31.Enabled:=false;
    combobox7.Enabled:=false;
    button19.Enabled:=false;
    button20.Enabled:=true;
    button21.Enabled:=false;
    button22.Enabled:=false;
  end;
end;

procedure TForm1.RadioButton3Click(Sender: TObject);
begin
  if RadioButton3.Checked=true then
  begin
    N8.Click;
    edit29.Enabled:=false;
    edit30.Enabled:=false;
    edit31.Enabled:=true;
    combobox7.Enabled:=false;
    button19.Enabled:=false;
    button20.Enabled:=false;
    button21.Enabled:=true;
    button22.Enabled:=false;
  end;
end;

procedure TForm1.RadioButton4Click(Sender: TObject);
begin
  if RadioButton4.Checked=true then
  begin
    N8.Click;
    edit29.Enabled:=false;
    edit30.Enabled:=false;
    edit31.Enabled:=false;
    combobox7.Enabled:=true;
    button19.Enabled:=false;
    button20.Enabled:=false;
    button21.Enabled:=false;
    button22.Enabled:=true;
  end;
end;

procedure TForm1.N8Click(Sender: TObject);
begin
  form_panel4Click();
  pagecontrol1.ActivePageIndex:=8;
  emp_YN_null;
end;

procedure TForm1.N32Click(Sender: TObject);
begin
  form6.Panel1.Visible:=false;
  form6.Panel2.Visible:=false;
  form6.Panel3.Visible:=false;
  form6.Caption:='系统用户浏览';
  form6.clear_checkbox;
  form6.Button9.Enabled:=false;
  form6.ShowModal;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
var
  str_file:string;
  Textfile1:Textfile;    //文本文件类
begin
  form6.ADOQuery_1.Free;
  form6.DataSource_1.Free;
  ADOQuery_pub.Free;
  DataSource_pub.Free;
  Pic_pub.Free;
  str_file:=formatdatetime('yyyy/mm/dd ',now)+'bookcrd.LOG';
  if memo1.Text<>'' then
  begin
    if FileExists(extractfilepath(application.ExeName)+str_file) then
    begin
      AssignFile(Textfile1, extractfilepath(application.ExeName)+str_file );
      append(Textfile1);
      writeln(Textfile1, memo1.text);
      closefile(Textfile1);   //用文本文件类对文件的添加操作
    end
    else
    begin
      memo1.Lines.SaveToFile(str_file);
    end;
  end;
end;

procedure TForm1.Button26Click(Sender: TObject);
begin
  ADOQuery_pub.Close;
  ADOQuery_pub.SQL.Clear;
  ADOQuery_pub.SQL.Add('select * from tab_bookclassinfo');
  ADOQuery_pub.Open;
  if ADOQuery_pub.RecordCount>0 then
  begin
    DBGrid9.DataSource:=DataSource_pub;
    DBGrid9.Columns.Items[0].Title.caption:='图书类别编号    ';
    DBGrid9.Columns.Items[1].Title.caption:='图书类别名称    ';
    DBGrid9.Columns.Items[0].FieldName:='bookclass_id';
    DBGrid9.Columns.Items[1].FieldName:='bookclass_name';
  end;//动态设置DBGRID
  emp_YN_null;
end;

procedure TForm1.Button30Click(Sender: TObject);
begin
  ADOQuery_pub.Close;
  ADOQuery_pub.SQL.Clear;
  ADOQuery_pub.SQL.Add('select * from tab_bookpublish');
  ADOQuery_pub.Open;
  if ADOQuery_pub.RecordCount>0 then
  begin
    DBGrid9.DataSource:=DataSource_pub;
    DBGrid9.Columns.Items[0].Title.caption:='图书出版社编号    ';
    DBGrid9.Columns.Items[1].Title.caption:='图书出版社名称    ';
    DBGrid9.Columns.Items[0].FieldName:='book_publishid';
    DBGrid9.Columns.Items[1].FieldName:='book_publishname';
  end;//动态设置DBGRID
  emp_YN_null;
end;

procedure TForm1.Button23Click(Sender: TObject);
var
  ADOQuery:TADOQuery;
  i:integer;
begin
  ADOQuery:=TADOQuery.Create(self);
  ADOQuery.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+
                              extractfilepath(application.ExeName)+
                              'DATA\db_booksys.mdb;Persist Security Info=False';   //连接字符串
  ADOQuery.Close;
  ADOQuery.SQL.Clear;
  ADOQuery.SQL.Add('select bookclass_id from tab_bookclassinfo');
  ADOQuery.Open;
  ADOQuery.Last;
  edit32.Text:=myjiami.db_idtoadd(ADOQuery.FieldValues['bookclass_id'],10);

  if Trim(edit33.Text)<>'' then
  begin
    ADOQuery.Close;
    ADOQuery.SQL.Clear;
    ADOQuery.SQL.Add('select * from tab_bookclassinfo where bookclass_name=:A');
    ADOQuery.Parameters.ParamByName('A').Value:=trim(edit33.Text);
    ADOQuery.Open;
    if ADOQuery.RecordCount>0 then
    begin
      MessageDlg('记录以存在，请选择其它名子！！', mtInformation, [mbYes],0);
      ADOQuery.Free;
      exit;
    end;   //判断名子是否与数据库中内容相同
    ADOQuery.Close;
    ADOQuery.SQL.Clear;
    ADOQuery.SQL.Add('insert into tab_bookclassinfo (bookclass_id,bookclass_name) values (:A,:S)');
    ADOQuery.Parameters.ParamByName('A').Value:=trim(edit32.Text);
    ADOQuery.Parameters.ParamByName('S').Value:=trim(edit33.Text);
    try
      ADOQuery.ExecSQL;
      if MessageDlg('您已经成功添加了一条记录'+#13+'您还要继续添加记录吗？！！', mtInformation, [mbYes,mbNo],0)=mrYes then
      begin
        edit32.Text:=myjiami.db_idtoadd(edit32.Text,10);
        emp_YN_null;
      end
      else
      begin
        edit32.Text:='';
        emp_YN_null;
      end;
    except
       MessageDlg('操作失改！！', mtInformation, [mbYes],0);
    end;
  end
  else
  begin
    MessageDlg('图书类别名不能为空！！', mtInformation, [mbYes],0);
  end;
//-------刷新浏览树中内容----
  adoquery.Close;
  adoquery.SQL.Clear;
  adoquery.SQL.Add('select * from tab_bookclassinfo');
  adoquery.Open;       //从数据库中选择类别
  treeview1.Items.Clear;
  Combobox1.Items.Clear;
  for i:=0 to (adoquery.RecordCount-1) do    //将数据库中的类别添加到TREEVIEW中
  begin
    treeview1.Items.Add(nil,adoquery.FieldByName('bookclass_name').asstring);
    Combobox1.Items.Add(ADOQuery.FieldValues['bookclass_name']);
    adoquery.Next;
  end;
  ADOQuery.Free;
end;

procedure TForm1.Button24Click(Sender: TObject);
var
  ADOQuery:TADOQuery;
  i:integer;
begin
  ADOQuery:=TADOQuery.Create(self);
  ADOQuery.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+
                              extractfilepath(application.ExeName)+
                              'DATA\db_booksys.mdb;Persist Security Info=False';   //连接字符串
  if trim(edit32.Text)='' then
  begin
    MessageDlg('请输入图书类别编号！！', mtInformation, [mbYes],0);
    ADOQuery.Free;
    exit;
  end;
  ADOQuery.Close;
  ADOQuery.SQL.Clear;
  ADOQuery.SQL.Add('select * from tab_bookclassinfo where bookclass_id=:A');
  ADOQuery.Parameters.ParamByName('A').Value:=trim(edit32.Text);
  ADOQuery.Open;
  if ADOQuery.RecordCount<=0 then
  begin
    MessageDlg('记录不存在！！', mtInformation, [mbYes],0);
    edit32.Text:='';
    ADOQuery.Free;
    exit;
  end;   //判断名子是否与数据库中内容相同
  if Trim(edit33.Text)<>'' then
  begin
    ADOQuery.Close;
    ADOQuery.SQL.Clear;
    ADOQuery.SQL.Add('update tab_bookclassinfo set bookclass_name=:A where bookclass_id=:S');
    ADOQuery.Parameters.ParamByName('A').Value:=trim(edit33.Text);
    ADOQuery.Parameters.ParamByName('S').Value:=trim(edit32.Text);
    try
      ADOQuery.ExecSQL;
      MessageDlg('您已经成功修改了这条记录！！', mtInformation, [mbYes],0);
    except
       MessageDlg('操作失改！！', mtInformation, [mbYes],0);
    end;
  end
  else
  begin
    MessageDlg('图书类别名不能为空！！', mtInformation, [mbYes],0);
  end;
//-------刷新浏览树中内容----
  adoquery.Close;
  adoquery.SQL.Clear;
  adoquery.SQL.Add('select * from tab_bookclassinfo');
  adoquery.Open;       //从数据库中选择类别
  treeview1.Items.Clear;
  Combobox1.Items.Clear;
  for i:=0 to (adoquery.RecordCount-1) do    //将数据库中的类别添加到TREEVIEW中
  begin
    treeview1.Items.Add(nil,adoquery.FieldByName('bookclass_name').asstring);
    Combobox1.Items.Add(ADOQuery.FieldValues['bookclass_name']);
    adoquery.Next;
  end;
  emp_YN_null;
  ADOQuery.Free;
end;

procedure TForm1.Button25Click(Sender: TObject);
var
  ADOQuery:TADOQuery;
  i:integer;
begin
  ADOQuery:=TADOQuery.Create(self);
  ADOQuery.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+
                              extractfilepath(application.ExeName)+
                              'DATA\db_booksys.mdb;Persist Security Info=False';   //连接字符串
  if trim(edit32.Text)='' then
  begin
    MessageDlg('请输入要删除的图书类别编号！！', mtInformation, [mbYes],0);
    ADOQuery.Free;
    exit;
  end;
  ADOQuery.Close;
  ADOQuery.SQL.Clear;
  ADOQuery.SQL.Add('select * from tab_bookclassinfo where bookclass_id=:A');
  ADOQuery.Parameters.ParamByName('A').Value:=trim(edit32.Text);
  ADOQuery.Open;
  if ADOQuery.RecordCount<=0 then
  begin
    MessageDlg('记录不存在，无法删除！！', mtInformation, [mbYes],0);
    edit32.Text:='';
    ADOQuery.Free;
    exit;
  end;   //判断名子是否与数据库中内容相同
  if MessageDlg('您真的要删除这条记录吗？！！', mtWarning	, [mbYes,mbNo],0)=mrYes then
  begin
    ADOQuery.Close;
    ADOQuery.SQL.Clear;
    ADOQuery.SQL.Add('delete from tab_bookclassinfo where bookclass_id=:A');
    ADOQuery.Parameters.ParamByName('A').Value:=trim(edit32.Text);
    try
      ADOQuery.ExecSQL;
      MessageDlg('您已经成功的删除一条记录！！', mtInformation, [mbYes],0);
    except
      MessageDlg('操作失改！！', mtInformation, [mbYes],0);
    end;
  end;
//-------刷新浏览树中内容----
  adoquery.Close;
  adoquery.SQL.Clear;
  adoquery.SQL.Add('select * from tab_bookclassinfo');
  adoquery.Open;       //从数据库中选择类别
  treeview1.Items.Clear;
  Combobox1.Items.Clear;
  for i:=0 to (adoquery.RecordCount-1) do    //将数据库中的类别添加到TREEVIEW中
  begin
    treeview1.Items.Add(nil,adoquery.FieldByName('bookclass_name').asstring);
    Combobox1.Items.Add(ADOQuery.FieldValues['bookclass_name']);
    adoquery.Next;
  end;
  emp_YN_null;
  ADOQuery.Free;
end;

procedure TForm1.N35Click(Sender: TObject);
begin
  emp_YN_null;
  PageControl1.ActivePageIndex:=9;
  panel8.Visible:=false;
  panel7.Visible:=true;
  form_panel4Click();
  DBGrid9.DataSource:=nil;
end;

procedure TForm1.N37Click(Sender: TObject);
begin
  emp_YN_null;
  PageControl1.ActivePageIndex:=9;
  panel8.Visible:=true;
  panel7.Visible:=false;
  form_panel4Click();
  DBGrid9.DataSource:=nil;
end;

procedure TForm1.Button27Click(Sender: TObject);
var
  ADOQuery:TADOQuery;
  i:integer;
begin
  ADOQuery:=TADOQuery.Create(self);
  ADOQuery.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+
                              extractfilepath(application.ExeName)+
                              'DATA\db_booksys.mdb;Persist Security Info=False';   //连接字符串
  ADOQuery.Close;
  ADOQuery.SQL.Clear;
  ADOQuery.SQL.Add('select book_publishid from tab_bookpublish');
  ADOQuery.Open;
  ADOQuery.Last;
  edit34.Text:=myjiami.db_idtoadd(ADOQuery.FieldValues['book_publishid'],10);

  if Trim(edit35.Text)<>'' then
  begin
    ADOQuery.Close;
    ADOQuery.SQL.Clear;
    ADOQuery.SQL.Add('select * from tab_bookpublish where book_publishname=:A');
    ADOQuery.Parameters.ParamByName('A').Value:=trim(edit35.Text);
    ADOQuery.Open;
    if ADOQuery.RecordCount>0 then
    begin
      MessageDlg('记录以存在，请选择其它名子！！', mtInformation, [mbYes],0);
      ADOQuery.Free;
      exit;
    end;   //判断名子是否与数据库中内容相同
    ADOQuery.Close;
    ADOQuery.SQL.Clear;
    ADOQuery.SQL.Add('insert into tab_bookpublish (book_publishid,book_publishname) values (:A,:S)');
    ADOQuery.Parameters.ParamByName('A').Value:=trim(edit34.Text);
    ADOQuery.Parameters.ParamByName('S').Value:=trim(edit35.Text);
    try
      ADOQuery.ExecSQL;
      if MessageDlg('您已经成功添加了一条记录'+#13+'您还要继续添加记录吗？！！', mtInformation, [mbYes,mbNo],0)=mrYes then
      begin
        edit34.Text:=myjiami.db_idtoadd(edit34.Text,10);
        emp_YN_null;
      end
      else
      begin
        edit34.Text:='';
        emp_YN_null;
      end;
    except
       MessageDlg('操作失改！！', mtInformation, [mbYes],0);
    end;
  end
  else
  begin
    MessageDlg('图书类别名不能为空！！', mtInformation, [mbYes],0);
  end;
//-------刷新出版社到COMBOBOX中内容----
  ADOQuery.Close;
  ADOQuery.SQL.Clear;
  ADOQuery.SQL.Add('select book_publishname from tab_bookpublish');
  ADOQuery.Open;
  combobox2.Items.Clear;
  Combobox7.Items.Clear;
  for i:=0 to (adoquery.RecordCount-1) do
  begin
    Combobox2.Items.Add(ADOQuery.FieldValues['book_publishname']);
    Combobox7.Items.Add(ADOQuery.FieldValues['book_publishname']);
    ADOQuery.Next;
  end;
  ADOQuery.Free;
end;

procedure TForm1.Button28Click(Sender: TObject);
var
  ADOQuery:TADOQuery;
  i:integer;
begin
  ADOQuery:=TADOQuery.Create(self);
  ADOQuery.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+
                              extractfilepath(application.ExeName)+
                              'DATA\db_booksys.mdb;Persist Security Info=False';   //连接字符串
  if trim(edit34.Text)='' then
  begin
    MessageDlg('请输入图书类别编号！！', mtInformation, [mbYes],0);
    ADOQuery.Free;
    exit;
  end;
  ADOQuery.Close;
  ADOQuery.SQL.Clear;
  ADOQuery.SQL.Add('select * from tab_bookpublish where book_publishid=:A');
  ADOQuery.Parameters.ParamByName('A').Value:=trim(edit34.Text);
  ADOQuery.Open;
  if ADOQuery.RecordCount<=0 then
  begin
    MessageDlg('记录不存在！！', mtInformation, [mbYes],0);
    edit34.Text:='';
    ADOQuery.Free;
    exit;
  end;   //判断名子是否与数据库中内容相同
  if Trim(edit35.Text)<>'' then
  begin
    ADOQuery.Close;
    ADOQuery.SQL.Clear;
    ADOQuery.SQL.Add('update tab_bookpublish set book_publishname=:A where book_publishid=:S');
    ADOQuery.Parameters.ParamByName('A').Value:=trim(edit35.Text);
    ADOQuery.Parameters.ParamByName('S').Value:=trim(edit34.Text);
    try
      ADOQuery.ExecSQL;
      MessageDlg('您已经成功修改了这条记录！！', mtInformation, [mbYes],0);
    except
       MessageDlg('操作失改！！', mtInformation, [mbYes],0);
    end;
  end
  else
  begin
    MessageDlg('图书类别名不能为空！！', mtInformation, [mbYes],0);
  end;
//-------刷新出版社到COMBOBOX中内容----
  ADOQuery.Close;
  ADOQuery.SQL.Clear;
  ADOQuery.SQL.Add('select book_publishname from tab_bookpublish');
  ADOQuery.Open;
  combobox2.Items.Clear;
  Combobox7.Items.Clear;
  for i:=0 to (adoquery.RecordCount-1) do
  begin
    Combobox2.Items.Add(ADOQuery.FieldValues['book_publishname']);
    Combobox7.Items.Add(ADOQuery.FieldValues['book_publishname']);
    ADOQuery.Next;
  end;
  emp_YN_null;
  ADOQuery.Free;
end;

procedure TForm1.Button29Click(Sender: TObject);
var
  ADOQuery:TADOQuery;
  i:integer;
begin
  ADOQuery:=TADOQuery.Create(self);
  ADOQuery.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+
                              extractfilepath(application.ExeName)+
                              'DATA\db_booksys.mdb;Persist Security Info=False';   //连接字符串
  if trim(edit34.Text)='' then
  begin
    MessageDlg('请输入要删除的图书类别编号！！', mtInformation, [mbYes],0);
    ADOQuery.Free;
    exit;
  end;
  ADOQuery.Close;
  ADOQuery.SQL.Clear;
  ADOQuery.SQL.Add('select * from tab_bookpublish where book_publishid=:A');
  ADOQuery.Parameters.ParamByName('A').Value:=trim(edit34.Text);
  ADOQuery.Open;
  if ADOQuery.RecordCount<=0 then
  begin
    MessageDlg('记录不存在，无法删除！！', mtInformation, [mbYes],0);
    edit34.Text:='';
    ADOQuery.Free;
    exit;
  end;   //判断名子是否与数据库中内容相同
  if MessageDlg('您真的要删除这条记录吗？！！', mtWarning	, [mbYes,mbNo],0)=mrYes then
  begin
    ADOQuery.Close;
    ADOQuery.SQL.Clear;
    ADOQuery.SQL.Add('delete from tab_bookpublish where book_publishid=:A');
    ADOQuery.Parameters.ParamByName('A').Value:=trim(edit34.Text);
    try
      ADOQuery.ExecSQL;
      MessageDlg('您已经成功的删除一条记录！！', mtInformation, [mbYes],0);
    except
      MessageDlg('操作失改！！', mtInformation, [mbYes],0);
    end;
  end;
//-------刷新出版社到COMBOBOX中内容----
  ADOQuery.Close;
  ADOQuery.SQL.Clear;
  ADOQuery.SQL.Add('select book_publishname from tab_bookpublish');
  ADOQuery.Open;
  combobox2.Items.Clear;
  Combobox7.Items.Clear;
  for i:=0 to (adoquery.RecordCount-1) do
  begin
    Combobox2.Items.Add(ADOQuery.FieldValues['book_publishname']);
    Combobox7.Items.Add(ADOQuery.FieldValues['book_publishname']);
    ADOQuery.Next;
  end;
  emp_YN_null;
  ADOQuery.Free;
end;

procedure TForm1.DBGrid9CellClick(Column: TColumn);
begin
  if DBGrid9.DataSource=nil  then exit;
  edit32.text := DBGrid9.Columns.Items[0].Field.Text;
  edit33.text := DBGrid9.Columns.Items[1].Field.Text;
  edit34.text := DBGrid9.Columns.Items[0].Field.Text;
  edit35.text := DBGrid9.Columns.Items[1].Field.Text;
end;

procedure TForm1.N36Click(Sender: TObject);
begin
  SpeedButton4.Click;
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
var
  ADOQuery:TADOQuery;
  i:integer;
begin
  if int_human<1 then
  begin
    MessageDlg('无权使用！！',mtWarning, [mbYes],0);
    exit;
  end;
  ADOQuery:=TADOQuery.Create(self);
  ADOQuery.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+
                              extractfilepath(application.ExeName)+
                              'DATA\db_booksys.mdb;Persist Security Info=False';   //连接字符串
  ADOQuery.Close;
  ADOQuery.SQL.Clear;
  ADOQuery.SQL.Add('select bookcard_id from tab_bookcardinfo');
  //ADOQuery.SQL.Add('insert into tab_bookcardinfo (bookcard_id,pas_id,bookcardcomeday,borrownum) values ()');
  ADOQuery.Open;
  ADOQuery.Last;
  edit36.Text:=myjiami.db_idtoadd(ADOQuery.FieldValues['bookcard_id'],10);
  edit38.Text:=formatdatetime('yyyy/mm/dd',now);
  ADOQuery.Close;
  ADOQuery.SQL.Clear;
  ADOQuery.SQL.Add('select passenger_id from tab_pasinfo');
  ADOQuery.Open;      //得到员工编号
  Combobox8.Text:='----请选择客户编号----';
  edit37.Text:='2';
  if ADOQuery.RecordCount<0 then exit;  //如果没有记录就退出
  combobox8.Items.Clear;                //清空COMBOBOX中的内容
  for i:=0 to (ADOQuery.RecordCount-1) do  //向COMBOBOX中循环添加内容
  begin
    combobox8.Items.Add(ADOQuery.FieldValues['passenger_id']);   //添加记录
    ADOQuery.Next;                         //移动记录
  end;
  ADOQuery2.Close;
  ADOQuery2.SQL.Clear;
  ADOQuery2.SQL.Add('select * from tab_pasinfo');
  ADOQuery2.Open;
  DBGrid10.Columns.Items[0].FieldName:='passenger_id';
  DBGrid10.Columns.Items[1].FieldName:='pas_name';
  DBGrid10.Columns.Items[2].FieldName:='pas_sex';
  DBGrid10.Columns.Items[3].FieldName:='pas_age';
  DBGrid10.Columns.Items[4].FieldName:='pas_comeday';
  pagecontrol1.ActivePageIndex:=10;
  ADOQuery.Free;
end;

procedure TForm1.Button31Click(Sender: TObject);
var
  ADOQuery:TADOQuery;
  ADOQuery_a:TADOQuery;
begin
  ADOQuery:=TADOQuery.Create(self);
  ADOQuery_a:=TADOQuery.Create(self);
  ADOQuery.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+
                              extractfilepath(application.ExeName)+
                              'DATA\db_booksys.mdb;Persist Security Info=False';   //连接字符串
  ADOQuery_a.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+
                                extractfilepath(application.ExeName)+
                                'DATA\db_booksys.mdb;Persist Security Info=False';   //连接字符串
  if Combobox8.Text='----请选择客户编号----' then
  begin
    MessageDlg('请选择客户编号！！', mtInformation, [mbYes],0);
    ADOQuery.Free;
    exit;
  end;
  ADOQuery.Close;
  ADOQuery.SQL.Clear;
  ADOQuery.SQL.Add('select * from tab_bookcardinfo where pas_id=:A');
  ADOQuery.Parameters.ParamByName('A').Value:=Combobox8.Text;
  ADOQuery.Open;
  if ADOQuery.RecordCount>0 then
  begin
    MessageDlg('该客户图书证已签发过！！', mtInformation, [mbYes],0);
    ADOQuery.Free;
    exit;
  end;
  ADOQuery.Close;
  ADOQuery.SQL.Clear;
  ADOQuery.SQL.Add('insert into tab_bookcardinfo (bookcard_id,pas_id,bookcardcomeday,borrownum) values (:A,:S,:D,:F)');
  ADOQuery.Parameters.ParamByName('A').Value:=trim(EDIT36.Text);
  ADOQuery.Parameters.ParamByName('S').Value:=combobox8.Text;
  ADOQuery.Parameters.ParamByName('D').Value:=trim(edit38.Text);
  ADOQuery.Parameters.ParamByName('F').Value:=trim(edit37.Text);
  try
    ADOQuery.ExecSQL;
    MessageDlg('书证已签发！！', mtInformation, [mbYes],0);
    ADOQuery_a.Close;
    ADOQuery_a.SQL.Clear;
    ADOQuery_a.SQL.Add('select count(bookcard_id) as ffff from tab_bookcardinfo where bookcardcomeday=:A');
    ADOQuery_a.Parameters.ParamByName('A').Value:=trim(edit38.Text);
    ADOQuery_a.Open;
    memo1.Lines.Add(formatdatetime('yyyy/mm/dd hh:mm:ss',now)+'  时：共签发'+ADOQuery_a.FieldByName('ffff').asstring+'个书证');
    ADOQuery.Close;
    ADOQuery.SQL.Clear;
    ADOQuery.SQL.Add('select pas_name from tab_pasinfo where passenger_id=:A');
    ADOQuery.Parameters.ParamByName('A').Value:=Combobox8.Text;
    ADOQuery.Open;
    memo1.Lines.Add('书证编号：'+edit36.Text);
    memo1.Lines.Add('用户名称：'+ADOQuery.FieldByName('pas_name').asstring);
    memo1.Lines.Add('****************************************************');
    speedbutton3.Click;
  except
    MessageDlg('书证已签发！！', mtWarning, [mbYes],0);
  end;
  ADOQuery_a.Free;
  ADOQuery.Free;
end;

procedure TForm1.ComboBox8KeyPress(Sender: TObject; var Key: Char);
begin
  key:=#0;
end;

procedure TForm1.N34Click(Sender: TObject);
begin
  speedbutton3.Click;
  form_panel4Click();
end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in['0'..'9',#8]) then
  begin
    key:=#0;
    MessageBeep(1);
  end;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
  if length(edit1.Text)>10 then
  begin
    MessageDlg('过长！！', mtWarning, [mbYes],0);
    edit1.Text:='';
  end;
end;

procedure TForm1.Edit2Change(Sender: TObject);
begin
  if length(edit2.Text)>10 then
  begin
    MessageDlg('过长！！', mtWarning, [mbYes],0);
    edit2.Text:='';
  end;
end;

procedure TForm1.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in['0'..'9',#8]) then
  begin
    key:=#0;
    MessageBeep(1);
  end;
end;

procedure TForm1.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in['0'..'9',#8]) then
  begin
    key:=#0;
    MessageBeep(1);
  end;
end;

procedure TForm1.Edit4Change(Sender: TObject);
begin
  if length(edit4.Text)>10 then
  begin
    MessageDlg('过长！！', mtWarning, [mbYes],0);
    edit4.Text:='';
  end;
end;

procedure TForm1.Edit37Change(Sender: TObject);
begin
  if length(edit37.Text)>2 then
  begin
    MessageDlg('过长！！', mtWarning, [mbYes],0);
    edit37.Text:='';
  end;
end;

procedure TForm1.Edit37KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in['0'..'9',#8]) then
  begin
    key:=#0;
    MessageBeep(1);
  end;
end;

procedure TForm1.Edit32KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in['0'..'9',#8]) then
  begin
    key:=#0;
    MessageBeep(1);
  end;
end;

procedure TForm1.Edit32Change(Sender: TObject);
begin
  if length(edit32.Text)>10 then
  begin
    MessageDlg('过长！！', mtWarning, [mbYes],0);
    edit32.Text:='';
  end;
end;

procedure TForm1.Edit34Change(Sender: TObject);
begin
  if length(edit34.Text)>10 then
  begin
    MessageDlg('过长！！', mtWarning, [mbYes],0);
    edit34.Text:='';
  end;
end;

procedure TForm1.Edit34KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in['0'..'9',#8]) then
  begin
    key:=#0;
    MessageBeep(1);
  end;
end;

procedure TForm1.Edit29KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in['0'..'9',#8]) then
  begin
    key:=#0;
    MessageBeep(1);
  end;
end;

procedure TForm1.Edit29Change(Sender: TObject);
begin
  if length(edit29.Text)>10 then
  begin
    MessageDlg('过长！！', mtWarning, [mbYes],0);
    edit29.Text:='';
  end;
end;

procedure TForm1.ComboBox7KeyPress(Sender: TObject; var Key: Char);
begin
  key:=#0;
end;

procedure TForm1.Edit20KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in['0'..'9',#8]) then
  begin
    key:=#0;
    MessageBeep(1);
  end;
end;

procedure TForm1.Edit20Change(Sender: TObject);
begin
  if length(edit20.Text)>10 then
  begin
    MessageDlg('过长！！', mtWarning, [mbYes],0);
    edit20.Text:='';
  end;
end;

procedure TForm1.Edit23Change(Sender: TObject);
begin
  if length(edit23.Text)>10 then
  begin
    MessageDlg('过长！！', mtWarning, [mbYes],0);
    edit23.Text:='';
  end;
end;

procedure TForm1.Edit23KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in['0'..'9','-',#8]) then
  begin
    key:=#0;
    MessageBeep(1);
  end;
end;

procedure TForm1.Edit22KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in['0'..'9',#8]) then
  begin
    key:=#0;
    MessageBeep(1);
  end;
end;

procedure TForm1.Edit22Change(Sender: TObject);
begin
  if length(edit22.Text)>2 then
  begin
    MessageDlg('过长！！', mtWarning, [mbYes],0);
    edit22.Text:='';
  end;
end;

procedure TForm1.Edit26KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in['0'..'9',#8]) then
  begin
    key:=#0;
    MessageBeep(1);
  end;
end;

procedure TForm1.Edit26Change(Sender: TObject);
begin
  if length(edit26.Text)>10 then
  begin
    MessageDlg('过长！！', mtWarning, [mbYes],0);
    edit26.Text:='';
  end;
end;

procedure TForm1.Edit13Change(Sender: TObject);
begin
  if length(edit13.Text)>10 then
  begin
    MessageDlg('过长！！', mtWarning, [mbYes],0);
    edit13.Text:='';
  end;
end;

procedure TForm1.Edit13KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in['0'..'9',#8]) then
  begin
    key:=#0;
    MessageBeep(1);
  end;
end;

procedure TForm1.Edit16KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in['0'..'9','-',#8]) then
  begin
    key:=#0;
    MessageBeep(1);
  end;
end;

procedure TForm1.Edit16Change(Sender: TObject);
begin
  if length(edit16.Text)>10 then
  begin
    MessageDlg('过长！！', mtWarning, [mbYes],0);
    edit16.Text:='';
  end;
end;

procedure TForm1.Edit15Change(Sender: TObject);
begin
  if length(edit15.Text)>2 then
  begin
    MessageDlg('过长！！', mtWarning, [mbYes],0);
    edit15.Text:='';
  end;
end;

procedure TForm1.Edit15KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in['0'..'9','-',#8]) then
  begin
    key:=#0;
    MessageBeep(1);
  end;
end;

procedure TForm1.Edit19KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in['0'..'9','-',#8]) then
  begin
    key:=#0;
    MessageBeep(1);
  end;
end;

procedure TForm1.Edit19Change(Sender: TObject);
begin
  if length(edit19.Text)>10 then
  begin
    MessageDlg('过长！！', mtWarning, [mbYes],0);
    edit19.Text:='';
  end;
end;

procedure TForm1.Edit5Change(Sender: TObject);
begin
if length(edit5.Text)>10 then
  begin
    MessageDlg('过长！！', mtWarning, [mbYes],0);
    edit5.Text:='';
  end;
end;

procedure TForm1.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in['0'..'9','-',#8]) then
  begin
    key:=#0;
    MessageBeep(1);
  end;
end;

procedure TForm1.Edit10Change(Sender: TObject);
begin
  if length(edit10.Text)>3 then
  begin
    MessageDlg('过长！！', mtWarning, [mbYes],0);
    edit10.Text:='';
  end;
end;

procedure TForm1.Edit10KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in['0'..'9','-',#8]) then
  begin
    key:=#0;
    MessageBeep(1);
  end;
end;

procedure TForm1.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
  key:=#0
end;

procedure TForm1.ComboBox2KeyPress(Sender: TObject; var Key: Char);
begin
  key:=#0;
end;

procedure TForm1.Edit12KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in['0'..'9','-',#8]) then
  begin
    key:=#0;
    MessageBeep(1);
  end;
end;

procedure TForm1.Edit12Change(Sender: TObject);
begin
  if length(edit12.Text)>10 then
  begin
    MessageDlg('过长！！', mtWarning, [mbYes],0);
    edit12.Text:='';
  end;
end;

procedure TForm1.ComboBox4KeyPress(Sender: TObject; var Key: Char);
begin
  key:=#0;
end;

procedure TForm1.ComboBox6KeyPress(Sender: TObject; var Key: Char);
begin
  key:=#0;
end;

procedure TForm1.mainfrom_human_control(selec,update,delete,insert:boolean);
begin
  if selec=true then
  begin
    showmessage('1');
  end;
  if update=true then
  begin
    showmessage('2');
  end;
  if delete=true then
  begin
    showmessage('3');
  end;
  if insert=true then
  begin
    showmessage('4');
  end;
//
end;

procedure TForm1.Menu_enable;
begin
  n4.Enabled:=false;
  n5.Enabled:=false;
  n6.Enabled:=false;
  n10.Enabled:=false;
  n11.Enabled:=false;
  n12.Enabled:=false;
  n13.Enabled:=false;
  n15.Enabled:=false;
  n16.Enabled:=false;
  n17.Enabled:=false;
  n18.Enabled:=false;
  n20.Enabled:=false;
  n21.Enabled:=false;
  n22.Enabled:=false;
  n24.Enabled:=false;
  n25.Enabled:=false;
  n32.Enabled:=false;
  n34.Enabled:=false;
  n35.Enabled:=false;
  n36.Enabled:=false;
  n37.Enabled:=false;
  n39.Enabled:=false;
  toolbutton1.Visible:=false;
  toolbutton2.Visible:=false;
  toolbutton3.Visible:=false;
  toolbutton5.Visible:=false;
  toolbutton6.Visible:=false;
  toolbutton7.Visible:=false;
  toolbutton8.Visible:=false;
  toolbutton11.Visible:=false;
end;

procedure TForm1.N27Click(Sender: TObject);
var
  adoquery:Tadoquery;
  i:integer;
begin
  Menu_enable;
  StatusBar1.Panels[0].Text:='操作者: ';
  StatusBar1.Panels[1].Text:='';
  emp_YN_null;
  int_human:=0;
  form_panel4Click;
  pagecontrol1.ActivePageIndex:=1;
  adoquery:=Tadoquery.Create(self);
  adoquery.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+
                              extractfilepath(application.ExeName)+
                              'DATA\db_booksys.mdb;Persist Security Info=False';   //连接字符串
  adoquery.Close;
  adoquery.SQL.Clear;
  adoquery.SQL.Add('select * from tab_bookclassinfo');
  adoquery.Open;       //从数据库中选择类别
  treeview1.Items.Clear;
  Combobox1.Items.Clear;
  for i:=0 to (adoquery.RecordCount-1) do    //将数据库中的类别添加到TREEVIEW中
  begin
    treeview1.Items.Add(nil,adoquery.FieldByName('bookclass_name').asstring);
    Combobox1.Items.Add(ADOQuery.FieldValues['bookclass_name']);
    adoquery.Next;
  end;
  ADOQuery.Free;
end;

procedure TForm1.N29Click(Sender: TObject);
begin
  close;
end;

procedure TForm1.ToolButton15Click(Sender: TObject);
begin
  close;
end;

procedure TForm1.SpeedButton5Click(Sender: TObject);
begin
  if int_human<>1 then
  begin
    MessageDlg('无权使用！！',mtWarning, [mbYes],0);
    exit;
  end;
  N39.Click;
end;

procedure TForm1.N39Click(Sender: TObject);
var
  IniFile1: TIniFile;  //INI文件类
  str_superlogin:integer;  //是否以超级管理员登陆
  int_dataset:integer;//数据库备份设置
begin
  IniFile1:= TIniFile.Create(extractfilepath(application.ExeName)+'login.ini');  //创建一个INI文件
  str_superlogin:=IniFile1.ReadInteger('SUAD','auotlogin',str_superlogin);
  int_dataset :=  IniFile1.ReadInteger('DATABK','data',int_dataset);
  if str_superlogin = 1 then
  begin
    checkbox2.Checked:=true;
  end;
  if int_dataset = 0 then
  begin
    RadioButton5.Checked:=true;
  end;
  if int_dataset = 1 then
  begin
    RadioButton6.Checked:=true;
  end;
  if int_dataset = 2 then
  begin
    RadioButton7.Checked:=true;
  end;
  checkbox3.Checked:=false;
  pagecontrol1.ActivePageIndex:=11;
  edit39.Text:='';
  edit39.Enabled:=false;
  button32.Enabled:=true;
  IniFile1.Free;
end;

procedure TForm1.Button32Click(Sender: TObject);
var
  IniFile1: TIniFile;  //INI文件类
   Textfile1:Textfile;  //重写闪屏文件
begin
  IniFile1:= TIniFile.Create(extractfilepath(application.ExeName)+'login.ini');  //创建一个INI文件
  if checkbox2.Checked=true then
  begin
    IniFile1.WriteInteger('SUAD','auotlogin',1);  //以超级管员的身份
  end
  else
  begin
    IniFile1.WriteInteger('SUAD','auotlogin',0);  //以系统中存在的用户身份
  end;
  if RadioButton5.Checked=true then
  begin
    IniFile1.WriteInteger('DATABK','data',0);  //起动时备份数据库
  end;
  if RadioButton6.Checked=true then
  begin
    IniFile1.WriteInteger('DATABK','data',1);  //每天一次备份数据库
  end;
  if RadioButton7.Checked=true then
  begin
    IniFile1.WriteInteger('DATABK','data',2);  //手动备份数据库
  end;
  if checkbox3.Checked=true then
  begin
    AssignFile(Textfile1, 'sys.txt');
    Rewrite(Textfile1);   //重写文件
    writeln(Textfile1, edit39.text+'         ');
    closefile(Textfile1);
  end;
  button32.Enabled:=false;
  IniFile1.Free;
end;

procedure TForm1.CheckBox3Click(Sender: TObject);
begin
  if CheckBox3.Checked=true then
  begin
    edit39.Enabled:=true;
    edit39.SetFocus;
  end
  else
  begin
    edit39.Enabled:=false;
  end;
  button32.Enabled:=true;
end;

procedure TForm1.N24Click(Sender: TObject);
var
  str_datapath:string;
  str_databupath:string;
begin
  form3.Timer1.Enabled:=true;
  form3.Label1.Caption:='正在备份数据，请稍候. . . . . .          ';
  form3.int_databackup:=1;
  form3.Update;
  str_datapath:=extractfilepath(application.ExeName)+'DATA\db_booksys.mdb';
  str_databupath:=extractfilepath(application.ExeName)+'DATABU\'+Formatdatetime('yyyy/mm/dd hh-mm-ss',now)+'buckup.mdb';
  form3.Show;
  form3.Update;
  form3.my_databk_ProgressBar(str_datapath,str_databupath);
end;

procedure TForm1.N25Click(Sender: TObject);
var
  str_datapath:string;
  str_databupath:string;
  opendialog1:Topendialog;
begin
  opendialog1:=Topendialog.Create(self);
  form3.Timer1.Enabled:=true;
  form3.Label1.Caption:='正在恢复数据，请稍候. . . . . .           ';
  form3.int_databackup:=2;
  form3.Update;
  opendialog1.InitialDir:=extractfilepath(application.ExeName)+'DATABU\';
  opendialog1.Title:='请选择数据库';
  opendialog1.Filter:='数据库文件|*.mdb';
  opendialog1.Execute;
  if  opendialog1.FileName <> '' then
  begin
    str_datapath:=extractfilepath(application.ExeName)+'DATA\db_booksys.mdb';
    str_databupath:=opendialog1.FileName;
    form3.Show;
    form3.Update;
    form3.my_databk_ProgressBar(str_databupath,str_datapath);
  end;
  opendialog1.Free;
end;

procedure TForm1.N40Click(Sender: TObject);
begin
  form7.ShowModal;
end;

procedure TForm1.CheckBox2Click(Sender: TObject);
begin
  button32.Enabled:=true;
end;

procedure TForm1.RadioButton5Click(Sender: TObject);
begin
  button32.Enabled:=true;
end;

procedure TForm1.RadioButton6Click(Sender: TObject);
begin
  button32.Enabled:=true;
end;

procedure TForm1.RadioButton7Click(Sender: TObject);
begin
  button32.Enabled:=true;
end;

procedure TForm1.Button33Click(Sender: TObject);
begin
  pagecontrol1.ActivePageIndex:=1;
end;

procedure TForm1.N42Click(Sender: TObject);
begin
  form8.ShowModal;
end;

procedure TForm1.N30Click(Sender: TObject);
begin
ShellExecute(handle,'open','help\help.chm', nil,nil,SW_ShowNormal);
end;

procedure TForm1.ToolButton13Click(Sender: TObject);
begin
  N30.Click;
end;

end.
