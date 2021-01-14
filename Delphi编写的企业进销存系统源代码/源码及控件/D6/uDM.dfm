object DM: TDM
  OldCreateOrder = False
  Left = 314
  Top = 114
  Height = 397
  Width = 696
  object DB: TDatabase
    AliasName = 'STK0311'
    DatabaseName = 'STK0311'
    LoginPrompt = False
    Params.Strings = (
      'USER NAME=sa'
      'PASSWORD=')
    SessionName = 'Default'
    Left = 24
    Top = 16
  end
  object Q_T1020: TQuery
    DatabaseName = 'STK0311'
    SQL.Strings = (
      'select F01,F02,F03 from T1020 ')
    Left = 88
    Top = 16
    object Q_T1020F01: TStringField
      FieldName = 'F01'
      Origin = 'STK0311.T1020.F01'
      FixedChar = True
      Size = 8
    end
    object Q_T1020F02: TStringField
      FieldName = 'F02'
      Origin = 'STK0311.T1020.F02'
      FixedChar = True
      Size = 40
    end
    object Q_T1020F03: TStringField
      FieldName = 'F03'
      Origin = 'STK0311.T1020.F03'
      FixedChar = True
      Size = 12
    end
  end
  object Q_T1100: TQuery
    DatabaseName = 'STK0311'
    SQL.Strings = (
      'select F01,F02  from T1100')
    Left = 144
    Top = 16
  end
  object Q_T1050: TQuery
    DatabaseName = 'STK0311'
    SQL.Strings = (
      'select F01,F02,F03 from T1050')
    Left = 200
    Top = 16
  end
  object Q_T1060: TQuery
    DatabaseName = 'STK0311'
    SQL.Strings = (
      'select F01,F02,F03,F09 from T1060')
    Left = 256
    Top = 16
  end
  object Q_T1080: TQuery
    DatabaseName = 'STK0311'
    SQL.Strings = (
      'select AutoNo,F01,F02,F03,F04,F05,F07 from T1080')
    Left = 312
    Top = 16
  end
  object Q_T1010: TQuery
    DatabaseName = 'STK0311'
    SQL.Strings = (
      'select F01,F02,F03 from T1010 order by F01')
    Left = 368
    Top = 16
    object Q_T1010F01: TStringField
      FieldName = 'F01'
      Origin = 'STK0311.T1010.F01'
      FixedChar = True
      Size = 8
    end
    object Q_T1010F02: TStringField
      FieldName = 'F02'
      Origin = 'STK0311.T1010.F02'
      FixedChar = True
      Size = 40
    end
    object Q_T1010F03: TStringField
      FieldName = 'F03'
      Origin = 'STK0311.T1010.F03'
      FixedChar = True
      Size = 12
    end
  end
  object Q_T1090: TQuery
    DatabaseName = 'STK0311'
    SQL.Strings = (
      'select AutoNo,F01,F02,F03,F04,F05,F07 from T1090')
    Left = 312
    Top = 112
  end
  object Q_T1030: TQuery
    DatabaseName = 'STK0311'
    SQL.Strings = (
      'select F01, F02, F03 from T1030')
    Left = 232
    Top = 112
  end
  object Query1: TQuery
    DatabaseName = 'STK0311'
    SQL.Strings = (
      'select AutoNo,F01,F02,F03,F04,F05 from T1080')
    Left = 176
    Top = 104
  end
  object Q_T1070: TQuery
    DatabaseName = 'STK0311'
    SQL.Strings = (
      'select AutoNo,F01,F02,F03,F04,F05,F07 from T1070')
    Left = 104
    Top = 104
  end
  object Q_SysParam: TQuery
    DatabaseName = 'STK0311'
    SQL.Strings = (
      'select * from TSysParam')
    Left = 24
    Top = 104
    object Q_SysParamF01: TStringField
      FieldName = 'F01'
      Origin = 'STK0311.TSysParam.F01'
      FixedChar = True
      Size = 40
    end
    object Q_SysParamF02: TStringField
      FieldName = 'F02'
      Origin = 'STK0311.TSysParam.F02'
      FixedChar = True
      Size = 40
    end
    object Q_SysParamF03: TStringField
      FieldName = 'F03'
      Origin = 'STK0311.TSysParam.F03'
      FixedChar = True
    end
    object Q_SysParamF04: TStringField
      FieldName = 'F04'
      Origin = 'STK0311.TSysParam.F04'
      FixedChar = True
    end
    object Q_SysParamF05: TStringField
      FieldName = 'F05'
      Origin = 'STK0311.TSysParam.F05'
      FixedChar = True
      Size = 25
    end
    object Q_SysParamF06: TStringField
      FieldName = 'F06'
      Origin = 'STK0311.TSysParam.F06'
      FixedChar = True
      Size = 25
    end
    object Q_SysParamF07: TStringField
      FieldName = 'F07'
      Origin = 'STK0311.TSysParam.F07'
      FixedChar = True
      Size = 25
    end
    object Q_SysParamF08: TStringField
      FieldName = 'F08'
      Origin = 'STK0311.TSysParam.F08'
      FixedChar = True
      Size = 60
    end
    object Q_SysParamF09: TStringField
      FieldName = 'F09'
      Origin = 'STK0311.TSysParam.F09'
      FixedChar = True
      Size = 60
    end
    object Q_SysParamF10: TStringField
      FieldName = 'F10'
      Origin = 'STK0311.TSysParam.F10'
      FixedChar = True
      Size = 10
    end
    object Q_SysParamF11: TStringField
      FieldName = 'F11'
      Origin = 'STK0311.TSysParam.F11'
      FixedChar = True
      Size = 10
    end
    object Q_SysParamF12: TStringField
      FieldName = 'F12'
      Origin = 'STK0311.TSysParam.F12'
      FixedChar = True
      Size = 10
    end
    object Q_SysParamF13: TStringField
      FieldName = 'F13'
      Origin = 'STK0311.TSysParam.F13'
      FixedChar = True
      Size = 60
    end
    object Q_SysParamF14: TStringField
      FieldName = 'F14'
      Origin = 'STK0311.TSysParam.F14'
      FixedChar = True
      Size = 60
    end
    object Q_SysParamF15: TStringField
      FieldName = 'F15'
      Origin = 'STK0311.TSysParam.F15'
      FixedChar = True
      Size = 40
    end
    object Q_SysParamF16: TStringField
      FieldName = 'F16'
      Origin = 'STK0311.TSysParam.F16'
      FixedChar = True
    end
    object Q_SysParamF17: TStringField
      FieldName = 'F17'
      Origin = 'STK0311.TSysParam.F17'
      FixedChar = True
      Size = 100
    end
    object Q_SysParamF18: TStringField
      FieldName = 'F18'
      Origin = 'STK0311.TSysParam.F18'
      FixedChar = True
      Size = 100
    end
    object Q_SysParamF20: TSmallintField
      FieldName = 'F20'
      Origin = 'STK0311.TSysParam.F20'
    end
    object Q_SysParamF21: TStringField
      FieldName = 'F21'
      Origin = 'STK0311.TSysParam.F21'
      FixedChar = True
      Size = 8
    end
    object Q_SysParamF22: TStringField
      FieldName = 'F22'
      Origin = 'STK0311.TSysParam.F22'
      FixedChar = True
      Size = 4
    end
    object Q_SysParamF23: TFloatField
      FieldName = 'F23'
      Origin = 'STK0311.TSysParam.F23'
    end
    object Q_SysParamBUSER: TStringField
      FieldName = 'BUSER'
      Origin = 'STK0311.TSysParam.BUSER'
      FixedChar = True
      Size = 10
    end
    object Q_SysParamBTIME: TDateTimeField
      FieldName = 'BTIME'
      Origin = 'STK0311.TSysParam.BTIME'
    end
    object Q_SysParamEUSER: TStringField
      FieldName = 'EUSER'
      Origin = 'STK0311.TSysParam.EUSER'
      FixedChar = True
      Size = 10
    end
    object Q_SysParamETIME: TDateTimeField
      FieldName = 'ETIME'
      Origin = 'STK0311.TSysParam.ETIME'
    end
  end
  object Q_T5010: TQuery
    DatabaseName = 'STK0311'
    SQL.Strings = (
      'select F01,F02,F03 from T5010 ')
    Left = 104
    Top = 200
    object StringField1: TStringField
      FieldName = 'F01'
      Origin = 'STK0311.T1020.F01'
      FixedChar = True
      Size = 8
    end
    object StringField2: TStringField
      FieldName = 'F02'
      Origin = 'STK0311.T1020.F02'
      FixedChar = True
      Size = 40
    end
    object StringField3: TStringField
      FieldName = 'F03'
      Origin = 'STK0311.T1020.F03'
      FixedChar = True
      Size = 12
    end
  end
  object Q_T1011: TQuery
    DatabaseName = 'STK0311'
    SQL.Strings = (
      'select F01,F02,F03 from T1011 order by F01')
    Left = 32
    Top = 200
  end
  object Q_T2010: TQuery
    AutoRefresh = True
    DatabaseName = 'STK0311'
    SQL.Strings = (
      'Select F01,F12 from T2010')
    Left = 184
    Top = 200
    object Q_T2010F01: TStringField
      FieldName = 'F01'
      Origin = 'STK0311.T2010.F01'
      FixedChar = True
      Size = 12
    end
    object Q_T2010F12: TStringField
      FieldName = 'F12'
      Origin = 'STK0311.T2010.F12'
      FixedChar = True
      Size = 15
    end
  end
end
