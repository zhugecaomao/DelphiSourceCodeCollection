object UpdateTeachingForm: TUpdateTeachingForm
  Left = 196
  Top = 130
  BorderStyle = bsDialog
  Caption = #25945#23398#26356#26032
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
    Left = 80
    Top = 68
    Width = 64
    Height = 16
    Caption = #25945#24072#32534#21495
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #26999#20307'_GB2312'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 80
    Top = 132
    Width = 64
    Height = 16
    Caption = #23398#29983#32534#21495
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #26999#20307'_GB2312'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 80
    Top = 196
    Width = 64
    Height = 16
    Caption = #35838#31243#32534#21495
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #26999#20307'_GB2312'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 80
    Top = 260
    Width = 64
    Height = 16
    Caption = #35838#31243#31561#32423
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #26999#20307'_GB2312'
    Font.Style = []
    ParentFont = False
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 192
    Top = 64
    Width = 145
    Height = 21
    KeyField = 'TNo'
    ListField = 'TNo'
    ListSource = UpDateDataModule.TeachingDataSource
    TabOrder = 0
  end
  object DBLookupComboBox2: TDBLookupComboBox
    Left = 192
    Top = 128
    Width = 145
    Height = 21
    KeyField = 'SNo'
    ListField = 'SNo'
    ListSource = UpDateDataModule.TeachingDataSource
    TabOrder = 1
  end
  object DBLookupComboBox3: TDBLookupComboBox
    Left = 192
    Top = 192
    Width = 145
    Height = 21
    KeyField = 'CNo'
    ListField = 'CNo'
    ListSource = UpDateDataModule.TeachingDataSource
    TabOrder = 2
  end
  object ComboBox1: TComboBox
    Left = 192
    Top = 256
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 3
  end
  object Button1: TButton
    Left = 400
    Top = 96
    Width = 129
    Height = 25
    Caption = #26356#26032#23398#29983#30340#31561#32423
    TabOrder = 4
    OnClick = Button1Click
  end
  object BitBtn1: TBitBtn
    Left = 424
    Top = 168
    Width = 89
    Height = 25
    Caption = #28155#21152#23398#29983
    TabOrder = 5
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 424
    Top = 240
    Width = 89
    Height = 25
    Caption = #21024#38500
    TabOrder = 6
    OnClick = BitBtn2Click
  end
  object Button2: TButton
    Left = 424
    Top = 352
    Width = 75
    Height = 25
    Caption = #36864#20986
    TabOrder = 7
    OnClick = Button2Click
  end
end
