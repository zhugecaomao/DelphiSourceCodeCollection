unit jlcgzzt_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Mask, DB, DBTables, Grids, DBGrids,
  ExtCtrls, ComCtrls, TabNotBk, DBGridEh, PrnDbgeh,EhlibBDE;

type
  Tjlcgzzt = class(TForm)
    DataSource1: TDataSource;
    Table1: TTable;
    Database1: TDatabase;
    Label8: TLabel;
    Table2: TTable;
    Table2BDEDesigner: TStringField;
    Table2BDEDesigner2: TStringField;
    Table3: TTable;
    Table3BDEDesigner: TStringField;
    Table3BDEDesigner2: TStringField;
    DataSource2: TDataSource;
    Table4: TTable;
    Table4_jlc: TStringField;
    Table4_jly: TStringField;
    Table4BDEDesigner: TStringField;
    Table4BDEDesigner2: TIntegerField;
    Table4BDEDesigner3: TIntegerField;
    Table4BDEDesigner4: TIntegerField;
    Table4BDEDesigner5: TStringField;
    Table4BDEDesigner6: TMemoField;
    Table4BDEDesigner7: TStringField;
    Table4BDEDesigner8: TDateTimeField;
    Table1BDEDesigner: TStringField;
    Table1BDEDesigner2: TStringField;
    Table1BDEDesigner3: TStringField;
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
    SpeedButton1: TSpeedButton;
    Label9: TLabel;
    Label10: TLabel;
    Label14: TLabel;
    SpeedButton3: TSpeedButton;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Edit1: TEdit;
    Edit2: TEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    Edit3: TEdit;
    GroupBox2: TGroupBox;
    DBMemo1: TDBMemo;
    GroupBox3: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Panel1: TPanel;
    DBNavigator1: TDBNavigator;
    BitBtn4: TBitBtn;
    TabSheet2: TTabSheet;
    Query1: TQuery;
    DataSource3: TDataSource;
    Panel2: TPanel;
    Label15: TLabel;
    DBNavigator2: TDBNavigator;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    Edit5: TEdit;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    DBGridEh1: TDBGridEh;
    PrintDBGridEh1: TPrintDBGridEh;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3Exit(Sender: TObject);
    procedure Table4AfterScroll(DataSet: TDataSet);
    procedure Table4AfterInsert(DataSet: TDataSet);
    procedure Table4BeforePost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure DBGridEh1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
    search_str:string;
  end;

var
  jlcgzzt: Tjlcgzzt;

implementation

uses public_var, pub_search_u;

{$R *.dfm}

procedure Tjlcgzzt.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then
      edit3.SetFocus
   else
      if table4.state<>dsedit then table4.Edit;
end;

procedure Tjlcgzzt.Edit1Exit(Sender: TObject);
begin
   if table1.Locate('车号',edit1.Text,[loCaseInsensitive]) and (edit1.text<>'') then
      edit2.Text:=table1.FieldValues['学号']
   else
      if edit1.text<>'' then MessageDlg('没有此车号！', mtWarning, [mbOk], 0);
end;

procedure Tjlcgzzt.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then
      edit3.SetFocus
   else
      if table4.state<>dsedit then table4.Edit;
end;

procedure Tjlcgzzt.Edit2Exit(Sender: TObject);
begin
   if table1.Locate('学号',edit2.Text,[]) and (edit2.text<>'') then
      edit1.Text:=table1.FieldValues['车号']
   else
      if edit2.text<>'' then MessageDlg('没有此学号！', mtWarning, [mbOk], 0);
end;

procedure Tjlcgzzt.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then
      DBLookupComboBox1.SetFocus
   else
      if table4.state<>dsedit then table4.Edit;
end;

procedure Tjlcgzzt.Edit3Exit(Sender: TObject);
begin
   if not (table2.Locate('姓名',edit3.Text,[]) and (edit3.text<>'')) then
      if edit3.text<>'' then MessageDlg('没有此人！', mtWarning, [mbOk], 0);
end;

procedure Tjlcgzzt.Table4AfterScroll(DataSet: TDataSet);
begin
  if table4.state<>dsinsert then
  begin
    table1.Locate('编号',table4.FieldValues['编号_jlc'],[]);
    edit1.Text:=table1.FieldValues['车号'];
    edit2.Text:=table1.FieldValues['学号'];
    table2.Locate('编号',table4.FieldValues['编号_jly'],[]);
    edit3.Text:=table2.FieldValues['姓名'];
  end;
end;

procedure Tjlcgzzt.Table4AfterInsert(DataSet: TDataSet);
begin
    edit1.Text:='';
    edit2.Text:='';
    edit3.Text:='';
end;



procedure Tjlcgzzt.Table4BeforePost(DataSet: TDataSet);
begin
   table4.FieldValues['编号_jlc']:=table1.lookup('车号',edit1.text,'编号');
   table4.FieldValues['编号_jly']:=table2.lookup('姓名',edit3.Text,'编号');
   table4.FieldValues['建档人']:='';
   table4.FieldValues['建档日期']:=date;
end;


procedure Tjlcgzzt.SpeedButton1Click(Sender: TObject);
var
  mysqlstr:string;
  search_tmpstr:variant;
begin
  search_tmpstr:=Edit1.Text;
  pub_search:=Tpub_search.Create(self);
  mysqlstr:='select * from 教练车情况统计表';
  pub_search.myselect(mysqlstr,'教练车情况统计');
  pub_search.ShowModal;
  if (search_tmpstr<>myarr[1]) and (myarr[1]<>'') then
  begin
    Edit1.Text:=myarr[1];
    table4.Edit;
  end;
  //判断edit1是否有焦点
  if not Edit1.Focused then edit1.SetFocus;
    Edit3.SetFocus;
end;

procedure Tjlcgzzt.SpeedButton3Click(Sender: TObject);
var
  mysqlstr:string;
  search_tmpstr:variant;
begin
  search_tmpstr:=Edit3.Text;
  pub_search:=Tpub_search.Create(self);
  mysqlstr:='select * from 教练员档案';
  pub_search.myselect(mysqlstr,'教练员档案');
  pub_search.ShowModal;
  if (search_tmpstr<>myarr[1]) and (myarr[1]<>'') then
  begin
    Edit3.Text:=myarr[1];
    table4.Edit;
  end;
  //判断edit1是否有焦点
  if not Edit3.Focused then edit3.SetFocus;
    dblookupcombobox1.SetFocus;
end;

procedure Tjlcgzzt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  self.Destroy;
end;

procedure Tjlcgzzt.BitBtn4Click(Sender: TObject);
begin
  self.close;
end;

procedure Tjlcgzzt.FormCreate(Sender: TObject);
var
  i:integer;
begin
   table1.Open;
   table2.Open;
   table3.Open;
   table4.Open;
   //初始化combobox
    with query1 do
    begin
      close;
      sql.clear;
      sql.add('SELECT cqktj.车号, cqktj.学号, jlyda.姓名, cgzzt.本日任务, cgzzt.受训人数, cgzzt.分配汽油, cgzzt.分配柴油, cgzzt.工作状态, cgzzt.备注, cgzzt.建档人, cgzzt.建档日期 FROM 教练车情况统计表 cqktj, 教练车工作状态 cgzzt, 教练员档案 jlyda ');
      sql.add('where cqktj.编号 = cgzzt.编号_jlc and jlyda.编号 = cgzzt.编号_jly');
      open;
      for i:=0 to FieldCount-1 do
          combobox3.Items.Add(Fields[i].FieldName);
      close;
      combobox3.ItemIndex:=0;
    end;

end;

procedure Tjlcgzzt.BitBtn5Click(Sender: TObject);
var
  comitem_clsname:string;
begin
  query1.open;
  comitem_clsname:=query1.FieldByName(combobox3.Text).ClassName;
  with query1 do
  begin
    close;
    sql.Clear;
    sql.Add('SELECT cqktj.车号, cqktj.学号, jlyda.姓名 as 教练, cgzzt.本日任务, cgzzt.受训人数, cgzzt.分配汽油, cgzzt.分配柴油, cgzzt.工作状态, cgzzt.备注, cgzzt.建档人, cgzzt.建档日期 FROM 教练车情况统计表 cqktj, 教练车工作状态 cgzzt, 教练员档案 jlyda ');
    sql.add('where (cqktj.编号 = cgzzt.编号_jlc) and (jlyda.编号 = cgzzt.编号_jly)');
    if edit5.text<>'' then
    begin
      //showmessage(comitem_clsname);
      if comitem_clsname='TStringField' then
        sql.add(' and '+combobox3.text+' '+combobox4.Text+' '+''''+edit5.text+'''');
      if (comitem_clsname='TIntegerField') or (comitem_clsname='TBooleanField') then
        sql.add(' and '+combobox3.text+' '+combobox4.Text+' '+edit5.text);
      if  comitem_clsname='TDateTimeField' then
        sql.Add(' and cgzzt.'+combobox3.text+' '+combobox4.Text+' #'+edit5.Text+'#');
    end;
    if not Prepared then Prepare;
    open;
  end;
  if query1.RecordCount=0 then
    showmessage('无记录')
  else
    dbgrideh1.datasource:=datasource3
    //dbgrideh1.Columns[4].Footer.valuetype:=fvtSum;
end;



procedure Tjlcgzzt.BitBtn7Click(Sender: TObject);
begin
  printdbgrideh1.Preview;
end;

procedure Tjlcgzzt.DBGridEh1DblClick(Sender: TObject);
var
bhstr:string;
begin
  //showmessage(query1.FieldValues['车号']);
  //取'教练车情况统计表'得编号
  bhstr:=table1.Lookup('车号',query1.FieldValues['车号'],'编号');
  if table4.Locate('编号_jlc',bhstr,[]) then
     pagecontrol1.ActivePage:=TabSheet1
  else
     showmessage('定位错误！');

end;

//隔行分色显示
procedure Tjlcgzzt.DBGridEh1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  //if dbgrideh1.DataSource.DataSet.RecNo mod 2=1 then
  if DBGridEh1.SumList.RecNo mod 2 = 1 then
    Background := $00FFC4C4
  else
    Background := $00FFDDDD;
end;

end.
