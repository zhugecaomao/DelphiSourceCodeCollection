unit uDM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  TDM = class(TDataModule)
    DB: TDatabase;
    Q_T1020: TQuery;
    Q_T1100: TQuery;
    Q_T1050: TQuery;
    Q_T1060: TQuery;
    Q_T1080: TQuery;
    Q_T1010: TQuery;
    Q_T1090: TQuery;
    Q_T1030: TQuery;
    Query1: TQuery;
    Q_T1070: TQuery;
    Q_T1020F01: TStringField;
    Q_T1020F02: TStringField;
    Q_T1020F03: TStringField;
    Q_SysParam: TQuery;
    Q_SysParamF01: TStringField;
    Q_SysParamF02: TStringField;
    Q_SysParamF03: TStringField;
    Q_SysParamF04: TStringField;
    Q_SysParamF05: TStringField;
    Q_SysParamF06: TStringField;
    Q_SysParamF07: TStringField;
    Q_SysParamF08: TStringField;
    Q_SysParamF09: TStringField;
    Q_SysParamF10: TStringField;
    Q_SysParamF11: TStringField;
    Q_SysParamF12: TStringField;
    Q_SysParamF13: TStringField;
    Q_SysParamF14: TStringField;
    Q_SysParamF15: TStringField;
    Q_SysParamF16: TStringField;
    Q_SysParamF17: TStringField;
    Q_SysParamF18: TStringField;
    Q_SysParamF20: TSmallintField;
    Q_SysParamF21: TStringField;
    Q_SysParamF22: TStringField;
    Q_SysParamF23: TFloatField;
    Q_SysParamBUSER: TStringField;
    Q_SysParamBTIME: TDateTimeField;
    Q_SysParamEUSER: TStringField;
    Q_SysParamETIME: TDateTimeField;
    Q_T5010: TQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    Q_T1011: TQuery;
    Q_T1010F01: TStringField;
    Q_T1010F02: TStringField;
    Q_T1010F03: TStringField;
    Q_T2010: TQuery;
    Q_T2010F01: TStringField;
    Q_T2010F12: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.DFM}



end.
