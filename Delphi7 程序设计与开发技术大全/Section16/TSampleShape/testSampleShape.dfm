object Form1: TForm1
  Left = 224
  Top = 128
  Width = 696
  Height = 480
  Caption = #28436#31034'TSampleShape'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Shape1: TShape
    Left = 264
    Top = 48
    Width = 130
    Height = 65
    Brush.Color = clSkyBlue
  end
  object SampleShape1: TSampleShape
    Left = 88
    Top = 48
    Width = 130
    Brush.Color = clSkyBlue
    Pen.Color = clMaroon
    Shape = sstRectangle
  end
  object Label1: TLabel
    Left = 88
    Top = 16
    Width = 121
    Height = 13
    AutoSize = False
    Caption = #36825#26159'TSampleShape'
  end
  object Label2: TLabel
    Left = 256
    Top = 16
    Width = 121
    Height = 13
    AutoSize = False
    Caption = #36825#26159'TShape'
  end
  object Button1: TButton
    Left = 152
    Top = 136
    Width = 75
    Height = 25
    Caption = #32472#21046#30697#24418
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 152
    Top = 272
    Width = 75
    Height = 25
    Caption = #32472#21046#22278#24418
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 152
    Top = 168
    Width = 75
    Height = 25
    Caption = #32472#21046#26041#24418
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 152
    Top = 200
    Width = 75
    Height = 25
    Caption = #32472#21046#22278#35282#30697#24418
    TabOrder = 3
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 152
    Top = 232
    Width = 75
    Height = 25
    Caption = #32472#21046#22278#35282#26041#24418
    TabOrder = 4
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 152
    Top = 304
    Width = 75
    Height = 25
    Caption = #32472#21046#26925#22278
    TabOrder = 5
    OnClick = Button6Click
  end
end
