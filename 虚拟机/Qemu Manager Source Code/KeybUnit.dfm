object Keyb: TKeyb
  Left = 318
  Top = 272
  BorderStyle = bsDialog
  Caption = 'Keyboard Language'
  ClientHeight = 116
  ClientWidth = 507
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
    Caption = 'Keyboard'
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 96
      Height = 13
      Caption = 'Keyboard Language'
    end
    object CB: TComboBox
      Left = 8
      Top = 32
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      Sorted = True
      TabOrder = 0
      Items.Strings = (
        'ar'
        'da'
        'de'
        'de-ch '
        'en-gb'
        'en-us'
        'es'
        'et'
        'fi'
        'fo'
        'fr'
        'fr-be'
        'fr-ca'
        'fr-ch'
        'hr'
        'hu'
        'is'
        'it'
        'ja'
        'lt'
        'lv'
        'mk'
        'nl'
        'nl-be'
        'no'
        'pl'
        'pt'
        'pt-br'
        'ru'
        'sl'
        'sv'
        'th'
        'tr')
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
