unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, DBTables, Buttons, ExtCtrls,
  DBCtrls;

type
  TForm4 = class(TForm)
    Table1: TTable;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    DBMemo1: TDBMemo;
    Label2: TLabel;
    DBMemo2: TDBMemo;
    Label3: TLabel;
    DBNavigator1: TDBNavigator;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses report;

{$R *.dfm}

procedure TForm4.BitBtn1Click(Sender: TObject);
begin
Close;
end;

procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
table1.close;
action:=cafree;
end;

procedure TForm4.FormShow(Sender: TObject);
begin
table1.open;

end;

procedure TForm4.BitBtn2Click(Sender: TObject);
begin
application.CreateForm(treportform,reportform);
reportform.Q_form4.Preview;
end;

end.
