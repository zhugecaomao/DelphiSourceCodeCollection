object fmReg: TfmReg
  Left = 385
  Top = 185
  BorderStyle = bsDialog
  Caption = 'Registration'
  ClientHeight = 209
  ClientWidth = 286
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object RzURLLabel1: TRzURLLabel
    Left = 22
    Top = 175
    Width = 56
    Height = 14
    Caption = 'Buy Now!'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGradientActiveCaption
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    Transparent = True
    LightTextStyle = True
    ShadowDepth = 1
    TextStyle = tsShadow
    URL = 'http:\\www.kongxj.com'
    UnvisitedColor = clGradientActiveCaption
  end
  object Label1: TLabel
    Left = 24
    Top = 16
    Width = 56
    Height = 13
    Caption = 'User Name:'
  end
  object Label2: TLabel
    Left = 24
    Top = 112
    Width = 54
    Height = 13
    Caption = 'Reg. Code:'
  end
  object Label3: TLabel
    Left = 24
    Top = 64
    Width = 39
    Height = 13
    Caption = 'Reg. Sn'
  end
  object Button1: TButton
    Left = 96
    Top = 170
    Width = 75
    Height = 25
    Caption = 'Register'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 192
    Top = 170
    Width = 75
    Height = 25
    Caption = 'Later'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Edit1: TEdit
    Left = 24
    Top = 34
    Width = 239
    Height = 21
    TabOrder = 2
    OnChange = Edit1Change
  end
  object Edit2: TEdit
    Left = 24
    Top = 82
    Width = 240
    Height = 21
    ReadOnly = True
    TabOrder = 3
  end
  object Edit3: TEdit
    Left = 24
    Top = 130
    Width = 240
    Height = 21
    TabOrder = 4
  end
end
