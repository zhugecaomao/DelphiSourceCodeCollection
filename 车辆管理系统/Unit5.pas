unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, DBTables, Buttons, ExtCtrls,
  DBCtrls;

type
  TForm5 = class(TForm)
    Table1: TTable;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    DBMemo1: TDBMemo;
    Label2: TLabel;
    DBNavigator1: TDBNavigator;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

uses report;

{$R *.dfm}

procedure TForm5.BitBtn3Click(Sender: TObject);
begin
close;
end;

procedure TForm5.FormShow(Sender: TObject);
begin
table1.open;

end;

procedure TForm5.FormClose(Sender: TObject; var Action: TCloseAction);
begin
table1.close;
action:=cafree;
end;

procedure TForm5.BitBtn2Click(Sender: TObject);
begin
application.CreateForm(treportform,reportform);
reportform.Q_form5.Preview;
end;

end.
