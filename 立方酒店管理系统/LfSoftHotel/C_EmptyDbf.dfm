object Form1: TForm1
  Left = 192
  Top = 107
  Width = 417
  Height = 312
  Caption = 'Empty'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 409
    Height = 233
    Align = alTop
    DataSource = dsDbfName
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object BitBtn1: TBitBtn
    Left = 240
    Top = 248
    Width = 75
    Height = 25
    Caption = '&Empty'
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 320
    Top = 248
    Width = 75
    Height = 25
    Caption = '&Cancel'
    TabOrder = 2
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 160
    Top = 248
    Width = 75
    Height = 25
    Caption = '&Empty All'
    TabOrder = 3
    OnClick = BitBtn3Click
  end
  object Database1: TDatabase
    AliasName = 'HOTELUSER'
    Connected = True
    DatabaseName = 'LfHotel'
    LoginPrompt = False
    Params.Strings = (
      'USER NAME=SYSDBA'
      'PASSWORD=masterkey')
    SessionName = 'Default'
    Left = 8
    Top = 8
  end
  object Query1: TQuery
    DatabaseName = 'LfHotel'
    Left = 48
    Top = 8
  end
  object tblDbfName: TTable
    DatabaseName = 'LfHotel'
    TableName = 'INITDBF'
    Left = 88
    Top = 8
  end
  object dsDbfName: TDataSource
    DataSet = tblDbfName
    Left = 128
    Top = 8
  end
end
