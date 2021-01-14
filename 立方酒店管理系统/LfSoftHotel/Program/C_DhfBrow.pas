unit C_DhfBrow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, C_StdBrow, DB, DBTables, DosMove, Grids, DBGrids, StdCtrls,
  Buttons, ExtCtrls, C_Define;

type
  TDhfBrowForm = class(TStdBrowForm)
    qryDetail: TQuery;
    DBGrid2: TDBGrid;
    dsDetail: TDataSource;
    procedure btnPrintClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnLocaClick(Sender: TObject);
  private
    { Private declarations }
    procedure ShowDhf;
  public
    { Public declarations }
  end;

var
  DhfBrowForm: TDhfBrowForm;

procedure DhfBrow;

implementation

uses C_Sysprint;

{$R *.dfm}

procedure DhfBrow;
begin
  DhfBrowForm := TDhfBrowForm.Create(Application);
  try
    with DhfBrowForm do
    begin
      ShowDhf;
      ShowModal;
    end;
  finally
    DhfBrowForm.Free;
  end;
end;

procedure TDhfBrowForm.ShowDhf;
var
  s: string;
  I,ColNum : Integer;
  AColumn  : TColumn;
begin
  ColNum := DBGrid1.Columns.Count;
  for I := ColNum -1 downto  0 do
    DBGrid1.Columns.Delete(I);
  ColNum := DBGrid2.Columns.Count;
  for I := ColNum -1 downto  0 do
    DBGrid2.Columns.Delete(I);


      with DBGrid1 do
      begin
        AColumn                 := Columns.Add;
        AColumn.FieldName       := 'Room';
        AColumn.Title.Caption   := '分机号';
        AColumn.Title.Alignment := taCenter;

        AColumn                 := Columns.Add;
        AColumn.FieldName       := 'Fee';
        AColumn.Title.Caption   := '话费';
        AColumn.Title.Alignment := taCenter;

        AColumn                 := Columns.Add;
        AColumn.FieldName       := 'AddiFee';
        AColumn.Title.Caption   := '附加费';
        AColumn.Title.Alignment := taCenter;

        AColumn                 := Columns.Add;
        AColumn.FieldName       := 'SvcFee';
        AColumn.Title.Caption   := '服务费';
        AColumn.Title.Alignment := taCenter;

        AColumn                 := Columns.Add;
        AColumn.FieldName       := 'Total';
        AColumn.Title.Caption   := '合计';
        AColumn.Title.Alignment := taCenter;

      end;

  s := 'select ROOM as Room,sum(FEE) as Fee,sum(ADDI_FEE) as AddiFee,sum(SVC_FEE) as SvcFee,sum(TOTAL) as Total from DHFDATA.DBF group by ROOM';
  with qryWork do
  begin
    if Active then Active := False;
    DatabaseName := JF_DIR;
    SQL.Clear;
    SQL.Add(s);
    Open;
  end;
      with DBGrid2 do
      begin
        AColumn                 := Columns.Add;
        AColumn.FieldName       := 'Room';
        AColumn.Title.Caption   := '分机号';
        AColumn.Title.Alignment := taCenter;

        AColumn                 := Columns.Add;
        AColumn.FieldName       := 'Fee';
        AColumn.Title.Caption   := '话费';
        AColumn.Title.Alignment := taCenter;

        AColumn                 := Columns.Add;
        AColumn.FieldName       := 'AddiFee';
        AColumn.Title.Caption   := '附加费';
        AColumn.Title.Alignment := taCenter;

        AColumn                 := Columns.Add;
        AColumn.FieldName       := 'SvcFee';
        AColumn.Title.Caption   := '服务费';
        AColumn.Title.Alignment := taCenter;

        AColumn                 := Columns.Add;
        AColumn.FieldName       := 'Total';
        AColumn.Title.Caption   := '合计';
        AColumn.Title.Alignment := taCenter;

      end;
  s := 'select ROOM as Room,FEE as Fee,ADDI_FEE as AddiFee,SVC_FEE as SvcFee,TOTAL as Total from DHFDATA.DBF where ROOM=:ROOM';
  with qryDetail do
  begin
    if Active then Active := False;
    DatabaseName := JF_DIR;
    SQL.Clear;
    SQL.Add(s);
    ParamByName('ROOM').DataType := ftString;
    Open;
  end;

end;

procedure TDhfBrowForm.btnPrintClick(Sender: TObject);
var
  APrintStru: TPrintStru;
begin
  APrintStru.ATitle := '电话费（'+DateToStr(Date)+'）';
  APrintStru.ADataSet := qryWork;
  PrintLb(APrintStru,DBGrid1);
end;

procedure TDhfBrowForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryWork.Close;
end;

procedure TDhfBrowForm.btnLocaClick(Sender: TObject);
begin
  inherited;
  qryWork.Locate('ROOM',edtValue.Text,[]);
end;

end.
