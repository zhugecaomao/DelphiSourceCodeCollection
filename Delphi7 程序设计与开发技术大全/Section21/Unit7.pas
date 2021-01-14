unit Unit7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, StdCtrls;

type
  TForm7 = class(TForm)
    QuickRep1: TQuickRep;
    QRBand3: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRSubDetail1: TQRSubDetail;
    GroupHeaderBand2: TQRBand;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRSubDetail2: TQRSubDetail;
    GroupHeaderBand3: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText7: TQRDBText;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

uses Unit2;

{$R *.dfm}

procedure TForm7.FormCreate(Sender: TObject);
begin
with datamodule2.query1 do
begin
close;
{设置数据模块中的q u e r y组件}
DatabaseName :='work';
DataSource :=datamodule2.RecordDS;
SQL.clear;
SQL.add('select BookNo,stuno,orderstu,borrowdate,returndate FROM bRecord');
SQL.add ('WHERE delayed = TRUE');
prepare;
open;
end;
{数据模块中的S t u d e n t Table 组件属性设置与生成预约图书报表相同，略。}
with datamodule2.StudentTable do
begin
DatabaseName := 'work';
TableName := 'StuTable.db';
IndexFieldNames := 'StuNo';
MasterFields := 'OrderStu';
MasterSource := datamodule2.QueryDS;
end;
{数据模块中的B o o k Table 组件属性设置与生成预约图书报表相同，略。}
with datamodule2. BookTable do
BEGIN
DatabaseName := 'work';
TableName:='BookTable.db';
IndexFieldNames := 'BookNo';
MasterFields := 'BookNo';
MasterSource := datamodule2.QueryDS;
end;
{使Q R D B Te x t 1组件指向Q u e r y 1的' s t u d e n t n o '字段}
with QRDBText1 do
begin
DataSet := DataModule2.Query1;
DataField :='stuno';
end;
{使Q R D B Te x t 2组件指向Q u e r y 1的' b o o k n o '字段}
with QRDBText2 do
begin
DataSet := DataModule2.Query1;
DataField := 'bookno';
end ;
{使Q R D B Te x t 1 0组件指向Q u e r y 1的' b o r r o w t i m e '字段}
with QRDBText8 do
begin
DataSet := DataModule2.Query1;
DataField := 'borrowDate';
end;
Datamodule2.StudentTable.Open;
Datamodule2.bookTable.Open;
datamodule2.Query1.Close;
end;

procedure TForm7.Button1Click(Sender: TObject);
begin
quickrep1.preview;
end;

end.
