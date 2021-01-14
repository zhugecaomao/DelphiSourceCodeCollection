object LeftForm: TLeftForm
  Left = 183
  Top = 75
  BorderStyle = bsSingle
  Caption = #23458#25143#32467#24080#31383#21475'('#27880#24847#20462#25913#25240#25187#21644#32467#26463#26102#38388')'
  ClientHeight = 414
  ClientWidth = 468
  Color = clBtnFace
  UseDockManager = True
  Font.Charset = GB2312_CHARSET
  Font.Color = clBlack
  Font.Height = -14
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnActivate = FormActivate
  OnCanResize = FormCanResize
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    468
    414)
  PixelsPerInch = 96
  TextHeight = 14
  object Image1: TImage
    Left = 280
    Top = 212
    Width = 175
    Height = 170
    Anchors = [akRight, akBottom]
    Stretch = True
  end
  object SBar: TStatusBar
    Left = 0
    Top = 395
    Width = 468
    Height = 19
    Panels = <>
    SimplePanel = True
    SimpleText = #25552#31034#20449#24687#65306
  end
  object GroupBox1: TGroupBox
    Left = 12
    Top = 8
    Width = 257
    Height = 375
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = ' '#23458#25143#32467#24080' '
    TabOrder = 1
    DesignSize = (
      257
      375)
    object Label1: TLabel
      Left = 19
      Top = 28
      Width = 70
      Height = 14
      Caption = #27969' '#27700' '#21495#65306
    end
    object Label2: TLabel
      Left = 19
      Top = 62
      Width = 70
      Height = 14
      Caption = #23089#20048#21517#31216#65306
    end
    object Label4: TLabel
      Left = 19
      Top = 131
      Width = 70
      Height = 14
      Caption = #32467#26463#26102#38388#65306
    end
    object Label10: TLabel
      Left = 19
      Top = 201
      Width = 70
      Height = 14
      Caption = #23454#25910#37329#39069#65306
    end
    object Label9: TLabel
      Left = 19
      Top = 166
      Width = 70
      Height = 14
      Caption = #25240#25187#27604#29575#65306
    end
    object Label3: TLabel
      Left = 19
      Top = 96
      Width = 70
      Height = 14
      Caption = #24320#21488#26102#38388#65306
    end
    object Edit3: TDBEdit
      Left = 88
      Top = 92
      Width = 151
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      DataField = #24320#22987#26102#38388
      DataSource = P1s
      Enabled = False
      ReadOnly = True
      TabOrder = 0
    end
    object Edit10: TDBEdit
      Left = 88
      Top = 197
      Width = 151
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      DataField = #23454#25910#37329#39069
      DataSource = P1s
      ReadOnly = True
      TabOrder = 1
    end
    object Edit2: TEdit
      Left = 88
      Top = 58
      Width = 151
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
    end
    object Edit9: TDBLookupComboBox
      Left = 89
      Top = 162
      Width = 151
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      Color = clGreen
      DataField = #25240#25187#27604#29575
      DataSource = P1s
      Font.Charset = GB2312_CHARSET
      Font.Color = clWhite
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      KeyField = #25240#25187#27604#29575
      ListField = #25240#25187#21517#31216
      ListSource = DM.Rates
      ParentFont = False
      TabOrder = 3
    end
    object Edit4: TDBEdit
      Left = 88
      Top = 127
      Width = 151
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      DataField = #32467#26463#26102#38388
      DataSource = P1s
      Enabled = False
      ReadOnly = True
      TabOrder = 4
    end
    object Memo1: TMemo
      Left = 12
      Top = 234
      Width = 231
      Height = 127
      Anchors = [akLeft, akTop, akRight, akBottom]
      ReadOnly = True
      TabOrder = 5
    end
    object Edit1: TComboBox
      Left = 88
      Top = 24
      Width = 152
      Height = 22
      Style = csOwnerDrawFixed
      Anchors = [akLeft, akTop, akRight]
      Color = clGreen
      Font.Charset = GB2312_CHARSET
      Font.Color = clWhite
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 6
      OnClick = Edit1Click
      OnDrawItem = Edit1DrawItem
    end
  end
  object Panel1: TPanel
    Left = 280
    Top = 14
    Width = 175
    Height = 191
    Anchors = [akTop, akRight, akBottom]
    BevelInner = bvLowered
    TabOrder = 3
    object Button1: TButton
      Left = 40
      Top = 17
      Width = 97
      Height = 25
      Caption = #25171#21333'(&P)'
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button3: TButton
      Left = 40
      Top = 87
      Width = 97
      Height = 25
      Cancel = True
      Caption = #36864#20986'(&X)'
      ModalResult = 2
      TabOrder = 2
      OnClick = Button3Click
    end
    object Button2: TButton
      Left = 40
      Top = 52
      Width = 97
      Height = 25
      Caption = #32467#36716'(&Z)'
      Enabled = False
      TabOrder = 0
      OnClick = Button2Click
    end
  end
  object QuickRep1: TQuickRep
    Left = 24
    Top = 24
    Width = 380
    Height = 353
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    DataSet = P1
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE')
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    OnPreview = QuickRep1Preview
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = Custom
    Page.Values = (
      20
      935
      20
      1005.4
      20
      20
      0)
    PrinterSettings.Copies = 1
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.OutputBin = Auto
    PrintIfEmpty = True
    ReportTitle = #36825#37324#26159#25253#34920#26631#39064
    SnapToGrid = True
    Units = MM
    Zoom = 100
    object PageHeaderBand1: TQRBand
      Left = 8
      Top = 8
      Width = 365
      Height = 35
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        92.6041666666667
        965.729166666667)
      BandType = rbPageHeader
      object QRLabel1: TQRLabel
        Left = 93
        Top = 5
        Width = 178
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.1458333333333
          246.0625
          13.2291666666667
          470.958333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = #38596#31098#20307#32946#27963#21160#20013#24515
        Color = clWhite
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 16
      end
    end
    object QRBand1: TQRBand
      Left = 8
      Top = 197
      Width = 365
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      BeforePrint = PrintBall02
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        63.5
        965.729166666667)
      BandType = rbGroupFooter
      object QRExpr2: TQRExpr
        Left = 267
        Top = 3
        Width = 83
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          706.4375
          7.9375
          219.604166666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        Master = QRSubDetail1
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'SUM(P2.'#37329#39069')'
        Mask = #65509'0.00'#20803
        FontSize = 10
      end
    end
    object ChildBand1: TQRChildBand
      Left = 8
      Top = 221
      Width = 365
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = PrintBall02
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        18.5208333333333
        965.729166666667)
      ParentBand = QRBand1
    end
    object QRBand2: TQRBand
      Left = 8
      Top = 276
      Width = 365
      Height = 67
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        177.270833333333
        965.729166666667)
      BandType = rbGroupFooter
      object QRDBText13: TQRDBText
        Left = 86
        Top = 7
        Width = 53
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.3333333333333
          227.541666666667
          18.5208333333333
          140.229166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = P1
        DataField = #23454#25910#37329#39069
        Mask = #65509'0.00'#20803
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel17: TQRLabel
        Left = 8
        Top = 28
        Width = 157
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          21.1666666666667
          74.0833333333333
          415.395833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = #22320#22336#65306#24800#26223#22478#24800#26223#24066#22330#20108#27004
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel18: TQRLabel
        Left = 8
        Top = 47
        Width = 196
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          21.1666666666667
          124.354166666667
          518.583333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = #30005#35805#65306#65296#65303#65301#65303#65293#65299#65304#65297#65303#65297#65303#65303
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel16: TQRLabel
        Left = 8
        Top = 7
        Width = 66
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.3333333333333
          21.1666666666667
          18.5208333333333
          174.625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = #23454#25910#37329#39069#65306
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object QRBand3: TQRBand
      Left = 8
      Top = 149
      Width = 365
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = False
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      BeforePrint = PrintBall02
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        63.5
        965.729166666667)
      BandType = rbGroupHeader
      object QRLabel6: TQRLabel
        Left = 8
        Top = 6
        Width = 53
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          21.1666666666667
          15.875
          140.229166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = #37202#27700#21517#31216
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel7: TQRLabel
        Left = 96
        Top = 6
        Width = 70
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          254
          15.875
          185.208333333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = #21333#12288#20215
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel8: TQRLabel
        Left = 192
        Top = 6
        Width = 70
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          508
          15.875
          185.208333333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = #25968#12288#37327
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel9: TQRLabel
        Left = 288
        Top = 6
        Width = 70
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          762
          15.875
          185.208333333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = #37329#12288#39069
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object QRBand4: TQRBand
      Left = 8
      Top = 228
      Width = 365
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = False
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      BeforePrint = QRBand4BeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        63.5
        965.729166666667)
      BandType = rbGroupHeader
      object QRLabel12: TQRLabel
        Left = 8
        Top = 6
        Width = 40
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          21.1666666666667
          15.875
          105.833333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = #25130#38047#21495
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel13: TQRLabel
        Left = 72
        Top = 6
        Width = 53
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          190.5
          15.875
          140.229166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = #24320#22987#26102#38388
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel14: TQRLabel
        Left = 184
        Top = 6
        Width = 53
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          486.833333333333
          15.875
          140.229166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = #32467#26463#26102#38388
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel15: TQRLabel
        Left = 295
        Top = 6
        Width = 27
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          780.520833333333
          15.875
          71.4375)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = #37329#39069
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object ChildBand2: TQRChildBand
      Left = 8
      Top = 142
      Width = 365
      Height = 7
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        18.5208333333333
        965.729166666667)
      ParentBand = DetailBand1
    end
    object QRSubDetail1: TQRSubDetail
      Left = 8
      Top = 173
      Width = 365
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = False
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      BeforePrint = PrintBall02
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        63.5
        965.729166666667)
      Master = QuickRep1
      DataSet = P2
      FooterBand = QRBand1
      HeaderBand = QRBand3
      PrintBefore = False
      PrintIfEmpty = True
      object QRDBText5: TQRDBText
        Left = 8
        Top = 6
        Width = 85
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.3333333333333
          21.1666666666667
          15.875
          224.895833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = P2
        DataField = #21517#31216
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText6: TQRDBText
        Left = 96
        Top = 6
        Width = 71
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.3333333333333
          254
          15.875
          187.854166666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = P2
        DataField = #21333#20215
        Mask = '$0.00'#20803
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText7: TQRDBText
        Left = 192
        Top = 6
        Width = 70
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.3333333333333
          508
          15.875
          185.208333333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = P2
        DataField = #25968#37327
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText8: TQRDBText
        Left = 272
        Top = 6
        Width = 70
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.3333333333333
          719.666666666667
          15.875
          185.208333333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = P2
        DataField = #37329#39069
        Mask = #65509'0.00'#20803
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object QRSubDetail2: TQRSubDetail
      Left = 8
      Top = 252
      Width = 365
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = False
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      BeforePrint = QRBand4BeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        63.5
        965.729166666667)
      Master = QuickRep1
      DataSet = P3
      FooterBand = QRBand2
      HeaderBand = QRBand4
      PrintBefore = False
      PrintIfEmpty = True
      object QRDBText10: TQRDBText
        Left = 74
        Top = 6
        Width = 53
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          195.791666666667
          15.875
          140.229166666667)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = P3
        DataField = #24320#22987#26102#38388
        Mask = 'hh"'#28857'"mm"'#20998'"'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText11: TQRDBText
        Left = 184
        Top = 6
        Width = 53
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          486.833333333333
          15.875
          140.229166666667)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = P3
        DataField = #32467#26463#26102#38388
        Mask = 'hh"'#28857'"mm"'#20998'"'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText12: TQRDBText
        Left = 295
        Top = 6
        Width = 27
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          780.520833333333
          15.875
          71.4375)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = P3
        DataField = #37329#39069
        Mask = #65509'0.00'#20803
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRExpr1: TQRExpr
        Left = 12
        Top = 6
        Width = 36
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.3333333333333
          31.75
          15.875
          95.25)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        Master = QRSubDetail2
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'COUNT'
        FontSize = 10
      end
    end
    object DetailBand1: TQRBand
      Left = 8
      Top = 43
      Width = 365
      Height = 99
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        261.9375
        965.729166666667)
      BandType = rbDetail
      object QRLabel2: TQRLabel
        Left = 195
        Top = 7
        Width = 66
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          515.9375
          18.5208333333333
          174.625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = #23089#20048#21517#31216#65306
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel3: TQRLabel
        Left = 11
        Top = 29
        Width = 66
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          29.1041666666667
          76.7291666666667
          174.625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = #24320#21488#26102#38388#65306
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel4: TQRLabel
        Left = 195
        Top = 29
        Width = 66
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          515.9375
          76.7291666666667
          174.625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = #32467#26463#26102#38388#65306
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel5: TQRLabel
        Left = 195
        Top = 51
        Width = 66
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          515.9375
          134.9375
          174.625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = #28040#36153#26102#38388#65306
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText1: TQRDBText
        Left = 264
        Top = 7
        Width = 27
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          698.5
          18.5208333333333
          71.4375)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = P1
        DataField = #21517#31216
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText2: TQRDBText
        Left = 80
        Top = 29
        Width = 53
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          211.666666666667
          76.7291666666667
          140.229166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = P1
        DataField = #24320#22987#26102#38388
        Mask = 'hh"'#28857'"mm"'#20998'"'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText3: TQRDBText
        Left = 264
        Top = 29
        Width = 53
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          698.5
          76.7291666666667
          140.229166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = P1
        DataField = #32467#26463#26102#38388
        Mask = 'hh"'#28857'"mm"'#20998'"'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel21: TQRLabel
        Left = 11
        Top = 7
        Width = 67
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          29.1041666666667
          18.5208333333333
          177.270833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = #27969' '#27700' '#21495#65306
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText14: TQRDBText
        Left = 80
        Top = 7
        Width = 40
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          211.666666666667
          18.5208333333333
          105.833333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = P1
        DataField = #27969#27700#21495
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel22: TQRLabel
        Left = 11
        Top = 51
        Width = 66
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          29.1041666666667
          134.9375
          174.625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = #21488#12288#12288#21495#65306
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText15: TQRDBText
        Left = 80
        Top = 51
        Width = 27
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          211.666666666667
          134.9375
          71.4375)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = P1
        DataField = #32534#21495
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText4: TQRDBText
        Left = 264
        Top = 51
        Width = 53
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.3333333333333
          698.5
          134.9375
          140.229166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = P1
        DataField = #28040#36153#26102#38388
        Mask = '#0.00'#23567#26102
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel10: TQRLabel
        Left = 11
        Top = 73
        Width = 66
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.3333333333333
          29.1041666666667
          193.145833333333
          174.625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = #31199#25293#37329#39069#65306
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel11: TQRLabel
        Left = 195
        Top = 73
        Width = 66
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.3333333333333
          515.9375
          193.145833333333
          174.625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = #23089#20048#37329#39069#65306
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText9: TQRDBText
        Left = 80
        Top = 73
        Width = 53
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.3333333333333
          211.666666666667
          193.145833333333
          140.229166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = P1
        DataField = #31199#25293#37329#39069
        Mask = #65509'0.00'#20803
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText16: TQRDBText
        Left = 264
        Top = 73
        Width = 53
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.3333333333333
          698.5
          193.145833333333
          140.229166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = P1
        DataField = #23089#20048#37329#39069
        Mask = #65509'0.00'#20803
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
  end
  object P2: TQuery
    DatabaseName = 'PlayBall'
    RequestLive = True
    Left = 384
    Top = 248
  end
  object P3: TQuery
    DatabaseName = 'PlayBall'
    RequestLive = True
    Left = 416
    Top = 248
  end
  object P2s: TDataSource
    DataSet = P2
    Left = 384
    Top = 304
  end
  object P3s: TDataSource
    DataSet = P3
    Left = 416
    Top = 304
  end
  object P1s: TDataSource
    DataSet = P1
    Left = 352
    Top = 304
  end
  object P1: TQuery
    CachedUpdates = True
    AfterPost = P1AfterPost
    DatabaseName = 'PlayBall'
    RequestLive = True
    UpdateObject = UpdateSQL1
    Left = 352
    Top = 248
  end
  object Timer1: TTimer
    Interval = 100
    OnTimer = Timer1Timer
    Left = 320
    Top = 304
  end
  object UpdateSQL1: TUpdateSQL
    ModifySQL.Strings = (
      'Update Ball01'
      'Set'
      '  '#23089#20048#37329#39069' = :'#23089#20048#37329#39069','
      '  '#37202#27700#37329#39069' = :'#37202#27700#37329#39069','
      '  '#23454#25910#37329#39069' = :'#23454#25910#37329#39069','
      '  '#32467#26463#26102#38388' = :'#32467#26463#26102#38388','
      '  '#32467#24080#26631#24535' = :'#32467#24080#26631#24535','
      '  '#25240#25187#27604#29575' = :'#25240#25187#27604#29575','
      '  '#26085#26399' = :'#26085#26399','#22791#27880' = :'#22791#27880
      'where'
      '  '#27969#27700#21495' = :OLD_'#27969#27700#21495)
    Left = 320
    Top = 248
  end
end
