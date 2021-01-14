object SortForm: TSortForm
  Left = 212
  Top = 110
  BorderStyle = bsDialog
  Caption = #21033#29992#22810#32447#31243#27604#36739#25490#24207#36895#24230
  ClientHeight = 295
  ClientWidth = 562
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 24
    Width = 177
    Height = 233
  end
  object Bevel3: TBevel
    Left = 376
    Top = 24
    Width = 177
    Height = 233
  end
  object Bevel2: TBevel
    Left = 192
    Top = 24
    Width = 177
    Height = 233
  end
  object BubbleSortBox: TPaintBox
    Left = 8
    Top = 24
    Width = 177
    Height = 233
    OnPaint = BubbleSortBoxPaint
  end
  object SelectionSortBox: TPaintBox
    Left = 192
    Top = 24
    Width = 177
    Height = 233
    OnPaint = SelectionSortBoxPaint
  end
  object QuickSortBox: TPaintBox
    Left = 376
    Top = 24
    Width = 177
    Height = 233
    OnPaint = QuickSortBoxPaint
  end
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 61
    Height = 13
    AutoSize = False
    Caption = #20882#27873#25490#24207
  end
  object Label2: TLabel
    Left = 192
    Top = 8
    Width = 61
    Height = 13
    AutoSize = False
    Caption = #36873#25321#25490#24207
  end
  object Label3: TLabel
    Left = 376
    Top = 8
    Width = 61
    Height = 13
    AutoSize = False
    Caption = #24555#36895#25490#24207
  end
  object StarBtn: TButton
    Left = 480
    Top = 264
    Width = 75
    Height = 25
    Caption = #24320#22987#25490#24207
    TabOrder = 0
    OnClick = StarBtnClick
  end
end
