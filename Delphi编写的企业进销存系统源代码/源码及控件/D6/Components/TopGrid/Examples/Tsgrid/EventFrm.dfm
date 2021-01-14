object Form1: TForm1
  Left = 40
  Top = 16
  Width = 553
  Height = 446
  Caption = 'TtsGrid: Event viewer'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object lblMessages: TLabel
    Left = 8
    Top = 192
    Width = 101
    Height = 13
    Caption = 'Events activated:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object tsGrid1: TtsGrid
    Left = 8
    Top = 8
    Width = 529
    Height = 177
    CheckBoxStyle = stCheck
    Cols = 100
    ExportDelimiter = ','
    HeadingFont.Charset = DEFAULT_CHARSET
    HeadingFont.Color = clWindowText
    HeadingFont.Height = -11
    HeadingFont.Name = 'MS Sans Serif'
    HeadingFont.Style = []
    Rows = 1000
    TabOrder = 0
    Version = '2.20.20'
    OnCellEdit = tsGrid1CellEdit
    OnCellLoaded = tsGrid1CellLoaded
    OnClick = tsGrid1Click
    OnClickCell = tsGrid1ClickCell
    OnColChanged = tsGrid1ColChanged
    OnColCountChanged = tsGrid1ColCountChanged
    OnColMoved = tsGrid1ColMoved
    OnColResized = tsGrid1ColResized
    OnDblClickCell = tsGrid1DblClickCell
    OnDeleteCol = tsGrid1DeleteCol
    OnDeleteRow = tsGrid1DeleteRow
    OnEndCellEdit = tsGrid1EndCellEdit
    OnEndRowEdit = tsGrid1EndRowEdit
    OnGridStatusChanged = tsGrid1GridStatusChanged
    OnInsertCol = tsGrid1InsertCol
    OnInsertRow = tsGrid1InsertRow
    OnKeyDown = tsGrid1KeyDown
    OnKeyPress = tsGrid1KeyPress
    OnKeyUp = tsGrid1KeyUp
    OnMouseDown = tsGrid1MouseDown
    OnMouseStatusChanged = tsGrid1MouseStatusChanged
    OnMouseUp = tsGrid1MouseUp
    OnRowChanged = tsGrid1RowChanged
    OnRowCountChanged = tsGrid1RowCountChanged
    OnRowMoved = tsGrid1RowMoved
    OnRowResized = tsGrid1RowResized
    OnSelectChanged = tsGrid1SelectChanged
    OnStartCellEdit = tsGrid1StartCellEdit
    OnStartRowEdit = tsGrid1StartRowEdit
    OnTopLeftChanged = tsGrid1TopLeftChanged
    OnUndoCellEdit = tsGrid1UndoCellEdit
    OnUndoRowEdit = tsGrid1UndoRowEdit
  end
  object memMessages: TMemo
    Left = 8
    Top = 208
    Width = 249
    Height = 201
    TabOrder = 1
  end
  object grpactivate: TGroupBox
    Left = 264
    Top = 203
    Width = 150
    Height = 206
    Caption = 'Event types'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object chkMouseStatus: TCheckBox
      Left = 8
      Top = 23
      Width = 89
      Height = 17
      Hint = 'Set OnMouseStatusChanged event on or off'
      Caption = 'MouseStatus'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      State = cbChecked
      TabOrder = 0
      OnClick = chkMouseStatusClick
    end
    object chkTopLeftChanged: TCheckBox
      Left = 8
      Top = 49
      Width = 65
      Height = 17
      Hint = 'Set OnTopLeftChanged event on or off'
      Caption = 'TopLeft'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      State = cbChecked
      TabOrder = 1
      OnClick = chkTopLeftChangedClick
    end
    object chkRowColChanged: TCheckBox
      Left = 8
      Top = 75
      Width = 113
      Height = 17
      Hint = 'Set OnRowChanged/OnColChanged events on or off'
      Caption = 'Row-/ ColChange'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      State = cbChecked
      TabOrder = 2
      OnClick = chkRowColChangedClick
    end
    object chkCellEdit: TCheckBox
      Left = 8
      Top = 127
      Width = 89
      Height = 17
      Hint = 'Set OnCellEdit event on or off'
      Caption = 'CellEdit Detail'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = chkCellEditClick
    end
    object chkKeyMessages: TCheckBox
      Left = 8
      Top = 153
      Width = 129
      Height = 17
      Hint = 'Set OnKeyDown/Up/Press events on or off'
      Caption = 'KeyDown, -Up, -Press'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = chkKeyMessagesClick
    end
    object chkSelectChanged: TCheckBox
      Left = 8
      Top = 101
      Width = 73
      Height = 17
      Hint = 'Set OnSelectChanged event on or off'
      Caption = 'Selection'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      State = cbChecked
      TabOrder = 5
      OnClick = chkSelectChangedClick
    end
    object chkMouseMessages: TCheckBox
      Left = 8
      Top = 179
      Width = 137
      Height = 17
      Hint = 'Set OnMouseDown/Up events on or off'
      Caption = 'MouseDown, MouseUp'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = chkMouseMessagesClick
    end
  end
  object chkShowarguments: TCheckBox
    Left = 424
    Top = 379
    Width = 121
    Height = 25
    Hint = 'Set event argument display on or off'
    Caption = 'Show Arguments'
    Checked = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    State = cbChecked
    TabOrder = 3
    OnClick = chkShowargumentsClick
  end
  object grpMethods: TGroupBox
    Left = 424
    Top = 203
    Width = 113
    Height = 174
    Caption = 'Methods'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    object butInsertRow: TButton
      Left = 20
      Top = 21
      Width = 77
      Height = 25
      Hint = 'Insert a row at the current row position'
      Caption = 'Insert Row'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = butInsertRowClick
    end
    object butInsertCol: TButton
      Left = 20
      Top = 61
      Width = 77
      Height = 25
      Hint = 'Insert a column at the current column position'
      Caption = 'Insert Column'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = butInsertColClick
    end
    object butDeleteRow: TButton
      Left = 20
      Top = 101
      Width = 77
      Height = 25
      Hint = 'Delete the last row of the grid'
      Caption = 'Delete Row'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = butDeleteRowClick
    end
    object butDeleteCol: TButton
      Left = 20
      Top = 141
      Width = 77
      Height = 25
      Hint = 'Delete the last column of the grid'
      Caption = 'Delete Column'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = butDeleteColClick
    end
  end
end
