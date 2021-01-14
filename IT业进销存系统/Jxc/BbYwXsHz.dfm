inherited frmBbYwXsHz: TfrmBbYwXsHz
  Caption = '业务员销售汇总表'
  PixelsPerInch = 96
  TextHeight = 15
  inherited DBGrid1: TDBGrid
    DataSource = DataTjb.sYwyXsHz
    Columns = <
      item
        Expanded = False
        FieldName = 'YWY'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JEA'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JEB'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JEC'
        PickList.Strings = ()
        Visible = True
      end>
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
        DataSource = DataTjb.YwyXsHz
        SeriesColor = clRed
        XLabelsSource = 'cYWY'
        OtherSlice.Text = 'Other'
        PieValues.DateTime = False
        PieValues.Name = 'Pie'
        PieValues.Multiplier = 1
        PieValues.Order = loNone
        PieValues.ValueSource = 'JEC'
      end
    end
  end
end
