object Form1: TForm1
  Left = 55
  Top = 114
  Width = 546
  Height = 346
  Caption = 'TtsDBGrid: Using RecordIds'
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
  object Label2: TLabel
    Left = 128
    Top = 264
    Width = 383
    Height = 33
    AutoSize = False
    Caption = 
      'Reordering the data will keep the row color properties in tact w' +
      'hen using record ids. While sorting will change the bookmarks, i' +
      't will not change the record ids. '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 489
    Height = 30
    AutoSize = False
    Caption = 
      'This example shows how to use record ids to identify records ins' +
      'tead of using bookmarks. Using record ids allows you to keep row' +
      ' and cell properties in place even when the order of the data ch' +
      'anges. '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object Label4: TLabel
    Left = 408
    Top = 140
    Width = 92
    Height = 52
    Caption = 
      'This will also show how to access selected records in the TtsDBG' +
      'rid.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object grCustomer: TtsDBGrid
    Left = 12
    Top = 48
    Width = 379
    Height = 202
    CellSelectMode = cmNone
    CheckBoxStyle = stCheck
    DataSource = dsCustomer
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
    ThumbTracking = True
    UseRecordIds = True
    Version = '2.20.20'
    OnGetRecordID = grCustomerGetRecordID
    DataBound = True
  end
  object Button2: TButton
    Left = 8
    Top = 264
    Width = 113
    Height = 25
    Caption = 'Change Table Order'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button1: TButton
    Left = 402
    Top = 106
    Width = 103
    Height = 27
    Caption = 'Color selected rows'
    TabOrder = 2
    OnClick = Button1Click
  end
  object dsCustomer: TDataSource
    DataSet = tbCustomer
    Left = 16
    Top = 224
  end
  object tbCustomer: TTable
    DatabaseName = 'DBDEMOS'
    TableName = 'CUSTOMER.DB'
    Left = 48
    Top = 224
  end
end
