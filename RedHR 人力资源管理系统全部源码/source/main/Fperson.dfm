object person: Tperson
  Left = 130
  Top = 55
  Width = 696
  Height = 480
  Caption = #20154#25165#38656#27714
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Splitter1: TSplitter
    Left = 0
    Top = 217
    Width = 688
    Height = 3
    Cursor = crVSplit
    Align = alTop
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 30
    Width = 688
    Height = 187
    Align = alTop
    PopupMenu = PopupMenu1
    TabOrder = 0
    LookAndFeel.Kind = lfUltraFlat
    object cxGrid1DBTableView1: TcxGridDBTableView
      OnDblClick = cxGrid1DBTableView1DblClick
      DataController.DataSource = r_personDataSource
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.KeyFieldNames = 'id'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      object cxGrid1DBTableView1DBColumn1: TcxGridDBColumn
        Caption = #26631#39064
        Options.Editing = False
        SortOrder = soAscending
        Width = 120
        DataBinding.FieldName = 'ptitle'
      end
      object cxGrid1DBTableView1DBColumn6: TcxGridDBColumn
        Caption = #21046#23450#26085#26399
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.ShowTime = False
        DataBinding.FieldName = 'indate'
      end
      object cxGrid1DBTableView1DBColumn2: TcxGridDBColumn
        Caption = #38656#27714#37096#38376
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'id'
        Properties.ListColumns = <
          item
            FieldName = 'branchname'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = r_staffbranchDataSource
        Options.Editing = False
        Width = 100
        DataBinding.FieldName = 'branchid'
      end
      object cxGrid1DBTableView1DBColumn3: TcxGridDBColumn
        Caption = #38656#27714#32844#20301
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'id'
        Properties.ListColumns = <
          item
            FieldName = 'postname'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = r_staffpostDataSource
        Options.Editing = False
        Width = 100
        DataBinding.FieldName = 'postid'
      end
      object cxGrid1DBTableView1DBColumn4: TcxGridDBColumn
        Caption = #20154#25165#31867#22411
        Options.Editing = False
        Width = 100
        DataBinding.FieldName = 'ptype'
      end
      object cxGrid1DBTableView1DBColumn5: TcxGridDBColumn
        Caption = #38656#27714#20154#25968
        Options.Editing = False
        DataBinding.FieldName = 'pcount'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 415
    Width = 688
    Height = 19
    Panels = <>
  end
  object cxGrid2: TcxGrid
    Left = 0
    Top = 220
    Width = 688
    Height = 195
    Align = alClient
    PopupMenu = PopupMenu2
    TabOrder = 2
    object cxGridDBTableView1: TcxGridDBTableView
      OnDblClick = cxGridDBTableView1DblClick
      DataController.DataSource = p_inpersonDataSource
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.KeyFieldNames = 'id'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      object cxGridDBTableView1DBColumn1: TcxGridDBColumn
        Caption = #22995#21517
        Width = 80
        DataBinding.FieldName = 'name'
      end
      object cxGridDBTableView1DBColumn2: TcxGridDBColumn
        Caption = #24615#21035
        Width = 35
        DataBinding.FieldName = 'sex'
      end
      object cxGridDBTableView1DBColumn3: TcxGridDBColumn
        Caption = #20986#29983#26085#26399
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.ShowTime = False
        Width = 60
        DataBinding.FieldName = 'birthday'
      end
      object cxGridDBTableView1DBColumn8: TcxGridDBColumn
        Caption = #23130#23035
        Width = 40
        DataBinding.FieldName = 'marriage'
      end
      object cxGridDBTableView1DBColumn4: TcxGridDBColumn
        Caption = #27665#26063
        Width = 35
        DataBinding.FieldName = 'nation'
      end
      object cxGridDBTableView1DBColumn5: TcxGridDBColumn
        Caption = #25919#27835#38754#30446
        Width = 45
        DataBinding.FieldName = 'pnut'
      end
      object cxGridDBTableView1DBColumn6: TcxGridDBColumn
        Caption = #26368#39640#23398#21382
        Width = 60
        DataBinding.FieldName = 'pknowledge'
      end
      object cxGridDBTableView1DBColumn7: TcxGridDBColumn
        Caption = #32852#31995#30005#35805
        Width = 120
        DataBinding.FieldName = 'tel'
      end
    end
    object cxGridLevel1: TcxGridLevel
      GridView = cxGridDBTableView1
    end
  end
  object ControlBar1: TControlBar
    Left = 0
    Top = 0
    Width = 688
    Height = 30
    Align = alTop
    AutoSize = True
    TabOrder = 3
    object ToolBar1: TToolBar
      Left = 11
      Top = 2
      Width = 102
      Height = 22
      Caption = 'ToolBar1'
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      Images = Main.ImageList1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object ToolButton1: TToolButton
        Left = 0
        Top = 0
        Hint = #21046#23450#26032#30340#20154#25165#38656#27714#35268#21010
        Caption = 'ToolButton1'
        ImageIndex = 422
        OnClick = N3Click
      end
      object ToolButton2: TToolButton
        Left = 23
        Top = 0
        Hint = #24212#32856#20154#21592#20449#24687#30331#35760
        Caption = 'ToolButton2'
        ImageIndex = 240
        OnClick = N6Click
      end
      object ToolButton3: TToolButton
        Left = 46
        Top = 0
        Width = 8
        Caption = 'ToolButton3'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object ToolButton4: TToolButton
        Left = 54
        Top = 0
        Hint = #21047#26032
        Caption = 'ToolButton4'
        ImageIndex = 61
        OnClick = N7Click
      end
      object ToolButton5: TToolButton
        Left = 77
        Top = 0
        Hint = #36864#20986
        Caption = 'ToolButton5'
        ImageIndex = 13
        OnClick = N9Click
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 24
    Top = 72
    object N1: TMenuItem
      Caption = #32534#36753
      object N3: TMenuItem
        Caption = #21046#23450#26032#35268#21010'...'
        OnClick = N3Click
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object N6: TMenuItem
        Caption = #24212#32856#20154#21592#20449#24687#30331#35760'...'
        OnClick = N6Click
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object N9: TMenuItem
        Caption = #36864#20986
        OnClick = N9Click
      end
    end
    object N2: TMenuItem
      Caption = #25968#25454
      object N7: TMenuItem
        Caption = #21047#26032'...'
        OnClick = N7Click
      end
      object N10: TMenuItem
        Caption = #26174#31034#20840#37096#24212#32856'...'
        OnClick = N10Click
      end
    end
  end
  object r_person: TADOTable
    Connection = Main.ADOconn
    TableName = 'r_person'
    Left = 64
    Top = 80
  end
  object r_personDataSource: TDataSource
    DataSet = r_person
    Left = 96
    Top = 104
  end
  object r_staffbranch: TADOTable
    Connection = Main.ADOconn
    IndexName = 'id'
    TableName = 'r_staffbranch'
    Left = 200
    Top = 104
  end
  object r_staffpost: TADOTable
    Connection = Main.ADOconn
    IndexName = 'id'
    TableName = 'r_staffpost'
    Left = 272
    Top = 104
  end
  object r_staffbranchDataSource: TDataSource
    DataSet = r_staffbranch
    Left = 192
    Top = 80
  end
  object r_staffpostDataSource: TDataSource
    DataSet = r_staffpost
    Left = 248
    Top = 64
  end
  object p_inperson: TADOTable
    Connection = Main.ADOconn
    IndexFieldNames = 'rpid'
    MasterFields = 'id'
    MasterSource = r_personDataSource
    TableName = 'p_inperson'
    Left = 80
    Top = 272
  end
  object p_inpersonDataSource: TDataSource
    DataSet = p_inperson
    Left = 128
    Top = 280
  end
  object PopupMenu1: TPopupMenu
    Left = 352
    Top = 48
    object N14: TMenuItem
      Caption = #22686#21152'...'
      OnClick = N3Click
    end
    object N11: TMenuItem
      Caption = #21024#38500'...'
      OnClick = N11Click
    end
    object N12: TMenuItem
      Caption = '-'
    end
    object N13: TMenuItem
      Caption = #32534#36753'...'
      OnClick = cxGrid1DBTableView1DblClick
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 288
    Top = 320
    object N15: TMenuItem
      Caption = #22686#21152'...'
      OnClick = N6Click
    end
    object N16: TMenuItem
      Caption = #21024#38500'...'
      OnClick = N16Click
    end
    object N17: TMenuItem
      Caption = '-'
    end
    object N18: TMenuItem
      Caption = #32534#36753'...'
      OnClick = cxGridDBTableView1DblClick
    end
  end
  object ADOTable1: TADOTable
    Connection = Main.ADOconn
    TableName = 'p_inperson'
    Left = 240
    Top = 280
  end
end
