object Form1: TForm1
  Left = 204
  Top = 136
  Width = 536
  Height = 450
  Caption = 'TtsDBGrid: Sorting data using heading buttons'
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
  object tsDBGrid1: TtsDBGrid
    Left = 0
    Top = 117
    Width = 528
    Height = 299
    Align = alClient
    CellSelectMode = cmNone
    CheckBoxStyle = stCheck
    DataSource = DataSource1
    ExactRowCount = True
    ExportDelimiter = ','
    HeadingButton = hbCell
    HeadingFont.Charset = DEFAULT_CHARSET
    HeadingFont.Color = clWindowText
    HeadingFont.Height = -11
    HeadingFont.Name = 'MS Sans Serif'
    HeadingFont.Style = []
    PrintTitle = 'Sorting Data for TopGrid Report'
    PrintWithGridFormats = False
    RowChangedIndicator = riAutoReset
    RowMoving = False
    ProvideGridMenu = True
    GridReport = osGridReport1
    TabOrder = 0
    Version = '2.20.20'
    OnColMoved = tsDBGrid1ColMoved
    OnHeadingClick = tsDBGrid1HeadingClick
    DataBound = True
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 528
    Height = 117
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 5
      Top = 5
      Width = 500
      Height = 33
      AutoSize = False
      Caption = 
        'Click on the heading of a column to sort the data on that column' +
        #39's field. If you click on several columns the data is sorted fro' +
        'm left to right.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object Label2: TLabel
      Left = 5
      Top = 37
      Width = 208
      Height = 32
      AutoSize = False
      Caption = 
        'Change the grid report characteristics and then press the Print ' +
        'Preview button...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object Label3: TLabel
      Left = 248
      Top = 48
      Width = 51
      Height = 13
      Caption = 'Page Size:'
    end
    object Label4: TLabel
      Left = 212
      Top = 72
      Width = 83
      Height = 13
      Caption = 'Report Rows are:'
    end
    object Label5: TLabel
      Left = 204
      Top = 96
      Width = 95
      Height = 13
      Caption = 'Number of Columns:'
    end
    object Button1: TButton
      Left = 440
      Top = 88
      Width = 81
      Height = 25
      Caption = 'Print Preview...'
      TabOrder = 0
      OnClick = Button1Click
    end
    object cbPaper: TComboBox
      Left = 304
      Top = 44
      Width = 125
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 1
      Text = 'Letter'
      OnClick = cbPaperClick
      Items.Strings = (
        'Letter'
        'Legal')
    end
    object cbRows: TComboBox
      Left = 304
      Top = 68
      Width = 125
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 2
      Text = 'Normal'
      OnClick = cbRowsClick
      Items.Strings = (
        'Normal'
        'Banded'
        'Line Separated')
    end
    object edCols: TEdit
      Left = 304
      Top = 92
      Width = 33
      Height = 21
      TabOrder = 3
      Text = '0'
    end
    object UpDown1: TUpDown
      Left = 337
      Top = 92
      Width = 16
      Height = 21
      Associate = edCols
      Min = 0
      Position = 0
      TabOrder = 4
      Wrap = False
    end
    object rgMode: TRadioGroup
      Left = 4
      Top = 64
      Width = 193
      Height = 49
      Caption = 'Grid Column Mode '
      ItemIndex = 0
      Items.Strings = (
        'Sorting'
        'Column Selection (for Reporting)')
      TabOrder = 5
      OnClick = rgModeClick
    end
  end
  object DataSource1: TDataSource
    DataSet = qryCustomer
    Left = 32
    Top = 164
  end
  object qryCustomer: TQuery
    DatabaseName = 'DBDEMOS'
    SQL.Strings = (
      'Select * from Orders'
      '')
    Left = 64
    Top = 164
  end
  object osGridReport1: TosGridReport
    DateTimeLabel = 'DateTime:'
    PageLabel = 'Page:'
    EndOfReportLabel = '*** END OF REPORT ***'
    RecordCountLabel = 'Records'
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clRed
    TitleFont.Height = -16
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    ProvideGridMenu = True
    MenuOptionsText = 'Preview...|Print...|Export...'
    Margins.RightMargin = 7
    Margins.LeftMargin = 7
    Margins.BottomMargin = 15
    Margins.TopMargin = 7
    PrintBandColor = clMenu
    Left = 92
    Top = 164
  end
end
