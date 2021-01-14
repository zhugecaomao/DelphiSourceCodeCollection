object DataModuleADO: TDataModuleADO
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 272
  Top = 206
  Height = 160
  Width = 200
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Left = 40
    Top = 16
  end
  object ADOQuery1: TADOQuery
    Parameters = <>
    Left = 128
    Top = 16
  end
  object ADOTable1: TADOTable
    Left = 40
    Top = 72
  end
end
