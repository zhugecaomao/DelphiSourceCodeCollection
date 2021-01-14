object frm_Price_Chang: Tfrm_Price_Chang
  Left = -38
  Top = 31
  AutoSize = True
  BorderStyle = bsNone
  Caption = #21830#21697#35843#20215
  ClientHeight = 585
  ClientWidth = 804
  Color = clSkyBlue
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 804
    Height = 585
    Align = alClient
    Caption = 'Panel1'
    Color = clSkyBlue
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 802
      Height = 233
      Align = alTop
      Color = clSkyBlue
      TabOrder = 0
      object SpeedButton2: TSpeedButton
        Left = 710
        Top = 9
        Width = 39
        Height = 22
        Flat = True
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
      end
      object SpeedButton3: TSpeedButton
        Left = 752
        Top = 9
        Width = 39
        Height = 22
        Flat = True
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
      end
      object SpeedButton4: TSpeedButton
        Left = 795
        Top = 9
        Width = 39
        Height = 22
        Flat = True
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
        OnClick = SpeedButton4Click
      end
      object Panel3: TPanel
        Left = 9
        Top = 33
        Width = 825
        Height = 193
        Color = clSkyBlue
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 0
        object Label1: TLabel
          Left = 16
          Top = 12
          Width = 149
          Height = 20
          Caption = #25104' '#26412' '#35843' '#20215' '#21333
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -20
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Panel4: TPanel
          Left = 16
          Top = 33
          Width = 149
          Height = 5
          Color = clInfoText
          TabOrder = 0
        end
        object LabeledEdit1: TLabeledEdit
          Left = 279
          Top = 19
          Width = 121
          Height = 20
          Color = clSkyBlue
          Ctl3D = False
          EditLabel.Width = 70
          EditLabel.Height = 14
          EditLabel.Caption = #24405#21333#26085#26399#65306
          LabelPosition = lpLeft
          LabelSpacing = 3
          ParentCtl3D = False
          TabOrder = 1
        end
        object GroupBox1: TGroupBox
          Left = 15
          Top = 40
          Width = 802
          Height = 148
          TabOrder = 2
          object SpeedButton1: TSpeedButton
            Left = 485
            Top = 19
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
            Visible = False
          end
          object SpeedButton5: TSpeedButton
            Left = 485
            Top = 44
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
            Left = 756
            Top = 70
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
          object SpeedButton8: TSpeedButton
            Left = 485
            Top = 70
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
            Left = 215
            Top = 70
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
            Left = 94
            Top = 19
            Width = 391
            Height = 20
            Color = clSkyBlue
            Ctl3D = False
            EditLabel.Width = 70
            EditLabel.Height = 14
            EditLabel.Caption = #20379#36135#21333#20301#65306
            LabelPosition = lpLeft
            LabelSpacing = 3
            ParentCtl3D = False
            TabOrder = 0
            Visible = False
          end
          object LabeledEdit5: TLabeledEdit
            Left = 94
            Top = 44
            Width = 391
            Height = 20
            Color = clSkyBlue
            Ctl3D = False
            EditLabel.Width = 42
            EditLabel.Height = 14
            EditLabel.Caption = #20179#24211#65306
            LabelPosition = lpLeft
            LabelSpacing = 3
            ParentCtl3D = False
            TabOrder = 1
          end
          object LabeledEdit6: TLabeledEdit
            Left = 94
            Top = 70
            Width = 121
            Height = 20
            Color = clSkyBlue
            Ctl3D = False
            EditLabel.Width = 70
            EditLabel.Height = 14
            EditLabel.Caption = #32463' '#25163' '#20154#65306
            LabelPosition = lpLeft
            LabelSpacing = 3
            ParentCtl3D = False
            TabOrder = 2
          end
          object LabeledEdit7: TLabeledEdit
            Left = 364
            Top = 70
            Width = 121
            Height = 20
            Color = clSkyBlue
            Ctl3D = False
            EditLabel.Width = 70
            EditLabel.Height = 14
            EditLabel.Caption = #23457' '#26680' '#20154#65306
            LabelPosition = lpLeft
            LabelSpacing = 3
            ParentCtl3D = False
            TabOrder = 3
          end
          object LabeledEdit8: TLabeledEdit
            Left = 635
            Top = 70
            Width = 121
            Height = 20
            Color = clSkyBlue
            Ctl3D = False
            EditLabel.Width = 70
            EditLabel.Height = 14
            EditLabel.Caption = #21046' '#21333' '#20154#65306
            LabelPosition = lpLeft
            LabelSpacing = 3
            ParentCtl3D = False
            TabOrder = 4
          end
          object LabeledEdit9: TLabeledEdit
            Left = 94
            Top = 96
            Width = 684
            Height = 20
            Color = clSkyBlue
            Ctl3D = False
            EditLabel.Width = 70
            EditLabel.Height = 14
            EditLabel.Caption = #38468#21152#35828#26126#65306
            LabelPosition = lpLeft
            LabelSpacing = 3
            ParentCtl3D = False
            TabOrder = 5
          end
          object LabeledEdit10: TLabeledEdit
            Left = 94
            Top = 122
            Width = 684
            Height = 20
            Color = clSkyBlue
            Ctl3D = False
            EditLabel.Width = 42
            EditLabel.Height = 14
            EditLabel.Caption = #25688#35201#65306
            LabelPosition = lpLeft
            LabelSpacing = 3
            ParentCtl3D = False
            TabOrder = 6
          end
        end
        object LabeledEdit2: TLabeledEdit
          Left = 486
          Top = 19
          Width = 121
          Height = 20
          Color = clSkyBlue
          Ctl3D = False
          EditLabel.Width = 70
          EditLabel.Height = 14
          EditLabel.Caption = #21333#25454#32534#21495#65306
          LabelPosition = lpLeft
          LabelSpacing = 3
          ParentCtl3D = False
          TabOrder = 3
        end
      end
      object Panel5: TPanel
        Left = 9
        Top = 225
        Width = 828
        Height = 4
        Color = clBackground
        TabOrder = 1
      end
      object Panel6: TPanel
        Left = 833
        Top = 33
        Width = 4
        Height = 195
        Caption = 'Panel6'
        Color = clBackground
        TabOrder = 2
      end
    end
    object Panel8: TPanel
      Left = 1
      Top = 559
      Width = 802
      Height = 25
      Align = alBottom
      Alignment = taLeftJustify
      Caption = '   '#24211#23384#20313#37327#65306
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
    end
    object Panel7: TPanel
      Left = 1
      Top = 534
      Width = 802
      Height = 25
      Align = alBottom
      Color = clSkyBlue
      TabOrder = 2
      object SpeedButton6: TSpeedButton
        Left = 215
        Top = 2
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
      object SpeedButton10: TSpeedButton
        Left = 733
        Top = 2
        Width = 103
        Height = 19
        Caption = #20837#24211#26597#35810
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
      object LabeledEdit11: TLabeledEdit
        Left = 94
        Top = 2
        Width = 121
        Height = 20
        Color = clSkyBlue
        Ctl3D = False
        EditLabel.Width = 70
        EditLabel.Height = 14
        EditLabel.Caption = #20184#27454#24080#25143#65306
        LabelPosition = lpLeft
        LabelSpacing = 3
        ParentCtl3D = False
        TabOrder = 0
      end
      object LabeledEdit12: TLabeledEdit
        Left = 343
        Top = 2
        Width = 121
        Height = 20
        Color = clSkyBlue
        Ctl3D = False
        EditLabel.Width = 70
        EditLabel.Height = 14
        EditLabel.Caption = #20184#27454#37329#39069#65306
        LabelPosition = lpLeft
        LabelSpacing = 3
        ParentCtl3D = False
        TabOrder = 1
      end
      object LabeledEdit13: TLabeledEdit
        Left = 593
        Top = 2
        Width = 121
        Height = 20
        Color = clSkyBlue
        Ctl3D = False
        EditLabel.Width = 70
        EditLabel.Height = 14
        EditLabel.Caption = #20184#27454#26399#38480#65306
        LabelPosition = lpLeft
        LabelSpacing = 3
        ParentCtl3D = False
        TabOrder = 2
      end
    end
  end
end
