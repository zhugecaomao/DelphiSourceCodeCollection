inherited frmBbYskZlfx: TfrmBbYskZlfx
  Caption = '应收款帐龄分析'
  PixelsPerInch = 96
  TextHeight = 15
  inherited DBGrid1: TDBGrid
    Tag = 1
    DataSource = DataBb.sYskZlfx
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
        FieldName = 'TS1'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TS2'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TS3'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TS4'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TS5'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TS6'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TS7'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TS8'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HJ'
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
        DataSource = DataBb.ZlFxt
        SeriesColor = clRed
        XLabelsSource = 'cMC'
        OtherSlice.Text = 'Other'
        PieValues.DateTime = False
        PieValues.Name = 'Pie'
        PieValues.Multiplier = 1
        PieValues.Order = loNone
        PieValues.ValueSource = 'JE'
      end
    end
  end
  inherited ActionList1: TActionList
    inherited aMx: TAction
      Tag = 0
    end
  end
end
