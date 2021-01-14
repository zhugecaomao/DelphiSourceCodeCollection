object fmOsGridEditor: TfmOsGridEditor
  Left = 198
  Top = 117
  Width = 549
  Height = 533
  Caption = 'TopGrid Editor'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  ShowHint = True
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter: TSplitter
    Left = 0
    Top = 137
    Width = 541
    Height = 5
    Cursor = crVSplit
    Align = alBottom
    Beveled = True
    Color = clBlue
    ParentColor = False
    OnMoved = SplitterMoved
  end
  object sampleGrid: TtsGrid
    Left = 0
    Top = 41
    Width = 541
    Height = 96
    Align = alClient
    AlwaysShowEditor = False
    AlwaysShowFocus = True
    CheckBoxStyle = stCheck
    Color = clWhite
    Cols = 0
    ExportDelimiter = ','
    HeadingFont.Charset = DEFAULT_CHARSET
    HeadingFont.Color = clWindowText
    HeadingFont.Height = -11
    HeadingFont.Name = 'MS Sans Serif'
    HeadingFont.Style = []
    PopupMenu = pmOptions
    ProvideGridMenu = True
    Rows = 2
    TabOrder = 0
    ThumbTracking = True
    Version = '2.20.24'
    XMLExport.Version = '1.0'
    XMLExport.DataPacketVersion = '2.0'
    OnCellChanged = sampleGridCellChanged
    OnCellLoaded = sampleGridCellLoaded
    OnColMoved = sampleGridColMoved
    OnColResized = sampleGridColResized
    OnEndCellEdit = sampleGridEndCellEdit
    OnHeadingClick = sampleGridHeadingClick
    OnKeyDown = sampleGridKeyDown
    OnKeyPress = sampleGridKeyPress
    OnKeyUp = sampleGridKeyUp
    OnMouseDown = sampleGridMouseDown
    OnRowChanged = sampleGridRowChanged
    OnRowMoved = sampleGridRowMoved
    OnTopLeftChanged = sampleGridTopLeftChanged
  end
  object tbEditor: TToolBar
    Left = 0
    Top = 0
    Width = 541
    Height = 29
    ButtonHeight = 23
    Caption = 'tbEditor'
    EdgeBorders = [ebTop, ebBottom]
    Images = ilImages
    TabOrder = 1
    object ToolButton1: TToolButton
      Left = 0
      Top = 2
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object tbOpenFile: TToolButton
      Left = 8
      Top = 2
      Hint = 'Open a Grid layout file'
      Caption = 'tbOpenFile'
      ImageIndex = 10
      OnClick = tbOpenFileClick
    end
    object tbSaveFile: TToolButton
      Left = 31
      Top = 2
      Hint = 'Save layout to file'
      Caption = 'tbSaveFile'
      ImageIndex = 9
      OnClick = tbSaveFileClick
    end
    object ToolButton6: TToolButton
      Left = 54
      Top = 2
      Width = 8
      Caption = 'ToolButton6'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object tbSave: TToolButton
      Left = 62
      Top = 2
      Hint = 'Apply changes'
      Caption = 'tbSave'
      ImageIndex = 0
      OnClick = tbSaveClick
    end
    object tbReset: TToolButton
      Left = 85
      Top = 2
      Hint = 'Reset grid and column properties'
      Caption = 'tbReset'
      DropdownMenu = pmReset
      ImageIndex = 11
      Style = tbsDropDown
    end
    object ToolButton2: TToolButton
      Left = 121
      Top = 2
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object tbAddColumn: TToolButton
      Left = 129
      Top = 2
      Hint = 'Add a empty Column'
      Caption = 'tbAddColumn'
      ImageIndex = 3
      OnClick = tbAddColumnClick
    end
    object tbDeleteColumn: TToolButton
      Left = 152
      Top = 2
      Hint = 'Remove Selected Column'
      Caption = 'tbDeleteColumn'
      ImageIndex = 1
      OnClick = tbDeleteColumnClick
    end
    object ToolButton8: TToolButton
      Left = 175
      Top = 2
      Width = 8
      Caption = 'ToolButton8'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object tbSetPicture: TToolButton
      Left = 183
      Top = 2
      Hint = 'Set Cell Picture'
      Caption = 'tbSetPicture'
      ImageIndex = 15
      OnClick = tbSetPictureClick
    end
    object tbClearPicture: TToolButton
      Left = 206
      Top = 2
      Hint = 'Clear Cell Picture'
      Caption = 'tbClearPicture'
      ImageIndex = 16
      OnClick = tbClearPictureClick
    end
    object ToolButton7: TToolButton
      Left = 229
      Top = 2
      Width = 8
      Caption = 'ToolButton7'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object tbDefaultJustify: TToolButton
      Left = 237
      Top = 2
      Hint = 'Default Justification'
      Caption = 'tbDefaultJustify'
      Grouped = True
      ImageIndex = 13
      Style = tbsCheck
      OnClick = tbDefaultJustifyClick
    end
    object tbLeftJustify: TToolButton
      Left = 260
      Top = 2
      Hint = 'Left Justify Column'
      Caption = 'tbLeftJustify'
      Down = True
      Grouped = True
      ImageIndex = 5
      Style = tbsCheck
      OnClick = tbLeftJustifyClick
    end
    object tbCenterJustify: TToolButton
      Left = 283
      Top = 2
      Hint = 'Center Justify Column'
      Caption = 'tbCenterJustify'
      Grouped = True
      ImageIndex = 6
      Style = tbsCheck
      OnClick = tbCenterJustifyClick
    end
    object tbRightJustify: TToolButton
      Left = 306
      Top = 2
      Hint = 'Right Justify Column'
      Caption = 'tbRightJustify'
      Grouped = True
      ImageIndex = 7
      Style = tbsCheck
      OnClick = tbRightJustifyClick
    end
    object ToolButton3: TToolButton
      Left = 329
      Top = 2
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object tbClose: TToolButton
      Left = 337
      Top = 2
      Hint = 'Exit Grid Designer'
      Caption = 'tbClose'
      ImageIndex = 2
      OnClick = tbCloseClick
    end
  end
  object pgEditor: TPageControl
    Left = 0
    Top = 142
    Width = 541
    Height = 338
    ActivePage = tsCommon
    Align = alBottom
    TabOrder = 2
    OnChange = pgEditorChange
    object tsCommon: TTabSheet
      Caption = '&Common'
      ImageIndex = 1
      object rgGridMode: TRadioGroup
        Left = 4
        Top = 4
        Width = 85
        Height = 169
        Caption = 'Grid Mode '
        Items.Strings = (
          'ListBox'
          'Edit'
          'Edit Insert'
          'Browse')
        TabOrder = 0
        OnClick = rgGridModeClick
      end
      object gbFont: TGroupBox
        Left = 92
        Top = 4
        Width = 217
        Height = 169
        Caption = 'Font and Colors '
        TabOrder = 1
        object Label1: TLabel
          Left = 8
          Top = 42
          Width = 49
          Height = 13
          Caption = 'Grid Color:'
        end
        object Label3: TLabel
          Left = 8
          Top = 92
          Width = 70
          Height = 13
          Caption = 'Heading Color:'
        end
        object Label9: TLabel
          Left = 8
          Top = 20
          Width = 46
          Height = 13
          Caption = 'Grid Font:'
        end
        object laFontSummary: TLabel
          Left = 80
          Top = 20
          Width = 130
          Height = 13
          Hint = 'Double Click to edit'
          AutoSize = False
          Caption = 'laFontSummary'
          OnDblClick = laFontSummaryDblClick
        end
        object Label10: TLabel
          Left = 8
          Top = 68
          Width = 67
          Height = 13
          Caption = 'Heading Font:'
        end
        object laHeadingFontSummary: TLabel
          Left = 80
          Top = 68
          Width = 112
          Height = 13
          Hint = 'Double Click to edit'
          Caption = 'laHeadingFontSummary'
          OnDblClick = laHeadingFontSummaryDblClick
        end
        object laFocusColor: TLabel
          Left = 8
          Top = 116
          Width = 59
          Height = 13
          Caption = 'Focus Color:'
        end
        object laFocusFontColor: TLabel
          Left = 8
          Top = 140
          Width = 83
          Height = 13
          Caption = 'Focus Font Color:'
        end
        object cbGridColor: TosColorComboBox
          Left = 96
          Top = 36
          Width = 113
          Height = 22
          ColorValue = clBlack
          ItemHeight = 16
          ShowStyle = ssColorAndText
          ShowSystemColors = True
          TabOrder = 0
          OnClick = cbGridColorClick
        end
        object cbHeadingColor: TosColorComboBox
          Left = 96
          Top = 88
          Width = 113
          Height = 22
          ColorValue = clBlack
          ItemHeight = 16
          ShowStyle = ssColorAndText
          ShowSystemColors = True
          TabOrder = 1
          OnClick = cbHeadingColorClick
        end
        object cbFocusColor: TosColorComboBox
          Left = 96
          Top = 112
          Width = 113
          Height = 22
          ColorValue = clBlack
          ItemHeight = 16
          ShowStyle = ssColorAndText
          ShowSystemColors = True
          TabOrder = 2
          OnClick = cbFocusColorClick
        end
        object cbFocusFontColor: TosColorComboBox
          Left = 96
          Top = 136
          Width = 113
          Height = 22
          ColorValue = clBlack
          ItemHeight = 16
          ShowStyle = ssColorAndText
          ShowSystemColors = True
          TabOrder = 3
          OnClick = cbFocusFontColorClick
        end
      end
      object gbMisc: TGroupBox
        Left = 316
        Top = 4
        Width = 213
        Height = 169
        Caption = 'Miscellaneous '
        TabOrder = 2
        object chShowEditor: TCheckBox
          Left = 12
          Top = 16
          Width = 121
          Height = 17
          Hint = 'Go into cell edit mode as soon as cell entered'
          Caption = 'Always Show Editor'
          TabOrder = 0
          OnClick = chShowEditorClick
        end
        object chHeadingOn: TCheckBox
          Left = 12
          Top = 58
          Width = 97
          Height = 17
          Hint = 'Column Headings on or off'
          Caption = 'Heading On'
          TabOrder = 1
          OnClick = chHeadingOnClick
        end
        object chShowFocus: TCheckBox
          Left = 12
          Top = 37
          Width = 133
          Height = 17
          Hint = 'Show the current cell focus even when the grid is not selected'
          Caption = 'Always Show Focus'
          TabOrder = 2
          OnClick = chShowFocusClick
        end
        object chRowBarOn: TCheckBox
          Left = 112
          Top = 58
          Width = 85
          Height = 17
          Hint = 'Hide or show the RowBar on the left'
          Caption = 'RowBar On'
          TabOrder = 3
          OnClick = chRowBarOnClick
        end
        object chWantTabs: TCheckBox
          Left = 12
          Top = 80
          Width = 97
          Height = 17
          Hint = 'Tab moves between cells or to next control'
          Caption = 'Want Tabs'
          TabOrder = 4
          OnClick = chWantTabsClick
        end
        object chColMoving: TCheckBox
          Left = 12
          Top = 101
          Width = 97
          Height = 17
          Hint = 'Can columns be moved within the grid'
          Caption = 'Column Moving'
          TabOrder = 5
          OnClick = chColMovingClick
        end
        object chRowMoving: TCheckBox
          Left = 112
          Top = 101
          Width = 93
          Height = 17
          Hint = 'Can rows be moved within the grid'
          Caption = 'Row Moving'
          TabOrder = 6
          OnClick = chRowMovingClick
        end
        object chStoreData: TCheckBox
          Left = 12
          Top = 122
          Width = 97
          Height = 17
          Hint = 
            'Indicates whether or not cell values are stored/managed by the g' +
            'rid'
          Caption = 'Store Data'
          TabOrder = 7
          OnClick = chStoreDataClick
        end
        object chGridMenu: TCheckBox
          Left = 12
          Top = 144
          Width = 81
          Height = 17
          Hint = 'Should the default grid menu options be provided'
          Caption = 'Grid Menu'
          TabOrder = 8
          OnClick = chGridMenuClick
        end
        object chPrintTotals: TCheckBox
          Left = 112
          Top = 144
          Width = 85
          Height = 17
          Hint = 'Are grid reporting totals enabled'
          Caption = 'Print Totals'
          TabOrder = 9
          OnClick = chPrintTotalsClick
        end
      end
      object gbLayout: TGroupBox
        Left = 4
        Top = 176
        Width = 329
        Height = 61
        Caption = 'Layout '
        TabOrder = 3
        object Label4: TLabel
          Left = 159
          Top = 16
          Width = 50
          Height = 13
          Caption = 'Grid Lines:'
        end
        object Label13: TLabel
          Left = 160
          Top = 40
          Width = 71
          Height = 13
          Caption = 'Vert Alignment:'
        end
        object Label27: TLabel
          Left = 12
          Top = 16
          Width = 96
          Height = 13
          Caption = 'Default Row Height:'
        end
        object Label28: TLabel
          Left = 12
          Top = 38
          Width = 83
          Height = 13
          Caption = 'Default Col Width'
        end
        object udDefaultRowHeight: TUpDown
          Left = 137
          Top = 12
          Width = 15
          Height = 21
          Associate = edDefaultRowHeight
          Max = 10000
          Position = 17
          TabOrder = 0
          OnClick = udDefaultRowHeightClick
        end
        object udDefaultColWidth: TUpDown
          Left = 137
          Top = 36
          Width = 15
          Height = 21
          Associate = edDefaultColWidth
          Max = 1000
          Position = 64
          TabOrder = 1
          OnClick = udDefaultColWidthClick
        end
        object cbGridLines: TComboBox
          Left = 236
          Top = 12
          Width = 85
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 2
          OnChange = cbGridLinesChange
          Items.Strings = (
            'glNone'
            'glVertLines'
            'glHorzLines'
            'glBoth')
        end
        object cbVertAlignment: TComboBox
          Left = 236
          Top = 36
          Width = 85
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 3
          OnChange = cbVertAlignmentChange
          Items.Strings = (
            'vtaTop'
            'vtaBottom'
            'vtaCenter'
            'vtaDefault')
        end
        object edDefaultRowHeight: TEdit
          Left = 112
          Top = 12
          Width = 25
          Height = 21
          TabOrder = 4
          Text = '17'
          OnExit = edDefaultRowHeightExit
          OnKeyPress = edDefaultRowHeightKeyPress
        end
        object edDefaultColWidth: TEdit
          Left = 112
          Top = 36
          Width = 25
          Height = 21
          TabOrder = 5
          Text = '64'
          OnExit = edDefaultColWidthExit
          OnKeyPress = edDefaultColWidthKeyPress
        end
      end
      object GroupBox1: TGroupBox
        Left = 336
        Top = 176
        Width = 189
        Height = 61
        Caption = 'Selecting '
        TabOrder = 4
        object Label11: TLabel
          Left = 8
          Top = 16
          Width = 51
          Height = 13
          Caption = 'Col Select:'
        end
        object Label12: TLabel
          Left = 8
          Top = 40
          Width = 58
          Height = 13
          Caption = 'Row Select:'
        end
        object cbColSelect: TComboBox
          Left = 72
          Top = 12
          Width = 109
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
          OnChange = cbColSelectChange
          Items.Strings = (
            'csNone'
            'csMulti')
        end
        object cbRowSelect: TComboBox
          Left = 72
          Top = 36
          Width = 109
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 1
          OnChange = cbRowSelectChange
          Items.Strings = (
            'rsNone'
            'rsSingle'
            'rsMulti')
        end
      end
      object gdTest: TtsDBGrid
        Left = 328
        Top = 240
        Width = 193
        Height = 40
        CellSelectMode = cmNone
        CheckBoxStyle = stCheck
        DataSource = DataSource1
        ExactRowCount = True
        ExportDelimiter = ','
        HeadingFont.Charset = DEFAULT_CHARSET
        HeadingFont.Color = clWindowText
        HeadingFont.Height = -11
        HeadingFont.Name = 'MS Sans Serif'
        HeadingFont.Style = []
        RowChangedIndicator = riAutoReset
        RowMoving = False
        ProvideGridMenu = True
        TabOrder = 5
        Version = '2.20.24'
        Visible = False
        XMLExport.Version = '1.0'
        XMLExport.DataPacketVersion = '2.0'
        DataBound = True
      end
      object GroupBox2: TGroupBox
        Left = 4
        Top = 240
        Width = 125
        Height = 62
        Caption = 'Rows and Columns '
        TabOrder = 6
        object Label25: TLabel
          Left = 8
          Top = 18
          Width = 43
          Height = 13
          Caption = 'Columns:'
        end
        object Label26: TLabel
          Left = 8
          Top = 40
          Width = 30
          Height = 13
          Caption = 'Rows:'
        end
        object edCols: TEdit
          Left = 56
          Top = 14
          Width = 33
          Height = 21
          TabOrder = 0
          Text = '0'
          OnExit = edColsExit
          OnKeyPress = edColsKeyPress
        end
        object edRows: TEdit
          Left = 56
          Top = 36
          Width = 33
          Height = 21
          TabOrder = 1
          Text = '0'
          OnExit = edRowsExit
          OnKeyPress = edRowsKeyPress
        end
        object UpDown1: TUpDown
          Left = 89
          Top = 14
          Width = 15
          Height = 21
          Associate = edCols
          Max = 1000
          TabOrder = 2
          OnClick = UpDown1Click
        end
        object UpDown2: TUpDown
          Left = 89
          Top = 36
          Width = 15
          Height = 21
          Associate = edRows
          Max = 1000
          TabOrder = 3
          OnChanging = UpDown2Changing
          OnExit = UpDown2Exit
        end
      end
    end
    object tsAdvanced: TTabSheet
      Caption = '&Grid Properties'
      OnResize = tsAdvancedResize
      object Splitter1: TSplitter
        Left = 245
        Top = 0
        Width = 4
        Height = 310
        OnMoved = Splitter1Moved
      end
      object pnPropertyEditor: TPanel
        Left = 0
        Top = 0
        Width = 245
        Height = 310
        Align = alLeft
        BevelOuter = bvNone
        Caption = 'pnPropertyEditor'
        TabOrder = 0
        object veEditor: TtsGrid
          Left = 0
          Top = 25
          Width = 245
          Height = 285
          Align = alClient
          AlwaysShowFocus = True
          CheckBoxStyle = stCheck
          Color = clBtnFace
          Cols = 2
          ColSelectMode = csNone
          DefaultButtonWidth = 14
          DefaultRowHeight = 16
          EditColor = clWindow
          EditFontColor = clBlack
          ExportDelimiter = ','
          HeadingFont.Charset = DEFAULT_CHARSET
          HeadingFont.Color = clWindowText
          HeadingFont.Height = -11
          HeadingFont.Name = 'MS Sans Serif'
          HeadingFont.Style = []
          HeadingHeight = 17
          ProvideGridMenu = True
          RowBarOn = False
          Rows = 1
          StoreData = True
          TabOrder = 0
          ThumbTracking = True
          Version = '2.20.24'
          VertAlignment = vtaCenter
          XMLExport.Version = '1.0'
          XMLExport.DataPacketVersion = '2.0'
          OnButtonClick = veEditorButtonClick
          OnComboCellLoaded = veEditorComboCellLoaded
          OnComboDropDown = veEditorComboDropDown
          OnComboGetValue = veEditorComboGetValue
          OnComboInit = veEditorComboInit
          OnDblClick = veEditorDblClick
          OnEndCellEdit = veEditorEndCellEdit
          OnRowChanged = veEditorRowChanged
          ColProperties = <
            item
              DataCol = 1
              Col.Width = 111
            end
            item
              DataCol = 2
              Col.Width = 111
            end>
          Data = {0000000000000000}
        end
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 245
          Height = 25
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object Label2: TLabel
            Left = 4
            Top = 8
            Width = 26
            Height = 13
            Caption = 'View:'
          end
          object btCustomGridEdit: TSpeedButton
            Left = 192
            Top = 2
            Width = 23
            Height = 22
            Hint = 'Edit Custom Grid Properties'
            Flat = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              33333333333FFFFFFFFF333333000000000033333377777777773333330FFFFF
              FFF03333337F333333373333330FFFFFFFF03333337F3FF3FFF73333330F00F0
              00F03333F37F773777373330330FFFFFFFF03337FF7F3F3FF3F73339030F0800
              F0F033377F7F737737373339900FFFFFFFF03FF7777F3FF3FFF70999990F00F0
              00007777777F7737777709999990FFF0FF0377777777FF37F3730999999908F0
              F033777777777337F73309999990FFF0033377777777FFF77333099999000000
              3333777777777777333333399033333333333337773333333333333903333333
              3333333773333333333333303333333333333337333333333333}
            NumGlyphs = 2
            OnClick = btCustomGridEditClick
          end
          object cbPropertyView: TComboBox
            Left = 36
            Top = 2
            Width = 153
            Height = 21
            Style = csDropDownList
            DropDownCount = 15
            ItemHeight = 13
            TabOrder = 0
            OnChange = cbPropertyViewChange
            Items.Strings = (
              'All'
              'Font'
              'Color'
              'VCL'
              'Controls'
              'Basic'
              'Heading'
              'Dragging'
              'Booleans'
              'Data'
              'Custom'
              'Modified')
          end
        end
      end
      object gbProperty: TGroupBox
        Left = 249
        Top = 0
        Width = 284
        Height = 310
        Align = alClient
        Caption = 'Property '
        TabOrder = 1
        object Label5: TLabel
          Left = 9
          Top = 40
          Width = 56
          Height = 13
          Caption = 'Description:'
        end
        object Label6: TLabel
          Left = 8
          Top = 20
          Width = 33
          Height = 13
          Caption = 'Value: '
        end
        object cbBoolean: TComboBox
          Left = 50
          Top = 16
          Width = 167
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 1
          OnChange = cbBooleanChange
          OnEnter = cbBooleanEnter
          OnExit = cbBooleanExit
          Items.Strings = (
            'True'
            'False')
        end
        object edPropertyValue: TEdit
          Left = 50
          Top = 16
          Width = 165
          Height = 21
          TabOrder = 0
          Text = 'edPropertyValue'
          OnExit = edPropertyValueExit
          OnKeyPress = edPropertyValueKeyPress
        end
        object cbEnum: TComboBox
          Left = 50
          Top = 16
          Width = 167
          Height = 21
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 2
          OnChange = cbEnumChange
          OnEnter = cbEnumEnter
          OnExit = cbEnumExit
        end
        object moPropertyDesc: TMemo
          Left = 12
          Top = 56
          Width = 256
          Height = 241
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 3
          WantTabs = True
        end
        object cbColors: TosColorComboBox
          Left = 50
          Top = 16
          Width = 165
          Height = 22
          ColorValue = clBlack
          ItemHeight = 16
          ShowStyle = ssColorAndText
          ShowSystemColors = True
          TabOrder = 4
          OnClick = cbColorsClick
        end
      end
    end
    object tsColumns: TTabSheet
      Caption = '&Column Properties'
      ImageIndex = 2
      object gbColumn: TGroupBox
        Left = 0
        Top = 0
        Width = 288
        Height = 310
        Align = alClient
        Caption = 'Column '
        TabOrder = 0
        object veColEditor: TtsGrid
          Left = 2
          Top = 113
          Width = 284
          Height = 195
          Align = alClient
          AlwaysShowFocus = True
          CheckBoxStyle = stCheck
          Color = clBtnFace
          Cols = 2
          ColSelectMode = csNone
          DefaultButtonWidth = 14
          DefaultRowHeight = 16
          EditColor = clWindow
          EditFontColor = clBlack
          ExportDelimiter = ','
          HeadingFont.Charset = DEFAULT_CHARSET
          HeadingFont.Color = clWindowText
          HeadingFont.Height = -11
          HeadingFont.Name = 'MS Sans Serif'
          HeadingFont.Style = []
          HeadingHeight = 17
          ProvideGridMenu = True
          RowBarOn = False
          Rows = 3
          StoreData = True
          TabOrder = 0
          ThumbTracking = True
          Version = '2.20.24'
          VertAlignment = vtaCenter
          XMLExport.Version = '1.0'
          XMLExport.DataPacketVersion = '2.0'
          OnButtonClick = veColEditorButtonClick
          OnComboCellLoaded = veColEditorComboCellLoaded
          OnComboDropDown = veColEditorComboDropDown
          OnComboGetValue = veColEditorComboGetValue
          OnComboInit = veColEditorComboInit
          OnDblClick = veColEditorDblClick
          OnEndCellEdit = veColEditorEndCellEdit
          OnRowChanged = veColEditorRowChanged
          ColProperties = <
            item
              DataCol = 1
              Col.Width = 116
            end
            item
              DataCol = 2
              Col.Width = 121
            end>
          Data = {0000000000000000}
        end
        object Panel3: TPanel
          Left = 2
          Top = 15
          Width = 284
          Height = 98
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object Label7: TLabel
            Left = 8
            Top = 4
            Width = 43
            Height = 13
            Caption = '&Heading:'
            FocusControl = edColHeading
          end
          object Label8: TLabel
            Left = 8
            Top = 76
            Width = 26
            Height = 13
            Caption = '&View:'
            FocusControl = cbColPropertyView
          end
          object Label14: TLabel
            Left = 8
            Top = 28
            Width = 66
            Height = 13
            Caption = 'Ctrl/&But Type:'
            FocusControl = cbControlType
          end
          object Label15: TLabel
            Left = 8
            Top = 52
            Width = 50
            Height = 13
            Caption = 'Edit &Mask:'
            FocusControl = cbMask
          end
          object btCustomMasks: TSpeedButton
            Left = 248
            Top = 48
            Width = 23
            Height = 22
            Hint = 'Edit Custom Masks'
            Flat = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              33333333333FFFFFFFFF333333000000000033333377777777773333330FFFFF
              FFF03333337F333333373333330FFFFFFFF03333337F3FF3FFF73333330F00F0
              00F03333F37F773777373330330FFFFFFFF03337FF7F3F3FF3F73339030F0800
              F0F033377F7F737737373339900FFFFFFFF03FF7777F3FF3FFF70999990F00F0
              00007777777F7737777709999990FFF0FF0377777777FF37F3730999999908F0
              F033777777777337F73309999990FFF0033377777777FFF77333099999000000
              3333777777777777333333399033333333333337773333333333333903333333
              3333333773333333333333303333333333333337333333333333}
            NumGlyphs = 2
            OnClick = btCustomMasksClick
          end
          object btEditCustomColProperties: TSpeedButton
            Left = 248
            Top = 73
            Width = 23
            Height = 22
            Hint = 'Edit Custom Column Properties'
            Flat = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              33333333333FFFFFFFFF333333000000000033333377777777773333330FFFFF
              FFF03333337F333333373333330FFFFFFFF03333337F3FF3FFF73333330F00F0
              00F03333F37F773777373330330FFFFFFFF03337FF7F3F3FF3F73339030F0800
              F0F033377F7F737737373339900FFFFFFFF03FF7777F3FF3FFF70999990F00F0
              00007777777F7737777709999990FFF0FF0377777777FF37F3730999999908F0
              F033777777777337F73309999990FFF0033377777777FFF77333099999000000
              3333777777777777333333399033333333333337773333333333333903333333
              3333333773333333333333303333333333333337333333333333}
            NumGlyphs = 2
            OnClick = btEditCustomColPropertiesClick
          end
          object btEditMask: TSpeedButton
            Left = 224
            Top = 48
            Width = 23
            Height = 22
            Hint = 'Edit selected mask entry'
            Flat = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
              000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
              00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
              F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
              0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
              FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
              FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
              0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
              00333377737FFFFF773333303300000003333337337777777333}
            NumGlyphs = 2
            OnClick = btEditMaskClick
          end
          object edColHeading: TEdit
            Left = 76
            Top = 0
            Width = 193
            Height = 21
            Hint = 'Edit Heading and use Ctrl Left/Right to select different columns'
            Enabled = False
            TabOrder = 0
            OnChange = edColHeadingChange
            OnEnter = edColHeadingEnter
            OnExit = edColHeadingExit
          end
          object cbColPropertyView: TComboBox
            Left = 76
            Top = 74
            Width = 169
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 4
            OnClick = cbColPropertyViewClick
            Items.Strings = (
              'All'
              'Heading'
              'Basic'
              'Controls'
              'Custom'
              'Modified')
          end
          object cbControlType: TComboBox
            Left = 76
            Top = 24
            Width = 95
            Height = 21
            Style = csDropDownList
            Enabled = False
            ItemHeight = 13
            TabOrder = 1
            OnChange = cbControlTypeChange
            Items.Strings = (
              'None'
              'Text'
              'CheckBox'
              'Picture'
              'Default')
          end
          object cbButtonType: TComboBox
            Left = 176
            Top = 24
            Width = 95
            Height = 21
            Style = csDropDownList
            Enabled = False
            ItemHeight = 13
            TabOrder = 2
            OnChange = cbButtonTypeChange
            Items.Strings = (
              'Combo'
              'Normal'
              'None'
              'Default'
              'VertSpin'
              'HorzSpin'
              'DateTimeDropDown'
              'DateTimePopup')
          end
          object cbMask: TComboBox
            Left = 76
            Top = 48
            Width = 145
            Height = 21
            Hint = 'Edit mask for the column (use INSERT key to define a new mask)'
            Style = csDropDownList
            DropDownCount = 15
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 0
            ParentFont = False
            Sorted = True
            TabOrder = 3
            OnClick = cbMaskClick
            OnDropDown = cbMaskDropDown
            OnExit = cbMaskExit
            OnKeyDown = cbMaskKeyDown
          end
        end
      end
      object gbFields: TGroupBox
        Left = 288
        Top = 0
        Width = 245
        Height = 310
        Align = alRight
        Caption = 'Selectable Fields '
        TabOrder = 1
        object lbFields: TListBox
          Left = 37
          Top = 15
          Width = 206
          Height = 293
          Align = alClient
          ItemHeight = 13
          Sorted = True
          TabOrder = 0
          OnClick = lbFieldsClick
          OnDblClick = lbFieldsDblClick
        end
        object Panel1: TPanel
          Left = 2
          Top = 15
          Width = 35
          Height = 293
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 1
          object btAddAllColumns: TButton
            Left = 6
            Top = 60
            Width = 23
            Height = 25
            Hint = 'Add remaining columns '
            Caption = '<<'
            TabOrder = 0
            OnClick = btAddAllColumnsClick
          end
          object btInsertField: TBitBtn
            Left = 6
            Top = 4
            Width = 23
            Height = 25
            Hint = 'Insert field before currently selected column'
            TabOrder = 1
            OnClick = btInsertFieldClick
            Glyph.Data = {
              BA040000424DBA0400000000000036040000280000000C0000000B0000000100
              0800000000008400000000000000000000000001000000010000000000000000
              80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
              A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
              FF00FFFF0000FFFFFF0015151500000080000080000000808000800000008000
              800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF00002B2B2B002D2D2D000000
              80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
              A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
              FF00FFFF00004141410042424200000080000080000000808000800000008000
              800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF000058585800595959000000
              80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
              A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
              FF00FFFF00006D6D6D006E6E6E00000080000080000000808000800000008000
              800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF000084848400858585000000
              80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
              A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
              FF00FFFF00009A9A9A009B9B9B00000080000080000000808000800000008000
              800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000AFAFAF00B0B0B0000000
              80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
              A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
              FF00FFFF0000C5C5C500C6C6C600000080000080000000808000800000008000
              800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000DBDBDB00DCDCDC000000
              80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
              A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
              FF00FFFF00001E1E1E0025252500000080000080000000808000800000008000
              800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF000003030300040404000000
              800000800000008080008000000080008000F0FBFF00A4A0A000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00090909090909
              0909090909090909090909090909090909090909090909090900090909090909
              0909090700000909090909090909000000000909090909090900000000000909
              0909090909090000000009090909090909090907000009090909090909090909
              090009090909090909090909090909090909090909090909090909090909}
          end
          object btAddField: TBitBtn
            Left = 6
            Top = 32
            Width = 23
            Height = 25
            Hint = 'Add selected field onto end of grid'
            TabOrder = 2
            OnClick = btAddFieldClick
            Glyph.Data = {
              BA040000424DBA0400000000000036040000280000000C0000000B0000000100
              0800000000008400000000000000000000000001000000010000000000000000
              80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
              A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
              FF00FFFF0000FFFFFF0015151500000080000080000000808000800000008000
              800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF00002B2B2B002D2D2D000000
              80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
              A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
              FF00FFFF00004141410042424200000080000080000000808000800000008000
              800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF000058585800595959000000
              80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
              A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
              FF00FFFF00006D6D6D006E6E6E00000080000080000000808000800000008000
              800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF000084848400858585000000
              80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
              A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
              FF00FFFF00009A9A9A009B9B9B00000080000080000000808000800000008000
              800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000AFAFAF00B0B0B0000000
              80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
              A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
              FF00FFFF0000C5C5C500C6C6C600000080000080000000808000800000008000
              800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000DBDBDB00DCDCDC000000
              80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
              A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
              FF00FFFF00001E1E1E0025252500000080000080000000808000800000008000
              800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF000003030300040404000000
              800000800000008080008000000080008000F0FBFF00A4A0A000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00090909090909
              0909090909090909090907000909090909090909090907000C09090909090909
              090907000C090909090909090C0C0C000C0C0C0C090909000000000000000000
              09090909090707000C07070709090909090909000C0909090909090909090900
              0C0909090909090909090900090909090909090909090909090909090909}
          end
        end
      end
    end
    object tsCombos: TTabSheet
      Caption = 'Com&bo Properties'
      ImageIndex = 3
      object gbCombos: TGroupBox
        Left = 0
        Top = 0
        Width = 177
        Height = 310
        Align = alLeft
        Caption = 'Combos '
        TabOrder = 0
        object lbCombos: TListBox
          Left = 2
          Top = 15
          Width = 173
          Height = 293
          Align = alClient
          ExtendedSelect = False
          ItemHeight = 13
          Sorted = True
          TabOrder = 0
          OnClick = lbCombosClick
        end
      end
      object gbCombo: TGroupBox
        Left = 177
        Top = 0
        Width = 356
        Height = 310
        Align = alClient
        Caption = 'Selected Combo '
        TabOrder = 1
        object pgCombo: TPageControl
          Left = 2
          Top = 185
          Width = 352
          Height = 123
          ActivePage = tsComboData
          Align = alClient
          TabOrder = 0
          OnChange = pgComboChange
          object tsComboData: TTabSheet
            Caption = 'Data'
            object gdComboData: TtsGrid
              Left = 0
              Top = 0
              Width = 344
              Height = 95
              Align = alClient
              AlwaysShowEditor = False
              CheckBoxStyle = stCheck
              ColMoving = False
              Cols = 2
              ColSelectMode = csNone
              ExportDelimiter = ','
              GridMode = gmListBox
              HeadingFont.Charset = DEFAULT_CHARSET
              HeadingFont.Color = clWindowText
              HeadingFont.Height = -11
              HeadingFont.Name = 'MS Sans Serif'
              HeadingFont.Style = []
              ProvideGridMenu = True
              RowBarOn = False
              RowMoving = False
              Rows = 4
              TabOrder = 0
              Version = '2.20.24'
              XMLExport.Version = '1.0'
              XMLExport.DataPacketVersion = '2.0'
              OnCellLoaded = gdComboDataCellLoaded
              OnColResized = gdComboDataColResized
              OnDeleteRow = gdComboDataDeleteRow
              OnEndCellEdit = gdComboDataEndCellEdit
              OnInsertRow = gdComboDataInsertRow
              OnKeyDown = gdComboDataKeyDown
              ColProperties = <
                item
                  DataCol = 1
                  Col.Width = 91
                end
                item
                  DataCol = 2
                  Col.Width = 100
                end>
            end
          end
          object tsGridProperties: TTabSheet
            Caption = 'Grid Properties'
            ImageIndex = 1
            object veComboProperties: TtsGrid
              Left = 0
              Top = 0
              Width = 344
              Height = 95
              Align = alClient
              AlwaysShowFocus = True
              CheckBoxStyle = stCheck
              Color = clBtnFace
              Cols = 2
              ColSelectMode = csNone
              DefaultButtonWidth = 14
              DefaultRowHeight = 16
              EditColor = clWindow
              EditFontColor = clBlack
              ExportDelimiter = ','
              HeadingFont.Charset = DEFAULT_CHARSET
              HeadingFont.Color = clWindowText
              HeadingFont.Height = -11
              HeadingFont.Name = 'MS Sans Serif'
              HeadingFont.Style = []
              HeadingHeight = 17
              ProvideGridMenu = True
              RowBarOn = False
              Rows = 3
              StoreData = True
              TabOrder = 0
              ThumbTracking = True
              Version = '2.20.24'
              VertAlignment = vtaCenter
              XMLExport.Version = '1.0'
              XMLExport.DataPacketVersion = '2.0'
              OnButtonClick = veComboPropertiesButtonClick
              OnComboCellLoaded = veComboPropertiesComboCellLoaded
              OnComboDropDown = veComboPropertiesComboDropDown
              OnComboGetValue = veComboPropertiesComboGetValue
              OnComboInit = veComboPropertiesComboInit
              OnDblClick = veComboPropertiesDblClick
              OnEndCellEdit = veComboPropertiesEndCellEdit
              ColProperties = <
                item
                  DataCol = 1
                  Col.Heading = 'Property'
                  Col.ReadOnly = True
                  Col.Width = 116
                end
                item
                  DataCol = 2
                  Col.Heading = 'Value'
                  Col.Width = 121
                end>
              Data = {0100000002000000010000000001000000000000000000000000}
            end
          end
          object tsComboColumns: TTabSheet
            Caption = 'Columns'
            ImageIndex = 2
            OnResize = tsComboColumnsResize
            object pnComboColumnUd: TPanel
              Left = 324
              Top = 0
              Width = 20
              Height = 95
              Align = alRight
              BevelOuter = bvNone
              TabOrder = 0
              object udComboFields: TUpDown
                Left = 2
                Top = 4
                Width = 16
                Height = 24
                Hint = 'Adjust Column Position'
                Position = 1
                TabOrder = 0
                OnClick = udComboFieldsClick
              end
            end
            object pnComboColumns: TPanel
              Left = 0
              Top = 0
              Width = 324
              Height = 95
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 1
              object lbAllComboFields: TListBox
                Left = 0
                Top = 0
                Width = 145
                Height = 95
                Align = alLeft
                ItemHeight = 13
                TabOrder = 0
                OnClick = lbAllComboFieldsClick
                OnDblClick = lbAllComboFieldsDblClick
              end
              object btAddComboColumn: TButton
                Left = 152
                Top = 4
                Width = 21
                Height = 21
                Hint = 'Add field to combo dropdown'
                Caption = '>'
                TabOrder = 1
                OnClick = btAddComboColumnClick
              end
              object btRemoveComboColumn: TButton
                Left = 152
                Top = 28
                Width = 21
                Height = 21
                Hint = 'Remove field from combo column'
                Caption = '<'
                TabOrder = 2
                OnClick = btRemoveComboColumnClick
              end
              object lbComboFields: TListBox
                Left = 179
                Top = 0
                Width = 145
                Height = 95
                Align = alRight
                ItemHeight = 13
                TabOrder = 3
                OnClick = lbComboFieldsClick
                OnDblClick = lbComboFieldsDblClick
              end
            end
          end
          object tsComboColProperties: TTabSheet
            Caption = 'Column Properties'
            ImageIndex = 3
            object veComboColEditor: TtsGrid
              Left = 136
              Top = 0
              Width = 208
              Height = 95
              Align = alRight
              AlwaysShowFocus = True
              CheckBoxStyle = stCheck
              Color = clBtnFace
              Cols = 2
              ColSelectMode = csNone
              DefaultButtonWidth = 14
              DefaultRowHeight = 16
              EditColor = clWindow
              EditFontColor = clBlack
              ExportDelimiter = ','
              HeadingFont.Charset = DEFAULT_CHARSET
              HeadingFont.Color = clWindowText
              HeadingFont.Height = -11
              HeadingFont.Name = 'MS Sans Serif'
              HeadingFont.Style = []
              HeadingHeight = 17
              ProvideGridMenu = True
              RowBarOn = False
              Rows = 3
              StoreData = True
              TabOrder = 0
              ThumbTracking = True
              Version = '2.20.24'
              VertAlignment = vtaCenter
              XMLExport.Version = '1.0'
              XMLExport.DataPacketVersion = '2.0'
              OnButtonClick = veComboColEditorButtonClick
              OnComboCellLoaded = veComboPropertiesComboCellLoaded
              OnComboDropDown = veComboColEditorComboDropDown
              OnComboGetValue = veComboColEditorComboGetValue
              OnComboInit = veComboColEditorComboInit
              OnDblClick = veComboColEditorDblClick
              OnEndCellEdit = veComboColEditorEndCellEdit
              ColProperties = <
                item
                  DataCol = 1
                  Col.Heading = 'Property'
                  Col.ReadOnly = True
                  Col.Width = 93
                end
                item
                  DataCol = 2
                  Col.Heading = 'Value'
                  Col.Width = 92
                end>
              Data = {0100000002000000010000000001000000000000000000000000}
            end
            object Panel5: TPanel
              Left = 0
              Top = 0
              Width = 136
              Height = 95
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 1
              object lbColumns2: TListBox
                Left = 0
                Top = 0
                Width = 136
                Height = 73
                Align = alTop
                ItemHeight = 13
                TabOrder = 0
                OnClick = lbColumns2Click
              end
              object chColPropertiesShortList: TCheckBox
                Left = 0
                Top = 76
                Width = 113
                Height = 17
                Caption = 'Properties ShortList'
                Checked = True
                State = cbChecked
                TabOrder = 1
                OnClick = chColPropertiesShortListClick
              end
            end
          end
        end
        object Panel6: TPanel
          Left = 2
          Top = 15
          Width = 352
          Height = 170
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object Label17: TLabel
            Left = 240
            Top = 32
            Width = 48
            Height = 13
            Caption = 'Value Col:'
          end
          object Label18: TLabel
            Left = 16
            Top = 56
            Width = 104
            Height = 13
            Caption = '# of Dropdown Rows:'
          end
          object Label19: TLabel
            Left = 104
            Top = 6
            Width = 60
            Height = 13
            Caption = 'DataSource:'
          end
          object Label20: TLabel
            Left = 16
            Top = 32
            Width = 117
            Height = 13
            Caption = '# of Dropdown Columns:'
          end
          object Label21: TLabel
            Left = 108
            Top = 80
            Width = 101
            Height = 13
            Caption = 'AutoFill ConvertCase:'
          end
          object Label22: TLabel
            Left = 108
            Top = 104
            Width = 72
            Height = 13
            Caption = 'Compare Type:'
          end
          object Label23: TLabel
            Left = 108
            Top = 128
            Width = 59
            Height = 13
            Caption = 'AutoSearch:'
          end
          object Label16: TLabel
            Left = 108
            Top = 152
            Width = 78
            Height = 13
            Caption = 'Dropdown Style:'
          end
          object chAutoFill: TCheckBox
            Left = 8
            Top = 80
            Width = 65
            Height = 17
            Caption = 'AutoFill'
            TabOrder = 9
            OnClick = chAutoFillClick
          end
          object chValueColSorted: TCheckBox
            Left = 244
            Top = 54
            Width = 97
            Height = 17
            Caption = 'ValueCol Sorted'
            TabOrder = 8
            OnClick = chValueColSortedClick
          end
          object cbConvertCase: TComboBox
            Left = 212
            Top = 76
            Width = 129
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 12
            OnChange = cbConvertCaseChange
            Items.Strings = (
              'On Edit'
              'On Exit'
              'None')
          end
          object cbCompareType: TComboBox
            Left = 212
            Top = 99
            Width = 129
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 13
            OnChange = cbCompareTypeChange
            Items.Strings = (
              'Case Sensitive'
              'Case Insensitive'
              'Own')
          end
          object cbAutoSearch: TComboBox
            Left = 212
            Top = 122
            Width = 129
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 14
            OnChange = cbAutoSearchChange
            Items.Strings = (
              'None'
              'Top'
              'Bottom'
              'Center')
          end
          object cbComboDataSource: TComboBox
            Left = 172
            Top = 2
            Width = 169
            Height = 21
            Style = csDropDownList
            ItemHeight = 0
            TabOrder = 1
            OnClick = cbComboDataSourceClick
          end
          object edValueCol: TEdit
            Left = 292
            Top = 28
            Width = 33
            Height = 21
            TabOrder = 4
            Text = '0'
            OnChange = edValueColChange
          end
          object edDropDownRows: TEdit
            Left = 144
            Top = 52
            Width = 33
            Height = 21
            TabOrder = 6
            Text = '0'
            OnChange = edDropDownRowsChange
          end
          object edDropDownCols: TEdit
            Left = 144
            Top = 28
            Width = 33
            Height = 21
            TabOrder = 2
            Text = '0'
            OnChange = edDropDownColsChange
          end
          object udDropDownCols: TUpDown
            Left = 177
            Top = 28
            Width = 15
            Height = 21
            Associate = edDropDownCols
            TabOrder = 3
          end
          object udDropDownRows: TUpDown
            Left = 177
            Top = 52
            Width = 15
            Height = 21
            Associate = edDropDownRows
            TabOrder = 7
          end
          object udValueCol: TUpDown
            Left = 325
            Top = 28
            Width = 15
            Height = 21
            Associate = edValueCol
            TabOrder = 5
          end
          object chAutoLookup: TCheckBox
            Left = 8
            Top = 110
            Width = 81
            Height = 17
            Hint = 
              'Used with Lookup fields on the TDataset to automatically bind va' +
              'lue changes'
            Caption = 'AutoLookup'
            TabOrder = 10
            OnClick = chAutoLookupClick
          end
          object cbDropDownStyle: TComboBox
            Left = 212
            Top = 146
            Width = 129
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 15
            OnChange = cbDropDownStyleChange
            Items.Strings = (
              'DropDown'
              'DropDown List')
          end
          object chComboStoreData: TCheckBox
            Left = 8
            Top = 140
            Width = 77
            Height = 17
            Caption = 'Store Data'
            TabOrder = 11
            OnClick = chComboStoreDataClick
          end
          object chParentCombo: TCheckBox
            Left = 8
            Top = 5
            Width = 89
            Height = 17
            Hint = 'Combo is defined at runtime at grid level'
            Caption = 'ParentCombo'
            TabOrder = 0
            OnClick = chParentComboClick
          end
        end
      end
    end
    object tsRowProperties: TTabSheet
      Caption = 'Row Properties'
      ImageIndex = 4
      object gbRow: TGroupBox
        Left = 0
        Top = 0
        Width = 301
        Height = 310
        Align = alLeft
        Caption = 'Row '
        TabOrder = 0
        object veRowEditor: TtsGrid
          Left = 2
          Top = 15
          Width = 297
          Height = 293
          Align = alClient
          AlwaysShowFocus = True
          CheckBoxStyle = stCheck
          Color = clBtnFace
          Cols = 2
          ColSelectMode = csNone
          DefaultButtonWidth = 14
          DefaultRowHeight = 16
          EditColor = clWindow
          EditFontColor = clBlack
          ExportDelimiter = ','
          HeadingFont.Charset = DEFAULT_CHARSET
          HeadingFont.Color = clWindowText
          HeadingFont.Height = -11
          HeadingFont.Name = 'MS Sans Serif'
          HeadingFont.Style = []
          HeadingHeight = 17
          ProvideGridMenu = True
          RowBarOn = False
          Rows = 1
          StoreData = True
          TabOrder = 0
          ThumbTracking = True
          Version = '2.20.24'
          VertAlignment = vtaCenter
          XMLExport.Version = '1.0'
          XMLExport.DataPacketVersion = '2.0'
          OnButtonClick = veRowEditorButtonClick
          OnComboCellLoaded = veRowEditorComboCellLoaded
          OnComboDropDown = veRowEditorComboDropDown
          OnComboGetValue = veRowEditorComboGetValue
          OnComboInit = veRowEditorComboInit
          OnDblClick = veRowEditorDblClick
          OnEndCellEdit = veRowEditorEndCellEdit
          OnRowChanged = veRowEditorRowChanged
          ColProperties = <
            item
              DataCol = 1
              Col.Heading = 'Property'
              Col.ReadOnly = True
              Col.Width = 120
            end
            item
              DataCol = 2
              Col.Heading = 'Value'
              Col.Width = 146
            end>
          Data = {0100000002000000010000000001000000000000000000000000}
        end
      end
      object btShowHiddenRows: TButton
        Left = 308
        Top = 16
        Width = 113
        Height = 25
        Caption = 'Show Hidden Rows'
        TabOrder = 1
        OnClick = btShowHiddenRowsClick
      end
    end
    object tsCellProperties: TTabSheet
      Caption = 'Cell Properties'
      ImageIndex = 5
      object gbCell: TGroupBox
        Left = 0
        Top = 0
        Width = 301
        Height = 310
        Align = alLeft
        Caption = 'Cell '
        TabOrder = 0
        object veCellEditor: TtsGrid
          Left = 2
          Top = 15
          Width = 297
          Height = 293
          Align = alClient
          AlwaysShowFocus = True
          CheckBoxStyle = stCheck
          Color = clBtnFace
          Cols = 2
          ColSelectMode = csNone
          DefaultButtonWidth = 14
          DefaultRowHeight = 16
          EditColor = clWindow
          EditFontColor = clBlack
          ExportDelimiter = ','
          HeadingFont.Charset = DEFAULT_CHARSET
          HeadingFont.Color = clWindowText
          HeadingFont.Height = -11
          HeadingFont.Name = 'MS Sans Serif'
          HeadingFont.Style = []
          HeadingHeight = 17
          ProvideGridMenu = True
          RowBarOn = False
          Rows = 1
          StoreData = True
          TabOrder = 0
          ThumbTracking = True
          Version = '2.20.24'
          VertAlignment = vtaCenter
          XMLExport.Version = '1.0'
          XMLExport.DataPacketVersion = '2.0'
          OnButtonClick = veCellEditorButtonClick
          OnComboCellLoaded = veCellEditorComboCellLoaded
          OnComboDropDown = veCellEditorComboDropDown
          OnComboGetValue = veCellEditorComboGetValue
          OnComboInit = veRowEditorComboInit
          OnDblClick = veCellEditorDblClick
          OnEndCellEdit = veCellEditorEndCellEdit
          OnRowChanged = veCellEditorRowChanged
          ColProperties = <
            item
              DataCol = 1
              Col.Heading = 'Property'
              Col.ReadOnly = True
              Col.Width = 109
            end
            item
              DataCol = 2
              Col.Heading = 'Value'
              Col.Width = 164
            end>
          Data = {0100000002000000010000000001000000000000000000000000}
        end
      end
    end
  end
  object sbStatus: TStatusBar
    Left = 0
    Top = 480
    Width = 541
    Height = 19
    Constraints.MaxHeight = 19
    Panels = <
      item
        Text = 'Source:'
        Width = 150
      end
      item
        Text = 'Col:'
        Width = 75
      end
      item
        Width = 75
      end
      item
        Width = 50
      end>
  end
  object sampleDbGrid: TtsDBGrid
    Left = 0
    Top = 41
    Width = 541
    Height = 96
    Align = alClient
    CheckBoxStyle = stCheck
    Cols = 0
    ExactRowCount = True
    ExportDelimiter = ','
    HeadingFont.Charset = DEFAULT_CHARSET
    HeadingFont.Color = clWindowText
    HeadingFont.Height = -11
    HeadingFont.Name = 'MS Sans Serif'
    HeadingFont.Style = []
    PopupMenu = pmOptions
    Rows = 4
    ProvideGridMenu = True
    TabOrder = 4
    ThumbTracking = True
    Version = '2.20.24'
    XMLExport.Version = '1.0'
    XMLExport.DataPacketVersion = '2.0'
    OnCellChanged = sampleDbGridCellChanged
    OnColMoved = sampleDbGridColMoved
    OnColResized = sampleDbGridColResized
    OnHeadingClick = sampleDbGridHeadingClick
    OnKeyDown = sampleGridKeyDown
    OnKeyPress = sampleGridKeyPress
    OnKeyUp = sampleGridKeyUp
    OnMouseDown = sampleDbGridMouseDown
    OnTopLeftChanged = sampleDbGridTopLeftChanged
    DataBound = False
  end
  object pnTop: TPanel
    Left = 0
    Top = 29
    Width = 541
    Height = 12
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 5
    object pnIndicator: TPanel
      Left = 216
      Top = 0
      Width = 185
      Height = 18
      BevelOuter = bvNone
      Color = clGreen
      TabOrder = 0
    end
  end
  object pmOptions: TPopupMenu
    OnPopup = pmOptionsPopup
    Left = 124
    Top = 44
    object miAddColumn: TMenuItem
      Caption = 'A&dd Column'
      OnClick = miAddColumnClick
    end
    object RemoveColumn1: TMenuItem
      Caption = 'Re&move Column'
      OnClick = RemoveColumn1Click
    end
    object miClearAllColumns: TMenuItem
      Caption = 'Remove All &Columns'
      OnClick = miClearAllColumnsClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object AddCombo1: TMenuItem
      Caption = '&Add Combo'
      OnClick = AddCombo1Click
    end
    object RemoveCombo1: TMenuItem
      Caption = '&Remove Combo'
      OnClick = RemoveCombo1Click
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object miAddRow: TMenuItem
      Caption = 'Insert Row'
      Hint = 'Insert a row before the current row'
      OnClick = miAddRowClick
    end
    object miRemoveRow: TMenuItem
      Caption = 'Remove Row(s)'
      Hint = 'Delete the currently selected rows'
      OnClick = miRemoveRowClick
    end
  end
  object ilImages: TImageList
    Left = 64
    Top = 48
    Bitmap = {
      494C010111001400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000005000000001002000000000000050
      00000000000000000000000000000000000000000000BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD0000000000BDBDBD00BDBDBD00BDBDBD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BDBDBD00000000000000
      0000000000000000000000000000BDBDBD00BDBDBD00BDBDBD000000000000FF
      FF0000000000BDBDBD00BDBDBD00BDBDBD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BDBDBD0000000000007B
      0000007B0000007B0000007B0000BDBDBD00BDBDBD00BDBDBD0000000000007B
      7B0000000000BDBDBD00BDBDBD00BDBDBD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BDBDBD0000000000007B
      0000007B0000007B0000007B0000BDBDBD00BDBDBD000000000000FFFF00007B
      7B00BDBDBD00BDBDBD00BDBDBD00BDBDBD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BDBDBD0000000000007B
      0000BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD0000000000007B7B000000
      0000BDBDBD00BDBDBD00BDBDBD00BDBDBD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BDBDBD0000000000FFFF
      0000FFFF0000BDBDBD00BDBDBD00BDBDBD00BDBDBD000000FF0000000000BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BDBDBD00000000000000
      0000BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BDBDBD0000000000FF00
      0000BDBDBD00FFFF0000BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BDBDBD0000000000FF00
      0000FF00000000FFFF00BDBDBD00FFFF0000FF000000FF000000FF000000BDBD
      BD00BDBDBD00FF000000BDBDBD00BDBDBD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BDBDBD0000000000FFFF
      0000FFFF000000FFFF0000FFFF00FF000000FFFF0000FFFF0000FFFF0000FF00
      0000FF000000FFFF0000BDBDBD00BDBDBD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BDBDBD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BDBDBD00BDBDBD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B00000000007B7B7B0000000000000000007B7B
      7B007B7B7B007B7B7B00FFFFFF007B7B7B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000007B
      7B00007B7B00007B7B00007B7B00007B7B00007B7B0000000000BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00000000007B7B
      7B00FFFFFF007B7B7B00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF00000000000000000000FFFF000000
      0000007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00000000000000
      0000000000000000000000000000BDBDBD000000000000000000000000000000
      00000000000000000000000000007B7B7B007B7B7B0000000000FFFFFF007B7B
      7B007B7B7B007B7B7B00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B7B7B00000000007B7B7B000000
      00007B7B7B00000000007B7B7B00000000007B7B7B00000000007B7B7B000000
      00007B7B7B00000000007B7B7B0000000000000000000000000000FFFF00BDBD
      BD0000000000007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B
      7B00007B0000007B000000000000BDBDBD000000000000000000000000000000
      000000000000000000007B7B7B0000000000000000007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF0000000000000000000000000000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      000000000000007B000000000000BDBDBD000000000000000000000000000000
      0000000000007B7B7B0000000000000000007B7B7B0000000000000000007B7B
      7B00000000007B7B7B00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B7B7B00000000007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B00FFFFFF007B7B7B000000000000000000000000000000000000FF
      FF0000FFFF000000000000FFFF0000FFFF0000000000FF000000FFFF0000FF00
      0000FF000000FFFF000000000000BDBDBD000000000000000000000000000000
      00007B7B7B00FFFFFF00000000000000000000000000000000007B7B7B000000
      0000000000007B7B7B00FFFFFF0000000000000000000000000000000000BDBD
      BD000000000000000000BDBDBD0000000000BDBDBD0000000000BDBDBD000000
      00000000000000000000000000000000000000000000FFFFFF007B7B7B00FFFF
      FF007B7B7B007B7B7B00FFFFFF007B7B7B00FFFFFF007B7B7B00FFFFFF007B7B
      7B007B7B7B00FFFFFF0000000000FFFFFF00000000000000000000FFFF000000
      00000000000000000000000000000000000000000000FFFF0000FF000000FFFF
      0000FFFF0000FF00000000000000BDBDBD000000000000000000000000000000
      00007B7B7B00FFFFFF000000000000000000000000007B7B7B00000000000000
      00007B7B7B007B7B7B00FFFFFF0000000000000000000000000000000000BDBD
      BD000000000000000000BDBDBD0000000000BDBDBD0000000000BDBDBD000000
      0000000000000000000000000000000000007B7B7B00000000007B7B7B00FFFF
      FF007B7B7B007B7B7B00FFFFFF007B7B7B00000000007B7B7B00FFFFFF007B7B
      7B007B7B7B00FFFFFF007B7B7B000000000000000000BDBDBD00000000000000
      0000BDBDBD00BDBDBD00BDBDBD00BDBDBD00FF000000FF000000FFFF0000FF00
      0000FF000000FFFF000000000000BDBDBD000000000000000000000000007B7B
      7B007B7B7B00FFFFFF0000000000000000000000000000000000000000007B7B
      7B00FFFFFF007B7B7B00FFFFFF00000000000000000000000000000000000000
      0000BDBDBD000000000000000000BDBDBD00000000000000000000000000BDBD
      BD000000000000000000000000000000000000000000FFFFFF007B7B7B007B7B
      7B00FFFFFF007B7B7B007B7B7B00FFFFFF007B7B7B007B7B7B007B7B7B00FFFF
      FF007B7B7B00FFFFFF0000000000FFFFFF0000000000BDBDBD00BDBDBD000000
      0000BDBDBD00BDBDBD00FFFF0000FFFF0000FF000000BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD0000000000BDBDBD0000000000000000007B7B7B000000
      00007B7B7B0000000000FFFFFF000000000000000000000000007B7B7B007B7B
      7B00FFFFFF007B7B7B00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B7B7B00000000007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B00000000007B7B7B000000000000000000BDBDBD00BDBDBD000000
      0000FF000000FFFF0000FF000000FF000000FFFF0000FFFF00007B7B7B00BDBD
      BD00FFFF0000BDBDBD0000000000BDBDBD00000000007B7B7B00FFFFFF00FFFF
      FF00000000007B7B7B0000000000FFFFFF00000000007B7B7B00000000007B7B
      7B00FFFFFF007B7B7B00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF0000000000BDBDBD00BDBDBD000000
      0000FF000000FFFF000000FFFF0000FFFF00FFFF0000FFFF0000FF000000FFFF
      0000FFFF0000FF00000000000000BDBDBD007B7B7B007B7B7B007B7B7B00FFFF
      FF00FFFFFF00000000007B7B7B0000000000FFFFFF00FFFFFF00FFFFFF007B7B
      7B00FFFFFF007B7B7B00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B7B7B00000000007B7B7B000000
      00007B7B7B00000000007B7B7B00000000007B7B7B00000000007B7B7B000000
      00007B7B7B00000000007B7B7B000000000000000000BDBDBD00BDBDBD000000
      000000000000FF00000000FFFF0000FFFF00FF000000FF000000FFFF0000FF00
      0000FF000000FFFF000000000000BDBDBD007B7B7B007B7B7B007B7B7B007B7B
      7B00FFFFFF00FFFFFF00000000007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B00FFFFFF007B7B7B00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BDBDBD00BDBDBD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BDBDBD007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B00FFFFFF007B7B7B00000000000000000000000000000000007B7B
      7B00000000007B7B7B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00000000007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B0000000000000000000000000000000000000000000000
      00007B7B7B00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD0000000000000000007B7B7B007B7B
      7B007B7B7B000000000000000000000000000000000000000000000000000000
      00007B7B7B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF941800FF94
      1800FF941800FF941800FF941800FF941800FF941800FF941800FF941800FF94
      1800FF941800FF941800FF941800FF9418000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EFCE8400EFCE
      8400EFCE8400EFCE8400EFCE8400EFCE8400EFCE8400EFCE8400EFCE8400EFCE
      8400EFCE8400EFCE8400EFCE8400FF9418000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B00000000007B7B7B0000000000000000000000
      FF000000FF000000FF00000000007B7B7B000000000000000000EFCE84000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000EFCE8400FF9418000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000008484000000000000000000000000000000000000000000EFCE8400FF94
      1800000000000000000000000000000000000000000000000000000000000000
      00000000000000000000EFCE8400FF9418000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF000000000000000000000000000000000000000000EFCE8400FF94
      1800FF941800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000EFCE8400FF94180000000000FFFFFF007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000EFCE8400FF94
      1800FF941800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000EFCE8400FF94180000000000FFFFFF000000FF00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD007B7B7B000000000000000000000000000000000000FF
      FF00BDBDBD0000FFFF00BDBDBD0000FFFF00BDBDBD0000FFFF00BDBDBD0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF0000FFFF000000000000FFFF00FFFFFF000000
      0000FFFFFF000000000000000000000000000000000000000000EFCE8400FF94
      1800FF941800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000EFCE8400FF94180000000000FFFFFF00BDBDBD00BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      0000BDBDBD00BDBDBD007B7B7B00000000000000000000000000FFFFFF000000
      000000FFFF00BDBDBD0000FFFF00BDBDBD0000FFFF00BDBDBD0000FFFF00BDBD
      BD0000FFFF000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000000000FFFF
      FF0000FFFF000000000000000000000000000000000000000000EFCE8400FF94
      1800FF941800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000EFCE8400FF94180000000000FFFFFF00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD007B7B7B0000000000000000000000000000FFFF00FFFF
      FF000000000000FFFF00BDBDBD0000FFFF00BDBDBD0000FFFF00BDBDBD0000FF
      FF00BDBDBD0000FFFF0000000000000000000000000000000000000000000000
      00000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000000000FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000EFCE8400FF94
      1800FF941800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000EFCE8400FF94180000000000FFFFFF00BDBDBD00BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      0000BDBDBD00BDBDBD007B7B7B00000000000000000000000000FFFFFF0000FF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF000000
      000000FFFF000000000000000000000000000000000000000000EFCE8400FF94
      1800FF941800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000EFCE8400FF94180000000000FFFFFF00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD007B7B7B0000000000000000000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      00000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00000000000000
      000000FFFF000000000000000000000000000000000000000000EFCE8400FF94
      1800FF941800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000EFCE8400FF94180000000000FFFFFF00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD007B7B7B00000000000000000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF00000000000000FFFF00FFFFFF0000FFFF000000000000FFFF000000
      000000FFFF000000000000000000000000000000000000000000EFCE8400FF94
      1800FF941800FF941800FF941800FF941800FF941800FF941800FF941800FF94
      18000000000000000000EFCE8400FF94180000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      0000FFFF0000FFFF00000000000000FFFF00FFFFFF0000FFFF00FFFFFF000000
      000000FFFF000000000000000000000000000000000000000000EFCE8400FF94
      1800FF941800FF941800FF941800FF941800FF941800FF941800FF941800FF94
      1800FF94180000000000EFCE8400FF9418000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF0000FFFF0000FFFF0000000000000000000000000000000000000000
      000000FFFF000000000000000000000000000000000000000000EFCE8400EFCE
      8400EFCE8400EFCE8400EFCE8400EFCE8400EFCE8400EFCE8400EFCE8400EFCE
      8400EFCE8400EFCE8400EFCE8400FF9418000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B000000
      00000000000000000000000000007B7B7B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF000000000000000000000000000000000000000000000000
      0000BDBDBD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000840000008400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF00000084000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF000000FF000000
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      0000008484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000000000FF
      FF00000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF000000
      000000FFFF000000000000848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF000000000000FFFF0000848400008484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF00008484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      840000000000000000008484840000000000848484008484840000000000FFFF
      000000000000C6C6C60084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600C6C6C600000000008484840000000000000000008484
      840000000000848484000000000000000000848484000000000000000000FFFF
      0000848400008484840000000000C6C6C6000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C60000000000C6C6C600000000008484840000000000848484000000
      000000000000848484000000000084848400000000000000000000000000FFFF
      0000848400008484000000000000848484000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400C6C6C6000000000000000000C6C6C600C6C6C600C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008484840000000000C6C6C60000000000FFFF
      000084840000848400000000000084848400000000000000FF000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400C6C6C6000000000000000000C6C6C600C6C6C600C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C60000000000000000000000000000000000C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000848484000000000000000000000000000000000000000000FFFF
      000084840000848400000000000084848400000000000000FF000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600000000000000000000000000C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084848400848484008484840000000000FFFF
      0000848400008484000000000000848484000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600C6C6C600C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000848400000000000084848400848484008484840000000000FFFF
      0000000000008484000000000000848484000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      840084848400FFFF00008484000000000000848484008484840000000000FFFF
      0000000000008484000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000000000000000000000000000000000C6C6C6000000
      0000000000000000000000000000000000000000000084840000848400008484
      000084840000FFFF0000FFFF000084840000000000008484840000000000FFFF
      0000848400008484000000000000848484000000000000000000000000000000
      0000000000000000000000000000FF0000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF0000000000000000
      0000000000000000000000000000FFFF0000848400000000000000000000FFFF
      0000848400008484000000000000848484000000000000000000000000000000
      0000000000000000000000000000FF000000FF00000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000C6C6C6000000000000000000C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF0000FFFF000084840000848484008484840000000000FFFF
      00008484000084840000000000008484840000000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF0000000000
      00000000FF000000FF000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF00008484000084848400848484008484840000000000FFFF
      00008484000084840000000000008484840000000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF0000000000
      00000000FF000000FF000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600000000000000000000000000000000000000
      000000000000848400000000000084848400848484008484840084848400FFFF
      0000848400008484000000000000848484000000000000000000000000000000
      0000000000000000000000000000FF000000FF00000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400848484008484
      8400FFFF00008484000000000000848484000000000000000000000000000000
      0000000000000000000000000000FF0000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400848484008484
      840084848400FFFF000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000500000000100010000000000800200000000000000000000
      000000000000000000000000FFFFFF0080000000000000008000000000000000
      8000000000000000800000000000000080000000000000008000000000000000
      8000000000000000800000000000000090000000000000008000000000000000
      8000000000000000800000000000000080000000000000008000000000000000
      8000000000000000FFFF00000000000080B1FFFFFFFF80000160FFFFFFFF8000
      FF21FFFFAAAA8000FE41555555558000FD81FFFFA002A000FB6940054001A480
      F3D9C00780029000F3B1400540818000E3E1C00780028000D5C1400540058000
      8AA1FFFFAAAA800005015555555580000201FFFFFFFF800001EBFFFFFFFF8000
      83F3FFFFFFFF8000C7F7FFFFFFFFFFFFC000FFFFFFFFFFFFC000FFFFFFFF0162
      DFFCFFFFFFFFFFE3CFFC0000FFFFFE63C00C0000C00FFC03C00C00008007F803
      C00C00008003F003C00C00008001F003C00C00008001E003C00C0000800FC003
      C00C0000800F8003C00C0000801F0003C0040000C0FF0003C000FFFFC0FF01E3
      FFFFFFFFFFFF83F7FFFFFFFFFFFFC7F7847FFFFFFFFFFFFF00EFFFFFFFFFFFFF
      31BF803FE01FF00739FFFFFFFFFFFFFF993F800780078007CA1FFFFFFFFFFFFF
      F40F803FE01FF0079C07FFFFFFFFFFFF9603800780078007CB01FFFFFFFFFFFF
      FF80803FE01FF007F7C0FFFFFFFFFFFFFFE0800780078007EFF0FFFFFFFFFFFF
      FFF8FFFFFFFFFFFFFFFCFFFFFFFFFFFFFFFFFFFFAD09FFFF80039FF96B42E7F8
      00018FF15AC0E7F8000187E3FC8081FF0001C3C3F80081FC0001C387F800E7FC
      0001E00FF800E7FF0001F01FC008FFFC0001F81F8000FEFC0001F83FBE00FE7F
      0001F01F800080130001E187F80080130001C3C1F800FE7F000187F1FC00FEF8
      00018FF9FC01FFF88003FFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object ilHotImages: TImageList
    Left = 96
    Top = 44
  end
  object dgFont: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Left = 152
    Top = 44
  end
  object pmReset: TPopupMenu
    OnPopup = pmResetPopup
    Left = 32
    Top = 40
    object miResetGridProperty: TMenuItem
      Caption = 'Reset &Grid Property'
      OnClick = miResetGridPropertyClick
    end
    object miResetAllGridProperties: TMenuItem
      Caption = 'Reset &All Grid Properties'
      OnClick = miResetAllGridPropertiesClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object miResetColumnProperty: TMenuItem
      Caption = 'Reset &Column Property'
      OnClick = miResetColumnPropertyClick
    end
    object miResetAllColumnProperties: TMenuItem
      Caption = 'Reset All Column &Properties'
      OnClick = miResetAllColumnPropertiesClick
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object miResetGridColumns: TMenuItem
      Caption = '&Reset Grid Columns'
      OnClick = miResetGridColumnsClick
    end
    object miSortedFieldList: TMenuItem
      Caption = 'Sorted Field List'
      Checked = True
      OnClick = miSortedFieldListClick
    end
  end
  object qyTest: TQuery
    SQL.Strings = (
      'select * from persons where person_id < 100')
    Left = 492
    Top = 156
  end
  object DataSource1: TDataSource
    DataSet = qyTest
    Left = 544
    Top = 168
  end
  object OpenDialog1: TOpenDialog
    Left = 68
    Top = 84
  end
  object SaveDialog1: TSaveDialog
    Left = 108
    Top = 84
  end
end
