unit jlczy_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, DB, DBTables, Buttons, ExtCtrls,
  ComCtrls, TabNotBk, PrnDbgeh, Grids, DBGridEh;

type
  Tjlczy = class(TForm)
    Label1: TLabel;
    DataSource1: TDataSource;
    Table1: TTable;
    Database1: TDatabase;
    Table1BDEDesigner: TStringField;
    Table1BDEDesigner2: TStringField;
    DataSource2: TDataSource;
    Table2: TTable;
    Table2BDEDesigner: TStringField;
    Table2BDEDesigner2: TStringField;
    Table2BDEDesigner3: TStringField;
    DataSource3: TDataSource;
    Table3: TTable;
    Table3BDEDesigner: TStringField;
    Table3BDEDesigner2: TDateTimeField;
    Table3BDEDesigner1: TMemoField;
    Table3BDEDesigner3: TDateTimeField;
    Table3BDEDesigner22: TMemoField;
    Table3BDEDesigner4: TDateTimeField;
    Table3BDEDesigner5: TMemoField;
    Table3BDEDesigner6: TMemoField;
    Table3BDEDesigner7: TMemoField;
    Table3BDEDesigner8: TMemoField;
    Table3BDEDesigner9: TFloatField;
    Table3BDEDesigner10: TStringField;
    Table3BDEDesigner11: TStringField;
    Table3BDEDesigner12: TDateTimeField;
    Table3_jly: TStringField;
    Table3_jlc: TStringField;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    DBEdit4: TDBEdit;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit5: TDBEdit;
    DBMemo1: TDBMemo;
    DateTimePicker1: TDateTimePicker;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit6: TDBEdit;
    DBMemo2: TDBMemo;
    DateTimePicker2: TDateTimePicker;
    GroupBox3: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    DBEdit7: TDBEdit;
    DBMemo3: TDBMemo;
    DateTimePicker3: TDateTimePicker;
    GroupBox4: TGroupBox;
    DBMemo4: TDBMemo;
    GroupBox5: TGroupBox;
    DBMemo5: TDBMemo;
    GroupBox6: TGroupBox;
    DBMemo6: TDBMemo;
    GroupBox7: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    GroupBox8: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    Panel1: TPanel;
    DBNavigator1: TDBNavigator;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    TabSheet2: TTabSheet;
    GroupBox9: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    ComboBox1: TComboBox;
    Edit4: TEdit;
    DateTimePicker4: TDateTimePicker;
    DateTimePicker5: TDateTimePicker;
    BitBtn1: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    ComboBox2: TComboBox;
    CheckBox1: TCheckBox;
    DBGridEh1: TDBGridEh;
    PrintDBGridEh1: TPrintDBGridEh;
    Query1: TQuery;
    DataSource4: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3Exit(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Table3BeforePost(DataSet: TDataSet);
    procedure Table3AfterInsert(DataSet: TDataSet);
    procedure Table3AfterScroll(DataSet: TDataSet);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure DateTimePicker2Change(Sender: TObject);
    procedure DateTimePicker3Change(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  jlczy: Tjlczy;

implementation

uses pub_search_u, public_var;

{$R *.dfm}

procedure Tjlczy.FormCreate(Sender: TObject);
begin
   table1.Open;
   table2.Open;
   table3.Open;
end;

procedure Tjlczy.Edit1Exit(Sender: TObject);
begin
    if (edit1.text<>'') and table1.Locate('姓名',edit1.Text,[locaseinsensitive]) then
       edit1.Text:=table1.FieldValues['姓名']
    else
    begin
       if edit1.text<>'' then
       MessageDlg('没有此人！', mtWarning, [mbOk], 0);
    end;

end;

procedure Tjlczy.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then edit2.setfocus;
end;

procedure Tjlczy.Edit2Exit(Sender: TObject);
begin
   if (edit2.Text<>'') and table2.Locate('车号',edit2.Text,[locaseinsensitive]) then
   begin
      edit2.Text:=table2.FieldValues['车号'];
      edit3.Text:=table2.FieldValues['学号'];
   end
   else
   begin
     if edit2.text<>'' then
      MessageDlg('无此条记录！', mtWarning, [mbok],0);
   end;
end;

procedure Tjlczy.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then dbedit4.SetFocus;
end;

procedure Tjlczy.Edit3Exit(Sender: TObject);
begin
   if (edit3.text<>'') and table2.Locate('学号',edit3.Text,[locaseinsensitive]) then
   begin
       edit2.Text:=table2.FieldValues['车号'];
       edit3.Text:=table2.FieldValues['学号'];
   end
   else
   begin
      if edit3.text<>'' then
       messagedlg('无此条记录！',mtwarning,[mbok],0);
   end;
       
end;

procedure Tjlczy.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then dbedit4.SetFocus;
end;



procedure Tjlczy.Table3BeforePost(DataSet: TDataSet);
begin
    table3.FieldValues['编号_jly']:=table1.FieldValues['编号'];
    table3.FieldValues['编号_jlc']:=table2.FieldValues['编号'];

end;

procedure Tjlczy.Table3AfterInsert(DataSet: TDataSet);
begin
  edit1.Text:='';
  edit2.Text:='';
  edit3.Text:='';
end;

procedure Tjlczy.Table3AfterScroll(DataSet: TDataSet);
begin
  if table3.state<>dsinsert then
  begin
   table1.Locate('编号',table3.fieldvalues['编号_jly'],[locaseinsensitive]);
   edit1.Text:=table1.FieldValues['姓名'];
   table2.Locate('编号',table3.FieldValues['编号_jlc'],[locaseinsensitive]);
   edit2.Text:=table2.FieldValues['车号'];
   edit3.Text:=table2.FieldValues['学号'];
  end;
end;

procedure Tjlczy.DateTimePicker1Change(Sender: TObject);
begin
   dbedit5.Text:=datetostr(datetimepicker1.Date);
   table3.Edit;
end;

procedure Tjlczy.DateTimePicker2Change(Sender: TObject);
begin
   dbedit6.Text:=datetostr(datetimepicker2.date);
   table3.edit;
end;

procedure Tjlczy.DateTimePicker3Change(Sender: TObject);
begin
   dbedit7.Text:=datetostr(datetimepicker3.date);
   table3.Edit;
end;

procedure Tjlczy.BitBtn4Click(Sender: TObject);
begin
   query1.Open;
   dbgrideh1.DataSource:=datasource4;
end;

procedure Tjlczy.SpeedButton1Click(Sender: TObject);
var
  mysqlstr:string;
  search_tmpstr:variant;
begin
  search_tmpstr:=Edit1.Text;
  pub_search:=Tpub_search.Create(self);
  mysqlstr:='select * from 教练员档案';
  pub_search.myselect(mysqlstr,'教练员档案');
  pub_search.ShowModal;
  if (search_tmpstr<>myarr[1]) and (myarr[1]<>'') then
  begin
    Edit1.Text:=myarr[1];
    table3.Edit;
  end;
  //判断edit1是否有焦点
  if not Edit1.Focused then edit1.SetFocus;
    Edit2.SetFocus;
end;

procedure Tjlczy.SpeedButton2Click(Sender: TObject);
var
  mysqlstr:string;
  search_tmpstr:variant;
begin
  search_tmpstr:=Edit2.Text;
  pub_search:=Tpub_search.Create(self);
  mysqlstr:='select * from 教练车情况统计表';
  pub_search.myselect(mysqlstr,'教练车情况统计');
  pub_search.ShowModal;
  if (search_tmpstr<>myarr[1]) and (myarr[1]<>'') then
  begin
    Edit2.Text:=myarr[1];
    table3.Edit;
  end;
  //判断edit1是否有焦点
  if not Edit2.Focused then edit2.SetFocus;
    dbedit4.SetFocus;
end;

procedure Tjlczy.SpeedButton3Click(Sender: TObject);
var
  mysqlstr:string;
  search_tmpstr:variant;
begin
  search_tmpstr:=Edit3.Text;
  pub_search:=Tpub_search.Create(self);
  mysqlstr:='select * from 教练车情况统计表';
  pub_search.myselect(mysqlstr,'教练车情况统计');
  pub_search.ShowModal;
  if (search_tmpstr<>myarr[2]) and (myarr[1]<>'') then
  begin
    Edit3.Text:=myarr[2];
    table3.Edit;
  end;
  //判断edit1是否有焦点
  if not Edit3.Focused then edit3.SetFocus;
    dbedit4.SetFocus;
end;

procedure Tjlczy.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   jlczy.Destroy;
end;

procedure Tjlczy.BitBtn3Click(Sender: TObject);
begin
  close;
end;

procedure Tjlczy.BitBtn5Click(Sender: TObject);
begin
   printdbgrideh1.Preview;
end;

end.
