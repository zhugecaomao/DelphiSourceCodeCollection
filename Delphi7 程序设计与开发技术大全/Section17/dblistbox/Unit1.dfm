object Form1: TForm1
  Left = 305
  Top = 206
  Width = 530
  Height = 344
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
    Left = 184
    Top = 8
    Width = 57
    Height = 13
    Caption = 'Continent'
  end
  object DBGrid1: TDBGrid
    Left = 24
    Top = 40
    Width = 465
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
  object DBComboBox1: TDBComboBox
    Left = 264
    Top = 8
    Width = 113
    Height = 21
    DataField = 'Continent'
    DataSource = DataSource1
    ItemHeight = 13
    Items.Strings = (
      'Asia'
      'South America'
      'North America'
      'Africa'
      'Europ')
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
    TableName = 'country.db'
    Left = 112
    Top = 8
  end
end
