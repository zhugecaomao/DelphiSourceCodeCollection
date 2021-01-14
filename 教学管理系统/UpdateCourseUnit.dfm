object UpdateCourseForm: TUpdateCourseForm
  Left = 198
  Top = 132
  BorderStyle = bsDialog
  Caption = #35838#31243#26356#26032
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
    Top = 56
    Width = 80
    Height = 16
    AutoSize = False
    Caption = #35838#31243#21517#31216
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #26999#20307'_GB2312'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 80
    Top = 134
    Width = 80
    Height = 16
    AutoSize = False
    Caption = #35838#31243#32534#21495
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #26999#20307'_GB2312'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 80
    Top = 212
    Width = 80
    Height = 16
    AutoSize = False
    Caption = #35838#31243#23398#26102
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #26999#20307'_GB2312'
    Font.Style = []
    ParentFont = False
  end
  object DBEdit1: TDBEdit
    Left = 192
    Top = 56
    Width = 121
    Height = 21
    DataField = 'CName'
    DataSource = UpDateDataModule.CourseDataSource
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 192
    Top = 132
    Width = 121
    Height = 21
    DataField = 'CNo'
    DataSource = UpDateDataModule.CourseDataSource
    TabOrder = 1
  end
  object DBEdit3: TDBEdit
    Left = 192
    Top = 208
    Width = 121
    Height = 21
    DataField = 'TCTime'
    DataSource = UpDateDataModule.CourseDataSource
    TabOrder = 2
  end
  object Button1: TButton
    Left = 408
    Top = 96
    Width = 75
    Height = 25
    Caption = #28155#21152
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 408
    Top = 181
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 4
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 408
    Top = 272
    Width = 75
    Height = 25
    Caption = #21024#38500
    TabOrder = 5
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 88
    Top = 272
    Width = 75
    Height = 25
    Caption = #21521#21069
    TabOrder = 6
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 248
    Top = 272
    Width = 75
    Height = 25
    Caption = #21521#21518
    TabOrder = 7
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 408
    Top = 352
    Width = 75
    Height = 25
    Caption = #36864#20986
    TabOrder = 8
    OnClick = Button6Click
  end
end
