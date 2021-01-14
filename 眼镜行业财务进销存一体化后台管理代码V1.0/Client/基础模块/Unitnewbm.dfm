object frmnewbm: Tfrmnewbm
  Left = 239
  Top = 173
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = #31185#23460#35774#32622
  ClientHeight = 239
  ClientWidth = 436
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 2
    Top = 5
    Width = 431
    Height = 204
    BevelInner = bvLowered
    BevelOuter = bvSpace
    Color = clMenu
    TabOrder = 0
    object Label1: TLabel
      Left = 9
      Top = 70
      Width = 52
      Height = 13
      Caption = #31649#29702#20179#24211
    end
    object Label2: TLabel
      Left = 9
      Top = 43
      Width = 52
      Height = 13
      Caption = #19978#32423#37096#38376
    end
    object Label3: TLabel
      Left = 10
      Top = 143
      Width = 52
      Height = 13
      Caption = #32844#33021#35828#26126
    end
    object edtbmdm: TLabeledEdit
      Left = 64
      Top = 16
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      Color = clInfoBk
      EditLabel.Width = 52
      EditLabel.Height = 13
      EditLabel.Caption = #37096#38376#32534#21495
      LabelPosition = lpLeft
      LabelSpacing = 3
      TabOrder = 0
    end
    object edtbmmc: TLabeledEdit
      Left = 268
      Top = 14
      Width = 149
      Height = 21
      CharCase = ecUpperCase
      EditLabel.Width = 52
      EditLabel.Height = 13
      EditLabel.Caption = #37096#38376#21517#31216
      LabelPosition = lpLeft
      LabelSpacing = 3
      TabOrder = 2
      OnExit = edtbmmcExit
    end
    object edtksjc: TLabeledEdit
      Left = 269
      Top = 39
      Width = 148
      Height = 21
      CharCase = ecUpperCase
      EditLabel.Width = 52
      EditLabel.Height = 13
      EditLabel.Caption = #37096#38376#31616#31216
      LabelPosition = lpLeft
      LabelSpacing = 3
      TabOrder = 1
    end
    object mremark: TMemo
      Left = 65
      Top = 139
      Width = 354
      Height = 51
      TabOrder = 3
    end
    object cmbsjbm: TComboBox
      Left = 64
      Top = 40
      Width = 123
      Height = 21
      ItemHeight = 13
      TabOrder = 4
      OnKeyPress = cmbsjbmKeyPress
    end
    object cmbstock: TComboBox
      Left = 64
      Top = 66
      Width = 123
      Height = 21
      ItemHeight = 13
      TabOrder = 5
    end
    object edtyb: TLabeledEdit
      Left = 269
      Top = 64
      Width = 148
      Height = 21
      CharCase = ecUpperCase
      EditLabel.Width = 52
      EditLabel.Height = 13
      EditLabel.Caption = #37038#25919#32534#30721
      LabelPosition = lpLeft
      LabelSpacing = 3
      TabOrder = 6
    end
    object edtphone: TLabeledEdit
      Left = 64
      Top = 91
      Width = 123
      Height = 21
      CharCase = ecUpperCase
      EditLabel.Width = 52
      EditLabel.Height = 13
      EditLabel.Caption = #32852#31995#30005#35805
      LabelPosition = lpLeft
      LabelSpacing = 3
      TabOrder = 7
    end
    object edtFzr: TLabeledEdit
      Left = 269
      Top = 89
      Width = 148
      Height = 21
      CharCase = ecUpperCase
      EditLabel.Width = 65
      EditLabel.Height = 13
      EditLabel.Caption = #20027#35201#36127#36131#20154
      LabelPosition = lpLeft
      LabelSpacing = 3
      TabOrder = 8
    end
    object edtaddress: TLabeledEdit
      Left = 65
      Top = 115
      Width = 352
      Height = 21
      CharCase = ecUpperCase
      EditLabel.Width = 52
      EditLabel.Height = 13
      EditLabel.Caption = #36890#20449#22320#22336
      LabelPosition = lpLeft
      LabelSpacing = 3
      TabOrder = 9
    end
  end
  object BitBtn1: TBitBtn
    Left = 95
    Top = 212
    Width = 75
    Height = 25
    Caption = #30830#23450
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = BitBtn1Click
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
  end
  object BitBtn2: TBitBtn
    Left = 255
    Top = 212
    Width = 75
    Height = 25
    Caption = #21462#28040
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = BitBtn2Click
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
  end
end
