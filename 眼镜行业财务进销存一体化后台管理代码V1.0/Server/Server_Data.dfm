object Easy_Dcom_Server: TEasy_Dcom_Server
  OldCreateOrder = False
  Left = 6
  Top = 31
  Height = 575
  Width = 800
  object ADOQuery_Server: TADOQuery
    Connection = frm_Chain_Data.ADO_Connection
    Parameters = <>
    Left = 48
    Top = 8
  end
  object DataSetProvider_Server: TDataSetProvider
    DataSet = ADOQuery_Server
    Constraints = True
    ResolveToDataSet = True
    Options = [poAllowCommandText]
    Left = 42
    Top = 64
  end
  object Ado_Temp: TADOStoredProc
    Connection = frm_Chain_Data.ADO_Connection
    CursorType = ctStatic
    Filtered = True
    ProcedureName = 'SP_Company;1'
    Parameters = <>
    Prepared = True
    Left = 160
    Top = 8
  end
  object Data_Temp: TDataSetProvider
    DataSet = Ado_Temp
    Constraints = True
    Left = 248
    Top = 8
  end
  object DataSetProvider_Store_Prodc: TDataSetProvider
    DataSet = Ado_Temp
    Constraints = True
    ResolveToDataSet = True
    Options = [poFetchBlobsOnDemand, poIncFieldProps, poAllowCommandText]
    Left = 242
    Top = 64
  end
  object Stored_Sp_Part_set: TADOStoredProc
    Connection = frm_Chain_Data.ADO_Connection
    CursorType = ctStatic
    Filtered = True
    ProcedureName = 'SP_Part_Set;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end>
    Prepared = True
    Left = 48
    Top = 136
  end
  object Data_Sp_Part_set: TDataSetProvider
    DataSet = Stored_Sp_Part_set
    Constraints = True
    ResolveToDataSet = True
    Options = [poFetchBlobsOnDemand, poIncFieldProps, poAllowCommandText]
    Left = 50
    Top = 184
  end
  object Aquery: TADOQuery
    Connection = frm_Chain_Data.ADO_Connection
    Parameters = <>
    Left = 16
    Top = 256
  end
  object dspquery: TDataSetProvider
    DataSet = Aquery
    Constraints = True
    Left = 16
    Top = 312
  end
  object aqmain: TADOQuery
    Connection = frm_Chain_Data.ADO_Connection
    Parameters = <>
    Left = 64
    Top = 256
  end
  object Aqmain1: TADOQuery
    Connection = frm_Chain_Data.ADO_Connection
    Parameters = <>
    Left = 120
    Top = 256
  end
  object Aqmain3: TADOQuery
    Connection = frm_Chain_Data.ADO_Connection
    Parameters = <>
    Left = 176
    Top = 262
  end
  object AStock_contract: TADOQuery
    Connection = frm_Chain_Data.ADO_Connection
    Parameters = <>
    SQL.Strings = (
      'select * from Stock_contract where 1=2')
    Left = 368
    Top = 80
  end
  object AReceipt: TADOQuery
    Connection = frm_Chain_Data.ADO_Connection
    Parameters = <
      item
        Name = 'NO'
        DataType = ftString
        Size = -1
        Value = ''
      end
      item
        Name = 'Name'
        DataType = ftString
        Size = -1
        Value = ''
      end>
    SQL.Strings = (
      'select * from Receipt where 1=2')
    Left = 216
    Top = 136
  end
  object AStock_contract_detail: TADOQuery
    Connection = frm_Chain_Data.ADO_Connection
    Parameters = <>
    SQL.Strings = (
      'select * from Stock_contract_detail where 1=2')
    Left = 408
    Top = 192
  end
  object dspStock_contract: TDataSetProvider
    DataSet = AStock_contract
    Constraints = True
    Left = 400
    Top = 16
  end
  object dspReceipt: TDataSetProvider
    DataSet = AReceipt
    Constraints = True
    Left = 272
    Top = 136
  end
  object dspStock_contract_detail: TDataSetProvider
    DataSet = AStock_contract_detail
    Constraints = True
    Left = 408
    Top = 240
  end
  object DspSQL: TDataSetProvider
    DataSet = Aqmain1
    Constraints = True
    Left = 120
    Top = 312
  end
  object aquery2: TADOQuery
    Connection = frm_Chain_Data.ADO_Connection
    Parameters = <>
    Left = 24
    Top = 376
  end
  object dspquery2: TDataSetProvider
    DataSet = aquery2
    Constraints = True
    Left = 24
    Top = 432
  end
  object AStock_Write: TADOQuery
    Connection = frm_Chain_Data.ADO_Connection
    Parameters = <>
    SQL.Strings = (
      'select * from [Stock_Write] where 1=2')
    Left = 352
    Top = 291
  end
  object AStock_Write_detail: TADOQuery
    Connection = frm_Chain_Data.ADO_Connection
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM [Stock_Write_detail] where 1=2')
    Left = 256
    Top = 291
  end
  object dspStock_Write: TDataSetProvider
    DataSet = AStock_Write
    Constraints = True
    Left = 352
    Top = 339
  end
  object dspStock_Write_detail: TDataSetProvider
    DataSet = AStock_Write_detail
    Constraints = True
    Left = 256
    Top = 339
  end
  object AStock_States: TADOQuery
    Connection = frm_Chain_Data.ADO_Connection
    Parameters = <>
    SQL.Strings = (
      'select * from [Stock_States] where 1=2')
    Left = 440
    Top = 291
  end
  object dspStock_States: TDataSetProvider
    DataSet = AStock_States
    Constraints = True
    Left = 440
    Top = 339
  end
  object AStock_Jion: TADOQuery
    Connection = frm_Chain_Data.ADO_Connection
    Parameters = <>
    SQL.Strings = (
      'select * from [Stock_Jion] where 1=2')
    Left = 527
    Top = 291
  end
  object dspStock_Jion: TDataSetProvider
    DataSet = AStock_Jion
    Constraints = True
    Left = 527
    Top = 339
  end
  object AQuality_Check: TADOQuery
    Connection = frm_Chain_Data.ADO_Connection
    Parameters = <>
    SQL.Strings = (
      'select * from [Quality_Check] where 1=2')
    Left = 613
    Top = 291
  end
  object dspQuality_Check: TDataSetProvider
    DataSet = AQuality_Check
    Constraints = True
    Left = 613
    Top = 339
  end
  object AQuality_Check_detail: TADOQuery
    Connection = frm_Chain_Data.ADO_Connection
    Parameters = <>
    SQL.Strings = (
      'select * from [Quality_Check_detail] where 1=2')
    Left = 517
    Top = 128
  end
  object dspQuality_Check_detail: TDataSetProvider
    DataSet = AQuality_Check_detail
    Constraints = True
    Left = 509
    Top = 184
  end
  object ACancel_strip: TADOQuery
    Connection = frm_Chain_Data.ADO_Connection
    Parameters = <>
    SQL.Strings = (
      'select * from [Cancel_strip] where 1=2')
    Left = 517
    Top = 16
  end
  object dspCancel_strip: TDataSetProvider
    DataSet = ACancel_strip
    Constraints = True
    Left = 517
    Top = 64
  end
  object aCanceldetail: TADOQuery
    Connection = frm_Chain_Data.ADO_Connection
    Parameters = <>
    SQL.Strings = (
      'select * from Cancel_strip_detail where 1=2')
    Left = 608
    Top = 16
  end
  object dspCanceldetail: TDataSetProvider
    DataSet = aCanceldetail
    Constraints = True
    Left = 608
    Top = 64
  end
  object astockdetail: TADOQuery
    Connection = frm_Chain_Data.ADO_Connection
    Parameters = <>
    SQL.Strings = (
      'select * from stock_jion_detail where 1=2')
    Left = 640
    Top = 128
  end
  object dspstockdetail: TDataSetProvider
    DataSet = astockdetail
    Constraints = True
    Left = 640
    Top = 184
  end
  object apronal: TADOQuery
    Connection = frm_Chain_Data.ADO_Connection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'p_no'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = ''
      end>
    SQL.Strings = (
      'select * from dp_person where p_no=:p_no ')
    Left = 128
    Top = 376
  end
  object dsppornal: TDataSetProvider
    DataSet = apronal
    Constraints = True
    Left = 128
    Top = 424
  end
  object aqpart: TADOQuery
    Connection = frm_Chain_Data.ADO_Connection
    Parameters = <
      item
        Name = 'no'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = ''
      end>
    SQL.Strings = (
      'select * from part where part_no=:no')
    Left = 208
    Top = 400
  end
  object dsppart: TDataSetProvider
    DataSet = aqpart
    Constraints = True
    Left = 208
    Top = 416
  end
  object aqmain4: TADOQuery
    Connection = frm_Chain_Data.ADO_Connection
    Parameters = <>
    Left = 176
    Top = 200
  end
  object AGoods_Requirement: TADOQuery
    Connection = frm_Chain_Data.ADO_Connection
    Parameters = <>
    SQL.Strings = (
      'select * from [Goods_Requirement] where 1=2')
    Left = 298
    Top = 387
  end
  object DSPGoods_Requirement: TDataSetProvider
    DataSet = AGoods_Requirement
    Constraints = True
    Left = 298
    Top = 395
  end
  object AGoods_Requirement_Detail: TADOQuery
    Connection = frm_Chain_Data.ADO_Connection
    Parameters = <>
    SQL.Strings = (
      'select * from [Goods_Requirement_Detail] where 1=2')
    Left = 426
    Top = 390
  end
  object DSPGoods_Requirement_Detail: TDataSetProvider
    DataSet = AGoods_Requirement_Detail
    Constraints = True
    Left = 426
    Top = 398
  end
  object PubStoredProc: TADOStoredProc
    Connection = frm_Chain_Data.ADO_Connection
    EnableBCD = False
    Parameters = <>
    Left = 720
    Top = 344
  end
  object CdsDetail: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    Params = <>
    Left = 648
    Top = 448
  end
  object CdsMaster: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    Params = <>
    Left = 648
    Top = 400
  end
  object PubProvider: TDataSetProvider
    DataSet = PubQuery
    Constraints = True
    ResolveToDataSet = True
    Options = [poAllowCommandText]
    Left = 712
    Top = 424
  end
  object PubQuery: TADOQuery
    CacheSize = 150
    Connection = frm_Chain_Data.ADO_Connection
    EnableBCD = False
    Parameters = <>
    Left = 704
    Top = 392
  end
  object AcomponyInfo: TADOQuery
    Connection = frm_Chain_Data.ADO_Connection
    Parameters = <>
    SQL.Strings = (
      'select * from HeadOffice')
    Left = 280
    Top = 192
  end
  object dspcompInfo: TDataSetProvider
    DataSet = AcomponyInfo
    Constraints = True
    Left = 280
    Top = 200
  end
end
