object Form1: TForm1
  Left = 307
  Top = 203
  Width = 870
  Height = 500
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel
    Left = 24
    Top = 104
    Width = 60
    Height = 12
    Caption = #20363#65306#20837#24211#21333
  end
  object Grid: TStringGrid
    Left = 24
    Top = 129
    Width = 601
    Height = 152
    Hint = #34920#19968
    ColCount = 8
    DefaultRowHeight = 20
    FixedCols = 0
    RowCount = 13
    TabOrder = 2
    ColWidths = (
      64
      64
      64
      64
      64
      64
      64
      87)
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 862
    Height = 89
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Button1: TButton
      Left = 72
      Top = 32
      Width = 75
      Height = 25
      Caption = #35774#35745
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 160
      Top = 32
      Width = 75
      Height = 25
      Caption = #39044#35272
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 251
      Top = 32
      Width = 75
      Height = 25
      Caption = #25171#21360
      TabOrder = 2
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 341
      Top = 32
      Width = 75
      Height = 25
      Caption = #30452#25509#25171#21360
      TabOrder = 3
      OnClick = Button4Click
    end
  end
  object Grid1: TStringGrid
    Left = 24
    Top = 289
    Width = 601
    Height = 160
    Hint = #34920#20108
    ColCount = 8
    DefaultRowHeight = 20
    FixedCols = 0
    TabOrder = 3
    ColWidths = (
      64
      64
      64
      64
      64
      64
      64
      87)
  end
  object Memo1: TMemo
    Left = 640
    Top = 112
    Width = 185
    Height = 89
    Lines.Strings = (
      #21487#20197#20256#20837'N'#22810#34920#26684#65292#20379#25171#21360#20351#29992#12290)
    ReadOnly = True
    TabOrder = 1
  end
  object adoconn: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=zooey;Persist Security Info=True;Us' +
      'er ID=sa;Initial Catalog=testprint;Data Source=COMPUTER'
    Provider = 'SQLOLEDB.1'
    Left = 720
    Top = 48
  end
end
