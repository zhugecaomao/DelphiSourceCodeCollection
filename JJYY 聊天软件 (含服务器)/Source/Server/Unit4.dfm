object Addfrm: TAddfrm
  Left = 245
  Top = 273
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #28155#21152#29992#25143
  ClientHeight = 162
  ClientWidth = 200
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 60
    Height = 12
    Caption = #29992#25143#21517#31216#65306
  end
  object Label2: TLabel
    Left = 8
    Top = 45
    Width = 36
    Height = 12
    Caption = #23494#30721#65306
  end
  object Label3: TLabel
    Left = 8
    Top = 106
    Width = 36
    Height = 12
    Caption = #24615#21035#65306
  end
  object Label4: TLabel
    Left = 8
    Top = 74
    Width = 60
    Height = 12
    Caption = #30830#35748#23494#30721#65306
  end
  object edName: TEdit
    Left = 70
    Top = 11
    Width = 121
    Height = 20
    TabOrder = 0
  end
  object edPassword: TEdit
    Left = 70
    Top = 40
    Width = 121
    Height = 20
    PasswordChar = '*'
    TabOrder = 1
  end
  object ComSex: TComboBox
    Left = 70
    Top = 98
    Width = 123
    Height = 20
    Style = csDropDownList
    ItemHeight = 12
    TabOrder = 2
    Items.Strings = (
      #30007
      #22899)
  end
  object BitBtn1: TBitBtn
    Left = 72
    Top = 130
    Width = 58
    Height = 25
    Caption = #30830#23450
    Default = True
    TabOrder = 3
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 136
    Top = 130
    Width = 58
    Height = 25
    Caption = #21462#28040
    TabOrder = 4
    OnClick = BitBtn2Click
  end
  object edPassword1: TEdit
    Left = 70
    Top = 69
    Width = 121
    Height = 20
    PasswordChar = '*'
    TabOrder = 5
  end
end
