object dmd: Tdmd
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 174
  Top = 190
  Height = 353
  Width = 603
  object Connec_main: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.3.51;Persist Security Info=False;Us' +
      'er ID=Admin;Data Source=E:\Zca\WORKING\'#24037#35013#31649#29702'\ok\SQ_GZK.mdb;Mode=S' +
      'hare Deny None;Extended Properties=";COUNTRY=0;CP=1252;LANGID=0x' +
      '0409";Locale Identifier=1033;Jet OLEDB:System database="";Jet OL' +
      'EDB:Registry Path="";Jet OLEDB:Database Password="";Jet OLEDB:Gl' +
      'obal Partial Bulk Ops=2'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.3.51'
    Left = 16
    Top = 88
  end
  object Tbl_GZCP3: TADOTable
    Connection = Connec_main
    IndexFieldNames = 'CPTH'
    MasterFields = 'CPTH'
    MasterSource = Src_CP
    TableName = #24037#35013#20135#21697
    Left = 400
    Top = 226
  end
  object Tbl_ZBLX: TADOTable
    Connection = Connec_main
    TableName = #20934#22791#36335#32447
    Left = 237
    Top = 10
  end
  object Src_GZ: TDataSource
    DataSet = Tbl_GZ
    Left = 81
    Top = 54
  end
  object Src_CP: TDataSource
    DataSet = Tbl_CP
    Left = 133
    Top = 54
  end
  object Src_GZCP3: TDataSource
    DataSet = Tbl_GZCP3
    Left = 400
    Top = 270
  end
  object Tbl_CP: TADOTable
    Connection = Connec_main
    TableName = #20135#21697
    Left = 133
    Top = 10
  end
  object Tbl_GZ: TADOTable
    Connection = Connec_main
    TableName = #24037#35013
    Left = 81
    Top = 10
  end
  object Qry_GZ2: TADOQuery
    Connection = Connec_main
    Parameters = <>
    Left = 269
    Top = 112
  end
  object Qry_ZBLX: TADOQuery
    Connection = Connec_main
    Parameters = <>
    Left = 420
    Top = 112
  end
  object Qry_GZCP: TADOQuery
    Connection = Connec_main
    Parameters = <>
    Left = 347
    Top = 112
  end
  object Qry_GZ: TADOQuery
    Connection = Connec_main
    Parameters = <>
    Left = 144
    Top = 112
  end
  object SrcQry_GZ: TDataSource
    DataSet = Qry_GZ
    Left = 144
    Top = 156
  end
  object SrcQry_GZ2: TDataSource
    DataSet = Qry_GZ2
    Left = 269
    Top = 156
  end
  object SrcQry_ZBLX: TDataSource
    DataSet = Qry_ZBLX
    Left = 420
    Top = 156
  end
  object SrcQry_GZCP: TDataSource
    DataSet = Qry_GZCP
    Left = 347
    Top = 156
  end
  object Tbl_dw: TADOTable
    Connection = Connec_main
    TableName = #21333#20301
    Left = 289
    Top = 10
  end
  object Src_dw: TDataSource
    DataSet = Tbl_dw
    Left = 289
    Top = 54
  end
  object Src_zblx: TDataSource
    DataSet = Tbl_ZBLX
    Left = 237
    Top = 54
  end
  object Src_gz3: TDataSource
    DataSet = Tbl_gz3
    Left = 341
    Top = 270
  end
  object Tbl_gz3: TADOTable
    Connection = Connec_main
    CursorType = ctStatic
    IndexFieldNames = 'GZBH'
    MasterFields = 'GZBH'
    MasterSource = Src_GZCP3
    TableName = #24037#35013
    Left = 341
    Top = 226
  end
  object Tbl_GZCP: TADOTable
    Connection = Connec_main
    TableName = #24037#35013#20135#21697
    Left = 185
    Top = 10
  end
  object Src_GZCP: TDataSource
    DataSet = Tbl_GZCP
    Left = 185
    Top = 54
  end
  object Tbl_GZCP2: TADOTable
    Connection = Connec_main
    IndexFieldNames = 'GZBH'
    MasterFields = 'GZBH'
    MasterSource = Src_GZ
    TableName = #24037#35013#20135#21697
    Left = 136
    Top = 226
  end
  object Src_GZCP2: TDataSource
    DataSet = Tbl_GZCP2
    Left = 136
    Top = 270
  end
  object Src_cp2: TDataSource
    DataSet = Tbl_cp2
    Left = 77
    Top = 270
  end
  object Tbl_cp2: TADOTable
    Connection = Connec_main
    CursorType = ctStatic
    IndexFieldNames = 'CPTH'
    MasterFields = 'CPTH'
    MasterSource = Src_GZCP2
    TableName = #20135#21697
    Left = 77
    Top = 226
  end
  object TbL_yzjh: TADOTable
    Connection = Connec_main
    TableName = #39564#35777#35745#21010
    Left = 446
    Top = 10
  end
  object Src_yzjh: TDataSource
    DataSet = TbL_yzjh
    Left = 446
    Top = 54
  end
  object TbL_lb: TADOTable
    Connection = Connec_main
    TableName = #36710#22411#24635#25104
    Left = 341
    Top = 10
  end
  object Src_lb: TDataSource
    DataSet = TbL_lb
    Left = 341
    Top = 54
  end
  object TbL_zzjh: TADOTable
    Connection = Connec_main
    TableName = #21046#36896#35745#21010
    Left = 393
    Top = 10
  end
  object Src_zzjh: TDataSource
    DataSet = TbL_zzjh
    Left = 393
    Top = 54
  end
  object Qry_temp: TADOQuery
    Connection = Connec_main
    Parameters = <>
    Left = 16
    Top = 152
  end
  object Qry_CP: TADOQuery
    Connection = Connec_main
    Parameters = <>
    Left = 85
    Top = 112
  end
  object SrcQry_CP: TDataSource
    DataSet = Qry_CP
    Left = 85
    Top = 156
  end
  object Qry_GZ1: TADOQuery
    Connection = Connec_main
    Parameters = <>
    Left = 205
    Top = 112
  end
  object SrcQry_GZ1: TDataSource
    DataSet = Qry_GZ1
    Left = 205
    Top = 156
  end
  object Tbl_NBB: TADOTable
    Connection = Connec_main
    CursorType = ctStatic
    TableName = #24180#32456#25253#34920
    Left = 504
    Top = 12
  end
  object Src_NBB: TDataSource
    DataSet = Tbl_NBB
    Left = 504
    Top = 54
  end
  object Src_temp: TDataSource
    DataSet = Qry_temp
    Left = 24
    Top = 204
  end
  object Tbl_YBB: TADOTable
    Connection = Connec_main
    CursorType = ctStatic
    TableName = #26376#26411#25253#34920
    Left = 552
    Top = 12
  end
  object Src_YBB: TDataSource
    DataSet = Tbl_YBB
    Left = 552
    Top = 54
  end
end
