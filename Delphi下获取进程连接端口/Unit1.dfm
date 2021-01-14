object Form1: TForm1
  Left = 233
  Top = 131
  Width = 544
  Height = 375
  Caption = #36827#31243#36830#25509#31471#21475#26597#30475#22120
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 536
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 168
      Height = 12
      Caption = #21457#29616' TCP/UDP '#36830#25509#31471#21475#65306' 0 '#20010
    end
    object Button1: TButton
      Left = 232
      Top = 8
      Width = 75
      Height = 25
      Caption = #21047#26032
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 320
      Top = 8
      Width = 75
      Height = 25
      Caption = #20445#23384
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 408
      Top = 8
      Width = 75
      Height = 25
      Caption = #20851#20110
      TabOrder = 2
      OnClick = Button3Click
    end
  end
  object StringGrid1: TStringGrid
    Left = 0
    Top = 41
    Width = 536
    Height = 307
    Align = alClient
    ColCount = 8
    DefaultRowHeight = 20
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect, goThumbTracking]
    TabOrder = 1
    ColWidths = (
      42
      123
      116
      66
      53
      106
      290
      530)
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'txt'
    Filter = #25991#26412#25991#20214'|*.txt|'#25152#26377#25991#20214'|*.*'
    Left = 8
    Top = 88
  end
end
