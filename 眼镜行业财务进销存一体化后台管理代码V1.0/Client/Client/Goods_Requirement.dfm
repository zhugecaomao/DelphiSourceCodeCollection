object frm_Goods_Requirement: Tfrm_Goods_Requirement
  Left = 11
  Top = 41
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #21830#21697#38656#27714
  ClientHeight = 479
  ClientWidth = 765
  Color = clSkyBlue
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 765
    Height = 479
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel1'
    ParentColor = True
    TabOrder = 0
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 765
      Height = 195
      Align = alTop
      BevelOuter = bvNone
      Color = clSkyBlue
      TabOrder = 0
      object SpeedButton2: TSpeedButton
        Left = 643
        Top = 2
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
      object SpeedButton4: TSpeedButton
        Left = 699
        Top = 2
        Width = 59
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
        OnClick = SpeedButton4Click
      end
      object Label1: TLabel
        Left = 16
        Top = 7
        Width = 122
        Height = 16
        Caption = #21830'  '#21697'  '#38656'  '#27714
        Font.Charset = GB2312_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = #23435#20307
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object Panel3: TPanel
        Left = 9
        Top = 31
        Width = 749
        Height = 163
        Color = clCream
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 0
        object Edit1: TLabeledEdit
          Left = 110
          Top = 10
          Width = 121
          Height = 19
          AutoSize = False
          Color = clCream
          Ctl3D = False
          EditLabel.Width = 65
          EditLabel.Height = 13
          EditLabel.Caption = #24405#21333#26085#26399#65306
          LabelPosition = lpLeft
          LabelSpacing = 3
          ParentCtl3D = False
          TabOrder = 0
          OnDblClick = Edit1DblClick
          OnKeyPress = Edit1KeyPress
        end
        object GroupBox1: TGroupBox
          Left = 15
          Top = 30
          Width = 688
          Height = 129
          TabOrder = 2
          object Cmd_Select_Storage: TSpeedButton
            Left = 394
            Top = 18
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
            OnClick = Cmd_Select_StorageClick
          end
          object Cmd_Select_Login: TSpeedButton
            Left = 648
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
            OnClick = Cmd_Select_LoginClick
          end
          object Cmd_Select_JSR: TSpeedButton
            Left = 222
            Top = 39
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
            OnClick = Cmd_Select_JSRClick
          end
          object Cmd_Select_Shop: TSpeedButton
            Left = 683
            Top = 10
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
            OnClick = Cmd_Select_ShopClick
          end
          object Edit_Storage_Name: TLabeledEdit
            Left = 94
            Top = 19
            Width = 298
            Height = 19
            AutoSize = False
            Color = clCream
            Ctl3D = False
            EditLabel.Width = 65
            EditLabel.Height = 13
            EditLabel.Caption = #38656#27714#20179#24211#65306
            LabelPosition = lpLeft
            LabelSpacing = 3
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 0
          end
          object Edit5: TLabeledEdit
            Left = 94
            Top = 41
            Width = 121
            Height = 19
            AutoSize = False
            Color = clCream
            Ctl3D = False
            EditLabel.Width = 66
            EditLabel.Height = 13
            EditLabel.Caption = #32463' '#25163' '#20154#65306
            LabelPosition = lpLeft
            LabelSpacing = 3
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 2
          end
          object Edit6: TLabeledEdit
            Left = 527
            Top = 41
            Width = 121
            Height = 19
            AutoSize = False
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
            OnKeyPress = Edit6KeyPress
          end
          object Edit7: TLabeledEdit
            Left = 94
            Top = 63
            Width = 577
            Height = 19
            AutoSize = False
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
          object Edit8: TLabeledEdit
            Left = 94
            Top = 84
            Width = 577
            Height = 19
            AutoSize = False
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
          object Edit3: TLabeledEdit
            Left = 295
            Top = 19
            Width = 97
            Height = 19
            AutoSize = False
            Color = clCream
            Ctl3D = False
            EditLabel.Width = 35
            EditLabel.Height = 13
            EditLabel.Caption = 'Edit3'
            LabelPosition = lpLeft
            LabelSpacing = 3
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 1
          end
          object Edit_Shop_Name: TLabeledEdit
            Left = 382
            Top = 11
            Width = 298
            Height = 19
            AutoSize = False
            Color = clCream
            Ctl3D = False
            EditLabel.Width = 65
            EditLabel.Height = 13
            EditLabel.Caption = #38656#27714#24215#38754#65306
            LabelPosition = lpLeft
            LabelSpacing = 3
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 3
            Visible = False
          end
          object Edit4: TLabeledEdit
            Left = 583
            Top = 11
            Width = 97
            Height = 19
            AutoSize = False
            Color = clCream
            Ctl3D = False
            EditLabel.Width = 66
            EditLabel.Height = 13
            EditLabel.Caption = #23457' '#26680' '#20154#65306
            LabelPosition = lpLeft
            LabelSpacing = 3
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 4
            Visible = False
          end
          object edtgoodsremark: TLabeledEdit
            Left = 94
            Top = 106
            Width = 577
            Height = 19
            AutoSize = False
            Color = clCream
            Ctl3D = False
            EditLabel.Width = 65
            EditLabel.Height = 13
            EditLabel.Caption = #21830#21697#35828#26126#65306
            LabelPosition = lpLeft
            LabelSpacing = 3
            ParentCtl3D = False
            TabOrder = 8
            OnChange = edtgoodsremarkChange
          end
        end
        object Edit2: TLabeledEdit
          Left = 364
          Top = 10
          Width = 197
          Height = 19
          AutoSize = False
          Color = clCream
          Ctl3D = False
          EditLabel.Width = 65
          EditLabel.Height = 13
          EditLabel.Caption = #21333#25454#32534#21495#65306
          LabelPosition = lpLeft
          LabelSpacing = 3
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 1
        end
      end
    end
    object Panel7: TPanel
      Left = 0
      Top = 454
      Width = 765
      Height = 25
      Align = alBottom
      BevelOuter = bvNone
      Color = clCream
      TabOrder = 1
      object spbprint: TSpeedButton
        Left = 656
        Top = 2
        Width = 103
        Height = 19
        Caption = #38656#27714#25171#21360
        Enabled = False
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
        OnClick = spbprintClick
      end
    end
    object Panel6: TPanel
      Left = 0
      Top = 195
      Width = 765
      Height = 259
      Align = alClient
      BevelOuter = bvNone
      Caption = 'Panel6'
      TabOrder = 2
      object StringGrid1: TStringGrid
        Left = 42
        Top = 0
        Width = 722
        Height = 259
        Color = clWhite
        ColCount = 16
        Ctl3D = False
        DefaultColWidth = 100
        DefaultRowHeight = 20
        FixedColor = clSkyBlue
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goRowSizing, goColSizing, goRowMoving, goColMoving, goTabs, goThumbTracking]
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnDblClick = StringGrid1DblClick
        OnDrawCell = StringGrid1DrawCell
        OnKeyPress = StringGrid1KeyPress
        OnSelectCell = StringGrid1SelectCell
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
      object Panel10: TPanel
        Left = 0
        Top = 0
        Width = 43
        Height = 259
        Color = clSkyBlue
        TabOrder = 1
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
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Layout = blGlyphTop
          ParentFont = False
          OnClick = Cmd_AddClick
        end
      end
    end
  end
end
