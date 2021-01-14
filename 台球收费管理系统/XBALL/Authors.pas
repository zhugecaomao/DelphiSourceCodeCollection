unit Authors;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, Grids, DBGrids, Db, DBTables, StdCtrls, Mask;

type
  TAuthor = class(TForm)
    DataSource1: TDataSource;
    Table1: TTable;
    Label1: TLabel;
    Button2: TButton;
    DBEdit1: TDBEdit;
    DBGrid1: TDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Author: TAuthor;

implementation

{$R *.DFM}

procedure TAuthor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Table1.Close;
  Action := caFree;
end;

procedure TAuthor.FormCreate(Sender: TObject);
begin
  Table1.Open;
end;

procedure TAuthor.FormActivate(Sender: TObject);
begin
  Top := 20;
end;

procedure TAuthor.Button2Click(Sender: TObject);
begin
  Close;
end;

end.
