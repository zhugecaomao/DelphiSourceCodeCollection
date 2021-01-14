unit qsbg_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, ExtCtrls, Mask, ComCtrls, TabNotBk,
  DB, DBTables;

type
  Tqsbg = class(TForm)
    DataSource1: TDataSource;
    Table1: TTable;
    Database1: TDatabase;
    Table1BDEDesigner: TStringField;
    Table1BDEDesigner2: TStringField;
    Table1BDEDesigner3: TStringField;
    Table1BDEDesigner4: TStringField;
    Table1BDEDesigner5: TDateTimeField;
    Table1BDEDesigner6: TStringField;
    Table1BDEDesigner7: TStringField;
    Table1BDEDesigner8: TStringField;
    Table1BDEDesigner9: TStringField;
    Table1BDEDesigner10: TDateTimeField;
    Table1BDEDesigner11: TStringField;
    Label12: TLabel;
    Table3: TTable;
    Table3qsbg: TIntegerField;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    Panel1: TPanel;
    DBNavigator1: TDBNavigator;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    TabSheet2: TTabSheet;
    procedure Table1AfterInsert(DataSet: TDataSet);
    procedure Table1AfterCancel(DataSet: TDataSet);
    procedure Table1AfterPost(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  qsbg: Tqsbg;

implementation

{$R *.dfm}

procedure Tqsbg.Table1AfterInsert(DataSet: TDataSet);
var
  i:integer;
begin
   table3.Open;
   table3.Edit;
   i:=table3.FieldValues['qsbg']+1;
   table3.FieldValues['qsbg']:=i;
   table1.FieldValues['编号']:=formatfloat('500000',i);
   table1.FieldValues['建档日期']:=datetostr(now);
   table1.FieldValues['建档人']:='';
   dbedit2.SetFocus;
end;

procedure Tqsbg.Table1AfterCancel(DataSet: TDataSet);
begin
   table3.Cancel;
end;

procedure Tqsbg.Table1AfterPost(DataSet: TDataSet);
begin
   table3.Post;
end;

procedure Tqsbg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   qsbg.Destroy;
end;

procedure Tqsbg.BitBtn2Click(Sender: TObject);
begin
  close;
end;

end.
