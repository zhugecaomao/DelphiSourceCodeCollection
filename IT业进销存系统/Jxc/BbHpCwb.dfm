inherited frmBbHpCwb: TfrmBbHpCwb
  Left = 83
  Top = 154
  Caption = #36135#21697#20179#20301#34920
  PixelsPerInch = 96
  TextHeight = 15
  inherited DBGrid1: TDBGrid
    Tag = 1
    DataSource = DataBb.sHpCwb
  end
  inherited Panel1: TPanel
    inherited labTj: TLabel
      Visible = False
    end
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
    inherited aSearch: TAction
      Tag = 1
    end
    inherited aMx: TAction
      Caption = #26597#30475#21333#25454'(&E)'
    end
    inherited aFxt: TAction
      Tag = 1
    end
  end
end
