object Form1: TForm1
  Left = 45
  Top = 116
  Width = 625
  Height = 404
  Caption = 'TtsDBGrid: Process selected rows'
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
    Left = 448
    Top = 13
    Width = 161
    Height = 52
    AutoSize = False
    Caption = 
      'Select a number of rows, and press the total button to calculate' +
      ' the total of the AmountPaid field.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object tsDBGrid1: TtsDBGrid
    Left = 8
    Top = 16
    Width = 433
    Height = 349
    CellSelectMode = cmNone
    CheckBoxStyle = stCheck
    DataSource = DataSource1
    ExactRowCount = True
    ExportDelimiter = ','
    HeadingHorzAlignment = htaCenter
    HeadingFont.Charset = DEFAULT_CHARSET
    HeadingFont.Color = clWindowText
    HeadingFont.Height = -11
    HeadingFont.Name = 'MS Sans Serif'
    HeadingFont.Style = []
    RowChangedIndicator = riAutoReset
    RowMoving = False
    GridReport = osGridReport1
    TabOrder = 0
    Version = '2.20.21'
    XMLExport.Version = '1.0'
    XMLExport.DataPacketVersion = '2.0'
    OnCellLoaded = tsDBGrid1CellLoaded
    OnSelectChanged = tsDBGrid1SelectChanged
    DataBound = True
  end
  object butTotal: TButton
    Left = 446
    Top = 88
    Width = 99
    Height = 33
    Caption = 'Calculate Total'
    Enabled = False
    TabOrder = 1
    OnClick = butTotalClick
  end
  object DataSource1: TDataSource
    DataSet = tblOrders
    Left = 32
    Top = 48
  end
  object tblOrders: TTable
    DatabaseName = 'DBDEMOS'
    IndexName = 'CustNo'
    TableName = 'ORDERS.DB'
    Left = 64
    Top = 48
    object tblOrdersOrderNo: TFloatField
      FieldName = 'OrderNo'
    end
    object tblOrdersCustNo: TFloatField
      FieldName = 'CustNo'
      Required = True
    end
    object tblOrdersCompany: TStringField
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'Company'
      LookupDataSet = tblCustomer
      LookupKeyFields = 'CustNo'
      LookupResultField = 'Company'
      KeyFields = 'CustNo'
      Size = 30
      Lookup = True
    end
    object tblOrdersItemsTotal: TCurrencyField
      FieldName = 'ItemsTotal'
    end
    object tblOrdersAmountPaid: TCurrencyField
      FieldName = 'AmountPaid'
    end
    object tblOrdersSaleDate: TDateTimeField
      FieldName = 'SaleDate'
    end
    object tblOrdersShipDate: TDateTimeField
      FieldName = 'ShipDate'
    end
    object tblOrdersEmpNo: TIntegerField
      FieldName = 'EmpNo'
      Required = True
    end
    object tblOrdersShipToContact: TStringField
      FieldName = 'ShipToContact'
    end
    object tblOrdersShipToAddr1: TStringField
      FieldName = 'ShipToAddr1'
      Size = 30
    end
    object tblOrdersShipToAddr2: TStringField
      FieldName = 'ShipToAddr2'
      Size = 30
    end
    object tblOrdersShipToCity: TStringField
      FieldName = 'ShipToCity'
      Size = 15
    end
    object tblOrdersShipToState: TStringField
      FieldName = 'ShipToState'
    end
    object tblOrdersShipToZip: TStringField
      FieldName = 'ShipToZip'
      Size = 10
    end
    object tblOrdersShipToCountry: TStringField
      FieldName = 'ShipToCountry'
    end
    object tblOrdersShipToPhone: TStringField
      FieldName = 'ShipToPhone'
      Size = 15
    end
    object tblOrdersShipVIA: TStringField
      FieldName = 'ShipVIA'
      Size = 7
    end
    object tblOrdersPO: TStringField
      FieldName = 'PO'
      Size = 15
    end
    object tblOrdersTerms: TStringField
      FieldName = 'Terms'
      Size = 6
    end
    object tblOrdersPaymentMethod: TStringField
      FieldName = 'PaymentMethod'
      Size = 7
    end
    object tblOrdersTaxRate: TFloatField
      FieldName = 'TaxRate'
    end
    object tblOrdersFreight: TCurrencyField
      FieldName = 'Freight'
    end
  end
  object tblCustomer: TTable
    DatabaseName = 'DBDEMOS'
    TableName = 'CUSTOMER.DB'
    Left = 96
    Top = 48
  end
  object osGridReport1: TosGridReport
    DateTimeLabel = 'DateTime:'
    PageLabel = 'Page:'
    PaperSize = psLegal
    EndOfReportLabel = '*** END OF REPORT ***'
    RecordCountLabel = 'Records'
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    ProvideGridMenu = True
    MenuOptionsText = 'Preview...|Print...|Export...'
    Margins.RightMargin = 7
    Margins.LeftMargin = 7
    Margins.BottomMargin = 15
    Margins.TopMargin = 7
    PrintLineMode = lmBanded
    PrintBandColor = clScrollBar
    Left = 476
    Top = 124
  end
end
