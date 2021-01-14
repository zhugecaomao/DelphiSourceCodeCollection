object DataModule1: TDataModule1
  OldCreateOrder = False
  Left = 214
  Top = 109
  Height = 154
  Width = 367
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 16
    Top = 8
  end
  object ADOTable1: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'produce_type_t'
    Left = 8
    Top = 64
  end
  object ADOCommand1: TADOCommand
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'i'
        DataType = ftString
        Size = 16
        Value = '1'
      end>
    Left = 80
    Top = 8
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from produce_t')
    Left = 72
    Top = 64
  end
  object RvDataSetConnection1: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = ADOQuery3
    Left = 184
    Top = 8
  end
  object RvProject1: TRvProject
    Left = 176
    Top = 64
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from sell_back_t')
    Left = 128
    Top = 64
  end
  object ADOQuery3: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'select * from produce_t')
    Left = 136
    Top = 8
  end
  object ADOQuery4: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select * from sell_back_t where year(s_time)=year(now()) and mon' +
        'th(s_time)=month(now()) and day(s_time)=day(now())')
    Left = 232
    Top = 8
  end
  object RvProject2: TRvProject
    Left = 224
    Top = 64
  end
  object RvDataSetConnection2: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = ADOQuery4
    Left = 280
  end
end
