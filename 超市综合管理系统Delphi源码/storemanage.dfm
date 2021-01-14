object Store_Form: TStore_Form
  Left = 153
  Top = 201
  Width = 696
  Height = 480
  Caption = #24211#23384#31649#29702
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 24
    Width = 689
    Height = 161
    DataSource = DataSource1
    ImeName = #26234#33021#38472#26725#36755#20837#24179#21488'  5.5'
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DataSource1: TDataSource
    DataSet = DataModule1.ADOTable1
    Left = 16
    Top = 32
  end
end
