object FmPosQuestBillStr: TFmPosQuestBillStr
  Left = 6
  Top = 49
  Width = 770
  Height = 509
  BorderIcons = [biSystemMenu]
  Caption = #37197#36865#36864#36135#21333
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 762
    Height = 153
    Align = alTop
    TabOrder = 0
    DesignSize = (
      762
      153)
    object Label4: TLabel
      Left = 300
      Top = 102
      Width = 6
      Height = 12
    end
    object Label6: TLabel
      Left = 31
      Top = 129
      Width = 72
      Height = 12
      Caption = #22791'    '#27880'[&F]:'
      FocusControl = EdtMemo
    end
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 760
      Height = 32
      Align = alTop
      BevelInner = bvLowered
      BevelOuter = bvNone
      Color = 16573127
      TabOrder = 1
      object BtnAddRow: TSpeedButton
        Left = 633
        Top = 6
        Width = 20
        Height = 20
        Hint = #22686#21152#19968#34892
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
        OnClick = BtnAddRowClick
      end
      object BtnDelRow: TSpeedButton
        Left = 658
        Top = 6
        Width = 20
        Height = 20
        Hint = #20943#23569#19968#34892
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
        OnClick = BtnDelRowClick
      end
      object sourcebill: TSpeedButton
        Left = 682
        Top = 6
        Width = 20
        Height = 20
        Hint = #35843#21407#22987#21333#25454
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
        Left = 707
        Top = 6
        Width = 20
        Height = 20
        Hint = #26597#35810
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
        Left = 731
        Top = 6
        Width = 20
        Height = 20
        Hint = #24110#21161
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
      object BillTitle: TLabel
        Left = 19
        Top = 4
        Width = 118
        Height = 22
        AutoSize = False
        Caption = #37197#36865#25910#36135#21333
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlue
        Font.Height = -20
        Font.Name = #23435#20307
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
    end
    object EdtMemo: TEdit
      Left = 105
      Top = 123
      Width = 615
      Height = 20
      Anchors = [akTop, akRight]
      MaxLength = 66
      ReadOnly = True
      TabOrder = 0
    end
    object StaticText1: TStaticText
      Left = 31
      Top = 46
      Width = 82
      Height = 16
      Caption = #21333#25454#32534#21495'[&N]:'
      TabOrder = 2
    end
    object EdtBillNo: TEdit
      Left = 106
      Top = 42
      Width = 270
      Height = 20
      TabStop = False
      ReadOnly = True
      TabOrder = 3
      Text = 'PS00001-000001'
    end
    object edtsendshop: TLabeledEdit
      Left = 107
      Top = 67
      Width = 121
      Height = 20
      EditLabel.Width = 72
      EditLabel.Height = 12
      EditLabel.Caption = #21457#36135#20179#24211'[&B]:'
      LabelPosition = lpLeft
      LabelSpacing = 3
      ReadOnly = True
      TabOrder = 4
    end
    object edtRecvStock: TLabeledEdit
      Left = 377
      Top = 68
      Width = 121
      Height = 20
      EditLabel.Width = 72
      EditLabel.Height = 12
      EditLabel.Caption = #25910#36135#20179#24211'[&S]:'
      LabelPosition = lpLeft
      LabelSpacing = 3
      ReadOnly = True
      TabOrder = 5
    end
    object edtm: TLabeledEdit
      Left = 107
      Top = 96
      Width = 121
      Height = 20
      EditLabel.Width = 72
      EditLabel.Height = 12
      EditLabel.Caption = #21046' '#21333' '#20154'[&Z]:'
      LabelPosition = lpLeft
      LabelSpacing = 3
      ReadOnly = True
      TabOrder = 6
    end
    object edtg: TLabeledEdit
      Left = 378
      Top = 96
      Width = 121
      Height = 20
      EditLabel.Width = 72
      EditLabel.Height = 12
      EditLabel.Caption = #32463' '#25163' '#20154'[&J]:'
      LabelPosition = lpLeft
      LabelSpacing = 3
      ReadOnly = True
      TabOrder = 7
    end
    object edtc: TLabeledEdit
      Left = 598
      Top = 96
      Width = 121
      Height = 20
      EditLabel.Width = 72
      EditLabel.Height = 12
      EditLabel.Caption = #23457' '#26680' '#20154'[&H]:'
      LabelPosition = lpLeft
      LabelSpacing = 3
      ReadOnly = True
      TabOrder = 8
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 441
    Width = 762
    Height = 41
    Align = alBottom
    BevelOuter = bvLowered
    Color = 16573127
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 600
      Top = 8
      Width = 75
      Height = 25
      Caption = #20445#23384'[&S]'
      TabOrder = 0
      Visible = False
      OnClick = BitBtn1Click
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
    object BitBtn2: TBitBtn
      Left = 680
      Top = 8
      Width = 75
      Height = 25
      Caption = #36864#20986'[&X]'
      TabOrder = 1
      OnClick = BitBtn2Click
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
    object bitcheck: TBitBtn
      Left = 601
      Top = 8
      Width = 75
      Height = 25
      Caption = #25910#36135#39564#25910
      TabOrder = 2
      OnClick = bitcheckClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
        DADAADADADADADADADADDADADAD000000000ADADADA0FFFFFFF0DADA0000F00F
        00F0ADAD0FF0FFFFFFF0D0000F00F00F00F0A0FF0FF0FFFFFFF0D0F00F00F00F
        00F0A0FF0FF0FFFFFFF0D0F00F0000000000A0FF0FFFFFFF0DADD0F000000000
        0ADAA0FFFFFFF0ADADADD000000000DADADAADADADADADADADAD}
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 153
    Width = 762
    Height = 288
    Align = alClient
    TabOrder = 2
    object sgorder: TStringGrid
      Left = 1
      Top = 1
      Width = 760
      Height = 286
      Align = alClient
      ColCount = 8
      Ctl3D = False
      DefaultRowHeight = 22
      FixedColor = 16573127
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
      ParentCtl3D = False
      PopupMenu = PopupMenu1
      TabOrder = 0
      OnDblClick = sgorderDblClick
      OnDrawCell = sgorderDrawCell
      OnKeyDown = sgorderKeyDown
      OnKeyPress = sgorderKeyPress
      OnMouseMove = sgorderMouseMove
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
  end
  object PopupMenu1: TPopupMenu
    Left = 368
    Top = 8
    object N1: TMenuItem
      Caption = #26032#22686
    end
    object N2: TMenuItem
      Caption = #21024#38500
    end
  end
  object CdsMasterData: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'PubProvider'
    RemoteServer = frm_Data.Socket_Connection
    Left = 368
    Top = 200
  end
  object CdsDetailData: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'PubProvider'
    RemoteServer = frm_Data.Socket_Connection
    Left = 440
    Top = 200
  end
end
