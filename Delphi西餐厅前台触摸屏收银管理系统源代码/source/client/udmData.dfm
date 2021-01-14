object dmData: TdmData
  OldCreateOrder = False
  Left = 319
  Top = 214
  Height = 109
  Width = 112
  object adocon: TADOConnection
    CommandTimeout = 600
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.3.51;Password=1234567890abc;Persist' +
      ' Security Info=True;Data Source=E:\BpaIns\SupDevice\Sup.mdb;Mode' +
      '=ReadWrite'
    ConnectionTimeout = 60
    LoginPrompt = False
    Provider = 'Microsoft.Jet.OLEDB.3.51'
    Left = 16
    Top = 16
  end
  object Temp: TCSADOQuery
    Connection = adocon
    Parameters = <>
    Left = 44
    Top = 16
  end
end
