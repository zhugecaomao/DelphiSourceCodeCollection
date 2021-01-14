unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, DBTables, Buttons, ExtCtrls,
  DBCtrls;

type
  TForm2 = class(TForm)
    DataSource1: TDataSource;
    Label1: TLabel;
    Table1: TTable;
    DBGrid1: TDBGrid;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    DBNavigator1: TDBNavigator;
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses formquery1,report;



{$R *.dfm}

procedure TForm2.BitBtn5Click(Sender: TObject);
begin
close;
end;

procedure TForm2.BitBtn4Click(Sender: TObject);
begin
application.CreateForm(treportform,reportform);
reportform.Q_hudj.Preview;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
table1.Open;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
table1.close;
action:=cafree;
end;

end.
