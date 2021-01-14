object Form1: TForm1
  Left = 95
  Top = 123
  Width = 435
  Height = 300
  Caption = 'TtsGrid: Different control types and data storage'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object tsGrid1: TtsGrid
    Left = 8
    Top = 8
    Width = 409
    Height = 257
    DateTimeDef = tsDateTimeDef1
    CheckBoxStyle = stCheck
    Cols = 4
    ExportDelimiter = ','
    HeadingFont.Charset = DEFAULT_CHARSET
    HeadingFont.Color = clWindowText
    HeadingFont.Height = -11
    HeadingFont.Name = 'MS Sans Serif'
    HeadingFont.Style = []
    RowChangedIndicator = riAutoReset
    Rows = 4
    TabOrder = 0
    Version = '2.20.20'
    OnCellEdit = tsGrid1CellEdit
    OnCellLoaded = tsGrid1CellLoaded
    OnStartRowEdit = tsGrid1StartRowEdit
    OnUndoRowEdit = tsGrid1UndoRowEdit
  end
  object tsDateTimeDef1: TtsDateTimeDef
    DateTimeProps.CancelCaption = '&Cancel'
    DateTimeProps.Caption = 'Date'
    DateTimeProps.Font.Charset = DEFAULT_CHARSET
    DateTimeProps.Font.Color = clWindowText
    DateTimeProps.Font.Height = -11
    DateTimeProps.Font.Name = 'MS Sans Serif'
    DateTimeProps.Font.Style = []
    DateTimeProps.MaxDate = 73050
    DateTimeProps.MinDate = 2
    DateTimeProps.OkCaption = '&OK'
    DateTimeProps.ParentFont = True
    Left = 40
    Top = 32
  end
end
