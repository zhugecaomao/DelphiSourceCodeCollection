object Formvalueadd: TFormvalueadd
  Left = 393
  Top = 325
  Width = 355
  Height = 187
  BorderIcons = [biSystemMenu]
  Caption = #25968#20540#22686#21152
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
  object GroupBox1: TGroupBox
    Left = 1
    Top = 3
    Width = 343
    Height = 79
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label2: TLabel
      Left = 18
      Top = 22
      Width = 53
      Height = 12
      Caption = #39033#30446#21517#31216
    end
    object Label3: TLabel
      Left = 28
      Top = 51
      Width = 34
      Height = 12
      Caption = #31867#22411
    end
    object Edmc: TEdit
      Left = 75
      Top = 19
      Width = 249
      Height = 20
      TabOrder = 0
    end
    object Edlx: TEdit
      Left = 76
      Top = 48
      Width = 247
      Height = 20
      TabOrder = 1
    end
  end
  object GroupBox2: TGroupBox
    Left = 2
    Top = 82
    Width = 342
    Height = 43
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object Label1: TLabel
      Left = 17
      Top = 15
      Width = 48
      Height = 12
      Caption = #22686#21152#25968#37327
    end
    object dxsl: TdxCurrencyEdit
      Left = 75
      Top = 10
      Width = 245
      TabOrder = 0
      OnKeyDown = dxslKeyDown
    end
  end
  object Button1: TButton
    Left = 92
    Top = 129
    Width = 128
    Height = 25
    Caption = #30830#23450
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 224
    Top = 129
    Width = 117
    Height = 25
    Caption = #36864#20986
    TabOrder = 3
  end
end
