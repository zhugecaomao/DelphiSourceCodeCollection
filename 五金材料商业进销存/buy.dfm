object frmBuy: TfrmBuy
  Left = 195
  Top = 149
  Width = 772
  Height = 561
  Hint = #21830#21697#36827#36135#21333
  Caption = #36827#36135#21333
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  Icon.Data = {
    0000010001002020100001000400E80200001600000028000000200000004000
    0000010004000000000000000000000000000000000000000000000000000000
    0000000080000080000000808000800000008000800080800000C0C0C0008080
    80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000000000007777777777000000000000000000000000000000770000
    000000000000000000EEEEEEE07700000000000000000000000EEEEEE0770000
    00000000000000000000EEEEE0770000000000000000000000000EEEE0770000
    00000000000000000070EEEEE07700000000000000000000070EE0EEE0770000
    000000000777000070EE000EE070000000000007777777770EE0000EE0700000
    0000007000077770EE000000E00000000000070BBEE0000EE000000000000000
    000070BBBBBEE0E0070000000000000000070EEEBBBB0EE00700000000000000
    0070BBEEEEE0EE0E0700000000000000770BBBBBBB0EE0EE0700000000000007
    00EBBEBBB0EE0BBE0700000000000070EEEEEEEE0EE0BBE0700000000000070B
    BBEBBBE0700EBBE070000000000000BBBBBBBB070BBEBBE07000000000000EEE
    EBBEE070EBBEEBE0000000000000000EEEEE070BEEBEEBE00000000000000000
    0000F0BBEEBEEB00000000000000000000000EBBEEBEE0000000000000000000
    00000EBEEBBE0000000000000000000000000EBEEBB000000000000000000000
    00000EBEEB000000000000000000000000000BBE000000000000000000000000
    0000EBB00000000000000000000000000000EE00000000000000000000000000
    0000E0000000000000000000000000000000000000000000000000000000FFFF
    FC00FFFFF800FFFFF800FFFFF800FFFFFC00FFFFFE00FFFFFC00FFFFF800FFF8
    F001FFE000C1FFC001C3FF8003E3FF0003FFFE0003FFFC0003FFF00003FFE000
    03FFC00007FF800007FF800007FF00000FFF00000FFFE0001FFFFF003FFFFF00
    7FFFFF00FFFFFF01FFFFFF03FFFFFE0FFFFFFE1FFFFFFE3FFFFFFE7FFFFF}
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object panTop: TPanel
    Left = 0
    Top = 30
    Width = 764
    Height = 73
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvLowered
    Color = clWhite
    TabOrder = 0
    object Label5: TKvLabel
      Left = 12
      Top = 49
      Width = 60
      Height = 14
      AutoSize = False
      Caption = #20379' '#24212' '#21830
      Transparent = True
      VCenter = True
    end
    object Label6: TKvLabel
      Left = 207
      Top = 49
      Width = 74
      Height = 14
      AutoSize = False
      Caption = #40664#35748#20837#36135#20179
      Transparent = True
      VCenter = True
    end
    object Label8: TKvLabel
      Left = 386
      Top = 49
      Width = 60
      Height = 14
      AutoSize = False
      Caption = #20837#36135#31867#22411
      Transparent = True
      VCenter = True
    end
    object Label1: TKvLabel
      Left = 10
      Top = 27
      Width = 60
      Height = 14
      AutoSize = False
      Caption = #21333'  '#25454'  '#21495
      Color = 13612943
      ParentColor = False
      Transparent = True
      VCenter = True
    end
    object Label2: TKvLabel
      Left = 10
      Top = 7
      Width = 60
      Height = 16
      AutoSize = False
      Caption = #26085'         '#26399
      Color = 13612943
      ParentColor = False
      Transparent = True
      VCenter = True
    end
    object Label4: TKvLabel
      Left = 531
      Top = 49
      Width = 44
      Height = 14
      AutoSize = False
      Caption = #21046#34920#20154
      Color = 13612943
      ParentColor = False
      Transparent = True
      VCenter = True
    end
    object KvLabel1: TKvLabel
      Left = 531
      Top = 20
      Width = 44
      Height = 14
      AutoSize = False
      Caption = #24050#20184#27454
      Transparent = True
      VCenter = True
    end
    object labStatus: TKvLabel
      Left = 232
      Top = 9
      Width = 281
      Height = 32
      Alignment = taCenter
      AutoSize = False
      Caption = #21333#25454#29366#24577
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      Transparent = True
      VCenter = True
    end
    object edSheetID: TwwDBEdit
      Left = 68
      Top = 24
      Width = 121
      Height = 19
      BorderStyle = bsNone
      DataField = 'SheetID'
      DataSource = DM.dsIn
      Frame.Enabled = True
      Frame.Transparent = True
      ReadOnly = True
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnChange = edSheetIDChange
    end
    object cblStore: TwwDBLookupCombo
      Left = 279
      Top = 44
      Width = 100
      Height = 19
      BorderStyle = bsNone
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'storeName'#9'20'#9#24211#21517#9'F'
        'storeID'#9'10'#9#24211#21495#9'F')
      DataField = 'defaultStoreId'
      DataSource = DM.dsIn
      LookupTable = DM.tabStore
      LookupField = 'storeID'
      Options = [loColLines, loRowLines, loTitles, loFixedDropDownHeight, loSearchOnBackspace]
      ButtonEffects.Transparent = True
      ButtonEffects.Flat = True
      Frame.Enabled = True
      TabOrder = 1
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
    object cblType: TwwDBComboBox
      Left = 441
      Top = 44
      Width = 81
      Height = 19
      ShowButton = True
      Style = csDropDown
      MapList = True
      AllowClearKey = False
      BorderStyle = bsNone
      DataField = 'Type'
      DataSource = DM.dsIn
      DropDownCount = 8
      ButtonEffects.Transparent = True
      ButtonEffects.Flat = True
      Frame.Enabled = True
      ItemHeight = 0
      Items.Strings = (
        #26222#36890#21457#31080#9#26222#36890#21457#31080
        #25910#25454#9#25910#25454
        #22686#20540#31246#31080#9#22686#20540#31246#31080)
      Sorted = False
      TabOrder = 2
      UnboundDataType = wwDefault
    end
    object cblSupp: TwwDBLookupCombo
      Left = 67
      Top = 44
      Width = 122
      Height = 19
      BorderStyle = bsNone
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'SuppName'#9'20'#9#20379#24212#21830#9'F'
        'SuppID'#9'12'#9#20379#24212#21830#21495#9'F'
        'Amo'#9'10'#9#24212#20184#27454#9'F')
      DataField = 'SuppID'
      DataSource = DM.dsIn
      LookupTable = DM.tabSupp
      LookupField = 'SuppID'
      Options = [loColLines, loRowLines, loTitles, loFixedDropDownHeight, loSearchOnBackspace]
      ButtonEffects.Transparent = True
      ButtonEffects.Flat = True
      Frame.Enabled = True
      TabOrder = 3
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
    object cblEmp: TwwDBLookupCombo
      Left = 576
      Top = 44
      Width = 96
      Height = 19
      BorderStyle = bsNone
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'Name'#9'10'#9#22995#21517#9'F'
        'EmpID'#9'10'#9#31616#20889#9'F')
      DataField = 'EmpId'
      DataSource = DM.dsIn
      LookupTable = DM.tabEmp
      LookupField = 'EmpID'
      Options = [loColLines, loRowLines, loTitles, loFixedDropDownHeight]
      ButtonEffects.Transparent = True
      ButtonEffects.Flat = True
      Frame.Enabled = True
      TabOrder = 4
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
    object edDate: TwwDBDateTimePicker
      Left = 68
      Top = 7
      Width = 121
      Height = 19
      Hint = #20837#36135#26085#26399
      BorderStyle = bsNone
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      DataField = 'Date'
      DateFormat = dfLong
      DataSource = DM.dsIn
      Date = 37514
      Epoch = 1950
      ButtonEffects.Transparent = True
      ButtonEffects.Flat = True
      Frame.Enabled = True
      Frame.Transparent = True
      Frame.FocusBorders = [efBottomBorder]
      Time = 37514
      ShowButton = True
      TabOrder = 5
      UnboundDataType = wwDTEdtDate
    end
    object edPay: TwwDBComboDlg
      Left = 576
      Top = 16
      Width = 97
      Height = 19
      OnCustomDlg = edPayCustomDlg
      ShowButton = True
      Style = csDropDown
      ButtonStyle = cbsCustom
      BorderStyle = bsNone
      DataField = 'PayAmo'
      DataSource = DM.dsIn
      ButtonEffects.Transparent = True
      ButtonEffects.Flat = True
      Frame.Enabled = True
      ButtonGlyph.Data = {
        42010000424D4201000000000000760000002800000011000000110000000100
        040000000000CC00000000000000000000001000000000000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777700000007777777777777777700000007777777774F77777700000007777
        7777444F77777000000077777774444F777770000000700000444F44F7777000
        000070FFF444F0744F777000000070F8884FF0774F777000000070FFFFFFF077
        74F77000000070F88888F077774F7000000070FFFFFFF0777774F000000070F8
        8777F07777774000000070FFFF00007777777000000070F88707077777777000
        000070FFFF007777777770000000700000077777777770000000777777777777
        777770000000}
      TabOrder = 6
      WordWrap = False
      UnboundDataType = wwDefault
    end
  end
  object panGDS: TPanel
    Left = 0
    Top = 103
    Width = 764
    Height = 282
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvSpace
    BorderWidth = 1
    BorderStyle = bsSingle
    Color = 11599854
    TabOrder = 1
    object gridItems: TwwDBGrid
      Left = 3
      Top = 3
      Width = 754
      Height = 272
      LineStyle = gls3D
      ControlType.Strings = (
        'GdsID;CustomEdit;cbGdsID;F'
        'storename;CustomEdit;cbStoreNAme;F'
        'Unit;CustomEdit;cbUnit;F')
      Selected.Strings = (
        'GdsID'#9'11'#9#21830#21697#21495#9'F'
        'gdsname'#9'22'#9#21830#21697#21517#31216#9'F'
        'Unit'#9'6'#9#21333#20301
        'Qua'#9'6'#9#25968#37327#9'F'
        'Price'#9'8'#9#21333#20215#9'F'#9#23454#38469#21806#20215
        'amo'#9'10'#9#37329#39069#9'F'#9#23454#38469#21806#20215
        'storename'#9'10'#9#20179#21517
        'Notes'#9'10'#9#22791#27880)
      MemoAttributes = [mSizeable, mWordWrap, mGridShow]
      IniAttributes.Delimiter = ';;'
      TitleColor = clMoneyGreen
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = DM.dsInItems
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      KeyOptions = [dgEnterToTab, dgAllowDelete, dgAllowInsert]
      Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit, dgShowFooter, dgShowCellHint, dgTabExitsOnLastCol, dgRowResize]
      ParentFont = False
      ParentShowHint = False
      RowHeightPercent = 120
      ShowHint = True
      TabOrder = 0
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 3
      TitleButtons = True
      UseTFields = False
      OnEnter = gridItemsEnter
      OnExit = gridItemsExit
      IndicatorIconColor = clYellow
      OnUpdateFooter = gridItemsUpdateFooter
      FooterColor = 16776176
      FooterCellColor = 16776176
      PadColumnStyle = pcsPlain
      PaintOptions.AlternatingRowColor = clMoneyGreen
      object wwDBGridEx1IButton: TwwIButton
        Left = 0
        Top = 0
        Width = 25
        Height = 41
        Hint = #36873#25321#21830#21697
        AllowAllUp = True
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          55555FFFFFFF5F55FFF5777777757559995777777775755777F7555555555550
          305555555555FF57F7F555555550055BB0555555555775F777F55555550FB000
          005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
          B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
          B05555577F555557F7F5550E0BFBFB00B055557575F55577F7F550EEE0BFB0B0
          B05557FF575F5757F7F5000EEE0BFBF0B055777FF575FFF7F7F50000EEE00000
          B0557777FF577777F7F500000E055550805577777F7555575755500000555555
          05555777775555557F5555000555555505555577755555557555}
        Layout = blGlyphTop
        NumGlyphs = 2
        OnClick = wwDBGridEx1IButtonClick
      end
    end
    object spQua: TwwDBSpinEdit
      Left = 288
      Top = 48
      Width = 105
      Height = 20
      Increment = 0.5
      Value = 122
      AutoSize = False
      DataField = 'Qua'
      DataSource = DM.dsInItems
      ParentColor = True
      TabOrder = 1
      UnboundDataType = wwDefault
      Visible = False
    end
    object spPrice: TwwDBSpinEdit
      Left = 392
      Top = 80
      Width = 97
      Height = 20
      Increment = 0.5
      Value = 20
      AutoSize = False
      DataField = 'Price'
      DataSource = DM.dsInItems
      ParentColor = True
      TabOrder = 2
      UnboundDataType = wwDefault
      Visible = False
    end
    object cbUnit: TwwDBComboDlg
      Left = 240
      Top = 152
      Width = 57
      Height = 21
      Hint = #36873#25321#21333#20301
      OnCustomDlg = cbUnitCustomDlg
      ShowButton = True
      Style = csDropDown
      DataField = 'Unit'
      DataSource = DM.dsInItems
      ButtonEffects.Transparent = True
      ButtonEffects.Flat = True
      TabOrder = 3
      WordWrap = False
      UnboundDataType = wwDefault
    end
  end
  object cbGdsID: TwwDBComboDlg
    Left = 40
    Top = 160
    Width = 121
    Height = 21
    OnCustomDlg = cbGdsIDCustomDlg
    ShowButton = True
    Style = csDropDown
    ButtonStyle = cbsCustom
    DataField = 'GdsID'
    DataSource = DM.dsInItems
    ButtonGlyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      0400000000008000000000000000000000001000000000000000FFFFFF000000
      000038299700E1EAEB00C5D6D900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000333333333333
      3333333333333333333333333333333333333332222222223333333233323332
      3333333222222222333333323332333233333332222222223333333233323332
      3333333222222222333333323332333233333332222222223333333333333333
      3333333333333333333333333333333333333333333333333333}
    TabOrder = 2
    WordWrap = False
    UnboundDataType = wwDefault
  end
  object cbStoreNAme: TDBLookupComboBox
    Left = 544
    Top = 192
    Width = 112
    Height = 21
    Color = 11599854
    DataField = 'storename'
    DataSource = DM.dsInItems
    TabOrder = 3
  end
  object panBill: TPanel
    Left = 0
    Top = 385
    Width = 764
    Height = 149
    Align = alBottom
    BevelInner = bvLowered
    BorderWidth = 2
    BorderStyle = bsSingle
    TabOrder = 4
    Visible = False
    object TreeView1: TTreeView
      Left = 4
      Top = 4
      Width = 121
      Height = 137
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
        00000006C8EBBBF5B5A51F0000000300000000000000FFFFFFFFFFFFFFFF0000
        00000000000006D2D1CDEAB3C91F0000000400000000000000FFFFFFFFFFFFFF
        FF000000000000000006C4A9CDEAB3C91D0000000500000000000000FFFFFFFF
        FFFFFFFF000000000100000004B2DDB8E5210000000000000000000000FFFFFF
        FFFFFFFFFF000000000000000008BFD5B5C4BBF5B5A51D000000000000000000
        0000FFFFFFFFFFFFFFFF000000000000000004C9CCC6B7}
    end
    object a: TListView
      Left = 125
      Top = 4
      Width = 631
      Height = 137
      Align = alClient
      BevelInner = bvLowered
      BevelOuter = bvRaised
      BevelWidth = 3
      BorderWidth = 2
      Columns = <>
      TabOrder = 1
    end
  end
  object dockTop: TTBDock
    Left = 0
    Top = 0
    Width = 764
    Height = 30
    object TBToolbar1: TTBToolbar
      Left = 0
      Top = 0
      Align = alTop
      Caption = #23548#33322#26465
      DefaultDock = dockTop
      FloatingMode = fmOnTopOfAllForms
      FullSize = True
      Images = imgTool
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      DockTextAlign = taLeftJustify
      object TBControlItem1: TTBControlItem
        Control = nav
      end
      object TBSeparatorItem2: TTBSeparatorItem
      end
      object TBItem1: TTBItem
        Action = actUpdate
        DisplayMode = nbdmImageAndText
      end
      object TBSeparatorItem1: TTBSeparatorItem
      end
      object TBItem2: TTBItem
        Action = actChecked
        DisplayMode = nbdmImageAndText
      end
      object TBItem3: TTBItem
        Action = actPrint
        DisplayMode = nbdmImageAndText
        ImageIndex = 12
        Images = imgTool
      end
      object TBItem6: TTBItem
        Action = actcopy
        Caption = #22797#21046
        DisplayMode = nbdmImageAndText
      end
      object TBItem4: TTBItem
        Action = actPrint2
        DisplayMode = nbdmImageAndText
        ImageIndex = 13
        Visible = False
      end
      object TBItem5: TTBItem
        Caption = #35774#35745#25253#34920
        DisplayMode = nbdmImageAndText
        ImageIndex = 14
        Images = imgTool
        OnClick = TBItem5Click
      end
      object nav: TwwDBNavigator
        Left = 0
        Top = 0
        Width = 375
        Height = 25
        DataSource = DM.dsIn
        ImageList = imgTool
        ShowHint = True
        RepeatInterval.InitialDelay = 500
        RepeatInterval.Interval = 100
        Align = alTop
        ParentShowHint = False
        object navFirst: TwwNavButton
          Left = 0
          Top = 0
          Width = 25
          Height = 25
          Hint = 'Move to first record'
          ImageIndex = -1
          NumGlyphs = 2
          Spacing = 4
          Transparent = False
          Caption = 'navFirst'
          Enabled = False
          DisabledTextColors.ShadeColor = clGray
          DisabledTextColors.HighlightColor = clBtnHighlight
          Index = 0
          Style = nbsFirst
        end
        object navPriorPage: TwwNavButton
          Left = 25
          Top = 0
          Width = 25
          Height = 25
          Hint = 'Move backward 10 records'
          ImageIndex = -1
          NumGlyphs = 2
          Spacing = 4
          Transparent = False
          Caption = 'navPriorPage'
          Enabled = False
          DisabledTextColors.ShadeColor = clGray
          DisabledTextColors.HighlightColor = clBtnHighlight
          Index = 1
          Style = nbsPriorPage
        end
        object navPrior: TwwNavButton
          Left = 50
          Top = 0
          Width = 25
          Height = 25
          Hint = 'Move to prior record'
          ImageIndex = -1
          NumGlyphs = 2
          Spacing = 4
          Transparent = False
          Caption = 'navPrior'
          Enabled = False
          DisabledTextColors.ShadeColor = clGray
          DisabledTextColors.HighlightColor = clBtnHighlight
          Index = 2
          Style = nbsPrior
        end
        object navNext: TwwNavButton
          Left = 75
          Top = 0
          Width = 25
          Height = 25
          Hint = 'Move to next record'
          ImageIndex = -1
          NumGlyphs = 2
          Spacing = 4
          Transparent = False
          Caption = 'navNext'
          DisabledTextColors.ShadeColor = clGray
          DisabledTextColors.HighlightColor = clBtnHighlight
          Index = 3
          Style = nbsNext
        end
        object navNextPage: TwwNavButton
          Left = 100
          Top = 0
          Width = 25
          Height = 25
          Hint = 'Move forward 10 records'
          ImageIndex = -1
          NumGlyphs = 2
          Spacing = 4
          Transparent = False
          Caption = 'navNextPage'
          DisabledTextColors.ShadeColor = clGray
          DisabledTextColors.HighlightColor = clBtnHighlight
          Index = 4
          Style = nbsNextPage
        end
        object navLast: TwwNavButton
          Left = 125
          Top = 0
          Width = 25
          Height = 25
          Hint = 'Move to last record'
          ImageIndex = -1
          NumGlyphs = 2
          Spacing = 4
          Transparent = False
          Caption = 'navLast'
          DisabledTextColors.ShadeColor = clGray
          DisabledTextColors.HighlightColor = clBtnHighlight
          Index = 5
          Style = nbsLast
        end
        object navInsert: TwwNavButton
          Left = 150
          Top = 0
          Width = 25
          Height = 25
          Hint = 'Insert new record'
          ImageIndex = -1
          NumGlyphs = 2
          Spacing = 4
          Transparent = False
          Caption = 'navInsert'
          DisabledTextColors.ShadeColor = clGray
          DisabledTextColors.HighlightColor = clBtnHighlight
          Index = 6
          Style = nbsInsert
        end
        object navDelete: TwwNavButton
          Left = 175
          Top = 0
          Width = 25
          Height = 25
          Hint = 'Delete current record'
          ImageIndex = -1
          NumGlyphs = 2
          Spacing = 4
          Transparent = False
          Caption = 'navDelete'
          DisabledTextColors.ShadeColor = clGray
          DisabledTextColors.HighlightColor = clBtnHighlight
          Index = 7
          Style = nbsDelete
        end
        object navEdit: TwwNavButton
          Left = 200
          Top = 0
          Width = 25
          Height = 25
          Hint = 'Edit current record'
          ImageIndex = -1
          NumGlyphs = 2
          Spacing = 4
          Transparent = False
          Caption = 'navEdit'
          DisabledTextColors.ShadeColor = clGray
          DisabledTextColors.HighlightColor = clBtnHighlight
          Index = 8
          Style = nbsEdit
        end
        object navPost: TwwNavButton
          Left = 225
          Top = 0
          Width = 25
          Height = 25
          Hint = 'Post changes of current record'
          ImageIndex = -1
          NumGlyphs = 2
          Spacing = 4
          Transparent = False
          Caption = 'navPost'
          Enabled = False
          DisabledTextColors.ShadeColor = clGray
          DisabledTextColors.HighlightColor = clBtnHighlight
          Index = 9
          Style = nbsPost
        end
        object navCancel: TwwNavButton
          Left = 250
          Top = 0
          Width = 25
          Height = 25
          Hint = 'Cancel changes made to current record'
          ImageIndex = -1
          NumGlyphs = 2
          Spacing = 4
          Transparent = False
          Caption = 'navCancel'
          Enabled = False
          DisabledTextColors.ShadeColor = clGray
          DisabledTextColors.HighlightColor = clBtnHighlight
          Index = 10
          Style = nbsCancel
        end
        object navRefresh: TwwNavButton
          Left = 275
          Top = 0
          Width = 25
          Height = 25
          Hint = 'Refresh the contents of the dataset'
          ImageIndex = -1
          NumGlyphs = 2
          Spacing = 4
          Transparent = False
          Caption = 'navRefresh'
          DisabledTextColors.ShadeColor = clGray
          DisabledTextColors.HighlightColor = clBtnHighlight
          OnClick = navRefreshClick
          Index = 11
          Style = nbsRefresh
        end
        object navFilterDialog: TwwNavButton
          Left = 300
          Top = 0
          Width = 25
          Height = 25
          Hint = #36807#28388#25968#25454
          ImageIndex = -1
          NumGlyphs = 2
          Spacing = 4
          Transparent = False
          Caption = 'navFilterDialog'
          DisabledTextColors.ShadeColor = clGray
          DisabledTextColors.HighlightColor = clBtnHighlight
          Index = 12
          Style = nbsFilterDialog
        end
        object navLocateDialog: TwwNavButton
          Left = 325
          Top = 0
          Width = 25
          Height = 25
          Hint = #35760#24405#23450#20301
          ImageIndex = -1
          NumGlyphs = 2
          Spacing = 4
          Transparent = False
          Caption = 'navLocateDialog'
          DisabledTextColors.ShadeColor = clGray
          DisabledTextColors.HighlightColor = clBtnHighlight
          Index = 13
          Style = nbsLocateDialog
        end
        object navSearchDialog: TwwNavButton
          Left = 350
          Top = 0
          Width = 25
          Height = 25
          Hint = #26597#35810#25968#25454
          ImageIndex = -1
          NumGlyphs = 2
          Spacing = 4
          Transparent = False
          Caption = 'navSearchDialog'
          DisabledTextColors.ShadeColor = clGray
          DisabledTextColors.HighlightColor = clBtnHighlight
          Index = 14
          Style = nbsSearchDialog
        end
      end
    end
  end
  object SumQuery: TADOQuery
    Connection = DM.DB
    CursorType = ctStatic
    DataSource = DM.dsIn
    Parameters = <
      item
        Name = 'sheetid'
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = '200208260004'
      end>
    SQL.Strings = (
      'SELECT sum(qua) as quaamo , SUM(Price*qua) as Amoamo'
      'FROM inItems where "sheetid" = :sheetid')
    Left = 696
    Top = 296
  end
  object imgTool: TImageList
    Height = 20
    Width = 20
    Left = 731
    Top = 4
    Bitmap = {
      494C010110001300040014001400FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000050000000640000000100180000000000C05D
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF00FFFF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF00FFFF00FFFF00FFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0084848484848484848484848484848484848484848484848484848484848400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FFFF00FF
      FF00FFFF00FFFF00FFFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000848484FFFFFF000000
      0000000000000000000000000000008484840000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000BD0000
      BD0000BD0000BDBD000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FFFF00FFFF84848400FFFF00FFFF00FFFF000000
      0000000000000000000000000000000000000000000000000000000000008484
      84C6C6C6848484C6C6C6848484C6C6C6848484C6C6C6848484FFFFFF84848400
      0000848484000000000000000000000000000000000000000000000000BD0000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000BD0000BD0000BD0000BD0000BDBD0000000000
      0000FFFF00000000000000000000000000000000000000000000000000000000
      0000000000000000000000008484840000000000FF0000FF0000FF0000FF0000
      00C6C6C600000000FFFF000000FFFFFFFFFFFF84848400000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000008484840000008484840000000000000000
      00000000000000000000000000BD0000BD000000000000000000000000BDBD00
      BDBD00BDBD00BDBD00BDBD000000000000000000000000000000000000BD0000
      BD0000000000000000000000000000000000000000FFFF000000000000000000
      0000000000000000000000000000000000000000000000000000000084848400
      0000FFFFFF84848484848400FFFF84848400000084848400FFFF000000848484
      8484840000FF848484000000000000000000000000000000000000FFFFFFC6C6
      C6FFFFFFC6C6C6FFFFFFC6C6C600FF0000FF0000FF00C6C6C6FFFFFF00000000
      0000000000848484000000000000000000000000BD0000BD0000BD0000BD0000
      BD0000BD000000000000000000000000000000000000000000000000000000BD
      BD000000000000000000000000BD0000BD000000000000000000000000000000
      0000000000FFFF00000000000000000000000000000000000000000000000000
      000000000000000000000000848484FFFFFFFFFFFF0000FF00000000FFFF0000
      FF00FFFF00FFFF0000FF00FFFF0000000000FF0000FFFFFFFF00000000000000
      0000000000000000000000C6C6C6FFFFFFC6C6C6FFFFFFC6C6C6FFFFFF0000FF
      0000FF0000FFFFFFFFC6C6C60000008484840000008484840000000000000000
      00000000000000000000000000BD0000BD0000000000000000000000FFFFFF00
      0000FFFFFF000000FFFFFF000000000000000000000000000000000000BD0000
      BDBD00000000000000000000000000000000000000000000FFFF000000000000
      00000000000000000000000000000000000000000000000000000000FFFFFF84
      8484848484FFFFFF0000000000FF84848400FFFF00FFFF0000FF848484000000
      0000FF8484848484848484840000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000C6
      C6C6848484000000848484000000000000000000000000000000000000BD0000
      0000000000000000000000000000000000000000000000000000000000008484
      84000000000000000000000000BDBD00BD000000000000000000000000000000
      0000000000000000FFFF00FFFF00000000000000000000000000000000000000
      00000000000000000000FFFF00000000000000000000FFFF0000FF0000FF00FF
      FF00FFFF00FFFF00FFFF0000FF0000FF84848400000000000000FFFF00FFFF00
      0000000000000000000000C6C6C6FFFFFFC6C6C6FFFFFFC6C6C6FFFFFFC6C6C6
      FFFFFFC6C6C6FFFFFF000000C6C6C6000000C6C6C60000008484840000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000000BD0000
      BDBD00000000000000000000000000000000000000000000000000FFFF00FFFF
      0000000000000000000000000000000000000000000000000000FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
      84848400000084848400FFFF00FFFF0000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000FFFFFF000000C6
      C6C6000000000000848484000000000000000000000000000000000000000000
      000000000000000000000000000000FFFFFF848484848484FFFFFF0000000000
      00000000000000000000000000BDBD00BD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFF00FFFF00FFFF00FFFF00FFFF0000008484848484
      8400FFFF00FFFF00FFFF00FFFF00FFFF84848400FFFF00000000FFFF00FFFF00
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFF00FFFF
      FFFFFFFFFFFFFFFFFF000000FFFFFF000000C6C6C60000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000FFFFFF
      BDBD000000000000000000000000000000000000000000000000000000000000
      00FFFFFFFFFFFF00000000000000000000000000000000000000000000FFFF00
      FFFF00FFFF00FFFF00000000000000000000FFFF00FFFF00FFFF00FFFF00FFFF
      00000000000000FFFF0000000000000000000000000000000000000000000000
      00000000FFFFFF000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000BDBD00BDBD0000000000000000000000000000
      0000000000000000000000000000000000FFFFFFFFFFFF000000000000000000
      00000000000000000000000000000000FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00000000000000
      0000000000000000000000000000000000000000FFFFFF00FFFFFFFFFFFFFFFF
      FFFFFF00FFFFFFFFFFFFFFFF0000000000000000000000000000000000000000
      00000000000000FFFFFFFFFFFFFFFFFF000000FFFFFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000BDBD00
      BDBD000000000000000000000000000000000000000000000000000000000000
      00000000FFFFFFFFFFFF00000000000000000000000000000000000000000000
      000000FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF0000000000000000000000000000000000000000000000000000
      00000000000000FFFFFF000000000000000000000000000000FFFFFF00000000
      0000000000000000000000000000000000000000000000FFFFFF848484FFFFFF
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000BDBD00BDBD0000000000000000000000000000
      0000000000000000000000000000000000000000FFFFFFFFFFFF000000000000
      00000000000000000000000000000000000000000000000000FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFFFFFFFFFF00FFFF
      FFFFFFFFFFFFFFFFFF00FFFFFFFFFF0000000000000000000000000000000000
      00000000000000FFFFFF848484FFFFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      BDBD000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFFFF00000000000000000000000000000000000000000000
      000000000000000000FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFFFFFFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFFFF000000000000
      00000000000000000000000000000000000000000000000000000000FFFF00FF
      FF00FFFF00FFFF00FFFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF00FFFF00FFFF00FFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF00FFFF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0094FF0000CE0000000000
      00000000000000000000000000000000848484FFFFFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00CE0094FF0000FF0000CE000000006363006363009CCE009CCE008484009CCE
      008484009CCE008484009CCE008484848484FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484FFFFFF000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CE0094FF0000FF0000CE0000000000000063
      639CFFFF006363009CCE009CCE009CCE009CCE008484009CCE008484009CCE00
      8484009CCE008484000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000BDBDBD0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000CE0094FF00
      00FF0000CE0000000000000000000063639CFFFF00CEFF006363009CCE008484
      009CCE009CCE009CCE009CCE008484009CCE008484009CCE0084840000000000
      00000000000000000000FFFFFF00000000FFFF00FFFF00000000000000FFFF00
      000000000000000000000000FFFF000000000000000000848484000000FFFFFF
      0000000000000000000000000000000000000000000000000000000000000000
      00000000BD0000FFFFFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000CE0094FF0000FF0000CE0000000000000000000000000063
      639CFFFF00CEFF00CEFF006363009CCE009CCE009CCE008484009CCE009CCE00
      8484009CCE008484009CCE008484000000000000000000000000000000000000
      00000000000000FFFF00FFFF00FFFF00000000000000FFFF00000000FFFF00FF
      FF00FFFF00FFFF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000BD0000BD0000BD0000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00CE9429CE9400CE9400CE9400946329848484FFFFFF0094FF0000FF0000CE00
      00000000000000000000000000000063639CFFFFFFFFFF00CEFF00CEFF006363
      009CCE009CCE009CCE009CCE009CCE009CCE848484FFFFFF008484009CCE0084
      8400000000000000000000000000000000000000000000FFFF00FFFF00FFFF00
      0000000000FFFFFF00000000FFFF00FFFF00FFFF00FFFF000000000000000000
      000000000000000000000000000000000000000000000000000000000000BD00
      00BD0000BD0000BD0000FFFFFF00000000000000000000000000000000000000
      0000000000000000848484FFCE29FFCE29FFCE29FFCE29CE9400CE9400CE9400
      CE94009463290000000000CE0000000000000000000000000000000000000063
      639CFFFF00CEFF00CEFF00CEFF00CEFF006363009CCE009CCE009CCE009CCE00
      9CCE008484009CCE009CCE008484009CCE008484000000000000000000000000
      00000000000000FFFF00FFFF00FFFF000000000000FFFFFF00000000FFFF0000
      00FFFFFF00FFFF00000000000000000000000000000000000000000000000000
      0000000000848484FFFFFFBD0000BD0000BD0000FFFFFFBD0000BD0000FFFFFF
      000000000000000000000000000000000000000000848484ADB5ADFFCE29FFCE
      29FFCE29FFCE29FFCE29FFCE29CE9400CE9400CE940094632900000000000000
      0000000000000000000000000000848484FFFFFFFFFFFF00CEFF00CEFFFFFFFF
      00CEFF0063630063630063630063630063630063630063630063630063630063
      6300636300636300000000000000000000FFFF00FFFF00FFFF00FFFF000000FF
      FFFFFFFFFF7B7B7BFFFFFF00000000FFFF00FFFF00FFFF00FFFF000000000000
      000000000000000000000000000000FFFFFFFFFFFFFFFFFFBD0000BD0000BD00
      00FFFFFF000000000000BD0000BD0000FFFFFF00000000000000000000000000
      0000000000848484FFFF94FFFF94FFFF94FFFF94FFCE94FFCE29FFCE29FFCE29
      CE9400CE9400CE94000000000000000000000000000000000000000000000063
      639CFFFF00CEFFFFFFFF00CEFF00CEFF00CEFF00CEFF00CEFF00CEFF00CEFF00
      CEFF00CEFF000000000000000000000000000000000000000000000000000000
      00FFFF00FFFF00FFFF000000FFFFFF00FFFF00FFFF7B7B7B00FFFFFFFFFF0000
      0000000000FFFF00FFFF000000000000000000000000000000000000000000FF
      FFFF848484848484848484FFFFFFFFFFFFFFFFFF000000000000000000BD0000
      FFFFFF000000000000000000000000000000848484ADB5ADFFFFCEFFFFCEFFFF
      94FFFF94FFFF94FFFF94FFCE29FFCE29FFCE29CE9400CE940094632900000000
      00000000000000000000000000000063639CFFFFFFFFFF00CEFFFFFFFF00CEFF
      FFFFFF9CFFFF9CFFFF9CFFFF9CFFFF9CFFFF9CFFFF0000000000000000000000
      00000000000000000000FFFFFF00FFFF00FFFF00FFFF848484FFFFFF00FFFFFF
      FFFFFFFFFF7B7B7BFFFFFF00FFFF000000FFFFFF00FFFF00FFFF00FFFF00FFFF
      848484000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFF000000000000000000000000BD0000FFFFFF00000000000000000000
      0000848484FFCE94FFFFCEFFFFCEFFFFCEFFFFCEFFFF94FFFF94FFFF94FFCE29
      FFCE29FFCE29CE9400CE94000000000000000000000000000000000000000063
      63FFFFFF00CEFFFFFFFFFFFFFFFFFFFF9CCECE00636300636300636300636300
      6363006363006363000000000000000000000000000000000000000000000000
      00FFFF00FFFF00FFFF000000FFFFFF00FFFF00FFFFFFFFFF00FFFFFFFFFF0000
      0000000000FFFF00FFFF00000000000000000000000000000000000000000084
      8484FFFFFF848484848484848484848484FFFFFF000000000000000000000000
      000000BD0000FFFFFF000000000000000000848484FFCE94FFFFFFFFFFFFFFFF
      CEFFFFCEFFFFCE848484FFFFFFFFCE94FFCE29FFCE29FFCE29CE940000000000
      0000000000000000000000000000000000006363FFFFFF9CFFFF9CFFFF9CCECE
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000FFFF00FFFF00FFFF000000FFFFFF00
      FFFF00FFFF848484FFFFFFFFFFFF00000000000000FFFF00FFFF000000000000
      000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8484
      84FFFFFF000000000000000000000000000000000000BD0000FFFFFF00000000
      0000848484FFCE94FFFFFFFFFFFFFFFFFFFFFFFFFFFFCEFFFFCEFFFFCEFFFF94
      FFCE94FFCE29848484FFFFFF0000000000000000000000000000000000000000
      0000000000636300636300636300636300000000000000000000000000000000
      0000000000000000000000633100633100633100633100633100000000000000
      00FFFF00FFFF00FFFF00FFFF000000FFFFFFFFFFFF00FFFFFFFFFF00000000FF
      FF00FFFF00FFFF00FFFF000000000000000000000000000000000000000000FF
      FFFF848484848484000000000000000000FFFFFF000000000000000000000000
      000000000000000000BD0000000000000000848484ADB5ADFFCE94FFFFFFFFFF
      FFFFFFFFFFFFFFFFFFCEFFFFCEFFFF94FFFF94FFCE29FFCE29CE942900000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CE31
      009C31009C310063310000000000000000000000000000FFFF00FFFF00FFFF00
      0000000000000000848484FFFFFF00FFFF00FFFF00FFFF000000000000000000
      000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000848484FFCE94FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCEFFFF94
      FFFF94FFCE29FFCE290000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000CE31009C3100633100000000000000
      00000000000000FFFF00FFFF00FFFF848484FFFFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF000000000000000000000000000000000000000000000000FF
      FFFF848484FFFFFF000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000848484ADB5ADFFCE94FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCEFFFF94FFCE29CE942900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000009C31000000000000000000000000000000000000009C31
      000000009C310063310000000000000000FFFF00FFFF00000000000000FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00000000000000000000FFFF000000000000
      000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000848484ADB5ADFFCE94FFCE94FFFFFFFFFFFFFFFFFFFFFFCE
      FFCE94ADB5AD0000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000009C310000
      00000000000000000000009C3100000000000000000000633100000000000000
      00FFFF00FFFF00000000000000FFFF00FFFF00FFFF00FFFF00FFFF00FFFF0000
      0000000000000000FFFFFFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000FFFFFF
      0000000000000000000000000000000000000000000000000000008484848484
      84ADB5ADFFCE94FFCE94FFCE94FFCE9484848484848400000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000009C31009C31009C31009C31000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000848484848484848484848484848484
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FFFFFF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000848484FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000848484848484FFFFFFCECECECECECECECECECECECECECECECECECE
      CECECECECECECECECECECECECECECECECECECECECE0000000000000000002963
      6363949463949463949429312929312929312929312929312929312929312929
      3129293129ADB5ADADB5ADADB5AD848484FFFFFF006363000000000000848484
      CECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECECE
      CECECECECECECECECECE00000000000000000000000000000000000000000000
      00000000000000000094CE00CEFF0094CE000000000000000000000000000000
      000000000000000000000000000000000000000000848484FFFFFF94FFFFFFFF
      FF94FFFFFFFFFF94FFFFFFFFFF94FFFFFFFFFF94FFFFFFFFFF94FFFFFFFFFF94
      FFFFCECECE00000000000000000029636363949494CECE94CECE4A4A4A4A4A4A
      293129293129293129293129293129293129293129CECECEADB5ADADB5AD2931
      2963949400636300000000000084848494FFFFFFFFFF94FFFFFFFFFF94FFFFFF
      FFFF94FFFFFFFFFF94FFFFFFFFFF94FFFFFFFFFF94FFFF848484FFFFFF000000
      0000000000000000000000000000000000000000000000000094CE00CEFF0094
      CE00000000000000000000000000000000000000000000000000000000000000
      0000000000848484FFFFFFFFFFFF94FFFFFFFFFF94FFFFFFFFFF94FFFFFFFFFF
      94FFFFFFFFFF94FFFFFFFFFF94FFFFFFFFFFCECECE0000000000000000002963
      6394CECE94CECE94CECE4A4A4A4A4A4A4A4A4A4A4A4A29312929312929312929
      3129293129CECECEADB5ADADB5AD293129639494639494000000000000848484
      FFFFFFFFFFFF943100943100FFFFFF9431009431009431009431009431009431
      00943100FFFFFFCECECEFFFFFF00000000000000000000000000000000000000
      00000000000094CE00CEFF0094CE000000000000000000000000000000000000
      848484FFFFFF000000000000000000000000000000848484FFFFFF94FFFF8484
      84FFFFFFFFFFFF94FFFFFFFFFF94FFFFFFFFFF94FFFFFFFFFF94FFFFFFFFFF94
      FFFFCECECE00000000000000000029636394CECE94CECE94CECE4A4A4A4A4A4A
      4A4A4A4A4A4A4A4A4A293129293129293129848484FFFFFFCECECEADB5AD2931
      29639494639494000000000000848484FFFFFFFFFFFFFFFFFFFFFFFF94FFFFFF
      FFFF94FFFFFFFFFF94FFFFFFFFFF000000FFFFFF94FFFFCECECE000000000000
      0000000000000000000000000000000000000000000094CE00CEFF0094CE0000
      00000000000000000000FF6329FFFFCEFFCE29FF942900000000000000000000
      0000000000848484FFFFFFFFFFFF94FFFFFFFFFF94FFFFFFFFFF94FFFFFFFFFF
      94FFFFFFFFFF94FFFFFFFFFF94FFFFFFFFFFCECECE0000000000000000002963
      6394CECE94CECE848484FFFFFF4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A29
      3129293129FFFFFFCECECEADB5AD293129639494639494000000000000848484
      FFFFFF94FFFFFF0000FF0000FFFFFFFF0000FF0000FF0000FF0000FF0000FF00
      00FF0000FFFFFFCECECE0000000000000000000000000094CE00000000000000
      00000094CE848484FFFFFF000000000000000000000000000000000000FF6329
      FF6329FF6329000000000000000000000000000000848484FFFFFF94FFFFFFFF
      FF94FFFFFFFFFF94FFFFFFFFFF94FFFFFFFFFF94FFFFFFFFFF94FFFFFFFFFF94
      FFFFCECECE000000000000000000296363CEFFFF94CECE94CECE4A4A4A4A4A4A
      4A4A4A4A4A4A848484FFFFFF4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A2931
      29639494639494000000000000848484FFFFFFFFFFFFFFFFFFFFFFFF94FFFFFF
      FFFF94FFFFFFFFFF94FFFFFFFFFF94FFFFFFFFFF94FFFFCECECE000000000000
      0000000000000094CE94FFFF0000000000000094CE00CEFF0094CE0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000FFFFFFFFFFFFFFFFFF94FFFFFFFFFF94FFFFFFFFFF94FFFFFFFFFF
      94FFFFFFFFFF94FFFFFFFFFF94FFFFFFFFFFCECECE0000000000000000002963
      63CEFFFF94CECE94CECE94CECE94CECE94CECE94CECE94CECE94CECE94CECE94
      CECE94CECE94CECE94CECE94CECE94CECE639494639494000000000000848484
      FFFFFFFFFFFFFF0000FF0000FFFFFF848484FFFFFFFF0000FF0000FF0000FF00
      00FF0000FFFFFFCECECE0000000000000000000000000094CE94FFFF94FFFF00
      000000CEFF0094CE848484000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000848484FFFFFFFFFFFFFFFF
      FF94FFFFFFFFFF94FFFFFFFFFF94FFFFFFFFFF94FFFFFFFFFF94FFFFFFFFFF94
      FFFFCECECE000000000000000000296363CEFFFFCEFFFF94CECE94CECE94CECE
      94CECE94CECE94CECE94CECE94CECE94CECE94CECE848484FFFFFF94CECE94CE
      CE94CECE639494000000000000848484FFFFFF94FFFFFFFFFFFFFFFF94FFFFFF
      FFFF94FFFFFFFFFF94FFFFFFFFFF94FFFFFFFFFF94FFFFCECECE000000000000
      0000000000000094CE94FFFF94FFFF848484FFFFFF0094CE0000000000000000
      00000000000000000000000000FF6329FF942900000000000000000000000000
      0000000000848484FFFFFFFFFFFF94FFFFFFFFFF94FFFF848484000000FFFFFF
      94FFFFFFFFFF94FFFFFFFFFF94FFFFFFFFFFCECECE0000000000000000002963
      63CEFFFFCEFFFF94CECEFFFFFF29636329636329636329636329636329636329
      6363296363296363296363296363000000FFFFFF639494000000000000848484
      FFFFFFFFFFFFFF6329FF6329FFFFFFFF6329FF6329FF6329FF6329FF6329FF63
      29FF6329FFFFFFCECECE0000000000000000000000000094CE94FFFF00CEFF94
      FFFF00CEFF00CEFF00CEFF00CEFF848484FFFFFF000000000000000000FF6329
      FF9429000000000000000000000000000000000000848484FFFFFFFFFFFFFFFF
      FF94FFFFFFFFFF94FFFFFFFFFF94FFFFFFFFFF94FFFF848484FFFFFFFFFFFF94
      FFFFCECECE000000000000000000296363CEFFFFCEFFFF639494CEFFFFCEFFFF
      CEFFFF94FFFF94FFFF94FFFF94FFFF94FFFF94FFFF94FFFF848484FFFFFF2963
      6394CECE94CECE000000000000848484FFFFFFFFFFFFFFFFFFFFFFFF94FFFFFF
      FFFF94FFFFFFFFFF94FFFFFFFFFF94FFFFFFFFFF94FFFFCECECE000000000000
      0000000000000094CE94FFFF94FFFF63CEFF94FFFF00CEFF00CEFF0094CE0000
      00000000000000000000FFFFFF000000FF6329FF942900000000000000000000
      0000000000848484FFFFFFFFFFFFFFFFFFFFFFFF94FFFFFFFFFF94FFFFFFFFFF
      94FFFFFFFFFF94FFFFFFFFFF94FFFFFFFFFFCECECE0000000000000000002963
      63CEFFFFCEFFFF639494FFFFFFCEFFFFCEFFFFCEFFFFCEFFFF94FFFF94FFFF84
      8484FFFFFF94FFFF94FFFF94FFFF29636394CECE94CECE000000000000848484
      FFFFFFFFFFFFFFFFFFCECECECECECE94FFFFFFFFFF94FFFFCECECE000000CECE
      CE94FFFFFFFFFFCECECE0000000000000000000000000094CE94FFFF63CEFF94
      FFFF00CEFF00CEFF0094CE000000000000000000000000000000000000000000
      000000FF6329FF9429000000000000000000000000848484FFFFFFFFFFFF0000
      00FFFFFFFFFFFFFFFFFFFFFFFF94FFFFFFFFFF94FFFFFFFFFF94FFFFFFFFFF94
      FFFFCECECE848484000000000000296363CEFFFFCEFFFF639494FFFFFFFFFFFF
      CEFFFFCEFFFFCEFFFFCEFFFFCEFFFF94FFFF94FFFF94FFFF94FFFF94FFFF2963
      6394CECE94CECE000000000000848484848484FFFFFFFFFFFF000000000000CE
      CECEFFFFFFCECECE00000094CECE000000CECECE94FFFFCECECE000000000000
      0000000000000094CE94FFFF94FFFF00CEFF848484FFFFFF0000000000000000
      00000000000000000000000000000000000000000000FF6329FF942900000000
      0000000000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF94FFFFFFFFFF
      94FFFFFFFFFF94FFFFCECECECECECECECECECECECE0000000000000000002963
      63CEFFFFCEFFFF639494FFFFFFFFFFFFFFFFFFFFFFFFCEFFFFCEFFFFCEFFFFCE
      FFFF94FFFF94FFFF94FFFF94FFFF29636394CECE94CECE000000000000848484
      FFFFFFFFFFFFFFFFFF639494CEFFFF848484FFFFFF00000094CECE29636394CE
      CE0000000000000000000000000000000000000000000094CE94FFFF63CEFF00
      CEFF0094CE000000000000000000000000FF6329FFCE29000000000000000000
      000000000000FF6329FFCE29FF9429000000000000848484FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFF94FFFFFFFFFF94FFFF00000000000000000000
      0000000000000000000000000000296363CEFFFFCEFFFF639494FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFCEFFFFCEFFFFCEFFFFCEFFFF94FFFF94FFFF94FFFF2963
      6394CECE94CECE000000000000848484FFFFFFFFFFFFFFFFFFFFFFFF639494CE
      FFFF00000094CECE29636394CECE848484FFFFFF639494639494000000FF6329
      FF63290000000094CE63CEFF94FFFF0094CE0000000000000000000000000000
      00FF6329FFCE29000000000000000000000000000000FF6329FFCE29FF942900
      0000000000848484FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      848484FFFFFF848484FFFFFFFFFFFFBDBDBD0000000000000000000000002963
      63FFFFFFCEFFFF639494FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCEFFFFCE
      FFFFCEFFFFCEFFFF94FFFF94FFFF29636394CECE94CECE000000000000848484
      848484848484848484848484848484639494CEFFFF00000094CECE29636394CE
      CE94CECE94CECE639494639494FF9429FF94290000000094CE94FFFF0094CE00
      0000000000000000000000000000000000FF6329FFFFCE848484FFFFFF000000
      000000000000FF6329FFCE29FF9429000000000000848484FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF94FFFF848484FFFFFFBDBDBD84
      8484000000000000000000000000296363FFFFFFCEFFFF639494FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCEFFFFCEFFFFCEFFFFCEFFFF94FFFF2963
      6394CECE94CECE00000000000000000000000000000000000000000000000000
      0000639494CEFFFF000000CEFFFFCEFFFF94CECE94CECE94CECE94CECEFFCE29
      FFCE290000000094CE63CEFF0000000000000000000000000000000000000000
      00000000FF6329FFFFCEFFFFFF000000000000000000848484FFFFFF00000000
      0000000000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF848484BDBDBD0000000000000000000000000000000000008484
      84FFFFFFFFFFFF639494FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFCEFFFFCEFFFFCEFFFF94FFFF296363296363296363000000000000000000
      000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFCEFF
      FFCEFFFFCEFFFFCEFFFFFFFFFFFFFF94FFFF940000000094CE00000000000000
      0000000000000000000000000000000000000000000000FF6329FF6329FFFFCE
      FFFFCEFFFFCEFF6329FF6329000000000000000000848484FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF84848400000000000000
      000000000000000000000000000029636394CECEFFFFFF639494639463639463
      6394636394636394636394636394636394636394636394636394636394632963
      63BDBDBDFFFFFF84848400000000000000000000000000000000000000000000
      0000000000000000639494639494639494639494639494639494000000FF6329
      FF63290000000094CE0000000000000000000000000000000000000000000000
      00000000000000000000000000FF6329FF6329FF632900000000000000000000
      0000000000848484848484FFFFFF848484848484848484848484848484848484
      8484848484848484840000000000000000000000000000000000000000002963
      6329636329636363949463946363946363946363946363946363946363946363
      9463639463639463639463639463296363296363296363000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0094000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000FFFFFF
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000002931CE0000FF0000940000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000002931CE00
      63FF0000FF000094000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000FF6329FFFF94FFCE29000000000000
      0000000000000000000000002931CE2994FF0063FF0000CE0000940000000000
      000000000000000000000000000000000000000000000000000000FF00000000
      0000000000000000000000000000000000000000000000FF9429FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF6329848484000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00FF6329FFFF94FFCE2900000000000000000000000000000000000000000029
      31CE2994FF0000FF000094000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      00000000FF9429FF942900000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF9429FF63290000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF6329FFFF94FFCE29000000
      000000000000000000000000000000000000FFFFFF2994FF0000CE0000940000
      000000000000000000000000000000000000000000FF00009400000000000000
      0000000000000000000000000000000000FF9429FFCE29848484FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF9429FFCE29848484FFFFFF000000000000000000000000000000FF6329
      FFCE29FFCE29FFCE29FFCE29FFCE29FFCE290000000000000000000000000000
      00000000FF6329FFFF94FFCE2900000000000000000000000000000000000000
      00000000000000CE0063FF000094000000000000000000000000000000000000
      0000FF000094000000000000000000000000000000000000000000000000FF94
      29FFCE29FFCE29FF9429FFFFFFFF9429FF9429FF9429848484FFFFFFFF9429FF
      9429000000000000000000000000000000000000000000FF6329FF9429FF9429
      848484FFFFFFFF9429FF9429FF9429FF9429FF9429FFCE29FFCE29FF63290000
      00000000000000000000000000FF6329FFFF94FFFF94FFFF94FFFF94FFCE2900
      0000000000000000000000000000000000000000000000FF6329FFFF94FFCE29
      0000000000000000000000000000000000000000000000000000CE0000FF0000
      940000000000000000000000000000FF00009400000000000000000000000000
      0000000000000000FF6329FFFFCE000000FFFFFFFFCE29FFCE29FFCE29FFCE29
      FFCE29FFCE29FFCE29FFCE29FFCE29FF94290000000000000000000000000000
      00000000000000FF6329FFFFCEFFCE29FFCE29FFCE29FFCE29FFCE29FFCE2984
      8484FFFFFFFFCE29FFCE29FFCE29FF6329000000000000000000000000FF6329
      FFFFCEFFFF94FFFF94FFCE290000000000000000000000000000000000000000
      00000000000000FF6329FFFF94FFCE2900000000000000000000000000000000
      00000000000000000000000000CE0000FF0000940000000000000000FF000094
      000000000000000000000000000000000000000000000000000000FF6329FFFF
      CEFFFF94FFCE29FFFF94FFFF94FFFF94FFFF94FFFF94FFFF94FFFF94FFFF94FF
      9429000000000000000000000000000000000000000000FF6329FFFFCEFFFFCE
      FFFFCEFFFFCEFFFFCEFFFFCEFFFFCEFFFFCEFFFFCEFFCE29FFFF94FFCE298484
      84000000000000000000000000FF6329FFFFCEFFFFCEFFFF94FFFF94FFCE2900
      0000000000000000000000000000000000000000000000FF6329FFFF94FFCE29
      0000000000000000000000000000000000000000000000000000000000000000
      CE0000FF0000940000FFFFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000FF6329FFFFCEFFFF94FFFF94000000FF6329
      FF6329FF6329FF6329FF6329FF6329FF63290000000000000000000000000000
      00000000000000FF6329FF6329FF6329FF6329FF6329FF6329FF6329FF6329FF
      6329FFFFCEFFFF94FFCE29000000000000000000000000000000000000FF6329
      FFFFCEFFFFCE000000FFFF94FFFF94FFCE290000000000000000000000000000
      00000000000000848484FFFFFFFFCE2900000000000000000000000000000000
      00000000000000000000000000000000000000CE0000FF000094000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00FF6329FFFFCEFFFF9400000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FF6329FFFFCEFFCE290000000000000000
      00000000000000000000000000FF6329FFFFFF000000000000FF6329FFFF94FF
      FF94FFCE29000000000000000000000000000000000000FF6329FFFF94FFCE29
      0000000000000000000000000000000000000000000000000000000000000000
      CE0000FF0000940000CE00009400000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF6329FFFFCE000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      6329848484FFFFFF000000000000000000000000000000000000000000FF6329
      000000000000000000000000FF6329FFFF94FFFF94FFCE29FFCE290000000000
      00000000000000FFCE29FFFF94FFCE2900000000000000000000000000000000
      00000000000000000000000000CE0000FF0000940000000000000000CE000094
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FF632900000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FF63290000000000000000000000000000
      00000000000000000000000000FF6329000000000000000000000000000000FF
      6329FF6329FFFF94FFFF94FFCE29FFCE29FFCE29FFCE29FFFF94FFCE29000000
      000000000000000000000000000000000000000000848484FFFFFF0000FF0000
      940000000000000000000000000000CE00009400000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF000000000000000000000000000000000000FF
      6329000000000000000000000000000000000000000000000000000000FFFFFF
      000000000000000000000000000000000000000000FF6329FF6329FFFF94FFFF
      94FFFF94FFFF94FFFF94FFFFFF00000000000000000000000000000000000000
      00CE0000CE2994FF0000FF000094000000000000000000000000000000000000
      0000CE0000940000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FF6329FF6329FF6329FF6329FF6329000000000000
      0000000000000000000000000000CE2994FF0063FF0000FF8484840000000000
      000000000000000000000000000000000000000000CE00009400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000CE2994FF84
      8484FFFFFF000094000000000000000000000000000000000000000000000000
      0000000000000000000000CE0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000006363940000CE0000CE6363940000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000050000000640000000100010000000000B00400000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FFFFFFFFFFFFFFFFF9FF0000FFFFFFFFFFFFFFFC60E70000F801FFFFFFFFFFFB
      A0590000F000FFFC0F843FFFC03F0000E0007FB807820FF5000E0000C0003F98
      039F07F500060000C0003C08039F03FC00070000C0003F99539F81FC00030000
      C0001FB8139F81F800010000C0001FFC079FC1F000000000E0001F040F9FE1F8
      00010000F0003F06079FF0FC00030000F8007C07079FF0FC00070000F801FC07
      FF9FF87F000F0000FC01FC07FF9FF87F801F0000FC00FC0FFFDFFCFFC03F0000
      FE00FC1FFFFFFCFFE07F0000FFFFFC3FFFFFFFFFE0FF0000FFFFFFFFFFFFFFFF
      F9FF0000FFFFFFFFFFFFFFFFFFFF0000FFFF9FFFFFFFBFFFFFFF0000FFFF0000
      7FFE1FFFFFFF0000FFFE00003FFE1FFFFFFF0000FFFC10001FFE1FFFFFFF0000
      FFF830000FCC0EFFFCFF0000F830700007F001FFF87F0000E000F00003F001FF
      F07F0000C001F00001F001FC003F00008003F00000C000FC011F00008003F000
      3FC000FC019F00000001F0003F00001C01CF00000001F0003FC000FC01E70000
      0001F81FFFC000FC01F300000001FC3FE0C000FC39FB00000001FFFFF0F001FC
      01FF00008003FFFFF8F001FC2BFF00008003FFFBF4CC0EFC07FF0000C007FFFD
      EECC0EFC0FFF0000E00FFFFE1FFFBFFFFFFF0000F83FFFFFFFFFBFFFFFFF0000
      800038000180007FE7FF0000800030000080007FC3FF0000800030000080007F
      C3FF0000800030000080007F878F000080003000008000778707000080003000
      008000730F8F000080003000008000710FFF000080003000008000701F8F0000
      8000300000800070018F00008000300000800070038F00008000300000800070
      07C7000080003000008000700FE30000800030000080007018F1000080003000
      0080001038F00000800030000080001078F000008000700000800010F8700000
      8000F00000FF0011FC0100008001F00000FF8013FE0300008003F00000FFC097
      FF8F00008007F00000FFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFF0000FFFFFFFF
      FFFFFFFEFFFF0000FFFFFFFFFFFFFFFC7FFD0000FF7FFFFEFFFFF8FC3FFF0000
      FE7FFFFE7FFFF87C1FFB0000FC7FFFFE3FFFF87E1FF70000F87FFFFE1F803C3F
      0FE70000F0007E000F807C3F8FCF0000E0007E000780FE1FC79F0000C0007E00
      0381FE1FE33F0000E0007E000780FE1FF07F0000F0007E000F807E1FF8FF0000
      F87FFFFE1F881E1FF07F0000FC7FFFFE3F9C001FE33F0000FE7FFFFE7FBE003F
      879F0000FF7FFFFEFFFF807E0FCF0000FFFFFFFFFFFFE0FC1FE70000FFFFFFFF
      FFFFFFF83FFB0000FFFFFFFFFFFFFFF87FFF0000FFFFFFFFFFFFFFFFFFFF0000
      00000000000000000000000000000000000000000000}
  end
  object ActionList1: TActionList
    Left = 688
    Top = 64
    object DataSetFirst1: TDataSetFirst
      Category = 'Dataset'
      Caption = #31532#19968#26465'(&F)'
      Hint = #31532#19968#26465#35760#24405
      ImageIndex = 0
    end
    object DataSetPrior1: TDataSetPrior
      Category = 'Dataset'
      Caption = #19978#19968#26465#65288'&P'#65289
      Hint = #21069#19968#26465#65288'&P'#65289
      ImageIndex = 1
    end
    object DataSetNext1: TDataSetNext
      Category = 'Dataset'
      Caption = #19979#19968#26465#65288'&N'#65289
      Hint = #19979#19968#26465#65288'&N'#65289
      ImageIndex = 2
    end
    object DataSetLast1: TDataSetLast
      Category = 'Dataset'
      Caption = #26368#21518#26465#65288'&L'#65289
      Hint = #26368#21518#19968#26465#35760#24405#65288'&L'#65289
      ImageIndex = 3
    end
    object DataSetInsert1: TDataSetInsert
      Category = 'Dataset'
      Caption = #26032#22686#65288'&I'#65289
      Hint = #26032#22686#65288'&I'#65289
      ImageIndex = 4
    end
    object DataSetDelete1: TDataSetDelete
      Category = 'Dataset'
      Caption = #21024#38500#65288'&D'#65289
      Hint = #21024#38500#65288'&D'#65289
      ImageIndex = 5
    end
    object DataSetPost1: TDataSetPost
      Category = 'Dataset'
      Caption = #20445#23384#65288'&S'#65289
      Hint = #20445#23384#35760#24405#65288'&S'#65289
      ImageIndex = 7
    end
    object DataSetCancel1: TDataSetCancel
      Category = 'Dataset'
      Caption = #21462#28040#65288'&C'#65289
      Hint = #21462#28040#25805#20316#65288'&C'#65289
      ImageIndex = 8
    end
    object DataSetRefresh1: TDataSetRefresh
      Category = 'Dataset'
      Caption = #21047#26032#65288'&R'#65289
      Hint = #21047#26032#35760#24405
      ImageIndex = 9
    end
    object actUpdate: TAction
      Caption = #19978#20256#65288'&U'#65289
      Hint = #19978#20256#21040#26381#21153#22120#65288'&U'#65289
      ImageIndex = 1
      Visible = False
      OnExecute = actUpdateExecute
    end
    object actChecked: TAction
      Caption = #23457#26680
      Hint = #21333#25454#24050#23457#26680#36807#65292#27491#30830#30340
      ImageIndex = 11
      OnExecute = actCheckedExecute
    end
    object actPrint: TAction
      Caption = #25171#21360
      Hint = #25171#21360#21333#25454
      OnExecute = actPrintExecute
    end
    object actPrint2: TAction
      Caption = #25171#21360'2'
      Hint = #25171#21360'2'
      OnExecute = actPrint2Execute
    end
    object actcopy: TAction
      Caption = #21333#25454#22797#21046
      Hint = #22797#21046#24403#21069#21333#25454#65292#29983#25104#19968#24352#31354#30340#21333#25454
      ImageIndex = 6
      OnExecute = actcopyExecute
    end
  end
  object DosMove1: TDosMove
    Active = True
    Left = 720
    Top = 48
  end
  object spInCheck: TADOStoredProc
    Connection = DM.DB
    ProcedureName = 'sp_BuyCheck;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@BillNo'
        Attributes = [paNullable]
        DataType = ftString
        Size = 20
        Value = ''
      end
      item
        Name = '@Mess'
        Attributes = [paNullable]
        DataType = ftString
        Direction = pdInputOutput
        Size = 300
        Value = Null
      end>
    Left = 480
    Top = 32
  end
  object RMReport1: TRMReport
    SaveReportOptions.UseRegistry = True
    SaveReportOptions.RegistryPath = 'ReportMachine\ReportSettings\'
    InitialZoom = pzPageWidth
    ModifyPrepared = False
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbPageSetup, pbExit, pbDesign, pbSaveToXLS]
    Left = 544
    Top = 432
    ReportForm = {2A000000}
  end
  object RMDesigner1: TRMDesigner
    HelpFile = 'rmuser.hlp'
    Left = 496
    Top = 432
  end
  object rmdInitems: TRMDBDataSet
    DataSet = DM.tabInItems
    Left = 464
    Top = 432
  end
  object rmdIn: TRMDBDataSet
    DataSet = DM.tabIn
    Left = 416
    Top = 432
  end
  object adoInitems: TADOQuery
    Connection = DM.DB
    CursorType = ctStatic
    DataSource = DM.dsIn
    Parameters = <
      item
        Name = 'Sheetid'
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = '200208260004'
      end>
    SQL.Strings = (
      
        'select a.gdsid,B.GDSNAME,a.unit,sum(a.qua ) as qua,avg(price) as' +
        ' price ,sum(a.qua*a.price) as amo'
      'from Initems A ,GOODs B'
      'where (a.sheetid = :sheetid) AND (A.GDSID=B.GDSID)'
      'group by a.gdsid,a.unit,B.GDSNAME'
      'order by a.gdsid')
    Left = 416
    Top = 472
  end
  object RMDBAdoInItemsGroup: TRMDBDataSet
    DataSet = adoInitems
    Left = 464
    Top = 472
  end
end
