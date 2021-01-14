object Form1: TForm1
  Left = 8
  Top = 23
  Width = 625
  Height = 441
  Caption = 'TtsDBGrid: Setting colors with properties and OnGetDrawInfo'
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
    Top = 13
    Width = 433
    Height = 33
    AutoSize = False
    Caption = 
      'There are two methods to set the color in the TopGrid: As a prop' +
      'erty or in an event. This example shows them both.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object Label2: TLabel
    Left = 392
    Top = 184
    Width = 185
    Height = 33
    AutoSize = False
    Caption = '2. By setting a property at the Row, column and cell level.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object Label3: TLabel
    Left = 390
    Top = 305
    Width = 209
    Height = 81
    AutoSize = False
    Caption = 
      'Simply set a property for instance based on validation of userin' +
      'put. It would be unwanted in most situations to validate all dat' +
      'a in the GetDrawEvent. By setting a property for a cell, row or ' +
      'column after a validation, the grid will keep track of it.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object Label4: TLabel
    Left = 392
    Top = 56
    Width = 185
    Height = 17
    AutoSize = False
    Caption = '1. In the GetDrawInfo event.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object Label5: TLabel
    Left = 392
    Top = 104
    Width = 201
    Height = 57
    AutoSize = False
    Caption = 
      'Use the GetDrawInfo event if you can easily test what color, fon' +
      't or alignment a cell should have. For instance negative or not.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object Label6: TLabel
    Left = 476
    Top = 235
    Width = 106
    Height = 52
    Caption = 
      'First select a row or column. Then use one of the buttons to set' +
      ' the color.'
    WordWrap = True
  end
  object tsDBGrid1: TtsDBGrid
    Left = 8
    Top = 56
    Width = 375
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
    TabOrder = 0
    Version = '2.20.20'
    OnCellLoaded = tsDBGrid1CellLoaded
    OnGetDrawInfo = tsDBGrid1GetDrawInfo
    OnSelectChanged = tsDBGrid1SelectChanged
    DataBound = True
  end
  object chkAmountDue: TCheckBox
    Left = 392
    Top = 79
    Width = 137
    Height = 17
    Caption = 'Show Amount Due <> 0'
    TabOrder = 1
    OnClick = chkAmountDueClick
  end
  object butRowColor: TButton
    Left = 390
    Top = 224
    Width = 75
    Height = 17
    Caption = 'Row Colors'
    Enabled = False
    TabOrder = 2
    OnClick = butRowColorClick
  end
  object butColColor: TButton
    Left = 390
    Top = 248
    Width = 75
    Height = 17
    Caption = 'Col Colors'
    Enabled = False
    TabOrder = 3
    OnClick = butColColorClick
  end
  object Button3: TButton
    Left = 390
    Top = 272
    Width = 75
    Height = 17
    Caption = 'Reset Colors'
    TabOrder = 4
    OnClick = Button3Click
  end
  object DataSource1: TDataSource
    DataSet = tblOrders
    Left = 32
    Top = 88
  end
  object tblOrders: TTable
    DatabaseName = 'DBDEMOS'
    TableName = 'ORDERS.DB'
    Left = 64
    Top = 88
    object tblOrdersOrderNo: TFloatField
      FieldName = 'OrderNo'
    end
    object tblOrdersCustNo: TFloatField
      FieldName = 'CustNo'
      Required = True
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
  object ColorDialog1: TColorDialog
    Ctl3D = True
    Left = 589
    Top = 246
  end
end
