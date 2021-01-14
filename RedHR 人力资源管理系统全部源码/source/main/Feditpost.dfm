object editpost: Teditpost
  Left = 446
  Top = 213
  BorderStyle = bsDialog
  Caption = #32844#20301#32534#36753
  ClientHeight = 264
  ClientWidth = 264
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 12
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 249
    Height = 81
    Caption = #32844#20301#21517#31216
    TabOrder = 0
    object Edit1: TEdit
      Left = 16
      Top = 32
      Width = 217
      Height = 20
      TabOrder = 0
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 96
    Width = 249
    Height = 129
    Caption = #35828#26126
    TabOrder = 1
    object Memo1: TMemo
      Left = 16
      Top = 24
      Width = 217
      Height = 89
      TabOrder = 0
    end
  end
  object Button1: TButton
    Left = 184
    Top = 232
    Width = 75
    Height = 25
    Cancel = True
    Caption = #21462#28040
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 104
    Top = 232
    Width = 75
    Height = 25
    Caption = #30830#23450
    Default = True
    TabOrder = 3
    OnClick = Button2Click
  end
end
