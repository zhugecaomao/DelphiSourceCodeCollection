object frm_Stock_Contract: Tfrm_Stock_Contract
  Left = 40
  Top = 50
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #37319#36141#21512#21516
  ClientHeight = 476
  ClientWidth = 727
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
    Width = 727
    Height = 476
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel1'
    TabOrder = 0
    object Panel8: TPanel
      Left = 0
      Top = 451
      Width = 727
      Height = 25
      Align = alBottom
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Color = clCream
      TabOrder = 0
      object Label2: TLabel
        Left = 270
        Top = 6
        Width = 65
        Height = 13
        Caption = #21512#35745#25968#37327#65306
      end
      object Label3: TLabel
        Left = 519
        Top = 5
        Width = 65
        Height = 13
        Caption = #21512#35745#37329#39069#65306
      end
      object lbzj: TLabel
        Left = 582
        Top = 5
        Width = 28
        Height = 13
        Caption = '0.00'
      end
      object lbgs: TLabel
        Left = 334
        Top = 6
        Width = 7
        Height = 13
        Caption = '0'
      end
    end
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 727
      Height = 204
      Align = alTop
      BevelOuter = bvNone
      Color = clSkyBlue
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object SpeedButton2: TSpeedButton
        Left = 612
        Top = 5
        Width = 55
        Height = 25
        Hint = #23457#26680#21333#25454
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
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton2Click
      end
      object SpeedButton4: TSpeedButton
        Left = 667
        Top = 5
        Width = 55
        Height = 25
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
      object SpeedButton3: TSpeedButton
        Left = 508
        Top = 5
        Width = 105
        Height = 25
        Caption = #21830#21697#38656#27714#36716#21333
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
        OnClick = SpeedButton3Click
      end
      object Label1: TLabel
        Left = 16
        Top = 7
        Width = 122
        Height = 16
        Caption = #37319'  '#36141'  '#21512'  '#21516
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = #23435#20307
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object spbyd: TSpeedButton
        Left = 400
        Top = 5
        Width = 107
        Height = 25
        Caption = #39044#23450#21830#21697#36716#21333
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333FFFFF3333333333000003333333333F777773FF333333003333300
          33333337733333773F33330333333333033333733FFFFFFF73F3303300000003
          303337F37777777337F3303330CCC0333033373337777733373F0333330C0333
          33037F33337773FFF37F03333330300033037F3FFFF73777FF7F0300000307B7
          03037F77777F77777F7F030999030BBB03037F77777F77777F7F0309990307B7
          03037377777F7777737330099903300030333777777F377737F3300000033333
          3033377777733333373333033333333303333373FF33333F7333333003333300
          3333333773FFFF77333333333000003333333333377777333333}
        NumGlyphs = 2
        OnClick = spbydClick
      end
      object Cmd_Print: TSpeedButton
        Left = 334
        Top = 5
        Width = 65
        Height = 25
        Caption = #25171#21360
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
        OnClick = Cmd_PrintClick
      end
      object Panel3: TPanel
        Left = 9
        Top = 33
        Width = 825
        Height = 164
        Color = clCream
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 0
        object Label4: TLabel
          Left = 546
          Top = 22
          Width = 59
          Height = 13
          Caption = #21040#36798#26085#26399':'
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Edit1: TLabeledEdit
          Left = 110
          Top = 19
          Width = 89
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
          LabelPosition = lpLeft
          LabelSpacing = 3
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 0
          OnClick = Edit1Click
        end
        object GroupBox1: TGroupBox
          Left = 15
          Top = 40
          Width = 697
          Height = 120
          TabOrder = 2
          object Cmd_DW: TSpeedButton
            Left = 454
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
            OnClick = Cmd_DWClick
          end
          object Cmd_JSR: TSpeedButton
            Left = 193
            Top = 43
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
            OnClick = Cmd_JSRClick
          end
          object Cmd_ZDR: TSpeedButton
            Left = 455
            Top = 43
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
            OnClick = Cmd_ZDRClick
          end
          object Edit4: TLabeledEdit
            Left = 94
            Top = 19
            Width = 359
            Height = 19
            Color = clCream
            Ctl3D = False
            EditLabel.Width = 65
            EditLabel.Height = 13
            EditLabel.Caption = #20379#36135#21333#20301#65306
            EditLabel.Font.Charset = GB2312_CHARSET
            EditLabel.Font.Color = clWindowText
            EditLabel.Font.Height = -13
            EditLabel.Font.Name = #23435#20307
            EditLabel.Font.Style = []
            EditLabel.ParentFont = False
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #23435#20307
            Font.Style = []
            LabelPosition = lpLeft
            LabelSpacing = 3
            ParentCtl3D = False
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object Edit5: TLabeledEdit
            Left = 94
            Top = 43
            Width = 98
            Height = 19
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
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #23435#20307
            Font.Style = []
            LabelPosition = lpLeft
            LabelSpacing = 3
            ParentCtl3D = False
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object Edit7: TLabeledEdit
            Left = 339
            Top = 43
            Width = 115
            Height = 19
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
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #23435#20307
            Font.Style = []
            LabelPosition = lpLeft
            LabelSpacing = 3
            ParentCtl3D = False
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
          end
          object Edit8: TLabeledEdit
            Left = 94
            Top = 69
            Width = 555
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
            LabelPosition = lpLeft
            LabelSpacing = 3
            ParentCtl3D = False
            TabOrder = 3
          end
          object Edit9: TLabeledEdit
            Left = 94
            Top = 95
            Width = 556
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
            LabelPosition = lpLeft
            LabelSpacing = 3
            ParentCtl3D = False
            TabOrder = 4
          end
        end
        object Edit2: TLabeledEdit
          Left = 286
          Top = 19
          Width = 249
          Height = 19
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
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          LabelPosition = lpLeft
          LabelSpacing = 3
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object DateTimePicker1: TDateTimePicker
          Left = 798
          Top = 19
          Width = 21
          Height = 21
          CalAlignment = dtaLeft
          Date = 37945.6290323611
          Time = 37945.6290323611
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkDate
          ParseInput = False
          TabOrder = 3
        end
        object Edit3: TDateTimePicker
          Left = 608
          Top = 18
          Width = 108
          Height = 22
          CalAlignment = dtaLeft
          Date = 38119.5027217361
          Time = 38119.5027217361
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkDate
          ParseInput = False
          TabOrder = 4
        end
      end
      object Panel5: TPanel
        Left = 9
        Top = 196
        Width = 828
        Height = 6
        Color = clBackground
        TabOrder = 1
      end
      object Panel6: TPanel
        Left = 833
        Top = 33
        Width = 6
        Height = 169
        Caption = 'Panel6'
        Color = clBackground
        TabOrder = 2
      end
    end
    object Panel7: TPanel
      Left = 0
      Top = 204
      Width = 727
      Height = 247
      Align = alClient
      BevelOuter = bvNone
      Caption = 'Panel7'
      Color = clSkyBlue
      TabOrder = 2
      object Panel9: TPanel
        Left = 0
        Top = 0
        Width = 53
        Height = 247
        Align = alLeft
        BevelOuter = bvNone
        Color = clSkyBlue
        TabOrder = 0
        object Cmd_Delete: TSpeedButton
          Left = 1
          Top = 39
          Width = 48
          Height = 25
          Caption = #20943#34892
          Flat = True
          NumGlyphs = 2
          OnClick = Cmd_DeleteClick
        end
        object Cmd_Add: TSpeedButton
          Left = 1
          Top = 14
          Width = 48
          Height = 25
          Caption = #22686#34892
          Flat = True
          NumGlyphs = 2
          OnClick = Cmd_AddClick
        end
      end
      object StringGrid1: TStringGrid
        Left = 51
        Top = 1
        Width = 674
        Height = 246
        ColCount = 9
        Ctl3D = False
        FixedColor = clSkyBlue
        RowCount = 2
        ParentCtl3D = False
        TabOrder = 1
        OnDblClick = StringGrid1DblClick
        OnDrawCell = StringGrid1DrawCell
        OnKeyPress = StringGrid1KeyPress
        OnMouseMove = StringGrid1MouseMove
        OnSelectCell = StringGrid1SelectCell
        OnSetEditText = StringGrid1SetEditText
        ColWidths = (
          64
          187
          198
          69
          68
          67
          71
          70
          75)
        RowHeights = (
          24
          24)
      end
    end
  end
end
