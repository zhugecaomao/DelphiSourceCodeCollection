object Form2: TForm2
  Left = 190
  Top = 85
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #21416#25151#25968#25454#24405#20837#8212#8212#28248#20891#24773#37202#24215
  ClientHeight = 470
  ClientWidth = 635
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
    Left = 256
    Top = 16
    Width = 276
    Height = 12
    Caption = #25552#31034#65306#35831#19981#35201#21453#22797#37325#26032#35745#31639#37329#39069#20540#65281#31995#32479#33258#21160#35745#31639#12290
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 256
    Top = 40
    Width = 252
    Height = 12
    Caption = #33756#21517#36895#26597#30721#65306#23601#26159#33756#21517#27599#20010#27721#23383#25340#38899#30340#39318#23383#27597#12290
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 24
    Top = 392
    Width = 84
    Height = 12
    Caption = #35831#36755#33756#21517#36895#26597#30721
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 24
    Top = 16
    Width = 84
    Height = 12
    Caption = #35831#36873#25321#21416#24072#32534#21495
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object cxGrid1: TcxGrid
    Left = 128
    Top = 64
    Width = 481
    Height = 353
    TabOrder = 0
    object cxGrid1DBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = DataSource1
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnMoving = False
      OptionsCustomize.ColumnSorting = False
      OptionsView.GroupByBox = False
      object cxGrid1DBTableView1DBColumn1: TcxGridDBColumn
        DataBinding.FieldName = #26102#38388
        SortIndex = 0
        SortOrder = soAscending
        Width = 80
      end
      object cxGrid1DBTableView1DBColumn: TcxGridDBColumn
        DataBinding.FieldName = #21416#24072
        Options.Editing = False
        Width = 67
      end
      object cxGrid1DBTableView1DBColumn3: TcxGridDBColumn
        DataBinding.FieldName = #33756#21517
        Width = 94
      end
      object cxGrid1DBTableView1DBColumn4: TcxGridDBColumn
        DataBinding.FieldName = #25968#37327
        Width = 60
      end
      object cxGrid1DBTableView1Column1: TcxGridDBColumn
        DataBinding.FieldName = #21333#20215
        Width = 58
      end
      object cxGrid1DBTableView1DBColumn6: TcxGridDBColumn
        DataBinding.FieldName = #37329#39069
        Width = 87
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object DBLookupListBox1: TDBLookupListBox
    Left = 24
    Top = 32
    Width = 81
    Height = 124
    KeyField = #21416#24072#32534#21495
    ListField = #21416#24072#32534#21495
    ListSource = DataSource2
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 128
    Top = 16
    Width = 113
    Height = 41
    Caption = #37325#26032#35745#31639#37329#39069#20540
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
    Left = 128
    Top = 432
    Width = 75
    Height = 25
    Caption = #28155#21152#35760#24405
    TabOrder = 3
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 216
    Top = 432
    Width = 75
    Height = 25
    Caption = #25552#20132#20445#23384
    TabOrder = 4
    OnClick = BitBtn3Click
  end
  object BitBtn4: TBitBtn
    Left = 352
    Top = 432
    Width = 75
    Height = 25
    Caption = #21462#28040#20462#25913
    TabOrder = 5
    OnClick = BitBtn4Click
  end
  object BitBtn5: TBitBtn
    Left = 440
    Top = 432
    Width = 75
    Height = 25
    Caption = #21024#38500#35760#24405
    TabOrder = 6
    OnClick = BitBtn5Click
  end
  object BitBtn6: TBitBtn
    Left = 536
    Top = 432
    Width = 75
    Height = 25
    Caption = #36864#20986
    ModalResult = 9
    TabOrder = 7
  end
  object DBLookupListBox2: TDBLookupListBox
    Left = 24
    Top = 160
    Width = 81
    Height = 232
    KeyField = #33756#21697#21517#31216
    ListField = #33756#21697#21517#31216
    ListSource = DataSource3
    TabOrder = 8
    OnDblClick = DBLookupListBox2DblClick
  end
  object Edit1: TEdit
    Left = 24
    Top = 408
    Width = 81
    Height = 20
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    OnChange = Edit1Change
  end
  object BitBtn7: TBitBtn
    Left = 24
    Top = 432
    Width = 81
    Height = 25
    Caption = #28155#21152#33756#21697#36164#26009
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 10
    OnClick = BitBtn7Click
  end
  object ADOTable1: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    BeforePost = ADOTable1BeforePost
    IndexFieldNames = #21416#24072
    MasterFields = #21416#24072
    MasterSource = DataSource2
    TableName = #34920'1'
    Left = 152
    Top = 176
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 152
    Top = 224
  end
  object ADOTable2: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    IndexFieldNames = #21416#24072#32534#21495
    TableName = 'csbh'
    Left = 40
    Top = 40
  end
  object DataSource2: TDataSource
    DataSet = ADOTable2
    Left = 40
    Top = 72
  end
  object ADOTable3: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = #33756#21517
    Left = 56
    Top = 200
  end
  object DataSource3: TDataSource
    DataSet = ADOTable3
    Left = 56
    Top = 248
  end
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Left = 40
    Top = 112
  end
end
