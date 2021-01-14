object FmAskGoodsPlan: TFmAskGoodsPlan
  Left = 18
  Top = 32
  Width = 770
  Height = 489
  BorderIcons = [biSystemMenu]
  Caption = #37197#36865#30003#35831#21333
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 762
    Height = 148
    Align = alTop
    TabOrder = 0
    DesignSize = (
      762
      148)
    object Label2: TLabel
      Left = 16
      Top = 69
      Width = 74
      Height = 13
      AutoSize = False
      Caption = #35201#36135#21333#20301'[&A]:'
      FocusControl = EdtSendStock
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 255
      Top = 67
      Width = 68
      Height = 13
      AutoSize = False
      Caption = #35201#36135#20179#24211'[&G]:'
      FocusControl = EdtRecvStock
    end
    object Label4: TLabel
      Left = 498
      Top = 96
      Width = 79
      Height = 13
      AutoSize = False
      Caption = #30003#35831#26085#26399'[&M]:'
    end
    object Label6: TLabel
      Left = 13
      Top = 125
      Width = 81
      Height = 13
      AutoSize = False
      Caption = #22791'    '#27880'[&F]:'
      FocusControl = EdtMemo
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 499
      Top = 67
      Width = 78
      Height = 13
      AutoSize = False
      Caption = #37197#36865#20179#24211'[&G]:'
      FocusControl = Edit1
    end
    object SpeedButton1: TSpeedButton
      Left = 725
      Top = 64
      Width = 22
      Height = 20
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333333333333333333333333333333333333333333333333FF333333333333
        3000333333FFFFF3F77733333000003000B033333777773777F733330BFBFB00
        E00033337FFF3377F7773333000FBFB0E000333377733337F7773330FBFBFBF0
        E00033F7FFFF3337F7773000000FBFB0E000377777733337F7770BFBFBFBFBF0
        E00073FFFFFFFF37F777300000000FB0E000377777777337F7773333330BFB00
        000033333373FF77777733333330003333333333333777333333333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
      OnClick = SpeedButton1Click
    end
    object SpeedButton3: TSpeedButton
      Left = 453
      Top = 90
      Width = 22
      Height = 20
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333333333333333333333333333333333333333333333333FF333333333333
        3000333333FFFFF3F77733333000003000B033333777773777F733330BFBFB00
        E00033337FFF3377F7773333000FBFB0E000333377733337F7773330FBFBFBF0
        E00033F7FFFF3337F7773000000FBFB0E000377777733337F7770BFBFBFBFBF0
        E00073FFFFFFFF37F777300000000FB0E000377777777337F7773333330BFB00
        000033333373FF77777733333330003333333333333777333333333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
      OnClick = SpeedButton3Click
    end
    object StaticText1: TStaticText
      Left = 13
      Top = 45
      Width = 82
      Height = 16
      Caption = #21333#25454#32534#21495'[&N]:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
    object EdtSendStock: TEdit
      Left = 91
      Top = 64
      Width = 110
      Height = 21
      ReadOnly = True
      TabOrder = 0
      OnKeyDown = EdtSendStockKeyDown
    end
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 760
      Height = 33
      Align = alTop
      BevelInner = bvLowered
      BevelOuter = bvNone
      Color = 16573127
      TabOrder = 4
      DesignSize = (
        760
        33)
      object TeThemeButton1: TSpeedButton
        Left = 635
        Top = 6
        Width = 20
        Height = 20
        Hint = #22686#21152#19968#34892
        Anchors = [akTop, akRight]
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000120B0000120B00001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
          DADAADADADADADADADADDADADADADADADADAADADADADADADADADDADADA000ADA
          DADAADADAD030DADADADDADADA030ADADADAADA000030000ADADDAD033333330
          DADAADA000030000ADADDADADA030ADADADAADADAD030DADADADDADADA000ADA
          DADAADADADADADADADADDADADADADADADADAADADADADADADADAD}
        ParentShowHint = False
        ShowHint = True
        Transparent = False
        Visible = False
      end
      object TeThemeButton2: TSpeedButton
        Left = 659
        Top = 6
        Width = 20
        Height = 20
        Hint = #20943#23569#19968#34892
        Anchors = [akTop, akRight]
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000120B0000120B00001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
          DADAADADADADADADADADDADADADADADADADAADADADADADADADADDADADADADADA
          DADAADADADADADADADADDADADADADADADADAADA000000000ADADDAD033333330
          DADAADA000000000ADADDADADADADADADADAADADADADADADADADDADADADADADA
          DADAADADADADADADADADDADADADADADADADAADADADADADADADAD}
        ParentShowHint = False
        ShowHint = True
        Transparent = False
        Visible = False
      end
      object sourcebill: TSpeedButton
        Left = 683
        Top = 6
        Width = 20
        Height = 20
        Hint = #35843#21407#22987#21333#25454
        Anchors = [akTop, akRight]
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
          8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
          8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
          8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        Transparent = False
        Visible = False
      end
      object query: TSpeedButton
        Left = 708
        Top = 6
        Width = 20
        Height = 20
        Hint = #26597#35810
        Anchors = [akTop, akRight]
        Glyph.Data = {
          EE000000424DEE000000000000007600000028000000100000000F0000000100
          04000000000078000000130B0000130B00001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          888800000888880000080F000888880F00080F000888880F0008000000080000
          000800F000000F00000800F000800F00000800F000800F000008800000000000
          0088880F00080F000888880000080000088888800088800088888880F08880F0
          888888800088800088888888888888888888}
        ParentShowHint = False
        ShowHint = True
        Transparent = False
        Visible = False
      end
      object help: TSpeedButton
        Left = 732
        Top = 6
        Width = 20
        Height = 20
        Hint = #24110#21161
        Anchors = [akTop, akRight]
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000120B0000120B00001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
          0ADAADADADADADA00DADDADA7777770B07DAADA0000000FF007DDA0FFFBFBFBF
          FF07AD0FBFFF44FFBF07DA0FFFBFFFBFFF07AD0FBFFF47FFBF07DA0FFFBF748F
          FF07AD0FBFFFB747BF07DA0FFF47FF44FF07AD0FBF44B844BF07DA0FFF844448
          FF07AD0FBFFFBFFFBF07DA0FFFBFFFBFFF0AADA00000000000AD}
        ParentShowHint = False
        ShowHint = True
        Transparent = False
        Visible = False
      end
      object Label7: TLabel
        Left = 31
        Top = 5
        Width = 122
        Height = 25
        AutoSize = False
        Caption = #37197#36865#30003#35831#21333
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlue
        Font.Height = -20
        Font.Name = #23435#20307
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
    end
    object EdtRecvStock: TEdit
      Left = 322
      Top = 65
      Width = 127
      Height = 21
      Anchors = [akTop, akRight]
      ReadOnly = True
      TabOrder = 1
      OnKeyDown = EdtRecvStockKeyDown
    end
    object EdtMemo: TEdit
      Left = 91
      Top = 119
      Width = 630
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      OnKeyDown = EdtMemoKeyDown
    end
    object dpt1: TDateTimePicker
      Left = 581
      Top = 91
      Width = 139
      Height = 21
      CalAlignment = dtaLeft
      Date = 38064.9592351968
      Time = 38064.9592351968
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 2
      OnKeyDown = dpt1KeyDown
    end
    object EdtBillNo: TEdit
      Left = 91
      Top = 41
      Width = 282
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 5
    end
    object Edit1: TEdit
      Left = 581
      Top = 65
      Width = 137
      Height = 21
      Anchors = [akTop, akRight]
      ReadOnly = True
      TabOrder = 7
      OnKeyDown = EdtRecvStockKeyDown
    end
    object CmbG: TLabeledEdit
      Left = 90
      Top = 91
      Width = 109
      Height = 21
      EditLabel.Width = 50
      EditLabel.Height = 13
      EditLabel.Caption = #21046#21333#20154'[&J]:'
      LabelPosition = lpLeft
      LabelSpacing = 3
      ReadOnly = True
      TabOrder = 8
    end
    object cmbc: TLabeledEdit
      Left = 323
      Top = 91
      Width = 126
      Height = 21
      EditLabel.Width = 53
      EditLabel.Height = 13
      EditLabel.Caption = #32463#25163#20154'[&H]:'
      LabelPosition = lpLeft
      LabelSpacing = 3
      ReadOnly = True
      TabOrder = 9
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 421
    Width = 762
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    BevelOuter = bvNone
    Color = 16573127
    TabOrder = 1
    object BtnSave: TBitBtn
      Left = 600
      Top = 8
      Width = 75
      Height = 25
      Caption = #20445#23384'[&S]'
      TabOrder = 0
      OnClick = BtnSaveClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
    end
    object BtnClose: TBitBtn
      Left = 680
      Top = 8
      Width = 75
      Height = 25
      Caption = #36864#20986'[&X]'
      TabOrder = 1
      OnClick = BtnCloseClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
        03333377777777777F333301BBBBBBBB033333773F3333337F3333011BBBBBBB
        0333337F73F333337F33330111BBBBBB0333337F373F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337FF3337F33330111B0BBBB
        0333337F337733337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F3F7F33337F333301E10BBBBB0333337F7F7F33337F333301EE0BBBBB
        0333337F777FFFFF7F3333000000000003333377777777777333}
      NumGlyphs = 2
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 148
    Width = 762
    Height = 273
    Align = alClient
    TabOrder = 2
    object sgorder: TStringGrid
      Left = 43
      Top = 1
      Width = 716
      Height = 271
      ColCount = 8
      Ctl3D = False
      DefaultRowHeight = 22
      FixedColor = 16573127
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
      ParentCtl3D = False
      TabOrder = 0
      OnDblClick = sgorderDblClick
      OnDrawCell = sgorderDrawCell
      OnKeyDown = sgorderKeyDown
      OnKeyPress = sgorderKeyPress
      OnSelectCell = sgorderSelectCell
      ColWidths = (
        64
        90
        86
        64
        81
        71
        64
        64)
    end
    object Panel10: TPanel
      Left = 1
      Top = 1
      Width = 43
      Height = 271
      Align = alLeft
      Color = clSkyBlue
      TabOrder = 1
      object Cmd_Delete: TSpeedButton
        Left = 2
        Top = 52
        Width = 40
        Height = 25
        Caption = #20943#34892
        Flat = True
        NumGlyphs = 2
        OnClick = Cmd_DeleteClick
      end
      object Cmd_Add: TSpeedButton
        Left = 2
        Top = 27
        Width = 40
        Height = 25
        Caption = #22686#34892
        Flat = True
        NumGlyphs = 2
        OnClick = Cmd_AddClick
      end
    end
  end
  object CdsMasterData: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'PubProvider'
    RemoteServer = frm_Data.Socket_Connection
    BeforeGetRecords = CdsMasterDataBeforeGetRecords
    Left = 368
    Top = 200
  end
  object CdsDetailData: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'PubProvider'
    RemoteServer = frm_Data.Socket_Connection
    BeforeGetRecords = CdsDetailDataBeforeGetRecords
    Left = 440
    Top = 200
  end
end
