object DMD: TDMD
  OldCreateOrder = False
  Left = 205
  Top = 133
  Height = 400
  Width = 598
  object Connection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.3.51;Persist Security Info=False;Da' +
      'ta Source=E:\Zca\WORKING\'#24037#35013#31649#29702'\SQ_GZK.mdb'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.3.51'
    Left = 16
    Top = 88
  end
  object Tbl_GZCP: TADOTable
    Connection = Connection1
    TableName = #24037#35013#20135#21697
    Left = 226
    Top = 16
  end
  object Tbl_ZBLX: TADOTable
    Connection = Connection1
    TableName = #20934#22791#36335#32447
    Left = 296
    Top = 16
  end
  object Src_GZ: TDataSource
    DataSet = Tbl_GZ
    Left = 159
    Top = 60
  end
  object Src_CP: TDataSource
    DataSet = Tbl_CP
    Left = 89
    Top = 60
  end
  object Src_ZBLX: TDataSource
    DataSet = Tbl_ZBLX
    Left = 296
    Top = 60
  end
  object Src_GZCP: TDataSource
    DataSet = Tbl_GZCP
    Left = 226
    Top = 60
  end
  object Tbl_CP: TADOTable
    Connection = Connection1
    TableName = #20135#21697
    Left = 89
    Top = 16
  end
  object Tbl_GZ: TADOTable
    Connection = Connection1
    TableName = #24037#35013
    Left = 159
    Top = 16
  end
  object Qry_CP: TADOQuery
    Connection = Connection1
    Parameters = <>
    Left = 89
    Top = 118
  end
  object Qry_ZBLX: TADOQuery
    Connection = Connection1
    Parameters = <>
    Left = 296
    Top = 118
  end
  object Qry_GZCP: TADOQuery
    Connection = Connection1
    Parameters = <>
    Left = 226
    Top = 118
  end
  object Qry_GZ: TADOQuery
    Connection = Connection1
    Parameters = <>
    Left = 159
    Top = 118
  end
  object SrcQry_GZ: TDataSource
    DataSet = Qry_GZ
    Left = 159
    Top = 162
  end
  object SrcQry_CP: TDataSource
    DataSet = Qry_CP
    Left = 89
    Top = 162
  end
  object SrcQry_ZBLX: TDataSource
    DataSet = Qry_ZBLX
    Left = 296
    Top = 162
  end
  object SrcQry_GZCP: TDataSource
    DataSet = Qry_GZCP
    Left = 226
    Top = 162
  end
end
