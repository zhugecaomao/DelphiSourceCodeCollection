object DMypgl: TDMypgl
  OldCreateOrder = False
  Left = 168
  Top = 65529
  Height = 460
  Width = 632
  object ADOCypgl: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=qing800922;Persist Security Info=Tr' +
      'ue;User ID=sa;Initial Catalog=biye;Data Source=CROWDER'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 64
    Top = 40
  end
  object ADOTypgl: TADOTable
    Active = True
    Connection = ADOCypgl
    CursorType = ctStatic
    TableName = #33647#21697#34920
    Left = 120
    Top = 40
  end
  object DSypgl: TDataSource
    DataSet = ADOTypgl
    Left = 184
    Top = 40
  end
  object ADOTgys: TADOTable
    Active = True
    Connection = ADOCypgl
    CursorType = ctStatic
    IndexFieldNames = #20379#24212#21830#32534#21495
    MasterFields = #20379#24212#21830#32534#21495
    MasterSource = DSypgl
    TableName = #20379#24212#21830#34920
    Left = 120
    Top = 96
  end
  object DSgys: TDataSource
    DataSet = ADOTgys
    Left = 184
    Top = 96
  end
  object ADOQypgq: TADOQuery
    Active = True
    Connection = ADOCypgl
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from '#33647#21697#34920' where '#36807#26399#26102#38388'<=getdate()')
    Left = 120
    Top = 152
  end
  object DSypgq: TDataSource
    DataSet = ADOQypgq
    Left = 184
    Top = 152
  end
  object ADOQyp_xg_tj: TADOQuery
    Active = True
    Connection = ADOCypgl
    CursorType = ctStatic
    Parameters = <
      item
        Name = #32534#21495
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    SQL.Strings = (
      'select * from '#33647#21697#34920' where '#32534#21495'=:'#32534#21495)
    Left = 120
    Top = 208
  end
  object DSyp_xg_tj: TDataSource
    DataSet = ADOQyp_xg_tj
    Left = 184
    Top = 208
  end
  object ADOQgys: TADOQuery
    Connection = ADOCypgl
    CursorType = ctStatic
    Parameters = <
      item
        Name = #20379#24212#21830#32534#21495
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    SQL.Strings = (
      'select * from '#20379#24212#21830#34920' where '#20379#24212#21830#32534#21495' like :'#20379#24212#21830#32534#21495)
    Left = 120
    Top = 272
  end
  object DSQgys: TDataSource
    DataSet = ADOQgys
    Left = 184
    Top = 272
  end
  object ADOTyp: TADOTable
    Active = True
    Connection = ADOCypgl
    CursorType = ctStatic
    IndexFieldNames = #20379#24212#21830#32534#21495
    MasterFields = #20379#24212#21830#32534#21495
    MasterSource = DSgys2
    TableName = #33647#21697#34920
    Left = 288
    Top = 40
  end
  object ADOTgys2: TADOTable
    Active = True
    Connection = ADOCypgl
    CursorType = ctStatic
    TableName = #20379#24212#21830#34920
    Left = 288
    Top = 88
  end
  object DSyp: TDataSource
    DataSet = ADOTyp
    Left = 336
    Top = 40
  end
  object DSgys2: TDataSource
    DataSet = ADOTgys2
    Left = 336
    Top = 88
  end
  object ADOQgys_modify: TADOQuery
    Connection = ADOCypgl
    Parameters = <
      item
        Name = #20379#24212#21830#32534#21495
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    SQL.Strings = (
      'select * from '#20379#24212#21830#34920' where '#20379#24212#21830#32534#21495'=:'#20379#24212#21830#32534#21495)
    Left = 288
    Top = 144
  end
  object DSmodify: TDataSource
    DataSet = ADOQgys_modify
    Left = 360
    Top = 144
  end
  object ADOQqhgys: TADOQuery
    Active = True
    Connection = ADOCypgl
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select '#20379#24212#21830#34920'.*,'#33647#21697#34920'.'#32534#21495','#33647#21697#21517#31216' from '#20379#24212#21830#34920' inner join '#33647#21697#34920' on '#20379#24212#21830#34920'.'#20379#24212#21830#32534#21495 +
        '='#33647#21697#34920'.'#20379#24212#21830#32534#21495
      'where getdate()-'#33647#21697#34920'.'#35746#36141#26102#38388'>=30')
    Left = 280
    Top = 208
  end
  object DSqhgys: TDataSource
    DataSet = ADOQqhgys
    Left = 344
    Top = 208
  end
  object ADOQypcx: TADOQuery
    Active = True
    Connection = ADOCypgl
    CursorType = ctStatic
    Parameters = <
      item
        Name = #22987#26102#38388
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = #32456#26102#38388
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      'select * from '#33647#21697#34920' where ('#35746#36141#26102#38388'>=:'#22987#26102#38388') and ('#35746#36141#26102#38388'<=:'#32456#26102#38388')')
    Left = 120
    Top = 328
  end
  object DSypcx: TDataSource
    DataSet = ADOQypcx
    Left = 184
    Top = 329
  end
  object ADOQypcx2: TADOQuery
    Active = True
    Connection = ADOCypgl
    CursorType = ctStatic
    Parameters = <
      item
        Name = #22987
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = #32456
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      'select * from '#33647#21697#34920' where ('#20837#24211#26102#38388'>=:'#22987') and ('#20837#24211#26102#38388'<=:'#32456')')
    Left = 120
    Top = 384
  end
  object DSypcx2: TDataSource
    DataSet = ADOQypcx2
    Left = 184
    Top = 384
  end
  object ADOQjtcx: TADOQuery
    Connection = ADOCypgl
    Parameters = <>
    Left = 432
    Top = 40
  end
  object DSjtcx: TDataSource
    DataSet = ADOQjtcx
    Left = 488
    Top = 40
  end
end
