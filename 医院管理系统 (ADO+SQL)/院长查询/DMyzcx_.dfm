object DMyzcx: TDMyzcx
  OldCreateOrder = False
  Left = 249
  Top = 160
  Height = 294
  Width = 392
  object ADOCyzcx: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=hhx;Persist Security Info=True;User' +
      ' ID=sa;Initial Catalog=biye;Data Source=cax'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 24
  end
  object ADOSPone: TADOStoredProc
    Connection = ADOCyzcx
    ProcedureName = 'getbab_sum;1'
    Parameters = <
      item
        Name = '@StartTime'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@EndTime'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@ryzd'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@RecCount'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = Null
      end>
    Left = 112
    Top = 24
  end
  object ADOSPyear: TADOStoredProc
    Connection = ADOCyzcx
    ProcedureName = 'GetMonthCount;1'
    Parameters = <
      item
        Name = '@ryzd'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = '@year'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@1'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = 0
      end
      item
        Name = '@2'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = 0
      end
      item
        Name = '@3'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = 0
      end
      item
        Name = '@4'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = 0
      end
      item
        Name = '@5'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = 0
      end
      item
        Name = '@6'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = 0
      end
      item
        Name = '@7'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = 0
      end
      item
        Name = '@8'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = 0
      end
      item
        Name = '@9'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = 0
      end
      item
        Name = '@10'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = 0
      end
      item
        Name = '@11'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = 0
      end
      item
        Name = '@12'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = 0
      end>
    Left = 176
    Top = 24
  end
  object ADOSPMoneyAll: TADOStoredProc
    Connection = ADOCyzcx
    ProcedureName = 'GetMoneyAll;1'
    Parameters = <
      item
        Name = '@StartTime'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@EndTime'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@MoneyAll'
        Attributes = [paNullable]
        DataType = ftFloat
        Direction = pdInputOutput
        Precision = 15
        Value = Null
      end>
    Left = 80
    Top = 96
  end
  object ADOSPMonthMoneyAll: TADOStoredProc
    Connection = ADOCyzcx
    ProcedureName = 'GetMonthMoneyAll;1'
    Parameters = <
      item
        Name = '@Year'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Month1'
        Attributes = [paNullable]
        DataType = ftFloat
        Direction = pdInputOutput
        Precision = 15
        Value = 0
      end
      item
        Name = '@Month2'
        Attributes = [paNullable]
        DataType = ftFloat
        Direction = pdInputOutput
        Precision = 15
        Value = 0
      end
      item
        Name = '@Month3'
        Attributes = [paNullable]
        DataType = ftFloat
        Direction = pdInputOutput
        Precision = 15
        Value = 0
      end
      item
        Name = '@Month4'
        Attributes = [paNullable]
        DataType = ftFloat
        Direction = pdInputOutput
        Precision = 15
        Value = 0
      end
      item
        Name = '@Month5'
        Attributes = [paNullable]
        DataType = ftFloat
        Direction = pdInputOutput
        Precision = 15
        Value = 0
      end
      item
        Name = '@Month6'
        Attributes = [paNullable]
        DataType = ftFloat
        Direction = pdInputOutput
        Precision = 15
        Value = 0
      end
      item
        Name = '@Month7'
        Attributes = [paNullable]
        DataType = ftFloat
        Direction = pdInputOutput
        Precision = 15
        Value = 0
      end
      item
        Name = '@Month8'
        Attributes = [paNullable]
        DataType = ftFloat
        Direction = pdInputOutput
        Precision = 15
        Value = 0
      end
      item
        Name = '@Month9'
        Attributes = [paNullable]
        DataType = ftFloat
        Direction = pdInputOutput
        Precision = 15
        Value = 0
      end
      item
        Name = '@Month10'
        Attributes = [paNullable]
        DataType = ftFloat
        Direction = pdInputOutput
        Precision = 15
        Value = 0
      end
      item
        Name = '@Month11'
        Attributes = [paNullable]
        DataType = ftFloat
        Direction = pdInputOutput
        Precision = 15
        Value = 0
      end
      item
        Name = '@Month12'
        Attributes = [paNullable]
        DataType = ftFloat
        Direction = pdInputOutput
        Precision = 15
        Value = 0
      end>
    Left = 200
    Top = 80
  end
  object ADOSPGetDrOPS: TADOStoredProc
    Connection = ADOCyzcx
    ProcedureName = 'GetDrOPS;1'
    Parameters = <
      item
        Name = '@xmfymc'
        Attributes = [paNullable]
        DataType = ftString
        Size = 40
        Value = Null
      end
      item
        Name = '@Dr'
        Attributes = [paNullable]
        DataType = ftString
        Size = 8
        Value = Null
      end
      item
        Name = '@StartTime'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@EndTime'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@RecCount'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = 0
      end>
    Left = 80
    Top = 168
  end
  object ADOQOPSCount: TADOQuery
    Connection = ADOCyzcx
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Dr'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 100
        Value = Null
      end
      item
        Name = 'StartTime'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'EndTime'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      'SELECT '#39033#30446#36153#29992#21517#31216', COUNT('#39033#30446#36153#29992#21517#31216') AS '#27425#25968
      'FROM '#27599#26085#28165#21333#34920
      'Where ('#22791#27880' like :Dr)and('#26085#26399'>=:StartTime)and('#26085#26399'<=:EndTime)'
      'GROUP BY '#39033#30446#36153#29992#21517#31216)
    Left = 264
    Top = 184
  end
end
