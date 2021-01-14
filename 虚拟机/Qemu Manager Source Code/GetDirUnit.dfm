object SelDir: TSelDir
  Left = 281
  Top = 148
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsDialog
  Caption = 'Select Directory'
  ClientHeight = 313
  ClientWidth = 284
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Button2: TTntButton
    Left = 206
    Top = 285
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button1: TTntButton
    Left = 126
    Top = 285
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 0
    OnClick = Button1Click
  end
  object DL: TDirectoryListBox
    Left = 0
    Top = 0
    Width = 282
    Height = 241
    ItemHeight = 16
    TabOrder = 2
  end
  object DRL: TDriveComboBox
    Left = 0
    Top = 243
    Width = 285
    Height = 19
    DirList = DL
    TabOrder = 3
  end
end
