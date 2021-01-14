object frm_Stock_Pay: Tfrm_Stock_Pay
  Left = 43
  Top = 43
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #37319#36141#20184#27454
  ClientHeight = 472
  ClientWidth = 709
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
    Width = 708
    Height = 502
    BevelOuter = bvNone
    Caption = 'Panel1'
    TabOrder = 0
    object Panel2: TPanel
      Left = 2
      Top = 0
      Width = 702
      Height = 213
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Color = clSkyBlue
      TabOrder = 0
      object SpeedButton2: TSpeedButton
        Left = 585
        Top = 0
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
        Left = 529
        Top = 0
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
      object Cmd_Exit: TSpeedButton
        Left = 641
        Top = 0
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
        OnClick = Cmd_ExitClick
      end
      object Label1: TLabel
        Left = 24
        Top = 6
        Width = 95
        Height = 16
        Caption = #37319' '#36141' '#20184' '#27454
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = #23435#20307
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object Panel3: TPanel
        Left = 0
        Top = 30
        Width = 774
        Height = 180
        Color = clCream
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 0
        object Edit1: TLabeledEdit
          Left = 109
          Top = 9
          Width = 106
          Height = 19
          Color = clCream
          Ctl3D = False
          EditLabel.Width = 59
          EditLabel.Height = 13
          EditLabel.Caption = #24405#21333#26085#26399':'
          LabelPosition = lpLeft
          LabelSpacing = 3
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 0
        end
        object GroupBox1: TGroupBox
          Left = 15
          Top = 30
          Width = 680
          Height = 146
          TabOrder = 2
          object SpeedButton7: TSpeedButton
            Left = 621
            Top = 65
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
          object SpeedButton9: TSpeedButton
            Left = 204
            Top = 64
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
          object Label4: TLabel
            Left = 26
            Top = 42
            Width = 65
            Height = 13
            Caption = #20184#27454#31867#22411#65306
          end
          object Label5: TLabel
            Left = 354
            Top = 42
            Width = 65
            Height = 13
            Caption = #32467#31639#26041#24335#65306
          end
          object SpeedButton6: TSpeedButton
            Left = 621
            Top = 14
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
            OnClick = SpeedButton6Click
          end
          object Edit9: TLabeledEdit
            Left = 94
            Top = 65
            Width = 107
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
            TabOrder = 4
          end
          object Edit10: TLabeledEdit
            Left = 510
            Top = 66
            Width = 108
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
          end
          object Edit11: TLabeledEdit
            Left = 94
            Top = 90
            Width = 523
            Height = 19
            Color = clCream
            Ctl3D = False
            EditLabel.Width = 39
            EditLabel.Height = 13
            EditLabel.Caption = #25688#35201#65306
            LabelPosition = lpLeft
            LabelSpacing = 3
            ParentCtl3D = False
            TabOrder = 6
          end
          object Edit12: TLabeledEdit
            Left = 94
            Top = 116
            Width = 523
            Height = 19
            Color = clCream
            Ctl3D = False
            EditLabel.Width = 65
            EditLabel.Height = 13
            EditLabel.Caption = #38468#21152#35828#26126#65306
            LabelPosition = lpLeft
            LabelSpacing = 3
            ParentCtl3D = False
            TabOrder = 7
          end
          object Edit6: TComboBox
            Left = 94
            Top = 40
            Width = 109
            Height = 21
            Color = clCream
            ItemHeight = 13
            ItemIndex = 0
            TabOrder = 2
            Text = #29616#37329
            Items.Strings = (
              #29616#37329
              #38134#34892#23384#27454
              #25903#31080)
          end
          object Edit7: TComboBox
            Left = 422
            Top = 38
            Width = 112
            Height = 21
            Color = clCream
            Enabled = False
            ItemHeight = 13
            ItemIndex = 0
            TabOrder = 3
            Text = #25353#21333
            OnChange = Edit7Change
            Items.Strings = (
              #25353#21333
              #25353#34892)
          end
          object Edit4: TLabeledEdit
            Left = 94
            Top = 15
            Width = 203
            Height = 19
            Color = clCream
            Ctl3D = False
            EditLabel.Width = 65
            EditLabel.Height = 13
            EditLabel.Caption = #31080#25454#32534#21495#65306
            LabelPosition = lpLeft
            LabelSpacing = 3
            ParentCtl3D = False
            TabOrder = 0
          end
          object Edit5: TLabeledEdit
            Left = 422
            Top = 15
            Width = 195
            Height = 19
            Color = clCream
            Ctl3D = False
            EditLabel.Width = 65
            EditLabel.Height = 13
            EditLabel.Caption = #24448#26469#21333#20301#65306
            LabelPosition = lpLeft
            LabelSpacing = 3
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 1
          end
        end
        object Edit2: TLabeledEdit
          Left = 338
          Top = 9
          Width = 237
          Height = 19
          Color = clCream
          Ctl3D = False
          EditLabel.Width = 59
          EditLabel.Height = 13
          EditLabel.Caption = #21333#25454#32534#21495':'
          LabelPosition = lpLeft
          LabelSpacing = 3
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 1
        end
      end
      object Panel5: TPanel
        Left = 0
        Top = 231
        Width = 828
        Height = 4
        Color = clBackground
        TabOrder = 1
      end
      object Panel6: TPanel
        Left = 808
        Top = 24
        Width = 4
        Height = 207
        Caption = 'Panel6'
        Color = clBackground
        TabOrder = 2
      end
    end
    object Panel8: TPanel
      Left = 0
      Top = 446
      Width = 708
      Height = 25
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Color = clCream
      TabOrder = 1
      object Label2: TLabel
        Left = 270
        Top = 5
        Width = 65
        Height = 13
        Caption = #32467#31639#37329#39069#65306
      end
      object Label3: TLabel
        Left = 519
        Top = 5
        Width = 78
        Height = 13
        Caption = #26410#32467#31639#37329#39069#65306
      end
      object lbjs: TLabel
        Left = 350
        Top = 4
        Width = 28
        Height = 13
        Caption = '0.00'
      end
      object lbwj: TLabel
        Left = 590
        Top = 4
        Width = 28
        Height = 13
        Caption = '0.00'
      end
    end
    object Panel7: TPanel
      Left = 0
      Top = 212
      Width = 707
      Height = 234
      BevelOuter = bvNone
      Caption = 'Panel7'
      Color = clBtnHighlight
      TabOrder = 2
      object Panel10: TPanel
        Left = 0
        Top = 0
        Width = 43
        Height = 234
        Align = alLeft
        BevelOuter = bvNone
        Color = clSkyBlue
        TabOrder = 0
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
        Left = 44
        Top = 0
        Width = 661
        Height = 233
        ColCount = 7
        Ctl3D = False
        FixedColor = clSkyBlue
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSizing, goColSizing]
        ParentCtl3D = False
        TabOrder = 1
        OnDblClick = StringGrid1DblClick
        OnDrawCell = StringGrid1DrawCell
        OnKeyPress = StringGrid1KeyPress
        OnMouseMove = StringGrid1MouseMove
        OnSelectCell = StringGrid1SelectCell
        ColWidths = (
          64
          146
          131
          65
          59
          94
          92)
        RowHeights = (
          24
          24)
      end
    end
    object P_Check: TPanel
      Left = 0
      Top = 496
      Width = 713
      Height = 25
      BevelOuter = bvNone
      Color = clSkyBlue
      TabOrder = 3
    end
  end
end
