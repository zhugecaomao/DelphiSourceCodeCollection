object FrmGZGL_WGDJ: TFrmGZGL_WGDJ
  Left = 235
  Top = 137
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'FrmGZGL_WGDJ'
  ClientHeight = 298
  ClientWidth = 430
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
    Left = 196
    Top = 269
    Width = 80
    Height = 23
    Caption = #30830' '#23450
    Flat = True
    OnClick = Btn_OKClick
  end
  object Btn_EXIT: TSpeedButton
    Left = 300
    Top = 269
    Width = 76
    Height = 23
    Caption = #36864' '#20986
    Flat = True
    OnClick = Btn_EXITClick
  end
  object Label2: TLabel
    Left = 268
    Top = 56
    Width = 84
    Height = 12
    Caption = #26412#27425#24050#30331#35760#24037#35013
  end
  object Bevel1: TBevel
    Left = 10
    Top = 255
    Width = 408
    Height = 7
    Shape = bsBottomLine
    Style = bsRaised
  end
  object GroupBox1: TGroupBox
    Left = 14
    Top = 66
    Width = 249
    Height = 187
    Caption = #23436#24037#20449#24687
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 17
      Top = 29
      Width = 48
      Height = 12
      Caption = #24037#35013#32534#21495
    end
    object Label12: TLabel
      Left = 41
      Top = 105
      Width = 24
      Height = 12
      Caption = #24037#26102
    end
    object Label13: TLabel
      Left = 41
      Top = 131
      Width = 24
      Height = 12
      Caption = #20135#20540
    end
    object Label14: TLabel
      Left = 41
      Top = 157
      Width = 24
      Height = 12
      Caption = #22791#27880
    end
    object Label3: TLabel
      Left = 17
      Top = 54
      Width = 48
      Height = 12
      Caption = #24037#35013#21517#31216
    end
    object Label18: TLabel
      Left = 17
      Top = 80
      Width = 48
      Height = 12
      Caption = #23436#24037#26085#26399
    end
    object Label25: TLabel
      Left = 115
      Top = 80
      Width = 12
      Height = 12
      Caption = #24180
    end
    object Label26: TLabel
      Left = 161
      Top = 80
      Width = 12
      Height = 12
      Caption = #26376
    end
    object Label27: TLabel
      Left = 211
      Top = 80
      Width = 12
      Height = 12
      Caption = #26085
    end
    object Edt_gzbh: TEdit
      Left = 75
      Top = 25
      Width = 150
      Height = 20
      TabOrder = 0
      Text = 'Edt_gzbh'
      OnExit = Edt_gzbhExit
      OnKeyPress = Edt_gzbhKeyPress
    end
    object Edt_cz: TEdit
      Left = 75
      Top = 127
      Width = 150
      Height = 20
      TabOrder = 6
      Text = 'Edt_cz'
      OnKeyPress = Edt_gzbhKeyPress
    end
    object Edt_bz: TEdit
      Left = 75
      Top = 153
      Width = 150
      Height = 20
      TabOrder = 7
      Text = 'Edt_bz'
      OnKeyPress = Edt_gzbhKeyPress
    end
    object Edt_gs: TEdit
      Left = 75
      Top = 101
      Width = 150
      Height = 20
      TabOrder = 5
      Text = 'Edt_gs'
      OnKeyPress = Edt_gzbhKeyPress
    end
    object Edt_gzmc: TEdit
      Left = 75
      Top = 50
      Width = 150
      Height = 20
      ReadOnly = True
      TabOrder = 1
      Text = 'Edt_gzmc'
      OnKeyPress = Edt_gzbhKeyPress
    end
    object Edt_WGRQ_Y: TEdit
      Left = 75
      Top = 76
      Width = 36
      Height = 20
      MaxLength = 4
      TabOrder = 2
      Text = '9999'
      OnExit = Edt_WGRQ_YExit
      OnKeyPress = Edt_gzbhKeyPress
    end
    object Edt_WGRQ_M: TEdit
      Left = 132
      Top = 76
      Width = 27
      Height = 20
      MaxLength = 2
      TabOrder = 3
      Text = '99'
      OnExit = Edt_WGRQ_MExit
      OnKeyPress = Edt_gzbhKeyPress
    end
    object Edt_WGRQ_D: TEdit
      Left = 181
      Top = 76
      Width = 26
      Height = 20
      MaxLength = 2
      TabOrder = 4
      Text = '99'
      OnExit = Edt_WGRQ_MExit
      OnKeyPress = Edt_gzbhKeyPress
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 430
    Height = 48
    Align = alTop
    BevelOuter = bvLowered
    Color = clWhite
    TabOrder = 1
    object Label16: TLabel
      Left = 28
      Top = 12
      Width = 61
      Height = 14
      Caption = #23436#24037#30331#35760
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Image1: TImage
      Left = 279
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
      Width = 144
      Height = 12
      Caption = #35760#24405#24037#35013#21046#36896#23436#24037#30456#20851#20449#24687
    end
  end
  object Lst_dj: TListBox
    Left = 268
    Top = 71
    Width = 145
    Height = 181
    TabStop = False
    ItemHeight = 12
    TabOrder = 2
  end
end
