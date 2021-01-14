object Form1: TForm1
  Left = 248
  Top = 109
  Width = 536
  Height = 439
  Caption = 'TtsDBGrid: bound and unbound combo'
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
    Left = 8
    Top = 9
    Width = 391
    Height = 13
    Caption = 
      'This example shows the use of unbound fields and comboboxes in a' +
      ' dataware grid.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 9
    Top = 29
    Width = 160
    Height = 13
    Caption = 'The following fields are of interest:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 29
    Top = 48
    Width = 92
    Height = 19
    AutoSize = False
    Caption = 'Unbound Picture - '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object Label4: TLabel
    Left = 53
    Top = 80
    Width = 65
    Height = 13
    Caption = 'Length (cm) - '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object Label5: TLabel
    Left = 65
    Top = 128
    Width = 51
    Height = 13
    Caption = 'Category - '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 120
    Top = 48
    Width = 345
    Height = 33
    AutoSize = False
    Caption = 
      'Shows how to implement an unbound bitmap in a data aware grid. I' +
      't is set up so that it depends on the length (cm).'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object Label7: TLabel
    Left = 120
    Top = 80
    Width = 345
    Height = 41
    AutoSize = False
    Caption = 
      'This is an unbound textfield, where a user can type in a value, ' +
      'and which also includes a combo button to allow the user to sele' +
      'ct a value from a dropdownlist.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object Label8: TLabel
    Left = 120
    Top = 128
    Width = 249
    Height = 17
    AutoSize = False
    Caption = 'Shows a bound dropdown in a bound text field.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object tsDBGrid1: TtsDBGrid
    Left = 8
    Top = 152
    Width = 500
    Height = 250
    CellSelectMode = cmNone
    CheckBoxStyle = stCheck
    Cols = 8
    DataSource = DataSource1
    DefaultRowHeight = 50
    ExactRowCount = True
    ExportDelimiter = ','
    FieldState = fsCustomized
    HeadingFont.Charset = DEFAULT_CHARSET
    HeadingFont.Color = clWindowText
    HeadingFont.Height = -11
    HeadingFont.Name = 'MS Sans Serif'
    HeadingFont.Style = []
    HeadingHeight = 30
    ParentShowHint = False
    RowChangedIndicator = riAutoReset
    RowMoving = False
    ShowHint = True
    TabOrder = 0
    Version = '2.20.21'
    XMLExport.Version = '1.0'
    XMLExport.DataPacketVersion = '2.0'
    OnCellEdit = tsDBGrid1CellEdit
    OnCellLoaded = tsDBGrid1CellLoaded
    OnComboCellLoaded = tsDBGrid1ComboCellLoaded
    OnComboInit = tsDBGrid1ComboInit
    DataBound = True
    ColProperties = <
      item
        DataCol = 1
        FieldName = 'Length (cm)'
        Col.ControlType = ctText
        Col.FieldName = 'Length (cm)'
        Col.HorzAlignment = htaRight
        Col.Width = 66
        Col.AssignedValues = #2
      end
      item
        DataCol = 2
        FieldName = 'Species No'
        Col.ControlType = ctText
        Col.FieldName = 'Species No'
        Col.HorzAlignment = htaRight
        Col.Width = 66
        Col.AssignedValues = #2
      end
      item
        DataCol = 3
        FieldName = 'Graphic'
        Col.ControlType = ctPicture
        Col.FieldName = 'Graphic'
        Col.HorzAlignment = htaLeft
        Col.Width = 66
        Col.AssignedValues = #2
      end
      item
        DataCol = 4
        FieldName = 'Category'
        Col.ButtonType = btCombo
        Col.ControlType = ctText
        Col.DropDownStyle = ddDropDownList
        Col.FieldName = 'Category'
        Col.MaxLength = 15
        Col.ParentCombo = False
        Col.HorzAlignment = htaLeft
        Col.Width = 96
        Col.ComboDatasource = DataSource2
        Col.Combo = {
          545046300E5474734442436F6D626F4772696400044C656674020003546F7002
          000557696474680340010648656967687402780754616253746F70080A417574
          6F53656172636807056173546F700C44726F70446F776E526F777302050C4472
          6F70446F776E436F6C7302010D44726F70446F776E5374796C65070E64644472
          6F70446F776E4C6973740D436865636B426F785374796C650707737443686563
          6B0A44617461536F757263650711466F726D312E44617461536F75726365320F
          44656661756C74436F6C5769647468026A0D4578616374526F77436F756E7409
          1348656164696E67466F6E742E43686172736574070F44454641554C545F4348
          41525345541148656164696E67466F6E742E436F6C6F72070C636C57696E646F
          77546578741248656164696E67466F6E742E48656967687402F5104865616469
          6E67466F6E742E4E616D65060D4D532053616E73205365726966114865616469
          6E67466F6E742E5374796C650B000756657273696F6E0607322E32302E323109
          44617461426F756E64090000}
        Col.AssignedValues = #2
      end
      item
        DataCol = 5
        FieldName = 'Common_Name'
        Col.ControlType = ctText
        Col.FieldName = 'Common_Name'
        Col.MaxLength = 30
        Col.HorzAlignment = htaLeft
        Col.Width = 186
        Col.AssignedValues = #2
      end
      item
        DataCol = 6
        FieldName = 'Species Name'
        Col.ControlType = ctText
        Col.FieldName = 'Species Name'
        Col.MaxLength = 40
        Col.HorzAlignment = htaLeft
        Col.Width = 246
        Col.AssignedValues = #2
      end
      item
        DataCol = 7
        FieldName = 'Length_In'
        Col.ControlType = ctText
        Col.FieldName = 'Length_In'
        Col.HorzAlignment = htaRight
        Col.Width = 66
        Col.AssignedValues = #2
      end
      item
        DataCol = 8
        FieldName = 'Notes'
        Col.ControlType = ctText
        Col.FieldName = 'Notes'
        Col.HorzAlignment = htaLeft
        Col.Width = 66
        Col.AssignedValues = #2
      end>
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 26
    Top = 188
  end
  object Table1: TTable
    DatabaseName = 'DBDEMOS'
    TableName = 'BIOLIFE.DB'
    Left = 58
    Top = 188
    object Table1Lengthcm: TFloatField
      FieldName = 'Length (cm)'
    end
    object Table1SpeciesNo: TFloatField
      FieldName = 'Species No'
    end
    object Table1Graphic: TGraphicField
      FieldName = 'Graphic'
      BlobType = ftGraphic
    end
    object Table1Category: TStringField
      FieldName = 'Category'
      Size = 15
    end
    object Table1Common_Name: TStringField
      FieldName = 'Common_Name'
      Size = 30
    end
    object Table1SpeciesName: TStringField
      FieldName = 'Species Name'
      Size = 40
    end
    object Table1Length_In: TFloatField
      FieldName = 'Length_In'
    end
    object Table1Notes: TMemoField
      FieldName = 'Notes'
      BlobType = ftMemo
      Size = 50
    end
  end
  object DataSource2: TDataSource
    DataSet = Query1
    Left = 114
    Top = 188
  end
  object Query1: TQuery
    DatabaseName = 'DBDEMOS'
    SQL.Strings = (
      'Select distinct Category from Biolife')
    Left = 146
    Top = 188
  end
end
