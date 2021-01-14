object MainForm: TMainForm
  Left = 16
  Top = 27
  Width = 800
  Height = 600
  ActiveControl = sgdKfzt
  Caption = #31435#26041#37202#24215#31649#29702#31995#32479
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  FormStyle = fsMDIForm
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 708
    Top = 0
    Width = 84
    Height = 554
    Align = alRight
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 0
    DesignSize = (
      84
      554)
    object lblTime: TStaticText
      Left = 0
      Top = 0
      Width = 84
      Height = 16
      Align = alTop
      Alignment = taCenter
      BevelEdges = [beLeft, beTop, beBottom]
      BorderStyle = sbsSingle
      Caption = '2002-01-01 01:01:01'
      Color = clBlack
      Font.Charset = ANSI_CHARSET
      Font.Color = clLime
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 0
    end
    object btnRefresh: TBitBtn
      Left = 2
      Top = 39
      Width = 75
      Height = 40
      Anchors = [akTop, akRight]
      Caption = #21047#26032#25151#24577
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnRefreshClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888888888888888888888000088888888888066660888888888066666
        6088000000066666608880444406666660888804440666666008888044406666
        0B08888804000000BF0888888080FBFBFB0888888880BFBFBF0888888880FBFB
        FB0888888880BFBFBF0888888880000000088888888888888888}
      Layout = blGlyphTop
    end
    object btnFtsm: TBitBtn
      Left = 2
      Top = 119
      Width = 75
      Height = 40
      Anchors = [akTop, akRight]
      Caption = #25151#24577#35828#26126
      TabOrder = 2
      OnClick = btnFtsmClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888880088888888888888008888888888888008888444888088800888844
        4888008008888888888800000888884478880000000088447888000000088884
        4888000000888888447800000887448874470000888447888444000888844788
        8444008888884488744708888888844444788888888888888888}
      Layout = blGlyphTop
    end
    object btnFtdh: TBitBtn
      Left = 2
      Top = 199
      Width = 75
      Height = 40
      Anchors = [akTop, akRight]
      Caption = #25151#24577#23548#33322
      TabOrder = 3
      OnClick = btnFtdhClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888488000080008000888888888888888884880000800080008888888888888
        8888488000080008000888888888888888884880000800080008888888888888
        8888488000080008000888888888888888884444444444444444888888888888
        8888888000080008000888888888888888888888888888888888}
      Layout = blGlyphTop
    end
    object btnYdRefresh: TBitBtn
      Left = 2
      Top = 79
      Width = 75
      Height = 40
      Anchors = [akTop, akRight]
      Caption = #21047#26032#39044#23450
      TabOrder = 4
      OnClick = btnYdRefreshClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888800000000000088880FFFFFFFFFF088880F00F00000F088880FFFFFFFFFF0
        88880F00F00000F088880FFFFFFFFFF088880FFFFFFF0FF088880F00FFF080F0
        88880F080F08080008440FF08080808880440000080808888844888880808888
        8844888888088888804488888880000008448888888888888888}
      Layout = blGlyphTop
    end
    object BitBtn17: TBitBtn
      Left = 2
      Top = 159
      Width = 75
      Height = 40
      Anchors = [akTop, akRight]
      Caption = #39044#23450#35828#26126
      TabOrder = 5
      OnClick = BitBtn17Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888888888880088888888888880B308888888888880B30888888888888800888
        88888888880B308888888888880B308888888888880B308888888888880BB308
        888888880080BB3088888880B3080BB308888880B30880B308888880BB300BB3
        088888880BBBBB30888888888000000888888888888888888888}
      Layout = blGlyphTop
    end
    object Chart2: TChart
      Left = 0
      Top = 300
      Width = 84
      Height = 254
      BackWall.Brush.Color = clWhite
      BackWall.Brush.Style = bsClear
      Gradient.EndColor = 16744576
      Title.Font.Charset = GB2312_CHARSET
      Title.Font.Color = clBlue
      Title.Font.Height = -12
      Title.Font.Name = #23435#20307
      Title.Font.Style = []
      Title.Text.Strings = (
        #23458#25151#20986#31199#29575)
      BottomAxis.LabelsAngle = 90
      BottomAxis.LabelsFont.Charset = GB2312_CHARSET
      BottomAxis.LabelsFont.Color = clBlack
      BottomAxis.LabelsFont.Height = -12
      BottomAxis.LabelsFont.Name = #23435#20307
      BottomAxis.LabelsFont.Style = []
      LeftAxis.Visible = False
      Legend.Alignment = laTop
      Legend.Font.Charset = GB2312_CHARSET
      Legend.Font.Color = clBlack
      Legend.Font.Height = -12
      Legend.Font.Name = #23435#20307
      Legend.Font.Style = []
      View3D = False
      Align = alBottom
      BorderStyle = bsSingle
      Color = clWhite
      TabOrder = 6
      object Series2: TBarSeries
        Marks.ArrowLength = 20
        Marks.Font.Charset = GB2312_CHARSET
        Marks.Font.Color = clBlack
        Marks.Font.Height = -12
        Marks.Font.Name = #23435#20307
        Marks.Font.Style = []
        Marks.Style = smsValue
        Marks.Visible = True
        SeriesColor = clRed
        XValues.DateTime = False
        XValues.Name = 'X'
        XValues.Multiplier = 1
        XValues.Order = loAscending
        YValues.DateTime = False
        YValues.Name = 'Bar'
        YValues.Multiplier = 1
        YValues.Order = loNone
      end
    end
    object lblPjfj: TStaticText
      Left = 1
      Top = 261
      Width = 52
      Height = 16
      Caption = #24179#22343#20215#65306
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 7
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 708
    Height = 554
    Align = alClient
    AutoSize = True
    BevelOuter = bvNone
    BorderWidth = 5
    ParentColor = True
    TabOrder = 1
    object PageControl1: TPageControl
      Left = 5
      Top = 5
      Width = 698
      Height = 544
      ActivePage = TabSheet1
      Align = alClient
      HotTrack = True
      Images = ImageList2
      MultiLine = True
      Style = tsButtons
      TabHeight = 30
      TabIndex = 0
      TabOrder = 0
      TabWidth = 100
      object TabSheet1: TTabSheet
        Caption = '(&1)'#23458#25151#29366#24577
        object Panel7: TPanel
          Left = 0
          Top = 0
          Width = 690
          Height = 504
          Align = alClient
          AutoSize = True
          BevelOuter = bvNone
          TabOrder = 0
          object Panel8: TPanel
            Left = 0
            Top = 460
            Width = 690
            Height = 44
            Align = alBottom
            AutoSize = True
            BevelOuter = bvNone
            BorderWidth = 5
            ParentColor = True
            TabOrder = 0
            object lblTdmc1: TStaticText
              Tag = 1
              Left = 3
              Top = 5
              Width = 135
              Height = 16
              AutoSize = False
              BorderStyle = sbsSingle
              Color = clYellow
              Font.Charset = GB2312_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = #23435#20307
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 0
              OnDblClick = OnChageColor
            end
            object lblTdmc2: TStaticText
              Tag = 2
              Left = 141
              Top = 5
              Width = 135
              Height = 16
              AutoSize = False
              BorderStyle = sbsSingle
              Color = clOlive
              Font.Charset = GB2312_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = #23435#20307
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 1
              OnDblClick = OnChageColor
            end
            object lblTdmc3: TStaticText
              Tag = 3
              Left = 280
              Top = 5
              Width = 135
              Height = 16
              AutoSize = False
              BorderStyle = sbsSingle
              Color = clSkyBlue
              Font.Charset = GB2312_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = #23435#20307
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 2
              OnDblClick = OnChageColor
            end
            object lblTdmc4: TStaticText
              Tag = 4
              Left = 418
              Top = 5
              Width = 135
              Height = 16
              AutoSize = False
              BorderStyle = sbsSingle
              Color = clTeal
              Font.Charset = GB2312_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = #23435#20307
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 3
              OnDblClick = OnChageColor
            end
            object lblTdmc5: TStaticText
              Tag = 5
              Left = 557
              Top = 5
              Width = 135
              Height = 16
              AutoSize = False
              BorderStyle = sbsSingle
              Color = clPurple
              Font.Charset = GB2312_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = #23435#20307
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 4
              OnDblClick = OnChageColor
            end
            object lblTdmc6: TStaticText
              Tag = 6
              Left = 3
              Top = 23
              Width = 135
              Height = 16
              AutoSize = False
              BorderStyle = sbsSingle
              Color = clGradientActiveCaption
              Font.Charset = GB2312_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = #23435#20307
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 5
              OnDblClick = OnChageColor
            end
            object lblTdmc7: TStaticText
              Tag = 7
              Left = 141
              Top = 23
              Width = 135
              Height = 16
              AutoSize = False
              BorderStyle = sbsSingle
              Color = clMaroon
              Font.Charset = GB2312_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = #23435#20307
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 6
              OnDblClick = OnChageColor
            end
            object lblTdmc8: TStaticText
              Tag = 8
              Left = 280
              Top = 23
              Width = 135
              Height = 16
              AutoSize = False
              BorderStyle = sbsSingle
              Color = clBlue
              Font.Charset = GB2312_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = #23435#20307
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 7
              OnDblClick = OnChageColor
            end
            object lblTdmc9: TStaticText
              Tag = 9
              Left = 418
              Top = 23
              Width = 135
              Height = 16
              AutoSize = False
              BorderStyle = sbsSingle
              Color = clFuchsia
              Font.Charset = GB2312_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = #23435#20307
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 8
              OnDblClick = OnChageColor
            end
            object lblTdmc10: TStaticText
              Tag = 10
              Left = 557
              Top = 23
              Width = 135
              Height = 16
              AutoSize = False
              BorderStyle = sbsSingle
              Color = clGreen
              Font.Charset = GB2312_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = #23435#20307
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 9
              OnDblClick = OnChageColor
            end
          end
          object sgdKfzt: TStringGrid
            Left = 0
            Top = 0
            Width = 690
            Height = 460
            Align = alClient
            Color = clFuchsia
            Ctl3D = True
            DefaultColWidth = 32
            DefaultRowHeight = 16
            FixedCols = 0
            FixedRows = 0
            Font.Charset = GB2312_CHARSET
            Font.Color = clWhite
            Font.Height = -14
            Font.Name = #40657#20307
            Font.Style = [fsBold]
            GridLineWidth = 3
            Options = [goFixedVertLine, goFixedHorzLine]
            ParentCtl3D = False
            ParentFont = False
            PopupMenu = PopupMenu1
            TabOrder = 1
            OnDblClick = sgdKfztDblClick
            OnDrawCell = sgdKfztDrawCell
            OnKeyPress = sgdKfztKeyPress
            OnMouseUp = sgdKfztMouseUp
            OnSelectCell = sgdKfztSelectCell
          end
        end
      end
      object TabSheet3: TTabSheet
        Caption = '(&2)'#23458#25151#20449#24687
        ImageIndex = 2
        object Panel6: TPanel
          Left = 0
          Top = 0
          Width = 537
          Height = 504
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
          object DBGrid1: TDBGrid
            Left = 0
            Top = 41
            Width = 537
            Height = 272
            Align = alTop
            Color = clMoneyGreen
            DataSource = dsKfzt
            FixedColor = clGradientActiveCaption
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'System'
            Font.Style = [fsBold]
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = GB2312_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = 'System'
            TitleFont.Style = [fsBold]
            Columns = <
              item
                Alignment = taRightJustify
                Expanded = False
                FieldName = 'D_KFBH'
                Title.Alignment = taCenter
                Title.Caption = #25151#38388#21495
                Width = 45
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'D_SJFJ'
                Title.Alignment = taCenter
                Title.Caption = #25151#20215
                Width = 50
                Visible = True
              end
              item
                Alignment = taRightJustify
                Expanded = False
                FieldName = 'D_KRXM'
                Title.Alignment = taCenter
                Title.Caption = #22995#21517
                Width = 105
                Visible = True
              end
              item
                Alignment = taRightJustify
                Expanded = False
                FieldName = 'D_DDRQ'
                Title.Alignment = taCenter
                Title.Caption = #21040#24215#26085#26399
                Width = 75
                Visible = True
              end
              item
                Alignment = taRightJustify
                Expanded = False
                FieldName = 'D_DDSJ'
                Title.Alignment = taCenter
                Title.Caption = #21040#24215#26102#38388
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'D_BJS'
                Title.Alignment = taCenter
                Title.Caption = #21322#20215#25968
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'D_QJS'
                Title.Alignment = taCenter
                Title.Caption = #20840#20215#25968
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'D_JJFJ'
                Title.Alignment = taCenter
                Title.Caption = #38388#25509#25151#20215
                Width = 50
                Visible = True
              end>
          end
          object Panel5: TPanel
            Left = 0
            Top = 313
            Width = 537
            Height = 191
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object DBGrid3: TDBGrid
              Left = 0
              Top = 41
              Width = 537
              Height = 150
              Align = alClient
              Color = clMoneyGreen
              DataSource = dsXxbd
              FixedColor = clGradientActiveCaption
              Font.Charset = GB2312_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'System'
              Font.Style = [fsBold]
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
              ParentFont = False
              TabOrder = 0
              TitleFont.Charset = GB2312_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -12
              TitleFont.Name = 'System'
              TitleFont.Style = [fsBold]
              OnDblClick = DBGrid3DblClick
              Columns = <
                item
                  Expanded = False
                  FieldName = 'D_KFBH'
                  Title.Alignment = taCenter
                  Title.Caption = #23458#25151#21495
                  Width = 60
                  Visible = True
                end
                item
                  Alignment = taRightJustify
                  Expanded = False
                  FieldName = 'D_KRXM'
                  Title.Alignment = taCenter
                  Title.Caption = #23458#20154#22995#21517
                  Visible = True
                end>
            end
            object Panel12: TPanel
              Left = 0
              Top = 0
              Width = 537
              Height = 41
              Align = alTop
              BevelInner = bvRaised
              BevelOuter = bvNone
              BorderWidth = 10
              Caption = #20449#24687#34917#30331
              Font.Charset = GB2312_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'System'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
            end
          end
          object Panel16: TPanel
            Left = 0
            Top = 0
            Width = 537
            Height = 41
            Align = alTop
            BevelInner = bvRaised
            BevelOuter = bvNone
            BorderWidth = 10
            Caption = #23458#25151#21015#34920
            Font.Charset = GB2312_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'System'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
          end
        end
        object Panel11: TPanel
          Left = 537
          Top = 0
          Width = 153
          Height = 504
          Align = alClient
          AutoSize = True
          BevelOuter = bvNone
          BorderWidth = 5
          TabOrder = 1
          object Chart1: TChart
            Left = 5
            Top = 5
            Width = 143
            Height = 367
            BackWall.Brush.Color = clWhite
            Gradient.Direction = gdBottomTop
            Gradient.EndColor = 16744576
            Title.Color = clYellow
            Title.Font.Charset = GB2312_CHARSET
            Title.Font.Color = clBlue
            Title.Font.Height = -21
            Title.Font.Name = #23435#20307
            Title.Font.Style = [fsBold]
            Title.Frame.Visible = True
            Title.Text.Strings = (
              #23458#25151#20998#37197)
            LeftAxis.LabelsFont.Charset = GB2312_CHARSET
            LeftAxis.LabelsFont.Color = clBlack
            LeftAxis.LabelsFont.Height = -12
            LeftAxis.LabelsFont.Name = #23435#20307
            LeftAxis.LabelsFont.Style = []
            Legend.Alignment = laTop
            Legend.Font.Charset = GB2312_CHARSET
            Legend.Font.Color = clBlack
            Legend.Font.Height = -12
            Legend.Font.Name = #23435#20307
            Legend.Font.Style = []
            View3DOptions.Elevation = 315
            View3DOptions.Orthogonal = False
            View3DOptions.Perspective = 0
            View3DOptions.Rotation = 360
            Align = alTop
            BevelOuter = bvNone
            BorderStyle = bsSingle
            Color = clWhite
            TabOrder = 0
            object Series1: TBarSeries
              ColorEachPoint = True
              Marks.ArrowLength = 8
              Marks.Font.Charset = GB2312_CHARSET
              Marks.Font.Color = clBlack
              Marks.Font.Height = -12
              Marks.Font.Name = #23435#20307
              Marks.Font.Style = []
              Marks.Style = smsLabelPercent
              Marks.Visible = True
              SeriesColor = clRed
              XValues.DateTime = False
              XValues.Name = 'X'
              XValues.Multiplier = 1
              XValues.Order = loAscending
              YValues.DateTime = False
              YValues.Name = 'Bar'
              YValues.Multiplier = 1
              YValues.Order = loNone
            end
          end
          object btnXxbd: TBitBtn
            Left = 82
            Top = 434
            Width = 75
            Height = 45
            Caption = #20449#24687#34917#30331'(&M)'
            TabOrder = 1
            OnClick = DBGrid3DblClick
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888888888888888888888888888888800080008000888888888888888
              8888888800888008888888880008000888888880000800008888888008000800
              8888888008000800888888008880888008888800888888800888880088888880
              0888888888888888888888888888888888888888888888888888}
            Layout = blGlyphTop
          end
          object btnKrlb: TBitBtn
            Left = 4
            Top = 434
            Width = 75
            Height = 45
            Caption = #23458#20154#21015#34920'(&K)'
            TabOrder = 2
            OnClick = N31Click
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              888844488888444888884F4800084F4800084488888844888888888888888888
              8888888888888888888844488888444888884F4800084F480008448888884488
              88888888888888888888888888888888888844488888444888884F4800084F48
              0008448888884488888888888888888888888888888888888888}
            Layout = blGlyphTop
          end
          object btnFjbg: TBitBtn
            Left = 82
            Top = 386
            Width = 75
            Height = 45
            Caption = #25151#20215#21464#26356'(&L)'
            TabOrder = 3
            OnClick = B20Click
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888888888888888888888888888888888888888888888888888888888
              8888888478888888888888748888844444888848888888444488884888888884
              4488884888888848448888748888448884888887444488888888888888888888
              8888888888888888888888888888888888888888888888888888}
            Layout = blGlyphTop
          end
          object btnDtbqj: TBitBtn
            Left = 4
            Top = 386
            Width = 75
            Height = 45
            Caption = #24403#22825#25151#20215'(&J)'
            TabOrder = 4
            OnClick = N56Click
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888888888888888888888888888888888888888888888888000000000
              8888888800888880888888888008888888888888880088888888888888800888
              8888888888008888888888888008888888888888008888808888888000000000
              8888888888888888888888888888888888888888888888888888}
            Layout = blGlyphTop
          end
        end
      end
      object TabSheet5: TTabSheet
        Caption = '(&3)'#22242#38431#31649#29702
        ImageIndex = 4
        object Panel4: TPanel
          Left = 605
          Top = 0
          Width = 85
          Height = 504
          Align = alRight
          AutoSize = True
          BevelOuter = bvNone
          BorderWidth = 5
          ParentColor = True
          TabOrder = 0
          object btnTdbd: TBitBtn
            Left = 5
            Top = 54
            Width = 75
            Height = 45
            Caption = #34917#30331#25151#38388
            TabOrder = 0
            OnClick = btnTdbdClick
            Glyph.Data = {
              7E010000424D7E01000000000000760000002800000018000000160000000100
              0400000000000801000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00800000000000
              0000000000080777777777777777777777700F77777777777777777777700F88
              888888888888888887700F88888888888888888887700F888888888888888888
              87700F88888888888888888887700F88000000000000000887700F880FFFFFFF
              FFFFFF0887700F880FFFF00000FFFF0887700F880FFFFFFFFFFFFF0887700F88
              0FFFF000000FFF0887700F880FFFFFFFFFFFFF0887700F880FFFFFFFFFF00F08
              87700F880F0000FFFFF00F0887700F880FFFFFFFFFFFFF0887700F8800000000
              0000000887700F88888888888888888887700F88888888888888888887700F88
              888888888888888887700FFFFFFFFFFFFFFFFFFFFF7080000000000000000000
              0008}
            Layout = blGlyphTop
          end
          object btnTdtf: TBitBtn
            Left = 5
            Top = 102
            Width = 75
            Height = 45
            Caption = #22242#38431#36864#25151
            TabOrder = 1
            OnClick = btnTdtfClick
            Glyph.Data = {
              7E010000424D7E01000000000000760000002800000018000000160000000100
              0400000000000801000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00800000000000
              0000000000080777777777777777777777700F77777777777777777777700F88
              888888888888888887700F88888888888888888887700F888888888888880F88
              87700F88880F88888888888887700F888000F8888880F88887700F888000F888
              880F888887700F8888000F88800F888887700F88888000F800F8888887700F88
              888800000F88888887700F8888888000F888888887700F88888800000F888888
              87700F88888000F80F88888887700F8880000F88800F888887700F880000F888
              8800F88887700F8800F8888888800F8887700F88888888888888888887700F88
              888888888888888887700FFFFFFFFFFFFFFFFFFFFF7080000000000000000000
              0008}
            Layout = blGlyphTop
          end
          object btnTdjz: TBitBtn
            Left = 5
            Top = 150
            Width = 75
            Height = 45
            Caption = #22242#38431#32467#24080
            TabOrder = 2
            OnClick = btnTdjzClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
              73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
              0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
              0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
              0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
              0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
              0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
              0333337F777777737F333308888888880333337F333333337F33330888888888
              03333373FFFFFFFF733333700000000073333337777777773333}
            Layout = blGlyphTop
            NumGlyphs = 2
          end
          object btnTdbj: TBitBtn
            Left = 5
            Top = 198
            Width = 75
            Height = 45
            Caption = #34917#20132#25276#37329
            TabOrder = 3
            OnClick = btnTdbjClick
            Glyph.Data = {
              7E010000424D7E01000000000000760000002800000018000000160000000100
              0400000000000801000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00800000000000
              0000000000080777777777777777777777700F77777777777777777777700F88
              888888888888888887700F88888888888888888887700F888888800000000888
              87700F88888880FFFFFF088887700F8888880FFFFFFFF08887700F888880FFFF
              FFFFF08887700F888880FFFFFFFFF08887700F88880FF0FFFFFFF08887700F88
              80FF00F0F0F0F08887700F88800080F0F0F0F08887700F88888880F0F0F0F088
              87700F88888880F0F0F0F08887700F88888880F0F0F0088887700F88888880F0
              F0F0888887700F8888888800F008888887700F88888888800888888887700F88
              888888888888888887700FFFFFFFFFFFFFFFFFFFFF7080000000000000000000
              0008}
            Layout = blGlyphTop
          end
          object btnTdbg: TBitBtn
            Left = 5
            Top = 245
            Width = 75
            Height = 45
            Caption = #26434#21333#24405#20837
            TabOrder = 4
            OnClick = OnZdlr
            Glyph.Data = {
              7E010000424D7E01000000000000760000002800000018000000160000000100
              0400000000000801000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00800000000000
              0000000000080777777777777777777777700F77777777777777777777700F88
              888888888888888887700F88888888888888888887700F888888888880888888
              87700F88888888880F08888887700F8888888880FFF0888887700F888888880F
              FFFF088887700F88888880F0FFF9F08887700F8888880F0F0F999F0887700F88
              8880F0F0FFF9F08887700F80000FFF0FFFFF000887700F80F088888888800B08
              87700F80BF0000000000BB0887700F80F0FBFBFBFBFB0B0887700F800FBFBFBF
              BFBFB00887700F80000000000000000887700F88888888888888888887700F88
              888888888888888887700FFFFFFFFFFFFFFFFFFFFF7080000000000000000000
              0008}
            Layout = blGlyphTop
          end
          object btnTdyx: TBitBtn
            Left = 5
            Top = 293
            Width = 75
            Height = 45
            Caption = #39044#20808#32467#24080
            TabOrder = 5
            OnClick = btnTdyxClick
            Glyph.Data = {
              7E010000424D7E01000000000000760000002800000018000000160000000100
              0400000000000801000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00800000000000
              0000000000080777777777777777777777700F77777777777777777777700F88
              888888888888888887700F88887000000078888887700F888804444444008888
              87700F88880444444408088887700F88880444444408088887700F8888044444
              4408088887700F88880444444408088887700F88880444444408088887700F88
              880444444408088887700F88000444444400008887700F888000000000008088
              87700F88880999F9990F088887700F88880F9FFF9F0F088887700F8888800000
              000F088887700F888880FFFFFFF0888887700F88888800000008888887700F88
              888888888888888887700FFFFFFFFFFFFFFFFFFFFF7080000000000000000000
              0008}
            Layout = blGlyphTop
          end
          object btnTdyf: TBitBtn
            Left = 5
            Top = 437
            Width = 75
            Height = 45
            Caption = #29992#25151#24773#20917
            TabOrder = 6
            OnClick = btnTdyfClick
            Glyph.Data = {
              7E010000424D7E01000000000000760000002800000018000000160000000100
              0400000000000801000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00800000000000
              0000000000080777777777777777777777700F77777777777777777777700F88
              888888888888888887700F88888888888888888887700F888888088888888888
              87700F88888800888888888887700F8888880F088888888887700F8888880FF0
              0008888887700F888800FFFFFFF0088887700F8880FFFFFFFFFFF08887700F88
              0FFFFFFFFFFFFF0887700F880FFFFFFFFFFFFF0887700F880FFFFFFFFFFFFF08
              87700F880FFFFFFFFFFFFF0887700F8880FFFFFFFFFFF08887700F888800FFFF
              FFF0088887700F88888800000008888887700F88888888888888888887700F88
              888888888888888887700FFFFFFFFFFFFFFFFFFFFF7080000000000000000000
              0008}
            Layout = blGlyphTop
          end
          object btnTdjd: TBitBtn
            Left = 5
            Top = 7
            Width = 75
            Height = 45
            Caption = #22242#38431#30331#35760
            TabOrder = 7
            OnClick = btnTdjdClick
            Glyph.Data = {
              7E010000424D7E01000000000000760000002800000018000000160000000100
              0400000000000801000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00800000000000
              0000000000080777777777777777777777700F77777777777777777777700F88
              888888888888888887700F88888888888888888887700F888888888888888888
              87700F88888888888888888887700F88888888888888888887700F8888888888
              8008008887700F88870088888008008887700F88707008888008008887700F88
              008800000000000887700F88008800000000000887700F887070088888888888
              87700F88870088888888888887700F88888888888888888887700F8888888888
              8888888887700F88888888888888888887700F88888888888888888887700F88
              888888888888888887700FFFFFFFFFFFFFFFFFFFFF7080000000000000000000
              0008}
            Layout = blGlyphTop
          end
          object btnTzcx: TBitBtn
            Left = 5
            Top = 341
            Width = 75
            Height = 45
            Caption = #22242#24080#26597#35810
            TabOrder = 8
            OnClick = btnTzcxClick
            Glyph.Data = {
              7E010000424D7E01000000000000760000002800000018000000160000000100
              0400000000000801000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00800000000000
              0000000000080777777777777777777777700F77777777777777777777700F88
              888888888888888887700F88000000770000008887700F80FFFFFF70FFFFFF08
              87700F80888888078888880887700F80FFFFFF70FFFFFF0887700F8088888807
              8888880887700F80FFFFFF70FFFFFF0887700F80888888078888880887700F80
              FFFFFF70FFFFFF0887700F80888888078888880887700F80FFFFFF70FFFFFF08
              87700F80888888078888880887700F80FFFFFF70FFFFFF0887700F80888FFF07
              FFF8880887700F80FFFFFF70FFFFFF0887700F88000000770000008887700F88
              888888888888888887700FFFFFFFFFFFFFFFFFFFFF7080000000000000000000
              0008}
            Layout = blGlyphTop
          end
          object btnTdqx: TBitBtn
            Left = 5
            Top = 389
            Width = 75
            Height = 45
            Caption = #21462#28040#25151#38388
            TabOrder = 9
            OnClick = btnTdqxClick
            Glyph.Data = {
              7E010000424D7E01000000000000760000002800000018000000160000000100
              0400000000000801000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00800000000000
              0000000000080777777777777777777777700F77777777777777777777700F88
              888888888888888887700F88888888888888888887700F888887000000078888
              87700F888880FFFFFFF0888887700F888880F0F0F0F0888887700F888880F0F0
              F0F0888887700F888880F0F0F0F0888887700F888880F0F0F0F0888887700F88
              8880F0F0F0F0888887700F888880F0F0F0F0888887700F888880F0F0F0F08888
              87700F888880FFFFFFF0888887700F88887000000000788887700F88880FFFFF
              FFFF088887700F88887000000000788887700F88888887000788888887700F88
              888888888888888887700FFFFFFFFFFFFFFFFFFFFF7080000000000000000000
              0008}
            Layout = blGlyphTop
          end
        end
        object Panel17: TPanel
          Left = 0
          Top = 0
          Width = 605
          Height = 504
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object Panel18: TPanel
            Left = 0
            Top = 0
            Width = 605
            Height = 41
            Align = alTop
            BevelInner = bvRaised
            BevelOuter = bvNone
            BorderWidth = 10
            Caption = #22242#38431#21015#34920
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'System'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object CheckBox1: TCheckBox
              Left = 16
              Top = 12
              Width = 137
              Height = 17
              Caption = #25152#26377#24050#36864#25151#22242#38431
              Checked = True
              State = cbChecked
              TabOrder = 0
              OnClick = CheckBox1Click
            end
          end
          object DBGrid2: TDBGrid
            Left = 0
            Top = 41
            Width = 605
            Height = 463
            Align = alClient
            Color = clMoneyGreen
            DataSource = dsQryTd
            FixedColor = clGradientActiveCaption
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'System'
            Font.Style = [fsBold]
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            TabOrder = 1
            TitleFont.Charset = GB2312_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = 'System'
            TitleFont.Style = [fsBold]
            Columns = <
              item
                Alignment = taRightJustify
                Expanded = False
                FieldName = 'D_KRXM'
                Title.Alignment = taCenter
                Title.Caption = #22242#38431#21517#31216
                Width = 200
                Visible = True
              end
              item
                Alignment = taRightJustify
                Expanded = False
                FieldName = 'D_DDRQ'
                Title.Alignment = taCenter
                Title.Caption = #21040#24215#26085#26399
                Width = 90
                Visible = True
              end
              item
                Alignment = taRightJustify
                Expanded = False
                FieldName = 'D_JDR'
                Title.Alignment = taCenter
                Title.Caption = #25509#24453#20154
                Width = 60
                Visible = True
              end
              item
                Alignment = taRightJustify
                Expanded = False
                FieldName = 'D_JDDW'
                Title.Alignment = taCenter
                Title.Caption = #25509#24453#21333#20301
                Width = 200
                Visible = True
              end>
          end
        end
      end
      object TabSheet10: TTabSheet
        Caption = '(&4)'#39044#23450#39184#39278
        ImageIndex = 6
        object Panel10: TPanel
          Left = 0
          Top = 0
          Width = 690
          Height = 37
          Align = alTop
          AutoSize = True
          BevelOuter = bvNone
          BorderWidth = 6
          TabOrder = 0
          object SpeedButton1: TSpeedButton
            Left = 0
            Top = 9
            Width = 22
            Height = 22
            Hint = #21069#19968#22825
            Caption = '<<'
            ParentShowHint = False
            ShowHint = True
            OnClick = SpeedButton1Click
          end
          object SpeedButton2: TSpeedButton
            Left = 128
            Top = 9
            Width = 22
            Height = 22
            Hint = #21518#19968#22825
            Caption = '>>'
            ParentShowHint = False
            ShowHint = True
            OnClick = SpeedButton2Click
          end
          object btnYdcysk: TBitBtn
            Left = 382
            Top = 6
            Width = 100
            Height = 25
            Caption = #25955#23458#39044#23450'(&N)'
            TabOrder = 0
            OnClick = N85Click
            Glyph.Data = {
              7E010000424D7E01000000000000760000002800000018000000160000000100
              0400000000000801000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00800000000000
              0000000000080777777777777777777777700F77777777777777777777700F88
              888888888888888887700F88888888888888888887700F888880088880088888
              87700F88880000000000888887700F88807777007777088887700F88807770FF
              0777088887700F8880770F77F077088887700F888070F7007F07088887700F88
              8800F7007F00888887700F8800070F77F070008887700F80777070FF07077708
              87700F80777077007707770887700F88077700000077708887700F8880077777
              7770088887700F88888000000008888887700F88888888888888888887700F88
              888888888888888887700FFFFFFFFFFFFFFFFFFFFF7080000000000000000000
              0008}
          end
          object btnYdcytd: TBitBtn
            Left = 486
            Top = 6
            Width = 100
            Height = 25
            Caption = #22242#38431#39044#23450'(&T)'
            TabOrder = 1
            OnClick = N86Click
            Glyph.Data = {
              7E010000424D7E01000000000000760000002800000018000000160000000100
              0400000000000801000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00800000000000
              0000000000080777777777777777777777700F77777777777777777777700F88
              888888888888888887700F88888880000088888887700F8888800FFFFF008888
              87700F88880FFFFFFFFF088887700F8880FFFFFFFFFFF08887700F8880FF0FFF
              FFFFF08887700F880FFFF0FFFFFFFF0887700F880FFFFF0FFFFFFF0887700F88
              0FFFFFF000000F0887700F880FFFFFFFFFFFFF0887700F880FFFFFFFFFFFFF08
              87700F8880FFFFFFFFFFF08887700F8880FFFFFFFFFFF08887700F88880FFFF0
              FFFF088887700F8888800FFFFF00888887700F88888880000088888887700F88
              888888888888888887700FFFFFFFFFFFFFFFFFFFFF7080000000000000000000
              0008}
          end
          object dtpCyyd: TDateTimePicker
            Left = 24
            Top = 10
            Width = 100
            Height = 20
            CalAlignment = dtaLeft
            Date = 37444.9333118056
            Time = 37444.9333118056
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkDate
            ParseInput = False
            TabOrder = 2
            OnChange = dtpCyydChange
          end
          object btnYdcylb: TBitBtn
            Left = 590
            Top = 6
            Width = 100
            Height = 25
            Caption = #39044#23450#26597#35810'(&Q)'
            TabOrder = 3
            OnClick = btnYdcylbClick
            Glyph.Data = {
              7E010000424D7E01000000000000760000002800000018000000160000000100
              0400000000000801000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00800000000000
              0000000000080777777777777777777777700F77777777777777777777700F88
              888888888888888887700F88000000770000008887700F80FFFFFF70FFFFFF08
              87700F80888888078888880887700F80FFFFFF70FFFFFF0887700F8088888807
              8888880887700F80FFFFFF70FFFFFF0887700F80888888078888880887700F80
              FFFFFF70FFFFFF0887700F80888888078888880887700F80FFFFFF70FFFFFF08
              87700F80888888078888880887700F80FFFFFF70FFFFFF0887700F80888FFF07
              FFF8880887700F80FFFFFF70FFFFFF0887700F88000000770000008887700F88
              888888888888888887700FFFFFFFFFFFFFFFFFFFFF7080000000000000000000
              0008}
          end
          object RadioButton1: TRadioButton
            Left = 160
            Top = 13
            Width = 49
            Height = 17
            Caption = #20840#37096
            Checked = True
            TabOrder = 4
            TabStop = True
            OnClick = RadioButton1Click
          end
          object RadioButton2: TRadioButton
            Left = 214
            Top = 13
            Width = 43
            Height = 17
            Caption = #20013#21320
            TabOrder = 5
            OnClick = RadioButton2Click
          end
          object RadioButton3: TRadioButton
            Left = 264
            Top = 13
            Width = 49
            Height = 17
            Caption = #26202#19978
            TabOrder = 6
            OnClick = RadioButton3Click
          end
        end
        object Panel13: TPanel
          Left = 0
          Top = 37
          Width = 690
          Height = 467
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object sgdYdcy: TStringGrid
            Left = 0
            Top = 0
            Width = 690
            Height = 264
            Align = alTop
            Color = clGreen
            ColCount = 6
            DefaultColWidth = 60
            DefaultRowHeight = 45
            FixedCols = 0
            FixedRows = 0
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = #23435#20307
            Font.Style = [fsBold]
            GridLineWidth = 2
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goThumbTracking]
            ParentFont = False
            TabOrder = 0
            OnDblClick = sgdYdcyDblClick
            OnDrawCell = sgdYdcyDrawCell
            OnSelectCell = sgdYdcySelectCell
          end
          object Panel15: TPanel
            Left = 0
            Top = 264
            Width = 690
            Height = 41
            Align = alTop
            BevelInner = bvRaised
            BevelOuter = bvNone
            BorderWidth = 10
            Caption = #39184#39278#22242#38431#39044#23450#24773#20917
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object Panel23: TPanel
            Left = 0
            Top = 305
            Width = 690
            Height = 162
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 2
            object DBGrid4: TDBGrid
              Left = 0
              Top = 0
              Width = 690
              Height = 162
              Align = alClient
              Color = clMoneyGreen
              DataSource = dsCyTdMaster
              FixedColor = clGradientActiveCaption
              Font.Charset = GB2312_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'System'
              Font.Style = [fsBold]
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
              ParentFont = False
              TabOrder = 0
              TitleFont.Charset = GB2312_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -12
              TitleFont.Name = 'System'
              TitleFont.Style = [fsBold]
              OnDblClick = DBGrid4DblClick
              Columns = <
                item
                  Expanded = False
                  FieldName = 'D_RZBZ'
                  Title.Alignment = taCenter
                  Title.Caption = #26159#21542#30830#35748
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'D_SYRQ'
                  Title.Alignment = taCenter
                  Title.Caption = #29992#39184#26085#26399
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'D_SJDM'
                  Title.Alignment = taCenter
                  Title.Caption = #29992#39184#26102#27573
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'D_KRXM'
                  Title.Alignment = taCenter
                  Title.Caption = #39044#23450#20154
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'D_YCBZ'
                  Title.Alignment = taCenter
                  Title.Caption = #29992#39184#26631#20934
                  Visible = True
                end>
            end
          end
        end
      end
      object TabSheet11: TTabSheet
        Caption = '(&5)'#39044#23450#23458#25151
        ImageIndex = 7
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 690
          Height = 37
          Align = alTop
          AutoSize = True
          BevelOuter = bvNone
          BorderWidth = 6
          TabOrder = 0
          object btnPrev: TSpeedButton
            Left = 6
            Top = 9
            Width = 22
            Height = 22
            Hint = #21069#19968#22825
            Caption = '<<'
            ParentShowHint = False
            ShowHint = True
            OnClick = btnPrevClick
          end
          object btnNext: TSpeedButton
            Left = 134
            Top = 9
            Width = 22
            Height = 22
            Hint = #21518#19968#22825
            Caption = '>>'
            ParentShowHint = False
            ShowHint = True
            OnClick = btnNextClick
          end
          object dtpYdrq: TDateTimePicker
            Left = 30
            Top = 10
            Width = 100
            Height = 20
            CalAlignment = dtaLeft
            Date = 37444.9333118056
            Time = 37444.9333118056
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkDate
            ParseInput = False
            TabOrder = 0
            OnChange = dtpYdrqChange
          end
          object btnYdkfsk: TBitBtn
            Left = 389
            Top = 6
            Width = 100
            Height = 25
            Caption = #25955#23458#39044#23450
            TabOrder = 1
            OnClick = N87Click
            Glyph.Data = {
              7E010000424D7E01000000000000760000002800000018000000160000000100
              0400000000000801000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00800000000000
              0000000000080777777777777777777777700F77777777777777777777700F88
              888888888888888887700F88888888888888888887700F888880088880088888
              87700F88880000000000888887700F88807777007777088887700F88807770FF
              0777088887700F8880770F77F077088887700F888070F7007F07088887700F88
              8800F7007F00888887700F8800070F77F070008887700F80777070FF07077708
              87700F80777077007707770887700F88077700000077708887700F8880077777
              7770088887700F88888000000008888887700F88888888888888888887700F88
              888888888888888887700FFFFFFFFFFFFFFFFFFFFF7080000000000000000000
              0008}
          end
          object btnYdkftd: TBitBtn
            Left = 493
            Top = 6
            Width = 100
            Height = 25
            Caption = #22242#38431#39044#23450
            TabOrder = 2
            OnClick = N88Click
            Glyph.Data = {
              7E010000424D7E01000000000000760000002800000018000000160000000100
              0400000000000801000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00800000000000
              0000000000080777777777777777777777700F77777777777777777777700F88
              888888888888888887700F88888880000088888887700F8888800FFFFF008888
              87700F88880FFFFFFFFF088887700F8880FFFFFFFFFFF08887700F8880FF0FFF
              FFFFF08887700F880FFFF0FFFFFFFF0887700F880FFFFF0FFFFFFF0887700F88
              0FFFFFF000000F0887700F880FFFFFFFFFFFFF0887700F880FFFFFFFFFFFFF08
              87700F8880FFFFFFFFFFF08887700F8880FFFFFFFFFFF08887700F88880FFFF0
              FFFF088887700F8888800FFFFF00888887700F88888880000088888887700F88
              888888888888888887700FFFFFFFFFFFFFFFFFFFFF7080000000000000000000
              0008}
          end
          object btnKfydlb: TBitBtn
            Left = 597
            Top = 6
            Width = 100
            Height = 25
            Caption = #39044#23450#26597#35810
            TabOrder = 3
            OnClick = btnKfydlbClick
            Glyph.Data = {
              7E010000424D7E01000000000000760000002800000018000000160000000100
              0400000000000801000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00800000000000
              0000000000080777777777777777777777700F77777777777777777777700F88
              888888888888888887700F88000000770000008887700F80FFFFFF70FFFFFF08
              87700F80888888078888880887700F80FFFFFF70FFFFFF0887700F8088888807
              8888880887700F80FFFFFF70FFFFFF0887700F80888888078888880887700F80
              FFFFFF70FFFFFF0887700F80888888078888880887700F80FFFFFF70FFFFFF08
              87700F80888888078888880887700F80FFFFFF70FFFFFF0887700F80888FFF07
              FFF8880887700F80FFFFFF70FFFFFF0887700F88000000770000008887700F88
              888888888888888887700FFFFFFFFFFFFFFFFFFFFF7080000000000000000000
              0008}
          end
        end
        object Panel19: TPanel
          Left = 0
          Top = 37
          Width = 690
          Height = 467
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object sgdYdkf: TStringGrid
            Left = 0
            Top = 0
            Width = 690
            Height = 467
            Align = alClient
            Color = clWhite
            DefaultColWidth = 32
            DefaultRowHeight = 32
            FixedCols = 0
            FixedRows = 0
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = #23435#20307
            Font.Style = [fsBold]
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goThumbTracking]
            ParentFont = False
            TabOrder = 0
            OnDblClick = sgdYdkfDblClick
            OnDrawCell = sgdYdkfDrawCell
            OnSelectCell = sgdYdkfSelectCell
          end
        end
      end
      object TabSheet12: TTabSheet
        Caption = '(&6)'#39044#23450#20250#22330
        ImageIndex = 8
        object Panel21: TPanel
          Left = 0
          Top = 0
          Width = 690
          Height = 504
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object sgdYdhc: TStringGrid
            Left = 0
            Top = 38
            Width = 690
            Height = 466
            Align = alClient
            Color = clWhite
            ColCount = 8
            DefaultColWidth = 60
            DefaultRowHeight = 20
            FixedColor = clMoneyGreen
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = #23435#20307
            Font.Style = []
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSizing, goColSizing, goRowMoving, goColMoving]
            ParentFont = False
            TabOrder = 0
            OnDblClick = sgdYdhcDblClick
            OnDrawCell = sgdYdhcDrawCell
            OnSelectCell = sgdYdhcSelectCell
          end
          object Panel9: TPanel
            Left = 0
            Top = 0
            Width = 690
            Height = 38
            Align = alTop
            AutoSize = True
            BevelOuter = bvNone
            BorderWidth = 6
            TabOrder = 1
            object btnYdhc: TBitBtn
              Left = 388
              Top = 7
              Width = 100
              Height = 25
              Caption = #39044#23450#20250#22330'(&N)'
              TabOrder = 0
              OnClick = N9Click
              Glyph.Data = {
                7E010000424D7E01000000000000760000002800000018000000160000000100
                0400000000000801000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00800000000000
                0000000000080777777777777777777777700F77777777777777777777700F88
                888888888888888887700F88888888888888888887700F888880088880088888
                87700F88880000000000888887700F88807777007777088887700F88807770FF
                0777088887700F8880770F77F077088887700F888070F7007F07088887700F88
                8800F7007F00888887700F8800070F77F070008887700F80777070FF07077708
                87700F80777077007707770887700F88077700000077708887700F8880077777
                7770088887700F88888000000008888887700F88888888888888888887700F88
                888888888888888887700FFFFFFFFFFFFFFFFFFFFF7080000000000000000000
                0008}
            end
            object btnHcjs: TBitBtn
              Left = 492
              Top = 7
              Width = 100
              Height = 25
              Caption = #20250#22330#32467#31639'(&J)'
              TabOrder = 1
              OnClick = btnHcjsClick
              Glyph.Data = {
                7E010000424D7E01000000000000760000002800000018000000160000000100
                0400000000000801000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00800000000000
                0000000000080777777777777777777777700F77777777777777777777700F88
                888888888888888887700F80000000000000000887700F80FFFFF0FF0FFFFF08
                87700F80F000FF00FF000F0887700F80FFFFFF00FFFFFF0887700F80F0000F00
                F0000F0887700F80FFFFFF00FFFFFF0887700F80FFFFFF000FFFFF0887700F80
                9999F0FF0F99990887700F80F99FFF00FFF99F0887700F80F99FFF00FFFF9908
                87700F80F99FFF00FF9FF90887700F80999FFF00FF99990887700F80F99FFF00
                FFF99F0887700F80FFFFF0FF0FFFFF0887700F80000000000000000887700F88
                888888888888888887700FFFFFFFFFFFFFFFFFFFFF7080000000000000000000
                0008}
            end
            object btnYdhccx: TBitBtn
              Left = 596
              Top = 6
              Width = 100
              Height = 25
              Caption = #39044#23450#26597#35810'(&Q)'
              TabOrder = 2
              OnClick = btnYdhccxClick
              Glyph.Data = {
                7E010000424D7E01000000000000760000002800000018000000160000000100
                0400000000000801000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00800000000000
                0000000000080777777777777777777777700F77777777777777777777700F88
                888888888888888887700F88000000770000008887700F80FFFFFF70FFFFFF08
                87700F80888888078888880887700F80FFFFFF70FFFFFF0887700F8088888807
                8888880887700F80FFFFFF70FFFFFF0887700F80888888078888880887700F80
                FFFFFF70FFFFFF0887700F80888888078888880887700F80FFFFFF70FFFFFF08
                87700F80888888078888880887700F80FFFFFF70FFFFFF0887700F80888FFF07
                FFF8880887700F80FFFFFF70FFFFFF0887700F88000000770000008887700F88
                888888888888888887700FFFFFFFFFFFFFFFFFFFFF7080000000000000000000
                0008}
            end
          end
        end
      end
    end
  end
  object MainMenu1: TMainMenu
    Images = ImageList1
    Left = 280
    Top = 216
    object A1: TMenuItem
      Caption = '(&A)'#39044#23450
      object A11: TMenuItem
        Caption = #39044#23450#20154#20449#24687
        OnClick = A11Click
      end
      object N89: TMenuItem
        Caption = '-'
      end
      object N9: TMenuItem
        Caption = #39044#23450#20250#22330
        ImageIndex = 6
        OnClick = N9Click
      end
      object N83: TMenuItem
        Caption = #39044#23450#20250#22330#26597#35810
        OnClick = btnYdhccxClick
      end
      object N91: TMenuItem
        Caption = '-'
      end
      object N85: TMenuItem
        Caption = #25955#23458#39184#39278#39044#23450
        OnClick = N85Click
      end
      object N86: TMenuItem
        Caption = #22242#38431#39184#39278#39044#23450
        ImageIndex = 15
        OnClick = N86Click
      end
      object N84: TMenuItem
        Caption = #39184#39278#39044#23450#26597#35810
        OnClick = btnYdcylbClick
      end
      object N93: TMenuItem
        Caption = '-'
      end
      object N87: TMenuItem
        Caption = #25955#23458#23458#25151#39044#23450
        OnClick = N87Click
      end
      object N88: TMenuItem
        Caption = #22242#38431#23458#25151#39044#23450
        ImageIndex = 16
        OnClick = N88Click
      end
      object N90: TMenuItem
        Caption = #23458#25151#39044#23450#26597#35810
        OnClick = btnKfydlbClick
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object A18: TMenuItem
        Caption = #39044#23450#21333#25972#29702
        Enabled = False
        ImageIndex = 17
        OnClick = A18Click
      end
    end
    object B1: TMenuItem
      Caption = '(&B)'#25509#24453
      object B11: TMenuItem
        Caption = #25955#23458#30331#35760
        ImageIndex = 18
        object B111: TMenuItem
          Caption = #20869#23486#30331#35760
          OnClick = B111Click
        end
        object B112: TMenuItem
          Caption = #22806#23486#30331#35760
          OnClick = B112Click
        end
        object B113: TMenuItem
          Caption = #20813#36153#30331#35760
          OnClick = B113Click
        end
      end
      object B12: TMenuItem
        Caption = #22242#38431#30331#35760
        ImageIndex = 7
        OnClick = B12Click
      end
      object B13: TMenuItem
        Caption = #35843#25442#25151#38388
        OnClick = B13Click
      end
      object B15: TMenuItem
        Caption = #22242#38431#34917#30331
        OnClick = B15Click
      end
      object N36: TMenuItem
        Caption = '-'
      end
      object N38: TMenuItem
        Caption = #25955#23458#21462#28040
        OnClick = N38Click
      end
      object N23: TMenuItem
        Caption = #22242#38431#21462#28040
        OnClick = N23Click
      end
      object N14: TMenuItem
        Caption = '-'
      end
      object B16: TMenuItem
        Caption = #20449#24687#20462#25913
        ImageIndex = 19
        OnClick = B16Click
      end
      object N17: TMenuItem
        Caption = '-'
      end
      object B20: TMenuItem
        Caption = #25151#20215#21464#26356
        OnClick = B20Click
      end
      object N20: TMenuItem
        Caption = '-'
      end
      object B21: TMenuItem
        Caption = #20449#24687#23548#20986
        ImageIndex = 14
        OnClick = B21Click
      end
    end
    object C1: TMenuItem
      Caption = '(&C)'#32467#24080
      object N4: TMenuItem
        Caption = #25955#23458#32467#24080
        ImageIndex = 8
        OnClick = N4Click
      end
      object N6: TMenuItem
        Caption = #22242#38431#36864#25151
        OnClick = N6Click
      end
      object N7: TMenuItem
        Caption = #22242#38431#32467#24080
        ImageIndex = 20
        OnClick = N7Click
      end
      object N8: TMenuItem
        Caption = #26434#21333#24405#20837
        ImageIndex = 21
        object N79: TMenuItem
          Caption = #25955#23458#26434#21333#24405#20837
          OnClick = N79Click
        end
        object N82: TMenuItem
          Caption = #22242#38431#26434#21333#24405#20837
          OnClick = N82Click
        end
      end
      object N10: TMenuItem
        Caption = #38750#23507#23458#32467#24080
        ImageIndex = 22
        OnClick = N10Click
      end
      object N11: TMenuItem
        Caption = #39044#20808#32467#24080
        object N71: TMenuItem
          Caption = #25955#23458#39044#20808#32467#24080
          OnClick = N71Click
        end
        object N72: TMenuItem
          Caption = #22242#38431#39044#20808#32467#24080
          OnClick = N72Click
        end
      end
      object N12: TMenuItem
        Caption = #38646#23458#26410#32467
        OnClick = N12Click
      end
      object N13: TMenuItem
        Caption = #25276#37329#31649#29702
        object N30: TMenuItem
          Caption = #25955#23458#34917#20132
          OnClick = N30Click
        end
        object N69: TMenuItem
          Caption = #22242#38431#34917#20132
          OnClick = N69Click
        end
        object N32: TMenuItem
          Caption = #25955#23458#21464#26356
          OnClick = N32Click
        end
        object N70: TMenuItem
          Caption = #22242#38431#21464#26356
          OnClick = N70Click
        end
        object N92: TMenuItem
          Caption = #25276#37329#20652#20132
          OnClick = N92Click
        end
      end
      object N16: TMenuItem
        Caption = #23458#25143#24212#25910#27454
        object N73: TMenuItem
          Caption = #23458#25143#39044#20132#27454
          OnClick = N73Click
        end
        object N66: TMenuItem
          Caption = #24212#25910#27454#24405#20837
          OnClick = N66Click
        end
        object N74: TMenuItem
          Caption = #24212#25910#27454#32467#24080
          OnClick = N74Click
        end
      end
    end
    object D1: TMenuItem
      Caption = '(&D)'#26597#35810
      object N31: TMenuItem
        Caption = #23458#20154#26597#35810
        OnClick = N31Click
      end
      object N18: TMenuItem
        Caption = #25955#24080#26597#35810
        ImageIndex = 9
        OnClick = N18Click
      end
      object N68: TMenuItem
        Caption = #22242#24080#26597#35810
        ImageIndex = 23
        OnClick = N68Click
      end
      object N22: TMenuItem
        Caption = #22242#38431#29992#25151
        OnClick = N22Click
      end
      object N97: TMenuItem
        Caption = #26434#21333#26597#35810
        OnClick = OnZdlrcx
      end
      object N98: TMenuItem
        Caption = #38750#23507#23458#32467#24080#26597#35810
        OnClick = OnFykjzcx
      end
      object N99: TMenuItem
        Caption = #20250#22330#32467#31639#26597#35810
        OnClick = OnHcjscx
      end
      object N21: TMenuItem
        Caption = '-'
      end
      object N54: TMenuItem
        Caption = #24403#21069#25910#22238
        ImageIndex = 28
        OnClick = N54Click
      end
      object N55: TMenuItem
        Caption = #26085#25910#26126#32454
        OnClick = N55Click
      end
      object N56: TMenuItem
        Caption = #20170#26085#25151#20215#27719#25253
        OnClick = N56Click
      end
      object N58: TMenuItem
        Caption = #20170#26085#21592#24037#32467#24080
        OnClick = N58Click
      end
      object N42: TMenuItem
        Caption = '-'
      end
      object N94: TMenuItem
        Caption = #23458#25143#24212#25910#27454#26597#35810
        OnClick = N94Click
      end
      object N44: TMenuItem
        Caption = #23458#25143#24212#25910#24635#24080
        OnClick = N44Click
      end
      object N50: TMenuItem
        Caption = #23458#25143#24212#25910#26126#32454
        OnClick = N50Click
      end
      object N61: TMenuItem
        Caption = #23458#25143#32467#24080#26126#32454
        OnClick = N61Click
      end
      object N43: TMenuItem
        Caption = '-'
      end
      object N27: TMenuItem
        Caption = #31163#24215#23458#20154#26597#35810
        OnClick = N27Click
      end
      object N28: TMenuItem
        Caption = #31163#24215#23458#20154#24080#21333
        OnClick = N28Click
      end
      object N96: TMenuItem
        Caption = '-'
      end
      object N95: TMenuItem
        Caption = #30005#35805#36153#26597#35810
        OnClick = N95Click
      end
      object N29: TMenuItem
        Caption = '-'
      end
      object N33: TMenuItem
        Caption = #23458#20154#30041#35328
        ImageIndex = 24
        OnClick = N33Click
      end
      object N81: TMenuItem
        Caption = #30005#35805#21495#30721#31807
        OnClick = N81Click
      end
      object N34: TMenuItem
        Caption = #21015#36710#26102#21051#34920
        OnClick = N34Click
      end
      object N35: TMenuItem
        Caption = #33322#29677#26102#21051#34920
        OnClick = N35Click
      end
      object N37: TMenuItem
        Caption = #19990#30028#38047
        ImageIndex = 25
        OnClick = N37Click
      end
      object N100: TMenuItem
        Caption = #30041#35328#26495
        OnClick = OnLyb
      end
    end
    object E1: TMenuItem
      Caption = '(&E)'#22812#23457
      object N39: TMenuItem
        Caption = #22812#38388#23457#26680
        ImageIndex = 10
        OnClick = N39Click
      end
      object N62: TMenuItem
        Caption = '-'
      end
      object N40: TMenuItem
        Caption = #39184#21381#19978#20132
        OnClick = N40Click
      end
      object N41: TMenuItem
        Caption = #36130#21153#32467#21333
        OnClick = N41Click
      end
      object N63: TMenuItem
        Caption = #39044#20132#27454#19978#20132
        Visible = False
        OnClick = N63Click
      end
    end
    object F1: TMenuItem
      Caption = '(&F)'#25253#34920
      object N67: TMenuItem
        Caption = #38646#23458#24212#25910#27454
        OnClick = N67Click
      end
      object N78: TMenuItem
        Caption = #38750#23507#23458#28040#36153
        OnClick = N78Click
      end
      object N45: TMenuItem
        Caption = '-'
      end
      object N46: TMenuItem
        Caption = #23458#25151#26085#25253#34920
        ImageIndex = 29
        OnClick = N46Click
      end
      object N47: TMenuItem
        Caption = #20170#26085#33829#19994#34920
        ImageIndex = 11
        OnClick = N47Click
      end
      object N48: TMenuItem
        Caption = #21382#21490#33829#19994#34920
        OnClick = N48Click
      end
      object N75: TMenuItem
        Caption = #32467#24080#32479#35745#34920
        OnClick = N75Click
      end
      object N19: TMenuItem
        Caption = #28040#36153#39033#30446#34920
        OnClick = N19Click
      end
      object N49: TMenuItem
        Caption = '-'
      end
      object N51: TMenuItem
        Caption = #27004#23618#20986#31199#34920
        ImageIndex = 26
        OnClick = N51Click
      end
      object N52: TMenuItem
        Caption = #30005#35805#32479#35745#34920
        OnClick = N52Click
      end
      object N53: TMenuItem
        Caption = #21322#20840#20215#25253#34920
        OnClick = N53Click
      end
      object N59: TMenuItem
        Caption = #39184#21381#19978#20132#34920
        OnClick = N59Click
      end
      object N64: TMenuItem
        Caption = #39044#20132#27454#19978#20132
        Visible = False
        OnClick = N64Click
      end
      object N60: TMenuItem
        Caption = #36130#21153#32467#21333#34920
        OnClick = N60Click
      end
      object N57: TMenuItem
        Caption = #21592#24037#24320#25151#34920
        ImageIndex = 27
        OnClick = N57Click
      end
    end
    object G1: TMenuItem
      Caption = '(&G)'#31995#32479
      object G11: TMenuItem
        Caption = #31995#32479#23450#20041
        object G1101: TMenuItem
          Caption = #27004#23618#23450#20041
          OnClick = G1101Click
        end
        object G1102: TMenuItem
          Caption = #25151#22411#23450#20041
          OnClick = G1102Click
        end
        object G1103: TMenuItem
          Caption = #22320#21306#23450#20041
          OnClick = G1103Click
        end
        object G1104: TMenuItem
          Caption = #22269#21035#23450#20041
          OnClick = G1104Click
        end
        object G1105: TMenuItem
          Caption = #27665#26063#23450#20041
          OnClick = G1105Click
        end
        object G1106: TMenuItem
          Caption = #35777#20214#23450#20041
          OnClick = G1106Click
        end
        object G1107: TMenuItem
          Caption = #31614#35777#23450#20041
          OnClick = G1107Click
        end
        object G1108: TMenuItem
          Caption = #23458#25143#20998#31867
          OnClick = G1108Click
        end
        object G1109: TMenuItem
          Caption = #39184#21381#23450#20041
          Visible = False
          OnClick = G1109Click
        end
        object G1110: TMenuItem
          Caption = #20250#22330#23450#20041
          OnClick = G1110Click
        end
        object G1111: TMenuItem
          Caption = #20449' '#29992' '#21345
          OnClick = G1111Click
        end
      end
      object G12: TMenuItem
        Caption = #37096#38376#35774#32622
        OnClick = G12Click
      end
      object G13: TMenuItem
        Caption = #21592#24037#26723#26696
        ImageIndex = 30
        OnClick = G13Click
      end
      object G14: TMenuItem
        Caption = #23458#25143#26723#26696
        OnClick = G14Click
      end
      object G15: TMenuItem
        Caption = #23458#25151#23450#20041
        OnClick = G15Click
      end
      object G17: TMenuItem
        Caption = #28040#36153#39033#30446
        OnClick = G17Click
      end
      object G18: TMenuItem
        Caption = #40657' '#21517' '#21333
        OnClick = G18Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object G19: TMenuItem
        Caption = #25968#25454#22791#20221
        OnClick = G19Click
      end
      object G20: TMenuItem
        Caption = #25968#25454#24674#22797
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object G21: TMenuItem
        Caption = #21475#20196#35774#32622
        ImageIndex = 31
        OnClick = G21Click
      end
      object G22: TMenuItem
        Caption = #37325#26032#30331#24405
        OnClick = G22Click
      end
      object N76: TMenuItem
        Caption = '-'
      end
      object N77: TMenuItem
        Caption = #31995#32479#35774#32622
        ImageIndex = 12
        OnClick = N77Click
      end
      object N65: TMenuItem
        Caption = #31995#32479#36864#20986
        OnClick = N65Click
      end
    end
    object H1: TMenuItem
      Caption = '(&H)'#24110#21161
      object H11: TMenuItem
        Caption = #24110#21161#20869#23481
        ImageIndex = 13
        ShortCut = 112
        OnClick = H11Click
      end
      object H12: TMenuItem
        Caption = #35775#38382#31449#28857
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object H13: TMenuItem
        Caption = #20851#20110#26412#36719#20214
        OnClick = H13Click
      end
    end
    object I1: TMenuItem
      Caption = '(&I)'#27169#22359#36716#25442
      object N24: TMenuItem
        Caption = #39184#39278#31649#29702#31995#32479
        ImageIndex = 14
        OnClick = N24Click
      end
      object N25: TMenuItem
        Caption = #23089#20048#31649#29702#31995#32479
        Enabled = False
      end
      object N26: TMenuItem
        Caption = #27927#28020#31649#29702#31995#32479
        Enabled = False
      end
      object N80: TMenuItem
        Caption = #30005#35805#35745#36153#31995#32479
        Enabled = False
        OnClick = N80Click
      end
      object N15: TMenuItem
        Caption = #36149#23486#21345#31649#29702#31995#32479
        OnClick = N15Click
      end
    end
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'txt'
    FileName = 'Xx'
    Filter = #25991#26412#25991#20214'(*.txt)|*.txt'
    InitialDir = 'c:\lggl'
    Title = #20449#24687#23548#20986
    Left = 376
    Top = 208
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 280
    Top = 248
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 320
    Top = 248
    object menuNbdj: TMenuItem
      Caption = #20869#23486#30331#35760
      OnClick = menuNbdjClick
    end
    object menuWbdj: TMenuItem
      Caption = #22806#23486#30331#35760
      OnClick = menuWbdjClick
    end
    object menuMfdj: TMenuItem
      Caption = #20813#36153#30331#35760
      OnClick = menuMfdjClick
    end
    object menuTddj: TMenuItem
      Caption = #22242#38431#30331#35760
      OnClick = menuTddjClick
    end
    object MenuItem1: TMenuItem
      Caption = '-'
    end
    object menuXxxg: TMenuItem
      Caption = #20449#24687#20462#25913
      OnClick = menuXxxgClick
    end
    object menuDhfj: TMenuItem
      Caption = #35843#25442#25151#38388
      OnClick = menuDhfjClick
    end
    object menuYksy: TMenuItem
      Caption = #26434#21333#24405#20837
      OnClick = menuYksyClick
    end
    object menuJz: TMenuItem
      Caption = #25955#23458#32467#24080
      OnClick = menuJzClick
    end
    object MenuItem2: TMenuItem
      Caption = '-'
    end
    object menuCyxf: TMenuItem
      Caption = #25276#37329#28040#36153
      OnClick = menuCyxfClick
    end
    object MenuItem3: TMenuItem
      Caption = '-'
    end
    object menuOkf: TMenuItem
      Caption = #35774#32622#25104#31354'  '#25151
      OnClick = menuOkfClick
    end
    object menuWxf: TMenuItem
      Caption = #35774#32622#25104#32500#20462#25151
      OnClick = menuWxfClick
    end
    object menuZk: TMenuItem
      Caption = #28165#31354#25152#26377#33039#31354#25151
      OnClick = menuZkClick
    end
  end
  object ImageList1: TImageList
    DrawingStyle = dsTransparent
    Left = 424
    Top = 248
    Bitmap = {
      494C010120002200040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000009000000001001000000000000048
      000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000
      000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000
      000000000000FF7FFF7FFF7FFF7FFF7FFF7FF75EF75E007C0000FF031F001F00
      0000FF7FFF7F00000000EF3DEF3D007C0000FF7FFF7FFF7FFF7F0000FF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000003C0000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000F3C0F3C0F3C0F3C0F3C
      0F3C0F3C00000F3CFF7FFF7FFF7FFF7FFF7FF75EF75E007C0000FF0300000000
      0000FF7FFF7FF75EFF7FEF3DEF3D007C0000FF7FFF7FFF7FFF7F0000FF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000003C0000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0F3C0F3C0F3C0F3C0F3C0F3C
      0F3C0F3C0F3C0F3C0F3CFF7FFF7FFF7FFF7FF75EF75E007C0000FF031F001F00
      0000FF7F00000000FF7FEF3DEF3D007C0000FF7FFF7FFF7FFF7F0000FF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000003C0000F75EF75EF75EF75EF75E
      F75EF75EF75EF75EFF7FFF7FFF7FFF7FFF7F007C007C007C007C007C007C007C
      007C00000F3C0F3C0F3C0F3CFF7FFF7FFF7FF75EF75E007C0000FF031F001F00
      0000FF7F00000000FF7FEF3DEF3D007C0000FF7FFF7FFF7FFF7F0000FF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000003C0000F75EF75EF75EF75EF75E
      F75EF75EF75EF75EFF7FFF7FFF7FFF7FFF7F00000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7F0F3C0F3C0F3C0F3C0F3CFF7FFF7FF75EF75E007C0000FF031F001F00
      0000FF7FF75EFF7FFF7FEF3DEF3D007C00000000000000000000000000000000
      0000000000000000F75EFF7FFF7FFF7F0000003C0000F75EF75EF75EF75EF75E
      F75EF75EF75EF75EFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7F0F3C0F3C0F3C0F3C0F3CFF7FF75EF75E007C0000FF031F001F00
      000000000000FF7FFF7FEF3DEF3D007C00000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7F0000FF7FFF7FFF7F0000003C0000F75EF75EF75EF75EF75E
      F75EF75EF75EF75EFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FF75E0F3C0F3C0F3C0F3C0000F75EF75E007C0000FF031F000000
      00000000FF7FFF7FFF7FEF3DEF3D007C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FF75EFF7FFF7F0000003C0000F75EF75EF75EF75EF75E
      F75EF75EF75EF75EFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000
      007C007CFF7FFF7FF75E0F3C0F3C0F3C0000F75EF75E007C0000FF031F000000
      0000F75EFF7FFF7FFF7FEF3DEF3D007C0000FF7F0000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F0000FF7FFF7F0000003C0000F75EF75E0000007C007C
      007C007C007C007C007C007C007C0000FF7FFF7FFF7FFF7F0000000000000000
      EF3DEF3D0000FF7FFF7FF75E0F3C0F3C0000F75EF75E007C0000FF031F000000
      0000FF7FFF7FFF7FFF7FEF3DEF3D007C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FF75EFF7F0000003C0000F75EF75E007C007C007C
      007C007C007C007C007C007C007CFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7F00000000FF7FFF7FF75E0F3C0000F75EF75E007C0000FF031F001F00
      0000FF7FFF7FFF7FFF7FEF3DEF3DFF7FFF7FFF7FFF7F0000FF7FFF7FFF7F0000
      000000000000FF7FFF7FFF7F0000FF7F0000003C0000F75E0000007C007C007C
      007C007C007C007C007C007C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7F1F7C0000FF7FFF7FF75E0000F75EF75E007C0000FF0300000000
      0000FF7FFF7FFF7FFF7FEF3DEF3DFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
      00000000FF7F0000FF7FFF7FFF7FF75E0000003C0000F75E007C007C007C007C
      007C007C007C007C007C007CFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7F0000EF3D00000000FF7FFF7FFF7F00000000007C0000FF03FF7FFF7F
      FF7FFF7FFF7FFF7FFF7FEF3DEF3DFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000003C00000000007C007C007C007C
      007C007C007C007C007C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7F00000000000000001F7C0000FF7FFF7FFF7FFF7F007C0000FF03FF7FFF7F
      FF7FFF7FFF7FFF7FFF7FEF3DEF3DFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000003C0000007C007C007C007C007C
      007C007C007C007C007CFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF03FF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000FF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F00000000003C00000000003C
      00000000003C00000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF03FF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F00000000FF7F
      00000000FF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000F75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75E00000000000000000000E07FE07FE07F
      E07FE07FE07FE07F000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF03FF03FF03FF03FF03FF03
      FF03FF03FF03FF03FF03FF03FF030000000000000000EF3DEF3D0000EF3DEF3D
      00000000EF3DEF3D0000EF3DEF3D00000000000000000000E07FE07FE07FE07F
      E07FE07FE07FE07FE07FE07F0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000F75E0F000F00EF3DF75E0F000F00
      F75E0F000F00EF3DF75E0F000F00F75E000000000000E07FE07FE07FE07F0000
      000000000000E07FE07FE07FE07F000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000F000F00EF3D00000F000F00
      00000F000F00EF3D00000F000F00000000000000E07FE07FE07FE07F0000E07F
      E07FE07FE07F0000E07FE07FE07F000000000000000000000000000000000000
      0000000000000000EF3DEF3D0000000000000000FF03FF03FF03FF03E001FF03
      FF03E001E001FF03FF03FF03FF0300000000F75E0F000F00EF3DF75E0F000F00
      F75E0F000F00EF3DF75E0F000F00F75E00000000E07FE07FE07F0000E07FE07F
      E07FE07FE07FE07F0000E07FE07FE07F00000000000000000000000000000000
      000000000000FF7FFF7FFF7F0000EF3D00000000FF7FFF7FFF7FFF7FFF7FFF7F
      E001FF7FFF7FE001FF7FFF7FFF7F0000000000000F000F00EF3D00000F000F00
      00000F000F00EF3D00000F000F0000000000E07FE07FE07FE07FE07FE07FE07F
      E07FE07FE07FE07FE07FE07FE07FE07F0000000000000000EF3D000000000000
      EF3D0000FF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7FE001
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000F75E0F000F00EF3DF75E0F000F00
      F75E0F000F00EF3DF75E0F000F00F75E0000E07FE07FE07FE07FE07FE07FE07F
      E07FE07FE07FE07FE07FE07FE07FE07F00000000000000000000000000000000
      0000F75EFF7FFF7FFF7F00000000FF7FEF3D0000FF03FF03FF03FF03FF03FF03
      FF03FF03FF03FF03FF03FF03FF030000000000000F000F00EF3D00000F000F00
      00000F000F00EF3D00000F000F0000000000E07FE07FE07FE07FE07FE07FE07F
      E07FE07FE07FE07FE07FE07FE07FE07F0000F75EF75EF75EF75EF75EF75EF75E
      F75EF75EFF7FFF7FFF7F00000000FF7FEF3D0000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000F75E0F000F00EF3DF75E0F000F00
      F75E0F000F00EF3DF75E0F000F00F75E0000E07FE07FE07FE07FE07F00000000
      E07FE07F00000000E07FE07FE07FE07F00000000000000000000000000000000
      0000F75EFF7FFF7FFF7F00000000FF7F000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FE0010000000000000F000F00000000000F000F00
      00000F000F00EF3D00000F000F00000000000000E07FE07FE07FE07F00000000
      E07FE07F00000000E07FE07FE07FE07F00000000000000000000000000000000
      00000000FF7FFF7FFF7FFF7FFF7F000000000000FF03FF03FF03FF03FF03FF03
      FF03FF03FF03FF03FF03FF03FF0300000000F75EF75EF75EF75EF75E0F000F00
      F75E0F000F00EF3DF75E0F000F00F75E00000000E07FE07FE07FE07F00000000
      E07FE07F00000000E07FE07FE07FE07F00000000000000000000000000000000
      000000000000FF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000000000000F000F00
      00000F000F00EF3D00000F000F000000000000000000E07FE07FE07FE07FE07F
      E07FE07FE07FE07FE07FE07FE07F000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000F75EF75EF75EF75EF75EF75EF75E
      F75E0F000F00EF3DF75EF75EF75EF75E000000000000E07FE07FE07FE07FE07F
      E07FE07FE07FE07FE07FE07F0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000000000000000000000000000
      00000F000F000000000000000000000000000000000000000000E07FE07FE07F
      E07FE07FE07FE07FE07F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000F75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75E0000000000000000000000000000E07F
      E07FE07FE07F0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EF3DEF3DEF3DEF3DEF3D
      EF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3D00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E03DE03DE03DE03DE03DE03DE03D
      007CE03DE03DE03DE03DE03DE03DE03D00000000000000000000000000000000
      0000000000000000000000000000EF3DEF3D0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E03DE03DE03DE03DE03DE03DE03D
      E03DE03DE03DE03DE03DE03DE03DE03D00000000007C007C007C007C007C007C
      007C007C007C007C007C007C007C0000EF3D0000FF7FFF7F007C007CFF7F1F00
      1F00FF7F1F7C1F7CFF7FE001E001FF7F00000000000000000000000000000000
      000000000000000000000000000000000000E03DE03DE03DE03DE03DE03DE03D
      007CE03DE03DE03DE03DE03DE03DE03D00000000003CFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F007C0000EF3D0000FF7FFF7F007C007CFF7F1F00
      1F00FF7F1F7C1F7CFF7FE001E001FF7F00000000000000000000000000000000
      000000000000000000000000000000000000E03DE03DE03DE03DE03DE03DE03D
      0000E03DE03DE03DE03DE03DE03DE03D00000000003CFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F007C0000EF3D0000FF7FFF7F007C007CFF7F1F00
      1F00FF7F1F7C1F7CFF7FE001E001FF7F000000000000000000000000EF3D0000
      000000000000EF3D00000000000000000000E03DE03DE03DE03DE03DE03D0000
      F75EE03DE03DE03DE03DE03DE03DE03D00000000003CFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F007C0000EF3D0000FF7FFF7F007C007CFF7F1F00
      1F00FF7F1F7C1F7CFF7FE001E001FF7F000000000000000000000000E07FE07F
      00000000E0010000EF3D0000000000000000E03DE03DE03DE03DE03DE03DE03D
      007CE03DE03DE03DE03DE03DE03DE03D00000000003CFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F007C0000EF3D0000FF7FFF7F007C007CFF7F1F00
      1F00FF7F1F7C1F7CFF7FE001E001FF7F000000000000000000000000E07FE07F
      0000E0010000007C0000EF3D000000000000E03DE03D0000E07FE07FE07FE07F
      007CE07FE07FE07FE07F0000E03DE03D00000000003CFF7FFF7FFF7FFF7FFF7F
      0000FF7FFF7FFF7FFF7FFF7F007C0000EF3D0000FF7FFF7F007C007CFF7F1F00
      1F00FF7F1F7C1F7CFF7FE001E001FF7F00000000000000001F001F000000E07F
      0000E001007C007C007CEF3D000000000000E03D0000E07FE07FE07FE07F0000
      F75EE03DE07FE07FE07FE07F0000E03D00000000003CFF7FFF7FFF7FFF7FFF7F
      0000FF7FFF7FFF7FFF7FFF7F007C0000EF3D0000FF7FFF7F007C007CFF7F1F00
      1F00FF7F1F7C1F7CFF7FE001E001FF7F00000000000000001F001F001F000000
      00000000007C007C007C00000000000000000000E07FE07FE07FE07FE07FE07F
      0000E07FE07FE07FE07FE07FE07F000000000000003CFF7FFF7FFF7FFF7FFF7F
      0000FF7FFF7FFF7FFF7FFF7F007C0000EF3D0000FF7FFF7F007C007CFF7F1F00
      1F00FF7FFF7FFF7FFF7FE001E001FF7F0000000000000000000000001F001F00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000003CFF7FFF7FFF7FFF7FFF7F
      0000FF7FFF7FFF7FFF7FFF7F007C0000EF3D0000FF7FFF7F007C007CFF7F1F00
      1F00FF7FFF7FFF7FFF7FE001E001FF7F00000000000000001F001F001F000000
      1F7C1F7C1F7C1F7C1F7C00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000003CFF7FFF7FFF7FFF7FFF7F
      0000FF7FFF7FFF7FFF7FFF7F007C0000EF3D0000FF7FFF7FFF7FFF7FFF7F1F00
      1F00FF7FFF7FFF7FFF7FE001E001FF7F00000000000000001F001F0000001F7C
      1F7C1F7C1F7C1F7C1F7CEF3D0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000003CFF7FFF7FFF7FFF7FFF7F
      0000FF7FFF7FFF7FFF7FFF7F007C0000EF3D0000FF7FFF7FFF7FFF7FFF7F1F00
      1F00FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000001F7C1F7C
      1F7C1F7C00001F7C000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000003CFF7FFF7FFF7FFF7FFF7F
      0000FF7FFF7FFF7FFF7FFF7F007C0000EF3D0000FF7FFF7FFF7FFF7FFF7F1F00
      1F00FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000001F7C1F7C
      1F7C1F7C1F7C0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000003C00000000000000000000
      000000000000000000000000007C0000EF3D0000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000007C007C007C007C007C007C
      007C007C007C007C007C007C007C000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F75EF75E007C0000FF031F001F00
      00000000000000000000EF3DEF3D007C000000000000000000000000FF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000003C0000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7F00000000000000000000000000000F3C0F3C0F3C0F3C0F3C
      0F3C0F3C00000F3C00000000000000000000F75EF75E007C0000FF0300000000
      000000000000F75E0000EF3DEF3D007C000000000000000000000000FF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000003C0000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7F0000000000000000000000000F3C0F3C0F3C0F3C0F3C0F3C
      0F3C0F3C0F3C0F3C0F3C0000000000000000F75EF75E007C0000FF031F001F00
      00000000000000000000EF3DEF3D007C000000000000000000000000FF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000003C0000F75EF75EF75EF75EF75E
      F75EF75EF75EF75E00000000000000000000007C007C007C007C007C007C007C
      007C00000F3C0F3C0F3C0F3C000000000000F75EF75E007C0000FF031F001F00
      00000000000000000000EF3DEF3D007C000000000000000000000000FF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000003C0000F75EF75EF75EF75EF75E
      F75EF75EF75EF75E0000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7F0F3C0F3C0F3C0F3C0F3C00000000F75EF75E007C0000FF031F001F00
      00000000F75E00000000EF3DEF3D007C00000000000000000000000000000000
      0000000000000000F75EFF7FFF7FFF7F0000003C0000F75EF75EF75EF75EF75E
      F75EF75EF75EF75E0000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7F0F3C0F3C0F3C0F3C0F3C0000F75EF75E007C0000FF031F001F00
      00000000000000000000EF3DEF3D007C00000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7F0000FF7FFF7FFF7F0000003C0000F75EF75EF75EF75EF75E
      F75EF75EF75EF75E0000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FF75E0F3C0F3C0F3C0F3C0000F75EF75E007C0000FF031F000000
      00000000000000000000EF3DEF3D007C00000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FF75EFF7FFF7F0000003C0000F75EF75EF75EF75EF75E
      F75EF75EF75EF75E000000000000000000000000000000000000000000000000
      007C007CFF7FFF7FF75E0F3C0F3C0F3C0000F75EF75E007C0000FF031F000000
      0000F75E000000000000EF3DEF3D007C000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F0000FF7FFF7F0000003C0000F75EF75E0000007C007C
      007C007C007C007C007C007C007C000000000000000000000000000000000000
      EF3DEF3D0000FF7FFF7FF75E0F3C0F3C0000F75EF75E007C0000FF031F000000
      00000000000000000000EF3DEF3D007C000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FF75EFF7F0000003C0000F75EF75E007C007C007C
      007C007C007C007C007C007C007C00000000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7F00000000FF7FFF7FF75E0F3C0000F75EF75E007C0000FF031F001F00
      00000000000000000000EF3DEF3D00000000000000000000FF7FFF7FFF7F0000
      000000000000FF7FFF7FFF7F0000FF7F0000003C0000F75E0000007C007C007C
      007C007C007C007C007C007C00000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7F1F7C0000FF7FFF7FF75E0000F75EF75E007C0000FF0300000000
      00000000000000000000EF3DEF3D00000000000000000000FF7FFF7FFF7F0000
      00000000FF7F0000FF7FFF7FFF7FF75E0000003C0000F75E007C007C007C007C
      007C007C007C007C007C007C0000000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7F0000EF3D00000000FF7FFF7F000000000000007C0000FF0300000000
      00000000000000000000EF3DEF3D000000000000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000003C00000000007C007C007C007C
      007C007C007C007C007C00000000000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7F00000000000000001F7C00000000000000000000007C0000FF0300000000
      00000000000000000000EF3DEF3D000000000000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000003C0000007C007C007C007C007C
      007C007C007C007C007C000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      0000000000000000000000000000000000000000000000000000FF0300000000
      00000000000000000000000000000000000000000000000000000000FF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000003C00000000003C
      00000000003C000000000000000000000000000000000000FF7FFF7FFF7F0000
      0000000000000000000000000000000000000000000000000000FF0300000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF7F00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      EF3D000000000000000000000000000000000000000000000000EF3DEF3DF75E
      F75EEF3DEF3D0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F75EF75EF75EF75EF75EF75EF75E
      FF7FF75E00000000000000000000000000000000000000000000F75EEF3D0000
      F75EEF3D0000EF3D000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7FE07FFF7F00000000E07FFF7F
      E07FFF7FE07F00000000FF7FE07FFF7F0000F75EF75EF75EF75EF75EF75EF75E
      FF7FF75EF75E0000000000000000000000000000000000000000F75EEF3D0000
      F75EEF3D0000EF3D000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7FE07FFF7FE07FFF7FE07FFF7F
      E07FFF7FE07FFF7FE07FFF7FE07FFF7F0000F75EF75EF75EF75EF75EF75EF75E
      FF7FF75EF75EF75EF75E0000000000000000000000000000F75E0000F75E0000
      F75E0000EF3DEF3D000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7FE07FFF7FE07FFF7FE07FFF7F
      E07FFF7FE07FFF7FE07FFF7FE07FFF7F0000F75E000000000000000000000000
      0000F75EF75EF75EF75EF75EF75E00000000000000000000F75E0000F75EEF3D
      F75E0000EF3DEF3D000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7FE07FFF7FE07FFF7FE07FFF7F
      E07FFF7FE07FFF7FE07FFF7FE07FFF7F0000000000000000FF7FFF7FFF7FFF7F
      00000000F75EF75EF75EF75EF75E00000000000000000000F75EEF3DF75EEF3D
      F75E0000EF3D0000EF3D00000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7FE07F00000000000000000000
      0000000000000000000000000000FF7F0000000000000000FF7FFF7F0000FF7F
      FF7FFF7F0000F75EF75EF75EF75E00000000000000000000F75EEF3DF75E0000
      F75E000000000000EF3D00000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7FE07FFF7FE07FFF7FE07FFF7F
      E07FFF7FE07FFF7FE07FFF7FE07FFF7F00000000000000000000FF7FFF7F0000
      FF7FFF7FFF7F0000F75EF75EF75E0000000000000000F75E0000F75EF75EEF3D
      EF3DEF3DEF3DEF3DEF3D00000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7FE07F00000000000000000000
      0000000000000000000000000000FF7F00000000000000000000000000000000
      0000000000000000F75EF75E00000000000000000000F75EEF3D00000000F75E
      F75EEF3D0000EF3DEF3D00000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7FE07FFF7FE07FFF7FE07FFF7F
      E07FFF7FE07FFF7FE07FFF7FE07FFF7F0000000000000000FF7F00000000F75E
      000000000000F75E0000F75EF75EF75E0000000000000000F75E00000000F75E
      F75EF75E0000EF3DEF3D00000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7FE07F00000000000000000000
      0000000000000000000000000000FF7F0000000000000000FF7FFF7F0000F75E
      000000000000F75E0000F75EF75EF75E000000000000F75EF75EF75EF75EF75E
      F75EF75EF75EF75E0000EF3D0000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7FE07FFF7FE07FFF7FE07FFF7F
      E07FFF7FE07FFF7FE07FFF7FE07FFF7F00000000000000000000FF7FF75E0000
      F75EF75EF75E0000F75EFF7FFF7F0000000000000000F75EF75EF75E00000000
      000000000000F75EF75E00000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7FE07FFF7FE07FFF7FE07FFF7F
      E07FFF7FE07FFF7FE07FFF7FE07FFF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F75EF75E0000
      00000000F75E0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000EF3D0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000EF3D00000000000000000000000000000000000000000F000F000F00
      0F000F000F000F00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000F75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75E00000000000000000000000000000000
      0000FF7FEF3D0000000000000000000000000000000000000F000F00FF7FFF7F
      FF7FFF7FFF7FFF7F0F000F00000000000000000000000000F75EF75EF75EF75E
      EF3DEF3DEF3DEF3DF75E000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7F00000000FF7F0000000000000000000000000000EF3DEF3D
      FF7FFF7FEF3DEF3DEF3D0000000000000000000000000F000F000F00FF7FFF7F
      FF7FFF7FFF7FFF7F0F000F000F00000000000000000000000000000000000000
      000000000000000000000000F75E000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000EF3D0000F75EFF7F
      FF7FFF7F00000000EF3DEF3D00000000000000000F000F000F000F000F000F00
      FF7FFF7FFF7F0F000F000F000F0000000000000000001F7C1F7C1F7C1F7C0000
      00000000EF3D0F3C0F3C0F3C0000F75E0000000000000000F75EF75EF75EF75E
      F75EF75E000000000000F75E000000000000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FF75EEF3DEF3D0000000000000F000F000F000F000F000F00
      FF7FFF7FFF7F0F000F000F000F000F000000000000001F7C1F7C1F7C0000FF7F
      0000FF7FFF7FEF3D0F3C0F3C0000F75EF75E000000000000F75EF75EF75EF75E
      F75EF75E000000000000F75E00000000000000000000FF7FFF7FFF7FFF7FF75E
      1F00FF7FFF7FFF7FFF7FFF7FEF3DEF3D00000F000F000F000F000F000F000F00
      FF7FFF7FFF7F0F000F000F000F000F000000000000001F7C1F7C0000F75EF75E
      FF7FFF7FFF7FFF7FEF3D0F3C0000F75EF75E0000000000000000000000000000
      000000000000000000000000000000000000EF3DFF7FFF7FFF7FFF7FFF7F1F00
      1F00FF7FFF7FFF7FFF7FFF7FF75EEF3DEF3D0F000F000F000F000F000F000F00
      FF7FFF7FFF7F0F000F000F000F000F000000000000001F7C1F7C0000F75EFF7F
      EF3D0000FF7FFF7FEF3D0F3C0000F75E00000000000000000000000000000000
      000000000000000000000000000000000000F75EFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000EF3D0F000F000F000F000F000F000F00
      FF7FFF7FFF7F0F000F000F000F000F0000000000000000001F7C0000FF7FFF7F
      0000F75EF75EFF7FEF3D0F3C0000000000000000000000000000000000000000
      0000000000000000F75E0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      1F00FF7FFF7FFF7FFF7FFF7FFF7F0000EF3D0F000F000F000F000F000F000F00
      FF7FFF7FFF7F0F000F000F000F000F00000000000000000000001F7C0000F75E
      0000FF7FF75EEF3D1F7C000000000000FF7F00000000000000000000F75EF75E
      F75EF75EF75EEF3DF75E0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      1F001F00FF7FFF7FFF7FFF7FFF7F0000EF3D00000F000F000F000F00FF7FFF7F
      FF7FFF7FFF7F0F000F000F000F000F0000000F3C0F3CEF3DEF3D00001F7C0000
      000000001F7C000000001F7C1F7CEF3D000000000000000000000000F75EF75E
      F75EF75EF75EEF3DF75E0000000000000000F75EFF7FFF7FFF7FFF7F1F001F00
      F75E1F001F00FF7FFF7FFF7FFF7F0000000000000F000F000F000F000F000F00
      0F000F000F000F000F000F000F000F0000000000000000000000000000001F7C
      000000000000FF7F0000000000000000000000000000000000000000F75EF75E
      F75EF75EF75EEF3DF75E0000000000000000EF3DFF7FFF7FFF7FFF7F1F00FF7F
      FF7F1F001F00FF7FFF7FFF7FF75E0000000000000F000F000F000F000F00FF7F
      FF7FFF7F0F000F000F000F000F00000000001F7C1F7C1F7C0F3C0F3C1F7C0000
      1F7C1F7CEF3D1F7C1F7C1F7C0F3C0F3C00000000000000000000000000000000
      0000000000000000F75E00000000000000000000EF3DFF7FFF7FFF7FF75E1F00
      1F001F00FF7FFF7FFF7FFF7F000000000000000000000F000F000F000F00FF7F
      FF7FFF7FFF7F0F000F000F00000000000000FF7F1F7CFF7FFF7F1F7C00000000
      0000000000001F7C1F7C1F7C0F3C000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EF3DFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FF75E00000000000000000000000000000F000F000F00FF7F
      FF7FFF7F0F000F000F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EF3DF75EFF7F
      FF7FFF7FEF3DEF3D000000000000000000000000000000000000000000000F00
      0F000F000F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001F00
      EF3DF75E00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000001F001F00
      0000EF3DEF3DF75E00000000000000000000000000000F000F000F000F000F00
      0F000F0000000F0000000000000000000000000000000000000000000000FF7F
      FF7FFF7F00000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001F001F000000
      000000000000EF3DEF3DF75E00000000000000000F000F000F000F000F000F00
      0F0000000F000F000F0000000000000000000000000000000000FF7FFF7FFF7F
      0000FF7FFF7FFF7F000000000000000000000000000000000000EF3D0000EF3D
      EF3DEF3D00000000EF3D0000EF3DEF3DEF3D0000000000001F001F0000000000
      0000EF3DF75E00000000EF3D0000000000000F000F000F000F000F000F000F00
      0F0000000F000F000F000F00000000000000000000000000FF7FFF7FFF7FFF7F
      0000FF7FFF7FFF7FFF7F0000000000000000000000000000003C000000000F3C
      0F3CEF3D0000003C000000000F3C0F3CEF3D000000001F001F0000000000007C
      F75E0000EF3DEF3DF75E00000000000000000000000000000000000000000000
      00000F000F000F000F000F000F000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000E07F003C000000000F3C
      0F3CEF3D0000003C000000000F3C0F3CEF3D000000001F00000000000000F75E
      0000007C007C0000EF3DEF3DF75E0000000000000000FF7FEF3DEF3DEF3DFF7F
      FF7FFF7F0F000F000F000F000F000F00000000000000FF7FFF7FFF7FFF7FFF7F
      FF7F00000000FF7FFF7FFF7F000000000000000000000000E07F0000E07F0F3C
      0F3CEF3D0000003C000000000F3C0F3CEF3D000000000000000000001F7CEF3D
      EF3DF75E0000007C007C0000EF3D0000000000000000FF7FEF3DEF3DEF3DEF3D
      FF7FFF7FFF7F0F000F000F000F000F0000000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000003CE07F0000E07F
      0F3CEF3D0000003C000000000F3C0F3CEF3D00000000000000001F7CF75E1F7C
      0000EF3DEF3DF75E0000007C007C0000000000000000FF7FEF3DEF3DEF3DFF7F
      FF7FFF7FFF7FF75E0F000F000F000F0000000000FF7F00000000FF7FFF7FFF7F
      00000000FF7FFF7F00000000FF7F00000000000000000000003C000000000F3C
      E07FEF3D0000003C0000E07F0F3C0F3CEF3D0000000000001F7CF75E1F7C1F7C
      1F7C1F7C0000EF3DEF3D00000000000000000000000000000000000000000000
      00000000FF7FFF7FF75E0F000F000F0000000000FF7FFF7FFF7FFF7FFF7F0000
      0000007CFF7FFF7FFF7FFF7FFF7F00000000000000000000003C000000000F3C
      0F3CE07F0000003CE07F0000E07F0F3CEF3D000000001F7CF75E1F7C1F7C1F7C
      1F7C1F7C1F7C1F7C000000000000000000000000000000000000000000000000
      000000000000FF7FFF7FF75E0F000F00000000000000FF7FFF7FFF7F00000000
      FF7FFF7F007CFF7FFF7FFF7F000000000000000000000000003C000000000F3C
      0F3CEF3DE07FE07F00000000007CE07FEF3D00001F7CF75E1F7C1F7C1F7C1F7C
      1F7C1F7C1F7C1F7C1F7C0000000000000000000000000000000000000F000F00
      0000000000000000FF7FFF7FF75E0F00000000000000FF7FFF7F00000000FF7F
      FF7FFF7FFF7F007CFF7FFF7F000000000000000000000000003C000000001F7C
      1F7CEF3D0000003C000000000000000000000000F75E1F7C1F7C1F7C1F7C1F7C
      1F7C1F7C1F7C1F7C000000000000000000000000000000000000000000000000
      00000000000000000000FF7FFF7FF75E0000000000000000FF7FFF7FFF7FFF7F
      0000FF7FFF7FFF7FFF7F0000000000000000000000000000003C000000000000
      000000000000003C000000000000000000000000000000001F7C1F7C1F7C1F7C
      1F7C1F7C1F7C0000000000000000000000000000000000000000000000000000
      000000000F000F0000000000FF7FFF7F00000000000000000000FF7FFF7FFF7F
      0000FF7FFF7FFF7F00000000000000000000000000000000007C000000000000
      000000000F3C000000000000000000000000000000000000000000001F7C1F7C
      1F7C1F7C00000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF7F
      FF7FFF7F00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      1F7C000000000000000000000000000000000000000000000000000000000000
      000000000F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EF3DEF3DEF3DEF3DEF3DEF3DEF3D
      EF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3D0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EF3D0000000000000000
      00000000000000000000000000000000000000000000007C007C007C007C0000
      00000000000000000000000000000000EF3D0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000EF3D000000000000
      00000000000000000000000000000000000000000000007C007C007C007C0000
      00000000000000000000000000000000EF3D007C00000000007CEF3D00000000
      0000000000000000007CEF3D0000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF7F
      F75E0000000000000000000000000000000000000000007C007C007C007C007C
      00000000000000000000000000000000EF3D00000000007C003C003C003C003C
      003C003C003C003C003C003CEF3D000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF7FF75E0000
      FF7FF75E000000000000000000000000000000000000007C007C007C007C007C
      00000000000000000000000000000000EF3D00000000007C003C003C003C003C
      003C003C003C003C003C003CEF3D000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000F75E0000
      FF7FFF7FF75E0000000000000000000000000000007C007C007C007C007C007C
      007C0000000000000000000000000000EF3D00000000007C003C003C003C003C
      003C003C003C003C003C003CEF3D000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF7FFF7FFF7F0000
      0000F75EF75EFF7FF75E00000000000000000000007C007C007C007C007C007C
      007C0000000000000000000000000000EF3D00000000007CFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000000000000000000000000000
      0000000000000000000000000000000000000000EF010000F75EFF7FFF7F0000
      FF7FFF7FFF7FFF7FFF7F0000F75EEF3D00000000007C0000007C007C007C007C
      007C007C000000000000000000000000EF3D000000000000FF7FFF7FF75EF75E
      F75EF75EF75EF75EF75E003C003C000000000000000000000000000000000000
      000000000000000000000000000000000000EF01FF03EF010000F75E00000000
      000000000000EF3D0000E07FEF3DEF3DEF3D0000007C0000007C007C0000007C
      0000007C000000000000000000000000EF3D000000000000007C003CF75EF75E
      F75EF75EF75EF75EEF3DFF7F0000000000000000000000000000000000000000
      000000000000000000000000000000000000EF01EF01FF03EF01000000000000
      0000000000000000E07FF75EEF3DEF3DEF3D0000007C0000007C007C0000007C
      00000000000000000000000000000000EF3D0000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7F003C003C0000000000000000000000000000000000000000
      000000000000000000000000000000000000EF01EF01EF010000000000000000
      0000000000000000FF7FFF7FF75EEF3D00000000007C0000007C007C0000007C
      00000000000000000000000000000000EF3D003C003C003C003C007CFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F003C003C003C003C0000000000000000000000000000
      000000000000000000000000000000000000EF01EF01EF010000000000000000
      0000000000000000FF7FFF7FFF7FF75E0000000000000000007C007C0000007C
      00000000000000000000000000000000EF3D0000003C003C003C003CF75EF75E
      F75EF75EF75E003C003C003C003C003C003C0000000000000000000000000000
      000000000000000000000000000000000000EF01EF0100000000000000000000
      00000000000000000000FF7FFF7FFF7F0000000000000000007C007C0000007C
      00000000000000000000000000000000EF3D0000003CFF7F007C003C003C003C
      000000000000F75E003C003CFF7F003C00000000000000000000000000000000
      0000000000000000000000000000000000000000EF0100000000000000000000
      00000000000000000000FF7FFF7F000000000000000000000000007C00000000
      00000000000000000000000000000000EF3D00000000003C003CEF3D003C003C
      003C003C003C003C007CEF3D003C000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000EF3D00000000000000000000003C003C
      003C003C003C003C003C00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000EF3D0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F75EEF3DEF3D0000EF3D00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E07FE07FE07F
      E07FE07FE07FE07F000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F75EF75EEF3DEF3D0000EF3D0000
      00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F000000000000000000000000E07FE07FE07FE07F
      E07FE07FE07FE07FE07FE07F0000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7FF75EF75EEF3DEF3D0000EF3D
      000000000000000000000000000000000000000000004862E25DE36104620362
      03622262216221660062A055FF7F0000000000000000E07FE07FE07FE07F0000
      000000000000E07FE07FE07FE07F000000000000000000000000000000000000
      000000000000000000000000000000000000FF7FFF7FF75EF75EEF3DEF3D0000
      EF3D0000000000000000000000000000000000000000016A446AFF7FFF7F666E
      856E8472A372A272806E0062FF7F000000000000E07FE07FE07FE07F0000E07F
      E07FE07FE07F0000E07FE07FE07F000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7FFF7FF75EF75EEF3DEF3D
      0000EF3DEF3DEF3DEF3DEF3D00000000000000000000226A666E9A7B8A72FF7F
      FF7FC772C472C272A1722066FF7F000000000000E07FE07FE07F0000E07FE07F
      E07FE07FE07FE07F0000E07FE07FE07F00000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FFF7FF75EF75EEF3D
      EF3D00000000000000000000EF3D0000000000000000246A686EFF7FCD72896E
      FE7F0E77C472C372A2722166FF7F00000000E07FE07FE07FE07FE07FE07FE07F
      E07FE07FE07FE07FE07FE07FE07FE07F00000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF7FFF7FF75EF75E
      EF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3D000000000000456E896EAA72FF7FCD72
      A972FF7FFF7FFF7F836E2366FF7F00000000E07FE07FE07FE07FE07FE07FE07F
      E07FE07FE07FE07FE07FE07FE07FE07F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF7FFF7FF75E
      F75EF75EF75EF75EF75EF75EEF3DEF3DEF3D00000000466EAB72AB728A6EFF7F
      AA72666E646EC972FE7F2462FF7F00000000E07FE07FE07FE07FE07FE07FE07F
      E07FE07FE07FE07FE07FE07FE07FE07F00000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF7FFF7F
      EF3DEF3D000000000000FF7FF75EEF3D000000000000676EAC72AC728A6E9A7B
      676E666EAB72446EFF7F2462FF7F00000000E07FE07FE07FE07FE07F00000000
      E07FE07F00000000E07FE07FE07FE07F00000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF7FF75E
      EF3D0000EF3D000000000000F75EEF3D000000000000686ECE72CD72AB72987B
      CE72676EFF7F456EFF7F0562FF7F000000000000E07FE07FE07FE07F00000000
      E07FE07F00000000E07FE07FE07FE07F00000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF7FF75E
      EF3D0000EF3D000000000000F75EEF3D000000000000896E1177EE72CC72AB72
      FF7F1177AB72FE7FF0760462FF7F000000000000E07FE07FE07FE07F00000000
      E07FE07F00000000E07FE07FE07FE07F00000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF7FF75E
      EF3D0000EF3D000000000000F75EEF3D000000000000AB7234771077EE72CD72
      CC72777B997BCC72676E0462FF7F0000000000000000E07FE07FE07FE07FE07F
      E07FE07FE07FE07FE07FE07FE07F000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF7FF75E
      EF3DEF3DEF3DEF3DEF3D00000000F75E000000000000FE7FAA72896E686E676E
      676E666E456E456E236A6966FF7F0000000000000000E07FE07FE07FE07FE07F
      E07FE07FE07FE07FE07FE07F0000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF7FFF7F
      EF3DEF3DEF3D00000000EF3D0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E07FE07FE07F
      E07FE07FE07FE07FE07F00000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF7F
      FF7FEF3DEF3DEF3DEF3DEF3DEF3D000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E07F
      E07FE07FE07F0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF7FFF7FFF7FFF7FFF7FF75E000000000000424D3E000000000000003E000000
      2800000040000000900000000100010000000000800400000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFBFFFFC3FFFFFE00FFFFFFFFFFFEFDFFFFFFFFFFF3001FFFE3FFFC007F
      FFF8003FF8000FF0FE448FF8003FFF80007FFE007FF8001F3FF0001FFC408FFC
      FC408FFC007FFC00007FF8001FF0000F8003FFFFFC3FFFFF80030001E00FFFFF
      8003C993C007FFFF800300018003FFFF800389138001FFE7800300010001FF81
      800389130000C0018003000100008000800389130000000C8003000100000001
      800399130001FD01800300010001FF838003F9138001FFFF80030001C003FFFF
      8003FF3FE007FFFF80030001F01FFFFF0001C001FFFFFFFF00018000FFFFFFCF
      000100008001FFC7000100008001FFDF000100008001F819000100008001F00F
      000100008001E007000100008001200700010000800140070001000080010007
      000100008001C007FFFF00008001E007FFFF00008001E00FFFFF00008001F01F
      FFFF00008001FC69FFFF00018001FFF1FFFFF000FFFFC03F00C0F000001F801F
      00D0F000001F800F0090F000001F00070090F000001F000300B00000001F8001
      00300000001F800000708000001FC000007080000001E00000F0C0000003E000
      00F3C0000003C00000F3E0000007800107F3E00000078003C7F3F000000FC1FF
      E7F3F000800FE3FFE7FFFFFFD25FF7FFFFFFFF0FFD7FFFFFFFFFFC03FD7FFFFF
      3EFFF003FD7F1011007FE003FD7F1010001FE007FD7F00000003E00FFD7F0000
      0003E00FFC7F00000003C00FF45F00008003C00FF45F0000C003C007F55F0000
      E001C007F11F0000C000C007F11F0000C0008007FBBF0000E001C007FC7F0000
      F807E01FFC7F0001FFFFF87FFC7FFFFFFFFFFFBFFC3FFFFFFFFFFF3FE00FFFFF
      0001FE3FC007E0078003F80F8003C003C007E0078001C001C007C0030001C000
      C00780010000C000E00700000000C001F00F00000000C007E00F000000000000
      E00F000000010800E00F000100010500E00F000380010000E00F8007C0030001
      F00FC00FE007FDBFFFFFF01FF01FFADFFEFFFFFFFFFFFFFFFC3FC03FF01FEFDF
      F80F801FE00F8000F003800FC007E448E00300078003C408C00300030001C408
      C00180010001C008C00380000001C408C00180000001C400C003C0000001C408
      8007E0000001C4088007F0000001C40F800FF8018003C78FC01FFC01C007C78F
      F03FFE03E00FFFFFFC7FFFBFF01FFFFFFFFF0000FFFFCEE7DFFF0000FFFF86E7
      EE7F000067E786E7F81F0000C00386E7E00F0000C00386C3E00F0000C0038681
      C0030000C00386C380010000E003028100000000E0074AA507C00000F00702A5
      0FC10000000002811FE10000800002811FE1000081C17ABDBFF30000C003CEE7
      BFF70000F80F86C3FFFF0000FFFFCEE7FFFFFC3FCEE707FFFFFFE00F86E703FF
      C007C00786E701FFC003800386E700FFC003800186C38007C00300018681C003
      C003000086C3E001C00300000281F000C00300004AA5F800C003000002A5F830
      C00300010281F838C00300010281F838C00380017ABDF808C003C003CEE7F804
      FFFFE00786C3FC03FFFFF01FCEE7FE0300000000000000000000000000000000
      000000000000}
  end
  object ImageList2: TImageList
    Left = 384
    Top = 248
    Bitmap = {
      494C010109000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001001000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000EF3D000000000000000000000000F75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75E0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000EF3D000000000000000000000000F75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75E0000F75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75E00000000000000000000000000000000
      0000FF7FEF3D000000000000000000000000F75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75E00000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7F00000000FF7F0000000000000000000000000000EF3DEF3D
      FF7FFF7FEF3DEF3DEF3D0000000000000000F75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75E0000000000000000000000000000
      000000000000000000000000000000000000000000000000EF3D0000F75EFF7F
      FF7FFF7F00000000EF3DEF3D000000000000F75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75E000000000000F75EF75EF75EF75E
      F75EF75E000000000000F75E000000000000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FF75EEF3DEF3D00000000F75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75E000000000000F75EF75EF75EF75E
      F75EF75E000000000000F75E00000000000000000000FF7FFF7FFF7FFF7FF75E
      1F00FF7FFF7FFF7FFF7FFF7FEF3DEF3D0000F75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75E0000000000000000000000000000
      000000000000000000000000000000000000EF3DFF7FFF7FFF7FFF7FFF7F1F00
      1F00FF7FFF7FFF7FFF7FFF7FF75EEF3DEF3DF75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75E0000000000000000000000000000
      000000000000000000000000000000000000F75EFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000EF3DF75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75E0000000000000000000000000000
      0000000000000000F75E0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      1F00FF7FFF7FFF7FFF7FFF7FFF7F0000EF3DF75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75E00000000000000000000F75EF75E
      F75EF75EF75EEF3DF75E0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      1F001F00FF7FFF7FFF7FFF7FFF7F0000EF3DF75E00000000F75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
      F75E00000000F75EF75EF75EF75EF75EF75E00000000000000000000F75EF75E
      F75EF75EF75EEF3DF75E0000000000000000F75EFF7FFF7FFF7FFF7F1F001F00
      F75E1F001F00FF7FFF7FFF7FFF7F00000000F75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75E00000000F75E00000000F75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75E00000000000000000000F75EF75E
      F75EF75EF75EEF3DF75E0000000000000000EF3DFF7FFF7FFF7FFF7F1F00FF7F
      FF7F1F001F00FF7FFF7FFF7FF75E00000000F75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75E00000000F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75E0000000000000000000000000000
      0000000000000000F75E00000000000000000000EF3DFF7FFF7FFF7FF75E1F00
      1F001F00FF7FFF7FFF7FFF7F0000000000000000F75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
      F75E00000000F75EF75EF75EF75EF75EF75E0000000000000000000000000000
      00000000000000000000000000000000000000000000EF3DFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FF75E000000000000000000000000F75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75E00000000F75EF75EF75EF75EF75E
      F75E00000000F75EF75EF75EF75EF75EF75E0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EF3DF75EFF7F
      FF7FFF7FEF3DEF3D0000000000000000000000000000F75E0000000000000000
      F75E00000000000000000000F75EF75EF75E00000000F75EF75EF75EF75E0000
      0000F75EF75EF75E0000000000000000F75EE07FE07FE07FE07FE07FE07FE07F
      E07FE07FE07FE07FE07FE07FE07FE07FE07F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E07FE07FE07FE07FE07FE07FE07F
      E07FE07FE07FE07FE07FE07FE07FE07FE07F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E07FE07FE07FE07FE07FE07FE07F
      E07FE07FE07FE07FE07FE07FE07FE07FE07F000000000F000F000F000F000F00
      0F000F0000000F0000000000000000000000000000000000000000000000FF7F
      FF7FFF7F00000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E07FE07FE07FE07FE07FE07FE07F
      E07FE07FE07FE07FE07FE07FE07FE07FE07F00000F000F000F000F000F000F00
      0F0000000F000F000F0000000000000000000000000000000000FF7FFF7FFF7F
      0000FF7FFF7FFF7F000000000000000000000000000000000000EF3D0000EF3D
      EF3DEF3D00000000EF3D0000EF3DEF3DEF3DE07FE003E07FE07FE07FE07FE003
      E07FE07FE07FE07FE003E07FE07FE07FE07F0F000F000F000F000F000F000F00
      0F0000000F000F000F000F00000000000000000000000000FF7FFF7FFF7FFF7F
      0000FF7FFF7FFF7FFF7F0000000000000000000000000000003C000000000F3C
      0F3CEF3D0000003C000000000F3C0F3CEF3D1F7CE07F1F7C1F7C1F7C1F7CE07F
      1F7C1F7C1F7C1F7CE07F1F7C1F7C1F7C1F7C0000000000000000000000000000
      00000F000F000F000F000F000F000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000E07F003C000000000F3C
      0F3CEF3D0000003C000000000F3C0F3CEF3DE07FE07FE07F1F7C1F7CE07FE07F
      E07F1F7C1F7CE07FE07FE07F1F7C1F7CE07F00000000FF7FEF3DEF3DEF3DFF7F
      FF7FFF7F0F000F000F000F000F000F00000000000000FF7FFF7FFF7FFF7FFF7F
      FF7F00000000FF7FFF7FFF7F000000000000000000000000E07F0000E07F0F3C
      0F3CEF3D0000003C000000000F3C0F3CEF3DE07F1F7CE07FE07FE07FE07F1F7C
      E07FE07FE07FE07F1F7CE07FE07FE07FE07F00000000FF7FEF3DEF3DEF3DEF3D
      FF7FFF7FFF7F0F000F000F000F000F0000000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000003CE07F0000E07F
      0F3CEF3D0000003C000000000F3C0F3CEF3D1F00FF031F001F001F001F00FF03
      1F001F001F001F00FF031F001F001F001F0000000000FF7FEF3DEF3DEF3DFF7F
      FF7FFF7FFF7FF75E0F000F000F000F0000000000FF7F00000000FF7FFF7FFF7F
      00000000FF7FFF7F00000000FF7F00000000000000000000003C000000000F3C
      E07FEF3D0000003C0000E07F0F3C0F3CEF3D1F00FF031F001F001F001F00FF03
      1F001F001F001F00FF031F001F001F001F000000000000000000000000000000
      00000000FF7FFF7FF75E0F000F000F0000000000FF7FFF7FFF7FFF7FFF7F0000
      0000007CFF7FFF7FFF7FFF7FFF7F00000000000000000000003C000000000F3C
      0F3CE07F0000003CE07F0000E07F0F3CEF3D1F00FF031F001F001F001F00FF03
      1F001F001F001F00FF031F001F001F001F000000000000000000000000000000
      000000000000FF7FFF7FF75E0F000F00000000000000FF7FFF7FFF7F00000000
      FF7FFF7F007CFF7FFF7FFF7F000000000000000000000000003C000000000F3C
      0F3CEF3DE07FE07F00000000007CE07FEF3D1F001F001F001F001F001F001F00
      1F001F001F001F001F001F001F001F001F00000000000000000000000F000F00
      0000000000000000FF7FFF7FF75E0F00000000000000FF7FFF7F00000000FF7F
      FF7FFF7FFF7F007CFF7FFF7F000000000000000000000000003C000000001F7C
      1F7CEF3D0000003C000000000000000000001F00E07F1F001F001F001F00E07F
      1F001F001F001F00E07F1F001F001F001F000000000000000000000000000000
      00000000000000000000FF7FFF7FF75E0000000000000000FF7FFF7FFF7FFF7F
      0000FF7FFF7FFF7FFF7F0000000000000000000000000000003C000000000000
      000000000000003C000000000000000000001F001F001F001F001F001F001F00
      1F001F001F001F001F001F001F001F001F000000000000000000000000000000
      000000000F000F0000000000FF7FFF7F00000000000000000000FF7FFF7FFF7F
      0000FF7FFF7FFF7F00000000000000000000000000000000007C000000000000
      000000000F3C0000000000000000000000001F001F001F001F001F001F001F00
      1F001F001F001F001F001F001F001F001F000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF7F
      FF7FFF7F00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001F001F001F001F001F001F001F00
      1F001F001F001F001F001F001F001F001F000000000000000000000000000000
      000000000F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EF3D0000000000000000
      0000000000000000000000000000000000000000010014421A635B6B3B67B956
      D339000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E07FE07FE07F
      E07FE07FE07FE07F00000000000000000000000000000000EF3D000000000000
      0000000000000000000000000000000000005029BC779C737B6F5B6BFA5E9B73
      9752BA5686100000000000000000000000000000000000000000EF3D00000000
      00000000000000000000EF3D000000000000000000000000E07FE07FE07FE07F
      E07FE07FE07FE07FE07FE07F000000000000000000000000000000000000FF7F
      F75E00000000000000000000000000000000D95ABD77DE7BBD777B6FB9569952
      B9563746374A0000000000000000000000000000000000000000000000000000
      000000000000000000000000EF3D0000000000000000E07FE07FE07FE07F0000
      000000000000E07FE07FE07FE07F000000000000000000000000FF7FF75E0000
      FF7FF75E0000000000000000000000000000574AFE7FFF7FDE7B9C73DA5A1942
      394EF82579015801780189000000000000000000000000000000000000000000
      000000000000000000000000EF3D000000000000E07FE07FE07FE07F0000E07F
      E07FE07FE07F0000E07FE07FE07F0000000000000000000000000000F75E0000
      FF7FFF7FF75E00000000000000000000000000009952F841F8451A63594AB939
      7901BE01DF01BF01DF019D015701000000000000000000000000000000000000
      000000000000000000000000EF3D000000000000E07FE07FE07F0000E07FE07F
      E07FE07FE07FE07F0000E07FE07FE07F0000000000000000FF7FFF7FFF7F0000
      0000F75EF75EFF7FF75E00000000000000000000712D3C1E9F021F3F394E7A01
      DF01DF019F01FF7FBF01DF01BD01F1000000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000E07FE07FE07FE07FE07FE07FE07F
      E07FE07FE07FE07FE07FE07FE07FE07F00000000EF010000F75EFF7FFF7F0000
      FF7FFF7FFF7FFF7FFF7F0000F75EEF3D00000000374A9F16DF16DF1ADF167B01
      DF01DF01BF01FF7F9F01DF01DF017A010000000000000000FF7FFF7FF75EF75E
      F75EF75EF75EF75EF75E0000000000000000E07FE07FE07FE07FE07FE07FE07F
      E07FE07FE07FE07FE07FE07FE07FE07F0000EF01FF03EF010000F75E00000000
      000000000000EF3D0000E07FEF3DEF3DEF3D0000B95EFF1AFF221F27FF22BE01
      DF01DF01BF01FF7F9F01DF01DF019C01000000000000000000000000F75EF75E
      F75EF75EF75EF75EEF3DFF7F000000000000E07FE07FE07FE07FE07FE07FE07F
      E07FE07FE07FE07FE07FE07FE07FE07F0000EF01EF01FF03EF01000000000000
      0000000000000000E07FF75EEF3DEF3DEF3D000098563F273F2F3F331F2FBE01
      DF01BF019F63FF7F9F01DF01DF01BD0100000000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7F00000000000000000000E07FE07FE07FE07FE07F00000000
      E07FE07F00000000E07FE07FE07FE07F0000EF01EF01EF010000000000000000
      0000000000000000FF7FFF7FF75EEF3D00004208774A3F335F3B7F3F9F477D01
      DF01BF019F01DF01BF01DF01DF019C01000000000000000000000000FF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000E07FE07FE07FE07F00000000
      E07FE07F00000000E07FE07FE07FE07F0000EF01EF01EF010000000000000000
      0000000000000000FF7FFF7FFF7FF75E0000754EBA365F3F7F479F4B9F4F7F1A
      FF05BF013F16FF7F9F01BF01DF01CD00000000000000000000000000F75EF75E
      F75EF75EF75E0000000000000000000000000000E07FE07FE07FE07F00000000
      E07FE07F00000000E07FE07FE07FE07F0000EF01EF0100000000000000000000
      00000000000000000000FF7FFF7FFF7F00005B6B3E3B7F479F4FBF57DF57DF5B
      7F1A9F33DF019F011F067F1657010000000000000000F75E0000000000000000
      000000000000F75E00000000EF3D0000000000000000E07FE07FE07FE07FE07F
      E07FE07FE07FE07FE07FE07FE07F000000000000EF0100000000000000000000
      00000000000000000000FF7FFF7F000000009C7375463C4BBF57FF63FF67FF5F
      DF579F47181E7F33DD0100000000000000000000000000000000F75E00000000
      00000000000000000000FF7F00000000000000000000E07FE07FE07FE07FE07F
      E07FE07FE07FE07FE07FE07F0000000000000000000000000000000000000000
      0000000000000000000000000000000000005A6B7C6FF95E544ED23DF441D94E
      7E539F4B43080000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E07FE07FE07F
      E07FE07FE07FE07FE07F00000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003446D95AD95A
      774E164600000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E07F
      E07FE07FE07F0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000801C808890C
      A90C890CA90C890888104A010000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000881088088708AE14
      D018D014AC10670887088808881000000000000000000B19CE39135222040000
      0000000000000000000000000000000000000000000000000000000000000000
      B556734E734E734E734ED65A0000000000000000000000000000000000000000
      000000000000EF3DEF3DEF3DEF3DEF3D000000000000A808890C9935FE5EDF5A
      BF529F4E5F4A1D42562988088808890C000000000000EA1CEA7EC76534524308
      0000000000000000000000000000000000000000000000000000D65AB5565619
      3A117C1D9F299F293A11F40C4D25000000000000000000000000000000000000
      000000000000EF3DEF3DEF3DEF3DEF3D00000000AA08AD14DD5A3F631F5F3E63
      5E677E6B5E679D52FB3D98318A0C8708E70C00000000000008250A7FC7653452
      44080000000000000000000000000000000000000000992A5719561556151809
      7D21DF2DFF3158153A2ABF297D21B55600000000000000000000000000000000
      000000000000000000000000EF3DEF3D00000000A80CFC5A1F5F1F5F1F5F1F63
      3F633E635E675E675E67BC5257296708880CD500190D5C199E25502D0A7FC765
      3556000000002204220400000000000000000000DA01D300D300D30032017915
      BF2D1F361D2E7F537F531F369F29B556000000000000000000000000E07FFF7F
      E07FFF7FE07FFF7FE07F0000EF3DEF3D000000005629FF5ABF56DF56DF5ADF5A
      FF5AFF5E1F5F1F633F633E639C4ED018870818097D21BF2DFF31BB21F03D0A7F
      0D566F25D335DA4A3C5BF439430800000000DE26D300F4003601360180013601
      9A193F367D3E3742FF4A3F3A160D0000000000000000000000000000FF7FE07F
      FF7FE07FFF7FE07FFF7F0000EF3DEF3D0000000019427F4E9F4E9F529F52BF52
      BF56DF56DF5ADF5AFF5AFF5E1F5F56298708D400BF291F325F3A9C3A5F537625
      F339DD4AFF67FF6BFF6FFF773C6301000000F400360157019901B201C001C001
      29250000813CA248603C6C2D00000000000000000000000000000000E07FFF7F
      E07FFF7FE07FFF7FE07F0000000000000000A90C1A3E5F4A5F4A7F4E7F4E7F4E
      9F4E9F529F52BF52BF56DF56DF5ADA3D8808000039113F3A370D1F4B3F4B5715
      7946FF67DF5FFF6FFF77FF7FFF7BF5390000360199019901DA012A020102630C
      4208A134235523592355613400000000000000000000000000000000FF7FE07F
      FF7FE07FFF7FE07FFF7F00000000000000009901993199319931993199319931
      99313E467F4E7F4E9F4E9F529F52FA418708000000006B00203481402034F00C
      5E5B9F57BF5FFF6BFF77FF77FF6F5D5B00009901BA01FC014D025A023502630C
      84108461A465A4698465024D00000000000000000000EF3DEF3D0000E07FFF7F
      E07FFF7FE07FFF7FE07F00000000000000003F4B3F4B3F4B3F4B3F4B3F4B9D2A
      870478293E465F4A5F4A7F4E7F4E3425A80C000021040000E25002550251842C
      7E5F7F57BF5BFF67FF6BFF6FFF6B5D5700009901FC01810AC51A5A025F02A514
      C6188459257A467E257A636100000000000000000000EF3DEF3D0000FF7FE07F
      FF7FE07FFF7FE07FFF7F0000000000000000D81DDE3ADE3ADE3ADE3ADE3ADE3A
      6704782D1D421D423E463E463E468708AA084208630CE244635D636163612351
      DB4EFF77BF679F5BBF5FDF5FFF6758420000DA012A02E422052B493B5A3B630C
      0821A514024DA46D467A625100000000000000000000EF3DEF3D0000E07FFF7F
      E07FFF7FE07FFF7FE07F0000000000000000D10C7D2A7D2A7D2A7D2A7D2A7D2A
      AD089935BA35FC3DFC3D1C42F11C890C00008410A514434DC46DE571C56DA469
      0B21DF77FF7F9F5F7F53DF635F5722080000FC01E4222633493B6D432D379E4B
      4A298C31524ACE39A514E71C00000000000000000000EF3DEF3D000000000000
      0000000000000000000000000000000000000000D30C3B1A3B1A3B1A3B1A3B1A
      150587047729DA39DA39CD14AA0C00000000A514E71C400C667E667E667E257A
      6020EB18BA4E9E5B7F5BFD524308000000000000052B493B914BD95BD95B2D37
      DF1A8C31524AAD35A514000000000000000000000000EF3DEF3DEF3DEF3DEF3D
      00000000000000000000000000000000000000000000F30C3409DA09DA09DA09
      B90987047931A90CCA100821000000000000210429254A29630C813043694351
      0000000000000000000000000000000000000000D95B112B914BD95BBE5B493B
      052B5F02FC011D02000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F30CF30CF30C
      F30CF30C000000000000000000000000000000000821AD353146F75EAD352104
      00000000000000000000000000000000000000000000DE673537523B523B2633
      E4225A023F370000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000630CEF3D6B2D00000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF006E730000140031002C7442108049636F
      00310000000000DE4943545552450015696374757265005000BC26A31D100050
      001E0031000000004C46534F46547E316674486F74656C00801D10004C66536F
      310000000000BC26000000000DEF23000000000000000000443A5C0000000000
      002B30309D19002320EA3A6910A2D8080000001F0FE04FD0000034302E69636F
      00004953435C4D6900005C49434F4E5300005C506963747500006F6674486F74
      00000000443A5C4C000000000800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFC07FFFFFFC3FDFFF803FFFFFE00F
      EE7F001F67E7C007F81F0007C0038003E00F0001C0038001E00F8001C0030001
      C0038000C003000080018000E003000000008000E007000007C08000F0070000
      0FC10000000000011FE10001800000011FE1000381C18001BFF30007C003C003
      BFF7003FF80FE007FFFFF03FFFFFF01FFFFFF007C3FFFFFFFF80C00181FFFE07
      FF80800080FFF003FF808000007FC001F000800000038001F000800000010003
      F000800000000007F00000000000000780070000000000078007000000000007
      80070000000000078007000000000007800780010001800F80FFC0070003801F
      80FFF07F00FFC03FFFFFFFFF01FFFFFF00000000000000000000000000000000
      000000000000}
  end
  object ImageList3: TImageList
    Left = 352
    Top = 280
    Bitmap = {
      494C010107000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001001000000000000018
      000000000000000000000000000000000000C51C853DE5200000181EA21CBA01
      DB012002F101DA01AA0182018911CE0088040000584AD863BC5FBD2E9C2E7926
      7922561A561EB719393618327932000000001021D315F400F400150115017D67
      BF6FBE6FBF6FFA56CE0C72258A088904CC0000000077617F607F607F607F807F
      807F607F607F807F817F607F6E08000000008349A476C61C0000FA11BA013002
      5B0279025F023D020302C00184012F0588040000594AFD775F57DD2EBC2A981E
      781E781E7922D8197A367B360B15000000002C115B1E150136017701560DBF6B
      BF6BBF6BBF6F363E0E194F21EF10890889080000607F2077C27F607F807FA162
      2077807F607FE47F607FAC14000000000000636E653DA614C6187A22FC01C31A
      E626112F1F2B7F063B02E201A0010F05A9040000594EFD7BFD32FD2ADB22B81A
      BA1EBB22BB261A1A9C36FE3A000000000000EA0C770977019901BA01B6259F67
      9F679F679F67BF6B5D5F4D196F196804A804000000002073817F807FA07F032D
      4256807F807FA17F807F6D0C000000000000225EE379644586103A5F8B12252F
      6F3F6B43BF57FF1E5D020C02C001CA04EB040000594ADA67FC2AFB26FB22DA1E
      DD26DD26DE2A3C1ADD369A32000000000000CA0C5701B901DD012B0299469F63
      9F639F63BF67163E620582058A156704680400000000607B4077C17FE07F0400
      C920A07FE37F807FCC180000000000000000A0726176E379A151A6144E3B483B
      B253FC67BC570E275702DB013206C9044A010000594A583F3B331C331D33FC2A
      1E2FFF2EFE2A5D1AFF366E19000000000000EA149901DC01850A63165E5B7F5F
      7F5F5E5B7419EB01E3016D0185098704A8040000000000004073C17FE07F0500
      080CE07FE27FC07F4E0400000000000000000C6F487FA17EE169A618DE777743
      3837974B4A3FE4263D025A12CA08CC0000000000584E1B335D475F475F473D37
      3F3B1E331D2B7D1A1F3F00000000000000004D211A1AD719C11E25697F5BB766
      383E391A5E0216020002C0018401A9040A01000000000000807B807BE17F0200
      0800E27FA07FEB2000000000000000000000C355887F467F042DA614A518A714
      F85A5A4F1C33F646F4250A114A01000000000000594A5E439E577F537F535D43
      5E3F3C373C339C22BC36000000000000000055293D47047DA5328C5D69756B4D
      584F3F379F0E35020E02C401B101AA04080100000000000000006073E17F0000
      0100E27FE07F4E0400000000000000000000C618E355AC7F017B05298610A151
      0429A614A614C6180000000000000000000000003946BF5FBF5F9E577D535B43
      5C435C3F3C3BBD2A2C15000000000000000000006975873E0633373A933ED16A
      396B252FD1165602F80102020E05EC0000000000000000000000A07BA07BE17F
      E37FC07F2A250000000000000000000000000000C618E355AF7F427F436AE05D
      E37944418610A5180000000000000000000000007A4AD03DDF675152DF67724E
      9F531A5B9F579D32210000000000000000000000E47CAA75EF264F3F7B4B0D6E
      2C662633C51A1F02DB01B605EC0410000000000000000000000000008073E37F
      E47FE07F4E0400000000000000000000000000000000E71C0656FB7F447F017F
      216AE3792431C618000000000000000000000000D6351842124A183E124A1742
      544E344A9C4AB45E0000000000000000000000000000E47C516A915E2579AB56
      493B0227A3167F12D4110D0910000000000000000000000000000000C07BE07F
      E07F492900000000000000000000000000000000000000000821A35503568A7F
      257F216AA618A514000000000000000000000000990D4E4A2300AC52CA100A67
      2D19296F0F46885A000000000000000000000000E47CE47CA254E47C1A4BAB6D
      1B3FDA3636262D112D110000000000000000000000000000000000000000E07F
      E07F000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AC34A3350000092AAD32AE3A293A
      A536302920001000400001081000862040000000000016101000000086202100
      0002100016100000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AE3A293AA5368323111987212138
      B434302910001000000001081000261E000000000000161010000000261E2100
      0002100016100000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000EF3DEF3DEF3DEF3D
      0000EF3DEF3D0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000911891182336A9312B000000092AAD320000F75EF75E0000000000000000
      F75E00000000EF3D000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E07FE07FE07F
      E07FE07FE07FE07F00000000000000000000A927AE242E232F29A12B14009623
      252AA624AC22B622B229A927AE242E23AF29007C00000000003C003C003C007C
      0000007C003C0000EF3D00000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000E07FE07FE07FE07F
      E07FE07FE07FE07FE07FE07F000000000000B811F807F60B010010100000EF02
      86001F038D2F00080000A624AC22B622B229000000000000003C003C003C003C
      003C000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E07FE07FE07FE07F0000
      000000000000E07FE07FE07FE07F000000000000000000000000000000000000
      00000000000000000000000000000000000000000000003CFF03EF3DFF03FF03
      FF030000007C007C0000EF3D0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000E07FE07FE07FE07F0000E07F
      E07FE07FE07F0000E07FE07FE07F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000007C007C007C
      0000E07FFF7FFF7FFF7FEF3DF75E000000000000000000000000000000000000
      0000000000000000000000000000000000000000E07FE07FE07F0000E07FE07F
      E07FE07FE07FE07F0000E07FE07FE07F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF7FFF7FFF7F
      FF7FE07FFF7FFF7FFF7FEF3DF75EF75E00000000000000000000000000000000
      000000000000000000000000000000000000E07FE07FE07FE07FE07FE07FE07F
      E07FE07FE07FE07FE07FE07FE07FE07F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FEF3DF75EF75E00000000000000000000000000000000
      000000000000000000000000000000000000E07FE07FE07FE07FE07FE07FE07F
      E07FE07FE07FE07FE07FE07FE07FE07F000000000000161010000000CE292100
      0002100016100000000000000000000000000000000000000000EF3DE07F0000
      FF7FFF7F0000E07FEF3DEF3DF75EF75E00000000000000000000000000000000
      000000000000000000000000000000000000E07FE07FE07FE07FE07FE07FE07F
      E07FE07FE07FE07FE07FE07FE07FE07F000024212139882022338B2034328B20
      2D338C13537B7771EA7E071623362739A5320000000000000000EF3D00000000
      FF7FFF7F0000E07FEF3DEF3DF75EEF3D00000000000000000000000000000000
      000000000000000000000000000000000000E07FE07FE07FE07FE07F00000000
      E07FE07F00000000E07FE07FE07FE07F00000031A53329370D05001000102336
      A530B21D0D0500100010A1213A36001D1D100000000000000000EF3DEF3DEF3D
      EF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3D00000000000000000000000000000000
      0000000000000000000000000000000000000000E07FE07FE07FE07F00000000
      E07FE07F00000000E07FE07FE07FE07F00000000C0010000E0070000C0010000
      E0070000C0010000E0031000C0000000C003000000000000F75EF75EF75EF75E
      EF3DEF3DF75EF75EF75E0000EF3D000000000000000000000000000000000000
      0000000000000000000000000000000000000000E07FE07FE07FE07F00000000
      E07FE07F00000000E07FE07FE07FE07F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F75EF75E0000
      E07F0000F75EF75E0000EF3DEF3DEF3D00000000000000000000000000000000
      00000000000000000000000000000000000000000000E07FE07FE07FE07FE07F
      E07FE07FE07FE07FE07FE07FE07F000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000F75EF75E
      0000F75EF75E0000EF3DEF3DEF3D000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E07FE07FE07FE07FE07F
      E07FE07FE07FE07FE07FE07F000000000000FF7FFF7FFF7FFF7FFF7FF85EB756
      544A3546B9521B5BBF5B6F29E71C31468D3100000000000000000000EF3DF75E
      F75EF75E0000EF3DEF3DEF3D0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E07FE07FE07F
      E07FE07FE07FE07FE07F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      F75E0000EF3DEF3DEF3D00000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E07F
      E07FE07FE07F000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F4029C51CC618C61CC51C0821CC00
      C904A80466046704880488040A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001F00
      0A0010000000A914AA14CA144A010000000000004F046E086E086E086E086E08
      6E086E086E086E086E086E088D108D0C00000525A34D636EA351A614C618C908
      0F01550996151109880487048804C60000000000594E3E57FF4E3D2E961DEF10
      0000000000000000000000000000000000000000000000000000EE00CC04AB08
      AA0889088A08EC140D1D880CAA104A010000E072806680668066806680668066
      80668066806680668066A06AA6418D0C0000A4496466E451A476E355C618FB0D
      36118F1D150D561599219721670487040A000000594EFE7BD863B457B557B34B
      7C571E4B5E36F11000000000000000000000000000001000ED04CA040F05310D
      EE0CEF08AB04784EFF7F9231A90C8D100000C06E007B007B207B207B407FA441
      475A207F207B207B207B007B407F2E0000008449646E06290625646AB319D300
      140166051201F400D30036117519870488080000594EB65F9453FB32BB2EFD2E
      5F477D4F95434D110000000000000000000000001002EC047301BA157821942D
      EE183119B431FF7FFF7F5025AA0C10000000E072407F407F407F407F807F0200
      2D0CA07F407F407F607F407F007B6C0C0000C620646AE6200000513EAC295701
      7801C601C0017701360112019121660488040000594AB557B557BB2A7B325826
      392A3722581E1A1EDD3ABC36F4250000000000002C0DF709150DD300D300784A
      1C5FCC14FF77FF77163EAC0488048A040000407B0077A27F407F607FA07F0200
      6410807F607F407FE47F407FAC1400000000C51C853DE5200000181EA21CBA01
      DB012002F101DA01AA0182018911CE0088040000584AD863BC5FBD2E9C2E7926
      7922561A561EB719393618327932000000001021D315F400F400150115017D67
      BF6FBE6FBF6FFA56CE0C72258A088904CC0000000077617F607F607F607F807F
      807F607F607F807F817F607F6E08000000008349A476C61C0000FA11BA013002
      5B0279025F023D020302C00184012F0588040000594AFD775F57DD2EBC2A981E
      781E781E7922D8197A367B360B15000000002C115B1E150136017701560DBF6B
      BF6BBF6BBF6F363E0E194F21EF10890889080000607F2077C27F607F807FA162
      2077807F607FE47F607FAC14000000000000636E653DA614C6187A22FC01C31A
      E626112F1F2B7F063B02E201A0010F05A9040000594EFD7BFD32FD2ADB22B81A
      BA1EBB22BB261A1A9C36FE3A000000000000EA0C770977019901BA01B6259F67
      9F679F679F67BF6B5D5F4D196F196804A804000000002073817F807FA07F032D
      4256807F807FA17F807F6D0C000000000000225EE379644586103A5F8B12252F
      6F3F6B43BF57FF1E5D020C02C001CA04EB040000594ADA67FC2AFB26FB22DA1E
      DD26DD26DE2A3C1ADD369A32000000000000CA0C5701B901DD012B0299469F63
      9F639F63BF67163E620582058A156704680400000000607B4077C17FE07F0400
      C920A07FE37F807FCC180000000000000000A0726176E379A151A6144E3B483B
      B253FC67BC570E275702DB013206C9044A010000594A583F3B331C331D33FC2A
      1E2FFF2EFE2A5D1AFF366E19000000000000EA149901DC01850A63165E5B7F5F
      7F5F5E5B7419EB01E3016D0185098704A8040000000000004073C17FE07F0500
      080CE07FE27FC07F4E0400000000000000000C6F487FA17EE169A618DE777743
      3837974B4A3FE4263D025A12CA08CC0000000000584E1B335D475F475F473D37
      3F3B1E331D2B7D1A1F3F00000000000000004D211A1AD719C11E25697F5BB766
      383E391A5E0216020002C0018401A9040A01000000000000807B807BE17F0200
      0800E27FA07FEB2000000000000000000000C355887F467F042DA614A518A714
      F85A5A4F1C33F646F4250A114A01000000000000594A5E439E577F537F535D43
      5E3F3C373C339C22BC36000000000000000055293D47047DA5328C5D69756B4D
      584F3F379F0E35020E02C401B101AA04080100000000000000006073E17F0000
      0100E27FE07F4E0400000000000000000000C618E355AC7F017B05298610A151
      0429A614A614C6180000000000000000000000003946BF5FBF5F9E577D535B43
      5C435C3F3C3BBD2A2C15000000000000000000006975873E0633373A933ED16A
      396B252FD1165602F80102020E05EC0000000000000000000000A07BA07BE17F
      E37FC07F2A250000000000000000000000000000C618E355AF7F427F436AE05D
      E37944418610A5180000000000000000000000007A4AD03DDF675152DF67724E
      9F531A5B9F579D32210000000000000000000000E47CAA75EF264F3F7B4B0D6E
      2C662633C51A1F02DB01B605EC0410000000000000000000000000008073E37F
      E47FE07F4E0400000000000000000000000000000000E71C0656FB7F447F017F
      216AE3792431C618000000000000000000000000D6351842124A183E124A1742
      544E344A9C4AB45E0000000000000000000000000000E47C516A915E2579AB56
      493B0227A3167F12D4110D0910000000000000000000000000000000C07BE07F
      E07F492900000000000000000000000000000000000000000821A35503568A7F
      257F216AA618A514000000000000000000000000990D4E4A2300AC52CA100A67
      2D19296F0F46885A000000000000000000000000E47CE47CA254E47C1A4BAB6D
      1B3FDA3636262D112D110000000000000000000000000000000000000000E07F
      E07F00000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000803FCEE7FC3F0000001F86E7E00F0000
      000F86E7C0070000000786E78003CC7F800386C380016B00E001868100010000
      E00186C300000000E001028100000000E0014AA500000000E00102A500000000
      E001028100010000E001028100010000F0007ABD80010000F001CEE7C0030000
      F00386C3E0070000F207CEE7F01F0000000380FFF80380010001800FE0010001
      0000800FC0010001000080038001000110008001000000031000800100008003
      1000800100008007000080030000C007000080030000C00F000080030000E00F
      000180070000E01F000380070000F01F001F80078001F03F801F800F8001F83F
      C01F800FC003F87FE01F800F8007FCFF00000000000000000000000000000000
      000000000000}
  end
  object tblKfzt: TTable
    DatabaseName = 'LfHotelUser'
    FieldDefs = <
      item
        Name = 'D_KFBH'
        Attributes = [faRequired]
        DataType = ftString
        Size = 5
      end
      item
        Name = 'D_ZDBH'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'D_KRBH'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'D_YJBH'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'D_SJFJ'
        DataType = ftFloat
      end
      item
        Name = 'D_KFZT'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'D_KFBZ'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'D_KRSL'
        DataType = ftInteger
      end
      item
        Name = 'D_DHKT'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'D_BZFJ'
        DataType = ftFloat
      end
      item
        Name = 'D_CWS'
        DataType = ftInteger
      end
      item
        Name = 'D_BJS'
        DataType = ftInteger
      end
      item
        Name = 'D_QJS'
        DataType = ftInteger
      end
      item
        Name = 'D_JJFJ'
        DataType = ftFloat
      end
      item
        Name = 'D_FXBH'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'D_LCBH'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'D_KRXM'
        DataType = ftString
        Size = 30
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY68'
        Fields = 'D_KFBH'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'KFZT'
        Fields = 'D_LCBH;D_KFBH'
      end>
    IndexFieldNames = 'D_LCBH;D_KFBH'
    StoreDefs = True
    TableName = 'KFZT'
    Left = 32
    Top = 128
  end
  object qryTd: TQuery
    DatabaseName = 'LfHotelUser'
    SQL.Strings = (
      'select * from KRXX where D_KRLX="T" order by D_DDRQ,D_DDSJ')
    Left = 32
    Top = 280
  end
  object qryYdhc: TQuery
    DatabaseName = 'LfHotelUser'
    SQL.Strings = (
      
        'select * from YDHC where (D_SYRQ>=:RQ)and(D_JSBZ="1") order by D' +
        '_SYRQ,D_SYSJ')
    Left = 32
    Top = 320
    ParamData = <
      item
        DataType = ftDate
        Name = 'RQ'
        ParamType = ptInput
      end>
  end
  object qryYdcy: TQuery
    DatabaseName = 'LfHotelUser'
    Filtered = True
    SQL.Strings = (
      'select * from YDCY where D_CTBH<>"0" order by D_SYRQ,D_SYSJ')
    Left = 32
    Top = 352
  end
  object qryYdkf: TQuery
    DatabaseName = 'LfHotelUser'
    Filtered = True
    SQL.Strings = (
      'select * from YDKF where D_KFBH<>"0" order by D_DDRQ,D_DDSJ')
    Left = 32
    Top = 384
  end
  object dsXxbd: TDataSource
    DataSet = qryXxbd
    Left = 224
    Top = 440
  end
  object dsKfzt: TDataSource
    DataSet = qryKfxx
    Left = 176
    Top = 240
  end
  object dsQryTd: TDataSource
    DataSet = qryTd
    Left = 64
    Top = 280
  end
  object qryKfzt: TQuery
    DatabaseName = 'LfHotelUser'
    SQL.Strings = (
      'select * from KFZT where D_KRBH=:KRBH')
    Left = 32
    Top = 424
    ParamData = <
      item
        DataType = ftString
        Name = 'KRBH'
        ParamType = ptInput
      end>
  end
  object tblCtdm: TTable
    DatabaseName = 'LfHotelUser'
    Filter = 'D_CTLB='#39#21488#21495#39
    Filtered = True
    TableName = 'CTDM'
    Left = 64
    Top = 352
  end
  object qryCyTdMaster: TQuery
    DatabaseName = 'LfHotelUser'
    SQL.Strings = (
      'select * from YDCY where (D_YDBZ="T")and(D_CTBH<>"0")')
    Left = 120
    Top = 288
    object qryCyTdMasterD_YDBH: TStringField
      FieldName = 'D_YDBH'
      Origin = 'LFHOTELUSER.YDCY.D_YDBH'
      Size = 12
    end
    object qryCyTdMasterD_CTBH: TStringField
      FieldName = 'D_CTBH'
      Origin = 'LFHOTELUSER.YDCY.D_CTBH'
      Size = 5
    end
    object qryCyTdMasterD_CTMC: TStringField
      FieldName = 'D_CTMC'
      Origin = 'LFHOTELUSER.YDCY.D_CTMC'
      Size = 10
    end
    object qryCyTdMasterD_KRBH: TStringField
      FieldName = 'D_KRBH'
      Origin = 'LFHOTELUSER.YDCY.D_KRBH'
      Size = 12
    end
    object qryCyTdMasterD_KRXM: TStringField
      FieldName = 'D_KRXM'
      Origin = 'LFHOTELUSER.YDCY.D_KRXM'
      Size = 30
    end
    object qryCyTdMasterD_YDRQ: TDateTimeField
      FieldName = 'D_YDRQ'
      Origin = 'LFHOTELUSER.YDCY.D_YDRQ'
    end
    object qryCyTdMasterD_SYRQ: TDateTimeField
      FieldName = 'D_SYRQ'
      Origin = 'LFHOTELUSER.YDCY.D_SYRQ'
    end
    object qryCyTdMasterD_SYSJ: TDateTimeField
      FieldName = 'D_SYSJ'
      Origin = 'LFHOTELUSER.YDCY.D_SYSJ'
    end
    object qryCyTdMasterD_SJDM: TStringField
      FieldName = 'D_SJDM'
      Origin = 'LFHOTELUSER.YDCY.D_SJDM'
      FixedChar = True
      Size = 4
    end
    object qryCyTdMasterD_YCBZ: TStringField
      FieldName = 'D_YCBZ'
      Origin = 'LFHOTELUSER.YDCY.D_YCBZ'
      Size = 30
    end
    object qryCyTdMasterD_YCLX: TIntegerField
      FieldName = 'D_YCLX'
      Origin = 'LFHOTELUSER.YDCY.D_YCLX'
    end
    object qryCyTdMasterD_RS: TIntegerField
      FieldName = 'D_RS'
      Origin = 'LFHOTELUSER.YDCY.D_RS'
    end
    object qryCyTdMasterD_XFSL: TFloatField
      FieldName = 'D_XFSL'
      Origin = 'LFHOTELUSER.YDCY.D_XFSL'
    end
    object qryCyTdMasterD_XFJE: TFloatField
      FieldName = 'D_XFJE'
      Origin = 'LFHOTELUSER.YDCY.D_XFJE'
    end
    object qryCyTdMasterD_YDBZ: TStringField
      FieldName = 'D_YDBZ'
      Origin = 'LFHOTELUSER.YDCY.D_YDBZ'
      FixedChar = True
      Size = 1
    end
    object qryCyTdMasterD_RZBZ: TStringField
      FieldName = 'D_RZBZ'
      Origin = 'LFHOTELUSER.YDCY.D_RZBZ'
      OnGetText = qryCyTdMasterD_RZBZGetText
      FixedChar = True
      Size = 1
    end
    object qryCyTdMasterD_KTBZ: TStringField
      FieldName = 'D_KTBZ'
      Origin = 'LFHOTELUSER.YDCY.D_KTBZ'
      FixedChar = True
      Size = 1
    end
    object qryCyTdMasterD_JSBZ: TStringField
      FieldName = 'D_JSBZ'
      Origin = 'LFHOTELUSER.YDCY.D_JSBZ'
      FixedChar = True
      Size = 1
    end
    object qryCyTdMasterD_BZ: TBlobField
      FieldName = 'D_BZ'
      Origin = 'LFHOTELUSER.YDCY.D_BZ'
      Size = 1
    end
    object qryCyTdMasterD_CZYXM: TStringField
      FieldName = 'D_CZYXM'
      Origin = 'LFHOTELUSER.YDCY.D_CZYXM'
      Size = 8
    end
  end
  object dsCyTdMaster: TDataSource
    DataSet = qryCyTdMaster
    Left = 120
    Top = 320
  end
  object qryKfxx: TQuery
    DatabaseName = 'LfHotelUser'
    SQL.Strings = (
      'select a.D_KFBH,a.D_SJFJ,b.D_KRXM,b.D_DDRQ,'
      '       b.D_DDSJ,a.D_BJS,a.D_QJS,a.D_JJFJ,'
      '       b.D_XB,b.D_JTDZ,b.D_NZTS'
      '       from KFZT a,KRXX b '
      '       where (a.D_KRBH=b.D_KRBH)'
      '          and((a.D_KFZT="F")'
      '           or(a.D_KFZT="T")'
      '           or(a.D_KFZT="M"))'
      '       order by a.D_LCBH,a.D_KFBH')
    Left = 208
    Top = 240
    object qryKfxxD_KFBH: TStringField
      FieldName = 'D_KFBH'
      Origin = 'LFHOTELUSER.KFZT.D_KFBH'
      Size = 5
    end
    object qryKfxxD_SJFJ: TFloatField
      FieldName = 'D_SJFJ'
      Origin = 'LFHOTELUSER.KFZT.D_SJFJ'
      DisplayFormat = '#.##'
    end
    object qryKfxxD_KRXM: TStringField
      FieldName = 'D_KRXM'
      Origin = 'LFHOTELUSER.KRXX.D_KRXM'
      Size = 30
    end
    object qryKfxxD_DDRQ: TDateTimeField
      FieldName = 'D_DDRQ'
      Origin = 'LFHOTELUSER.KRXX.D_DDRQ'
      DisplayFormat = 'yyyy-mm-dd'
    end
    object qryKfxxD_DDSJ: TDateTimeField
      FieldName = 'D_DDSJ'
      Origin = 'LFHOTELUSER.KRXX.D_DDSJ'
      DisplayFormat = 'hh:nn:ss'
    end
    object qryKfxxD_BJS: TIntegerField
      FieldName = 'D_BJS'
      Origin = 'LFHOTELUSER.KFZT.D_BJS'
    end
    object qryKfxxD_QJS: TIntegerField
      FieldName = 'D_QJS'
      Origin = 'LFHOTELUSER.KFZT.D_QJS'
    end
    object qryKfxxD_JJFJ: TFloatField
      FieldName = 'D_JJFJ'
      Origin = 'LFHOTELUSER.KFZT.D_JJFJ'
      DisplayFormat = '#.##'
    end
    object qryKfxxD_XB: TStringField
      FieldName = 'D_XB'
      Origin = 'LFHOTELUSER.KRXX.D_XB'
      Size = 2
    end
    object qryKfxxD_NZTS: TIntegerField
      FieldName = 'D_NZTS'
      Origin = 'LFHOTELUSER.KRXX.D_NZTS'
    end
    object qryKfxxD_JTDZ: TStringField
      FieldName = 'D_JTDZ'
      Origin = 'LFHOTELUSER.KRXX.D_JTDZ'
      Size = 30
    end
  end
  object qryXxbd: TQuery
    DatabaseName = 'LfHotelUser'
    SQL.Strings = (
      'select a.D_KRBH,b.D_KFBH,a.D_KRXM from KRXX a,KFZT b where '
      '   (a.D_KRBH=b.D_KRBH)and(a.D_KRLX<>"T") '
      '   and ((a.D_ZJHM ="") or (a.D_JTDZ ="") or (a.D_DWMC=""))'
      '  order by b.D_LCBH,b.D_KFBH')
    Left = 192
    Top = 440
  end
  object qryTd1: TQuery
    DatabaseName = 'LfHotelUser'
    Left = 32
    Top = 248
  end
  object ColorDialog1: TColorDialog
    Ctl3D = True
    Left = 160
    Top = 160
  end
  object AiHint1: TAiHint
    Shandow = False
    HintFont.Font.Charset = GB2312_CHARSET
    HintFont.Font.Color = clBlack
    HintFont.Font.Height = -19
    HintFont.Font.Name = #26999#20307'_GB2312'
    HintFont.Font.Pitch = fpVariable
    HintFont.Font.Style = [fsBold]
    HintFont.ShandowColor = clGray
    Color = clYellow
    BackColor = clGray
    BackWidth = 1
    MaxWidth = 500
    Left = 568
    Top = 56
  end
end
