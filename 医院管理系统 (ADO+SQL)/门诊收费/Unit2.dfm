object DMmzsf: TDMmzsf
  OldCreateOrder = False
  Left = 278
  Top = 107
  Height = 318
  Width = 416
  object ADOCmzsf: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=qing800922;Persist Security Info=Tr' +
      'ue;User ID=sa;Initial Catalog=biye;Data Source=crowder'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 56
    Top = 8
  end
  object ADOTmzsf: TADOTable
    Active = True
    Connection = ADOCmzsf
    CursorType = ctStatic
    TableName = #38376#35786#25910#36153#34920
    Left = 88
    Top = 8
    object ADOTmzsfDesigner1: TStringField
      FieldName = #32534#21495
      Size = 10
    end
    object ADOTmzsfDSDesigner2: TIntegerField
      FieldName = #25968#37327
    end
    object ADOTmzsfDSDesigner3: TFloatField
      FieldName = #36153#29992
    end
    object ADOTmzsfDSDesigner4: TDateTimeField
      FieldName = #26085#26399
    end
  end
  object DSmzsf: TDataSource
    DataSet = ADOTmzsf
    Left = 152
    Top = 8
  end
  object ADOTyp: TADOTable
    Active = True
    Connection = ADOCmzsf
    CursorType = ctStatic
    IndexFieldNames = #32534#21495
    TableName = #33647#21697#34920
    Left = 88
    Top = 72
  end
  object DSyp: TDataSource
    DataSet = ADOTyp
    Left = 144
    Top = 72
  end
  object ADOQmzsf: TADOQuery
    Connection = ADOCmzsf
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
      'select * from '#33647#21697#34920' where '#32534#21495' like :'#32534#21495)
    Left = 88
    Top = 128
    object ADOQmzsfDSDesigner: TStringField
      FieldName = #32534#21495
      Size = 10
    end
    object ADOQmzsfDSDesigner2: TStringField
      FieldName = #33647#21697#21517#31216
    end
    object ADOQmzsfDSDesigner4: TFloatField
      FieldName = #21806#20215
    end
    object ADOQmzsfDSDesigner5: TFloatField
      FieldName = #26368#23567#20215#26684
    end
    object ADOQmzsfDSDesigner9: TStringField
      FieldName = #35268#26684
    end
  end
  object DSQyp: TDataSource
    DataSet = ADOQmzsf
    Left = 144
    Top = 128
  end
  object ADOQdtzj: TADOQuery
    Connection = ADOCmzsf
    CursorType = ctStatic
    Parameters = <
      item
        Name = #26085#26399
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      'select * from '#38376#35786#25910#36153#34920' where '#26085#26399'=:'#26085#26399)
    Left = 88
    Top = 192
    object ADOQ2bh: TStringField
      FieldName = #32534#21495
      Size = 10
    end
    object ADOQ2sl: TIntegerField
      FieldName = #25968#37327
    end
    object ADOQ2fy: TFloatField
      FieldName = #36153#29992
    end
    object ADOQdtzjDSDesigner4: TDateTimeField
      FieldName = #26085#26399
    end
  end
  object DSdtzj: TDataSource
    DataSet = ADOQdtzj
    Left = 152
    Top = 192
  end
end
