object frmbcjglr: Tfrmbcjglr
  Left = 193
  Top = 108
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = #29677#27425#32467#26500
  ClientHeight = 195
  ClientWidth = 419
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
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
    Left = 1
    Top = 0
    Width = 416
    Height = 160
    BevelInner = bvLowered
    BevelOuter = bvSpace
    TabOrder = 0
    object Label1: TLabel
      Left = 17
      Top = 47
      Width = 52
      Height = 13
      Caption = #19978#21320#19978#29677
      Transparent = True
    end
    object Label2: TLabel
      Left = 224
      Top = 49
      Width = 52
      Height = 13
      Caption = #19978#21320#19979#29677
      Transparent = True
    end
    object Label3: TLabel
      Left = 17
      Top = 73
      Width = 52
      Height = 13
      Caption = #19979#21320#19978#29677
      Transparent = True
    end
    object Label4: TLabel
      Left = 224
      Top = 75
      Width = 52
      Height = 13
      Caption = #19979#21320#19979#29677
      Transparent = True
    end
    object Label5: TLabel
      Left = 17
      Top = 101
      Width = 52
      Height = 13
      Caption = #26202#19978#19978#29677
      Transparent = True
    end
    object Label6: TLabel
      Left = 224
      Top = 103
      Width = 52
      Height = 13
      Caption = #26202#19978#19979#29677
      Transparent = True
    end
    object Label7: TLabel
      Left = 17
      Top = 127
      Width = 52
      Height = 13
      Caption = #21152#29677#19978#29677
      Transparent = True
    end
    object Label8: TLabel
      Left = 224
      Top = 129
      Width = 52
      Height = 13
      Caption = #21152#29677#19979#29677
      Transparent = True
    end
    object edtbcbh: TLabeledEdit
      Left = 73
      Top = 17
      Width = 121
      Height = 21
      Color = clInfoBk
      EditLabel.Width = 52
      EditLabel.Height = 13
      EditLabel.Caption = #29677#27425#32534#21495
      LabelPosition = lpLeft
      LabelSpacing = 3
      ReadOnly = True
      TabOrder = 0
    end
    object edtbcmc: TLabeledEdit
      Left = 278
      Top = 17
      Width = 121
      Height = 21
      EditLabel.Width = 52
      EditLabel.Height = 13
      EditLabel.Caption = #29677#27425#21517#31216
      LabelPosition = lpLeft
      LabelSpacing = 3
      TabOrder = 1
    end
    object dtswsb: TwwDBDateTimePicker
      Left = 74
      Top = 46
      Width = 121
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Epoch = 1950
      ShowButton = True
      TabOrder = 2
      UnboundDataType = wwDTEdtTime
    end
    object dtxwsb: TwwDBDateTimePicker
      Left = 74
      Top = 70
      Width = 121
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Epoch = 1950
      ShowButton = True
      TabOrder = 3
      UnboundDataType = wwDTEdtTime
    end
    object dtwssb: TwwDBDateTimePicker
      Left = 74
      Top = 95
      Width = 121
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Epoch = 1950
      ShowButton = True
      TabOrder = 4
      UnboundDataType = wwDTEdtTime
    end
    object dtjbsb: TwwDBDateTimePicker
      Left = 74
      Top = 123
      Width = 121
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Epoch = 1950
      ShowButton = True
      TabOrder = 5
      UnboundDataType = wwDTEdtTime
    end
    object dtswxb: TwwDBDateTimePicker
      Left = 278
      Top = 45
      Width = 121
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Epoch = 1950
      ShowButton = True
      TabOrder = 6
      UnboundDataType = wwDTEdtTime
    end
    object dtxwxb: TwwDBDateTimePicker
      Left = 278
      Top = 70
      Width = 121
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Epoch = 1950
      ShowButton = True
      TabOrder = 7
      UnboundDataType = wwDTEdtTime
    end
    object dtwsxb: TwwDBDateTimePicker
      Left = 279
      Top = 98
      Width = 121
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Epoch = 1950
      ShowButton = True
      TabOrder = 8
      UnboundDataType = wwDTEdtTime
    end
    object dtjbxb: TwwDBDateTimePicker
      Left = 280
      Top = 126
      Width = 121
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Epoch = 1950
      ShowButton = True
      TabOrder = 9
      UnboundDataType = wwDTEdtTime
    end
  end
  object BitBtn1: TBitBtn
    Left = 68
    Top = 164
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
    Left = 270
    Top = 164
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
