object SelOpSys: TSelOpSys
  Left = 364
  Top = 339
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsDialog
  Caption = 'Operating System'
  ClientHeight = 104
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
    Height = 73
    Caption = 'Operating System'
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 131
      Height = 13
      Caption = 'Select an Operating System'
    end
    object OpSysList: TComboBox
      Left = 8
      Top = 40
      Width = 305
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
    end
  end
  object Button1: TButton
    Left = 350
    Top = 76
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 1
  end
  object Button2: TButton
    Left = 429
    Top = 76
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
end
