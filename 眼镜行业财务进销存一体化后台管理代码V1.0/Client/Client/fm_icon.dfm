object Frame1: TFrame1
  Left = 0
  Top = 0
  Width = 192
  Height = 21
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  OnClick = FrameClick
  OnMouseMove = FrameMouseMove
  object Label1: TLabel
    Left = 42
    Top = 2
    Width = 42
    Height = 13
    Caption = 'Label1'
    Font.Charset = GB2312_CHARSET
    Font.Color = clActiveCaption
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    Transparent = True
    Layout = tlCenter
    OnClick = FrameClick
  end
  object Image1: TImage
    Left = 14
    Top = 0
    Width = 19
    Height = 16
    Picture.Data = {
      07544269746D6170F6000000424DF60000000000000076000000280000001000
      000010000000010004000000000080000000120B0000120B0000100000001000
      0000000000000000800000800000008080008000000080008000808000008080
      8000C0C0C0000000FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFF
      FF00DADADADADADADADA00000000000000000FF0FEF4FEF4FEF00FF0EFE4EFE4
      EFE00FF04444444444400FF0EFE4EFE4EFE00000FEF4FEF4FEF00FF044444444
      44400FF0FEF4FEF4FEF00FF0EFE4EFE4EFE000000000000000000FF0FFFFF0FF
      FFF00FF0FFFFF0FFFFF00000000000000000DADADADADADADADAADADADADADAD
      ADAD}
    Transparent = True
    OnClick = FrameClick
  end
end
