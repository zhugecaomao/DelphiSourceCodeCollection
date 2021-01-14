object NewDisk: TNewDisk
  Left = 429
  Top = 354
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsDialog
  Caption = 'New Disk Image'
  ClientHeight = 170
  ClientWidth = 505
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
    Height = 137
    Caption = 'New Disk Image'
    TabOrder = 0
    object Label19: TTntLabel
      Left = 8
      Top = 88
      Width = 55
      Height = 13
      Caption = 'Drive Type:'
    end
    object Label17: TTntLabel
      Left = 8
      Top = 24
      Width = 51
      Height = 13
      Caption = 'Drive Size:'
    end
    object GB: TTntLabel
      Left = 121
      Top = 44
      Width = 19
      Height = 13
      Caption = 'MB.'
    end
    object DType: TTntComboBox
      Left = 8
      Top = 103
      Width = 273
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      Items.Strings = (
        'Qcow (QEMU Image Format)'
        'Qcow2  (QEMU Image Format)'
        'Raw (Raw Disk Image File)'
        'vmdk (VMWare 3-4 Image Format)')
    end
    object SE: TSpinEdit
      Left = 8
      Top = 40
      Width = 113
      Height = 22
      Increment = 100
      MaxValue = 0
      MinValue = 0
      TabOrder = 1
      Value = 0
      OnChange = SEChange
    end
  end
  object Button1: TButton
    Left = 350
    Top = 144
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 1
  end
  object Button2: TButton
    Left = 429
    Top = 144
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
end
