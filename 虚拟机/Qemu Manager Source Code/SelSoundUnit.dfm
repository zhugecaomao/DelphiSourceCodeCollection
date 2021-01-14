object SelSound: TSelSound
  Left = 287
  Top = 227
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsDialog
  Caption = 'Sound Devices'
  ClientHeight = 116
  ClientWidth = 508
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
    Height = 86
    Caption = 'Devices'
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 258
      Height = 13
      Caption = 'Please select the simulated sound devices you require.'
    end
    object SB16: TCheckBox
      Left = 8
      Top = 40
      Width = 97
      Height = 17
      Caption = 'SB16'
      TabOrder = 0
    end
    object ES1370: TCheckBox
      Left = 112
      Top = 40
      Width = 97
      Height = 17
      Caption = 'ES1370'
      TabOrder = 1
    end
    object Adlib: TCheckBox
      Left = 232
      Top = 40
      Width = 97
      Height = 17
      Caption = 'Adlib'
      TabOrder = 2
    end
  end
  object Button1: TButton
    Left = 350
    Top = 88
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 1
  end
  object Button2: TButton
    Left = 429
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
end
