inherited fmonlygoods: Tfmonlygoods
  Left = 155
  Top = 151
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = #21333#21697#20998#26512
  ClientHeight = 323
  ClientWidth = 538
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 538
    Height = 290
    Align = alClient
    TabOrder = 0
    object Gridbase: TStringGrid
      Left = 1
      Top = 1
      Width = 536
      Height = 288
      HelpType = htKeyword
      Align = alClient
      ColCount = 14
      DefaultRowHeight = 21
      RowCount = 10
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
      TabOrder = 0
      OnDrawCell = GridbaseDrawCell
      RowHeights = (
        21
        21
        21
        21
        21
        21
        21
        21
        21
        21)
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 290
    Width = 538
    Height = 33
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      538
      33)
    object btnCancel: TBitBtn
      Left = 456
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #21462#28040
      TabOrder = 0
      OnClick = btnCancelClick
      Kind = bkCancel
    end
    object BitBtn1: TBitBtn
      Left = 380
      Top = 5
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #26597#35810#26465#20214
      TabOrder = 1
      OnClick = BitBtn1Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
        DADAADADADADAD00ADAD000000000910000A0FFFF0FF9F10FF0D0FF00009F10F
        FF0A0F0787701088FF0D0078E7F70FFFFF0A008E878F08888F0D00EFE7E80FFF
        FF0A007FF78708888F0D0F07E770FFFFFF0A0F8000088888FF0D0FFFF0FFFFFF
        FF0A444444444444444D444444444444444A444444444444444D}
    end
    object btnprint: TBitBtn
      Left = 304
      Top = 5
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #25171#21360
      TabOrder = 2
      OnClick = btnprintClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        0003377777777777777308888888888888807F33333333333337088888888888
        88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
        8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
        8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
    end
  end
end
