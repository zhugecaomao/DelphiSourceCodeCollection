object frmPrint: TfrmPrint
  Left = 287
  Top = 111
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #25171#21360#36873#25321#31383#21475
  ClientHeight = 348
  ClientWidth = 363
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 327
    Width = 363
    Height = 21
    Panels = <
      item
        Width = 150
      end
      item
        Width = 200
      end
      item
        Width = 50
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 31
    Width = 363
    Height = 234
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 1
    object SrcLabel: TLabel
      Left = 12
      Top = 10
      Width = 48
      Height = 12
      Caption = #21407#26377#23383#27573
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object DstLabel: TLabel
      Left = 206
      Top = 10
      Width = 48
      Height = 12
      Caption = #30446#26631#23383#27573
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object IncludeBtn: TSpeedButton
      Left = 171
      Top = 38
      Width = 24
      Height = 22
      Caption = '>'
      Enabled = False
      Flat = True
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      OnClick = IncludeBtnClick
    end
    object IncAllBtn: TSpeedButton
      Left = 171
      Top = 88
      Width = 24
      Height = 22
      Caption = '>>'
      Enabled = False
      Flat = True
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      OnClick = IncAllBtnClick
    end
    object ExcludeBtn: TSpeedButton
      Left = 171
      Top = 136
      Width = 24
      Height = 22
      Caption = '<'
      Enabled = False
      Flat = True
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      OnClick = ExcludeBtnClick
    end
    object ExAllBtn: TSpeedButton
      Left = 171
      Top = 186
      Width = 24
      Height = 22
      Caption = '<<'
      Enabled = False
      Flat = True
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      OnClick = ExAllBtnClick
    end
    object Label2: TLabel
      Left = 40
      Top = 300
      Width = 66
      Height = 12
      Caption = #21046#34920#20154#22995#21517':'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 237
      Top = 301
      Width = 54
      Height = 12
      Caption = #21046#34920#26085#26399':'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object SrcList: TListBox
      Left = 11
      Top = 29
      Width = 150
      Height = 196
      Cursor = crArrow
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ItemHeight = 12
      MultiSelect = True
      ParentFont = False
      TabOrder = 0
      OnDblClick = SrcListDblClick
    end
    object DstList: TListBox
      Left = 206
      Top = 29
      Width = 150
      Height = 196
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ItemHeight = 12
      MultiSelect = True
      ParentFont = False
      TabOrder = 1
      OnDblClick = DstListDblClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 296
    Width = 363
    Height = 31
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 2
    object btnOK: TSpeedButton
      Left = 208
      Top = 4
      Width = 68
      Height = 22
      Caption = #30830' '#23450
      Flat = True
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        555555555555555555555555555555555555555555FF55555555555559055555
        55555555577FF5555555555599905555555555557777F5555555555599905555
        555555557777FF5555555559999905555555555777777F555555559999990555
        5555557777777FF5555557990599905555555777757777F55555790555599055
        55557775555777FF5555555555599905555555555557777F5555555555559905
        555555555555777FF5555555555559905555555555555777FF55555555555579
        05555555555555777FF5555555555557905555555555555777FF555555555555
        5990555555555555577755555555555555555555555555555555}
      NumGlyphs = 2
      ParentFont = False
      OnClick = btnOKClick
    end
    object btnCancel: TSpeedButton
      Left = 286
      Top = 4
      Width = 68
      Height = 22
      Caption = #21462' '#28040
      Flat = True
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
        33333337777FF377FF3333993370739993333377FF373F377FF3399993000339
        993337777F777F3377F3393999707333993337F77737333337FF993399933333
        399377F3777FF333377F993339903333399377F33737FF33377F993333707333
        399377F333377FF3377F993333101933399377F333777FFF377F993333000993
        399377FF3377737FF7733993330009993933373FF3777377F7F3399933000399
        99333773FF777F777733339993707339933333773FF7FFF77333333999999999
        3333333777333777333333333999993333333333377777333333}
      NumGlyphs = 2
      ParentFont = False
      OnClick = btnCancelClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 363
    Height = 31
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 3
    object Label1: TLabel
      Left = 9
      Top = 9
      Width = 36
      Height = 12
      Caption = #26631#39064#65306
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object edtPrintTitle: TEdit
      Left = 44
      Top = 5
      Width = 313
      Height = 20
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 265
    Width = 363
    Height = 31
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 4
    object Label4: TLabel
      Left = 10
      Top = 8
      Width = 66
      Height = 12
      Caption = #21046#34920#20154#22995#21517':'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 201
      Top = 9
      Width = 54
      Height = 12
      Caption = #21046#34920#26085#26399':'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object edtLister: TEdit
      Left = 77
      Top = 5
      Width = 74
      Height = 20
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object edtListDate: TEdit
      Left = 256
      Top = 4
      Width = 98
      Height = 20
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
  end
  object ClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'P_General'
    Left = 160
    Top = 40
  end
end
