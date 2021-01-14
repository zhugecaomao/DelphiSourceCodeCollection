unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB, DBTables, ExtCtrls,
  DBCtrls;

type
  TForm3 = class(TForm)
    Label1: TLabel;
    DBGrid1: TDBGrid;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    DataSource1: TDataSource;
    Table1: TTable;
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
  Form3: TForm3;

implementation

uses report;

{$R *.dfm}

procedure TForm3.BitBtn5Click(Sender: TObject);
begin
close;
end;

procedure TForm3.FormShow(Sender: TObject);
begin
table1.open;

end;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
table1.close;
action:=cafree;
end;

procedure TForm3.BitBtn4Click(Sender: TObject);
begin
application.CreateForm(treportform,reportform);
reportform.Q_form3.Preview;
end;

end.
