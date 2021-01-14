object SetsecForm: TSetsecForm
  Left = 308
  Top = 143
  Width = 321
  Height = 230
  Caption = #35774#32622#26032#23494#30721
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 48
    Top = 24
    Width = 48
    Height = 13
    Caption = #21407#23494#30721#65306
  end
  object Label2: TLabel
    Left = 48
    Top = 56
    Width = 48
    Height = 13
    Caption = #26032#23494#30721#65306
  end
  object Label3: TLabel
    Left = 48
    Top = 88
    Width = 72
    Height = 13
    Caption = #37325#22797#26032#23494#30721#65306
  end
  object Edit1: TEdit
    Left = 136
    Top = 24
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 136
    Top = 56
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
  end
  object Edit3: TEdit
    Left = 136
    Top = 88
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 2
  end
  object Button1: TButton
    Left = 56
    Top = 128
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 176
    Top = 128
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 4
    OnClick = Button2Click
  end
end
