inherited fmbcaplr: Tfmbcaplr
  Left = 153
  Top = 113
  Caption = #29677#27425#23433#25490#24405#20837
  ClientHeight = 287
  ClientWidth = 556
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton3: TSpeedButton
    Left = 253
    Top = 16
    Width = 22
    Height = 20
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      33333333333333333333333333333333333333333333333333FF333333333333
      3000333333FFFFF3F77733333000003000B033333777773777F733330BFBFB00
      E00033337FFF3377F7773333000FBFB0E000333377733337F7773330FBFBFBF0
      E00033F7FFFF3337F7773000000FBFB0E000377777733337F7770BFBFBFBFBF0
      E00073FFFFFFFF37F777300000000FB0E000377777777337F7773333330BFB00
      000033333373FF77777733333330003333333333333777333333333333333333
      3333333333333333333333333333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333333333333}
    NumGlyphs = 2
  end
  object edticid: TLabeledEdit
    Left = 128
    Top = 16
    Width = 121
    Height = 21
    EditLabel.Width = 40
    EditLabel.Height = 13
    EditLabel.Caption = 'IC'#21345#21495
    LabelPosition = lpLeft
    LabelSpacing = 3
    TabOrder = 0
  end
  object edtno: TLabeledEdit
    Left = 376
    Top = 16
    Width = 121
    Height = 21
    EditLabel.Width = 52
    EditLabel.Height = 13
    EditLabel.Caption = #21592#24037#32534#21495
    LabelPosition = lpLeft
    LabelSpacing = 3
    TabOrder = 1
  end
  object edtpartno: TLabeledEdit
    Left = 128
    Top = 43
    Width = 121
    Height = 21
    EditLabel.Width = 52
    EditLabel.Height = 13
    EditLabel.Caption = #37096#38376#32534#21495
    LabelPosition = lpLeft
    LabelSpacing = 3
    TabOrder = 2
  end
  object edtperson: TLabeledEdit
    Left = 376
    Top = 43
    Width = 121
    Height = 21
    EditLabel.Width = 52
    EditLabel.Height = 13
    EditLabel.Caption = #21592#24037#22995#21517
    LabelPosition = lpLeft
    LabelSpacing = 3
    TabOrder = 3
  end
  object Panel1: TPanel
    Left = 0
    Top = 72
    Width = 553
    Height = 185
    BevelInner = bvLowered
    BevelOuter = bvSpace
    TabOrder = 4
    object Gridbase: TStringGrid
      Left = 2
      Top = 2
      Width = 549
      Height = 181
      Align = alClient
      ColCount = 32
      RowCount = 2
      TabOrder = 0
      OnDrawCell = GridbaseDrawCell
    end
    object cmbbcbh: TComboBox
      Left = 104
      Top = 72
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 1
      Visible = False
      OnChange = cmbbcbhChange
    end
  end
  object btnOk: TBitBtn
    Left = 406
    Top = 259
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 5
    OnClick = btnOkClick
    Kind = bkOK
  end
  object btnCancel: TBitBtn
    Left = 480
    Top = 259
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 6
    OnClick = btnCancelClick
    Kind = bkCancel
  end
end
