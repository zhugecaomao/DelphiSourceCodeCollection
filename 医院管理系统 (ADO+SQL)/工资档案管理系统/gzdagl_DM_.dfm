object DMgzdagl: TDMgzdagl
  OldCreateOrder = False
  Left = 52
  Top = 104
  Height = 544
  Width = 577
  object ADOCgzdagl: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=qing800922;Persist Security Info=Tr' +
      'ue;User ID=sa;Initial Catalog=biye;Data Source=crowder'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 16
  end
  object ADOTdepartment: TADOTable
    Active = True
    Connection = ADOCgzdagl
    CursorType = ctStatic
    AfterScroll = ADOTdepartmentAfterScroll
    TableName = #31185#23460#34920
    Left = 128
    Top = 16
    object ADOTdepartmentDSDesigner: TStringField
      FieldName = #31185#23460#32534#21495
      Size = 6
    end
    object ADOTdepartmentDSDesigner2: TStringField
      FieldName = #31185#23460#21517#31216
    end
    object ADOTdepartmentDSDesigner3: TStringField
      FieldName = #31185#23460#20027#20219
      Size = 8
    end
    object ADOTdepartmentDSDesigner4: TBCDField
      FieldName = #31185#23460#39044#31639
      Precision = 19
    end
  end
  object DSdepartment: TDataSource
    DataSet = ADOTdepartment
    Left = 216
    Top = 16
  end
  object ADOTemployee: TADOTable
    Active = True
    Connection = ADOCgzdagl
    CursorType = ctStatic
    AfterScroll = ADOTemployeeAfterScroll
    TableName = #32844#21592#34920
    Left = 128
    Top = 88
    object ADOTemployeeDSDesigner: TStringField
      FieldName = #21592#24037#32534#21495
      Size = 5
    end
    object ADOTemployeeDSDesigner2: TStringField
      FieldName = #21592#24037#22995#21517
      Size = 8
    end
    object ADOTemployeeDSDesigner3: TStringField
      FieldName = #24615#21035
      Size = 2
    end
    object ADOTemployeeDSDesigner4: TStringField
      FieldName = #23398#21382
      Size = 15
    end
    object ADOTemployeeDSDesigner5: TStringField
      FieldName = #32844#20301
      Size = 15
    end
    object ADOTemployeeDSDesigner6: TBCDField
      FieldName = #24037#36164
      Precision = 19
    end
    object ADOTemployeeDSDesigner7: TStringField
      FieldName = #24180#40836
      Size = 3
    end
    object ADOTemployeeDSDesigner8: TStringField
      FieldName = #31185#23460#21517#31216
    end
    object ADOTemployeeDSDesigner9: TDateTimeField
      FieldName = #20837#32844#26102#38388
    end
    object ADOTemployeeDSDesigner10: TStringField
      FieldName = #30005#35805
    end
  end
  object DSemployee: TDataSource
    DataSet = ADOTemployee
    Left = 216
    Top = 88
  end
  object ADOTgongzi: TADOTable
    Active = True
    Connection = ADOCgzdagl
    CursorType = ctStatic
    AfterScroll = ADOTgongziAfterScroll
    TableName = #34218#27700#34920
    Left = 128
    Top = 152
    object ADOTgongziDSDesigner: TStringField
      FieldName = #21592#24037#32534#21495
      Size = 5
    end
    object ADOTgongziDSDesigner2: TBCDField
      FieldName = #22522#26412#24037#36164
      Precision = 19
    end
    object ADOTgongziDSDesigner3: TBCDField
      FieldName = #32844#20301#24037#36164
      Precision = 19
    end
    object ADOTgongziDSDesigner4: TBCDField
      FieldName = #32423#21035#24037#36164
      Precision = 19
    end
    object ADOTgongziDSDesigner5: TBCDField
      FieldName = #24037#40836#24037#36164
      Precision = 19
    end
    object ADOTgongziDSDesigner6: TBCDField
      FieldName = #23703#20301#24037#36164
      Precision = 19
    end
    object ADOTgongziDSDesigner7: TBCDField
      FieldName = #20854#20182
      Precision = 19
    end
    object ADOTgongziDSDesigner8: TBCDField
      FieldName = #23567#35745
      Precision = 19
    end
  end
  object DSgongzi: TDataSource
    DataSet = ADOTgongzi
    Left = 224
    Top = 152
  end
  object ADOTbutie: TADOTable
    Active = True
    Connection = ADOCgzdagl
    CursorType = ctStatic
    AfterScroll = ADOTbutieAfterScroll
    TableName = #34917#36148#34920
    Left = 128
    Top = 216
    object ADOTbutieDSDesigner: TStringField
      FieldName = #21592#24037#32534#21495
      Size = 5
    end
    object ADOTbutieDSDesigner2: TBCDField
      FieldName = #32508#21512#34917#36148
      Precision = 19
    end
    object ADOTbutieDSDesigner3: TBCDField
      FieldName = #35823#39184#34917#36148
      Precision = 19
    end
    object ADOTbutieDSDesigner4: TBCDField
      FieldName = #20303#25151#34917#36148
      Precision = 19
    end
    object ADOTbutieDSDesigner5: TBCDField
      FieldName = #21307#30103#34917#36148
      Precision = 19
    end
    object ADOTbutieDSDesigner6: TBCDField
      FieldName = #28014#21160#24037#36164
      Precision = 19
    end
    object ADOTbutieDSDesigner7: TBCDField
      FieldName = #29305#27530#27941#36148
      Precision = 19
    end
    object ADOTbutieDSDesigner8: TBCDField
      FieldName = #20854#23427
      Precision = 19
    end
    object ADOTbutieDSDesigner9: TBCDField
      FieldName = #23567#35745
      Precision = 19
    end
  end
  object DSbutie: TDataSource
    DataSet = ADOTbutie
    Left = 224
    Top = 216
  end
  object ADOTkouchu: TADOTable
    Active = True
    Connection = ADOCgzdagl
    CursorType = ctStatic
    AfterScroll = ADOTkouchuAfterScroll
    TableName = #25187#38500#34920
    Left = 128
    Top = 280
    object ADOTkouchuDSDesigner: TStringField
      FieldName = #21592#24037#32534#21495
      Size = 5
    end
    object ADOTkouchuDSDesigner2: TBCDField
      FieldName = #20303#25151#20844#31215
      Precision = 19
    end
    object ADOTkouchuDSDesigner3: TBCDField
      FieldName = #20859#32769#22522#37329
      Precision = 19
    end
    object ADOTkouchuDSDesigner4: TBCDField
      FieldName = #21307#30103#22522#37329
      Precision = 19
    end
    object ADOTkouchuDSDesigner5: TBCDField
      FieldName = #20854#23427
      Precision = 19
    end
    object ADOTkouchuDSDesigner6: TBCDField
      FieldName = #23567#35745
      Precision = 19
    end
  end
  object DSkouchu: TDataSource
    DataSet = ADOTkouchu
    Left = 224
    Top = 280
  end
  object ADOQemployee: TADOQuery
    Connection = ADOCgzdagl
    Parameters = <>
    Left = 128
    Top = 352
  end
  object DSQemployee: TDataSource
    DataSet = ADOQemployee
    Left = 224
    Top = 352
  end
  object ADOQgongzi: TADOQuery
    Connection = ADOCgzdagl
    Parameters = <>
    Left = 128
    Top = 408
  end
  object DSQgongzi: TDataSource
    DataSet = ADOQgongzi
    Left = 232
    Top = 408
  end
  object ADOQbutie: TADOQuery
    Connection = ADOCgzdagl
    Parameters = <>
    Left = 336
    Top = 16
  end
  object DSQbutie: TDataSource
    DataSet = ADOQbutie
    Left = 408
    Top = 16
  end
  object ADOQsum_butie: TADOQuery
    Connection = ADOCgzdagl
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select sum('#32508#21512#34917#36148') as '#32508#21512#34917#36148#24635#21644',sum('#35823#39184#34917#36148') as '#35823#39184#34917#36148#24635#21644','
      'sum('#20303#25151#34917#36148') as '#20303#25151#34917#36148#24635#21644',sum('#21307#30103#34917#36148') as '#21307#30103#34917#36148#24635#21644','
      'sum('#28014#21160#24037#36164') as '#28014#21160#24037#36164#24635#21644',sum('#29305#27530#27941#36148') as '#29305#27530#27941#36148#24635#21644','
      'sum('#20854#23427') as '#20854#23427#24635#21644
      'from '#34917#36148#34920'  ')
    Left = 344
    Top = 168
  end
  object DSQsum_butie: TDataSource
    DataSet = ADOQsum_butie
    Left = 472
    Top = 168
  end
  object ADOQsum_department: TADOQuery
    Active = True
    Connection = ADOCgzdagl
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select '#31185#23460#21517#31216',sum('#24037#36164') as '#24635#35745' from '#32844#21592#34920' group by '#31185#23460#21517#31216' ')
    Left = 336
    Top = 96
    object ADOQsum_departmentDSDesigner: TStringField
      FieldName = #31185#23460#21517#31216
    end
    object ADOQsum_departmentDSDesigner2: TBCDField
      FieldName = #24635#35745
      ReadOnly = True
      Precision = 19
    end
  end
  object DSQsum_department: TDataSource
    DataSet = ADOQsum_department
    Left = 456
    Top = 88
  end
  object ADOQsum_xingshui: TADOQuery
    Active = True
    Connection = ADOCgzdagl
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select sum('#22522#26412#24037#36164') as '#22522#26412#24037#36164#24635#21644',sum('#32844#20301#24037#36164') as '#32844#20301#24037#36164#24635#21644','
      'sum('#32423#21035#24037#36164') as '#32423#21035#24037#36164#24635#21644',sum('#24037#40836#24037#36164') as '#24037#40836#24037#36164#24635#21644','
      'sum('#23703#20301#24037#36164') as '#23703#20301#24037#36164#24635#21644',sum('#20854#20182') as '#20854#20182#24635#21644
      'from '#34218#27700#34920)
    Left = 344
    Top = 248
  end
  object DSQsum_xingshui: TDataSource
    DataSet = ADOQsum_xingshui
    Left = 480
    Top = 256
  end
end
