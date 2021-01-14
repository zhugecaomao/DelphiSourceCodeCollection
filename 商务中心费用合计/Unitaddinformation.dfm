object F_addinformation: TF_addinformation
  Left = 320
  Top = 120
  Width = 366
  Height = 546
  BorderIcons = [biSystemMenu]
  Caption = #22686#21152#22797#21360#20449#24687
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object grp1: TGroupBox
    Left = 3
    Top = 436
    Width = 351
    Height = 37
    Caption = #25910#25991
    TabOrder = 6
    object lbl4: TLabel
      Left = 24
      Top = 14
      Width = 39
      Height = 16
      AutoSize = False
      Caption = #25910#25991
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object dxDBCurrencyEdit15: TdxDBCurrencyEdit
      Left = 79
      Top = 11
      Width = 249
      TabOrder = 0
      OnKeyDown = dxDBCurrencyEdit15KeyDown
      DataField = 'resivdpage'
      DataSource = ds1
      DisplayFormat = ',0;-,0'
      Nullable = False
      StoredValues = 0
    end
  end
  object GroupBox3: TGroupBox
    Left = 3
    Top = 271
    Width = 351
    Height = 85
    Caption = #20256#30495
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    object lbl1: TLabel
      Left = 16
      Top = 17
      Width = 58
      Height = 13
      AutoSize = False
      Caption = #22269#22806#20256#30495' '
    end
    object lbl2: TLabel
      Left = 16
      Top = 38
      Width = 60
      Height = 13
      AutoSize = False
      Caption = #22269#20869#20256#30495
    end
    object lbl3: TLabel
      Left = 16
      Top = 59
      Width = 64
      Height = 13
      AutoSize = False
      Caption = #24066#20869#20256#30495
    end
    object dxDBCurrencyEdit12: TdxDBCurrencyEdit
      Left = 94
      Top = 12
      Width = 217
      TabOrder = 0
      DataField = 'SENDOUTSIDE'
      DataSource = ds1
      DisplayFormat = ',0;-,0'
      Nullable = False
      StoredValues = 0
    end
    object dxDBCurrencyEdit13: TdxDBCurrencyEdit
      Left = 94
      Top = 34
      Width = 217
      TabOrder = 1
      OnKeyDown = dxDBCurrencyEdit13KeyDown
      DataField = 'sendinside'
      DataSource = ds1
      DisplayFormat = ',0;-,0'
      Nullable = False
      StoredValues = 0
    end
    object dxDBCurrencyEdit14: TdxDBCurrencyEdit
      Left = 94
      Top = 57
      Width = 217
      TabOrder = 2
      OnKeyDown = dxDBCurrencyEdit14KeyDown
      DataField = 'sendprive'
      DataSource = ds1
      DisplayFormat = ',0;-,0'
      Nullable = False
      StoredValues = 0
    end
    object CheckBox5: TCheckBox
      Left = 315
      Top = 16
      Width = 15
      Height = 17
      TabOrder = 3
      OnClick = CheckBox5Click
      OnMouseDown = CheckBox5MouseDown
    end
  end
  object GroupBox1: TGroupBox
    Left = 1
    Top = 96
    Width = 352
    Height = 82
    Caption = #22797#21360
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object Label1: TLabel
      Left = 7
      Top = 16
      Width = 13
      Height = 13
      AutoSize = False
      Caption = 'B5'
    end
    object Label2: TLabel
      Left = 3
      Top = 38
      Width = 19
      Height = 13
      AutoSize = False
      Caption = '16K'
    end
    object Label3: TLabel
      Left = 192
      Top = 14
      Width = 13
      Height = 13
      AutoSize = False
      Caption = 'A4'
    end
    object Label4: TLabel
      Left = 192
      Top = 58
      Width = 13
      Height = 13
      AutoSize = False
      Caption = '8K'
    end
    object Label5: TLabel
      Left = 192
      Top = 37
      Width = 13
      Height = 13
      AutoSize = False
      Caption = 'A3'
    end
    object Label6: TLabel
      Left = 6
      Top = 60
      Width = 13
      Height = 13
      AutoSize = False
      Caption = 'B4'
    end
    object dxDBCurrencyEdit3: TdxDBCurrencyEdit
      Left = 23
      Top = 11
      Width = 138
      TabOrder = 0
      DataField = 'B5'
      DataSource = ds1
      DisplayFormat = ',0;-,0'
      Nullable = False
      StoredValues = 0
    end
    object dxDBCurrencyEdit4: TdxDBCurrencyEdit
      Left = 23
      Top = 33
      Width = 138
      TabOrder = 1
      DataField = 'k16'
      DataSource = ds1
      DisplayFormat = ',0;-,0'
      Nullable = False
      StoredValues = 0
    end
    object dxDBCurrencyEdit5: TdxDBCurrencyEdit
      Left = 208
      Top = 10
      Width = 138
      TabOrder = 6
      OnKeyDown = dxDBCurrencyEdit5KeyDown
      DataField = 'A4'
      DataSource = ds1
      DisplayFormat = ',0;-,0'
      Nullable = False
      StoredValues = 0
    end
    object dxDBCurrencyEdit6: TdxDBCurrencyEdit
      Left = 23
      Top = 57
      Width = 138
      TabOrder = 2
      DataField = 'B4'
      DataSource = ds1
      DisplayFormat = ',0;-,0'
      Nullable = False
      StoredValues = 0
    end
    object dxDBCurrencyEdit7: TdxDBCurrencyEdit
      Left = 209
      Top = 55
      Width = 138
      TabOrder = 8
      OnKeyDown = dxDBCurrencyEdit7KeyDown
      DataField = 'K8'
      DataSource = ds1
      DisplayFormat = ',0;-,0'
      Nullable = False
      StoredValues = 0
    end
    object dxDBCurrencyEdit8: TdxDBCurrencyEdit
      Left = 209
      Top = 33
      Width = 138
      TabOrder = 7
      OnKeyDown = dxDBCurrencyEdit8KeyDown
      DataField = 'A3'
      DataSource = ds1
      DisplayFormat = ',0;-,0'
      Nullable = False
      StoredValues = 0
    end
    object CheckBox3: TCheckBox
      Left = 163
      Top = 34
      Width = 15
      Height = 17
      TabOrder = 4
      OnClick = CheckBox3Click
      OnMouseDown = CheckBox3MouseDown
    end
    object CheckBox4: TCheckBox
      Left = 164
      Top = 58
      Width = 15
      Height = 17
      TabOrder = 5
      OnClick = CheckBox4Click
      OnMouseDown = CheckBox4MouseDown
    end
    object CheckBox8: TCheckBox
      Left = 163
      Top = 12
      Width = 15
      Height = 17
      TabOrder = 3
      OnClick = CheckBox8Click
      OnMouseDown = CheckBox8MouseDown
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 478
    Width = 358
    Height = 41
    Align = alBottom
    BorderStyle = bsSingle
    Color = clMedGray
    TabOrder = 0
    object btn1: TBitBtn
      Left = 119
      Top = 8
      Width = 108
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
      Left = 233
      Top = 7
      Width = 106
      Height = 25
      Caption = #36864#20986
      TabOrder = 1
      OnClick = btn2Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
        03333377777777777F333301111111110333337F333333337F33330111111111
        0333337F333333337F333301111111110333337F333333337F33330111111111
        0333337F333333337F333301111111110333337F333333337F33330111111111
        0333337F3333333F7F333301111111B10333337F333333737F33330111111111
        0333337F333333337F333301111111110333337F33FFFFF37F3333011EEEEE11
        0333337F377777F37F3333011EEEEE110333337F37FFF7F37F3333011EEEEE11
        0333337F377777337F333301111111110333337F333333337F33330111111111
        0333337FFFFFFFFF7F3333000000000003333377777777777333}
      NumGlyphs = 2
    end
  end
  object GroupBox2: TGroupBox
    Left = 3
    Top = 182
    Width = 351
    Height = 89
    Caption = #27833#21360
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    object Label9: TLabel
      Left = 28
      Top = 17
      Width = 13
      Height = 13
      AutoSize = False
      Caption = 'A4'
    end
    object Label10: TLabel
      Left = 26
      Top = 40
      Width = 13
      Height = 13
      AutoSize = False
      Caption = '8K'
    end
    object Label11: TLabel
      Left = 25
      Top = 66
      Width = 28
      Height = 13
      AutoSize = False
      Caption = #33098#29256
    end
    object dxDBCurrencyEdit9: TdxDBCurrencyEdit
      Left = 94
      Top = 15
      Width = 217
      TabOrder = 0
      OnKeyDown = dxDBCurrencyEdit9KeyDown
      DataField = 'A42'
      DataSource = ds1
      DisplayFormat = ',0;-,0'
      Nullable = False
      StoredValues = 0
    end
    object dxDBCurrencyEdit10: TdxDBCurrencyEdit
      Left = 94
      Top = 39
      Width = 218
      TabOrder = 1
      DataField = 'K82'
      DataSource = ds1
      DisplayFormat = ',0;-,0'
      Nullable = False
      StoredValues = 0
    end
    object dxDBCurrencyEdit11: TdxDBCurrencyEdit
      Left = 94
      Top = 64
      Width = 218
      TabOrder = 2
      OnKeyDown = dxDBCurrencyEdit11KeyDown
      DataField = 'LABAN'
      DataSource = ds1
      DisplayFormat = ',0;-,0'
      Nullable = False
      StoredValues = 0
    end
    object CheckBox2: TCheckBox
      Left = 316
      Top = 43
      Width = 15
      Height = 17
      TabOrder = 3
      OnClick = CheckBox2Click
      OnMouseDown = CheckBox2MouseDown
    end
  end
  object GroupBox4: TGroupBox
    Left = 3
    Top = 358
    Width = 351
    Height = 76
    Caption = #38271#35805
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    object lbl10: TLabel
      Left = 14
      Top = 52
      Width = 60
      Height = 12
      Caption = #28207#28595#21488#38271#35805
    end
    object lbl9: TLabel
      Left = 16
      Top = 33
      Width = 48
      Height = 12
      Caption = #22269#20869#38271#35805
    end
    object lbl8: TLabel
      Left = 16
      Top = 12
      Width = 48
      Height = 12
      Caption = #22269#22806#38271#35805
    end
    object dxDBCurrencyEdit18: TdxDBCurrencyEdit
      Left = 99
      Top = 50
      Width = 215
      TabOrder = 2
      DataField = 'hgcall'
      DataSource = ds1
      DisplayFormat = #65509',0.00;-'#65509',0.00'
      Nullable = False
      StoredValues = 0
    end
    object dxDBCurrencyEdit17: TdxDBCurrencyEdit
      Left = 99
      Top = 29
      Width = 215
      TabOrder = 1
      OnKeyDown = dxDBCurrencyEdit17KeyDown
      DataField = 'chinacall'
      DataSource = ds1
      DisplayFormat = #65509',0.00;-'#65509',0.00'
      Nullable = False
      StoredValues = 0
    end
    object dxDBCurrencyEdit16: TdxDBCurrencyEdit
      Left = 98
      Top = 8
      Width = 217
      TabOrder = 0
      DataField = 'nationcall'
      DataSource = ds1
      DisplayFormat = #65509',0.00;-'#65509',0.00'
      Nullable = False
      StoredValues = 0
    end
    object CheckBox6: TCheckBox
      Left = 318
      Top = 10
      Width = 15
      Height = 17
      TabOrder = 3
      OnClick = CheckBox6Click
      OnMouseDown = CheckBox6MouseDown
    end
    object CheckBox7: TCheckBox
      Left = 318
      Top = 50
      Width = 15
      Height = 17
      TabOrder = 4
      OnClick = CheckBox7Click
      OnMouseDown = CheckBox7MouseDown
    end
  end
  object GroupBox5: TGroupBox
    Left = 3
    Top = 44
    Width = 350
    Height = 52
    Caption = #25171#21360
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object lbl6: TLabel
      Left = 14
      Top = 12
      Width = 48
      Height = 12
      Caption = #28608#20809#25171#21360
    end
    object lbl7: TLabel
      Left = 15
      Top = 32
      Width = 48
      Height = 12
      Caption = #38024#24335#25171#21360
    end
    object dxDBCurrencyEdit1: TdxDBCurrencyEdit
      Left = 81
      Top = 7
      Width = 217
      TabOrder = 1
      DataField = 'npage'
      DataSource = ds1
      DisplayFormat = ',0;-,0'
      Nullable = False
      StoredValues = 0
    end
    object dxDBCurrencyEdit2: TdxDBCurrencyEdit
      Left = 80
      Top = 29
      Width = 217
      TabOrder = 0
      OnKeyDown = dxDBCurrencyEdit2KeyDown
      DataField = 'wpage'
      DataSource = ds1
      DisplayFormat = ',0;-,0'
      Nullable = False
      StoredValues = 0
    end
    object CheckBox1: TCheckBox
      Left = 302
      Top = 8
      Width = 17
      Height = 17
      TabOrder = 2
      OnClick = CheckBox1Click
      OnMouseDown = CheckBox1MouseDown
    end
  end
  object GroupBox6: TGroupBox
    Left = 4
    Top = -4
    Width = 349
    Height = 44
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    object lbl5: TLabel
      Left = 177
      Top = 19
      Width = 24
      Height = 12
      Caption = #37096#38376
    end
    object Label7: TLabel
      Left = 7
      Top = 19
      Width = 29
      Height = 13
      AutoSize = False
      Caption = #26085#26399
    end
    object dbcbb1: TDBComboBox
      Left = 206
      Top = 15
      Width = 138
      Height = 20
      DataField = 'department'
      DataSource = ds1
      ItemHeight = 12
      TabOrder = 1
      OnKeyDown = dbcbb1KeyDown
    end
    object dxDBDateEdit1: TdxDBDateEdit
      Left = 33
      Top = 15
      Width = 138
      TabOrder = 0
      OnKeyDown = dxDBDateEdit1KeyDown
      DataField = 't_time'
      DataSource = ds1
    end
  end
  object ds1: TDataSource
    DataSet = DM.ADOq1
    Left = 154
    Top = 6
  end
end
