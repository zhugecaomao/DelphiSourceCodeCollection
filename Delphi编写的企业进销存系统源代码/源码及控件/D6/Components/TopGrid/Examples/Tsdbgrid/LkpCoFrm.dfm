object Form1: TForm1
  Left = 72
  Top = 84
  Width = 497
  Height = 354
  Caption = 'TtsDBGrid: Lookup field combo box'
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
    Left = 16
    Top = 8
    Width = 457
    Height = 33
    AutoSize = False
    Caption = 
      'This example uses a combo box for a lookup field to allow the us' +
      'er to select a company name from all available companies in a cu' +
      'stomer table.'
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
    Top = 48
    Width = 473
    Height = 273
    CellSelectMode = cmNone
    CheckBoxStyle = stCheck
    DataSource = DataSource1
    ExactRowCount = True
    ExportDelimiter = ','
    HeadingFont.Charset = DEFAULT_CHARSET
    HeadingFont.Color = clWindowText
    HeadingFont.Height = -11
    HeadingFont.Name = 'MS Sans Serif'
    HeadingFont.Style = []
    RowChangedIndicator = riAutoReset
    RowMoving = False
    TabOrder = 0
    Version = '2.20.20'
    OnComboInit = tsDBGrid1ComboInit
    DataBound = True
  end
  object DataSource1: TDataSource
    DataSet = tblOrders
    Left = 32
    Top = 72
  end
  object tblOrders: TTable
    DatabaseName = 'DBDEMOS'
    TableName = 'ORDERS.DB'
    Left = 64
    Top = 72
    object tblOrdersOrderNo: TFloatField
      FieldName = 'OrderNo'
    end
    object tblOrdersLkpCustomer: TStringField
      FieldKind = fkLookup
      FieldName = 'Company'
      LookupDataSet = tblCustomer
      LookupKeyFields = 'CustNo'
      LookupResultField = 'Company'
      KeyFields = 'CustNo'
      Size = 30
      Lookup = True
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
    object tblOrdersItemsTotal: TCurrencyField
      FieldName = 'ItemsTotal'
    end
    object tblOrdersTaxRate: TFloatField
      FieldName = 'TaxRate'
    end
    object tblOrdersFreight: TCurrencyField
      FieldName = 'Freight'
    end
    object tblOrdersAmountPaid: TCurrencyField
      FieldName = 'AmountPaid'
    end
    object tblOrdersCustNo: TFloatField
      FieldName = 'CustNo'
      Required = True
      Visible = False
    end
  end
  object tblCustomer: TTable
    DatabaseName = 'DBDEMOS'
    IndexName = 'ByCompany'
    TableName = 'CUSTOMER.DB'
    Left = 96
    Top = 72
    object tblCustomerCustNo: TFloatField
      FieldName = 'CustNo'
    end
    object tblCustomerCompany: TStringField
      FieldName = 'Company'
      Size = 30
    end
    object tblCustomerAddr1: TStringField
      FieldName = 'Addr1'
      Size = 30
    end
    object tblCustomerAddr2: TStringField
      FieldName = 'Addr2'
      Size = 30
    end
    object tblCustomerCity: TStringField
      FieldName = 'City'
      Size = 15
    end
    object tblCustomerState: TStringField
      FieldName = 'State'
    end
    object tblCustomerZip: TStringField
      FieldName = 'Zip'
      Size = 10
    end
    object tblCustomerCountry: TStringField
      FieldName = 'Country'
    end
    object tblCustomerPhone: TStringField
      FieldName = 'Phone'
      Size = 15
    end
    object tblCustomerFAX: TStringField
      FieldName = 'FAX'
      Size = 15
    end
    object tblCustomerTaxRate: TFloatField
      FieldName = 'TaxRate'
    end
    object tblCustomerContact: TStringField
      FieldName = 'Contact'
    end
    object tblCustomerLastInvoiceDate: TDateTimeField
      FieldName = 'LastInvoiceDate'
    end
  end
  object DataSource2: TDataSource
    DataSet = tblCustomerCombo
    Left = 160
    Top = 72
  end
  object tblCustomerCombo: TTable
    DatabaseName = 'DBDEMOS'
    IndexName = 'ByCompany'
    TableName = 'CUSTOMER.DB'
    Left = 192
    Top = 72
    object tblCustomerComboCustNo: TFloatField
      FieldName = 'CustNo'
    end
    object tblCustomerComboCompany: TStringField
      FieldName = 'Company'
      Size = 30
    end
  end
end
