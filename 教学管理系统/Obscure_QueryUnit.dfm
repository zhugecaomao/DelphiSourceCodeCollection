object Obscure_QueryForm: TObscure_QueryForm
  Left = 239
  Top = 142
  BorderStyle = bsDialog
  Caption = #27169#31946#26597#35810
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
    Top = 16
    Width = 252
    Height = 19
    Caption = #26597#35810#20197#31532#19968#20010#23383#24320#22836#30340#20449#24687
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = #26999#20307'_GB2312'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Button1: TButton
    Left = 472
    Top = 48
    Width = 75
    Height = 49
    Caption = #26597#35810
    TabOrder = 0
    OnClick = Button1Click
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 104
    Width = 529
    Height = 217
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DBNavigator1: TDBNavigator
    Left = 152
    Top = 328
    Width = 240
    Height = 25
    TabOrder = 2
  end
  object GroupBox1: TGroupBox
    Left = 264
    Top = 40
    Width = 185
    Height = 57
    Caption = #35831#36755#20837#31532#19968#20010#23383
    TabOrder = 3
    object Edit1: TEdit
      Left = 16
      Top = 24
      Width = 145
      Height = 21
      TabOrder = 0
    end
  end
  object Button2: TButton
    Left = 440
    Top = 360
    Width = 75
    Height = 25
    Caption = #36864#20986
    TabOrder = 4
    OnClick = Button2Click
  end
  object RadioGroup1: TRadioGroup
    Left = 16
    Top = 40
    Width = 241
    Height = 57
    Caption = #26597#35810#20869#23481
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      #23398#29983#20449#24687
      #25945#24072#20449#24687
      #35838#31243#20449#24687)
    TabOrder = 5
  end
end
