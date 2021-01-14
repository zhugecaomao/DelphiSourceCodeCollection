object Redirect: TRedirect
  Left = 309
  Top = 315
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsDialog
  Caption = 'Redirectors'
  ClientHeight = 203
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
    Caption = 'Redirect TCP/UDP Ports From Host To Guest:'
    TabOrder = 0
    object Label14: TTntLabel
      Left = 9
      Top = 17
      Width = 80
      Height = 13
      Caption = 'Ports Forwarded:'
    end
    object Label15: TTntLabel
      Left = 9
      Top = 100
      Width = 27
      Height = 13
      Caption = 'Type:'
    end
    object Label16: TTntLabel
      Left = 47
      Top = 127
      Width = 96
      Height = 13
      Alignment = taRightJustify
      Caption = 'Port Visible To Host:'
    end
    object Label17: TTntLabel
      Left = 41
      Top = 148
      Width = 103
      Height = 13
      Alignment = taRightJustify
      Caption = 'Actual Port On Guest:'
    end
    object PortType: TComboBox
      Left = 41
      Top = 97
      Width = 63
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      Items.Strings = (
        'TCP'
        'UDP')
    end
    object HPort: TEdit
      Left = 146
      Top = 118
      Width = 96
      Height = 21
      TabOrder = 1
    end
    object RPort: TEdit
      Left = 146
      Top = 144
      Width = 96
      Height = 21
      TabOrder = 2
    end
    object Button3: TTntButton
      Left = 248
      Top = 109
      Width = 81
      Height = 27
      Caption = 'Add'
      TabOrder = 3
      OnClick = Button3Click
    end
    object Button4: TTntButton
      Left = 248
      Top = 140
      Width = 81
      Height = 27
      Caption = 'Delete'
      TabOrder = 4
      OnClick = Button4Click
    end
    object TCPMEMO: TListBox
      Left = 8
      Top = 32
      Width = 553
      Height = 57
      ItemHeight = 13
      TabOrder = 5
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
