object dgDefineMask: TdgDefineMask
  Left = 464
  Top = 370
  Width = 229
  Height = 135
  Caption = 'Define new mask'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 12
    Top = 16
    Width = 60
    Height = 13
    Caption = '&Mask Name:'
    FocusControl = edName
  end
  object Label2: TLabel
    Left = 12
    Top = 40
    Width = 36
    Height = 13
    Caption = '&Picture:'
    FocusControl = edPicture
  end
  object btOk: TButton
    Left = 8
    Top = 72
    Width = 61
    Height = 25
    Caption = '&Ok'
    Enabled = False
    ModalResult = 1
    TabOrder = 2
  end
  object edName: TEdit
    Left = 84
    Top = 12
    Width = 121
    Height = 21
    TabOrder = 0
    OnChange = edNameChange
  end
  object edPicture: TEdit
    Left = 84
    Top = 36
    Width = 121
    Height = 21
    TabOrder = 1
    OnChange = edPictureChange
  end
  object btCancel: TButton
    Left = 76
    Top = 72
    Width = 61
    Height = 25
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 3
  end
  object btHelp: TButton
    Left = 144
    Top = 72
    Width = 61
    Height = 25
    Caption = '&Help'
    TabOrder = 4
    OnClick = btHelpClick
  end
end
