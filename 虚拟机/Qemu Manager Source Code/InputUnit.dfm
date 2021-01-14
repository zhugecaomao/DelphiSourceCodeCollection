object InputFrm: TInputFrm
  Left = 291
  Top = 296
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsDialog
  Caption = 'Data Entry'
  ClientHeight = 115
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
  object Button2: TButton
    Left = 429
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 0
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
  object GB: TGroupBox
    Left = 1
    Top = 0
    Width = 504
    Height = 86
    Caption = 'Memory'
    TabOrder = 2
    object Caption: TLabel
      Left = 8
      Top = 16
      Width = 208
      Height = 13
      Caption = 'Specify amount of RAM required for the VM.'
    end
    object Text: TEdit
      Left = 8
      Top = 32
      Width = 489
      Height = 21
      TabOrder = 0
    end
  end
end
