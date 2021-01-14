object NewVLAN: TNewVLAN
  Left = 362
  Top = 308
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsDialog
  Caption = 'New VLAN'
  ClientHeight = 147
  ClientWidth = 506
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
    Height = 113
    Caption = 'New VLAN'
    TabOrder = 0
    object Label1: TTntLabel
      Left = 8
      Top = 20
      Width = 68
      Height = 13
      Caption = 'VLAN Number'
    end
    object Label3: TTntLabel
      Left = 9
      Top = 60
      Width = 67
      Height = 13
      Caption = 'Network Type'
    end
    object CB: TComboBox
      Left = 10
      Top = 74
      Width = 207
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      Items.Strings = (
        'User Networking'
        'Tap Networking')
    end
    object VL: TSpinEdit
      Left = 8
      Top = 34
      Width = 97
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 1
      Value = 0
    end
  end
  object Button1: TButton
    Left = 350
    Top = 118
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 1
  end
  object Button2: TButton
    Left = 429
    Top = 118
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
end
