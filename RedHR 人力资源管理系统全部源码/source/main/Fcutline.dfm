object cutline: Tcutline
  Left = 232
  Top = 108
  BorderStyle = bsDialog
  Caption = #22270#20363
  ClientHeight = 292
  ClientWidth = 472
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 12
  object Chart1: TChart
    Left = 0
    Top = 0
    Width = 472
    Height = 292
    BackWall.Brush.Color = clWhite
    Title.Text.Strings = (
      'TChart')
    View3DOptions.Elevation = 315
    View3DOptions.Orthogonal = False
    View3DOptions.Perspective = 0
    View3DOptions.Rotation = 360
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    Color = clWhite
    TabOrder = 0
    object Series1: TBarSeries
      ColorEachPoint = True
      Marks.ArrowLength = 8
      Marks.Visible = True
      SeriesColor = clRed
      Title = #32844#24037#23398#21382#22270#20363
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Bar'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
  end
  object ADOQuery1: TADOQuery
    Connection = Main.ADOconn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from r_staffinfo where delrecy='#39'0'#39' order by knowledge')
    Left = 96
    Top = 56
  end
end
