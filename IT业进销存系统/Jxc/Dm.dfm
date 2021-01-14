object Data: TData
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 308
  Top = 167
  Height = 537
  Width = 800
  object Cn: TDCOMConnection
    ServerGUID = '{7EC66AE4-5977-11D4-927E-0000210072AB}'
    ServerName = 'JxcS.datas'
    Left = 8
    Top = 6
  end
  object Tmp: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pTmp'
    RemoteServer = Cn
    Left = 264
    Top = 6
  end
  object Tmpf: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pTmpf'
    RemoteServer = Cn
    Left = 294
    Top = 6
  end
  object Tmpl: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pTmpl'
    RemoteServer = Cn
    Left = 324
    Top = 6
  end
  object AppUserGroup: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from AppUserGroup'
    PacketRecords = 50
    Params = <>
    ProviderName = 'pAppUserGroup'
    RemoteServer = Cn
    Left = 102
    Top = 2
    object AppUserGroupgName: TStringField
      DisplayLabel = #29992#25143#32452#21035
      FieldName = 'gName'
    end
    object AppUserGroupgMemo: TStringField
      FieldName = 'gMemo'
      Size = 200
    end
  end
  object AppUser: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from AppUser'
    PacketRecords = 50
    Params = <>
    ProviderName = 'pAppUser'
    RemoteServer = Cn
    Left = 132
    Top = 2
    object AppUseruCode: TStringField
      DisplayLabel = #29992#25143#20195#30721
      FieldName = 'uCode'
      Size = 8
    end
    object AppUseruName: TStringField
      DisplayLabel = #29992#25143#21517#31216
      FieldName = 'uName'
    end
    object AppUsergName: TStringField
      DisplayLabel = #32452#21035
      FieldName = 'gName'
    end
    object AppUserID: TIntegerField
      FieldName = 'ID'
    end
  end
  object sAppUser: TDataSource
    DataSet = AppUser
    Left = 140
    Top = 10
  end
  object AppGroupDesktopClass: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from AppGroupDesktopClass'
    PacketRecords = 50
    Params = <>
    ProviderName = 'pAppGroupDesktopClass'
    RemoteServer = Cn
    Left = 162
    Top = 2
    object AppGroupDesktopClassgName: TStringField
      FieldName = 'gName'
    end
    object AppGroupDesktopClasscName: TStringField
      DisplayLabel = #26700#38754#31867#21035
      FieldName = 'cName'
      Size = 30
    end
  end
  object sAppGroupDesktopClass: TDataSource
    DataSet = AppGroupDesktopClass
    Left = 170
    Top = 10
  end
  object sAppUserGroup: TDataSource
    DataSet = AppUserGroup
    Left = 110
    Top = 10
  end
  object AppSelect: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pAppSelect'
    RemoteServer = Cn
    Left = 192
    Top = 2
    object AppSelectDATASET: TStringField
      FieldName = 'DATASET'
    end
    object AppSelectFIELDNAME: TStringField
      FieldName = 'FIELDNAME'
    end
    object AppSelectAUTOUPDATE: TBooleanField
      FieldName = 'AUTOUPDATE'
    end
    object AppSelectDATASELECT: TMemoField
      FieldName = 'DATASELECT'
      BlobType = ftMemo
    end
    object AppSelectDefaultRow: TIntegerField
      FieldName = 'DefaultRow'
    end
  end
  object sAppSelect: TDataSource
    DataSet = AppSelect
    Left = 200
    Top = 10
  end
  object AppLog: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pAppLog'
    RemoteServer = Cn
    Left = 222
    Top = 2
    object AppLoguName: TStringField
      DisplayLabel = #29992#25143#21517#31216
      FieldName = 'uName'
    end
    object AppLogcName: TStringField
      DisplayLabel = #24037#20316#31449#21517#31216
      FieldName = 'cName'
    end
    object AppLogCZ: TStringField
      DisplayLabel = #25805#20316
      FieldName = 'CZ'
      Size = 30
    end
    object AppLogRQ: TDateField
      DisplayLabel = #26085#26399
      FieldName = 'RQ'
    end
    object AppLogSJ: TStringField
      DisplayLabel = #26102#38388
      FieldName = 'SJ'
      Size = 5
    end
  end
  object sAppLog: TDataSource
    DataSet = AppLog
    Left = 230
    Top = 10
  end
  object Dq: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pDq'
    RemoteServer = Cn
    Left = 4
    Top = 54
    object DqID: TIntegerField
      Tag = 1
      FieldName = 'ID'
    end
    object DqMC: TStringField
      DisplayLabel = #21517#31216
      FieldName = 'MC'
      Size = 12
    end
  end
  object sDq: TDataSource
    DataSet = Dq
    Left = 12
    Top = 66
  end
  object AppMenu: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from AppMenu order by mIndex'
    Params = <>
    ProviderName = 'pAppMenu'
    RemoteServer = Cn
    Left = 72
    Top = 2
    object AppMenumName: TStringField
      FieldName = 'mName'
      Size = 30
    end
    object AppMenumCaption: TStringField
      DisplayLabel = #39033#30446
      FieldName = 'mCaption'
      OnGetText = AppMenumCaptionGetText
      Size = 50
    end
    object AppMenumLevel: TIntegerField
      FieldName = 'mLevel'
    end
    object AppMenumIndex: TIntegerField
      FieldName = 'mIndex'
    end
    object AppMenumIsParent: TBooleanField
      FieldName = 'mIsParent'
    end
  end
  object sAppMenu: TDataSource
    DataSet = AppMenu
    Left = 80
    Top = 10
  end
  object Kh: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    PacketRecords = 50
    Params = <>
    ProviderName = 'pKh'
    RemoteServer = Cn
    Left = 35
    Top = 54
    object KhID: TIntegerField
      Tag = 1
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object KhBH: TStringField
      DisplayLabel = #32534#21495
      FieldName = 'BH'
      Size = 12
    end
    object KhMC: TStringField
      DisplayLabel = #31616#31216
      FieldName = 'MC'
    end
    object KhQC: TStringField
      DisplayLabel = #20840#31216
      FieldName = 'QC'
      Size = 40
    end
    object KhDQID: TIntegerField
      Tag = 1
      DisplayLabel = #25152#23646#22320#21306
      FieldName = 'DQID'
    end
    object KhaDQMC: TStringField
      DisplayLabel = #25152#23646#22320#21306
      FieldName = 'aDQMC'
      Size = 12
    end
    object KhLXR: TStringField
      DisplayLabel = #32852#31995#20154
      FieldName = 'LXR'
      Size = 16
    end
    object KhDH: TStringField
      DisplayLabel = #30005#35805
      FieldName = 'DH'
    end
    object KhCZ: TStringField
      DisplayLabel = #20256#30495
      FieldName = 'CZ'
    end
    object KhDZ: TStringField
      DisplayLabel = #22320#22336
      FieldName = 'DZ'
      Size = 40
    end
    object KhYB: TStringField
      DisplayLabel = #37038#32534
      FieldName = 'YB'
      Size = 6
    end
    object KhWZ: TStringField
      DisplayLabel = #32593#22336
      FieldName = 'WZ'
      Size = 40
    end
    object KhDY: TStringField
      DisplayLabel = #30005#23376#37038#31665
      FieldName = 'DY'
      Size = 40
    end
    object KhKHYH: TStringField
      DisplayLabel = #24320#25143#38134#34892
      FieldName = 'KHYH'
      Size = 30
    end
    object KhYHZH: TStringField
      DisplayLabel = #38134#34892#24080#21495
      FieldName = 'YHZH'
    end
    object KhNSH: TStringField
      DisplayLabel = #32435#31246#21495
      FieldName = 'NSH'
    end
    object KhQCJE: TFloatField
      DisplayLabel = #26399#21021#24212#25910#27454
      DisplayWidth = 12
      FieldName = 'QCJE'
      DisplayFormat = '#,0.00'
    end
    object KhYXJE: TFloatField
      DisplayLabel = #39044#25910#37329#39069
      DisplayWidth = 12
      FieldName = 'YXJE'
      DisplayFormat = '#,0.00'
    end
    object KhQMJE: TFloatField
      DisplayLabel = #24212#25910#37329#39069
      DisplayWidth = 12
      FieldName = 'QMJE'
      DisplayFormat = '#,0.00'
    end
    object KhaSJJE: TFloatField
      DisplayLabel = #23454#38469#27424#27454
      DisplayWidth = 12
      FieldName = 'aSJJE'
      DisplayFormat = '#,0.00'
    end
    object KhXYED: TFloatField
      DisplayLabel = #20449#29992#39069#24230
      DisplayWidth = 12
      FieldName = 'XYED'
      DisplayFormat = '#,#.##'
    end
    object KhZT: TBooleanField
      Tag = 1
      DisplayLabel = #38750#20351#29992#20013
      FieldName = 'ZT'
      DisplayValues = #8730';'
    end
    object KhBZ: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'BZ'
      Size = 40
    end
    object KhITMP: TIntegerField
      Tag = 1
      FieldName = 'ITMP'
    end
  end
  object sKh: TDataSource
    DataSet = Kh
    Left = 45
    Top = 66
  end
  object Gys: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pGys'
    RemoteServer = Cn
    Left = 66
    Top = 54
    object GysID: TIntegerField
      Tag = 1
      FieldName = 'ID'
    end
    object GysBH: TStringField
      DisplayLabel = #32534#21495
      FieldName = 'BH'
      Size = 12
    end
    object GysMC: TStringField
      DisplayLabel = #31616#31216
      FieldName = 'MC'
    end
    object GysQC: TStringField
      DisplayLabel = #20840#31216
      FieldName = 'QC'
      Size = 40
    end
    object GysLXR: TStringField
      DisplayLabel = #32852#31995#20154
      FieldName = 'LXR'
      Size = 16
    end
    object GysDH: TStringField
      DisplayLabel = #30005#35805
      FieldName = 'DH'
    end
    object GysCZ: TStringField
      DisplayLabel = #20256#30495
      FieldName = 'CZ'
    end
    object GysDZ: TStringField
      DisplayLabel = #22320#22336
      FieldName = 'DZ'
      Size = 40
    end
    object GysYB: TStringField
      DisplayLabel = #37038#32534
      FieldName = 'YB'
      Size = 6
    end
    object GysWZ: TStringField
      DisplayLabel = #32593#22336
      FieldName = 'WZ'
      Size = 40
    end
    object GysDY: TStringField
      DisplayLabel = #30005#23376#37038#31665
      FieldName = 'DY'
      Size = 40
    end
    object GysKHYH: TStringField
      DisplayLabel = #24320#25143#38134#34892
      FieldName = 'KHYH'
      Size = 30
    end
    object GysYHZH: TStringField
      DisplayLabel = #38134#34892#24080#21495
      FieldName = 'YHZH'
    end
    object GysNSH: TStringField
      DisplayLabel = #32435#31246#21495
      FieldName = 'NSH'
    end
    object GysQCJE: TFloatField
      DisplayLabel = #26399#21021#24212#20184#27454
      DisplayWidth = 12
      FieldName = 'QCJE'
      DisplayFormat = '#,0.00'
    end
    object GysYXJE: TFloatField
      DisplayLabel = #39044#20184#37329#39069
      DisplayWidth = 12
      FieldName = 'YXJE'
      DisplayFormat = '#,0.00'
    end
    object GysQMJE: TFloatField
      DisplayLabel = #24212#20184#37329#39069
      DisplayWidth = 12
      FieldName = 'QMJE'
      DisplayFormat = '#,0.00'
    end
    object GysaSJJE: TFloatField
      DisplayLabel = #23454#38469#27424#27454
      DisplayWidth = 12
      FieldName = 'aSJJE'
      DisplayFormat = '#,0.00'
    end
    object GysZT: TBooleanField
      Tag = 1
      DisplayLabel = #38750#20351#29992#20013
      FieldName = 'ZT'
      DisplayValues = #8730';'
    end
    object GysBZ: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'BZ'
      Size = 50
    end
    object GysITMP: TIntegerField
      FieldName = 'ITMP'
    end
  end
  object sGys: TDataSource
    DataSet = Gys
    Left = 78
    Top = 66
  end
  object Zh: TClientDataSet
    Aggregates = <
      item
        Visible = False
      end>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pZh'
    RemoteServer = Cn
    Left = 96
    Top = 54
    object ZhID: TIntegerField
      Tag = 1
      FieldName = 'ID'
    end
    object ZhMC: TStringField
      DisplayLabel = #24080#25143#21517#31216
      FieldName = 'MC'
    end
    object ZhYHL: TBooleanField
      Tag = 1
      DisplayLabel = #31867#21035
      DisplayWidth = 10
      FieldName = 'YHL'
      OnGetText = ZhYHLGetText
    end
    object ZhaYHL: TStringField
      DisplayLabel = #31867#21035
      FieldName = 'aYHL'
      Size = 255
    end
    object ZhKHYH: TStringField
      DisplayLabel = #24320#25143#38134#34892
      FieldName = 'KHYH'
      Size = 40
    end
    object ZhYHZH: TStringField
      DisplayLabel = #38134#34892#24080#21495
      FieldName = 'YHZH'
    end
    object ZhQCJE: TFloatField
      DisplayLabel = #26399#21021#20313#39069
      DisplayWidth = 12
      FieldName = 'QCJE'
      DisplayFormat = '#,0.00'
    end
    object ZhQMJE: TFloatField
      DisplayLabel = #20313#39069
      DisplayWidth = 12
      FieldName = 'QMJE'
      DisplayFormat = '#,0.00'
    end
    object ZhITMP: TIntegerField
      FieldName = 'ITMP'
    end
  end
  object sZh: TDataSource
    DataSet = Zh
    Left = 111
    Top = 66
  end
  object Sfkfs: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pSfkfs'
    RemoteServer = Cn
    BeforeOpen = SfkfsBeforeOpen
    Left = 127
    Top = 54
    object SfkfsID: TIntegerField
      FieldName = 'ID'
    end
    object SfkfsMC: TStringField
      DisplayLabel = #21517#31216
      FieldName = 'MC'
      Size = 16
    end
    object SfkfsZHID: TIntegerField
      DisplayLabel = #32570#30465#24080#25143
      FieldName = 'ZHID'
    end
    object SfkfsaZHMC: TStringField
      DisplayLabel = #32570#30465#24080#25143
      FieldName = 'aZHMC'
    end
  end
  object sSfkfs: TDataSource
    DataSet = Sfkfs
    Left = 144
    Top = 66
  end
  object Srzclb: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pSrzclb'
    RemoteServer = Cn
    Left = 158
    Top = 54
    object SrzclbID: TIntegerField
      Tag = 1
      FieldName = 'ID'
    end
    object SrzclbBH: TStringField
      DisplayLabel = #32534#21495
      FieldName = 'BH'
      Size = 6
    end
    object SrzclbMC: TStringField
      DisplayLabel = #21517#31216
      FieldName = 'MC'
    end
    object SrzclbSRL: TBooleanField
      Tag = 1
      DisplayLabel = #31867#21035
      DisplayWidth = 6
      FieldName = 'SRL'
      OnGetText = SrzclbSRLGetText
    end
    object SrzclbaSRL: TStringField
      DisplayLabel = #31867#21035
      DisplayWidth = 10
      FieldName = 'aSRL'
      Size = 255
    end
    object SrzclbBZ: TStringField
      DisplayLabel = #35828#26126
      FieldName = 'BZ'
      Size = 32
    end
  end
  object sSrzclb: TDataSource
    DataSet = Srzclb
    Left = 177
    Top = 66
  end
  object Hplb: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pHplb'
    RemoteServer = Cn
    Left = 220
    Top = 54
    object HplbID: TIntegerField
      Tag = 1
      FieldName = 'ID'
    end
    object HplbMC: TStringField
      DisplayLabel = #21517#31216
      FieldName = 'MC'
      Size = 16
    end
    object HplbBZ: TStringField
      DisplayLabel = #35828#26126
      FieldName = 'BZ'
      Size = 30
    end
  end
  object sHplb: TDataSource
    DataSet = Hplb
    Left = 244
    Top = 66
  end
  object Sjzl: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pSjzl'
    RemoteServer = Cn
    Left = 250
    Top = 54
    object SjzlID: TIntegerField
      Tag = 1
      FieldName = 'ID'
    end
    object SjzlXH: TIntegerField
      DisplayLabel = #24207#21495
      DisplayWidth = 4
      FieldName = 'XH'
    end
    object SjzlMC: TStringField
      DisplayLabel = #21517#31216
      FieldName = 'MC'
      Size = 16
    end
    object SjzlBZ: TStringField
      DisplayLabel = #35828#26126
      FieldName = 'BZ'
      Size = 30
    end
  end
  object sSjzl: TDataSource
    DataSet = Sjzl
    Left = 277
    Top = 66
  end
  object Cyjsdw: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pCyjsdw'
    RemoteServer = Cn
    Left = 281
    Top = 54
    object CyjsdwMC: TStringField
      DisplayLabel = #35745#31639#21333#20301
      FieldName = 'MC'
      Size = 8
    end
  end
  object sCyjsdw: TDataSource
    DataSet = Cyjsdw
    Left = 310
    Top = 66
  end
  object Hphsff: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pHphsff'
    RemoteServer = Cn
    Left = 312
    Top = 54
    object HphsffID: TIntegerField
      Tag = 1
      FieldName = 'ID'
    end
    object HphsffMC: TStringField
      DisplayLabel = #21517#31216
      FieldName = 'MC'
    end
    object HphsffLB: TIntegerField
      Tag = 1
      Alignment = taLeftJustify
      DisplayLabel = #36135#21697#23646#24615
      DisplayWidth = 10
      FieldName = 'LB'
      OnGetText = ConverHphsff
    end
  end
  object sHphsff: TDataSource
    DataSet = Hphsff
    Left = 343
    Top = 66
  end
  object Ck: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pCk'
    RemoteServer = Cn
    Left = 189
    Top = 54
    object CkID: TIntegerField
      Tag = 1
      FieldName = 'ID'
    end
    object CkXH: TIntegerField
      DisplayLabel = #24207#21495
      DisplayWidth = 4
      FieldName = 'XH'
    end
    object CkMC: TStringField
      DisplayLabel = #21517#31216
      FieldName = 'MC'
      Size = 16
    end
    object CkWZ: TStringField
      DisplayLabel = #20301#32622
      FieldName = 'WZ'
      Size = 40
    end
    object CkBZ: TStringField
      DisplayLabel = #35828#26126
      FieldName = 'BZ'
      Size = 40
    end
  end
  object sCk: TDataSource
    DataSet = Ck
    Left = 210
    Top = 66
  end
  object Bm: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pBm'
    RemoteServer = Cn
    Left = 39
    Top = 110
    object BmID: TIntegerField
      Tag = 1
      FieldName = 'ID'
    end
    object BmMC: TStringField
      DisplayLabel = #21517#31216
      DisplayWidth = 16
      FieldName = 'MC'
      Size = 12
    end
  end
  object sBm: TDataSource
    DataSet = Bm
    Left = 43
    Top = 114
  end
  object Yglb: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pYglb'
    RemoteServer = Cn
    Left = 69
    Top = 110
    object YglbID: TIntegerField
      Tag = 1
      FieldName = 'ID'
    end
    object YglbMC: TStringField
      DisplayLabel = #21517#31216
      DisplayWidth = 16
      FieldName = 'MC'
      Size = 32
    end
  end
  object sYglb: TDataSource
    DataSet = Yglb
    Left = 73
    Top = 114
  end
  object Yg: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pYg'
    RemoteServer = Cn
    Left = 99
    Top = 110
    object YgID: TIntegerField
      Tag = 1
      FieldName = 'ID'
    end
    object YgBH: TStringField
      DisplayLabel = #32534#21495
      FieldName = 'BH'
      Size = 4
    end
    object YgXM: TStringField
      DisplayLabel = #22995#21517
      FieldName = 'XM'
      Size = 8
    end
    object YgXB: TStringField
      DisplayLabel = #24615#21035
      FieldName = 'XB'
      Size = 2
    end
    object YgBMID: TIntegerField
      Tag = 1
      FieldName = 'BMID'
    end
    object YgaBMMC: TStringField
      DisplayLabel = #37096#38376
      FieldName = 'aBMMC'
      Size = 16
    end
    object YgcBMMC: TStringField
      DisplayLabel = #37096#38376
      FieldKind = fkInternalCalc
      FieldName = 'cBMMC'
      Size = 16
    end
    object YgYGLBID: TIntegerField
      Tag = 1
      FieldName = 'YGLBID'
    end
    object YgaYGLBMC: TStringField
      DisplayLabel = #21592#24037#31867#21035
      FieldName = 'aYGLBMC'
      Size = 16
    end
    object YgcYGLBMC: TStringField
      DisplayLabel = #21592#24037#31867#21035
      FieldKind = fkInternalCalc
      FieldName = 'cYGLBMC'
      Size = 16
    end
    object YgZW: TStringField
      DisplayLabel = #32844#21153
      FieldName = 'ZW'
      Size = 10
    end
    object YgCSRQ: TDateField
      DisplayLabel = #20986#29983#26085#26399
      FieldName = 'CSRQ'
    end
    object YgXL: TStringField
      DisplayLabel = #23398#21382
      FieldName = 'XL'
      Size = 10
    end
    object YgDH: TStringField
      DisplayLabel = #32852#31995#30005#35805
      FieldName = 'DH'
    end
    object YgBP: TStringField
      DisplayLabel = #20256#21796#26426#21495
      FieldName = 'BP'
      Size = 15
    end
    object YgZZ: TStringField
      DisplayLabel = #20303#22336
      FieldName = 'ZZ'
      Size = 40
    end
    object YgSFZH: TStringField
      DisplayLabel = #36523#20221#35777#21495
      FieldName = 'SFZH'
      Size = 18
    end
    object YgJG: TStringField
      DisplayLabel = #31821#36143
      FieldName = 'JG'
    end
    object YgYB: TStringField
      DisplayLabel = #37038#32534
      FieldName = 'YB'
      Size = 6
    end
    object YgRZRQ: TDateField
      DisplayLabel = #20837#32844#26085#26399
      FieldName = 'RZRQ'
    end
    object YgJSFF: TIntegerField
      Tag = 1
      DisplayLabel = #24037#36164#35745#31639#26041#27861
      FieldName = 'JSFF'
      OnGetText = YgJSFFGetText
    end
    object YgaJSFF: TStringField
      DisplayLabel = #24037#36164#35745#31639#26041#27861
      FieldName = 'aJSFF'
      Size = 255
    end
    object YgJBGZ: TFloatField
      DisplayLabel = #22522#26412#24037#36164
      DisplayWidth = 12
      FieldName = 'JBGZ'
      DisplayFormat = '#,0.00'
    end
    object YgYWYBZ: TBooleanField
      Tag = 1
      Alignment = taCenter
      DisplayLabel = #26159#21542#19994#21153#21592
      FieldName = 'YWYBZ'
      DisplayValues = #8730';'
    end
    object YgaYWYBZ: TStringField
      DisplayLabel = #26159#21542#19994#21153#21592
      DisplayWidth = 10
      FieldName = 'aYWYBZ'
      Size = 255
    end
    object YgLZ: TBooleanField
      Tag = 1
      Alignment = taCenter
      DisplayLabel = #26159#21542#24050#31163#32844
      FieldName = 'LZ'
      DisplayValues = #8730';'
    end
    object YgaLZ: TStringField
      DisplayLabel = #26159#21542#24050#31163#32844
      DisplayWidth = 10
      FieldName = 'aLZ'
      Size = 255
    end
    object YgBZ: TStringField
      DisplayLabel = #22791#27880
      DisplayWidth = 40
      FieldName = 'BZ'
      Size = 30
    end
  end
  object sYg: TDataSource
    DataSet = Yg
    Left = 103
    Top = 114
  end
  object Hp: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pHp'
    RemoteServer = Cn
    Left = 343
    Top = 54
    object HpID: TIntegerField
      Tag = 1
      FieldName = 'ID'
    end
    object HpBH: TStringField
      DisplayLabel = #32534#21495
      FieldName = 'BH'
    end
    object HpHPLBID: TIntegerField
      Tag = 1
      DisplayLabel = #31867#21035
      FieldName = 'HPLBID'
    end
    object HpaHPLBMC: TStringField
      DisplayLabel = #31867#21035
      FieldName = 'aHPLBMC'
      Size = 16
    end
    object HpcHPLBMC: TStringField
      DisplayLabel = #31867#21035
      FieldKind = fkInternalCalc
      FieldName = 'cHPLBMC'
      Size = 16
    end
    object HpPM: TStringField
      DisplayLabel = #21697#21517#35268#26684
      FieldName = 'PM'
      Size = 40
    end
    object HpDW: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'DW'
      Size = 4
    end
    object HpHPHSFFID: TIntegerField
      Tag = 1
      DisplayLabel = #26680#31639#26041#27861
      FieldName = 'HPHSFFID'
    end
    object HpHPSXID: TIntegerField
      Tag = 1
      Alignment = taLeftJustify
      DisplayLabel = #36135#21697#23646#24615
      FieldName = 'HPSXID'
      OnGetText = ConverHphsff
    end
    object HpaHPSX: TStringField
      DisplayLabel = #36135#21697#23646#24615
      DisplayWidth = 10
      FieldName = 'aHPSX'
      Size = 255
    end
    object HpaZKCL: TFloatField
      DisplayLabel = #24635#24211#23384#37327
      FieldName = 'aZKCL'
      DisplayFormat = '#,0.###'
    end
    object HpJJ: TFloatField
      DisplayLabel = #26368#36817#36827#20215
      DisplayWidth = 10
      FieldName = 'JJ'
      DisplayFormat = '#,0.###'
    end
    object HpJJJ: TFloatField
      DisplayLabel = #26087#36827#20215
      DisplayWidth = 10
      FieldName = 'JJJ'
      DisplayFormat = '#,0.###'
    end
    object HpJQJ: TFloatField
      DisplayLabel = #21152#26435#20215
      DisplayWidth = 10
      FieldName = 'JQJ'
      DisplayFormat = '#,0.###'
    end
    object HpQCJQJ: TFloatField
      DisplayWidth = 10
      FieldName = 'QCJQJ'
      DisplayFormat = '#,0.###'
    end
    object HpQCJE: TFloatField
      DisplayLabel = #26399#21021#37329#39069
      DisplayWidth = 12
      FieldName = 'QCJE'
      DisplayFormat = '#,0.00'
    end
    object HpSX: TFloatField
      DisplayLabel = #24211#23384#19978#38480
      DisplayWidth = 10
      FieldName = 'SX'
      DisplayFormat = '#,0.###'
    end
    object HpXX: TFloatField
      DisplayLabel = #24211#23384#19979#38480
      DisplayWidth = 10
      FieldName = 'XX'
      DisplayFormat = '#,0.###'
    end
    object HpZT: TBooleanField
      DisplayLabel = #38750#20351#29992#20013
      FieldName = 'ZT'
      DisplayValues = #8730';'
    end
    object HpaZT: TStringField
      DisplayLabel = #26159#21542#38750#20351#29992#20013
      DisplayWidth = 2
      FieldName = 'aZT'
      Size = 255
    end
    object HpITMP: TIntegerField
      Tag = 1
      FieldName = 'ITMP'
    end
  end
  object sHp: TDataSource
    DataSet = Hp
    Left = 376
    Top = 66
  end
  object Qtkcbdlx: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pQtkcbdlx'
    RemoteServer = Cn
    Left = 5
    Top = 110
    object QtkcbdlxID: TIntegerField
      Tag = 1
      FieldName = 'ID'
    end
    object QtkcbdlxMC: TStringField
      DisplayLabel = #21517#31216
      FieldName = 'MC'
    end
    object QtkcbdlxRKL: TBooleanField
      Tag = 1
      DisplayLabel = #31867#21035
      DisplayWidth = 6
      FieldName = 'RKL'
      OnGetText = QtkcbdlxRKLGetText
    end
    object QtkcbdlxTHBZ: TBooleanField
      Tag = 1
      DisplayLabel = #36864#36824#26631#24535
      FieldName = 'THBZ'
      OnGetText = QtkcbdlxTHBZGetText
    end
  end
  object sQtkcbdlx: TDataSource
    DataSet = Qtkcbdlx
    Left = 9
    Top = 114
  end
  object HpCkXx: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pHpCkXx'
    RemoteServer = Cn
    Left = 374
    Top = 54
    object HpCkXxMC: TStringField
      DisplayWidth = 16
      FieldName = 'MC'
      Size = 16
    end
    object HpCkXxJCS: TFloatField
      FieldName = 'JCS'
      DisplayFormat = '#,0.###'
    end
  end
  object sHpCkXx: TDataSource
    DataSet = HpCkXx
    Left = 409
    Top = 66
  end
  object HpSjXx: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pHpSjXx'
    RemoteServer = Cn
    Left = 404
    Top = 54
    object HpSjXxMC: TStringField
      FieldName = 'MC'
      Size = 16
    end
    object HpSjXxSJ: TFloatField
      FieldName = 'SJ'
      DisplayFormat = '#,0.###'
    end
  end
  object sHpSjXx: TDataSource
    DataSet = HpSjXx
    Left = 442
    Top = 66
  end
  object Hpkc: TClientDataSet
    Aggregates = <>
    PacketRecords = 5
    Params = <>
    ProviderName = 'pHpkc'
    RemoteServer = Cn
    Left = 435
    Top = 54
    object HpkcCKID: TIntegerField
      FieldName = 'CKID'
    end
    object HpkcHPID: TIntegerField
      FieldName = 'HPID'
    end
    object HpkcQCS: TFloatField
      FieldName = 'QCS'
      DisplayFormat = '#,0.###'
    end
    object HpkcJCS: TFloatField
      FieldName = 'JCS'
      DisplayFormat = '#,0.###'
    end
  end
  object Hpsj: TClientDataSet
    Aggregates = <>
    PacketRecords = 5
    Params = <>
    ProviderName = 'pHpsj'
    RemoteServer = Cn
    Left = 466
    Top = 54
    object HpsjSJZLID: TIntegerField
      FieldName = 'SJZLID'
    end
    object HpsjHPID: TIntegerField
      FieldName = 'HPID'
    end
    object HpsjSJ: TFloatField
      FieldName = 'SJ'
      DisplayFormat = '#,0.###'
    end
  end
  object Cgddzb: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pCgddzb'
    RemoteServer = Cn
    Left = 8
    Top = 154
    object CgddzbID: TIntegerField
      Tag = 1
      FieldName = 'ID'
    end
    object CgddzbDJBH: TStringField
      DisplayLabel = #21333#21495
      FieldName = 'DJBH'
      Size = 12
    end
    object CgddzbRQ: TDateField
      DisplayLabel = #26085#26399
      FieldName = 'RQ'
    end
    object CgddzbGYSID: TIntegerField
      Tag = 1
      FieldName = 'GYSID'
    end
    object CgddzbaGYSBH: TStringField
      DisplayLabel = #20379#24212#21830#32534#21495
      FieldName = 'aGYSBH'
      ProviderFlags = [pfInWhere]
      Size = 12
    end
    object CgddzbaGYSMC: TStringField
      DisplayLabel = #20379#24212#21830
      FieldName = 'aGYSMC'
      ProviderFlags = [pfInWhere]
    end
    object CgddzbJHRQ: TDateField
      DisplayLabel = #20132#36135#26085#26399
      FieldName = 'JHRQ'
    end
    object CgddzbJHDD: TStringField
      DisplayLabel = #20132#36135#22320#28857
      FieldName = 'JHDD'
      Size = 40
    end
    object CgddzbYWY: TStringField
      DisplayLabel = #19994#21153#21592
      FieldName = 'YWY'
      Size = 8
    end
    object CgddzbJE: TFloatField
      DisplayLabel = #24635#37329#39069
      DisplayWidth = 12
      FieldName = 'JE'
      DisplayFormat = '#,0.00'
    end
    object CgddzbZT: TBooleanField
      Tag = 1
      DisplayLabel = #20013#27490#25191#34892
      FieldName = 'ZT'
      DisplayValues = #8730';'
    end
    object CgddzbaZT: TStringField
      DisplayLabel = #26159#21542#20013#27490#25191#34892
      FieldName = 'aZT'
      Size = 255
    end
    object CgddzbBZ: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'BZ'
      Size = 40
    end
    object CgddzbCZY: TStringField
      DisplayLabel = #25805#20316#21592
      FieldName = 'CZY'
      Size = 8
    end
  end
  object sCgddzb: TDataSource
    DataSet = Cgddzb
    Left = 16
    Top = 158
  end
  object Cgdd: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pCgdd'
    RemoteServer = Cn
    OnCalcFields = CgddCalcFields
    Left = 40
    Top = 154
    object CgddZBID2: TIntegerField
      FieldName = 'ZBID'
    end
    object CgddHH: TIntegerField
      FieldName = 'HH'
    end
    object CgddRQ: TDateField
      Tag = 1
      FieldName = 'RQ'
    end
    object CgddHPID: TIntegerField
      DisplayWidth = 10
      FieldName = 'HPID'
    end
    object CgddaBH: TStringField
      DisplayLabel = #32534#21495
      FieldName = 'aBH'
    end
    object CgddaPM: TStringField
      DisplayLabel = #21697#21517#35268#26684
      FieldName = 'aPM'
      Size = 40
    end
    object CgddaDW: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'aDW'
      Size = 4
    end
    object CgddSL: TFloatField
      DisplayLabel = #25968#37327
      FieldName = 'SL'
      DisplayFormat = '#,0.###'
    end
    object CgddDJ: TFloatField
      DisplayLabel = #21333#20215
      DisplayWidth = 10
      FieldName = 'DJ'
      DisplayFormat = '#,0.###'
    end
    object CgddNSL: TFloatField
      DisplayLabel = #31246#29575
      DisplayWidth = 4
      FieldName = 'NSL'
      OnGetText = NSLGetText
      DisplayFormat = '0.#'
    end
    object CgddcJE: TFloatField
      DisplayLabel = #37329#39069
      DisplayWidth = 12
      FieldKind = fkInternalCalc
      FieldName = 'cJE'
      ProviderFlags = []
      DisplayFormat = '#,0.00'
    end
    object CgddaSHSL: TFloatField
      DisplayLabel = #25910#36135#25968#37327
      FieldName = 'aSHSL'
      DisplayFormat = '#,0.###'
    end
    object CgddaMSSL: TFloatField
      DisplayLabel = #26410#25910#36135#25968#37327
      FieldName = 'aMSSL'
      DisplayFormat = '#,#.###'
    end
  end
  object sCgdd: TDataSource
    DataSet = Cgdd
    Left = 48
    Top = 158
  end
  object Cgfkzb: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pCgfkzb'
    RemoteServer = Cn
    BeforeOpen = CgfkzbBeforeOpen
    Left = 135
    Top = 154
    object CgfkzbID: TIntegerField
      FieldName = 'ID'
    end
    object CgfkzbDJBH: TStringField
      DisplayLabel = #21333#21495
      FieldName = 'DJBH'
      Size = 12
    end
    object CgfkzbRQ: TDateField
      DisplayLabel = #26085#26399
      FieldName = 'RQ'
    end
    object CgfkzbGYSID: TIntegerField
      Tag = 1
      FieldName = 'GYSID'
    end
    object CgfkzbaGYSBH: TStringField
      DisplayLabel = #20379#24212#21830#32534#21495
      FieldName = 'aGYSBH'
      Size = 12
    end
    object CgfkzbaGYSMC: TStringField
      DisplayLabel = #20379#24212#21830
      FieldName = 'aGYSMC'
    end
    object CgfkzbFKLX: TIntegerField
      DisplayWidth = 10
      FieldName = 'FKLX'
    end
    object CgfkzbaFKLX: TStringField
      DisplayLabel = #20184#27454#31867#22411
      DisplayWidth = 6
      FieldName = 'aFKLX'
      Size = 255
    end
    object CgfkzbSFKFSID: TSmallintField
      Tag = 1
      FieldName = 'SFKFSID'
    end
    object CgfkzbaSFKFSMC: TStringField
      DisplayLabel = #20184#27454#26041#24335
      DisplayWidth = 8
      FieldName = 'aSFKFSMC'
      Size = 16
    end
    object CgfkzbZHID: TSmallintField
      Tag = 1
      FieldName = 'ZHID'
    end
    object CgfkzbaZHMC: TStringField
      DisplayLabel = #20184#27454#26469#28304
      DisplayWidth = 16
      FieldName = 'aZHMC'
    end
    object CgfkzbPH: TStringField
      DisplayLabel = #31080#21495
      FieldName = 'PH'
    end
    object CgfkzbSYJY: TBooleanField
      DisplayLabel = #20351#29992#32467#20313#27454
      FieldName = 'SYJY'
      DisplayValues = #26159';'#21542
    end
    object CgfkzbJE: TFloatField
      DisplayLabel = #20184#27454#37329#39069
      DisplayWidth = 12
      FieldName = 'JE'
      DisplayFormat = '#,0.00'
    end
    object CgfkzbJEA: TFloatField
      Tag = 1
      DisplayWidth = 12
      FieldName = 'JEA'
      DisplayFormat = '#,0.00'
    end
    object CgfkzbJEB: TFloatField
      Tag = 1
      DisplayWidth = 12
      FieldName = 'JEB'
      DisplayFormat = '#,0.00'
    end
    object CgfkzbBZ: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'BZ'
      Size = 40
    end
    object CgfkzbCZY: TStringField
      DisplayLabel = #25805#20316#21592
      FieldName = 'CZY'
      Size = 8
    end
  end
  object sCgfkzb: TDataSource
    DataSet = Cgfkzb
    Left = 143
    Top = 158
  end
  object GysHelp: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pGys'
    RemoteServer = Cn
    Left = 4
    Top = 306
    object GysHelpID: TIntegerField
      Tag = 1
      FieldName = 'ID'
    end
    object GysHelpBH: TStringField
      DisplayLabel = #32534#21495
      FieldName = 'BH'
      Size = 12
    end
    object GysHelpMC: TStringField
      DisplayLabel = #31616#31216
      FieldName = 'MC'
    end
    object GysHelpQC: TStringField
      DisplayLabel = #20840#31216
      FieldName = 'QC'
      Size = 40
    end
    object GysHelpLXR: TStringField
      DisplayLabel = #32852#31995#20154
      FieldName = 'LXR'
      Size = 16
    end
    object GysHelpDH: TStringField
      DisplayLabel = #30005#35805
      FieldName = 'DH'
    end
    object GysHelpCZ: TStringField
      DisplayLabel = #20256#30495
      FieldName = 'CZ'
    end
    object GysHelpDZ: TStringField
      DisplayLabel = #22320#22336
      FieldName = 'DZ'
      Size = 40
    end
    object GysHelpYB: TStringField
      DisplayLabel = #37038#32534
      FieldName = 'YB'
      Size = 6
    end
    object GysHelpWZ: TStringField
      DisplayLabel = #32593#22336
      FieldName = 'WZ'
      Size = 40
    end
    object GysHelpDY: TStringField
      DisplayLabel = #30005#23376#37038#31665
      FieldName = 'DY'
      Size = 40
    end
    object GysHelpKHYH: TStringField
      DisplayLabel = #24320#25143#38134#34892
      FieldName = 'KHYH'
      Size = 30
    end
    object GysHelpYHZH: TStringField
      DisplayLabel = #38134#34892#24080#21495
      FieldName = 'YHZH'
    end
    object GysHelpNSH: TStringField
      DisplayLabel = #32435#31246#21495
      FieldName = 'NSH'
    end
    object GysHelpQCJE: TFloatField
      DisplayLabel = #26399#21021#24212#20184#27454
      DisplayWidth = 12
      FieldName = 'QCJE'
      DisplayFormat = '#,0.00'
    end
    object GysHelpYXJE: TFloatField
      DisplayLabel = #39044#20184#37329#39069
      DisplayWidth = 12
      FieldName = 'YXJE'
      DisplayFormat = '#,0.00'
    end
    object GysHelpQMJE: TFloatField
      DisplayLabel = #24212#20184#37329#39069
      DisplayWidth = 12
      FieldName = 'QMJE'
      DisplayFormat = '#,0.00'
    end
    object GysHelpaSJJE: TFloatField
      DisplayLabel = #23454#38469#27424#27454
      DisplayWidth = 12
      FieldName = 'aSJJE'
      DisplayFormat = '#,0.00'
    end
    object GysHelpZT: TBooleanField
      Tag = 1
      DisplayLabel = #38750#20351#29992#20013
      FieldName = 'ZT'
    end
    object GysHelpBZ: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'BZ'
      Size = 50
    end
    object GysHelpITMP: TIntegerField
      FieldName = 'ITMP'
    end
  end
  object sGysHelp: TDataSource
    DataSet = GysHelp
    Left = 12
    Top = 318
  end
  object HpHelp: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pHp'
    RemoteServer = Cn
    Left = 88
    Top = 306
    object HpHelpID: TIntegerField
      Tag = 1
      FieldName = 'ID'
    end
    object HpHelpBH: TStringField
      DisplayLabel = #32534#21495
      FieldName = 'BH'
    end
    object HpHelpHPLBID: TIntegerField
      Tag = 1
      DisplayLabel = #31867#21035
      FieldName = 'HPLBID'
    end
    object HpHelpaHPLBMC: TStringField
      DisplayLabel = #31867#21035
      FieldName = 'aHPLBMC'
      Size = 16
    end
    object HpHelpcHPLBMC: TStringField
      DisplayLabel = #31867#21035
      FieldKind = fkInternalCalc
      FieldName = 'cHPLBMC'
      Size = 16
    end
    object HpHelpPM: TStringField
      DisplayLabel = #21697#21517#35268#26684
      FieldName = 'PM'
      Size = 40
    end
    object HpHelpDW: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'DW'
      Size = 4
    end
    object HpHelpHPHSFFID: TIntegerField
      Tag = 1
      DisplayLabel = #26680#31639#26041#27861
      FieldName = 'HPHSFFID'
    end
    object HpHelpHPSXID: TIntegerField
      Tag = 1
      Alignment = taLeftJustify
      DisplayLabel = #36135#21697#23646#24615
      FieldName = 'HPSXID'
      OnGetText = ConverHphsff
    end
    object HpHelpaHPSX: TStringField
      DisplayLabel = #36135#21697#23646#24615
      DisplayWidth = 10
      FieldName = 'aHPSX'
      Size = 255
    end
    object HpHelpaZKCL: TFloatField
      DisplayLabel = #24635#24211#23384#37327
      FieldName = 'aZKCL'
      DisplayFormat = '0.##'
    end
    object HpHelpJJ: TFloatField
      DisplayLabel = #26368#36817#36827#20215
      DisplayWidth = 10
      FieldName = 'JJ'
      DisplayFormat = '#,0.00'
    end
    object HpHelpJJJ: TFloatField
      DisplayLabel = #26087#36827#20215
      DisplayWidth = 10
      FieldName = 'JJJ'
      DisplayFormat = '#,0.00'
    end
    object HpHelpJQJ: TFloatField
      DisplayLabel = #21152#26435#20215
      DisplayWidth = 10
      FieldName = 'JQJ'
      DisplayFormat = '#,0.00'
    end
    object HpHelpSX: TFloatField
      DisplayLabel = #24211#23384#19978#38480
      DisplayWidth = 10
      FieldName = 'SX'
      DisplayFormat = '0.##'
    end
    object HpHelpXX: TFloatField
      DisplayLabel = #24211#23384#19979#38480
      DisplayWidth = 10
      FieldName = 'XX'
      DisplayFormat = '0.##'
    end
  end
  object sHpHelp: TDataSource
    DataSet = HpHelp
    Left = 96
    Top = 318
  end
  object Cgsh: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pCgsh'
    RemoteServer = Cn
    OnCalcFields = CgshCalcFields
    Left = 104
    Top = 154
    object CgshZBID2: TIntegerField
      FieldName = 'ZBID'
    end
    object CgshHH: TIntegerField
      FieldName = 'HH'
    end
    object CgshRQ: TDateField
      Tag = 1
      FieldName = 'RQ'
    end
    object CgshCKID: TIntegerField
      FieldName = 'CKID'
    end
    object CgshHPID: TIntegerField
      DisplayWidth = 10
      FieldName = 'HPID'
    end
    object CgshaBH: TStringField
      DisplayLabel = #32534#21495
      FieldName = 'aBH'
    end
    object CgshaPM: TStringField
      DisplayLabel = #21697#21517#35268#26684
      FieldName = 'aPM'
      Size = 40
    end
    object CgshaDW: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'aDW'
      Size = 4
    end
    object CgshSL: TFloatField
      DisplayLabel = #25968#37327
      FieldName = 'SL'
      DisplayFormat = '#,0.###'
    end
    object CgshDJ: TFloatField
      DisplayLabel = #21333#20215
      DisplayWidth = 10
      FieldName = 'DJ'
      DisplayFormat = '#,0.###'
    end
    object CgshNSL: TFloatField
      DisplayLabel = #31246#29575
      DisplayWidth = 4
      FieldName = 'NSL'
      OnGetText = NSLGetText
      DisplayFormat = '0.#'
    end
    object CgshcJE: TFloatField
      DisplayLabel = #37329#39069
      DisplayWidth = 12
      FieldKind = fkInternalCalc
      FieldName = 'cJE'
      DisplayFormat = '#,0.00'
    end
    object CgshDDID: TIntegerField
      DisplayWidth = 12
      FieldName = 'DDID'
    end
    object CgshcDDBH: TStringField
      DisplayLabel = #35746#21333#21495
      FieldKind = fkInternalCalc
      FieldName = 'cDDBH'
      Size = 12
    end
  end
  object Cgshzb: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pCgshzb'
    RemoteServer = Cn
    BeforeOpen = CgshzbBeforeOpen
    Left = 72
    Top = 154
    object CgshzbID: TIntegerField
      Tag = 1
      FieldName = 'ID'
    end
    object CgshzbDJBH: TStringField
      DisplayLabel = #21333#21495
      FieldName = 'DJBH'
      Size = 12
    end
    object CgshzbRQ: TDateField
      DisplayLabel = #26085#26399
      FieldName = 'RQ'
    end
    object CgshzbGYSID: TIntegerField
      Tag = 1
      FieldName = 'GYSID'
    end
    object CgshzbaGYSBH: TStringField
      DisplayLabel = #20379#24212#21830#32534#21495
      FieldName = 'aGYSBH'
      ProviderFlags = [pfInWhere]
      Size = 12
    end
    object CgshzbaGYSMC: TStringField
      DisplayLabel = #20379#24212#21830
      FieldName = 'aGYSMC'
      ProviderFlags = [pfInWhere]
    end
    object CgshzbXSLX: TIntegerField
      Tag = 1
      DisplayWidth = 10
      FieldName = 'CGLX'
    end
    object CgshzbaXSLX: TStringField
      DisplayLabel = #37319#36141#31867#22411
      DisplayWidth = 4
      FieldName = 'aCGLX'
      Size = 255
    end
    object CgshzbCKID: TIntegerField
      Tag = 1
      FieldName = 'CKID'
    end
    object CgshzbaCKMC: TStringField
      DisplayLabel = #36827#36135#20179
      DisplayWidth = 10
      FieldName = 'aCKMC'
      Size = 16
    end
    object CgshzbFPLX: TIntegerField
      Tag = 1
      FieldName = 'FPLX'
    end
    object CgshzbaFPLX: TStringField
      DisplayLabel = #21457#31080#31867#22411
      DisplayWidth = 10
      FieldName = 'aFPLX'
      Size = 255
    end
    object CgshzbSFKFSID: TSmallintField
      Tag = 1
      FieldName = 'SFKFSID'
    end
    object CgshzbaSFKFSMC: TStringField
      DisplayLabel = #20184#27454#26041#24335
      DisplayWidth = 8
      FieldName = 'aSFKFSMC'
      Size = 16
    end
    object CgshzbZHID: TSmallintField
      Tag = 1
      FieldName = 'ZHID'
    end
    object CgshzbaZHMC: TStringField
      DisplayLabel = #20184#27454#26469#28304
      DisplayWidth = 16
      FieldName = 'aZHMC'
    end
    object CgshzbPH: TStringField
      DisplayLabel = #31080#21495
      FieldName = 'PH'
    end
    object CgshzbFKQX: TIntegerField
      DisplayLabel = #20184#27454#26399#38480
      FieldName = 'FKQX'
    end
    object CgshzbYWY: TStringField
      DisplayLabel = #19994#21153#21592
      FieldName = 'YWY'
      Size = 8
    end
    object CgshzbJE: TFloatField
      DisplayLabel = #24635#37329#39069
      DisplayWidth = 12
      FieldName = 'JE'
      DisplayFormat = '#,0.00'
    end
    object CgshzbYFJE3: TFloatField
      Tag = 1
      DisplayWidth = 12
      FieldName = 'YFJE'
      DisplayFormat = '#,0.00'
    end
    object CgshzbYFJE2: TFloatField
      DisplayLabel = #24050#20184#37329#39069
      DisplayWidth = 12
      FieldName = 'YFJE1'
      DisplayFormat = '#,0.00'
    end
    object CgshzbYFJE: TFloatField
      DisplayLabel = #26410#20184#37329#39069
      DisplayWidth = 12
      FieldName = 'MFJE'
      DisplayFormat = '#,0.00'
    end
    object CgshzbBZ: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'BZ'
      Size = 40
    end
    object CgshzbCZY: TStringField
      DisplayLabel = #25805#20316#21592
      FieldName = 'CZY'
      Size = 8
    end
  end
  object sCgshzb: TDataSource
    DataSet = Cgshzb
    Left = 80
    Top = 158
  end
  object sCgsh: TDataSource
    DataSet = Cgsh
    Left = 112
    Top = 158
  end
  object CgddHelp: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pCgddHelp'
    RemoteServer = Cn
    Left = 130
    Top = 306
    object CgddHelpID: TIntegerField
      FieldName = 'ID'
    end
    object CgddHelpDJBH: TStringField
      DisplayLabel = #35746#21333#21495
      FieldName = 'DJBH'
      Size = 12
    end
    object CgddHelpRQ: TDateField
      DisplayLabel = #33853#21333#26085#26399
      FieldName = 'RQ'
    end
    object CgddHelpJE: TFloatField
      DisplayLabel = #37329#39069
      DisplayWidth = 12
      FieldName = 'JE'
      DisplayFormat = '#,0.00'
    end
    object CgddHelpJHRQ: TDateField
      DisplayLabel = #20132#36135#26085#26399
      FieldName = 'JHRQ'
    end
    object CgddHelpaGYSBH: TStringField
      FieldName = 'aGYSBH'
      Size = 12
    end
    object CgddHelpaGYSMC: TStringField
      DisplayLabel = #20379#24212#21830
      FieldName = 'aGYSMC'
    end
  end
  object sCgddHelp: TDataSource
    DataSet = CgddHelp
    Left = 138
    Top = 318
  end
  object Cgfk: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pCgfk'
    RemoteServer = Cn
    Left = 167
    Top = 154
    object CgfkZBID2: TIntegerField
      FieldName = 'ZBID'
    end
    object CgfkHH: TIntegerField
      FieldName = 'HH'
    end
    object CgfkRQ: TDateField
      FieldName = 'RQ'
    end
    object CgfkDDID: TIntegerField
      FieldName = 'DDID'
    end
    object CgfkaDDBH: TStringField
      DisplayLabel = #25910#36135#21333#21495
      FieldName = 'aDDBH'
      Size = 12
    end
    object CgfkaDDRQ: TDateField
      DisplayLabel = #25910#36135#26085#26399
      FieldName = 'aDDRQ'
    end
    object CgfkaDDJE: TFloatField
      DisplayLabel = #24635#37329#39069
      DisplayWidth = 12
      FieldName = 'aDDJE'
      DisplayFormat = '#,0.00'
    end
    object CgfkaYFJE: TFloatField
      DisplayLabel = #24050#20184#37329#39069
      DisplayWidth = 12
      FieldName = 'aYFJE'
      DisplayFormat = '#,0.00'
    end
    object CgfkaMFJE: TFloatField
      DisplayLabel = #26410#20184#37329#39069
      DisplayWidth = 12
      FieldName = 'aMFJE'
      DisplayFormat = '#,0.00'
    end
    object CgfkJE: TFloatField
      DisplayLabel = #26412#27425#20184#27454
      DisplayWidth = 12
      FieldName = 'JE'
      DisplayFormat = '#,0.00'
    end
  end
  object sCgfk: TDataSource
    DataSet = Cgfk
    Left = 175
    Top = 158
  end
  object Cgth: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <
      item
        DataType = ftString
        Name = 'zbid'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'pCgth'
    RemoteServer = Cn
    OnCalcFields = CgddCalcFields
    Left = 263
    Top = 154
    object CgthZBID2: TIntegerField
      FieldName = 'ZBID'
    end
    object CgthHH: TIntegerField
      FieldName = 'HH'
    end
    object CgthRQ: TDateField
      Tag = 1
      FieldName = 'RQ'
    end
    object CgthCKID: TIntegerField
      FieldName = 'CKID'
    end
    object CgthHPID: TIntegerField
      DisplayWidth = 10
      FieldName = 'HPID'
    end
    object CgthaBH: TStringField
      DisplayLabel = #32534#21495
      FieldName = 'aBH'
    end
    object CgthaPM: TStringField
      DisplayLabel = #21697#21517#35268#26684
      FieldName = 'aPM'
      Size = 40
    end
    object CgthaDW: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'aDW'
      Size = 4
    end
    object CgthSL: TFloatField
      DisplayLabel = #25968#37327
      FieldName = 'SL'
      DisplayFormat = '#,0.###'
    end
    object CgthDJ: TFloatField
      DisplayLabel = #21333#20215
      DisplayWidth = 10
      FieldName = 'DJ'
      DisplayFormat = '#,0.###'
    end
    object CgthNSL: TFloatField
      DisplayLabel = #31246#29575
      DisplayWidth = 4
      FieldName = 'NSL'
      OnGetText = NSLGetText
      DisplayFormat = '0.#'
    end
    object CgthcJE: TFloatField
      DisplayLabel = #37329#39069
      DisplayWidth = 12
      FieldKind = fkInternalCalc
      FieldName = 'cJE'
      DisplayFormat = '#,0.00'
    end
  end
  object Cgthzb: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pCgthzb'
    RemoteServer = Cn
    BeforeOpen = CgthzbBeforeOpen
    Left = 199
    Top = 154
    object CgthzbID: TIntegerField
      Tag = 1
      FieldName = 'ID'
    end
    object CgthzbDJBH: TStringField
      DisplayLabel = #21333#21495
      FieldName = 'DJBH'
      Size = 12
    end
    object CgthzbRQ: TDateField
      DisplayLabel = #26085#26399
      FieldName = 'RQ'
    end
    object CgthzbGYSID: TIntegerField
      Tag = 1
      FieldName = 'GYSID'
    end
    object CgthzbaGYSBH: TStringField
      DisplayLabel = #20379#24212#21830#32534#21495
      FieldName = 'aGYSBH'
      ProviderFlags = [pfInWhere]
      Size = 12
    end
    object CgthzbaGYSMC: TStringField
      DisplayLabel = #20379#24212#21830
      FieldName = 'aGYSMC'
      ProviderFlags = [pfInWhere]
    end
    object CgthzbCKID: TIntegerField
      Tag = 1
      FieldName = 'CKID'
    end
    object CgthzbaCKMC: TStringField
      DisplayLabel = #36864#36135#20179
      DisplayWidth = 10
      FieldName = 'aCKMC'
      Size = 16
    end
    object CgthzbTHLX: TIntegerField
      FieldName = 'THLX'
    end
    object CgthzbaTHLX: TStringField
      DisplayLabel = #36864#27454#31867#22411
      DisplayWidth = 18
      FieldName = 'aTHLX'
      Size = 16
    end
    object CgthzbSFKFSID: TSmallintField
      Tag = 1
      FieldName = 'SFKFSID'
    end
    object CgthzbaSFKFSMC: TStringField
      DisplayLabel = #25910#27454#26041#24335
      DisplayWidth = 8
      FieldName = 'aSFKFSMC'
      Size = 16
    end
    object CgthzbZHID: TSmallintField
      Tag = 1
      FieldName = 'ZHID'
    end
    object CgthzbaZHMC: TStringField
      DisplayLabel = #25910#27454#24080#25143
      DisplayWidth = 16
      FieldName = 'aZHMC'
    end
    object CgthzbPH: TStringField
      DisplayLabel = #31080#21495
      FieldName = 'PH'
    end
    object CgthzbYWY: TStringField
      DisplayLabel = #19994#21153#21592
      FieldName = 'YWY'
      Size = 8
    end
    object CgthzbJE: TFloatField
      DisplayLabel = #24635#37329#39069
      DisplayWidth = 12
      FieldName = 'JE'
      DisplayFormat = '#,0.00'
    end
    object CgthzbBZ: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'BZ'
      Size = 40
    end
    object CgthzbCZY: TStringField
      DisplayLabel = #25805#20316#21592
      FieldName = 'CZY'
      Size = 8
    end
  end
  object sCgthzb: TDataSource
    DataSet = Cgthzb
    Left = 207
    Top = 158
  end
  object sCgth: TDataSource
    DataSet = Cgth
    Left = 271
    Top = 158
  end
  object Xsddzb: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pXsddzb'
    RemoteServer = Cn
    Left = 327
    Top = 154
    object XsddzbID: TIntegerField
      Tag = 1
      FieldName = 'ID'
    end
    object XsddzbDJBH: TStringField
      DisplayLabel = #21333#21495
      FieldName = 'DJBH'
      Size = 12
    end
    object XsddzbRQ: TDateField
      DisplayLabel = #26085#26399
      FieldName = 'RQ'
    end
    object XsddzbJHRQ: TDateField
      DisplayLabel = #20132#36135#26085#26399
      FieldName = 'JHRQ'
    end
    object XsddzbJHDD: TStringField
      DisplayLabel = #20132#36135#22320#28857
      FieldName = 'JHDD'
      Size = 40
    end
    object XsddzbKHID: TIntegerField
      Tag = 1
      FieldName = 'KHID'
    end
    object XsddzbaKHBH: TStringField
      DisplayLabel = #23458#25143#32534#21495
      FieldName = 'aKHBH'
      ProviderFlags = [pfInWhere]
      Size = 12
    end
    object XsddzbaKHMC: TStringField
      DisplayLabel = #23458#25143
      FieldName = 'aKHMC'
      ProviderFlags = [pfInWhere]
    end
    object XsddzbYWY: TStringField
      DisplayLabel = #19994#21153#21592
      FieldName = 'YWY'
      Size = 8
    end
    object XsddzbJE: TFloatField
      DisplayLabel = #24635#37329#39069
      DisplayWidth = 12
      FieldName = 'JE'
      DisplayFormat = '#,0.00'
    end
    object XsddzbZT: TBooleanField
      Tag = 1
      DisplayLabel = #20013#27490#25191#34892
      FieldName = 'ZT'
      DisplayValues = #8730';'
    end
    object XsddzbaZT: TStringField
      DisplayLabel = #26159#21542#20013#27490#25191#34892
      FieldName = 'aZT'
      Size = 255
    end
    object XsddzbBZ: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'BZ'
      Size = 40
    end
    object XsddzbCZY: TStringField
      DisplayLabel = #25805#20316#21592
      FieldName = 'CZY'
      Size = 8
    end
  end
  object sXsddzb: TDataSource
    DataSet = Xsddzb
    Left = 335
    Top = 158
  end
  object Xsdd: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pXsdd'
    RemoteServer = Cn
    OnCalcFields = CgddCalcFields
    Left = 390
    Top = 154
    object XsddZBID2: TIntegerField
      FieldName = 'ZBID'
    end
    object XsddHH: TIntegerField
      FieldName = 'HH'
    end
    object XsddRQ: TDateField
      Tag = 1
      FieldName = 'RQ'
    end
    object XsddHPID: TIntegerField
      DisplayWidth = 10
      FieldName = 'HPID'
    end
    object XsddaBH: TStringField
      DisplayLabel = #32534#21495
      FieldName = 'aBH'
    end
    object XsddaPM: TStringField
      DisplayLabel = #21697#21517#35268#26684
      FieldName = 'aPM'
      Size = 40
    end
    object XsddaDW: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'aDW'
      Size = 4
    end
    object XsddSL: TFloatField
      DisplayLabel = #25968#37327
      FieldName = 'SL'
      DisplayFormat = '#,0.###'
    end
    object XsddDJ: TFloatField
      DisplayLabel = #21333#20215
      DisplayWidth = 10
      FieldName = 'DJ'
      DisplayFormat = '#,0.###'
    end
    object XsddNSL: TFloatField
      DisplayLabel = #31246#29575
      DisplayWidth = 4
      FieldName = 'NSL'
      OnGetText = NSLGetText
      DisplayFormat = '0.#'
    end
    object XsddcJE: TFloatField
      DisplayLabel = #37329#39069
      DisplayWidth = 12
      FieldKind = fkInternalCalc
      FieldName = 'cJE'
      ProviderFlags = []
      DisplayFormat = '#,0.00'
    end
    object XsddaYTSL: TFloatField
      DisplayLabel = #24050#25552#25968#37327
      FieldName = 'aYTSL'
      DisplayFormat = '#,0.###'
    end
    object XsddaMTSL: TFloatField
      DisplayLabel = #26410#25552#25968#37327
      FieldName = 'aMTSL'
      DisplayFormat = '#,#.###'
    end
  end
  object sXsdd: TDataSource
    DataSet = Xsdd
    Left = 398
    Top = 158
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 376
    Top = 10
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    RemoteServer = Cn
    Left = 364
    Top = 2
  end
  object sKhHelp: TDataSource
    DataSet = KhHelp
    Left = 54
    Top = 318
  end
  object KhHelp: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    PacketRecords = 50
    Params = <>
    ProviderName = 'pKh'
    RemoteServer = Cn
    Left = 46
    Top = 306
    object KhHelpID: TIntegerField
      Tag = 1
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object KhHelpBH: TStringField
      DisplayLabel = #32534#21495
      FieldName = 'BH'
      Size = 12
    end
    object KhHelpMC: TStringField
      DisplayLabel = #31616#31216
      FieldName = 'MC'
    end
    object KhHelpQC: TStringField
      DisplayLabel = #20840#31216
      FieldName = 'QC'
      Size = 40
    end
    object KhHelpDQID: TIntegerField
      Tag = 1
      DisplayLabel = #25152#23646#22320#21306
      FieldName = 'DQID'
    end
    object KhHelpaDQMC: TStringField
      DisplayLabel = #25152#23646#22320#21306
      FieldName = 'aDQMC'
      Size = 12
    end
    object KhHelpcDQMC: TStringField
      DisplayLabel = #25152#23646#22320#21306
      FieldKind = fkInternalCalc
      FieldName = 'cDQMC'
      Size = 12
    end
    object KhHelpLXR: TStringField
      DisplayLabel = #32852#31995#20154
      FieldName = 'LXR'
      Size = 16
    end
    object KhHelpDH: TStringField
      DisplayLabel = #30005#35805
      FieldName = 'DH'
    end
    object KhHelpCZ: TStringField
      DisplayLabel = #20256#30495
      FieldName = 'CZ'
    end
    object KhHelpDZ: TStringField
      DisplayLabel = #22320#22336
      FieldName = 'DZ'
      Size = 40
    end
    object KhHelpYB: TStringField
      DisplayLabel = #37038#32534
      FieldName = 'YB'
      Size = 6
    end
    object KhHelpWZ: TStringField
      DisplayLabel = #32593#22336
      FieldName = 'WZ'
      Size = 40
    end
    object KhHelpDY: TStringField
      DisplayLabel = #30005#23376#37038#31665
      FieldName = 'DY'
      Size = 40
    end
    object KhHelpKHYH: TStringField
      DisplayLabel = #24320#25143#38134#34892
      FieldName = 'KHYH'
      Size = 30
    end
    object KhHelpYHZH: TStringField
      DisplayLabel = #38134#34892#24080#21495
      FieldName = 'YHZH'
    end
    object KhHelpNSH: TStringField
      DisplayLabel = #32435#31246#21495
      FieldName = 'NSH'
    end
    object KhHelpQCJE: TFloatField
      DisplayLabel = #26399#21021#24212#25910#27454
      DisplayWidth = 12
      FieldName = 'QCJE'
      DisplayFormat = '#,0.00'
    end
    object KhHelpYXJE: TFloatField
      DisplayLabel = #39044#25910#37329#39069
      DisplayWidth = 12
      FieldName = 'YXJE'
      DisplayFormat = '#,0.00'
    end
    object KhHelpQMJE: TFloatField
      DisplayLabel = #24212#25910#37329#39069
      DisplayWidth = 12
      FieldName = 'QMJE'
      DisplayFormat = '#,0.00'
    end
    object KhHelpaSJJE: TFloatField
      DisplayLabel = #23454#38469#27424#27454
      DisplayWidth = 12
      FieldName = 'aSJJE'
      DisplayFormat = '#,0.00'
    end
    object KhHelpXYED: TFloatField
      DisplayLabel = #20449#29992#39069#24230
      DisplayWidth = 12
      FieldName = 'XYED'
      DisplayFormat = '#,#.##'
    end
    object KhHelpZT: TBooleanField
      Tag = 1
      DisplayLabel = #38750#20351#29992#20013
      FieldName = 'ZT'
      DisplayValues = #8730';'
    end
    object KhHelpBZ: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'BZ'
      Size = 40
    end
    object KhHelpITMP: TIntegerField
      FieldName = 'ITMP'
    end
  end
  object XsddHelp: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pXsddHelp'
    RemoteServer = Cn
    Left = 172
    Top = 306
    object IntegerField1: TIntegerField
      FieldName = 'ID'
    end
    object StringField1: TStringField
      DisplayLabel = #35746#21333#21495
      FieldName = 'DJBH'
      Size = 12
    end
    object DateField1: TDateField
      DisplayLabel = #33853#21333#26085#26399
      FieldName = 'RQ'
    end
    object FloatField1: TFloatField
      DisplayLabel = #37329#39069
      DisplayWidth = 12
      FieldName = 'JE'
      DisplayFormat = '#,0.00'
    end
    object DateField2: TDateField
      DisplayLabel = #20132#36135#26085#26399
      FieldName = 'JHRQ'
    end
    object StringField2: TStringField
      FieldName = 'aKHBH'
      Size = 12
    end
    object StringField3: TStringField
      DisplayLabel = #23458#25143
      FieldName = 'aKHMC'
    end
  end
  object sXsddHelp: TDataSource
    DataSet = XsddHelp
    Left = 180
    Top = 318
  end
  object Xsskzb: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pXsskzb'
    RemoteServer = Cn
    BeforeOpen = CgfkzbBeforeOpen
    Left = 359
    Top = 154
    object XsskzbID: TIntegerField
      FieldName = 'ID'
    end
    object XsskzbDJBH: TStringField
      DisplayLabel = #21333#21495
      FieldName = 'DJBH'
      Size = 12
    end
    object XsskzbRQ: TDateField
      DisplayLabel = #26085#26399
      FieldName = 'RQ'
    end
    object XsskzbKHID: TIntegerField
      Tag = 1
      FieldName = 'KHID'
    end
    object XsskzbaKHBH: TStringField
      DisplayLabel = #23458#25143#32534#21495
      FieldName = 'aKHBH'
      Size = 12
    end
    object XsskzbaKHMC: TStringField
      DisplayLabel = #23458#25143
      FieldName = 'aKHMC'
    end
    object XsskzbFKLX: TIntegerField
      DisplayWidth = 10
      FieldName = 'FKLX'
    end
    object XsskzbaFKLX: TStringField
      DisplayLabel = #25910#27454#31867#22411
      DisplayWidth = 6
      FieldName = 'aFKLX'
      Size = 255
    end
    object XsskzbSFKFSID: TSmallintField
      Tag = 1
      FieldName = 'SFKFSID'
    end
    object XsskzbaSFKFSMC: TStringField
      DisplayLabel = #25910#27454#26041#24335
      DisplayWidth = 8
      FieldName = 'aSFKFSMC'
      Size = 16
    end
    object XsskzbZHID: TSmallintField
      Tag = 1
      FieldName = 'ZHID'
    end
    object XsskzbaZHMC: TStringField
      DisplayLabel = #25910#27454#21435#21521
      DisplayWidth = 16
      FieldName = 'aZHMC'
    end
    object XsskzbPH: TStringField
      DisplayLabel = #31080#21495
      FieldName = 'PH'
    end
    object XsskzbSYJY: TBooleanField
      DisplayLabel = #20351#29992#32467#20313#27454
      FieldName = 'SYJY'
      DisplayValues = #26159';'#21542
    end
    object XsskzbJE: TFloatField
      DisplayLabel = #25910#27454#37329#39069
      DisplayWidth = 12
      FieldName = 'JE'
      DisplayFormat = '#,0.00'
    end
    object XsskzbJEA: TFloatField
      Tag = 1
      DisplayWidth = 12
      FieldName = 'JEA'
      DisplayFormat = '#,0.00'
    end
    object XsskzbJEB: TFloatField
      Tag = 1
      DisplayWidth = 12
      FieldName = 'JEB'
      DisplayFormat = '#,0.00'
    end
    object XsskzbBZ: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'BZ'
      Size = 40
    end
    object XsskzbCZY: TStringField
      DisplayLabel = #25805#20316#21592
      FieldName = 'CZY'
      Size = 8
    end
  end
  object sXsskzb: TDataSource
    DataSet = Xsskzb
    Left = 367
    Top = 158
  end
  object Xssk: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pXssk'
    RemoteServer = Cn
    Left = 422
    Top = 154
    object XsskZBID2: TIntegerField
      FieldName = 'ZBID'
    end
    object XsskHH: TIntegerField
      FieldName = 'HH'
    end
    object XsskRQ: TDateField
      FieldName = 'RQ'
    end
    object XsskDDID: TIntegerField
      FieldName = 'DDID'
    end
    object XsskaDDBH: TStringField
      DisplayLabel = #38144#21806#21333#21495
      FieldName = 'aDDBH'
      Size = 12
    end
    object XsskaSKQX: TDateField
      DisplayLabel = #25910#27454#26399#38480
      FieldName = 'aSKQX'
    end
    object XsskaDDJE: TFloatField
      DisplayLabel = #24635#37329#39069
      DisplayWidth = 12
      FieldName = 'aDDJE'
      DisplayFormat = '#,0.00'
    end
    object XsskaYSJE: TFloatField
      DisplayLabel = #24050#25910#37329#39069
      DisplayWidth = 12
      FieldName = 'aYSJE'
      DisplayFormat = '#,0.00'
    end
    object XsskaMSJE: TFloatField
      DisplayLabel = #26410#25910#37329#39069
      DisplayWidth = 12
      FieldName = 'aMSJE'
      DisplayFormat = '#,0.00'
    end
    object XsskJE: TFloatField
      DisplayLabel = #26412#27425#25910#27454
      DisplayWidth = 12
      FieldName = 'JE'
      DisplayFormat = '#,0.00'
    end
  end
  object sXssk: TDataSource
    DataSet = Xssk
    Left = 430
    Top = 158
  end
  object Xskd: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pXskd'
    RemoteServer = Cn
    OnCalcFields = CgshCalcFields
    Left = 295
    Top = 154
    object XskdZBID2: TIntegerField
      FieldName = 'ZBID'
    end
    object XskdHH: TIntegerField
      FieldName = 'HH'
    end
    object XskdRQ: TDateField
      Tag = 1
      FieldName = 'RQ'
    end
    object XskdCKID: TIntegerField
      FieldName = 'CKID'
    end
    object XskdHPID: TIntegerField
      DisplayWidth = 10
      FieldName = 'HPID'
    end
    object XskdaBH: TStringField
      DisplayLabel = #32534#21495
      FieldName = 'aBH'
    end
    object XskdaPM: TStringField
      DisplayLabel = #21697#21517#35268#26684
      FieldName = 'aPM'
      Size = 40
    end
    object XskdaDW: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'aDW'
      Size = 4
    end
    object XskdSL: TFloatField
      DisplayLabel = #25968#37327
      FieldName = 'SL'
      DisplayFormat = '#,0.###'
    end
    object XskdDJ: TFloatField
      DisplayLabel = #21333#20215
      DisplayWidth = 10
      FieldName = 'DJ'
      DisplayFormat = '#,0.###'
    end
    object XskdCBDJ: TFloatField
      DisplayWidth = 10
      FieldName = 'CBDJ'
    end
    object XskdNSL: TFloatField
      DisplayLabel = #31246#29575
      DisplayWidth = 4
      FieldName = 'NSL'
      OnGetText = NSLGetText
      DisplayFormat = '0.#'
    end
    object XskdcJE: TFloatField
      DisplayLabel = #37329#39069
      DisplayWidth = 12
      FieldKind = fkInternalCalc
      FieldName = 'cJE'
      DisplayFormat = '#,0.00'
    end
    object XskdDDID: TIntegerField
      DisplayWidth = 12
      FieldName = 'DDID'
    end
    object XskdcDDBH: TStringField
      DisplayLabel = #35746#21333#21495
      FieldKind = fkInternalCalc
      FieldName = 'cDDBH'
      Size = 12
    end
  end
  object sXskd: TDataSource
    DataSet = Xskd
    Left = 303
    Top = 158
  end
  object Xskdzb: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pXskdzb'
    RemoteServer = Cn
    BeforeOpen = CgshzbBeforeOpen
    Left = 231
    Top = 154
    object XskdzbID: TIntegerField
      Tag = 1
      FieldName = 'ID'
    end
    object XskdzbDJBH: TStringField
      DisplayLabel = #21333#21495
      FieldName = 'DJBH'
      Size = 12
    end
    object XskdzbRQ: TDateField
      DisplayLabel = #26085#26399
      FieldName = 'RQ'
    end
    object XskdzbKHID: TIntegerField
      Tag = 1
      FieldName = 'KHID'
    end
    object XskdzbaKHBH: TStringField
      DisplayLabel = #23458#25143#32534#21495
      FieldName = 'aKHBH'
      ProviderFlags = [pfInWhere]
      Size = 12
    end
    object XskdzbaKHMC: TStringField
      DisplayLabel = #23458#25143
      FieldName = 'aKHMC'
      ProviderFlags = [pfInWhere]
    end
    object XskdzbFKLX: TIntegerField
      Tag = 1
      DisplayWidth = 10
      FieldName = 'XSLX'
    end
    object XskdzbaFKLX: TStringField
      DisplayLabel = #38144#21806#31867#22411
      DisplayWidth = 4
      FieldName = 'aXSLX'
      Size = 255
    end
    object XskdzbCKID: TIntegerField
      Tag = 1
      FieldName = 'CKID'
    end
    object XskdzbaCKMC: TStringField
      DisplayLabel = #20986#36135#20179
      DisplayWidth = 10
      FieldName = 'aCKMC'
      Size = 16
    end
    object XskdzbFPLX: TIntegerField
      Tag = 1
      FieldName = 'FPLX'
    end
    object XskdzbaFPLX: TStringField
      DisplayLabel = #21457#31080#31867#22411
      DisplayWidth = 10
      FieldName = 'aFPLX'
      Size = 255
    end
    object XskdzbSFKFSID: TSmallintField
      Tag = 1
      FieldName = 'SFKFSID'
    end
    object XskdzbaSFKFSMC: TStringField
      DisplayLabel = #25910#27454#26041#24335
      DisplayWidth = 8
      FieldName = 'aSFKFSMC'
      Size = 16
    end
    object XskdzbZHID: TSmallintField
      Tag = 1
      FieldName = 'ZHID'
    end
    object XskdzbaZHMC: TStringField
      DisplayLabel = #25910#27454#21435#21521
      DisplayWidth = 16
      FieldName = 'aZHMC'
    end
    object XskdzbPH: TStringField
      DisplayLabel = #31080#21495
      FieldName = 'PH'
    end
    object XskdzbYWY: TStringField
      DisplayLabel = #19994#21153#21592
      FieldName = 'YWY'
      Size = 8
    end
    object XskdzbJHDD: TStringField
      DisplayLabel = #36865#36135#22320#22336
      FieldName = 'JHDD'
      Size = 40
    end
    object XskdzbSKQX: TIntegerField
      DisplayLabel = #25910#27454#26399#38480
      FieldName = 'SKQX'
    end
    object XskdzbJE: TFloatField
      DisplayLabel = #24635#37329#39069
      DisplayWidth = 12
      FieldName = 'JE'
      DisplayFormat = '#,0.00'
    end
    object XskdzbYSJE2: TFloatField
      DisplayWidth = 12
      FieldName = 'YSJE'
      DisplayFormat = '#,0.00'
    end
    object XskdzbYSJE: TFloatField
      DisplayLabel = #24050#25910#37329#39069
      DisplayWidth = 12
      FieldName = 'YSJE1'
      DisplayFormat = '#,0.00'
    end
    object XskdzbYFJE: TFloatField
      DisplayLabel = #26410#25910#37329#39069
      DisplayWidth = 12
      FieldName = 'MSJE'
      DisplayFormat = '#,0.00'
    end
    object XskdzbBZ: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'BZ'
      Size = 40
    end
    object XskdzbCZY: TStringField
      DisplayLabel = #25805#20316#21592
      FieldName = 'CZY'
      Size = 8
    end
  end
  object sXskdzb: TDataSource
    DataSet = Xskdzb
    Left = 239
    Top = 158
  end
  object Xsth: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <
      item
        DataType = ftString
        Name = 'zbid'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'pXsth'
    RemoteServer = Cn
    OnCalcFields = CgddCalcFields
    Left = 486
    Top = 154
    object XsthZBID2: TIntegerField
      FieldName = 'ZBID'
    end
    object XsthHH: TIntegerField
      FieldName = 'HH'
    end
    object XsthRQ: TDateField
      Tag = 1
      FieldName = 'RQ'
    end
    object XsthCKID: TIntegerField
      FieldName = 'CKID'
    end
    object XsthHPID: TIntegerField
      DisplayWidth = 10
      FieldName = 'HPID'
    end
    object XsthaBH: TStringField
      DisplayLabel = #32534#21495
      FieldName = 'aBH'
    end
    object XsthaPM: TStringField
      DisplayLabel = #21697#21517#35268#26684
      FieldName = 'aPM'
      Size = 40
    end
    object XsthaDW: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'aDW'
      Size = 4
    end
    object XsthSL: TFloatField
      DisplayLabel = #25968#37327
      FieldName = 'SL'
      DisplayFormat = '#,0.###'
    end
    object XsthDJ: TFloatField
      DisplayLabel = #21333#20215
      DisplayWidth = 10
      FieldName = 'DJ'
      DisplayFormat = '#,0.###'
    end
    object XsthNSL: TFloatField
      DisplayLabel = #31246#29575
      DisplayWidth = 4
      FieldName = 'NSL'
      OnGetText = NSLGetText
      DisplayFormat = '0.#'
    end
    object XsthCBDJ: TFloatField
      DisplayWidth = 10
      FieldName = 'CBDJ'
    end
    object XsthcJE: TFloatField
      DisplayLabel = #37329#39069
      DisplayWidth = 12
      FieldKind = fkInternalCalc
      FieldName = 'cJE'
      DisplayFormat = '#,0.00'
    end
  end
  object Xsthzb: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pXsthzb'
    RemoteServer = Cn
    BeforeOpen = CgthzbBeforeOpen
    Left = 454
    Top = 154
    object XsthzbID: TIntegerField
      Tag = 1
      FieldName = 'ID'
    end
    object XsthzbDJBH: TStringField
      DisplayLabel = #21333#21495
      FieldName = 'DJBH'
      Size = 12
    end
    object XsthzbRQ: TDateField
      DisplayLabel = #26085#26399
      FieldName = 'RQ'
    end
    object XsthzbKHID: TIntegerField
      Tag = 1
      FieldName = 'KHID'
    end
    object XsthzbaKHBH: TStringField
      DisplayLabel = #23458#25143#32534#21495
      FieldName = 'aKHBH'
      Size = 12
    end
    object XsthzbaKHMC: TStringField
      DisplayLabel = #23458#25143
      FieldName = 'aKHMC'
    end
    object XsthzbCKID: TIntegerField
      Tag = 1
      FieldName = 'CKID'
    end
    object XsthzbaCKMC: TStringField
      DisplayLabel = #36864#20837#20179
      DisplayWidth = 10
      FieldName = 'aCKMC'
      Size = 16
    end
    object XsthzbTHLX: TIntegerField
      FieldName = 'THLX'
    end
    object XsthzbaTHLX: TStringField
      DisplayLabel = #36864#27454#31867#22411
      DisplayWidth = 18
      FieldName = 'aTHLX'
      Size = 18
    end
    object XsthzbSFKFSID: TSmallintField
      Tag = 1
      FieldName = 'SFKFSID'
    end
    object XsthzbaSFKFSMC: TStringField
      DisplayLabel = #20184#27454#26041#24335
      DisplayWidth = 8
      FieldName = 'aSFKFSMC'
      Size = 16
    end
    object XsthzbZHID: TSmallintField
      Tag = 1
      FieldName = 'ZHID'
    end
    object XsthzbaZHMC: TStringField
      DisplayLabel = #36864#27454#24080#25143
      DisplayWidth = 16
      FieldName = 'aZHMC'
    end
    object XsthzbPH: TStringField
      DisplayLabel = #31080#21495
      FieldName = 'PH'
    end
    object XsthzbYWY: TStringField
      DisplayLabel = #19994#21153#21592
      FieldName = 'YWY'
      Size = 8
    end
    object XsthzbJE: TFloatField
      DisplayLabel = #24635#37329#39069
      DisplayWidth = 12
      FieldName = 'JE'
      DisplayFormat = '#,0.00'
    end
    object XsthzbBZ: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'BZ'
      Size = 40
    end
    object XsthzbCZY: TStringField
      DisplayLabel = #25805#20316#21592
      FieldName = 'CZY'
      Size = 8
    end
  end
  object sXsthzb: TDataSource
    DataSet = Xsthzb
    Left = 462
    Top = 158
  end
  object sXsth: TDataSource
    DataSet = Xsth
    Left = 494
    Top = 158
  end
  object Llzb: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pLlzb'
    RemoteServer = Cn
    BeforeOpen = LlzbBeforeOpen
    Left = 8
    Top = 206
    object LlzbID: TIntegerField
      Tag = 1
      FieldName = 'ID'
    end
    object LlzbDJBH: TStringField
      DisplayLabel = #21333#21495
      FieldName = 'DJBH'
      Size = 12
    end
    object LlzbRQ: TDateField
      DisplayLabel = #26085#26399
      FieldName = 'RQ'
    end
    object LlzbCKID: TIntegerField
      Tag = 1
      FieldName = 'CKID'
    end
    object LlzbaCKMC: TStringField
      DisplayLabel = #39046#26009#20179
      DisplayWidth = 10
      FieldName = 'aCKMC'
      Size = 16
    end
    object LlzbJSR: TStringField
      DisplayLabel = #39046#26009#20154
      FieldName = 'JSR'
      Size = 8
    end
    object LlzbJE: TFloatField
      DisplayLabel = #24635#37329#39069
      DisplayWidth = 12
      FieldName = 'JE'
      DisplayFormat = '#,0.00'
    end
    object LlzbBZ: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'BZ'
      Size = 40
    end
    object LlzbCZY: TStringField
      DisplayLabel = #25805#20316#21592
      FieldName = 'CZY'
      Size = 8
    end
  end
  object Ll: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pLl'
    RemoteServer = Cn
    OnCalcFields = LlCalcFields
    Left = 42
    Top = 206
    object LlZBID2: TIntegerField
      FieldName = 'ZBID'
    end
    object LlHH: TIntegerField
      FieldName = 'HH'
    end
    object LlRQ: TDateField
      Tag = 1
      FieldName = 'RQ'
    end
    object LlCKID: TIntegerField
      FieldName = 'CKID'
    end
    object LlHPID: TIntegerField
      DisplayWidth = 10
      FieldName = 'HPID'
    end
    object LlaBH: TStringField
      DisplayLabel = #32534#21495
      FieldName = 'aBH'
    end
    object LlaPM: TStringField
      DisplayLabel = #21697#21517#35268#26684
      FieldName = 'aPM'
      Size = 40
    end
    object LlaDW: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'aDW'
      Size = 4
    end
    object LlSL: TFloatField
      DisplayLabel = #25968#37327
      FieldName = 'SL'
      DisplayFormat = '#,0.###'
    end
    object LlDJ: TFloatField
      DisplayLabel = #25104#26412#20215
      DisplayWidth = 10
      FieldName = 'DJ'
      DisplayFormat = '#,0.###'
    end
    object LlcJE: TFloatField
      DisplayLabel = #37329#39069
      DisplayWidth = 12
      FieldKind = fkInternalCalc
      FieldName = 'cJE'
      DisplayFormat = '#,0.00'
    end
  end
  object sLl: TDataSource
    DataSet = Ll
    Left = 50
    Top = 214
  end
  object sLlzb: TDataSource
    DataSet = Llzb
    Left = 16
    Top = 214
  end
  object Tlzb: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pTlzb'
    RemoteServer = Cn
    BeforeOpen = LlzbBeforeOpen
    Left = 76
    Top = 206
    object IntegerField2: TIntegerField
      Tag = 1
      FieldName = 'ID'
    end
    object StringField4: TStringField
      DisplayLabel = #21333#21495
      FieldName = 'DJBH'
      Size = 12
    end
    object DateField3: TDateField
      DisplayLabel = #26085#26399
      FieldName = 'RQ'
    end
    object IntegerField3: TIntegerField
      Tag = 1
      FieldName = 'CKID'
    end
    object StringField5: TStringField
      DisplayLabel = #36864#26009#20179
      DisplayWidth = 10
      FieldName = 'aCKMC'
      Size = 16
    end
    object StringField6: TStringField
      DisplayLabel = #36864#26009#20154
      FieldName = 'JSR'
      Size = 8
    end
    object FloatField2: TFloatField
      DisplayLabel = #24635#37329#39069
      DisplayWidth = 12
      FieldName = 'JE'
      DisplayFormat = '#,0.00'
    end
    object StringField7: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'BZ'
      Size = 40
    end
    object StringField8: TStringField
      DisplayLabel = #25805#20316#21592
      FieldName = 'CZY'
      Size = 8
    end
  end
  object Tl: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pTl'
    RemoteServer = Cn
    OnCalcFields = LlCalcFields
    Left = 110
    Top = 206
    object IntegerField4: TIntegerField
      FieldName = 'ZBID'
    end
    object IntegerField5: TIntegerField
      FieldName = 'HH'
    end
    object DateField4: TDateField
      Tag = 1
      FieldName = 'RQ'
    end
    object IntegerField6: TIntegerField
      FieldName = 'CKID'
    end
    object IntegerField7: TIntegerField
      DisplayWidth = 10
      FieldName = 'HPID'
    end
    object StringField9: TStringField
      DisplayLabel = #32534#21495
      FieldName = 'aBH'
    end
    object StringField10: TStringField
      DisplayLabel = #21697#21517#35268#26684
      FieldName = 'aPM'
      Size = 40
    end
    object StringField11: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'aDW'
      Size = 4
    end
    object FloatField3: TFloatField
      DisplayLabel = #25968#37327
      FieldName = 'SL'
      DisplayFormat = '#,0.###'
    end
    object FloatField4: TFloatField
      DisplayLabel = #25104#26412#20215
      DisplayWidth = 10
      FieldName = 'DJ'
      DisplayFormat = '#,0.###'
    end
    object FloatField5: TFloatField
      DisplayLabel = #37329#39069
      DisplayWidth = 12
      FieldKind = fkInternalCalc
      FieldName = 'cJE'
      DisplayFormat = '#,0.00'
    end
  end
  object sTl: TDataSource
    DataSet = Tl
    Left = 118
    Top = 214
  end
  object sTlzb: TDataSource
    DataSet = Tlzb
    Left = 84
    Top = 214
  end
  object Cpjczb: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pCpjczb'
    RemoteServer = Cn
    BeforeOpen = LlzbBeforeOpen
    Left = 144
    Top = 206
    object CpjczbID: TIntegerField
      Tag = 1
      FieldName = 'ID'
    end
    object CpjczbDJBH: TStringField
      DisplayLabel = #21333#21495
      FieldName = 'DJBH'
      Size = 12
    end
    object CpjczbRQ: TDateField
      DisplayLabel = #26085#26399
      FieldName = 'RQ'
    end
    object CpjczbCKID: TIntegerField
      Tag = 1
      FieldName = 'CKID'
    end
    object CpjczbaCKMC: TStringField
      DisplayLabel = #36827#36135#20179
      DisplayWidth = 10
      FieldName = 'aCKMC'
      Size = 16
    end
    object CpjczbPH: TStringField
      DisplayLabel = #25209#21495
      FieldName = 'PH'
    end
    object CpjczbJE: TFloatField
      DisplayLabel = #24635#37329#39069
      DisplayWidth = 12
      FieldName = 'JE'
      DisplayFormat = '#,0.00'
    end
    object CpjczbBZ: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'BZ'
      Size = 40
    end
    object CpjczbCZY: TStringField
      DisplayLabel = #25805#20316#21592
      FieldName = 'CZY'
      Size = 8
    end
  end
  object Cpjc: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pCpjc'
    RemoteServer = Cn
    OnCalcFields = LlCalcFields
    Left = 178
    Top = 206
    object CpjcZBID2: TIntegerField
      FieldName = 'ZBID'
    end
    object CpjcHH: TIntegerField
      FieldName = 'HH'
    end
    object CpjcRQ: TDateField
      Tag = 1
      FieldName = 'RQ'
    end
    object CpjcCKID: TIntegerField
      FieldName = 'CKID'
    end
    object CpjcHPID: TIntegerField
      DisplayWidth = 10
      FieldName = 'HPID'
    end
    object CpjcaBH: TStringField
      DisplayLabel = #32534#21495
      FieldName = 'aBH'
    end
    object CpjcaPM: TStringField
      DisplayLabel = #21697#21517#35268#26684
      FieldName = 'aPM'
      Size = 40
    end
    object CpjcaDW: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'aDW'
      Size = 4
    end
    object CpjcSL: TFloatField
      DisplayLabel = #25968#37327
      FieldName = 'SL'
      DisplayFormat = '#,0.###'
    end
    object CpjcDJ: TFloatField
      DisplayLabel = #32508#21512#25104#26412#20215
      DisplayWidth = 10
      FieldName = 'DJ'
      DisplayFormat = '#,0.###'
    end
    object CpjccJE: TFloatField
      DisplayLabel = #37329#39069
      DisplayWidth = 12
      FieldKind = fkInternalCalc
      FieldName = 'cJE'
      DisplayFormat = '#,0.00'
    end
  end
  object sCpjc: TDataSource
    DataSet = Cpjc
    Left = 220
    Top = 214
  end
  object sCpjczb: TDataSource
    DataSet = Cpjczb
    Left = 152
    Top = 214
  end
  object Kcpdzb: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pKcpdzb'
    RemoteServer = Cn
    BeforeOpen = LlzbBeforeOpen
    Left = 246
    Top = 206
    object IntegerField8: TIntegerField
      Tag = 1
      FieldName = 'ID'
    end
    object StringField12: TStringField
      DisplayLabel = #21333#21495
      FieldName = 'DJBH'
      Size = 12
    end
    object DateField5: TDateField
      DisplayLabel = #26085#26399
      FieldName = 'RQ'
    end
    object IntegerField9: TIntegerField
      Tag = 1
      FieldName = 'CKID'
    end
    object StringField13: TStringField
      DisplayLabel = #30424#28857#20179
      DisplayWidth = 10
      FieldName = 'aCKMC'
      Size = 16
    end
    object FloatField6: TFloatField
      DisplayLabel = #24635#37329#39069
      DisplayWidth = 12
      FieldName = 'JE'
      DisplayFormat = '#,0.00'
    end
    object StringField15: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'BZ'
      Size = 40
    end
    object StringField16: TStringField
      DisplayLabel = #25805#20316#21592
      FieldName = 'CZY'
      Size = 8
    end
  end
  object Kcpd: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pKcpd'
    RemoteServer = Cn
    OnCalcFields = LlCalcFields
    Left = 314
    Top = 206
    object IntegerField10: TIntegerField
      FieldName = 'ZBID'
    end
    object IntegerField11: TIntegerField
      FieldName = 'HH'
    end
    object DateField6: TDateField
      Tag = 1
      FieldName = 'RQ'
    end
    object IntegerField12: TIntegerField
      FieldName = 'CKID'
    end
    object IntegerField13: TIntegerField
      DisplayWidth = 10
      FieldName = 'HPID'
    end
    object StringField17: TStringField
      DisplayLabel = #32534#21495
      FieldName = 'aBH'
    end
    object StringField18: TStringField
      DisplayLabel = #21697#21517#35268#26684
      FieldName = 'aPM'
      Size = 40
    end
    object StringField19: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'aDW'
      Size = 4
    end
    object FloatField7: TFloatField
      DisplayLabel = #30408#20111#25968#37327
      FieldName = 'SL'
      DisplayFormat = '#,0.###'
    end
    object FloatField8: TFloatField
      DisplayLabel = #25104#26412#20215
      DisplayWidth = 10
      FieldName = 'DJ'
      DisplayFormat = '#,0.###'
    end
    object FloatField9: TFloatField
      DisplayLabel = #37329#39069
      DisplayWidth = 12
      FieldKind = fkInternalCalc
      FieldName = 'cJE'
      DisplayFormat = '#,0.00'
    end
  end
  object sKcpd: TDataSource
    DataSet = Kcpd
    Left = 186
    Top = 214
  end
  object sKcpdzb: TDataSource
    DataSet = Kcpdzb
    Left = 288
    Top = 214
  end
  object Chtjzb: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pChtjzb'
    RemoteServer = Cn
    Left = 212
    Top = 206
    object ChtjzbID: TIntegerField
      Tag = 1
      FieldName = 'ID'
    end
    object ChtjzbDJBH: TStringField
      DisplayLabel = #21333#21495
      FieldName = 'DJBH'
      Size = 12
    end
    object ChtjzbRQ: TDateField
      DisplayLabel = #26085#26399
      FieldName = 'RQ'
    end
    object ChtjzbJE: TFloatField
      DisplayLabel = #24635#37329#39069
      DisplayWidth = 12
      FieldName = 'JE'
      DisplayFormat = '#,0.00'
    end
    object ChtjzbBZ: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'BZ'
      Size = 40
    end
    object ChtjzbCZY: TStringField
      DisplayLabel = #25805#20316#21592
      FieldName = 'CZY'
      Size = 8
    end
  end
  object Chtj: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pChtj'
    RemoteServer = Cn
    OnCalcFields = ChtjCalcFields
    Left = 280
    Top = 206
    object ChtjZBID2: TIntegerField
      FieldName = 'ZBID'
    end
    object ChtjHH: TIntegerField
      FieldName = 'HH'
    end
    object ChtjRQ: TDateField
      Tag = 1
      FieldName = 'RQ'
    end
    object ChtjHPID: TIntegerField
      DisplayWidth = 10
      FieldName = 'HPID'
    end
    object ChtjaBH: TStringField
      DisplayLabel = #32534#21495
      FieldName = 'aBH'
    end
    object ChtjaPM: TStringField
      DisplayLabel = #21697#21517#35268#26684
      FieldName = 'aPM'
      Size = 40
    end
    object ChtjaDW: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'aDW'
      Size = 4
    end
    object ChtjSL: TFloatField
      DisplayLabel = #24211#23384#37327
      FieldName = 'SL'
      DisplayFormat = '#,0.###'
    end
    object ChtjJDJ: TFloatField
      DisplayLabel = #21407#21152#26435#20215
      DisplayWidth = 10
      FieldName = 'JDJ'
      DisplayFormat = '#,0.###'
    end
    object ChtjDJ: TFloatField
      DisplayLabel = #26032#21152#26435#20215
      DisplayWidth = 10
      FieldName = 'DJ'
      DisplayFormat = '#,0.###'
    end
    object ChtjcJE: TFloatField
      DisplayLabel = #35843#20215#37329#39069
      DisplayWidth = 12
      FieldKind = fkInternalCalc
      FieldName = 'cJE'
      DisplayFormat = '#,0.00'
    end
  end
  object sChtj: TDataSource
    DataSet = Chtj
    Left = 322
    Top = 214
  end
  object sChtjzb: TDataSource
    DataSet = Chtjzb
    Left = 254
    Top = 214
  end
  object Ckdbzb: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pCkdbzb'
    RemoteServer = Cn
    BeforeOpen = LlzbBeforeOpen
    Left = 348
    Top = 206
    object IntegerField14: TIntegerField
      Tag = 1
      FieldName = 'ID'
    end
    object StringField14: TStringField
      DisplayLabel = #21333#21495
      FieldName = 'DJBH'
      Size = 12
    end
    object DateField7: TDateField
      DisplayLabel = #26085#26399
      FieldName = 'RQ'
    end
    object IntegerField15: TIntegerField
      Tag = 1
      DisplayLabel = #35843#20986#20179
      FieldName = 'DCCID'
    end
    object StringField20: TStringField
      DisplayLabel = #35843#20986#20179
      DisplayWidth = 10
      FieldName = 'aDCCMC'
      Size = 16
    end
    object CkdbzbCKID: TIntegerField
      Tag = 1
      DisplayLabel = #35843#20837#20179
      FieldName = 'DRCID'
    end
    object CkdbzbaCKMC: TStringField
      DisplayLabel = #35843#20837#20179
      DisplayWidth = 10
      FieldName = 'aDRCMC'
      Size = 16
    end
    object FloatField10: TFloatField
      DisplayLabel = #24635#37329#39069
      DisplayWidth = 12
      FieldName = 'JE'
      DisplayFormat = '#,0.00'
    end
    object StringField22: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'BZ'
      Size = 40
    end
    object StringField23: TStringField
      DisplayLabel = #25805#20316#21592
      FieldName = 'CZY'
      Size = 8
    end
  end
  object Ckdb: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pCkdb'
    RemoteServer = Cn
    OnCalcFields = LlCalcFields
    Left = 382
    Top = 206
    object IntegerField16: TIntegerField
      FieldName = 'ZBID'
    end
    object IntegerField17: TIntegerField
      FieldName = 'HH'
    end
    object DateField8: TDateField
      Tag = 1
      FieldName = 'RQ'
    end
    object IntegerField18: TIntegerField
      FieldName = 'DCCID'
    end
    object CkdbCKID: TIntegerField
      FieldName = 'DRCID'
    end
    object IntegerField19: TIntegerField
      DisplayWidth = 10
      FieldName = 'HPID'
    end
    object StringField24: TStringField
      DisplayLabel = #32534#21495
      FieldName = 'aBH'
    end
    object StringField25: TStringField
      DisplayLabel = #21697#21517#35268#26684
      FieldName = 'aPM'
      Size = 40
    end
    object StringField26: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'aDW'
      Size = 4
    end
    object FloatField11: TFloatField
      DisplayLabel = #25968#37327
      FieldName = 'SL'
      DisplayFormat = '#,0.###'
    end
    object FloatField12: TFloatField
      DisplayLabel = #25104#26412#20215
      DisplayWidth = 10
      FieldName = 'DJ'
      DisplayFormat = '#,0.###'
    end
    object FloatField13: TFloatField
      DisplayLabel = #37329#39069
      DisplayWidth = 12
      FieldKind = fkInternalCalc
      FieldName = 'cJE'
      DisplayFormat = '#,0.00'
    end
  end
  object sCkdb: TDataSource
    DataSet = Ckdb
    Left = 390
    Top = 214
  end
  object sCkdbzb: TDataSource
    DataSet = Ckdbzb
    Left = 356
    Top = 214
  end
  object Qtkcbdzb: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pQtkcbdzb'
    RemoteServer = Cn
    BeforeOpen = QtkcbdzbBeforeOpen
    Left = 416
    Top = 206
    object IntegerField20: TIntegerField
      Tag = 1
      FieldName = 'ID'
    end
    object StringField21: TStringField
      DisplayLabel = #21333#21495
      FieldName = 'DJBH'
      Size = 12
    end
    object DateField9: TDateField
      DisplayLabel = #26085#26399
      FieldName = 'RQ'
    end
    object IntegerField21: TIntegerField
      Tag = 1
      FieldName = 'CKID'
    end
    object StringField27: TStringField
      DisplayLabel = #21464#21160#20179#24211
      DisplayWidth = 10
      FieldName = 'aCKMC'
      Size = 16
    end
    object QtkcbdzbQTKCBDLXID: TIntegerField
      DisplayLabel = #24211#23384#21464#21160#31867#22411
      FieldName = 'QTKCBDLXID'
    end
    object QtkcbdzbaQTKCBDLXMC: TStringField
      DisplayLabel = #24211#23384#21464#21160#31867#22411
      FieldName = 'aQTKCBDLXMC'
    end
    object QtkcbdzbCRLX: TIntegerField
      FieldName = 'CRLX'
    end
    object QtkcbdzbaJCLX: TStringField
      DisplayLabel = #20986#20837#20179#24211#31867#22411
      FieldName = 'aCRLX'
      Size = 16
    end
    object QtkcbdzbaTH: TStringField
      DisplayLabel = #26159#21542#38656#35201#36864#36824
      FieldName = 'aTH'
      Size = 6
    end
    object QtkcbdzbXGXX: TStringField
      DisplayLabel = #30456#20851#20449#24687
      FieldName = 'XGXX'
    end
    object FloatField14: TFloatField
      DisplayLabel = #24635#37329#39069
      DisplayWidth = 12
      FieldName = 'JE'
      DisplayFormat = '#,0.00'
    end
    object StringField29: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'BZ'
      Size = 40
    end
    object StringField30: TStringField
      DisplayLabel = #25805#20316#21592
      FieldName = 'CZY'
      Size = 8
    end
  end
  object Qtkcbd: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pQtkcbd'
    RemoteServer = Cn
    OnCalcFields = LlCalcFields
    Left = 450
    Top = 206
    object IntegerField22: TIntegerField
      FieldName = 'ZBID'
    end
    object IntegerField23: TIntegerField
      FieldName = 'HH'
    end
    object DateField10: TDateField
      Tag = 1
      FieldName = 'RQ'
    end
    object IntegerField24: TIntegerField
      FieldName = 'CKID'
    end
    object QtkcbdCRLX: TIntegerField
      FieldName = 'CRLX'
    end
    object IntegerField25: TIntegerField
      DisplayWidth = 10
      FieldName = 'HPID'
    end
    object StringField31: TStringField
      DisplayLabel = #32534#21495
      FieldName = 'aBH'
    end
    object StringField32: TStringField
      DisplayLabel = #21697#21517#35268#26684
      FieldName = 'aPM'
      Size = 40
    end
    object StringField33: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'aDW'
      Size = 4
    end
    object QtkcbdSL: TFloatField
      DisplayLabel = #25968#37327
      FieldName = 'SL'
      DisplayFormat = '#,0.###'
    end
    object FloatField16: TFloatField
      DisplayLabel = #21333#20215
      DisplayWidth = 10
      FieldName = 'DJ'
      DisplayFormat = '#,0.###'
    end
    object FloatField17: TFloatField
      DisplayLabel = #37329#39069
      DisplayWidth = 12
      FieldKind = fkInternalCalc
      FieldName = 'cJE'
      DisplayFormat = '#,0.00'
    end
    object QtkcbdTHSL: TFloatField
      DisplayLabel = #36864#36135#25968#37327
      FieldName = 'THSL'
      DisplayFormat = '#,0.###'
    end
  end
  object sQtkcbd: TDataSource
    DataSet = Qtkcbd
    Left = 458
    Top = 214
  end
  object sQtkcbdzb: TDataSource
    DataSet = Qtkcbdzb
    Left = 424
    Top = 214
  end
  object Fykz: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pFykz'
    RemoteServer = Cn
    Left = 58
    Top = 254
    object FykzZBID: TIntegerField
      FieldName = 'ZBID'
    end
    object FykzHH: TIntegerField
      FieldName = 'HH'
    end
    object FykzRQ: TDateField
      FieldName = 'RQ'
    end
    object FykzSRZCLBID: TIntegerField
      FieldName = 'SRZCLBID'
    end
    object FykzaBH: TStringField
      DisplayLabel = #32534#21495
      FieldName = 'aBH'
      Size = 6
    end
    object FykzaMC: TStringField
      DisplayLabel = #36153#29992#31867#21035
      FieldName = 'aMC'
    end
    object FykzZY: TStringField
      DisplayLabel = #25688#35201
      FieldName = 'ZY'
      Size = 30
    end
    object FykzJE: TFloatField
      DisplayLabel = #37329#39069
      FieldName = 'JE'
      DisplayFormat = '#,0.00'
    end
  end
  object Fykzzb: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pFykzzb'
    RemoteServer = Cn
    BeforeOpen = FykzzbBeforeOpen
    Left = 16
    Top = 254
    object FykzzbID2: TIntegerField
      Tag = 1
      FieldName = 'ID'
    end
    object FykzzbDJBH: TStringField
      DisplayLabel = #21333#21495
      FieldName = 'DJBH'
      Size = 12
    end
    object FykzzbRQ: TDateField
      DisplayLabel = #26085#26399
      FieldName = 'RQ'
    end
    object FykzzbSFKFSID: TSmallintField
      Tag = 1
      FieldName = 'SFKFSID'
    end
    object FykzzbaSFKFSMC: TStringField
      DisplayLabel = #20184#27454#26041#24335
      DisplayWidth = 8
      FieldName = 'aSFKFSMC'
      Size = 16
    end
    object FykzzbZHID: TSmallintField
      Tag = 1
      FieldName = 'ZHID'
    end
    object FykzzbaZHMC: TStringField
      DisplayLabel = #20184#27454#26469#28304
      DisplayWidth = 16
      FieldName = 'aZHMC'
    end
    object FykzzbPH: TStringField
      DisplayLabel = #31080#21495
      FieldName = 'PH'
    end
    object FykzzbJSR: TStringField
      DisplayLabel = #32463#21150#20154
      FieldName = 'JSR'
      Size = 8
    end
    object FykzzbJE: TFloatField
      DisplayLabel = #24635#37329#39069
      DisplayWidth = 12
      FieldName = 'JE'
      DisplayFormat = '#,0.00'
    end
    object FykzzbBZ: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'BZ'
      Size = 40
    end
    object FykzzbCZY: TStringField
      DisplayLabel = #25805#20316#21592
      FieldName = 'CZY'
      Size = 8
    end
  end
  object sFykzzb: TDataSource
    DataSet = Fykzzb
    Left = 20
    Top = 262
  end
  object sFykz: TDataSource
    DataSet = Fykz
    Left = 62
    Top = 262
  end
  object SrzclbHelp: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pSrzclb'
    RemoteServer = Cn
    Left = 214
    Top = 306
    object IntegerField26: TIntegerField
      Tag = 1
      FieldName = 'ID'
    end
    object StringField28: TStringField
      DisplayLabel = #32534#21495
      FieldName = 'BH'
      Size = 6
    end
    object StringField34: TStringField
      DisplayLabel = #21517#31216
      FieldName = 'MC'
    end
    object BooleanField1: TBooleanField
      Tag = 1
      DisplayLabel = #31867#21035
      DisplayWidth = 6
      FieldName = 'SRL'
      OnGetText = SrzclbSRLGetText
    end
    object StringField35: TStringField
      DisplayLabel = #31867#21035
      DisplayWidth = 10
      FieldName = 'aSRL'
      Size = 255
    end
    object StringField36: TStringField
      DisplayLabel = #35828#26126
      FieldName = 'BZ'
      Size = 32
    end
  end
  object sSrzclbHelp: TDataSource
    DataSet = SrzclbHelp
    Left = 222
    Top = 318
  end
  object Qtsr: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pQtsr'
    RemoteServer = Cn
    Left = 142
    Top = 254
    object IntegerField27: TIntegerField
      FieldName = 'ZBID'
    end
    object IntegerField28: TIntegerField
      FieldName = 'HH'
    end
    object DateField11: TDateField
      FieldName = 'RQ'
    end
    object IntegerField29: TIntegerField
      FieldName = 'SRZCLBID'
    end
    object StringField37: TStringField
      DisplayLabel = #32534#21495
      FieldName = 'aBH'
      Size = 6
    end
    object StringField38: TStringField
      DisplayLabel = #25910#20837#31867#21035
      FieldName = 'aMC'
    end
    object StringField39: TStringField
      DisplayLabel = #25688#35201
      FieldName = 'ZY'
      Size = 30
    end
    object FloatField15: TFloatField
      DisplayLabel = #37329#39069
      FieldName = 'JE'
      DisplayFormat = '#,0.00'
    end
  end
  object Qtsrzb: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pQtsrzb'
    RemoteServer = Cn
    BeforeOpen = FykzzbBeforeOpen
    Left = 100
    Top = 254
    object IntegerField30: TIntegerField
      Tag = 1
      FieldName = 'ID'
    end
    object StringField40: TStringField
      DisplayLabel = #21333#21495
      FieldName = 'DJBH'
      Size = 12
    end
    object DateField12: TDateField
      DisplayLabel = #26085#26399
      FieldName = 'RQ'
    end
    object SmallintField1: TSmallintField
      Tag = 1
      FieldName = 'SFKFSID'
    end
    object StringField41: TStringField
      DisplayLabel = #25910#27454#26041#24335
      DisplayWidth = 8
      FieldName = 'aSFKFSMC'
      Size = 16
    end
    object SmallintField2: TSmallintField
      Tag = 1
      FieldName = 'ZHID'
    end
    object StringField42: TStringField
      DisplayLabel = #25910#27454#21435#21521
      DisplayWidth = 16
      FieldName = 'aZHMC'
    end
    object StringField43: TStringField
      DisplayLabel = #31080#21495
      FieldName = 'PH'
    end
    object StringField44: TStringField
      DisplayLabel = #32463#21150#20154
      FieldName = 'JSR'
      Size = 8
    end
    object FloatField18: TFloatField
      DisplayLabel = #24635#37329#39069
      DisplayWidth = 12
      FieldName = 'JE'
      DisplayFormat = '#,0.00'
    end
    object StringField45: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'BZ'
      Size = 40
    end
    object StringField46: TStringField
      DisplayLabel = #25805#20316#21592
      FieldName = 'CZY'
      Size = 8
    end
  end
  object sQtsrzb: TDataSource
    DataSet = Qtsrzb
    Left = 104
    Top = 262
  end
  object sQtsr: TDataSource
    DataSet = Qtsr
    Left = 146
    Top = 262
  end
  object Yhckqk: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pYhckqk'
    RemoteServer = Cn
    BeforeOpen = YhckqkBeforeOpen
    Left = 184
    Top = 254
    object YhckqkID: TIntegerField
      Tag = 1
      FieldName = 'ID'
    end
    object YhckqkRQ: TDateField
      DisplayLabel = #26085#26399
      FieldName = 'RQ'
      EditMask = '!0000-!90-90;1; '
    end
    object YhckqkJSR: TStringField
      DisplayLabel = #32463#21150#20154
      FieldName = 'JSR'
      Size = 8
    end
    object YhckqkZCZHID: TSmallintField
      Tag = 1
      FieldName = 'ZCZHID'
    end
    object YhckqkaZCZHMC: TStringField
      DisplayLabel = #36716#20986#24080#25143
      DisplayWidth = 16
      FieldName = 'aZCZHMC'
    end
    object YhckqkZRZHID: TSmallintField
      Tag = 1
      FieldName = 'ZRZHID'
    end
    object YhckqkaZRZHMC: TStringField
      DisplayLabel = #36716#20837#24080#25143
      DisplayWidth = 16
      FieldName = 'aZRZHMC'
    end
    object YhckqkPH: TStringField
      DisplayLabel = #31080#21495
      FieldName = 'PH'
    end
    object YhckqkJE: TFloatField
      DisplayLabel = #37329#39069
      DisplayWidth = 12
      FieldName = 'JE'
      DisplayFormat = '#,0.00'
    end
    object YhckqkBZ: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'BZ'
      Size = 40
    end
    object YhckqkCZY: TStringField
      DisplayLabel = #25805#20316#21592
      FieldName = 'CZY'
      Size = 8
    end
  end
  object sYhckqk: TDataSource
    DataSet = Yhckqk
    Left = 188
    Top = 262
  end
  object XskdHelp: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pXskdHelp'
    RemoteServer = Cn
    Left = 256
    Top = 306
    object IntegerField31: TIntegerField
      FieldName = 'ID'
    end
    object StringField47: TStringField
      DisplayLabel = #21333#21495
      FieldName = 'DJBH'
      Size = 12
    end
    object DateField13: TDateField
      DisplayLabel = #33853#21333#26085#26399
      FieldName = 'RQ'
    end
    object FloatField19: TFloatField
      DisplayLabel = #37329#39069
      DisplayWidth = 12
      FieldName = 'JE'
      DisplayFormat = '#,0.00'
    end
    object XskdHelpaXSLX: TStringField
      DisplayLabel = #38144#21806#31867#22411
      DisplayWidth = 4
      FieldName = 'aXSLX'
      Size = 255
    end
    object XskdHelpaKHBH: TStringField
      DisplayLabel = #23458#25143#32534#21495
      FieldName = 'aKHBH'
      ProviderFlags = [pfInWhere]
      Size = 12
    end
    object XskdHelpaKHMC: TStringField
      DisplayLabel = #23458#25143
      FieldName = 'aKHMC'
      ProviderFlags = [pfInWhere]
    end
  end
  object sXskdHelp: TDataSource
    DataSet = XskdHelp
    Left = 264
    Top = 318
  end
  object XsSkgc: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select Z.DJBH,Z.RQ,Z.JE as ZJE,M.JE as BCJE from XSSKZB Z,XSSK M' +
      ' where Z.ID=M.ZBID'
    PacketRecords = 50
    Params = <>
    ProviderName = 'pTmp'
    RemoteServer = Cn
    Left = 298
    Top = 306
    object XsSkgcDJBH: TWideStringField
      DisplayLabel = #25910#27454#21333#21495
      FieldName = 'DJBH'
      Size = 12
    end
    object XsSkgcRQ: TDateField
      DisplayLabel = #25910#27454#26085#26399
      FieldName = 'RQ'
    end
    object XsSkgcZJE: TFloatField
      DisplayLabel = #24635#37329#39069
      DisplayWidth = 12
      FieldName = 'ZJE'
      DisplayFormat = '#,0.00'
    end
    object XsSkgcBCJE: TFloatField
      DisplayLabel = #26412#27425#25910#27454
      DisplayWidth = 12
      FieldName = 'BCJE'
      DisplayFormat = '#,0.00'
    end
  end
  object sXsSkgc: TDataSource
    DataSet = XsSkgc
    Left = 306
    Top = 318
  end
  object CgFkgc: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select Z.DJBH,Z.RQ,Z.JE as ZJE,M.JE as BCJE from XSSKZB Z,XSSK M' +
      ' where Z.ID=M.ZBID'
    PacketRecords = 50
    Params = <>
    ProviderName = 'pTmp'
    RemoteServer = Cn
    Left = 382
    Top = 306
    object WideStringField1: TWideStringField
      DisplayLabel = #25910#27454#21333#21495
      FieldName = 'DJBH'
      Size = 12
    end
    object DateField14: TDateField
      DisplayLabel = #25910#27454#26085#26399
      FieldName = 'RQ'
    end
    object BCDField1: TFloatField
      DisplayLabel = #24635#37329#39069
      DisplayWidth = 12
      FieldName = 'ZJE'
      DisplayFormat = '#,0.00'
    end
    object BCDField2: TFloatField
      DisplayLabel = #26412#27425#20184#27454
      DisplayWidth = 12
      FieldName = 'BCJE'
      DisplayFormat = '#,0.00'
    end
  end
  object sCgFkgc: TDataSource
    DataSet = CgFkgc
    Left = 390
    Top = 318
  end
  object CgshHelp: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pCgshHelp'
    RemoteServer = Cn
    Left = 424
    Top = 306
    object CgshHelpID: TIntegerField
      FieldName = 'ID'
    end
    object CgshHelpDJBH: TStringField
      DisplayLabel = #21333#21495
      FieldName = 'DJBH'
      Size = 12
    end
    object CgshHelpRQ: TDateField
      DisplayLabel = #33853#21333#26085#26399
      FieldName = 'RQ'
    end
    object CgshHelpJE: TFloatField
      DisplayLabel = #37329#39069
      DisplayWidth = 12
      FieldName = 'JE'
      DisplayFormat = '#,0.00'
    end
    object CgshHelpaCGLX: TStringField
      DisplayLabel = #37319#36141#31867#22411
      DisplayWidth = 4
      FieldName = 'aCGLX'
      Size = 255
    end
    object CgshHelpaGYSBH: TStringField
      DisplayLabel = #20379#24212#21830#32534#21495
      FieldName = 'aGYSBH'
      ProviderFlags = [pfInWhere]
      Size = 12
    end
    object CgshHelpaGYSMC: TStringField
      DisplayLabel = #20379#24212#21830
      FieldName = 'aGYSMC'
      ProviderFlags = [pfInWhere]
    end
  end
  object sCgshHelp: TDataSource
    DataSet = CgshHelp
    Left = 432
    Top = 318
  end
  object Thgc: TClientDataSet
    Aggregates = <>
    PacketRecords = 50
    Params = <>
    ProviderName = 'pThgc'
    RemoteServer = Cn
    OnCalcFields = LlCalcFields
    Left = 484
    Top = 206
    object IntegerField32: TIntegerField
      FieldName = 'ZBID'
    end
    object IntegerField33: TIntegerField
      FieldName = 'HH'
    end
    object DateField15: TDateField
      Tag = 1
      DisplayLabel = #36864#36824#26085#26399
      FieldName = 'RQ'
      EditMask = '!0000-!90-90;1; '
    end
    object IntegerField36: TIntegerField
      DisplayWidth = 10
      FieldName = 'HPID'
    end
    object StringField48: TStringField
      DisplayLabel = #32534#21495
      FieldName = 'aBH'
    end
    object StringField49: TStringField
      DisplayLabel = #21697#21517#35268#26684
      FieldName = 'aPM'
      Size = 40
    end
    object StringField50: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'aDW'
      Size = 4
    end
    object FloatField20: TFloatField
      DisplayLabel = #36864#36135#25968#37327
      FieldName = 'SL'
      DisplayFormat = '#,0.###'
    end
    object ThgcDJ: TFloatField
      DisplayLabel = #21333#20215
      DisplayWidth = 10
      FieldName = 'DJ'
      DisplayFormat = '#,0.###'
    end
  end
  object sThgc: TDataSource
    DataSet = Thgc
    Left = 492
    Top = 214
  end
  object QtkcbdHpHelp: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select H.BH as aBH, H.PM as aPM, H.DW as aDW from HP H,QTKCBD Q ' +
      'where H.ID=Q.HPID'
    PacketRecords = 50
    Params = <>
    ProviderName = 'pTmp'
    RemoteServer = Cn
    Left = 466
    Top = 306
    object QtkcbdHpHelpaBH: TWideStringField
      DisplayLabel = #32534#21495
      FieldName = 'aBH'
    end
    object QtkcbdHpHelpaPM: TWideStringField
      DisplayLabel = #21697#21517
      FieldName = 'aPM'
      Size = 40
    end
    object QtkcbdHpHelpaDW: TWideStringField
      DisplayLabel = #21333#20301
      FieldName = 'aDW'
      Size = 4
    end
  end
  object sQtkcbdHpHelp: TDataSource
    DataSet = QtkcbdHpHelp
    Left = 474
    Top = 318
  end
  object CnBb: TDCOMConnection
    ServerGUID = '{129E7A02-80EC-11D4-927E-0000210072AB}'
    ServerName = 'JxcS.DatasBb'
    Left = 38
    Top = 6
  end
  object XsThgc: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select Z.DJBH,Z.RQ,Z.JE as ZJE,M.JE as BCJE from XSSKZB Z,XSSK M' +
      ' where Z.ID=M.ZBID'
    PacketRecords = 50
    Params = <>
    ProviderName = 'pTmp'
    RemoteServer = Cn
    Left = 340
    Top = 306
    object XsThgcRQ: TDateField
      Tag = 1
      DisplayLabel = #26085#26399
      FieldName = 'RQ'
    end
    object WideStringField2: TWideStringField
      DisplayLabel = #38144#21806#21333#21495
      FieldName = 'DJBH'
      Size = 12
    end
    object XsThgcBH: TWideStringField
      DisplayLabel = #36135#21697#32534#21495
      FieldName = 'BH'
    end
    object XsThgcPM: TWideStringField
      DisplayLabel = #21697#21517#35268#26684
      FieldName = 'PM'
      Size = 40
    end
    object XsThgcDW: TWideStringField
      DisplayLabel = #35745#37327#21333#20301
      FieldName = 'DW'
      Size = 4
    end
    object XsThgcSL: TFloatField
      DisplayLabel = #25968#37327
      FieldName = 'SL'
      DisplayFormat = '#,0.###'
    end
    object XsThgcDJ: TFloatField
      DisplayLabel = #21333#20215
      DisplayWidth = 10
      FieldName = 'DJ'
      DisplayFormat = '#,0.###'
    end
    object XsThgcNSL: TFloatField
      DisplayLabel = #31246#29575
      DisplayWidth = 4
      FieldName = 'NSL'
      OnGetText = NSLGetText
      DisplayFormat = '0.#'
    end
    object XsThgcJE: TFloatField
      DisplayLabel = #37329#39069
      DisplayWidth = 12
      FieldName = 'JE'
      DisplayFormat = '#,0.00'
    end
  end
  object sXsThgc: TDataSource
    DataSet = XsThgc
    Left = 348
    Top = 318
  end
end
