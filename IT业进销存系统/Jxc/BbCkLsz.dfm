inherited frmBbCkLsz: TfrmBbCkLsz
  Caption = '仓库流水帐'
  PixelsPerInch = 96
  TextHeight = 15
  inherited DBGrid1: TDBGrid
    Top = 88
    Height = 426
    DataSource = DataBb.sCkLsz
    Columns = <
      item
        Expanded = False
        FieldName = 'LX'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RQ'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DJBH'
        PickList.Strings = ()
        Visible = True
      end
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
        FieldName = 'SL1'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DJ1'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JE1'
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
      Width = 126
      Caption = '仓库流水帐'
    end
    inherited Image2: TImage
      Top = 6
    end
    inherited labSearch: TLabel
      Top = 5
    end
    inherited labSort: TLabel
      Top = 25
    end
    inherited labTj: TLabel
      Tag = 1
      Left = 204
      Top = 25
    end
    object Label2: TLabel
      Left = 204
      Top = 4
      Width = 70
      Height = 15
      Caption = '仓    库:'
      Transparent = True
    end
    object labCK: TLabel
      Tag = 1
      Left = 282
      Top = 4
      Width = 40
      Height = 15
      Caption = 'labCK'
      Color = cl3DLight
      ParentColor = False
      Transparent = True
    end
  end
  inherited ControlBar1: TControlBar
    inherited ToolBar2: TToolBar
      Left = 617
    end
    inherited ToolBar1: TToolBar
      Width = 607
      ButtonWidth = 67
      inherited btnMx: TToolButton
        Caption = '查看单据'
      end
      inherited btnFxt: TToolButton
        Tag = 1
        Left = 551
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
      Caption = '查看单据(&E)'
    end
    inherited aFxt: TAction
      Tag = 1
    end
  end
end
