object NewVM: TNewVM
  Left = 222
  Top = 147
  BorderStyle = bsDialog
  Caption = 'New Virtual Machine'
  ClientHeight = 265
  ClientWidth = 593
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnDblClick = FormShow
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 1
    Top = 1
    Width = 591
    Height = 232
    Caption = 'New Virtual Machine'
    TabOrder = 0
    object Label1: TLabel
      Left = 7
      Top = 24
      Width = 107
      Height = 13
      Caption = 'Virtual Machine Name:'
    end
    object Label2: TLabel
      Left = 8
      Top = 105
      Width = 73
      Height = 13
      Caption = 'RAM Required:'
    end
    object Label17: TTntLabel
      Left = 127
      Top = 104
      Width = 51
      Height = 13
      Caption = 'Drive Size:'
    end
    object Label19: TTntLabel
      Left = 9
      Top = 149
      Width = 55
      Height = 13
      Caption = 'Drive Type:'
    end
    object TntLabel1: TTntLabel
      Left = 8
      Top = 64
      Width = 86
      Height = 13
      Caption = 'Operating System:'
    end
    object GB: TTntLabel
      Left = 242
      Top = 122
      Width = 19
      Height = 13
      Caption = 'MB.'
    end
    object TntLabel2: TTntLabel
      Left = 8
      Top = 188
      Width = 76
      Height = 13
      Caption = 'Hardware Type:'
    end
    object VMName: TEdit
      Left = 7
      Top = 40
      Width = 505
      Height = 21
      TabOrder = 0
      Text = 'VMName'
    end
    object SE: TSpinEdit
      Left = 8
      Top = 121
      Width = 113
      Height = 22
      Increment = 4
      MaxValue = 0
      MinValue = 0
      TabOrder = 2
      Value = 0
    end
    object SE2: TSpinEdit
      Left = 127
      Top = 120
      Width = 113
      Height = 22
      Increment = 100
      MaxValue = 0
      MinValue = 0
      TabOrder = 3
      Value = 0
      OnChange = SE2Change
    end
    object DType: TTntComboBox
      Left = 9
      Top = 164
      Width = 302
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 4
      Items.Strings = (
        'Qcow (QEMU Image Format)'
        'Qcow2  (QEMU Image Format)'
        'Raw (Raw Disk Image File)'
        'vmdk (VMWare 3-4 Image Format)')
    end
    object OpSys: TTntComboBox
      Left = 8
      Top = 79
      Width = 505
      Height = 21
      ItemHeight = 13
      TabOrder = 1
      OnChange = OpSysChange
    end
    object CB: TComboBox
      Left = 9
      Top = 202
      Width = 433
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 5
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
    Left = 414
    Top = 238
    Width = 97
    Height = 25
    Caption = 'Create'
    ModalResult = 1
    TabOrder = 1
  end
  object Button2: TButton
    Left = 515
    Top = 238
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
end
