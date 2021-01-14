object Special_QueryForm: TSpecial_QueryForm
  Left = 190
  Top = 113
  BorderStyle = bsDialog
  Caption = #29305#27530#26597#35810
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
    Left = 8
    Top = 24
    Width = 553
    Height = 25
    AutoSize = False
    Caption = #26597#35810#30001#26576#25945#24072#20219#25945#30340#25152#26377#23398#29983#30340#22995#21517#21644#31561#32423#21450#35813#25945#24072#30340#22995#21517
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = #26999#20307'_GB2312'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 432
    Top = 96
    Width = 144
    Height = 16
    Caption = #35831#36755#20837#25945#24072#30340#22995#21517#65306
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #26999#20307'_GB2312'
    Font.Style = []
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 56
    Width = 409
    Height = 257
    DataSource = QueryDataModule.DSSpecial
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DBNavigator1: TDBNavigator
    Left = 80
    Top = 288
    Width = 240
    Height = 25
    DataSource = QueryDataModule.DSSpecial
    TabOrder = 1
  end
  object Edit1: TEdit
    Left = 432
    Top = 160
    Width = 129
    Height = 21
    TabOrder = 2
  end
  object Button1: TButton
    Left = 456
    Top = 240
    Width = 75
    Height = 41
    Caption = #26597#35810
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 456
    Top = 344
    Width = 75
    Height = 25
    Caption = #36864#20986
    TabOrder = 4
    OnClick = Button2Click
  end
end
