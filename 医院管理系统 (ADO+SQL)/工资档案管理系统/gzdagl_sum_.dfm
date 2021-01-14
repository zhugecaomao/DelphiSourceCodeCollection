object Form_sum: TForm_sum
  Left = 198
  Top = 74
  Width = 759
  Height = 564
  Caption = #32479#35745#25968#25454
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 751
    Height = 537
    ActivePage = TabSheet2
    Align = alClient
    TabIndex = 1
    TabOrder = 0
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = #37096#38376#24037#36164#24635#21644
      object DBChart1: TDBChart
        Left = 0
        Top = 72
        Width = 743
        Height = 437
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clBlue
        Title.Font.Height = -29
        Title.Font.Name = #23435#20307
        Title.Font.Style = []
        Title.Text.Strings = (
          #31185#23460#24037#36164#24635#21644)
        Align = alBottom
        TabOrder = 0
        object Series1: TBarSeries
          Marks.ArrowLength = 20
          Marks.Visible = True
          DataSource = DMgzdagl.ADOQsum_department
          SeriesColor = clRed
          XLabelsSource = #31185#23460#21517#31216
          BarWidthPercent = 30
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          XValues.ValueSource = #24635#35745
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
          YValues.ValueSource = #24635#35745
        end
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 743
        Height = 65
        Align = alTop
        DataSource = DMgzdagl.DSQsum_department
        ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
    end
    object TabSheet2: TTabSheet
      Caption = #21592#24037#34917#36148#32479#35745
      ImageIndex = 1
      object DBGrid2: TDBGrid
        Left = 0
        Top = 0
        Width = 743
        Height = 73
        Align = alTop
        DataSource = DMgzdagl.DSQsum_butie
        ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
      object DBChart2: TDBChart
        Left = 0
        Top = 73
        Width = 743
        Height = 436
        AllowPanning = pmNone
        AllowZoom = False
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        BackWall.Pen.Visible = False
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clBlue
        Title.Font.Height = -32
        Title.Font.Name = #23435#20307
        Title.Font.Style = []
        Title.Text.Strings = (
          #21592#24037#34917#36148#32479#35745)
        AxisVisible = False
        ClipPoints = False
        Frame.Visible = False
        View3DOptions.Elevation = 315
        View3DOptions.Orthogonal = False
        View3DOptions.Perspective = 0
        View3DOptions.Rotation = 360
        View3DWalls = False
        Align = alClient
        TabOrder = 1
        object BTbutie_view: TBitBtn
          Left = 16
          Top = 8
          Width = 75
          Height = 25
          Caption = #22270#26597#30475
          TabOrder = 0
          OnClick = BTbutie_viewClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333FFFFF3333333333700073333333FFF3777773F3FFF00030990BB03
            000077737337F373777733309990BBB0333333373337F3373F3333099990BBBB
            033333733337F33373F337999990BBBBB73337F33337F33337F330999990BBBB
            B03337F33337FFFFF7F3309999900000003337F33337777777F33099990A0CCC
            C03337F3337373F337F3379990AAA0CCC733373F3733373F373333090AAAAA0C
            033333737333337373333330AAAAAAA033333FF73F33333733FF00330AAAAA03
            3000773373FFFF73377733333700073333333333377777333333333333333333
            3333333333333333333333333333333333333333333333333333}
          NumGlyphs = 2
        end
        object Series2: TPieSeries
          Marks.ArrowLength = 8
          Marks.Visible = True
          SeriesColor = clRed
          XLabelsSource = #32508#21512#34917#36148#24635#21644
          OtherSlice.Text = 'Other'
          PieValues.DateTime = False
          PieValues.Name = 'Pie'
          PieValues.Multiplier = 1
          PieValues.Order = loNone
          PieValues.ValueSource = #32508#21512#34917#36148#24635#21644
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = #24037#36164#20998#31867#32479#35745
      ImageIndex = 2
      object DBGrid3: TDBGrid
        Left = 0
        Top = 0
        Width = 743
        Height = 65
        Align = alTop
        DataSource = DMgzdagl.DSQsum_xingshui
        ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
      object DBChart3: TDBChart
        Left = 0
        Top = 65
        Width = 743
        Height = 444
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clBlue
        Title.Font.Height = -32
        Title.Font.Name = #23435#20307
        Title.Font.Style = []
        Title.Text.Strings = (
          #24037#36164#20998#31867#32479#35745)
        Align = alClient
        TabOrder = 1
        object BTfenglei_view: TBitBtn
          Left = 16
          Top = 8
          Width = 75
          Height = 25
          Caption = #35270#22270#26597#30475
          TabOrder = 0
          OnClick = BTfenglei_viewClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333300030003
            0003333377737773777333333333333333333FFFFFFFFFFFFFFF770000000000
            0000777777777777777733039993BBB3CCC3337F737F737F737F37039993BBB3
            CCC3377F737F737F737F33039993BBB3CCC33F7F737F737F737F77079997BBB7
            CCC77777737773777377330399930003CCC3337F737F7773737F370399933333
            CCC3377F737F3333737F330399933333CCC33F7F737FFFFF737F770700077777
            CCC77777777777777377330333333333CCC3337F33333333737F370333333333
            0003377F33333333777333033333333333333F7FFFFFFFFFFFFF770777777777
            7777777777777777777733333333333333333333333333333333}
          NumGlyphs = 2
        end
        object Series3: THorizBarSeries
          Marks.ArrowLength = 20
          Marks.Visible = True
          SeriesColor = 16744448
          BarStyle = bsRectGradient
          BarWidthPercent = 30
          XValues.DateTime = False
          XValues.Name = 'Bar'
          XValues.Multiplier = 1
          XValues.Order = loNone
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1
          YValues.Order = loNone
        end
      end
    end
  end
end
