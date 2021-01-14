object frmchaxun: Tfrmchaxun
  Left = 192
  Top = 107
  Width = 544
  Height = 375
  Caption = #25968#25454#26597#35810
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 12
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 536
    Height = 348
    Align = alClient
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
  end
  object ADOQuery1: TADOQuery
    Active = True
    Connection = frmdate.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from cszxx')
    Left = 288
    Top = 176
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 184
    Top = 168
  end
end
