object Form3: TForm3
  Left = 254
  Top = 149
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #21416#24072#19994#32489#32479#35745#8212#8212#28248#20891#24773#37202#24215
  ClientHeight = 348
  ClientWidth = 679
  Color = clWhite
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel
    Left = 24
    Top = 256
    Width = 84
    Height = 12
    Caption = #24320#22987#32479#35745#21069#35831#20808
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 24
    Top = 240
    Width = 36
    Height = 12
    Caption = #25552#31034#65306
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 24
    Top = 272
    Width = 84
    Height = 12
    Caption = #25191#34892#21047#26032#25968#25454#65292
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 24
    Top = 288
    Width = 84
    Height = 12
    Caption = #26356#26032#25968#25454#26174#31034#12290
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object cxGrid2: TcxGrid
    Left = 128
    Top = 8
    Width = 521
    Height = 321
    TabOrder = 0
    object cxGrid2DBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = DataSource1
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnMoving = False
      OptionsCustomize.ColumnSorting = False
      OptionsData.Editing = False
      OptionsView.GroupByBox = False
      object cxGrid2DBTableView1DBColumn1: TcxGridDBColumn
        DataBinding.FieldName = #26102#38388
        SortIndex = 0
        SortOrder = soAscending
        Width = 66
      end
      object cxGrid2DBTableView1DBColumn: TcxGridDBColumn
        DataBinding.FieldName = #21416#24072
        Width = 74
      end
      object cxGrid2DBTableView1DBColumn2: TcxGridDBColumn
        DataBinding.FieldName = #22320#28857
        Width = 65
      end
      object cxGrid2DBTableView1DBColumn3: TcxGridDBColumn
        DataBinding.FieldName = #33756#21517
        Width = 74
      end
      object cxGrid2DBTableView1DBColumn4: TcxGridDBColumn
        DataBinding.FieldName = #25968#37327
        Width = 49
      end
      object cxGrid2DBTableView1DBColumn6: TcxGridDBColumn
        DataBinding.FieldName = #32047#35745#25968#37327
      end
      object cxGrid2DBTableView1DBColumn7: TcxGridDBColumn
        DataBinding.FieldName = #37329#39069
        Width = 52
      end
      object cxGrid2DBTableView1DBColumn8: TcxGridDBColumn
        DataBinding.FieldName = #32047#35745#37329#39069
        Width = 70
      end
    end
    object cxGrid2Level1: TcxGridLevel
      GridView = cxGrid2DBTableView1
    end
  end
  object DBLookupListBox1: TDBLookupListBox
    Left = 24
    Top = 8
    Width = 81
    Height = 160
    KeyField = #21416#24072#32534#21495
    ListField = #21416#24072#32534#21495
    ListSource = DataSource2
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 24
    Top = 208
    Width = 75
    Height = 25
    Caption = #24320#22987#32479#35745
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 24
    Top = 304
    Width = 75
    Height = 25
    Caption = #36864#20986
    ModalResult = 9
    TabOrder = 3
  end
  object BitBtn4: TBitBtn
    Left = 24
    Top = 176
    Width = 75
    Height = 25
    Caption = #21047#26032#25968#25454
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = BitBtn4Click
  end
  object ADOTable2: TADOTable
    CursorType = ctStatic
    IndexFieldNames = #21416#24072#32534#21495
    TableName = 'csbh'
    Left = 24
    Top = 88
  end
  object DataSource2: TDataSource
    DataSet = ADOTable2
    Left = 64
    Top = 88
  end
  object ADOTable1: TADOTable
    CursorType = ctStatic
    IndexFieldNames = #21416#24072
    MasterFields = #21416#24072
    MasterSource = DataSource2
    TableName = #34920'1'
    Left = 144
    Top = 32
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 144
    Top = 96
  end
end
