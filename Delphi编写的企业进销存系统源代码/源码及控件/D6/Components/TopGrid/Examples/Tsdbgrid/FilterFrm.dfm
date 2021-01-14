object Form1: TForm1
  Left = 88
  Top = 97
  Width = 571
  Height = 375
  Caption = 'TtsDBGrid: Filtering data'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 545
    Height = 33
    AutoSize = False
    Caption = 
      'This example provides an interface for filtering data using two ' +
      'grids. One grid with a single line is used for entering a filter' +
      ' condition. A second grid is used for displaying the filtered da' +
      'ta.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 10485760
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object Label2: TLabel
    Left = 8
    Top = 48
    Width = 545
    Height = 33
    AutoSize = False
    Caption = 
      'To filter data, type in a value for one or more fields in the si' +
      'ngle line grid at the top and press Enter. Comparison operators ' +
      'such as '#39'>'#39' and '#39'<'#39' can also be used. The filter results will be' +
      ' displayed in the main grid below.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 10485760
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object grdData: TtsDBGrid
    Left = 8
    Top = 112
    Width = 545
    Height = 225
    AutoScale = True
    CellSelectMode = cmNone
    CheckBoxStyle = stCheck
    Cols = 13
    Ctl3D = False
    DataSource = dsCustomers
    ExactRowCount = True
    ExportDelimiter = ','
    FieldState = fsCustomized
    GridMode = gmListBox
    HeadingFont.Charset = DEFAULT_CHARSET
    HeadingFont.Color = clWindowText
    HeadingFont.Height = -11
    HeadingFont.Name = 'MS Sans Serif'
    HeadingFont.Style = []
    ParentCtl3D = False
    ParentShowHint = False
    RowChangedIndicator = riAutoReset
    RowMoving = False
    ShowHint = True
    TabOrder = 0
    Version = '2.20.20'
    OnColMoved = grdDataColMoved
    OnColResized = grdDataColResized
    OnTopLeftChanged = grdDataTopLeftChanged
    DataBound = True
    ColProperties = <
      item
        DataCol = 1
        FieldName = 'CustNo'
        Col.ControlType = ctText
        Col.FieldName = 'CustNo'
        Col.Width = 66
        Col.AssignedValues = #2
      end
      item
        DataCol = 2
        FieldName = 'Country'
        Col.ControlType = ctText
        Col.FieldName = 'Country'
        Col.MaxLength = 20
        Col.Width = 126
        Col.AssignedValues = #2
      end
      item
        DataCol = 3
        FieldName = 'Company'
        Col.ControlType = ctText
        Col.FieldName = 'Company'
        Col.MaxLength = 30
        Col.Width = 186
        Col.AssignedValues = #2
      end
      item
        DataCol = 4
        FieldName = 'Addr1'
        Col.ControlType = ctText
        Col.FieldName = 'Addr1'
        Col.MaxLength = 30
        Col.Width = 186
        Col.AssignedValues = #2
      end
      item
        DataCol = 5
        FieldName = 'Addr2'
        Col.ControlType = ctText
        Col.FieldName = 'Addr2'
        Col.MaxLength = 30
        Col.Width = 186
        Col.AssignedValues = #2
      end
      item
        DataCol = 6
        FieldName = 'City'
        Col.ControlType = ctText
        Col.FieldName = 'City'
        Col.MaxLength = 15
        Col.Width = 96
        Col.AssignedValues = #2
      end
      item
        DataCol = 7
        FieldName = 'State'
        Col.ControlType = ctText
        Col.FieldName = 'State'
        Col.MaxLength = 20
        Col.Width = 126
        Col.AssignedValues = #2
      end
      item
        DataCol = 8
        FieldName = 'Zip'
        Col.ControlType = ctText
        Col.FieldName = 'Zip'
        Col.MaxLength = 10
        Col.Width = 66
        Col.AssignedValues = #2
      end
      item
        DataCol = 9
        FieldName = 'Phone'
        Col.ControlType = ctText
        Col.FieldName = 'Phone'
        Col.MaxLength = 15
        Col.Width = 96
        Col.AssignedValues = #2
      end
      item
        DataCol = 10
        FieldName = 'FAX'
        Col.ControlType = ctText
        Col.FieldName = 'FAX'
        Col.MaxLength = 15
        Col.Width = 96
        Col.AssignedValues = #2
      end
      item
        DataCol = 11
        FieldName = 'TaxRate'
        Col.ControlType = ctText
        Col.FieldName = 'TaxRate'
        Col.Width = 66
        Col.AssignedValues = #2
      end
      item
        DataCol = 12
        FieldName = 'Contact'
        Col.ControlType = ctText
        Col.FieldName = 'Contact'
        Col.MaxLength = 20
        Col.Width = 126
        Col.AssignedValues = #2
      end
      item
        DataCol = 13
        FieldName = 'LastInvoiceDate'
        Col.ControlType = ctText
        Col.FieldName = 'LastInvoiceDate'
        Col.Width = 84
        Col.AssignedValues = #2
      end>
  end
  object grdFilter: TtsDBGrid
    Left = 8
    Top = 98
    Width = 545
    Height = 15
    CheckBoxStyle = stCheck
    Color = clBtnFace
    Cols = 14
    Ctl3D = False
    DefaultRowHeight = 15
    ExactRowCount = True
    ExportDelimiter = ','
    HeadingFont.Charset = DEFAULT_CHARSET
    HeadingFont.Color = clWindowText
    HeadingFont.Height = -11
    HeadingFont.Name = 'MS Sans Serif'
    HeadingFont.Style = []
    HeadingOn = False
    ParentCtl3D = False
    ParentShowHint = False
    RowBarIndicator = False
    Rows = 1
    ScrollBars = ssNone
    ShowHint = True
    StoreData = True
    TabOrder = 1
    Version = '2.20.20'
    OnComboDropDown = grdFilterComboDropDown
    OnComboGetValue = grdFilterComboGetValue
    OnComboRollUp = grdFilterComboRollUp
    OnKeyDown = grdFilterKeyDown
    OnTopLeftChanged = grdFilterTopLeftChanged
    DataBound = False
    ColProperties = <
      item
        DataCol = 1
        Col.Color = clWindow
        Col.AssignedValues = #0
      end
      item
        DataCol = 2
        Col.ButtonType = btCombo
        Col.Color = clWindow
        Col.ParentCombo = False
        Col.ComboDatasource = dsCountries
        Col.Combo = {
          545046300E5474734442436F6D626F4772696400044C656674020003546F7002
          000557696474680340010648656967687402780754616253746F70080A417574
          6F53656172636807056173546F700C44726F70446F776E526F777302040C4472
          6F70446F776E436F6C7302020D436865636B426F785374796C65070773744368
          65636B0A44617461536F757263650711466F726D312E6473436F756E74726965
          730F44656661756C74436F6C5769647468024A0D4578616374526F77436F756E
          74091348656164696E67466F6E742E43686172736574070F44454641554C545F
          434841525345541148656164696E67466F6E742E436F6C6F72070C636C57696E
          646F77546578741248656164696E67466F6E742E48656967687402F510486561
          64696E67466F6E742E4E616D65060D4D532053616E7320536572696611486561
          64696E67466F6E742E5374796C650B000756657273696F6E0607322E32302E32
          300944617461426F756E64090000}
        Col.AssignedValues = #0
      end
      item
        DataCol = 3
        Col.Color = clWindow
        Col.AssignedValues = #0
      end
      item
        DataCol = 4
        Col.Color = clWindow
        Col.AssignedValues = #0
      end
      item
        DataCol = 5
        Col.Color = clWindow
        Col.AssignedValues = #0
      end
      item
        DataCol = 6
        Col.Color = clWindow
        Col.AssignedValues = #0
      end
      item
        DataCol = 7
        Col.Color = clWindow
        Col.AssignedValues = #0
      end
      item
        DataCol = 8
        Col.Color = clWindow
        Col.AssignedValues = #0
      end
      item
        DataCol = 9
        Col.Color = clWindow
        Col.AssignedValues = #0
      end
      item
        DataCol = 10
        Col.Color = clWindow
        Col.AssignedValues = #0
      end
      item
        DataCol = 11
        Col.Color = clWindow
        Col.AssignedValues = #0
      end
      item
        DataCol = 12
        Col.Color = clWindow
        Col.AssignedValues = #0
      end
      item
        DataCol = 13
        Col.Color = clWindow
        Col.AssignedValues = #0
      end
      item
        DataCol = 14
        Col.Color = clWindow
        Col.AssignedValues = #0
      end>
    Data = {0000000000000000}
  end
  object dsCustomers: TDataSource
    DataSet = tbCustomers
    Left = 40
    Top = 136
  end
  object tbCustomers: TTable
    DatabaseName = 'DBDEMOS'
    TableName = 'CUSTOMER.DB'
    Left = 80
    Top = 136
  end
  object qryCountries: TQuery
    DatabaseName = 'DBDEMOS'
    SQL.Strings = (
      'select distinct(country) from customer')
    Left = 168
    Top = 136
  end
  object dsCountries: TDataSource
    DataSet = qryCountries
    Left = 136
    Top = 136
  end
end
