object Y_DealInFm: TY_DealInFm
  Left = 28
  Top = 43
  Width = 780
  Height = 520
  Caption = #12304#32463#33829#24773#20917#25253#34920#12305
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 668
    Height = 493
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Panel4: TPanel
      Left = 0
      Top = 0
      Width = 668
      Height = 493
      Align = alClient
      BevelOuter = bvNone
      BorderWidth = 3
      TabOrder = 0
      object Panel6: TPanel
        Left = 3
        Top = 3
        Width = 662
        Height = 487
        Align = alClient
        BevelInner = bvLowered
        BevelOuter = bvLowered
        BorderWidth = 2
        Color = cl3DLight
        TabOrder = 0
        object SupGrids1: TStringGrid
          Left = 4
          Top = 4
          Width = 654
          Height = 479
          Align = alClient
          Color = clWhite
          Ctl3D = False
          FixedColor = clSkyBlue
          RowCount = 18
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = #23435#20307
          Font.Style = []
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goTabs, goRowSelect]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          OnDrawCell = SupGrids1DrawCell
          ColWidths = (
            30
            162
            184
            124
            264)
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 668
    Top = 0
    Width = 104
    Height = 493
    Align = alRight
    BevelOuter = bvLowered
    Color = 16573127
    TabOrder = 1
    DesignSize = (
      104
      493)
    object SpeedButton8: TSpeedButton
      Left = 16
      Top = 419
      Width = 73
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #36864#20986
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
        03333377777777777F333301BBBBBBBB033333773F3333337F3333011BBBBBBB
        0333337F73F333337F33330111BBBBBB0333337F373F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337FF3337F33330111B0BBBB
        0333337F337733337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F3F7F33337F333301E10BBBBB0333337F7F7F33337F333301EE0BBBBB
        0333337F777FFFFF7F3333000000000003333377777777777333}
      NumGlyphs = 2
      OnClick = SpeedButton8Click
    end
    object Bevel1: TBevel
      Left = 5
      Top = 91
      Width = 93
      Height = 9
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsBottomLine
    end
    object Bevel3: TBevel
      Left = 5
      Top = 395
      Width = 93
      Height = 9
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsBottomLine
    end
    object btnPrivew: TBitBtn
      Left = 13
      Top = 63
      Width = 75
      Height = 25
      Caption = #25171#21360#39044#35272
      TabOrder = 0
      OnClick = btnPrivewClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
        DADAADADADADADADADADD0000000000000DA067676767676760D076700000007
        670A06760FFFFF06760D07670F444F07670A06760FFFFF06760D07670F44FF07
        670A06760FFFFF06760D07670F444F07670A06760FFFFF06760D076700000007
        670A067676767676760DD0000000000000DAADADADADADADADAD}
    end
  end
  object cdsdata: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 24
    Top = 160
  end
end
