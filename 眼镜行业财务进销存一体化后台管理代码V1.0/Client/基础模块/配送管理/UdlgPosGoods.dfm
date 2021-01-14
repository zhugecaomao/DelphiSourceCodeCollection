inherited dlgPosGoods: TdlgPosGoods
  Left = 291
  Top = 227
  Caption = #25968#37327#25214#24179
  ClientHeight = 141
  ClientWidth = 250
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 250
    Height = 141
    Align = alClient
    Color = clSkyBlue
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 10
      Top = 1
      Width = 233
      Height = 107
      Color = clSkyBlue
      ParentColor = False
      TabOrder = 0
      object edtup: TLabeledEditint
        Left = 80
        Top = 29
        Width = 130
        Height = 21
        Color = clCream
        EditLabel.Width = 52
        EditLabel.Height = 13
        EditLabel.Caption = #30003#35831#25968#37327
        EditLabel.Transparent = True
        LabelPosition = lpLeft
        LabelSpacing = 3
        ReadOnly = True
        TabOrder = 0
      end
      object edtdown: TLabeledEditint
        Left = 80
        Top = 64
        Width = 130
        Height = 21
        EditLabel.Width = 52
        EditLabel.Height = 13
        EditLabel.Caption = #25214#24179#25968#37327
        EditLabel.Transparent = True
        LabelPosition = lpLeft
        LabelSpacing = 3
        TabOrder = 1
      end
    end
    object btnOk: TBitBtn
      Left = 95
      Top = 112
      Width = 75
      Height = 25
      Caption = #30830#23450
      TabOrder = 1
      OnClick = btnOkClick
      Kind = bkOK
    end
    object btnCancel: TBitBtn
      Left = 171
      Top = 112
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 2
      OnClick = btnCancelClick
      Kind = bkCancel
    end
  end
end
