object NewOpsys: TNewOpsys
  Left = 286
  Top = 353
  BorderStyle = bsDialog
  Caption = 'Add New Operating System Defination'
  ClientHeight = 186
  ClientWidth = 593
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
    Top = 1
    Width = 591
    Height = 152
    Caption = 'New Operating System Definition'
    TabOrder = 0
    object Label1: TLabel
      Left = 7
      Top = 24
      Width = 117
      Height = 13
      Caption = 'Operating System Name:'
    end
    object Label2: TLabel
      Left = 8
      Top = 65
      Width = 62
      Height = 13
      Caption = 'Default Ram:'
    end
    object Label17: TTntLabel
      Left = 8
      Top = 105
      Width = 88
      Height = 13
      Caption = 'Default Drive Size:'
    end
    object GB: TTntLabel
      Left = 123
      Top = 125
      Width = 19
      Height = 13
      Caption = 'MB.'
    end
    object Name: TEdit
      Left = 7
      Top = 40
      Width = 505
      Height = 21
      TabOrder = 0
    end
    object Ram: TSpinEdit
      Left = 8
      Top = 81
      Width = 113
      Height = 22
      Increment = 4
      MaxValue = 0
      MinValue = 0
      TabOrder = 1
      Value = 0
    end
    object Drive: TSpinEdit
      Left = 8
      Top = 121
      Width = 113
      Height = 22
      Increment = 100
      MaxValue = 0
      MinValue = 0
      TabOrder = 2
      Value = 0
    end
  end
  object Button1: TButton
    Left = 414
    Top = 158
    Width = 97
    Height = 25
    Caption = 'Create'
    ModalResult = 1
    TabOrder = 1
  end
  object Button2: TButton
    Left = 515
    Top = 158
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
end
