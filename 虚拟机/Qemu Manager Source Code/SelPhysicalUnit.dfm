object Physical: TPhysical
  Left = 232
  Top = 196
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsDialog
  Caption = 'Use Physical Drive'
  ClientHeight = 181
  ClientWidth = 784
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 144
  TextHeight = 20
  object GB: TGroupBox
    Left = 2
    Top = 0
    Width = 775
    Height = 132
    Caption = 'Physical Drive'
    TabOrder = 0
    object Caption: TLabel
      Left = 12
      Top = 25
      Width = 91
      Height = 20
      Caption = 'Select Drive'
    end
    object Drives: TComboBox
      Left = 12
      Top = 49
      Width = 477
      Height = 28
      Style = csDropDownList
      ItemHeight = 20
      TabOrder = 0
      Items.Strings = (
        'Yes'
        'No')
    end
    object Button3: TButton
      Left = 557
      Top = 99
      Width = 209
      Height = 25
      Caption = 'Open Disk Management'
      TabOrder = 1
      OnClick = Button3Click
    end
  end
  object Button1: TButton
    Left = 538
    Top = 135
    Width = 116
    Height = 39
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 1
  end
  object Button2: TButton
    Left = 660
    Top = 135
    Width = 115
    Height = 39
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
end
