object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 180
  Top = 114
  Height = 533
  Width = 802
  object Conn: TADOConnection
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'SQLOLEDB.1'
    Left = 24
    Top = 8
  end
  object UseNameQuery: TADOQuery
    Connection = Conn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from UseName')
    Left = 224
    Top = 8
  end
  object UseNameSource: TDataSource
    DataSet = UseNameQuery
    Left = 160
    Top = 8
  end
  object FhxxQuery: TADOQuery
    Connection = Conn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from FHXX')
    Left = 104
    Top = 72
  end
  object FhxxSource: TDataSource
    DataSet = FhxxQuery
    Left = 32
    Top = 72
  end
  object SHXXQuery: TADOQuery
    Connection = Conn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from SHXX')
    Left = 536
    Top = 448
  end
  object SHXXSource: TDataSource
    DataSet = SHXXQuery
    Left = 600
    Top = 456
  end
  object HY_XXQuery: TADOQuery
    Connection = Conn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from HY_XX')
    Left = 564
    Top = 372
  end
  object HY_XXSource: TDataSource
    DataSet = HY_XXQuery
    Left = 508
    Top = 380
  end
  object CD_XXQuery: TADOQuery
    Connection = Conn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from CD_XX')
    Left = 104
    Top = 152
  end
  object CD_XXSource: TDataSource
    DataSet = CD_XXQuery
    Left = 24
    Top = 152
  end
  object LY_XXQuery: TADOQuery
    Connection = Conn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from LY_XX')
    Left = 672
    Top = 456
  end
  object LY_XXSource: TDataSource
    DataSet = LY_XXQuery
    Left = 720
    Top = 448
  end
  object DL_XXSource: TDataSource
    DataSet = DL_XXQuery
    Left = 292
    Top = 388
  end
  object DL_XXQuery: TADOQuery
    Connection = Conn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from DL_XX')
    Left = 228
    Top = 388
  end
  object YWYSource: TDataSource
    DataSet = YWYQuery
    Left = 400
    Top = 448
  end
  object YWYQuery: TADOQuery
    Connection = Conn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from YWY_XX')
    Left = 308
    Top = 436
  end
  object HYFYQuery: TADOQuery
    Connection = Conn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from HY_FYXX')
    Left = 484
    Top = 220
  end
  object HYFYSource: TDataSource
    DataSet = HYFYQuery
    Left = 556
    Top = 228
  end
  object CDFYQuery: TADOQuery
    Connection = Conn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from CD_FYXX')
    Left = 548
    Top = 84
  end
  object CDFYSource: TDataSource
    DataSet = CDFYQuery
    Left = 492
    Top = 100
  end
  object TEMPSource: TDataSource
    DataSet = TEMPQuery
    Left = 372
    Top = 12
  end
  object TEMPQuery: TADOQuery
    Connection = Conn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from TEMPLATE')
    Left = 284
    Top = 4
  end
  object DLFYSource: TDataSource
    DataSet = DLFYQuery
    Left = 500
    Top = 20
  end
  object DLFYQuery: TADOQuery
    Connection = Conn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from DL_FYXX')
    Left = 564
    Top = 28
  end
  object OTHERSource: TDataSource
    DataSet = OTHERQuery
    Left = 484
    Top = 164
  end
  object OTHERQuery: TADOQuery
    Connection = Conn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from OTHER_FYXX')
    Left = 564
    Top = 164
  end
  object KHFYSource: TDataSource
    DataSet = KHFYQuery
    Left = 268
    Top = 308
  end
  object BoxFYQuery: TADOQuery
    Connection = Conn
    Parameters = <>
    Left = 108
    Top = 396
  end
  object LYBOXQuery: TADOQuery
    Connection = Conn
    Parameters = <>
    Left = 32
    Top = 432
  end
  object LYPRCQuery: TADOQuery
    Connection = Conn
    Parameters = <>
    Left = 152
    Top = 424
  end
  object LYPADQuery: TADOQuery
    Connection = Conn
    Parameters = <>
    Left = 40
    Top = 344
  end
  object DLBOXQuery: TADOQuery
    Connection = Conn
    Parameters = <>
    Left = 120
    Top = 328
  end
  object DLPRCQuery: TADOQuery
    Connection = Conn
    Parameters = <>
    Left = 184
    Top = 312
  end
  object MonthSource: TDataSource
    DataSet = MonthQuery
    Left = 332
    Top = 244
  end
  object MonthQuery: TADOQuery
    Connection = Conn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from KHFY')
    Left = 396
    Top = 244
  end
  object KFYQuery: TADOQuery
    Connection = Conn
    Parameters = <>
    Left = 348
    Top = 156
  end
  object QueryKH: TADOQuery
    Connection = Conn
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'HY_TD'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT A.HY_TIT, B.DL_TIT, C.CD_TIT, D.OTHER_TIT, A.HY_TIT+B.DL_' +
        'TIT+C.CD_TIT+D.OTHER_TIT AS Profit, E.KHFY_TIT, E.KHFY_LIRUNDAXI' +
        'E'
      
        'FROM HY_FYXX AS A, DL_FYXX AS B, CD_FYXX AS C, OTHER_FYXX AS D, ' +
        'KHFY AS E'
      'WHERE A.HY_TD=B.DL_ID '
      '  And C.CD_ID = D.Other_ID '
      '  AND B.DL_ID=C.CD_ID'
      '  AND A.HY_TD=E.KHFY_ID'
      '  AND A.HY_TD=:HY_TD;')
    Left = 268
    Top = 132
  end
  object KHFYQuery: TADOQuery
    Connection = Conn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from KHFY')
    Left = 360
    Top = 312
  end
  object DS_QueryKH: TDataSource
    DataSet = QueryKH
    Left = 268
    Top = 200
  end
  object ADOQuery1: TADOQuery
    Connection = Conn
    Parameters = <>
    Left = 704
    Top = 88
  end
  object ADOQuery2: TADOQuery
    Connection = Conn
    Parameters = <>
    Left = 712
    Top = 160
  end
  object ADOQuery3: TADOQuery
    Connection = Conn
    Parameters = <>
    Left = 712
    Top = 224
  end
  object ADOQuery4: TADOQuery
    Connection = Conn
    Parameters = <>
    Left = 720
    Top = 288
  end
  object KFY1Query: TADOQuery
    Connection = Conn
    Parameters = <>
    Left = 360
    Top = 112
  end
  object ADOQuery5: TADOQuery
    Connection = Conn
    Parameters = <>
    Left = 456
    Top = 320
  end
end
