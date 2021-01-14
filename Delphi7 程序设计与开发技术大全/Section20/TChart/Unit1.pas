unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, ExtCtrls, TeeProcs, Chart, DB, DBTables;

type
  TForm1 = class(TForm)
    Chart1: TChart;
    Series1: TBarSeries;
    Table1: TTable;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
Series1.Clear;
Table1.open;
while not table1.eof do
begin
Series1.add(table1.fieldByName('size').Asinteger,
table1.fieldByName('name').Asstring,clTeeColor);
table1.Next;
end;
end;

end.
