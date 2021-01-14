unit C_FjhbPrint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, C_Define;

type
  TFjhbPrintForm = class(TForm)
    QuickRep1: TQuickRep;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    qrlTitle: TQRLabel;
    qrlSub: TQRLabel;
    qrlDwmc: TQRLabel;
    qrlZbr: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    lblDqfj1: TQRLabel;
    QRShape1: TQRShape;
    lblDqfj2: TQRLabel;
    lblDqfj3: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRShape2: TQRShape;
    procedure FormCreate(Sender: TObject);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QuickRep1NeedData(Sender: TObject; var MoreData: Boolean);
  private
    { Private declarations }
    SomeList1: TStringlist;
    SomeList2: TStringlist;
    SomeList3: TStringlist;
    CurrentIndex1: integer;
    CurrentIndex2: integer;
    CurrentIndex3: integer;

  public
    { Public declarations }
  end;

var
  FjhbPrintForm: TFjhbPrintForm;

procedure FjhbPrint;

implementation

uses C_Dtbqj;

{$R *.dfm}
procedure FjhbPrint;
begin
  FjhbPrintForm := TFjhbPrintForm.Create(Application);
  try
    with FjhbPrintForm do
    begin
      qrlTitle.Caption := '今 日 房 价';
      qrlSub.Caption := '日期：'+DateToStr(Date)+' '+DtbqjForm.lblFjze.Caption;
      qrlZbr.Caption := '制表人：'+CZY.CzyXm;
      qrlDwmc.Caption := Hotel_Name;
      QuickRep1.Print;
      //QuickRep1.PreviewModal;
      //QuickRep1.Preview;
    end;
  finally
    FjhbPrintForm.Free;
  end;

end;

procedure TFjhbPrintForm.FormCreate(Sender: TObject);
var
  i1,i2,i3 : Integer;
  s1,s2,s3 : string;
begin
  SomeList1 := TStringList.Create;
  SomeList2 := TStringList.Create;
  SomeList3 := TStringList.Create;
  with DtbqjForm do
  begin
    qryWork.DisableControls;
    qryWork.First;
    s1 := '';s2 := '';s3 := '';
    i1 := 1;i2 := 1;i3 := 1;
    while not qryWork.Eof do
    begin
      //当前房价
      if qryWorkD_SJFJ.Value>0 then
      begin
        s1 := s1+qryWorkD_KFBH.Value+'('+qryWorkD_SJFJ.AsString+')   ';
        Inc(i1);
      end;
      if i1>4 then
      begin
        SomeList1.Add(s1);
        s1 := '';
        i1 := 1;
      end;
      //全价
      if qryWorkD_QJ.Value<>'' then
      begin
        s2 := s2+qryWorkD_KFBH.Value+'('+qryWorkD_QJ.AsString+') ';
        Inc(i2);
      end;
      if i2>1 then
      begin
        SomeList2.Add(s2);
        s2 := '';
        i2 := 1;
      end;
      //半价
      if qryWorkD_BJ.Value<>'' then
      begin
        s3 := s3+qryWorkD_KFBH.Value+'('+qryWorkD_BJ.AsString+') ';
        Inc(i3);
      end;
      if i3>1 then
      begin
        SomeList3.Add(s3);
        s3 := '';
        i3 := 1;
      end;

      qryWork.Next;
    end;
    qryWork.EnableControls;
  end;
end;

procedure TFjhbPrintForm.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  CurrentIndex1 := 0;
  CurrentIndex2 := 0;
  CurrentIndex3 := 0;
end;

procedure TFjhbPrintForm.QuickRep1NeedData(Sender: TObject;
  var MoreData: Boolean);
begin
  MoreData := (CurrentIndex1 < SomeList1.Count)or(CurrentIndex2 < SomeList2.Count)or(CurrentIndex3 < SomeList3.Count);

  if MoreData then
  begin
    lblDqfj1.Caption := '';
    lblDqfj2.Caption := '';
    lblDqfj3.Caption := '';
    if CurrentIndex1 < SomeList1.Count then
      lblDqfj1.Caption := SomeList1[CurrentIndex1];
    if CurrentIndex2 < SomeList2.Count then
      lblDqfj2.Caption := SomeList2[CurrentIndex2];
    if CurrentIndex3 < SomeList3.Count then
      lblDqfj3.Caption := SomeList3[CurrentIndex3];
  end;

  Inc(CurrentIndex1);
  Inc(CurrentIndex2);
  Inc(CurrentIndex3);
end;

end.
