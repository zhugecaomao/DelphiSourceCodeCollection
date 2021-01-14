object DataModule2: TDataModule2
  OldCreateOrder = False
  Left = 192
  Top = 107
  Height = 150
  Width = 215
  object DCOMConnection1: TDCOMConnection
    Connected = True
    ServerGUID = '{B674DE19-F8FC-4448-BFAA-3A3A5BDA7AEE}'
    ServerName = 'Proserver.examserver'
    Left = 8
    Top = 8
  end
  object CDSInformation: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPInformation'
    RemoteServer = DCOMConnection1
    Left = 80
    Top = 8
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
  end
  object CDSExam: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPExam'
    RemoteServer = DCOMConnection1
    Left = 80
    Top = 56
    object CDSExamCDSDesigner: TSmallintField
      FieldName = #39064#21495
    end
    object CDSExamCDSDesigner2: TMemoField
      FieldName = #39064#30446
      BlobType = ftMemo
    end
    object CDSExamA: TWideStringField
      FieldName = #31572#26696'A'
      Size = 2
    end
    object CDSExamB: TWideStringField
      FieldName = #31572#26696'B'
      Size = 2
    end
    object CDSExamC: TWideStringField
      FieldName = #31572#26696'C'
      Size = 2
    end
    object CDSExamD: TWideStringField
      FieldName = #31572#26696'D'
      Size = 2
    end
    object CDSExamE: TWideStringField
      FieldName = #31572#26696'E'
      Size = 2
    end
  end
  object CDSStudent: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPStudent'
    RemoteServer = DCOMConnection1
    Left = 144
    Top = 8
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
  end
  object CDSKaoshi: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPKaojuan'
    RemoteServer = DCOMConnection1
    Left = 144
    Top = 56
  end
end
