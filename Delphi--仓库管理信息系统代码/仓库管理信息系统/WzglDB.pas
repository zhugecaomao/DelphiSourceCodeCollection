unit WzglDB;

interface

uses
  SysUtils, Classes, DB, DBClient, MConnect, SConnect,dialogs;

type
  TDM = class(TDataModule)
    CDS_QXGL_YHSZ: TClientDataSet;
    CDS_QXGL_ZHSZ: TClientDataSet;
    CDS_QXGL_ZHNR: TClientDataSet;
    CDS_QXGL_ZHSZCDSDesigner: TStringField;
    CDS_QXGL_ZHSZCDSDesigner2: TStringField;
    CDS_QXGL_ZHSZCDSDesigner3: TStringField;
    CDS_QXGL_ZHSZQ_QXGL_ZHNR: TDataSetField;
    CDS_QXGL_ZHSZ_INDEX: TClientDataSet;
    CDS_QXGL_ZHNR_INDEX: TClientDataSet;
    CDS_QXGL_YHSZ_INDEX: TClientDataSet;
    CDS_ZGDA: TClientDataSet;
    CDS_BMDA: TClientDataSet;
    CDS_DQFLB: TClientDataSet;
    CDS_GYSFLB: TClientDataSet;
    CDS_GYSDA: TClientDataSet;
    CDS_DQFLB_INDEX: TClientDataSet;
    CDS_GYSFLB_INDEX: TClientDataSet;
    CDS_GYSDA_INDEX: TClientDataSet;
    CDS_ZGDA_INDEX: TClientDataSet;
    CDS_BMDA_INDEX: TClientDataSet;
    CDS_CLSLD_CX: TClientDataSet;
    CDS_CLSLD: TClientDataSet;
    CDS_CLSLD_DETAIL: TClientDataSet;
    CDS_CLBM_INDEX: TClientDataSet;
    CDS_CLBM_TEMP_INDEX: TClientDataSet;
    CDS_CKXX_INDEX: TClientDataSet;
    CDS_CKXX: TClientDataSet;
    CDS_CKXXCDSDesigner: TStringField;
    CDS_CKXXCDSDesigner2: TStringField;
    CDS_CKXXCDSDesigner3: TStringField;
    CDS_CKXXCDSDesigner4: TStringField;
    CDS_CKXXCDSDesigner5: TStringField;
    CDS_CLSLD_INDEX: TClientDataSet;
    CDS_CLSLD_DETAIL_INDEX: TClientDataSet;
    CDS_BMLLD: TClientDataSet;
    CDS_BMLLD_DETAIL: TClientDataSet;
    CDS_BMLLD_DETAIL_INDEX: TClientDataSet;
    CDS_BMLLD_CX: TClientDataSet;
    CDS_BMLLDCDSDesigner: TStringField;
    CDS_BMLLDCDSDesigner2: TStringField;
    CDS_BMLLDCDSDesigner3: TStringField;
    CDS_BMLLDCDSDesigner4: TDateTimeField;
    CDS_BMLLDCDSDesigner5: TStringField;
    CDS_BMLLDCDSDesigner6: TStringField;
    CDS_BMLLDCDSDesigner7: TStringField;
    CDS_BMLLDCDSDesigner8: TStringField;
    CDS_BMLLDCDSDesigner9: TStringField;
    CDS_BMLLDCDSDesigner10: TStringField;
    CDS_BMLLDCDSDesigner11: TStringField;
    CDS_BMLLDCDSDesigner12: TStringField;
    CDS_BMLLDCDSDesigner13: TBooleanField;
    CDS_BMLLDCDSDesigner14: TDateTimeField;
    CDS_BMLLDQ_BMLLD_DETAIL: TDataSetField;
    CDS_BMLLD_INDEX: TClientDataSet;
    CDS_GCXMDY: TClientDataSet;
    CDS_GCXMDY_INDEX: TClientDataSet;
    CDS_KC: TClientDataSet;
    CDS_CLSLDCDSDesigner: TStringField;
    CDS_CLSLDCDSDesigner2: TStringField;
    CDS_CLSLDCDSDesigner3: TDateTimeField;
    CDS_CLSLDCDSDesigner4: TStringField;
    CDS_CLSLDCDSDesigner5: TStringField;
    CDS_CLSLDCDSDesigner6: TStringField;
    CDS_CLSLDCDSDesigner7: TStringField;
    CDS_CLSLDCDSDesigner8: TFloatField;
    CDS_CLSLDCDSDesigner9: TFloatField;
    CDS_CLSLDCDSDesigner10: TStringField;
    CDS_CLSLDCDSDesigner11: TStringField;
    CDS_CLSLDCDSDesigner12: TStringField;
    CDS_CLSLDCDSDesigner13: TStringField;
    CDS_CLSLDCDSDesigner14: TStringField;
    CDS_CLSLDCDSDesigner15: TBooleanField;
    CDS_CLSLDCDSDesigner16: TDateTimeField;
    CDS_CLSLDCDSDesigner17: TStringField;
    CDS_CLSLDQ_CLSLD_DETAIL: TDataSetField;
    CDS_CLSLD_DETAILID: TAutoIncField;
    CDS_CLSLD_DETAILCDSDesigner: TStringField;
    CDS_CLSLD_DETAILCDSDesigner2: TStringField;
    CDS_CLSLD_DETAILCDSDesigner3: TStringField;
    CDS_CLSLD_DETAILCDSDesigner4: TFloatField;
    CDS_CLSLD_DETAILCDSDesigner5: TFloatField;
    CDS_CLSLD_DETAILCDSDesigner6: TFloatField;
    CDS_CLSLD_DETAILCDSDesigner7: TStringField;
    CDS_CLSLD_DETAILCDSDesigner8: TStringField;
    CDS_CLSLD_DETAILCDSDesigner9: TStringField;
    CDS_CLSLD_DETAILCDSDesigner10: TCurrencyField;
    CDS_CLSLD_DETAILCDSDesigner11: TStringField;
    CDS_CLSLD_DETAILField: TFloatField;
    procedure CDS_CLSLD_DETAILCalcFields(DataSet: TDataSet);
    procedure CDS_CLSLDReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

uses main;

{$R *.dfm}

procedure TDM.CDS_CLSLD_DETAILCalcFields(DataSet: TDataSet);
begin
  CDS_CLSLD_DETAIL.FieldByName('入库总价').value := CDS_CLSLD_DETAIL.fieldbyname('实收数量').asfloat * CDS_CLSLD_DETAIL.fieldbyname('入库单价').asfloat;
end;

procedure TDM.CDS_CLSLDReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  showMessage(e.Message );
end;

end.
