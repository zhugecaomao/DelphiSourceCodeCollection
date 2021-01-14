inherited frmBbYyLrb: TfrmBbYyLrb
  Caption = '营业利润一览表(不含税价)'
  PixelsPerInch = 96
  TextHeight = 15
  inherited DBGrid1: TDBGrid
    DataSource = DataBb.sYylrb
    Columns = <
      item
        Expanded = False
        FieldName = 'YF'
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
        FieldName = 'CBJE'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LRJE'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SRJE'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FYJE'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'YYLR'
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
      BackWall.Brush.Style = bsSolid
      View3DOptions.Elevation = 315
      View3DOptions.Orthogonal = False
      View3DOptions.Perspective = 0
      View3DOptions.Rotation = 360
      object Series1: TBarSeries
        ColorEachPoint = True
        Marks.ArrowLength = 8
        Marks.Visible = True
        DataSource = DataBb.Yylrb
        SeriesColor = clRed
        XValues.DateTime = False
        XValues.Name = 'X'
        XValues.Multiplier = 1
        XValues.Order = loAscending
        XValues.ValueSource = 'YF'
        YValues.DateTime = False
        YValues.Name = 'Bar'
        YValues.Multiplier = 1
        YValues.Order = loNone
        YValues.ValueSource = 'YYLR'
      end
    end
  end
end
