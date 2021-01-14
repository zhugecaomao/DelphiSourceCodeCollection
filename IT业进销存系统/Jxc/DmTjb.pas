unit DmTjb;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBClient, MConnect;

type
  TDataTjb = class(TDataModule)
    HP: TClientDataSet;
    KhXsHz: TClientDataSet;
    ClientDataSet2: TClientDataSet;
    HPID: TIntegerField;
    HPBH: TWideStringField;
    HPPM: TWideStringField;
    HPDW: TWideStringField;
    GYS: TClientDataSet;
    IntegerField1: TIntegerField;
    KH: TClientDataSet;
    IntegerField2: TIntegerField;
    KHBH: TWideStringField;
    KHMC: TWideStringField;
    GYSBH: TWideStringField;
    GYSMC: TWideStringField;
    YW: TClientDataSet;
    YWY: TWideStringField;
    KhXsHzID: TIntegerField;
    KhXsHzBH: TWideStringField;
    KhXsHzMC: TWideStringField;
    SlDjJe: TClientDataSet;
    SlDjJeSL: TFloatField;
    SlDjJeDJ: TFloatField;
    SlDjJeJE: TFloatField;
    KhXsHzJE: TFloatField;
    KhXsHzJE2: TFloatField;
    KhXsHzJE3: TFloatField;
    KhXsMx: TClientDataSet;
    KhXsMxDJBH: TWideStringField;
    KhXsMxRQ: TDateField;
    KhXsMxBH: TWideStringField;
    KhXsMxPM: TWideStringField;
    KhXsMxDW: TWideStringField;
    KhXsMxJEA: TFloatField;
    KhXsMxJEB: TFloatField;
    KhXsMxJEC: TFloatField;
    KhXsMxSL: TFloatField;
    KhXsMxDJ: TFloatField;
    SlDjJeDJ2: TFloatField;
    KhXsMxNSL: TFloatField;
    KhXsMxZBID: TIntegerField;
    KhXsHzcMC: TStringField;
    HpXsHz: TClientDataSet;
    IntegerField3: TIntegerField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    StringField1: TStringField;
    HpXsMx: TClientDataSet;
    IntegerField4: TIntegerField;
    DateField1: TDateField;
    WideStringField3: TWideStringField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    HpXsHzBH: TWideStringField;
    HpXsHzPM: TWideStringField;
    HpXsHzDW: TWideStringField;
    HpXsHzSL: TFloatField;
    HpXsMxBH: TWideStringField;
    HpXsMxMC: TWideStringField;
    YwyXsHz: TClientDataSet;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    FloatField13: TFloatField;
    StringField2: TStringField;
    YwyXsMx: TClientDataSet;
    IntegerField6: TIntegerField;
    DateField2: TDateField;
    WideStringField5: TWideStringField;
    WideStringField6: TWideStringField;
    WideStringField7: TWideStringField;
    FloatField17: TFloatField;
    FloatField18: TFloatField;
    FloatField19: TFloatField;
    YwyXsHzYWY: TWideStringField;
    DqXsHz: TClientDataSet;
    WideStringField1: TWideStringField;
    FloatField10: TFloatField;
    FloatField14: TFloatField;
    FloatField15: TFloatField;
    StringField3: TStringField;
    DqXsMx: TClientDataSet;
    IntegerField5: TIntegerField;
    DateField3: TDateField;
    WideStringField2: TWideStringField;
    WideStringField4: TWideStringField;
    WideStringField8: TWideStringField;
    FloatField16: TFloatField;
    FloatField20: TFloatField;
    FloatField21: TFloatField;
    sKhXsHz: TDataSource;
    sKhXsMx: TDataSource;
    sHpXsHz: TDataSource;
    sHpXsMx: TDataSource;
    sYwyXsHz: TDataSource;
    sYwyXsMx: TDataSource;
    sDqXsHz: TDataSource;
    sDqXsMx: TDataSource;
    DataSource1: TDataSource;
    procedure NSLGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure CalcFields_MC(DataSet: TDataSet);
    procedure CalcFields_PM(DataSet: TDataSet);
    procedure CalcFields_YWY(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataTjb: TDataTjb;

implementation

uses Dm;

{$R *.DFM}

//税率
procedure TDataTjb.NSLGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  Text := Sender.AsString + '%';
end;

//Set cMC (用于分析图)
procedure TDataTjb.CalcFields_MC(DataSet: TDataSet);
begin
  DataSet['cMC'] := DataSet['MC'];
end;

procedure TDataTjb.CalcFields_PM(DataSet: TDataSet);
begin
  DataSet['cPM'] := DataSet['PM'];
end;

procedure TDataTjb.CalcFields_YWY(DataSet: TDataSet);
begin
  DataSet['cYWY'] := DataSet['YWY'];
end;

end.
