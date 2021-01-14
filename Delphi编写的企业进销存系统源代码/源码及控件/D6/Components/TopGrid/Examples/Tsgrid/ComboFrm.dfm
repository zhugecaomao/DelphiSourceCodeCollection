object Form1: TForm1
  Left = 112
  Top = 105
  Width = 546
  Height = 345
  Caption = 'TtsGrid: Combo box and buttons in TtsGrid'
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
    Top = 16
    Width = 311
    Height = 13
    Caption = 'This example shows how to implement a combo or button in a cell.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object tsGrid1: TtsGrid
    Left = 8
    Top = 48
    Width = 514
    Height = 257
    CheckBoxStyle = stCheck
    Cols = 10
    ColSelectMode = csNone
    ExportDelimiter = ','
    HeadingFont.Charset = DEFAULT_CHARSET
    HeadingFont.Color = clWindowText
    HeadingFont.Height = -11
    HeadingFont.Name = 'MS Sans Serif'
    HeadingFont.Style = []
    HeadingHeight = 75
    ParentShowHint = False
    RowChangedIndicator = riAutoReset
    Rows = 4
    ShowHint = True
    StoreData = True
    TabOrder = 0
    Version = '2.20.20'
    OnButtonDown = tsGrid1ButtonDown
    OnComboCellLoaded = tsGrid1ComboCellLoaded
    OnComboInit = tsGrid1ComboInit
    OnStartCellEdit = tsGrid1StartCellEdit
    ColProperties = <
      item
        DataCol = 2
        Col.ButtonType = btCombo
        Col.Heading = 
          'Combo box with 1 column, heading and rowbar turned on. Style is ' +
          'DropDown'
        Col.ParentCombo = False
        Col.Width = 100
        Col.Combo = {
          545046300C547473436F6D626F4772696400044C656674020003546F70020005
          57696474680340010648656967687402780754616253746F70080A4175746F53
          656172636807056173546F700C44726F70446F776E526F777302040C44726F70
          446F776E436F6C7302010D436865636B426F785374796C650707737443686563
          6B04436F6C7302010F44656661756C74436F6C5769647468026E134865616469
          6E67466F6E742E43686172736574070F44454641554C545F4348415253455411
          48656164696E67466F6E742E436F6C6F72070C636C57696E646F775465787412
          48656164696E67466F6E742E48656967687402F51048656164696E67466F6E74
          2E4E616D65060D4D532053616E732053657269661148656164696E67466F6E74
          2E5374796C650B0004526F777302040953746F72654461746109075665727369
          6F6E0607322E32302E323004446174610A4B0000000100000001000000010300
          00004F6E650200000001000000010300000054776F0300000001000000010500
          0000546872656504000000010000000104000000466F75720000000000000000
          0000}
      end
      item
        DataCol = 3
        Col.ButtonType = btCombo
        Col.DropDownStyle = ddDropDownList
        Col.Heading = 
          'Combo box with 2 colomns, heading and rowbar turned off. Style i' +
          's DropDownList.'
        Col.Width = 100
      end
      item
        DataCol = 4
        Col.ButtonType = btNormal
        Col.Heading = 'Text with button, allowing editing'
        Col.Width = 90
      end
      item
        DataCol = 5
        Col.ButtonType = btNormal
        Col.Heading = 'Text with button, disallowing editing'
        Col.Width = 90
      end>
    Data = {0000000000000000}
  end
end
