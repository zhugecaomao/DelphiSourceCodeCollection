inherited frmBbCkkcHz: TfrmBbCkkcHz
  Caption = '库存总帐'
  PixelsPerInch = 96
  TextHeight = 15
  inherited DBGrid1: TDBGrid
    Top = 88
    Height = 433
    DataSource = DataBb.sCkkcHz
    Columns = <
      item
        Expanded = False
        FieldName = 'BH'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PM'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DW'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SLA'
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
        FieldName = 'SLB'
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
        FieldName = 'SLC'
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
        FieldName = 'SLD'
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
  inherited Panel1: TPanel
    Height = 44
    inherited Image1: TImage
      Height = 44
    end
    inherited Label1: TLabel
      Top = 10
    end
    inherited Image2: TImage
      Top = 6
    end
    inherited labSearch: TLabel
      Top = 6
    end
    inherited labSort: TLabel
      Top = 26
    end
    object labCk: TLabel [5]
      Left = 234
      Top = 3
      Width = 105
      Height = 15
      Caption = '仓库：全部仓库'
      Transparent = True
    end
    inherited labTj: TLabel
      Tag = 1
      Left = 234
      Top = 25
    end
  end
  inherited ControlBar1: TControlBar
    inherited ToolBar1: TToolBar
      inherited btnFxt: TToolButton
        Caption = '盘点表'
      end
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
        DataSource = DataBb.HpCgHz
        SeriesColor = clRed
        XLabelsSource = 'cPM'
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
    end
    inherited aFxt: TAction
      Caption = '盘点准备表(&G)'
      ImageIndex = 26
      ShortCut = 0
    end
  end
end
