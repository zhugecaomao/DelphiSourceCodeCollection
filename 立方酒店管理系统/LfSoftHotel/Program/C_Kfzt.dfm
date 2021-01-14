inherited KfztForm: TKfztForm
  Left = 84
  Top = 74
  Width = 734
  Height = 500
  Caption = #25151#24577#30424
  FormStyle = fsMDIChild
  OldCreateOrder = True
  Position = poDesigned
  Visible = True
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Width = 726
    Height = 50
    inherited lblTitle: TLabel
      Left = 288
      Top = 7
      Width = 249
      Caption = #27494#36827#23486#39302#31649#29702#31995#32479
      Transparent = True
    end
    inherited Image1: TImage
      Left = 224
    end
    object Label7: TLabel
      Left = 287
      Top = 6
      Width = 249
      Height = 29
      Anchors = [akTop]
      Caption = #27494#36827#23486#39302#31649#29702#31995#32479
      Font.Charset = GB2312_CHARSET
      Font.Color = clWhite
      Font.Height = -29
      Font.Name = #26999#20307'_GB2312'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
      Transparent = True
    end
  end
  inherited Panel2: TPanel
    Top = 50
    Width = 726
    Height = 390
    object PageControl1: TPageControl
      Left = 5
      Top = 5
      Width = 716
      Height = 380
      ActivePage = TabSheet1
      Align = alClient
      HotTrack = True
      Images = ImageList2
      MultiLine = True
      Style = tsButtons
      TabIndex = 0
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = #23458#25151#29366#24577
        object Chart2: TChart
          Left = 680
          Top = 0
          Width = 28
          Height = 348
          BackWall.Brush.Color = clWhite
          BackWall.Brush.Style = bsClear
          Gradient.EndColor = 16744576
          Gradient.Visible = True
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
          Align = alClient
          BorderStyle = bsSingle
          TabOrder = 0
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
        object Panel7: TPanel
          Left = 0
          Top = 0
          Width = 680
          Height = 348
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 1
          object sgdKfzt: TStringGrid
            Left = 0
            Top = 0
            Width = 680
            Height = 307
            Align = alClient
            DefaultColWidth = 30
            DefaultRowHeight = 30
            FixedCols = 0
            FixedRows = 0
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = #23435#20307
            Font.Style = []
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goThumbTracking]
            ParentFont = False
            PopupMenu = PopupMenu1
            TabOrder = 0
            OnDblClick = sgdKfztDblClick
            OnDrawCell = sgdKfztDrawCell
            OnSelectCell = sgdKfztSelectCell
          end
          object Panel8: TPanel
            Left = 0
            Top = 307
            Width = 680
            Height = 41
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 1
            object lblTdmc1: TStaticText
              Left = 8
              Top = 4
              Width = 120
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
            end
            object lblTdmc2: TStaticText
              Left = 144
              Top = 4
              Width = 120
              Height = 16
              AutoSize = False
              BorderStyle = sbsSingle
              Color = clGreen
              Font.Charset = GB2312_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = #23435#20307
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 1
            end
            object lblTdmc3: TStaticText
              Left = 280
              Top = 4
              Width = 120
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
              TabOrder = 2
            end
            object lblTdmc4: TStaticText
              Left = 416
              Top = 4
              Width = 120
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
            end
            object lblTdmc5: TStaticText
              Left = 552
              Top = 4
              Width = 120
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
            end
            object lblTdmc6: TStaticText
              Left = 8
              Top = 22
              Width = 120
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
            end
            object lblTdmc7: TStaticText
              Left = 144
              Top = 22
              Width = 120
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
            end
            object lblTdmc8: TStaticText
              Left = 280
              Top = 22
              Width = 120
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
            end
            object lblTdmc9: TStaticText
              Left = 416
              Top = 22
              Width = 120
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
            end
            object lblTdmc10: TStaticText
              Left = 552
              Top = 22
              Width = 120
              Height = 16
              AutoSize = False
              BorderStyle = sbsSingle
              Color = clSkyBlue
              Font.Charset = GB2312_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = #23435#20307
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 9
            end
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = #20986#31199#29575#34920
        ImageIndex = 1
        object Chart1: TChart
          Left = 0
          Top = 0
          Width = 708
          Height = 340
          AllowPanning = pmNone
          AllowZoom = False
          BackWall.Brush.Color = clWhite
          BackWall.Brush.Style = bsClear
          BackWall.Pen.Visible = False
          Gradient.Direction = gdBottomTop
          Gradient.EndColor = 16744576
          Gradient.Visible = True
          Title.Color = clYellow
          Title.Font.Charset = GB2312_CHARSET
          Title.Font.Color = clBlue
          Title.Font.Height = -21
          Title.Font.Name = #23435#20307
          Title.Font.Style = [fsBold]
          Title.Frame.Visible = True
          Title.Text.Strings = (
            #20986#31199#29575#34920)
          AxisVisible = False
          ClipPoints = False
          Frame.Visible = False
          LeftAxis.LabelsFont.Charset = GB2312_CHARSET
          LeftAxis.LabelsFont.Color = clBlack
          LeftAxis.LabelsFont.Height = -12
          LeftAxis.LabelsFont.Name = #23435#20307
          LeftAxis.LabelsFont.Style = []
          Legend.Font.Charset = GB2312_CHARSET
          Legend.Font.Color = clBlack
          Legend.Font.Height = -12
          Legend.Font.Name = #23435#20307
          Legend.Font.Style = []
          View3DOptions.Elevation = 315
          View3DOptions.Orthogonal = False
          View3DOptions.Perspective = 0
          View3DOptions.Rotation = 360
          View3DWalls = False
          Align = alClient
          BevelOuter = bvNone
          BorderStyle = bsSingle
          Color = clSilver
          TabOrder = 0
          object Series1: TPieSeries
            Marks.ArrowLength = 8
            Marks.Font.Charset = GB2312_CHARSET
            Marks.Font.Color = clBlack
            Marks.Font.Height = -12
            Marks.Font.Name = #23435#20307
            Marks.Font.Style = []
            Marks.Style = smsLabelPercent
            Marks.Visible = True
            SeriesColor = clRed
            OtherSlice.Text = 'Other'
            PieValues.DateTime = False
            PieValues.Name = 'Pie'
            PieValues.Multiplier = 1
            PieValues.Order = loNone
          end
        end
      end
      object TabSheet3: TTabSheet
        Caption = #23458#25151#20449#24687
        ImageIndex = 2
        object DBGrid1: TDBGrid
          Left = 0
          Top = 0
          Width = 608
          Height = 348
          Align = alClient
          Color = clMoneyGreen
          DataSource = dsKfzt
          FixedColor = 12615680
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = GB2312_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          Columns = <
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'D_KFBH'
              Title.Alignment = taCenter
              Title.Caption = #25151#38388#21495
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'D_SJFJ'
              Title.Alignment = taCenter
              Title.Caption = #25151#20215
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'D_KRXM'
              Title.Alignment = taCenter
              Title.Caption = #22995#21517
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'D_DDRQ'
              Title.Alignment = taCenter
              Title.Caption = #21040#24215#26085#26399
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'D_DDSJ'
              Title.Alignment = taCenter
              Title.Caption = #21040#24215#26102#38388
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'D_BJS'
              Title.Alignment = taCenter
              Title.Caption = #21322#20215#25968
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'D_QJS'
              Title.Alignment = taCenter
              Title.Caption = #20840#20215#25968
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'D_JJFJ'
              Title.Alignment = taCenter
              Title.Caption = #38388#25509#25151#20215
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'D_KFZT'
              Title.Alignment = taCenter
              Title.Caption = #23458#25151#29366#24577
              Visible = True
            end>
        end
        object Panel5: TPanel
          Left = 608
          Top = 0
          Width = 100
          Height = 348
          Align = alRight
          BevelOuter = bvLowered
          Color = 12615808
          TabOrder = 1
          object BitBtn10: TBitBtn
            Left = 12
            Top = 16
            Width = 75
            Height = 25
            Caption = #25151#20215#21464#26356
            TabOrder = 0
            OnClick = BitBtn10Click
          end
          object BitBtn11: TBitBtn
            Left = 12
            Top = 48
            Width = 75
            Height = 25
            Caption = #21322#20840#20215
            TabOrder = 1
            OnClick = BitBtn11Click
          end
        end
      end
      object TabSheet5: TTabSheet
        Caption = #22242#38431#31649#29702
        ImageIndex = 4
        object DBGrid2: TDBGrid
          Left = 0
          Top = 0
          Width = 608
          Height = 348
          Align = alClient
          Color = clMoneyGreen
          DataSource = dsQryTd
          FixedColor = 12615680
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = GB2312_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          Columns = <
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'D_KRXM'
              Title.Alignment = taCenter
              Title.Caption = #22242#38431#21517#31216
              Width = 150
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'D_DDRQ'
              Title.Alignment = taCenter
              Title.Caption = #21040#24215#26085#26399
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'D_DDSJ'
              Title.Alignment = taCenter
              Title.Caption = #21040#24215#26102#38388
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'D_NZTS'
              Title.Alignment = taCenter
              Title.Caption = #25311#20303#22825#25968
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'D_JDR'
              Title.Alignment = taCenter
              Title.Caption = #25509#24453#20154
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'D_JDDW'
              Title.Alignment = taCenter
              Title.Caption = #25509#24453#21333#20301
              Width = 175
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'D_LXDH'
              Title.Caption = #32852#31995#30005#35805
              Visible = True
            end>
        end
        object Panel4: TPanel
          Left = 608
          Top = 0
          Width = 100
          Height = 348
          Align = alRight
          BevelOuter = bvLowered
          Color = 12615808
          TabOrder = 1
          object BitBtn1: TBitBtn
            Left = 12
            Top = 41
            Width = 75
            Height = 25
            Caption = #34917#30331#25151#38388
            TabOrder = 0
            OnClick = BitBtn1Click
          end
          object BitBtn2: TBitBtn
            Left = 12
            Top = 74
            Width = 75
            Height = 25
            Caption = #22242#38431#36864#25151
            TabOrder = 1
            OnClick = BitBtn2Click
          end
          object BitBtn3: TBitBtn
            Left = 12
            Top = 107
            Width = 75
            Height = 25
            Caption = #22242#38431#32467#24080
            TabOrder = 2
            OnClick = BitBtn3Click
          end
          object BitBtn4: TBitBtn
            Left = 12
            Top = 140
            Width = 75
            Height = 25
            Caption = #34917#20132#25276#37329
            TabOrder = 3
            OnClick = BitBtn4Click
          end
          object BitBtn5: TBitBtn
            Left = 12
            Top = 173
            Width = 75
            Height = 25
            Caption = #21464#26356#25276#37329
            TabOrder = 4
            OnClick = BitBtn5Click
          end
          object BitBtn7: TBitBtn
            Left = 12
            Top = 208
            Width = 75
            Height = 25
            Caption = #39044#20808#32467#24080
            TabOrder = 5
            OnClick = BitBtn7Click
          end
          object BitBtn8: TBitBtn
            Left = 12
            Top = 341
            Width = 75
            Height = 25
            Caption = #29992#25151#24773#20917
            TabOrder = 6
            OnClick = BitBtn8Click
          end
          object BitBtn9: TBitBtn
            Left = 12
            Top = 8
            Width = 75
            Height = 25
            Caption = #22242#38431#30331#35760
            TabOrder = 7
            OnClick = BitBtn9Click
          end
          object BitBtn12: TBitBtn
            Left = 12
            Top = 307
            Width = 75
            Height = 25
            Caption = #20449#24687#20462#25913
            TabOrder = 8
            OnClick = BitBtn12Click
          end
          object BitBtn14: TBitBtn
            Left = 12
            Top = 241
            Width = 75
            Height = 25
            Caption = #22242#24080#26597#35810
            TabOrder = 9
            OnClick = BitBtn14Click
          end
          object BitBtn15: TBitBtn
            Left = 12
            Top = 274
            Width = 75
            Height = 25
            Caption = #21462#28040#25151#38388
            TabOrder = 10
            OnClick = BitBtn15Click
          end
        end
      end
      object TabSheet4: TTabSheet
        Caption = #20449#24687#34917#30331
        ImageIndex = 5
        object DBGrid3: TDBGrid
          Left = 0
          Top = 0
          Width = 708
          Height = 348
          Align = alClient
          Color = clMoneyGreen
          DataSource = dsXxbd
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = GB2312_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
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
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'D_XB'
              Title.Alignment = taCenter
              Title.Caption = #24615#21035
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'D_DDRQ'
              Title.Alignment = taCenter
              Title.Caption = #21040#24215#26085#26399
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'D_DDSJ'
              Title.Alignment = taCenter
              Title.Caption = #21040#28857#26102#38388
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'D_JTDZ'
              Title.Alignment = taCenter
              Title.Caption = #23478#24237#22320#22336
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'D_DWMC'
              Title.Alignment = taCenter
              Title.Caption = #21333#20301#21517#31216
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'D_NZTS'
              Title.Alignment = taCenter
              Title.Caption = #25311#20303#22825#25968
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'D_TLSY'
              Title.Alignment = taCenter
              Title.Caption = #20572#30041#20107#30001
              Visible = True
            end>
        end
      end
      object TabSheet6: TTabSheet
        Caption = #39044#23450#24773#20917
        ImageIndex = 6
        object Panel6: TPanel
          Left = 592
          Top = 0
          Width = 116
          Height = 348
          Align = alRight
          BevelOuter = bvLowered
          Color = 12615808
          TabOrder = 0
          object btnYdhc: TBitBtn
            Left = 24
            Top = 73
            Width = 75
            Height = 25
            Caption = #39044#23450#20250#22330
            TabOrder = 0
            OnClick = btnYdhcClick
          end
          object btnYdRefresh: TBitBtn
            Left = 24
            Top = 8
            Width = 75
            Height = 25
            Caption = #21047#26032
            TabOrder = 1
            OnClick = btnYdRefreshClick
          end
          object btnYdxx: TBitBtn
            Left = 24
            Top = 40
            Width = 75
            Height = 25
            Caption = #39044#23450#20449#24687
            TabOrder = 2
            OnClick = btnYdxxClick
          end
          object btnHcjs: TBitBtn
            Left = 24
            Top = 106
            Width = 75
            Height = 25
            Caption = #20250#22330#32467#31639
            TabOrder = 3
            OnClick = btnHcjsClick
          end
          object btnYdClear: TBitBtn
            Left = 24
            Top = 270
            Width = 75
            Height = 25
            Caption = #39044#23450#28165#29702
            TabOrder = 4
            OnClick = btnYdClearClick
          end
          object btnYdcysk: TBitBtn
            Left = 24
            Top = 139
            Width = 75
            Height = 25
            Caption = #25955#23458#39184#39278
            TabOrder = 5
            OnClick = btnYdcyskClick
          end
          object btnYdcytd: TBitBtn
            Left = 24
            Top = 171
            Width = 75
            Height = 25
            Caption = #22242#38431#39184#39278
            TabOrder = 6
            OnClick = btnYdcytdClick
          end
          object btnYdkfsk: TBitBtn
            Left = 24
            Top = 204
            Width = 75
            Height = 25
            Caption = #25955#23458#23458#25151
            TabOrder = 7
            OnClick = btnYdkfskClick
          end
          object btnYdkftd: TBitBtn
            Left = 24
            Top = 237
            Width = 75
            Height = 25
            Caption = #22242#38431#23458#25151
            TabOrder = 8
            OnClick = btnYdkftdClick
          end
          object BitBtn17: TBitBtn
            Left = 24
            Top = 304
            Width = 75
            Height = 25
            Caption = #39044#23450#35828#26126
            TabOrder = 9
            OnClick = BitBtn17Click
          end
        end
        object PageControl2: TPageControl
          Left = 0
          Top = 0
          Width = 592
          Height = 348
          ActivePage = TabSheet7
          Align = alClient
          Style = tsButtons
          TabIndex = 0
          TabOrder = 1
          object TabSheet7: TTabSheet
            Caption = #20250#22330
            object sgdYdhc: TStringGrid
              Left = 0
              Top = 0
              Width = 584
              Height = 318
              Align = alClient
              DefaultColWidth = 110
              DefaultRowHeight = 80
              FixedCols = 0
              FixedRows = 0
              Font.Charset = GB2312_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = #23435#20307
              Font.Style = []
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goThumbTracking]
              ParentFont = False
              TabOrder = 0
              OnDblClick = sgdYdhcDblClick
              OnDrawCell = sgdYdhcDrawCell
              OnSelectCell = sgdYdhcSelectCell
            end
          end
          object TabSheet8: TTabSheet
            Caption = #39184#39278
            ImageIndex = 1
            object sgdYdcy: TStringGrid
              Left = 0
              Top = 0
              Width = 584
              Height = 310
              Align = alClient
              DefaultColWidth = 110
              DefaultRowHeight = 80
              FixedCols = 0
              FixedRows = 0
              Font.Charset = GB2312_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = #23435#20307
              Font.Style = []
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goThumbTracking]
              ParentFont = False
              TabOrder = 0
              OnDblClick = sgdYdcyDblClick
              OnDrawCell = sgdYdcyDrawCell
              OnSelectCell = sgdYdcySelectCell
            end
          end
          object TabSheet9: TTabSheet
            Caption = #23458#25151
            ImageIndex = 2
            object sgdYdkf: TStringGrid
              Left = 0
              Top = 0
              Width = 584
              Height = 310
              Align = alClient
              DefaultColWidth = 110
              DefaultRowHeight = 80
              FixedCols = 0
              FixedRows = 0
              Font.Charset = GB2312_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = #23435#20307
              Font.Style = []
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goThumbTracking]
              ParentFont = False
              TabOrder = 0
              OnDblClick = sgdYdkfDblClick
              OnDrawCell = sgdYdkfDrawCell
              OnSelectCell = sgdYdkfSelectCell
            end
          end
        end
      end
    end
  end
  inherited Panel3: TPanel
    Top = 440
    Width = 726
    Height = 33
    inherited btnHelp: TBitBtn
      Left = 563
      Visible = False
    end
    inherited btnClose: TBitBtn
      Left = 640
      Visible = False
    end
    object btnFtdh: TBitBtn
      Left = 367
      Top = 2
      Width = 75
      Height = 25
      Caption = #25151#24577#23548#33322
      TabOrder = 2
      OnClick = btnFtdhClick
    end
    object btnRefresh: TBitBtn
      Left = 205
      Top = 2
      Width = 75
      Height = 25
      Caption = #21047#26032#25151#24577
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = btnRefreshClick
      NumGlyphs = 2
    end
    object BitBtn16: TBitBtn
      Left = 286
      Top = 2
      Width = 75
      Height = 25
      Caption = #25151#24577#35828#26126
      TabOrder = 4
      OnClick = BitBtn16Click
    end
    object lblTime: TStaticText
      Left = 9
      Top = 1
      Width = 185
      Height = 26
      Anchors = [akTop]
      BevelEdges = [beLeft, beTop, beBottom]
      BorderStyle = sbsSingle
      Caption = '2002-01-01 01:01:01'
      Color = clBlack
      Font.Charset = ANSI_CHARSET
      Font.Color = clLime
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 5
    end
  end
  inherited DosMove1: TDosMove
    Left = 208
    Top = 144
  end
  object tblKfzt: TTable
    DatabaseName = 'LFHOTELSYS'
    FieldDefs = <
      item
        Name = 'D_KFBH'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'D_LCBH'
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
        DataType = ftCurrency
      end
      item
        Name = 'D_KFZT'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'D_KFBZ'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'D_KRSL'
        DataType = ftSmallint
      end
      item
        Name = 'D_DHKT'
        DataType = ftBoolean
      end
      item
        Name = 'D_BZFJ'
        DataType = ftCurrency
      end
      item
        Name = 'D_CWS'
        DataType = ftSmallint
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
        DataType = ftCurrency
      end
      item
        Name = 'D_FXBH'
        DataType = ftString
        Size = 5
      end>
    IndexDefs = <
      item
        Name = 'tblKfztIndex1'
        Fields = 'D_KFBH;D_LCBH'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'KFZT.db'
    Left = 400
    Top = 128
    object tblKfztD_KFBH: TStringField
      FieldName = 'D_KFBH'
      Size = 5
    end
    object tblKfztD_ZDBH: TStringField
      FieldName = 'D_ZDBH'
      Size = 12
    end
    object tblKfztD_KRBH: TStringField
      FieldName = 'D_KRBH'
      Size = 12
    end
    object tblKfztD_YJBH: TStringField
      FieldName = 'D_YJBH'
      Size = 12
    end
    object tblKfztD_SJFJ: TCurrencyField
      FieldName = 'D_SJFJ'
    end
    object tblKfztD_KFZT: TStringField
      FieldName = 'D_KFZT'
      OnGetText = tblKfztD_KFZTGetText
      Size = 1
    end
    object tblKfztD_KFBZ: TStringField
      FieldName = 'D_KFBZ'
      Size = 1
    end
    object tblKfztD_KRSL: TSmallintField
      FieldName = 'D_KRSL'
    end
    object tblKfztD_DHKT: TBooleanField
      FieldName = 'D_DHKT'
    end
    object tblKfztD_BZFJ: TCurrencyField
      FieldName = 'D_BZFJ'
    end
    object tblKfztD_CWS: TSmallintField
      FieldName = 'D_CWS'
    end
    object tblKfztD_BJS: TIntegerField
      FieldName = 'D_BJS'
    end
    object tblKfztD_QJS: TIntegerField
      FieldName = 'D_QJS'
    end
    object tblKfztD_JJFJ: TCurrencyField
      FieldName = 'D_JJFJ'
    end
    object tblKfztD_FXBH: TStringField
      FieldName = 'D_FXBH'
      Size = 5
    end
    object tblKfztD_LCBH: TStringField
      FieldName = 'D_LCBH'
      Size = 5
    end
    object tblKfztD_KRXM: TStringField
      FieldKind = fkLookup
      FieldName = 'D_KRXM'
      LookupDataSet = tblKrxx
      LookupKeyFields = 'D_KRBH'
      LookupResultField = 'D_KRXM'
      KeyFields = 'D_KRBH'
      Lookup = True
    end
    object tblKfztD_DDRQ: TDateField
      FieldKind = fkLookup
      FieldName = 'D_DDRQ'
      LookupDataSet = tblKrxx
      LookupKeyFields = 'D_KRBH'
      LookupResultField = 'D_DDRQ'
      KeyFields = 'D_KRBH'
      Lookup = True
    end
    object tblKfztD_DDSJ: TTimeField
      FieldKind = fkLookup
      FieldName = 'D_DDSJ'
      LookupDataSet = tblKrxx
      LookupKeyFields = 'D_KRBH'
      LookupResultField = 'D_DDSJ'
      KeyFields = 'D_KRBH'
      Lookup = True
    end
  end
  object ImageList1: TImageList
    DrawingStyle = dsTransparent
    Left = 96
    Top = 144
    Bitmap = {
      494C010106000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001001000000000000018
      00000000000000000000000000000000000000000000016A446AFF7FFF7F666E
      856E8472A372A272806E0062FF7F0000000000000000E500F01DD132764B1447
      93323322D319930DCE04B11195210000000000004205C155E261E6292516F75A
      1A5FB95699529A52CA14AA140000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000226A666E9A7B8A72FF7F
      FF7FC772C472C272A1722066FF7F000000000000BD732F22742AB42EB7577553
      B33A3226D219710D6900DC0D195F000000000000E25D667E667E467EE9183867
      794E194219429952A910CC180000000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000246A686EFF7FCD72896E
      FE7F0E77C472C372A2722166FF7F000000000000923EB332772A3122D75B955B
      D242302AAF192D0DAD046A00000000000000603D877EA87EA87E887E0329373E
      F83D782D782DA80CAA104A29000000000000FF7FFF7FFF7FFF7FFF7FF85EB756
      544A3546B9521B5BBF5B6F29E71C31468D3100000000456E896EAA72FF7FCD72
      A972FF7FFF7FFF7F836E2366FF7F0000000000002F2A163FD6156911F75FF667
      124B2E2EAD19C908CA0000000000000000004039C97EEA7EEA7EEA7E05565A16
      DF1AFE36D83D8708A90CAB140000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000466EAB72AB728A6EFF7F
      AA72666E646EC972FE7F2462FF7F000000000000B33E57471401FF7FA01C202D
      02114D322811A50C000000000000000000004139E35D246E045EC45D2625BC26
      1F27FF26B92A6F19EA1CC8144A2900000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000676EAC72AC728A6E9A7B
      676E666EAB72446EFF7F2462FF7F000000000000BC6FB8571B01C045847FE37F
      2262C100FE7F0000000000000000000000000000255EEE72EF72476678263F33
      3F373F371E2FC87AC251A610E61C08210000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000686ECE72CD72AB72987B
      CE72676EFF7F456EFF7F0562FF7F00000000000000007247093EE47F0600E17F
      E07EF3000E0000000000000000000000000000000000403D844178323F3B7F43
      7F475E43342E6466EA7E2431C614C61CE7280000000000000000000000000000
      00000000000000000000000000000000000000000000896E1177EE72CC72AB72
      FF7F1177AB72FE7FF0760462FF7F00000000000000009C67E17FB94EED153122
      F315960D3805573E00000000000000000000000000000000B6525F3B7F479F4F
      BF53F4526E7F4E7F2D7FEA7E6372860CC618FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000AB7234771077EE72CD72
      CC72777B997BCC72676E0462FF7F0000000000000000E9724141831DD232764B
      D53AF31933092B00000000000000000000000000000000005A6BFB427E4BFF5B
      FF63A46EB07F4C7BE772826AEA7E6472C618FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000FE7FAA72896E686E676E
      676E666E456E456E236A6966FF7F0000000000000000837FE47F4A56F032B65F
      334F0F262C0D0C1500000000000000000000000000000000F85E9D73F95E3446
      3546C46ED17F6D7BE772826A826AEA7EC614F75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EEF3D0000F75EFF7F0000000000000000000000000000
      000000000000000000000000000000000000000000000000FF7FFF7F4D2A104B
      CE4ACA2541000000000000000000000000000000000000000000000000000000
      F95E4762FB7F8E7B0873826A826A2D7FE61CFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BD73
      0B324F4200000000000000000000000000000000000000000000000000000000
      00004A29616EA46ABA7BBA7BE672C3510525FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7F000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7F000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7F000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000004501
      0902870100000000042D00000000000000000000000000001853DF6BBF63DF67
      1957AD2D0000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7F000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000008619AA22
      CA0E080281146662866AE54D00000000000000000000DF6BBF679F5F3D5BBB56
      9A529F5BBF639C6300000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000000000000D470C3F
      EC324D1A0177237B247BC46E823D00000000000000003E47BF631C63FB5E1D63
      31477557975FFF6FFF6F63080000000000000D1A4D223022F119B31174053501
      1C57FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FE105A516E822
      E822A71E04128604A608A80CA80C880C082100000000000000000D266B026B02
      EB1A7835607F217B217B607B605A0000000000009742DE3A7D6B5D6B3C675F6B
      600260026002620AFF6FF94A000000000000AA14FF7FFF7FFF7FFF7FFF7FFF7F
      FF7F000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000F23550168C028B02
      911DD439AA7A68760776A771C06A0000000000001D4B3F4FBE779E733C675E6B
      60026002FF7B734F77533F4F000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F260100000000F12DBA42761E6E02AB02
      96392D5EAA7668762776E67145650000000000003F4FFF7FFF7FDF7B9A527963
      7963734F734FDF6F0E373F4B000000000000D02E143FD33A532A141ED415950D
      F20418539E73FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F82052C338822
      FF7FCF3E4E3B451696527B6F574A3746880C0000E9149A3E9B3A7B3632020F06
      B735C87EA97A68762776C67144610004000000005F53FF7BFF7F794EDA5A595F
      DF77FF7B60026002FF6F5F53000000000000AA14FF7FFF7FFF7FFF7FFF7FFF7F
      FF7F000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000793A7A325A2A3922191ED529
      3056C97ACA7A68762776A6712469A2340000983EDF6BFF77FF7BDB5A1C633D67
      60020E3B620A6002FF6F9F5B000000000000FF7FFF7FFF7FFF7FFF7FFF7F016A
      446AFF7FFF7F666E856E8472A372A272806E0062FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FE500F01DF5295A2E3926181E181238123846
      0D7F48760776A57145714571456DE34800001C4FFF73FF73FF77FF77FF7BBB7B
      BF7760026002A61AFF6FDF676B2500000000B42EB7577553B33A3226D219710D
      6900DC0D195FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FE25D667E
      667E467EE9183867794E194219429952A9105926381E1812380E170E00000000
      CE728B760776857145714571456DE35000005F57FF6FFF6FFF6FFF77FF7BFF7F
      BE77FF7FFF7FFF7FFF6FFF6F313E000000004A29FF7FFF7FFF7FFF7FFF7FFF7F
      FF7F000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009A2E591A38162200000000000000
      0000CF764A76A57145714571456DE35000005F53FF6FFF6FFF6FF77FF97BDE73
      DE771C63FF7FBE6BFF6FFF6F944A00000000FF7FFF7FFF7FFF7FFF7FFF7F246A
      686EFF7FCD72896EFE7F0E77C472C372A2722166FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F923EB332772A0000000000000000000000000000
      000000008E760A7666714571456DE350000000003E4F3E4F1C4FFF7FFF7FFF7F
      FF7F7D6FFF7FFE421F43BF63395B000000006911F75FF667124B2E2EAD19C908
      CA00FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F4039C97EEA7E
      EA7EEA7E05565A16DF1AFE36D83D8708A90C0000000000000000000000000000
      0000000000002D6E2D76C9716671000000000000000000000000957F957FF97F
      F97FF97FF77F1F431F473F4B3D5300000000C8144A29FF7FFF7FFF7FFF7FFF7F
      FF7F000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000C76A871000000000000000000000000000000000000
      0C7B927F2F73FD423F4B3F4FD22900000000FF7FFF7FFF7FFF7FFF7FFF7F466E
      AB72AB728A6EFF7FAA72666E646EC972FE7F2462FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FB33E574714010000000000000000000000000000
      0000000000000000000000000000000000000000DE7B41042821AC3100000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A208A208A1040D264F26
      101ED215930D540556057D670000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000003800440040
      004000400040001C0000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F000000000000000000000311020D020D0D2AB132
      5226131ED415B511760DB200000000000000000000000000000000000000DB7B
      865EC066007BE36E2F6F000000000000000000000000002C0044004400440048
      004800440040003C00400000000000000000000000004862E25DE36104620362
      03622262216221660062A055FF7F0000000000000000504250425042EB25F33E
      93323322F419B515750DB0003A579E6F00005D6700000000000000007946214E
      405EA06E007F207F207B00000000000000000000003400480048004800500050
      0050004C004800440040004400000000000000000000016A446AFF7FFF7F666E
      856E8472A372A272806E0062FF7F00000000000020045142304251420D2E754B
      D43A532AF31DB315730D8C00B30D331100001E3A1D365C421D367D217908B177
      205A806A007B207F207F73730000000000000000004C0050A554FF7F00500054
      005800542959FF7F0044004400400000000000000000226A666E9A7B8A72FF7F
      FF7FC772C472C272A1722066FF7F00000000FF7F830CCE318B296921EC2DB657
      144773321222B215500D69009B091A6300005D673F36DF4E7E3EFE2D7908DD7B
      E04D8066E072207F207FE36E0000000000000050005000583953FF7FFF7F0054
      0058295DFF7FFF7F1056004C00480008000000000000246A686EFF7FCD72896E
      FE7F0E77C472C372A2722166FF7F00000000F75EA310714ABB6FBA6FC308D763
      544F913610268F15EC0832094A00000000000000BD21DF4E9F421E2E3D197C4A
      E04D6062A06A007B207FE076000000000000005000580060005C1853FF7FFF7F
      4A69FF7BFF7FAD45005C0054004C0034000000000000456E896EAA72FF7FCD72
      A972FF7FFF7FFF7F836E2366FF7F000000000825F23DFE5EFD5A3F63A20CD563
      52578F3AEE256C15870487000000000000000000BD219F42BF4A3F3A7D217508
      EA627373DD775767796FB177DC7F000000002158006000640064005C7B5FFF7F
      FF7FFF7F105200600060005C0050004C000000000000466EAB72AB728A6EFF7F
      AA72666E646EC972FE7F2462FF7F00000000C6203642DD5ADC5A3F6726155153
      30536C3ACA21C5040F3A000000000000000000001E5F1E3ABF4A5F3A7B1DD831
      FF7F8021A036203F8047404767420000000021602168216C006800682861FF7F
      FF7FFF7B00600064006400600058005C000000000000676EAC72AC728A6E9A7B
      676E666EAB72446EFF7F2462FF7F00000000EE4154461F63FE5E584A7B6FB24A
      C6088804C508000000000000000000000000000000004976B977DD77DA7FA669
      367B80196136E03E4047A04B2032000000004264427042740070E764FF7BFF7F
      FF7BFF7FFF7F006400682164005C0058000000000000686ECE72CD72AB72987B
      CE72676EFF7F456EFF7F0562FF7F00000000FF7FA41806250F46FF7F5A67E600
      2C0D2F09F300B0000000000000000000000000000000A475687E047E607D2069
      8951263A2032C03A4043A04BE03EDD77000063686378637C2971FF7BFF7FEF51
      00683957FF7FFF7F0070216C21600048000000000000896E1177EE72CC72AB72
      FF7F1177AB72FE7FF0760462FF7F000000000000000000000000000027012F22
      3122D3157709D500FF7F0000000000000000000000008B76457E8A7EA47D2069
      4050BA6FE029C03A203F804B604B8D4A00004270A57CA57C7B5BFF7FAD490074
      00700068F74EFF7FCE5D427042640010000000000000AB7234771077EE72CD72
      CC72777B997BCC72676E0462FF7F00000000000000000000000000002D165543
      3647742AB411F204B8520000000000000000000000009A7FE27DAC7EE27D406D
      4050BC7B8019603249534953824BE02900000000A57C297D297DAD41427C007C
      0078217C63786B45847C847442680000000000000000FE7FAA72896E686E676E
      676E666E456E456E236A6966FF7F00000000000000000000000000000A12954F
      955FB13EAD19CA04BD7300000000000000000000000000008275687E49768079
      E064895157670000000000000000FC7F000000002178087DAD7D107ECE7D4A7D
      087D297D4A7D297DE77C84780000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF7F8C2A
      0F4F6B3A6819010000000000000000000000000000000000997BD0768B7AE775
      916E0000000000000000000000000000000000000000217C297DEF7D947E947E
      737E107EAD7D297D847C00040000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      9042871DD5560000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000857C8C7D107E
      EF7D8C7DE77C217000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      00000000FFFFFFFF0000000000000000FFFFFFFFFFFF0000FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4D5B0000000000009FD75FC79FCF19AE
      FFFFFFFF000018A6FFFFFFFFFFFFFFFFF801FFFFFFFFFFFFF001E03FFFFFFFFF
      E001C00F1CC70000E001C0035BAD1AA5C00080039FD75FCF80008003FFFFFFFF
      80008003FFFFFFFF80008003FFFFFFFF80000003DFDFDFDF000000011DC6518E
      000000015E8E5FC700000001FFFFFFFF00000001FFFFFFFF0E008001FFFFFFFF
      FF80F001C214DFDFFFF3FE019FD6C004FFFF87FFFFFFF00FFFFF8007FFFFE007
      C0078007FC0FC003C0038001780F8001C003800100078001C003000100070000
      C003000380070000C003000780030000C003000F80030000C003003FC0030000
      C003001FC0010000C003B80FC0010001C003F80FC0018001C003F80FE03D8003
      FFFFF81FE0FFC007FFFFFE3FFFFFF01F00000000000000000000000000000000
      000000000000}
  end
  object ImageList2: TImageList
    Left = 128
    Top = 144
    Bitmap = {
      494C010107000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001001000000000000018
      000000000000000000000000000000000000F75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EFF7FFF7FFF7FF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75EFF7FFF7FF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EFF7FFF7F0000F75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75E00000000F75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75E0000F75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EFF7FFF7FFF7FF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EFF7FFF7FFF7FF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EFF7FFF7FFF7FF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75EFF7FFF7FF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EFF7FFF7FFF7FF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75E00000000FF7FF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EFF7FFF7FFF7FF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75EFF7FFF7FF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EFF7FF75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EFF7FFF7FFF7FF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75E0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004029C51CC618C61CC51C0821CC00
      C904A80466046704880488040A0000000000F75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75E0000000000000000000000000000
      F200F6008E002400000000000000000000000000010014421A635B6B3B67B956
      D339000000000000000000000000000000000525A34D636EA351A614C618C908
      0F01550996151109880487048804C6000000EF3DEF3DEF3DEF3DEF3DEF3DEF3D
      EF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3D000000000000000000001E027D19
      77195C117D199E213B0D02000000000000005029BC779C737B6F5B6BFA5E9B73
      9752BA568610000000000000000000000000A4496466E451A476E355C618FB0D
      36118F1D150D561599219721670487040A00F75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75E0000000000000000BF0175009600
      2D01D100760075001A097D19000000000000D95ABD77DE7BBD777B6FB9569952
      B9563746374A0000000000000000000000008449646E06290625646AB319D300
      140166051201F400D3003611751987048808F75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EFF7F000000000000BB12B700F9001A01
      3201A0011801D80096007215F60400000000574AFE7FFF7FDE7B9C73DA5A1942
      394EF8257901580178018900000000000000C620646AE6200000513EAC295701
      7801C601C001770136011201912166048804FF7FFF7FF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75E00000000000019011A017E01BF01
      00020002E3017D01FA00880592190000000000009952F841F8451A63594AB939
      7901BE01DF01BF01DF019D01570100000000C51C853DE5200000181EA21CBA01
      DB012002F101DA01AA0182018911CE008804FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000001A017D019A01B001
      E50114021F02EF01C00180018B096C0000000000712D3C1E9F021F3F394E7A01
      DF01DF019F01FF7FBF01DF01BD01F10000008349A476C61C0000FA11BA013002
      5B0279025F023D020302C00184012F058804F75EEF3DF75EEF3DF75EEF3DF75E
      EF3DF75EEF3DF75EEF3DF75EEF3DF75EEF3D00000000000059018A25A06A247B
      80662D017E023F020002A2016101D10000000000374A9F16DF16DF1ADF167B01
      DF01DF01BF01FF7F9F01DF01DF017A010000636E653DA614C6187A22FC01C31A
      E626112F1F2B7F063B02E201A0010F05A904F75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75E940C04002A04DA10445680620377
      217FA435DA0E9F02410200028001690000000000B95EFF1AFF221F27FF22BE01
      DF01DF01BF01FF7F9F01DF01DF019C010000225EE379644586103A5F8B12252F
      6F3F6B43BF57FF1E5D020C02C001CA04EB04F75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75EBF21BF4E3F363B19C135405AC172
      437FC06E7422DF0269020002C00100000000000098563F273F2F3F331F2FBE01
      DF01BF019F63FF7F9F01DF01DF01BD010000A0726176E379A151A6144E3B483B
      B253FC67BC570E275702DB013206C9044A01FF7FFF7FEF3DFF7FF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75E7E197F427F3E9D25E90C2052A06A
      247F207F011A0B031F020302B601000000004208774A3F335F3B7F3F9F477D01
      DF01BF019F01DF01BF01DF01DF019C0100000C6F487FA17EE169A618DE777743
      3837974B4A3FE4263D025A12CA08CC000000F75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75E3C153F369F46FE2DB910E3258036
      804B60474015A2021F027B02000000000000754EBA365F3F7F479F4B9F4F7F1A
      FF05BF013F16FF7F9F01BF01DF01CD000000C355887F467F042DA614A518A714
      F85A5A4F1C33F646F4250A114A0100000000F75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75E0000826D4A39C234E06080254032
      4043E153202E7312F20D00000000000000005B6B3E3B7F479F4FBF57DF57DF5B
      7F1A9F33DF019F011F067F16570100000000C618E355AC7F017B05298610A151
      0429A614A614C61800000000000000000000F75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EF75E0000817D6A7EC27D0069C018E02D
      003FE15320430000000000000000000000009C7375463C4BBF57FF63FF67FF5F
      DF579F47181E7F33DD0100000000000000000000C618E355AF7F427F436AE05D
      E37944418610A51800000000000000000000F75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75EFF7F00006079277E057E40716040A025
      A036604B804B4004000000000000000000005A6B7C6FF95E544ED23DF441D94E
      7E539F4B430800000000000000000000000000000000E71C0656FB7F447F017F
      216AE3792431C61800000000000000000000FF7FFF7FEF3DFF7FF75EF75E0F00
      F75EF75EF75EF75EF75E0F00F75EF75EF75E00000000E47D697E607DA0580000
      00000000000000000000000000000000000000000000000000003446D95AD95A
      774E164600000000000000000000000000000000000000000821A35503568A7F
      257F216AA618A514000000000000000000000F00F75E0F00F75EF75E0F00F75E
      F75EF75E0F000F000F000F000F00F75EF75E0000000000000000000000000000
      00007B6F186373527352396B00000000000000000000000000000801C808890C
      A90C890CA90C890888104A010000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000007B6F1863
      D65A8D1DC2250D53C2250821104218630000000000000000881088088708AE14
      D018D014AC10670887088808881000000000000000000B19CE39135222040000
      0000000000000000000000000000000000000000000000000000000000000000
      B556734E734E734E734ED65A00000000000000000000BD77396BD65A6B2DC225
      443244324432EB46C22508211042D65A000000000000A808890C9935FE5EDF5A
      BF529F4E5F4A1D42562988088808890C000000000000EA1CEA7EC76534524308
      0000000000000000000000000000000000000000000000000000D65AB5565619
      3A117C1D9F299F293A11F40C4D25000000007B6F186310420256443244324432
      44324436643AA442C2251042D65A7B6F00000000AA08AD14DD5A3F631F5F3E63
      5E677E6B5E679D52FB3D98318A0C8708E70C00000000000008250A7FC7653452
      44080000000000000000000000000000000000000000992A5719561556151809
      7D21DF2DFF3158153A2ABF297D21B55600000256826EA372C476047F44360256
      854EA442C44AE452643AF1520000000000000000A80CFC5A1F5F1F5F1F5F1F63
      3F633E635E675E675E67BC5257296708880CD500190D5C199E25502D0A7FC765
      3556000000002204220400000000000000000000DA01D300D300D30032017915
      BF2D1F361D2E7F537F531F369F29B5560000826EA372C476047F047F047F047F
      047FC44AE452E452EB46C22500000000000000005629FF5ABF56DF56DF5ADF5A
      FF5AFF5E1F5F1F633F633E639C4ED018870818097D21BF2DFF31BB21F03D0A7F
      0D566F25D335DA4A3C5BF439430800000000DE26D300F4003601360180013601
      9A193F367D3E3742FF4A3F3A160D00000000127FC476047F047F047F047FC476
      C476434AE452C44AC44AC225000000000000000019427F4E9F4E9F529F52BF52
      BF56DF56DF5ADF5AFF5AFF5E1F5F56298708D400BF291F325F3A9C3A5F537625
      F339DD4AFF67FF6BFF6FFF773C6301000000F400360157019901B201C001C001
      29250000813CA248603C6C2D0000000000000000047FE14C4269047F047F047F
      C476C225E452C44AC44A0532000000000000A90C1A3E5F4A5F4A7F4E7F4E7F4E
      9F4E9F529F52BF52BF56DF56DF5ADA3D8808000039113F3A370D1F4B3F4B5715
      7946FF67DF5FFF6FFF77FF7FFF7BF5390000360199019901DA012A020102630C
      4208A13423552359235561340000000000000000047F426942694B76C476E452
      E452C44AC44AC542C542C73E9201000000009901993199319931993199319931
      99313E467F4E7F4E9F4E9F529F52FA418708000000006B00203481402034F00C
      5E5B9F57BF5FFF6BFF77FF77FF6F5D5B00009901BA01FC014D025A023502630C
      84108461A465A4698465024D00000000000000000000047FA375C679047FE74E
      532EC542C542EB465816BA2E9201000000003F4B3F4B3F4B3F4B3F4B3F4B9D2A
      870478293E465F4A5F4A7F4E7F4E3425A80C000021040000E25002550251842C
      7E5F7F57BF5BFF67FF6BFF6FFF6B5D5700009901FC01810AC51A5A025F02A514
      C6188459257A467E257A6361000000000000000000006271A375A375A375A375
      58160532C73EC73EBA2EFB42920100000000D81DDE3ADE3ADE3ADE3ADE3ADE3A
      6704782D1D421D423E463E463E468708AA084208630CE244635D636163612351
      DB4EFF77BF679F5BBF5FDF5FFF6758420000DA012A02E422052B493B5A3B630C
      0821A514024DA46D467A625100000000000000000000127FA375A37558166B2D
      5816C83EC83EEB46C83EFB425816FB420000D10C7D2A7D2A7D2A7D2A7D2A7D2A
      AD089935BA35FC3DFC3D1C42F11C890C00008410A514434DC46DE571C56DA469
      0B21DF77FF7F9F5F7F53DF635F5722080000FC01E4222633493B6D432D379E4B
      4A298C31524ACE39A514E71C000000000000000000000000A3756271BA2E5816
      BA2EBA36151E95460821FB425816920100000000D30C3B1A3B1A3B1A3B1A3B1A
      150587047729DA39DA39CD14AA0C00000000A514E71C400C667E667E667E257A
      6020EB18BA4E9E5B7F5BFD524308000000000000052B493B914BD95BD95B2D37
      DF1A8C31524AAD35A51400000000000000000000000000006271A375495EBA2E
      BA36FB42FB42FB42BA36BA2EBA2E9201000000000000F30C3409DA09DA09DA09
      B90987047931A90CCA100821000000000000210429254A29630C813043694351
      0000000000000000000000000000000000000000D95B112B914BD95BBE5B493B
      052B5F02FC011D02000000000000000000000000000000000000627162714269
      C679FB42FB42BA2EBA2EBA2EBA2E920100000000000000000000F30CF30CF30C
      F30CF30C000000000000000000000000000000000821AD353146F75EAD352104
      00000000000000000000000000000000000000000000DE673537523B523B2633
      E4225A023F370000000000000000000000000000000000000000000000009A7F
      127F127FFB42BA36BA36BA36BA36581600000000000000000000000000000000
      00000000000000000000000000000000000000000000630CEF3D6B2D00000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FE0FC07F00030000F803803F00010000
      F003001F00000000E001000700000000E001000110000000E000800110000000
      E000800010000000000080000000000000008000000000000001800000000000
      0001000000010000000300010003000080070003001F0000800F0007801F0000
      800F003FC01F0000C1FFF03FE01F0000FF07F007C3FFFFFFF801C00181FFFE07
      C001800080FFF00300018000007FC00100078000000380010007800000010003
      000780000000000780070000000000078003000000000007C003000000000007
      C003000000000007C001000000000007E00180010001800FE001C0070003801F
      F001F07F00FFC03FFC01FFFF01FFFFFF00000000000000000000000000000000
      000000000000}
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 64
    Top = 144
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
    object N5: TMenuItem
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
      Caption = #23507#23458#25910#38134
      OnClick = menuYksyClick
    end
    object menuJz: TMenuItem
      Caption = #25955#23458#32467#24080
      OnClick = menuJzClick
    end
    object N7: TMenuItem
      Caption = '-'
    end
    object menuCyxf: TMenuItem
      Caption = #25276#37329#28040#36153
      OnClick = menuCyxfClick
    end
    object N1: TMenuItem
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
  end
  object dsKfzt: TDataSource
    DataSet = tblKfzt
    Left = 432
    Top = 128
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 24
    Top = 144
  end
  object qryTd: TQuery
    DatabaseName = 'LFHOTELUSER'
    SQL.Strings = (
      'select * from KRXX where D_KRLX="T"')
    Left = 400
    Top = 168
  end
  object dsQryTd: TDataSource
    DataSet = qryTd
    Left = 432
    Top = 168
  end
  object tblKrxx: TTable
    DatabaseName = 'LFHOTELUSER'
    TableName = 'KRXX.db'
    Left = 464
    Top = 128
  end
  object tblXxbd: TTable
    DatabaseName = 'LFHOTELUSER'
    Filter = 'D_KRLX<>'#39'T'#39' and (D_ZJHM='#39#39' or D_JTDZ='#39#39' or D_DWMC='#39#39')'
    Filtered = True
    TableName = 'KRXX.db'
    Left = 400
    Top = 96
    object tblXxbdD_KRBH: TStringField
      FieldName = 'D_KRBH'
      Size = 12
    end
    object tblXxbdD_KRXM: TStringField
      FieldName = 'D_KRXM'
      Size = 30
    end
    object tblXxbdD_KRLX: TStringField
      FieldName = 'D_KRLX'
      Size = 1
    end
    object tblXxbdD_DDRQ: TDateField
      FieldName = 'D_DDRQ'
    end
    object tblXxbdD_DDSJ: TTimeField
      FieldName = 'D_DDSJ'
    end
    object tblXxbdD_LDRQ: TDateField
      FieldName = 'D_LDRQ'
    end
    object tblXxbdD_LDSJ: TTimeField
      FieldName = 'D_LDSJ'
    end
    object tblXxbdD_YWX: TStringField
      FieldName = 'D_YWX'
      Size = 8
    end
    object tblXxbdD_YWM: TStringField
      FieldName = 'D_YWM'
      Size = 8
    end
    object tblXxbdD_XB: TStringField
      FieldName = 'D_XB'
      Size = 2
    end
    object tblXxbdD_MZBH: TStringField
      FieldName = 'D_MZBH'
      Size = 5
    end
    object tblXxbdD_DQBH: TStringField
      FieldName = 'D_DQBH'
      Size = 5
    end
    object tblXxbdD_GBBH: TStringField
      FieldName = 'D_GBBH'
      Size = 5
    end
    object tblXxbdD_NZTS: TSmallintField
      FieldName = 'D_NZTS'
    end
    object tblXxbdD_TLSY: TStringField
      FieldName = 'D_TLSY'
      Size = 10
    end
    object tblXxbdD_ZJBH: TStringField
      FieldName = 'D_ZJBH'
      Size = 5
    end
    object tblXxbdD_ZJHM: TStringField
      FieldName = 'D_ZJHM'
      Size = 18
    end
    object tblXxbdD_CSNY: TDateField
      FieldName = 'D_CSNY'
    end
    object tblXxbdD_HCL: TStringField
      FieldName = 'D_HCL'
      Size = 10
    end
    object tblXxbdD_HCQ: TStringField
      FieldName = 'D_HCQ'
      Size = 10
    end
    object tblXxbdD_QZBH: TStringField
      FieldName = 'D_QZBH'
      Size = 5
    end
    object tblXxbdD_QZYXQ: TDateField
      FieldName = 'D_QZYXQ'
    end
    object tblXxbdD_ZY: TStringField
      FieldName = 'D_ZY'
      Size = 10
    end
    object tblXxbdD_LXDH: TStringField
      FieldName = 'D_LXDH'
      Size = 16
    end
    object tblXxbdD_DWMC: TStringField
      FieldName = 'D_DWMC'
      Size = 30
    end
    object tblXxbdD_JTDZ: TStringField
      FieldName = 'D_JTDZ'
      Size = 30
    end
    object tblXxbdD_JDR: TStringField
      FieldName = 'D_JDR'
      Size = 8
    end
    object tblXxbdD_JDDW: TStringField
      FieldName = 'D_JDDW'
      Size = 30
    end
    object tblXxbdD_QDR1: TStringField
      FieldName = 'D_QDR1'
      Size = 8
    end
    object tblXxbdD_QDR2: TStringField
      FieldName = 'D_QDR2'
      Size = 8
    end
    object tblXxbdD_QDR3: TStringField
      FieldName = 'D_QDR3'
      Size = 8
    end
    object tblXxbdD_QDR4: TStringField
      FieldName = 'D_QDR4'
      Size = 8
    end
    object tblXxbdD_BZ: TStringField
      FieldName = 'D_BZ'
    end
    object tblXxbdD_KFBH: TStringField
      FieldKind = fkLookup
      FieldName = 'D_KFBH'
      LookupDataSet = tblFt
      LookupKeyFields = 'D_KRBH'
      LookupResultField = 'D_KFBH'
      KeyFields = 'D_KRBH'
      Lookup = True
    end
  end
  object dsXxbd: TDataSource
    DataSet = tblXxbd
    Left = 432
    Top = 96
  end
  object qryYdhc: TQuery
    DatabaseName = 'LFHOTELUSER'
    SQL.Strings = (
      'select * from YDHC order by D_SYRQ,D_SYSJ')
    Left = 400
    Top = 208
  end
  object ImageList3: TImageList
    Left = 160
    Top = 144
    Bitmap = {
      494C010104000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001001000000000000018
      00000000000000000000000000000000000000000000016A446AFF7FFF7F666E
      856E8472A372A272806E0062FF7F0000000000000000E500F01DD132764B1447
      93323322D319930DCE04B11195210000000000004205C155E261E6292516F75A
      1A5FB95699529A52CA14AA140000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000226A666E9A7B8A72FF7F
      FF7FC772C472C272A1722066FF7F000000000000BD732F22742AB42EB7577553
      B33A3226D219710D6900DC0D195F000000000000E25D667E667E467EE9183867
      794E194219429952A910CC180000000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000246A686EFF7FCD72896E
      FE7F0E77C472C372A2722166FF7F000000000000923EB332772A3122D75B955B
      D242302AAF192D0DAD046A00000000000000603D877EA87EA87E887E0329373E
      F83D782D782DA80CAA104A29000000000000FF7FFF7FFF7FFF7FFF7FF85EB756
      544A3546B9521B5BBF5B6F29E71C31468D3100000000456E896EAA72FF7FCD72
      A972FF7FFF7FFF7F836E2366FF7F0000000000002F2A163FD6156911F75FF667
      124B2E2EAD19C908CA0000000000000000004039C97EEA7EEA7EEA7E05565A16
      DF1AFE36D83D8708A90CAB140000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000466EAB72AB728A6EFF7F
      AA72666E646EC972FE7F2462FF7F000000000000B33E57471401FF7FA01C202D
      02114D322811A50C000000000000000000004139E35D246E045EC45D2625BC26
      1F27FF26B92A6F19EA1CC8144A2900000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000676EAC72AC728A6E9A7B
      676E666EAB72446EFF7F2462FF7F000000000000BC6FB8571B01C045847FE37F
      2262C100FE7F0000000000000000000000000000255EEE72EF72476678263F33
      3F373F371E2FC87AC251A610E61C08210000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000686ECE72CD72AB72987B
      CE72676EFF7F456EFF7F0562FF7F00000000000000007247093EE47F0600E17F
      E07EF3000E0000000000000000000000000000000000403D844178323F3B7F43
      7F475E43342E6466EA7E2431C614C61CE7280000000000000000000000000000
      00000000000000000000000000000000000000000000896E1177EE72CC72AB72
      FF7F1177AB72FE7FF0760462FF7F00000000000000009C67E17FB94EED153122
      F315960D3805573E00000000000000000000000000000000B6525F3B7F479F4F
      BF53F4526E7F4E7F2D7FEA7E6372860CC618FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000AB7234771077EE72CD72
      CC72777B997BCC72676E0462FF7F0000000000000000E9724141831DD232764B
      D53AF31933092B00000000000000000000000000000000005A6BFB427E4BFF5B
      FF63A46EB07F4C7BE772826AEA7E6472C618FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000FE7FAA72896E686E676E
      676E666E456E456E236A6966FF7F0000000000000000837FE47F4A56F032B65F
      334F0F262C0D0C1500000000000000000000000000000000F85E9D73F95E3446
      3546C46ED17F6D7BE772826A826AEA7EC614F75EF75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EEF3D0000F75EFF7F0000000000000000000000000000
      000000000000000000000000000000000000000000000000FF7FFF7F4D2A104B
      CE4ACA2541000000000000000000000000000000000000000000000000000000
      F95E4762FB7F8E7B0873826A826A2D7FE61CFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BD73
      0B324F4200000000000000000000000000000000000000000000000000000000
      00004A29616EA46ABA7BBA7BE672C3510525FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7F000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7F000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7F000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7F000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7F00001F000A0010000000A914AA14CA144A01FF7FFF7FFF7FFF7FFF7F
      FF7F000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000880CAA104A01FF7FFF7FFF7FFF7F
      FF7F080281146662866AE54D00000000000000000000DF6BBF679F5F3D5BBB56
      9A529F5BBF639C6300000000000000000000FF7FFF7FFF7FFF7F4029C51CC618
      C61CC51C0821CC00C904A80466046704880488040A00FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F000000000000FF7FFF7FFF7FFF7F0525A34D636E
      A351A614C618C9080F01550996151109880487048804C600FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F594E3E57FF4E3D2E961DEF100000000000000000
      0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      0000EE00CC04AB08AA0889088A08EC140D1DB457B557B34B7C571E4B5E36F110
      0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F1000
      ED04CA040F05310DEE0CEF08AB04784EFF7F9231A90C8D10FF7FFF7FFF7FFF7F
      FF7F000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005025AA0C1000FF7FFF7FFF7FFF7F
      FF7FD439AA7A68760776A771C06A0000000000001D4B3F4FBE779E733C675E6B
      60026002FF7B734F77533F4F000000000000FF7FFF7FFF7FFF7FA4496466E451
      A476E355C618FB0D36118F1D150D561599219721670487040A00FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F594EFE7BD863FF7FFF7FFF7FFF7F8449646E0629
      0625646AB319D300140166051201F400D3003611751987048808FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F594EB65F9453FB32BB2EFD2E5F477D4F95434D11
      000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F1002EC04
      7301BA157821942DEE183119B431FF7FFF7FBB2A7B325826392A3722581E1A1E
      DD3ABC36F4250000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00002C0DF709
      150DD300D300784A1C5FCC14FF77FF77163EAC0488048A040000FF7FFF7FFF7F
      FF7F000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000072258A088904CC00FF7FFF7FFF7F
      FF7FC97ACA7A68762776A6712469A2340000983EDF6BFF77FF7BDB5A1C633D67
      60020E3B620A6002FF6F9F5B000000000000FF7FFF7FFF7FFF7FC620646AE620
      FF7F513EAC2957017801C601C001770136011201912166048804FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F594AB557B557FF7FFF7FFF7FFF7FC51C853DE520
      FF7F181EA21CBA01DB012002F101DA01AA0182018911CE008804FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F584AD863BC5FBD2E9C2E79267922561A561EB719
      3936183279320000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F1021D315F400
      F400150115017D67BF6FBE6FBF6FFA56CE0CDD2EBC2A981E781E781E7922D819
      7A367B360B150000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F2C115B1E1501
      36017701560DBF6BBF6BBF6BBF6F363E0E194F21EF1089088908FF7FFF7FFF7F
      FF7F000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004D196F196804A804FF7FFF7FFF7F
      FF7FCF764A76A57145714571456DE35000005F53FF6FFF6FFF6FF77FF97BDE73
      DE771C63FF7FBE6BFF6FFF6F944A00000000FF7FFF7FFF7FFF7F8349A476C61C
      FF7FFA11BA0130025B0279025F023D020302C00184012F058804FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F594AFD775F57FF7FFF7FFF7FFF7F636E653DA614
      C6187A22FC01C31AE626112F1F2B7F063B02E201A0010F05A904FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F594EFD7BFD32FD2ADB22B81ABA1EBB22BB261A1A
      9C36FE3A0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FEA0C77097701
      9901BA01B6259F679F679F679F67BF6B5D5FFB26FB22DA1EDD26DD26DE2A3C1A
      DD369A320000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FCA0C5701B901
      DD012B0299469F639F639F63BF67163E620582058A1567046804FF7FFF7FFF7F
      FF7F000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006D0185098704A804FF7FFF7FFF7F
      FF7F00000000000000000C76A871000000000000000000000000000000000000
      0C7B927F2F73FD423F4B3F4FD22900000000FF7FFF7FFF7FFF7F225EE3796445
      86103A5F8B12252F6F3F6B43BF57FF1E5D020C02C001CA04EB04FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F594ADA67FC2A4029C51CC618C61CC51C0821CC00
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
      000000000000000000000000FFFFFF00290D0A2020656E6425272C636C526564
      2C27B3F6D7E2C2CA41437A6C2A31303020416464426172286E293B0D0A202020
      272C636C477265652C27B3F6D7E2CAFD2B4154642B414D666442617228414266
      0D0A202020204164636C426C7565293BB7BFD7DCCAFD272C2B415A6B2C27BFCD
      2B4154642B414D6628414F6B2B41426620204164644261725A6B293B0D0A2020
      54642B414D662B414F6B2B4142662B412B414D66292F2841284142662B415464
      41437A6C203A3D20723B0D0A2020202020202020436C656120626567696E0D0A
      733220646F0D0A207468205365726965643B0D0A20207769293B0D0A2020656E
      2C636C426C61636B6B2C27D4E0BFD527000380FFF80380010001800FE0010001
      0000800FC0010001000080038001000110008001000000031000800100008003
      1000800100008007000080030000C007000080030000C00F000080030000E00F
      000180070000E01F000380070000F01F001F80078001F03F801F800F8001F83F
      C01F800FC003F87FE01F800F8007FCFF00000000000000000000000000000000
      000000000000}
  end
  object qryYdcy: TQuery
    DatabaseName = 'LFHOTELUSER'
    SQL.Strings = (
      'select * from YDCY where D_CTBH<>"0" order by D_SYRQ,D_SYSJ')
    Left = 400
    Top = 240
  end
  object qryYdkf: TQuery
    DatabaseName = 'LFHOTELUSER'
    SQL.Strings = (
      'select * from YDKF where D_KFBH<>"0" order by D_DDRQ,D_DDSJ')
    Left = 400
    Top = 272
  end
  object tblFt: TTable
    DatabaseName = 'LfHotelSys'
    TableName = 'KFZT.db'
    Left = 464
    Top = 96
  end
end
