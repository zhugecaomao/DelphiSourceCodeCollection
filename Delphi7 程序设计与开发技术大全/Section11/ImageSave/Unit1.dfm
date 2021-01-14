object Form1: TForm1
  Left = 192
  Top = 107
  Width = 630
  Height = 455
  Caption = #20445#23384#22270#20687#31034#20363
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 0
    Top = 0
    Width = 622
    Height = 428
    PopupMenu = PopupMenu1
    OnMouseDown = Image1MouseDown
    OnMouseMove = Image1MouseMove
    OnMouseUp = Image1MouseUp
  end
  object SavePictureDialog1: TSavePictureDialog
    Left = 360
    Top = 136
  end
  object PopupMenu1: TPopupMenu
    Left = 160
    Top = 152
    object N1: TMenuItem
      Caption = #20445#23384
      OnClick = N1Click
    end
  end
end
