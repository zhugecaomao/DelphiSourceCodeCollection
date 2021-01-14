object F_changepereson: TF_changepereson
  Left = 386
  Top = 124
  Width = 313
  Height = 565
  BorderIcons = [biSystemMenu]
  Caption = #23458#20154#20449#24687#20462#25913
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object pnl1: TPanel
    Left = 0
    Top = 494
    Width = 305
    Height = 44
    Align = alBottom
    BorderStyle = bsSingle
    Color = clBtnShadow
    TabOrder = 0
    object btn1: TBitBtn
      Left = 78
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
      Left = 187
      Top = 9
      Width = 109
      Height = 25
      Caption = #36864#20986
      TabOrder = 1
      OnClick = btn2Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333FF33333333333330003333333333333777333333333333
        300033FFFFFF3333377739999993333333333777777F3333333F399999933333
        3300377777733333337733333333333333003333333333333377333333333333
        3333333333333333333F333333333333330033333F33333333773333C3333333
        330033337F3333333377333CC3333333333333F77FFFFFFF3FF33CCCCCCCCCC3
        993337777777777F77F33CCCCCCCCCC399333777777777737733333CC3333333
        333333377F33333333FF3333C333333330003333733333333777333333333333
        3000333333333333377733333333333333333333333333333333}
      NumGlyphs = 2
    end
  end
  object grp1: TGroupBox
    Left = 2
    Top = 125
    Width = 301
    Height = 57
    Caption = #25171#23383
    TabOrder = 2
    object lbl1: TLabel
      Left = 11
      Top = 14
      Width = 30
      Height = 13
      AutoSize = False
      Caption = #20013#25991
    end
    object lbl2: TLabel
      Left = 10
      Top = 35
      Width = 29
      Height = 13
      AutoSize = False
      Caption = #33521#25991
    end
    object dxCurrencyEdit1: TdxCurrencyEdit
      Left = 49
      Top = 11
      Width = 246
      TabOrder = 0
      DisplayFormat = ',0.;-,0.'
      StoredValues = 0
    end
    object dxCurrencyEdit2: TdxCurrencyEdit
      Left = 50
      Top = 32
      Width = 246
      TabOrder = 1
      DisplayFormat = ',0.;-,0.'
      StoredValues = 0
    end
  end
  object grp2: TGroupBox
    Left = 2
    Top = 375
    Width = 303
    Height = 118
    Caption = #20256#30495
    TabOrder = 6
    object lbl3: TLabel
      Left = 14
      Top = 15
      Width = 24
      Height = 12
      Caption = #22269#38469
    end
    object lbl4: TLabel
      Left = 13
      Top = 37
      Width = 24
      Height = 12
      Caption = #22269#20869
    end
    object lbl5: TLabel
      Left = 14
      Top = 59
      Width = 24
      Height = 12
      Caption = #24066#20869
    end
    object lbl6: TLabel
      Left = 14
      Top = 78
      Width = 24
      Height = 12
      Caption = #25910#25991
    end
    object Label1: TLabel
      Left = 14
      Top = 99
      Width = 24
      Height = 12
      Caption = #20869#37096
    end
    object dxCurrencyEdit3: TdxCurrencyEdit
      Left = 56
      Top = 11
      Width = 243
      TabOrder = 0
      DisplayFormat = ',0.;-,0.'
      StoredValues = 0
    end
    object dxCurrencyEdit4: TdxCurrencyEdit
      Left = 56
      Top = 34
      Width = 243
      TabOrder = 1
      DisplayFormat = ',0.;-,0.'
      StoredValues = 0
    end
    object dxCurrencyEdit5: TdxCurrencyEdit
      Left = 56
      Top = 55
      Width = 243
      TabOrder = 2
      DisplayFormat = ',0.;-,0.'
      StoredValues = 0
    end
    object dxCurrencyEdit6: TdxCurrencyEdit
      Left = 56
      Top = 76
      Width = 243
      TabOrder = 3
      DisplayFormat = ',0.;-,0.'
      StoredValues = 0
    end
    object dxCurrencyEdit20: TdxCurrencyEdit
      Left = 56
      Top = 96
      Width = 241
      TabOrder = 4
      DisplayFormat = ',0.;-,0.'
      StoredValues = 0
    end
  end
  object grp3: TGroupBox
    Left = 2
    Top = 40
    Width = 299
    Height = 82
    Caption = #22797#21360#65306
    TabOrder = 1
    object lbl7: TLabel
      Left = 9
      Top = 17
      Width = 12
      Height = 12
      Caption = 'A4'
    end
    object lbl8: TLabel
      Left = 155
      Top = 16
      Width = 12
      Height = 12
      Caption = 'B5'
    end
    object lbl9: TLabel
      Left = 152
      Top = 39
      Width = 18
      Height = 12
      Caption = '16K'
    end
    object lbl10: TLabel
      Left = 8
      Top = 38
      Width = 12
      Height = 12
      Caption = 'B4'
    end
    object lbl11: TLabel
      Left = 9
      Top = 61
      Width = 12
      Height = 12
      Caption = '8K'
    end
    object lbl12: TLabel
      Left = 153
      Top = 61
      Width = 12
      Height = 12
      Caption = 'A3'
    end
    object dxCurrencyEdit7: TdxCurrencyEdit
      Left = 29
      Top = 15
      Width = 121
      TabOrder = 0
      DisplayFormat = ',0.;-,0.'
      StoredValues = 0
    end
    object dxCurrencyEdit8: TdxCurrencyEdit
      Left = 175
      Top = 15
      Width = 121
      TabOrder = 3
      DisplayFormat = ',0.;-,0.'
      StoredValues = 0
    end
    object dxCurrencyEdit9: TdxCurrencyEdit
      Left = 175
      Top = 37
      Width = 121
      TabOrder = 4
      DisplayFormat = ',0.;-,0.'
      StoredValues = 0
    end
    object dxCurrencyEdit10: TdxCurrencyEdit
      Left = 29
      Top = 36
      Width = 121
      TabOrder = 1
      DisplayFormat = ',0.;-,0.'
      StoredValues = 0
    end
    object dxCurrencyEdit11: TdxCurrencyEdit
      Left = 29
      Top = 57
      Width = 121
      TabOrder = 2
      DisplayFormat = ',0.;-,0.'
      StoredValues = 0
    end
    object dxCurrencyEdit12: TdxCurrencyEdit
      Left = 176
      Top = 57
      Width = 121
      TabOrder = 5
      DisplayFormat = ',0.;-,0.'
      StoredValues = 0
    end
  end
  object grp4: TGroupBox
    Left = 2
    Top = 184
    Width = 301
    Height = 56
    Caption = #25195#25551#65292#25171#21360
    TabOrder = 3
    object lbl13: TLabel
      Left = 10
      Top = 14
      Width = 24
      Height = 12
      Caption = #25195#25551
    end
    object lbl14: TLabel
      Left = 10
      Top = 35
      Width = 24
      Height = 12
      Caption = #25171#21360
    end
    object dxCurrencyEdit13: TdxCurrencyEdit
      Left = 50
      Top = 10
      Width = 246
      TabOrder = 0
      DisplayFormat = ',0.;-,0.'
      StoredValues = 0
    end
    object dxCurrencyEdit14: TdxCurrencyEdit
      Left = 50
      Top = 31
      Width = 246
      TabOrder = 1
      DisplayFormat = ',0.;-,0.'
      StoredValues = 0
    end
  end
  object grp5: TGroupBox
    Left = 2
    Top = 240
    Width = 301
    Height = 76
    Caption = #38271#35805
    TabOrder = 4
    object lbl15: TLabel
      Left = 8
      Top = 14
      Width = 24
      Height = 12
      Caption = #22269#20869
    end
    object lbl16: TLabel
      Left = 8
      Top = 35
      Width = 24
      Height = 12
      Caption = #22269#38469
    end
    object lbl17: TLabel
      Left = 3
      Top = 56
      Width = 48
      Height = 12
      Caption = #28207','#28595','#21488
    end
    object dxCurrencyEdit15: TdxCurrencyEdit
      Left = 55
      Top = 9
      Width = 241
      TabOrder = 0
      DisplayFormat = ',0.;-,0.'
      StoredValues = 0
    end
    object dxCurrencyEdit16: TdxCurrencyEdit
      Left = 55
      Top = 31
      Width = 241
      TabOrder = 1
      DisplayFormat = ',0.;-,0.'
      StoredValues = 0
    end
    object dxCurrencyEdit17: TdxCurrencyEdit
      Left = 56
      Top = 52
      Width = 241
      TabOrder = 2
      DisplayFormat = ',0.;-,0.'
      StoredValues = 0
    end
  end
  object grp6: TGroupBox
    Left = 2
    Top = 319
    Width = 303
    Height = 56
    Caption = #19978#32593#65292#31199#36161
    TabOrder = 5
    object lbl18: TLabel
      Left = 8
      Top = 16
      Width = 24
      Height = 12
      Caption = #19978#32593
    end
    object lbl19: TLabel
      Left = 10
      Top = 33
      Width = 24
      Height = 12
      Caption = #31199#36161
    end
    object dxCurrencyEdit18: TdxCurrencyEdit
      Left = 54
      Top = 9
      Width = 245
      TabOrder = 1
      DisplayFormat = ',0.;-,0.'
      StoredValues = 0
    end
    object dxCurrencyEdit19: TdxCurrencyEdit
      Left = 53
      Top = 30
      Width = 245
      TabOrder = 0
      DisplayFormat = ',0.;-,0.'
      StoredValues = 0
    end
  end
  object GroupBox1: TGroupBox
    Left = 4
    Top = 0
    Width = 294
    Height = 37
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    object lbl20: TLabel
      Left = 11
      Top = 16
      Width = 24
      Height = 12
      Caption = #26085#26399
    end
    object dtp1: TDateTimePicker
      Left = 53
      Top = 12
      Width = 231
      Height = 20
      Date = 38798.000000000000000000
      Time = 38798.000000000000000000
      TabOrder = 0
    end
  end
end
