object examserver: Texamserver
  OldCreateOrder = False
  Left = 246
  Top = 192
  Height = 235
  Width = 351
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=..\'#32771#35797 +
      #31995#32479'\exam.mdb;Mode=Share Deny None;Extended Properties="";Persist ' +
      'Security Info=False;Jet OLEDB:System database="";Jet OLEDB:Regis' +
      'try Path="";Jet OLEDB:Database Password="";Jet OLEDB:Engine Type' +
      '=5;Jet OLEDB:Database Locking Mode=1;Jet OLEDB:Global Partial Bu' +
      'lk Ops=2;Jet OLEDB:Global Bulk Transactions=1;Jet OLEDB:New Data' +
      'base Password="";Jet OLEDB:Create System Database=False;Jet OLED' +
      'B:Encrypt Database=False;Jet OLEDB:Don'#39't Copy Locale on Compact=' +
      'False;Jet OLEDB:Compact Without Replica Repair=False;Jet OLEDB:S' +
      'FP=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 24
    Top = 8
  end
  object DSManerge: TADODataSet
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 'select '#22995#21517', '#21475#20196', '#32423#21035' from '#25805#20316#21592
    Parameters = <>
    Left = 24
    Top = 48
    object DSManergeDSDesigner: TWideStringField
      FieldName = #22995#21517
      Size = 8
    end
    object DSManergeDSDesigner2: TWideStringField
      FieldName = #21475#20196
      Size = 12
    end
    object DSManergeDSDesigner3: TSmallintField
      FieldName = #32423#21035
    end
  end
  object DSPManerge: TDataSetProvider
    DataSet = DSManerge
    Constraints = True
    Options = [poAllowCommandText]
    Left = 24
    Top = 96
  end
  object DSStudent: TADODataSet
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 'select * from '#32771#29983#36164#26009
    Parameters = <>
    Left = 72
    Top = 48
  end
  object DSExam: TADODataSet
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 'select * from '#39064#24211
    Parameters = <>
    Left = 120
    Top = 48
  end
  object DSInformation: TADODataSet
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 'select * from '#32771#22330#36164#26009
    Parameters = <>
    Left = 168
    Top = 48
  end
  object DSStatus: TADODataSet
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 'select * from '#29366#24577#34920
    Parameters = <>
    Left = 216
    Top = 48
  end
  object DSPStudent: TDataSetProvider
    DataSet = DSStudent
    Constraints = True
    Options = [poAllowCommandText]
    Left = 72
    Top = 96
  end
  object DSPExam: TDataSetProvider
    DataSet = DSExam
    Constraints = True
    Options = [poAllowCommandText]
    Left = 120
    Top = 96
  end
  object DSPInformation: TDataSetProvider
    DataSet = DSInformation
    Constraints = True
    Options = [poAllowCommandText]
    Left = 168
    Top = 96
  end
  object DSPStatus: TDataSetProvider
    DataSet = DSStatus
    Constraints = True
    Options = [poAllowCommandText]
    Left = 216
    Top = 96
  end
  object DSkaojuan: TADODataSet
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 'select * from '#32771#21367' '
    Parameters = <>
    Left = 272
    Top = 48
  end
  object DSPKaojuan: TDataSetProvider
    DataSet = DSkaojuan
    Constraints = True
    Options = [poAllowCommandText]
    Left = 272
    Top = 96
  end
end
