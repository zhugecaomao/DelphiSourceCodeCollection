object Fczjl: TFczjl
  Left = 296
  Top = 303
  Width = 392
  Height = 197
  BorderIcons = [biSystemMenu]
  Caption = #25805#20316#35760#24405#26597#35810
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgc1: TPageControl
    Left = 0
    Top = 4
    Width = 384
    Height = 123
    ActivePage = ts1
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object ts1: TTabSheet
      Caption = #20462#25913#26126#32454
      object lbl1: TLabel
        Left = 22
        Top = 5
        Width = 48
        Height = 12
        Caption = #39033#30446#26126#32454
      end
      object lbl2: TLabel
        Left = 22
        Top = 28
        Width = 48
        Height = 12
        Caption = #20462#25913#31867#22411
      end
      object lbl3: TLabel
        Left = 34
        Top = 49
        Width = 24
        Height = 12
        Caption = #25968#37327
      end
      object lbl4: TLabel
        Left = 34
        Top = 68
        Width = 24
        Height = 12
        Caption = #37329#39069
      end
      object Ed1: TdxCurrencyEdit
        Left = 116
        Top = 46
        Width = 237
        TabOrder = 0
        OnExit = Ed1Exit
        OnKeyDown = Ed1KeyDown
      end
      object Ed2: TdxCurrencyEdit
        Left = 116
        Top = 68
        Width = 237
        TabOrder = 1
        OnKeyDown = Ed2KeyDown
      end
      object dxEdmx: TdxEdit
        Left = 116
        Top = 2
        Width = 238
        TabOrder = 2
      end
      object dxEdlx: TdxEdit
        Left = 116
        Top = 24
        Width = 237
        TabOrder = 3
      end
    end
  end
  object pnl1: TPanel
    Left = 2
    Top = 127
    Width = 382
    Height = 41
    BevelInner = bvSpace
    TabOrder = 1
    object btn1: TButton
      Left = 81
      Top = 9
      Width = 97
      Height = 25
      Caption = #20445#23384
      TabOrder = 0
      OnClick = btn1Click
    end
    object btn2: TButton
      Left = 267
      Top = 7
      Width = 92
      Height = 25
      Caption = #20851#38381
      TabOrder = 1
      OnClick = btn2Click
    end
  end
end
