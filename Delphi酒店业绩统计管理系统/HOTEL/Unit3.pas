unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, ADODB, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, DBCtrls, StdCtrls, Buttons;

type
  TForm3 = class(TForm)
    cxGrid2: TcxGrid;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    ADOTable2: TADOTable;
    DataSource2: TDataSource;
    DBLookupListBox1: TDBLookupListBox;
    BitBtn1: TBitBtn;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    cxGrid2DBTableView1DBColumn: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn6: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn7: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn8: TcxGridDBColumn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    BitBtn4: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.BitBtn1Click(Sender: TObject);
var
   x:Real;
   y:Real;
begin
x:=0;
y:=0;
ADOTable2.Active:=False;
ADOTable2.Close;
ADOTable2.Active:=True;
ADOTable2.Open;
ADOTable1.Active:=False;
ADOTable1.Close;
ADOTable1.Active:=True;
ADOTable1.Open;
ADOTable1.Sort:='时间';
ADOTable1.First;
repeat
ADOTable1.Edit;
if ADOTable1.FieldByName('数量').IsNull then
begin
ADOTable1.Active:=False;
ADOTable1.Close;
ADOTable1.Active:=True;
ADOTable1.Open;
ShowMessage('此记录的数量值为空值，请在“厨房资料录入”功能里输入此记录的数量值！');
exit;
end;
if ADOTable1.FieldByName('金额').IsNull then
begin
ADOTable1.Active:=False;
ADOTable1.Close;
ADOTable1.Active:=True;
ADOTable1.Open;
ShowMessage('请在“厨房资料录入”功能里点击“重新计算金额值”计算金额！');
exit;
end;
ADOTable1.FieldByName('累计数量').value:=x+
ADOTable1.FieldByName('数量').value;
x:=ADOTable1.FieldByName('累计数量').value;
ADOTable1.FieldByName('累计金额').value:=y+
ADOTable1.FieldByName('金额').value;
y:=ADOTable1.FieldByName('累计金额').value;
ADOTable1.Post;
ADOTable1.Next;
until ADOTable1.Eof=True;
ADOTable1.Active:=False;
ADOTable1.Close;
ADOTable1.Active:=True;
ADOTable1.Open;
ShowMessage('累计数据统计完成 ！');

end;

procedure TForm3.FormCreate(Sender: TObject);
begin
ADOTable1.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='
                      + ExtractFilePath(Application.ExeName)
                      + 'db1.mdb;Persist Security Info=False';
ADOTable1.TableName:='表1';
ADOTable1.Active:=True;
ADOTable2.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='
                      + ExtractFilePath(Application.ExeName)
                      + 'db1.mdb;Persist Security Info=False';
ADOTable2.TableName:='csbh';
ADOTable2.Active:=True;
ADOTable2.Active:=False;
ADOTable2.Close;
ADOTable2.Active:=True;
ADOTable2.Open;
ADOTable1.Active:=False;
ADOTable1.Close;
ADOTable1.Active:=True;
ADOTable1.Open;
end;

procedure TForm3.BitBtn4Click(Sender: TObject);
begin
ADOTable1.Active:=False;
ADOTable1.Close;
ADOTable1.Active:=True;
ADOTable1.Open;
ADOTable2.Active:=False;
ADOTable2.Close;
ADOTable2.Active:=True;
ADOTable2.Open;
ShowMessage('刷新数据完成 ！');
end;

end.
