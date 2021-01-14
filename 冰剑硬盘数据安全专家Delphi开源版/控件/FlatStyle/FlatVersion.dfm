object VersionForm: TVersionForm
  Left = 189
  Top = 503
  BorderStyle = bsDialog
  Caption = 'About'
  ClientHeight = 120
  ClientWidth = 352
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object About: TLabel
    Left = 24
    Top = 8
    Width = 28
    Height = 13
    Caption = 'About'
  end
  object OKBtn: TButton
    Left = 144
    Top = 88
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 0
  end
end
