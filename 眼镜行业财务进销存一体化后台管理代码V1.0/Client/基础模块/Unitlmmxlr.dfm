object frmlmmxlr: Tfrmlmmxlr
  Left = 247
  Top = 97
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsSingle
  Caption = #26639#30446#20869#23481
  ClientHeight = 372
  ClientWidth = 440
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 2
    Top = 2
    Width = 436
    Height = 339
    BevelInner = bvLowered
    BevelOuter = bvSpace
    TabOrder = 0
    object Label1: TLabel
      Left = 25
      Top = 20
      Width = 52
      Height = 13
      Caption = #26639#30446#32534#21495
    end
    object SpeedButton1: TSpeedButton
      Left = 203
      Top = 70
      Width = 44
      Height = 20
      Caption = #27983#35272
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 251
      Top = 70
      Width = 46
      Height = 20
      Caption = #19978#20256
      Enabled = False
      OnClick = SpeedButton2Click
    end
    object Label2: TLabel
      Left = 26
      Top = 95
      Width = 52
      Height = 13
      Caption = #26639#30446#20869#23481
    end
    object Label3: TLabel
      Left = 232
      Top = 19
      Width = 105
      Height = 13
      Caption = #26368#22823#38468#20214#23481#37327#20026'2M'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 300
      Top = 75
      Width = 65
      Height = 13
      Caption = #24403#21069#38468#20214#65306
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object lsize: TLabel
      Left = 361
      Top = 75
      Width = 7
      Height = 13
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object edtlmzt: TLabeledEdit
      Left = 80
      Top = 43
      Width = 326
      Height = 21
      EditLabel.Width = 52
      EditLabel.Height = 13
      EditLabel.Caption = #26639#30446#20027#39064
      LabelPosition = lpLeft
      LabelSpacing = 3
      TabOrder = 0
    end
    object cbno: TComboBox
      Left = 80
      Top = 16
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 1
      OnKeyPress = cbnoKeyPress
    end
    object edtdir: TLabeledEdit
      Left = 80
      Top = 69
      Width = 116
      Height = 21
      EditLabel.Width = 26
      EditLabel.Height = 13
      EditLabel.Caption = #38468#20214
      LabelPosition = lpLeft
      LabelSpacing = 3
      ReadOnly = True
      TabOrder = 2
    end
    object mmemo: TMemo
      Left = 79
      Top = 96
      Width = 327
      Height = 236
      TabOrder = 3
    end
  end
  object BitBtn1: TBitBtn
    Left = 102
    Top = 343
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
    Top = 343
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
  object Open1: TOpenDialog
    Title = #27983#35272#38468#20214
    Left = 24
    Top = 128
  end
end
