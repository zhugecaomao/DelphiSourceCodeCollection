inherited frmBbYfkZb: TfrmBbYfkZb
  Caption = 'Ó¦¸¶¿î×ÜÕÊ'
  PixelsPerInch = 96
  TextHeight = 15
  inherited DBGrid1: TDBGrid
    DataSource = DataBb.sYfkZb
    Columns = <
      item
        Expanded = False
        FieldName = 'BH'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MC'
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
      end
      item
        Expanded = False
        FieldName = 'JED'
        PickList.Strings = ()
        Visible = True
      end>
  end
  inherited ControlBar1: TControlBar
    inherited ToolBar2: TToolBar
      Left = 617
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
        DataSource = DataBb.YskZb
        SeriesColor = clRed
        XLabelsSource = 'cMC'
        OtherSlice.Text = 'Other'
        PieValues.DateTime = False
        PieValues.Name = 'Pie'
        PieValues.Multiplier = 1
        PieValues.Order = loNone
        PieValues.ValueSource = 'JED'
      end
    end
  end
  inherited ActionList1: TActionList
    inherited aMx: TAction
      Tag = 0
    end
  end
end
