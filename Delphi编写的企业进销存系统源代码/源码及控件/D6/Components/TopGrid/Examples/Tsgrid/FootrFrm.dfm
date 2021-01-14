object Form1: TForm1
  Left = 93
  Top = 88
  Width = 510
  Height = 350
  Caption = 'TtsGrid: A footer grid for displaying totals'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 20
    Top = 10
    Width = 408
    Height = 49
    AutoSize = False
    Caption = 
      'This example shows you how to synchronise two grids. Synchronize' +
      'd scrolling and resizing and moving of columns will make the two' +
      ' grids look like one grid. It also shows how you can easily keep' +
      ' totals updated, by using edit events.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object Label2: TLabel
    Left = 444
    Top = 157
    Width = 45
    Height = 13
    Alignment = taCenter
    Caption = 'Data Grid'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 440
    Top = 283
    Width = 52
    Height = 13
    Caption = 'Footer Grid'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object grdData: TtsGrid
    Left = 15
    Top = 63
    Width = 416
    Height = 213
    CheckBoxStyle = stCheck
    Cols = 20
    Ctl3D = False
    ExportDelimiter = ','
    HeadingHorzAlignment = htaRight
    HeadingFont.Charset = DEFAULT_CHARSET
    HeadingFont.Color = clWindowText
    HeadingFont.Height = -11
    HeadingFont.Name = 'MS Sans Serif'
    HeadingFont.Style = []
    ParentCtl3D = False
    ResizeRows = rrNone
    Rows = 100
    ScrollBars = ssVertical
    TabOrder = 0
    Version = '2.20.20'
    OnCellLoaded = grdDataCellLoaded
    OnColMoved = grdDataColMoved
    OnColResized = grdDataColResized
    OnEndCellEdit = grdDataEndCellEdit
    OnEndRowEdit = grdDataEndRowEdit
    OnStartCellEdit = grdDataStartCellEdit
    OnStartRowEdit = grdDataStartRowEdit
    OnTopLeftChanged = grdDataTopLeftChanged
    OnUndoRowEdit = grdDataUndoRowEdit
  end
  object grdFooter: TtsGrid
    Left = 15
    Top = 275
    Width = 400
    Height = 32
    TabStop = False
    CheckBoxStyle = stCheck
    Cols = 20
    Ctl3D = False
    ExportDelimiter = ','
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    GridMode = gmListBox
    HeadingFont.Charset = DEFAULT_CHARSET
    HeadingFont.Color = clWindowText
    HeadingFont.Height = -11
    HeadingFont.Name = 'MS Sans Serif'
    HeadingFont.Style = []
    HeadingOn = False
    Is3D = True
    ParentCtl3D = False
    ParentFont = False
    RowBarIndicator = False
    Rows = 1
    RowSelectMode = rsNone
    TabOrder = 1
    Version = '2.20.20'
    OnCellLoaded = grdFooterCellLoaded
    OnTopLeftChanged = grdFooterTopLeftChanged
  end
end
