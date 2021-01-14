inherited frmBbYwyYjtj: TfrmBbYwyYjtj
  Left = -102
  Top = 101
  Caption = #19994#21153#21592#19994#32489#32479#35745
  PixelsPerInch = 96
  TextHeight = 15
  inherited DBGrid1: TDBGrid
    DataSource = DataBb.sYwyYjtj
    Columns = <
      item
        Expanded = False
        FieldName = 'YWY'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'XSJE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'THJE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'YSJE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MSJE'
        Visible = True
      end>
  end
  inherited ControlBar1: TControlBar
    inherited ToolBar2: TToolBar
      Left = 617
    end
    inherited ToolBar1: TToolBar
      inherited btnFxt: TToolButton
        Tag = 1
      end
    end
    inherited ToolBar3: TToolBar
      Width = 57
    end
  end
  inherited pnlFxt: TPanel
    inherited DBChart1: TDBChart
      AllowPanning = pmNone
      AllowZoom = False
      BackWall.Pen.Visible = False
      AxisVisible = False
      ClipPoints = False
      Frame.Visible = False
      View3DOptions.Elevation = 315
      View3DOptions.Orthogonal = False
      View3DOptions.Perspective = 0
      View3DOptions.Rotation = 360
      View3DWalls = False
      object Series1: TPieSeries
        Marks.ArrowLength = 8
        Marks.Style = smsPercent
        Marks.Visible = True
        DataSource = DataBb.KhXsHz
        SeriesColor = clRed
        XLabelsSource = 'cMC'
        OtherSlice.Text = 'Other'
        PieValues.DateTime = False
        PieValues.Name = 'Pie'
        PieValues.Multiplier = 1
        PieValues.Order = loNone
        PieValues.ValueSource = 'JEC'
      end
    end
  end
  inherited ActionList1: TActionList
    inherited aMx: TAction
      Tag = 0
      Caption = #26126#32454#36164#26009'(&E)'
    end
    inherited aFxt: TAction
      Tag = 1
    end
  end
end
