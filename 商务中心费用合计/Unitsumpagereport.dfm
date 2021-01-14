object F_changeinformation: TF_changeinformation
  Left = 369
  Top = 118
  Width = 313
  Height = 532
  BorderIcons = [biSystemMenu]
  Caption = #21830#21153#20013#24515#32440#24352#25968#21512#35745#25253#34920
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 464
    Width = 305
    Height = 41
    Align = alBottom
    BorderStyle = bsSingle
    Color = clAppWorkSpace
    TabOrder = 0
    object btn1: TBitBtn
      Left = 44
      Top = 7
      Width = 116
      Height = 25
      Caption = #30830#23450
      TabOrder = 0
      OnClick = btn1Click
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
    object btn2: TBitBtn
      Left = 179
      Top = 6
      Width = 105
      Height = 25
      Caption = #21462#28040
      TabOrder = 1
      OnClick = btn2Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333FF3333333333333003333333333333377F33333333333307
        733333FFF333337773333C003333307733333777FF333777FFFFC0CC03330770
        000077777FF377777777C033C03077FFFFF077FF77F777FFFFF7CC00000F7777
        777077777777777777773CCCCC00000000003777777777777777333330030FFF
        FFF03333F77F7F3FF3F7333C0C030F00F0F03337777F7F77373733C03C030FFF
        FFF03377F77F7F3F333733C03C030F0FFFF03377F7737F733FF733C000330FFF
        0000337777F37F3F7777333CCC330F0F0FF0333777337F737F37333333330FFF
        0F03333333337FFF7F7333333333000000333333333377777733}
      NumGlyphs = 2
    end
  end
  object grp1: TGroupBox
    Left = 6
    Top = 181
    Width = 295
    Height = 80
    Caption = #27833#21360
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    object lbl2: TLabel
      Left = 11
      Top = 33
      Width = 13
      Height = 13
      AutoSize = False
      Caption = 'A4'
    end
    object lbl3: TLabel
      Left = 12
      Top = 12
      Width = 13
      Height = 13
      AutoSize = False
      Caption = '8K'
    end
    object lbl4: TLabel
      Left = 7
      Top = 57
      Width = 28
      Height = 13
      AutoSize = False
      Caption = #33098#29256
    end
    object dxDBCurrencyEdit9: TdxDBCurrencyEdit
      Left = 45
      Top = 31
      Width = 246
      TabOrder = 1
      DataField = 'A42'
      DataSource = ds1
      DisplayFormat = ',0;-,0'
      Nullable = False
      StoredValues = 0
    end
    object dxDBCurrencyEdit10: TdxDBCurrencyEdit
      Left = 45
      Top = 9
      Width = 246
      TabOrder = 0
      DataField = 'K82'
      DataSource = ds1
      DisplayFormat = ',0;-,0'
      Nullable = False
      StoredValues = 0
    end
    object dxDBCurrencyEdit11: TdxDBCurrencyEdit
      Left = 45
      Top = 53
      Width = 246
      TabOrder = 2
      DataField = 'LABAN'
      DataSource = ds1
      DisplayFormat = ',0;-,0'
      Nullable = False
      StoredValues = 0
    end
  end
  object grp2: TGroupBox
    Left = 4
    Top = 104
    Width = 299
    Height = 76
    Caption = #22797#21360
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object lbl8: TLabel
      Left = 6
      Top = 15
      Width = 13
      Height = 13
      AutoSize = False
      Caption = 'B5'
    end
    object lbl9: TLabel
      Left = 4
      Top = 55
      Width = 19
      Height = 13
      AutoSize = False
      Caption = '16K'
    end
    object lbl10: TLabel
      Left = 150
      Top = 34
      Width = 13
      Height = 13
      AutoSize = False
      Caption = 'A4'
    end
    object lbl11: TLabel
      Left = 150
      Top = 15
      Width = 13
      Height = 13
      AutoSize = False
      Caption = '8K'
    end
    object lbl12: TLabel
      Left = 150
      Top = 55
      Width = 13
      Height = 13
      AutoSize = False
      Caption = 'A3'
    end
    object lbl22: TLabel
      Left = 6
      Top = 33
      Width = 13
      Height = 13
      AutoSize = False
      Caption = 'B4'
    end
    object dxDBCurrencyEdit3: TdxDBCurrencyEdit
      Left = 24
      Top = 10
      Width = 112
      TabOrder = 0
      DataField = 'B5'
      DataSource = ds1
      DisplayFormat = ',0;-,0'
      Nullable = False
      StoredValues = 0
    end
    object dxDBCurrencyEdit4: TdxDBCurrencyEdit
      Left = 24
      Top = 53
      Width = 113
      TabOrder = 2
      DataField = 'k16'
      DataSource = ds1
      DisplayFormat = ',0;-,0'
      Nullable = False
      StoredValues = 0
    end
    object dxDBCurrencyEdit5: TdxDBCurrencyEdit
      Left = 170
      Top = 31
      Width = 109
      TabOrder = 4
      DataField = 'A4'
      DataSource = ds1
      DisplayFormat = ',0;-,0'
      Nullable = False
      StoredValues = 0
    end
    object dxDBCurrencyEdit6: TdxDBCurrencyEdit
      Left = 24
      Top = 32
      Width = 113
      TabOrder = 1
      DataField = 'B4'
      DataSource = ds1
      DisplayFormat = ',0;-,0'
      Nullable = False
      StoredValues = 0
    end
    object dxDBCurrencyEdit7: TdxDBCurrencyEdit
      Left = 170
      Top = 9
      Width = 110
      TabOrder = 3
      DataField = 'K8'
      DataSource = ds1
      DisplayFormat = ',0;-,0'
      Nullable = False
      StoredValues = 0
    end
    object dxDBCurrencyEdit8: TdxDBCurrencyEdit
      Left = 170
      Top = 53
      Width = 109
      TabOrder = 5
      DataField = 'A3'
      DataSource = ds1
      DisplayFormat = ',0;-,0'
      Nullable = False
      StoredValues = 0
    end
  end
  object grp3: TGroupBox
    Left = 5
    Top = 343
    Width = 295
    Height = 113
    Caption = #20256#30495
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    object lbl28: TLabel
      Left = 11
      Top = 13
      Width = 58
      Height = 13
      AutoSize = False
      Caption = #22269#22806#20256#30495
    end
    object lbl29: TLabel
      Left = 12
      Top = 35
      Width = 56
      Height = 13
      AutoSize = False
      Caption = #22269#20869#20256#30495
    end
    object lbl30: TLabel
      Left = 12
      Top = 55
      Width = 51
      Height = 13
      AutoSize = False
      Caption = #24066#20869#20256#30495
    end
    object lbl35: TLabel
      Left = 23
      Top = 75
      Width = 24
      Height = 12
      Caption = #25910#25991
    end
    object dxDBCurrencyEdit12: TdxDBCurrencyEdit
      Left = 71
      Top = 10
      Width = 220
      TabOrder = 0
      DataField = 'SENDOUTSIDE'
      DataSource = ds1
      DisplayFormat = ',0;-,0'
      Nullable = False
      StoredValues = 0
    end
    object dxDBCurrencyEdit13: TdxDBCurrencyEdit
      Left = 71
      Top = 31
      Width = 220
      TabOrder = 1
      DataField = 'sendinside'
      DataSource = ds1
      DisplayFormat = ',0;-,0'
      Nullable = False
      StoredValues = 0
    end
    object dxDBCurrencyEdit14: TdxDBCurrencyEdit
      Left = 71
      Top = 52
      Width = 220
      TabOrder = 2
      DataField = 'sendprive'
      DataSource = ds1
      DisplayFormat = ',0;-,0'
      Nullable = False
      StoredValues = 0
    end
    object dxDBCurrencyEdit15: TdxDBCurrencyEdit
      Left = 71
      Top = 74
      Width = 220
      TabOrder = 3
      DataField = 'resivdpage'
      DataSource = ds1
      DisplayFormat = ',0;-,0'
      Nullable = False
      StoredValues = 0
    end
  end
  object GroupBox1: TGroupBox
    Left = 5
    Top = 263
    Width = 296
    Height = 80
    Caption = #38271#35805
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    object lbl31: TLabel
      Left = 12
      Top = 12
      Width = 48
      Height = 12
      Caption = #22269#22806#38271#35805
    end
    object lbl32: TLabel
      Left = 12
      Top = 33
      Width = 48
      Height = 12
      Caption = #22269#20869#38271#35805
    end
    object lbl33: TLabel
      Left = 6
      Top = 57
      Width = 60
      Height = 12
      Caption = #28207#28595#21488#38271#35805
    end
    object dxDBCurrencyEdit16: TdxDBCurrencyEdit
      Left = 67
      Top = 7
      Width = 220
      TabOrder = 0
      DataField = 'nationcall'
      DataSource = ds1
      DisplayFormat = #65509',0.00;-'#65509',0.00'
      Nullable = False
      StoredValues = 0
    end
    object dxDBCurrencyEdit17: TdxDBCurrencyEdit
      Left = 67
      Top = 29
      Width = 220
      TabOrder = 1
      DataField = 'chinacall'
      DataSource = ds1
      DisplayFormat = #65509',0.00;-'#65509',0.00'
      Nullable = False
      StoredValues = 0
    end
    object dxDBCurrencyEdit18: TdxDBCurrencyEdit
      Left = 68
      Top = 51
      Width = 220
      TabOrder = 2
      DataField = 'hgcall'
      DataSource = ds1
      DisplayFormat = #65509',0.00;-'#65509',0.00'
      Nullable = False
      StoredValues = 0
    end
  end
  object GroupBox2: TGroupBox
    Left = 5
    Top = 46
    Width = 298
    Height = 58
    Caption = #25171#21360
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    object lbl7: TLabel
      Left = 12
      Top = 16
      Width = 24
      Height = 12
      Caption = #33521#35821
    end
    object lbl6: TLabel
      Left = 13
      Top = 37
      Width = 24
      Height = 12
      Caption = #20013#25991
    end
    object dxDBCurrencyEdit2: TdxDBCurrencyEdit
      Left = 64
      Top = 12
      Width = 220
      TabOrder = 0
      DataField = 'wpage'
      DataSource = ds1
      DisplayFormat = ',0;-,0'
      Nullable = False
      StoredValues = 0
    end
    object dxDBCurrencyEdit1: TdxDBCurrencyEdit
      Left = 64
      Top = 34
      Width = 220
      TabOrder = 1
      DataField = 'npage'
      DataSource = ds1
      DisplayFormat = ',0;-,0'
      Nullable = False
      StoredValues = 0
    end
  end
  object GroupBox3: TGroupBox
    Left = 5
    Top = 4
    Width = 300
    Height = 38
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object lbl5: TLabel
      Left = 14
      Top = 16
      Width = 24
      Height = 12
      Caption = #37096#38376
    end
    object dbcbb1: TDBComboBox
      Left = 63
      Top = 13
      Width = 222
      Height = 20
      DataField = 'department'
      DataSource = ds1
      ItemHeight = 12
      TabOrder = 0
    end
  end
  object ds1: TDataSource
    DataSet = DM.ADOq1
    Left = 252
    Top = 43
  end
end
