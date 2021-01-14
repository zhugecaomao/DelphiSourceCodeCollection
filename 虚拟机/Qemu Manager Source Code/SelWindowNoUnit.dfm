object SelWindow: TSelWindow
  Left = 192
  Top = 122
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsDialog
  Caption = 'VNC Display'
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
    Caption = 'VNC Display'
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 188
      Height = 13
      Caption = 'Please specify the VNC Display Number'
    end
    object SE: TSpinEdit
      Left = 8
      Top = 32
      Width = 113
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 0
      Value = 0
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
