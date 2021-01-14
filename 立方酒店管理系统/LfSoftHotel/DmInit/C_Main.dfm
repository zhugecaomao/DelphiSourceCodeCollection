object Form1: TForm1
  Left = 192
  Top = 107
  Width = 544
  Height = 375
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
    Top = 56
    Width = 161
    Height = 249
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 104
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Write'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 184
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Read'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Memo1: TMemo
    Left = 184
    Top = 56
    Width = 121
    Height = 249
    TabOrder = 3
  end
  object BitBtn1: TBitBtn
    Left = 344
    Top = 112
    Width = 75
    Height = 25
    Caption = 'BitBtn1'
    TabOrder = 4
    OnClick = BitBtn1Click
  end
  object Table1: TTable
    DatabaseName = 'h1'
    Filter = 'JG='#39'W*'#39
    Filtered = True
    TableName = 'S_JG.DBF'
    Left = 24
    Top = 16
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 64
    Top = 16
  end
  object SaveDialog1: TSaveDialog
    Left = 432
    Top = 24
  end
  object OpenDialog1: TOpenDialog
    Left = 464
    Top = 24
  end
  object Table2: TTable
    Active = True
    DatabaseName = 'Lfhotel'
    TableName = 'KFDM'
    Left = 288
    Top = 16
  end
  object Database1: TDatabase
    AliasName = 'HOTELUSER'
    Connected = True
    DatabaseName = 'Lfhotel'
    LoginPrompt = False
    Params.Strings = (
      'USER NAME=SYSDBA'
      'PASSWORD=masterkey')
    SessionName = 'Default'
    Left = 336
    Top = 16
  end
end
