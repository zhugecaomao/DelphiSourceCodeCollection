object Frame1: TFrame1
  Left = 0
  Top = 0
  Width = 320
  Height = 240
  TabOrder = 0
  OnClick = FrameClick
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 320
    Height = 29
    Caption = 'ToolBar1'
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    TabOrder = 0
    object ToolButton1: TToolButton
      Left = 0
      Top = 2
      Caption = 'ToolButton1'
      ImageIndex = 0
    end
    object ToolButton2: TToolButton
      Left = 23
      Top = 2
      Caption = 'ToolButton2'
      ImageIndex = 1
    end
    object ToolButton3: TToolButton
      Left = 46
      Top = 2
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 2
      Style = tbsSeparator
    end
    object ToolButton4: TToolButton
      Left = 54
      Top = 2
      Caption = 'ToolButton4'
      ImageIndex = 2
    end
  end
end
