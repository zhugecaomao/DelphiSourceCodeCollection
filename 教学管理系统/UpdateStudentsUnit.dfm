object UpdateStudentsForm: TUpdateStudentsForm
  Left = 197
  Top = 126
  BorderStyle = bsDialog
  Caption = #23398#29983#26356#26032
  ClientHeight = 402
  ClientWidth = 575
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 96
    Top = 56
    Width = 32
    Height = 16
    AutoSize = False
    Caption = #22995#21517
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #26999#20307'_GB2312'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 96
    Top = 111
    Width = 32
    Height = 16
    AutoSize = False
    Caption = #32534#21495
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #26999#20307'_GB2312'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 96
    Top = 166
    Width = 32
    Height = 16
    AutoSize = False
    Caption = #24615#21035
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #26999#20307'_GB2312'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 96
    Top = 221
    Width = 32
    Height = 16
    AutoSize = False
    Caption = #24180#40836
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #26999#20307'_GB2312'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 96
    Top = 276
    Width = 64
    Height = 16
    AutoSize = False
    Caption = #20837#23398#26102#38388
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #26999#20307'_GB2312'
    Font.Style = []
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 208
    Top = 52
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 208
    Top = 162
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object Edit3: TEdit
    Left = 208
    Top = 217
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object SpinEdit1: TSpinEdit
    Left = 208
    Top = 107
    Width = 121
    Height = 22
    MaxValue = 19999999
    MinValue = 10000000
    TabOrder = 3
    Value = 10000000
    OnChange = SpinEdit1Change
  end
  object DateTimePicker1: TDateTimePicker
    Left = 204
    Top = 272
    Width = 129
    Height = 21
    Date = 38154.468074537040000000
    Time = 38154.468074537040000000
    TabOrder = 4
  end
  object BitBtn1: TBitBtn
    Left = 432
    Top = 80
    Width = 75
    Height = 25
    Caption = #20462#25913
    TabOrder = 5
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 432
    Top = 160
    Width = 75
    Height = 25
    Caption = #28155#21152
    TabOrder = 6
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 432
    Top = 248
    Width = 75
    Height = 25
    Caption = #21024#38500
    TabOrder = 7
    OnClick = BitBtn3Click
  end
  object BitBtn4: TBitBtn
    Left = 432
    Top = 352
    Width = 75
    Height = 25
    Caption = #36864#20986
    TabOrder = 8
    OnClick = BitBtn4Click
  end
end
