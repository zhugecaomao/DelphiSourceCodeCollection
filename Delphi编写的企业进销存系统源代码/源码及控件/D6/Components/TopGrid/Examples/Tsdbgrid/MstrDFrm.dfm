object Form1: TForm1
  Left = 18
  Top = 80
  Width = 589
  Height = 377
  Caption = 'TtsDBGrid: Master/Detail with Unbound Columns'
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
  object grCustomer: TtsDBGrid
    Left = 8
    Top = 32
    Width = 561
    Height = 131
    CellSelectMode = cmNone
    CheckBoxStyle = stCheck
    DataSource = dsCustomer
    ExactRowCount = True
    ExportDelimiter = ','
    GridMode = gmEditInsert
    HeadingFont.Charset = DEFAULT_CHARSET
    HeadingFont.Color = clWindowText
    HeadingFont.Height = -11
    HeadingFont.Name = 'MS Sans Serif'
    HeadingFont.Style = []
    RowChangedIndicator = riAutoReset
    RowMoving = False
    RowSelectMode = rsNone
    TabOrder = 0
    ThumbTracking = True
    Version = '2.20.20'
    OnCellLoaded = grCustomerCellLoaded
    DataBound = True
  end
  object grOrder: TtsDBGrid
    Left = 8
    Top = 208
    Width = 457
    Height = 131
    CellSelectMode = cmNone
    CheckBoxStyle = stCheck
    DataSource = dsOrder
    ExactRowCount = True
    ExportDelimiter = ','
    GridMode = gmEditInsert
    HeadingFont.Charset = DEFAULT_CHARSET
    HeadingFont.Color = clWindowText
    HeadingFont.Height = -11
    HeadingFont.Name = 'MS Sans Serif'
    HeadingFont.Style = []
    RowChangedIndicator = riAutoReset
    RowMoving = False
    RowSelectMode = rsNone
    TabOrder = 1
    ThumbTracking = True
    Version = '2.20.20'
    DataBound = True
  end
  object DBNavigator1: TDBNavigator
    Left = 8
    Top = 8
    Width = 200
    Height = 18
    DataSource = dsCustomer
    TabOrder = 2
  end
  object DBNavigator2: TDBNavigator
    Left = 8
    Top = 184
    Width = 200
    Height = 18
    DataSource = dsOrder
    TabOrder = 3
  end
  object dsCustomer: TDataSource
    DataSet = tbCustomer
    Left = 224
  end
  object tbCustomer: TTable
    DatabaseName = 'DBDEMOS'
    IndexName = 'ByCompany'
    TableName = 'CUSTOMER.DB'
    Left = 256
  end
  object tbOrder: TTable
    DatabaseName = 'DBDEMOS'
    IndexName = 'CustNo'
    MasterFields = 'CustNo'
    MasterSource = dsCustomer
    TableName = 'ORDERS.DB'
    Left = 248
    Top = 176
  end
  object dsOrder: TDataSource
    DataSet = tbOrder
    Left = 216
    Top = 176
  end
end
