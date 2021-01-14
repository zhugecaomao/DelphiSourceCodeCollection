unit DataPas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  FileCtrl, Dialogs, StdCtrls, DB, DBTables, Grids, DBGrids, ComCtrls;

type
  TDataForm = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    DataSource1: TDataSource;
    Table1: TTable;
    DataSource2: TDataSource;
    Table2: TTable;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Edit1: TEdit;
    Label1: TLabel;
    SB: TStatusBar;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    CheckBox1: TCheckBox;
    procedure CloseForm(Sender: TObject);
    procedure GetDBName(Sender: TObject);
    procedure XButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure DBGrid1Enter(Sender: TObject);
  private
    { Private declarations }
    DBName: String;
  public
    { Public declarations }
  end;

var
  DataForm: TDataForm;

implementation

{$R *.dfm}

procedure TDataForm.CloseForm(Sender: TObject);
begin
  Close;
end;

procedure TDataForm.GetDBName(Sender: TObject);
var
  N: Integer;
begin
  N := TButton(Sender).Tag;
  Case N of
    0: DBName := 'Ball00';
    1: DBName := 'Ball01';
    2: DBName := 'Ball02';
    3: DBName := 'Ball03';
    4: DBName := '9Water';
  end;
  SB.Panels[1].Text := '当前数据库：' + TButton(Sender).Caption;
  Table1.Close;
  Table2.Close;
  Table1.DatabaseName := Edit1.Text;
  Table1.TableName := DBName;
  Table2.TableName := DBName;
  Table1.Open;
  Table2.Open;
end;

procedure TDataForm.XButton1Click(Sender: TObject);
var
  S: String;
begin
  if SelectDirectory('', '', S) then Edit1.Text := S;
end;

procedure TDataForm.FormCreate(Sender: TObject);
begin
  SB.Panels[1].Text := '警告：该程序将覆盖新程序的数据库';
  Table2.DatabaseName := ExtractFilePath(ParamStr(0));
  Button1.Click;
end;

procedure TDataForm.Button5Click(Sender: TObject);
var
  i, n: integer;
  Book: TBookMark;
begin
  if not CheckBox1.Checked then Exit;
  if SameText(Table2.TableName, 'Ball01') then Begin
    ShowMessage('增加卡号(长整数)字段就可以了');
    exit;
  End;
  Book := Table1.GetBookmark;
  Table1.DisableControls;
  Table2.DisableControls;
  Table2.Close;
  Table2.EmptyTable;
  Table2.Open;
  Table1.First;
  N := Table1.FieldCount;
  while not Table1.Eof Do Begin
    Table2.Append;
    For i := 0 To n - 1 Do Begin
      Table2.Fields[i].AsVariant := Table1.Fields[i].AsVariant;
    End;
    Table2.Post;
    Table1.Next;
  End;
  Table1.GotoBookmark(Book);
  Table1.FreeBookmark(Book);
  Table2.First;
  Table1.EnableControls;
  Table2.EnableControls;
end;

procedure TDataForm.Button8Click(Sender: TObject);
begin
  if not CheckBox1.Checked then Exit;
  Table2.Close;
  Table2.EmptyTable;
  Table2.Open;
end;

procedure TDataForm.DBGrid1Enter(Sender: TObject);
begin
  TDBGrid(Sender).Hint :=
    Format('记录数量：%d', [TDBGrid(Sender).DataSource.DataSet.RecordCount]);
end;

end.
