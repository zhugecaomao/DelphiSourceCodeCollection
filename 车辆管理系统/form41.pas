unit form41;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, DB, DBTables, Buttons, ExtCtrls;

type
    TForm4_1 = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Table1: TTable;
    DataSource1: TDataSource;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
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
    DBEdit6: TDBEdit;
    Label10: TLabel;
    DBComboBox1: TDBComboBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4_1: TForm4_1;

implementation

{$R *.dfm}

procedure TForm4_1.BitBtn1Click(Sender: TObject);
begin
Close;

end;

procedure TForm4_1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
table1.close;
action:=cafree;

end;

procedure TForm4_1.FormShow(Sender: TObject);
begin
table1.Open;
end;

end.
