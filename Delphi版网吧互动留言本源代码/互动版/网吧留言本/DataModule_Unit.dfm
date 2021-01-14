object NetBBS_DataModule: TNetBBS_DataModule
  OldCreateOrder = False
  Height = 312
  Width = 457
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 176
    Top = 16
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from '#39038#23458#30041#35328' order by '#30041#35328#32534#21495' desc')
    Left = 96
    Top = 96
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    DataSource = DataSource1
    Parameters = <
      item
        Name = #30041#35328#32534#21495
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 255
        Precision = 255
        Value = 1
      end>
    SQL.Strings = (
      'select * from '#39038#23458#22238#22797' where '#30041#35328#32534#21495'=:'#30041#35328#32534#21495' order by '#22238#22797#27004#23618' desc')
    Left = 312
    Top = 96
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 32
    Top = 96
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery2
    Left = 248
    Top = 96
  end
end
