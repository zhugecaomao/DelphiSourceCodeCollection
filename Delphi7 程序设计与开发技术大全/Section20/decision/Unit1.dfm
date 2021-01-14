object Form1: TForm1
  Left = 197
  Top = 187
  Width = 696
  Height = 480
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DecisionGrid1: TDecisionGrid
    Left = 32
    Top = 32
    Width = 497
    Height = 201
    DefaultColWidth = 100
    DefaultRowHeight = 20
    CaptionColor = clActiveCaption
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clCaptionText
    CaptionFont.Height = -11
    CaptionFont.Name = 'MS Sans Serif'
    CaptionFont.Style = []
    DataColor = clInfoBk
    DataSumColor = clNone
    DataFont.Charset = DEFAULT_CHARSET
    DataFont.Color = clWindowText
    DataFont.Height = -11
    DataFont.Name = 'MS Sans Serif'
    DataFont.Style = []
    LabelFont.Charset = DEFAULT_CHARSET
    LabelFont.Color = clWindowText
    LabelFont.Height = -11
    LabelFont.Name = 'MS Sans Serif'
    LabelFont.Style = []
    LabelColor = clBtnFace
    LabelSumColor = clInactiveCaption
    DecisionSource = DecisionSource1
    Dimensions = <
      item
        FieldName = 'LastName'
        Color = clNone
        Alignment = taCenter
        Subtotals = True
      end
      item
        FieldName = 'FirstName'
        Color = clNone
        Alignment = taCenter
        Subtotals = True
      end
      item
        FieldName = 'PhoneExt'
        Color = clNone
        Alignment = taCenter
        Subtotals = True
      end
      item
        FieldName = 'HireDate'
        Color = clNone
        Alignment = taCenter
        Subtotals = True
      end
      item
        FieldName = 'SUM OF Salary'
        Color = clNone
        Alignment = taCenter
        Subtotals = True
      end>
    Totals = True
    ShowCubeEditor = False
    Color = clBtnFace
    GridLineWidth = 1
    GridLineColor = clWindowText
    TabOrder = 0
  end
  object DecisionPivot1: TDecisionPivot
    Left = 112
    Top = 264
    Width = 353
    Height = 57
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
    TabOrder = 1
  end
  object DecisionQuery1: TDecisionQuery
    Active = True
    DatabaseName = 'DBDEMOS'
    SQL.Strings = (
      'SELECT LastName, FirstName, PhoneExt, HireDate, SUM( Salary )'
      'FROM "employee.db"'
      'GROUP BY LastName, FirstName, PhoneExt, HireDate')
    Left = 168
    Top = 16
  end
  object DecisionSource1: TDecisionSource
    DecisionCube = DecisionCube1
    ControlType = xtCheck
    SparseRows = False
    SparseCols = False
    Left = 56
    Top = 24
    DimensionCount = 4
    SummaryCount = 1
    CurrentSummary = 0
    SparseRows = False
    SparseCols = False
    DimensionInfo = (
      2
      0
      1
      0
      -1
      1
      0
      1
      0
      -1
      1
      -1
      2
      1
      -1
      1
      1
      1
      2
      0)
  end
  object DecisionCube1: TDecisionCube
    DataSet = DecisionQuery1
    DimensionMap = <
      item
        ActiveFlag = diAsNeeded
        FieldType = ftString
        Fieldname = 'LastName'
        BaseName = '"employee.db".LastName'
        Name = 'LastName'
        DerivedFrom = -1
        DimensionType = dimDimension
        BinType = binNone
        ValueCount = 40
        Active = True
      end
      item
        ActiveFlag = diAsNeeded
        FieldType = ftString
        Fieldname = 'FirstName'
        BaseName = '"employee.db".FirstName'
        Name = 'FirstName'
        DerivedFrom = -1
        DimensionType = dimDimension
        BinType = binNone
        ValueCount = 39
        Active = True
      end
      item
        ActiveFlag = diAsNeeded
        FieldType = ftString
        Fieldname = 'PhoneExt'
        BaseName = '"employee.db".PhoneExt'
        Name = 'PhoneExt'
        DerivedFrom = -1
        DimensionType = dimDimension
        BinType = binNone
        ValueCount = 39
        Active = True
      end
      item
        ActiveFlag = diAsNeeded
        FieldType = ftDateTime
        Fieldname = 'HireDate'
        BaseName = '"employee.db".HireDate'
        Name = 'HireDate'
        DerivedFrom = -1
        DimensionType = dimDimension
        BinType = binYear
        ValueCount = 7
        Active = True
        StartValue = 37987.000000000000000000
      end
      item
        ActiveFlag = diAsNeeded
        FieldType = ftFloat
        Fieldname = 'SUM OF Salary'
        BaseName = '"employee.db".Salary'
        Name = 'SUM OF Salary'
        DerivedFrom = -1
        DimensionType = dimSum
        BinType = binNone
        ValueCount = -1
        Active = True
      end>
    ShowProgressDialog = True
    MaxDimensions = 5
    MaxSummaries = 10
    MaxCells = 0
    Left = 112
    Top = 16
  end
end
