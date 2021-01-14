object frm_Sale_Contract: Tfrm_Sale_Contract
  Left = 5
  Top = 32
  BorderStyle = bsNone
  Caption = #38144#21806#21512#21516
  ClientHeight = 479
  ClientWidth = 765
  Color = clSkyBlue
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 766
    Height = 437
    Color = cl3DLight
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 764
      Height = 204
      Align = alTop
      Color = cl3DLight
      TabOrder = 0
      object SpeedButton2: TSpeedButton
        Left = 636
        Top = 9
        Width = 55
        Height = 22
        Caption = #23457#26680
        Flat = True
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00550B30555000
          0000557F57F557777777550B305508888880557F57F575555557550B30508888
          8805557F57F7FFFFFF75550B300000000055557F5777777777F5550300000000
          0055557F777F555F77F555007800000070555F77557F5F7757F5007888000077
          70557755557F775557F508888800777770557F555577555557F5088808077777
          70557FF5757F555557F5098988077777705577F7557F555557F5999888077777
          705577755575F55557550988888077770555775555575FFF7555088888888000
          55557F55555577775555088888880755555575F5555F77555555508888075555
          5555575FFF775555555555000755555555555577775555555555}
        NumGlyphs = 2
        ParentFont = False
      end
      object SpeedButton3: TSpeedButton
        Left = 580
        Top = 9
        Width = 55
        Height = 22
        Flat = True
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333FFFFF3333333333F797F3333333333F737373FF333333BFB999BFB
          33333337737773773F3333BFBF797FBFB33333733337333373F33BFBFBFBFBFB
          FB3337F33333F33337F33FBFBFB9BFBFBF3337333337F333373FFBFBFBF97BFB
          FBF37F333337FF33337FBFBFBFB99FBFBFB37F3333377FF3337FFBFBFBFB99FB
          FBF37F33333377FF337FBFBF77BF799FBFB37F333FF3377F337FFBFB99FB799B
          FBF373F377F3377F33733FBF997F799FBF3337F377FFF77337F33BFBF99999FB
          FB33373F37777733373333BFBF999FBFB3333373FF77733F7333333BFBFBFBFB
          3333333773FFFF77333333333FBFBF3333333333377777333333}
        NumGlyphs = 2
        ParentFont = False
      end
      object SpeedButton4: TSpeedButton
        Left = 692
        Top = 9
        Width = 55
        Height = 22
        Caption = #20445#23384
        Flat = True
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
          33333337777FF377FF3333993370739993333377FF373F377FF3399993000339
          993337777F777F3377F3393999707333993337F77737333337FF993399933333
          399377F3777FF333377F993339903333399377F33737FF33377F993333707333
          399377F333377FF3377F993333101933399377F333777FFF377F993333000993
          399377FF3377737FF7733993330009993933373FF3777377F7F3399933000399
          99333773FF777F777733339993707339933333773FF7FFF77333333999999999
          3333333777333777333333333999993333333333377777333333}
        NumGlyphs = 2
        ParentFont = False
        OnClick = SpeedButton4Click
      end
      object Panel3: TPanel
        Left = 9
        Top = 33
        Width = 748
        Height = 164
        Color = cl3DLight
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 0
        object Label1: TLabel
          Left = 16
          Top = 7
          Width = 108
          Height = 14
          Caption = #38144'  '#21806'  '#21512'  '#21516
          Font.Charset = GB2312_CHARSET
          Font.Color = clNavy
          Font.Height = -14
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Panel4: TPanel
          Left = 16
          Top = 28
          Width = 113
          Height = 1
          Color = clInfoText
          TabOrder = 0
        end
        object LabeledEdit1: TLabeledEdit
          Left = 215
          Top = 8
          Width = 114
          Height = 20
          Color = clCream
          Ctl3D = False
          EditLabel.Width = 65
          EditLabel.Height = 13
          EditLabel.Caption = #24405#21333#26085#26399#65306
          EditLabel.Font.Charset = GB2312_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -13
          EditLabel.Font.Name = #23435#20307
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          EditLabel.Transparent = True
          LabelPosition = lpLeft
          LabelSpacing = 3
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 1
        end
        object GroupBox1: TGroupBox
          Left = 31
          Top = 30
          Width = 685
          Height = 131
          Color = clCream
          ParentColor = False
          TabOrder = 2
          object SpeedButton1: TSpeedButton
            Left = 401
            Top = 15
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
          object SpeedButton7: TSpeedButton
            Left = 516
            Top = 59
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
          object SpeedButton9: TSpeedButton
            Left = 232
            Top = 59
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
          object SpeedButton6: TSpeedButton
            Left = 403
            Top = 37
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
          object LabeledEdit4: TLabeledEdit
            Left = 110
            Top = 15
            Width = 283
            Height = 20
            Color = clCream
            Ctl3D = False
            EditLabel.Width = 65
            EditLabel.Height = 13
            EditLabel.Caption = #24448#26469#21333#20301#65306
            EditLabel.Font.Charset = ANSI_CHARSET
            EditLabel.Font.Color = clWindowText
            EditLabel.Font.Height = -13
            EditLabel.Font.Name = #23435#20307
            EditLabel.Font.Style = []
            EditLabel.ParentFont = False
            EditLabel.Transparent = True
            LabelPosition = lpLeft
            LabelSpacing = 3
            ParentCtl3D = False
            TabOrder = 0
          end
          object LabeledEdit6: TLabeledEdit
            Left = 110
            Top = 59
            Width = 115
            Height = 20
            Color = clCream
            Ctl3D = False
            EditLabel.Width = 66
            EditLabel.Height = 13
            EditLabel.Caption = #32463' '#25163' '#20154#65306
            EditLabel.Font.Charset = GB2312_CHARSET
            EditLabel.Font.Color = clWindowText
            EditLabel.Font.Height = -13
            EditLabel.Font.Name = #23435#20307
            EditLabel.Font.Style = []
            EditLabel.ParentFont = False
            EditLabel.Transparent = True
            LabelPosition = lpLeft
            LabelSpacing = 3
            ParentCtl3D = False
            TabOrder = 1
          end
          object LabeledEdit8: TLabeledEdit
            Left = 406
            Top = 59
            Width = 104
            Height = 20
            Color = clCream
            Ctl3D = False
            EditLabel.Width = 66
            EditLabel.Height = 13
            EditLabel.Caption = #21046' '#21333' '#20154#65306
            EditLabel.Font.Charset = GB2312_CHARSET
            EditLabel.Font.Color = clWindowText
            EditLabel.Font.Height = -13
            EditLabel.Font.Name = #23435#20307
            EditLabel.Font.Style = []
            EditLabel.ParentFont = False
            EditLabel.Transparent = True
            LabelPosition = lpLeft
            LabelSpacing = 3
            ParentCtl3D = False
            TabOrder = 2
          end
          object LabeledEdit9: TLabeledEdit
            Left = 110
            Top = 106
            Width = 427
            Height = 20
            Color = clCream
            Ctl3D = False
            EditLabel.Width = 65
            EditLabel.Height = 13
            EditLabel.Caption = #38468#21152#35828#26126#65306
            EditLabel.Font.Charset = GB2312_CHARSET
            EditLabel.Font.Color = clWindowText
            EditLabel.Font.Height = -13
            EditLabel.Font.Name = #23435#20307
            EditLabel.Font.Style = []
            EditLabel.ParentFont = False
            EditLabel.Transparent = True
            LabelPosition = lpLeft
            LabelSpacing = 3
            ParentCtl3D = False
            TabOrder = 3
          end
          object LabeledEdit10: TLabeledEdit
            Left = 110
            Top = 84
            Width = 427
            Height = 20
            Color = clCream
            Ctl3D = False
            EditLabel.Width = 39
            EditLabel.Height = 13
            EditLabel.Caption = #25688#35201#65306
            EditLabel.Font.Charset = GB2312_CHARSET
            EditLabel.Font.Color = clWindowText
            EditLabel.Font.Height = -13
            EditLabel.Font.Name = #23435#20307
            EditLabel.Font.Style = []
            EditLabel.ParentFont = False
            EditLabel.Transparent = True
            LabelPosition = lpLeft
            LabelSpacing = 3
            ParentCtl3D = False
            TabOrder = 4
          end
          object LabeledEdit3: TLabeledEdit
            Left = 110
            Top = 38
            Width = 283
            Height = 20
            Color = clCream
            Ctl3D = False
            EditLabel.Width = 65
            EditLabel.Height = 13
            EditLabel.Caption = #38144#21806#20179#24211#65306
            EditLabel.Font.Charset = ANSI_CHARSET
            EditLabel.Font.Color = clWindowText
            EditLabel.Font.Height = -13
            EditLabel.Font.Name = #23435#20307
            EditLabel.Font.Style = []
            EditLabel.ParentFont = False
            EditLabel.Transparent = True
            LabelPosition = lpLeft
            LabelSpacing = 3
            ParentCtl3D = False
            TabOrder = 5
          end
        end
        object LabeledEdit2: TLabeledEdit
          Left = 428
          Top = 8
          Width = 141
          Height = 20
          Color = clCream
          Ctl3D = False
          EditLabel.Width = 65
          EditLabel.Height = 13
          EditLabel.Caption = #21333#25454#32534#21495#65306
          EditLabel.Font.Charset = GB2312_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -13
          EditLabel.Font.Name = #23435#20307
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          EditLabel.Transparent = True
          LabelPosition = lpLeft
          LabelSpacing = 3
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 3
        end
      end
      object Panel6: TPanel
        Left = 833
        Top = 33
        Width = 4
        Height = 167
        Caption = 'Panel6'
        Color = clBackground
        TabOrder = 1
      end
    end
    object Panel10: TPanel
      Left = 0
      Top = 205
      Width = 43
      Height = 232
      Color = cl3DLight
      TabOrder = 1
      object Cmd_Delete: TSpeedButton
        Left = 2
        Top = 52
        Width = 40
        Height = 25
        Caption = #20943#34892
        Flat = True
        NumGlyphs = 2
      end
      object Cmd_Add: TSpeedButton
        Left = 2
        Top = 27
        Width = 40
        Height = 25
        Caption = #22686#34892
        Flat = True
        NumGlyphs = 2
      end
    end
    object StringGrid1: TStringGrid
      Left = 43
      Top = 206
      Width = 715
      Height = 230
      Color = clWhite
      ColCount = 16
      DefaultColWidth = 100
      DefaultRowHeight = 20
      FixedColor = cl3DLight
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goRowSizing, goColSizing, goRowMoving, goColMoving, goTabs, goThumbTracking]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      ColWidths = (
        46
        247
        226
        100
        100
        100
        100
        100
        100
        100
        100
        100
        100
        100
        100
        100)
      RowHeights = (
        20
        20)
    end
  end
  object Panel8: TPanel
    Left = 0
    Top = 437
    Width = 765
    Height = 42
    Align = alBottom
    Alignment = taLeftJustify
    Color = clCream
    TabOrder = 1
    object Label2: TLabel
      Left = 270
      Top = 5
      Width = 98
      Height = 14
      Caption = #21512#35745#25968#37327#65306'0.00'
    end
    object Label3: TLabel
      Left = 519
      Top = 5
      Width = 98
      Height = 14
      Caption = #21512#35745#37329#39069#65306'0.00'
    end
    object SpeedButton5: TSpeedButton
      Left = 613
      Top = 23
      Width = 103
      Height = 18
      Caption = #21512#21516#25171#21360
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
    end
    object SpeedButton10: TSpeedButton
      Left = 730
      Top = 41
      Width = 103
      Height = 19
      Caption = #21512#21516#26597#35810
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
        300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
        330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
        333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
        339977FF777777773377000BFB03333333337773FF733333333F333000333333
        3300333777333333337733333333333333003333333333333377333333333333
        333333333333333333FF33333333333330003333333333333777333333333333
        3000333333333333377733333333333333333333333333333333}
      NumGlyphs = 2
    end
  end
end
