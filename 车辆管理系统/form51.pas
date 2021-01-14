unit form51;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, DB, DBTables, Buttons, ExtCtrls;

type
  TForm5_1 = class(TForm)
    Label1: TLabel;
    GroupBox1: TGroupBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBMemo1: TDBMemo;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBNavigator1: TDBNavigator;
    BitBtn1: TBitBtn;
    Table1: TTable;
    DataSource1: TDataSource;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5_1: TForm5_1;

implementation

{$R *.dfm}

procedure TForm5_1.BitBtn1Click(Sender: TObject);
begin
close;
end;

procedure TForm5_1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
table1.close;
action:=cafree;

end;

procedure TForm5_1.FormShow(Sender: TObject);
begin
table1.Open;
end;

end.
