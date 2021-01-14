object FrmGZGL_YHDJ: TFrmGZGL_YHDJ
  Left = 247
  Top = 144
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'FrmGZGL_YHDJ'
  ClientHeight = 250
  ClientWidth = 457
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
    Left = 197
    Top = 215
    Width = 80
    Height = 23
    Caption = #30830' '#23450
    Flat = True
    OnClick = Btn_OKClick
  end
  object Btn_EXIT: TSpeedButton
    Left = 289
    Top = 215
    Width = 76
    Height = 23
    Caption = #36864' '#20986
    Flat = True
    OnClick = Btn_EXITClick
  end
  object Label3: TLabel
    Left = 293
    Top = 56
    Width = 84
    Height = 12
    Caption = #26412#27425#24050#30331#35760#24037#35013
  end
  object Bevel1: TBevel
    Left = 11
    Top = 198
    Width = 432
    Height = 7
    Shape = bsBottomLine
    Style = bsRaised
  end
  object GroupBox1: TGroupBox
    Left = 15
    Top = 67
    Width = 269
    Height = 129
    Caption = #39564#35777#20449#24687
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 26
      Top = 24
      Width = 48
      Height = 12
      Caption = #24037#35013#32534#21495
    end
    object Label2: TLabel
      Left = 26
      Top = 48
      Width = 48
      Height = 12
      Caption = #24037#35013#21517#31216
    end
    object Label14: TLabel
      Left = 50
      Top = 98
      Width = 24
      Height = 12
      Caption = #22791#27880
    end
    object Label11: TLabel
      Left = 23
      Top = 72
      Width = 48
      Height = 12
      Caption = #39564#35777#26085#26399
    end
    object Label28: TLabel
      Left = 125
      Top = 72
      Width = 12
      Height = 12
      Caption = #24180
    end
    object Label29: TLabel
      Left = 179
      Top = 72
      Width = 12
      Height = 12
      Caption = #26376
    end
    object Label30: TLabel
      Left = 227
      Top = 72
      Width = 12
      Height = 12
      Caption = #26085
    end
    object Edt_gzbh: TEdit
      Left = 84
      Top = 19
      Width = 160
      Height = 20
      TabOrder = 0
      Text = 'Edt_gzbh'
      OnExit = Edt_gzbhExit
    end
    object Edt_gzmc: TEdit
      Left = 84
      Top = 43
      Width = 160
      Height = 20
      ReadOnly = True
      TabOrder = 1
      Text = 'Edt_gzmc'
    end
    object Edt_bz: TEdit
      Left = 84
      Top = 93
      Width = 160
      Height = 20
      TabOrder = 2
      Text = 'Edt_bz'
    end
    object Edt_YZRQ_Y: TEdit
      Left = 84
      Top = 68
      Width = 36
      Height = 20
      MaxLength = 4
      TabOrder = 3
      Text = '9999'
    end
    object Edt_YZRQ_M: TEdit
      Left = 146
      Top = 68
      Width = 27
      Height = 20
      MaxLength = 2
      TabOrder = 4
      Text = '99'
    end
    object Edt_YZRQ_D: TEdit
      Left = 195
      Top = 68
      Width = 26
      Height = 20
      MaxLength = 2
      TabOrder = 5
      Text = '99'
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 457
    Height = 48
    Align = alTop
    BevelOuter = bvLowered
    Color = clWhite
    TabOrder = 1
    object Label16: TLabel
      Left = 22
      Top = 12
      Width = 91
      Height = 14
      Caption = #39564#35777#21512#26684#30331#35760
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Image1: TImage
      Left = 306
      Top = 1
      Width = 150
      Height = 46
      Align = alRight
      AutoSize = True
      Stretch = True
    end
    object Label17: TLabel
      Left = 54
      Top = 30
      Width = 120
      Height = 12
      Caption = #35760#24405#24037#35013#39564#35777#21512#26684#26102#38388
    end
  end
  object Lst_dj: TListBox
    Left = 293
    Top = 71
    Width = 145
    Height = 123
    ItemHeight = 12
    TabOrder = 2
  end
end
