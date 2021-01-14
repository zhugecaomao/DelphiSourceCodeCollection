inherited frmAdviceGraph: TfrmAdviceGraph
  Left = 137
  Top = 105
  Width = 583
  Height = 409
  Caption = 'frmAdviceGraph'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelBkGnd: TPanel
    Width = 575
    Height = 375
    object PageControl1: TPageControl
      Left = 0
      Top = 0
      Width = 575
      Height = 375
      ActivePage = TabSheet1
      Align = alClient
      TabIndex = 0
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = #31867#22411#27604#20363
        object DBChart1: TDBChart
          Left = 0
          Top = 0
          Width = 567
          Height = 347
          AllowPanning = pmNone
          AllowZoom = False
          BackWall.Brush.Color = clWhite
          BackWall.Brush.Style = bsClear
          BackWall.Pen.Visible = False
          Title.Text.Strings = (
            #31867#22411#27604#20363)
          AxisVisible = False
          ClipPoints = False
          Frame.Visible = False
          View3DOptions.Elevation = 315
          View3DOptions.Orthogonal = False
          View3DOptions.Perspective = 0
          View3DOptions.Rotation = 360
          View3DWalls = False
          Align = alClient
          ParentColor = True
          TabOrder = 0
          object Series1: TPieSeries
            Marks.ArrowLength = 8
            Marks.Visible = True
            DataSource = frmSearchAdvice.Q3
            SeriesColor = clRed
            XLabelsSource = 'ADVICE_TYPE'
            OtherSlice.Text = 'Other'
            PieValues.DateTime = False
            PieValues.Name = 'Pie'
            PieValues.Multiplier = 1
            PieValues.Order = loNone
            PieValues.ValueSource = 'COUNT'
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = #26085#26399
        ImageIndex = 1
        object DBChart2: TDBChart
          Left = 0
          Top = 0
          Width = 567
          Height = 347
          BackWall.Brush.Color = clWhite
          Title.Text.Strings = (
            #27604#20363)
          View3DOptions.Elevation = 315
          View3DOptions.Orthogonal = False
          View3DOptions.Perspective = 0
          View3DOptions.Rotation = 360
          Align = alClient
          ParentColor = True
          TabOrder = 0
          object Series2: TBarSeries
            Marks.ArrowLength = 20
            Marks.Visible = True
            DataSource = frmSearchAdvice.Q2
            SeriesColor = clRed
            XLabelsSource = 'ADVICE_DATE'
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1
            XValues.Order = loAscending
            XValues.ValueSource = 'ADVICE_DATE'
            YValues.DateTime = False
            YValues.Name = 'Bar'
            YValues.Multiplier = 1
            YValues.Order = loNone
            YValues.ValueSource = 'COUNT'
          end
        end
      end
      object TabSheet3: TTabSheet
        Caption = #22995#21517
        ImageIndex = 2
        object DBChart3: TDBChart
          Left = 0
          Top = 0
          Width = 567
          Height = 347
          AllowPanning = pmNone
          AllowZoom = False
          BackWall.Brush.Color = clWhite
          BackWall.Brush.Style = bsClear
          BackWall.Pen.Visible = False
          Title.Text.Strings = (
            #27604#20363)
          AxisVisible = False
          ClipPoints = False
          Frame.Visible = False
          View3DOptions.Elevation = 315
          View3DOptions.Orthogonal = False
          View3DOptions.Perspective = 0
          View3DOptions.Rotation = 360
          View3DWalls = False
          Align = alClient
          ParentColor = True
          TabOrder = 0
          object Series3: TPieSeries
            Marks.ArrowLength = 20
            Marks.Visible = True
            DataSource = frmSearchAdvice.Q1
            SeriesColor = clRed
            XLabelsSource = 'XM'
            OtherSlice.Text = 'Other'
            PieValues.DateTime = False
            PieValues.Name = 'Pie'
            PieValues.Multiplier = 1
            PieValues.Order = loNone
            PieValues.ValueSource = 'COUNT'
          end
        end
      end
    end
  end
end
