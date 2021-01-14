object F_addpreson: TF_addpreson
  Left = 358
  Top = 24
  Width = 367
  Height = 593
  BorderIcons = [biSystemMenu]
  Caption = #23458#20154#20449#24687#22686#21152
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
  object grp2: TGroupBox
    Left = 5
    Top = 398
    Width = 353
    Height = 117
    Caption = #20256#30495
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    object lbl3: TLabel
      Left = 16
      Top = 14
      Width = 24
      Height = 12
      Caption = #22269#38469
    end
    object lbl4: TLabel
      Left = 17
      Top = 35
      Width = 24
      Height = 12
      Caption = #22269#20869
    end
    object lbl5: TLabel
      Left = 17
      Top = 54
      Width = 24
      Height = 12
      Caption = #24066#20869
    end
    object lbl6: TLabel
      Left = 18
      Top = 75
      Width = 24
      Height = 12
      Caption = #25910#25991
    end
    object lbl21: TLabel
      Left = 14
      Top = 95
      Width = 48
      Height = 12
      Caption = #20869#37096#20154#21592
    end
    object dxCurrencyEdit3: TdxCurrencyEdit
      Left = 72
      Top = 9
      Width = 217
      TabOrder = 0
      DisplayFormat = ',0.;-,0.'
      StoredValues = 0
    end
    object dxCurrencyEdit4: TdxCurrencyEdit
      Left = 72
      Top = 30
      Width = 217
      TabOrder = 1
      OnKeyDown = dxCurrencyEdit4KeyDown
      DisplayFormat = ',0.;-,0.'
      StoredValues = 0
    end
    object dxCurrencyEdit5: TdxCurrencyEdit
      Left = 72
      Top = 51
      Width = 217
      TabOrder = 2
      OnKeyDown = dxCurrencyEdit5KeyDown
      DisplayFormat = ',0.;-,0.'
      StoredValues = 0
    end
    object dxCurrencyEdit6: TdxCurrencyEdit
      Left = 72
      Top = 72
      Width = 217
      TabOrder = 3
      OnKeyDown = dxCurrencyEdit6KeyDown
      DisplayFormat = ',0.;-,0.'
      StoredValues = 0
    end
    object CheckBox9: TCheckBox
      Left = 292
      Top = 12
      Width = 14
      Height = 16
      TabOrder = 4
      OnClick = CheckBox9Click
      OnMouseDown = CheckBox9MouseDown
    end
    object dxCurrencyEdit20: TdxCurrencyEdit
      Left = 73
      Top = 91
      Width = 215
      TabOrder = 5
      OnKeyDown = dxCurrencyEdit20KeyDown
    end
  end
  object grp1: TGroupBox
    Left = 5
    Top = 40
    Width = 349
    Height = 60
    Caption = #25171#23383
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object lbl1: TLabel
      Left = 13
      Top = 14
      Width = 36
      Height = 13
      AutoSize = False
      Caption = #20013#25991
    end
    object lbl2: TLabel
      Left = 12
      Top = 36
      Width = 34
      Height = 13
      AutoSize = False
      Caption = #33521#25991
    end
    object dxCurrencyEdit1: TdxCurrencyEdit
      Left = 57
      Top = 12
      Width = 217
      TabOrder = 0
      OnKeyDown = dxCurrencyEdit1KeyDown
      DisplayFormat = ',0.;-,0.'
      StoredValues = 0
    end
    object dxCurrencyEdit2: TdxCurrencyEdit
      Left = 57
      Top = 34
      Width = 217
      TabOrder = 1
      DisplayFormat = ',0.;-,0.'
      StoredValues = 0
    end
    object CheckBox1: TCheckBox
      Left = 276
      Top = 35
      Width = 17
      Height = 17
      TabOrder = 2
      OnClick = CheckBox1Click
      OnMouseDown = CheckBox1MouseDown
    end
  end
  object grp3: TGroupBox
    Left = 5
    Top = 103
    Width = 350
    Height = 83
    Caption = #22797#21360
    TabOrder = 3
    object lbl7: TLabel
      Left = 10
      Top = 13
      Width = 13
      Height = 13
      Caption = 'A4'
    end
    object lbl8: TLabel
      Left = 187
      Top = 12
      Width = 13
      Height = 13
      Caption = 'B5'
    end
    object lbl9: TLabel
      Left = 185
      Top = 59
      Width = 19
      Height = 13
      Caption = '16K'
    end
    object lbl10: TLabel
      Left = 189
      Top = 36
      Width = 13
      Height = 13
      Caption = 'B4'
    end
    object lbl11: TLabel
      Left = 8
      Top = 57
      Width = 13
      Height = 13
      Caption = '8K'
    end
    object lbl12: TLabel
      Left = 9
      Top = 35
      Width = 13
      Height = 13
      Caption = 'A3'
    end
    object dxCurrencyEdit7: TdxCurrencyEdit
      Left = 29
      Top = 8
      Width = 138
      TabOrder = 2
      OnKeyDown = dxCurrencyEdit7KeyDown
      DisplayFormat = ',0.;-,0.'
      StoredValues = 0
    end
    object dxCurrencyEdit8: TdxCurrencyEdit
      Left = 208
      Top = 8
      Width = 138
      TabOrder = 6
      DisplayFormat = ',0.;-,0.'
      StoredValues = 0
    end
    object dxCurrencyEdit9: TdxCurrencyEdit
      Left = 209
      Top = 55
      Width = 138
      TabOrder = 8
      DisplayFormat = ',0.;-,0.'
      StoredValues = 0
    end
    object dxCurrencyEdit10: TdxCurrencyEdit
      Left = 208
      Top = 32
      Width = 138
      TabOrder = 7
      DisplayFormat = ',0.;-,0.'
      StoredValues = 0
    end
    object dxCurrencyEdit11: TdxCurrencyEdit
      Left = 28
      Top = 55
      Width = 138
      TabOrder = 1
      OnKeyDown = dxCurrencyEdit11KeyDown
      DisplayFormat = ',0.;-,0.'
      StoredValues = 0
    end
    object dxCurrencyEdit12: TdxCurrencyEdit
      Left = 28
      Top = 32
      Width = 138
      TabOrder = 0
      OnKeyDown = dxCurrencyEdit12KeyDown
      DisplayFormat = ',0.;-,0.'
      StoredValues = 0
    end
    object CheckBox2: TCheckBox
      Left = 173
      Top = 10
      Width = 14
      Height = 17
      TabOrder = 5
      OnClick = CheckBox2Click
      OnMouseDown = CheckBox2MouseDown
    end
    object CheckBox3: TCheckBox
      Left = 172
      Top = 34
      Width = 14
      Height = 16
      TabOrder = 3
      OnClick = CheckBox3Click
      OnMouseDown = CheckBox3MouseDown
    end
    object CheckBox4: TCheckBox
      Left = 172
      Top = 57
      Width = 14
      Height = 16
      TabOrder = 4
      OnClick = CheckBox4Click
      OnMouseDown = CheckBox4MouseDown
    end
  end
  object grp6: TGroupBox
    Left = 5
    Top = 257
    Width = 351
    Height = 61
    Caption = #19978#32593#65292#31199#36161
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    object lbl18: TLabel
      Left = 12
      Top = 16
      Width = 24
      Height = 12
      Caption = #19978#32593
    end
    object lbl19: TLabel
      Left = 13
      Top = 35
      Width = 24
      Height = 12
      Caption = #31199#36161
    end
    object dxCurrencyEdit18: TdxCurrencyEdit
      Left = 72
      Top = 11
      Width = 217
      TabOrder = 1
      OnKeyDown = dxCurrencyEdit18KeyDown
      DisplayFormat = #65509',0.00;-'#65509',0.00'
      StoredValues = 0
    end
    object dxCurrencyEdit19: TdxCurrencyEdit
      Left = 71
      Top = 35
      Width = 217
      TabOrder = 0
      DisplayFormat = #65509',0.00;-'#65509',0.00'
      StoredValues = 0
    end
    object CheckBox6: TCheckBox
      Left = 292
      Top = 38
      Width = 14
      Height = 16
      TabOrder = 2
      OnClick = CheckBox6Click
      OnMouseDown = CheckBox6MouseDown
    end
  end
  object grp5: TGroupBox
    Left = 5
    Top = 320
    Width = 353
    Height = 75
    Caption = #38271#35805
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    object lbl15: TLabel
      Left = 9
      Top = 15
      Width = 24
      Height = 12
      Caption = #22269#20869
    end
    object lbl16: TLabel
      Left = 9
      Top = 35
      Width = 24
      Height = 12
      Caption = #22269#38469
    end
    object lbl17: TLabel
      Left = 6
      Top = 56
      Width = 48
      Height = 12
      Caption = #28207','#28595','#21488
    end
    object dxCurrencyEdit15: TdxCurrencyEdit
      Left = 70
      Top = 10
      Width = 219
      TabOrder = 0
      OnKeyDown = dxCurrencyEdit15KeyDown
      DisplayFormat = #65509',0.00;-'#65509',0.00'
      StoredValues = 0
    end
    object dxCurrencyEdit16: TdxCurrencyEdit
      Left = 70
      Top = 31
      Width = 219
      TabOrder = 1
      DisplayFormat = #65509',0.00;-'#65509',0.00'
      StoredValues = 0
    end
    object dxCurrencyEdit17: TdxCurrencyEdit
      Left = 70
      Top = 52
      Width = 218
      TabOrder = 2
      DisplayFormat = #65509',0.00;-'#65509',0.00'
      StoredValues = 0
    end
    object CheckBox7: TCheckBox
      Left = 291
      Top = 56
      Width = 14
      Height = 16
      TabOrder = 4
      OnClick = CheckBox7Click
      OnMouseDown = CheckBox7MouseDown
    end
    object CheckBox8: TCheckBox
      Left = 290
      Top = 33
      Width = 14
      Height = 16
      TabOrder = 3
      OnClick = CheckBox8Click
      OnMouseDown = CheckBox8MouseDown
    end
  end
  object grp4: TGroupBox
    Left = 5
    Top = 191
    Width = 350
    Height = 64
    Caption = #25195#25551#65292#25171#21360
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    object lbl13: TLabel
      Left = 16
      Top = 15
      Width = 24
      Height = 12
      Caption = #25195#25551
    end
    object lbl14: TLabel
      Left = 16
      Top = 37
      Width = 24
      Height = 12
      Caption = #25171#21360
    end
    object dxCurrencyEdit13: TdxCurrencyEdit
      Left = 70
      Top = 11
      Width = 217
      TabOrder = 0
      DisplayFormat = ',0.;-,0.'
      StoredValues = 0
    end
    object dxCurrencyEdit14: TdxCurrencyEdit
      Left = 71
      Top = 33
      Width = 217
      TabOrder = 1
      OnKeyDown = dxCurrencyEdit14KeyDown
      DisplayFormat = ',0.;-,0.'
      StoredValues = 0
    end
    object CheckBox5: TCheckBox
      Left = 293
      Top = 14
      Width = 14
      Height = 16
      TabOrder = 2
      OnClick = CheckBox5Click
      OnMouseDown = CheckBox5MouseDown
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 521
    Width = 359
    Height = 45
    Align = alBottom
    BorderStyle = bsSingle
    Color = clBtnShadow
    TabOrder = 0
    object btn1: TBitBtn
      Left = 207
      Top = 6
      Width = 113
      Height = 25
      Caption = #21462#28040
      TabOrder = 1
      OnClick = btn1Click
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
    object btn2: TBitBtn
      Left = 77
      Top = 6
      Width = 116
      Height = 26
      Caption = #30830#23450
      TabOrder = 0
      OnClick = btn2Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
        333333777777777F33333330B00000003333337F7777777F3333333000000000
        333333777777777F333333330EEEEEE033333337FFFFFF7F3333333300000000
        333333377777777F3333333330BFBFB03333333373333373F33333330BFBFBFB
        03333337F33333F7F33333330FBFBF0F03333337F33337F7F33333330BFBFB0B
        03333337F3F3F7F7333333330F0F0F0033333337F7F7F773333333330B0B0B03
        3333333737F7F7F333333333300F0F03333333337737F7F33333333333300B03
        333333333377F7F33333333333330F03333333333337F7F33333333333330B03
        3333333333373733333333333333303333333333333373333333}
      NumGlyphs = 2
    end
  end
  object GroupBox1: TGroupBox
    Left = 5
    Top = 3
    Width = 349
    Height = 35
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object lbl20: TLabel
      Left = 11
      Top = 14
      Width = 24
      Height = 12
      Caption = #26085#26399
    end
    object DateTimePicker1: TDateTimePicker
      Left = 58
      Top = 10
      Width = 232
      Height = 20
      Date = 38798.000000000000000000
      Time = 38798.000000000000000000
      TabOrder = 0
      OnKeyDown = DateTimePicker1KeyDown
    end
  end
end
