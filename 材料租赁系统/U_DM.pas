unit U_DM;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADO_BMBMK: TADOTable;
    ADO_CLJXB: TADOTable;
    ADO_DWINFO: TADOTable;
    ADO_SPBMK: TADOTable;
    ADO_VW_SFDJ: TADOTable;
    ADO_VW_DJMX_Y: TADOTable;
    DS_BMBMK: TDataSource;
    DS_CLJXB: TDataSource;
    DS_DWINFO: TDataSource;
    DS_SPBMK: TDataSource;
    DS_VW_SFDJ: TDataSource;
    DS_VW_DJMX_Y: TDataSource;
    ADO_USESZ: TADOTable;
    DS_USESZ: TDataSource;
    ADO_TBTMP: TADOTable;
    DS_TBTMP: TDataSource;
    ADO_SFDJ: TADOTable;
    ADO_TBTMPseri: TSmallintField;
    ADO_TBTMPsfno: TWideStringField;
    ADO_TBTMPCl_0: TFloatField;
    ADO_TBTMPcl_1: TFloatField;
    ADO_TBTMPcl_2: TFloatField;
    ADO_TBTMPcl_3: TFloatField;
    ADO_TBTMPcl_4: TFloatField;
    ADO_TBTMPcl_5: TFloatField;
    ADO_TBTMPcl_6: TFloatField;
    ADO_TBTMPcl_7: TFloatField;
    ADO_TBTMPcl_8: TFloatField;
    ADO_TBTMPcl_9: TFloatField;
    ADO_TBTMPclTal: TFloatField;
    ADO_GGXHB: TADOTable;
    DS_GGXHB: TDataSource;
    ADO_GGXHBsfno: TWideStringField;
    ADO_GGXHBspbh: TWideStringField;
    ADO_GGXHBfields: TWideStringField;
    ADO_GGXHBlong: TFloatField;
    ADO_GGXHBweith: TFloatField;
    ADO_GGXHBhight: TFloatField;
    ADO_GGXHBtotal: TFloatField;
    ADO_GGXHBnumber: TFloatField;
    ADO_CLJXBsdate: TDateTimeField;
    ADO_CLJXBbmbh: TWideStringField;
    ADO_CLJXBspbh: TWideStringField;
    ADO_CLJXBspmc: TWideStringField;
    ADO_CLJXBspdj: TBCDField;
    ADO_CLJXBjldw: TWideStringField;
    ADO_CLJXBzlts: TIntegerField;
    ADO_CLJXBmoney: TFloatField;
    ADO_CLJXBynsf: TBooleanField;
    ADO_CLJXBynqc: TBooleanField;
    ADO_SPBMK_INDEX: TADOTable;
    DS_SPBMK_INDEX: TDataSource;
    ADO_TBTMPynsf: TBooleanField;
    ADO_GGXHBbz: TWideStringField;
    ADO_CLJXBsfno: TWideStringField;
    ADO_CLJXBynjs: TBooleanField;
    ADO_CLJXByntz: TBooleanField;
    ADO_CLJXBfcsl: TFloatField;
    ADO_CLJXBhssl: TFloatField;
    ADO_CLJXBjsje: TFloatField;
    ADO_GGXHBseri: TSmallintField;
    ADO_SPBMKspbh: TWideStringField;
    ADO_SPBMKspmc: TWideStringField;
    ADO_SPBMKggxh: TWideStringField;
    ADO_SPBMKspdj: TBCDField;
    ADO_SPBMKjldw: TWideStringField;
    ADO_SPBMKbz: TWideStringField;
    ADO_SPBMKjldw2: TWideStringField;
    ADO_SPBMKhsbl: TFloatField;
    ADO_SPBMKtzcl: TBooleanField;
    ADO_CLJX: TADOTable;
    DS_CLJX: TDataSource;
    procedure ADO_TBTMPCalcFields(DataSet: TDataSet);
    procedure ADO_GGXHBCalcFields(DataSet: TDataSet);
    procedure ADO_CLJXBCalcFields(DataSet: TDataSet);
    procedure ADO_GGXHBAfterPost(DataSet: TDataSet);
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

procedure TDM.ADO_TBTMPCalcFields(DataSet: TDataSet);
begin
ADO_TBTMPclTal.Value := ADO_TBTMPCl_0.Value+ADO_TBTMPCl_1.Value+ADO_TBTMPCl_2.Value
                        +ADO_TBTMPCl_3.Value+ADO_TBTMPCl_4.Value+ADO_TBTMPCl_5.Value
                        +ADO_TBTMPCl_6.Value+ADO_TBTMPCl_7.Value+ADO_TBTMPCl_8.Value
                        +ADO_TBTMPCl_9.Value ;
end;

procedure TDM.ADO_GGXHBCalcFields(DataSet: TDataSet);
begin
ADO_GGXHBtotal.Value :=ADO_GGXHBlong.Value *
                       ADO_GGXHBweith.Value *
                       ADO_GGXHBnumber.Value;
end;

procedure TDM.ADO_CLJXBCalcFields(DataSet: TDataSet);
begin
 ADO_CLJXBmoney.Value := ADO_CLJXBFCsl.Value
                        * ADO_CLJXBzlts.Value
                        * ADO_CLJXBspdj.Value ;
end;

procedure TDM.ADO_GGXHBAfterPost(DataSet: TDataSet);
begin
//ado_ggxhb.Active :=false;
//ado_ggxhb.Active :=true;
end;

end.
