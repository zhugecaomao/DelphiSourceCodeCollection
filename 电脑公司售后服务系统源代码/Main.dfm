object FrmMain: TFrmMain
  Left = 211
  Top = 150
  BorderStyle = bsNone
  Caption = 'FrmMain'
  ClientHeight = 524
  ClientWidth = 729
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  Visible = True
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object MainTitle: TFlatTitlebar
    Left = 0
    Top = 0
    Width = 729
    Height = 25
    ActiveTextColor = clYellow
    InactiveTextColor = clMoneyGreen
    TitlebarColor = clGreen
    Align = alTop
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = #23435#20307
    Font.Style = []
    Caption = #30005#33041#20844#21496#21806#21518#26381#21153#31995#32479
    object BtnExit2: TFlatButton
      Left = 704
      Top = 0
      Width = 25
      Height = 25
      Color = clGreen
      ColorFocused = clGreen
      ColorDown = clGreen
      ColorBorder = clGreen
      ColorHighLight = clLime
      Caption = #215
      Font.Charset = GB2312_CHARSET
      Font.Color = clYellow
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
      ParentColor = False
      TabOrder = 0
      OnClick = SubExitClick
    end
  end
  object PanelTop: TFlatPanel
    Left = 0
    Top = 25
    Width = 729
    Height = 92
    ParentColor = True
    ColorHighLight = clGreen
    ColorShadow = clGreen
    Align = alTop
    TabOrder = 1
    object CoolBar1: TCoolBar
      Left = 1
      Top = 1
      Width = 727
      Height = 90
      AutoSize = True
      BandBorderStyle = bsNone
      Bands = <
        item
          Control = ToolBar1
          ImageIndex = -1
          MinHeight = 20
          Width = 727
        end
        item
          Control = ToolBar2
          ImageIndex = -1
          MinHeight = 35
          Width = 727
        end
        item
          Control = ToolBar3
          ImageIndex = -1
          MinHeight = 35
          Width = 727
        end>
      Ctl3D = False
      EdgeInner = esNone
      EdgeOuter = esNone
      object ToolBar1: TToolBar
        Left = 9
        Top = 0
        Width = 714
        Height = 20
        Align = alNone
        ButtonHeight = 20
        ButtonWidth = 91
        Caption = 'ToolBar1'
        Ctl3D = True
        EdgeBorders = []
        EdgeInner = esNone
        EdgeOuter = esNone
        Flat = True
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        ShowCaptions = True
        TabOrder = 0
        Transparent = True
        object TBtnSys1: TToolButton
          Left = 0
          Top = 0
          Caption = #31995#32479#30331#24405'(&L))'
          Grouped = True
          MenuItem = MenuSys1
        end
        object TBtnSys2: TToolButton
          Left = 91
          Top = 0
          Caption = #31995#32479#35774#32622'(&S)'
          Grouped = True
          MenuItem = MenuSys
        end
        object TBtnMgr: TToolButton
          Left = 182
          Top = 0
          Caption = #23458#25143#31649#29702'(&M)'
          Grouped = True
          MenuItem = MenuMgr
        end
        object TBtnDataMgr: TToolButton
          Left = 273
          Top = 0
          Caption = #25968#25454#24211#31649#29702'(&D)'
          Grouped = True
          MenuItem = MenuDataMgr
        end
        object TBtnHelp: TToolButton
          Left = 364
          Top = 0
          Caption = #24110#21161'(&H)'
          Grouped = True
          MenuItem = MenuHelp
        end
      end
      object ToolBar2: TToolBar
        Left = 9
        Top = 20
        Width = 714
        Height = 35
        ButtonHeight = 35
        ButtonWidth = 67
        Caption = 'ToolBar2'
        EdgeInner = esNone
        EdgeOuter = esNone
        Flat = True
        Images = ImageList1
        ShowCaptions = True
        TabOrder = 1
        Transparent = True
        object TBtnLogin: TToolButton
          Left = 0
          Top = 0
          Caption = #25805#20316#21592#30331#24405
          ImageIndex = 0
          OnClick = SubLoginClick
        end
        object TBtnLoginOff: TToolButton
          Left = 67
          Top = 0
          Caption = #27880#38144
          ImageIndex = 2
          OnClick = TBtnLoginOffClick
        end
        object TBntExit: TToolButton
          Left = 134
          Top = 0
          Caption = #36864#20986#31243#24207
          ImageIndex = 1
          OnClick = SubExitClick
        end
      end
      object ToolBar3: TToolBar
        Left = 9
        Top = 55
        Width = 714
        Height = 35
        ButtonHeight = 35
        ButtonWidth = 67
        Caption = 'ToolBar3'
        EdgeInner = esNone
        EdgeOuter = esNone
        Flat = True
        Images = ImageList1
        ShowCaptions = True
        TabOrder = 2
        object TBtnEnter: TToolButton
          Left = 0
          Top = 0
          Caption = #23458#25143#24405#20837
          ImageIndex = 3
          OnClick = SubEnterClick
        end
        object l1: TToolButton
          Left = 67
          Top = 0
          Width = 15
          Caption = 'l1'
          ImageIndex = 8
          Style = tbsSeparator
        end
        object TBtnPT: TToolButton
          Left = 82
          Top = 0
          Caption = #26222#36890#29992#25143
          ImageIndex = 4
          OnClick = TBtnPTClick
        end
        object TBtnTS: TToolButton
          Left = 149
          Top = 0
          Caption = #29305#27530#23458#25143
          ImageIndex = 5
          OnClick = TBtnTSClick
        end
        object ToolButton1: TToolButton
          Left = 216
          Top = 0
          Width = 15
          Caption = 'ToolButton1'
          ImageIndex = 8
          Style = tbsSeparator
        end
        object BtnOverRun: TToolButton
          Left = 231
          Top = 0
          Caption = #36807#20445#23458#25143
          ImageIndex = 15
          OnClick = N15Click
        end
        object BtnWGB: TToolButton
          Left = 298
          Top = 0
          Caption = #26410#36807#20445#23458#25143
          ImageIndex = 16
          OnClick = N13Click
        end
        object l2: TToolButton
          Left = 365
          Top = 0
          Width = 15
          Caption = 'l2'
          ImageIndex = 8
          Style = tbsSeparator
        end
        object TBtnAll: TToolButton
          Left = 380
          Top = 0
          Caption = #25152#26377#23458#25143
          ImageIndex = 6
          OnClick = TBtnAllClick
        end
        object l3: TToolButton
          Left = 447
          Top = 0
          Width = 15
          Caption = 'l3'
          ImageIndex = 7
          Style = tbsSeparator
        end
        object TBtnSysTemSetup: TToolButton
          Left = 462
          Top = 0
          Caption = #25805#20316#21592#35774#32622
          ImageIndex = 7
          OnClick = SubCaoZuoRenClick
        end
        object Panel2: TPanel
          Left = 529
          Top = 0
          Width = 184
          Height = 35
          BevelOuter = bvNone
          TabOrder = 0
          object lblAmount: TLabel
            Left = 88
            Top = 16
            Width = 6
            Height = 12
          end
        end
      end
    end
  end
  object PanelBottom: TFlatPanel
    Left = 0
    Top = 501
    Width = 729
    Height = 23
    ParentColor = True
    ColorHighLight = clGreen
    ColorShadow = clGreen
    Align = alBottom
    TabOrder = 2
    object PanelLogin: TFlatPanel
      Left = 1
      Top = 1
      Width = 224
      Height = 21
      Caption = 'PanelLogin'
      ParentColor = True
      ColorHighLight = clGreen
      ColorShadow = clGreen
      Align = alLeft
      TabOrder = 0
    end
    object PanelLevel: TFlatPanel
      Left = 225
      Top = 1
      Width = 223
      Height = 21
      Caption = 'PanelLevel'
      ParentColor = True
      ColorHighLight = clGreen
      ColorShadow = clGreen
      Align = alClient
      TabOrder = 1
    end
    object PanelDateTime: TFlatPanel
      Left = 448
      Top = 1
      Width = 280
      Height = 21
      Caption = 'PanelDateTime'
      ParentColor = True
      ColorHighLight = clGreen
      ColorShadow = clGreen
      Align = alRight
      TabOrder = 2
    end
  end
  object PanelClient: TFlatPanel
    Left = 0
    Top = 117
    Width = 729
    Height = 384
    Color = clMoneyGreen
    ColorHighLight = clGreen
    ColorShadow = clGreen
    Align = alClient
    TabOrder = 3
    object lblVersion: TLabel
      Left = 596
      Top = 360
      Width = 115
      Height = 14
      Caption = #24403#21069#29256#26412#65306'1.0.0'
      Enabled = False
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LblRegInfo: TLabel
      Left = 24
      Top = 24
      Width = 288
      Height = 48
      Caption = #36719#20214#23578#26410#27880#20876
      Enabled = False
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -48
      Font.Name = #38582#20070
      Font.Style = [fsItalic]
      ParentFont = False
    end
    object lblsoft: TLabel
      Left = 16
      Top = 390
      Width = 165
      Height = 14
      Caption = #36719#20214#24615#36136#65306#20813#36153#27880#20876#36719#20214
      Enabled = False
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblAuthor: TLabel
      Left = 215
      Top = 390
      Width = 120
      Height = 14
      Caption = #36719#20214#20316#32773#65306#32599#31062#26415
      Enabled = False
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblMail: TLabel
      Left = 380
      Top = 390
      Width = 203
      Height = 14
      Caption = #30005#23376#37038#20214#65306'Luozs168@163.net'
      Enabled = False
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LblQQ: TLabel
      Left = 610
      Top = 390
      Width = 95
      Height = 14
      Caption = 'QQ'#65306'58580405'
      Enabled = False
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object PanelData: TPanel
      Left = 1
      Top = 1
      Width = 727
      Height = 384
      TabOrder = 0
      Visible = False
      object Label1: TLabel
        Left = 8
        Top = 20
        Width = 60
        Height = 12
        Caption = #25628#32034#26465#20214#65306
      end
      object ListView1: TListView
        Left = 8
        Top = 48
        Width = 713
        Height = 329
        Hint = #21452#20987#26597#30475#35814#32454#20449#24687#65292#25110#21491#38190#36873#25321#65281
        Columns = <
          item
            Caption = 'ID'
            MaxWidth = 1
            Width = 1
          end
          item
            Caption = #29992#25143#22995#21517
            MaxWidth = 80
            MinWidth = 70
            Width = 70
          end
          item
            Caption = #30005#35805
            MaxWidth = 150
            MinWidth = 70
            Width = 70
          end
          item
            Caption = #20256#30495
            MaxWidth = 150
            MinWidth = 70
            Width = 70
          end
          item
            Caption = #25163#26426
            MaxWidth = 120
            MinWidth = 90
            Width = 90
          end
          item
            Caption = #22320#22336
            MaxWidth = 300
            MinWidth = 120
            Width = 120
          end
          item
            Caption = #36141#20080#26085#26399
            MaxWidth = 90
            MinWidth = 90
            Width = 90
          end
          item
            Caption = #36807#20445#26085#26399
            MaxWidth = 90
            MinWidth = 90
            Width = 90
          end
          item
            Caption = #29305#21035#29992#25143
            MaxWidth = 70
            MinWidth = 70
            Width = 70
          end
          item
            Caption = #36141#26426#25968#37327
            MaxWidth = 70
            MinWidth = 70
            Width = 70
          end
          item
            Caption = #22788#29702#22120'(CPU)'
            MaxWidth = 150
            MinWidth = 100
            Width = 100
          end
          item
            Caption = #20869#23384
            MaxWidth = 120
            MinWidth = 100
            Width = 100
          end
          item
            Caption = #30828#30424
            MaxWidth = 120
            MinWidth = 100
            Width = 100
          end
          item
            Caption = #26174#21345
            MaxWidth = 120
            MinWidth = 80
            Width = 80
          end
          item
            Caption = #22768#21345
            MaxWidth = 120
            MinWidth = 80
            Width = 80
          end
          item
            Caption = #20027#26495
            MaxWidth = 120
            MinWidth = 80
            Width = 80
          end
          item
            Caption = #26426#31665
            MaxWidth = 120
            MinWidth = 80
            Width = 80
          end
          item
            Caption = #26174#31034#22120
            MaxWidth = 150
            MinWidth = 80
            Width = 80
          end
          item
            Caption = #30005#28304
            MaxWidth = 100
            MinWidth = 60
            Width = 80
          end
          item
            Caption = #36719#39537
            MaxWidth = 120
            MinWidth = 60
            Width = 60
          end
          item
            Caption = #20809#39537
            MaxWidth = 120
            MinWidth = 80
            Width = 80
          end
          item
            Caption = #40736#26631
            MaxWidth = 120
            MinWidth = 80
            Width = 80
          end
          item
            Caption = #38190#30424
            MaxWidth = 120
            MinWidth = 80
            Width = 80
          end
          item
            Caption = #38899#31665
            MaxWidth = 120
            MinWidth = 80
            Width = 80
          end
          item
            Caption = #32593#21345
            MaxWidth = 120
            MinWidth = 80
            Width = 80
          end
          item
            Caption = 'MODEM'
            MaxWidth = 120
            MinWidth = 80
            Width = 80
          end
          item
            Caption = #25171#21360#26426
            MaxWidth = 120
            MinWidth = 80
            Width = 80
          end
          item
            Caption = #20854#23427#37197#32622
            MaxWidth = 200
            MinWidth = 80
            Width = 80
          end
          item
            Caption = #22791#27880
            MaxWidth = 500
            MinWidth = 80
            Width = 80
          end>
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        GridLines = True
        ReadOnly = True
        RowSelect = True
        ParentFont = False
        ParentShowHint = False
        PopupMenu = PopupMenu1
        ShowHint = True
        TabOrder = 0
        ViewStyle = vsReport
        OnCustomDrawItem = ListView1CustomDrawItem
        OnDblClick = ListView1DblClick
      end
      object CmbSearchName: TFlatComboBox
        Left = 72
        Top = 16
        Width = 89
        Height = 20
        Style = csDropDownList
        Color = clWindow
        ColorArrow = clGreen
        ColorArrowBackground = clMoneyGreen
        ColorBorder = clGreen
        ItemHeight = 12
        Items.Strings = (
          #29992#25143#22995#21517
          #22320#22336
          #36141#20080#26085#26399
          #36807#20445#26085#26399
          #36141#26426#25968#37327
          #22788#29702#22120
          #20869#23384
          #30828#30424
          #26174#21345
          #22768#21345
          #20027#26495
          #26426#31665
          #26174#31034#22120
          #30005#28304
          #36719#39537
          #20809#39537
          #40736#26631
          #38190#30424
          #38899#31665
          #32593#21345
          'Modem'
          #25171#21360#26426)
        TabOrder = 1
        ItemIndex = -1
        OnChange = CmbSearchNameChange
      end
      object CmbOperator: TFlatComboBox
        Left = 161
        Top = 16
        Width = 49
        Height = 20
        Style = csDropDownList
        Color = clWindow
        ColorArrow = clGreen
        ColorArrowBackground = clMoneyGreen
        ColorBorder = clGreen
        ItemHeight = 12
        Items.Strings = (
          '='
          '>'
          '<'
          '>='
          '<='
          '<>')
        TabOrder = 2
        Text = '='
        ItemIndex = 0
      end
      object EditTJ: TFlatEdit
        Left = 210
        Top = 17
        Width = 103
        Height = 20
        ColorBorder = clGreen
        ColorFlat = clBtnFace
        ParentColor = True
        TabOrder = 3
      end
      object BtnSearch: TFlatButton
        Left = 320
        Top = 16
        Width = 65
        Height = 21
        ColorBorder = clGreen
        Caption = #24320#22987#25628#32034
        TabOrder = 4
        OnClick = BtnSearchClick
      end
      object BtnAdd: TFlatButton
        Left = 432
        Top = 12
        Width = 89
        Height = 25
        ColorBorder = clGreen
        Caption = #28155#21152#26032#23458#25143
        TabOrder = 5
        OnClick = SubEnterClick
      end
      object BtnDel: TFlatButton
        Left = 624
        Top = 12
        Width = 89
        Height = 25
        ColorBorder = clGreen
        Caption = #21024#38500#36873#23450#23458#25143
        TabOrder = 6
        OnClick = BtnDelClick
      end
      object BtnView: TFlatButton
        Left = 528
        Top = 12
        Width = 89
        Height = 25
        ColorBorder = clGreen
        Caption = #26597#30475#23458#25143#20449#24687
        TabOrder = 7
        OnClick = ListView1DblClick
      end
    end
  end
  object XPMenu1: TXPMenu
    DimLevel = 30
    GrayLevel = 10
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMenuText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Color = clBtnFace
    DrawMenuBar = False
    IconBackColor = clBtnFace
    MenuBarColor = clBtnFace
    SelectColor = clHighlight
    SelectBorderColor = clHighlight
    SelectFontColor = clMenuText
    DisabledColor = clInactiveCaption
    SeparatorColor = clBtnFace
    CheckedColor = clHighlight
    IconWidth = 24
    DrawSelect = True
    UseSystemColors = True
    UseDimColor = False
    OverrideOwnerDraw = False
    Gradient = False
    FlatMenu = False
    AutoDetect = False
    XPControls = [xcMainMenu, xcPopupMenu, xcToolbar, xcControlbar, xcCombo, xcListBox, xcEdit, xcMaskEdit, xcMemo, xcRichEdit, xcMiscEdit, xcCheckBox, xcRadioButton, xcButton, xcBitBtn, xcSpeedButton, xcUpDown, xcGroupBox, xcTreeView, xcListView, xcProgressBar, xcHotKey]
    Active = False
    Left = 528
  end
  object MainMenu1: TMainMenu
    Images = ImageList1
    Left = 592
    object MenuSys1: TMenuItem
      Caption = #31995#32479#30331#24405'(&L))'
      object SubLogin: TMenuItem
        Caption = #25805#20316#21592#30331#24405'(&L)'
        ImageIndex = 0
        ShortCut = 32844
        OnClick = SubLoginClick
      end
      object N9: TMenuItem
        Caption = '-'
      end
      object SubExit1: TMenuItem
        Caption = #36864#20986#31995#32479'(&X)'
        ImageIndex = 1
        ShortCut = 32856
        OnClick = SubExitClick
      end
    end
    object MenuSys: TMenuItem
      Caption = #31995#32479#35774#32622'(&S)'
      object SubLoginOff: TMenuItem
        Caption = #27880#38144'(&O)'
        ImageIndex = 2
        ShortCut = 32847
        OnClick = TBtnLoginOffClick
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object SubCaoZuoRen: TMenuItem
        Caption = #25805#20316#21592#35774#32622'(&S)'
        OnClick = SubCaoZuoRenClick
      end
      object SubSystemSetup: TMenuItem
        Caption = #31995#32479#21442#25968#35774#32622'(&S)'
        ImageIndex = 7
        OnClick = SubSystemSetupClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object SubModifyCaoZuo: TMenuItem
        Caption = #26356#25442#25805#20316#21592'(&M)'
        OnClick = SubModifyCaoZuoClick
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object SubExit: TMenuItem
        Caption = #36864#20986#31995#32479'(&X)'
        ImageIndex = 1
        ShortCut = 32856
        OnClick = SubExitClick
      end
    end
    object MenuMgr: TMenuItem
      Caption = #23458#25143#31649#29702'(&M)'
      object SubEnter: TMenuItem
        Caption = #20449#24687#24405#20837'(&E)'
        ImageIndex = 3
        ShortCut = 32837
        OnClick = SubEnterClick
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object SubQueryPT: TMenuItem
        Caption = #26222#36890#23458#25143#20449#24687#26597#35810'(&Q)'
        ImageIndex = 4
        OnClick = TBtnPTClick
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object SubQueryTB: TMenuItem
        Caption = #29305#21035#23458#25143#20449#24687#26597#35810'(&P)'
        ImageIndex = 5
        OnClick = TBtnTSClick
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object SubQueryAll: TMenuItem
        Caption = #26174#31034#25152#26377#23458#25143'(&A)'
        ImageIndex = 6
        OnClick = TBtnAllClick
      end
      object N16: TMenuItem
        Caption = '-'
      end
      object N17: TMenuItem
        Caption = #36807#20445#23458#25143'(&O)'
        ImageIndex = 15
        OnClick = N13Click
      end
      object N18: TMenuItem
        Caption = '-'
      end
      object N19: TMenuItem
        Caption = #26410#36807#20445#23458#25143'(&W)'
        ImageIndex = 16
        OnClick = N15Click
      end
    end
    object MenuDataMgr: TMenuItem
      Caption = #25968#25454#24211#31649#29702'(&D)'
      object BtnDelAll: TMenuItem
        Caption = #28165#31354#25152#26377#25968#25454'(&E)'
        ImageIndex = 13
        OnClick = BtnDelAllClick
      end
      object N10: TMenuItem
        Caption = '-'
      end
      object SubOverRun: TMenuItem
        Caption = #21024#38500#24049#36807#20445#23458#25143'(&O)'
        OnClick = SubOverRunClick
      end
      object N11: TMenuItem
        Caption = '-'
      end
      object SubCompress: TMenuItem
        Caption = #25968#25454#24211#21387#32553'(&C)'
        ImageIndex = 14
        OnClick = SubCompressClick
      end
    end
    object MenuHelp: TMenuItem
      Caption = #24110#21161'(&H)'
      object SubHelp: TMenuItem
        Caption = #20351#29992#24110#21161'(&L)'
        ImageIndex = 11
        OnClick = SubHelpClick
      end
      object SubZZ: TMenuItem
        Caption = #32852#31995#20316#32773
        ImageIndex = 10
        OnClick = SubZZClick
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object SubRegister: TMenuItem
        Caption = #27880#20876'(&R)....'
        ImageIndex = 9
        OnClick = SubRegisterClick
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object SubAbout: TMenuItem
        Caption = #20851#20110#36719#20214'(&A)'
        ImageIndex = 8
        OnClick = SubAboutClick
      end
    end
  end
  object ImageList1: TImageList
    Left = 560
    Bitmap = {
      494C010111001300040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000005000000001001000000000000028
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C510103EAE2E
      4D2F2D2B2C2E3142000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B132123B4B23
      851B851B0B23D2369C7300000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D22E333F8A27
      E52FE52B6B27133FBD7300000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D22E533FA923
      E52FE52B6A2314439C6F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D12E723BC823
      E627E627892334437A6B00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D12E9033E727
      E427E423C61B5343596700000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003133F047EC43
      E433E42FE52B9143175F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001443795F1443
      692387238F2ADD77D65600000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009C73DE7BBD77
      9C739C739C739C73B55600000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009C73DE7B9C73
      7B6F7B6F7B6F9C73B55600000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000005A6BBD779C73
      5A6B5A6B39677B6FB55600000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000524A9C73DE7B
      FF7FFF7FBD777B6F104200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000AD35B556
      FF7F9C73734E0821000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000082108210000000000000000
      0000082100000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000001863000000000000FF7FFF7F
      1863186308210821000000000821082100000000000000000000A22400000000
      000004398A7E8A7E087E21140000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000630C84100000000000000000FF7FFF7F00000821000000009452
      94520000000008210000000018630821082100000000000008668A7EA2240000
      000061148A7EAA7E897E03350000000000000000000000000000E71CCE399452
      BD777B6FAD35524A000000000000000000000000000000000000000000000000
      00000000630CA47E630C000000000000000000000000FF7F0000FF7FFF7F9452
      9452FF7F1863082108210000FF7F186300000000000069768A7EAA7E297E0000
      00000000C779E879AB7E8A7E253D0000000000000000000000009C73FF7FDE7B
      DE7BDE7BDE7B9C739C7300000000000000000000000000000000000000008410
      630C630C606FE47FE05D630C000000000000000000000000186394520821FF7F
      94520000186308210000186300000000000000006541AA7ECB7EA67986750000
      00000000C33C0000A669AB7ECB7E000000000000000000000000DE7BFF7F9C73
      7B6F7B6F9C73DE7BBD77000000000000000000000000000084103E53EF3DBF46
      BF46BF46630CE47FE47F8410E71C00000000000000000000000094527B6F0000
      00007B6F94520000CE3900000000000000000000CA7ECB7E087E657500000000
      0000000000000000200CAB7ECB7E864900000000000000000000DE7BFF7FFF7F
      FF7FFF7FFF7FFF7F9C7300000000000000000000734EEF3D9F5BBF468C31BF46
      BF46BF46BF46E05DC6184029630C000000000000000000007B6FFF7FFF7F0000
      0000FF7FFF7F9452000008210000000000002439897EAA7EC77D000000000000
      00000000000000000000CB7EAB7EAB7600000000000000000000DE7BFF7FFF7F
      FF7FFF7FFF7FFF7F7B6F0000000000000000E71C3E533E533E53BF46BF46630C
      BF463F362925630CE03E604BC025630C0000000000000000FF7F08210821FF7F
      18630821CE391863000008210000000000004876897E287E0449000000000000
      00000000000000000000CB7ECB7ECC7E00000000000000000000DE7BFF7FFF7F
      FF7FFF7FFF7FFF7F5A6B000000000000000000003E533E533E533E53C6183967
      630C2D7EC97DC97DC618604B604B841000000000000000009452000000001863
      1863000000001863082108210000000000008A7EAA7E077E2008000000000000
      00000000000000002435CC7ECB7ECC7E00000000000000000000BD77FF7FDE7B
      DE7BDE7BDE7BDE7B1863000000000000000000009F5B9F5B3E53C6189C73B17E
      C618C97DC97DC97D2925E03E402984100000000000000000FF7F7B6F7B6F7B6F
      7B6FFE7F7B6F9452000008210000000000008A7EAA7E087E0000000000000000
      0000000000000000CC7EAB7EAB7E8A7E00000000000000000000BD77FF7FDE7B
      BD77BD77BD77DE7BD65A0000000000000000000000003E53396739672D7EB17E
      D65A630CC97DC97D8049630CE71C0000000000000000000094529452FE7FFE7F
      7B6F7B6F9452734E000008210000000000000866AA7E287E0000000000000000
      000000000000496ECC7EAB7EAB7E8661000000000000000000009C73DE7BDE7B
      BD77BD77BD77BD77B55600000000000000000000000000009C739F6B2D7E1863
      1042524A630CC618292500000000000000000000000000007B6F7B6FFF7FFF7F
      FE7F7B6F7B6F1863000008210000000000002008AA7E697EE340454561200000
      000000004872AA7EAB7EAB7EAB7E2014000000000000000000009C73DE7B9C73
      7B6F7B6F7B6F9C73B55600000000000000000000000000009C7339673E53630C
      000000000000000000000000000000000000000000000000734E7B6FFF7FFF7F
      FF7FFE7F7B6F1863734E186308210000000000008551697E697E897E85610000
      000061148A7E8A7E8A7EAB7EC7790000000000000000000000005A6BBD779C73
      5A6B5A6B39677B6FB556000000000000000000000000000000003E5300000000
      00000000000000000000000000000000000000000000186300000000FE7FFE7F
      FE7FFE7F000000000000FF7F18630000082100000000897E487E697E866D0000
      00000000086A8A7E8A7E087E0004000000000000000000000000524A9C73DE7B
      FF7FFF7FBD777B6F104200000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7F186300000000000000000000
      000000000000000000000000FF7F7B6F000000000876697E697E487EA6710000
      000000000000AA7EC77D201000000000000000000000000000000000AD35B556
      FF7F9C73734E0821000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7F00000000000000000000
      000000000000000000000000FF7F0000000000000000000441282559A6790000
      000000000000A33C000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004208420842084208420842084208
      630C000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000020398049804980498049
      0000000000000000000000000000000000000000000000000000000000000000
      00000000095246622D560000000000000000082521204A2929252925E71CC618
      A514841042080000000042088020E12C00000000000000000000000000001863
      00000000000000000000000000000000000000008049E05DE05D0000E05D406E
      E05D000000000000000000000000000000000000FA111A1E1822000000000000
      4D563B1AA43D83626F7BE07E0000000000008C358C4DC2240000000000000000
      4A294A294A29420884108414B0624D5A0000000000000000000000000000FF7F
      FF7F18630000000000000000000000000000E05DE05DE05D000000000000A47E
      E05D0000000000000000000000000000000000005F475F1A3D16000000000000
      3D1ADF32BE36C83582620377E07E000000000000B07F456A6018000000000000
      000000000000C618C61CA2288F5EF4660000000000000000000000001863FF7F
      FF7FFF7FFF7F186300000000000000000000406E406E406EA47EE05D00001863
      FF7FFF7F18630000000000000000000000000000000000000000000000003D16
      9F22BF26DF6B1F3FC8316062C0760000000000004C52EB7E6345000000000000
      00000000000000002024D066B0620000000000000000000000000000FF7FFF7F
      FF7FFF7FFF7F734EFF7F1863000000000000E05DA47E00000000A47EA47EE05D
      8C31FF7FFF7FFF7F18630000000000000000000000001B16191E000000007F22
      3E0A435E7F47FF73FF3EA92960620000000069396939B17F8772482D69356939
      69396939693969354A29514A893D6939000000000000000000001863FF7FFF7F
      FF7FFF7FFF7FFF7F7B6F734EFF7F186300000000A47EA47E0000000000000D7F
      E05DFF7FFF7F734EFF7FFF7F18630000000000005D1A9F2A323E000000001D0A
      6166E17AFB7F5F3FFF739D2EA63500000000F076F17EAF726F7FE4554E66117F
      117F337F127F4C5ED74A8F66547F547F20040000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7F734E1863FF7FFF7F0000000000000000A47EA47E0D7FDA7FE05D
      3967FF7FFF7FFF7FFF7F734EFF7FFF7F000000000000DF6B1332000000000000
      C07E027FD07FFC7F1D375E5B882D00000000AF762C62CF7AB07FC97E45398F6A
      CF76AE724D626448214C327F127F347F20040000000000001863FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000008C318C313967
      FF7FFF7FFF7FFF7F734E7B6FFF7FFF7F00000000000000007F4F5C2200000000
      0000E07E227F007FE07ADB2E123A000000000000000000000000F67F65722400
      000000004218435000000000000000000000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000000000000000BE26BF5BBF32
      D32900008F5E8F5E0000000000000000000000000000000000008B56774E8F31
      00000000224C224C00000000000000000000000000001863FF7FFF7FFF7F7B6F
      B556734E1863FF7FFF7FFF7F0000000000000000000000001863FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000DF5F
      7F539D2ED12D00000000000000000000000000000000000000000000DF7B133A
      4214432C224C946A0000000000000000000000000000FF7FFF7F734EB556B556
      1863FF7FFF7FFF7FFF7F0000000000000000000000000000FF7FFF7FFF7FFF7F
      1863734EB5567B6FFF7FFF7F0000000000000000000000000000000000000000
      BF639F4FBF3693150000000000000000000000000000000000000000CF394360
      843C21484B5D00000000000000000000000000001863FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F0000000000000000000000001863FF7F734EB556B556
      B5567B6FDE7BFF7FFF7FFF7F00000000000000000000F61D1B12F62100000000
      00009F4FDF363B26000000000000000000000000000000000000000000000941
      6328434C00000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7F0000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F0000000000000000000000005F4BFF3E3C1E00000000
      00001F379F26FA0D00000000000000000000000000000000000000000000632C
      2148F06100000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000001863FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F0000000000000000000000005C1EDF2E7F4F123A0000
      5E1A9F223D12000000000000000000000000000000000000000000000000CE59
      AE61000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000078365832
      773A0000000000000000000000000000000000000000000000007F027F027F02
      0000000000000000000000000000000000000000000000000000000000000000
      844D2B5E767B0000000000000000000000000000606EC07EC07D406D00001B2A
      BF303F32DF300404001000780078006400640000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F027F027F02
      337F000000000000000000000000000000000000000000000000000000000000
      327B767B2B5E0000000000000000000000006010C07EC07EC07D406D00001B2A
      BF303F32DF300404001000780078007400500000000000000000000000000000
      000000000000000000000000000000000000000000000000000000007F026D6A
      337F337F00000000337F337F6D6A0000000000000000A038E3592B5EFF7F0000
      327B896E767B0000000000000000000000006010C07EC07EC07D406D00001B2A
      BF303F323F300404001C007C007C007C00640000000000000000000000006C2D
      000000000000D13100000000000000000000000000000000000000007F02337F
      337F6D6A337F337F337F337F00006D6A000000000000D072D072896ED0720066
      767B767BD0720000000000000000000000006010C07EC07EA07D406D00001B2A
      3F327F32DF30070C006C007C007C007C00640000000000000000000000003A63
      C6142104363E8F290000000000000000000000000000000000007F027F02337F
      0000337F337F337F337F337F337F6D6A00000000000000000000001C44414441
      A038A03820490000000000000000000000006010E07EE07EA07AC05844047F32
      7F327F321F319B28006C007C007C007C00648600EC21A504000000000000744A
      BF735E63BB4AFC56143E1D5BDD4A0000000000000000000000007F027F026D6A
      337F337F337F337F337F337F337F000000000000000000000000E359D072327B
      327BA038A038E359001C0000000000000000C01C207F207FE07E407964147F32
      7F327F321F31BB28006C007CE77C737E006C8500754FD1362A29F85E32469E73
      5C67D1357846DB4E1C573C5B06000000000000000000000000007F027F027F02
      7F026D6A337F337F337F337F337F000000000000000000000000767B327B767B
      767BA038E35900002049767B000000000000A06E207F207FE07E807D84187F32
      7F32BF3A3F31BB28C66C947A8458005C005C6500F3463A7B5A6BA514DF775C6B
      4B1AEC1E080E573ADB52393E0000000000000000000000007F027F027F027F02
      7F027F027F027F026D6A00000000000000000000A038A0382049001C001C4441
      A0380066006600000000A038000000000000C06E207F207FE07E807D8418BF3A
      3F639F423F323F35CA3442244A29E72073528500B23EF77E6B5D2204DF77F239
      61042000CF320000BB4AFC56840C000000000000000000007F027F027F027F02
      FF7F7F020000000000000000000095520000767BA0380000896E327B767B767B
      767B896E767B00000000D072000000000000C06E207F677FB37FE07D04219E42
      6910450C9520AC207B59734E7B6F31462104A604DA67D3422200D85ABE731B5F
      45116B222E3201003D5BDB4E5542091D00000000000000007F027F027F027F02
      00007F020000000000000000000000000000001CD0720000001CFF7F767B2B5E
      FF7F001CA0380000000000000066767BFF7FC36E547FA46D806DA06DA013050D
      734E734EC71C7B59BC5DD65ADE7B734E2104E80C3036AC1D123E333EBF77BE77
      783EE60C6608764A9F6FE91800000000000000000000000000007F027F027F02
      00007F027F02000000000000000000000000327BA0380000FF7FE52CFF7FE52C
      D072767B001C767B00000000E359896E0066A01CC2244A2907218002E0032515
      DE7B7B6F4A295B669B5835448410C61800004A1D8C21E77C5A5FB85F974ABE77
      BE77BF77DF779F73FF7B630C00000000000000000000000000007F027F027F02
      7F027F027F02000000000000000000000000D072FF7F844DFF7FFF7FFF7FFF7F
      767BFF7F001CD072767BFF7F0000000000004208734E7B6F3146A208D453542E
      B5561042871869204A29E820000000000000CE2D0811B542634036579A425D6B
      15429D6F9E7309212104FF7F00000000000000000000000000007F027F027F02
      00007F027F0200000000000000000000000000000000844D767BA0382049767B
      FF7F20492049844DD072327B0000000000004208D65ADE7B524AE104C1048104
      40012104630C734E7B6F3146210400000000513E00000000FE77376FF8353336
      7653C514F75A0000000001000000000000000000000000000000000000007F02
      7F027F027F02000000000000000000000000000000002B5EA0382049E359E359
      006600662049767B2B5E767B0000000000000000630C8410C618A208734E734E
      C61800004208D65ADE7B734E210400000000CE31AD31EF39CE35303EB44E7346
      52426A2508210000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000767BA0382049E3590066
      896E006600660000FF7F00000000000000000000000000000000A514DE7B7B6F
      4A2900000000630C8410C6180000000000005452D75ED862F862F966F9661967
      19675B6FA50C0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF7F20490066
      00660066327B0000000000000000000000000000000000000000630CB5561042
      630C00000000000000000000000000000000E402C302C402C302A302A4028402
      8202410242080000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      E0722077667B457700770000000000000000E92068390800000000000400E724
      7D3EBE425B3A2D1D0000000000000000000000000000000000000000123A0000
      000000000000000000000000000000000000000000000000000000001F001863
      00001F00000000000000000000000000000000000000000000000000255EA26A
      407B637B687B637B407FA26A000000000000E949447F27730600D72DE966267F
      72253F573F57FE4EFF4AC9140000000000000000000000000000D6151626CF56
      0F5F0E5FEA3970158E25CF3900000000000000000000000000001F001863FF7F
      0000186300001F0000000000000000000000F735B53500000000085264620077
      427B677B677B407B407BC16E0000000000004B00AC10237F086F4A77247FCE14
      9F677F637F5F5F5F3F5BFE4E2E1D00000000000000000000D41DF521F521F05A
      10630F6391421A0E191A1526F325000000000000000000001F001863FF7FFF7F
      FF7FFF7F0000186300001F00000000000000392EFC52173A7525E755C16E407B
      657B687B677F607F407B6462000000000000000000004E52697F6D7BAD10FF73
      7F677F677F677F637F635F5BFF4E210000000000333AF915171EF5211522F15A
      AF56AF568F4EF64E4E4FC936D04200000000000000001F001863FF7FFF7FFF7F
      1002FF7FFF7FFF7F00000000000000000000182A1C539A3A351D4366E072407B
      657F2653063F0743245B407F000000000000000086108C396E7FAC624A7BE528
      9E6BBF6F9F6F9F6B7F675F631F535A3A0000773A7F1A3B22372216223C4F096F
      B17FB07FCA66565FA51788232E530000000000001F001863FF7FFF7FFF7F1002
      FF7FFF7F1002FF7FFF7F0000000000000000F725FC529A3A34214462E072607F
      E52EC532C532E63A0743073BE636000000000000583EF118B67F547B2C293173
      D856FE525E3EBF73BF3E5F015F2EDF4200007832DF2E3B1E7D22BE2ADF2EBC2A
      37263526983E5B5F90570833F34A000000001F001863FF7FFF7FFF7FFF7FFF7F
      FF7F1002FF7FFF7F00000000000000000000F721DB4ABB42561D6366C16E0000
      652A4632662A262AE536074306370000000000003F579F674804435A252DBC4A
      9E465E3E9E4A9D21DF77DF091F1E3F5B220400007D223E125E169F1E7D224C73
      F17FCE7F0D639509362600000000000000001863FF7F1042FF7FFF7F0000FF7F
      18630000000000000000000000000000000000009A3EFC4EF72D0000445EC66E
      2C320000466D0000252A063B0743C62E000000007F5F7F632066AE7F437B912D
      9D21FE563E5F7E42FD311F1EDE4E5F5F850C000000000000000000004D526956
      00000000C866504E00000000000000000000FF7F10421042FF7F1042FF7F0000
      1863FF7FFF7FFF7FFF7FFF7F10421F0000000000392E1C539A3A76210000626A
      C17694100000C468882EC5360743E632000000003D579F676639B47F6E7FFC29
      1D36DE521E5B9E4A3D3A7F2A9F6B7F6300000000000000000000000086620000
      0000000000004A560000000000000000000000000000FF7FFF7FFF7FFF7F0000
      1F7C000018631863FF7FFF7FFF7F1000000000000000BB3EFC527A3AD729551D
      351DB525A95DE468662EA5322643E63600000000133A7F63BF6BD439BB563F22
      1D32BE4EDE52DE521F5B7F637F679F670000000000000000000000000000096F
      0000000008770000000000000000000000000000000000000000FF7FFF7F0000
      18631F7C1863FF7FFF7FFF7F0000000000000000000006761F4B1D53BB467A3A
      7A3200006371E46CA82AA5320743E636000000000000BF6B7F679F6BBF737F63
      9F6FDE521E5FFD2DDF739F6B7F67333E0000000000000000CF62C96E0000AD62
      D17FF17F00000000C96E00000000000000000000000000001863000000000000
      000018631F7CFF7FFF7F000000000000000000000000C571447AA57ACF668D66
      257AA3754471C4684626E5362743063700000000000076469F679F6B9F6FBF73
      BE11FF7F9F6BDF779F6B9F67BF6B000000000000000000000000C572C96E0000
      000000000000C96E2A7B2A7B0000000000000000000000000000000000000000
      0000000000001F7C000000000000000000000000000000002676A676C77A8576
      0576847124694869262A00000000063B662E000000000000B74E9F6B9F6B9F6B
      BF739E0DDD043F2E9F6B9F6700000000000000000000A4724D520000C5720000
      0000000000000777097BC772C96E000000000000000000000000000000000000
      00000000000000001F7C00000000000000000000000000004676C676A67A2576
      8471446DC36400000000000000000000C83600000000000000009E639F6B9F6B
      9F6B1F53FF4ABF6F9F670000000000000000000000000000A4728E5A00000000
      0000000000000000C572A76A8E5A000000000000000000000000000000000000
      000000000000000000001F7C0000000000000000000000002676C67A8576C475
      646D046900000000000000000000000000000000000000000000000000000000
      7F679F6B7E420000000000000000000000000000000000000000000000000000
      00000000000000000000AE620000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000500000000100010000000000800200000000000000000000
      000000000000000000000000FFFFFF00FFFF000000000000F00F000000000000
      E007000000000000E007000000000000E007000000000000F00F000000000000
      F00F000000000000F00F000000000000F00F000000000000F00F000000000000
      F00F000000000000F00F000000000000F00F000000000000F00F000000000000
      F81F000000000000FFFF000000000000FFFF9C7FFF0FFFFFFFFF9819F707F00F
      FFCF0010E307E007FF8F0001C303E007FC07C0018181E007E003E00787E1F00F
      8003C0070FF1F00F0001C0070FE1F00F8001E0070FE1F00F8001C0071FE1F00F
      C003C0070FC1F00FE00FC0070381F00FE1FFC0038303F00FF7FF0030C383F00F
      FFFF1FF88387F81FFFFF9FF9C3CFFFFFFFFFFFFFE3FFFFFF00FFFFFF81FFFF8F
      0031FCFF00FF8E071E01F83F087F8E038FC1F80F001FFC038FE3F0030007CC03
      0000F00118018C030000E0018000CE030000E003E001E703F19FC003E001F09F
      F19FC007E003FC3FF81F8007C003FE1FF83F800FC007C71FFC7F000F8007C71F
      FC7F801F800FC23FFCFFFFFF800FF8FFF0FFFE3F0000FC8FF07FFE3F0000F88F
      F003C23F0000F809F001C03F00008001F000F03F00000003F000F00F00000003
      E000F02700000000A0008037000000008000203700000001001F203800000003
      001F201800000003001F000700030003003FC00700036017C01FC0078003001F
      FF1FC02FF043001FFF0FF03FF07F003FFFFFFC1FFFFFFFFFFE0F1007FBFFF87F
      F8070003F007F01F30070001E003E007000780018003C007000780010003800F
      000380000003001902038000800F001088A18000F99F000084418000FBDF0080
      C0018001FDBFA001C081C001E46FEA0FC001C003F3C7FF1FE00CE007CBC3FFEF
      E03EF00FE7E3FFF7E07FFE3FFFF7FFFB00000000000000000000000000000000
      000000000000}
  end
  object ADOConnection1: TADOConnection
    Left = 528
    Top = 32
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 560
    Top = 32
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 440
    Top = 488
  end
  object PopupMenu1: TPopupMenu
    Left = 592
    Top = 32
    object S1: TMenuItem
      Caption = #26174#31034#24403#21069#23458#25143#36164#26009'(&S)'
      Default = True
      OnClick = ListView1DblClick
    end
    object N12: TMenuItem
      Caption = '-'
    end
    object N13: TMenuItem
      Caption = #21482#26174#31034#26410#36807#20445#29992#25143'(&W)'
      OnClick = N13Click
    end
    object N14: TMenuItem
      Caption = '-'
    end
    object N15: TMenuItem
      Caption = #21482#26174#31034#36807#20445#29992#25143'(&O)'
      OnClick = N15Click
    end
  end
  object FlatHint1: TFlatHint
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Left = 624
  end
end
