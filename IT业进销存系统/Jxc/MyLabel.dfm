object fraMyLabel: TfraMyLabel
  Left = 0
  Top = 0
  Width = 140
  Height = 16
  Cursor = crHandPoint
  TabOrder = 0
  OnClick = FrameClick
  OnMouseMove = FrameMouseMove
  object Label1: TLabel
    Left = 21
    Top = 2
    Width = 54
    Height = 12
    Caption = #23458#25143#36164#26009' '
    Font.Charset = GB2312_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    OnClick = FrameClick
    OnMouseMove = Label1MouseMove
  end
  object Shape1: TShape
    Left = 4
    Top = 3
    Width = 14
    Height = 10
    Brush.Color = clLime
    Shape = stCircle
  end
end
