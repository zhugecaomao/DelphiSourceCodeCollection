unit Unit9;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, ADODB, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, StdCtrls, Buttons, Grids, DBGrids,
  cxDropDownEdit, cxContainer, cxTextEdit, cxMaskEdit, cxCalendar,
  cxDBEdit, ComCtrls, RM_Dataset, RM_Common, RM_Class, RM_GridReport;

type
  TForm9 = class(TForm)
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    BitBtn1: TBitBtn;
    ADOConnection1: TADOConnection;
    ADOTable2: TADOTable;
    ADOTable3: TADOTable;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    DataSource2: TDataSource;
    RMReport1: TRMReport;
    BitBtn3: TBitBtn;
    RMDBDataSet1: TRMDBDataSet;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    ADOTable4: TADOTable;
    cxGridDBTableView1DBColumn: TcxGridDBColumn;
    cxGridDBTableView1DBColumn1: TcxGridDBColumn;
    cxGridDBTableView1DBColumn2: TcxGridDBColumn;
    cxGridDBTableView1DBColumn3: TcxGridDBColumn;
    cxGridDBTableView1DBColumn4: TcxGridDBColumn;
    cxGridDBTableView1DBColumn5: TcxGridDBColumn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    RMDBDataSet2: TRMDBDataSet;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;
  hjsl:Real;
  hjje:Real;
  ljsl:Real;
  ljje:Real;

implementation

{$R *.dfm}

procedure TForm9.FormCreate(Sender: TObject);
begin
ADOConnection1.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='
                      + ExtractFilePath(Application.ExeName)
                      + 'db1.mdb;Persist Security Info=False';
ADOTable1.TableName:='rtj';
ADOTable1.Active:=True;
ADOTable2.TableName:='表1';
ADOTable2.Active:=True;
ADOTable3.TableName:='csbh';
ADOTable3.Active:=True;
ADOTable4.TableName:='rtjrq';
ADOTable4.Active:=True;
ADOTable3.Sort:='厨师编号';
ADOTable3.First;
While not ADOTable3.Eof do
begin
ComboBox1.Items.Add(ADOTable3.FieldByName('厨师编号').AsString);
ADOTable3.Next;
end;
combobox1.text:=combobox1.items[0];
end;

procedure TForm9.BitBtn1Click(Sender: TObject); //=======================

begin
if DateTimePicker1.Date>datetimePicker2.Date then
    ShowMessage('初始日期选择错误！');

if DateTimePicker1.Date<=datetimePicker2.Date then

///////////////////////////////////////////////////////////////////////////
begin
ADOTable4.Edit;                         //开始保存查询日期数据
ADOTable4.FieldByName('开始日期').value:=FormatDateTime('yyyy-mm-dd',
  DateTimePicker1.Date);
ADOTable4.FieldByName('结束日期').value:=FormatDateTime('yyyy-mm-dd',
  DateTimePicker2.Date);
ADOTable4.post;
ADOTable1.Active:=False;
ADOTable1.Close;
ADOTable1.Active:=True;
ADOTable1.Open;
ADOTable2.Active:=False;
ADOTable2.Close;
ADOTable2.Active:=True;
ADOTable2.Open;
ADOTable3.Active:=False;
ADOTable3.Close;
ADOTable3.Active:=True;
ADOTable3.Open;
ADOTable4.Active:=False;
ADOTable4.Close;
ADOTable4.Active:=True;
ADOTable4.Open;
ADOTable1.first;                        //开始清空数据
while not ADOTable1.eof do              //循环DELETE
ADOTable1.delete;


                                  //给table1=厨师，厨师编号
        ADOTable3.Filtered:=false;         //给table1=厨师，厨师编号
  ADOTable3.Filter:=
  '厨师编号='''+combobox1.text+'''';
  ADOTable3.Filtered:=True;
        ADOTable1.edit;
        ADOTable1.FieldByName('厨师编号').value:=
        ADOTable3.FieldByName('厨师编号').value;
        ADOTable1.FieldByName('厨师').value:=
        ADOTable3.FieldByName('厨师').value;
        ADOTable1.Post;
ADOTable1.Refresh;


    ADOTable2.Filtered:=false;                 //开始查询按日期内的数据
  ADOTable2.Filter:=
  '时间>='''+FormatDateTime('yyyy-mm-dd',
  DateTimePicker1.Date)+''' and 时间<='''+
  FormatDateTime('yyyy-mm-dd',
  DateTimePicker2.Date)+''' and 厨师='''+
  ADOTable3.FieldByName('厨师').value+'''';
  ADOTable2.Filtered:=True;


    hjsl:=0;
    hjje:=0;
  ADOTable2.First;
while not  ADOTable2.Eof  do                      //开始循环检查空值并累加
begin
if ADOTable2.FieldByName('金额').IsNull then
begin
ShowMessage('请在“厨房资料录入”功能里点击“重新计算金额值”计算金额！');
Abort;
end;
if ADOTable2.FieldByName('数量').IsNull then
begin
ShowMessage('请在“厨房资料录入”功能里检查记录的“数量”不能为空值');
Abort;
end;
if ADOTable2.FieldByName('金额').value=0 then
begin
ShowMessage('请在“厨房资料录入”功能里点击“重新计算金额值”计算金额！');
Abort;
end;
if ADOTable2.FieldByName('数量').value=0 then
begin
ShowMessage('请在“厨房资料录入”功能里检查记录的“数量”不能为空值');
Abort;
end;
hjsl:=hjsl+ADOTable2.FieldByName('数量').value;
hjje:=hjje+ADOTable2.FieldByName('金额').value;
ADOTable2.Next;
end;
ADOTable1.Edit;                                       //开始给table1=合计
ADOTable1.FieldByName('合计数量').value:=hjsl;
ADOTable1.FieldByName('合计金额').value:=hjje;
ADOTable1.Post;
ADOTable1.Refresh;

                                                //开始查询厨师的累计
   ADOTable2.Filtered:=false;
  ADOTable2.Filter:=
  '厨师='''+ADOTable1.FieldByName('厨师').value+'''';
  ADOTable2.Filtered:=True;
    ADOTable2.First;
while  not ADOTable2.Eof       do                //开始循环检查空值
begin
if ADOTable2.FieldByName('累计数量').IsNull then
begin
ShowMessage('请在“厨房业绩统计”功能里重新统计累计数据！');
abort;
end;
if ADOTable2.FieldByName('累计金额').IsNull then
begin
ShowMessage('请在“厨房业绩统计”功能里重新统计累计数据！');
abort;
end;
if ADOTable2.FieldByName('累计数量').value=0 then
begin
ShowMessage('请在“厨房业绩统计”功能里重新统计累计数据！');
abort;
end;
if ADOTable2.FieldByName('累计金额').value=0 then
begin
ShowMessage('请在“厨房业绩统计”功能里重新统计累计数据！');
abort;
end;
ADOTable2.Next;
end;
  ADOTable2.Sort:='累计金额';                    //开始给rable1=累计
  ADOTable2.Last;
  ADOTable1.Edit;
ADOTable1.FieldByName('累计数量').value:=
ADOTable2.FieldByName('累计数量').value;
ADOTable1.FieldByName('累计金额').value:=
ADOTable2.FieldByName('累计金额').value;
ADOTable1.Post;


ADOTable1.Refresh;
ShowMessage('数据统计完成!');
end;
////////////////////////////////////////////////////////////////////////////////
end;


procedure TForm9.BitBtn3Click(Sender: TObject);
begin
RMReport1.LoadFromFile('Rmf\rtj.rmf');
RMReport1.ShowReport;
end;

procedure TForm9.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
 Key:=#0;
end;

procedure TForm9.BitBtn5Click(Sender: TObject);  //=======================************


begin
if DateTimePicker1.Date>datetimePicker2.Date then
    ShowMessage('初始日期选择错误！');

if DateTimePicker1.Date<=datetimePicker2.Date then

///////////////////////////////////////////////////////////////////////////
begin
///////////////////////////////////////////// //开始统计所有厨师累计
ADOTable4.Edit;                                                 //开始保存查询日期数据
ADOTable4.FieldByName('开始日期').value:=FormatDateTime('yyyy-mm-dd',
  DateTimePicker1.Date);
ADOTable4.FieldByName('结束日期').value:=FormatDateTime('yyyy-mm-dd',
  DateTimePicker2.Date);
ADOTable4.post;
ADOTable1.Active:=False;
ADOTable1.Close;
ADOTable1.Active:=True;
ADOTable1.Open;
ADOTable2.Active:=False;
ADOTable2.Close;
ADOTable2.Active:=True;
ADOTable2.Open;
ADOTable3.Active:=False;
ADOTable3.Close;
ADOTable3.Active:=True;
ADOTable3.Open;
ADOTable4.Active:=False;
ADOTable4.Close;
ADOTable4.Active:=True;
ADOTable4.Open;
ADOTable1.first;                        //开始清空数据
while not ADOTable1.eof do              //循环DELETE
ADOTable1.Delete;
  ///////////////////////////////////////////////////////
                 //给table1=厨师，厨师编号
ADOTable1.Refresh;
ADOTable3.Filtered:=false;          //关闭筛选，不然只有一条记录
ADOTable3.First;
                   repeat
        ADOTable1.Append;                            //循环增加厨师编号记录
        ADOTable1.FieldByName('厨师编号').value:=
        ADOTable3.FieldByName('厨师编号').value;
        ADOTable1.FieldByName('厨师').value:=
        ADOTable3.FieldByName('厨师').value;
       ADOTable3.Next;
        until ADOTable3.Eof=True;
        //ADOTable1.Post;
ADOTable1.Refresh;
ADOTable1.Sort:='厨师编号';
ADOTable1.First;

////////////////////////////////////////////////////////////////////////////////////
while not ADOTable1.Eof=True do
begin
    ADOTable2.Filtered:=false;                 //开始查询按日期内的数据
  ADOTable2.Filter:=
  '时间>='''+FormatDateTime('yyyy-mm-dd',
  DateTimePicker1.Date)+''' and 时间<='''+
  FormatDateTime('yyyy-mm-dd',
  DateTimePicker2.Date)+''' and 厨师='''+
  ADOTable1.FieldByName('厨师').value+'''';
  ADOTable2.Filtered:=True;
///////////////////////////////////////////////////
hjsl:=0;
hjje:=0;
  ADOTable2.First;

while  not ADOTable2.Eof       do                //开始循环检查空值并累加
begin
if ADOTable2.FieldByName('金额').IsNull then
begin
ShowMessage('请在“厨房资料录入”功能里点击“重新计算金额值”计算金额！');
Abort;
end;
if ADOTable2.FieldByName('数量').IsNull then
begin
ShowMessage('请在“厨房资料录入”功能里检查记录的“数量”不能为空值');
Abort;
end;
if ADOTable2.FieldByName('金额').value=0 then
begin
ShowMessage('请在“厨房资料录入”功能里点击“重新计算金额值”计算金额！');
Abort;
end;
if ADOTable2.FieldByName('数量').value=0 then
begin
ShowMessage('请在“厨房资料录入”功能里检查记录的“数量”不能为空值');
Abort;
end;
hjsl:=hjsl+ADOTable2.FieldByName('数量').value;
hjje:=hjje+ADOTable2.FieldByName('金额').value;
ADOTable2.Next;
end;
ADOTable1.Edit;                                       //开始循环给table1=合计
ADOTable1.FieldByName('合计数量').value:=hjsl;
ADOTable1.FieldByName('合计金额').value:=hjje;


 ADOTable2.Filtered:=false;                         //开始查询累计数据
  ADOTable2.Filter:=
  '厨师='''+ADOTable1.FieldByName('厨师').value+'''';
  ADOTable2.Filtered:=True;
  ADOTable2.First;
while  not ADOTable2.Eof       do                //开始循环检查空值
begin
if ADOTable2.FieldByName('累计数量').IsNull then
begin
ShowMessage('请在“厨房业绩统计”功能里重新统计累计数据！');
Abort;
end;
if ADOTable2.FieldByName('累计金额').IsNull then
begin
ShowMessage('请在“厨房业绩统计”功能里重新统计累计数据！');
Abort;
end;
if ADOTable2.FieldByName('累计数量').value=0 then
begin
ShowMessage('请在“厨房业绩统计”功能里重新统计累计数据！');
abort;
end;
if ADOTable2.FieldByName('累计金额').value=0 then
begin
ShowMessage('请在“厨房业绩统计”功能里重新统计累计数据！');
abort;
end;
ADOTable2.Next;
end;
  ADOTable2.Sort:='累计金额';                    //开始循环给ado1=累计
  ADOTable2.Last;
  ADOTable1.Edit;
ADOTable1.FieldByName('累计数量').value:=
ADOTable2.FieldByName('累计数量').value;
ADOTable1.FieldByName('累计金额').value:=
ADOTable2.FieldByName('累计金额').value;
ADOTable1.Next;
end;             //每个厨师数据处理完成

ADOTable1.Prior;                                     //重新复位，刷新ado1数据
ADOTable1.Refresh;
ADOTable1.Sort:='厨师编号';
ADOTable1.First;


hjsl:=0;
hjje:=0;
ljsl:=0;
ljje:=0;
         repeat                                  //开始循环累加
hjsl:=hjsl+ADOTable1.FieldByName('合计数量').value;
hjje:=hjje+ADOTable1.FieldByName('合计金额').value;
ljsl:=ljsl+ADOTable1.FieldByName('累计数量').value;
ljje:=ljje+ADOTable1.FieldByName('累计金额').value;
ADOTable1.Next;
         until ADOTable1.Eof=True;
ADOTable1.Append;
ADOTable1.FieldByName('厨师编号').value:='总合计';          //开始给table1总合计
ADOTable1.FieldByName('合计数量').value:=hjsl;
ADOTable1.FieldByName('合计金额').value:=hjje;
ADOTable1.FieldByName('累计数量').value:=ljsl;
ADOTable1.FieldByName('累计金额').value:=ljje;

ADOTable1.Post;                                     //重新复位，刷新ado1数据
ADOTable1.Refresh;
ADOTable1.Active:=False;
ADOTable1.Close;
ADOTable1.Active:=True;
ADOTable1.Open;
ADOTable1.Refresh;
ADOTable2.Active:=False;
ADOTable2.Close;
ADOTable2.Active:=True;
ADOTable2.Open;
ADOTable2.Refresh;
ADOTable3.Active:=False;
ADOTable3.Close;
ADOTable3.Active:=True;
ADOTable3.Open;
ADOTable3.Refresh;
ADOTable4.Active:=False;
ADOTable4.Close;
ADOTable4.Active:=True;
ADOTable4.Open;
ADOTable4.Refresh;

ShowMessage('数据统计完成!');




//////////////////////////////////////////////////////////////////////




end;



end;

end.
