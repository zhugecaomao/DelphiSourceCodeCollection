object Sockets: TSockets
  Left = 332
  Top = 332
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsDialog
  Caption = 'Sockets'
  ClientHeight = 205
  ClientWidth = 574
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
  object Button2: TButton
    Left = 493
    Top = 176
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 0
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
  object Net2: TTntGroupBox
    Left = 0
    Top = -1
    Width = 570
    Height = 174
    Caption = 'Sockets'
    TabOrder = 2
    object Label14: TTntLabel
      Left = 9
      Top = 17
      Width = 3
      Height = 13
    end
    object Label16: TTntLabel
      Left = 5
      Top = 124
      Width = 22
      Height = 13
      Alignment = taRightJustify
      Caption = 'Port:'
    end
    object HPort: TEdit
      Left = 33
      Top = 118
      Width = 96
      Height = 21
      TabOrder = 0
    end
    object Button3: TTntButton
      Left = 8
      Top = 141
      Width = 81
      Height = 27
      Caption = 'Add'
      TabOrder = 1
    end
    object Button4: TTntButton
      Left = 96
      Top = 140
      Width = 81
      Height = 27
      Caption = 'Delete'
      TabOrder = 2
    end
    object TCPMEMO: TListBox
      Left = 3
      Top = 16
      Width = 563
      Height = 100
      ItemHeight = 13
      TabOrder = 3
    end
  end
end
