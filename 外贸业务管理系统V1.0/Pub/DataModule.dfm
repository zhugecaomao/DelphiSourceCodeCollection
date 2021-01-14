object DataModule_frm: TDataModule_frm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 98
  Top = 106
  Height = 536
  Width = 832
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=Data/Demo.mdb;Persi' +
      'st Security Info=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 56
    Top = 16
  end
  object Query: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 136
    Top = 16
  end
  object ProcQuery: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 216
    Top = 16
  end
  object PubQuery: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 280
    Top = 16
  end
  object ds_ProductType: TDataSource
    DataSet = Query_ProductType
    Left = 48
    Top = 80
  end
  object Query_ProductType: TADOQuery
    AutoCalcFields = False
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'select * from DictProductType')
    Left = 48
    Top = 136
  end
  object Query_PackageUnit: TADOQuery
    AutoCalcFields = False
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'select * from DictPackageUnit')
    Left = 144
    Top = 136
  end
  object ds_PackageUnit: TDataSource
    DataSet = Query_PackageUnit
    Left = 144
    Top = 80
  end
  object Query_WeightUnit: TADOQuery
    AutoCalcFields = False
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'select * from DictWeightUnit')
    Left = 248
    Top = 136
  end
  object ds_WeightUnit: TDataSource
    DataSet = Query_WeightUnit
    Left = 248
    Top = 80
  end
  object Query_AmountUnit: TADOQuery
    AutoCalcFields = False
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'select * from DictAmountUnit')
    Left = 344
    Top = 136
  end
  object ds_AmountUnit: TDataSource
    DataSet = Query_AmountUnit
    Left = 344
    Top = 80
  end
  object ds_ExchangeRate: TDataSource
    DataSet = Query_ExchangeRate
    Left = 48
    Top = 224
  end
  object Query_ExchangeRate: TADOQuery
    AutoCalcFields = False
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from DictExchangeRate')
    Left = 48
    Top = 272
    object Query_ExchangeRateDictID: TWideStringField
      FieldName = 'DictID'
      Size = 3
    end
    object Query_ExchangeRateDictName: TWideStringField
      FieldName = 'DictName'
      Size = 50
    end
    object Query_ExchangeRatePriceRate: TFloatField
      FieldName = 'PriceRate'
      DisplayFormat = '0.00'
    end
  end
  object ds_CurrencySort: TDataSource
    DataSet = Query_CurrencySort
    Left = 136
    Top = 224
  end
  object Query_CurrencySort: TADOQuery
    AutoCalcFields = False
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from DictCurrencySort')
    Left = 136
    Top = 272
    object Query_CurrencySortDictID: TWideStringField
      FieldName = 'DictID'
      Size = 3
    end
    object Query_CurrencySortDictName: TWideStringField
      FieldName = 'DictName'
      Size = 50
    end
    object Query_CurrencySortDictCode: TWideStringField
      FieldName = 'DictCode'
    end
    object Query_CurrencySortDictEnName: TWideStringField
      FieldName = 'DictEnName'
      Size = 50
    end
    object Query_CurrencySortUSBRate: TFloatField
      DisplayWidth = 10
      FieldName = 'USBRate'
      DisplayFormat = '0.00'
    end
  end
  object ds_GoodsBox: TDataSource
    DataSet = Query_GoodsBox
    Left = 248
    Top = 224
  end
  object Query_GoodsBox: TADOQuery
    AutoCalcFields = False
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from DictGoodsBox')
    Left = 248
    Top = 272
  end
  object ds_Color: TDataSource
    DataSet = Query_Color
    Left = 344
    Top = 224
  end
  object Query_Color: TADOQuery
    AutoCalcFields = False
    Connection = ADOConnection1
    Parameters = <>
    Left = 344
    Top = 272
  end
  object ds_InsuranceItem: TDataSource
    DataSet = Query_InsuranceItem
    Left = 432
    Top = 224
  end
  object Query_InsuranceItem: TADOQuery
    AutoCalcFields = False
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'select * from DictInsuranceItem')
    Left = 432
    Top = 272
  end
  object ds_ProductCode: TDataSource
    DataSet = Query_ProductCode
    Left = 432
    Top = 80
  end
  object Query_ProductCode: TADOQuery
    AutoCalcFields = False
    Connection = ADOConnection1
    Parameters = <>
    Left = 432
    Top = 136
  end
  object ds_FactoryInfo: TDataSource
    DataSet = Query_FactoryInfo
    Left = 48
    Top = 352
  end
  object Query_FactoryInfo: TADOQuery
    AutoCalcFields = False
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from FactoryInfo')
    Left = 48
    Top = 408
  end
  object ds_RemitMode: TDataSource
    DataSet = Query_RemitMode
    Left = 144
    Top = 352
  end
  object Query_RemitMode: TADOQuery
    AutoCalcFields = False
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from DictRemitMode')
    Left = 144
    Top = 400
  end
  object ds_CompanyInfo: TDataSource
    DataSet = Query_CompanyInfo
    Left = 240
    Top = 352
  end
  object Query_CompanyInfo: TADOQuery
    AutoCalcFields = False
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from CompanyInfo')
    Left = 240
    Top = 400
  end
  object ds_Port: TDataSource
    DataSet = Query_Port
    Left = 344
    Top = 352
  end
  object Query_Port: TADOQuery
    AutoCalcFields = False
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from DictPort where 1<>1')
    Left = 344
    Top = 400
  end
  object ds_Country: TDataSource
    DataSet = Query_Country
    Left = 432
    Top = 344
  end
  object Query_Country: TADOQuery
    AutoCalcFields = False
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from DictCountry')
    Left = 432
    Top = 392
  end
  object qPerson: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from V_Person')
    Left = 544
    Top = 16
  end
  object dsPerson: TDataSource
    DataSet = qPerson
    Left = 544
    Top = 80
  end
  object qTemp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 352
    Top = 16
  end
  object qUserLogin: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select userLoginId,description,enabled from UserLogin')
    Left = 600
    Top = 16
  end
  object dsUserLogin: TDataSource
    DataSet = qUserLogin
    Left = 608
    Top = 80
  end
  object cTemp: TADOCommand
    Connection = ADOConnection1
    Parameters = <>
    Left = 400
    Top = 16
  end
  object qSecurityGroup_UserLogin: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'select * from V_SecurityGroup_UserLogin')
    Left = 664
    Top = 16
  end
  object dsSecurityGroup_UserLogin: TDataSource
    DataSet = qSecurityGroup_UserLogin
    Left = 664
    Top = 80
  end
  object ds_UserInfo: TDataSource
    DataSet = Q_UserInfo
    Left = 624
    Top = 224
  end
  object Q_UserInfo: TADOQuery
    AutoCalcFields = False
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'select * from DictInsuranceItem')
    Left = 624
    Top = 272
  end
  object ds_InsuranceSurrogate: TDataSource
    DataSet = Q_InsuranceSurrogate
    Left = 520
    Top = 224
  end
  object Q_InsuranceSurrogate: TADOQuery
    AutoCalcFields = False
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'select * from DictInsuranceItem')
    Left = 520
    Top = 272
  end
end
