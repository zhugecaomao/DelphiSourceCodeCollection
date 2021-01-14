unit DM_zygl_;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDMzygl = class(TDataModule)
    ADOCzygl: TADOConnection;
    ADOTbab: TADOTable;
    DSbab: TDataSource;
    ADOTbabDSDesigner: TStringField;
    ADOTbabDSDesigner2: TStringField;
    ADOTbabDSDesigner3: TStringField;
    ADOTbabDSDesigner4: TDateTimeField;
    ADOTbabDSDesigner5: TStringField;
    ADOTbabDSDesigner6: TStringField;
    ADOTbabDSDesigner7: TStringField;
    ADOTbabDSDesigner8: TStringField;
    ADOTbabDSDesigner9: TStringField;
    ADOTbabDSDesigner10: TStringField;
    ADOTbabDSDesigner11: TStringField;
    ADOTbabDSDesigner12: TStringField;
    ADOTbabDSDesigner13: TStringField;
    ADOTbabDSDesigner14: TStringField;
    ADOTbabDSDesigner15: TStringField;
    ADOTbabDSDesigner16: TStringField;
    ADOTbabDSDesigner17: TStringField;
    ADOTbabDSDesigner18: TStringField;
    ADOTbabDSDesigner19: TStringField;
    ADOTbabDSDesigner20: TDateTimeField;
    ADOTbabDSDesigner21: TStringField;
    ADOTbabDSDesigner22: TStringField;
    ADOTbabDSDesigner23: TStringField;
    ADOTbabDSDesigner24: TDateTimeField;
    ADOTbabDSDesigner25: TStringField;
    ADOTbabDSDesigner26: TStringField;
    ADOTbabDSDesigner27: TStringField;
    ADOTbab_: TStringField;
    ADOTbabDSDesigner28: TStringField;
    ADOTbabDSDesigner29: TStringField;
    ADOTbabDSDesigner30: TDateTimeField;
    ADOTbabDSDesigner31: TStringField;
    ADOTbabDSDesigner32: TStringField;
    ADOTbabDSDesigner33: TFloatField;
    ADOTmrqdb: TADOTable;
    DSmrqdb: TDataSource;
    ADOTmrqdbDSDesigner: TStringField;
    ADOTmrqdbDSDesigner2: TIntegerField;
    ADOTmrqdbDSDesigner3: TStringField;
    ADOTmrqdbDSDesigner4: TFloatField;
    ADOTmrqdbDSDesigner5: TDateTimeField;
    ADOTxmfymxb: TADOTable;
    DSxmfymxb: TDataSource;
    ADOTxmfymxbDSDesigner: TStringField;
    ADOTxmfymxbDSDesigner2: TFloatField;
    ADOTxmfymxbDSDesigner3: TStringField;
    ADOTxmfymxbDSDesigner4: TStringField;
    ADOQxmfymxb: TADOQuery;
    DSxmfymxbQ: TDataSource;
    ADOQxmfymxbDSDesigner: TStringField;
    ADOQxmfymxbDSDesigner2: TFloatField;
    ADOQxmfymxbDSDesigner3: TStringField;
    ADOQxmfymxbDSDesigner4: TStringField;
    ADOTbabid: TStringField;
    ADOTmrqdbid: TStringField;
    ADOTxmfymxbid: TStringField;
    ADOQxmfymxbid: TStringField;
    ADOQyrqdXG: TADOQuery;
    DSyrqdXG: TDataSource;
    ADOQyrqdXGid: TStringField;
    ADOQyrqdXGDSDesigner: TStringField;
    ADOQyrqdXGDSDesigner2: TIntegerField;
    ADOQyrqdXGDSDesigner3: TStringField;
    ADOQyrqdXGDSDesigner4: TFloatField;
    ADOQyrqdXGDSDesigner5: TDateTimeField;
    DSyrqdXG1: TDataSource;
    ADOQbab_bb: TADOQuery;
    DSbab_bb: TDataSource;
    ADOQbab_bbid: TStringField;
    ADOQbab_bbDSDesigner: TStringField;
    ADOQbab_bbDSDesigner2: TStringField;
    ADOQbab_bbDSDesigner3: TStringField;
    ADOQbab_bbDSDesigner4: TDateTimeField;
    ADOQbab_bbDSDesigner5: TStringField;
    ADOQbab_bbDSDesigner6: TStringField;
    ADOQbab_bbDSDesigner7: TStringField;
    ADOQbab_bbDSDesigner8: TStringField;
    ADOQbab_bbDSDesigner9: TStringField;
    ADOQbab_bbDSDesigner10: TStringField;
    ADOQbab_bbDSDesigner11: TStringField;
    ADOQbab_bbDSDesigner12: TStringField;
    ADOQbab_bbDSDesigner13: TStringField;
    ADOQbab_bbDSDesigner14: TStringField;
    ADOQbab_bbDSDesigner15: TStringField;
    ADOQbab_bbDSDesigner16: TStringField;
    ADOQbab_bbDSDesigner17: TStringField;
    ADOQbab_bbDSDesigner18: TStringField;
    ADOQbab_bbDSDesigner19: TStringField;
    ADOQbab_bbDSDesigner20: TDateTimeField;
    ADOQbab_bbDSDesigner21: TStringField;
    ADOQbab_bbDSDesigner22: TStringField;
    ADOQbab_bbDSDesigner23: TStringField;
    ADOQbab_bbDSDesigner24: TDateTimeField;
    ADOQbab_bbDSDesigner25: TStringField;
    ADOQbab_bbDSDesigner26: TStringField;
    ADOQbab_bbDSDesigner27: TStringField;
    ADOQbab_bb_: TStringField;
    ADOQbab_bbDSDesigner28: TStringField;
    ADOQbab_bbDSDesigner29: TStringField;
    ADOQbab_bbDSDesigner30: TDateTimeField;
    ADOQbab_bbDSDesigner31: TStringField;
    ADOQbab_bbDSDesigner32: TStringField;
    ADOQbab_bbDSDesigner33: TFloatField;
    ADOQyrqd_bb: TADOQuery;
    DSyrqd_bb: TDataSource;
    ADOQyrqd_bbid: TStringField;
    ADOQyrqd_bbDSDesigner: TStringField;
    ADOQyrqd_bbDSDesigner2: TIntegerField;
    ADOQyrqd_bbDSDesigner3: TStringField;
    ADOQyrqd_bbDSDesigner4: TFloatField;
    ADOQyrqd_bbDSDesigner5: TDateTimeField;
    ADOQyrqd_bbField: TStringField;
    ADOTzysf: TADOTable;
    DSzysf: TDataSource;
    ADOTzysfid: TStringField;
    ADOTzysfDSDesigner: TFloatField;
    ADOTzysfDSDesigner2: TDateTimeField;
    ADOTmrqdbDSDesigner6: TStringField;
    ADOQyrqd_bbDSDesigner6: TStringField;
    ADOQyrqdXGDSDesigner6: TStringField;
    ADOQdenglu: TADOQuery;
    DSdenglu: TDataSource;
    ADOQdengluDSDesigner: TStringField;
    ADOQdengluDSDesigner2: TStringField;
    ADOQdengluDSDesigner3: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMzygl: TDMzygl;

implementation

{$R *.dfm}

end.
