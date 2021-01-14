unit Unit7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB, DBTables, ExtCtrls,
  DBCtrls;

type
  TForm7 = class(TForm)
    DataSource1: TDataSource;
    Table1: TTable;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    DBNavigator1: TDBNavigator;
    procedure BitBtn5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

uses report;

{$R *.dfm}

procedure TForm7.BitBtn5Click(Sender: TObject);
begin
close;
end;

procedure TForm7.FormShow(Sender: TObject);
begin
table1.open;
end;

procedure TForm7.FormClose(Sender: TObject; var Action: TCloseAction);
begin
table1.close;
action:=cafree;
end;

procedure TForm7.BitBtn4Click(Sender: TObject);
begin
application.CreateForm(treportform,reportform);
reportform.Q_form7.Preview;
end;

end.
