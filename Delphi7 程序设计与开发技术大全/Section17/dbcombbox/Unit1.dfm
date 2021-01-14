object Form1: TForm1
  Left = 254
  Top = 251
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
    Width = 50
    Height = 13
    Caption = 'Population'
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
    KeyField = 'Name'
    ListField = 'Population'
    ListSource = DataSource1
    TabOrder = 3
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 64
    Top = 8
  end
  object Table1: TTable
    DatabaseName = 'DBDEMOS'
    TableName = 'country.db'
    Left = 128
    Top = 8
  end
end
