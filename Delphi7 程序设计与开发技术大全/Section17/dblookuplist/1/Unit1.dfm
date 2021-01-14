object Form1: TForm1
  Left = 204
  Top = 249
  Width = 567
  Height = 334
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
  object Label1: TLabel
    Left = 440
    Top = 32
    Width = 49
    Height = 13
    Caption = 'Order No'
  end
  object DBGrid1: TDBGrid
    Left = 24
    Top = 40
    Width = 385
    Height = 201
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DBNavigator1: TDBNavigator
    Left = 56
    Top = 256
    Width = 240
    Height = 25
    DataSource = DataSource1
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 368
    Top = 256
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkClose
  end
  object DBLookupListBox1: TDBLookupListBox
    Left = 416
    Top = 56
    Width = 121
    Height = 160
    KeyField = 'CustNo'
    ListField = 'OrderNo'
    ListSource = DataSource2
    TabOrder = 3
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 64
    Top = 8
  end
  object Table1: TTable
    Active = True
    DatabaseName = 'DBDEMOS'
    TableName = 'customer.db'
    Left = 128
    Top = 8
  end
  object DataSource2: TDataSource
    DataSet = Table2
    Left = 192
    Top = 8
  end
  object Table2: TTable
    Active = True
    DatabaseName = 'DBDEMOS'
    IndexName = 'CustNo'
    MasterFields = 'CustNo'
    MasterSource = DataSource1
    TableName = 'orders.db'
    Left = 248
    Top = 8
  end
end
