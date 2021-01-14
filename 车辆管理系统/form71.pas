unit form71;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, StdCtrls, Buttons, ExtCtrls, DBCtrls, Mask;

type
  Tform7_1 = class(TForm)
    GroupBox1: TGroupBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBComboBox1: TDBComboBox;
    DBComboBox2: TDBComboBox;
    DBEdit4: TDBEdit;
    DBComboBox3: TDBComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBNavigator1: TDBNavigator;
    BitBtn1: TBitBtn;
    Table1: TTable;
    DataSource1: TDataSource;
    Label8: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form7_1: Tform7_1;

implementation

{$R *.dfm}

procedure Tform7_1.BitBtn1Click(Sender: TObject);
begin
close;
end;

procedure Tform7_1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
table1.close;
action:=cafree;

end;

procedure Tform7_1.FormShow(Sender: TObject);
begin
table1.Open;
end;

end.
