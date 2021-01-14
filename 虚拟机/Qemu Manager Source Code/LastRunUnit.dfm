object LastRunFrm: TLastRunFrm
  Left = 250
  Top = 184
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsDialog
  Caption = 'Last Run'
  ClientHeight = 368
  ClientWidth = 507
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
  object GroupBox1: TGroupBox
    Left = 1
    Top = 0
    Width = 504
    Height = 329
    Caption = 'Last Run'
    TabOrder = 0
    object LR: TMemo
      Left = 4
      Top = 14
      Width = 495
      Height = 309
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object Button1: TButton
    Left = 350
    Top = 336
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 1
  end
  object Button2: TButton
    Left = 429
    Top = 336
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object Button3: TButton
    Left = 8
    Top = 336
    Width = 129
    Height = 25
    Caption = 'Copy To Clipboard'
    TabOrder = 3
    OnClick = Button3Click
  end
end
