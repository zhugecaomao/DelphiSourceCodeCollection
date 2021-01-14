object Form1: TForm1
  Left = 150
  Top = 99
  Width = 643
  Height = 468
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
    Left = 17
    Top = 11
    Width = 433
    Height = 33
    AutoSize = False
    Caption = 
      'There are two methods to set the color in the TopGrid: As a prop' +
      'erty or in an event. This example shows them both.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object Label2: TLabel
    Left = 393
    Top = 179
    Width = 185
    Height = 33
    AutoSize = False
    Caption = '2. By setting a property at the Row, column and cell level.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object Label3: TLabel
    Left = 393
    Top = 315
    Width = 209
    Height = 81
    AutoSize = False
    Caption = 
      'Simply set a property for instance based on validation of userin' +
      'put. It would be unwanted in most situations to validate all dat' +
      'a in the GetDrawEvent. By setting a property for a cell, row or ' +
      'column after a validation, the grid will keep track of it.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object Label4: TLabel
    Left = 393
    Top = 51
    Width = 185
    Height = 17
    AutoSize = False
    Caption = '1. In the GetDrawInfo event.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object Label5: TLabel
    Left = 393
    Top = 99
    Width = 201
    Height = 57
    AutoSize = False
    Caption = 
      'Use the GetDrawInfo event if you can easily test what color, fon' +
      't or alignment a cell should have. For instance negative or not.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object Label6: TLabel
    Left = 481
    Top = 235
    Width = 109
    Height = 52
    Caption = 
      'First select a row, column, or cell. Then use one of the buttons' +
      ' to set the color.'
    WordWrap = True
  end
  object tsGrid1: TtsGrid
    Left = 9
    Top = 51
    Width = 377
    Height = 369
    CheckBoxStyle = stCheck
    Cols = 50
    DefaultColWidth = 69
    ExportDelimiter = ','
    HeadingFont.Charset = DEFAULT_CHARSET
    HeadingFont.Color = clWindowText
    HeadingFont.Height = -11
    HeadingFont.Name = 'MS Sans Serif'
    HeadingFont.Style = []
    Rows = 100
    TabOrder = 0
    Version = '2.20.20'
    OnCellLoaded = tsGrid1CellLoaded
    OnGetDrawInfo = tsGrid1GetDrawInfo
    OnSelectChanged = tsGrid1SelectChanged
    ColProperties = <
      item
        DataCol = 1
        Col.Width = 62
      end>
  end
  object butRowColor: TButton
    Left = 393
    Top = 219
    Width = 81
    Height = 17
    Caption = 'Row Colors'
    Enabled = False
    TabOrder = 1
    OnClick = butRowColorClick
  end
  object butColColor: TButton
    Left = 393
    Top = 243
    Width = 81
    Height = 17
    Caption = 'Col Colors'
    Enabled = False
    TabOrder = 2
    OnClick = butColColorClick
  end
  object butCellColor: TButton
    Left = 393
    Top = 267
    Width = 81
    Height = 17
    Caption = 'Cell Colors'
    Enabled = False
    TabOrder = 3
    OnClick = butCellColorClick
  end
  object Button4: TButton
    Left = 393
    Top = 291
    Width = 81
    Height = 17
    Caption = 'Reset Colors'
    TabOrder = 4
    OnClick = Button4Click
  end
  object chkDrawInfo: TCheckBox
    Left = 401
    Top = 75
    Width = 137
    Height = 17
    Caption = 'Color negative numbers'
    TabOrder = 5
    OnClick = chkDrawInfoClick
  end
  object ColorDialog1: TColorDialog
    Ctl3D = True
    Left = 584
    Top = 184
  end
end
