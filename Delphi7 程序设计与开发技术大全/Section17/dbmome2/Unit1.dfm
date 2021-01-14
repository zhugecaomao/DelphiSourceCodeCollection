object Form1: TForm1
  Left = 116
  Top = 114
  Width = 696
  Height = 480
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
  object DBGrid1: TDBGrid
    Left = 16
    Top = 160
    Width = 657
    Height = 257
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DBMemo1: TDBMemo
    Left = 16
    Top = 16
    Width = 321
    Height = 137
    AutoDisplay = False
    DataField = 'Notes'
    DataSource = DataSource1
    TabOrder = 1
  end
  object DBNavigator1: TDBNavigator
    Left = 392
    Top = 48
    Width = 240
    Height = 25
    DataSource = DataSource1
    TabOrder = 2
  end
  object BitBtn1: TBitBtn
    Left = 472
    Top = 112
    Width = 75
    Height = 25
    TabOrder = 3
    Kind = bkClose
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 352
    Top = 32
  end
  object Table1: TTable
    Active = True
    DatabaseName = 'DBDEMOS'
    TableName = 'biolife.db'
    Left = 352
    Top = 112
  end
end
