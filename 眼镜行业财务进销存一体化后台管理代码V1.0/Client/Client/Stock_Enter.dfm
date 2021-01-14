object frm_Stock_Enter: Tfrm_Stock_Enter
  Left = 54
  Top = 71
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #37319#36141#20837#24211#21333
  ClientHeight = 430
  ClientWidth = 735
  Color = clSkyBlue
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 733
    Height = 431
    BevelOuter = bvNone
    Caption = 'Panel1'
    TabOrder = 0
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 733
      Height = 201
      Align = alTop
      BevelOuter = bvNone
      Color = clSkyBlue
      TabOrder = 0
      object SpeedButton2: TSpeedButton
        Left = 604
        Top = 3
        Width = 55
        Height = 22
        Caption = #23457#26680
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
        OnClick = SpeedButton2Click
      end
      object SpeedButton3: TSpeedButton
        Left = 548
        Top = 3
        Width = 55
        Height = 22
        Caption = #25171#21360
        Flat = True
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
        OnClick = SpeedButton3Click
      end
      object Cmd_Cancel: TSpeedButton
        Left = 660
        Top = 3
        Width = 55
        Height = 22
        Caption = #20445#23384
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
        OnClick = Cmd_CancelClick
      end
      object Label1: TLabel
        Left = 16
        Top = 7
        Width = 121
        Height = 16
        Caption = #37319' '#36141' '#20837' '#24211' '#21333
        Font.Charset = GB2312_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = #23435#20307
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object Panel3: TPanel
        Left = 7
        Top = 32
        Width = 724
        Height = 167
        Alignment = taLeftJustify
        Color = clCream
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 0
        object Cmd_HT: TSpeedButton
          Left = 691
          Top = 10
          Width = 22
          Height = 20
          Hint = #35843#20837#36136#37327#39564#25910#21333#25454
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
          OnClick = Cmd_HTClick
        end
        object Edit1: TLabeledEdit
          Left = 90
          Top = 10
          Width = 92
          Height = 19
          Color = clCream
          Ctl3D = False
          EditLabel.Width = 65
          EditLabel.Height = 13
          EditLabel.Caption = #24405#21333#26085#26399#65306
          LabelPosition = lpLeft
          LabelSpacing = 3
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 0
          OnDblClick = Edit1DblClick
        end
        object GroupBox1: TGroupBox
          Left = 10
          Top = 29
          Width = 703
          Height = 136
          TabOrder = 3
          object SpeedButton5: TSpeedButton
            Left = 430
            Top = 41
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
            OnClick = SpeedButton5Click
          end
          object SpeedButton7: TSpeedButton
            Left = 671
            Top = 61
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
            OnClick = SpeedButton7Click
          end
          object SpeedButton8: TSpeedButton
            Left = 430
            Top = 62
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
            OnClick = SpeedButton8Click
          end
          object SpeedButton9: TSpeedButton
            Left = 202
            Top = 62
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
            OnClick = SpeedButton9Click
          end
          object SpeedButton1: TSpeedButton
            Left = 430
            Top = 17
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
            OnClick = SpeedButton1Click
          end
          object Edit4: TLabeledEdit
            Left = 79
            Top = 19
            Width = 350
            Height = 19
            Color = clCream
            Ctl3D = False
            EditLabel.Width = 65
            EditLabel.Height = 13
            EditLabel.Caption = #20379#36135#21333#20301#65306
            LabelPosition = lpLeft
            LabelSpacing = 3
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 0
          end
          object Edit_Stock_Name: TLabeledEdit
            Left = 79
            Top = 40
            Width = 350
            Height = 19
            Color = clCream
            Ctl3D = False
            EditLabel.Width = 65
            EditLabel.Height = 13
            EditLabel.Caption = #25910#36135#20179#24211#65306
            LabelPosition = lpLeft
            LabelSpacing = 3
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 1
          end
          object Edit6: TLabeledEdit
            Left = 79
            Top = 62
            Width = 121
            Height = 19
            Color = clCream
            Ctl3D = False
            EditLabel.Width = 66
            EditLabel.Height = 13
            EditLabel.Caption = #32463' '#25163' '#20154#65306
            LabelPosition = lpLeft
            LabelSpacing = 3
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 3
          end
          object Edit7: TLabeledEdit
            Left = 308
            Top = 62
            Width = 121
            Height = 19
            Color = clCream
            Ctl3D = False
            EditLabel.Width = 65
            EditLabel.Height = 13
            EditLabel.Caption = #24215#38754#32534#21495#65306
            LabelPosition = lpLeft
            LabelSpacing = 3
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 4
            Visible = False
          end
          object Edit8: TLabeledEdit
            Left = 547
            Top = 62
            Width = 121
            Height = 19
            Color = clCream
            Ctl3D = False
            EditLabel.Width = 66
            EditLabel.Height = 13
            EditLabel.Caption = #21046' '#21333' '#20154#65306
            LabelPosition = lpLeft
            LabelSpacing = 3
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 5
            OnClick = SpeedButton7Click
          end
          object Edit9: TLabeledEdit
            Left = 79
            Top = 111
            Width = 614
            Height = 19
            Color = clCream
            Ctl3D = False
            EditLabel.Width = 65
            EditLabel.Height = 13
            EditLabel.Caption = #38468#21152#35828#26126#65306
            LabelPosition = lpLeft
            LabelSpacing = 3
            ParentCtl3D = False
            TabOrder = 6
          end
          object Edit10: TLabeledEdit
            Left = 79
            Top = 89
            Width = 614
            Height = 19
            Color = clCream
            Ctl3D = False
            EditLabel.Width = 39
            EditLabel.Height = 13
            EditLabel.Caption = #25688#35201#65306
            LabelPosition = lpLeft
            LabelSpacing = 3
            ParentCtl3D = False
            TabOrder = 7
          end
          object Edit5: TEdit
            Left = 308
            Top = 40
            Width = 121
            Height = 19
            Color = clCream
            Ctl3D = False
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 2
          end
        end
        object Edit2: TLabeledEdit
          Left = 270
          Top = 10
          Width = 203
          Height = 17
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
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = #23435#20307
          Font.Style = []
          LabelPosition = lpLeft
          LabelSpacing = 3
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object Edit3: TLabeledEdit
          Left = 547
          Top = 10
          Width = 142
          Height = 19
          Color = clCream
          Ctl3D = False
          EditLabel.Width = 65
          EditLabel.Height = 13
          EditLabel.Caption = #21512#21516#32534#21495#65306
          LabelPosition = lpLeft
          LabelSpacing = 3
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 2
          OnChange = Edit3Change
        end
      end
    end
    object Panel8: TPanel
      Left = 0
      Top = 406
      Width = 733
      Height = 25
      Align = alBottom
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = '   '#24211#23384#20313#37327#65306
      Color = clCream
      TabOrder = 1
      object Label2: TLabel
        Left = 270
        Top = 5
        Width = 93
        Height = 13
        Caption = #21512#35745#25968#37327#65306'0.00'
      end
      object Label3: TLabel
        Left = 519
        Top = 5
        Width = 93
        Height = 13
        Caption = #21512#35745#37329#39069#65306'0.00'
      end
    end
    object Panel9: TPanel
      Left = 0
      Top = 201
      Width = 732
      Height = 205
      BevelOuter = bvNone
      Caption = 'Panel9'
      Color = clCream
      TabOrder = 2
      object Panel10: TPanel
        Left = 0
        Top = 0
        Width = 43
        Height = 205
        Align = alLeft
        BevelOuter = bvNone
        Color = clSkyBlue
        TabOrder = 0
        Visible = False
        object Cmd_Delete: TSpeedButton
          Left = 2
          Top = 52
          Width = 40
          Height = 25
          Caption = #20943#34892
          Flat = True
          NumGlyphs = 2
          OnClick = Cmd_DeleteClick
        end
        object Cmd_Add: TSpeedButton
          Left = 2
          Top = 27
          Width = 40
          Height = 25
          Caption = #22686#34892
          Flat = True
          NumGlyphs = 2
          OnClick = Cmd_AddClick
        end
      end
      object StringGrid1: TStringGrid
        Left = 2
        Top = 0
        Width = 729
        Height = 205
        Color = clWhite
        ColCount = 7
        Ctl3D = False
        DefaultRowHeight = 20
        FixedColor = clSkyBlue
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goRowSizing, goColSizing, goRowMoving, goColMoving, goTabs, goThumbTracking]
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnDblClick = StringGrid1DblClick
        OnDrawCell = StringGrid1DrawCell
        OnKeyPress = StringGrid1KeyPress
        OnSelectCell = StringGrid1SelectCell
        ColWidths = (
          64
          138
          117
          96
          81
          65
          114)
      end
    end
  end
end
