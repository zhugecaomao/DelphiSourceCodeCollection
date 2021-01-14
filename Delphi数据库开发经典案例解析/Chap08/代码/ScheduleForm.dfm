object Schedule: TSchedule
  Left = 253
  Top = 137
  Width = 643
  Height = 481
  Caption = #35838#31243#34920
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StringGrid1: TStringGrid
    Left = 0
    Top = 56
    Width = 633
    Height = 393
    FixedCols = 0
    RowCount = 8
    TabOrder = 0
    OnDrawCell = StringGrid1DrawCell
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 633
    Height = 57
    Caption = #22522#26412#20449#24687#65288#36755#20837#23398#21495#21518#22238#36710#65289
    TabOrder = 1
    object Label3: TLabel
      Left = 416
      Top = 24
      Width = 33
      Height = 13
      AutoSize = False
      Caption = #29677#32423
    end
    object Label2: TLabel
      Left = 232
      Top = 24
      Width = 33
      Height = 13
      AutoSize = False
      Caption = #22995#21517
    end
    object Label1: TLabel
      Left = 48
      Top = 24
      Width = 33
      Height = 13
      AutoSize = False
      Caption = #23398#21495
    end
    object Edit3: TEdit
      Left = 447
      Top = 21
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 263
      Top = 21
      Width = 106
      Height = 21
      Enabled = False
      TabOrder = 1
    end
    object Edit1: TEdit
      Left = 79
      Top = 21
      Width = 121
      Height = 21
      TabOrder = 2
      OnKeyPress = Edit1KeyPress
    end
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 376
    Top = 96
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=$%*^@;Persist Security Info=True;Us' +
      'er ID=sa;Initial Catalog=eisbook'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 416
    Top = 96
  end
end
