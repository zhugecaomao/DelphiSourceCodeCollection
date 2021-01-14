unit jlyda_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, ExtCtrls, Mask, ComCtrls, TabNotBk,
  DB, DBTables, Grids, DBGrids,ComObj, bsSkinCtrls, se_controls, KsSkinSpeedButtons, KsSkinItems,
  Menus, KsSkinMenus, DBGridEh, PrnDbgeh;

type
  Tjlyda = class(TForm)
    DataSource1: TDataSource;
    Table1: TTable;
    Database1: TDatabase;
    Label10: TLabel;
    Table1BDEDesigner: TStringField;
    Table1BDEDesigner2: TSmallintField;
    Table1BDEDesigner3: TStringField;
    Table1BDEDesigner4: TDateTimeField;
    Table1BDEDesigner5: TDateTimeField;
    Table1BDEDesigner6: TDateTimeField;
    Table1BDEDesigner7: TStringField;
    Table1BDEDesigner8: TStringField;
    Table1BDEDesigner9: TMemoField;
    Table1BDEDesigner10: TStringField;
    Table1BDEDesigner11: TDateTimeField;
    Table1BDEDesigner12: TStringField;
    Table1BDEDesigner13: TStringField;
    Table1BDEDesigner14: TStringField;
    Table2: TTable;
    Table1BDEDesigner15: TStringField;
    Table3: TTable;
    Table3jlyda: TIntegerField;
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
    Label11: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit13: TDBEdit;
    DBComboBox1: TDBComboBox;
    DBComboBox2: TDBComboBox;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    DateTimePicker3: TDateTimePicker;
    DBComboBox3: TDBComboBox;
    GroupBox2: TGroupBox;
    Label9: TLabel;
    DBMemo1: TDBMemo;
    Panel1: TPanel;
    Label13: TLabel;
    DBNavigator1: TDBNavigator;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    BitBtn4: TBitBtn;
    ComboBox2: TComboBox;
    TabSheet2: TTabSheet;
    DBGridEh1: TDBGridEh;
    PrintDBGridEh1: TPrintDBGridEh;
    procedure Table1AfterInsert(DataSet: TDataSet);
    procedure BitBtn4Click(Sender: TObject);
    procedure Table1BeforeInsert(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure Table1BeforeRefresh(DataSet: TDataSet);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBComboBox1DropDown(Sender: TObject);
    procedure DBComboBox2DropDown(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure DateTimePicker2Change(Sender: TObject);
    procedure DateTimePicker3Change(Sender: TObject);
    procedure DBComboBox3DropDown(Sender: TObject);
    procedure Table1AfterCancel(DataSet: TDataSet);
    procedure Table1AfterPost(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  jlyda: Tjlyda;

implementation

{$R *.dfm}

procedure Tjlyda.Table1AfterInsert(DataSet: TDataSet);
var
  i:integer;
begin
  table3.Open;
  table3.Edit;
  i:=table3.FieldValues['jlyda']+1;
  table3.FieldValues['jlyda']:=i;
  table1.FieldValues['编号']:=formatfloat('600000',i);
  table1.FieldValues['建档人']:='';
  table1.FieldValues['建档日期']:=datetostr(now);
end;

procedure Tjlyda.BitBtn4Click(Sender: TObject);
var
filterstr:string;
begin
   if edit1.text<>'' then
   begin
     filterstr:=combobox1.Text+combobox2.Text+''''+edit1.Text+'''';
     table1.Filter:=filterstr;
     table1.Filtered:=true;
     dbgrideh1.DataSource:=datasource1;
   end
   else
   showmessage('请选择查询条件！');
end;

procedure Tjlyda.Table1BeforeInsert(DataSet: TDataSet);
begin
    table1.Filtered:=false;
    combobox1.Text:='';
    combobox2.Text:='';
    edit1.Text:='';
    dbgrideh1.DataSource:=nil;
end;

procedure Tjlyda.FormCreate(Sender: TObject);
begin
  table1.Close;
  table1.Open;
  table2.Close;
  table2.Open;
end;

procedure Tjlyda.Table1BeforeRefresh(DataSet: TDataSet);
begin
    table1.Filtered:=false;
    combobox1.Text:='';
    combobox2.Text:='';
    edit1.Text:='';
    dbgrideh1.DataSource:=nil;
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

procedure Tjlyda.BitBtn3Click(Sender: TObject);
begin
   if dbgrideh1.DataSource=datasource1 then
      CopyDbDataToExcel([DBGrideh1])
   else
      showmessage('表格中无记录!');
end;

procedure Tjlyda.DBComboBox1DropDown(Sender: TObject);
begin
    with dbcombobox1 do
    begin
     if items.count<=0 then
       begin
        with table2 do
        begin
         first;
          while (fieldvalues['性别']<>null) and (not eof) do
           begin
              items.Add(fieldvalues['性别']);
              next;
           end;
          end;
        end;
     end;
end;

procedure Tjlyda.DBComboBox2DropDown(Sender: TObject);
begin
    with dbcombobox2 do
    begin
     if items.count<=0 then
       begin
        with table2 do
        begin
         first;
          while (fieldvalues['学习车型']<>null) and (not eof) do
           begin
              items.Add(fieldvalues['学习车型']);
              next;
           end;
          end;
        end;
     end;
end;

procedure Tjlyda.DBComboBox3DropDown(Sender: TObject);
begin
    with dbcombobox3 do
    begin
     if items.count<=0 then
       begin
        with table2 do
        begin
         first;
          while (fieldvalues['拟办资格证种类']<>null) and (not eof) do
           begin
              items.Add(fieldvalues['拟办资格证种类']);
              next;
           end;
          end;
        end;
     end;
end;

procedure Tjlyda.DBGrid1DblClick(Sender: TObject);
begin
    //性别
    with dbgrideh1 do
    begin
     if Columns[2].picklist.count<=0 then
       begin
        with table2 do
        begin
         first;
          while (fieldvalues['性别']<>null) and (not eof) do
           begin
              Columns[2].picklist.Add(fieldvalues['性别']);
              next;
           end;
          end;
        end;
     end;

    //持照类别
    with dbgrideh1 do
    begin
     if Columns[4].picklist.count<=0 then
       begin
        with table2 do
        begin
         first;
          while (fieldvalues['学习车型']<>null) and (not eof) do
           begin
              Columns[4].picklist.Add(fieldvalues['学习车型']);
              next;
           end;
          end;
        end;
     end;

    //准教类别
    with dbgrideh1 do
    begin
     if Columns[6].picklist.count<=0 then
       begin
        with table2 do
        begin
         first;
          while (fieldvalues['拟办资格证种类']<>null) and (not eof) do
           begin
              Columns[6].picklist.Add(fieldvalues['拟办资格证种类']);
              next;
           end;
          end;
        end;
     end;

end;
procedure Tjlyda.DateTimePicker1Change(Sender: TObject);
begin
  dbedit4.Text:=datetostr(datetimepicker1.Date);
  table1.Edit;
end;

procedure Tjlyda.DateTimePicker2Change(Sender: TObject);
begin
  dbedit5.Text:=datetostr(datetimepicker2.Date);
  table1.Edit;
end;

procedure Tjlyda.DateTimePicker3Change(Sender: TObject);
begin
  dbedit6.Text:=datetostr(datetimepicker3.Date);
  table1.Edit;
end;

procedure Tjlyda.Table1AfterCancel(DataSet: TDataSet);
begin
   table3.Cancel;
end;

procedure Tjlyda.Table1AfterPost(DataSet: TDataSet);
begin
   table3.Post;
end;

procedure Tjlyda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  jlyda.Destroy;
end;

procedure Tjlyda.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure Tjlyda.BitBtn1Click(Sender: TObject);
begin
  printdbgrideh1.Preview;
end;

end.
