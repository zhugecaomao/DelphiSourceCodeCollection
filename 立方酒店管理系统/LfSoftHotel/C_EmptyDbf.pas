unit C_EmptyDbf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB, DBTables;

type
  TForm1 = class(TForm)
    Database1: TDatabase;
    Query1: TQuery;
    tblDbfName: TTable;
    dsDbfName: TDataSource;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
    procedure EmptyDbf(const AName: string);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  tblDbfName.Open;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tblDbfName.Close;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.EmptyDbf(const AName: string);
var
  s : string;
begin
  s := 'delete from '+ AName ;
  with Query1 do
  begin
    if Active then Active := False;
    SQL.Clear;
    SQL.Add(s);
    Prepare;
    ExecSQL;
  end;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  EmptyDbf(tblDbfname.FieldByName('DBFNAME').AsString);
  ShowMessage('OK');
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
  with tblDbfName do
  begin
    First;
    while not Eof do
    begin
      EmptyDbf(FieldByName('DBFNAME').AsString);
      Next;
    end;
  end;
  ShowMessage('All Ok');
end;

end.
