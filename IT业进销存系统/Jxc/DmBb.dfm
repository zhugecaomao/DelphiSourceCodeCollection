object DataBb: TDataBb
  OldCreateOrder = False
  Left = 270
  Top = 122
  Height = 483
  Width = 762
  object KhXsHz: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pKhXsHz'
    RemoteServer = Data.CnBb
    OnCalcFields = CalcFields_MC
    Left = 6
    Top = 2
    object KhXsHzID: TIntegerField
      Tag = 1
      FieldName = 'ID'
    end
    object KhXsHzBH: TWideStringField
      DisplayLabel = #23458#25143#32534#21495
      FieldName = 'BH'
      Size = 12
    end
    object KhXsHzMC: TWideStringField
      DisplayLabel = #23458#25143#21517#31216
      FieldName = 'MC'
    end
    object KhXsHzJE: TFloatField
      DisplayLabel = #38144#21806#37329#39069
      DisplayWidth = 12
      FieldName = 'JEA'
      DisplayFormat = '#,0.00'
    end
    object KhXsHzJE2: TFloatField
      DisplayLabel = #38144#21806#31246#39069
      DisplayWidth = 12
      FieldName = 'JEB'
      DisplayFormat = '#,0.00'
    end
    object KhXsHzJE3: TFloatField
      DisplayLabel = #20215#31246#21512#35745
      DisplayWidth = 12
      FieldName = 'JEC'
      DisplayFormat = '#,0.00'
    end
    object KhXsHzcMC: TStringField
      FieldKind = fkCalculated
      FieldName = 'cMC'
      Calculated = True
    end
  end
  object KhXsMx: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pKhXsMx'
    RemoteServer = Data.CnBb
    Left = 54
    Top = 2
    object KhXsMxLX: TWideStringField
      DisplayLabel = #31867#22411
      FieldName = 'LX'
      Size = 8
    end
    object KhXsMxZBID: TIntegerField
      Tag = 1
      FieldName = 'ZBID'
    end
    object KhXsMxRQ: TDateField
      DisplayLabel = #24320#21333#26085#26399
      FieldName = 'RQ'
    end
    object KhXsMxDJBH: TWideStringField
      DisplayLabel = #21333#21495
      FieldName = 'DJBH'
      Size = 12
    end
    object KhXsMxBH: TWideStringField
      DisplayLabel = #36135#21697#32534#21495
      FieldName = 'BH'
    end
    object KhXsMxPM: TWideStringField
      DisplayLabel = #36135#21697#21517#31216
      FieldName = 'PM'
      Size = 40
    end
    object KhXsMxDW: TWideStringField
      DisplayLabel = #35745#37327#21333#20301
      FieldName = 'DW'
      Size = 4
    end
    object KhXsMxSL: TFloatField
      DisplayLabel = #25968#37327
      FieldName = 'SL'
      DisplayFormat = '#,0.###'
    end
    object KhXsMxDJ: TFloatField
      DisplayLabel = #21333#20215
      DisplayWidth = 10
      FieldName = 'DJ'
      DisplayFormat = '#,0.###'
    end
    object KhXsMxNSL: TFloatField
      DisplayLabel = #31246#29575
      DisplayWidth = 4
      FieldName = 'NSL'
      OnGetText = NSLGetText
      DisplayFormat = '0.#'
    end
    object KhXsMxJEA: TFloatField
      DisplayLabel = #38144#21806#37329#39069
      DisplayWidth = 12
      FieldName = 'JEA'
      DisplayFormat = '#,0.00'
    end
    object KhXsMxJEB: TFloatField
      DisplayLabel = #38144#21806#31246#39069
      DisplayWidth = 12
      FieldName = 'JEB'
      DisplayFormat = '#,0.00'
    end
    object KhXsMxJEC: TFloatField
      DisplayLabel = #20215#31246#21512#35745
      DisplayWidth = 12
      FieldName = 'JEC'
      DisplayFormat = '#,0.00'
    end
  end
  object HpXsHz: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pHpXsHz'
    RemoteServer = Data.CnBb
    OnCalcFields = CalcFields_PM
    Left = 101
    Top = 2
    object IntegerField3: TIntegerField
      Tag = 1
      FieldName = 'ID'
    end
    object HpXsHzBH: TWideStringField
      DisplayLabel = #36135#21697#32534#21495
      FieldName = 'BH'
    end
    object HpXsHzPM: TWideStringField
      DisplayLabel = #21697#21517#35268#26684
      FieldName = 'PM'
      Size = 40
    end
    object HpXsHzDW: TWideStringField
      DisplayLabel = #35745#37327#21333#20301
      FieldName = 'DW'
      Size = 4
    end
    object HpXsHzSL: TFloatField
      DisplayLabel = #25968#37327
      FieldName = 'SL'
      DisplayFormat = '#,0.###'
    end
    object FloatField1: TFloatField
      DisplayLabel = #38144#21806#37329#39069
      DisplayWidth = 12
      FieldName = 'JEA'
      DisplayFormat = '#,0.00'
    end
    object FloatField2: TFloatField
      DisplayLabel = #38144#21806#31246#39069
      DisplayWidth = 12
      FieldName = 'JEB'
      DisplayFormat = '#,0.00'
    end
    object FloatField3: TFloatField
      DisplayLabel = #20215#31246#21512#35745
      DisplayWidth = 12
      FieldName = 'JEC'
      DisplayFormat = '#,0.00'
    end
    object StringField1: TStringField
      FieldKind = fkCalculated
      FieldName = 'cPM'
      Size = 40
      Calculated = True
    end
  end
  object HpXsMx: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pHpXsMx'
    RemoteServer = Data.CnBb
    Left = 149
    Top = 2
    object HpXsMxLX: TWideStringField
      DisplayLabel = #31867#22411
      FieldName = 'LX'
      Size = 8
    end
    object IntegerField4: TIntegerField
      Tag = 1
      FieldName = 'ZBID'
    end
    object DateField1: TDateField
      DisplayLabel = #24320#21333#26085#26399
      FieldName = 'RQ'
    end
    object WideStringField3: TWideStringField
      DisplayLabel = #21333#21495
      FieldName = 'DJBH'
      Size = 12
    end
    object HpXsMxBH: TWideStringField
      DisplayLabel = #23458#25143#32534#21495
      FieldName = 'BH'
      Size = 12
    end
    object HpXsMxMC: TWideStringField
      DisplayLabel = #23458#25143#21517#31216
      FieldName = 'MC'
    end
    object FloatField4: TFloatField
      DisplayLabel = #25968#37327
      FieldName = 'SL'
      DisplayFormat = '#,0.###'
    end
    object FloatField5: TFloatField
      DisplayLabel = #21333#20215
      DisplayWidth = 10
      FieldName = 'DJ'
      DisplayFormat = '#,0.###'
    end
    object FloatField6: TFloatField
      DisplayLabel = #31246#29575
      DisplayWidth = 4
      FieldName = 'NSL'
      OnGetText = NSLGetText
      DisplayFormat = '0.#'
    end
    object FloatField7: TFloatField
      DisplayLabel = #38144#21806#37329#39069
      DisplayWidth = 12
      FieldName = 'JEA'
      DisplayFormat = '#,0.00'
    end
    object FloatField8: TFloatField
      DisplayLabel = #38144#21806#31246#39069
      DisplayWidth = 12
      FieldName = 'JEB'
      DisplayFormat = '#,0.00'
    end
    object FloatField9: TFloatField
      DisplayLabel = #20215#31246#21512#35745
      DisplayWidth = 12
      FieldName = 'JEC'
      DisplayFormat = '#,0.00'
    end
  end
  object YwyXsHz: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pYwyXsHz'
    RemoteServer = Data.CnBb
    OnCalcFields = CalcFields_YWY
    Left = 244
    Top = 2
    object YwyXsHzYWY: TWideStringField
      DisplayLabel = #19994#21153#21592
      FieldName = 'YWY'
      OnGetText = YWYGetText
      Size = 8
    end
    object FloatField11: TFloatField
      DisplayLabel = #38144#21806#37329#39069
      DisplayWidth = 12
      FieldName = 'JEA'
      DisplayFormat = '#,0.00'
    end
    object FloatField12: TFloatField
      DisplayLabel = #38144#21806#31246#39069
      DisplayWidth = 12
      FieldName = 'JEB'
      DisplayFormat = '#,0.00'
    end
    object FloatField13: TFloatField
      DisplayLabel = #20215#31246#21512#35745
      DisplayWidth = 12
      FieldName = 'JEC'
      DisplayFormat = '#,0.00'
    end
    object StringField2: TStringField
      FieldKind = fkCalculated
      FieldName = 'cYWY'
      OnGetText = YWYGetText
      Size = 8
      Calculated = True
    end
  end
  object YwyXsMx: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pYwyXsMx'
    RemoteServer = Data.CnBb
    Left = 196
    Top = 2
    object YwyXsMxWideStringField: TWideStringField
      DisplayLabel = #31867#22411
      FieldName = 'LX'
      Size = 8
    end
    object IntegerField6: TIntegerField
      Tag = 1
      FieldName = 'ZBID'
    end
    object DateField2: TDateField
      DisplayLabel = #24320#21333#26085#26399
      FieldName = 'RQ'
    end
    object WideStringField5: TWideStringField
      DisplayLabel = #21333#21495
      FieldName = 'DJBH'
      Size = 12
    end
    object WideStringField6: TWideStringField
      DisplayLabel = #23458#25143#32534#21495
      FieldName = 'BH'
      Size = 12
    end
    object WideStringField7: TWideStringField
      DisplayLabel = #23458#25143#21517#31216
      FieldName = 'MC'
    end
    object FloatField17: TFloatField
      DisplayLabel = #38144#21806#37329#39069
      DisplayWidth = 12
      FieldName = 'JEA'
      DisplayFormat = '#,0.00'
    end
    object FloatField18: TFloatField
      DisplayLabel = #38144#21806#31246#39069
      DisplayWidth = 12
      FieldName = 'JEB'
      DisplayFormat = '#,0.00'
    end
    object FloatField19: TFloatField
      DisplayLabel = #20215#31246#21512#35745
      DisplayWidth = 12
      FieldName = 'JEC'
      DisplayFormat = '#,0.00'
    end
  end
  object DqXsHz: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pDqXsHz'
    RemoteServer = Data.CnBb
    OnCalcFields = CalcFields_MC
    Left = 292
    Top = 2
    object WideStringField1: TWideStringField
      DisplayLabel = #22320#21306
      FieldName = 'MC'
      Size = 12
    end
    object FloatField10: TFloatField
      DisplayLabel = #38144#21806#37329#39069
      DisplayWidth = 12
      FieldName = 'JEA'
      DisplayFormat = '#,0.00'
    end
    object FloatField14: TFloatField
      DisplayLabel = #38144#21806#31246#39069
      DisplayWidth = 12
      FieldName = 'JEB'
      DisplayFormat = '#,0.00'
    end
    object FloatField15: TFloatField
      DisplayLabel = #20215#31246#21512#35745
      DisplayWidth = 12
      FieldName = 'JEC'
      DisplayFormat = '#,0.00'
    end
    object StringField3: TStringField
      FieldKind = fkCalculated
      FieldName = 'cMC'
      Size = 12
      Calculated = True
    end
  end
  object DqXsMx: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pDqXsMx'
    RemoteServer = Data.CnBb
    Left = 339
    Top = 2
    object DqXsMxLX: TWideStringField
      DisplayLabel = #31867#22411
      FieldName = 'LX'
      Size = 8
    end
    object IntegerField5: TIntegerField
      Tag = 1
      FieldName = 'ZBID'
    end
    object DateField3: TDateField
      DisplayLabel = #24320#21333#26085#26399
      FieldName = 'RQ'
    end
    object WideStringField2: TWideStringField
      DisplayLabel = #21333#21495
      FieldName = 'DJBH'
      Size = 12
    end
    object WideStringField4: TWideStringField
      DisplayLabel = #23458#25143#32534#21495
      FieldName = 'BH'
      Size = 12
    end
    object WideStringField8: TWideStringField
      DisplayLabel = #23458#25143#21517#31216
      FieldName = 'MC'
    end
    object FloatField16: TFloatField
      DisplayLabel = #38144#21806#37329#39069
      DisplayWidth = 12
      FieldName = 'JEA'
      DisplayFormat = '#,0.00'
    end
    object FloatField20: TFloatField
      DisplayLabel = #38144#21806#31246#39069
      DisplayWidth = 12
      FieldName = 'JEB'
      DisplayFormat = '#,0.00'
    end
    object FloatField21: TFloatField
      DisplayLabel = #20215#31246#21512#35745
      DisplayWidth = 12
      FieldName = 'JEC'
      DisplayFormat = '#,0.00'
    end
  end
  object sKhXsHz: TDataSource
    DataSet = KhXsHz
    Left = 14
    Top = 6
  end
  object sKhXsMx: TDataSource
    DataSet = KhXsMx
    Left = 62
    Top = 6
  end
  object sHpXsHz: TDataSource
    DataSet = HpXsHz
    Left = 109
    Top = 6
  end
  object sHpXsMx: TDataSource
    DataSet = HpXsMx
    Left = 157
    Top = 6
  end
  object sYwyXsHz: TDataSource
    DataSet = YwyXsHz
    Left = 252
    Top = 6
  end
  object sYwyXsMx: TDataSource
    DataSet = YwyXsMx
    Left = 204
    Top = 6
  end
  object sDqXsHz: TDataSource
    DataSet = DqXsHz
    Left = 300
    Top = 6
  end
  object sDqXsMx: TDataSource
    DataSet = DqXsMx
    Left = 347
    Top = 6
  end
  object HplbXsHz: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pHplbXsHz'
    RemoteServer = Data.CnBb
    OnCalcFields = CalcFields_MC
    Left = 387
    Top = 2
    object WideStringField9: TWideStringField
      DisplayLabel = #36135#21697#31867#21035
      FieldName = 'MC'
      Size = 12
    end
    object FloatField22: TFloatField
      DisplayLabel = #38144#21806#37329#39069
      DisplayWidth = 12
      FieldName = 'JEA'
      DisplayFormat = '#,0.00'
    end
    object FloatField23: TFloatField
      DisplayLabel = #38144#21806#31246#39069
      DisplayWidth = 12
      FieldName = 'JEB'
      DisplayFormat = '#,0.00'
    end
    object FloatField24: TFloatField
      DisplayLabel = #20215#31246#21512#35745
      DisplayWidth = 12
      FieldName = 'JEC'
      DisplayFormat = '#,0.00'
    end
    object StringField4: TStringField
      FieldKind = fkCalculated
      FieldName = 'cMC'
      Size = 12
      Calculated = True
    end
  end
  object HplbXsMx: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pHplbXsMx'
    RemoteServer = Data.CnBb
    Left = 434
    Top = 2
    object HplbXsMxLX: TWideStringField
      DisplayLabel = #31867#22411
      FieldName = 'LX'
      Size = 8
    end
    object IntegerField7: TIntegerField
      Tag = 1
      FieldName = 'ZBID'
    end
    object DateField4: TDateField
      DisplayLabel = #24320#21333#26085#26399
      FieldName = 'RQ'
    end
    object WideStringField10: TWideStringField
      DisplayLabel = #21333#21495
      FieldName = 'DJBH'
      Size = 12
    end
    object WideStringField11: TWideStringField
      DisplayLabel = #23458#25143#32534#21495
      FieldName = 'KHBH'
      Size = 12
    end
    object WideStringField12: TWideStringField
      DisplayLabel = #23458#25143#21517#31216
      FieldName = 'KHMC'
    end
    object HplbXsMxBH: TWideStringField
      DisplayLabel = #36135#21697#32534#21495
      FieldName = 'BH'
    end
    object HplbXsMxPM: TWideStringField
      DisplayLabel = #36135#21697#21517#31216
      FieldName = 'PM'
      Size = 40
    end
    object HplbXsMxDW: TWideStringField
      DisplayLabel = #35745#37327#21333#20301
      FieldName = 'DW'
      Size = 4
    end
    object HplbXsMxSL: TFloatField
      DisplayLabel = #25968#37327
      FieldName = 'SL'
      DisplayFormat = '#,0.###'
    end
    object HplbXsMxDJ: TFloatField
      DisplayLabel = #21333#20215
      DisplayWidth = 10
      FieldName = 'DJ'
      DisplayFormat = '#,0.###'
    end
    object HplbXsMxNSL: TFloatField
      DisplayLabel = #31246#29575
      DisplayWidth = 4
      FieldName = 'NSL'
      OnGetText = NSLGetText
      DisplayFormat = '0.#'
    end
    object FloatField25: TFloatField
      DisplayLabel = #38144#21806#37329#39069
      DisplayWidth = 12
      FieldName = 'JEA'
      DisplayFormat = '#,0.00'
    end
    object FloatField26: TFloatField
      DisplayLabel = #38144#21806#31246#39069
      DisplayWidth = 12
      FieldName = 'JEB'
      DisplayFormat = '#,0.00'
    end
    object FloatField27: TFloatField
      DisplayLabel = #20215#31246#21512#35745
      DisplayWidth = 12
      FieldName = 'JEC'
      DisplayFormat = '#,0.00'
    end
  end
  object sHplbXsHz: TDataSource
    DataSet = HplbXsHz
    Left = 395
    Top = 6
  end
  object sHplbXsMx: TDataSource
    DataSet = HplbXsMx
    Left = 442
    Top = 6
  end
  object HpXsMlHz: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pHpXsMlHz'
    RemoteServer = Data.CnBb
    OnCalcFields = CalcFields_PM
    Left = 482
    Top = 2
    object IntegerField8: TIntegerField
      Tag = 1
      FieldName = 'ID'
    end
    object WideStringField13: TWideStringField
      DisplayLabel = #36135#21697#32534#21495
      FieldName = 'BH'
    end
    object WideStringField14: TWideStringField
      DisplayLabel = #21697#21517#35268#26684
      FieldName = 'PM'
      Size = 40
    end
    object WideStringField15: TWideStringField
      DisplayLabel = #35745#37327#21333#20301
      FieldName = 'DW'
      Size = 4
    end
    object FloatField29: TFloatField
      DisplayLabel = #38144#21806#37329#39069
      DisplayWidth = 12
      FieldName = 'JEA'
      DisplayFormat = '#,0.00'
    end
    object HpXsMlHzCBJE: TFloatField
      DisplayLabel = #38144#21806#25104#26412
      DisplayWidth = 12
      FieldName = 'CBJE'
      DisplayFormat = '#,0.00'
    end
    object HpXsMlHzLRJE: TFloatField
      DisplayLabel = #38144#21806#27611#21033
      DisplayWidth = 12
      FieldName = 'LRJE'
      DisplayFormat = '#,0.00'
    end
    object StringField5: TStringField
      FieldKind = fkCalculated
      FieldName = 'cPM'
      Size = 40
      Calculated = True
    end
  end
  object HpXsMlMx: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pHpXsMlMx'
    RemoteServer = Data.CnBb
    Left = 10
    Top = 48
    object HpXsMlMxLX: TWideStringField
      DisplayLabel = #31867#22411
      FieldName = 'LX'
      Size = 8
    end
    object IntegerField9: TIntegerField
      Tag = 1
      FieldName = 'ZBID'
    end
    object DateField5: TDateField
      DisplayLabel = #24320#21333#26085#26399
      FieldName = 'RQ'
    end
    object WideStringField16: TWideStringField
      DisplayLabel = #21333#21495
      FieldName = 'DJBH'
      Size = 12
    end
    object WideStringField17: TWideStringField
      DisplayLabel = #23458#25143#32534#21495
      FieldName = 'BH'
      Size = 12
    end
    object WideStringField18: TWideStringField
      DisplayLabel = #23458#25143#21517#31216
      FieldName = 'MC'
    end
    object FloatField32: TFloatField
      DisplayLabel = #25968#37327
      FieldName = 'SL'
      DisplayFormat = '#,0.###'
    end
    object FloatField33: TFloatField
      DisplayLabel = #21333#20215
      DisplayWidth = 10
      FieldName = 'DJ'
      DisplayFormat = '#,0.###'
    end
    object HpXsMlMxCBDJ: TFloatField
      DisplayLabel = #25104#26412#21333#20215
      DisplayWidth = 10
      FieldName = 'CBDJ'
      DisplayFormat = '#,0.###'
    end
    object FloatField35: TFloatField
      DisplayLabel = #38144#21806#37329#39069
      DisplayWidth = 12
      FieldName = 'JEA'
      DisplayFormat = '#,0.00'
    end
    object HpXsMlMxCBJE: TFloatField
      DisplayLabel = #38144#21806#25104#26412
      DisplayWidth = 12
      FieldName = 'CBJE'
      DisplayFormat = '#,0.00'
    end
    object HpXsMlMxLRJE: TFloatField
      DisplayLabel = #38144#21806#27611#21033
      DisplayWidth = 12
      FieldName = 'LRJE'
      DisplayFormat = '#,0.00'
    end
  end
  object sHpXsMlHz: TDataSource
    DataSet = HpXsMlHz
    Left = 490
    Top = 6
  end
  object sHpXsMlMx: TDataSource
    DataSet = HpXsMlMx
    Left = 22
    Top = 56
  end
  object XsMlAdjs: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pXsMlAdjs'
    RemoteServer = Data.CnBb
    Left = 64
    Top = 48
    object XsMlAdjsLX: TWideStringField
      DisplayLabel = #31867#22411
      FieldName = 'LX'
      Size = 8
    end
    object IntegerField10: TIntegerField
      Tag = 1
      FieldName = 'ZBID'
    end
    object DateField6: TDateField
      DisplayLabel = #24320#21333#26085#26399
      FieldName = 'RQ'
    end
    object WideStringField19: TWideStringField
      DisplayLabel = #21333#21495
      FieldName = 'DJBH'
      Size = 12
    end
    object XsMlAdjsBH: TWideStringField
      DisplayLabel = #23458#25143#32534#21495
      FieldName = 'BH'
      Size = 12
    end
    object XsMlAdjsMC: TWideStringField
      DisplayLabel = #23458#25143#21517#31216
      FieldName = 'MC'
    end
    object FloatField34: TFloatField
      DisplayLabel = #38144#21806#37329#39069
      DisplayWidth = 12
      FieldName = 'JEA'
      DisplayFormat = '#,0.00'
    end
    object FloatField36: TFloatField
      DisplayLabel = #38144#21806#25104#26412
      DisplayWidth = 12
      FieldName = 'CBJE'
      DisplayFormat = '#,0.00'
    end
    object FloatField37: TFloatField
      DisplayLabel = #38144#21806#27611#21033
      DisplayWidth = 12
      FieldName = 'LRJE'
      DisplayFormat = '#,0.00'
    end
  end
  object sXsMlAdjs: TDataSource
    DataSet = XsMlAdjs
    Left = 76
    Top = 56
  end
  object YwyYjtj: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pYwyYjtj'
    RemoteServer = Data.CnBb
    OnCalcFields = CalcFields_PM
    Left = 226
    Top = 48
    object YwyYjtjYWY: TWideStringField
      DisplayLabel = #19994#21153#21592
      FieldName = 'YWY'
      OnGetText = YWYGetText
      Size = 8
    end
    object YwyYjtjJEA: TFloatField
      DisplayLabel = #38144#21806#37329#39069
      DisplayWidth = 12
      FieldName = 'XSJE'
      DisplayFormat = '#,0.00'
    end
    object YwyYjtjJEB: TFloatField
      DisplayLabel = #36864#36135#37329#39069
      DisplayWidth = 12
      FieldName = 'THJE'
      DisplayFormat = '#,0.00'
    end
    object YwyYjtjJEA2: TFloatField
      DisplayLabel = #24050#25910#22238#37329#39069
      DisplayWidth = 12
      FieldName = 'YSJE'
      DisplayFormat = '#,0.00'
    end
    object YwyYjtjJEC: TFloatField
      DisplayLabel = #26410#25910#22238#37329#39069
      DisplayWidth = 12
      FieldName = 'MSJE'
      DisplayFormat = '#,0.00'
    end
  end
  object XsddQk: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pXsddQk'
    RemoteServer = Data.CnBb
    Left = 280
    Top = 48
    object IntegerField12: TIntegerField
      Tag = 1
      FieldName = 'ID'
    end
    object DateField7: TDateField
      DisplayLabel = #24320#21333#26085#26399
      FieldName = 'RQ'
    end
    object WideStringField24: TWideStringField
      DisplayLabel = #21333#21495
      FieldName = 'DJBH'
      Size = 12
    end
    object XsddQkBH: TWideStringField
      DisplayLabel = #23458#25143#32534#21495
      FieldName = 'BH'
      Size = 12
    end
    object WideStringField26: TWideStringField
      DisplayLabel = #23458#25143#21517#31216
      FieldName = 'MC'
    end
    object FloatField42: TFloatField
      DisplayLabel = #37329#39069
      DisplayWidth = 12
      FieldName = 'JE'
      DisplayFormat = '#,0.00'
    end
    object WideStringField25: TWideStringField
      DisplayLabel = #25191#34892#24773#20917
      FieldName = 'DDZT'
      Size = 8
    end
  end
  object XsMsdj: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pXsMsdj'
    RemoteServer = Data.CnBb
    OnCalcFields = CalcFields_YWY
    Left = 334
    Top = 48
    object XsMsdjID: TIntegerField
      Tag = 1
      FieldName = 'ID'
    end
    object XsMsdjRQ: TDateField
      DisplayLabel = #24320#21333#26085#26399
      FieldName = 'RQ'
    end
    object XsMsdjDJBH: TWideStringField
      DisplayLabel = #21333#21495
      FieldName = 'DJBH'
      Size = 12
    end
    object XsMsdjBH: TWideStringField
      DisplayLabel = #23458#25143#32534#21495
      FieldName = 'BH'
      Size = 12
    end
    object XsMsdjMC: TWideStringField
      DisplayLabel = #23458#25143#21517#31216
      FieldName = 'MC'
    end
    object XsMsdjJE: TFloatField
      DisplayLabel = #24320#21333#37329#39069
      DisplayWidth = 12
      FieldName = 'JEA'
      DisplayFormat = '#,0.00'
    end
    object XsMsdjJE2: TFloatField
      DisplayLabel = #24050#25910#37329#39069
      DisplayWidth = 12
      FieldName = 'JEB'
      DisplayFormat = '#,0.00'
    end
    object XsMsdjJE3: TFloatField
      DisplayLabel = #27424#27454#37329#39069
      DisplayWidth = 12
      FieldName = 'JEC'
      DisplayFormat = '#,0.00'
    end
  end
  object XsMlNb: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pXsMlNb'
    RemoteServer = Data.CnBb
    Left = 118
    Top = 48
    object IntegerField13: TIntegerField
      Tag = 1
      DisplayLabel = #26376#20221
      DisplayWidth = 4
      FieldName = 'YF'
    end
    object XsMlNbJEA: TFloatField
      DisplayLabel = #38144#21806#37329#39069
      DisplayWidth = 12
      FieldName = 'JEA'
      DisplayFormat = '#,0.00'
    end
    object XsMlNbCBJE: TFloatField
      DisplayLabel = #38144#21806#25104#26412
      DisplayWidth = 12
      FieldName = 'CBJE'
      DisplayFormat = '#,0.00'
    end
    object XsMlNbLRJE: TFloatField
      DisplayLabel = #38144#21806#27611#21033
      DisplayWidth = 12
      FieldName = 'LRJE'
      DisplayFormat = '#,0.00'
    end
  end
  object sYwyYjtj: TDataSource
    DataSet = YwyYjtj
    Left = 238
    Top = 56
  end
  object sXsddQk: TDataSource
    DataSet = XsddQk
    Left = 292
    Top = 56
  end
  object sXsMsdj: TDataSource
    DataSet = XsMsdj
    Left = 346
    Top = 56
  end
  object sXsMlNb: TDataSource
    DataSet = XsMlNb
    Left = 130
    Top = 56
  end
  object XsMlNbMx: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pXsMlNbMx'
    RemoteServer = Data.CnBb
    OnCalcFields = CalcFields_PM
    Left = 172
    Top = 48
    object XsMlNbMxLX: TWideStringField
      DisplayLabel = #31867#22411
      FieldName = 'LX'
      Size = 8
    end
    object XsMlNbMxZBID: TIntegerField
      Tag = 1
      FieldName = 'ZBID'
    end
    object XsMlNbMxRQ: TDateField
      DisplayLabel = #24320#21333#26085#26399
      FieldName = 'RQ'
    end
    object XsMlNbMxDJBH: TWideStringField
      DisplayLabel = #21333#21495
      FieldName = 'DJBH'
      Size = 12
    end
    object XsMlNbMxBH: TWideStringField
      DisplayLabel = #36135#21697#32534#21495
      FieldName = 'BH'
    end
    object XsMlNbMxPM: TWideStringField
      DisplayLabel = #36135#21697#21517#31216
      FieldName = 'PM'
      Size = 40
    end
    object XsMlNbMxDW: TWideStringField
      DisplayLabel = #35745#37327#21333#20301
      FieldName = 'DW'
      Size = 4
    end
    object XsMlNbMxSL: TFloatField
      DisplayLabel = #25968#37327
      FieldName = 'SL'
      DisplayFormat = '#,0.###'
    end
    object XsMlNbMxDJ: TFloatField
      DisplayLabel = #21333#20215
      DisplayWidth = 10
      FieldName = 'DJ'
      DisplayFormat = '#,0.###'
    end
    object XsMlNbMxCBDJ: TFloatField
      DisplayLabel = #25104#26412#21333#20215
      DisplayWidth = 10
      FieldName = 'CBDJ'
      DisplayFormat = '#,0.###'
    end
    object XsMlNbMxJEA: TFloatField
      DisplayLabel = #38144#21806#37329#39069
      DisplayWidth = 12
      FieldName = 'JEA'
      DisplayFormat = '#,0.00'
    end
    object XsMlNbMxCBJE: TFloatField
      DisplayLabel = #38144#21806#25104#26412
      DisplayWidth = 12
      FieldName = 'CBJE'
      DisplayFormat = '#,0.00'
    end
    object XsMlNbMxLRJE: TFloatField
      DisplayLabel = #38144#21806#27611#21033
      DisplayWidth = 12
      FieldName = 'LRJE'
      DisplayFormat = '#,0.00'
    end
  end
  object sXsMlNbMx: TDataSource
    DataSet = XsMlNbMx
    Left = 184
    Top = 56
  end
  object GysGhHz: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pGysGhHz'
    RemoteServer = Data.CnBb
    OnCalcFields = CalcFields_MC
    Left = 2
    Top = 102
    object IntegerField11: TIntegerField
      Tag = 1
      FieldName = 'ID'
    end
    object WideStringField20: TWideStringField
      DisplayLabel = #20379#24212#21830#32534#21495
      FieldName = 'BH'
      Size = 12
    end
    object WideStringField21: TWideStringField
      DisplayLabel = #20379#24212#21830#21517#31216
      FieldName = 'MC'
    end
    object FloatField28: TFloatField
      DisplayLabel = #36827#36135#37329#39069
      DisplayWidth = 12
      FieldName = 'JEA'
      DisplayFormat = '#,0.00'
    end
    object FloatField30: TFloatField
      DisplayLabel = #36827#36135#31246#39069
      DisplayWidth = 12
      FieldName = 'JEB'
      DisplayFormat = '#,0.00'
    end
    object FloatField31: TFloatField
      DisplayLabel = #20215#31246#21512#35745
      DisplayWidth = 12
      FieldName = 'JEC'
      DisplayFormat = '#,0.00'
    end
    object StringField6: TStringField
      FieldKind = fkCalculated
      FieldName = 'cMC'
      Calculated = True
    end
  end
  object GysGhMx: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pGysGhMx'
    RemoteServer = Data.CnBb
    Left = 56
    Top = 102
    object WideStringField22: TWideStringField
      DisplayLabel = #31867#22411
      FieldName = 'LX'
      Size = 8
    end
    object IntegerField14: TIntegerField
      Tag = 1
      FieldName = 'ZBID'
    end
    object DateField8: TDateField
      DisplayLabel = #24320#21333#26085#26399
      FieldName = 'RQ'
    end
    object WideStringField23: TWideStringField
      DisplayLabel = #21333#21495
      FieldName = 'DJBH'
      Size = 12
    end
    object WideStringField27: TWideStringField
      DisplayLabel = #36135#21697#32534#21495
      FieldName = 'BH'
    end
    object WideStringField28: TWideStringField
      DisplayLabel = #36135#21697#21517#31216
      FieldName = 'PM'
      Size = 40
    end
    object WideStringField29: TWideStringField
      DisplayLabel = #35745#37327#21333#20301
      FieldName = 'DW'
      Size = 4
    end
    object FloatField38: TFloatField
      DisplayLabel = #25968#37327
      FieldName = 'SL'
      DisplayFormat = '#,0.###'
    end
    object FloatField39: TFloatField
      DisplayLabel = #21333#20215
      DisplayWidth = 10
      FieldName = 'DJ'
      DisplayFormat = '#,0.###'
    end
    object FloatField40: TFloatField
      DisplayLabel = #31246#29575
      DisplayWidth = 4
      FieldName = 'NSL'
      OnGetText = NSLGetText
      DisplayFormat = '0.#'
    end
    object FloatField41: TFloatField
      DisplayLabel = #36827#36135#37329#39069
      DisplayWidth = 12
      FieldName = 'JEA'
      DisplayFormat = '#,0.00'
    end
    object FloatField43: TFloatField
      DisplayLabel = #36827#36135#31246#39069
      DisplayWidth = 12
      FieldName = 'JEB'
      DisplayFormat = '#,0.00'
    end
    object FloatField44: TFloatField
      DisplayLabel = #20215#31246#21512#35745
      DisplayWidth = 12
      FieldName = 'JEC'
      DisplayFormat = '#,0.00'
    end
  end
  object HpCgHz: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pHpCgHz'
    RemoteServer = Data.CnBb
    OnCalcFields = CalcFields_PM
    Left = 110
    Top = 102
    object IntegerField15: TIntegerField
      Tag = 1
      FieldName = 'ID'
    end
    object WideStringField30: TWideStringField
      DisplayLabel = #36135#21697#32534#21495
      FieldName = 'BH'
    end
    object WideStringField31: TWideStringField
      DisplayLabel = #21697#21517#35268#26684
      FieldName = 'PM'
      Size = 40
    end
    object WideStringField32: TWideStringField
      DisplayLabel = #35745#37327#21333#20301
      FieldName = 'DW'
      Size = 4
    end
    object FloatField45: TFloatField
      DisplayLabel = #25968#37327
      FieldName = 'SL'
      DisplayFormat = '#,0.###'
    end
    object HpCgHzJEA: TFloatField
      DisplayLabel = #36827#36135#37329#39069
      DisplayWidth = 12
      FieldName = 'JEA'
      DisplayFormat = '#,0.00'
    end
    object HpCgHzJEB: TFloatField
      DisplayLabel = #36827#36135#31246#39069
      DisplayWidth = 12
      FieldName = 'JEB'
      DisplayFormat = '#,0.00'
    end
    object HpCgHzJEC: TFloatField
      DisplayLabel = #20215#31246#21512#35745
      DisplayWidth = 12
      FieldName = 'JEC'
      DisplayFormat = '#,0.00'
    end
    object StringField7: TStringField
      FieldKind = fkCalculated
      FieldName = 'cPM'
      Size = 40
      Calculated = True
    end
  end
  object HpCgMx: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pHpCgMx'
    RemoteServer = Data.CnBb
    Left = 164
    Top = 102
    object WideStringField33: TWideStringField
      DisplayLabel = #31867#22411
      FieldName = 'LX'
      Size = 8
    end
    object IntegerField16: TIntegerField
      Tag = 1
      FieldName = 'ZBID'
    end
    object DateField9: TDateField
      DisplayLabel = #24320#21333#26085#26399
      FieldName = 'RQ'
    end
    object WideStringField34: TWideStringField
      DisplayLabel = #21333#21495
      FieldName = 'DJBH'
      Size = 12
    end
    object WideStringField35: TWideStringField
      DisplayLabel = #20379#24212#21830#32534#21495
      FieldName = 'BH'
      Size = 12
    end
    object WideStringField36: TWideStringField
      DisplayLabel = #20379#24212#21830#21517#31216
      FieldName = 'MC'
    end
    object FloatField49: TFloatField
      DisplayLabel = #25968#37327
      FieldName = 'SL'
      DisplayFormat = '#,0.###'
    end
    object FloatField50: TFloatField
      DisplayLabel = #21333#20215
      DisplayWidth = 10
      FieldName = 'DJ'
      DisplayFormat = '#,0.###'
    end
    object FloatField51: TFloatField
      DisplayLabel = #31246#29575
      DisplayWidth = 4
      FieldName = 'NSL'
      OnGetText = NSLGetText
      DisplayFormat = '0.#'
    end
    object HpCgMxJEA: TFloatField
      DisplayLabel = #36827#36135#37329#39069
      DisplayWidth = 12
      FieldName = 'JEA'
      DisplayFormat = '#,0.00'
    end
    object HpCgMxJEB: TFloatField
      DisplayLabel = #36827#36135#31246#39069
      DisplayWidth = 12
      FieldName = 'JEB'
      DisplayFormat = '#,0.00'
    end
    object HpCgMxJEC: TFloatField
      DisplayLabel = #20215#31246#21512#35745
      DisplayWidth = 12
      FieldName = 'JEC'
      DisplayFormat = '#,0.00'
    end
  end
  object YwyCgHz: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pYwyCgHz'
    RemoteServer = Data.CnBb
    OnCalcFields = CalcFields_YWY
    Left = 218
    Top = 102
    object WideStringField37: TWideStringField
      DisplayLabel = #19994#21153#21592
      FieldName = 'YWY'
      OnGetText = YWYGetText
      Size = 8
    end
    object YwyCgHzJEA: TFloatField
      DisplayLabel = #36827#36135#37329#39069
      DisplayWidth = 12
      FieldName = 'JEA'
      DisplayFormat = '#,0.00'
    end
    object YwyCgHzJEB: TFloatField
      DisplayLabel = #36827#36135#31246#39069
      DisplayWidth = 12
      FieldName = 'JEB'
      DisplayFormat = '#,0.00'
    end
    object YwyCgHzJEC: TFloatField
      DisplayLabel = #20215#31246#21512#35745
      DisplayWidth = 12
      FieldName = 'JEC'
      DisplayFormat = '#,0.00'
    end
    object StringField8: TStringField
      FieldKind = fkCalculated
      FieldName = 'cYWY'
      OnGetText = YWYGetText
      Size = 8
      Calculated = True
    end
  end
  object YwyCgMx: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pYwyCgMx'
    RemoteServer = Data.CnBb
    Left = 272
    Top = 102
    object WideStringField38: TWideStringField
      DisplayLabel = #31867#22411
      FieldName = 'LX'
      Size = 8
    end
    object IntegerField17: TIntegerField
      Tag = 1
      FieldName = 'ZBID'
    end
    object DateField10: TDateField
      DisplayLabel = #24320#21333#26085#26399
      FieldName = 'RQ'
    end
    object WideStringField39: TWideStringField
      DisplayLabel = #21333#21495
      FieldName = 'DJBH'
      Size = 12
    end
    object WideStringField40: TWideStringField
      DisplayLabel = #20379#24212#21830#32534#21495
      FieldName = 'BH'
      Size = 12
    end
    object WideStringField41: TWideStringField
      DisplayLabel = #20379#24212#21830#21517#31216
      FieldName = 'MC'
    end
    object YwyCgMxJEA: TFloatField
      DisplayLabel = #36827#36135#37329#39069
      DisplayWidth = 12
      FieldName = 'JEA'
      DisplayFormat = '#,0.00'
    end
    object YwyCgMxJEB: TFloatField
      DisplayLabel = #36827#36135#31246#39069
      DisplayWidth = 12
      FieldName = 'JEB'
      DisplayFormat = '#,0.00'
    end
    object YwyCgMxJEC: TFloatField
      DisplayLabel = #20215#31246#21512#35745
      DisplayWidth = 12
      FieldName = 'JEC'
      DisplayFormat = '#,0.00'
    end
  end
  object sGysGhHz: TDataSource
    DataSet = GysGhHz
    Left = 14
    Top = 110
  end
  object sGysGhMx: TDataSource
    DataSet = GysGhMx
    Left = 68
    Top = 110
  end
  object sHpCgHz: TDataSource
    DataSet = HpCgHz
    Left = 122
    Top = 110
  end
  object sHpCgMx: TDataSource
    DataSet = HpCgMx
    Left = 176
    Top = 110
  end
  object sYwyCgHz: TDataSource
    DataSet = YwyCgHz
    Left = 230
    Top = 110
  end
  object sYwyCgMx: TDataSource
    DataSet = YwyCgMx
    Left = 284
    Top = 110
  end
  object CgddQk: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pCgddQk'
    RemoteServer = Data.CnBb
    Left = 326
    Top = 102
    object IntegerField18: TIntegerField
      Tag = 1
      FieldName = 'ID'
    end
    object DateField11: TDateField
      DisplayLabel = #24320#21333#26085#26399
      FieldName = 'RQ'
    end
    object WideStringField42: TWideStringField
      DisplayLabel = #21333#21495
      FieldName = 'DJBH'
      Size = 12
    end
    object WideStringField43: TWideStringField
      DisplayLabel = #20379#24212#21830#32534#21495
      FieldName = 'BH'
      Size = 12
    end
    object WideStringField44: TWideStringField
      DisplayLabel = #20379#24212#21830#21517#31216
      FieldName = 'MC'
    end
    object FloatField61: TFloatField
      DisplayLabel = #37329#39069
      DisplayWidth = 12
      FieldName = 'JE'
      DisplayFormat = '#,0.00'
    end
    object WideStringField45: TWideStringField
      DisplayLabel = #25191#34892#24773#20917
      FieldName = 'DDZT'
      Size = 8
    end
  end
  object CgMfDj: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pCgMfDj'
    RemoteServer = Data.CnBb
    OnCalcFields = CalcFields_YWY
    Left = 380
    Top = 102
    object IntegerField19: TIntegerField
      Tag = 1
      FieldName = 'ID'
    end
    object DateField12: TDateField
      DisplayLabel = #24320#21333#26085#26399
      FieldName = 'RQ'
    end
    object WideStringField46: TWideStringField
      DisplayLabel = #21333#21495
      FieldName = 'DJBH'
      Size = 12
    end
    object WideStringField47: TWideStringField
      DisplayLabel = #20379#24212#21830#32534#21495
      FieldName = 'BH'
      Size = 12
    end
    object WideStringField48: TWideStringField
      DisplayLabel = #20379#24212#21830#21517#31216
      FieldName = 'MC'
    end
    object FloatField62: TFloatField
      DisplayLabel = #24320#21333#37329#39069
      DisplayWidth = 12
      FieldName = 'JEA'
      DisplayFormat = '#,0.00'
    end
    object FloatField63: TFloatField
      DisplayLabel = #24050#20184#37329#39069
      DisplayWidth = 12
      FieldName = 'JEB'
      DisplayFormat = '#,0.00'
    end
    object FloatField64: TFloatField
      DisplayLabel = #27424#27454#37329#39069
      DisplayWidth = 12
      FieldName = 'JEC'
      DisplayFormat = '#,0.00'
    end
  end
  object sCgddQk: TDataSource
    DataSet = CgddQk
    Left = 338
    Top = 110
  end
  object sCgMfDj: TDataSource
    DataSet = CgMfDj
    Left = 392
    Top = 110
  end
  object CkkcMx: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pCkkcMx'
    RemoteServer = Data.CnBb
    Left = 444
    Top = 102
    object CkkcMxLX: TWideStringField
      DisplayLabel = #31867#22411
      FieldName = 'LX'
      Size = 8
    end
    object CkkcMxZBID: TIntegerField
      Tag = 1
      FieldName = 'ZBID'
    end
    object CkkcMxRQ: TDateField
      DisplayLabel = #24320#21333#26085#26399
      FieldName = 'RQ'
    end
    object CkkcMxDJBH: TWideStringField
      DisplayLabel = #21333#21495
      FieldName = 'DJBH'
      Size = 12
    end
    object CkkcMxPM: TWideStringField
      DisplayLabel = #21517#31216
      FieldName = 'MC1'
      Size = 40
    end
    object CkkcMxDJ: TFloatField
      DisplayLabel = #21152#26435#20215
      DisplayWidth = 10
      FieldName = 'DJ1'
      DisplayFormat = '#,0.###'
    end
    object CkkcMxSL: TFloatField
      DisplayLabel = #25910#20837#25968#37327
      FieldName = 'SLA'
      OnGetText = ZeroToEmpty
      DisplayFormat = '#,0.###'
    end
    object CkkcMxJEA: TFloatField
      DisplayLabel = #25910#20837#37329#39069
      DisplayWidth = 12
      FieldName = 'JEA'
      OnGetText = ZeroToEmpty
      DisplayFormat = '#,0.00'
    end
    object CkkcMxSL1: TFloatField
      DisplayLabel = #21457#20986#25968#37327
      FieldName = 'SLB'
      OnGetText = ZeroToEmpty
      DisplayFormat = '#,0.###'
    end
    object CkkcMxJE1: TFloatField
      DisplayLabel = #21457#20986#37329#39069
      DisplayWidth = 12
      FieldName = 'JEB'
      OnGetText = ZeroToEmpty
      DisplayFormat = '#,0.00'
    end
    object CkkcMxSL12: TFloatField
      DisplayLabel = #32467#20313#25968#37327
      FieldName = 'JYSL'
      DisplayFormat = '#,0.###'
    end
    object CkkcMxJE12: TFloatField
      DisplayLabel = #32467#20313#37329#39069
      DisplayWidth = 12
      FieldName = 'JYJE'
      DisplayFormat = '#,0.00'
    end
  end
  object CkkcHz: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pCkkcHz'
    RemoteServer = Data.CnBb
    OnCalcFields = CalcFields_PM
    Left = 410
    Top = 102
    object IntegerField20: TIntegerField
      Tag = 1
      FieldName = 'ID'
    end
    object WideStringField49: TWideStringField
      DisplayLabel = #36135#21697#32534#21495
      FieldName = 'BH'
    end
    object WideStringField50: TWideStringField
      DisplayLabel = #21697#21517#35268#26684
      FieldName = 'PM'
      Size = 40
    end
    object WideStringField51: TWideStringField
      DisplayLabel = #35745#37327#21333#20301
      FieldName = 'DW'
      Size = 4
    end
    object CkkcHzSLA2: TFloatField
      DisplayLabel = #26399#21021#25968#37327
      FieldName = 'SLA'
      DisplayFormat = '#,0.###'
    end
    object CkkcHzJEA2: TFloatField
      DisplayLabel = #26399#21021#37329#39069
      DisplayWidth = 12
      FieldName = 'JEA'
      DisplayFormat = '#,0.00'
    end
    object CkkcHzSLB: TFloatField
      DisplayLabel = #26412#26399#25910#20837#25968#37327
      FieldName = 'SLB'
      DisplayFormat = '#,0.###'
    end
    object CkkcHzJEB: TFloatField
      DisplayLabel = #26412#26399#25910#20837#37329#39069
      DisplayWidth = 12
      FieldName = 'JEB'
      DisplayFormat = '#,0.00'
    end
    object FloatField46: TFloatField
      DisplayLabel = #26412#26399#21457#20986#25968#37327
      FieldName = 'SLC'
      DisplayFormat = '#,0.###'
    end
    object FloatField47: TFloatField
      DisplayLabel = #26412#26399#21457#20986#37329#39069
      DisplayWidth = 12
      FieldName = 'JEC'
      DisplayFormat = '#,0.00'
    end
    object CkkcHzSLA: TFloatField
      DisplayLabel = #26399#26411#25968#37327
      FieldName = 'SLD'
      DisplayFormat = '#,0.###'
    end
    object CkkcHzJEA: TFloatField
      DisplayLabel = #26399#26411#37329#39069
      DisplayWidth = 12
      FieldName = 'JED'
      DisplayFormat = '#,0.00'
    end
  end
  object sCkkcHz: TDataSource
    DataSet = CkkcHz
    Left = 422
    Top = 110
  end
  object sCkkcMx: TDataSource
    DataSet = CkkcMx
    Left = 456
    Top = 110
  end
  object HpCwb: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pXsMsdj'
    RemoteServer = Data.CnBb
    OnCalcFields = CalcFields_YWY
    Left = 478
    Top = 102
  end
  object sHpCwb: TDataSource
    DataSet = HpCwb
    Left = 490
    Top = 110
  end
  object YfkZb: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pYfkZb'
    RemoteServer = Data.CnBb
    OnCalcFields = CalcFields_MC
    Left = 218
    Top = 152
    object YfkZbID: TIntegerField
      Tag = 1
      FieldName = 'ID'
    end
    object YfkZbBH: TWideStringField
      DisplayLabel = #20379#24212#21830#32534#21495
      FieldName = 'BH'
      Size = 12
    end
    object YfkZbMC: TWideStringField
      DisplayLabel = #20379#24212#21830#21517#31216
      FieldName = 'MC'
    end
    object YfkZbJEA: TFloatField
      DisplayLabel = #26399#21021#20313#39069
      DisplayWidth = 12
      FieldName = 'JEA'
      DisplayFormat = '#,0.00'
    end
    object YfkZbJEB: TFloatField
      DisplayLabel = #26412#26399#24212#20184#27454#21457#29983#25968
      DisplayWidth = 12
      FieldName = 'JEB'
      DisplayFormat = '#,0.00'
    end
    object YfkZbJEC: TFloatField
      DisplayLabel = #26412#26399#20184#27454#21457#29983#25968
      DisplayWidth = 12
      FieldName = 'JEC'
      DisplayFormat = '#,0.00'
    end
    object YfkZbJED: TFloatField
      DisplayLabel = #26399#26411#20313#39069
      DisplayWidth = 12
      FieldName = 'JED'
      DisplayFormat = '#,0.00'
    end
    object YfkZbcMC: TStringField
      FieldKind = fkCalculated
      FieldName = 'cMC'
      Calculated = True
    end
  end
  object YfkZlfx: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pYfkZlfx'
    RemoteServer = Data.CnBb
    Left = 326
    Top = 152
    object YfkZlfxID: TIntegerField
      Tag = 1
      FieldName = 'ID'
    end
    object YfkZlfxBH: TWideStringField
      DisplayLabel = #20379#24212#21830#32534#21495
      FieldName = 'BH'
      Size = 12
    end
    object YfkZlfxMC: TWideStringField
      DisplayLabel = #20379#24212#21830#21517#31216
      FieldName = 'MC'
    end
    object YfkZlfxTS1: TFloatField
      DisplayWidth = 12
      FieldName = 'TS1'
      DisplayFormat = '#,0.00'
    end
    object YfkZlfxTS2: TFloatField
      DisplayWidth = 12
      FieldName = 'TS2'
      DisplayFormat = '#,0.00'
    end
    object YfkZlfxTS3: TFloatField
      DisplayWidth = 12
      FieldName = 'TS3'
      DisplayFormat = '#,0.00'
    end
    object YfkZlfxTS4: TFloatField
      DisplayWidth = 12
      FieldName = 'TS4'
      DisplayFormat = '#,0.00'
    end
    object YfkZlfxTS5: TFloatField
      DisplayWidth = 12
      FieldName = 'TS5'
      DisplayFormat = '#,0.00'
    end
    object YfkZlfxTS6: TFloatField
      DisplayWidth = 12
      FieldName = 'TS6'
      DisplayFormat = '#,0.00'
    end
    object YfkZlfxTS7: TFloatField
      DisplayWidth = 12
      FieldName = 'TS7'
      DisplayFormat = '#,0.00'
    end
    object YfkZlfxTS8: TFloatField
      DisplayWidth = 12
      FieldName = 'TS8'
      DisplayFormat = '#,0.00'
    end
    object YfkZlfxHJ: TFloatField
      DisplayLabel = #21512#35745
      DisplayWidth = 12
      FieldName = 'HJ'
      DisplayFormat = '#,0.00'
    end
  end
  object YskZb: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pYskZb'
    RemoteServer = Data.CnBb
    OnCalcFields = CalcFields_MC
    Left = 2
    Top = 152
    object YskZbID: TIntegerField
      Tag = 1
      FieldName = 'ID'
    end
    object YskZbBH: TWideStringField
      DisplayLabel = #23458#25143#32534#21495
      FieldName = 'BH'
      Size = 12
    end
    object YskZbMC: TWideStringField
      DisplayLabel = #23458#25143#21517#31216
      FieldName = 'MC'
    end
    object YskZbJEA: TFloatField
      DisplayLabel = #26399#21021#20313#39069
      DisplayWidth = 12
      FieldName = 'JEA'
      DisplayFormat = '#,0.00'
    end
    object YskZbJEB: TFloatField
      DisplayLabel = #26412#26399#24212#25910#27454#21457#29983#25968
      DisplayWidth = 12
      FieldName = 'JEB'
      DisplayFormat = '#,0.00'
    end
    object YskZbJEC2: TFloatField
      DisplayLabel = #26412#26399#25910#27454#21457#29983#25968
      DisplayWidth = 12
      FieldName = 'JEC'
      DisplayFormat = '#,0.00'
    end
    object YskZbJEC: TFloatField
      DisplayLabel = #26399#26411#20313#39069
      DisplayWidth = 12
      FieldName = 'JED'
      DisplayFormat = '#,0.00'
    end
    object YskZbcMC: TStringField
      FieldKind = fkCalculated
      FieldName = 'cMC'
      Calculated = True
    end
  end
  object YskZlfx: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pYskZlfx'
    RemoteServer = Data.CnBb
    Left = 110
    Top = 152
    object YskZlfxID: TIntegerField
      Tag = 1
      FieldName = 'ID'
    end
    object YskZlfxBH: TWideStringField
      DisplayLabel = #23458#25143#32534#21495
      FieldName = 'BH'
      Size = 12
    end
    object YskZlfxMC: TWideStringField
      DisplayLabel = #23458#25143#21517#31216
      FieldName = 'MC'
    end
    object YskZlfxTS1: TFloatField
      DisplayWidth = 12
      FieldName = 'TS1'
      DisplayFormat = '#,0.00'
    end
    object YskZlfxTS2: TFloatField
      DisplayWidth = 12
      FieldName = 'TS2'
      DisplayFormat = '#,0.00'
    end
    object YskZlfxTS3: TFloatField
      DisplayWidth = 12
      FieldName = 'TS3'
      DisplayFormat = '#,0.00'
    end
    object YskZlfxTS4: TFloatField
      DisplayWidth = 12
      FieldName = 'TS4'
      DisplayFormat = '#,0.00'
    end
    object YskZlfxTS5: TFloatField
      DisplayWidth = 12
      FieldName = 'TS5'
      DisplayFormat = '#,0.00'
    end
    object YskZlfxTS6: TFloatField
      DisplayWidth = 12
      FieldName = 'TS6'
      DisplayFormat = '#,0.00'
    end
    object YskZlfxTS7: TFloatField
      DisplayWidth = 12
      FieldName = 'TS7'
      DisplayFormat = '#,0.00'
    end
    object YskZlfxTS8: TFloatField
      DisplayWidth = 12
      FieldName = 'TS8'
      DisplayFormat = '#,0.00'
    end
    object YskZlfxHJ: TFloatField
      DisplayLabel = #21512#35745
      DisplayWidth = 12
      FieldName = 'HJ'
      DisplayFormat = '#,0.00'
    end
  end
  object sYfkZb: TDataSource
    DataSet = YfkZb
    Left = 230
    Top = 160
  end
  object sYfkZlfx: TDataSource
    DataSet = YfkZlfx
    Left = 338
    Top = 160
  end
  object sYskZb: TDataSource
    DataSet = YskZb
    Left = 14
    Top = 160
  end
  object sYskZlfx: TDataSource
    DataSet = YskZlfx
    Left = 122
    Top = 160
  end
  object YskMx: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pYskMx'
    RemoteServer = Data.CnBb
    OnCalcFields = CalcFields_PM
    Left = 56
    Top = 152
    object YskMxZBID: TIntegerField
      Tag = 1
      FieldName = 'ZBID'
    end
    object YskMxRQ: TDateField
      DisplayLabel = #35760#24080#26085#26399
      FieldName = 'RQ'
    end
    object YskMxLX: TWideStringField
      DisplayLabel = #19994#21153#31867#22411
      FieldName = 'LX'
      Size = 8
    end
    object YskMxDJBH: TWideStringField
      DisplayLabel = #21333#21495
      FieldName = 'DJBH'
      Size = 12
    end
    object YskMxJEB: TFloatField
      DisplayLabel = #24212#25910#37329#39069
      DisplayWidth = 12
      FieldName = 'JEA'
      OnGetText = ZeroToEmpty
      DisplayFormat = '#,0.00'
    end
    object YskMxJEC: TFloatField
      DisplayLabel = #25910#27454#37329#39069
      DisplayWidth = 12
      FieldName = 'JEB'
      OnGetText = ZeroToEmpty
      DisplayFormat = '#,0.00'
    end
    object YskMxJED: TFloatField
      DisplayLabel = #26399#26411#32467#20313#37329#39069
      DisplayWidth = 12
      FieldName = 'JYJE'
      DisplayFormat = '#,0.00'
    end
  end
  object sYskMx: TDataSource
    DataSet = YskMx
    Left = 68
    Top = 160
  end
  object YfkMx: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pYfkMx'
    RemoteServer = Data.CnBb
    Left = 272
    Top = 152
    object YfkMxZBID: TIntegerField
      Tag = 1
      FieldName = 'ZBID'
    end
    object YfkMxRQ: TDateField
      DisplayLabel = #35760#24080#26085#26399
      FieldName = 'RQ'
    end
    object YfkMxLX: TWideStringField
      DisplayLabel = #19994#21153#31867#22411
      FieldName = 'LX'
      Size = 8
    end
    object YfkMxDJBH: TWideStringField
      DisplayLabel = #21333#21495
      FieldName = 'DJBH'
      Size = 12
    end
    object YfkMxJEA: TFloatField
      DisplayLabel = #24212#20184#37329#39069
      DisplayWidth = 12
      FieldName = 'JEA'
      OnGetText = ZeroToEmpty
      DisplayFormat = '#,0.00'
    end
    object YfkMxJEB: TFloatField
      DisplayLabel = #20184#27454#37329#39069
      DisplayWidth = 12
      FieldName = 'JEB'
      OnGetText = ZeroToEmpty
      DisplayFormat = '#,0.00'
    end
    object YfkMxJYJE: TFloatField
      DisplayLabel = #26399#26411#32467#20313#37329#39069
      DisplayWidth = 12
      FieldName = 'JYJE'
      DisplayFormat = '#,0.00'
    end
  end
  object sYfkMx: TDataSource
    DataSet = YfkMx
    Left = 284
    Top = 160
  end
  object YskZlMx: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pYskZlMx'
    RemoteServer = Data.CnBb
    OnCalcFields = CalcFields_PM
    Left = 164
    Top = 152
    object IntegerField21: TIntegerField
      Tag = 1
      FieldName = 'ZBID'
    end
    object DateField13: TDateField
      DisplayLabel = #24320#21333#26085#26399
      FieldName = 'RQ'
    end
    object FloatField48: TFloatField
      DisplayLabel = #36317#20170#22825#25968
      DisplayWidth = 4
      FieldName = 'TS'
      OnGetText = ZeroToEmpty
      DisplayFormat = '0'
    end
    object WideStringField53: TWideStringField
      DisplayLabel = #21333#21495
      FieldName = 'DJBH'
      Size = 12
    end
    object YskZlMxJEA: TFloatField
      DisplayLabel = #38144#21806#37329#39069
      DisplayWidth = 12
      FieldName = 'JEA'
      DisplayFormat = '#,0.00'
    end
    object FloatField52: TFloatField
      DisplayLabel = #24050#25910#37329#39069
      DisplayWidth = 12
      FieldName = 'JEB'
      DisplayFormat = '#,0.00'
    end
    object FloatField53: TFloatField
      DisplayLabel = #26411#25910#37329#39069
      DisplayWidth = 12
      FieldName = 'JEC'
      DisplayFormat = '#,0.00'
    end
  end
  object sYskZlMx: TDataSource
    DataSet = YskZlMx
    Left = 176
    Top = 160
  end
  object YfkZlMx: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pYfkZlMx'
    RemoteServer = Data.CnBb
    OnCalcFields = CalcFields_PM
    Left = 380
    Top = 152
    object YfkZlMxZBID: TIntegerField
      Tag = 1
      FieldName = 'ZBID'
    end
    object YfkZlMxRQ: TDateField
      DisplayLabel = #24320#21333#26085#26399
      FieldName = 'RQ'
    end
    object YfkZlMxTS: TFloatField
      DisplayLabel = #36317#20170#22825#25968
      DisplayWidth = 4
      FieldName = 'TS'
      OnGetText = ZeroToEmpty
      DisplayFormat = '0'
    end
    object YfkZlMxDJBH: TWideStringField
      DisplayLabel = #21333#21495
      FieldName = 'DJBH'
      Size = 12
    end
    object YfkZlMxJEA: TFloatField
      DisplayLabel = #37319#36141#37329#39069
      DisplayWidth = 12
      FieldName = 'JEA'
      DisplayFormat = '#,0.00'
    end
    object YfkZlMxJEB: TFloatField
      DisplayLabel = #24050#20184#37329#39069
      DisplayWidth = 12
      FieldName = 'JEB'
      DisplayFormat = '#,0.00'
    end
    object YfkZlMxJEC: TFloatField
      DisplayLabel = #26411#20184#37329#39069
      DisplayWidth = 12
      FieldName = 'JEC'
      DisplayFormat = '#,0.00'
    end
  end
  object sYfkZlMx: TDataSource
    DataSet = YfkZlMx
    Left = 392
    Top = 160
  end
  object ZlFxt: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pFxt'
    RemoteServer = Data.CnBb
    OnCalcFields = CalcFields_MC
    Left = 434
    Top = 152
    object ZlFxtMC: TWideStringField
      FieldName = 'MC'
    end
    object ZlFxtcMC: TStringField
      FieldKind = fkCalculated
      FieldName = 'cMC'
      Calculated = True
    end
    object FloatField55: TFloatField
      DisplayLabel = #37319#36141#37329#39069
      DisplayWidth = 12
      FieldName = 'JE'
      DisplayFormat = '#,0.00'
    end
  end
  object sZlfxt: TDataSource
    DataSet = ZlFxt
    Left = 446
    Top = 160
  end
  object RqLsz: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pRqLsz'
    RemoteServer = Data.CnBb
    OnCalcFields = CalcFields_MC
    Left = 2
    Top = 202
    object RqLszLX: TWideStringField
      DisplayLabel = #31867#22411
      FieldName = 'LX'
      Size = 8
    end
    object RqLszZBID: TIntegerField
      Tag = 1
      FieldName = 'ID'
    end
    object RqLszRQ: TDateField
      DisplayLabel = #24320#21333#26085#26399
      FieldName = 'RQ'
    end
    object RqLszDJBH: TWideStringField
      DisplayLabel = #21333#21495
      FieldName = 'DJBH'
      Size = 12
    end
    object RqLszMC1: TWideStringField
      DisplayLabel = #21517#31216
      FieldName = 'MC1'
    end
    object RqLszJEA: TFloatField
      DisplayLabel = #37329#39069
      DisplayWidth = 12
      FieldName = 'JE'
      DisplayFormat = '#,0.00'
    end
    object RqLszMC: TWideStringField
      DisplayLabel = #22791#27880
      DisplayWidth = 40
      FieldName = 'BZ'
      Size = 40
    end
  end
  object GysLsz: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pGysLsz'
    RemoteServer = Data.CnBb
    Left = 110
    Top = 202
    object GysLszLX: TWideStringField
      DisplayLabel = #31867#22411
      FieldName = 'LX'
      Size = 8
    end
    object GysLszID: TIntegerField
      Tag = 1
      FieldName = 'ID'
    end
    object GysLszRQ: TDateField
      DisplayLabel = #24320#21333#26085#26399
      FieldName = 'RQ'
    end
    object GysLszDJBH: TWideStringField
      DisplayLabel = #21333#21495
      FieldName = 'DJBH'
      Size = 12
    end
    object GysLszJE: TFloatField
      DisplayLabel = #37329#39069
      DisplayWidth = 12
      FieldName = 'JE'
      DisplayFormat = '#,0.00'
    end
    object GysLszBZ: TWideStringField
      DisplayLabel = #22791#27880
      DisplayWidth = 40
      FieldName = 'BZ'
      Size = 40
    end
  end
  object sRqLsz: TDataSource
    DataSet = RqLsz
    Left = 18
    Top = 210
  end
  object sGysLsz: TDataSource
    DataSet = GysLsz
    Left = 126
    Top = 210
  end
  object KhLsz: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pKhLsz'
    RemoteServer = Data.CnBb
    OnCalcFields = CalcFields_PM
    Left = 56
    Top = 202
    object KhLszLX: TWideStringField
      DisplayLabel = #31867#22411
      FieldName = 'LX'
      Size = 8
    end
    object KhLszID: TIntegerField
      Tag = 1
      FieldName = 'ID'
    end
    object KhLszRQ: TDateField
      DisplayLabel = #24320#21333#26085#26399
      FieldName = 'RQ'
    end
    object KhLszDJBH: TWideStringField
      DisplayLabel = #21333#21495
      FieldName = 'DJBH'
      Size = 12
    end
    object KhLszJE: TFloatField
      DisplayLabel = #37329#39069
      DisplayWidth = 12
      FieldName = 'JE'
      DisplayFormat = '#,0.00'
    end
    object KhLszBZ: TWideStringField
      DisplayLabel = #22791#27880
      DisplayWidth = 40
      FieldName = 'BZ'
      Size = 40
    end
  end
  object sKhLsz: TDataSource
    DataSet = KhLsz
    Left = 72
    Top = 210
  end
  object SzLsz: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pSzLsz'
    RemoteServer = Data.CnBb
    OnCalcFields = CalcFields_PM
    Left = 218
    Top = 202
    object SzLszLX: TWideStringField
      DisplayLabel = #31867#22411
      FieldName = 'LX'
      Size = 8
    end
    object SzLszBZ: TWideStringField
      DisplayLabel = #25910#27454#21435#21521'/'#20184#27454#26469#28304
      DisplayWidth = 10
      FieldName = 'ZHMC'
    end
    object DateField15: TDateField
      DisplayLabel = #24320#21333#26085#26399
      FieldName = 'RQ'
    end
    object IntegerField23: TIntegerField
      Tag = 1
      FieldName = 'ID'
    end
    object WideStringField59: TWideStringField
      DisplayLabel = #21333#21495
      FieldName = 'DJBH'
      Size = 12
    end
    object SzLszBZ2: TWideStringField
      DisplayLabel = #25910#27454'/'#20184#27454#26041#24335
      DisplayWidth = 10
      FieldName = 'SFKFSMC'
    end
    object FloatField76: TFloatField
      DisplayLabel = #25910#20837#37329#39069
      DisplayWidth = 12
      FieldName = 'JEA'
      OnGetText = ZeroToEmpty
      DisplayFormat = '#,0.00'
    end
    object FloatField77: TFloatField
      DisplayLabel = #25903#20986#37329#39069
      DisplayWidth = 12
      FieldName = 'JEB'
      OnGetText = ZeroToEmpty
      DisplayFormat = '#,0.00'
    end
    object SzLszBZ3: TWideStringField
      DisplayLabel = #22791#27880
      DisplayWidth = 40
      FieldName = 'BZ'
      Size = 40
    end
  end
  object sSzLsz: TDataSource
    DataSet = SzLsz
    Left = 234
    Top = 210
  end
  object CkLsz: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pCkLsz'
    RemoteServer = Data.CnBb
    OnCalcFields = CalcFields_PM
    Left = 164
    Top = 202
    object IntegerField1: TIntegerField
      Tag = 1
      FieldName = 'ZBID'
    end
    object CkLszLX: TWideStringField
      DisplayLabel = #31867#22411
      FieldName = 'LX'
      Size = 8
    end
    object DateField14: TDateField
      DisplayLabel = #24320#21333#26085#26399
      FieldName = 'RQ'
    end
    object WideStringField52: TWideStringField
      DisplayLabel = #21333#21495
      FieldName = 'DJBH'
      Size = 12
    end
    object CkLszBH: TWideStringField
      DisplayLabel = #36135#21697#32534#21495
      FieldName = 'BH'
    end
    object CkLszPM: TWideStringField
      DisplayLabel = #21697#21517#35268#26684
      FieldName = 'PM'
      Size = 40
    end
    object CkLszDW: TWideStringField
      DisplayLabel = #35745#37327#21333#20301
      FieldName = 'DW'
      Size = 4
    end
    object CkLszSL1: TFloatField
      DisplayLabel = #25968#37327
      FieldName = 'SL1'
      DisplayFormat = '#,0.###'
    end
    object CkLszDJ1: TFloatField
      DisplayLabel = #21333#20215
      DisplayWidth = 10
      FieldName = 'DJ1'
      DisplayFormat = '#,0.###'
    end
    object CkLszJE1: TFloatField
      DisplayLabel = #37329#39069
      DisplayWidth = 12
      FieldName = 'JE1'
      DisplayFormat = '#,0.00'
    end
  end
  object sCkLsz: TDataSource
    DataSet = CkLsz
    Left = 180
    Top = 210
  end
  object YyqkHz: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pYyqkHz'
    RemoteServer = Data.CnBb
    OnCalcFields = CalcFields_MC
    Left = 488
    Top = 202
    object IntegerField2: TIntegerField
      Tag = 1
      FieldName = 'ID'
    end
    object WideStringField54: TWideStringField
      DisplayLabel = #20379#24212#21830#32534#21495
      FieldName = 'BH'
      Size = 12
    end
    object WideStringField55: TWideStringField
      DisplayLabel = #20379#24212#21830#21517#31216
      FieldName = 'MC'
    end
    object FloatField54: TFloatField
      DisplayLabel = #26399#21021#24212#20184#27454
      DisplayWidth = 12
      FieldName = 'JEA'
      DisplayFormat = '#,0.00'
    end
    object FloatField56: TFloatField
      DisplayLabel = #26412#26399#24212#20184#27454
      DisplayWidth = 12
      FieldName = 'JEB'
      DisplayFormat = '#,0.00'
    end
    object FloatField57: TFloatField
      DisplayLabel = #26412#26399#24050#20184#24212#20184#27454
      DisplayWidth = 12
      FieldName = 'JEC'
      DisplayFormat = '#,0.00'
    end
    object FloatField58: TFloatField
      DisplayLabel = #26399#26411#24212#20184#27454
      DisplayWidth = 12
      FieldName = 'JED'
      DisplayFormat = '#,0.00'
    end
    object StringField9: TStringField
      FieldKind = fkCalculated
      FieldName = 'cMC'
      Calculated = True
    end
  end
  object SzHz: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pSzHz'
    RemoteServer = Data.CnBb
    OnCalcFields = CalcFields_MC
    Left = 272
    Top = 202
    object IntegerField22: TIntegerField
      Tag = 1
      FieldName = 'ID'
    end
    object WideStringField56: TWideStringField
      DisplayLabel = #32534#21495
      FieldName = 'BH'
      Size = 6
    end
    object WideStringField57: TWideStringField
      DisplayLabel = #25910#20837#25903#20986#31867#21035#21517#31216
      FieldName = 'MC'
    end
    object FloatField59: TFloatField
      DisplayLabel = #25910#20837#37329#39069
      DisplayWidth = 12
      FieldName = 'JEA'
      OnGetText = ZeroToEmpty
      DisplayFormat = '#,0.00'
    end
    object FloatField60: TFloatField
      DisplayLabel = #25903#20986#37329#39069
      DisplayWidth = 12
      FieldName = 'JEB'
      OnGetText = ZeroToEmpty
      DisplayFormat = '#,0.00'
    end
  end
  object XjyhHz: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pXjyhHz'
    RemoteServer = Data.CnBb
    OnCalcFields = CalcFields_MC
    Left = 380
    Top = 202
    object IntegerField24: TIntegerField
      Tag = 1
      FieldName = 'ID'
    end
    object WideStringField60: TWideStringField
      DisplayLabel = #24080#25143#21517#31216
      FieldName = 'MC'
    end
    object WideStringField58: TWideStringField
      DisplayLabel = #38134#34892#24080#21495
      FieldName = 'YHZH'
    end
    object XjyhHzJEA: TFloatField
      DisplayLabel = #26399#21021#32467#20313
      DisplayWidth = 12
      FieldName = 'JEA'
      DisplayFormat = '#,0.00'
    end
    object XjyhHzJEB: TFloatField
      DisplayLabel = #26412#26399#25910#20837
      DisplayWidth = 12
      FieldName = 'JEB'
      DisplayFormat = '#,0.00'
    end
    object XjyhHzJEC: TFloatField
      DisplayLabel = #26412#26399#25903#20986
      DisplayWidth = 12
      FieldName = 'JEC'
      DisplayFormat = '#,0.00'
    end
    object XjyhHzJED: TFloatField
      DisplayLabel = #26399#26411#32467#20313
      DisplayWidth = 12
      FieldName = 'JED'
      DisplayFormat = '#,0.00'
    end
    object XjyhHzcMC: TStringField
      FieldKind = fkCalculated
      FieldName = 'cMC'
      Calculated = True
    end
  end
  object sYyqkHz: TDataSource
    DataSet = YyqkHz
    Left = 504
    Top = 210
  end
  object sSzHz: TDataSource
    DataSet = SzHz
    Left = 288
    Top = 210
  end
  object sXjyhHz: TDataSource
    DataSet = XjyhHz
    Left = 396
    Top = 210
  end
  object SzMx: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pSzMx'
    RemoteServer = Data.CnBb
    OnCalcFields = CalcFields_PM
    Left = 326
    Top = 202
    object IntegerField25: TIntegerField
      Tag = 1
      FieldName = 'ZBID'
    end
    object DateField16: TDateField
      DisplayLabel = #35760#24080#26085#26399
      FieldName = 'RQ'
    end
    object WideStringField61: TWideStringField
      DisplayLabel = #19994#21153#31867#22411
      FieldName = 'LX'
      Size = 8
    end
    object WideStringField62: TWideStringField
      DisplayLabel = #21333#21495
      FieldName = 'DJBH'
      Size = 12
    end
    object FloatField78: TFloatField
      DisplayLabel = #25910#20837#37329#39069
      DisplayWidth = 12
      FieldName = 'JEA'
      OnGetText = ZeroToEmpty
      DisplayFormat = '#,0.00'
    end
    object FloatField79: TFloatField
      DisplayLabel = #25903#20986#37329#39069
      DisplayWidth = 12
      FieldName = 'JEB'
      OnGetText = ZeroToEmpty
      DisplayFormat = '#,0.00'
    end
  end
  object sSzMx: TDataSource
    DataSet = SzMx
    Left = 342
    Top = 210
  end
  object XjyhMx: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pXjyhMx'
    RemoteServer = Data.CnBb
    OnCalcFields = CalcFields_PM
    Left = 434
    Top = 202
    object IntegerField26: TIntegerField
      Tag = 1
      FieldName = 'ID'
    end
    object DateField17: TDateField
      DisplayLabel = #24320#21333#26085#26399
      FieldName = 'RQ'
    end
    object XjyhMxLX: TWideStringField
      DisplayLabel = #19994#21153#31867#22411
      FieldName = 'LX'
      Size = 8
    end
    object WideStringField63: TWideStringField
      DisplayLabel = #21333#21495
      FieldName = 'DJBH'
      Size = 12
    end
    object FloatField82: TFloatField
      DisplayLabel = #25910#20837#37329#39069
      DisplayWidth = 12
      FieldName = 'JEA'
      OnGetText = ZeroToEmpty
      DisplayFormat = '#,0.00'
    end
    object FloatField83: TFloatField
      DisplayLabel = #25903#20986#37329#39069
      DisplayWidth = 12
      FieldName = 'JEB'
      OnGetText = ZeroToEmpty
      DisplayFormat = '#,0.00'
    end
    object XjyhMxJYJE: TFloatField
      DisplayLabel = #20313#39069
      DisplayWidth = 12
      FieldName = 'JYJE'
      DisplayFormat = '#,0.00'
    end
  end
  object sXjyhMx: TDataSource
    DataSet = XjyhMx
    Left = 450
    Top = 210
  end
  object Yylrb: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pYylrb'
    RemoteServer = Data.CnBb
    OnCalcFields = CalcFields_MC
    Left = 2
    Top = 252
    object YylrbYF: TIntegerField
      Tag = 1
      DisplayLabel = #26376#20221
      DisplayWidth = 4
      FieldName = 'YF'
    end
    object YylrbJEA: TFloatField
      DisplayLabel = #38144#21806#37329#39069
      DisplayWidth = 12
      FieldName = 'JEA'
      DisplayFormat = '#,0.00'
    end
    object YylrbCBJE: TFloatField
      DisplayLabel = #38144#21806#25104#26412
      DisplayWidth = 12
      FieldName = 'CBJE'
      DisplayFormat = '#,0.00'
    end
    object YylrbLRJE4: TFloatField
      DisplayLabel = #38144#21806#27611#21033
      DisplayWidth = 12
      FieldName = 'LRJE'
      DisplayFormat = '#,0.00'
    end
    object YylrbLRJE2: TFloatField
      DisplayLabel = #20854#23427#25910#20837
      DisplayWidth = 12
      FieldName = 'SRJE'
      DisplayFormat = '#,0.00'
    end
    object YylrbLRJE: TFloatField
      DisplayLabel = #36153#29992#24320#25903
      DisplayWidth = 12
      FieldName = 'FYJE'
      DisplayFormat = '#,0.00'
    end
    object YylrbLRJE3: TFloatField
      DisplayLabel = #33829#19994#21033#28070
      DisplayWidth = 12
      FieldName = 'YYLR'
      DisplayFormat = '#,0.00'
    end
  end
  object JdqYsk: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pJdqYsk'
    RemoteServer = Data.CnBb
    Left = 110
    Top = 252
    object JdqYskID: TIntegerField
      Tag = 1
      FieldName = 'ID'
    end
    object JdqYskDJBH: TWideStringField
      DisplayLabel = #38144#21806#21333#21495
      FieldName = 'DJBH'
      Size = 12
    end
    object JdqYskBH: TWideStringField
      DisplayLabel = #23458#25143#32534#21495
      FieldName = 'BH'
      Size = 12
    end
    object JdqYskMC: TWideStringField
      DisplayLabel = #23458#25143#21517#31216
      FieldName = 'MC'
    end
    object JdqYskXDRQ: TDateField
      DisplayLabel = #38480#23450#26085#26399
      FieldName = 'XDRQ'
    end
    object JdqYskJE: TFloatField
      DisplayLabel = #24212#25910#37329#39069
      DisplayWidth = 12
      FieldName = 'JE'
      DisplayFormat = '#,0.00'
    end
    object JdqYskYSJE: TFloatField
      DisplayLabel = #24050#25910#37329#39069
      DisplayWidth = 12
      FieldName = 'YSJE'
      DisplayFormat = '#,0.00'
    end
    object JdqYskMSJE: TFloatField
      DisplayLabel = #26410#25910#37329#39069
      DisplayWidth = 12
      FieldName = 'MSJE'
      DisplayFormat = '#,0.00'
    end
  end
  object sYylrb: TDataSource
    DataSet = Yylrb
    Left = 14
    Top = 256
  end
  object sJdqYsk: TDataSource
    DataSet = JdqYsk
    Left = 122
    Top = 256
  end
  object CqYsk: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pCqYsk'
    RemoteServer = Data.CnBb
    OnCalcFields = CalcFields_PM
    Left = 56
    Top = 252
    object IntegerField29: TIntegerField
      Tag = 1
      FieldName = 'ID'
    end
    object WideStringField72: TWideStringField
      DisplayLabel = #38144#21806#21333#21495
      FieldName = 'DJBH'
      Size = 12
    end
    object CqYskBH: TWideStringField
      DisplayLabel = #23458#25143#32534#21495
      FieldName = 'BH'
      Size = 12
    end
    object CqYskMC: TWideStringField
      DisplayLabel = #23458#25143#21517#31216
      FieldName = 'MC'
    end
    object DateField20: TDateField
      DisplayLabel = #38480#23450#26085#26399
      FieldName = 'XDRQ'
    end
    object FloatField67: TFloatField
      DisplayLabel = #24212#25910#37329#39069
      DisplayWidth = 12
      FieldName = 'JE'
      DisplayFormat = '#,0.00'
    end
    object CqYskQFJE: TFloatField
      DisplayLabel = #24050#25910#37329#39069
      DisplayWidth = 12
      FieldName = 'YSJE'
      DisplayFormat = '#,0.00'
    end
    object CqYskQFJE2: TFloatField
      DisplayLabel = #26410#25910#37329#39069
      DisplayWidth = 12
      FieldName = 'MSJE'
      DisplayFormat = '#,0.00'
    end
  end
  object sCqYsk: TDataSource
    DataSet = CqYsk
    Left = 68
    Top = 256
  end
  object JdqYfk: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pJdqYfk'
    RemoteServer = Data.CnBb
    OnCalcFields = CalcFields_PM
    Left = 218
    Top = 252
    object JdqYfkID: TIntegerField
      Tag = 1
      FieldName = 'ID'
    end
    object JdqYfkDJBH: TWideStringField
      DisplayLabel = #37319#36141#21333#21495
      FieldName = 'DJBH'
      Size = 12
    end
    object JdqYfkBH: TWideStringField
      DisplayLabel = #20379#24212#21830#32534#21495
      FieldName = 'BH'
      Size = 12
    end
    object JdqYfkMC: TWideStringField
      DisplayLabel = #20379#24212#21830#21517#31216
      FieldName = 'MC'
    end
    object JdqYfkXDRQ: TDateField
      DisplayLabel = #38480#23450#26085#26399
      FieldName = 'XDRQ'
    end
    object JdqYfkJE: TFloatField
      DisplayLabel = #24212#20184#37329#39069
      DisplayWidth = 12
      FieldName = 'JE'
      DisplayFormat = '#,0.00'
    end
    object JdqYfkYSJE: TFloatField
      DisplayLabel = #24050#20184#37329#39069
      DisplayWidth = 12
      FieldName = 'YFJE'
      DisplayFormat = '#,0.00'
    end
    object JdqYfkMSJE: TFloatField
      DisplayLabel = #26410#20184#37329#39069
      DisplayWidth = 12
      FieldName = 'MFJE'
      DisplayFormat = '#,0.00'
    end
  end
  object sJdqYfk: TDataSource
    DataSet = JdqYfk
    Left = 230
    Top = 256
  end
  object CqYfk: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pCqYfk'
    RemoteServer = Data.CnBb
    OnCalcFields = CalcFields_PM
    Left = 164
    Top = 252
    object CqYfkID: TIntegerField
      Tag = 1
      FieldName = 'ID'
    end
    object CqYfkDJBH: TWideStringField
      DisplayLabel = #37319#36141#21333#21495
      FieldName = 'DJBH'
      Size = 12
    end
    object CqYfkBH: TWideStringField
      DisplayLabel = #20379#24212#21830#32534#21495
      FieldName = 'BH'
      Size = 12
    end
    object CqYfkMC: TWideStringField
      DisplayLabel = #20379#24212#21830#21517#31216
      FieldName = 'MC'
    end
    object CqYfkXDRQ: TDateField
      DisplayLabel = #38480#23450#26085#26399
      FieldName = 'XDRQ'
    end
    object CqYfkJE: TFloatField
      DisplayLabel = #24212#20184#37329#39069
      DisplayWidth = 12
      FieldName = 'JE'
      DisplayFormat = '#,0.00'
    end
    object CqYfkYSJE: TFloatField
      DisplayLabel = #24050#20184#37329#39069
      DisplayWidth = 12
      FieldName = 'YFJE'
      DisplayFormat = '#,0.00'
    end
    object CqYfkMSJE: TFloatField
      DisplayLabel = #26410#20184#37329#39069
      DisplayWidth = 12
      FieldName = 'MFJE'
      DisplayFormat = '#,0.00'
    end
  end
  object sCqYfk: TDataSource
    DataSet = CqYfk
    Left = 176
    Top = 256
  end
end
