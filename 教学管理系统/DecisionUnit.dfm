object DecisionForm: TDecisionForm
  Left = 193
  Top = 117
  BorderStyle = bsDialog
  Caption = #25968#25454#32479#35745
  ClientHeight = 402
  ClientWidth = 575
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DecisionPivot1: TDecisionPivot
    Left = 48
    Top = 16
    Width = 465
    Height = 41
    ButtonAutoSize = True
    DecisionSource = DecisionSource1
    GroupLayout = xtHorizontal
    Groups = [xtRows, xtColumns, xtSummaries]
    ButtonSpacing = 0
    ButtonWidth = 64
    ButtonHeight = 24
    GroupSpacing = 10
    BorderWidth = 0
    BorderStyle = bsNone
    TabOrder = 0
  end
  object DecisionGraph1: TDecisionGraph
    Left = 16
    Top = 64
    Width = 553
    Height = 281
    DecisionSource = DecisionSource1
    Title.Text.Strings = (
      'TDecisionGraph')
    BottomAxis.Title.Caption = 'Age'
    LeftAxis.Title.Caption = 'COUNT OF Sex'
    RightAxis.Title.Caption = 'COUNT OF Sex'
    TopAxis.Title.Caption = 'Age'
    TabOrder = 1
    object Series3: TBarSeries
      Active = False
      Marks.ArrowLength = 20
      Marks.Visible = False
      SeriesColor = clRed
      Title = 'Template: Entrance'
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Bar'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
      Identifier = 'Template: Entrance'
      Style = 61
    end
    object Series4: TBarSeries
      Active = False
      Marks.ArrowLength = 20
      Marks.Visible = False
      SeriesColor = clRed
      Title = 'Template: Age'
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Bar'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
      Identifier = 'Template: Age'
      Style = 61
    end
    object Series1: TBarSeries
      Marks.ArrowLength = 20
      Marks.Visible = False
      SeriesColor = clRed
      Title = '1998'
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Bar'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
      Identifier = '1998'
      Style = 40
    end
    object Series5: TBarSeries
      Marks.ArrowLength = 20
      Marks.Visible = False
      SeriesColor = clGreen
      Title = '1999'
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Bar'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
      Identifier = '1999'
      Style = 40
    end
    object Series6: TBarSeries
      Marks.ArrowLength = 20
      Marks.Visible = False
      SeriesColor = clYellow
      Title = '2000'
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Bar'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
      Identifier = '2000'
      Style = 40
    end
    object Series7: TBarSeries
      Marks.ArrowLength = 20
      Marks.Visible = False
      SeriesColor = clBlue
      Title = '2001'
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Bar'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
      Identifier = '2001'
      Style = 40
    end
    object Series8: TBarSeries
      Marks.ArrowLength = 20
      Marks.Visible = False
      SeriesColor = clWhite
      Title = '2002'
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Bar'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
      Identifier = '2002'
      Style = 40
    end
    object Series9: TBarSeries
      Marks.ArrowLength = 20
      Marks.Visible = False
      SeriesColor = clGray
      Title = '2003'
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Bar'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
      Identifier = '2003'
      Style = 40
    end
  end
  object Button1: TButton
    Left = 440
    Top = 360
    Width = 75
    Height = 25
    Caption = #36864#20986
    TabOrder = 2
    OnClick = Button1Click
  end
  object DecisionCube1: TDecisionCube
    DataSet = DecisionQuery1
    DimensionMap = <
      item
        ActiveFlag = diAsNeeded
        FieldType = ftSmallint
        Fieldname = 'Age'
        BaseName = '"Student.db".Age'
        Name = 'Age'
        DerivedFrom = -1
        DimensionType = dimDimension
        BinType = binNone
        ValueCount = 5
        Active = True
      end
      item
        ActiveFlag = diAsNeeded
        FieldType = ftDate
        Fieldname = 'Entrance'
        BaseName = '"Student.db".Entrance'
        Name = 'Entrance'
        DerivedFrom = -1
        DimensionType = dimDimension
        BinType = binYear
        ValueCount = 6
        Active = True
        StartValue = 37987.000000000000000000
      end
      item
        ActiveFlag = diAsNeeded
        FieldType = ftInteger
        Fieldname = 'COUNT OF Sex'
        BaseName = '"Student.db".Sex'
        Name = 'COUNT OF Sex'
        DerivedFrom = -1
        DimensionType = dimCount
        BinType = binNone
        ValueCount = -1
        Active = True
      end>
    ShowProgressDialog = True
    MaxDimensions = 5
    MaxSummaries = 10
    MaxCells = 0
    Left = 16
    Top = 16
  end
  object DecisionQuery1: TDecisionQuery
    Active = True
    DatabaseName = 'ZJJ'
    SQL.Strings = (
      'SELECT Age,Entrance,COUNT(Sex)'
      'FROM "Student.db"'
      'GROUP BY Age,Entrance')
    Left = 56
    Top = 16
  end
  object DecisionSource1: TDecisionSource
    DecisionCube = DecisionCube1
    ControlType = xtCheck
    SparseRows = False
    SparseCols = False
    Left = 96
    Top = 16
    DimensionCount = 2
    SummaryCount = 1
    CurrentSummary = 0
    SparseRows = False
    SparseCols = False
    DimensionInfo = (
      2
      0
      1
      0
      0
      1
      0
      1
      0
      0)
  end
end
