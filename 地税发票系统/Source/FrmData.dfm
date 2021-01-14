object DataModule1: TDataModule1
  OldCreateOrder = False
  Left = 333
  Top = 287
  Height = 150
  Width = 215
  object ADOCon: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB'
    Left = 16
    Top = 8
  end
  object ADOSelect: TADOQuery
    Connection = ADOCon
    Parameters = <>
    Left = 16
    Top = 56
  end
  object ADOTax: TADOQuery
    Connection = ADOCon
    Parameters = <>
    Left = 80
    Top = 8
  end
  object ADOOther: TADOQuery
    Connection = ADOCon
    Parameters = <>
    Left = 80
    Top = 56
  end
  object ADOTableTax: TADOTable
    Connection = ADOCon
    Left = 152
    Top = 8
  end
end
