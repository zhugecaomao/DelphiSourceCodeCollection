object YesNo: TYesNo
  Left = 378
  Top = 346
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsDialog
  Caption = 'Select'
  ClientHeight = 117
  ClientWidth = 509
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
  object GB: TGroupBox
    Left = 1
    Top = 0
    Width = 504
    Height = 86
    TabOrder = 0
    object Caption: TLabel
      Left = 8
      Top = 16
      Width = 243
      Height = 13
      Caption = 'Specify the required memory for the virtual machine.'
    end
    object CB: TComboBox
      Left = 8
      Top = 32
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      Items.Strings = (
        'Yes'
        'No')
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
