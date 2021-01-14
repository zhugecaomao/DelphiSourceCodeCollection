unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, ADODB, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGrid, cxContainer, cxListBox, cxDBEdit,
  StdCtrls, DBCtrls, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  Unit8, cxDBLookupEdit, cxDBLookupComboBox, Buttons;

type
  TForm2 = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    cxGrid1DBTableView1DBColumn: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn6: TcxGridDBColumn;
    ADOTable2: TADOTable;
    DataSource2: TDataSource;
    DBLookupListBox1: TDBLookupListBox;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    DBLookupListBox2: TDBLookupListBox;
    Label3: TLabel;
    Edit1: TEdit;
    ADOTable3: TADOTable;
    DataSource3: TDataSource;
    Label4: TLabel;
    ADOConnection1: TADOConnection;
    BitBtn7: TBitBtn;
    procedure ADOTable1BeforePost(DataSet: TDataSet);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBLookupListBox2DblClick(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Math;

{$R *.dfm}

procedure TForm2.ADOTable1BeforePost(DataSet: TDataSet);
begin
if DataSet.FieldByName('时间').IsNull then
begin
ShowMessage('请选择时间，此记录的时间不能为空值！');
Abort;
end;
if DataSet.FieldByName('数量').IsNull then
begin
ShowMessage('请输入数量值，此记录的数量不能为空值！');
Abort;
end;
if DataSet.FieldByName('单价').IsNull then
begin
ShowMessage('请选择菜名单价，此记录的菜名单价不能为空值！');
Abort;
end;
DataSet.FieldByName('金额').value:=
DataSet.FieldByName('数量').value*
DataSet.FieldByName('单价').value;
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
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
ADOTable1.FieldByName('金额').value:=
ADOTable1.FieldByName('数量').value*
ADOTable1.FieldByName('单价').value;
ADOTable1.Post;
ADOTable1.Next;
  until ADOTable1.Eof=True;
ADOTable1.UpdateCursorPos;
ADOTable1.Close;
ADOTable1.Open;
ShowMessage('金额值计算完成 ！');
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
begin
ADOTable1.Append;
end;

procedure TForm2.BitBtn4Click(Sender: TObject);
begin
ADOTable1.Cancel;
ADOTable1.UpdateCursorPos;
ADOTable1.Close;
ADOTable1.Open;
ADOTable1.UpdateCursorPos;
end;

procedure TForm2.BitBtn3Click(Sender: TObject);
begin
ADOTable1.Edit;
ADOTable1.Post;
ADOTable1.refresh;
ADOTable1.UpdateCursorPos;
ShowMessage('记录保存成功！');
end;

procedure TForm2.BitBtn5Click(Sender: TObject);
begin
if messagebox(self.Handle ,'确认删除这条记录吗？','系统提示 ！',mb_yesno)=idyes then
  begin
     ADOTable1.delete ;
  end
else   ;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
ADOConnection1.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='
                      + ExtractFilePath(Application.ExeName)
                      + 'db1.mdb;Persist Security Info=False';
ADOTable1.TableName:='表1';
ADOTable1.Active:=True;
ADOTable2.TableName:='csbh';
ADOTable2.Active:=True;
ADOTable3.TableName:='菜名';
ADOTable3.Active:=True;
ADOTable2.Active:=False;
ADOTable2.Close;
ADOTable2.Active:=True;
ADOTable2.Open;
ADOTable1.Active:=False;
ADOTable1.Close;
ADOTable1.Active:=True;
ADOTable1.Open;
end;

procedure TForm2.Edit1Change(Sender: TObject);

begin

if Not (trim(Edit1.Text) = '') then
begin
  ADOTable3.Filtered:=True;
  ADOTable3.Filter:='[速查码] like ''%'+Edit1.Text+'%''';
end;

end;

procedure TForm2.DBLookupListBox2DblClick(Sender: TObject);
begin
ADOTable1.Edit;
ADOTable1.FieldByName('菜名').value:=
ADOTable3.FieldByName('菜品名称').value;
ADOTable1.FieldByName('单价').value:=
ADOTable3.FieldByName('价格').value;
end;

procedure TForm2.BitBtn7Click(Sender: TObject);
begin
Form8.ShowModal;
end;

end.
