object Form1: TForm1
  Left = 181
  Top = 188
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
  object Label1: TLabel
    Left = 24
    Top = 0
    Width = 337
    Height = 33
    AutoSize = False
  end
  object Label2: TLabel
    Left = 392
    Top = 8
    Width = 129
    Height = 13
    AutoSize = False
    Caption = #36825#26159#25968#25454#24211#20013#30340#25968#25454
  end
  object DBCalendar1: TDBCalendar
    Left = 24
    Top = 32
    Width = 320
    Height = 120
    ReadOnly = False
    DataSource = DataSource1
    DataField = 'date'
  end
  object DBGrid1: TDBGrid
    Left = 352
    Top = 32
    Width = 320
    Height = 120
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'date'
        Visible = True
      end>
  end
  object DBNavigator1: TDBNavigator
    Left = 168
    Top = 280
    Width = 240
    Height = 25
    DataSource = DataSource1
    TabOrder = 2
  end
  object Button1: TButton
    Left = 32
    Top = 168
    Width = 75
    Height = 25
    Caption = #21069#19968#24180
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 120
    Top = 168
    Width = 75
    Height = 25
    Caption = #21069#19968#26376
    TabOrder = 4
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 208
    Top = 168
    Width = 75
    Height = 25
    Caption = #19979#19968#26376
    TabOrder = 5
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 296
    Top = 168
    Width = 75
    Height = 25
    Caption = #19979#19968#24180
    TabOrder = 6
    OnClick = Button4Click
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=testDBCal.mdb;Persi' +
      'st Security Info=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 200
    Top = 224
  end
  object DataSource1: TDataSource
    DataSet = ADODataSet1
    OnDataChange = DataSource1DataChange
    Left = 280
    Top = 224
  end
  object ADODataSet1: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 'select * from test'
    Parameters = <>
    Left = 376
    Top = 224
  end
end
