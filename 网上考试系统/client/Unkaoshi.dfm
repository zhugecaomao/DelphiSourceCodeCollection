object kaoshifrm: Tkaoshifrm
  Left = 146
  Top = 2
  BorderIcons = [biMinimize]
  BorderStyle = bsSingle
  Caption = #31243#24207#21592#32771#35797#31995#32479
  ClientHeight = 549
  ClientWidth = 792
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Shape2: TShape
    Left = 216
    Top = 48
    Width = 577
    Height = 401
    Brush.Color = clScrollBar
  end
  object Shape1: TShape
    Left = 8
    Top = 56
    Width = 201
    Height = 321
    Brush.Color = clScrollBar
    Shape = stRoundRect
  end
  object Label1: TLabel
    Left = 16
    Top = 104
    Width = 80
    Height = 16
    Caption = #20934#32771#35777#21495#65306
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 144
    Width = 48
    Height = 16
    Caption = #22995#21517#65306
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 16
    Top = 184
    Width = 48
    Height = 16
    Caption = #24615#21035#65306
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 16
    Top = 224
    Width = 80
    Height = 16
    Caption = #36523#20221#35777#21495#65306
    Color = clBtnFace
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label6: TLabel
    Left = 64
    Top = 64
    Width = 89
    Height = 21
    AutoSize = False
    Caption = #20010#20154#36164#26009
    Font.Charset = ANSI_CHARSET
    Font.Color = clTeal
    Font.Height = -19
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object DBText1: TDBText
    Left = 96
    Top = 104
    Width = 89
    Height = 17
    DataField = #20934#32771#35777#21495
    DataSource = DataSource1
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object DBText2: TDBText
    Left = 64
    Top = 144
    Width = 65
    Height = 17
    DataField = #22995#21517
    DataSource = DataSource1
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object DBText3: TDBText
    Left = 64
    Top = 184
    Width = 65
    Height = 17
    DataField = #24615#21035
    DataSource = DataSource1
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object DBText4: TDBText
    Left = 88
    Top = 224
    Width = 105
    Height = 17
    DataField = #36523#20221#35777#21495
    DataSource = DataSource1
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Shape3: TShape
    Left = 8
    Top = 128
    Width = 201
    Height = 1
  end
  object Shape4: TShape
    Left = 8
    Top = 168
    Width = 201
    Height = 1
  end
  object Shape5: TShape
    Left = 8
    Top = 208
    Width = 201
    Height = 1
  end
  object Shape6: TShape
    Left = 8
    Top = 248
    Width = 201
    Height = 1
  end
  object Shape7: TShape
    Left = 8
    Top = 88
    Width = 201
    Height = 1
  end
  object Label7: TLabel
    Left = 16
    Top = 256
    Width = 32
    Height = 16
    Caption = #29031#29255
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object StaticText1: TStaticText
    Left = 0
    Top = 8
    Width = 785
    Height = 36
    AutoSize = False
    BevelInner = bvSpace
    BevelKind = bkTile
    BevelOuter = bvNone
    BorderStyle = sbsSingle
    Caption = '             '#39640' '#32423' '#31243' '#24207' '#21592' '#32771' '#35797
    Font.Charset = GB2312_CHARSET
    Font.Color = clNavy
    Font.Height = -32
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 712
    Top = 520
    Width = 75
    Height = 25
    Caption = #36864#20986
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = BitBtn1Click
    Kind = bkClose
  end
  object DBMemo1: TDBMemo
    Left = 224
    Top = 56
    Width = 561
    Height = 385
    DataField = #39064#30446
    DataSource = DataSource2
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object GroupBox4: TGroupBox
    Left = 216
    Top = 456
    Width = 577
    Height = 49
    Caption = #36873#25321#31572#26696
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    object Label4: TLabel
      Left = 24
      Top = 20
      Width = 13
      Height = 24
      Caption = 'A'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 136
      Top = 20
      Width = 12
      Height = 24
      Caption = 'B'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 248
      Top = 20
      Width = 13
      Height = 24
      Caption = 'C'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 360
      Top = 20
      Width = 13
      Height = 24
      Caption = 'D'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 472
      Top = 20
      Width = 13
      Height = 24
      Caption = 'E'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object abox: TComboBox
      Left = 48
      Top = 21
      Width = 41
      Height = 24
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 0
      Items.Strings = (
        #9312
        #9313
        #9314
        #9315
        #9316
        #9317
        #9318
        #9319
        #9320
        #9321)
    end
    object bbox: TComboBox
      Left = 160
      Top = 21
      Width = 41
      Height = 24
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 1
      Items.Strings = (
        #9312
        #9313
        #9314
        #9315
        #9316
        #9317
        #9318
        #9319
        #9320
        #9321)
    end
    object cbox: TComboBox
      Left = 272
      Top = 21
      Width = 41
      Height = 24
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 2
      Items.Strings = (
        #9312
        #9313
        #9314
        #9315
        #9316
        #9317
        #9318
        #9319
        #9320
        #9321)
    end
    object dbox: TComboBox
      Left = 384
      Top = 21
      Width = 41
      Height = 24
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 3
      Items.Strings = (
        #9312
        #9313
        #9314
        #9315
        #9316
        #9317
        #9318
        #9319
        #9320
        #9321)
    end
    object ebox: TComboBox
      Left = 496
      Top = 21
      Width = 41
      Height = 24
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 4
      Items.Strings = (
        #9312
        #9313
        #9314
        #9315
        #9316
        #9317
        #9318
        #9319
        #9320
        #9321)
    end
  end
  object firstbtn: TBitBtn
    Left = 312
    Top = 520
    Width = 75
    Height = 25
    Hint = 'First'
    Caption = #31532#19968#39064
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = firstbtnClick
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
    NumGlyphs = 2
  end
  object nextbtn: TBitBtn
    Left = 384
    Top = 520
    Width = 75
    Height = 25
    Hint = 'Next'
    Caption = #19979#19968#39064
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = nextbtnClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333333333333333333FFF333333333333000333333333
      3333777FFF3FFFFF33330B000300000333337F777F777773F333000E00BFBFB0
      3333777F773333F7F333000E0BFBF0003333777F7F3337773F33000E0FBFBFBF
      0333777F7F3333FF7FFF000E0BFBF0000003777F7F3337777773000E0FBFBFBF
      BFB0777F7F33FFFFFFF7000E0BF000000003777F7FF777777773000000BFB033
      33337777773FF733333333333300033333333333337773333333333333333333
      3333333333333333333333333333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333333333333}
    NumGlyphs = 2
  end
  object priorbtn: TBitBtn
    Left = 456
    Top = 520
    Width = 75
    Height = 25
    Hint = 'Prior'
    Caption = #21069#19968#39064
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = priorbtnClick
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
  end
  object finishbtn: TBitBtn
    Left = 528
    Top = 520
    Width = 75
    Height = 25
    Caption = #20132#21367
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = finishbtnClick
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
  object countbtn: TBitBtn
    Left = 600
    Top = 520
    Width = 89
    Height = 25
    Caption = #26597#30475#25104#32489
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnClick = countbtnClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
      000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
      00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
      F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
      0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
      FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
      FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
      0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
      00333377737FFFFF773333303300000003333337337777777333}
    NumGlyphs = 2
  end
  object GroupBox5: TGroupBox
    Left = 7
    Top = 384
    Width = 202
    Height = 134
    Caption = #32771#35797#26102#38388
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    object Label12: TLabel
      Left = 24
      Top = 32
      Width = 75
      Height = 15
      Caption = #24320#22987#26102#38388#65306
    end
    object Label13: TLabel
      Left = 24
      Top = 64
      Width = 75
      Height = 15
      Caption = #32467#26463#26102#38388#65306
    end
    object Label14: TLabel
      Left = 24
      Top = 96
      Width = 75
      Height = 15
      Caption = #29616#22312#26102#38388#65306
    end
    object Label15: TLabel
      Left = 96
      Top = 32
      Width = 9
      Height = 16
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label16: TLabel
      Left = 96
      Top = 64
      Width = 9
      Height = 16
      Font.Charset = GB2312_CHARSET
      Font.Color = clMaroon
      Font.Height = -16
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label17: TLabel
      Left = 96
      Top = 96
      Width = 9
      Height = 16
      Font.Charset = GB2312_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object StaticText2: TStaticText
    Left = 8
    Top = 525
    Width = 148
    Height = 20
    Caption = #29616#22312#25152#22312#30340#39064#30446#26159#65306
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 10
  end
  object StaticText3: TStaticText
    Left = 148
    Top = 525
    Width = 61
    Height = 17
    AutoSize = False
    BorderStyle = sbsSunken
    Color = cl3DLight
    Font.Charset = GB2312_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 11
  end
  object DBImage1: TDBImage
    Left = 64
    Top = 256
    Width = 89
    Height = 105
    DataField = #29031#29255
    DataSource = DataSource1
    TabOrder = 12
  end
  object BitBtn2: TBitBtn
    Left = 216
    Top = 520
    Width = 75
    Height = 25
    Caption = #24320#22987
    TabOrder = 13
    OnClick = BitBtn2Click
    Kind = bkOK
  end
  object DataSource1: TDataSource
    DataSet = DataModule2.CDSStudent
    Left = 160
    Top = 288
  end
  object DataSource2: TDataSource
    DataSet = DataModule2.CDSKaoshi
    Left = 264
    Top = 112
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 312
    Top = 112
  end
end
