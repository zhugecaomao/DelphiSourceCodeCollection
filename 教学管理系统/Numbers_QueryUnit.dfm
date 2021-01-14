object Numbers_QueryForm: TNumbers_QueryForm
  Left = 194
  Top = 119
  BorderStyle = bsDialog
  Caption = #25353#32534#21495#26597#35810
  ClientHeight = 400
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
  object GroupBox1: TGroupBox
    Left = 280
    Top = 24
    Width = 185
    Height = 49
    Caption = #36755#20837#32534#21495
    TabOrder = 0
    object Edit1: TEdit
      Left = 16
      Top = 16
      Width = 153
      Height = 21
      TabOrder = 0
    end
  end
  object RadioGroup1: TRadioGroup
    Left = 8
    Top = 24
    Width = 265
    Height = 49
    Caption = #26597#35810#20869#23481
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      #23398#29983#20449#24687
      #25945#24072#20449#24687
      #35838#31243#20449#24687)
    TabOrder = 1
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 80
    Width = 545
    Height = 257
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DBNavigator1: TDBNavigator
    Left = 160
    Top = 312
    Width = 240
    Height = 25
    TabOrder = 3
  end
  object BitBtn1: TBitBtn
    Left = 480
    Top = 32
    Width = 73
    Height = 41
    Caption = #26597#35810
    TabOrder = 4
    OnClick = BitBtn1Click
  end
  object Button1: TButton
    Left = 440
    Top = 352
    Width = 75
    Height = 25
    Caption = #36864#20986
    TabOrder = 5
    OnClick = Button1Click
  end
end
