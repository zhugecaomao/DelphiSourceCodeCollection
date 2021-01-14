object Connectors: TConnectors
  Left = 179
  Top = 174
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsDialog
  Caption = 'Connectors'
  ClientHeight = 202
  ClientWidth = 573
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
  object Net2: TTntGroupBox
    Left = 0
    Top = -1
    Width = 570
    Height = 174
    Caption = 'Connectors'
    TabOrder = 0
    object Label14: TTntLabel
      Left = 9
      Top = 17
      Width = 3
      Height = 13
    end
    object Label16: TTntLabel
      Left = 328
      Top = 123
      Width = 22
      Height = 13
      Alignment = taRightJustify
      Caption = 'Port:'
    end
    object TntLabel1: TTntLabel
      Left = 4
      Top = 123
      Width = 97
      Height = 13
      Alignment = taRightJustify
      Caption = 'Connect IP Address:'
    end
    object HPort: TEdit
      Left = 356
      Top = 117
      Width = 96
      Height = 21
      TabOrder = 1
    end
    object Button3: TTntButton
      Left = 8
      Top = 141
      Width = 81
      Height = 27
      Caption = 'Add'
      TabOrder = 3
      OnClick = Button3Click
    end
    object Button4: TTntButton
      Left = 96
      Top = 140
      Width = 81
      Height = 27
      Caption = 'Delete'
      TabOrder = 4
      OnClick = Button4Click
    end
    object TCPMEMO: TListBox
      Left = 3
      Top = 16
      Width = 563
      Height = 100
      ItemHeight = 13
      TabOrder = 2
    end
    object CIP: TEdit
      Left = 105
      Top = 118
      Width = 216
      Height = 21
      TabOrder = 0
    end
  end
  object Button1: TButton
    Left = 414
    Top = 176
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 1
  end
  object Button2: TButton
    Left = 493
    Top = 176
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
end
