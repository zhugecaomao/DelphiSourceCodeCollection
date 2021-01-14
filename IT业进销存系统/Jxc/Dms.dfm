object Datas: TDatas
  OldCreateOrder = False
  OnCreate = RemoteDataModuleCreate
  Left = 267
  Top = 62
  Height = 460
  Width = 617
  object Tmpf: TADOQuery
    Connection = Cn
    CursorLocation = clUseServer
    Parameters = <>
    Left = 404
    Top = 14
  end
  object Cn: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=D:\Jx' +
      'c\Data.mdb;Mode=Share Deny None;Extended Properties="";Persist S' +
      'ecurity Info=False;Jet OLEDB:System database="";Jet OLEDB:Regist' +
      'ry Path="";Jet OLEDB:Database Password="";Jet OLEDB:Engine Type=' +
      '4;Jet OLEDB:Database Locking Mode=0;Jet OLEDB:Global Partial Bul' +
      'k Ops=2;Jet OLEDB:Global Bulk Transactions=1;Jet OLEDB:New Datab' +
      'ase Password="";Jet OLEDB:Create System Database=False;Jet OLEDB' +
      ':Encrypt Database=False;Jet OLEDB:Don'#39't Copy Locale on Compact=F' +
      'alse;Jet OLEDB:Compact Without Replica Repair=False;Jet OLEDB:SF' +
      'P=False'
    CursorLocation = clUseServer
    LoginPrompt = False
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    OnWillExecute = CnWillExecute
    Left = 18
    Top = 6
  end
  object AppUserGroup: TADOQuery
    Connection = Cn
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select * from AppUserGroup')
    Left = 152
    Top = 14
    object AppUserGroupgName: TStringField
      FieldName = 'gName'
    end
    object AppUserGroupgMemo: TStringField
      FieldName = 'gMemo'
      Size = 200
    end
  end
  object AppUser: TADOQuery
    Connection = Cn
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select * from appuser')
    Left = 194
    Top = 14
    object AppUserID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object AppUseruCode: TStringField
      FieldName = 'uCode'
      Size = 8
    end
    object AppUseruName: TStringField
      FieldName = 'uName'
    end
    object AppUseruPassword: TStringField
      FieldName = 'uPassword'
      Size = 8
    end
    object AppUsergName: TStringField
      FieldName = 'gName'
    end
  end
  object AppGroupDesktopClass: TADOQuery
    Connection = Cn
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select * from AppGroupDesktopClass')
    Left = 236
    Top = 14
    object AppGroupDesktopClassgName: TStringField
      FieldName = 'gName'
    end
    object AppGroupDesktopClasscName: TStringField
      FieldName = 'cName'
      Size = 30
    end
  end
  object Tmpl: TADOQuery
    Connection = Cn
    CursorLocation = clUseServer
    Parameters = <>
    Left = 446
    Top = 14
  end
  object Tmp: TADOQuery
    Connection = Cn
    CursorLocation = clUseServer
    Parameters = <>
    Left = 362
    Top = 14
  end
  object pAppUserGroup: TDataSetProvider
    DataSet = AppUserGroup
    Constraints = True
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 144
    Top = 6
  end
  object pAppUser: TDataSetProvider
    DataSet = AppUser
    Constraints = True
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    UpdateMode = upWhereChanged
    Left = 186
    Top = 6
  end
  object pAppGroupDesktopClass: TDataSetProvider
    DataSet = AppGroupDesktopClass
    Constraints = True
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 228
    Top = 6
  end
  object pTmp: TDataSetProvider
    DataSet = Tmp
    Constraints = True
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 354
    Top = 6
  end
  object pTmpf: TDataSetProvider
    DataSet = Tmpf
    Constraints = True
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 396
    Top = 6
  end
  object pTmpl: TDataSetProvider
    DataSet = Tmpl
    Constraints = True
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 438
    Top = 6
  end
  object AppSelect: TADOQuery
    Connection = Cn
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select * from Appselect')
    Left = 278
    Top = 14
    object AppSelectDATASET: TStringField
      FieldName = 'DATASET'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object AppSelectFIELDNAME: TStringField
      FieldName = 'FIELDNAME'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
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
  object Cn1: TADOConnection
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;User ID=Admin;Dat' +
      'a Source=AccessJxcDatabase'
    ConnectionTimeout = 60
    CursorLocation = clUseServer
    LoginPrompt = False
    Provider = 'MSDASQL.1'
    OnWillExecute = CnWillExecute
    Left = 60
    Top = 6
  end
  object AppLog: TADOQuery
    Connection = Cn
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select * from AppLog order by RQ desc,uName,SJ')
    Left = 320
    Top = 14
    object AppLoguName: TStringField
      FieldName = 'uName'
    end
    object AppLogcName: TStringField
      FieldName = 'cName'
    end
    object AppLogCZ: TStringField
      FieldName = 'CZ'
      Size = 30
    end
    object AppLogRQ: TDateField
      FieldName = 'RQ'
    end
    object AppLogSJ: TStringField
      FieldName = 'SJ'
      Size = 5
    end
  end
  object pAppLog: TDataSetProvider
    DataSet = AppLog
    Constraints = True
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 312
    Top = 6
  end
  object Dq: TADOQuery
    Connection = Cn
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select * from DQ')
    Left = 26
    Top = 70
    object DqID: TIntegerField
      FieldName = 'ID'
    end
    object DqMC: TStringField
      FieldName = 'MC'
      ProviderFlags = [pfInUpdate]
      Size = 12
    end
  end
  object pDq: TDataSetProvider
    DataSet = Dq
    Constraints = True
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 18
    Top = 66
  end
  object AppMenu: TADOQuery
    Connection = Cn
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select * from AppMenu')
    Left = 110
    Top = 14
    object AppMenumName: TStringField
      FieldName = 'mName'
      Size = 30
    end
    object AppMenumCaption: TStringField
      FieldName = 'mCaption'
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
  object pAppMenu: TDataSetProvider
    DataSet = AppMenu
    Constraints = True
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 102
    Top = 6
  end
  object Kh: TADOQuery
    Connection = Cn
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select K.*, D.MC as aDQMC, K.QMJE-K.YXJE as aSJJE '
      'from KH K inner join DQ D on K.DQID=D.ID '
      'order by K.BH')
    Left = 56
    Top = 70
    object KhID: TIntegerField
      FieldName = 'ID'
    end
    object KhBH: TStringField
      FieldName = 'BH'
      ProviderFlags = [pfInUpdate]
      Size = 12
    end
    object KhMC: TStringField
      FieldName = 'MC'
      ProviderFlags = [pfInUpdate]
    end
    object KhQC: TStringField
      FieldName = 'QC'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object KhDQID: TIntegerField
      FieldName = 'DQID'
      ProviderFlags = [pfInUpdate]
    end
    object KhaDQMC: TStringField
      FieldName = 'aDQMC'
      ProviderFlags = []
      Size = 12
    end
    object KhLXR: TStringField
      FieldName = 'LXR'
      ProviderFlags = [pfInUpdate]
      Size = 16
    end
    object KhDH: TStringField
      FieldName = 'DH'
      ProviderFlags = [pfInUpdate]
    end
    object KhCZ: TStringField
      FieldName = 'CZ'
      ProviderFlags = [pfInUpdate]
    end
    object KhDZ: TStringField
      FieldName = 'DZ'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object KhYB: TStringField
      FieldName = 'YB'
      ProviderFlags = [pfInUpdate]
      Size = 6
    end
    object KhWZ: TStringField
      FieldName = 'WZ'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object KhDY: TStringField
      FieldName = 'DY'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object KhKHYH: TStringField
      FieldName = 'KHYH'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object KhYHZH: TStringField
      FieldName = 'YHZH'
      ProviderFlags = [pfInUpdate]
    end
    object KhNSH: TStringField
      FieldName = 'NSH'
      ProviderFlags = [pfInUpdate]
    end
    object KhQCJE: TFloatField
      FieldName = 'QCJE'
      ProviderFlags = [pfInUpdate]
    end
    object KhYXJE: TFloatField
      FieldName = 'YXJE'
      ProviderFlags = [pfInUpdate]
    end
    object KhQMJE: TFloatField
      FieldName = 'QMJE'
      ProviderFlags = []
    end
    object KhaSJJE: TFloatField
      FieldName = 'aSJJE'
      ProviderFlags = []
    end
    object KhXYED: TFloatField
      FieldName = 'XYED'
      ProviderFlags = [pfInUpdate]
    end
    object KhZT: TBooleanField
      FieldName = 'ZT'
      ProviderFlags = [pfInUpdate]
    end
    object KhBZ: TStringField
      FieldName = 'BZ'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object KhITMP: TIntegerField
      FieldName = 'ITMP'
      ProviderFlags = [pfInUpdate]
    end
  end
  object pKh: TDataSetProvider
    DataSet = Kh
    Constraints = True
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 48
    Top = 66
  end
  object Gys: TADOQuery
    Connection = Cn
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select *,QMJE-YXJE as aSJJE from GYS G order by BH')
    Left = 86
    Top = 70
    object GysID: TIntegerField
      FieldName = 'ID'
    end
    object GysBH: TStringField
      FieldName = 'BH'
      ProviderFlags = [pfInUpdate]
      Size = 12
    end
    object GysMC: TStringField
      FieldName = 'MC'
      ProviderFlags = [pfInUpdate]
    end
    object GysQC: TStringField
      FieldName = 'QC'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object GysLXR: TStringField
      FieldName = 'LXR'
      ProviderFlags = [pfInUpdate]
      Size = 16
    end
    object GysDH: TStringField
      FieldName = 'DH'
      ProviderFlags = [pfInUpdate]
    end
    object GysCZ: TStringField
      FieldName = 'CZ'
      ProviderFlags = [pfInUpdate]
    end
    object GysDZ: TStringField
      FieldName = 'DZ'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object GysYB: TStringField
      FieldName = 'YB'
      ProviderFlags = [pfInUpdate]
      Size = 6
    end
    object GysWZ: TStringField
      FieldName = 'WZ'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object GysDY: TStringField
      FieldName = 'DY'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object GysKHYH: TStringField
      FieldName = 'KHYH'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object GysYHZH: TStringField
      FieldName = 'YHZH'
      ProviderFlags = [pfInUpdate]
    end
    object GysNSH: TStringField
      FieldName = 'NSH'
      ProviderFlags = [pfInUpdate]
    end
    object GysQCJE: TFloatField
      FieldName = 'QCJE'
      ProviderFlags = [pfInUpdate]
    end
    object GysYXJE: TFloatField
      FieldName = 'YXJE'
      ProviderFlags = [pfInUpdate]
    end
    object GysQMJE: TFloatField
      FieldName = 'QMJE'
      ProviderFlags = []
    end
    object GysaSJJE: TFloatField
      FieldName = 'aSJJE'
      ProviderFlags = []
    end
    object GysZT: TBooleanField
      FieldName = 'ZT'
      ProviderFlags = [pfInUpdate]
    end
    object GysBZ: TStringField
      FieldName = 'BZ'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object GysITMP: TIntegerField
      FieldName = 'ITMP'
      ProviderFlags = [pfInUpdate]
    end
  end
  object pGys: TDataSetProvider
    DataSet = Gys
    Constraints = True
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 78
    Top = 66
  end
  object Zh: TADOQuery
    Connection = Cn
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select *,iif(YHL,'#39#38134#34892#23384#27454#31867#39','#39#29616#37329#31867#39') as aYHL from ZH')
    Left = 116
    Top = 70
    object ZhID: TIntegerField
      FieldName = 'ID'
    end
    object ZhMC: TStringField
      FieldName = 'MC'
      ProviderFlags = [pfInUpdate]
    end
    object ZhYHL: TBooleanField
      FieldName = 'YHL'
      ProviderFlags = [pfInUpdate]
    end
    object ZhaYHL: TStringField
      DisplayWidth = 10
      FieldName = 'aYHL'
      ProviderFlags = []
      Size = 255
    end
    object ZhKHYH: TStringField
      FieldName = 'KHYH'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object ZhYHZH: TStringField
      FieldName = 'YHZH'
      ProviderFlags = [pfInUpdate]
    end
    object ZhQCJE: TFloatField
      FieldName = 'QCJE'
      ProviderFlags = [pfInUpdate]
    end
    object ZhQMJE: TFloatField
      FieldName = 'QMJE'
      ProviderFlags = []
    end
    object ZhITMP: TIntegerField
      FieldName = 'ITMP'
      ProviderFlags = [pfInUpdate]
    end
  end
  object pZh: TDataSetProvider
    DataSet = Zh
    Constraints = True
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 108
    Top = 66
  end
  object Sfkfs: TADOQuery
    Connection = Cn
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select S.*, Z.MC as aZHMC '
      'from SFKFS S left join ZH Z on S.ZHID=Z.ID '
      'order by S.ID')
    Left = 146
    Top = 70
    object SfkfsID: TIntegerField
      FieldName = 'ID'
    end
    object SfkfsMC: TStringField
      FieldName = 'MC'
      ProviderFlags = [pfInUpdate]
      Size = 16
    end
    object SfkfsZHID: TIntegerField
      FieldName = 'ZHID'
      ProviderFlags = [pfInUpdate]
    end
    object SfkfsaZHMC: TStringField
      FieldName = 'aZHMC'
      ProviderFlags = []
    end
  end
  object pSfkfs: TDataSetProvider
    DataSet = Sfkfs
    Constraints = True
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 138
    Top = 66
  end
  object Srzclb: TADOQuery
    Connection = Cn
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select *,iif(SRL,'#39#25910#20837#31867#39','#39#25903#20986#31867#39') as aSRL from SRZCLB order by BH')
    Left = 176
    Top = 70
    object SrzclbID: TIntegerField
      FieldName = 'ID'
    end
    object SrzclbBH: TStringField
      DisplayWidth = 6
      FieldName = 'BH'
      ProviderFlags = [pfInUpdate]
      Size = 6
    end
    object SrzclbMC: TStringField
      FieldName = 'MC'
      ProviderFlags = [pfInUpdate]
    end
    object SrzclbSRL: TBooleanField
      DisplayWidth = 6
      FieldName = 'SRL'
      ProviderFlags = [pfInUpdate]
    end
    object SrzclbaSRL: TStringField
      FieldName = 'aSRL'
      ProviderFlags = []
      Size = 255
    end
    object SrzclbBZ: TStringField
      FieldName = 'BZ'
      ProviderFlags = [pfInUpdate]
      Size = 32
    end
  end
  object pSrzclb: TDataSetProvider
    DataSet = Srzclb
    Constraints = True
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 168
    Top = 66
  end
  object Ck: TADOQuery
    Connection = Cn
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select * from CK order by XH')
    Left = 206
    Top = 70
    object CkID: TIntegerField
      FieldName = 'ID'
    end
    object CkXH: TIntegerField
      FieldName = 'XH'
      ProviderFlags = [pfInUpdate]
    end
    object CkMC: TStringField
      FieldName = 'MC'
      ProviderFlags = [pfInUpdate]
      Size = 16
    end
    object CkWZ: TStringField
      FieldName = 'WZ'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object CkBZ: TStringField
      FieldName = 'BZ'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
  end
  object pCk: TDataSetProvider
    DataSet = Ck
    Constraints = True
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 198
    Top = 66
  end
  object Hplb: TADOQuery
    Connection = Cn
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select * from HPLB')
    Left = 236
    Top = 70
    object HplbID: TIntegerField
      FieldName = 'ID'
    end
    object HplbMC: TStringField
      FieldName = 'MC'
      ProviderFlags = [pfInUpdate]
      Size = 16
    end
    object HplbBZ: TStringField
      FieldName = 'BZ'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
  end
  object pHplb: TDataSetProvider
    DataSet = Hplb
    Constraints = True
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 228
    Top = 66
  end
  object Cyjsdw: TADOQuery
    Connection = Cn
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select * from CYJSDW')
    Left = 296
    Top = 70
    object CyjsdwMC: TStringField
      FieldName = 'MC'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 8
    end
  end
  object pCyjsdw: TDataSetProvider
    DataSet = Cyjsdw
    Constraints = True
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 288
    Top = 66
  end
  object Hphsff: TADOQuery
    Connection = Cn
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select * from HPHSFF')
    Left = 326
    Top = 70
    object HphsffID: TIntegerField
      FieldName = 'ID'
    end
    object HphsffMC: TStringField
      FieldName = 'MC'
      ProviderFlags = [pfInUpdate]
    end
    object HphsffLB: TIntegerField
      FieldName = 'LB'
      ProviderFlags = [pfInUpdate]
    end
  end
  object pHphsff: TDataSetProvider
    DataSet = Hphsff
    Constraints = True
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 318
    Top = 66
  end
  object Bm: TADOQuery
    Connection = Cn
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select * from BM')
    Left = 69
    Top = 118
    object BmID: TIntegerField
      FieldName = 'ID'
    end
    object BmMC: TStringField
      DisplayWidth = 16
      FieldName = 'MC'
      ProviderFlags = [pfInUpdate]
      Size = 12
    end
  end
  object pBm: TDataSetProvider
    DataSet = Bm
    Constraints = True
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 61
    Top = 114
  end
  object Yglb: TADOQuery
    Connection = Cn
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select * from YGLB')
    Left = 111
    Top = 118
    object YglbID: TIntegerField
      FieldName = 'ID'
    end
    object YglbMC: TStringField
      DisplayWidth = 16
      FieldName = 'MC'
      ProviderFlags = [pfInUpdate]
      Size = 32
    end
  end
  object pYglb: TDataSetProvider
    DataSet = Yglb
    Constraints = True
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 103
    Top = 114
  end
  object Yg: TADOQuery
    Connection = Cn
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select Y.*,B.MC as aBMMC,L.MC as aYGLBMC,'
      'iif(YWYBZ,'#39#26159#39','#39#21542#39') as aYWYBZ,'
      'switch(JSFF=1,'#39#26376#34218#39',JSFF=2,'#39#35745#20214#39') as aJSFF,'
      'iif(LZ,'#39#26159#39','#39#21542#39') as aLZ '
      'from YG Y,BM B,YGLB L,'
      'Y left join B on Y.BMID = B.ID,'
      'Y left join L on Y.YGLBID = L.ID'
      'order by BH')
    Left = 153
    Top = 118
    object YgID: TIntegerField
      FieldName = 'ID'
    end
    object YgBH: TStringField
      FieldName = 'BH'
      ProviderFlags = [pfInUpdate]
      Size = 4
    end
    object YgXM: TStringField
      FieldName = 'XM'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object YgXB: TStringField
      FieldName = 'XB'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object YgBMID: TIntegerField
      FieldName = 'BMID'
      ProviderFlags = [pfInUpdate]
    end
    object YgaBMMC: TStringField
      FieldName = 'aBMMC'
      ProviderFlags = []
      Size = 16
    end
    object YgYGLBID: TIntegerField
      FieldName = 'YGLBID'
      ProviderFlags = [pfInUpdate]
    end
    object YgaYGLBMC: TStringField
      FieldName = 'aYGLBMC'
      ProviderFlags = []
      Size = 16
    end
    object YgZW: TStringField
      FieldName = 'ZW'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object YgCSRQ: TDateField
      FieldName = 'CSRQ'
      ProviderFlags = [pfInUpdate]
    end
    object YgXL: TStringField
      FieldName = 'XL'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object YgDH: TStringField
      FieldName = 'DH'
      ProviderFlags = [pfInUpdate]
    end
    object YgBP: TStringField
      FieldName = 'BP'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object YgZZ: TStringField
      FieldName = 'ZZ'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object YgSFZH: TStringField
      FieldName = 'SFZH'
      ProviderFlags = [pfInUpdate]
      Size = 18
    end
    object YgJG: TStringField
      FieldName = 'JG'
      ProviderFlags = [pfInUpdate]
    end
    object YgYB: TStringField
      FieldName = 'YB'
      ProviderFlags = [pfInUpdate]
      Size = 6
    end
    object YgRZRQ: TDateField
      FieldName = 'RZRQ'
      ProviderFlags = [pfInUpdate]
    end
    object YgJSFF: TIntegerField
      FieldName = 'JSFF'
      ProviderFlags = [pfInUpdate]
    end
    object YgaJSFF: TStringField
      FieldName = 'aJSFF'
      ProviderFlags = []
      Size = 255
    end
    object YgJBGZ: TFloatField
      FieldName = 'JBGZ'
      ProviderFlags = [pfInUpdate]
    end
    object YgLZ: TBooleanField
      FieldName = 'LZ'
      ProviderFlags = [pfInUpdate]
    end
    object YgaYWYBZ: TStringField
      FieldName = 'aYWYBZ'
      ProviderFlags = []
      Size = 255
    end
    object YgYWYBZ: TBooleanField
      FieldName = 'YWYBZ'
      ProviderFlags = [pfInUpdate]
    end
    object YgaLZ: TStringField
      FieldName = 'aLZ'
      ProviderFlags = []
      Size = 255
    end
    object YgBZ: TStringField
      DisplayWidth = 40
      FieldName = 'BZ'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
  end
  object pYg: TDataSetProvider
    DataSet = Yg
    Constraints = True
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 145
    Top = 114
  end
  object Hp: TADOQuery
    Connection = Cn
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select H.*,'
      '(select ID from HP where HP.ID=H.ID) as Tmp, '
      '(select sum(JCS) from HPKC where HPID=H.ID) as aZKCL,'
      'iif(XZBZ,'#39#26159#39','#39#21542#39') as aXZBZ,iif(ZT,'#39#26159#39','#39#21542#39') as aZT,'
      'switch(HPSXID=1,'#39#24211#23384#21830#21697#39', HPSXID=2,'#39#26381#21153'/'#21171#21153#39', '
      'HPSXID=3,'#39#20854#23427#25910#20837#39', HPSXID=4,'#39#20854#23427#25903#20986#39', '
      'HPSXID=5,'#39#25240#25187#39') as aHPSX,'
      'L.MC as aHPLBMC '
      'from HP H inner join HPLB L on H.HPLBID=L.ID'
      'order by BH')
    Left = 360
    Top = 70
    object HpID: TIntegerField
      FieldName = 'ID'
    end
    object HpBH: TStringField
      FieldName = 'BH'
      ProviderFlags = [pfInUpdate]
    end
    object HpHPLBID: TIntegerField
      FieldName = 'HPLBID'
      ProviderFlags = [pfInUpdate]
    end
    object HpaHPLBMC: TStringField
      FieldName = 'aHPLBMC'
      ProviderFlags = []
      Size = 16
    end
    object HpPM: TStringField
      FieldName = 'PM'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object HpDW: TStringField
      FieldName = 'DW'
      ProviderFlags = [pfInUpdate]
      Size = 4
    end
    object HpHPHSFFID: TIntegerField
      FieldName = 'HPHSFFID'
      ProviderFlags = [pfInUpdate]
    end
    object HpHPSXID: TIntegerField
      FieldName = 'HPSXID'
      ProviderFlags = [pfInUpdate]
    end
    object HpaHPSX: TStringField
      DisplayWidth = 10
      FieldName = 'aHPSX'
      ProviderFlags = []
      Size = 255
    end
    object HpaZKCL: TFloatField
      FieldName = 'aZKCL'
      ProviderFlags = []
    end
    object HpJJ: TFloatField
      FieldName = 'JJ'
      ProviderFlags = [pfInUpdate]
    end
    object HpJJJ: TFloatField
      FieldName = 'JJJ'
      ProviderFlags = [pfInUpdate]
    end
    object HpJQJ: TFloatField
      FieldName = 'JQJ'
      ProviderFlags = [pfInUpdate]
    end
    object HpQCJQJ: TFloatField
      FieldName = 'QCJQJ'
      ProviderFlags = [pfInUpdate]
    end
    object HpQCJE: TFloatField
      FieldName = 'QCJE'
      ProviderFlags = [pfInUpdate]
    end
    object HpSX: TFloatField
      FieldName = 'SX'
      ProviderFlags = [pfInUpdate]
    end
    object HpXX: TFloatField
      FieldName = 'XX'
      ProviderFlags = [pfInUpdate]
    end
    object HpZT: TBooleanField
      FieldName = 'ZT'
      ProviderFlags = [pfInUpdate]
    end
    object HpaZT: TStringField
      DisplayWidth = 2
      FieldName = 'aZT'
      ProviderFlags = []
      Size = 255
    end
    object HpITMP: TIntegerField
      FieldName = 'ITMP'
    end
  end
  object pHp: TDataSetProvider
    DataSet = Hp
    Constraints = True
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 352
    Top = 66
  end
  object Qtkcbdlx: TADOQuery
    Connection = Cn
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select * from QTKCBDLX')
    Left = 27
    Top = 118
    object QtkcbdlxID: TIntegerField
      FieldName = 'ID'
    end
    object QtkcbdlxMC: TStringField
      FieldName = 'MC'
      ProviderFlags = [pfInUpdate]
    end
    object QtkcbdlxRKL: TBooleanField
      FieldName = 'RKL'
      ProviderFlags = [pfInUpdate]
    end
    object QtkcbdlxTHBZ: TBooleanField
      FieldName = 'THBZ'
      ProviderFlags = [pfInUpdate]
    end
  end
  object pQtkcbdlx: TDataSetProvider
    DataSet = Qtkcbdlx
    Constraints = True
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 19
    Top = 114
  end
  object HpCkXx: TADOQuery
    Connection = Cn
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select MC,JCS from CK,HPKC')
    Left = 390
    Top = 70
    object HpCkXxMC: TStringField
      FieldName = 'MC'
      Size = 16
    end
    object HpCkXxJCS: TFloatField
      FieldName = 'JCS'
    end
  end
  object pHpCkXx: TDataSetProvider
    DataSet = HpCkXx
    Constraints = True
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 382
    Top = 66
  end
  object HpSjXx: TADOQuery
    Connection = Cn
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select MC,SJ from SJZL,HPSJ')
    Left = 420
    Top = 70
    object HpSjXxMC: TStringField
      FieldName = 'MC'
      Size = 16
    end
    object HpSjXxSJ: TFloatField
      FieldName = 'SJ'
    end
  end
  object pHpSjXx: TDataSetProvider
    DataSet = HpSjXx
    Constraints = True
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 412
    Top = 66
  end
  object Hpkc: TADOQuery
    Connection = Cn
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select * from HPKC')
    Left = 450
    Top = 70
    object HpkcCKID: TIntegerField
      FieldName = 'CKID'
    end
    object HpkcHPID: TIntegerField
      FieldName = 'HPID'
    end
    object HpkcQCS: TFloatField
      FieldName = 'QCS'
      ProviderFlags = [pfInUpdate]
    end
    object HpkcJCS: TFloatField
      FieldName = 'JCS'
      ProviderFlags = [pfInUpdate]
    end
  end
  object pHpkc: TDataSetProvider
    DataSet = Hpkc
    Constraints = True
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 442
    Top = 66
  end
  object Hpsj: TADOQuery
    Connection = Cn
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select * from HPSJ')
    Left = 480
    Top = 70
    object HpsjSJZLID: TIntegerField
      FieldName = 'SJZLID'
    end
    object HpsjHPID: TIntegerField
      FieldName = 'HPID'
    end
    object HpsjSJ: TFloatField
      FieldName = 'SJ'
      ProviderFlags = [pfInUpdate]
    end
  end
  object pHpsj: TDataSetProvider
    DataSet = Hpsj
    Constraints = True
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 472
    Top = 66
  end
  object Cgddzb: TADOQuery
    Connection = Cn
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select Z.*,iif(Z.ZT,'#39#26159#39','#39#21542#39') as aZT,'
      'K.BH as aGYSBH, K.MC as aGYSMC '
      'from CGDDZB Z,GYS K,Z inner join K on Z.GYSID = K.ID '
      'order by Z.DJBH')
    Left = 22
    Top = 166
    object CgddzbID: TIntegerField
      FieldName = 'ID'
    end
    object CgddzbDJBH: TStringField
      FieldName = 'DJBH'
      ProviderFlags = [pfInUpdate]
      Size = 12
    end
    object CgddzbRQ: TDateField
      FieldName = 'RQ'
      ProviderFlags = [pfInUpdate]
    end
    object CgddzbGYSID: TIntegerField
      FieldName = 'GYSID'
      ProviderFlags = [pfInUpdate]
    end
    object CgddzbaGYSBH: TStringField
      FieldName = 'aGYSBH'
      ProviderFlags = []
      Size = 12
    end
    object CgddzbaGYSMC: TStringField
      FieldName = 'aGYSMC'
      ProviderFlags = []
    end
    object CgddzbJHRQ: TDateField
      FieldName = 'JHRQ'
      ProviderFlags = [pfInUpdate]
    end
    object CgddzbJHDD: TStringField
      FieldName = 'JHDD'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object CgddzbYWY: TStringField
      FieldName = 'YWY'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object CgddzbJE: TFloatField
      FieldName = 'JE'
      ProviderFlags = [pfInUpdate]
    end
    object CgddzbZT: TBooleanField
      FieldName = 'ZT'
      ProviderFlags = [pfInUpdate]
    end
    object CgddzbaZT: TStringField
      FieldName = 'aZT'
      ProviderFlags = []
      ReadOnly = True
      Size = 255
    end
    object CgddzbBZ: TStringField
      FieldName = 'BZ'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object CgddzbCZY: TStringField
      FieldName = 'CZY'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
  end
  object pCgddzb: TDataSetProvider
    DataSet = Cgddzb
    Constraints = True
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 14
    Top = 158
  end
  object Cgdd: TADOQuery
    Connection = Cn
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      
        'select M.*,(select HH from CGDD where CGDD.ZBID=M.ZBID and CGDD.' +
        'HH=M.HH) as TMP,'
      'SL AS aSHSL,iif(M.SL>aSHSL,M.SL-aSHSL,0) as aMSSL, '
      'H.BH as aBH, H.PM as aPM, H.DW as aDW '
      'from CGDD M, HP H, M inner join H on M.HPID=H.ID')
    Left = 56
    Top = 166
    object CgddZBID2: TIntegerField
      FieldName = 'ZBID'
    end
    object CgddHH: TIntegerField
      FieldName = 'HH'
    end
    object CgddRQ: TDateField
      FieldName = 'RQ'
      ProviderFlags = [pfInUpdate]
    end
    object CgddHPID: TIntegerField
      FieldName = 'HPID'
      ProviderFlags = [pfInUpdate]
    end
    object CgddaBH: TStringField
      FieldName = 'aBH'
      ProviderFlags = []
    end
    object CgddaPM: TStringField
      FieldName = 'aPM'
      ProviderFlags = []
      Size = 40
    end
    object CgddaDW: TStringField
      FieldName = 'aDW'
      ProviderFlags = []
      Size = 4
    end
    object CgddSL: TFloatField
      FieldName = 'SL'
      ProviderFlags = [pfInUpdate]
    end
    object CgddDJ: TFloatField
      FieldName = 'DJ'
      ProviderFlags = [pfInUpdate]
    end
    object CgddNSL: TFloatField
      FieldName = 'NSL'
      ProviderFlags = [pfInUpdate]
    end
    object CgddaSHSL: TFloatField
      FieldName = 'aSHSL'
      ProviderFlags = []
    end
    object CgddaMSSL: TFloatField
      FieldName = 'aMSSL'
      ProviderFlags = []
    end
  end
  object pCgdd: TDataSetProvider
    DataSet = Cgdd
    Constraints = True
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 48
    Top = 158
  end
  object pAppSelect: TDataSetProvider
    DataSet = AppSelect
    Constraints = True
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 270
    Top = 6
  end
  object Cgshzb: TADOQuery
    Connection = Cn
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select Z.*,'
      'switch(CGLX=1,'#39#29616#27454#39', CGLX=2,'#39#35760#24080#39') as aCGLX,'
      'switch(FPLX=1,'#39#25910#25454#39', FPLX=2,'#39#26222#36890#21457#31080#39',FPLX=3,'#39#22686#20540#31246#21457#31080#39') as aFPLX,'
      'K.BH as aGYSBH, K.MC as aGYSMC,'
      'C.MC as aCKMC,'
      'S.MC as aSFKFSMC, H.MC as aZHMC'
      'from CGSHZB Z,GYS K,CK C, SFKFS S, ZH H,'
      'Z inner join K on Z.GYSID = K.ID,'
      'Z inner join C on Z.CKID = C.ID,'
      'Z left join S on Z.SFKFSID = S.ID,'
      'Z left join H on Z.ZHID = H.ID'
      'order by Z.DJBH'
      '')
    Left = 86
    Top = 166
    object CgshzbID: TIntegerField
      FieldName = 'ID'
    end
    object CgshzbDJBH: TStringField
      FieldName = 'DJBH'
      ProviderFlags = [pfInUpdate]
      Size = 12
    end
    object CgshzbRQ: TDateField
      FieldName = 'RQ'
      ProviderFlags = [pfInUpdate]
    end
    object CgshzbGYSID: TIntegerField
      FieldName = 'GYSID'
      ProviderFlags = [pfInUpdate]
    end
    object CgshzbaGYSBH: TStringField
      FieldName = 'aGYSBH'
      ProviderFlags = []
      Size = 12
    end
    object CgshzbaGYSMC: TStringField
      FieldName = 'aGYSMC'
      ProviderFlags = []
    end
    object CgshzbCKID: TIntegerField
      FieldName = 'CKID'
      ProviderFlags = [pfInUpdate]
    end
    object CgshzbaCKMC: TStringField
      FieldName = 'aCKMC'
      ProviderFlags = []
      Size = 16
    end
    object CgshzbXSLX: TIntegerField
      FieldName = 'CGLX'
      ProviderFlags = [pfInUpdate]
    end
    object CgshzbaXSLX: TStringField
      DisplayWidth = 4
      FieldName = 'aCGLX'
      ProviderFlags = []
      Size = 255
    end
    object CgshzbSFKFSID: TSmallintField
      FieldName = 'SFKFSID'
      ProviderFlags = [pfInUpdate]
    end
    object CgshzbaSFKFSMC: TStringField
      FieldName = 'aSFKFSMC'
      ProviderFlags = []
      Size = 16
    end
    object CgshzbZHID: TSmallintField
      FieldName = 'ZHID'
      ProviderFlags = [pfInUpdate]
    end
    object CgshzbaZHMC: TStringField
      FieldName = 'aZHMC'
      ProviderFlags = []
    end
    object CgshzbPH: TStringField
      FieldName = 'PH'
      ProviderFlags = [pfInUpdate]
    end
    object CgshzbSKQX: TIntegerField
      FieldName = 'FKQX'
      ProviderFlags = [pfInUpdate]
    end
    object CgshzbFPLX: TIntegerField
      FieldName = 'FPLX'
      ProviderFlags = [pfInUpdate]
    end
    object CgshzbaFPLX: TStringField
      FieldName = 'aFPLX'
      ProviderFlags = []
      Size = 255
    end
    object CgshzbYWY: TStringField
      FieldName = 'YWY'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object CgshzbJE: TFloatField
      FieldName = 'JE'
      ProviderFlags = [pfInUpdate]
    end
    object CgshzbYFJE3: TFloatField
      FieldName = 'YFJE'
      ProviderFlags = [pfInUpdate]
    end
    object CgshzbYFJE2: TFloatField
      FieldName = 'YFJE1'
      ProviderFlags = []
    end
    object CgshzbYFJE: TFloatField
      FieldName = 'MFJE'
      ProviderFlags = []
    end
    object CgshzbBZ: TStringField
      FieldName = 'BZ'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object CgshzbCZY: TStringField
      FieldName = 'CZY'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
  end
  object Cgsh: TADOQuery
    Connection = Cn
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select M.*,'
      'H.BH as aBH, H.PM as aPM, H.DW as aDW '
      'from CGSH M, HP H, M inner join H on M.HPID=H.ID')
    Left = 116
    Top = 166
    object CgshZBID2: TIntegerField
      FieldName = 'ZBID'
    end
    object CgshHH: TIntegerField
      FieldName = 'HH'
    end
    object CgshRQ: TDateField
      FieldName = 'RQ'
      ProviderFlags = [pfInUpdate]
    end
    object CgshCKID: TIntegerField
      FieldName = 'CKID'
      ProviderFlags = [pfInUpdate]
    end
    object CgshHPID: TIntegerField
      FieldName = 'HPID'
      ProviderFlags = [pfInUpdate]
    end
    object CgshaBH: TStringField
      FieldName = 'aBH'
      ProviderFlags = []
    end
    object CgshaPM: TStringField
      FieldName = 'aPM'
      ProviderFlags = []
      Size = 40
    end
    object CgshaDW: TStringField
      FieldName = 'aDW'
      ProviderFlags = []
      Size = 4
    end
    object CgshSL: TFloatField
      FieldName = 'SL'
      ProviderFlags = [pfInUpdate]
    end
    object CgshDJ: TFloatField
      FieldName = 'DJ'
      ProviderFlags = [pfInUpdate]
    end
    object CgshNSL: TFloatField
      FieldName = 'NSL'
      ProviderFlags = [pfInUpdate]
    end
    object CgshDDID: TIntegerField
      FieldName = 'DDID'
      ProviderFlags = [pfInUpdate]
    end
  end
  object CgddHelp: TADOQuery
    Connection = Cn
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select Z.ID, Z.DJBH, Z.RQ, Z.JE, Z.JHRQ, '
      'G.BH AS aGYSBH, G.MC AS aGYSMC'
      'from CGDDZB Z,GYS G,Z inner join G on Z.GYSID=G.ID'
      'where not Z.ZT '
      'order by Z.DJBH;')
    Left = 34
    Top = 322
    object CgddHelpID: TIntegerField
      FieldName = 'ID'
    end
    object CgddHelpDJBH: TStringField
      FieldName = 'DJBH'
      Size = 12
    end
    object CgddHelpRQ: TDateField
      FieldName = 'RQ'
    end
    object CgddHelpJE: TFloatField
      FieldName = 'JE'
    end
    object CgddHelpJHRQ: TDateField
      FieldName = 'JHRQ'
    end
    object CgddHelpaGYSBH: TStringField
      FieldName = 'aGYSBH'
      Size = 12
    end
    object CgddHelpaGYSMC: TStringField
      FieldName = 'aGYSMC'
    end
  end
  object pCgshzb: TDataSetProvider
    DataSet = Cgshzb
    Constraints = True
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 78
    Top = 158
  end
  object pCgsh: TDataSetProvider
    DataSet = Cgsh
    Constraints = True
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 108
    Top = 158
  end
  object pCgddHelp: TDataSetProvider
    DataSet = CgddHelp
    Constraints = True
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 26
    Top = 314
  end
  object Cgfkzb: TADOQuery
    Connection = Cn
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select Z.*,'
      'switch(FKLX=1,'#39#24212#20184#27454#39', FKLX=2,'#39#39044#20184#27454#39') as aFKLX,'
      'K.BH as aGYSBH, K.MC as aGYSMC,'
      'S.MC as aSFKFSMC, H.MC as aZHMC '
      'from CGFKZB Z, GYS K, SFKFS S, ZH H, '
      'Z inner join K on Z.GYSID = K.ID,'
      'Z inner join S on Z.SFKFSID = S.ID, '
      'Z inner join H on Z.ZHID = H.ID '
      'order by Z.DJBH')
    Left = 146
    Top = 166
    object CgfkzbID: TIntegerField
      FieldName = 'ID'
    end
    object CgfkzbDJBH: TStringField
      FieldName = 'DJBH'
      ProviderFlags = [pfInUpdate]
      Size = 12
    end
    object CgfkzbRQ: TDateField
      FieldName = 'RQ'
      ProviderFlags = [pfInUpdate]
    end
    object CgfkzbGYSID: TIntegerField
      FieldName = 'GYSID'
      ProviderFlags = [pfInUpdate]
    end
    object CgfkzbaGYSBH: TStringField
      FieldName = 'aGYSBH'
      ProviderFlags = []
      Size = 12
    end
    object CgfkzbaGYSMC: TStringField
      FieldName = 'aGYSMC'
      ProviderFlags = []
    end
    object CgfkzbFKLX: TIntegerField
      FieldName = 'FKLX'
      ProviderFlags = [pfInUpdate]
    end
    object CgfkzbaFKLX: TStringField
      FieldName = 'aFKLX'
      ProviderFlags = []
      Size = 255
    end
    object CgfkzbSFKFSID: TSmallintField
      FieldName = 'SFKFSID'
      ProviderFlags = [pfInUpdate]
    end
    object CgfkzbaSFKFSMC: TStringField
      FieldName = 'aSFKFSMC'
      ProviderFlags = []
      Size = 16
    end
    object CgfkzbZHID: TSmallintField
      FieldName = 'ZHID'
      ProviderFlags = [pfInUpdate]
    end
    object CgfkzbaZHMC: TStringField
      FieldName = 'aZHMC'
      ProviderFlags = []
    end
    object CgfkzbPH: TStringField
      FieldName = 'PH'
      ProviderFlags = [pfInUpdate]
    end
    object CgfkzbSYJY: TBooleanField
      FieldName = 'SYJY'
    end
    object CgfkzbJE: TFloatField
      FieldName = 'JE'
      ProviderFlags = [pfInUpdate]
    end
    object CgfkzbJEA: TFloatField
      FieldName = 'JEA'
      ProviderFlags = [pfInUpdate]
    end
    object CgfkzbJEB: TFloatField
      FieldName = 'JEB'
      ProviderFlags = [pfInUpdate]
    end
    object CgfkzbBZ: TStringField
      FieldName = 'BZ'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object CgfkzbCZY: TStringField
      FieldName = 'CZY'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
  end
  object pCgfkzb: TDataSetProvider
    DataSet = Cgfkzb
    Constraints = True
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 138
    Top = 158
  end
  object Cgfk: TADOQuery
    AutoCalcFields = False
    Connection = Cn
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select M.*,'
      'D.DJBH as aDDBH, D.RQ as aDDRQ, D.JE as aDDJE, '
      'D.YFJE as aYFJE, D.JE - D.YFJE as aMFJE '
      'from CGFK M, CGSHZB D, M inner join D on M.DDID=D.ID')
    Left = 176
    Top = 166
    object CgfkZBID2: TIntegerField
      FieldName = 'ZBID'
    end
    object CgfkHH: TIntegerField
      FieldName = 'HH'
    end
    object CgfkRQ: TDateField
      FieldName = 'RQ'
      ProviderFlags = [pfInUpdate]
    end
    object CgfkDDID: TIntegerField
      FieldName = 'DDID'
      ProviderFlags = [pfInUpdate]
    end
    object CgfkaDDBH: TStringField
      FieldName = 'aDDBH'
      ProviderFlags = []
      Size = 12
    end
    object CgfkaDDRQ: TDateField
      FieldName = 'aDDRQ'
      ProviderFlags = []
    end
    object CgfkaDDJE: TFloatField
      FieldName = 'aDDJE'
      ProviderFlags = []
    end
    object CgfkaYFJE: TFloatField
      FieldName = 'aYFJE'
      ProviderFlags = []
    end
    object CgfkaMFJE: TFloatField
      FieldName = 'aMFJE'
      ProviderFlags = []
    end
    object CgfkJE: TFloatField
      FieldName = 'JE'
      ProviderFlags = [pfInUpdate]
    end
  end
  object pCgfk: TDataSetProvider
    DataSet = Cgfk
    Constraints = True
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 168
    Top = 158
  end
  object ADOQuery3: TADOQuery
    Connection = Cn1
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select * from ')
    Left = 486
    Top = 14
  end
  object DataSetProvider3: TDataSetProvider
    DataSet = ADOQuery3
    Constraints = True
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 478
    Top = 6
  end
  object Cgthzb: TADOQuery
    Connection = Cn
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select Z.*,'
      'switch(THLX=1,'#39#20379#24212#21830#36864#29616#27454#39', THLX=2,'#39#36864#27454#36716#20837#39044#20184#27454#39') as aTHLX,'
      'K.BH as aGYSBH, K.MC as aGYSMC,'
      'C.MC as aCKMC,S.MC as aSFKFSMC, H.MC as aZHMC '
      'from CGTHZB Z,GYS K,CK C,SFKFS S,ZH H,'
      'Z inner join K on Z.GYSID = K.ID, '
      'Z inner join C on Z.CKID = C.ID,'
      'Z inner join S on Z.SFKFSID = S.ID, '
      'Z inner join H on Z.ZHID = H.ID '
      'order by Z.DJBH')
    Left = 206
    Top = 166
    object CgthzbID: TIntegerField
      FieldName = 'ID'
    end
    object CgthzbDJBH: TStringField
      FieldName = 'DJBH'
      ProviderFlags = [pfInUpdate]
      Size = 12
    end
    object CgthzbRQ: TDateField
      FieldName = 'RQ'
      ProviderFlags = [pfInUpdate]
    end
    object CgthzbGYSID: TIntegerField
      FieldName = 'GYSID'
      ProviderFlags = [pfInUpdate]
    end
    object CgthzbaGYSBH: TStringField
      FieldName = 'aGYSBH'
      ProviderFlags = []
      Size = 12
    end
    object CgthzbaGYSMC: TStringField
      FieldName = 'aGYSMC'
      ProviderFlags = []
    end
    object CgthzbCKID: TIntegerField
      FieldName = 'CKID'
      ProviderFlags = [pfInUpdate]
    end
    object CgthzbaCKMC: TStringField
      FieldName = 'aCKMC'
      ProviderFlags = []
      Size = 16
    end
    object CgthzbTHLX: TIntegerField
      FieldName = 'THLX'
      ProviderFlags = [pfInUpdate]
    end
    object CgthzbaTHLX: TStringField
      FieldName = 'aTHLX'
      ProviderFlags = []
      Size = 16
    end
    object CgthzbSFKFSID: TSmallintField
      FieldName = 'SFKFSID'
      ProviderFlags = [pfInUpdate]
    end
    object CgthzbaSFKFSMC: TStringField
      FieldName = 'aSFKFSMC'
      ProviderFlags = []
      Size = 16
    end
    object CgthzbZHID: TSmallintField
      FieldName = 'ZHID'
      ProviderFlags = [pfInUpdate]
    end
    object CgthzbaZHMC: TStringField
      FieldName = 'aZHMC'
      ProviderFlags = []
    end
    object CgthzbPH: TStringField
      FieldName = 'PH'
      ProviderFlags = [pfInUpdate]
    end
    object CgthzbYWY: TStringField
      FieldName = 'YWY'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object CgthzbJE: TFloatField
      FieldName = 'JE'
      ProviderFlags = [pfInUpdate]
    end
    object CgthzbBZ: TStringField
      FieldName = 'BZ'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object CgthzbCZY: TStringField
      FieldName = 'CZY'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
  end
  object Cgth: TADOQuery
    Connection = Cn
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select M.*,'
      'H.BH as aBH, H.PM as aPM, H.DW as aDW '
      'from CGTH M, HP H, M inner join H on M.HPID=H.ID')
    Left = 236
    Top = 166
    object CgthZBID2: TIntegerField
      FieldName = 'ZBID'
    end
    object CgthHH: TIntegerField
      FieldName = 'HH'
    end
    object CgthRQ: TDateField
      FieldName = 'RQ'
      ProviderFlags = [pfInUpdate]
    end
    object CgthCKID: TIntegerField
      FieldName = 'CKID'
      ProviderFlags = [pfInUpdate]
    end
    object CgthHPID: TIntegerField
      FieldName = 'HPID'
      ProviderFlags = [pfInUpdate]
    end
    object CgthaBH: TStringField
      FieldName = 'aBH'
      ProviderFlags = []
    end
    object CgthaPM: TStringField
      FieldName = 'aPM'
      ProviderFlags = []
      Size = 40
    end
    object CgthaDW: TStringField
      FieldName = 'aDW'
      ProviderFlags = []
      Size = 4
    end
    object CgthSL: TFloatField
      FieldName = 'SL'
      ProviderFlags = [pfInUpdate]
    end
    object CgthDJ: TFloatField
      FieldName = 'DJ'
      ProviderFlags = [pfInUpdate]
    end
    object CgthNSL: TFloatField
      FieldName = 'NSL'
      ProviderFlags = [pfInUpdate]
    end
  end
  object pCgthzb: TDataSetProvider
    DataSet = Cgthzb
    Constraints = True
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 198
    Top = 158
  end
  object pCgth: TDataSetProvider
    DataSet = Cgth
    Constraints = True
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 228
    Top = 158
  end
  object Xsddzb: TADOQuery
    Connection = Cn
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select Z.*,iif(Z.ZT,'#39#26159#39','#39#21542#39') as aZT,'
      'K.BH as aKHBH, K.MC as aKHMC '
      'from CGDDZB Z,KH K,Z inner join K on Z.GYSID = K.ID '
      'order by Z.DJBH')
    Left = 266
    Top = 166
    object XsddzbID: TIntegerField
      FieldName = 'ID'
    end
    object XsddzbDJBH: TStringField
      FieldName = 'DJBH'
      ProviderFlags = [pfInUpdate]
      Size = 12
    end
    object XsddzbRQ: TDateField
      FieldName = 'RQ'
      ProviderFlags = [pfInUpdate]
    end
    object XsddzbGYSID: TIntegerField
      FieldName = 'KHID'
      ProviderFlags = [pfInUpdate]
    end
    object XsddzbaKHBH: TStringField
      FieldName = 'aKHBH'
      ProviderFlags = []
      Size = 12
    end
    object XsddzbaKHMC: TStringField
      FieldName = 'aKHMC'
      ProviderFlags = []
    end
    object XsddzbJHRQ: TDateField
      FieldName = 'JHRQ'
      ProviderFlags = [pfInUpdate]
    end
    object XsddzbJHDD: TStringField
      FieldName = 'JHDD'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object XsddzbYWY: TStringField
      FieldName = 'YWY'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object XsddzbJE: TFloatField
      FieldName = 'JE'
      ProviderFlags = [pfInUpdate]
    end
    object XsddzbZT: TBooleanField
      FieldName = 'ZT'
      ProviderFlags = [pfInUpdate]
    end
    object XsddzbaZT: TStringField
      FieldName = 'aZT'
      ProviderFlags = [pfInUpdate]
      ReadOnly = True
      Size = 255
    end
    object XsddzbBZ: TStringField
      FieldName = 'BZ'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object XsddzbCZY: TStringField
      FieldName = 'CZY'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
  end
  object pXsddzb: TDataSetProvider
    DataSet = Xsddzb
    Constraints = True
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 258
    Top = 158
  end
  object Xsdd: TADOQuery
    Connection = Cn
    CursorLocation = clUseServer
    Parameters = <
      item
        Name = 'aSHSL'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      
        'select M.*,(select HH from CGDD where CGDD.ZBID=M.ZBID and CGDD.' +
        'HH=M.HH) as TMP,'
      'SL AS aYTSL,iif(M.SL>aSHSL,M.SL-aSHSL,0) as aMTSL, '
      'H.BH as aBH, H.PM as aPM, H.DW as aDW '
      'from CGDD M, HP H, M inner join H on M.HPID=H.ID')
    Left = 296
    Top = 166
    object XsddZBID2: TIntegerField
      FieldName = 'ZBID'
    end
    object XsddHH: TIntegerField
      FieldName = 'HH'
    end
    object XsddRQ: TDateField
      FieldName = 'RQ'
      ProviderFlags = [pfInUpdate]
    end
    object XsddHPID: TIntegerField
      FieldName = 'HPID'
      ProviderFlags = [pfInUpdate]
    end
    object XsddaBH: TStringField
      FieldName = 'aBH'
      ProviderFlags = []
    end
    object XsddaPM: TStringField
      FieldName = 'aPM'
      ProviderFlags = []
      Size = 40
    end
    object XsddaDW: TStringField
      FieldName = 'aDW'
      ProviderFlags = []
      Size = 4
    end
    object XsddSL: TFloatField
      FieldName = 'SL'
      ProviderFlags = [pfInUpdate]
    end
    object XsddDJ: TFloatField
      FieldName = 'DJ'
      ProviderFlags = [pfInUpdate]
    end
    object XsddNSL: TFloatField
      FieldName = 'NSL'
      ProviderFlags = [pfInUpdate]
    end
    object XsddaYTSL: TFloatField
      FieldName = 'aYTSL'
      ProviderFlags = []
    end
    object XsddaMTSL: TFloatField
      FieldName = 'aMTSL'
      ProviderFlags = []
    end
  end
  object pXsdd: TDataSetProvider
    DataSet = Xsdd
    Constraints = True
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 288
    Top = 158
  end
  object Xskdzb: TADOQuery
    Connection = Cn
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select Z.*,'
      'switch(XSLX=1,'#39#29616#27454#39', XSLX=2,'#39#35760#24080#39') as aXSLX,'
      'switch(FPLX=1,'#39#25910#25454#39', FPLX=2,'#39#26222#36890#21457#31080#39',FPLX=3,'#39#22686#20540#31246#21457#31080#39') as aFPLX,'
      'K.BH as aKHBH, K.MC as aKHMC,'
      'C.MC as aCKMC,'
      'S.MC as aSFKFSMC, H.MC as aZHMC'
      'from XSKDZB Z,KH K,CK C, SFKFS S, ZH H,'
      'Z inner join K on Z.KHID = K.ID,'
      'Z inner join C on Z.CKID = C.ID,'
      'Z left join S on Z.SFKFSID = S.ID,'
      'Z left join H on Z.ZHID = H.ID'
      'order by Z.DJBH'
      '')
    Left = 326
    Top = 166
    object XskdzbID: TIntegerField
      FieldName = 'ID'
    end
    object XskdzbDJBH: TStringField
      FieldName = 'DJBH'
      ProviderFlags = [pfInUpdate]
      Size = 12
    end
    object XskdzbRQ: TDateField
      FieldName = 'RQ'
      ProviderFlags = [pfInUpdate]
    end
    object XskdzbKHID: TIntegerField
      FieldName = 'KHID'
      ProviderFlags = [pfInUpdate]
    end
    object XskdzbaKHBH: TStringField
      FieldName = 'aKHBH'
      ProviderFlags = []
      Size = 12
    end
    object XskdzbaKHMC: TStringField
      FieldName = 'aKHMC'
      ProviderFlags = []
    end
    object XskdzbCKID: TIntegerField
      FieldName = 'CKID'
      ProviderFlags = [pfInUpdate]
    end
    object XskdzbaCKMC: TStringField
      FieldName = 'aCKMC'
      ProviderFlags = []
      Size = 16
    end
    object XskdzbFKLX: TIntegerField
      FieldName = 'XSLX'
      ProviderFlags = [pfInUpdate]
    end
    object XskdzbaFKLX: TStringField
      DisplayWidth = 4
      FieldName = 'aXSLX'
      ProviderFlags = []
      Size = 255
    end
    object XskdzbSFKFSID: TSmallintField
      FieldName = 'SFKFSID'
      ProviderFlags = [pfInUpdate]
    end
    object XskdzbaSFKFSMC: TStringField
      FieldName = 'aSFKFSMC'
      ProviderFlags = []
      Size = 16
    end
    object XskdzbZHID: TSmallintField
      FieldName = 'ZHID'
      ProviderFlags = [pfInUpdate]
    end
    object XskdzbaZHMC: TStringField
      FieldName = 'aZHMC'
      ProviderFlags = []
    end
    object XskdzbPH: TStringField
      FieldName = 'PH'
      ProviderFlags = [pfInUpdate]
    end
    object XskdzbFPLX: TIntegerField
      FieldName = 'FPLX'
      ProviderFlags = [pfInUpdate]
    end
    object XskdzbaFPLX: TStringField
      FieldName = 'aFPLX'
      ProviderFlags = []
      Size = 255
    end
    object XskdzbYWY: TStringField
      FieldName = 'YWY'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object XskdzbSKQX: TIntegerField
      FieldName = 'SKQX'
      ProviderFlags = [pfInUpdate]
    end
    object XskdzbJHDD: TStringField
      FieldName = 'JHDD'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object XskdzbJE: TFloatField
      FieldName = 'JE'
      ProviderFlags = [pfInUpdate]
    end
    object XskdzbYSJE3: TFloatField
      FieldName = 'YSJE'
      ProviderFlags = [pfInUpdate]
    end
    object XskdzbYSJE2: TFloatField
      FieldName = 'YSJE1'
      ProviderFlags = []
    end
    object XskdzbYSJE: TFloatField
      FieldName = 'MSJE'
      ProviderFlags = []
    end
    object XskdzbBZ: TStringField
      FieldName = 'BZ'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object XskdzbCZY: TStringField
      FieldName = 'CZY'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
  end
  object Xskd: TADOQuery
    Connection = Cn
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select M.*,'
      'H.BH as aBH, H.PM as aPM, H.DW as aDW '
      'from XSKD M, HP H, M inner join H on M.HPID=H.ID')
    Left = 356
    Top = 166
    object XskdZBID2: TIntegerField
      FieldName = 'ZBID'
    end
    object XskdHH: TIntegerField
      FieldName = 'HH'
    end
    object XskdRQ: TDateField
      FieldName = 'RQ'
      ProviderFlags = [pfInUpdate]
    end
    object XskdCKID: TIntegerField
      FieldName = 'CKID'
      ProviderFlags = [pfInUpdate]
    end
    object XskdHPID: TIntegerField
      FieldName = 'HPID'
      ProviderFlags = [pfInUpdate]
    end
    object XskdaBH: TStringField
      FieldName = 'aBH'
      ProviderFlags = []
    end
    object XskdaPM: TStringField
      FieldName = 'aPM'
      ProviderFlags = []
      Size = 40
    end
    object XskdaDW: TStringField
      FieldName = 'aDW'
      ProviderFlags = []
      Size = 4
    end
    object XskdSL: TFloatField
      FieldName = 'SL'
      ProviderFlags = [pfInUpdate]
    end
    object XskdDJ: TFloatField
      FieldName = 'DJ'
      ProviderFlags = [pfInUpdate]
    end
    object XskdCBDJ: TFloatField
      FieldName = 'CBDJ'
      ProviderFlags = [pfInUpdate]
    end
    object XskdNSL: TFloatField
      FieldName = 'NSL'
      ProviderFlags = [pfInUpdate]
    end
    object XskdDDID: TIntegerField
      FieldName = 'DDID'
      ProviderFlags = [pfInUpdate]
    end
  end
  object pXskdzb: TDataSetProvider
    DataSet = Xskdzb
    Constraints = True
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 318
    Top = 158
  end
  object pXskd: TDataSetProvider
    DataSet = Xskd
    Constraints = True
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 348
    Top = 158
  end
  object XsddHelp: TADOQuery
    Connection = Cn
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select Z.ID, Z.DJBH, Z.RQ, Z.JE, Z.JHRQ, '
      'G.BH AS aKHBH, G.MC AS aKHMC'
      'from XSDDZB Z,KH G,Z inner join G on Z.KHID=G.ID'
      'where not Z.ZT '
      'order by Z.DJBH;')
    Left = 76
    Top = 322
    object XsddHelpID: TIntegerField
      FieldName = 'ID'
    end
    object XsddHelpDJBH: TStringField
      FieldName = 'DJBH'
      Size = 12
    end
    object XsddHelpRQ: TDateField
      FieldName = 'RQ'
    end
    object XsddHelpJE: TFloatField
      FieldName = 'JE'
    end
    object XsddHelpJHRQ: TDateField
      FieldName = 'JHRQ'
    end
    object XsddHelpaKHBH: TStringField
      FieldName = 'aKHBH'
      Size = 12
    end
    object XsddHelpaKHMC: TStringField
      FieldName = 'aKHMC'
    end
  end
  object pXsddHelp: TDataSetProvider
    DataSet = XsddHelp
    Constraints = True
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 68
    Top = 314
  end
  object Xsskzb: TADOQuery
    Connection = Cn
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select Z.*,'
      'switch(FKLX=1,'#39#24212#25910#27454#39', FKLX=2,'#39#39044#25910#27454#39') as aFKLX,'
      'K.BH as aKHBH, K.MC as aKHMC,'
      'S.MC as aSFKFSMC, H.MC as aZHMC '
      'from XSSKZB Z, KH K, SFKFS S, ZH H, '
      'Z inner join K on Z.KHID = K.ID,'
      'Z inner join S on Z.SFKFSID = S.ID, '
      'Z inner join H on Z.ZHID = H.ID '
      'order by Z.DJBH')
    Left = 386
    Top = 166
    object XsskzbID: TIntegerField
      FieldName = 'ID'
    end
    object XsskzbDJBH: TStringField
      FieldName = 'DJBH'
      ProviderFlags = [pfInUpdate]
      Size = 12
    end
    object XsskzbRQ: TDateField
      FieldName = 'RQ'
      ProviderFlags = [pfInUpdate]
    end
    object XsskzbKHID: TIntegerField
      FieldName = 'KHID'
      ProviderFlags = [pfInUpdate]
    end
    object XsskzbaKHBH: TStringField
      FieldName = 'aKHBH'
      ProviderFlags = []
      Size = 12
    end
    object XsskzbaKHMC: TStringField
      FieldName = 'aKHMC'
      ProviderFlags = []
    end
    object XsskzbFKLX: TIntegerField
      FieldName = 'FKLX'
      ProviderFlags = [pfInUpdate]
    end
    object XsskzbaFKLX: TStringField
      FieldName = 'aFKLX'
      ProviderFlags = []
      Size = 255
    end
    object XsskzbSFKFSID: TSmallintField
      FieldName = 'SFKFSID'
      ProviderFlags = [pfInUpdate]
    end
    object XsskzbaSFKFSMC: TStringField
      FieldName = 'aSFKFSMC'
      ProviderFlags = []
      Size = 16
    end
    object XsskzbZHID: TSmallintField
      FieldName = 'ZHID'
      ProviderFlags = [pfInUpdate]
    end
    object XsskzbaZHMC: TStringField
      FieldName = 'aZHMC'
      ProviderFlags = []
    end
    object XsskzbPH: TStringField
      FieldName = 'PH'
      ProviderFlags = [pfInUpdate]
    end
    object XsskzbSYJY: TBooleanField
      FieldName = 'SYJY'
    end
    object XsskzbJE: TFloatField
      FieldName = 'JE'
      ProviderFlags = [pfInUpdate]
    end
    object XsskzbJEA: TFloatField
      FieldName = 'JEA'
      ProviderFlags = [pfInUpdate]
    end
    object XsskzbJEB: TFloatField
      FieldName = 'JEB'
      ProviderFlags = [pfInUpdate]
    end
    object XsskzbBZ: TStringField
      FieldName = 'BZ'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object XsskzbCZY: TStringField
      FieldName = 'CZY'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
  end
  object pXsskzb: TDataSetProvider
    DataSet = Xsskzb
    Constraints = True
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 378
    Top = 158
  end
  object Xssk: TADOQuery
    AutoCalcFields = False
    Connection = Cn
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select M.*,'
      'D.DJBH as aDDBH, D.RQ+D.SKQX as aSKQX, D.JE as aDDJE, '
      'D.YSJE as aYSJE, D.JE - D.YSJE as aMSJE '
      'from XSSK M, XSKDZB D, M inner join D on M.DDID=D.ID')
    Left = 416
    Top = 166
    object XsskZBID2: TIntegerField
      FieldName = 'ZBID'
    end
    object XsskHH: TIntegerField
      FieldName = 'HH'
    end
    object XsskRQ: TDateField
      FieldName = 'RQ'
      ProviderFlags = [pfInUpdate]
    end
    object XsskDDID: TIntegerField
      FieldName = 'DDID'
      ProviderFlags = [pfInUpdate]
    end
    object XsskaDDBH: TStringField
      FieldName = 'aDDBH'
      ProviderFlags = []
      Size = 12
    end
    object XsskaSKQX: TDateField
      FieldName = 'aSKQX'
      ProviderFlags = []
    end
    object XsskaDDJE: TFloatField
      FieldName = 'aDDJE'
      ProviderFlags = []
    end
    object XsskaYSJE: TFloatField
      FieldName = 'aYSJE'
      ProviderFlags = []
    end
    object XsskaMSJE: TFloatField
      FieldName = 'aMSJE'
      ProviderFlags = []
    end
    object XsskJE: TFloatField
      FieldName = 'JE'
      ProviderFlags = [pfInUpdate]
    end
  end
  object pXssk: TDataSetProvider
    DataSet = Xssk
    Constraints = True
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 408
    Top = 158
  end
  object Xsthzb: TADOQuery
    Connection = Cn
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select Z.*,'
      'switch(THLX=1,'#39#36864#29616#27454#32473#23458#25143#39', THLX=2,'#39#36864#27454#36716#20837#23458#25143#39044#25910#27454#39') as aTHLX,'
      'K.BH as aKHBH, K.MC as aKHMC,'
      'C.MC as aCKMC,S.MC as aSFKFSMC, H.MC as aZHMC '
      'from XSTHZB Z,KH K,CK C,SFKFS S,ZH H,'
      'Z inner join K on Z.KHID = K.ID, '
      'Z inner join C on Z.CKID = C.ID,'
      'Z inner join S on Z.SFKFSID = S.ID, '
      'Z inner join H on Z.ZHID = H.ID '
      'order by Z.DJBH')
    Left = 446
    Top = 166
    object XsthzbID: TIntegerField
      FieldName = 'ID'
    end
    object XsthzbDJBH: TStringField
      FieldName = 'DJBH'
      ProviderFlags = [pfInUpdate]
      Size = 12
    end
    object XsthzbRQ: TDateField
      FieldName = 'RQ'
      ProviderFlags = [pfInUpdate]
    end
    object XsthzbKHID: TIntegerField
      FieldName = 'KHID'
      ProviderFlags = [pfInUpdate]
    end
    object XsthzbaKHBH: TStringField
      FieldName = 'aKHBH'
      ProviderFlags = []
      Size = 12
    end
    object XsthzbaKHMC: TStringField
      FieldName = 'aKHMC'
      ProviderFlags = []
    end
    object XsthzbCKID: TIntegerField
      FieldName = 'CKID'
      ProviderFlags = [pfInUpdate]
    end
    object XsthzbaCKMC: TStringField
      FieldName = 'aCKMC'
      ProviderFlags = []
      Size = 16
    end
    object XsthzbTHLX: TIntegerField
      FieldName = 'THLX'
      ProviderFlags = [pfInUpdate]
    end
    object XsthzbaTHLX: TStringField
      DisplayWidth = 18
      FieldName = 'aTHLX'
      ProviderFlags = []
      Size = 18
    end
    object XsthzbSFKFSID: TSmallintField
      FieldName = 'SFKFSID'
      ProviderFlags = [pfInUpdate]
    end
    object XsthzbaSFKFSMC: TStringField
      FieldName = 'aSFKFSMC'
      ProviderFlags = []
      Size = 16
    end
    object XsthzbZHID: TSmallintField
      FieldName = 'ZHID'
      ProviderFlags = [pfInUpdate]
    end
    object XsthzbaZHMC: TStringField
      FieldName = 'aZHMC'
      ProviderFlags = []
    end
    object XsthzbPH: TStringField
      FieldName = 'PH'
      ProviderFlags = [pfInUpdate]
    end
    object XsthzbYWY: TStringField
      FieldName = 'YWY'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object XsthzbJE: TFloatField
      FieldName = 'JE'
      ProviderFlags = [pfInUpdate]
    end
    object XsthzbBZ: TStringField
      FieldName = 'BZ'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object XsthzbCZY: TStringField
      FieldName = 'CZY'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
  end
  object Xsth: TADOQuery
    Connection = Cn
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select M.*,'
      'H.BH as aBH, H.PM as aPM, H.DW as aDW '
      'from XSTH M, HP H, M inner join H on M.HPID=H.ID')
    Left = 475
    Top = 166
    object XsthZBID2: TIntegerField
      FieldName = 'ZBID'
    end
    object XsthHH: TIntegerField
      FieldName = 'HH'
    end
    object XsthRQ: TDateField
      FieldName = 'RQ'
      ProviderFlags = [pfInUpdate]
    end
    object XsthCKID: TIntegerField
      FieldName = 'CKID'
      ProviderFlags = [pfInUpdate]
    end
    object XsthHPID: TIntegerField
      FieldName = 'HPID'
      ProviderFlags = [pfInUpdate]
    end
    object XsthaBH: TStringField
      FieldName = 'aBH'
      ProviderFlags = []
    end
    object XsthaPM: TStringField
      FieldName = 'aPM'
      ProviderFlags = []
      Size = 40
    end
    object XsthaDW: TStringField
      FieldName = 'aDW'
      ProviderFlags = []
      Size = 4
    end
    object XsthSL: TFloatField
      FieldName = 'SL'
      ProviderFlags = [pfInUpdate]
    end
    object XsthDJ: TFloatField
      FieldName = 'DJ'
      ProviderFlags = [pfInUpdate]
    end
    object XsthCBDJ: TFloatField
      FieldName = 'CBDJ'
      ProviderFlags = [pfInUpdate]
    end
    object XsthNSL: TFloatField
      FieldName = 'NSL'
      ProviderFlags = [pfInUpdate]
    end
  end
  object pXsthzb: TDataSetProvider
    DataSet = Xsthzb
    Constraints = True
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 438
    Top = 158
  end
  object pXsth: TDataSetProvider
    DataSet = Xsth
    Constraints = True
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 467
    Top = 158
  end
  object Llzb: TADOQuery
    Connection = Cn
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select Z.*,'
      'C.MC as aCKMC '
      'from LLZB Z,CK C,'
      'Z inner join C on Z.CKID = C.ID '
      'order by Z.DJBH'
      '')
    Left = 26
    Top = 218
    object LlzbID: TIntegerField
      FieldName = 'ID'
    end
    object LlzbDJBH: TStringField
      FieldName = 'DJBH'
      ProviderFlags = [pfInUpdate]
      Size = 12
    end
    object LlzbRQ: TDateField
      FieldName = 'RQ'
      ProviderFlags = [pfInUpdate]
    end
    object LlzbCKID: TIntegerField
      FieldName = 'CKID'
      ProviderFlags = [pfInUpdate]
    end
    object LlzbaCKMC: TStringField
      FieldName = 'aCKMC'
      ProviderFlags = []
      Size = 16
    end
    object LlzbJSR: TStringField
      FieldName = 'JSR'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object LlzbJE: TFloatField
      FieldName = 'JE'
      ProviderFlags = [pfInUpdate]
    end
    object LlzbBZ: TStringField
      FieldName = 'BZ'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object LlzbCZY: TStringField
      FieldName = 'CZY'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
  end
  object Ll: TADOQuery
    Connection = Cn
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select M.*,'
      'H.BH as aBH, H.PM as aPM, H.DW as aDW '
      'from LL M, HP H, M inner join H on M.HPID=H.ID')
    Left = 56
    Top = 218
    object LlZBID2: TIntegerField
      FieldName = 'ZBID'
    end
    object LlHH: TIntegerField
      FieldName = 'HH'
    end
    object LlRQ: TDateField
      FieldName = 'RQ'
      ProviderFlags = [pfInUpdate]
    end
    object LlCKID: TIntegerField
      FieldName = 'CKID'
      ProviderFlags = [pfInUpdate]
    end
    object LlHPID: TIntegerField
      FieldName = 'HPID'
      ProviderFlags = [pfInUpdate]
    end
    object LlaBH: TStringField
      FieldName = 'aBH'
      ProviderFlags = []
    end
    object LlaPM: TStringField
      FieldName = 'aPM'
      ProviderFlags = []
      Size = 40
    end
    object LlaDW: TStringField
      FieldName = 'aDW'
      ProviderFlags = []
      Size = 4
    end
    object LlSL: TFloatField
      FieldName = 'SL'
      ProviderFlags = [pfInUpdate]
    end
    object LlDJ: TFloatField
      FieldName = 'DJ'
      ProviderFlags = [pfInUpdate]
    end
  end
  object pLl: TDataSetProvider
    DataSet = Ll
    Constraints = True
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 48
    Top = 210
  end
  object pLlzb: TDataSetProvider
    DataSet = Llzb
    Constraints = True
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 18
    Top = 210
  end
  object Tlzb: TADOQuery
    Connection = Cn
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select Z.*,'
      'C.MC as aCKMC '
      'from TLZB Z,CK C,'
      'Z inner join C on Z.CKID = C.ID '
      'order by Z.DJBH'
      '')
    Left = 86
    Top = 218
    object TlzbID: TIntegerField
      FieldName = 'ID'
    end
    object TlzbDJBH: TStringField
      FieldName = 'DJBH'
      ProviderFlags = [pfInUpdate]
      Size = 12
    end
    object TlzbRQ: TDateField
      FieldName = 'RQ'
      ProviderFlags = [pfInUpdate]
    end
    object TlzbCKID: TIntegerField
      FieldName = 'CKID'
      ProviderFlags = [pfInUpdate]
    end
    object TlzbaCKMC: TStringField
      FieldName = 'aCKMC'
      ProviderFlags = []
      Size = 16
    end
    object TlzbJSR: TStringField
      FieldName = 'JSR'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object TlzbJE: TFloatField
      FieldName = 'JE'
      ProviderFlags = [pfInUpdate]
    end
    object TlzbBZ: TStringField
      FieldName = 'BZ'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object TlzbCZY: TStringField
      FieldName = 'CZY'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
  end
  object Tl: TADOQuery
    Connection = Cn
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select M.*,'
      'H.BH as aBH, H.PM as aPM, H.DW as aDW '
      'from TL M, HP H, M inner join H on M.HPID=H.ID')
    Left = 116
    Top = 218
    object TlZBID2: TIntegerField
      FieldName = 'ZBID'
    end
    object TlHH: TIntegerField
      FieldName = 'HH'
    end
    object TlRQ: TDateField
      FieldName = 'RQ'
      ProviderFlags = [pfInUpdate]
    end
    object TlCKID: TIntegerField
      FieldName = 'CKID'
      ProviderFlags = [pfInUpdate]
    end
    object TlHPID: TIntegerField
      FieldName = 'HPID'
      ProviderFlags = [pfInUpdate]
    end
    object TlaBH: TStringField
      FieldName = 'aBH'
      ProviderFlags = []
    end
    object TlaPM: TStringField
      FieldName = 'aPM'
      ProviderFlags = []
      Size = 40
    end
    object TlaDW: TStringField
      FieldName = 'aDW'
      ProviderFlags = []
      Size = 4
    end
    object TlSL: TFloatField
      FieldName = 'SL'
      ProviderFlags = [pfInUpdate]
    end
    object TlDJ: TFloatField
      FieldName = 'DJ'
      ProviderFlags = [pfInUpdate]
    end
  end
  object pTl: TDataSetProvider
    DataSet = Tl
    Constraints = True
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 108
    Top = 210
  end
  object pTlzb: TDataSetProvider
    DataSet = Tlzb
    Constraints = True
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 78
    Top = 210
  end
  object Cpjczb: TADOQuery
    Connection = Cn
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select Z.*,'
      'C.MC as aCKMC '
      'from CPJCZB Z,CK C,'
      'Z inner join C on Z.CKID = C.ID '
      'order by Z.DJBH'
      '')
    Left = 146
    Top = 218
    object IntegerField1: TIntegerField
      FieldName = 'ID'
    end
    object StringField1: TStringField
      FieldName = 'DJBH'
      ProviderFlags = [pfInUpdate]
      Size = 12
    end
    object DateField1: TDateField
      FieldName = 'RQ'
      ProviderFlags = [pfInUpdate]
    end
    object IntegerField2: TIntegerField
      FieldName = 'CKID'
      ProviderFlags = [pfInUpdate]
    end
    object StringField2: TStringField
      FieldName = 'aCKMC'
      ProviderFlags = []
      Size = 16
    end
    object CpjczbPH: TStringField
      FieldName = 'PH'
      ProviderFlags = [pfInUpdate]
    end
    object FloatField1: TFloatField
      FieldName = 'JE'
      ProviderFlags = [pfInUpdate]
    end
    object StringField4: TStringField
      FieldName = 'BZ'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object StringField5: TStringField
      FieldName = 'CZY'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
  end
  object Cpjc: TADOQuery
    Connection = Cn
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select M.*,'
      'H.BH as aBH, H.PM as aPM, H.DW as aDW '
      'from CPJC M, HP H, M inner join H on M.HPID=H.ID')
    Left = 176
    Top = 218
    object IntegerField3: TIntegerField
      FieldName = 'ZBID'
    end
    object IntegerField4: TIntegerField
      FieldName = 'HH'
    end
    object DateField2: TDateField
      FieldName = 'RQ'
      ProviderFlags = [pfInUpdate]
    end
    object IntegerField5: TIntegerField
      FieldName = 'CKID'
      ProviderFlags = [pfInUpdate]
    end
    object IntegerField6: TIntegerField
      FieldName = 'HPID'
      ProviderFlags = [pfInUpdate]
    end
    object StringField6: TStringField
      FieldName = 'aBH'
      ProviderFlags = []
    end
    object StringField7: TStringField
      FieldName = 'aPM'
      ProviderFlags = []
      Size = 40
    end
    object StringField8: TStringField
      FieldName = 'aDW'
      ProviderFlags = []
      Size = 4
    end
    object FloatField2: TFloatField
      FieldName = 'SL'
      ProviderFlags = [pfInUpdate]
    end
    object FloatField3: TFloatField
      FieldName = 'DJ'
      ProviderFlags = [pfInUpdate]
    end
  end
  object pCpjc: TDataSetProvider
    DataSet = Cpjc
    Constraints = True
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 168
    Top = 210
  end
  object pCpjczb: TDataSetProvider
    DataSet = Cpjczb
    Constraints = True
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 138
    Top = 210
  end
  object Kcpdzb: TADOQuery
    Connection = Cn
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select Z.*,'
      'C.MC as aCKMC '
      'from KCPDZB Z,CK C,'
      'Z inner join C on Z.CKID = C.ID '
      'order by Z.DJBH'
      '')
    Left = 202
    Top = 218
    object KcpdzbID: TIntegerField
      FieldName = 'ID'
    end
    object KcpdzbDJBH: TStringField
      FieldName = 'DJBH'
      ProviderFlags = [pfInUpdate]
      Size = 12
    end
    object KcpdzbRQ: TDateField
      FieldName = 'RQ'
      ProviderFlags = [pfInUpdate]
    end
    object KcpdzbCKID: TIntegerField
      FieldName = 'CKID'
      ProviderFlags = [pfInUpdate]
    end
    object KcpdzbaCKMC: TStringField
      FieldName = 'aCKMC'
      ProviderFlags = []
      Size = 16
    end
    object KcpdzbJE: TFloatField
      FieldName = 'JE'
      ProviderFlags = [pfInUpdate]
    end
    object KcpdzbBZ: TStringField
      FieldName = 'BZ'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object KcpdzbCZY: TStringField
      FieldName = 'CZY'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
  end
  object Kcpd: TADOQuery
    Connection = Cn
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select M.*,'
      'H.BH as aBH, H.PM as aPM, H.DW as aDW '
      'from KCPD M, HP H, M inner join H on M.HPID=H.ID')
    Left = 232
    Top = 218
    object KcpdZBID2: TIntegerField
      FieldName = 'ZBID'
    end
    object KcpdHH: TIntegerField
      FieldName = 'HH'
    end
    object KcpdRQ: TDateField
      FieldName = 'RQ'
      ProviderFlags = [pfInUpdate]
    end
    object KcpdCKID: TIntegerField
      FieldName = 'CKID'
      ProviderFlags = [pfInUpdate]
    end
    object KcpdHPID: TIntegerField
      FieldName = 'HPID'
      ProviderFlags = [pfInUpdate]
    end
    object KcpdaBH: TStringField
      FieldName = 'aBH'
      ProviderFlags = []
    end
    object KcpdaPM: TStringField
      FieldName = 'aPM'
      ProviderFlags = []
      Size = 40
    end
    object KcpdaDW: TStringField
      FieldName = 'aDW'
      ProviderFlags = []
      Size = 4
    end
    object KcpdSL: TFloatField
      FieldName = 'SL'
      ProviderFlags = [pfInUpdate]
    end
    object KcpdDJ: TFloatField
      FieldName = 'DJ'
      ProviderFlags = [pfInUpdate]
    end
  end
  object pKcpd: TDataSetProvider
    DataSet = Kcpd
    Constraints = True
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 224
    Top = 210
  end
  object pKcpdzb: TDataSetProvider
    DataSet = Kcpdzb
    Constraints = True
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 194
    Top = 210
  end
  object Chtjzb: TADOQuery
    Connection = Cn
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select * from CHTJZB order by DJBH'
      '')
    Left = 262
    Top = 218
    object ChtjzbID: TIntegerField
      FieldName = 'ID'
    end
    object ChtjzbDJBH: TStringField
      FieldName = 'DJBH'
      ProviderFlags = [pfInUpdate]
      Size = 12
    end
    object ChtjzbRQ: TDateField
      FieldName = 'RQ'
      ProviderFlags = [pfInUpdate]
    end
    object ChtjzbJE: TFloatField
      FieldName = 'JE'
      ProviderFlags = [pfInUpdate]
    end
    object ChtjzbBZ: TStringField
      FieldName = 'BZ'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object ChtjzbCZY: TStringField
      FieldName = 'CZY'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
  end
  object Chtj: TADOQuery
    Connection = Cn
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select M.*,'
      'H.BH as aBH, H.PM as aPM, H.DW as aDW '
      'from CHTJ M, HP H, M inner join H on M.HPID=H.ID')
    Left = 292
    Top = 218
    object ChtjZBID2: TIntegerField
      FieldName = 'ZBID'
    end
    object ChtjHH: TIntegerField
      FieldName = 'HH'
    end
    object ChtjRQ: TDateField
      FieldName = 'RQ'
      ProviderFlags = [pfInUpdate]
    end
    object ChtjHPID: TIntegerField
      FieldName = 'HPID'
      ProviderFlags = [pfInUpdate]
    end
    object ChtjaBH: TStringField
      FieldName = 'aBH'
      ProviderFlags = []
    end
    object ChtjaPM: TStringField
      FieldName = 'aPM'
      ProviderFlags = []
      Size = 40
    end
    object ChtjaDW: TStringField
      FieldName = 'aDW'
      ProviderFlags = []
      Size = 4
    end
    object ChtjSL: TFloatField
      FieldName = 'SL'
      ProviderFlags = [pfInUpdate]
    end
    object ChtjDJ: TFloatField
      FieldName = 'JDJ'
      ProviderFlags = [pfInUpdate]
    end
    object ChtjDJ2: TFloatField
      FieldName = 'DJ'
      ProviderFlags = [pfInUpdate]
    end
  end
  object pChtj: TDataSetProvider
    DataSet = Chtj
    Constraints = True
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 284
    Top = 210
  end
  object pChtjzb: TDataSetProvider
    DataSet = Chtjzb
    Constraints = True
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 254
    Top = 210
  end
  object Ckdbzb: TADOQuery
    Connection = Cn
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select Z.*,'
      'DC.MC as aDCCMC, '
      'DR.MC as aDRCMC '
      'from CKDBZB Z,CK DC,CK DR,'
      'Z inner join DC on Z.DCCID = DC.ID,'
      'Z inner join DR on Z.DRCID = DR.ID '
      'order by Z.DJBH'
      '')
    Left = 322
    Top = 218
    object CkdbzbID: TIntegerField
      FieldName = 'ID'
    end
    object CkdbzbDJBH: TStringField
      FieldName = 'DJBH'
      ProviderFlags = [pfInUpdate]
      Size = 12
    end
    object CkdbzbRQ: TDateField
      FieldName = 'RQ'
      ProviderFlags = [pfInUpdate]
    end
    object CkdbzbDCCID: TIntegerField
      FieldName = 'DCCID'
      ProviderFlags = [pfInUpdate]
    end
    object CkdbzbaDCCMC: TStringField
      FieldName = 'aDCCMC'
      ProviderFlags = []
      Size = 16
    end
    object CkdbzbDRCID: TIntegerField
      FieldName = 'DRCID'
      ProviderFlags = [pfInUpdate]
    end
    object CkdbzbaDRCMC: TStringField
      FieldName = 'aDRCMC'
      ProviderFlags = []
      Size = 16
    end
    object CkdbzbJE: TFloatField
      FieldName = 'JE'
      ProviderFlags = [pfInUpdate]
    end
    object CkdbzbBZ: TStringField
      FieldName = 'BZ'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object CkdbzbCZY: TStringField
      FieldName = 'CZY'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
  end
  object Ckdb: TADOQuery
    Connection = Cn
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select M.*,'
      'H.BH as aBH, H.PM as aPM, H.DW as aDW '
      'from CKDB M, HP H, M inner join H on M.HPID=H.ID')
    Left = 352
    Top = 218
    object CkdbZBID2: TIntegerField
      FieldName = 'ZBID'
    end
    object CkdbHH: TIntegerField
      FieldName = 'HH'
    end
    object CkdbRQ: TDateField
      FieldName = 'RQ'
      ProviderFlags = [pfInUpdate]
    end
    object CkdbDCCID: TIntegerField
      FieldName = 'DCCID'
      ProviderFlags = [pfInUpdate]
    end
    object CkdbDRCID: TIntegerField
      FieldName = 'DRCID'
      ProviderFlags = [pfInUpdate]
    end
    object CkdbHPID: TIntegerField
      FieldName = 'HPID'
      ProviderFlags = [pfInUpdate]
    end
    object CkdbaBH: TStringField
      FieldName = 'aBH'
      ProviderFlags = []
    end
    object CkdbaPM: TStringField
      FieldName = 'aPM'
      ProviderFlags = []
      Size = 40
    end
    object CkdbaDW: TStringField
      FieldName = 'aDW'
      ProviderFlags = []
      Size = 4
    end
    object CkdbSL: TFloatField
      FieldName = 'SL'
      ProviderFlags = [pfInUpdate]
    end
    object CkdbDJ: TFloatField
      FieldName = 'DJ'
      ProviderFlags = [pfInUpdate]
    end
  end
  object pCkdb: TDataSetProvider
    DataSet = Ckdb
    Constraints = True
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 344
    Top = 210
  end
  object pCkdbzb: TDataSetProvider
    DataSet = Ckdbzb
    Constraints = True
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 314
    Top = 210
  end
  object Qtkcbdzb: TADOQuery
    Connection = Cn
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select Z.*,'
      'C.MC as aCKMC,'
      'L.MC as aQTKCBDLXMC,'
      'iif(L.RKL,'#39#20837#24211#31867'('#22686#21152#24211#23384')'#39','#39#20986#24211#31867'('#20943#23569#24211#23384')'#39') as aCRLX,'
      'iif(L.THBZ,'#39#38656#35201#39','#39#19981#38656#35201#39') as aTH  '
      'from QTKCBDZB Z, CK C, QTKCBDLX L,'
      'Z inner join C on Z.CKID = C.ID,'
      'Z inner join L on Z.QTKCBDLXID = L.ID '
      'order by Z.DJBH'
      '')
    Left = 382
    Top = 218
    object QtkcbdzbID: TIntegerField
      FieldName = 'ID'
    end
    object QtkcbdzbDJBH: TStringField
      FieldName = 'DJBH'
      ProviderFlags = [pfInUpdate]
      Size = 12
    end
    object QtkcbdzbRQ: TDateField
      FieldName = 'RQ'
      ProviderFlags = [pfInUpdate]
    end
    object QtkcbdzbCKID: TIntegerField
      FieldName = 'CKID'
      ProviderFlags = [pfInUpdate]
    end
    object QtkcbdzbaCKMC: TStringField
      FieldName = 'aCKMC'
      ProviderFlags = []
      Size = 16
    end
    object QtkcbdzbQTKCBDLXID: TIntegerField
      FieldName = 'QTKCBDLXID'
      ProviderFlags = [pfInUpdate]
    end
    object QtkcbdzbaQTKCBDLXMC: TStringField
      FieldName = 'aQTKCBDLXMC'
      ProviderFlags = []
    end
    object QtkcbdzbCRLX: TIntegerField
      FieldName = 'CRLX'
      ProviderFlags = [pfInUpdate]
    end
    object QtkcbdzbaCRLX: TStringField
      DisplayWidth = 16
      FieldName = 'aCRLX'
      ProviderFlags = []
      Size = 16
    end
    object QtkcbdzbaTH: TStringField
      DisplayWidth = 6
      FieldName = 'aTH'
      ProviderFlags = []
      Size = 6
    end
    object QtkcbdzbXGXX: TStringField
      FieldName = 'XGXX'
      ProviderFlags = [pfInUpdate]
    end
    object QtkcbdzbJE: TFloatField
      FieldName = 'JE'
      ProviderFlags = [pfInUpdate]
    end
    object QtkcbdzbBZ: TStringField
      FieldName = 'BZ'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object QtkcbdzbCZY: TStringField
      FieldName = 'CZY'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
  end
  object Qtkcbd: TADOQuery
    Connection = Cn
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select M.*,'
      'H.BH as aBH, H.PM as aPM, H.DW as aDW '
      'from QTKCBD M, HP H, M inner join H on M.HPID=H.ID')
    Left = 412
    Top = 218
    object QtkcbdZBID2: TIntegerField
      FieldName = 'ZBID'
    end
    object QtkcbdHH: TIntegerField
      FieldName = 'HH'
    end
    object QtkcbdRQ: TDateField
      FieldName = 'RQ'
      ProviderFlags = [pfInUpdate]
    end
    object QtkcbdCKID: TIntegerField
      FieldName = 'CKID'
      ProviderFlags = [pfInUpdate]
    end
    object QtkcbdCRLX: TIntegerField
      FieldName = 'CRLX'
      ProviderFlags = [pfInUpdate]
    end
    object QtkcbdHPID: TIntegerField
      FieldName = 'HPID'
      ProviderFlags = [pfInUpdate]
    end
    object QtkcbdaBH: TStringField
      FieldName = 'aBH'
      ProviderFlags = []
    end
    object QtkcbdaPM: TStringField
      FieldName = 'aPM'
      ProviderFlags = []
      Size = 40
    end
    object QtkcbdaDW: TStringField
      FieldName = 'aDW'
      ProviderFlags = []
      Size = 4
    end
    object QtkcbdSL: TFloatField
      FieldName = 'SL'
      ProviderFlags = [pfInUpdate]
    end
    object QtkcbdDJ: TFloatField
      FieldName = 'DJ'
      ProviderFlags = [pfInUpdate]
    end
    object QtkcbdTHSL: TFloatField
      FieldName = 'THSL'
      ProviderFlags = [pfInUpdate]
    end
  end
  object pQtkcbd: TDataSetProvider
    DataSet = Qtkcbd
    Constraints = True
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 404
    Top = 210
  end
  object pQtkcbdzb: TDataSetProvider
    DataSet = Qtkcbdzb
    Constraints = True
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 374
    Top = 210
  end
  object Fykzzb: TADOQuery
    Connection = Cn
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select Z.*,'
      'S.MC as aSFKFSMC, H.MC as aZHMC'
      'from FYKZZB Z, SFKFS S, ZH H,'
      'Z left join S on Z.SFKFSID = S.ID,'
      'Z left join H on Z.ZHID = H.ID'
      'order by Z.DJBH')
    Left = 26
    Top = 270
    object IntegerField7: TIntegerField
      FieldName = 'ID'
    end
    object StringField3: TStringField
      FieldName = 'DJBH'
      ProviderFlags = [pfInUpdate]
      Size = 12
    end
    object DateField3: TDateField
      FieldName = 'RQ'
      ProviderFlags = [pfInUpdate]
    end
    object SmallintField1: TSmallintField
      FieldName = 'SFKFSID'
      ProviderFlags = [pfInUpdate]
    end
    object StringField13: TStringField
      FieldName = 'aSFKFSMC'
      ProviderFlags = []
      Size = 16
    end
    object SmallintField2: TSmallintField
      FieldName = 'ZHID'
      ProviderFlags = [pfInUpdate]
    end
    object StringField14: TStringField
      FieldName = 'aZHMC'
      ProviderFlags = []
    end
    object StringField15: TStringField
      FieldName = 'PH'
      ProviderFlags = [pfInUpdate]
    end
    object StringField17: TStringField
      FieldName = 'JSR'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object FloatField4: TFloatField
      FieldName = 'JE'
      ProviderFlags = [pfInUpdate]
    end
    object StringField18: TStringField
      FieldName = 'BZ'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object StringField19: TStringField
      FieldName = 'CZY'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
  end
  object Fykz: TADOQuery
    Connection = Cn
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select M.*,'
      'L.BH as aBH, L.MC as aMC '
      'from FYKZ M, SRZCLB L, M inner join L on M.SRZCLBID=L.ID')
    Left = 68
    Top = 270
    object IntegerField12: TIntegerField
      FieldName = 'ZBID'
    end
    object IntegerField13: TIntegerField
      FieldName = 'HH'
    end
    object DateField4: TDateField
      FieldName = 'RQ'
      ProviderFlags = [pfInUpdate]
    end
    object FykzSRZCLBID: TIntegerField
      FieldName = 'SRZCLBID'
      ProviderFlags = [pfInUpdate]
    end
    object FykzaBH: TStringField
      FieldName = 'aBH'
      ProviderFlags = []
      Size = 6
    end
    object FykzaMC: TStringField
      FieldName = 'aMC'
      ProviderFlags = []
    end
    object FykzZY: TStringField
      FieldName = 'ZY'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object FykzJE: TFloatField
      FieldName = 'JE'
      ProviderFlags = [pfInUpdate]
    end
  end
  object pFykzzb: TDataSetProvider
    DataSet = Fykzzb
    Constraints = True
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 22
    Top = 262
  end
  object pFykz: TDataSetProvider
    DataSet = Fykz
    Constraints = True
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 64
    Top = 262
  end
  object Qtsrzb: TADOQuery
    Connection = Cn
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select Z.*,'
      'S.MC as aSFKFSMC, H.MC as aZHMC'
      'from QTSRZB Z, SFKFS S, ZH H,'
      'Z left join S on Z.SFKFSID = S.ID,'
      'Z left join H on Z.ZHID = H.ID'
      'order by Z.DJBH')
    Left = 110
    Top = 270
    object IntegerField8: TIntegerField
      FieldName = 'ID'
    end
    object StringField9: TStringField
      FieldName = 'DJBH'
      ProviderFlags = [pfInUpdate]
      Size = 12
    end
    object DateField5: TDateField
      FieldName = 'RQ'
      ProviderFlags = [pfInUpdate]
    end
    object SmallintField3: TSmallintField
      FieldName = 'SFKFSID'
      ProviderFlags = [pfInUpdate]
    end
    object StringField10: TStringField
      FieldName = 'aSFKFSMC'
      ProviderFlags = []
      Size = 16
    end
    object SmallintField4: TSmallintField
      FieldName = 'ZHID'
      ProviderFlags = [pfInUpdate]
    end
    object StringField11: TStringField
      FieldName = 'aZHMC'
      ProviderFlags = []
    end
    object StringField12: TStringField
      FieldName = 'PH'
      ProviderFlags = [pfInUpdate]
    end
    object StringField16: TStringField
      FieldName = 'JSR'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object FloatField5: TFloatField
      FieldName = 'JE'
      ProviderFlags = [pfInUpdate]
    end
    object StringField20: TStringField
      FieldName = 'BZ'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object StringField21: TStringField
      FieldName = 'CZY'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
  end
  object Qtsr: TADOQuery
    Connection = Cn
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select M.*,'
      'L.BH as aBH, L.MC as aMC '
      'from QTSR M, SRZCLB L, M inner join L on M.SRZCLBID=L.ID')
    Left = 152
    Top = 270
    object IntegerField9: TIntegerField
      FieldName = 'ZBID'
    end
    object IntegerField10: TIntegerField
      FieldName = 'HH'
    end
    object DateField6: TDateField
      FieldName = 'RQ'
      ProviderFlags = [pfInUpdate]
    end
    object IntegerField11: TIntegerField
      FieldName = 'SRZCLBID'
      ProviderFlags = [pfInUpdate]
    end
    object StringField22: TStringField
      FieldName = 'aBH'
      ProviderFlags = []
      Size = 6
    end
    object StringField23: TStringField
      FieldName = 'aMC'
      ProviderFlags = []
    end
    object StringField24: TStringField
      FieldName = 'ZY'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object FloatField6: TFloatField
      FieldName = 'JE'
      ProviderFlags = [pfInUpdate]
    end
  end
  object pQtsrzb: TDataSetProvider
    DataSet = Qtsrzb
    Constraints = True
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 106
    Top = 262
  end
  object pQtsr: TDataSetProvider
    DataSet = Qtsr
    Constraints = True
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 148
    Top = 262
  end
  object Yhckqk: TADOQuery
    Connection = Cn
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select Z.*,ZC.MC as aZCZHMC,ZR.MC as aZRZHMC'
      'from YHCKQK Z, ZH ZC, ZH ZR,'
      'Z left join ZC on Z.ZCZHID = ZC.ID,'
      'Z left join ZR on Z.ZRZHID = ZR.ID'
      'order by Z.RQ')
    Left = 194
    Top = 270
    object IntegerField14: TIntegerField
      FieldName = 'ID'
    end
    object DateField7: TDateField
      FieldName = 'RQ'
      ProviderFlags = [pfInUpdate]
    end
    object StringField29: TStringField
      FieldName = 'JSR'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object SmallintField6: TSmallintField
      FieldName = 'ZCZHID'
      ProviderFlags = [pfInUpdate]
    end
    object StringField27: TStringField
      FieldName = 'aZCZHMC'
      ProviderFlags = []
    end
    object YhckqkZHID: TSmallintField
      FieldName = 'ZRZHID'
      ProviderFlags = [pfInUpdate]
    end
    object YhckqkaZHMC: TStringField
      FieldName = 'aZRZHMC'
      ProviderFlags = []
    end
    object StringField28: TStringField
      FieldName = 'PH'
      ProviderFlags = [pfInUpdate]
    end
    object FloatField7: TFloatField
      FieldName = 'JE'
      ProviderFlags = [pfInUpdate]
    end
    object StringField30: TStringField
      FieldName = 'BZ'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object StringField31: TStringField
      FieldName = 'CZY'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
  end
  object pYhckqk: TDataSetProvider
    DataSet = Yhckqk
    Constraints = True
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 190
    Top = 262
  end
  object XskdHelp: TADOQuery
    Connection = Cn
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select Z.ID, Z.DJBH, Z.RQ, Z.JE,'
      'switch(XSLX=1,'#39#29616#27454#39', XSLX=2,'#39#35760#24080#39') as aXSLX,'
      'K.BH AS aKHBH, K.MC AS aKHMC'
      'from XSKDZB Z,KH K,Z inner join K on Z.KHID=K.ID'
      'where Z.ID > 0 '
      'order by Z.DJBH;')
    Left = 118
    Top = 322
    object XskdHelpID: TIntegerField
      FieldName = 'ID'
    end
    object XskdHelpDJBH: TStringField
      FieldName = 'DJBH'
      Size = 12
    end
    object XskdHelpRQ: TDateField
      FieldName = 'RQ'
    end
    object XskdHelpaXSLX: TStringField
      DisplayWidth = 4
      FieldName = 'aXSLX'
      ProviderFlags = []
      Size = 255
    end
    object XskdHelpJE: TFloatField
      FieldName = 'JE'
    end
    object XskdHelpaKHBH: TStringField
      FieldName = 'aKHBH'
      Size = 12
    end
    object XskdHelpaKHMC: TStringField
      FieldName = 'aKHMC'
    end
  end
  object pXskdHelp: TDataSetProvider
    DataSet = XskdHelp
    Constraints = True
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 110
    Top = 314
  end
  object CgshHelp: TADOQuery
    Connection = Cn
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select Z.ID, Z.DJBH, Z.RQ, Z.JE,'
      'switch(CGLX=1,'#39#29616#27454#39', CGLX=2,'#39#35760#24080#39') as aCGLX,'
      'K.BH AS aGYSBH, K.MC AS aGYSMC'
      'from CGSHZB Z,GYS K,Z inner join K on Z.GYSID=K.ID'
      'where Z.ID > 0 '
      'order by Z.DJBH;')
    Left = 160
    Top = 322
    object CgshHelpID: TIntegerField
      FieldName = 'ID'
    end
    object CgshHelpDJBH: TStringField
      FieldName = 'DJBH'
      Size = 12
    end
    object CgshHelpRQ: TDateField
      FieldName = 'RQ'
    end
    object CgshHelpaCGLX: TStringField
      DisplayWidth = 4
      FieldName = 'aCGLX'
      ProviderFlags = []
      Size = 255
    end
    object CgshHelpJE: TFloatField
      FieldName = 'JE'
    end
    object CgshHelpaGYSBH: TStringField
      FieldName = 'aGYSBH'
      Size = 12
    end
    object CgshHelpaGYSMC: TStringField
      FieldName = 'aGYSMC'
    end
  end
  object pCgshHelp: TDataSetProvider
    DataSet = CgshHelp
    Constraints = True
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 152
    Top = 314
  end
  object Thgc: TADOQuery
    Connection = Cn
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select M.*,'
      'H.BH as aBH, H.PM as aPM, H.DW as aDW '
      'from THGC M, HP H, M inner join H on M.HPID=H.ID')
    Left = 442
    Top = 218
    object IntegerField15: TIntegerField
      FieldName = 'ZBID'
    end
    object IntegerField16: TIntegerField
      FieldName = 'HH'
    end
    object DateField8: TDateField
      FieldName = 'RQ'
      ProviderFlags = [pfInUpdate]
    end
    object IntegerField19: TIntegerField
      FieldName = 'HPID'
      ProviderFlags = [pfInUpdate]
    end
    object StringField25: TStringField
      FieldName = 'aBH'
      ProviderFlags = []
    end
    object StringField26: TStringField
      FieldName = 'aPM'
      ProviderFlags = []
      Size = 40
    end
    object StringField32: TStringField
      FieldName = 'aDW'
      ProviderFlags = []
      Size = 4
    end
    object FloatField8: TFloatField
      FieldName = 'SL'
      ProviderFlags = [pfInUpdate]
    end
    object ThgcDJ: TFloatField
      FieldName = 'DJ'
      ProviderFlags = [pfInUpdate]
    end
  end
  object pThgc: TDataSetProvider
    DataSet = Thgc
    Constraints = True
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 434
    Top = 210
  end
  object Sjzl: TADOQuery
    Connection = Cn
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select * from Sjzl order by XH')
    Left = 266
    Top = 70
    object SjzlID: TIntegerField
      FieldName = 'ID'
    end
    object SjzlXH: TSmallintField
      FieldName = 'XH'
      ProviderFlags = [pfInUpdate]
    end
    object SjzlMC: TStringField
      FieldName = 'MC'
      ProviderFlags = [pfInUpdate]
      Size = 16
    end
    object SjzlBZ: TStringField
      FieldName = 'BZ'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
  end
  object pSjzl: TDataSetProvider
    DataSet = Sjzl
    Constraints = True
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 258
    Top = 66
  end
end
