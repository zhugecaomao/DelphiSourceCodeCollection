object Data3: TData3
  OldCreateOrder = False
  Left = 287
  Top = 195
  Height = 234
  Width = 391
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Persist Security Info=False;User ID=sa;Initi' +
      'al Catalog='#24037#36164#31649#29702#31995#32479';Data Source=.'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 194
    Top = 74
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 158
    Top = 8
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 84
    Top = 8
  end
  object ADOQuery3: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 226
    Top = 8
  end
end
