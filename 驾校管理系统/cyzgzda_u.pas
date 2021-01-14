unit cyzgzda_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, StdCtrls, Mask, DB, DBTables,
  sCustomComboEdit, sTooledit, Buttons, ComCtrls, Grids, DBGridEh, PrnDbgeh,
  frxClass, frxDBSet, frxDesgn;

type
  Tcyzgzda = class(TForm)
    DataSource1: TDataSource;
    Table1: TTable;
    Database1: TDatabase;
    Label25: TLabel;
    Table1BDEDesigner: TStringField;
    Table1BDEDesigner2: TStringField;
    Table1BDEDesigner3: TStringField;
    Table1BDEDesigner4: TSmallintField;
    Table1BDEDesigner5: TDateTimeField;
    Table1BDEDesigner6: TStringField;
    Table1BDEDesigner7: TStringField;
    Table1BDEDesigner8: TStringField;
    Table1BDEDesigner9: TStringField;
    Table1BDEDesigner10: TStringField;
    Table1BDEDesigner11: TDateTimeField;
    Table1BDEDesigner12: TStringField;
    Table1BDEDesigner13: TStringField;
    Table1BDEDesigner14: TStringField;
    Table1BDEDesigner15: TStringField;
    Table1BDEDesigner16: TFloatField;
    Table1BDEDesigner17: TStringField;
    Table1BDEDesigner18: TStringField;
    Table1BDEDesigner19: TStringField;
    Table1BDEDesigner20: TStringField;
    Table1BDEDesigner21: TStringField;
    Table1BDEDesigner22: TStringField;
    Table1BDEDesigner23: TStringField;
    Table1BDEDesigner24: TStringField;
    Table2: TTable;
    Table3: TTable;
    Table3cyzgzpxda: TIntegerField;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
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
    Image1: TImage;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBComboBox1: TDBComboBox;
    sDateEdit1: TsDateEdit;
    GroupBox2: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    DBEdit12: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit19: TDBEdit;
    DBComboBox2: TDBComboBox;
    DBComboBox3: TDBComboBox;
    DBComboBox4: TDBComboBox;
    DBComboBox7: TDBComboBox;
    DBComboBox8: TDBComboBox;
    GroupBox3: TGroupBox;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    DBNavigator1: TDBNavigator;
    GroupBox4: TGroupBox;
    Label17: TLabel;
    Label26: TLabel;
    DBComboBox5: TDBComboBox;
    DBComboBox6: TDBComboBox;
    GroupBox5: TGroupBox;
    Label18: TLabel;
    Label27: TLabel;
    DBEdit3: TDBEdit;
    DBEdit5: TDBEdit;
    sDateEdit2: TsDateEdit;
    GroupBox6: TGroupBox;
    Label28: TLabel;
    Label29: TLabel;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    ComboBox2: TComboBox;
    CheckBox1: TCheckBox;
    DBGridEh1: TDBGridEh;
    frxDesigner1: TfrxDesigner;
    frxDBDataset1: TfrxDBDataset;
    Table1BDEDesigner25: TStringField;
    Table1BDEDesigner26: TDateTimeField;
    BitBtn2: TBitBtn;
    Table4: TTable;
    DataSource2: TDataSource;
    frxReport1: TfrxReport;
    procedure DBComboBox1DropDown(Sender: TObject);
    procedure Table1AfterScroll(DataSet: TDataSet);
    procedure Table1BeforePost(DataSet: TDataSet);
    procedure DBComboBox2DropDown(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBComboBox3DropDown(Sender: TObject);
    procedure DBComboBox4DropDown(Sender: TObject);
    procedure DBComboBox8DropDown(Sender: TObject);
    procedure DBComboBox7DropDown(Sender: TObject);
    procedure DBComboBox5DropDown(Sender: TObject);
    procedure DBComboBox6DropDown(Sender: TObject);
    procedure sDateEdit1AcceptDate(Sender: TObject; var aDate: TDateTime;
      var CanAccept: Boolean);
    procedure sDateEdit2AcceptDate(Sender: TObject; var aDate: TDateTime;
      var CanAccept: Boolean);
    procedure Table1AfterInsert(DataSet: TDataSet);
    procedure Table1AfterCancel(DataSet: TDataSet);
    procedure Table1AfterPost(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure ComboBox1DropDown(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    //function serialnum(numlong: string;numinit: integer):string;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  cyzgzda: Tcyzgzda;
  tmp_xh:string;

implementation

{$R *.dfm}



procedure Tcyzgzda.Table1AfterScroll(DataSet: TDataSet);
begin
     if table1.FieldValues['报名时间']<>null then
        sdateedit1.text:=datetostr(table1.FieldValues['报名时间'])
     else
        sdateedit1.text:='    -  -  ';
     if table1.FieldValues['初次领证日期']<>null then
        sdateedit2.text:=datetostr(table1.FieldValues['初次领证日期'])
     else
        sdateedit2.text:='    -  -  ';

end;

procedure Tcyzgzda.Table1BeforePost(DataSet: TDataSet);
begin
    if sdateedit1.text<>'    -  -  ' then
       table1.FieldValues['报名时间']:=strtodate(sdateedit1.text);
    if sdateedit2.text<>'    -  -  ' then
       table1.FieldValues['初次领证日期']:=strtodate(sdateedit2.text);

end;

procedure Tcyzgzda.DBComboBox1DropDown(Sender: TObject);
begin
    with dbcombobox1 do
      begin
       if  Items.Count<=0 then
          begin
           Items.add('男');
           items.Add('女');
          end;
       end;
end;


procedure Tcyzgzda.DBComboBox2DropDown(Sender: TObject);
var
   i:string;
begin
  if dbcombobox2.Items.Count<=0 then
   begin
    with dbcombobox2 do
     begin
     table2.First;
     while (table2.FieldValues['持驾照类别']<>null) and (not table2.Eof) do
        begin
          i:=table2.FieldValues['持驾照类别'];
          Items.Add(i);
          table2.Next;
        end;
     end;
  end;
end;

procedure Tcyzgzda.FormCreate(Sender: TObject);
begin
  table1.Close;
  table1.Open;
  table2.Close;
  table2.Open;
end;

procedure Tcyzgzda.DBComboBox3DropDown(Sender: TObject);
var
   i:string;
begin
  if dbcombobox3.Items.Count<=0 then
   begin
    with dbcombobox3 do
     begin
     table2.First;
     while (table2.FieldValues['拟办资格证种类']<>null) and (not table2.Eof) do
        begin
          i:=table2.FieldValues['拟办资格证种类'];
          Items.Add(i);
          table2.Next;
        end;
     end;
  end;
end;

procedure Tcyzgzda.DBComboBox4DropDown(Sender: TObject);
var
   i:string;
begin
  if dbcombobox4.Items.Count<=0 then
   begin
    with dbcombobox4 do
     begin
     table2.First;
     while (table2.FieldValues['原毕业学校']<>null) and (not table2.Eof) do
        begin
          i:=table2.FieldValues['原毕业学校'];
          Items.Add(i);
          table2.Next;
        end;
     end;
  end;
end;

procedure Tcyzgzda.DBComboBox8DropDown(Sender: TObject);
var
   i:string;
begin
  if dbcombobox8.Items.Count<=0 then
   begin
    with dbcombobox8 do
     begin
     table2.First;
     while (table2.FieldValues['发证途径']<>null) and (not table2.Eof) do
        begin
          i:=table2.FieldValues['发证途径'];
          Items.Add(i);
          table2.Next;
        end;
     end;
  end;
end;

procedure Tcyzgzda.DBComboBox7DropDown(Sender: TObject);
var
   i:string;
begin
  if dbcombobox7.Items.Count<=0 then
   begin
    with dbcombobox7 do
     begin
     table2.First;
     while (table2.FieldValues['不能发证原因']<>null) and (not table2.Eof) do
        begin
          i:=table2.FieldValues['不能发证原因'];
          Items.Add(i);
          table2.Next;
        end;
     end;
  end;
end;

procedure Tcyzgzda.DBComboBox5DropDown(Sender: TObject);
var
   i:string;
begin
  if dbcombobox5.Items.Count<=0 then
   begin
    with dbcombobox5 do
     begin
     table2.First;
     while (table2.FieldValues['理论']<>null) and (not table2.Eof) do
        begin
          i:=table2.FieldValues['理论'];
          Items.Add(i);
          table2.Next;
        end;
     end;
  end;
end;

procedure Tcyzgzda.DBComboBox6DropDown(Sender: TObject);
var
   i:string;
begin
  if dbcombobox6.Items.Count<=0 then
   begin
    with dbcombobox6 do
     begin
     table2.First;
     while (table2.FieldValues['操作']<>null) and (not table2.Eof) do
        begin
          i:=table2.FieldValues['操作'];
          Items.Add(i);
          table2.Next;
        end;
     end;
  end;
end;

procedure Tcyzgzda.sDateEdit1AcceptDate(Sender: TObject;
  var aDate: TDateTime; var CanAccept: Boolean);
begin
  table1.Edit;
end;

procedure Tcyzgzda.sDateEdit2AcceptDate(Sender: TObject;
  var aDate: TDateTime; var CanAccept: Boolean);
begin
   table1.Edit;
end;

procedure Tcyzgzda.Table1AfterInsert(DataSet: TDataSet);
var
  i:integer;
begin
     table3.Open;
     table3.Edit;
     i:=table3.FieldValues['cyzgzpxda']+1;
     table3.FieldValues['cyzgzpxda']:=i;
     dbedit1.Text:=formatfloat('200000',i); //生成6位学号
     //dbedit1.Text:=serialnum('200000',i);
     Dbedit2.setfocus;
     sdateedit1.text:='    -  -  ';
     dbedit5.Text:=datetostr(now);
end;
{function serialnum(numlong: string;numinit: integer):string;
var
   i:integer;
begin
   i:=numinit+1;
   serialnum:=formatfloat(numlong,i);
end;}

procedure Tcyzgzda.Table1AfterCancel(DataSet: TDataSet);
begin
   table3.Cancel;
end;

procedure Tcyzgzda.Table1AfterPost(DataSet: TDataSet);
begin
   table3.Post;
end;

procedure Tcyzgzda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   self.Destroy;
end;

procedure Tcyzgzda.BitBtn2Click(Sender: TObject);
begin
  database1.close;
  table1.close;
  table2.close;
  table3.close;
  table4.close;
  self.close;
end;

procedure Tcyzgzda.BitBtn4Click(Sender: TObject);
begin
   dbgrideh1.DataSource:=datasource2;
   dbgrideh1.DataSource.DataSet.Filter:=combobox1.Text+combobox2.Text+edit1.Text;
   dbgrideh1.DataSource.DataSet.Filtered:=true;

end;

procedure Tcyzgzda.BitBtn5Click(Sender: TObject);
begin
   frxreport1.ShowReport;
end;

procedure Tcyzgzda.ComboBox1DropDown(Sender: TObject);
var
  i:integer;
begin
   for i:=0 to table1.Fields.Count-1 do
        combobox1.Items.Add(table1.Fields[i].FieldName);
end;

procedure Tcyzgzda.BitBtn6Click(Sender: TObject);
begin
  database1.close;
  table1.close;
  table2.close;
  table3.close;
  table4.close;
  self.close;
end;

end.
