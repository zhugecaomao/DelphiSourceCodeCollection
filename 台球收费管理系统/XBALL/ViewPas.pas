unit ViewPas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ExtCtrls, DB, DBTables, ComCtrls;

type
  TViewForm = class(TForm)
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button5: TButton;
    Bevel1: TBevel;
    Button4: TButton;
    Query1: TQuery;
    DataSource1: TDataSource;
    SB: TStatusBar;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Query1BeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
    OrdInt: Integer;
    OrdStr: String;
    SQLStr: String;
    DBName: String;
  public
    { Public declarations }
  end;

var
  ViewForm: TViewForm;

implementation

uses XedUser;

{$R *.DFM}

procedure TViewForm.Button1Click(Sender: TObject);
var
  S: String;
begin
  if Sender = Button1 then DBName := 'Ball01';
  if Sender = Button2 then DBName := 'Ball02';
  if Sender = Button3 then DBName := 'Ball03';
  if Sender = Button4 then DBName := 'CommCard';

  S := TButton(Sender).Caption;
  SB.Panels[0].Text := S + '，普通用户不能修改数据';
  OrdInt := 0;
  OrdStr := '';
  Query1.Close;
  Query1.SQL.Text :=
    Format('Select * From %s', [DBName]);
  Query1.Open;
  SB.Panels[1].Text := '按数据库原始顺序';
end;

procedure TViewForm.FormCreate(Sender: TObject);
begin
  DBGrid1.ReadOnly := not Systemor;
  Button1Click(Button1);
end;

procedure TViewForm.DBGrid1TitleClick(Column: TColumn);
var
  S: String;
begin
  S := Column.FieldName;
  if S = OrdStr then Begin
    OrdInt := OrdInt + 1;
  End Else Begin
    OrdInt := 1;
    OrdStr := S;
  End;
  OrdInt := OrdInt mod 3;
  Case OrdInt of
    0: SB.Panels[1].Text := '按数据库原始顺序';
    1: SB.Panels[1].Text := Format('按“%s”进行升排序', [S]);
    2: SB.Panels[1].Text := Format('按“%s”进行降排序', [S]);
  End;
  Case OrdInt of
    0: S := '';
    1: S := Format('Order By %s', [S]);
    2: S := Format('Order By %s Desc', [S]);
  End;
  SQLStr := Format('Select * From %s %s', [DBName, S]);
  Query1.DisableControls;
  Query1.SQL.Text := SqlStr;
  Query1.Open;
  Query1.EnableControls;
end;

procedure TViewForm.Query1BeforeDelete(DataSet: TDataSet);
var
  ID: Integer;
begin   
  ID := MessageBox(Handle, '这将删除一条记录，确实需要删除吗？',
    '删除记录', MB_YESNOCANCEL);
  if ID <> ID_YES then Abort;
end;

end.
