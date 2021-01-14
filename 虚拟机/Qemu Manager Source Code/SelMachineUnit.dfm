object MType: TMType
  Left = 446
  Top = 285
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsDialog
  Caption = 'Machine Type'
  ClientHeight = 113
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
    Caption = 'Machine'
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 106
      Height = 13
      Caption = 'Specify Machine Type'
    end
    object CB: TComboBox
      Left = 8
      Top = 32
      Width = 433
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      Items.Strings = (
        'Qemu PC Based System (Default)'
        'Qemu Power PC Based System (qemu-system-ppc)'
        'Qemu Sparc Based System (qemu-system-sparc)'
        'Qemu x86_64 PC Based System (qemu-system-x86_64)'
        'Qemu MIPS Based System (qemu-system-mips)'
        'Qemu ARM Based System (qemu-system-arm)')
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
