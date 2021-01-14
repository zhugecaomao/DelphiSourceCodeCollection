object DM: TDM
  OldCreateOrder = False
  Left = 269
  Top = 304
  Height = 476
  Width = 711
  object CDS_QXGL_YHSZ: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'P_QXGL_YHSZ'
    Left = 273
    Top = 8
  end
  object CDS_QXGL_ZHSZ: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'P_QXGL_ZHSZ'
    Left = 56
    Top = 8
    object CDS_QXGL_ZHSZCDSDesigner: TStringField
      FieldName = #32452#21495
      FixedChar = True
      Size = 1
    end
    object CDS_QXGL_ZHSZCDSDesigner2: TStringField
      FieldName = #32452#26631#39064
    end
    object CDS_QXGL_ZHSZCDSDesigner3: TStringField
      FieldName = #32452#35828#26126
      Size = 80
    end
    object CDS_QXGL_ZHSZQ_QXGL_ZHNR: TDataSetField
      FieldName = 'Q_QXGL_ZHNR'
    end
  end
  object CDS_QXGL_ZHNR: TClientDataSet
    Aggregates = <>
    DataSetField = CDS_QXGL_ZHSZQ_QXGL_ZHNR
    Params = <>
    Left = 162
    Top = 8
  end
  object CDS_QXGL_ZHSZ_INDEX: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'P_QXGL_ZHSZ'
    Left = 56
    Top = 62
  end
  object CDS_QXGL_ZHNR_INDEX: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'P_QXGL_ZHNR_INDEX'
    Left = 162
    Top = 62
  end
  object CDS_QXGL_YHSZ_INDEX: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'P_QXGL_YHSZ'
    Left = 273
    Top = 62
  end
  object CDS_ZGDA: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'P_ZGDA'
    Left = 56
    Top = 170
  end
  object CDS_BMDA: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'P_BMDA'
    Left = 162
    Top = 116
  end
  object CDS_DQFLB: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'P_DQFLB'
    Left = 273
    Top = 170
  end
  object CDS_GYSFLB: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'P_GYSFLB'
    Left = 368
    Top = 170
  end
  object CDS_GYSDA: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'P_GYSDA'
    Left = 448
    Top = 170
  end
  object CDS_DQFLB_INDEX: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'P_DQFLB'
    Left = 273
    Top = 116
  end
  object CDS_GYSFLB_INDEX: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'P_GYSFLB'
    Left = 368
    Top = 116
  end
  object CDS_GYSDA_INDEX: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'P_GYSDA'
    Left = 448
    Top = 116
  end
  object CDS_ZGDA_INDEX: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'P_ZGDA'
    Left = 56
    Top = 116
  end
  object CDS_BMDA_INDEX: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'P_BMDA'
    Left = 162
    Top = 170
  end
  object CDS_CLSLD_CX: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'P_CLSLD_CX'
    Left = 496
    Top = 276
  end
  object CDS_CLSLD: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'P_CLSLD'
    OnReconcileError = CDS_CLSLDReconcileError
    Left = 56
    Top = 278
    object CDS_CLSLDCDSDesigner: TStringField
      FieldName = #25910#26009#23383#21495
      FixedChar = True
      Size = 9
    end
    object CDS_CLSLDCDSDesigner2: TStringField
      FieldName = #20179#24211#21517#31216
      FixedChar = True
    end
    object CDS_CLSLDCDSDesigner3: TDateTimeField
      FieldName = #21046#21333#26085#26399
    end
    object CDS_CLSLDCDSDesigner4: TStringField
      FieldName = #20379#24212#21378#23478
      FixedChar = True
      Size = 40
    end
    object CDS_CLSLDCDSDesigner5: TStringField
      FieldName = #29289#36164#26469#28304
      FixedChar = True
    end
    object CDS_CLSLDCDSDesigner6: TStringField
      FieldName = #37319#36141#20154
      FixedChar = True
    end
    object CDS_CLSLDCDSDesigner7: TStringField
      FieldName = #21512#21516#32534#21495
      FixedChar = True
      Size = 14
    end
    object CDS_CLSLDCDSDesigner8: TFloatField
      FieldName = #21457#31080#37329#39069
    end
    object CDS_CLSLDCDSDesigner9: TFloatField
      FieldName = #20854#20013#36816#26434#36153
    end
    object CDS_CLSLDCDSDesigner10: TStringField
      FieldName = #21457#31080#21495
      FixedChar = True
      Size = 7
    end
    object CDS_CLSLDCDSDesigner11: TStringField
      FieldName = #20027#31649
      FixedChar = True
    end
    object CDS_CLSLDCDSDesigner12: TStringField
      FieldName = #21046#21333#20154
      FixedChar = True
    end
    object CDS_CLSLDCDSDesigner13: TStringField
      FieldName = #39564#25910#20154
      FixedChar = True
    end
    object CDS_CLSLDCDSDesigner14: TStringField
      FieldName = #23457#26680#20154
      FixedChar = True
    end
    object CDS_CLSLDCDSDesigner15: TBooleanField
      FieldName = #26159#21542#23457#26680
    end
    object CDS_CLSLDCDSDesigner16: TDateTimeField
      FieldName = #23457#26680#26085#26399
    end
    object CDS_CLSLDCDSDesigner17: TStringField
      FieldName = #21333#25454#22791#27880
      FixedChar = True
      Size = 40
    end
    object CDS_CLSLDQ_CLSLD_DETAIL: TDataSetField
      FieldName = 'Q_CLSLD_DETAIL'
    end
  end
  object CDS_CLSLD_DETAIL: TClientDataSet
    Aggregates = <>
    DataSetField = CDS_CLSLDQ_CLSLD_DETAIL
    Params = <>
    OnCalcFields = CDS_CLSLD_DETAILCalcFields
    Left = 162
    Top = 278
    object CDS_CLSLD_DETAILID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object CDS_CLSLD_DETAILCDSDesigner: TStringField
      FieldName = #25910#26009#23383#21495
      FixedChar = True
      Size = 9
    end
    object CDS_CLSLD_DETAILCDSDesigner2: TStringField
      FieldName = #26448#26009#32534#21495
      FixedChar = True
      Size = 11
    end
    object CDS_CLSLD_DETAILCDSDesigner3: TStringField
      FieldName = #23384#25918#20301#32622
      FixedChar = True
      Size = 7
    end
    object CDS_CLSLD_DETAILCDSDesigner4: TFloatField
      FieldName = #23454#25910#25968#37327
    end
    object CDS_CLSLD_DETAILCDSDesigner5: TFloatField
      FieldName = #20837#24211#21333#20215
    end
    object CDS_CLSLD_DETAILCDSDesigner6: TFloatField
      FieldName = #20973#35777#25968#37327
    end
    object CDS_CLSLD_DETAILCDSDesigner7: TStringField
      FieldName = #26448#26009#21517#31216
      FixedChar = True
      Size = 40
    end
    object CDS_CLSLD_DETAILCDSDesigner8: TStringField
      FieldName = #35268#26684#22411#21495
      FixedChar = True
      Size = 40
    end
    object CDS_CLSLD_DETAILCDSDesigner9: TStringField
      FieldName = #35745#37327#21333#20301
      FixedChar = True
    end
    object CDS_CLSLD_DETAILCDSDesigner10: TCurrencyField
      FieldName = #35745#21010#21333#20215
    end
    object CDS_CLSLD_DETAILCDSDesigner11: TStringField
      FieldName = #21333#20215#21333#20301
      FixedChar = True
    end
    object CDS_CLSLD_DETAILField: TFloatField
      FieldKind = fkCalculated
      FieldName = #20837#24211#24635#20215
      Calculated = True
    end
  end
  object CDS_CLBM_INDEX: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'P_CLBM'
    Left = 162
    Top = 224
  end
  object CDS_CLBM_TEMP_INDEX: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'P_CLBM_TEMP'
    Left = 273
    Top = 224
  end
  object CDS_CKXX_INDEX: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'P_CKXX'
    Left = 368
    Top = 224
  end
  object CDS_CKXX: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'P_CKXX'
    Left = 448
    Top = 224
    object CDS_CKXXCDSDesigner: TStringField
      FieldName = #20179#24211#21517#31216
      FixedChar = True
    end
    object CDS_CKXXCDSDesigner2: TStringField
      FieldName = #20179#24211#22320#28857
      FixedChar = True
      Size = 40
    end
    object CDS_CKXXCDSDesigner3: TStringField
      FieldName = #36127#36131#20154
      FixedChar = True
    end
    object CDS_CKXXCDSDesigner4: TStringField
      FieldName = #32852#31995#30005#35805
      FixedChar = True
    end
    object CDS_CKXXCDSDesigner5: TStringField
      FieldName = #22791#27880
      FixedChar = True
      Size = 40
    end
  end
  object CDS_CLSLD_INDEX: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'P_CLSLD'
    Left = 273
    Top = 278
  end
  object CDS_CLSLD_DETAIL_INDEX: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'P_CLSLD_DETAIL_INDEX'
    Left = 384
    Top = 278
  end
  object CDS_BMLLD: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'P_BMLLD'
    Left = 56
    Top = 334
    object CDS_BMLLDCDSDesigner: TStringField
      FieldName = #39046#26009#23383#21495
      FixedChar = True
      Size = 9
    end
    object CDS_BMLLDCDSDesigner2: TStringField
      FieldName = #20179#24211#21517#31216
      FixedChar = True
    end
    object CDS_BMLLDCDSDesigner3: TStringField
      FieldName = #39046#26009#21333#20301
      FixedChar = True
      Size = 40
    end
    object CDS_BMLLDCDSDesigner4: TDateTimeField
      FieldName = #21046#21333#26085#26399
    end
    object CDS_BMLLDCDSDesigner5: TStringField
      FieldName = #24037#31243#39033#30446
      FixedChar = True
      Size = 40
    end
    object CDS_BMLLDCDSDesigner6: TStringField
      FieldName = #39046#26009#29992#36884
      FixedChar = True
      Size = 40
    end
    object CDS_BMLLDCDSDesigner7: TStringField
      FieldName = #26448#26009#20027#31649
      FixedChar = True
    end
    object CDS_BMLLDCDSDesigner8: TStringField
      FieldName = #21457#26009#20154
      FixedChar = True
    end
    object CDS_BMLLDCDSDesigner9: TStringField
      FieldName = #39046#26009#20027#31649
      FixedChar = True
    end
    object CDS_BMLLDCDSDesigner10: TStringField
      FieldName = #39046#26009#20154
      FixedChar = True
    end
    object CDS_BMLLDCDSDesigner11: TStringField
      FieldName = #22791#27880
      FixedChar = True
      Size = 40
    end
    object CDS_BMLLDCDSDesigner12: TStringField
      FieldName = #23457#26680#20154
      FixedChar = True
    end
    object CDS_BMLLDCDSDesigner13: TBooleanField
      FieldName = #26159#21542#23457#26680
    end
    object CDS_BMLLDCDSDesigner14: TDateTimeField
      FieldName = #23457#26680#26085#26399
    end
    object CDS_BMLLDQ_BMLLD_DETAIL: TDataSetField
      FieldName = 'Q_BMLLD_DETAIL'
    end
  end
  object CDS_BMLLD_DETAIL: TClientDataSet
    Aggregates = <>
    DataSetField = CDS_BMLLDQ_BMLLD_DETAIL
    Params = <>
    OnCalcFields = CDS_CLSLD_DETAILCalcFields
    Left = 162
    Top = 334
  end
  object CDS_BMLLD_DETAIL_INDEX: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'P_BMLLD_DETAIL_INDEX'
    Left = 393
    Top = 334
  end
  object CDS_BMLLD_CX: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'P_BMLLD_CX'
    Left = 504
    Top = 334
  end
  object CDS_BMLLD_INDEX: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'P_BMLLD'
    Left = 280
    Top = 336
  end
  object CDS_GCXMDY: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'P_GCXMDYB'
    Left = 528
    Top = 112
  end
  object CDS_GCXMDY_INDEX: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'P_GCXMDYB'
    Left = 616
    Top = 112
  end
  object CDS_KC: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'P_KC'
    Left = 48
    Top = 400
  end
end
