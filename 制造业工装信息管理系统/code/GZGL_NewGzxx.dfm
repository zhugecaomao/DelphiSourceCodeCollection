object FrmGZGL_NewGzxx: TFrmGZGL_NewGzxx
  Left = 136
  Top = 161
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'FrmGZGL_NewGzxx'
  ClientHeight = 333
  ClientWidth = 632
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = True
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Btn_OK: TSpeedButton
    Left = 352
    Top = 299
    Width = 80
    Height = 23
    Caption = #30830' '#23450
    Flat = True
    OnClick = Btn_OKClick
  end
  object Btn_EXIT: TSpeedButton
    Left = 468
    Top = 299
    Width = 76
    Height = 23
    Caption = #36864' '#20986
    Flat = True
    OnClick = Btn_EXITClick
  end
  object GroupBox1: TGroupBox
    Left = 12
    Top = 58
    Width = 433
    Height = 234
    Caption = #24037#35013#21450#20351#29992#20449#24687
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 31
      Top = 23
      Width = 48
      Height = 12
      Caption = #24037#35013#32534#21495
    end
    object Label2: TLabel
      Left = 31
      Top = 48
      Width = 48
      Height = 12
      Caption = #24037#35013#21517#31216
    end
    object Label3: TLabel
      Left = 31
      Top = 74
      Width = 48
      Height = 12
      Caption = #20219#21153#20070#21495
    end
    object Label5: TLabel
      Left = 31
      Top = 178
      Width = 48
      Height = 12
      Caption = #35746#36135#21333#20301
    end
    object Label7: TLabel
      Left = 31
      Top = 152
      Width = 48
      Height = 12
      Caption = #35746#36135#25968#37327
    end
    object Label8: TLabel
      Left = 235
      Top = 22
      Width = 48
      Height = 12
      Caption = #35774#35745#21333#20301
    end
    object Label9: TLabel
      Left = 235
      Top = 47
      Width = 48
      Height = 12
      Caption = #21046#36896#21333#20301
    end
    object Label10: TLabel
      Left = 235
      Top = 73
      Width = 48
      Height = 12
      Caption = #20351#29992#21333#20301
    end
    object Label12: TLabel
      Left = 259
      Top = 151
      Width = 24
      Height = 12
      Caption = #24037#26102
    end
    object Label13: TLabel
      Left = 259
      Top = 177
      Width = 24
      Height = 12
      Caption = #20135#20540
    end
    object Label14: TLabel
      Left = 49
      Top = 205
      Width = 24
      Height = 12
      Caption = #22791#27880
    end
    object Label4: TLabel
      Left = 19
      Top = 100
      Width = 60
      Height = 12
      Caption = #20219#21153#20070#26085#26399
    end
    object Label6: TLabel
      Left = 31
      Top = 126
      Width = 48
      Height = 12
      Caption = #35746#36135#26085#26399
    end
    object Label11: TLabel
      Left = 235
      Top = 125
      Width = 48
      Height = 12
      Caption = #39564#35777#26085#26399
    end
    object Label18: TLabel
      Left = 235
      Top = 100
      Width = 48
      Height = 12
      Caption = #23436#24037#26085#26399
    end
    object Label19: TLabel
      Left = 124
      Top = 100
      Width = 12
      Height = 12
      Caption = #24180
    end
    object Label20: TLabel
      Left = 165
      Top = 100
      Width = 12
      Height = 12
      Caption = #26376
    end
    object Label21: TLabel
      Left = 205
      Top = 100
      Width = 12
      Height = 12
      Caption = #26085
    end
    object Label22: TLabel
      Left = 125
      Top = 124
      Width = 12
      Height = 12
      Caption = #24180
    end
    object Label23: TLabel
      Left = 166
      Top = 124
      Width = 12
      Height = 12
      Caption = #26376
    end
    object Label24: TLabel
      Left = 206
      Top = 124
      Width = 12
      Height = 12
      Caption = #26085
    end
    object Label25: TLabel
      Left = 329
      Top = 99
      Width = 12
      Height = 12
      Caption = #24180
    end
    object Label26: TLabel
      Left = 370
      Top = 99
      Width = 12
      Height = 12
      Caption = #26376
    end
    object Label27: TLabel
      Left = 410
      Top = 99
      Width = 12
      Height = 12
      Caption = #26085
    end
    object Label28: TLabel
      Left = 328
      Top = 125
      Width = 12
      Height = 12
      Caption = #24180
    end
    object Label29: TLabel
      Left = 369
      Top = 125
      Width = 12
      Height = 12
      Caption = #26376
    end
    object Label30: TLabel
      Left = 409
      Top = 125
      Width = 12
      Height = 12
      Caption = #26085
    end
    object Label31: TLabel
      Left = 235
      Top = 201
      Width = 48
      Height = 12
      Caption = #36710#22411#24635#25104
    end
    object Edt_gzbh: TEdit
      Left = 89
      Top = 19
      Width = 125
      Height = 20
      TabOrder = 0
      Text = 'Edt_gzbh'
      OnExit = Edt_gzbhExit
      OnKeyPress = Edt_gzbhKeyPress
    end
    object Edt_gzmc: TEdit
      Left = 89
      Top = 44
      Width = 125
      Height = 20
      TabOrder = 1
      Text = 'Edt_gzmc'
      OnKeyPress = Edt_gzbhKeyPress
    end
    object Edt_rwsh: TEdit
      Left = 89
      Top = 70
      Width = 125
      Height = 20
      TabOrder = 2
      Text = 'Edt_rwsh'
      OnKeyPress = Edt_gzbhKeyPress
    end
    object Edt_dhsl: TEdit
      Left = 89
      Top = 148
      Width = 125
      Height = 20
      TabOrder = 9
      Text = 'Edt_dhsl'
      OnKeyPress = Edt_gzbhKeyPress
    end
    object Edt_dhdw: TComboBox
      Left = 89
      Top = 174
      Width = 125
      Height = 20
      ItemHeight = 12
      TabOrder = 10
      Text = 'Edt_dhdw'
      OnKeyPress = Edt_gzbhKeyPress
    end
    object Edt_sjdw: TComboBox
      Left = 293
      Top = 18
      Width = 125
      Height = 20
      ItemHeight = 12
      TabOrder = 12
      Text = 'Edt_sjdw'
      OnKeyPress = Edt_gzbhKeyPress
    end
    object Edt_zzdw: TComboBox
      Left = 293
      Top = 43
      Width = 125
      Height = 20
      ItemHeight = 12
      TabOrder = 13
      Text = 'Edt_zzdw'
      OnKeyPress = Edt_gzbhKeyPress
    end
    object Edt_cz: TEdit
      Left = 293
      Top = 173
      Width = 125
      Height = 20
      TabOrder = 22
      Text = 'Edt_cz'
      OnKeyPress = Edt_gzbhKeyPress
    end
    object Edt_bz: TEdit
      Left = 89
      Top = 201
      Width = 128
      Height = 20
      TabOrder = 11
      Text = 'Edt_bz'
      OnKeyPress = Edt_gzbhKeyPress
    end
    object Edt_gs: TEdit
      Left = 293
      Top = 147
      Width = 125
      Height = 20
      TabOrder = 21
      Text = 'Edt_gs'
      OnKeyPress = Edt_gzbhKeyPress
    end
    object Edt_sydw: TComboBox
      Left = 293
      Top = 69
      Width = 125
      Height = 20
      ItemHeight = 12
      TabOrder = 14
      Text = 'Edt_sydw'
      OnKeyPress = Edt_gzbhKeyPress
    end
    object Edt_rwrq_Y: TEdit
      Left = 87
      Top = 96
      Width = 36
      Height = 20
      MaxLength = 4
      TabOrder = 3
      Text = '9999'
      OnExit = Edt_rwrq_YExit
      OnKeyPress = Edt_gzbhKeyPress
    end
    object Edt_rwrq_M: TEdit
      Left = 136
      Top = 96
      Width = 27
      Height = 20
      MaxLength = 2
      TabOrder = 4
      Text = '99'
      OnExit = Edt_rwrq_MExit
      OnKeyPress = Edt_gzbhKeyPress
    end
    object Edt_rwrq_D: TEdit
      Left = 177
      Top = 96
      Width = 26
      Height = 20
      MaxLength = 2
      TabOrder = 5
      Text = '99'
      OnExit = Edt_rwrq_MExit
      OnKeyPress = Edt_gzbhKeyPress
    end
    object Edt_dhrq_Y: TEdit
      Left = 88
      Top = 120
      Width = 36
      Height = 20
      MaxLength = 4
      TabOrder = 6
      Text = '9999'
      OnExit = Edt_rwrq_YExit
      OnKeyPress = Edt_gzbhKeyPress
    end
    object Edt_dhrq_M: TEdit
      Left = 137
      Top = 120
      Width = 27
      Height = 20
      MaxLength = 2
      TabOrder = 7
      Text = '99'
      OnExit = Edt_rwrq_MExit
      OnKeyPress = Edt_gzbhKeyPress
    end
    object Edt_dhrq_D: TEdit
      Left = 178
      Top = 120
      Width = 26
      Height = 20
      MaxLength = 2
      TabOrder = 8
      Text = '99'
      OnExit = Edt_rwrq_MExit
      OnKeyPress = Edt_gzbhKeyPress
    end
    object Edt_WGRQ_Y: TEdit
      Left = 292
      Top = 95
      Width = 36
      Height = 20
      MaxLength = 4
      TabOrder = 15
      Text = '9999'
      OnExit = Edt_rwrq_YExit
      OnKeyPress = Edt_gzbhKeyPress
    end
    object Edt_WGRQ_M: TEdit
      Left = 341
      Top = 95
      Width = 27
      Height = 20
      MaxLength = 2
      TabOrder = 16
      Text = '99'
      OnExit = Edt_rwrq_MExit
      OnKeyPress = Edt_gzbhKeyPress
    end
    object Edt_WGRQ_D: TEdit
      Left = 382
      Top = 95
      Width = 26
      Height = 20
      MaxLength = 2
      TabOrder = 17
      Text = '99'
      OnExit = Edt_rwrq_MExit
      OnKeyPress = Edt_gzbhKeyPress
    end
    object Edt_YZRQ_Y: TEdit
      Left = 291
      Top = 121
      Width = 36
      Height = 20
      MaxLength = 4
      TabOrder = 18
      Text = '9999'
      OnExit = Edt_rwrq_YExit
      OnKeyPress = Edt_gzbhKeyPress
    end
    object Edt_YZRQ_M: TEdit
      Left = 340
      Top = 121
      Width = 27
      Height = 20
      MaxLength = 2
      TabOrder = 19
      Text = '99'
      OnExit = Edt_rwrq_MExit
      OnKeyPress = Edt_gzbhKeyPress
    end
    object Edt_YZRQ_D: TEdit
      Left = 381
      Top = 121
      Width = 26
      Height = 20
      MaxLength = 2
      TabOrder = 20
      Text = '99'
      OnExit = Edt_rwrq_MExit
      OnKeyPress = Edt_gzbhKeyPress
    end
    object Edt_LB: TComboBox
      Left = 293
      Top = 197
      Width = 125
      Height = 20
      ItemHeight = 12
      TabOrder = 23
      Text = 'Edt_LB'
      OnClick = Edt_LBClick
      OnKeyPress = Edt_gzbhKeyPress
    end
    object EDT_LB2: TEdit
      Left = 348
      Top = 210
      Width = 67
      Height = 20
      TabOrder = 24
      Text = 'EDT_LB2'
      Visible = False
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 632
    Height = 48
    Align = alTop
    BevelOuter = bvLowered
    Color = clWhite
    TabOrder = 2
    object Label16: TLabel
      Left = 28
      Top = 12
      Width = 91
      Height = 14
      Caption = #26032#30331#24037#35013#20449#24687
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Image1: TImage
      Left = 481
      Top = 1
      Width = 150
      Height = 46
      Align = alRight
      AutoSize = True
      Stretch = True
    end
    object Label17: TLabel
      Left = 60
      Top = 30
      Width = 192
      Height = 12
      Caption = #30331#35760#24037#35013#30456#20851#20449#24687#20197#21450#21046#20214#24212#29992#20449#24687
    end
  end
  object GroupBox2: TGroupBox
    Left = 449
    Top = 57
    Width = 169
    Height = 235
    Caption = #21046#20214#20449#24687
    TabOrder = 1
    object Label15: TLabel
      Left = 17
      Top = 20
      Width = 48
      Height = 12
      Caption = #21046#20214#21015#34920
    end
    object Btn_addZJ: TSpeedButton
      Left = 23
      Top = 192
      Width = 60
      Height = 20
      Caption = #28155#21152
      Flat = True
      OnClick = Btn_addZJClick
    end
    object Btn_delZJ: TSpeedButton
      Left = 89
      Top = 192
      Width = 60
      Height = 20
      Caption = #21024#38500
      Flat = True
      OnClick = Btn_delZJClick
    end
    object Lst_ZJ: TListBox
      Left = 18
      Top = 36
      Width = 137
      Height = 121
      ItemHeight = 12
      TabOrder = 1
    end
    object Edt_zj: TEdit
      Left = 18
      Top = 165
      Width = 137
      Height = 20
      TabOrder = 0
      Text = 'Edt_zj'
      OnKeyPress = Edt_zjKeyPress
    end
  end
end
