unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, StdCtrls;

type
  TForm6 = class(TForm)
    QuickRep1: TQuickRep;
    QRSubDetail1: TQRSubDetail;
    QRSubDetail2: TQRSubDetail;
    GroupHeaderBand2: TQRBand;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    GroupHeaderBand3: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

uses Unit2;

{$R *.dfm}

procedure TForm6.FormCreate(Sender: TObject);
begin
with datamodule2.query1 do {设置数据模块中的query组件}
begin
close;
{使q u e r y组件指向借阅记录表格中所有被预约的记录}
DatabaseName:='work';
DataSource:=datamodule2.RecordDS;
SQL.clear;
datamodule2.query1.SQL.add( 'select BookNo,OrderStu,stuNo FROM bRecord');
SQL.add('WHERE Ordered =True');
Prepare;
Open;
end;
{设置数据模块中的S t u d e n t Table 组件}
with datamodule2.StudentTable do
begin
DatabaseName := 'work';
TableName := 'StuTable.db';
IndexFieldNames := 'StuNo';
MasterFields := 'OrderStu';
MasterSource := datamodule2.QueryDS; {建立S t u d e n t Ta b l e与Q u e r y之间的联系}
end ;
{设置数据模块中的B o o k Table 组件}
with datamodule2.BookTable do
begin
DatabaseName := 'work';
TableName := 'BookTable.db';
IndexFieldNames := 'BookNo';
MasterFields := 'BookNo';
MasterSource := datamodule2.QueryDS; {建立B o o k Ta b l e与Q u e r y之间的联系}
end;
{使Q R D B Te x t 1组件指向Q u e r y 1的' O r d e r S t u '字段}
with QRDBText1 do
begin
DataSet := DataModule2.Query1;
DataField := 'OrderStu';
end;
{使Q R D B Te x t 2组件指向Q u e r y 1的' b o o k n o '字段}
with QRDBText2 do
begin
DataSet := DataModule2.Query1;
DataField := 'bookno';
end;
Datamodule2.StudentTable.Open;
Datamodule2.bookTable.Open;
//quickrep1.preview; {报表预览}
end;


procedure TForm6.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//modalresult:=mrok;
end;

procedure TForm6.Button1Click(Sender: TObject);
begin
quickrep1.preview; {报表预览}
end;

end.
