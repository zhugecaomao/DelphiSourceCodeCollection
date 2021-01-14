object SELQ: TSELQ
  Left = 286
  Top = 270
  BorderStyle = bsDialog
  Caption = 'Select QEMU Executable'
  ClientHeight = 378
  ClientWidth = 522
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object FL: TFileListBox
    Left = 0
    Top = 152
    Width = 513
    Height = 177
    ItemHeight = 13
    TabOrder = 0
  end
  object FB: TTntButton
    Left = 359
    Top = 345
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 1
  end
  object Button2: TTntButton
    Left = 439
    Top = 345
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object TV: TTntTreeView
    Left = 0
    Top = 1
    Width = 521
    Height = 145
    HideSelection = False
    Images = Main.MIL
    Indent = 19
    ReadOnly = True
    RowSelect = True
    SortType = stText
    TabOrder = 3
    OnClick = TVClick
  end
end
