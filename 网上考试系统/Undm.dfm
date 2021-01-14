object DataModule1: TDataModule1
  OldCreateOrder = False
  Left = 361
  Top = 56
  Height = 302
  Width = 441
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
  object DSManerge1: TDataSource
    DataSet = DSManerge
    Left = 72
    Top = 56
  end
  object DSStudent1: TDataSource
    DataSet = DSStudent
    Left = 120
    Top = 56
  end
  object DSExam1: TDataSource
    DataSet = DSExam
    Left = 168
    Top = 56
  end
  object DSInformation1: TDataSource
    DataSet = DSInformation
    Left = 216
    Top = 56
  end
  object DSStatus1: TDataSource
    DataSet = DSStatus
    Left = 264
    Top = 56
  end
  object DSManerge: TADODataSet
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 'select '#22995#21517', '#21475#20196', '#32423#21035' from '#25805#20316#21592
    Parameters = <>
    Left = 72
    Top = 8
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
  object DSStudent: TADODataSet
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 'select * from '#32771#29983#36164#26009
    Parameters = <>
    Left = 120
    Top = 8
    object DSStudentid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object DSStudentDSDesigner: TWideStringField
      FieldName = #20934#32771#35777#21495
      Size = 12
    end
    object DSStudentDSDesigner2: TWideStringField
      FieldName = #22995#21517
      Size = 8
    end
    object DSStudentDSDesigner3: TWideStringField
      FieldName = #24615#21035
      Size = 2
    end
    object DSStudentDSDesigner4: TWideStringField
      FieldName = #20303#22336
      Size = 50
    end
    object DSStudentDSDesigner5: TWideStringField
      FieldName = #36523#20221#35777#21495
      Size = 18
    end
    object DSStudentDSDesigner6: TSmallintField
      FieldName = #29366#24577
    end
    object DSStudentDSDesigner7: TDateTimeField
      FieldName = #32771#35797#26085#26399
    end
    object DSStudentDSDesigner8: TBlobField
      FieldName = #29031#29255
    end
    object DSStudentDSDesigner9: TIntegerField
      FieldName = #24471#20998
    end
    object DSStudentstatus: TStringField
      DisplayLabel = #29366#24577
      FieldKind = fkLookup
      FieldName = 'status'
      LookupDataSet = DSStatus
      LookupKeyFields = #32534#21495
      LookupResultField = #29366#24577
      KeyFields = #29366#24577
      Size = 8
      Lookup = True
    end
  end
  object DSExam: TADODataSet
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 'select * from '#39064#24211
    Parameters = <>
    Left = 168
    Top = 8
    object DSExamDSDesigner: TSmallintField
      FieldName = #39064#21495
    end
    object DSExamDSDesigner2: TMemoField
      FieldName = #39064#30446
      BlobType = ftMemo
    end
    object DSExamA: TWideStringField
      DisplayWidth = 2
      FieldName = #31572#26696'A'
      Size = 2
    end
    object DSExamB: TWideStringField
      DisplayWidth = 2
      FieldName = #31572#26696'B'
      Size = 2
    end
    object DSExamC: TWideStringField
      DisplayWidth = 2
      FieldName = #31572#26696'C'
      Size = 2
    end
    object DSExamD: TWideStringField
      DisplayWidth = 2
      FieldName = #31572#26696'D'
      Size = 2
    end
    object DSExamE: TWideStringField
      DisplayWidth = 2
      FieldName = #31572#26696'E'
      Size = 2
    end
  end
  object DSInformation: TADODataSet
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 'select * from '#32771#22330#36164#26009
    Parameters = <>
    Left = 216
    Top = 8
    object DSInformationid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object DSInformationDSDesigner: TWideStringField
      FieldName = #26426#22120#21495
      Size = 10
    end
    object DSInformationDSDesigner2: TSmallintField
      FieldName = #29366#24577
    end
    object DSInformationDSDesigner3: TWideStringField
      FieldName = #20934#32771#35777#21495
      Size = 12
    end
    object DSInformationDSDesigner4: TWideStringField
      FieldName = #32771#22330
    end
  end
  object DSStatus: TADODataSet
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 'select * from '#29366#24577#34920
    Parameters = <>
    Left = 256
    Top = 8
    object DSStatusDSDesigner: TSmallintField
      FieldName = #32534#21495
    end
    object DSStatusDSDesigner2: TWideStringField
      FieldName = #29366#24577
      Size = 10
    end
  end
  object DCOMConnection1: TDCOMConnection
    Connected = True
    ServerGUID = '{B674DE19-F8FC-4448-BFAA-3A3A5BDA7AEE}'
    ServerName = 'Proserver.examserver'
    Left = 8
    Top = 136
  end
  object CDSManerge: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPManerge'
    RemoteServer = DCOMConnection1
    Left = 96
    Top = 136
  end
  object CDSStudent: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPStudent'
    RemoteServer = DCOMConnection1
    Left = 168
    Top = 136
    object CDSStudentid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object CDSStudentCDSDesigner: TWideStringField
      FieldName = #20934#32771#35777#21495
      Size = 18
    end
    object CDSStudentCDSDesigner2: TWideStringField
      FieldName = #22995#21517
      Size = 8
    end
    object CDSStudentCDSDesigner3: TWideStringField
      FieldName = #24615#21035
      Size = 2
    end
    object CDSStudentCDSDesigner4: TWideStringField
      FieldName = #20303#22336
      Size = 50
    end
    object CDSStudentCDSDesigner5: TWideStringField
      FieldName = #36523#20221#35777#21495
      Size = 18
    end
    object CDSStudentCDSDesigner6: TSmallintField
      FieldName = #29366#24577
    end
    object CDSStudentCDSDesigner7: TDateTimeField
      FieldName = #32771#35797#26085#26399
    end
    object CDSStudentCDSDesigner8: TBlobField
      FieldName = #29031#29255
    end
    object CDSStudentCDSDesigner9: TIntegerField
      FieldName = #24471#20998
    end
    object CDSStudentstatus: TStringField
      DisplayLabel = #29366#24577
      FieldKind = fkLookup
      FieldName = 'status'
      LookupDataSet = DSStatus
      LookupKeyFields = #32534#21495
      LookupResultField = #29366#24577
      KeyFields = #29366#24577
      Size = 8
      Lookup = True
    end
  end
  object CDSExam: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPExam'
    RemoteServer = DCOMConnection1
    Left = 232
    Top = 136
  end
  object CDSInformation: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPInformation'
    RemoteServer = DCOMConnection1
    Left = 312
    Top = 136
    object CDSInformationid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object CDSInformationCDSDesigner: TWideStringField
      FieldName = #26426#22120#21495
      Size = 10
    end
    object CDSInformationCDSDesigner2: TSmallintField
      FieldName = #29366#24577
    end
    object CDSInformationCDSDesigner3: TWideStringField
      FieldName = #20934#32771#35777#21495
      Size = 12
    end
    object CDSInformationCDSDesigner4: TWideStringField
      FieldName = #32771#22330
    end
    object CDSInformationstatus: TStringField
      FieldKind = fkLookup
      FieldName = 'status'
      LookupDataSet = DSStatus
      LookupKeyFields = #32534#21495
      LookupResultField = #29366#24577
      KeyFields = #29366#24577
      Size = 8
      Lookup = True
    end
  end
  object CDSStatus: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPStatus'
    RemoteServer = DCOMConnection1
    Left = 384
    Top = 136
  end
  object DataSource1: TDataSource
    DataSet = CDSManerge
    Left = 96
    Top = 200
  end
  object DataSource2: TDataSource
    DataSet = CDSStudent
    Left = 176
    Top = 200
  end
  object DataSource3: TDataSource
    DataSet = CDSExam
    Left = 240
    Top = 200
  end
  object DataSource4: TDataSource
    DataSet = CDSInformation
    Left = 312
    Top = 200
  end
  object DataSource5: TDataSource
    DataSet = CDSStatus
    Left = 384
    Top = 200
  end
end
