inherited frmBbCqYsk: TfrmBbCqYsk
  Left = -3
  Top = 128
  Caption = '销售订单执行情况'
  PixelsPerInch = 96
  TextHeight = 15
  inherited DBGrid1: TDBGrid
    Top = 91
    Height = 422
    DataSource = DataBb.sXsddQk
    OnDrawColumnCell = DBGrid1DrawColumnCell
    Columns = <
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
        FieldName = 'MC'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JE'
        PickList.Strings = ()
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DDZT'
        PickList.Strings = ()
        Visible = True
      end>
  end
  inherited Panel1: TPanel
    Height = 47
    inherited Image1: TImage
      Height = 47
    end
    inherited Label1: TLabel
      Top = 11
      Width = 201
      Caption = '销售订单执行情况'
    end
    inherited Image2: TImage
      Top = 8
    end
    inherited labSearch: TLabel
      Top = 11
    end
    inherited labSort: TLabel
      Top = 31
    end
    inherited labTj: TLabel
      Tag = 1
      Left = 274
      Top = 6
    end
    object Shape1: TShape
      Left = 318
      Top = 28
      Width = 25
      Height = 16
      Brush.Color = clNavy
    end
    object Label2: TLabel
      Left = 349
      Top = 28
      Width = 45
      Height = 15
      Caption = '执行中'
      Transparent = True
    end
    object Shape2: TShape
      Left = 420
      Top = 28
      Width = 25
      Height = 16
      Brush.Color = clBlue
    end
    object Label3: TLabel
      Left = 451
      Top = 28
      Width = 60
      Height = 15
      Caption = '执行完毕'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -15
      Font.Name = '宋体'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Shape3: TShape
      Left = 528
      Top = 28
      Width = 25
      Height = 16
      Brush.Color = clRed
    end
    object Label4: TLabel
      Left = 559
      Top = 28
      Width = 60
      Height = 15
      Caption = '中止执行'
      Font.Charset = GB2312_CHARSET
      Font.Color = clRed
      Font.Height = -15
      Font.Name = '宋体'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label5: TLabel
      Left = 274
      Top = 28
      Width = 38
      Height = 15
      Caption = '说明:'
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
