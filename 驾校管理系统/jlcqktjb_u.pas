unit jlcqktjb_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, Mask, DB,
  DBTables, ComCtrls,comobj, TabNotBk, PrnDbgeh, DBGridEh;

type
  Tjlcqktjb = class(TForm)
    DataSource1: TDataSource;
    Table1: TTable;
    Database1: TDatabase;
    Table1BDEDesigner: TStringField;
    Table1BDEDesigner2: TStringField;
    Table1BDEDesigner3: TStringField;
    Table1BDEDesigner4: TStringField;
    Table1BDEDesigner5: TStringField;
    Table1BDEDesigner6: TDateTimeField;
    Table1BDEDesigner7: TDateTimeField;
    Table1BDEDesigner8: TDateTimeField;
    Table1BDEDesigner9: TDateTimeField;
    Table1BDEDesigner10: TStringField;
    Table1BDEDesigner11: TMemoField;
    Table1BDEDesigner12: TStringField;
    Table1BDEDesigner13: TDateTimeField;
    Table2: TTable;
    Label15: TLabel;
    Table3: TTable;
    Table3jlcqktjb: TIntegerField;
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
    Label12: TLabel;
    Label13: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBComboBox1: TDBComboBox;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    DateTimePicker3: TDateTimePicker;
    DateTimePicker4: TDateTimePicker;
    GroupBox2: TGroupBox;
    Label11: TLabel;
    DBMemo1: TDBMemo;
    Panel1: TPanel;
    Label14: TLabel;
    DBNavigator1: TDBNavigator;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    BitBtn4: TBitBtn;
    ComboBox2: TComboBox;
    DBGridEh1: TDBGridEh;
    PrintDBGridEh1: TPrintDBGridEh;
    TabSheet2: TTabSheet;
    procedure DBComboBox1DropDown(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Table1AfterInsert(DataSet: TDataSet);
    procedure Table1BeforeInsert(DataSet: TDataSet);
    procedure Table1BeforeRefresh(DataSet: TDataSet);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure DateTimePicker2Change(Sender: TObject);
    procedure DateTimePicker3Change(Sender: TObject);
    procedure DateTimePicker4Change(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Table1BeforeCancel(DataSet: TDataSet);
    procedure Table1AfterPost(DataSet: TDataSet);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  jlcqktjb: Tjlcqktjb;

implementation

{$R *.dfm}

procedure Tjlcqktjb.DBComboBox1DropDown(Sender: TObject);
begin
    with dbcombobox1 do
    begin
     if items.count<=0 then
       begin
        with table2 do
        begin
         first;
          while (fieldvalues['用途']<>null) and (not eof) do
           begin
              items.Add(fieldvalues['用途']);
              next;
           end;
          end;
        end;
     end;
end;

procedure Tjlcqktjb.FormCreate(Sender: TObject);
begin
  table1.Close;
  table1.Open;
  table2.Close;
  table2.Open;
end;

procedure Tjlcqktjb.DBGrid1DblClick(Sender: TObject);
begin
    //用途
    {with dbgrid1 do
    begin
     if Columns[9].picklist.count<=0 then
       begin
        with table2 do
        begin
         first;
          while (fieldvalues['用途']<>null) and (not eof) do
           begin
              Columns[9].picklist.Add(fieldvalues['用途']);
              next;
           end;
          end;
        end;
     end;}

end;

procedure Tjlcqktjb.BitBtn4Click(Sender: TObject);
var
filterstr:string;
begin
   if edit1.text<>'' then
   begin
     filterstr:=combobox1.Text+combobox2.Text+''''+edit1.Text+'''';
     table1.Filter:=filterstr;
     table1.Filtered:=true;
     DBGridEh1.DataSource:=datasource1;
   end
   else
   showmessage('请选择查询条件！');
end;


procedure Tjlcqktjb.Table1AfterInsert(DataSet: TDataSet);
var
  i:integer;
begin
  table3.Open;
  table3.edit;
  i:=table3.FieldValues['jlcqktjb']+1;
  table3.FieldValues['jlcqktjb']:=i;
  table1.FieldValues['编号']:=formatfloat('700000',i);
  table1.FieldValues['建档人']:='';
  table1.FieldValues['建档日期']:=datetostr(now);
end;

procedure Tjlcqktjb.Table1BeforeInsert(DataSet: TDataSet);
begin
    table1.Filtered:=false;
    combobox1.Text:='';
    combobox2.Text:='';
    edit1.Text:='';
    dbgrideh1.DataSource:=nil;
end;

procedure Tjlcqktjb.Table1BeforeRefresh(DataSet: TDataSet);
begin
    table1.Filtered:=false;
    combobox1.Text:='';
    combobox2.Text:='';
    edit1.Text:='';
    dbgrideh1.DataSource:=nil;
end;

procedure Tjlcqktjb.DateTimePicker1Change(Sender: TObject);
begin
  dbedit6.Text:=datetostr(datetimepicker1.Date);
  table1.Edit;
end;

procedure Tjlcqktjb.DateTimePicker2Change(Sender: TObject);
begin
  dbedit7.Text:=datetostr(datetimepicker2.Date);
  table1.Edit;
end;

procedure Tjlcqktjb.DateTimePicker3Change(Sender: TObject);
begin
  dbedit8.Text:=datetostr(datetimepicker3.Date);
  table1.Edit;
end;

procedure Tjlcqktjb.DateTimePicker4Change(Sender: TObject);
begin
  dbedit9.Text:=datetostr(datetimepicker4.Date);
  table1.Edit;
end;

{
功能描述：把DBGrid输出到Excel表格（支持多Sheet）
调用格式：CopyDbDataToExcel([DBGrid1, DBGrid2]);
}
procedure CopyDbDataToExcel(Args: array of const);
var
  iCount, jCount: Integer;
  XLApp: Variant;
  Sheet: Variant;
  I: Integer;
begin
  Screen.Cursor := crHourGlass;
  if not VarIsEmpty(XLApp) then
  begin
    XLApp.DisplayAlerts := False;
    XLApp.Quit;
    VarClear(XLApp);
  end;

  try
    XLApp := CreateOleObject('Excel.Application');
  except
    Screen.Cursor := crDefault;
    Exit;
  end;

  XLApp.WorkBooks.Add;
  XLApp.SheetsInNewWorkbook := High(Args) + 1;

  for I := Low(Args) to High(Args) do
  begin
    XLApp.WorkBooks[1].WorkSheets[I+1].Name := TDBGrid(Args[I].VObject).Name;
    Sheet := XLApp.Workbooks[1].WorkSheets[TDBGrid(Args[I].VObject).Name];

    if not TDBGrid(Args[I].VObject).DataSource.DataSet.Active then
    begin
      Screen.Cursor := crDefault;
      Exit;
    end;

    TDBGrid(Args[I].VObject).DataSource.DataSet.first;
    for iCount := 0 to TDBGrid(Args[I].VObject).Columns.Count - 1 do
      Sheet.Cells[1, iCount + 1] :=
    TDBGrid(Args[I].VObject).Columns.Items[iCount].Title.Caption;

    jCount := 1;
    while not TDBGrid(Args[I].VObject).DataSource.DataSet.Eof do
    begin
      for iCount := 0 to TDBGrid(Args[I].VObject).Columns.Count - 1 do
        Sheet.Cells[jCount + 1, iCount + 1] :=
      TDBGrid(Args[I].VObject).Columns.Items[iCount].Field.AsString;

      Inc(jCount);
      TDBGrid(Args[I].VObject).DataSource.DataSet.Next;
    end;
    XlApp.Visible := True;
  end;
  Screen.Cursor := crDefault;
end;

procedure Tjlcqktjb.BitBtn3Click(Sender: TObject);
begin
   if dbgrideh1.DataSource=datasource1 then
      CopyDbDataToExcel([DBGrideh1])
   else
      showmessage('表格中无记录!');
end;

procedure Tjlcqktjb.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    table3.Close;
    jlcqktjb.Destroy;
end;

procedure Tjlcqktjb.Table1BeforeCancel(DataSet: TDataSet);
begin
  table3.Cancel;
end;

procedure Tjlcqktjb.Table1AfterPost(DataSet: TDataSet);
begin
     table3.Post;
end;

procedure Tjlcqktjb.BitBtn2Click(Sender: TObject);
begin
  self.close;
end;

procedure Tjlcqktjb.BitBtn1Click(Sender: TObject);
begin
  printdbgrideh1.Preview;
end;

end.
