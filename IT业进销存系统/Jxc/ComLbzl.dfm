inherited frmComLbzl: TfrmComLbzl
  Caption = 'frmComLbzl'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  object Splitter1: TSplitter [0]
    Left = 393
    Top = 83
    Width = 4
    Height = 431
    Cursor = crHSplit
    Align = alRight
    Beveled = True
  end
  inherited DBGrid1: TDBGrid
    Width = 393
  end
  inherited ControlBar1: TControlBar
    inherited ToolBar1: TToolBar
      Width = 537
      object ToolButton2: TToolButton
        Left = 472
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 10
        Style = tbsSeparator
      end
      object ToolButton1: TToolButton
        Left = 480
        Top = 0
        Action = aList
        AutoSize = True
        Caption = ' 列表 '
      end
    end
  end
  object pnlList: TPanel [4]
    Left = 397
    Top = 83
    Width = 393
    Height = 431
    Align = alRight
    BevelOuter = bvNone
    BorderStyle = bsSingle
    Caption = 'pnlList'
    TabOrder = 3
    OnResize = pnlListResize
    object StringGrid1: TStringGrid
      Left = 0
      Top = 0
      Width = 389
      Height = 427
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
      object N3: TMenuItem
        Caption = '-'
      end
      object mnuList: TMenuItem
        Action = aList
      end
    end
  end
  inherited PopupMenu1: TPopupMenu
    object N6: TMenuItem
      Caption = '-'
    end
    object pmnList: TMenuItem
      Action = aList
    end
  end
  inherited ActionList1: TActionList
    object aList: TAction
      Caption = '资料列表(&I)'
      Checked = True
      ImageIndex = 24
      ShortCut = 16457
      OnExecute = aListExecute
    end
  end
end
