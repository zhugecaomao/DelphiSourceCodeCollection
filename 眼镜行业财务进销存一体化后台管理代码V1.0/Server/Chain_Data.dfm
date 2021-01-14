object frm_Chain_Data: Tfrm_Chain_Data
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 324
  Top = 147
  Height = 265
  Width = 190
  object ADO_Connection: TADOConnection
    CommandTimeout = 0
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 48
    Top = 16
  end
  object ADOConnMaster: TADOConnection
    CommandTimeout = 0
    LoginPrompt = False
    Left = 48
    Top = 88
  end
end
