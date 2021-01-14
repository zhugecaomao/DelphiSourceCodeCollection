object DM: TDM
  OldCreateOrder = False
  Left = 238
  Top = 99
  Height = 589
  Width = 690
  object ADO_BMBMK: TADOTable
    Connection = frmMain.ADOConnect
    TableName = 'bmbmk'
    Left = 48
    Top = 40
  end
  object ADO_CLJXB: TADOTable
    Connection = frmMain.ADOConnect
    OnCalcFields = ADO_CLJXBCalcFields
    IndexName = 'IX_cljxb'
    TableName = 'cljxb'
    Left = 128
    Top = 40
    object ADO_CLJXBsdate: TDateTimeField
      DisplayLabel = #26085#26399
      FieldName = 'sdate'
    end
    object ADO_CLJXBbmbh: TWideStringField
      DisplayLabel = #37096#38376#32534#30721
      FieldName = 'bmbh'
      FixedChar = True
      Size = 10
    end
    object ADO_CLJXBspbh: TWideStringField
      DisplayLabel = #21830#21697#32534#30721
      DisplayWidth = 12
      FieldName = 'spbh'
      FixedChar = True
      Size = 12
    end
    object ADO_CLJXBspmc: TWideStringField
      DisplayLabel = #21830#21697#21517#31216
      FieldName = 'spmc'
      FixedChar = True
      Size = 50
    end
    object ADO_CLJXBspdj: TBCDField
      DisplayLabel = #21333#20215
      FieldName = 'spdj'
      Precision = 19
    end
    object ADO_CLJXBjldw: TWideStringField
      DisplayLabel = #21333#20301
      FieldName = 'jldw'
      FixedChar = True
      Size = 10
    end
    object ADO_CLJXBzlts: TIntegerField
      DisplayLabel = #22825#25968
      FieldName = 'zlts'
    end
    object ADO_CLJXBmoney: TFloatField
      DisplayLabel = #37329#39069
      FieldKind = fkCalculated
      FieldName = 'money'
      Calculated = True
    end
    object ADO_CLJXBynsf: TBooleanField
      DisplayLabel = #26159#21542#20511'/'#36824
      FieldName = 'ynsf'
    end
    object ADO_CLJXBynqc: TBooleanField
      FieldName = 'ynqc'
    end
    object ADO_CLJXBsfno: TWideStringField
      FieldName = 'sfno'
      FixedChar = True
      Size = 8
    end
    object ADO_CLJXBynjs: TBooleanField
      FieldName = 'ynjs'
    end
    object ADO_CLJXByntz: TBooleanField
      FieldName = 'yntz'
    end
    object ADO_CLJXBfcsl: TFloatField
      FieldName = 'fcsl'
    end
    object ADO_CLJXBhssl: TFloatField
      FieldName = 'hssl'
    end
    object ADO_CLJXBjsje: TFloatField
      FieldName = 'jsje'
    end
  end
  object ADO_DWINFO: TADOTable
    Connection = frmMain.ADOConnect
    TableName = 'dwinfo'
    Left = 200
    Top = 40
  end
  object ADO_SPBMK: TADOTable
    Connection = frmMain.ADOConnect
    TableName = 'spbmk'
    Left = 304
    Top = 40
    object ADO_SPBMKspbh: TWideStringField
      FieldName = 'spbh'
      FixedChar = True
      Size = 8
    end
    object ADO_SPBMKspmc: TWideStringField
      FieldName = 'spmc'
      FixedChar = True
      Size = 50
    end
    object ADO_SPBMKggxh: TWideStringField
      FieldName = 'ggxh'
      FixedChar = True
      Size = 10
    end
    object ADO_SPBMKspdj: TBCDField
      FieldName = 'spdj'
      Precision = 19
    end
    object ADO_SPBMKjldw: TWideStringField
      FieldName = 'jldw'
      FixedChar = True
      Size = 10
    end
    object ADO_SPBMKbz: TWideStringField
      FieldName = 'bz'
      FixedChar = True
      Size = 50
    end
    object ADO_SPBMKjldw2: TWideStringField
      FieldName = 'jldw2'
      FixedChar = True
      Size = 10
    end
    object ADO_SPBMKhsbl: TFloatField
      FieldName = 'hsbl'
    end
    object ADO_SPBMKtzcl: TBooleanField
      FieldName = 'tzcl'
    end
  end
  object ADO_VW_SFDJ: TADOTable
    Connection = frmMain.ADOConnect
    TableName = 'vw_sfdj'
    Left = 40
    Top = 352
  end
  object ADO_VW_DJMX_Y: TADOTable
    Connection = frmMain.ADOConnect
    TableName = 'vw_sfmx_y'
    Left = 152
    Top = 352
  end
  object DS_BMBMK: TDataSource
    DataSet = ADO_BMBMK
    Left = 40
    Top = 120
  end
  object DS_CLJXB: TDataSource
    DataSet = ADO_CLJXB
    Left = 128
    Top = 128
  end
  object DS_DWINFO: TDataSource
    DataSet = ADO_DWINFO
    Left = 216
    Top = 120
  end
  object DS_SPBMK: TDataSource
    DataSet = ADO_SPBMK
    Left = 312
    Top = 120
  end
  object DS_VW_SFDJ: TDataSource
    DataSet = ADO_VW_SFDJ
    Left = 32
    Top = 416
  end
  object DS_VW_DJMX_Y: TDataSource
    DataSet = ADO_VW_DJMX_Y
    Left = 144
    Top = 416
  end
  object ADO_USESZ: TADOTable
    Connection = frmMain.ADOConnect
    TableName = 'Usesz'
    Left = 432
    Top = 48
  end
  object DS_USESZ: TDataSource
    DataSet = ADO_USESZ
    Left = 424
    Top = 112
  end
  object ADO_TBTMP: TADOTable
    Connection = frmMain.ADOConnect
    OnCalcFields = ADO_TBTMPCalcFields
    TableName = 'sftmp'
    Left = 264
    Top = 352
    object ADO_TBTMPseri: TSmallintField
      FieldName = 'seri'
    end
    object ADO_TBTMPsfno: TWideStringField
      DisplayWidth = 12
      FieldName = 'sfno'
      FixedChar = True
      Size = 12
    end
    object ADO_TBTMPCl_0: TFloatField
      FieldName = 'Cl_0'
    end
    object ADO_TBTMPcl_1: TFloatField
      FieldName = 'cl_1'
    end
    object ADO_TBTMPcl_2: TFloatField
      FieldName = 'cl_2'
    end
    object ADO_TBTMPcl_3: TFloatField
      FieldName = 'cl_3'
    end
    object ADO_TBTMPcl_4: TFloatField
      FieldName = 'cl_4'
    end
    object ADO_TBTMPcl_5: TFloatField
      FieldName = 'cl_5'
    end
    object ADO_TBTMPcl_6: TFloatField
      FieldName = 'cl_6'
    end
    object ADO_TBTMPcl_7: TFloatField
      FieldName = 'cl_7'
    end
    object ADO_TBTMPcl_8: TFloatField
      FieldName = 'cl_8'
    end
    object ADO_TBTMPcl_9: TFloatField
      FieldName = 'cl_9'
    end
    object ADO_TBTMPclTal: TFloatField
      FieldKind = fkCalculated
      FieldName = 'clTal'
      ReadOnly = True
      Calculated = True
    end
    object ADO_TBTMPynsf: TBooleanField
      FieldName = 'ynsf'
    end
  end
  object DS_TBTMP: TDataSource
    DataSet = ADO_TBTMP
    Left = 264
    Top = 424
  end
  object ADO_SFDJ: TADOTable
    Connection = frmMain.ADOConnect
    TableName = 'sfdj'
    Left = 528
    Top = 48
  end
  object ADO_GGXHB: TADOTable
    Connection = frmMain.ADOConnect
    AfterPost = ADO_GGXHBAfterPost
    OnCalcFields = ADO_GGXHBCalcFields
    TableName = 'ggxhb'
    Left = 40
    Top = 208
    object ADO_GGXHBsfno: TWideStringField
      DisplayWidth = 12
      FieldName = 'sfno'
      FixedChar = True
      Size = 12
    end
    object ADO_GGXHBspbh: TWideStringField
      FieldName = 'spbh'
      FixedChar = True
      Size = 8
    end
    object ADO_GGXHBfields: TWideStringField
      FieldName = 'fields'
      FixedChar = True
      Size = 8
    end
    object ADO_GGXHBlong: TFloatField
      FieldName = 'long'
    end
    object ADO_GGXHBweith: TFloatField
      FieldName = 'weith'
    end
    object ADO_GGXHBhight: TFloatField
      FieldName = 'hight'
    end
    object ADO_GGXHBnumber: TFloatField
      FieldName = 'number'
    end
    object ADO_GGXHBtotal: TFloatField
      FieldKind = fkCalculated
      FieldName = 'total'
      Calculated = True
    end
    object ADO_GGXHBbz: TWideStringField
      FieldName = 'bz'
      FixedChar = True
      Size = 100
    end
    object ADO_GGXHBseri: TSmallintField
      FieldName = 'seri'
    end
  end
  object DS_GGXHB: TDataSource
    DataSet = ADO_GGXHB
    Left = 48
    Top = 272
  end
  object ADO_SPBMK_INDEX: TADOTable
    Connection = frmMain.ADOConnect
    IndexName = 'PK_spbmk'
    TableName = 'spbmk'
    Left = 144
    Top = 208
  end
  object DS_SPBMK_INDEX: TDataSource
    DataSet = ADO_SPBMK_INDEX
    Left = 144
    Top = 272
  end
  object ADO_CLJX: TADOTable
    Connection = frmMain.ADOConnect
    TableName = 'cljxb'
    Left = 312
    Top = 192
  end
  object DS_CLJX: TDataSource
    DataSet = ADO_CLJX
    Left = 320
    Top = 272
  end
end
