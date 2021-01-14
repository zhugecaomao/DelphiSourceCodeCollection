unit form62;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DBCtrls, DB, DBTables, Grids,
  DBGrids;

type
  Tform6_2 = class(TForm)
    Label1: TLabel;
    DBGrid1: TDBGrid;
    DBMemo1: TDBMemo;
    Table1: TTable;
    DataSource1: TDataSource;
    Label2: TLabel;
    DBNavigator1: TDBNavigator;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form6_2: Tform6_2;

implementation

uses report;

{$R *.dfm}

procedure Tform6_2.BitBtn2Click(Sender: TObject);
begin
close;
end;

procedure Tform6_2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
table1.close;
action:=cafree;
end;

procedure Tform6_2.FormShow(Sender: TObject);
begin
table1.open;

end;

procedure Tform6_2.BitBtn1Click(Sender: TObject);
begin
application.CreateForm(treportform,reportform);
reportform.Q_form6.Preview;
end;

end.
