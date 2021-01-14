object Formaddpage: TFormaddpage
  Left = 249
  Top = 196
  Width = 501
  Height = 308
  BorderIcons = [biSystemMenu, biHelp]
  Caption = #22686#21152#39033#30446
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 164
    Top = 115
    Width = 325
    Height = 123
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object Label1: TLabel
      Left = 25
      Top = 19
      Width = 48
      Height = 12
      Caption = #39033#30446#21517#31216
    end
    object Label2: TLabel
      Left = 35
      Top = 39
      Width = 24
      Height = 12
      Caption = #25968#37327
    end
    object Label3: TLabel
      Left = 34
      Top = 62
      Width = 24
      Height = 12
      Caption = #37096#38376
    end
    object Label4: TLabel
      Left = 35
      Top = 84
      Width = 24
      Height = 12
      Caption = #26085#26399
    end
    object Edmc: TEdit
      Left = 85
      Top = 15
      Width = 233
      Height = 18
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
    end
    object dxCsl: TdxCurrencyEdit
      Left = 85
      Top = 35
      Width = 130
      TabOrder = 1
      OnKeyDown = dxCslKeyDown
      DisplayFormat = ',0.00;-,0.00'
      StoredValues = 0
    end
    object Cbm: TComboBox
      Left = 85
      Top = 58
      Width = 212
      Height = 20
      ItemHeight = 12
      TabOrder = 2
      OnKeyDown = CbmKeyDown
    end
    object drq: TDateTimePicker
      Left = 85
      Top = 80
      Width = 186
      Height = 20
      Date = 39169.000000000000000000
      Time = 39169.000000000000000000
      TabOrder = 3
      OnKeyDown = drqKeyDown
    end
    object dxljje: TdxCurrencyEdit
      Left = 218
      Top = 34
      Width = 98
      TabOrder = 4
      OnKeyDown = dxljjeKeyDown
      OnChange = dxljjeChange
    end
  end
  object Bqd: TButton
    Left = 197
    Top = 245
    Width = 122
    Height = 29
    Caption = #30830#23450
    TabOrder = 3
    OnClick = BqdClick
  end
  object Bet: TButton
    Left = 346
    Top = 246
    Width = 122
    Height = 28
    Caption = #36864#20986
    TabOrder = 4
    OnClick = BetClick
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 0
    Width = 162
    Height = 281
    Align = alLeft
    Caption = #37096#38376#20449#32454
    TabOrder = 0
    object wwDBGrid1: TwwDBGrid
      Left = 2
      Top = 15
      Width = 158
      Height = 264
      DittoAttributes.ShortCutDittoField = 0
      DittoAttributes.ShortCutDittoRecord = 0
      DittoAttributes.Options = []
      DisableThemesInTitle = False
      Selected.Strings = (
        'bumen'#9'20'#9#37096#38376#21517#31216#9#9)
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      Color = clInfoBk
      Ctl3D = True
      DataSource = DSBM
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      ParentCtl3D = False
      TabOrder = 0
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 1
      TitleButtons = False
      OnDblClick = wwDBGrid1DblClick
      FooterCellColor = clCream
    end
  end
  object GroupBox3: TGroupBox
    Left = 166
    Top = 4
    Width = 322
    Height = 108
    TabOrder = 2
    object RichEdit1: TRichEdit
      Left = 2
      Top = 15
      Width = 318
      Height = 91
      Align = alClient
      Font.Charset = GB2312_CHARSET
      Font.Color = clRed
      Font.Height = -24
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      Lines.Strings = (
        '  '#35831#22312#24038#36793#36873#25321#37096#38376#20449#24687)
      ParentFont = False
      TabOrder = 0
    end
  end
  object DSBM: TDataSource
    DataSet = DM.qry1
    Left = 132
    Top = 6
  end
end
