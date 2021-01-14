object Form1: TForm1
  Left = 251
  Top = 156
  Width = 870
  Height = 450
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
    Left = 152
    Top = 248
    Width = 465
    Height = 169
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DBGrid2: TDBGrid
    Left = 448
    Top = 88
    Width = 281
    Height = 89
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 272
    Top = 40
    Width = 81
    Height = 41
    Caption = 'Button1'
    TabOrder = 2
    OnClick = Button1Click
  end
  object ListBox1: TListBox
    Left = 288
    Top = 112
    Width = 121
    Height = 97
    ItemHeight = 13
    TabOrder = 3
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=745213690;Persist Security Info=Tru' +
      'e;User ID=sa;Initial Catalog=ceshi;Data Source=.;Use Procedure f' +
      'or Prepare=1;Auto Translate=True;Packet Size=4096;Workstation ID' +
      '=WWW-1819ED26F33;Use Encryption for Data=False;Tag with column c' +
      'ollation when possible=False'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 144
    Top = 16
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 248
    Top = 128
  end
  object ADOQuery1: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select   *   from   Dv_Admin')
    Left = 104
    Top = 112
  end
end
