object dgSpinOptions: TdgSpinOptions
  Left = 192
  Top = 107
  Width = 178
  Height = 165
  Caption = 'Spin Options'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object btOk: TButton
    Left = 8
    Top = 100
    Width = 75
    Height = 25
    Caption = '&Ok'
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object btCancel: TButton
    Left = 92
    Top = 100
    Width = 75
    Height = 25
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object chspoAutoRepeat: TCheckBox
    Left = 24
    Top = 12
    Width = 97
    Height = 17
    Caption = 'AutoRepeat'
    TabOrder = 2
  end
  object chspoAutoIncrement: TCheckBox
    Left = 24
    Top = 40
    Width = 121
    Height = 17
    Caption = 'AutoIncrement'
    TabOrder = 3
  end
  object chspoKeyEdit: TCheckBox
    Left = 24
    Top = 68
    Width = 97
    Height = 17
    Caption = 'KeyEdit'
    TabOrder = 4
  end
end
