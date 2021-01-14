object Form1: TForm1
  Left = 206
  Top = 180
  Width = 442
  Height = 229
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
  object Button1: TButton
    Left = 160
    Top = 104
    Width = 89
    Height = 25
    Caption = #26174#31034#25253#34920
    TabOrder = 0
    OnClick = Button1Click
  end
  object Table1: TTable
    DatabaseName = 'DBDEMOS'
    TableName = 'country.db'
    Left = 48
    Top = 16
  end
  object RvDataSetConnection1: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = Table1
    Left = 120
    Top = 16
  end
  object RvProject1: TRvProject
    ProjectFile = 'F:\Program Files\Borland\Delphi7\Rave5\simple.rav'
    Left = 176
    Top = 16
  end
end
