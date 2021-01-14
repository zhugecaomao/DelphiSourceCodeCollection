object Form1: TForm1
  Left = 196
  Top = 131
  Width = 306
  Height = 236
  Caption = #25302#26355#20107#20214
  Color = clBtnFace
  DockSite = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 32
    Width = 65
    Height = 13
    AutoSize = False
    Caption = #36755#20837#25991#23383
  end
  object Label2: TLabel
    Left = 24
    Top = 88
    Width = 65
    Height = 13
    AutoSize = False
    Caption = #25302#26355#32467#26524
  end
  object Edit1: TEdit
    Left = 96
    Top = 32
    Width = 161
    Height = 21
    TabOrder = 0
    Text = #25302#26355#20107#20214
    OnMouseDown = Edit1MouseDown
  end
  object Memo1: TMemo
    Left = 96
    Top = 64
    Width = 161
    Height = 89
    ReadOnly = True
    TabOrder = 1
    OnDragDrop = Memo1DragDrop
    OnDragOver = Memo1DragOver
  end
end
