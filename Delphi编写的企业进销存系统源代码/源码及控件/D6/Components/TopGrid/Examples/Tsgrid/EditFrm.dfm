object Form1: TForm1
  Left = 138
  Top = 144
  Width = 580
  Height = 394
  Caption = 'TtsGrid: Using edit masks'
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
  object Label1: TLabel
    Left = 16
    Top = 200
    Width = 537
    Height = 33
    AutoSize = False
    Caption = 
      '- In the above grid, edit masks are assigned to the columns for ' +
      'data entry validation. Each column has a different      edit mas' +
      'ks, and the values displayed in the first row indicate the type ' +
      'of data that is valid for the specific column.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 8388672
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object Label2: TLabel
    Left = 16
    Top = 232
    Width = 537
    Height = 25
    AutoSize = False
    Caption = 
      '- The edit masks are configured to allow automatic insertion of ' +
      'literal characters as the user types, for instance the     '#39'/'#39' a' +
      'nd '#39':'#39' characters in the date and time masks.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 8388672
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object Label3: TLabel
    Left = 16
    Top = 264
    Width = 537
    Height = 25
    AutoSize = False
    Caption = 
      '- The '#39'Upper case'#39' column automatically converts all characters ' +
      'to uppercase, using the '#39'>>'#39' mask characters in       the edit m' +
      'asks Picture property.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 8388672
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object Label4: TLabel
    Left = 16
    Top = 296
    Width = 537
    Height = 25
    AutoSize = False
    Caption = 
      '- The '#39'Title case'#39' column converts the first characters of all w' +
      'ords to upper case. This is achieved by setting the        edit ' +
      'masks CaseType property to cstTitle, without the use of a Pictur' +
      'e mask.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 8388672
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object Label5: TLabel
    Left = 16
    Top = 328
    Width = 545
    Height = 25
    AutoSize = False
    Caption = 
      '- If an invalid character is entered, the event OnInvalidMaskEdi' +
      't is activated. If the value entered in a cell is invalid     on' +
      ' exit from the cell, the OnInvalidMaskValue is activated.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 8388672
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object Label6: TLabel
    Left = 8
    Top = 176
    Width = 49
    Height = 17
    AutoSize = False
    Caption = 'Notes'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 8388672
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
  end
  object lblInvalid: TLabel
    Left = 8
    Top = 140
    Width = 273
    Height = 17
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object tsGrid1: TtsGrid
    Left = 8
    Top = 8
    Width = 553
    Height = 129
    CheckBoxStyle = stCheck
    Cols = 4
    ExportDelimiter = ','
    HeadingFont.Charset = DEFAULT_CHARSET
    HeadingFont.Color = clWindowText
    HeadingFont.Height = -11
    HeadingFont.Name = 'MS Sans Serif'
    HeadingFont.Style = []
    MaskDefs = tsMaskDefs
    Rows = 4
    TabOrder = 0
    Version = '2.20.20'
    OnCellChanged = tsGrid1CellChanged
    OnCellEdit = tsGrid1CellEdit
    OnCellLoaded = tsGrid1CellLoaded
    OnInvalidMaskValue = tsGrid1InvalidMaskValue
    OnInvalidMaskEdit = tsGrid1InvalidMaskEdit
    OnKeyPress = tsGrid1KeyPress
    OnStartRowEdit = tsGrid1StartRowEdit
    OnUndoCellEdit = tsGrid1UndoCellEdit
    OnUndoRowEdit = tsGrid1UndoRowEdit
  end
  object tsMaskDefs: TtsMaskDefs
    Masks = <
      item
        Name = 'DateMask'
        Picture = '[##/##/[##]##]'
      end
      item
        Name = 'TimeMask'
        Picture = '[##:##]'
      end
      item
        Name = 'NumMask'
        Picture = '[#*5[#][.#[#]]]'
      end
      item
        Name = 'UpperMask'
        Picture = '>>[*@]'
      end
      item
        Name = 'TitleMask'
        TextCase.CaseType = cstTitle
      end>
    Left = 32
    Top = 32
  end
end
