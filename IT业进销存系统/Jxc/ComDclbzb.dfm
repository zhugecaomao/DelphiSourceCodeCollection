inherited frmComDclbzb: TfrmComDclbzb
  Caption = 'frmComDclbzb'
  PixelsPerInch = 96
  TextHeight = 15
  object Splitter2: TSplitter [1]
    Left = 393
    Top = 83
    Width = 4
    Height = 235
    Cursor = crHSplit
    Align = alRight
    Beveled = True
  end
  inherited DBGrid1: TDBGrid
    Width = 393
  end
  inherited ControlBar1: TControlBar
    inherited ToolBar1: TToolBar
      Width = 586
      object btnList: TToolButton
        Left = 533
        Top = 0
        Action = aList
        Caption = ' 列表 '
      end
    end
  end
  object pnlList: TPanel [6]
    Left = 397
    Top = 83
    Width = 393
    Height = 235
    Align = alRight
    BevelOuter = bvNone
    BorderStyle = bsSingle
    Caption = 'pnlList'
    TabOrder = 4
    OnResize = pnlListResize
    object StringGrid1: TStringGrid
      Left = 0
      Top = 0
      Width = 389
      Height = 231
      Align = alClient
      BorderStyle = bsNone
      Color = clWhite
      ColCount = 3
      DefaultRowHeight = 22
      FixedColor = cl3DLight
      FixedCols = 2
      RowCount = 1
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine]
      ScrollBars = ssVertical
      TabOrder = 0
      ColWidths = (
        64
        64
        64)
    end
  end
  inherited MainMenu1: TMainMenu
    inherited smnEdit: TMenuItem
      object smnList: TMenuItem
        Action = aList
      end
    end
  end
  inherited ActionList1: TActionList
    object aList: TAction
      Caption = '资料列表(&I)'
      Checked = True
      ImageIndex = 24
      ShortCut = 16458
      OnExecute = aListExecute
    end
  end
end
