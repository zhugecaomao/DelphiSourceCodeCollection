object DataTjb: TDataTjb
  OldCreateOrder = False
  Left = 19
  Top = 91
  Height = 455
  Width = 762
  object HP: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pBb'
    RemoteServer = Data.Cn
    Left = 12
    Top = 318
    object HPID: TIntegerField
      Tag = 1
      FieldName = 'ID'
    end
    object HPBH: TWideStringField
      DisplayLabel = '货品编号'
      FieldName = 'BH'
    end
    object HPPM: TWideStringField
      DisplayLabel = '品名规格'
      FieldName = 'PM'
      Size = 40
    end
    object HPDW: TWideStringField
      DisplayLabel = '计量单位'
      FieldName = 'DW'
      Size = 4
    end
  end
  object KhXsHz: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pBb'
    RemoteServer = Data.Cn
    OnCalcFields = CalcFields_MC
    Left = 12
    Top = 24
    object KhXsHzID: TIntegerField
      Tag = 1
      FieldName = 'ID'
    end
    object KhXsHzBH: TWideStringField
      DisplayLabel = '客户编号'
      FieldName = 'BH'
      Size = 12
    end
    object KhXsHzMC: TWideStringField
      DisplayLabel = '客户名称'
      FieldName = 'MC'
    end
    object KhXsHzJE: TFloatField
      DisplayLabel = '销售金额'
      DisplayWidth = 12
      FieldName = 'JEA'
      DisplayFormat = '#,0.00'
    end
    object KhXsHzJE2: TFloatField
      DisplayLabel = '销售税额'
      DisplayWidth = 12
      FieldName = 'JEB'
      DisplayFormat = '#,0.00'
    end
    object KhXsHzJE3: TFloatField
      DisplayLabel = '价税合计'
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
  object ClientDataSet2: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pBb'
    RemoteServer = Data.Cn
    Left = 240
    Top = 330
  end
  object GYS: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pBb'
    RemoteServer = Data.Cn
    Left = 54
    Top = 318
    object IntegerField1: TIntegerField
      Tag = 1
      FieldName = 'ID'
    end
    object GYSBH: TWideStringField
      DisplayLabel = '供应商编号'
      FieldName = 'BH'
      Size = 12
    end
    object GYSMC: TWideStringField
      DisplayLabel = '供应商简称'
      FieldName = 'MC'
    end
  end
  object KH: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pBb'
    RemoteServer = Data.Cn
    Left = 96
    Top = 318
    object IntegerField2: TIntegerField
      Tag = 1
      FieldName = 'ID'
    end
    object KHBH: TWideStringField
      DisplayLabel = '客户编号'
      FieldName = 'BH'
      Size = 12
    end
    object KHMC: TWideStringField
      DisplayLabel = '客户简称'
      FieldName = 'MC'
    end
  end
  object YW: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pBb'
    RemoteServer = Data.Cn
    Left = 138
    Top = 318
    object YWY: TWideStringField
      DisplayLabel = '业务员'
      FieldName = 'YWY'
      Size = 8
    end
  end
  object SlDjJe: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pBb'
    RemoteServer = Data.Cn
    Left = 180
    Top = 318
    object SlDjJeSL: TFloatField
      DisplayLabel = '数量'
      FieldName = 'SL'
      DisplayFormat = '#,0.###'
    end
    object SlDjJeDJ2: TFloatField
      DisplayLabel = '单价'
      DisplayWidth = 10
      FieldName = 'DJ'
      DisplayFormat = '#,0.###'
    end
    object SlDjJeDJ: TFloatField
      DisplayLabel = '税率'
      DisplayWidth = 10
      FieldName = 'NSL'
      OnGetText = NSLGetText
      DisplayFormat = '0.#'
    end
    object SlDjJeJE: TFloatField
      DisplayLabel = '金额'
      DisplayWidth = 12
      FieldName = 'JE'
      DisplayFormat = '#,0.00'
    end
  end
  object KhXsMx: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pBb'
    RemoteServer = Data.Cn
    Left = 60
    Top = 24
    object KhXsMxZBID: TIntegerField
      Tag = 1
      FieldName = 'ZBID'
    end
    object KhXsMxRQ: TDateField
      DisplayLabel = '开单日期'
      FieldName = 'RQ'
    end
    object KhXsMxDJBH: TWideStringField
      DisplayLabel = '单号'
      FieldName = 'DJBH'
      Size = 12
    end
    object KhXsMxBH: TWideStringField
      DisplayLabel = '货品编号'
      FieldName = 'BH'
    end
    object KhXsMxPM: TWideStringField
      DisplayLabel = '货品名称'
      FieldName = 'PM'
      Size = 40
    end
    object KhXsMxDW: TWideStringField
      DisplayLabel = '计量单位'
      FieldName = 'DW'
      Size = 4
    end
    object KhXsMxSL: TFloatField
      DisplayLabel = '数量'
      FieldName = 'SL'
      DisplayFormat = '#,0.###'
    end
    object KhXsMxDJ: TFloatField
      DisplayLabel = '单价'
      DisplayWidth = 10
      FieldName = 'DJ'
      DisplayFormat = '#,0.###'
    end
    object KhXsMxNSL: TFloatField
      DisplayLabel = '税率'
      DisplayWidth = 10
      FieldName = 'NSL'
      OnGetText = NSLGetText
      DisplayFormat = '0.#'
    end
    object KhXsMxJEA: TFloatField
      DisplayLabel = '销售金额'
      DisplayWidth = 12
      FieldName = 'JEA'
      DisplayFormat = '#,0.00'
    end
    object KhXsMxJEB: TFloatField
      DisplayLabel = '销售税额'
      DisplayWidth = 12
      FieldName = 'JEB'
      DisplayFormat = '#,0.00'
    end
    object KhXsMxJEC: TFloatField
      DisplayLabel = '价税合计'
      DisplayWidth = 12
      FieldName = 'JEC'
      DisplayFormat = '#,0.00'
    end
  end
  object HpXsHz: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pBb'
    RemoteServer = Data.Cn
    OnCalcFields = CalcFields_PM
    Left = 108
    Top = 24
    object IntegerField3: TIntegerField
      Tag = 1
      FieldName = 'ID'
    end
    object HpXsHzBH: TWideStringField
      DisplayLabel = '货品编号'
      FieldName = 'BH'
    end
    object HpXsHzPM: TWideStringField
      DisplayLabel = '品名规格'
      FieldName = 'PM'
      Size = 40
    end
    object HpXsHzDW: TWideStringField
      DisplayLabel = '计量单位'
      FieldName = 'DW'
      Size = 4
    end
    object HpXsHzSL: TFloatField
      DisplayLabel = '数量'
      FieldName = 'SL'
      DisplayFormat = '#,0.###'
    end
    object FloatField1: TFloatField
      DisplayLabel = '销售金额'
      DisplayWidth = 12
      FieldName = 'JEA'
      DisplayFormat = '#,0.00'
    end
    object FloatField2: TFloatField
      DisplayLabel = '销售税额'
      DisplayWidth = 12
      FieldName = 'JEB'
      DisplayFormat = '#,0.00'
    end
    object FloatField3: TFloatField
      DisplayLabel = '价税合计'
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
    ProviderName = 'pBb'
    RemoteServer = Data.Cn
    Left = 156
    Top = 24
    object IntegerField4: TIntegerField
      Tag = 1
      FieldName = 'ZBID'
    end
    object DateField1: TDateField
      DisplayLabel = '开单日期'
      FieldName = 'RQ'
    end
    object WideStringField3: TWideStringField
      DisplayLabel = '单号'
      FieldName = 'DJBH'
      Size = 12
    end
    object HpXsMxBH: TWideStringField
      DisplayLabel = '客户编号'
      FieldName = 'BH'
      Size = 12
    end
    object HpXsMxMC: TWideStringField
      DisplayLabel = '客户名称'
      FieldName = 'MC'
    end
    object FloatField4: TFloatField
      DisplayLabel = '数量'
      FieldName = 'SL'
      DisplayFormat = '#,0.###'
    end
    object FloatField5: TFloatField
      DisplayLabel = '单价'
      DisplayWidth = 10
      FieldName = 'DJ'
      DisplayFormat = '#,0.###'
    end
    object FloatField6: TFloatField
      DisplayLabel = '税率'
      DisplayWidth = 10
      FieldName = 'NSL'
      OnGetText = NSLGetText
      DisplayFormat = '0.#'
    end
    object FloatField7: TFloatField
      DisplayLabel = '销售金额'
      DisplayWidth = 12
      FieldName = 'JEA'
      DisplayFormat = '#,0.00'
    end
    object FloatField8: TFloatField
      DisplayLabel = '销售税额'
      DisplayWidth = 12
      FieldName = 'JEB'
      DisplayFormat = '#,0.00'
    end
    object FloatField9: TFloatField
      DisplayLabel = '价税合计'
      DisplayWidth = 12
      FieldName = 'JEC'
      DisplayFormat = '#,0.00'
    end
  end
  object YwyXsHz: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pBb'
    RemoteServer = Data.Cn
    OnCalcFields = CalcFields_YWY
    Left = 204
    Top = 24
    object YwyXsHzYWY: TWideStringField
      DisplayLabel = '业务员'
      FieldName = 'YWY'
      Size = 8
    end
    object FloatField11: TFloatField
      DisplayLabel = '销售金额'
      DisplayWidth = 12
      FieldName = 'JEA'
      DisplayFormat = '#,0.00'
    end
    object FloatField12: TFloatField
      DisplayLabel = '销售税额'
      DisplayWidth = 12
      FieldName = 'JEB'
      DisplayFormat = '#,0.00'
    end
    object FloatField13: TFloatField
      DisplayLabel = '价税合计'
      DisplayWidth = 12
      FieldName = 'JEC'
      DisplayFormat = '#,0.00'
    end
    object StringField2: TStringField
      FieldKind = fkCalculated
      FieldName = 'cYWY'
      Size = 8
      Calculated = True
    end
  end
  object YwyXsMx: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pBb'
    RemoteServer = Data.Cn
    Left = 252
    Top = 24
    object IntegerField6: TIntegerField
      Tag = 1
      FieldName = 'ZBID'
    end
    object DateField2: TDateField
      DisplayLabel = '开单日期'
      FieldName = 'RQ'
    end
    object WideStringField5: TWideStringField
      DisplayLabel = '单号'
      FieldName = 'DJBH'
      Size = 12
    end
    object WideStringField6: TWideStringField
      DisplayLabel = '客户编号'
      FieldName = 'BH'
      Size = 12
    end
    object WideStringField7: TWideStringField
      DisplayLabel = '客户名称'
      FieldName = 'MC'
    end
    object FloatField17: TFloatField
      DisplayLabel = '销售金额'
      DisplayWidth = 12
      FieldName = 'JEA'
      DisplayFormat = '#,0.00'
    end
    object FloatField18: TFloatField
      DisplayLabel = '销售税额'
      DisplayWidth = 12
      FieldName = 'JEB'
      DisplayFormat = '#,0.00'
    end
    object FloatField19: TFloatField
      DisplayLabel = '价税合计'
      DisplayWidth = 12
      FieldName = 'JEC'
      DisplayFormat = '#,0.00'
    end
  end
  object DqXsHz: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pBb'
    RemoteServer = Data.Cn
    OnCalcFields = CalcFields_MC
    Left = 300
    Top = 24
    object WideStringField1: TWideStringField
      DisplayLabel = '地区'
      FieldName = 'MC'
      Size = 12
    end
    object FloatField10: TFloatField
      DisplayLabel = '销售金额'
      DisplayWidth = 12
      FieldName = 'JEA'
      DisplayFormat = '#,0.00'
    end
    object FloatField14: TFloatField
      DisplayLabel = '销售税额'
      DisplayWidth = 12
      FieldName = 'JEB'
      DisplayFormat = '#,0.00'
    end
    object FloatField15: TFloatField
      DisplayLabel = '价税合计'
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
    ProviderName = 'pBb'
    RemoteServer = Data.Cn
    Left = 348
    Top = 24
    object IntegerField5: TIntegerField
      Tag = 1
      FieldName = 'ZBID'
    end
    object DateField3: TDateField
      DisplayLabel = '开单日期'
      FieldName = 'RQ'
    end
    object WideStringField2: TWideStringField
      DisplayLabel = '单号'
      FieldName = 'DJBH'
      Size = 12
    end
    object WideStringField4: TWideStringField
      DisplayLabel = '客户编号'
      FieldName = 'BH'
      Size = 12
    end
    object WideStringField8: TWideStringField
      DisplayLabel = '客户名称'
      FieldName = 'MC'
    end
    object FloatField16: TFloatField
      DisplayLabel = '销售金额'
      DisplayWidth = 12
      FieldName = 'JEA'
      DisplayFormat = '#,0.00'
    end
    object FloatField20: TFloatField
      DisplayLabel = '销售税额'
      DisplayWidth = 12
      FieldName = 'JEB'
      DisplayFormat = '#,0.00'
    end
    object FloatField21: TFloatField
      DisplayLabel = '价税合计'
      DisplayWidth = 12
      FieldName = 'JEC'
      DisplayFormat = '#,0.00'
    end
  end
  object sKhXsHz: TDataSource
    DataSet = KhXsHz
    Left = 12
    Top = 12
  end
  object sKhXsMx: TDataSource
    DataSet = KhXsMx
    Left = 60
    Top = 12
  end
  object sHpXsHz: TDataSource
    DataSet = HpXsHz
    Left = 108
    Top = 12
  end
  object sHpXsMx: TDataSource
    DataSet = HpXsMx
    Left = 156
    Top = 12
  end
  object sYwyXsHz: TDataSource
    DataSet = YwyXsHz
    Left = 204
    Top = 12
  end
  object sYwyXsMx: TDataSource
    DataSet = YwyXsMx
    Left = 252
    Top = 12
  end
  object sDqXsHz: TDataSource
    DataSet = DqXsHz
    Left = 300
    Top = 12
  end
  object sDqXsMx: TDataSource
    DataSet = DqXsMx
    Left = 348
    Top = 12
  end
  object DataSource1: TDataSource
    DataSet = HP
    Left = 240
    Top = 318
  end
end
