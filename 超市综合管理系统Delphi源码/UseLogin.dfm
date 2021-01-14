object Login_Form: TLogin_Form
  Left = 391
  Top = 271
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsDialog
  Caption = #29992#25143#30331#38470
  ClientHeight = 235
  ClientWidth = 366
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 366
    Height = 185
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 56
      Top = 64
      Width = 42
      Height = 13
      Caption = #29992#25143#21517
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 56
      Top = 120
      Width = 28
      Height = 13
      Caption = #23494#30721
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object EPsw: TEdit
      Left = 144
      Top = 120
      Width = 145
      Height = 21
      ImeName = #26234#33021#38472#26725#36755#20837#24179#21488'  5.6'
      PasswordChar = '*'
      TabOrder = 0
    end
    object CBUse: TComboBox
      Left = 144
      Top = 64
      Width = 145
      Height = 21
      ImeName = #26234#33021#38472#26725#36755#20837#24179#21488'  5.6'
      ItemHeight = 13
      TabOrder = 1
    end
  end
  object Button1: TButton
    Left = 72
    Top = 200
    Width = 75
    Height = 25
    Caption = #30331#38470
    Default = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 208
    Top = 200
    Width = 75
    Height = 25
    Caption = #21462#28040
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = Button2Click
  end
end
