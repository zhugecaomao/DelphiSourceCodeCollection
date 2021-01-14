object frmSaleBrow: TfrmSaleBrow
  Left = 235
  Top = 218
  Width = 696
  Height = 480
  Caption = #38144#21806#21333#25454#26597#35810
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object panBill: TPanel
    Left = 0
    Top = 57
    Width = 688
    Height = 396
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 2
    BorderStyle = bsSingle
    TabOrder = 0
    Visible = False
    object TreeView1: TTreeView
      Left = 4
      Top = 4
      Width = 121
      Height = 384
      Align = alLeft
      BevelInner = bvSpace
      BevelOuter = bvSpace
      BevelKind = bkFlat
      BorderWidth = 2
      Indent = 19
      TabOrder = 0
      Items.Data = {
        030000001F0000000100000000000000FFFFFFFFFFFFFFFF0000000000000000
        06B6A9BBF5B5A51F0000000200000000000000FFFFFFFFFFFFFFFF0000000003
        00000006CFFACADBB5A51F0000000300000000000000FFFFFFFFFFFFFFFF0000
        00000000000006D2D1CDEAB3C91F0000000400000000000000FFFFFFFFFFFFFF
        FF000000000000000006C4A9CDEAB3C91D0000000500000000000000FFFFFFFF
        FFFFFFFF000000000100000004B2DDB8E5210000000000000000000000FFFFFF
        FFFFFFFFFF000000000000000008BFD5B5C4BBF5B5A51D000000000000000000
        0000FFFFFFFFFFFFFFFF000000000000000004C9CCC6B7}
    end
    object wwDBGridEx1: TwwDBGridEx
      Left = 125
      Top = 4
      Width = 555
      Height = 384
      LineStyle = gls3D
      Selected.Strings = (
        'GdsID'#9'12'#9#32534#21495
        'GdsName'#9'34'#9#21830#21697#21517#31216
        'Unit'#9'4'#9#21333#20301
        'InPrice'#9'10'#9#20837#36135#20215
        'OutPrice1'#9'10'#9#20986#36135#20215'1'
        'amoqua'#9'12'#9#24211#23384#25968
        'amoamo'#9'12'#9#24211#23384#25104#26412)
      IniAttributes.Delimiter = ';;'
      TitleColor = clSkyBlue
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = dsFilter
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      KeyOptions = []
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      RowHeightPercent = 120
      ShowHint = True
      TabOrder = 1
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 2
      TitleButtons = True
      FooterColor = clMoneyGreen
      FooterCellColor = clMoneyGreen
      PadColumnStyle = pcsPlain
      ColorL = clWhite
      ColorH = clMoneyGreen
      ColorI = clYellow
      TwoColor = True
    end
  end
  object panTop: TPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 57
    Align = alTop
    BevelInner = bvLowered
    BorderWidth = 2
    BorderStyle = bsSingle
    TabOrder = 1
    object FlatButton1: TFlatButton
      Left = 24
      Top = 10
      Width = 105
      Height = 25
      Caption = #29983#25104#23545#36134#21333
      TabOrder = 0
    end
  end
  object qryFilter: TADOQuery
    Connection = DM.DB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select  *  from goods as a'
      
        '   left join  (select gdsid,sum(qua) as amoqua,sum(amo) as amoam' +
        'o '
      '                       from firststore group by gdsid)  as b '
      '   on a.gdsid=b.gdsid   '
      'order by b.amoamo desc')
    Left = 64
    Top = 200
  end
  object dsFilter: TwwDataSource
    DataSet = qryFilter
    Left = 64
    Top = 256
  end
end
