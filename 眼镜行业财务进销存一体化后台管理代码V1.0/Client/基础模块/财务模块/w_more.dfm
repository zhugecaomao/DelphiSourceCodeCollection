object w_morefm: Tw_morefm
  Left = 44
  Top = 33
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #36130#21153#27169#22359
  ClientHeight = 510
  ClientWidth = 712
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 438
    Width = 712
    Height = 72
    Align = alBottom
    BevelOuter = bvLowered
    Color = clGradientActiveCaption
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    DesignSize = (
      712
      72)
    object Label24: TLabel
      Left = 15
      Top = 43
      Width = 54
      Height = 12
      Anchors = [akLeft, akBottom]
      Caption = #23457#26680#20154'[&S]'
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object BtnSelCheck: TSpeedButton
      Left = 157
      Top = 41
      Width = 23
      Height = 22
      Anchors = [akLeft, akBottom]
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
      Visible = False
      OnClick = BtnSelCheckClick
    end
    object Label4: TLabel
      Left = 16
      Top = 46
      Width = 54
      Height = 12
      Anchors = [akLeft, akBottom]
      Caption = #32463#25163#20154'[&R]'
      FocusControl = EditDoman
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object BtnSelDoman: TSpeedButton
      Left = 151
      Top = 41
      Width = 23
      Height = 22
      Anchors = [akLeft, akBottom]
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
      OnClick = BtnSelDomanClick
    end
    object Label25: TLabel
      Left = 326
      Top = 47
      Width = 54
      Height = 12
      Anchors = [akLeft, akBottom]
      Caption = #21046#21333#20154'[&W]'
      FocusControl = BillEEdit
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object BitBtn2: TBitBtn
      Left = 628
      Top = 38
      Width = 75
      Height = 25
      Cancel = True
      Caption = #20445#23384'[&Q]'
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 0
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
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 710
      Height = 25
      Align = alTop
      BevelInner = bvLowered
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 1
      object Label13: TLabel
        Left = 458
        Top = 7
        Width = 48
        Height = 12
        Caption = #21512#35745#37329#39069
      end
      object TotalMoneyTb: TLabel
        Left = 522
        Top = 7
        Width = 6
        Height = 12
        Caption = '0'
      end
    end
    object CheckEdit: TEdit
      Left = 77
      Top = 43
      Width = 76
      Height = 20
      Anchors = [akLeft, akBottom]
      ReadOnly = True
      TabOrder = 2
      Visible = False
    end
    object EditDoman: TEdit
      Tag = 4
      Left = 71
      Top = 43
      Width = 78
      Height = 20
      Anchors = [akLeft, akBottom]
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
      OnEnter = Edit3Enter
      OnKeyDown = EditDomanKeyDown
    end
    object BillEEdit: TEdit
      Tag = 6
      Left = 380
      Top = 43
      Width = 72
      Height = 20
      Anchors = [akLeft, akBottom]
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object bitcheck: TBitBtn
      Left = 552
      Top = 38
      Width = 75
      Height = 25
      Caption = #23457#26680
      TabOrder = 5
      OnClick = bitcheckClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333FFF33F333FF3F330E0330FFFCCFCC33777FF7F3377F7730EEE030FFFC
        CFCC377777F7F33773770EEE0000FFFFFCCF777777773F33377FEEE0BFBF0FFF
        FCCF7777333373F337730E0BFBFBF0FFCCFF77733333373F77F330BFBFBFBF0F
        CCFF37F333333F7F773330FBFBFB0B0FFFFF37F3F33F737FFFFF30B0BF0FB000
        000037F73F73F777777730FB0BF0FB0FFFFF373F73F73F7F333F330030BF0F0F
        FF993F77373F737F3377CC33330BF00FFF9977FFF373F77F3F77CC993330009F
        99FF7777F337777F77F333993330F99F99FF3F77FF37F773773F993CC330FFF9
        9F9977F77F37F3377F77993CC330FFF99F997737733733377377}
      NumGlyphs = 2
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 0
    Width = 712
    Height = 105
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 1
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 710
      Height = 103
      Align = alClient
      BevelOuter = bvNone
      Color = clGradientActiveCaption
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Label1: TLabel
        Left = 197
        Top = 16
        Width = 66
        Height = 12
        Caption = #24405#21333#26085#26399'[&D]'
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 396
        Top = 13
        Width = 48
        Height = 12
        Caption = #21333#25454#32534#21495
      end
      object Label3: TLabel
        Left = 22
        Top = 52
        Width = 48
        Height = 12
        Caption = #20184#27454#21333#20301
        FocusControl = Edit3
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 22
        Top = 80
        Width = 48
        Height = 12
        Caption = #25688'    '#35201
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object BtnSelPayComponey: TSpeedButton
        Left = 243
        Top = 47
        Width = 21
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
        OnClick = BtnSelPayComponeyClick
      end
      object Label9: TLabel
        Left = 23
        Top = 12
        Width = 66
        Height = 19
        Caption = 'Label9'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -19
        Font.Name = #23435#20307
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 356
        Top = 48
        Width = 66
        Height = 12
        Caption = #20184#27454#24080#25143'[&Z]'
        FocusControl = Edit5
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object BtnSelPayAccount: TSpeedButton
        Left = 534
        Top = 46
        Width = 21
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
        OnClick = BtnSelPayAccountClick
      end
      object Edit2: TEdit
        Tag = 2
        Left = 452
        Top = 11
        Width = 207
        Height = 20
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        Text = '12212'
      end
      object Edit3: TEdit
        Tag = 3
        Left = 75
        Top = 47
        Width = 164
        Height = 20
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        OnDblClick = BtnSelPayComponeyClick
        OnEnter = Edit3Enter
        OnKeyDown = Edit3KeyDown
      end
      object Edit6: TEdit
        Tag = 8
        Left = 75
        Top = 74
        Width = 482
        Height = 20
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object Edit5: TEdit
        Tag = 4
        Left = 423
        Top = 45
        Width = 109
        Height = 20
        ReadOnly = True
        TabOrder = 3
        Text = #29616#37329
        OnEnter = Edit3Enter
      end
      object MaskEdit1: TDateTimePicker
        Left = 269
        Top = 10
        Width = 97
        Height = 20
        CalAlignment = dtaLeft
        Date = 38056.9088488194
        Time = 38056.9088488194
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 4
      end
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 105
    Width = 712
    Height = 333
    Align = alClient
    BevelOuter = bvLowered
    BevelWidth = 3
    Caption = 'Panel5'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object SuperDataGrid1: TStringGrid
      Left = 80
      Top = 3
      Width = 625
      Height = 323
      Color = clWhite
      Ctl3D = False
      DefaultRowHeight = 17
      RowCount = 2
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goColSizing, goEditing, goTabs]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      OnDblClick = SuperDataGrid1DblClick
      OnKeyDown = SuperDataGrid1KeyDown
      OnKeyPress = SuperDataGrid1KeyPress
      OnKeyUp = SuperDataGrid1KeyUp
      ColWidths = (
        30
        86
        148
        130
        94)
      RowHeights = (
        17
        17)
    end
    object StringGrid1: TStringGrid
      Left = 264
      Top = 152
      Width = 313
      Height = 113
      RowCount = 18
      TabOrder = 1
      Visible = False
    end
    object BitBtn1: TBitBtn
      Left = 6
      Top = 8
      Width = 71
      Height = 23
      Caption = #22686#34892
      TabOrder = 2
      OnClick = BitBtn1Click
    end
    object BitBtn3: TBitBtn
      Left = 7
      Top = 34
      Width = 70
      Height = 22
      Caption = #21024#34892
      TabOrder = 3
      OnClick = BitBtn3Click
    end
  end
  object cdsdata: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 616
    Top = 56
  end
end
