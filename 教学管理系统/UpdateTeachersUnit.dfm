object UpdateTeachersForm: TUpdateTeachersForm
  Left = 202
  Top = 127
  BorderStyle = bsDialog
  Caption = #25945#24072#26356#26032
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
    Left = 88
    Top = 40
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
    Left = 88
    Top = 88
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
    Left = 88
    Top = 136
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
    Left = 88
    Top = 184
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
    Left = 88
    Top = 232
    Width = 32
    Height = 16
    AutoSize = False
    Caption = #20303#22336
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #26999#20307'_GB2312'
    Font.Style = []
    ParentFont = False
  end
  object DBEdit1: TDBEdit
    Left = 216
    Top = 36
    Width = 121
    Height = 21
    DataField = 'Name'
    DataSource = UpDateDataModule.TeacherDataSource
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 216
    Top = 84
    Width = 121
    Height = 21
    DataField = 'TNo'
    DataSource = UpDateDataModule.TeacherDataSource
    TabOrder = 1
  end
  object DBEdit3: TDBEdit
    Left = 216
    Top = 132
    Width = 121
    Height = 21
    DataField = 'Sex'
    DataSource = UpDateDataModule.TeacherDataSource
    TabOrder = 2
  end
  object DBEdit4: TDBEdit
    Left = 216
    Top = 180
    Width = 121
    Height = 21
    DataField = 'Age'
    DataSource = UpDateDataModule.TeacherDataSource
    TabOrder = 3
  end
  object DBEdit5: TDBEdit
    Left = 216
    Top = 228
    Width = 121
    Height = 21
    DataField = 'Address'
    DataSource = UpDateDataModule.TeacherDataSource
    TabOrder = 4
  end
  object Button1: TButton
    Left = 424
    Top = 80
    Width = 75
    Height = 25
    Caption = #28155#21152
    TabOrder = 5
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 424
    Top = 173
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 6
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 424
    Top = 282
    Width = 75
    Height = 25
    Caption = #21024#38500
    TabOrder = 7
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 80
    Top = 282
    Width = 75
    Height = 25
    Caption = #21521#21069
    TabOrder = 8
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 252
    Top = 282
    Width = 75
    Height = 25
    Caption = #21521#21518
    TabOrder = 9
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 424
    Top = 360
    Width = 75
    Height = 25
    Caption = #36864#20986
    TabOrder = 10
    OnClick = Button6Click
  end
end
