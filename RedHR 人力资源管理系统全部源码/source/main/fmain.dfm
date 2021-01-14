object Main: TMain
  Left = 186
  Top = 148
  Width = 783
  Height = 516
  Caption = 'RedHR-Office'#20154#21147#36164#28304#31649#29702#31995#32479
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object StatusBar1: TStatusBar
    Left = 0
    Top = 451
    Width = 775
    Height = 19
    Panels = <
      item
        Alignment = taCenter
        Text = 'RedTools Software'
        Width = 160
      end
      item
        Width = 50
      end
      item
        Width = 50
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 56
    Width = 775
    Height = 395
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object Splitter1: TSplitter
      Left = 161
      Top = 0
      Height = 395
      OnMoved = Splitter1Moved
    end
    object dxDBTreeView1: TdxDBTreeView
      Left = 0
      Top = 0
      Width = 161
      Height = 395
      ShowNodeHint = True
      DataSource = BranchSource
      DisplayField = 'branchname'
      KeyField = 'id'
      ListField = 'branchname'
      ParentField = 'pid'
      SeparatedSt = ' - '
      RaiseOnError = True
      Indent = 19
      Align = alLeft
      Color = clWhite
      ParentColor = False
      Options = [trDBConfirmDelete, trCanDBNavigate, trSmartRecordCopy, trCheckHasChildren]
      SelectedIndex = -1
      TabOrder = 0
      OnClick = dxDBTreeView1Click
      OnMouseDown = dxDBTreeView1MouseDown
      OnDblClick = N41Click
      PopupMenu = PopupMenu2
      ParentShowHint = False
      ShowHint = True
      StateImages = ImageList1
    end
    object Panel2: TPanel
      Left = 164
      Top = 0
      Width = 611
      Height = 395
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object Splitter2: TSplitter
        Left = 0
        Top = 189
        Width = 611
        Height = 3
        Cursor = crVSplit
        Align = alBottom
      end
      object cxGrid1: TcxGrid
        Left = 0
        Top = 0
        Width = 611
        Height = 189
        Align = alClient
        PopupMenu = PopupMenu1
        TabOrder = 0
        OnClick = cxGrid1Click
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = True
        object cxGrid1DBTableView1: TcxGridDBTableView
          OnDblClick = N29Click
          OnKeyPress = cxGrid1DBTableView1KeyPress
          OnMouseDown = cxGrid1DBTableView1MouseDown
          DataController.DataSource = staffsource
          DataController.Filter.Criteria = {FFFFFFFF0000000000}
          DataController.KeyFieldNames = 'r_staffinfo.id'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OnCellClick = cxGrid1DBTableView1CellClick
          OnEditing = cxGrid1DBTableView1Editing
          OnEditChanged = cxGrid1DBTableView1EditChanged
          OnSelectionChanged = cxGrid1DBTableView1SelectionChanged
          OptionsCustomize.ColumnFiltering = False
          OptionsData.Editing = False
          OptionsSelection.CellSelect = False
          OptionsView.ColumnAutoWidth = True
          Styles.Background = cxStyle2
          Styles.StyleSheet = GridTableViewStyleSheetDevExpress
          Styles.Content = cxStyle2
          Styles.ContentEven = cxStyle2
          Styles.ContentOdd = cxStyle2
          Styles.Inactive = cxStyle4
          Styles.IncSearch = cxStyle2
          Styles.Selection = cxStyle9
          Styles.FilterBox = cxStyle14
          Styles.Group = cxStyle7
          Styles.GroupByBox = cxStyle18
          Styles.Header = cxStyle26
          Styles.Indicator = cxStyle4
          Styles.Preview = cxStyle2
          object cxGrid1DBTableView1DBColumn1: TcxGridDBColumn
            Caption = #22995#21517
            Width = 58
            DataBinding.FieldName = 'name'
          end
          object cxGrid1DBTableView1DBColumn2: TcxGridDBColumn
            Caption = #24615#21035
            Width = 46
            DataBinding.FieldName = 'sex'
          end
          object cxGrid1DBTableView1DBColumn6: TcxGridDBColumn
            Caption = #31821#36143
            SortOrder = soAscending
            Width = 60
            DataBinding.FieldName = 'Nativeplace'
          end
          object cxGrid1DBTableView1DBColumn7: TcxGridDBColumn
            Caption = #27665#26063
            Width = 46
            DataBinding.FieldName = 'Nationality'
          end
          object cxGrid1DBTableView1DBColumn9: TcxGridDBColumn
            Caption = #23398#21382
            Width = 50
            DataBinding.FieldName = 'knowledge'
          end
          object cxGrid1DBTableView1DBColumn4: TcxGridDBColumn
            Caption = #32852#31995#30005#35805
            Width = 78
            DataBinding.FieldName = 'Telephone'
          end
          object cxGrid1DBTableView1DBColumn5: TcxGridDBColumn
            Caption = #20837#32844#26085#26399
            PropertiesClassName = 'TcxDateEditProperties'
            Properties.ShowTime = False
            Width = 52
            DataBinding.FieldName = 'intime'
          end
          object cxGrid1DBTableView1DBColumn3: TcxGridDBColumn
            Caption = #32844#24037#31867#22411
            Width = 63
            DataBinding.FieldName = 'classcodename'
          end
          object cxGrid1DBTableView1DBColumn8: TcxGridDBColumn
            Caption = #30005#23376#37038#20214
            Width = 126
            DataBinding.FieldName = 'Email'
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxGrid1DBTableView1
        end
      end
      object PageControl1: TPageControl
        Left = 0
        Top = 192
        Width = 611
        Height = 203
        ActivePage = TabSheet2
        Align = alBottom
        TabOrder = 1
        object TabSheet1: TTabSheet
          Caption = #32844#20301#21464#21160
          object cxGrid2: TcxGrid
            Left = 0
            Top = 0
            Width = 603
            Height = 176
            Align = alClient
            PopupMenu = PopupMenu3
            TabOrder = 0
            LookAndFeel.Kind = lfFlat
            object cxGrid2DBTableView1: TcxGridDBTableView
              OnDblClick = N44Click
              DataController.DataSource = stachposteditSource
              DataController.Filter.Criteria = {FFFFFFFF0000000000}
              DataController.KeyFieldNames = 'id'
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsCustomize.ColumnFiltering = False
              OptionsSelection.CellSelect = False
              OptionsView.ColumnAutoWidth = True
              OptionsView.GroupByBox = False
              object cxGrid2DBTableView1DBColumn1: TcxGridDBColumn
                Caption = #32844#20301#21517#31216
                PropertiesClassName = 'TcxLookupComboBoxProperties'
                Properties.KeyFieldNames = 'id'
                Properties.ListColumns = <
                  item
                    FieldName = 'postname'
                  end>
                Properties.ListSource = r_staffpostSource
                Options.Editing = False
                SortOrder = soAscending
                Width = 100
                DataBinding.FieldName = 'postid'
              end
              object cxGrid2DBTableView1DBColumn3: TcxGridDBColumn
                Caption = #25191#34892#26085#26399
                PropertiesClassName = 'TcxDateEditProperties'
                Properties.ShowTime = False
                DataBinding.FieldName = 'postdate'
              end
              object cxGrid2DBTableView1DBColumn2: TcxGridDBColumn
                Caption = #23601#32844#35828#26126
                Options.Editing = False
                Width = 300
                DataBinding.FieldName = 'memo'
              end
            end
            object cxGrid2Level1: TcxGridLevel
              GridView = cxGrid2DBTableView1
            end
          end
        end
        object TabSheet7: TTabSheet
          Caption = #37096#38376#21464#21160
          ImageIndex = 6
          object cxGrid3: TcxGrid
            Left = 0
            Top = 0
            Width = 603
            Height = 176
            Align = alClient
            PopupMenu = PopupMenu4
            TabOrder = 0
            LookAndFeel.Kind = lfFlat
            object cxGrid3DBTableView1: TcxGridDBTableView
              DataController.DataSource = brancheditsource
              DataController.Filter.Criteria = {FFFFFFFF0000000000}
              DataController.KeyFieldNames = 'id'
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsCustomize.ColumnFiltering = False
              OptionsData.Editing = False
              OptionsSelection.CellSelect = False
              OptionsView.ColumnAutoWidth = True
              OptionsView.GroupByBox = False
              object cxGrid3DBTableView1DBColumn1: TcxGridDBColumn
                Caption = #25152#22312#37096#38376
                PropertiesClassName = 'TcxLookupComboBoxProperties'
                Properties.KeyFieldNames = 'id'
                Properties.ListColumns = <
                  item
                    FieldName = 'branchname'
                  end>
                Properties.ListSource = BranchSource
                SortOrder = soAscending
                Width = 100
                DataBinding.FieldName = 'branchid'
              end
              object cxGrid3DBTableView1DBColumn3: TcxGridDBColumn
                Caption = #25191#34892#26085#26399
                PropertiesClassName = 'TcxDateEditProperties'
                Properties.ShowTime = False
                DataBinding.FieldName = 'indate'
              end
              object cxGrid3DBTableView1DBColumn2: TcxGridDBColumn
                Caption = #21464#21160#35828#26126
                Width = 300
                DataBinding.FieldName = 'memo'
              end
            end
            object cxGrid3Level1: TcxGridLevel
              GridView = cxGrid3DBTableView1
            end
          end
        end
        object TabSheet5: TTabSheet
          Caption = #34218#36164#31119#21033
          ImageIndex = 4
          object cxGrid5: TcxGrid
            Left = 0
            Top = 0
            Width = 603
            Height = 176
            Align = alClient
            PopupMenu = PopupMenu6
            TabOrder = 0
            LookAndFeel.Kind = lfFlat
            object cxGrid5DBTableView1: TcxGridDBTableView
              OnDblClick = cxGrid5DBTableView1DblClick
              DataController.DataSource = r_staffpaySource
              DataController.Filter.Criteria = {FFFFFFFF0000000000}
              DataController.KeyFieldNames = 'id'
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsCustomize.ColumnFiltering = False
              OptionsData.Editing = False
              OptionsSelection.CellSelect = False
              OptionsView.ColumnAutoWidth = True
              OptionsView.GroupByBox = False
              object cxGrid5DBTableView1DBColumn1: TcxGridDBColumn
                Caption = #31867#21035#21517#31216
                SortOrder = soDescending
                Width = 100
                DataBinding.FieldName = 'paytype'
              end
              object cxGrid5DBTableView1DBColumn2: TcxGridDBColumn
                Caption = #31867#21035#31867#22411
                Width = 80
                DataBinding.FieldName = 'payedit'
              end
              object cxGrid5DBTableView1DBColumn3: TcxGridDBColumn
                Caption = #31867#21035#37329#39069
                PropertiesClassName = 'TcxCurrencyEditProperties'
                DataBinding.FieldName = 'payfloat'
              end
              object cxGrid5DBTableView1DBColumn4: TcxGridDBColumn
                Caption = #26159#21542#25353'%'#35745#31639
                Width = 80
                DataBinding.FieldName = 'ifpercent'
              end
              object cxGrid5DBTableView1DBColumn5: TcxGridDBColumn
                Caption = #36215#22987#26085#26399
                PropertiesClassName = 'TcxDateEditProperties'
                Properties.ShowTime = False
                DataBinding.FieldName = 'pstardate'
              end
              object cxGrid5DBTableView1DBColumn6: TcxGridDBColumn
                Caption = #32467#26463#26085#26399
                PropertiesClassName = 'TcxDateEditProperties'
                Properties.ShowTime = False
                DataBinding.FieldName = 'penddate'
              end
              object cxGrid5DBTableView1DBColumn7: TcxGridDBColumn
                Caption = #35745#31639#35268#21017
                PropertiesClassName = 'TcxImageComboBoxProperties'
                Properties.Items = <
                  item
                    Description = #23567#26102
                    Value = '1'
                  end
                  item
                    Description = #22825
                    Value = '2'
                  end
                  item
                    Description = #26376
                    Value = '3'
                  end
                  item
                    Description = #24180
                    Value = '4'
                  end>
                DataBinding.FieldName = 'accounttype'
              end
            end
            object cxGrid5Level1: TcxGridLevel
              GridView = cxGrid5DBTableView1
            end
          end
        end
        object TabSheet2: TTabSheet
          Caption = #21512#21516#21327#35758
          ImageIndex = 5
          object cxGrid8: TcxGrid
            Left = 0
            Top = 0
            Width = 603
            Height = 176
            Align = alClient
            PopupMenu = PopupMenu9
            TabOrder = 0
            LookAndFeel.Kind = lfFlat
            object cxGrid8DBTableView1: TcxGridDBTableView
              OnDblClick = cxGrid8DBTableView1DblClick
              DataController.DataSource = r_staffcontractDataSource
              DataController.Filter.Criteria = {FFFFFFFF0000000000}
              DataController.KeyFieldNames = 'id'
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsCustomize.ColumnFiltering = False
              OptionsSelection.CellSelect = False
              OptionsView.ColumnAutoWidth = True
              OptionsView.GroupByBox = False
              object cxGrid8DBTableView1DBColumn1: TcxGridDBColumn
                Caption = #21512#21516#21517#31216
                Options.Editing = False
                SortOrder = soAscending
                Width = 120
                DataBinding.FieldName = 'cname'
              end
              object cxGrid8DBTableView1DBColumn2: TcxGridDBColumn
                Caption = #36215#22987#26085#26399
                PropertiesClassName = 'TcxDateEditProperties'
                Properties.ShowTime = False
                Width = 80
                DataBinding.FieldName = 'cstartdate'
              end
              object cxGrid8DBTableView1DBColumn3: TcxGridDBColumn
                Caption = #32467#26463#26085#26399
                PropertiesClassName = 'TcxDateEditProperties'
                Properties.ShowTime = False
                Width = 80
                DataBinding.FieldName = 'cenddate'
              end
            end
            object cxGrid8Level1: TcxGridLevel
              GridView = cxGrid8DBTableView1
            end
          end
        end
        object TabSheet3: TTabSheet
          Caption = #39046#29992#35760#24405
          ImageIndex = 6
          object cxGrid9: TcxGrid
            Left = 0
            Top = 0
            Width = 603
            Height = 176
            Align = alClient
            PopupMenu = PopupMenu10
            TabOrder = 0
            LookAndFeel.Kind = lfFlat
            object cxGrid9DBTableView1: TcxGridDBTableView
              OnDblClick = N143Click
              DataController.DataSource = p_w_toolsSource
              DataController.Filter.Criteria = {FFFFFFFF0000000000}
              DataController.KeyFieldNames = 'id'
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsCustomize.ColumnFiltering = False
              OptionsSelection.CellSelect = False
              OptionsView.ColumnAutoWidth = True
              OptionsView.GroupByBox = False
              object cxGrid9DBTableView1DBColumn1: TcxGridDBColumn
                Caption = #29992#21697#21517#31216
                PropertiesClassName = 'TcxLookupComboBoxProperties'
                Properties.KeyFieldNames = 'id'
                Properties.ListColumns = <
                  item
                    FieldName = 'w_name'
                  end>
                Properties.ListSource = w_toolsSource
                Options.Editing = False
                Width = 120
                DataBinding.FieldName = 'w_id'
              end
              object cxGrid9DBTableView1DBColumn2: TcxGridDBColumn
                Caption = #39046#29992#26102#38388
                Options.Editing = False
                Width = 80
                DataBinding.FieldName = 'u_Date'
              end
              object cxGrid9DBTableView1DBColumn3: TcxGridDBColumn
                Caption = #25968#37327
                Options.Editing = False
                Width = 40
                DataBinding.FieldName = 'u_account'
              end
            end
            object cxGrid9Level1: TcxGridLevel
              GridView = cxGrid9DBTableView1
            end
          end
        end
        object TabSheet6: TTabSheet
          Caption = #22521#35757#35760#24405
          ImageIndex = 7
          object cxGrid7: TcxGrid
            Left = 0
            Top = 0
            Width = 603
            Height = 176
            Align = alClient
            PopupMenu = PopupMenu8
            TabOrder = 0
            LookAndFeel.Kind = lfFlat
            object cxGrid7DBTableView1: TcxGridDBTableView
              DataController.DataSource = r_staffteachidDataSource
              DataController.Filter.Criteria = {FFFFFFFF0000000000}
              DataController.KeyFieldNames = 'id'
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsCustomize.ColumnFiltering = False
              OptionsView.ColumnAutoWidth = True
              OptionsView.GroupByBox = False
              object cxGrid7DBTableView1DBColumn1: TcxGridDBColumn
                Caption = #22521#35757#21517#31216
                PropertiesClassName = 'TcxLookupComboBoxProperties'
                Properties.KeyFieldNames = 'id'
                Properties.ListColumns = <
                  item
                    FieldName = 'teachname'
                  end>
                Properties.ListSource = r_staffteachDataSource
                Options.Editing = False
                Width = 80
                DataBinding.FieldName = 'teachid'
              end
              object cxGrid7DBTableView1DBColumn2: TcxGridDBColumn
                Caption = #22521#35757#25104#32489
                PropertiesClassName = 'TcxComboBoxProperties'
                Properties.Items.Strings = (
                  #20248#31168
                  #21512#26684
                  #33391#22909
                  #24046)
                Width = 80
                DataBinding.FieldName = 'teachresult'
              end
              object cxGrid7DBTableView1DBColumn3: TcxGridDBColumn
                Caption = #22791#27880
                PropertiesClassName = 'TcxMemoProperties'
                Properties.ReadOnly = False
                Properties.ScrollBars = ssBoth
                SortOrder = soAscending
                Width = 300
                DataBinding.FieldName = 'memo'
              end
            end
            object cxGrid7Level1: TcxGridLevel
              GridView = cxGrid7DBTableView1
            end
          end
          object Agent1: TAgent
            Left = 248
            Top = 64
            Width = 32
            Height = 32
            ControlData = {020200004F0300004F030000}
          end
        end
        object TabSheet4: TTabSheet
          Caption = #22270#29255#36164#26009
          ImageIndex = 3
          object Splitter3: TSplitter
            Left = 381
            Top = 0
            Height = 176
            Align = alRight
          end
          object cxGrid4: TcxGrid
            Left = 0
            Top = 0
            Width = 381
            Height = 176
            Align = alClient
            PopupMenu = PopupMenu5
            TabOrder = 0
            LookAndFeel.Kind = lfFlat
            object cxGrid4DBTableView1: TcxGridDBTableView
              DataController.DataSource = r_staffpictSource
              DataController.DetailKeyFieldNames = 'memo'
              DataController.Filter.Criteria = {FFFFFFFF0000000000}
              DataController.KeyFieldNames = 'id'
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsCustomize.ColumnFiltering = False
              OptionsView.ColumnAutoWidth = True
              OptionsView.GroupByBox = False
              object cxGrid4DBTableView1DBColumn1: TcxGridDBColumn
                Caption = #22270#29255#35828#26126
                SortOrder = soAscending
                Width = 300
                DataBinding.FieldName = 'memo'
              end
            end
            object cxGrid4Level1: TcxGridLevel
              GridView = cxGrid4DBTableView1
            end
          end
          object DBImage1: TDBImage
            Left = 384
            Top = 0
            Width = 219
            Height = 176
            Align = alRight
            DataField = 'pict'
            DataSource = r_staffpictSource
            Font.Charset = GB2312_CHARSET
            Font.Color = clWhite
            Font.Height = -12
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
            Stretch = True
            TabOrder = 1
            OnDblClick = DBImage1DblClick
          end
        end
        object TabSheet8: TTabSheet
          Caption = #33258#23450#20041
          ImageIndex = 7
          object cxSpreadSheetBook1: TcxSpreadSheetBook
            Left = 0
            Top = 0
            Width = 603
            Height = 176
            Align = alClient
            DefaultStyle.Brush.BackgroundColor = 57
            DefaultStyle.Brush.ForegroundColor = 57
            DefaultStyle.Font.Name = #23435#20307
            DefaultStyle.Font.Size = 9
            DefaultStyle.Font.Charset = GB2312_CHARSET
            DefaultStyle.Format = 34
            HeaderFont.Charset = GB2312_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -12
            HeaderFont.Name = #23435#20307
            HeaderFont.Style = []
            PopupMenu = sheetpopup
            RowHeaderWidth = 35
            OnActiveSheetChanging = cxSpreadSheetBook1ActiveSheetChanging
            OnClick = cxSpreadSheetBook1Click
          end
        end
        object TabSheet9: TTabSheet
          Caption = #26410#23450#20041#25968#25454
          ImageIndex = 8
          object cxGrid6: TcxGrid
            Left = 0
            Top = 0
            Width = 603
            Height = 176
            Align = alClient
            PopupMenu = PopupMenu7
            TabOrder = 0
            LookAndFeel.Kind = lfFlat
            object cxGridDBTableView1: TcxGridDBTableView
              OnDblClick = cxGridDBTableView1DblClick
              DataController.DataSource = nosetdatasource
              DataController.Filter.Criteria = {FFFFFFFF0000000000}
              DataController.KeyFieldNames = 'id'
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsCustomize.ColumnFiltering = False
              OptionsData.Editing = False
              OptionsSelection.CellSelect = False
              OptionsView.ColumnAutoWidth = True
              OptionsView.GroupByBox = False
              OptionsView.GroupFooters = gfAlwaysVisible
              object cxGridDBColumn1: TcxGridDBColumn
                Caption = #22995#21517
                SortOrder = soAscending
                Width = 58
                DataBinding.FieldName = 'name'
              end
              object cxGridDBColumn2: TcxGridDBColumn
                Caption = #24615#21035
                Width = 46
                DataBinding.FieldName = 'sex'
              end
              object cxGridDBColumn6: TcxGridDBColumn
                Caption = #32852#31995#30005#35805
                Width = 78
                DataBinding.FieldName = 'Telephone'
              end
              object cxGridDBColumn7: TcxGridDBColumn
                Caption = #20837#32844#26085#26399
                PropertiesClassName = 'TcxDateEditProperties'
                Properties.ShowTime = False
                Width = 52
                DataBinding.FieldName = 'intime'
              end
              object cxGridDBColumn9: TcxGridDBColumn
                Caption = #30005#23376#37038#20214
                Width = 126
                DataBinding.FieldName = 'Email'
              end
            end
            object cxGridLevel1: TcxGridLevel
              GridView = cxGridDBTableView1
            end
          end
        end
      end
    end
  end
  object cbMain: TControlBar
    Left = 0
    Top = 0
    Width = 775
    Height = 56
    Align = alTop
    AutoSize = True
    DockSite = False
    PopupMenu = TMenu
    TabOrder = 2
    object tbsStandart: TToolBar
      Left = 11
      Top = 2
      Width = 174
      Height = 22
      AutoSize = True
      Caption = #25991#20214
      DragKind = dkDock
      EdgeBorders = []
      Flat = True
      Images = imgStandart
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object tbsNew: TToolButton
        Left = 0
        Top = 0
        Hint = #24314#31435#26032#30340#25968#25454#25991#20214
        Action = actNew
      end
      object tbsOpen: TToolButton
        Tag = 1
        Left = 23
        Top = 0
        Hint = #20174#36873#25321#30340#32844#24037#25968#25454#35835#20837'...'
        Caption = '&Open SpreadSheet'
        DropdownMenu = sheetopen
        ImageIndex = 1
        Style = tbsDropDown
        OnClick = N60Click
      end
      object tbsSave: TToolButton
        Tag = 2
        Left = 59
        Top = 0
        Hint = #21478#23384#20026'...'
        Action = actSaveSpeadSheet
        DropdownMenu = cxsave
        Style = tbsDropDown
      end
      object ToolButton20: TToolButton
        Left = 95
        Top = 0
        Width = 8
        Caption = 'ToolButton7'
        ImageIndex = 3
        Style = tbsSeparator
      end
      object tbsCut: TToolButton
        Tag = 3
        Left = 103
        Top = 0
        Action = actCut
      end
      object tbsCopy: TToolButton
        Tag = 2
        Left = 126
        Top = 0
        Action = actCopy
      end
      object tbsPaste: TToolButton
        Tag = 4
        Left = 149
        Top = 0
        Action = actPaste
      end
    end
    object tlbHistory: TToolBar
      Left = 198
      Top = 2
      Width = 52
      Height = 22
      Caption = #21382#21490#35760#24405
      DragKind = dkDock
      DragMode = dmAutomatic
      EdgeBorders = []
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      Images = imgHistory
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      object tbUndo: TToolButton
        Left = 0
        Top = 0
        Hint = #25764#28040
        Caption = 'actUndo'
        ImageIndex = 0
        OnClick = tbUndoClick
      end
      object ToolButton21: TToolButton
        Left = 23
        Top = 0
        Hint = #37325#22797
        Caption = 'actRedo'
        ImageIndex = 1
        OnClick = ToolButton21Click
      end
    end
    object ToolBar1: TToolBar
      Left = 263
      Top = 2
      Width = 370
      Height = 22
      Caption = #25968#25454
      Customizable = True
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      Images = ImageList1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      object ToolButton1: TToolButton
        Left = 0
        Top = 0
        Hint = #22791#20221#25968#25454#24211
        ImageIndex = 66
        ParentShowHint = False
        ShowHint = True
        OnClick = N2Click
      end
      object ToolButton2: TToolButton
        Left = 23
        Top = 0
        Hint = #20844#21496#20449#24687
        Caption = 'ToolButton2'
        ImageIndex = 1
        ParentShowHint = False
        ShowHint = True
        OnClick = N20Click
      end
      object ToolButton5: TToolButton
        Left = 46
        Top = 0
        Hint = #21047#26032'...'
        Caption = 'ToolButton5'
        ImageIndex = 61
        OnClick = ToolButton5Click
      end
      object ToolButton7: TToolButton
        Left = 69
        Top = 0
        Hint = #31614#35746#21512#21516'/'#21327#35758
        Caption = 'ToolButton7'
        ImageIndex = 100
        OnClick = ToolButton7Click
      end
      object ToolButton3: TToolButton
        Left = 92
        Top = 0
        Width = 8
        Caption = 'ToolButton3'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object ToolButton4: TToolButton
        Left = 100
        Top = 0
        Hint = #35774#32622#25171#21360#26426
        Caption = 'ToolButton4'
        ImageIndex = 71
        OnClick = N5Click
      end
      object ToolButton8: TToolButton
        Left = 123
        Top = 0
        Width = 8
        Caption = 'ToolButton8'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object cxTextEdit1: TcxTextEdit
        Left = 131
        Top = 1
        Width = 127
        Height = 20
        Style.LookAndFeel.Kind = lfFlat
        TabOrder = 0
        OnKeyPress = cxTextEdit1KeyPress
      end
      object ToolButton9: TToolButton
        Left = 258
        Top = 0
        Caption = 'ToolButton9'
        ImageIndex = 280
        OnClick = ToolButton9Click
      end
      object ToolButton10: TToolButton
        Left = 281
        Top = 0
        Width = 8
        Caption = 'ToolButton10'
        ImageIndex = 281
        Style = tbsSeparator
      end
      object ToolButton13: TToolButton
        Left = 289
        Top = 0
        Caption = 'ToolButton13'
        ImageIndex = 283
        OnClick = N48Click
      end
      object ToolButton6: TToolButton
        Left = 312
        Top = 0
        Hint = #36825#26159#20160#20040#65311
        Caption = 'ToolButton6'
        ImageIndex = 57
        Style = tbsCheck
        OnClick = ToolButton6Click
      end
      object ToolButton14: TToolButton
        Left = 335
        Top = 0
        Width = 8
        Caption = 'ToolButton14'
        ImageIndex = 284
        Style = tbsSeparator
      end
      object ToolButton19: TToolButton
        Left = 343
        Top = 0
        Caption = 'ToolButton19'
        ImageIndex = 74
        OnClick = N26Click
      end
    end
    object tbsFormatting: TToolBar
      Left = 11
      Top = 28
      Width = 537
      Height = 22
      ButtonHeight = 23
      ButtonWidth = 24
      Caption = #26684#24335
      DragKind = dkDock
      EdgeBorders = []
      Flat = True
      Images = imgFormatting
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      object cbxFont: TComboBox
        Left = 0
        Top = 1
        Width = 132
        Height = 20
        ItemHeight = 12
        TabOrder = 0
        OnChange = cbxFontChange
      end
      object cbxSize: TComboBox
        Left = 132
        Top = 1
        Width = 44
        Height = 20
        ItemHeight = 12
        TabOrder = 1
        OnChange = cbxSizeChange
        Items.Strings = (
          '8'
          '9'
          '10'
          '11'
          '12'
          '14'
          '16'
          '18'
          '20 '
          '22'
          '24'
          '26'
          '28'
          '36'
          '48'
          '72')
      end
      object ToolButton15: TToolButton
        Left = 176
        Top = 0
        Width = 8
        Caption = 'ToolButton9'
        ImageIndex = 7
        Style = tbsSeparator
      end
      object tbLeftAlign: TToolButton
        Left = 184
        Top = 0
        Hint = #24038#23545#40784
        Action = actCellLeftAlign
        Grouped = True
        Style = tbsCheck
      end
      object tbCenterAlign: TToolButton
        Tag = 1
        Left = 208
        Top = 0
        Hint = #23621#20013
        Action = actCellCenterAlign
        Grouped = True
        Style = tbsCheck
      end
      object tbRightAlign: TToolButton
        Tag = 2
        Left = 232
        Top = 0
        Hint = #21491#23545#40784
        Action = actCellRightAlign
        Grouped = True
        Style = tbsCheck
      end
      object ToolButton16: TToolButton
        Left = 256
        Top = 0
        Width = 8
        Caption = 'ToolButton10'
        ImageIndex = 8
        Style = tbsSeparator
      end
      object tbBold: TToolButton
        Tag = 3
        Left = 264
        Top = 0
        Hint = #31895#20307
        Action = actBold
        Style = tbsCheck
      end
      object tbItalic: TToolButton
        Tag = 4
        Left = 288
        Top = 0
        Hint = #26012#20307
        Action = actItalic
        Style = tbsCheck
      end
      object tbUnderline: TToolButton
        Tag = 5
        Left = 312
        Top = 0
        Hint = #19979#21010#32447
        Action = actUnderline
        Style = tbsCheck
      end
      object tbStrikeOut: TToolButton
        Tag = 6
        Left = 336
        Top = 0
        Hint = #21024#38500#32447
        Action = actStrikeOut
        Style = tbsCheck
      end
      object ToolButton17: TToolButton
        Left = 360
        Top = 0
        Width = 8
        Caption = 'ToolButton11'
        ImageIndex = 9
        Style = tbsSeparator
      end
      object ColorBox1: TColorBox
        Left = 368
        Top = 0
        Width = 39
        Height = 22
        DefaultColorColor = clWhite
        NoneColorColor = clWhite
        Selected = clWhite
        ItemHeight = 16
        TabOrder = 2
        OnChange = ColorBox1Change
      end
      object tbMerge: TToolButton
        Tag = 7
        Left = 407
        Top = 0
        Hint = #21512#24182#21333#20803#26684
        Action = actMergeCells
      end
      object tgSplit: TToolButton
        Tag = 8
        Left = 431
        Top = 0
        Hint = #25286#20998#21333#20803#26684
        Action = actSplitCells
      end
      object ToolButton18: TToolButton
        Left = 455
        Top = 0
        Width = 8
        Caption = 'ToolButton16'
        ImageIndex = 11
        Style = tbsSeparator
      end
      object tbSummary: TToolButton
        Left = 463
        Top = 0
        Action = actSum
        DropdownMenu = pmSummary
        Style = tbsDropDown
      end
      object tbBorderStyle: TToolButton
        Left = 500
        Top = 0
        Hint = #36793#26694
        Caption = 'tbBorderStyle'
        DropdownMenu = pmBorders
        ImageIndex = 12
        Style = tbsDropDown
        OnClick = tbBorderStyleClick
      end
    end
  end
  object ADOconn: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=D:\HH\MyExe\RedHr\e' +
      'xe\tmp.MDB;Persist Security Info=False'
    KeepConnection = False
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 8
    Top = 72
  end
  object MainMenu1: TMainMenu
    Images = ImageList1
    Left = 128
    Top = 80
    object N98: TMenuItem
      Caption = #25991#20214
      object N99: TMenuItem
        Action = actNew
        Caption = #26032#24314'...'
        ImageIndex = 36
      end
      object N1: TMenuItem
        Caption = #26032#24314#27169#29256#25991#20214'...'
        OnClick = N1Click
      end
      object N100: TMenuItem
        Caption = #25171#24320'...'
        Hint = 'Open Spread Sheet'
        ImageIndex = 72
        ShortCut = 16463
        OnClick = N89Click
      end
      object N102: TMenuItem
        Caption = '-'
      end
      object N103: TMenuItem
        Action = actSaveSpeadSheet
        Caption = #20445#23384'...'
        ImageIndex = 34
      end
      object N2: TMenuItem
        Caption = #22791#20221#25968#25454#24211'...'
        ImageIndex = 66
        ShortCut = 16507
        OnClick = N2Click
      end
      object N104: TMenuItem
        Caption = '-'
      end
      object N5: TMenuItem
        Caption = #35774#32622#25171#21360#26426'...'
        ImageIndex = 71
        OnClick = N5Click
      end
      object N152: TMenuItem
        Caption = #25171#21360#39044#35272
        ImageIndex = 70
        OnClick = N152Click
      end
      object N105: TMenuItem
        Caption = '-'
      end
      object N7: TMenuItem
        Caption = #36864#20986'...'
        ImageIndex = 13
        OnClick = N7Click
      end
    end
    object N13: TMenuItem
      Caption = #32534#36753
      object N92: TMenuItem
        Caption = #25764#28040'...'
        ImageIndex = 478
        ShortCut = 16474
        OnClick = N69Click
      end
      object N93: TMenuItem
        Caption = #37325#22797'...'
        ImageIndex = 388
        ShortCut = 49242
        OnClick = N70Click
      end
      object N94: TMenuItem
        Caption = '-'
      end
      object N95: TMenuItem
        Caption = #21098#20999'...'
        ImageIndex = 134
        ShortCut = 16472
        OnClick = N61Click
      end
      object N96: TMenuItem
        Caption = #22797#21046'...'
        ImageIndex = 161
        ShortCut = 16451
        OnClick = N62Click
      end
      object N97: TMenuItem
        Caption = #31896#36148'...'
        ImageIndex = 335
        ShortCut = 16470
        OnClick = N63Click
      end
      object N15: TMenuItem
        Caption = '-'
      end
      object N126: TMenuItem
        Caption = #26597#35810'...'
        ImageIndex = 64
        OnClick = N126Click
      end
      object N18: TMenuItem
        Caption = #21047#26032'...'
        ImageIndex = 61
        ShortCut = 116
        OnClick = ToolButton5Click
      end
      object N106: TMenuItem
        Caption = '-'
      end
      object N155: TMenuItem
        Caption = #21024#38500
        object N153: TMenuItem
          Caption = #21024#38500#39029'...'
          OnClick = N153Click
        end
        object N157: TMenuItem
          Caption = '-'
        end
        object N156: TMenuItem
          Caption = #25972#34892'...'
          OnClick = N156Click
        end
        object N158: TMenuItem
          Caption = #25972#21015'...'
          OnClick = N158Click
        end
      end
    end
    object N66: TMenuItem
      Caption = #25554#20837
      object N72: TMenuItem
        Caption = #34920#26684#39029'...'
        ImageIndex = 217
        ShortCut = 49240
        OnClick = N72Click
      end
      object N75: TMenuItem
        Caption = '-'
      end
      object N73: TMenuItem
        Caption = #34892'...'
        OnClick = N73Click
      end
      object N74: TMenuItem
        Caption = #21015'...'
        OnClick = N74Click
      end
      object N76: TMenuItem
        Caption = #21333#20803#26684'...'
        object N77: TMenuItem
          Caption = #24038#26684'...'
          OnClick = N77Click
        end
        object N78: TMenuItem
          Caption = #19978#26684'...'
          OnClick = N78Click
        end
        object N80: TMenuItem
          Caption = '-'
        end
        object N79: TMenuItem
          Caption = #20174#19978#25554#20837#25972#34892'...'
          OnClick = N79Click
        end
      end
      object N154: TMenuItem
        Caption = '-'
      end
      object N160: TMenuItem
        Caption = #26085#26399#21644#26102#38388'...'
        ImageIndex = 113
        OnClick = N160Click
      end
      object N161: TMenuItem
        Caption = #20844#21496#21517#31216'...'
        OnClick = N161Click
      end
    end
    object N138: TMenuItem
      Caption = #21592#24037
      object N10: TMenuItem
        Caption = #22686#21152#26032#32844#24037'...'
        ImageIndex = 14
        ShortCut = 16465
        OnClick = N28Click
      end
      object N159: TMenuItem
        Caption = #21024#38500'...'
        ImageIndex = 73
        OnClick = N31Click
      end
      object N11: TMenuItem
        Caption = '-'
      end
      object N12: TMenuItem
        Caption = #21046#23450#26032#30340#34218#36164#31119#21033#26631#20934'...'
        OnClick = N56Click
      end
      object N146: TMenuItem
        Caption = #22686#21152#21512#21516'...'
        OnClick = ToolButton7Click
      end
      object N148: TMenuItem
        Caption = '-'
      end
      object N144: TMenuItem
        Caption = #35774#32622#22270#29255'...'
        ImageIndex = 20
        OnClick = N52Click
      end
      object N145: TMenuItem
        Caption = #26356#25442#32844#20301'...'
        OnClick = N42Click
      end
      object N147: TMenuItem
        Caption = #39046#29992#29289#21697'...'
        ShortCut = 16452
        OnClick = N141Click
      end
      object N149: TMenuItem
        Caption = '-'
      end
      object N150: TMenuItem
        Caption = #21015#21360#36890#35759#24405'...'
        ImageIndex = 0
        ShortCut = 118
        OnClick = N150Click
      end
      object N14: TMenuItem
        Caption = #23548#20837#21592#24037#22522#26412#20449#24687'...'
        ImageIndex = 317
        OnClick = N14Click
      end
    end
    object N8: TMenuItem
      Caption = #35774#32622
      object N20: TMenuItem
        Caption = #20844#21496#20449#24687'...'
        ShortCut = 49219
        OnClick = N20Click
      end
      object N35: TMenuItem
        Caption = '-'
      end
      object N9: TMenuItem
        Caption = #32844#24037#31867#22411'...'
        OnClick = N9Click
      end
      object N115: TMenuItem
        Caption = #22521#35757#35745#21010'...'
        ImageIndex = 19
        OnClick = N115Click
      end
      object N6: TMenuItem
        Caption = #37096#38376#35774#32622'...'
        OnClick = N4Click
      end
      object N17: TMenuItem
        Caption = '-'
      end
      object N3: TMenuItem
        Caption = #20462#25913#21475#20196
        ImageIndex = 277
        OnClick = N3Click
      end
      object N90: TMenuItem
        Caption = #31995#32479#35774#32622
        ImageIndex = 29
        OnClick = N90Click
      end
    end
    object N130: TMenuItem
      Caption = #35270#22270
      object N107: TMenuItem
        Caption = #26174#31034#20840#37096'...'
        ImageIndex = 287
        OnClick = N107Click
      end
      object N16: TMenuItem
        Caption = #21015#20986#26410#23450#20041#25968#25454'...'
        OnClick = N16Click
      end
      object N131: TMenuItem
        Caption = '-'
        Visible = False
      end
      object N132: TMenuItem
        Caption = #32844#24037#23398#21382#22270#20363'...'
        Visible = False
        OnClick = N132Click
      end
    end
    object N133: TMenuItem
      Caption = #20854#20182
      object N134: TMenuItem
        Caption = #20154#25165#38656#27714#35268#21010'...'
        OnClick = N134Click
      end
      object N137: TMenuItem
        Caption = #21150#20844#29992#21697#31649#29702'...'
        ImageIndex = 422
        OnClick = N137Click
      end
      object N164: TMenuItem
        Caption = '-'
        Visible = False
      end
      object N165: TMenuItem
        Caption = #21387#32553#25968#25454#24211'...'
        Visible = False
        OnClick = N165Click
      end
    end
    object N24: TMenuItem
      Caption = #24110#21161
      object N25: TMenuItem
        Caption = #32593#31449'...'
        OnClick = N25Click
      end
      object N26: TMenuItem
        Caption = #22914#20309#20351#29992'...'
        ImageIndex = 74
        ShortCut = 112
        OnClick = N26Click
      end
      object N136: TMenuItem
        Caption = #21551#21160#31934#28789'...'
        Checked = True
        OnClick = N136Click
      end
      object N135: TMenuItem
        Caption = '-'
      end
      object N27: TMenuItem
        Caption = #20851#20110'...'
        OnClick = N27Click
      end
    end
  end
  object staffinfo: TADOQuery
    Connection = ADOconn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from r_staffinfo,r_staffclasscode where'
      ' r_staffinfo.delrecy='#39'0'#39
      ' and r_staffinfo.classcodeID=r_staffclasscode.id')
    Left = 176
    Top = 136
  end
  object staffsource: TDataSource
    DataSet = staffinfo
    Left = 192
    Top = 136
  end
  object PopupMenu1: TPopupMenu
    Images = ImageList1
    Left = 248
    Top = 80
    object N28: TMenuItem
      Caption = #26032#24314#32844#24037#22522#26412#20449#24687'...'
      ImageIndex = 36
      OnClick = N28Click
    end
    object N30: TMenuItem
      Caption = '-'
    end
    object N151: TMenuItem
      Caption = #25335#36125#21040#21098#36148#26495'...'
      OnClick = N151Click
    end
    object N29: TMenuItem
      Caption = #32534#36753'...'
      ImageIndex = 6
      OnClick = N29Click
    end
    object N31: TMenuItem
      Caption = #21024#38500'...'
      ImageIndex = 73
      ShortCut = 46
      OnClick = N31Click
    end
    object N32: TMenuItem
      Caption = #21462#28040#21024#38500'...'
      Enabled = False
      OnClick = N32Click
    end
    object N33: TMenuItem
      Caption = '-'
    end
    object N34: TMenuItem
      Caption = #26174#31034#21024#38500#25968#25454'...'
      OnClick = N34Click
    end
    object N87: TMenuItem
      Caption = #24635#26174#31034#33258#23450#20041'...'
      OnClick = N87Click
    end
    object N47: TMenuItem
      Caption = '-'
    end
    object N56: TMenuItem
      Caption = #21046#23450#26032#30340#34218#36164#31119#21033#26631#20934'...'
      ImageIndex = 258
      OnClick = N56Click
    end
    object N57: TMenuItem
      Caption = #26356#25442#32844#20301'...'
      ImageIndex = 240
      OnClick = N42Click
    end
    object N59: TMenuItem
      Caption = #22686#21152#22270#29255'...'
      ImageIndex = 326
      OnClick = N52Click
    end
    object N55: TMenuItem
      Caption = '-'
    end
    object N48: TMenuItem
      Caption = #20010#20154#22522#26412#20449#24687#25253#34920'...'
      ImageIndex = 70
      OnClick = N48Click
    end
    object N60: TMenuItem
      Caption = #29983#25104#32508#21512#25968#25454'...'
      ImageIndex = 187
      OnClick = N60Click
    end
    object N139: TMenuItem
      Caption = #24037#20316#29992#21697#35760#24405'...'
      OnClick = N141Click
    end
  end
  object dele: TADOQuery
    Connection = ADOconn
    Parameters = <>
    Left = 280
    Top = 72
  end
  object tmpquery: TADOQuery
    Connection = ADOconn
    Parameters = <>
    Left = 304
    Top = 56
  end
  object BranchSource: TDataSource
    DataSet = branch
    Left = 48
    Top = 69
  end
  object branch: TADOTable
    Connection = ADOconn
    CursorType = ctStatic
    AfterInsert = branchAfterInsert
    TableName = 'r_staffbranch'
    Left = 64
    Top = 61
  end
  object PopupMenu2: TPopupMenu
    Images = ImageList1
    Left = 72
    Top = 69
    object N36: TMenuItem
      Caption = #22686#21152#37096#38376'...'
      ImageIndex = 7
      OnClick = N36Click
    end
    object N37: TMenuItem
      Caption = #22686#21152#20998#37096'...'
      ImageIndex = 5
      OnClick = N37Click
    end
    object N38: TMenuItem
      Caption = '-'
    end
    object N39: TMenuItem
      Caption = #21024#38500'...'
      ImageIndex = 73
      OnClick = N39Click
    end
    object N40: TMenuItem
      Caption = '-'
    end
    object N41: TMenuItem
      Caption = #37325#21629#21517'...'
      ImageIndex = 6
      OnClick = N41Click
    end
    object N4: TMenuItem
      Caption = #37096#38376#35774#32622'...'
      OnClick = N4Click
    end
  end
  object stafftable: TADOTable
    Connection = ADOconn
    TableName = 'r_staffinfo'
    Left = 296
    Top = 133
  end
  object stachposteditSource: TDataSource
    DataSet = stachpostedit
    Left = 32
    Top = 128
  end
  object PopupMenu3: TPopupMenu
    Left = 48
    Top = 124
    object N42: TMenuItem
      Caption = #26032#30340#32844#20301#21464#21160'...'
      OnClick = N42Click
    end
    object N46: TMenuItem
      Caption = #32534#36753#32844#20301#31867#22411'...'
      OnClick = N46Click
    end
    object N43: TMenuItem
      Caption = '-'
    end
    object N45: TMenuItem
      Caption = #21024#38500'...'
      OnClick = N45Click
    end
    object N44: TMenuItem
      Caption = #32534#36753'...'
      OnClick = N44Click
    end
  end
  object ImageList1: TImageList
    Left = 376
    Top = 88
    Bitmap = {
      494C0101DF01E401040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      00000000000036000000280000004000000090070000010010000000000000C8
      0300000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001042000010420000104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7F00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7F0000000000000000
      0000FF7F00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7F0000000000000000
      0000FF7F00000000000000000000000000000000000000000000000000000000
      000000000000FF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7F0000000000001042
      0000000000001042000000000000000000000000000000000000000000000000
      000000000000FF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7F0000000000000000
      FF7FFF7FFF7F0000000000000000000000000000000000000000000000000000
      000000000000FF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000
      0000000000000000104210000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7F000000001042FF7F
      FF7FFF7FFF7F0000104200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010001000100010001000
      0000000000000000000010001042000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7F10420000FF030000
      00000000FF7F0000000000001042000000000000000000000000000000000000
      000000000000FF7FFF7FFF7FFF7FFF7FFF7F0000000010001000100010000000
      0000000000000000000000001000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7F0000FF03FF7FFF03
      FF7FFF03FF7F0000000000000000000000000000000000000000000000000000
      000000000000FF7FFF7FFF7FFF7FFF7FFF7F0000000010001000100000000000
      0000000000000000000000001000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7F0000FF7F00000000
      00000000FF7F0000000000000000000000000000000000000000000000000000
      000000000000FF7FFF7FFF7FFF7FFF7FFF7F0000000010001000000010000000
      0000000000000000000000001000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF03FF7FFF03
      FF7FFF7FFF7F0000000000000000000000000000000000000000000017000000
      0000000000000000000000000000000000000000000010000000000000001000
      1000000000000000000010001042000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042000000000000
      0000000000000000000000001042000000000000000000000000000017001700
      000000000000FF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000
      0000100010001000100010420000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000104200000000000000000000000017001700170017001700
      170000000000FF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000017001700
      000000000000FF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001042
      0000000000001042000000000000000000000000000000000000000017000000
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
      FF7F0000000000000000000000000000FF7F0000000000000000000000001863
      0000000000000000000000000000186300000000FF7F00000000000000000000
      00000000000000000000000000000000000000000000FF7F0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000010420000000000001042000000000000000000000000000000000000
      00001042000000000000104200000000000000000000FF7F0000000000000000
      000000000000000000000000000000000000000000000000FF7F000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF7F000000000000
      0000000000000000104200000000000000000000000000000000FF7F00000000
      0000000000000000000010420000000000000000000000000000000000000000
      FF7F0000000000000000FF7F0000000000000000170017001700170000001863
      0000000000000000186300000000000000000000000000000000FF7F00000000
      10421863186318631042000000000000000000000000000000000000FF7F0000
      0000104218631863186310420000000000000000000000000000000000000000
      FF7F0000000000000000FF7F00000000000000001700FF7FFF7FFF7F00001863
      0000000000000000186300000000000000000000000000000000000000001042
      18631863FF7FFF7F186310420000000000000000000000000000000000000000
      104218631863FF7FFF7F18631042000000000000104200000000000000000000
      00000000000000000000000000000000000000001700FF7F1042104200000000
      0000000000000000000000000000000000000000000000000000000010421863
      1863186318631863FF7F18631042104200000000000000000000000000001042
      18631863186318631863FF7F18631042104200000000FF7FE07FFF7FE07F0000
      00000000000000001042000000000000000000001700FF7FFF7FFF7FFF7F0000
      0000000000001863000000000000000000000000000000000000000018631863
      18631863186318631863FF7F1863000000000000000000000000000000001863
      186318631863186318631863FF7F1863000000000000E07FFF7FE07FFF7FE07F
      FF7F00000000E07F0000000000000000000000001700FF7F10421042FF7F1042
      0000000010421042FF7F00000000000000000000000000000000000010421863
      18631863186318631863FF7F1863000000000000000000000000000000001042
      186318631863186318631863FF7F1863000000000000FF7FE07FFF7FE07FFF7F
      E07F00000000FF7F0000000000000000000000001700FF7FFF7FFF7FFF7FFF7F
      00000000FF7FFF7FFF7F00000000000000000000000000000000000010421863
      FF7FFF7F18631863186318631863000000000000000000000000000000001042
      1863FF7FFF7F18631863186318631863000000000000E07FFF7FE07FFF7FE07F
      FF7F00000000E07F0000000000000000000000001700FF7F10421042FF7F1042
      0000000010421042FF7F00000000000000000000000000000000104210421042
      FF7FFF7F18631863186318631042104200000000000000000000000010421042
      1042FF7FFF7F18631863186318631042104200000000FF7FE07FFF7FE07FFF7F
      E07FFF7FE07FFF7F0000000000000000000000001700FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F17000000000000000000000000000000000000001042
      1042186318631863186310420000000000000000000000000000000000000000
      10421042186318631863186310420000000000000000E07FFF7FE07FFF7FE07F
      FF7FE07FFF7FE07F000000000000000000000000170017001700170017001700
      1700170017001700170017000000000000000000000000000000000000000000
      1042104210421042104200000000000000000000000000000000000000000000
      00001042104210421042104200000000000000000000FF7FE07FFF7F00000000
      0000000000000000104200000000000000000000170018631700170018631700
      1700186317001700186317000000000000000000000000000000000000000000
      1042000000000000104200000000000000000000000000000000000000000000
      0000104200000000000010420000000000000000000000000000000000000000
      0000000000000000000000000000000000000000170017001700170017001700
      1700170017001700170017000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001042000000000000104210420000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7F00001042000000000000000000000000000000000000000017000000
      000000000000FF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7F10001000FF7F1000
      1000FF7F00001042000000000000000000000000000000000000000017001700
      000000000000FF7F1042104210421042FF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7F00001042000000001042000000000000170017001700170017001700
      170000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F000000000000000000000000FF7F1000100010001000
      1000FF7F00001042000000000000000010420000000000000000000017001700
      000000000000FF7F1042104210421042FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F1700000000000000FF7FFF7F10420000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F170000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7F00001042000000000000000000000000000000000000000017000000
      000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000
      0000FF7FFF7FFF7FFF7F1700104200000000FF7FFF7F000010420000FF7FFF7F
      FF7FFF7FFF7FFF7FFF7F170010420000000000000000FF7F1000100010001000
      1000FF7F00001042000000000000104200000000000000000000000000000000
      000000000000FF7F1042104210421042FF7FFF7FFF7FFF7FFF7FFF7F00000000
      0000FF7FFF7FFF7FFF7F0000170000000000FF7FFF7FFF7F000010420000FF7F
      FF7FFF7FFF7FFF7FFF7F000017000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7F00001042000000000000104200000000000000000000000000000000
      000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000
      0000FF7FFF7FFF7FFF7F0000170000000000FF7FFF7FFF7FFF7F000010420000
      FF7FFF7FFF7FFF7FFF7F000017000000000000000000FF7F10001000FF7FFF7F
      FF7FFF7F00001042000000000000104210420000000000000000FF7FFF7FFF7F
      000000000000000000000000000000000000FF7FFF7FFF7F0000000000000000
      000000000000FF7FFF7F0000170000000000FF7FFF7FFF7FFF7FFF7F00001042
      0000FF7FFF7F0000FF7F000017000000000000000000FF7FFF7FFF7FFF7F0000
      000000000000000000000000000000000000000000000000000000000000FF7F
      000000000000000000000000000000000000FF7FFF7FFF7FFF7F000000000000
      00000000FF7FFF7FFF7F1700104200000000FF7FFF7FFF7FFF7FFF7FFF7F0000
      1042000000000000FF7F170010420000000000000000FF7F10001000FF7F0000
      FF7F0000000000000000000000000000104200000000FF7FFF7FFF7F0000FF7F
      000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F00000000
      0000FF7FFF7FFF7FFF7F1042000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      0000000000000000FF7F104200000000000000000000FF7FFF7FFF7FFF7F0000
      00000000000000000000000000001042000000000000FF7F1042FF7F00000000
      000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7F0000
      FF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      0000000000000000FF7F00000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7F1042FF7F00000000
      000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7F0000
      0000000000000000FF7F00000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FFF7F000000000000
      000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010420000000000001042
      1042000000001042104200000000104210420000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E07FFF7FE07F00000000000000000000000000000000
      00000000000000000000E07FFF7FE07F000000001042FF7FFF7FFF7F10421042
      0000000010421042000000001042104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF7FE07FFF7F00000000000000000000000000000000
      00000000000000000000FF7FE07FFF7F0000000010420000FF7FFF7FFF7F0000
      0000104210420000000010421042000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E07FFF7FE07F0000E07FFF7FE07F00000000000000000000000000000000
      0000E07FFF7FE07F0000E07FFF7FE07F00000000000000001042FF7FFF7FFF7F
      1042104200000000104210420000000010420000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF7FE07FFF7F00000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F000000000000000000000000104210420000FF7FFF7F
      0000000000001042104200000000104210420000000000000000000000000000
      000000000000000000000000000000000000000000000000FF7FE07FFF7FE07F
      0000E07FFF7FE07FFF7FE07F000000000000FF7FFF7FFF7FFF7FFF7F00000000
      00000000FF7FFF7FFF7FE07F0000000000000000104210420000000010420000
      FF7FFF7F00001042000000001042104200000000000000000000000000000000
      000000000000000010421700000000000000000000000000E07FFF7FE07FFF7F
      0000FF7FE07FFF7FE07FFF7F000000000000FF7FFF7FFF7FFF7F000000000000
      0000FF7FFF7FFF7FFF7FFF7F0000000000000000104200000000104210420000
      FF7F000010420000000010421042000000000000000017001700170017001700
      000000000000000000001700104200000000000000000000FF7FE07FFF7FE07F
      0000E07FFF7FE07FFF7FE07F000000000000FF7FFF7FFF7FFF7FFF7F00000000
      0000FF7FFF7FFF7FFF7FE07F0000000000000000000000001042104200000000
      0000FF7F00001042000010420000000010420000000017001700170017000000
      000000000000000000000000170000000000000000000000E07FFF7FE07FFF7F
      000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F00000000
      0000FF7FFF7FFF7FFF7F00000000000000000000000010421042000000001042
      10420000FF7F0000104200000000104210420000000017001700170000000000
      000000000000000000000000170000000000000000000000FF7FE07FFF7FE07F
      FF7FE07FFF7FE07F00000000000000000000FF7FFF7FFF7FFF7FFF7F00000000
      0000FF7FFF7FFF7FFF7F00000000000000000000104210420000000010421042
      000000000000FF7F000000000000104200000000000017001700000017000000
      000000000000000000000000170000000000000000000000E07FFF7FE07FFF7F
      E07FFF7FE07FFF7F00000000000000000000FF7FFF7FFF7FFF7FFF7F00000000
      0000FF7FFF7FFF7FFF7F00000000000000000000104200000000104210420000
      0000104210420000000000000000000000000000000017000000000000001700
      170000000000000000001700104200000000000000000000FF7FE07FFF7FE07F
      FF7FE07FFF7FE07F00000000000000000000FF7FFF7FFF7FFF7FFF7F00000000
      0000FF7FFF7FFF7FFF7F00000000000000000000000000001042104200000000
      1042104200000000000000000000000000000000000000000000000000000000
      000017001700170017001042000000000000000000000000E07FFF7FE07FFF7F
      E07FFF7FE07FFF7F00000000000000000000FF7FFF7FFF7F0000FF7F00000000
      0000FF7FFF7F0000FF7F00000000000000000000000010421042000000001042
      1042000000001042104200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7FFF7F00000000000000000000
      0000000000000000FF7F00000000000000000000104210420000000010421042
      0000000010421042000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7FFF7F00000000000000000000
      000000000000FF7FFF7F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000005C005C005C005C005C
      005C000000000000000000000000000000000000000017001700170000001700
      1700170000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000005C005C000000000000
      005C000000000000000010420000104200000000000010421700000000000000
      1700104200000000000010420000104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000005C005C00000000
      0000000000000000000000000000000000000000000000001700170017001700
      1700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000005C005C0000
      0000000000000000104200000000000010420000000000001042170000001700
      1042000000000000104200000000000010420000170017001700170017001700
      1700000000000000000000000000000000000000000000000000000000000000
      00000000170017001700170017001700170000000000000000000000005C005C
      0000000000000000000000000000000000000000000000000000170017001700
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000005C000000000000005C
      005C000000000000000000000000000000000000000000000000104217001042
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000005C005C005C005C005C
      005C000000000000000000000000000000000000000000000000000017000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000017001700170000001700
      17001700000000000000000000000000000000000000005C005C005C005C005C
      005C000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010421700000000000000
      17001042000000000000000000000000000000000000005C005C000000000000
      005C000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001700170017001700
      170000000000000000000000000000000000000000000000005C005C00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042170000001700
      1042000000000000000000000000000000000000000000000000005C005C0000
      0000000000000000000000000000000000000000170017001700170017001700
      1700000000000000104200000000000000000000104200000000000000000000
      0000000017001700170017001700170017000000000000000000170017001700
      00000000000000000000000000000000000000000000000000000000005C005C
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000104217001042
      00000000000000000000000000000000000000000000005C000000000000005C
      005C000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000104200000000000000000000104200000000
      0000000000000000000000000000000000000000000000000000000017000000
      00000000000000000000000000000000000000000000005C005C005C005C005C
      005C000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000005C00000000
      00000000000000000000186318631863186300000000000000000000E003E003
      E003E003E0030000000000000000000000000000000000000000000000001042
      00001863FF7FFF03FF7FFF0318630000104200000000000000000000FF7F0000
      FF7F0000FF7F0000FF7F0000000000000000000000000000005C005C005C0000
      00000000FF7F0000FF7F0000186318631863000000000000E003E003E003E003
      E003E003E003E003E00300000000000000000000000000000000000000000000
      FF03FF7FFF03FF7FFF03FF7FFF03FF7F000000000000000000000000FF7F0000
      FF7F0000FF7F0000FF7F000000000000000000000000005C005C005C005C005C
      00000000FF7F0000FF7F000018631863186300000000E003E003E003E003E003
      E003E003E003E003E003E0030000000000000000000000000000000000001863
      FF7FFF03FF7FFF03FF7FFF03FF7FFF03186300000000000000000000FF7F0000
      FF7F0000FF7F0000FF7F00000000000000000000000000000000005C00000000
      00000000FF7F0000FF7F000018631863186300000000E003E0030000E003E003
      E003E003E0030000E003E0030000000000000000000000000000000000000000
      0000000000000000000000000000FF7FFF0300000000000000000000FF7F0000
      FF7F0000FF7F0000FF7F00000000000000000000000000000000005C00000000
      00000000FF7F0000FF7F00001863186318630000E003E003E00300000000E003
      E003E00300000000E003E003E003000000000000000010421042104210421863
      1863186318631863186318630000FF03FF7F00000000000000000000FF7F0000
      FF7F0000FF7F0000FF7F000000000000000000000000005C005C005C005C005C
      00000000FF7F0000FF7F00001863186318630000E003E003E003E00300000000
      000000000000E003E003E003E003000000000000000010421042104210421863
      1863186318631863186318630000FF7FFF0300000000000000000000FF7F0000
      FF7F0000FF7F0000FF7F0000000000000000000000000000005C005C005C0000
      00000000FF7F0000FF7F00001863186318630000E003E003E003E003E003E003
      E003E003E003E003E003E003E003000000000000000010420000000000000000
      0000000000000000000018630000FF03FF7F00000000000000000000FF7F0000
      FF7F0000FF7F0000FF7F00000000000000000000000000000000005C00000000
      00000000FF7F0000FF7F00001863186318630000E003E003E003E003E003E003
      E003E003E003E003E003E003E003000000000000000010421042104210421863
      1863186318631863186318630000FF7F186300000000000000000000FF7F0000
      FF7F0000FF7F0000FF7F00000000000000000000000000000000000000000000
      00000000FF7F0000FF7F00001863186318630000E003E003E00300000000E003
      E003E00300000000E003E003E003000000000000000010420000000000000000
      0000000000000000000018630000FF03000000000000000000000000FF7F0000
      FF7F0000FF7F0000FF7F00000000000000000000000000000000000000000000
      00000000FF7F0000FF7F000018631863186300000000E003E00300000000E003
      E003E00300000000E003E0030000000000000000000010421042104210421042
      10421863186318631863186300000000104200000000000000000000FF7F0000
      FF7F0000FF7F0000FF7F00000000000000000000000000000000000000000000
      00000000FF7F0000FF7F000018631863186300000000E003E003E003E003E003
      E003E003E003E003E003E0030000000000000000000010420000000000000000
      0000000000000000000010420000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000018631863000000000000E003E003E003E003
      E003E003E003E003E00300000000000000000000000010421042104210421042
      1042104210421042104210420000000000000000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000000000000000
      00000000FF7FFF7FFF7FFF7F00001863186300000000000000000000E003E003
      E003E003E0030000000000000000000000000000000010421042104210421042
      1042104210421042104210420000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000001863186318630000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001863186318631863186318630000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000018631863186318631863186318630000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000104210421042104210420000
      1042104210421042104200001042104210420000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001042104210421042104200000000000000000000000000000000
      0000000000000000000000000000000000000000186318631863186310420000
      1863000018630000104200001863186318630000000000000000000000000000
      1042104210421042104210421042000000000000000000000000000000000000
      0000000000001042104210421042104200000000000000000000000000000000
      F702F702F702F702000000000000000000000000186300000000000010420000
      1863000018630000104200001863186300000000000000000000000000000000
      1042104210421042104210421042000000000000000000000000000000000000
      0000000000000000000000001042104200000000000000000000000000000000
      F702F702F702F702000000000000000000000000186318630000186310420000
      1863000018630000104200001863000000000000000000000000000000000000
      00000000000000000000104210420000000000000000000000000000E07FFF7F
      E07FFF7FE07FFF7FE07F0000104210420000000000000000000000000000F702
      F702F702F702F702F70200000000000000000000186318631863186310420000
      18631863186318631042000018631863186300000000FF7FE07FFF7FE07FFF7F
      E07FFF7FE07FFF7F0000104210420000000000000000000000000000FF7FE07F
      FF7FE07FFF7FE07FFF7F00001042104200000000000000000000000000000000
      0000F702F7020000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E07FFF7FE07FFF7FE07F
      FF7FE07FFF7FE07F0000104210420000000000000000000000000000E07FFF7F
      E07FFF7FE07FFF7FE07F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000104210421042104210420000
      10421042104210421042000010421042104200000000FF7FE07FFF7FE07FFF7F
      E07FFF7FE07FFF7F0000104210420000000000000000000000000000FF7FE07F
      FF7FE07FFF7FE07FFF7F00000000000000000000000000000000000000000000
      0000104210420000000000000000000000000000186318630000186310420000
      18630000000000001042000018630000186300000000E07FFF7FE07FFF7FE07F
      FF7FE07FFF7FE07F0000000000000000000000000000104210420000E07FFF7F
      E07FFF7FE07FFF7FE07F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000186300000000186310420000
      18631863186318631042000018630000000000000000FF7FE07FFF7FE07FFF7F
      E07FFF7FE07FFF7F0000000000000000000000000000104210420000FF7FE07F
      FF7FE07FFF7FE07FFF7F000000000000000000000000FF7F10420000FF7F1042
      0000FF7F10420000FF7F10420000FF7F10420000186318630000186310420000
      18630000000000001042000018630000186300000000E07FFF7FE07FFF7FE07F
      FF7FE07FFF7FE07F0000000000000000000000000000104210420000E07FFF7F
      E07FFF7FE07FFF7FE07F000000000000000000000000FF7FFF7F0000FF7FFF7F
      0000FF7FFF7F0000FF7FFF7F0000FF7FFF7F0000186318631863186310420000
      18631863186318631042000018631863186300000000FF7FE07FFF7FE07FFF7F
      E07FFF7FE07FFF7F000000000000000000000000000010421042000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001F001F001F001F00
      1F001F001F001F001F001F001F001F001F0000000000E07FFF7FE07FFF7FE07F
      FF7FE07FFF7FE07F000000000000000000000000000010421042104210421042
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7FFF7F1F001F001F001F00
      1F001F001F001F001F001F001F001F001F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000042004200420042004200420042
      0042004200420042004200420042004200420000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000042004200420042004200420042
      0042004200420042004200420042004200420000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF7F007C007C1863186318631863186318630000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001042104210421042104200000000000000000000000000000000
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000FF7FFF7FFF7FFF7F
      FF7F0000FF7FFF7FFF7FFF7FFF7F000000000000000000000000000000000000
      1042104210421042104210421042000000000000000000000000000000000000
      0000000000001042104210421042104200000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF7FFF7FFF7FFF7F
      FF7F0000FF7FFF7FFF7FFF7FFF7F000000000000000000000000000000000000
      1042104210421042104210421042000000000000000000000000000000000000
      0000000000001042104210421042104200000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF7FFF7FFF7FFF7F
      FF7F0000FF7FFF7FFF7FFF7FFF7F000000000000000000000000000000000000
      10421042104210421042104210420000000000000000000000000000E07FFF7F
      E07FFF7F00001042104210421042104200000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF7FFF7FFF7FFF7F
      FF7F0000FF7FFF7FFF7FFF7FFF7F0000000000000000FF7FE07FFF7FE07F0000
      10421042104210421042104210420000000000000000000000000000FF7FE07F
      FF7FE07F00001042104210421042104200000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF7FFF7FFF7FFF7F
      FF7F0000FF7FFF7FFF7FFF7FFF7F0000000000000000E07FFF7FE07FFF7F0000
      10421042104210421042104210420000000000000000000000000000E07FFF7F
      E07FFF7F00000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF7FFF7FFF7FFF7F
      FF7F0000FF7FFF7FFF7FFF7FFF7F0000000000000000FF7FE07FFF7FE07F0000
      1042104210421042104210421042000000000000000000000000000000000000
      0000E07FFF7FE07FFF7F000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7F00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7F
      FF7F0000FF7FFF7FFF7FFF7FFF7F0000000000000000E07FFF7FE07FFF7F0000
      0000000000000000000000000000000000000000000010421042104210421042
      0000FF7FE07FFF7FE07F000000000000000000000000FF7F1700170017001700
      FF7F00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7F
      FF7F0000FF7FFF7FFF7FFF7FFF7F0000000000000000FF7FE07FFF7FE07FFF7F
      E07FFF7FE07FFF7F000000000000000000000000000010421042104210421042
      0000E07FFF7FE07FFF7F000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7F00000000000000000000104200000000000000000000FF7FFF7FFF7FFF7F
      FF7F0000FF7FFF7FFF7FFF7FFF7F0000000000000000E07FFF7FE07FFF7FE07F
      FF7FE07FFF7FE07F000000000000000000000000000010421042104210421042
      0000FF7FE07FFF7FE07F000000000000000000000000FF7F1700170017001700
      FF7F000000000000000000000000000010420000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FE07FFF7FE07FFF7F
      E07FFF7FE07FFF7F000000000000000000000000000010421042104210421042
      00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7F0000000000000000000000001042000000000000000000001F001F001F00
      1F00000000001F001F001F001F000000000000000000E07FFF7FE07FFF7FE07F
      FF7FE07FFF7FE07F000000000000000000000000000010421042104210421042
      00000000000000000000000000000000000000000000FF7F17001700FF7F0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7F0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7F000000000000FF7FFF7FFF7FFF7F
      FF7FFF7F00000000FF7FFF7FFF7FFF7FFF7F00000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7F000000000000FF7FFF7FFF7FFF7F
      FF7FFF7F00000000FF7FFF7FFF7FFF7FFF7F00000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7F000000000000FF7FFF7FFF7FFF7F
      FF7FFF7F00000000FF7FFF7FFF7FFF7FFF7F00000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7F0000000000001F001F001F001F00
      1F001F00000000001F001F001F001F001F000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000
      00000000000000000000000000000000000000000000FF7F00001F001F001F00
      1F001F001F001F001F001F000000FF7F00000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7F000000000000FF7FFF7FFF7FFF7F
      FF7FFF7F00000000FF7FFF7FFF7FFF7FFF7F0000000000000000000000000000
      00000000000000000000000000000000000000000000000000001F001F001F00
      1F001F001F001F001F001F001F000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7F000000000000FF7FFF7FFF7FFF7F
      FF7FFF7F00000000FF7FFF7FFF7FFF7FFF7F00000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7F000000000000FF7FFF7FFF7FFF7F
      FF7FFF7F00000000FF7FFF7FFF7FFF7FFF7F00000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7F0000000000001F001F001F001F00
      1F001F00000000001F001F001F001F001F0000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7F0000000018631F001F001F001F00
      1F001F001F001F001F001F001F001F001F0000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7F0000000018631F001F001F001F00
      1F001F001F001F001F001F001F001F001F000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001F001F001F00
      1F001F001F001F001F001F001F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7F00001F001F001F00
      1F001F001F001F001F001F000000FF7F00000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7F00001F001F001F00
      0000FF7F0000FF7F00001F001F001F0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      1863FF7FFF7F0000FF7FFF7FFF7FFF7FFF7F0000000000421042004210420042
      00000000FF7FFF7F0000FF7F18630000104200000000000000000000FF7FFF7F
      1863FF7F1863FF7F1863FF7F1863FF7F18630000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF7F
      FF7FFF7F18630000FF7F1000FF7FFF7FFF7F0000000010420042104200421042
      0000000000000000FF7FFF7FFF7F1863000000000000000000000000FF7F1863
      FF7F1863FF7F1863FF7F1863FF7F1863FF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001863
      FF7FFF7F1863186300001F00FF7FFF7FFF7F0000000000000042004210420000
      FF7FFF7F000000001863FF7FFF7F18630000000000000000FF7FFF7FFF7FFF7F
      1863FF7F1863FF7F1863FF7F1863FF7F1863000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F000000000000000000000000000000000000FF7FFF7F
      FF7FFF7F0000186318630000FF7FFF7FFF7F0000000000420042104200420000
      FF7FFF7FFF7F00001863FF7FFF7FFF7F000000000000FF7F10421863FF7F1863
      FF7F1863FF7F1863FF7F0000FF7F1863FF7F000000000000FF7F000000000000
      0000000000000000FF7F000000000000000000000000000000000000FF7FFF7F
      FF7FFF7F1863000000001863FF7FFF7F00000000000000420042004210420042
      0000FF7FFF7FFF7F00001863FF7F0000FF7F00000000FF7F1042FF7F1863FF7F
      1863FF7F1863FF7F000000000000FF7FFF7F000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000017000000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7F186300001863FF7F000018630000000000420042104200421042
      00420000FF7FFF7FFF7F000000000000000000000000FF7F10421863FF7FFF7F
      FF7F1863FF7F18630000004200001863FF7F000000000000FF7F000000000000
      00000000FF7FFF7FFF7F10420000170000000000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000000000420042004200420042
      10420000FF7F0000FF7FFF7FFF7FFF7FFF7F00000000FF7F104210421042FF7F
      FF7FFF7F1863FF7F186300001863FF7F1863000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7F1700FF7F186317000000000000000000000000000000FF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F0000000018630000000010420042004210420042
      00421042000010420000FF7FFF7FFF7FFF7F000000000000FF7FFF7FFF7F0000
      FF7F1863FF7F1863FF7F1863FF7F1863FF7F000000000000FF7F000000000000
      00000000FF7F170017001700000000000000007C0000000000000000FF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F1863000018630000000000001042004210420042
      004200421042004210420000FF7FFF7F0000000000000000000000000000FF7F
      FF7FFF7FFF7FFF7F1863FF7F1863FF7F1863000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7F170017001700000000000000007C00000000000000000000FF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F186300000000000000000042004200421042
      0042104200420042004210420000000000420000000000000000000000000000
      0000FF7FFF7FFF7FFF7F1863FF7F1863FF7F000000000000FF7FFF7F00000000
      00000000FF7F170017001700170000000000007C007C00000000000000000000
      FF7FFF7FFF7FFF7FFF7FFF7F1042000000000000000000001042004200420042
      1042004210420042004200421042004200420000000000000000000000000000
      000000000000FF7FFF7FFF7FFF7F00000000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F0000000000000000007C007C007C0000000000000000
      0000FF7FFF7FFF7F1042000000000000007C0000000000000000104200420042
      0042004200421042004200420042104200420000000000000000000000000000
      000000000000000000000000000000000000000000000000FF7F000000000000
      0000000000000000FF7F0000000000000000007C007C007C007C000000000000
      0000000010420000000000000000007C007C0000000000000000000010420042
      1042004200420042000000421042004210420000000000000000000000000000
      000000000000000000000000000000000000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F0000000000000000007C007C007C007C007C007C0000
      00000000000000000000007C007C007C007C0000000000000000000000000000
      0042104200420000004200420042000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000007C007C007C007C007C007C007C
      007C007C007C007C007C007C007C007C007C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000007C007C007C007C007C007C007C
      007C007C007C007C007C007C007C007C007C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000420042004200420042
      00001863FF7FFF7F0000FF7FFF7FFF7FFF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000001042186318631863
      1863186318631863186318631863186318630000000000000000000000000000
      0000000000000000000000000000000000000000000000421863E07F1863E07F
      00001863FF7F18630000FF7F1000FF7FFF7F00000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7F00001042104210421042104200000000000000001042186318630000
      0000186300000000186300000000186318630000000000000000000000000000
      000000000000000000000000000000000000000000000042E07F1863E07F0000
      1863FF7FFF7F1863186300001F00FF7FFF7F0000104200001863186318631863
      186318630000FF7F186318631863104200000000000000000000186318631863
      1863186318631863186318631863186318630000000000001042104210421042
      00000000104210421042104200000000000000000000E07F1863E07F18630000
      FF7FFF7FFF7F0000186318630000FF7F1863000010420000FF7FFF7FFF7FFF7F
      FF7FFF7F0000FF7F186318631863104200000000000000000000104218630000
      0000186300000000186300000000186318630000000000001042104210420000
      FF7FFF7F0000104210421042000000000000000000001863E07F1863E07F0000
      FF7FFF7FFF7F0042000000001863FF7FFF7F000010420000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7F0000FF7F186310420000FF7F0000000000000000000010421863
      186318631863186318631863186318630000000000000000104210420000FF7F
      10421042FF7F00001042104200000000000000000000E07F1863E07F0000FF7F
      FF7FFF7FFF7FFF7F0042FF7F1863FF7F0000000010420000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7F000010420000FF7FFF7F0000000000000000000000000000
      00001863000000001863000000001863000000000000000010420000FF7F1042
      000000001042FF7F0000104200000000000000000000000000000000FF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000010420000FF7FFF7FFF7FFF7F
      FF7FFF7F0000FF7FFF7F0000FF7FFF7F00000000000000000000000000001863
      18631863186318631863186318630000000000000000000000000000FF7F1042
      000000001042FF7F00000000000000000000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000010420000FF7FFF7FFF7F0000
      FF7FFF7F0000FF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000
      104210421042104210421042000000000000000000000000000010420000FF7F
      10421042FF7F0000104200000000000000000000000000000000FF7FFF7F1863
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F00420000000010420000FF7FFF7F00001042
      0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000104218631863186318630000
      0000000000000000000000000000104218630000104210421042000010420000
      FF7FFF7F0000104200001042104210420000000000000000000018630042FF7F
      FF7F1863FF7FFF7FFF7FFF7FFF7FFF7F0042000010420000FF7F0000FF7F1863
      10420000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000104218631863186318630000
      1042186318631863186318630000104218630000104210421042000010421042
      00000000104210420000104210421042000000000000004218630000FF7FFF7F
      0042FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000104200000000FF7F18631863
      186310420000FF7FFF7FFF7FFF7FFF7FFF7F0000104218631863186318631863
      1863186318631863186318631863186318630000000010421042104200000000
      0000000000000000104210421042000000000000000000000042FF7F00001863
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000104200000000FF7F18631863
      1863104200000000000000000000000000000000000010421863186318631863
      1863186318631863186318631863186318630000000000000000104210421042
      1042104210421042104200000000000000000000000000000000000000420000
      0000FF7FFF7FFF7FFF7FFF7F0000000000000000104210420000FF7FFF7FFF7F
      FF7F104200001042104210421042104210420000000000000000104218631863
      1863186318631863186318631863186310420000000000000000000000000000
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
      00000000000000000000000000000000000000000000E07FFF7FE07FFF7F0000
      1863186318630000FF7FFF7FFF7F0000E0030000170017001700170017001700
      1700170017001700170017001700170017000000000000001863186300001863
      1863000018631863000018631863000000000000170017001700170017001700
      1700170017001700170017000000000000000000000010421042104210420000
      00000000000000000000000000000000000000001700FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F17000000000000000000000000000000
      0000000000000000000000000000000000000000170010421042104210421042
      10421042104210421042170000000000000000000000E07FFF7FE07FFF7F0000
      1863186318630000FF7FFF7FFF7F0000186300001700FF7F000000000000FF7F
      000000000000FF7F000000000000FF7F1700000000000000FF7FFF7FFF7F0000
      FF7FFF7FFF7F0000FF7FFF7FFF7F000000000000170000000000000000000000
      00000000000000000000170000000000000000000000FF7FE07FFF7FE07F0000
      1863186318630000FF7FFF7FFF7F0000186300001700FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F1700000000000000FF7F1863FF7F0000
      FF7F1042FF7F0000FF7F1863FF7F000000000000170000000000000000000000
      0000000000000000000017000000000000000000000010421042104210420000
      00000000000000000000000000000000000000001700FF7F000000000000FF7F
      000000000000FF7F000000000000FF7F1700000000000000FF7F1042FF7F0000
      FF7F1863FF7F0000FF7F1042FF7F000000000000170000000000000000000000
      00000000000000000000000000000000000000000000FF7FE07FFF7FE07F0000
      E003E003E00300001863186318630000FF7F00001700FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F1700000000000000FF7FFF7FFF7F0000
      FF7FFF7FFF7F0000FF7FFF7FFF7F000000000000170000000000000000000000
      0000000000000000E07F104200000000000000000000E07FFF7FE07FFF7F0000
      E003E003E00300001863186318630000FF7F00001700FF7F000000000000FF7F
      000000000000FF7F000000000000FF7F17000000000000000000000000000000
      0000000000000000000000000000000000000000170000000000000000000000
      0000000000000000E07F00000000000000000000000010421042104210420000
      00000000000000000000000000000000000000001700FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F1700000000000000FF7FFF7FFF7F0000
      FF7FFF7FFF7F0000FF7FFF7FFF7F000000000000170017001700170017001700
      17001700170017000000E07F10420000000000000000E07FFF7FE07FFF7F0000
      18631863186300001863186318630000186300001700FF7F000000000000FF7F
      000000000000FF7F000000000000FF7F1700000000000000FF7F1863FF7F0000
      FF7F1042FF7F0000FF7F1863FF7F0000000000001700FF7F17001700FF7F1700
      1700FF7F170017000000E07F00000000000000000000FF7FE07FFF7FE07F0000
      18631863186300001863186318630000186300001700FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F1700000000000000FF7F1042FF7F0000
      FF7F1863FF7F0000FF7F1042FF7F000000000000170017001700170017001700
      170017001700170017000000E07F104200000000000010421042104210420000
      0000000000000000000000000000000000000000170017001700170017001700
      170017001700170017001700170017001700000000000000FF7FFF7FFF7F0000
      FF7FFF7FFF7F0000FF7FFF7FFF7F000000000000000000000000000000000000
      000000000000000000000000E07F1042000000000000FF7FE07FFF7FE07F1042
      E07FFF7FE07F1042E07FFF7FE07F1042E07F00001700FF7F170017001700FF7F
      170017001700FF7F170017001700FF7F17000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000175C00000000E07FFF7FE07FFF7F1042
      FF7FE07FFF7F1042FF7FE07FFF7F1042FF7F0000170017001700170017001700
      1700170017001700170017001700170017000000000000001863186300001863
      1863000018631863000018631863000000000000000000000000000000000000
      0000000000000000000000000000175C175C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000005C007C007C007C007C
      007C007C007C007C007C007C007C007C007C0000000000000000000000000000
      0000000000000000000000000000000000000000186318631863186318631863
      0000186318631863186318631863186318630000000000000000000000000000
      0000000000000000000000000000000000000000005C007C007C007C007C007C
      007C007C007C007C007C007C007C007C007C0000000000000000000000000000
      0000000000000000000000000000000000000000186318631863186318631863
      0000000018631863186318631863186318630000000000000000104210421042
      104210421042104210421042000000000000005C007C007C007C007C007C007C
      007C007C007C007C007C007C007C007C007C0000000000000000000000000000
      0000000000000000000000000000000000000000186318631863186318631863
      0000000000001863186318631863186318630000000000000000000000000000
      000000000000000000000000000000000000005C007CFF7FFF7FFF7F007C007C
      FF7F007C007CFF7FFF7FFF7F007CFF7F007C0000000000000000000000000000
      0000000000000000000000000000000000000000186318631863186318631863
      0000000000000000186318631863186318630000000000000000000000000000
      000000000000000000000000000000000000005C007C007C007CFF7F007C007C
      FF7F007C007CFF7F007CFF7F007CFF7F007C0000000000000000000000000000
      0000000000000000000000000000000000000000186318631863186318631863
      0000000000000000000018631863186318630000000000000000000000000000
      000000000000000000000000000000000000005C007CFF7FFF7FFF7F007C007C
      FF7F007C007CFF7F007CFF7F007CFF7FFF7F0000000000000000000000000000
      0000000000000000000000000000000000000000186318631863186318631863
      0000000000000000000000001863186318630000000000000000000000000000
      104200001042000000000000000000000000005C007CFF7F007C007C007C007C
      FF7F007C007CFF7F007CFF7F007CFF7F007C0000000000000000000000000000
      0000000000000000000000000000000000000000186318631863186318631863
      0000000000000000000018631863186318630000000000000000000000000000
      000000000000000000000000000000000000005C007CFF7FFF7FFF7F007CFF7F
      FF7FFF7F007CFF7FFF7FFF7F007CFF7FFF7F0000000000000000000000000000
      0000000000000000000000000000000000000000186318631863186318631863
      0000000000000000186318631863186318630000000000000000000000000000
      000000000000000000000000000000000000005C007C007C007C007C007C007C
      007C007C007C007C007C007C007C007C007C0000000000000000000000000000
      0000000000000000000000000000000000000000186318631863186318631863
      0000000000001863186318631863186318630000000000000000000000000000
      000000000000000000000000000000000000005C007C007C007C007C007C007C
      007C007C007C007C007C007C007C007C007C0000000000000000000000000000
      0000000000000000000000000000000000000000186318631863186318631863
      0000000018631863186318631863186318630000000000000000000000000000
      0000000000000000000000000000000000000000005C007C007C007C007C007C
      007C007C007C007C007C007C007C007C007C0000000000000000000000000000
      0000000000000000000000000000000000000000186318631863186318631863
      0000186318631863186318631863186318630000000000000000000000000000
      00000000000000000000000000000000000000000000005C007C007C007C007C
      007C007C007C007C007C007C007C007C007C0000000000000000000000000000
      0000000000000000000000000000000000000000186318631863186318631863
      1863186318631863186318631863186318630000000000000000000000000000
      104200001042000000000000000000000000000000000000005C007C007C007C
      007C007C007C007C007C007C007C007C005C0000000000000000000000000000
      0000000000000000000000000000000000000000186318631863186318631863
      1863186318631863186318631863186318630000000000000000000000000000
      0000000000000000000000000000000000000000000000000000005C007C007C
      007C007C007C007C007C007C007C005C00000000000000000000000000000000
      0000000000000000000000000000000000001863000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000005C005C
      005C005C005C005C005C005C005C000000000000000000000000000000000000
      0000000000000000000000000000000000001863186318631863186318631863
      1863186318631863186318631863186318630000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001863186318631863186318631863
      1863186318631863186318631863186318630000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E07F
      E07FE07FE07FE07F000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000001700FF7F
      0000000000000000000000000000000000000000000000000000E07FE07FE07F
      E07FE07FE07FE07FE07FE07F0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000170017001700
      FF7F00000000000000000000000000000000000000000000E07FE07FE07FE07F
      E07FE07FE07FE07FE07FE07FE07F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001700170017001700
      FF7F00000000000000000000000000000000000000000000E07FE07FE07F0000
      0000000000000000E07FE07FE07F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000170017001700FF7F1700
      1700FF7F000000000000000000000000000000000000E07FE07FE07F0000E07F
      E07FE07FE07FE07F0000E07FE07FE07F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000170017001700FF7F00000000
      17001700FF7F00000000000000000000000000000000E07FE07F0000E07FE07F
      E07FE07FE07FE07FE07F0000E07FE07F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001700FF7F000000000000
      00001700FF7F00000000000000000000000000000000E07FE07FE07FE07FE07F
      E07FE07FE07FE07FE07FE07FE07FE07F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000001700FF7F0000000000000000000000000000E07FE07FE07FE07FE07F
      E07FE07FE07FE07FE07FE07FE07FE07F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001700FF7F000000000000000000000000E07FE07FE07F00000000
      E07FE07FE07F00000000E07FE07FE07F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000001700FF7F000000000000000000000000E07FE07F00000000
      E07FE07FE07F00000000E07FE07F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000001700FF7F00000000000000000000E07FE07FE07FE07F
      E07FE07FE07FE07FE07FE07FE07F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000001700FF7F00000000000000000000E07FE07FE07F
      E07FE07FE07FE07FE07FE07F0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000017000000000000000000000000000000E07F
      E07FE07FE07FE07F000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000001700
      1700170017001700170017001700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001700
      0000000000000000000000000000000000000000000000001700000000001700
      0000000017000000000017000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001700
      0000000000000000000000000000000017000000170000000000170000000000
      170000000000170000000000170000000000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001700
      0000000000000000000000000000000017000000000017000000000000000000
      000000000000000000000000000017000000000000000000FF7FFF7FFF7F0000
      E05EE05E0000000000000000E05EE05E00000000000000000000000000000000
      0000000000000000000000000000000000000000000017001700170017001700
      0000000000000000000000000000000017000000000000001700000000000000
      0000000000000000000017000000000000000000000000000000FF7FFF7F0000
      0000E05EE05EE05EE05EE05EE05EE05E00000000000000000000000000000000
      1863000000000000000000000000000000000000000017000000000000001700
      0000000000000000000000000000000017000000170000000000000000000000
      00000000000000000000000017000000000000000000000000000000FF7FFF7F
      FF7F0000E05EE05EE05EE05EE05EE05E00000000000000000000000000001863
      1863186300000000000000000000000000000000000017000000000000001700
      0000000000000000000000000000000017000000000017000000000000000000
      0000000000000000000000000000170000000000000000000000000000000000
      0000E05EE05EE05EE05EE05EE05EE05E00000000000000000000000000000000
      1863186318630000000000000000000000000000000017000000000000001700
      0000000000000000000000000000000017000000000000001700000000000000
      00000000000000000000170000000000000000000000000000000000E05EE05E
      E05EE05EE05EE05EE05EE05EE05EE05E00000000000000000000000000000000
      0000186318631863000000000000000000000000000017000000000000001700
      1700170017001700170017001700170017000000170000000000000000000000
      00000000000000000000000017000000000000000000000000000000E05EE05E
      E05EE05EE05EE05EE05EE05EE05EE05E00000000000000000000000000000000
      0000000018630000000000000000000000000000000017000000000000000000
      0000000000001700000000000000000000000000000017000000000000000000
      0000000000000000000000000000170000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000017000000000000000000
      0000000000001700000000000000000000000000000000001700000000000000
      000000000000000000001700000000000000000000000000000000000000E05E
      E05EE05EE05EE05E000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001700000000000000000000000000170000000000170000000000
      0000000000000000000000001700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000170017001700
      1700170017001700000000000000000000000000000017000000000017000000
      0000170000000000170000000000170000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001700000000001700
      0000000017000000000017000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000FF7FE07F0000
      0000000017001700170017001700170017000000000000000000000000000000
      1700170017001700170017000000000000000000000000000000000000000000
      00001042000010421042000000000000000000000000000000001F001F001F00
      000000000000000000000000007C007C00000000000000000000E07FFF7F0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000001042000000000000000000000000000000001F000000
      000000000000000000000000007C007C00000000000000000000FF7F00000000
      0000000000000000000000000000000000000000000000000000000017000000
      0000000000000000000000000000170000000000000000000000000000000000
      1863186318631863186300001042000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000017000000
      0000000000000000000000000000170000000000000000000000000000000000
      1863FF7FFF7FFF7FFF7F00001042000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001700170017000000
      0000000000000000000000000000170000000000000000000000000000000000
      1863FF7FFF7FFF7FFF7F00001042000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000017000000
      0000000000000000000000000000170000000000000000000000000000000000
      1863FF7FFF7FFF7FFF7F00001042104210420000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000170000000000000017000000
      0000000000000000000000000000170000000000000000000000000000001863
      FF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000170000000000000000000000
      000000000000000000000000000000000000000000000000186318631863FF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E07FFF7F0000
      0000000000000000000000000000000000000000170000000000000000000000
      1700170017001700170017000000000000000000000000001863FF7FE003E003
      E003E003E003E003E003E003E003FF7FFF7F000000000000000000001F001F00
      1F000000000000000000007C007C000000000000000000000000FF7FE07F0000
      0000000000000000000000000000000000000000170000000000000000000000
      0000000017000000000000000000000000000000000000001863FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000001F00
      00000000000000000000007C007C000000000000000000000000E07F00000000
      0000000000000000000000000000000000000000170000000000000000000000
      0000000017000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001700170017001700
      1700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000E07FFF7FE07FFF7F
      E07FFF7FE07FFF7FE07FFF7FE07F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF7F000000000000000000000000000000000000000000000000104200000000
      0000000000000000000010420000000000000000000010420000E07FFF7FE07F
      FF7FE07FFF7FE07FFF7FE07FFF7FE07F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF7F0000000000000000000000000000000000000000E05EE05E000010421042
      104210421042000000000000E05E0000000000000000E07F0000FF7FE07FFF7F
      E07FFF7FE07FFF7FE07FFF7FE07FFF7F000000000000E05EE05E000000000000
      0000000000000000E05EE05E0000000000000000000000000000000000000000
      FF7F0000000000000000000000000000000000000000E05EE05E000010421042
      104210421042000000000000E05E000000000000000010420000E07FFF7FE07F
      FF7FE07FFF7FE07FFF7FE07FFF7FE07F000000000000E05EE05E000000000000
      0000000000000000E05EE05E0000000000000000000000000000FF031F000000
      FF7F0000000000000000000000000000000000000000E05EE05E000010421042
      104210421042000000000000E05E0000000000000000E07F10421042E07FFF7F
      E07FFF7FE07FFF7FE07FFF7FE07FFF7FE07F00000000E05EE05E000000000000
      0000000000000000E05EE05E00000000000000000000FF03FF03FF031F000000
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000E05EE05E000000000000
      000000000000000000000000E05E00000000000000001042E07F1042FF7FE07F
      FF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7F00000000E05EE05E000000000000
      0000000000000000E05EE05E0000000000000000FF03FF03FF03FF03FF030000
      00000000000000000000000000000000000000000000E05EE05EE05EE05EE05E
      E05EE05EE05EE05EE05EE05EE05E0000000000000000E07F1042104210421042
      10421042104210421042104210421042104200000000E05EE05EE05EE05EE05E
      E05EE05EE05EE05EE05EE05E00000000000000000000FF03FF03FF7FFF03FF03
      1F001F001F00E07FE07FE07FE07FE05E000000000000E05E0000000000000000
      00000000000000000000E05EE05E00000000000000001042E07F1042E07F1042
      FF03FF03FF03FF0310421042E07F1042000000000000E05EE05E000000000000
      0000000000000000E05EE05E000000000000000000000000FF03FF7FFF03FF03
      FF031F001F001042E07FE07FE07FE07FE05E00000000E05E0000000000000000
      000000000000000000000000E05E000000000000000000000000E07F1042E07F
      0000FF03FF03FF031042104210421042000000000000E05E0000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7F0000E05E0000000000000000000000000000FF03FF03FF03
      FF03E002E0021042E07FE07F005CE05EE07F00000000E05E0000000000000000
      000000000000000000000000E05E000000000000000000000000000000000000
      FF03FF03FF03FF031042000000000000000000000000E05E0000FF7F1F001F00
      1F001F00FF7FFF7F0000E05E0000000000000000000000000000FF03FF03FF03
      E002E002E002E002FF7FE07F005C005CE07F00000000E05E0000000000000000
      000000000000000000000000E05E00000000000000000000000000000000FF03
      FF03FF030000FF031042000000000000000000000000E05E0000FF7FFF7F1F00
      1F001F00FF7FFF7F0000E05E00000000000000000000000000000000FF03FF03
      E002E002E002E002E002005C005C005CE07F00000000E05E0000000000000000
      000000000000000000000000E05E0000000000000000000000000000FF03FF03
      FF030000000010421042000000000000000000000000E05E0000FF7F1F001F00
      1F001F00FF7FFF7F0000000000000000000000000000000000000000FF03FF03
      E002E002E002E002005C005CE07F0000000000000000E05E0000000000000000
      0000000000000000000000000000000000000000000000000000FF03FF03FF03
      00000000000000001042000000000000000000000000000000001F001F001F00
      FF7F1F00FF7FFF7F00001042000000000000000000000000000000000000FF03
      E002E002E002E002E002000000000000000000000000E05E0000000000000000
      00000000000000000000000000000000000000000000000000000000FF030000
      0000000000000000000000000000000000000000000000001F001F001F000000
      000000000000000000000000000000000000000000000000000000000000FF7F
      FF03FF03E002E002000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001F001F001F0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF03FF0300000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000E05EE05EE05EE05E
      00001042186318630000104210421042000000000000FF7FE07FFF7F0000FF7F
      00000000FF7FFF7FFF7FFF7F0000FF7FE07F0000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000E05EE05EE05EE05E
      00001042104210420000104210421042000000000000E07FFF7FE07F0000FF7F
      10421042FF7FFF7FFF7FFF7F0000E07FFF7F0000000000000000000000000000
      0000FF7FFF7FFF7F0000000000000000000000000000FF7F0000000000000000
      0000000000000000000000000000FF7F0000000000000000E05EE05EE05EE05E
      00000000000000000000000000000000186300000000FF7FE07FFF7F0000FF7F
      FF7FFF7FFF7FFF7FFF7FFF7F0000FF7FE07F00001042FF7F00000000FF7FFF7F
      FF7FFF7FFF7FFF7FFF7F000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000E05EE05EE05EE05E
      E05EE05EE05EE05EE05EE05EE05EE05EE05E00000000E07FFF7FE07FFF7F0000
      000000000000000000000000FF7FE07FFF7F0000FF7F0000000000001042FF7F
      FF7F000000000000FF7F00000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000E05EE05EE05EE05E
      E05EE05EE05EE05EE05EE05EE05EE05EE05E00000000FF7FE07FFF7FE07FFF7F
      E07FFF7FE07FFF7FE07FFF7FE07FFF7FE07F0000FF7F00001042000000000000
      0000FF7FFF7FFF7FFF7FFF7F0000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000E05EE05EE05EE05E
      00000000000000000000000000000000E05E00000000E07FFF7FE07FFF7FE07F
      FF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7F0000000000000000000000001042
      FF7FFF7F000000000000FF7F0000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000E05EE05EE05E0000
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000FF7FE07FFF7FE07FFF7F
      E07FFF7FE07FFF7FE07FFF7FE07FFF7FE07F000000001F0000001F0000000000
      00000000FF7FFF7FFF7FFF7FFF7F000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000E05EE05EE05E0000
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000E07FFF7FE07FFF7FE07F
      FF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7F0000000000001F0000001F000000
      1042FF7FFF7F000000000000FF7F000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000E05EE05EE05E0000
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000FF7FE07FFF7F00000000
      0000000000000000000000000000FF7FE07F00000000000000001F0000001F00
      000000000000FF7FFF7FFF7FFF7FFF7F000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000E05EE05EE05E0000
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000E07FFF7F0000FF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F0000E07FFF7F000000000000000000001F000000
      00001042FF7FFF7FFF7F000000000000000000000000FF7F0000000000000000
      0000000000000000000000000000FF7F0000000000000000E05EE05EE05E0000
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000FF7FE07F0000FF7F1F00
      1F001F001F001F001F00FF7F0000FF7FE07F00000000000000001F0000001F00
      00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000E05EE05EE05E0000
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000E07FFF7F0000FF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F0000E07FFF7F000000000000000000001F000000
      1F000000000000000000000000000000000000000000FF7F0000000000000000
      0000000000000000000000000000FF7F0000000000000000E05EE05EE05E0000
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000FF7FE07F0000FF7F1F00
      1F001F001F001F001F00FF7F0000FF7F00000000000000000000000000001F00
      00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000
      00000000000000000000000000000000000000000000E07FFF7F0000FF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F0000E07FFF7F0000000000000000000000000000
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
      0000000000000000FF7FFF030000000018630000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001042FF03FF7F00000000FF030000000000000000000000000000
      00000000000000000000175C0000000000000000175C175C175C175C00000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000175C175C175C175C0000000000000000000000001863
      FF03FF7F000000001042FF03FF7FFF0318630000000000000000000000000000
      000000000000175C175C175C00000000000000000000175C175C175C00000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000175C175C175C00000000000000000000FF031863FF03
      1863FF03FF7F100200001042FF03FF7FFF030000000000000000000000000000
      0000175C175C175C175C175C00000000000000000000175C175C175C00000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000175C175C175C0000000000000000FF031863FF031863
      FF031863FF03FF7F10020000104200000000000000000000000000000000175C
      175C175C175C175C175C175C000000000000000000000000175C175C00000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000175C175C000000000000000000001863FF031863FF03
      1863FF031863FF03FF7F00000000104210420000000000000000000000000000
      000000000000000000000000000000000000000000000000175C175C00000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000175C175C0000000000000000FF7FFF031863FF031042
      00001042FF031863FF03FF7F0000104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000175C00000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000175C00000000000000000000FF03FF7FFF0318630000
      000000001863FF031863FF030000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000175C00000000
      0000000000000000000000000000170000000000000017000000000000000000
      00000000000000000000175C000000000000000000001863FF03FF7FFF031042
      00001042FF031863FF0318630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001700000000000000170000000000000017000000000000001700
      0000000000000000000000000000000000000000000000001863FF03FF7FFF03
      1863FF031863FF03186300001863000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000017001700000000001700000000000000000000001700000000001700
      170000000000000000000000000000000000000000000000FF031863FF03FF7F
      FF031863FF031863FF0300000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000170017001700170017000000000000000000000000000000170017001700
      1700170000000000000000000000000000000000000000000000FF031863FF03
      FF7FFF031863FF03000018630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000017001700000000000000000000000000000000000000000000001700
      1700000000000000000000000000000000000000000000000000000000001863
      FF03FF7F00000000186300000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001700000000000000000000000000000000000000000000001700
      0000000000000000000000000000000000000000000000000000000010420000
      0000000018630000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      1042000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      005C005C005C000000000000000000000000000000000000F702F702F702F702
      1863000018630000186300001863000018630000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000F702F702F702F702F702F702000000000000005C005C005C005C0000
      E07F007CE07F005C00000000000000000000000000000000F702F702F702F702
      F702F702F702F702F702F702F702F702F7020000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000F702F702F702F702F702F702000000000000E05E007CE05E007C005C
      005CE07F007CE07F005C0000000000000000000000000000F702F702F702F702
      F702F702F702F702F702F702F702F702F7020000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000010420000
      000000001863F7020000F702F702186300000000005C007CE05E007CE05E007C
      E05E007CE05E007CE05E005C000000000000000000000000F702F702F702F702
      0000186300000000186300000000186300000000000000000000000000000000
      000000000000175C175C175C175C000000000000000000000000104210421042
      00000000186318630000000018631042000000000000005C007CE05E007C0000
      007CE05E007CE05E007CE05E005C00000000000000000000F702F702F7020000
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000
      000000000000175C175C175C0000000000000000000000001863186318631042
      1042000010421863000000001863186300000000005C007C0000007CE05E0000
      0000007CE05E007CE05E007C005C00000000000000000000F702F702F7021863
      FF7FFF7FFF7FFF7FFF7F007CFF7FFF7FFF7F0000000000000000000000000000
      000000000000175C175C175C00000000000000000000FF7F1863186318631863
      1042104200001863000000001863186300000000005CE05E0000E05E007CE05E
      00000000007CE05E007CE05E005C00000000000000000000F702F702F7020000
      FF7FFF7FFF7FFF7F007C007C007CFF7FFF7F0000000000000000000000000000
      000000000000175C175C000000000000000000001863FF7FFF7F186318631863
      1863104210420000000000000000000000000000005C007C0000007CE05E007C
      E05E007CE05E007CE05E007C005C00000000000000000000F702F702F7020000
      FF7FFF7FFF7F007C007C007C007CFF7FFF7F0000000000000000000000000000
      000000000000175C175C0000000000000000000000001863FF7FFF7F18630000
      18631863104200000000000000000000000000000000005C007CE05E007C005C
      007CE05E007CE05E007CE05E005C00000000000000000000F702F702F7021863
      FF7FFF7F007C007C007C007CFF7FFF7FFF7F0000000000000000000000000000
      000000000000175C000000000000000000000000000000001863FF7F00000000
      00001863000000000000000000000000000000000000005CE05E007CE05E007C
      005C007CE05E007CE05E007C005C00000000000000000000F702F702F7020000
      FF7F007C007C007C007CFF7FFF7FFF7FFF7F0000000000000000000000000000
      000000000000175C0000000000000000000000000000000000001863FF7F0000
      1863104200000000000000000000000000000000005CE07F007CE05E007CE05E
      007CE05E007CE05E007CE07F007C005C0000000000000000F702007CF7020000
      007C007C007C007CFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000018630000
      104200000000000000000000000000000000005CE07F007CE05E007CE05E005C
      005C005C005C007CE07F007CE07F005C0000000000000000F702007C007C007C
      007C007C007CFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000005C007CE05E007C005C005C0000
      000000000000005C007CE07F007CE07F005C0000000000000000007C007C007C
      007C007C00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000005CE05E007C005C000000000000
      0000000000000000005C005CE05E007C005C0000000000000000007C007C007C
      007C007C00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000005C005C0000000000000000
      000000000000000000000000005C005C005C0000000000000000007C007C007C
      007C007C007C0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E05E
      E05EE05EE05EE05EE05EE05EE05EE05EE05E0000104210421042104210421042
      1042104210421042104210421042000000000000000000000000000000000000
      007C104200000000000010420000000000000000000000000000000000000000
      00000000E002E002E002E0020000000000000000000000000000000000000000
      E05EE05EE05EE05EE05EE05EE05EE05EE05E0000000000000000000000000000
      0000000000000000000000000000000000000000000000001042104210421042
      007C007C10420000000010420000000000000000000000000000000000000000
      000000000000000000000000000000000000E05EE05EE05EE05EE05EE05EE05E
      E05EE05EE05EE05EE05EE05EE05EE05EE05E0000000000000000000000000000
      00000000000000000000000000000000000000000000007C007C007C007C007C
      007C007C007C0000000010420000000000000000000000000000104210420000
      000000000000000000000000000000000000000000000000000000000000E05E
      E05EE05EE05EE05EE05EE05E0000000000001042104210421042104210421042
      1042104210421042104210421042000000000000000000000000000000000000
      007C007C00000000000000001042000000000000000000001042104210421042
      0000000000000000000000000000000000000000000000000000000000000000
      E05EE05EE05EE05EE05EE05EE05E000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      007C000000000000000010420000000000000000000010421042000010421042
      104200000000000000000000000000000000E05EE05EE05EE05EE05EE05EE05E
      E05EE05EE05EE05EE05EE05EE05EE05EE05E0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000010420000000000000000104210420000175C00001042
      104210420000000000000000000000001042E05E005CE05E005CE05E005CE05E
      E05EE05E00000000E05EE05E0000E05EE05E1042104200000000104210420000
      1042000010420000104200000000000000000000000000000000104200000000
      000000000000000000001042000000000000000000000000007C005C175C0000
      104210420000000010421042104210421042E05E005CE05EE05EE05EE05EE05E
      E05EE05E0000E05EE05E0000E05E0000E05E1042000010420000104200000000
      0000000000000000000000000000000000000000000000000000000010420000
      00000000000000000000104200000000000000000000007C007C007C005C175C
      000000000000000000000000000018631042E05E005CE05EE05EE05EE05EE05E
      E05EE05E0000E05EE05E0000E05E0000E05E1042000010420000104210420000
      0000000000000000000000000000000000000000000000001042000000000000
      10420000000000000000000000000000000000001F7C1F7C007C007C007C005C
      175C00000000000000000000000000000000005C005CE05EE05EE05EE05EE05E
      E05EE05E0000E05EE05E0000E05E0000E05E1042000010420000104200000000
      0000000000000000000000000000000000000000000000001042000000000000
      10420000000000000000000000000000007C000000001F7CFF7F007C007C1042
      000000000000000000000000000000000000E05E005CE05EE05EE05EE05EE05E
      E05EE05E00000000E05EE05E0000E05EE05E1042104200000000104210420000
      0000000000000000000000000000000000000000000000000000000000000000
      10420000000000001042104210421042007C0000000000001F7C1F7C10420000
      000000000000000000000000000000000000E05EE05EE05EE05EE05EE05EE05E
      E05EE05EE05EE05EE05EE05EE05EE05EE05E0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      104200000000007C007C007C007C007C007C00000000000000001F7C00000000
      000000000000000000000000000000000000000000000000000000000000E05E
      E05EE05E00000000000000000000000000001042104210421042104210421042
      1042104210421042104210421042104200000000000000000000104210420000
      00000000000000000000000000000000007C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      E05EE05EE05E0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000007C0000000000000000000000000000
      000000000000000000000000000000000000E05EE05EE05EE05EE05EE05EE05E
      E05EE05EE05EE05EE05EE05EE05EE05EE05E0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E05EE05EE05EE05EE05EE05EE05E
      E05EE05EE05EE05EE05EE05EE05EE05EE05E0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000001042104210421042104210421042000000000000000000000000E05E
      E05EE05EE05EE05EE05EE05EE05EE05EE05E0000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000000000000000000000000000
      0000000010421042104210421042104210420000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      E05EE05EE05EE05EE05EE05EE05EE05EE05E0000000010421042104210421042
      1042104210421042104210421042104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E05EE05EE05EE05EE05EE05EE05E
      E05EE05EE05EE05EE05EE05EE05EE05EE05E0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001F000000000010421042
      104210421042104210421042104210421042000000000000000000000000E05E
      E05EE05EE05E0000E05EE05EFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000000000000000000010421042
      1042104210421042104210421042104210420000000000001F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      E05EE05EE05EE05E0000E05EE05E000000001042104210421042104210421042
      1042104210421042104210421042104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000001F00000000000000
      000000000000000000000000000000000000E05EE05EE05EE05EE05EE05EE05E
      E05EE05EE05EE05E0000E05EE05EE05EE05E0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000001F001F001F00000000001F00
      00001F0000001F001F0000001F0000000000E05E1F00E05E1F00E05E1F00E05E
      E05EE05E00000000FF7FE05EE05E0000E05E1042000010421042000010420000
      0000000010420000FF7F0000FF7F00000000000000000000000000000000005C
      0000005C0000005C005C0000005C0000000000001F001F001F00000000001F00
      00001F0000001F00000000001F0000000000E05E1F00E05EE05EE05EE05EE05E
      E05EE05E000000000000E05EE05E0000E05E1042000010420000000010420000
      000000001042000000000000000000000000000000000000000000000000005C
      0000005C0000005C00000000005C000000000000000000000000000000001F00
      1F00000000001F001F0000001F0000001F00E05E1F00E05EE05EE05EE05EE05E
      E05EE05EE05EE05EE05EE05EE05E000000000000000010421042000010420000
      104200001042000000000000000000000000000000000000000000000000005C
      005C00000000005C005C0000005C0000005C00001F001F001F00000000001F00
      00001F0000001F00000000001F001F0000001F001F00E05EE05EE05EE05EE05E
      E05EE05E00000000FF7FE05EE05E0000E05E1042000010420000000010421042
      000010421042000000000000000000000000000000000000000000000000005C
      0000005C0000005C00000000005C005C000000001F001F001F00000000001F00
      1F00000000001F001F0000001F0000000000E05E1F00E05EE05EE05EE05EE05E
      E05EE05E000000000000E05EE05E000000000000000010421042000010420000
      000000001042000000000000000000000000000000000000000000000000005C
      005C00000000005C005C0000005C000000000000000000000000000000000000
      000000000000000000000000000000000000E05EE05EE05EE05EE05EE05EE05E
      E05EE05EE05EE05EE05EE05EE05EE05EE05E0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000104210421042104210421042
      104210421042104210421042104210421042000000000000000000000000E05E
      E05EE05EFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000104210421042104210421042
      1042104210421042104210421042104210420000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      E05EE05EE05E0000000000000000000000001042104210421042104210421042
      1042104210421042104210421042104210420000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E05EE05EE05EE05EE05EE05EE05E
      E05EE05EE05EE05EE05EE05EE05EE05EE05E0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E05EE05EE05EE05EE05EE05EE05E
      E05EE05EE05EE05EE05EE05EE05EE05EE05E0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010020000000000000000
      0002000000000000000010020000000000000000000000000000000000000000
      0000000000001042104210421042104210420000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000021002007CFF7F0002
      10020002FF7FE07F100200021002FF03FF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010020002FF7FFF031002
      00021002007CFF7F000210020002FF7FE0030000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000021002000210020002
      100200021002000210020002100200021002000000001F000000000000001042
      1042104210421042104210421042104210420000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010020002100200021002
      0002100200021002000210020002100200020000000000001F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001700104200000000
      0000000000000000000000000000000000000000000000021002000210020002
      1002000210020002100200021002000210020000000000001F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010421700000000000000
      0000000017001700170017001700000000000000000010020002100200021002
      00021002000210020002100200021002000200001F001F001F00000000001F00
      00001F0000001F001F0000001F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000017000000000000000000
      0000000000001700170017001700000000000000000000021002000210020002
      10020002100200021002000210020002100200001F001F001F00000000001F00
      00001F0000001F00000000001F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000017000000000000000000
      0000000000000000170017001700000000000000000010020002100200021002
      0002100200021002000210020002100200020000000000000000000000001F00
      1F00000000001F001F0000001F0000001F000000000000000000000000000000
      0000000000000000000000000000000000000000000017000000000000000000
      0000000000001700000017001700000000000000000000021002000210020002
      10020002100200021002000210020002100200001F001F001F00000000001F00
      00001F0000001F00000000001F001F00000000000000000000000000007C007C
      007C007C007C007C007C007C007C007C00000000000010421700000000000000
      0000170017000000000000001700000000000000000010020002100200021002
      00021002000210020002100200021002000200001F001F001F00000000001F00
      1F00000000001F001F0000001F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042170017001700
      1700000000000000000000000000000000000000000018631F001F001F001F00
      1F001F001F001F001F001F001F001F001F000000000000000000000000000000
      00000000000000000000000000000000000000000000007C007C0000007C007C
      007C007C007C007C007C007C007C007C00000000000000000000000000000000
      0000000000000000000000000000000000000000000018631F001F001F001F00
      1F001F001F001F001F001F001F001F001F000000104210421042104210421042
      1042104210421042104210421042104210420000000000000000000000000000
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
      E07FE07FE07FE07F0000E05E0000104210420000000000000000000000000000
      E07FE07FE07FE07F0000E05E0000104210420000000000000000000000000000
      0000000000000000000010420000000000000000000000000000000000000000
      000000000000000000001042000000000000000000000000000000000000E07F
      E07FE07FE07F0000E05EE05EE05E00001042000000000000000000000000E07F
      E07FE07FE07F0000E05EE05EE05E000010420000000000000000000000000000
      E003E003E003E003E00300000000104200000000000000000000000000000000
      E003E003E003E003E0030000000010420000000000000000000000000000E07F
      E07FE07FE07F0000E05EE05EE05E00001042000000000000000000000000E07F
      E07FE07FE07F0000E05EE05EE05E000010420000000000000000000000000000
      E003E003E003E003E003E003E002000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C
      1F7C1F7C1F7C1F7C1F7C1F7C1F7C000000000000000000000000000000000000
      0000000000000000E05EE05EE05E000010420042004200420042004200420042
      0042004200420042004200420042004200420000000000000000000000000000
      E003E003E003E003E003E002E003E00200001F7C1F7C1F7C1F7C1F7C17001700
      170017001F7C1F7C1F7C1F7C1F7CE00200000000000000000000000000000000
      000010420000E05EE05EE05EE05E000010420042004200420042004210420000
      1042004200420042004200420042004200420000000000000000000000000000
      00000000000000000000E003E002E00200001F7C1F7C1F7C1700170017001700
      17001700170017001F7C1F7C1F7CE00200000000000000000000000000000000
      000000000000E05EE05EE05EE05E000010420042004200421042000000001042
      0042004200420042004200420042004200420000000000000000000000000000
      0000000000000000000000000000E00200001F7C1F7C1700170017001F7C1F7C
      1F7C1F7C1700170017001F7C1F7CE00200000000000000000000000000000000
      E07FE07F0000E05EE05EE05EE05E000010420042004200420000000010420042
      0042004200420042004200420042004200420000000000000000000000000000
      0000000000000000000000000000000000001F7C1F7C170017001F7C1F7C1F7C
      1F7C1F7C1F7C170017001F7C1F7C00000000000000000000000000000000E07F
      E07FE07FE07F0000E05EE05EE05E000010420042004210420000104200420042
      0042004200420042004200420042004210420000000000000000000000000000
      0000000000000000000000000000000000001F7C170017001F7C1F7C1F7C1F7C
      1F7C1F7C1F7C1F7C170017001F7C0000000000000000000000000000E07FE07F
      E07FE07FE07FE07F0000E05EE05E000010420042004200000000004200420042
      0042004200420042004200420042004210420000000000000000000000000000
      0000000000000000000000000000E00200001F7C170017001F7C1F7C1F7C1F7C
      1F7C1F7C1F7C1F7C170017001F7CE00200000000000000000000E07FE07FE07F
      E07FE07FE07FE07FE07F0000E05E000010420042004200000000004200420042
      000000000000000000000042004200421042000000000000E003000000000000
      00000000000000000000E003E002E00200001F7C170017001F7C1F7C1F7C1F7C
      1F7C1F7C1F7C1F7C170017001F7CE0020000000000000000000000000000E07F
      E07FE07FE07F000000000000E05E000010420042004200000000104200420042
      00421042000000000000004200420042104200000000E003E003E003E003E003
      E003E003E003E003E003E002E003E00200001F7C170017001F7C1F7C1F7C1F7C
      1F7C1F7C1F7C1F7C170017001F7CE0020000000000000000000000000000E07F
      E07FE07FE07F0000E05EE05EE05E000010420042004210420000000010420042
      1042000000000000000000420042004210420000E003E003E003E003E003E003
      E003E003E003E003E003E003E002000000001F7C1F7C170017001F7C1F7C1F7C
      1F7C17001F7C170017001F7C1F7C000000000000000000000000000000000000
      E07FE07FE07FE07F0000E05E0000104200000042004200420000000000000000
      00000000000010420000004200420042004200000000E003E003E003E003E003
      E003E003E003E003E00300000000000000001F7C1F7C170017001F7C1F7C1F7C
      1F7C17001700170017001F7C1F7C000000000000000000000000000000000000
      E07FE07FE07FE07F0000E05E0000000000000042004200420042104200000000
      000010420042004200000042004200420042000000000000E003000000000000
      0000000000000000000010420000000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C
      1F7C1700170017001F7C1F7C1F7C000000000000000000000000000000000000
      00000000000000000000E05E0000000000000042004200420042004200420042
      0042004200420042004200420042004200420000000000000000000000000000
      0000000000000000000000000000000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C
      1F7C17001700170017001F7C1F7C000000000000000000000000000000000000
      0000000000000000000000000000000000000042004200420042004200420042
      0042004200420042004200420042004200420000000000000000000000000000
      0000000000000000000000000000000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C
      1F7C1F7C1F7C1F7C1F7C1F7C1F7C000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7F00000000FF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7F0000FF7FFF7FFF7FFF7FFF7FFF7F000000000000FF7FFF7FFF7FFF7FFF7F
      FF7F00000000FF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7F1042104210421042
      FF7F0000FF7F1042104210421042FF7F000000000000FF7F00000000FF7FFF7F
      FF7F00000000FF7F0000000000000000FF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7F0000FF7FFF7FFF7FFF7FFF7FFF7F000000000000FF7FFF7FFF7FFF7FFF7F
      FF7F00000000FF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000
      0000000000000000000000000000000000000000104200000000000000000000
      10420000000000000000000000000000000000000000FF7F1042104210421042
      FF7F0000FF7F1042104210421042FF7F000000000000FF7F0000000000000000
      FF7F00000000FF7F0000000000000000FF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7F0000FF7FFF7FFF7FFF7FFF7FFF7F000000000000FF7FFF7FFF7FFF7FFF7F
      FF7F00000000FF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7F1042104210421042
      FF7F0000FF7F1042104210421042FF7F000000000000FF7F0000000000000000
      FF7F00000000FF7F00000000FF7FFF7FFF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7F0000FF7FFF7FFF7FFF7FFF7FFF7F000000000000FF7FFF7FFF7FFF7FFF7F
      FF7F00000000FF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7F1042104210421042
      FF7F0000FF7F1042104210421042FF7F000000000000FF7F000000000000FF7F
      FF7F00000000FF7F0000000000000000FF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000001042000010420000
      00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7F0000FF7FFF7FFF7FFF7FFF7FFF7F000000000000FF7FFF7FFF7FFF7FFF7F
      FF7F00000000FF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7F1042104210421042
      FF7F0000FF7F1042104210421042FF7F000000000000FF7F0000000000000000
      FF7F00000000FF7F0000000000000000FF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7F0000FF7FFF7FFF7FFF7FFF7FFF7F000000000000FF7FFF7FFF7FFF7FFF7F
      FF7F00000000FF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7F00000000FF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000104200000000000000000000
      00000000104200000000000000000000000000000000FF7F1863186318631863
      1863186318631863186318631863186318630000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E05EE05EE05EE05EE05E
      E05EE05E000000000000000000000000000000000000FF7F1863186318631863
      1863186318631863186318631863186318630000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7F0000000000000000
      0000E05E000000000000000000000000000000000000FF7F1863186318631863
      1863186318631863186318631863007C007C0000000000000000000000000000
      0000000000000000000000000000000000000042004200420042004200420042
      00420042004200420042004200420042004200000000E07F0000104200001042
      0000E05E000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000
      0000000000000000000000000000000000000042004200000000000000000000
      00000000000000000000000000000042004200000000FF7F0000000000000000
      0000E05E0000FF7FFF7FFF7FFF7FFF7F00000000104200000000104210421042
      1042104210421042104210421042104210420000000000000000000000000000
      0000000000000000000000000000000000000042000010421042104210421042
      10421042104210421042104210420000004200000000E07FFF7FE07FFF7FE07F
      FF7FE07F0000FF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF7F00000000000000000000000000000042000000000000000000000000
      0000000000000000007C007C1042000000420000104200000000000000000000
      000000001042104210421042FF7FFF7F00000000000000000000104210421042
      1042104210421042104210421042104210420000000000000000000000000000
      0000FF7FFF7F0000000000000000000000000042000000000000000000000000
      0000000000000000000000001042000000420000000000000000E05E0000E05E
      0000FF7F1042E07FFF7F1042FF7FFF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF7FFF7FFF7FFF7F000000000000000000000042004200000000000000000000
      0000000000000000000000000000004200420000000000000000E05EE05EE05E
      0000FF7F1042FF7FE07F1042FF7FFF7F00000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF7F
      FF7F000000000000000000000000000000000042004200420000FF7F1F001F00
      1F001F001F001F00FF7F00000042004200420000000000000000000000000000
      FF7FFF7F1042E07F10421042FF7FFF7F00000000000000000000000000000000
      00000000000000000000000010420000000000000000000000000000FF7FFF7F
      0000000000000000000000000000000000000042004200420000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000042004200420000000000000000000000000000
      FF7FFF7F104210421042FF7FFF7FFF7F00000000000000000000000000000000
      0000000000000000000000000000FF03FF7F00000000FF7F00000000FF7F0000
      0000000000000000000000000000000000000042004200420000FF7F1F001F00
      1F001F001F001F00FF7F00000042004200420000000000000000000000000000
      FF7FFF7FFF7FFF7FFF7F00000000000000000000000000001042000000000000
      000000000000000000000000FF03FF7F000000000000FF7FFF7F000000000000
      0000000000000000000000000000000000000042004200420000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000042004200420000000000000000000000000000
      FF7FFF7FFF7FFF7FFF7F0000FF7F000000000000000000000000FF031000FF03
      FF7FFF03FF7FFF03FF7F1042FF7FFF030000000000000000FF7FFF7F00000000
      0000000000000000000000000000000000000042004200420000FF7F1F001F00
      1F001F001F001F00FF7F00000042004200420000000000000000000000000000
      FF7FFF7FFF7FFF7FFF7F00000000000000000000000000001042000000000000
      000000000000000000000000FF03FF7F00000000000000000000000000000000
      0000000000000000000000000000000000000042004200420000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000042004200420000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF03FF7F0000000000000000000000000000
      0000000000000000000000000000000000000042004200420000000000000000
      0000000000000000000000000042004200420000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000001042000000000000000000000000000000000000
      0000000000000000000000000000000000000042004200420042004200420042
      0042004200420042004200420042004200420000000000000000104218631042
      1863104218631042186310420000104200000000000000001863186318631863
      1863186318631863186300001863000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000010420000000000000000000000000000
      0000000000000000000000000000186300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000001042005C10420000000000000000FF7F1863FF7F1863
      FF7F1863E003E003E0031863FF7F000000000000000018631863186318631863
      1863FF7FFF7FFF7F186318630000000000000000000000001700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000005C005C005C00000000000000001863FF7F1863FF7F
      1863FF7F007C007C007CFF7F1863000010420000000018631863186318631863
      1863007C007C007C186318630000186300000000000000001700170000000000
      0000E05EE05EE05EE05EE05E00000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7F0000000000001042005C104200000000000000000000000000000000
      0000000000000000000000000000000018630000000000000000000000000000
      0000000000000000000000000000186318631700170017001700170017000000
      0000000000000000000000000000E05E000000000000FF7F1042104210421042
      1042FF7F00000000000000000000000000000000000000001863FF7F1863FF7F
      1863FF7F1863FF7F1863FF7F0000186300000000000018631863186318631863
      1863186318631863186300001863000018630000000000001700170000000000
      0000FF7F0000FF7F0000FF7F00000000000000000000FF7F1042FF7FFF7FFF7F
      1042FF7F0000000000000000005C000000000000000000000000000000000000
      000000000000000000000000FF7F000018630000000000000000000000000000
      0000000000000000000018630000186300000000000000001700000000000000
      00000000000000000000000000001042000000000000FF7F1042104210421042
      1042FF7F0000000000001042005C1042000000000000000000000000E07FFF7F
      FF7FFF7FE07FFF7FFF7FFF7F0000FF7F00000000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00001863000018630000000000000000000000000000
      00000000FF7FFF7FFF7FFF7F00000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7F000000000000005C005C005C0000000000000000000000000000FF7F
      00000000000000000000FF7F00000000000000000000000000000000FF7F1F00
      1F001F001F001F00FF7F00000000000000000000000000000000000000000000
      00000000FF7F10421042FF7F00000000000000000000FF7F1042104200000000
      0000FF7F000000000000005C005C005C0000000000000000000000000000FF7F
      E07FFF7FFF7FFF7FE07FFF7FFF7F0000000000000000000000000000FF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F000000000000000000000000FF7FFF7FFF7F0000
      000000000000FF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7F0000
      00000000000000000000005C005C005C00000000000000000000000000000000
      FF7F00000000000000000000FF7F00000000000000000000000000000000FF7F
      1F001F001F001F001F00FF7F00000000000000000000000000000000FF7F0000
      00000000000000000000000000000000000000000000FF7F1042104200000000
      00000000000000000000005C005C005C00000000000000000000000000000000
      FF7FFF7FE07FFF7FFF7FFF7FE07FFF7F0000000000000000000000000000FF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000FF7FFF7FFF7F0000FF7F0000
      00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7F0000
      00000000000000000000005C005C005C00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7F1042FF7F000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000005C005C005C00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7F1042FF7F000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000005C000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7FFF7F0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000186318631863186318631863
      1863186318631863186318631863186318630000000000000000000000000000
      1700170017001700170017001700170017000000000018631042104210421042
      10420000FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000FF7F1863186318631863
      1863186318631863186318631863186318630000186318631863186318631863
      1863000018631863186318631863000018630000000000000000000000000000
      1700FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000FF7F1863186318631863
      18630000FF7F1F001F001F001F001F001F0000000000FF7F1863186318631863
      1863186318631863186318631863186318630000186318631863186318631863
      000000001863186318631863000000001863000000001042E05E1042E05E1042
      1700FF7F170017001700170017001700FF7F00000000FF7F1863186318631863
      18630000FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000FF7F1863186318631863
      1863186318631863000200021863007C007C0000186318631863186318630000
      00000000186318631863000000000000186300000000E05E1042E05E1042E05E
      1700FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000FF7F1863186318631863
      18630000FF7F1F001F001F001F00FF7FFF7F00000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000186318631863186300000000
      000000001863186300000000000000001863000000001042E05E1042E05E1042
      1700FF7F170017001700FF7F17001700170000000000FF7F1863186318631863
      18630000FF7FFF7FFF7FFF7FFF7FFF7F00000000104200000000104210421042
      1042104210421042104210421042104210420000186318631863000000000000
      00000000186300000000000000000000186300000000E05E1042E05E1042E05E
      1700FF7FFF7FFF7FFF7FFF7F1700FF7F170000000000FF7F1863186318631863
      18630000FF7F1F001F001F00FF7F104200000000000000000000000000000000
      0000000000000000000000000000000000000000186318631863186300000000
      000000001863186300000000000000001863000000001042E05E1042E05E1042
      1700FF7FFF7FFF7FFF7FFF7F17001700000000000000FF7F1863186318631863
      18630000FF7FFF7FFF7FFF7FFF7F1042000000000000000000000000FF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000186318631863186318630000
      00000000186318631863000000000000186300000000E05E1042E05E1042E05E
      17001700170017001700170017000000000000000000FF7F1863186318631863
      18630000000000000000000000000000000000000000000000000000FF7F0000
      0000000000000000000000000000FF7F00000000186318631863186318631863
      000000001863186318631863000000001863000000001042E05E1042E05E1042
      E05E1042E05E1042E05E1042E05E0000000000000000FF7F1863186318631863
      18631863186318631863186318631863104200000000000000000000FF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000186318631863186318631863
      18630000186318631863186318630000186300000000E05E1042000000000000
      00000000000000000000104210420000000000000000FF7F1863000000000000
      00000000000000000000000000001863104200000000000000000000FF7F0000
      0000000000000000000000000000FF7F00000000186318631863186318631863
      1863186318631863186318631863186318630000000010421042000018631863
      186318631863186300001042E05E0000000000000000FF7F18630000E07FE07F
      E07FE07FE07FE07FE07FE07F00001863104200000000000000000000FF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000186318631863186318631863
      18631863186318631863186318631863186300000000E05E1042E05E0000E07F
      00000000E07F00001042E05E10420000000000000000FF7FFF7F10420000E07F
      FF7FFF7FFF7FFF7FFF7F00001042FF7F186300000000000000000000FF7F0000
      0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000186318631863186318631863
      1863186318631863186318631863186318630000000000000000000000000000
      E07FE07F00000000000000000000000000000000000000000000000000000000
      E07F10421042FF7F0000000000000000000000000000000000000000FF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00001863000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      E07FFF7FFF7FFF7F000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001863186318631863186318631863
      1863186318631863186318631863186318630000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001863186318631863186318631863
      1863186318631863186318631863186318630000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FFF0300000040FF7F
      007C007C007C007C007CFF7FFF7FFF7F000000000000FF7FFF03000000400000
      0000000000000000004000400040004000000000186318631863186318631863
      1863186318631863186300001863186318630000000000000000000000000000
      00000000000000000000000000000000000000000000FF0300000040007C007C
      007C007C007C007C007C007C007CFF7FFF7F00000000FF03000000000000007C
      007C007C007C007C000000000040004000400000186318631863186318631863
      1863186318631863000000001863186318630000000000000000000000000000
      0000000000000000000000000000000000000000FF03FF7F00000040007C007C
      007C007C007C007C007C007C007C007CFF7F0000FF03FF7F0000007C007C007C
      007C007C007C007C007C007C0000004000400000186318631863186318631863
      1863186318630000000000001863186318630000000000000000000000000000
      0000000000000000000000000000000000000000FF7F000000400040007C007C
      007C007C007C007C007C007C007C007CFF7F0000FF7F0000007C007C007C007C
      007C007C007C007C007C007C007C000000400000186318631863186318631863
      1863186300000000000000001863186318630000000000000000000000000000
      0000000000000000000000000000000000000000FF030000004000400040007C
      007C007C007C007C007C007C007C007C007C0000FF030000007C007C007C007C
      007C007C007C007C007C007C007C000000400000186318631863186318631863
      1863000000000000000000001863186318630000000000000000000000000000
      0000000000000000000000000000000000000000FF7F0000004000400040007C
      007C007C007C007C007C007C007C007C007C00000000007C007C007C007C007C
      007C007C007C007C007C007C007C007C00000000186318631863186318631863
      0000000000000000000000001863186318630000000000000000000000000000
      0000000000000000000000000000000000000000FF0300000040004000400040
      007C007C007C007C007C007C007C007C007C00000000007C007C007C007C007C
      007C007C007C007C007C007C007C007C00000000186318631863186318631863
      1863000000000000000000001863186318630000000000000000000000000000
      0000000000000000000000000000000000000000FF7F00000040004000400040
      007C007C007C007C007C007C007C007C007C00000000007C007C007C007C007C
      007C007C007C007C007C007C007C007C00000000186318631863186318631863
      1863186300000000000000001863186318630000000000000000000000000000
      0000000000000000000000000000000000000000FF03FF7F0000004000400040
      0040007C007C007C007C007C007C007C007C00000000007C007C007C007C007C
      007C007C007C007C007C007C007C007C00000000186318631863186318631863
      1863186318630000000000001863186318630000000000000000000000000000
      00000000000000000000000000000000000000000000FF030000004000400040
      00400040007C007C007C007C007C007C007C00000000007C007C007C007C007C
      007C007C007C007C007C007C007C007C00000000186318631863186318631863
      1863186318631863000000001863186318630000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FFF03000000400040
      0040004000400040007C007C007C007CFF7F000000000000007C007C007C007C
      007C007C007C007C007C007C007C000000400000186318631863186318631863
      1863186318631863186300001863186318630000000000000000000000000000
      000000000000000000000000000000000000000000000000FF7FFF0300000040
      004000400040004000400040004000400000000000000000007C007C007C007C
      007C007C007C007C007C007C007C000000000000186318631863186318631863
      1863186318631863186318631863186318630000000000000000000000000000
      0000000000000000000000000000000000000000000010420000FF7FFF030000
      00000040004000400040004000000000FF030000000010420000007C007C007C
      007C007C007C007C007C007C00000000FF030000186318631863186318631863
      1863186318631863186318631863186318630000000000000000000000000000
      00000000000000000000000000000000000000000000000010420000FF7FFF03
      FF7F00000000000000000000FF7FFF03FF7F000000000000104200000000007C
      007C007C007C007C00000000FF7FFF03FF7F1863000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF03FF7FFF03FF7FFF03FF7FFF03000000000000000000000000000000000000
      0000000000000000FF03FF7FFF03000000001863186318631863186318631863
      1863186318631863186318631863186318630000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001863186318631863186318631863
      1863186318631863186318631863186318630000000000001042000000000000
      000000000000104200001F7C1042000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000104210421042
      0000E003000000001F7C1F7C1042000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000E003E003E003E003
      E003E003104200001F7C1F7C1042000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000F702F702F702F7020000000000000000000000001700170017001700
      1700170017001700170017000000000000000000000000000000000000000000
      E00300000000000000001F7C1042000000000000000010420000000000000000
      0000000000000000000010420000000000000000000000000000000000000000
      0000F702F702F702F702F702F702000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E0031042E003
      E00310420000000000001F7C1F7C00401F7C0000000000000000000000000000
      0000000010420000000000000000000000000000000000000000000000000000
      0000F702F702F702F702F702F702000000000000170000000000000000000000
      000000000000000000001700000000000000000000000000000000000000E003
      0000000000000000104210420000004000000000000000001042000000000000
      0000000000000000104200000000000000000000000000001700170017001700
      0000F702F702F702F702F702F702000000000000170000000000000000000000
      00000000000000001700000000000000000000000000000000000000E003E003
      10420000104200001F001F000000104200000000000000000000000000000000
      0000104200000000000000000000000000000000000000000000170017001700
      0000F702F702F702F702F702F702000000000000170000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000001F001F001F0000000000000010420000000000000000104200001042
      0000000000001042000000000000000000000000000000000000000017001700
      17000000F702F702F702F7020000E07F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001F0000000000000000000000000000000000
      1042000000000000000000000000000000000000000000000000000000001700
      000000000000000000000000E07FFF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000104200001F001F0000001F001F0000000000000000000000000010420000
      0000000010420000000000000000000000000000000000000000000000000000
      00000000FF7FE07FFF7FE07FFF7FE07F00000000000000000000000000000000
      0000000000000000170000000000000000000000000000000000000000000000
      0000000000001F00104200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000E07FFF7FE07FFF7FE07FFF7F00000000000000001700000000000000
      0000000000000000000017000000000000000000000000000000000000000000
      0000104200001F00104200001F00000010420000000000000000000000001042
      0000104200000000000000000000000000000000000000000000000000000000
      00000000FF7FE07FFF7FE07FFF7FE07F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001F001F001F0000001F001F00000000000000000000000000000000000000
      1042000010420000104200001042000010420000000000000000000000000000
      00000000E07FFF7FE07FFF7FE07FFF7F00000000000000000000000000000000
      1700170017001700170017000000000000000000000000000000000000000000
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
      0000000000000000000010421042000000000000000000000000000000000000
      0000000000000000000010421042000000000000000000000000000000000000
      0000000000000000000010421042000000000000000000000000000000000000
      000000000000005C005C00000000005C005C0000000000000000000000000000
      0000000000000000000000001042000000000000000000000000000000000000
      0000000000000000000000001042000000000000000000000000000000000000
      0000000000000000000000001042000000000000000017001700170017001700
      170000000000005C005C00000000005C005C0000000000000000000000000000
      00001863FF7FFF7F000010420000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000170000000000000000000000
      1700000000000000005C005C0000005C005C0000000000000000000000000000
      00001863FF7FFF7F000010421042000000000000000000000000000000000000
      0000000000000000000000000000000000001863186318631863186318631863
      1863186318631863186318630000000000000000170000000000000000000000
      17000000000000000000005C005C005C005C0000000000000000000000000000
      1863FF7FFF7FFF7FFF7F00001042000000000000000000000000000000000000
      0000000000000000000000000000000000001863186318631863186318631863
      1863186318631863186318630000000000000000000017001700170017001700
      170000000000005C005C00000000005C005C0000000000000000000000000000
      FF7FFF7F0000FF7FFF7F00001042104200000000000000000000000000000000
      0000000000000000000000000000104200001863186318631863186300000000
      0000186318631863186318630000104200000000000000000000000000000000
      1700000000000000005C005C005C005C00000000000000000000000000001863
      FF7FFF7FFF7FFF7FFF7FFF7F000010420000000000000000000000000000FF7F
      0000000000000000000000000000104200001863186318631863186300001F00
      0000186318631863186318630000104200000000000017001700170017001700
      0000000000000000000000000000000000000000000000000000000000001863
      FF7FFF7F0000FF7FFF7FFF7F000010420000000000000000000000000000FF7F
      0000000000000000000000000000104200001863186318631863186300001F00
      0000186318631863186318630000104200000000000000000000000000000000
      0000000000000000104210420000104200000000000000000000000000001863
      FF7FFF7F0000FF7FFF7FFF7F000010420000000000000000000000000000FF7F
      0000000000000000000000000000104200001863186300000000000000001F00
      0000000000000000186318630000104200000000000000000000000000000000
      0000000000001042000000001042104200000000000000000000000000000000
      1863FF7F0000FF7FFF7F0000104200000000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7F0000000000000000000000001863186300001F001F001F001F00
      1F001F001F000000186318630000000000000000000000000000000000000000
      0000000000001042000000000000104200000000000000000000000000000000
      1863FF7F0000FF7FFF7F0000000000000000000000000000000000000000FF7F
      0000000000000000000000000000000000001863186300000000000000001F00
      0000000000000000186318630000000000000000000000000000000000000000
      0000000000000000104210421042104210420000000000000000000000000000
      000018630000FF7F00001042000000000000000000000000000000000000FF7F
      0000000000000000000000000000000000001863186318631863186300001F00
      0000186318631863186318630000000000000000000000000000000000000000
      0000000000000000000000000000000010420000000000000000000000000000
      000018630000FF7F00000000000000000000000000000000000000000000FF7F
      0000000000000000000000000000000000001863186318631863186300001F00
      0000186318631863186318630000000000000000000000000000000000000000
      0000000000000000104200000000000010420000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001863186318631863186300000000
      0000186318631863186318630000000000000000000000000000000000000000
      0000000000000000000010421042104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001863186318631863186318631863
      1863186318631863186318630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001863186318631863186318631863
      1863186318631863186318630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010420000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000F702186300000000
      000000001863186318631863186318631863000000000000FF7F000018631863
      1863186318631863186318630000FF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F70218630000
      FF03000000000000186318631863186318630000104200000000104218631863
      1863007C007C007C186310420000000010420000000000000000000000000000
      0000000000000000104200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000018631863186318631863
      0000FF03000000000000186318631863186300000000FF7F0000186318631F00
      1F00007C007C007C18630000FF7F000000000000000000000000000000000000
      0000000000001042000000000000000000000000000000000000000000000000
      FF7FE07FFF7F0000000000000000000000000000000018631863186318631863
      0000FF0300000000000000001863186318630000000000000000186318631F00
      1F00007C007C007C186300000000000000000000000000000000000000000000
      000000001042000000000000000000000000000000000000000000000000FF7F
      1042FF7FE07FFF7F000000000000000000000000F70218631863186318631863
      18630000FF0300000000000000001863186300000000FF7F0000186318631F00
      1F001F001F00186318630000FF7F000000000000000000000000000000000000
      00001042000000000000000000000000000000000000000000000000FF7F1042
      FF7F18631042E07FFF7F0000000000000000F702000018631863186318631863
      18630000FF03FF03000000000000186318630000104200000000104218631F00
      1F001F001F001863186310420000000010420000000000000000000000000000
      1042000000000000000000000000000000000000000000000000FF7F1042FF7F
      18631042E07FFF7FE07F10420000000000000000F70218631863186318631863
      186318630000FF03FF030000000018631863000000000000FF7F000018631F00
      1F001F001F001863186318630000FF7F00000000000000000000000000001042
      000000000000000000000000000000000000000000000000FF7F1042FF7F1863
      1042E07FFF7FE07F10421863186300000000F702000018631863186318631863
      1863186318630000000000000000186318630000000000000000000018631863
      1863186318631863186318630000000000000000000000000000000010420000
      0000000000000000000000000000000000000000000000000000FF7F18631042
      E07FFF7FE07F104218631863186300000000F702F70218631863186318631863
      18631863186318630000FF7FFF7F00001863000000000000FF7F000000000000
      0000000000000000000000000000FF7F0000000000000000FF7FFF7F00000000
      000000000000000000000000000000000000000000000000000000000000E07F
      FF7FE07F1042186318631863000000000000F702F70218631863186318631863
      18631863186318630000FF7FFF7F000018630000000010420000000000001863
      186318631863186318631863104200000000000000000000FF7FFF7F00000000
      0000000000000000000000000000000000000000000000000000000000000000
      E07F10421863186318631042170000000000F702F70218631863186318631863
      186318631863186318630000FF7FFF7F00000000000000000000FF7F00001863
      186318631863007C007C007C18630000FF7F000000000000FF7F000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000018631863186300001700170017000000F702F70218631863186318631863
      186318631863186318630000FF7FFF7F00000000000000000000000000001863
      18631F001F00007C007C007C1863000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000001700170017001863F70218631863186318631863
      1863186318631863186318630000FF7F18630000000000000000FF7F00001863
      18631F001F00007C007C007C18630000FF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000170017001863186318631863186318631863
      1863186318631863186318630000FF7F18630000000000000000000000001863
      18631F001F001F001F0018631863000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001863186318631863186318631863
      1863186318631863186318631863186318630000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001863186318631863186318631863
      1863186318631863186318631863186318630000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000017000000005C000000000000000000000000005C00001700
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000017000000
      1700000017000000170000001700000000000000000000000000000000000000
      000000000000000017000000005C005C0000000000000000005C005C00001700
      00000000000000000000000000000000000000000000000000000000E07FFF7F
      E07FFF7FE07FFF7FE07FFF7FE07FFF7F00000000000000000000000017000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000017000000005C005C005C00000000005C005C005C00001700
      00000000000000000000000000000000000000000000000000000000FF7F1042
      1042104210421042104210421042E07F00000000000000000000170017001700
      0000000000000000000000001700000000000000000000000000000000000000
      000000000000000017000000005C005C005C0000005C005C005C005C00001700
      00000000000000000000000000000000000000000000104210420000E07FFF7F
      E07FFF7FE07FFF7FE07FFF7FE07FFF7F00000000000000000000000017000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000017000000005C005C005C00000000005C005C005C00001700
      00000000000000000000000000000000000000000000FF7FFF7F000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000001700000000000000000000000000000000000000
      000000000000000017000000005C005C0000000000000000005C005C00000000
      00000000000000000000000000000000000000000000FF7F1042104210421042
      10421042FF7F0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      000000000000000017000000005C000000000000000000000000005C00000000
      FF7FFF7FFF7FFF7FFF7F000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7F0000000000000000000000000000000000000000FF7FE07FFF7F
      E07F0000000000000000FF7FE07FFF7FE07F00000000FF7F104210421042FF7F
      0000000000000000000000000000000000000000000000000000000000000000
      FF7F104210421042FF7F000000000000000000000000FF7F1042104210421042
      10421042FF7F00000000000000000000000000000000FF7F0000000000000000
      000000000000FF7F0000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      0000000000000000000000000000000000000000000000000000000000000000
      FF7FFF7FFF7FFF7FFF7F000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7F00000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      000000000000FF7FFF7FFF7FFF7FFF7F000000000000FF7F104210421042FF7F
      0000000000000000000000000000000000000000000000000000000000000000
      FF7F104210421042FF7F000000000000000000000000FF7F1042104210421042
      10421042FF7F00000000000000000000000000000000FF7F104210421042FF7F
      000000000000FF7F104210421042FF7F000000000000FF7FFF7FFF7FFF7FFF7F
      0000000000000000000000000000000000000000000000000000000000000000
      FF7FFF7FFF7FFF7FFF7F000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7F00000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      000000000000FF7FFF7FFF7FFF7FFF7F000000000000FF7FFF7F000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF7FFF7F00000000000000000000000000000000000010421042104210421042
      1042104210420000E07FFF7FE07FFF7F000000000000FF7F104210421042FF7F
      000000000000FF7F104210421042FF7F000000000000000000000000FF7FE07F
      FF7FE07FFF7FE07FFF7F00000000000000000000000000000000000000000000
      000000000000FF7FE07FFF7FE07FFF7FE07F0000000000000000000000000000
      0000000000000000104210421042E07F000000000000FF7FFF7FFF7FFF7FFF7F
      000000000000FF7FFF7FFF7FFF7FFF7F000000000000000000000000E07FFF7F
      E07FFF7FE07FFF7FE07F00000000000000000000000000000000000000000000
      000000000000E07FFF7FE07FFF7FE07FFF7F00000000000000000000E07FFF7F
      E07FFF7FE07FFF7FE07FFF7FE07FFF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000005CFF7F0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000005C005CFF7F00000000005C175C
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF7FE07FFF7FE07FFF7FE07F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      1042104200000000000000000000000000000000005C005CFF7F005C005CFF7F
      0000000000000000000000000000000000000000000000000000000000000000
      00000000E07FFF7FE07FFF7FE07FFF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      10421042000000000000000000000000000000000000005C175C005C00000000
      000000000000000000000000000000000000000000000000000000000000FF7F
      FF7F000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001042000000000000000000001042104200000000175C005C005CFF7F0000
      000000000000000000000000000000000000000000000000FF7F00000000FF7F
      FF7FFF7FFF7FFF7F000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000010421042175C005C005C00000000005CFF7F
      00000000FF7FE07FFF7FE07FFF7FE07F00000000000000001042FF7F0000FF7F
      104210421042FF7F000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000104210420000
      000000000000000000000000000000001042005C175C00000000000000000000
      00000000E07FFF7FE07FFF7FE07FFF7F0000FF7F000000001042E07F0000FF7F
      FF7FFF7FFF7FFF7F000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042104210421042
      000000000000000000000000000000000000000000000000000000000000FF7F
      FF7F000000000000000000000000000000001042E07F00001042FF7F00001042
      FF7F10421042FF7F000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010421042104210420000
      000000000000000010421042000000000000000000000000000000000000FF7F
      FF7FFF7FFF7FFF7F0000000000000000000000001042FF7F1042E07F1042E07F
      FF7FFF7FFF7FFF7F000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010421042104200000000
      000000000000104210421042000000000000000000000000000000000000FF7F
      104210421042FF7F00000000000000000000FF7FFF7F1042E07FFF7FE07F0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010421042104200000000
      000000001042104210421042000000000000000000000000000000000000FF7F
      FF7FFF7FFF7FFF7F00000000000000000000000010421042FF7FE07FFF7F0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010421042000000000000
      000010421042104210420000000000000000000000000000000000000000FF7F
      104210421042FF7F0000000000000000000000001042FF7F1042FF7F1042E07F
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000010421042104210420000000000000000000000000000000000000000FF7F
      FF7FFF7FFF7FFF7F000000000000000000001042E07F00001042E07F00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000104210421042000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7F000000001042FF7F00000000
      1042FF7F00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042E07F00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000007C0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000007C0000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF7F
      E07FFF7FE07FFF7F000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000007C0000FF7FFF7FFF7F
      FF7FFF7F0000FF7FFF7FFF7FFF7FFF7F000000000000000000000000FF7FFF7F
      FF7FFF7FFF7FFF7F000000000000000000000000000000000000E07FFF7FE07F
      FF7FE07FFF7FE07FFF7FE07F0000000000000000000000000000000000001042
      00000000104200000000000000000000000000000000007C0000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F0000FF7FFF7F0000000000000000FF7FFF7FFF7FFF7F
      00000000FF7FFF7FFF7FFF7F000000000000000000000000E07FFF7FE07FFF7F
      E07FFF7FE07FFF7FE07FFF7FE07F000000000000104200000000000000000000
      00000000000000000000000000001042000000000000007C0000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7F0000FF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7F0000FF7F000000000000000000000000FF7FE07F0000E07F
      FF7FE07FFF7FE07FFF7FE07FFF7F000000000000000010421042000000001042
      10421042104200000000104210420000000000000000007C0000FF7FFF7FFF7F
      FF7FFF7FFF7F0000FF7FFF7FFF7FFF7F000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7F0000FF7FFF7FFF7F0000000000000000FF7FE07FFF7FE07F0000
      E07FFF7FE07FFF7FE07FFF7FE07FFF7F00000000000010421042000010421042
      10421042104210420000104210420000000000000000007C0000FF7F0000FF7F
      FF7FFF7F0000FF7FFF7FFF7F0000FF7F000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7F0000FF7FFF7FFF7FFF7F0000000000000000E07FFF7FE07FFF7FE07F
      0000E07FFF7FE07FFF7FE07FFF7FE07F00000000000010421042000010420000
      10421042104210420000104210420000000000000000007C0000FF7FFF7FFF7F
      FF7FFF7FFF7F0000FF7FFF7FFF7FFF7F000000000000FF7F0000FF7FFF7FFF7F
      00000000FF7FFF7FFF7F0000FF7F0000000000000000FF7FE07FFF7FE07FFF7F
      E07F000000000000000000000000FF7F0000000000001042104200001042FF03
      00001042104210420000104210420000000000000000007C0000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7F0000FF7FFF7FFF7F000000000000FF7F0000FF7FFF7FFF7F
      00000000FF7FFF7FFF7F0000FF7F0000000000000000E07FFF7FE07FFF7FE07F
      FF7FE07FFF7FE07FFF7FE07FFF7FE07F000000000000FF7FFF7F000000001042
      10421042104200000000FF7FFF7F0000000000000000007C0000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F0000FF7FFF7F000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7F0000FF7FFF7FFF7FFF7F0000000000000000FF7FE07FFF7FE07FFF7F
      E07FFF7FE07FFF7FE07FFF7FE07FFF7F000000000000FF7FFF7FFF7F00000000
      0000000000000000FF7FFF7FFF7F0000000000000000007C0000FF7FFF7FFF7F
      FF7FFF7F0000FF7FFF7FFF7F0000FF7F000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7F0000FF7FFF7FFF7F00000000000000000000FF7FE07FFF7FE07F
      FF7FE07FFF7FE07FFF7FE07FFF7F000000000000000000000000000000000000
      00000000000000000000000000000000000000000000007C0000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F000000000000000000000000E07FFF7FE07FFF7F
      E07FFF7FE07FFF7FE07FFF7FE07F000000000000000000000000000010420000
      FF7FFF7F000010420000000000000000000000000000007C0000000000000000
      000000000000000000000000000000000000000000000000FF7FFF7FFF7FFF7F
      00000000FF7FFF7FFF7FFF7F0000000000000000000000000000E07FFF7FE07F
      FF7F0000FF7FE07FFF7FE07F0000000000000000000000000000000000001042
      00000000104200000000000000000000000000000000007C007C007C007C007C
      007C007C007C007C007C007C007C007C007C00000000000000000000FF7FFF7F
      FF7FFF7FFF7FFF7F00000000000000000000000000000000000000000000FF7F
      E07FFF7FE07FFF7F000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7F1863186318631863
      1863186318631863000000000000000018630000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000000000000000
      00000000FF7FFF7FFF7FFF7FFF7F0000000000000000FF7F1863104210421042
      10421042104210421042104210421042104200000000FF7FFF7FFF7F00000000
      00000000000000000000FF7FFF7FFF7F000000000000FF7FFF7FFF7F0000FF7F
      FF7F0000FF7FFF7FFF7F00000000000000000000000000000000000000000000
      00000000FF7F1F001F001F00FF7F000000000000000000001042000000000000
      00000000000000000000000000000000104200000000FF7FFF7FFF7F00000000
      00000000000000000000FF7FFF7FFF7F000000000000FF7FFF7FFF7F00000000
      00000000FF7FFF7FFF7F00000000000000000000000000000000000000000000
      00000000FF7FFF7FFF7FFF7FFF7F000000000000000000000000186318631863
      1863186318631863186318631863104200000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FFF7FFF7F0000FF7F
      FF7F0000FF7FFF7FFF7F00001863186300000000000000000000000000000000
      00000000FF7F1F001F001F00FF7F000000000000000000000000186300000000
      0000000000000000000000001863104210420000000000000000000000000000
      0000FF7F000000000000000000000000000000000000FF7FFF7FFF7FFF7F0000
      0000FF7FFF7F0000000000001863186300000000000000000000000000000000
      00000000FF7FFF7FFF7FFF7FFF7F000000000000000000000000186300001F00
      17001F0017001F00170000001863104210420000000000000000000000000000
      FF7FFF7FFF7F00000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7F000000001863186318630000000000000000000000001F001F00
      1F000000FF7F1F001F001F00FF7F000000000000000000000000186300001700
      1F0017001F0017001F000000186310421042000000000000000000000000FF7F
      FF7FFF7FFF7FFF7F000000000000000000000000000000000000000000000000
      00000000000000001863000018631863000000000000F7020000000000000000
      00000000FF7FFF7FFF7FFF7FFF7F000000000000000000000000186300001F00
      17001F0017001F00170000001863104210420000000000000000000000000000
      FF7FFF7FFF7F0000000000000000000000000000000000000000000000000000
      18631863000000000000000018631863000000000000F702000000001F001F00
      1F00000000000000000000000000000000000000000000000000186300001700
      1F0017001F0017001F0000001863104210420000000000000000000000000000
      0000FF7F00000000000000000000000000000000000000001700000000000000
      18631863000018631863000018631863000000000000F7020000000000000000
      0000000000000000000000000000000000000000000000000000186300001F00
      17001F0017001F00170000001863104210420000000000000000000000000000
      0000000000000000000000000000000000000000000017001700170000000000
      18631863186300000000186318631863000000000000F702000000001F001F00
      1F00000000000000000000000000000017000000000000000000186300000000
      0000000000000000000000001863104210420000000000000000000000000000
      0000000000000000000000000000000000000000000000001700000000000000
      18631863186318631863186300000000000000000000F7020000000000000000
      0000000000000000000000000000170017000000000000000000186318631863
      1863186318631863186318631863104210420000000000000000000000000000
      FF7FFF7FFF7F0000000000000000000000000000000000001700000000000000
      18631863186318631863186300000000000000000000F7020000000000000000
      00000000000000000000000000000000170000000000000000000000FF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F10420000000000000000000000000000
      FF7FFF7FFF7F0000000000000000000000000000000000001700170000000000
      00000000000000000000000000000000000000000000F702F702F702F702F702
      0000000000000000170000000000000017000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000017001700170000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF7FFF7F
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF7F00000000
      00000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000
      0000000000000000000000000000000000000000104200000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000FF7F0000FF7FFF7F
      00000000FF7F00000000000000000000FF7F00000000E05EE05E000000000000
      0000000000000000E05EE05E0000000000000000000000001863E07F1863E07F
      1863E07F1863E07F1863E07F1863E07F00000000000000001042104210421042
      10420000FF7F10001000100010001000FF7F00000000FF7F0000FF7F00000000
      00000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000E05EE05E000000000000
      0000000000000000E05EE05E00000000000000000000FF7F00001863E07F1863
      E07F1863E07F1863E07F1863E07F186300000000000000000000000000000000
      00000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000FF7F0000FF7FFF7F
      00000000FF7F00000000000000000000FF7F00000000E05EE05E000000000000
      0000000000000000E05EE05E00000000000000000000E07F0000E07F1863E07F
      1863E07F1863E07F1863E07F1863E07F186300000000E07F000000000000FF7F
      00000000FF7F10001000100010001000FF7F00000000FF7F0000FF7F00000000
      00000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000E05EE05E000000000000
      0000000000000000E05EE05E00000000000000000000FF7FE07F0000E07F1863
      E07F1863E07F1863E07F1863E07F1863E07F00000000E07F000000000000FF7F
      00000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000FF7F0000FF7FE07F
      00000000FF7F00000000FF7F00000000000000000000E05EE05EE05EE05EE05E
      E05EE05EE05EE05EE05EE05E00000000000000000000E07FFF7F00001863E07F
      1863E07F1863E07F1863E07F1863E07F186300000000E07FE07F000000000000
      00000000FF7F10001000FF7F00000000000000000000FF7F0000FF7FE07FFF7F
      E07F0000FF7FFF7FFF7FFF7F0000FF7F000000000000E05EE05E000000000000
      0000000000000000E05EE05E00000000000000000000FF7FE07FFF7F00000000
      0000000000001863E07F1863E07F1863E07F00000000E07FE07FE07FE07FE07F
      E07F0000FF7FFF7FFF7FFF7F0000FF7F0000000000000000FF7FE07FFF7FE07F
      FF7F0000FF7FFF7FFF7FFF7F00000000000000000000E05E0000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7F0000E05E00000000000000000000E07FFF7FE07FFF7FE07F
      FF7FE07FFF7F00000000000000000000000000000000E07FE07F000000000000
      00000000FF7FFF7FFF7FFF7F00000000000000000000FF7FE07FFF7FE07FFF7F
      E07F0000000000000000000000000000000000000000E05E0000FF7FFF7FFF7F
      1F00FF7FFF7FFF7F0000E05E00000000000000000000FF7FE07FFF7FE07FFF7F
      E07FFF7FE07FFF7FE07FFF7FE07F0000000000000000E07F0000FF7FFF7FFF7F
      FF7F000000000000000000000000000000000000000000000000E07FFF7FE07F
      FF7FE07FFF7FE07FFF7F000000000000000000000000E05E0000FF7FFF7F1F00
      1F001F00FF7FFF7F0000E05E00000000000000000000E07FFF7FE07FFF7FE07F
      FF7FE07FFF7FE07FFF7FE07FFF7F0000000000000000E07F0000FF7FFF7FFF7F
      FF7FFF7F0000E07F00001042000000000000000000000000000000000000FF7F
      E07FFF7FE07FFF7F0000000000000000000000000000E05E0000FF7FFF7FFF7F
      1F001F001F00FF7F0000000000000000000000000000FF7FE07FFF7FE07FFF7F
      00000000000000000000000000000000000000000000E07F0000FF7FFF7FFF7F
      FF7FFF7F0000E07F000010420000000000000000000000000000000000000000
      0000E07F000000000000000000000000000000000000E05E0000FF7FFF7FFF7F
      FF7F1F001F001F0000001F000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E07F0000FF7FFF7FFF7F
      FF7FFF7F0000E07F000010420000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000001F001F001F001F000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001F001F001F000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000001F001F001F001F000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E07FFF7FE07F
      FF7FE07FE07FFF7FE07FFF7FE07FFF7F00000000000000000000000000001042
      00001863FF7FFF03FF7FFF031863000010420000000000000000000000001042
      00001863FF7FFF03FF7FFF031863000010420000000000000000000000001042
      00001863FF7FFF03FF7FFF0318630000104200000000000010420000E07FFF7F
      E07FFF7FFF7FE07FFF7FE07FFF7FE07FFF7F0000000000000000000000000000
      FF03FF7FFF03FF7FFF03FF7FFF03FF7F00000000000000000000000000000000
      FF03FF7FFF03FF7FFF03FF7FFF03FF7F00000000000000000000000000000000
      FF03FF7FFF03FF7FFF03FF7FFF03FF7F0000000000000000E07F0000FF7FE07F
      FF7FE07FE07FFF7FE07FFF7FE07FFF7FE07F0000000000000000000000001863
      FF7FFF03FF7FFF03FF7FFF03FF7FFF0318630000000000000000000000001863
      FF7FFF03FF7FFF03FF7FFF03FF7FFF0318630000000000000000000000001863
      FF7FFF03FF7FFF03FF7FFF03FF7FFF03186300000000000010420000E07FFF7F
      E07FFF7FFF7FE07FFF7FE07FFF7FE07FFF7F000000000000000000000000FF7F
      FF03FF7FFF03FF7FFF03FF7FFF03FF7FFF03E05E000000000000000000000000
      00000000000000000000FF7FFF03FF7FFF03E05E000000000000000000000000
      000000000000E05EE05EFF7FFF03FF7FFF03000000000000E07F10420000E07F
      FF7FE07FE07FFF7FE07FFF7FE07FFF7FE07F000000001042104210420000FF03
      FF7FFF03FF7FFF03FF7FFF03FF7FFF03FF7FE05E000018631042104210421042
      10421042104210420000FF03FF7FFF03FF7FE05E0000FF7FE003FF7FE003FF7F
      E003FF7F0000E05EE05EFF03FF7FFF03FF7F0000000000001042E07F0000FF7F
      E07FFF7FFF7FE07FFF7FE07FFF7FE07FFF7F000000001042104210420000FF7F
      FF03FF7FFF03FF7FFF03FF7FFF03FF7FFF03E05E0000FF7F1863186318631863
      18631863186310420000FF7FFF03FF7FFF03E05E0000E003FF7FE003FF7FE003
      FF7FE0030000E05EE05EFF7FFF03FF7FFF03000000000000E07F104200000000
      000000000000000000000000000000000000000000001042000000000000FF03
      FF7FFF03FF7FFF03FF7FFF03FF7FFF03FF7FE05E0000FF7F1863186318631863
      18631863186310420000FF03FF7FFF03FF7FE05E0000FF7FE003FF7FE003FF7F
      E003FF7F0000E05EE05EFF03FF7FFF03FF7F0000000000001042E07F1042E07F
      1042E07FE003FF03E0030000E07F000000000000000010421042104200001863
      FF03FF7FFF03FF7FFF03FF7FFF03FF7F1863E05E0000FF7F1863186318631863
      18631863186310420000FF7FFF03FF7F1863E05E0000E003FF7FE003FF7FE003
      FF7FE0030000E05EE05EFF7FFF03FF7F186300000000000000000000E07F1042
      E07F00000000E003FF03E0030000000000000000000010420000000000000000
      FF7FFF03FF7FFF03FF7FFF03FF7FFF030000E05E0000FF7F1863186310421042
      10421863186310420000FF03FF7FFF030000E05E0000FF7F0000000000000000
      0000FF7F0000E05EE05EFF03FF7FFF0300000000000000000000000000000000
      0000000000000000E003FF03E0030000E0030000000010421042104210421042
      00001863FF03FF7FFF03FF7F186300001042E05E0000FF7F1863186318631863
      18631863186310420000FF7F186300001042E05E0000E003FF7FE003FF7FE003
      FF7FE0030000E05EE05EFF7F1863000010420000000000000000000000000000
      00000000000000000000E003FF03E003FF030000000010420000000000000000
      000000000000000000000000000000000000E05E0000FF7F1863186318631863
      186318631863104200000000000000000000E05E0000FF7FE003FF7FE003FF7F
      E003FF7F0000E05EE05E00000000000000000000000000000000000000000000
      000000000000000000000000E003FF03E0030000000010421042104210421042
      104210421042104210421042000000000000E05E0000FF7F1863186318631863
      186318631863104200001042000000000000E05E0000E003FF7FE003FF7FE003
      FF7FE0030000E05EE05E10420000000000000000000000000000000000000000
      00000000000000000000E003FF03E003FF030000000010421042104210421042
      104210421042104210421042000000000000E05E0000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7F186300001042000000000000E05E0000FF7FE003FF7FE003FF7F
      E003FF7F0000E05EE05E10420000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E05E000000000000000000000000
      000000000000000000000000000000000000E05E000000000000000000000000
      000000000000E05EE05E00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E05EE05EE05EE05EE05EE05EE05E
      E05EE05EE05EE05EE05E0000000000000000E05EE05EE05EE05EE05EE05EE05E
      E05EE05EE05EE05EE05E00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000170017000000000000000000
      00000000000000000000000000000000000000000000FF7FFF7F000000000000
      0000000000000000000010421042104200000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF7F
      FF7FFF7FFF7FFF7F000000000000000000000000000000001700000000000000
      0000000000000000000000000000000000000000000000000000FF7FFF7F0000
      0000000000000000FF7FFF7F0000000010420000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF7F
      005C005C005CFF7F000000000000000000000000000017000000000000000000
      00000000000000000000000000000000000000000000FF7FFF7FFF7F00000000
      FF7F0000000000000000FF7FFF7F000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF7F
      005CFF7FFF7FFF7F000000000000000000000000170017001700000000000000
      000000000000000000000000000000000000000000000000FF7FFF7F0000FF7F
      FF7F0000000000000000FF7FFF7F000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF7F
      005C005C005CFF7F000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF7F00000000
      FF7F000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF7F
      FF7FFF7F005CFF7F000000000000000000000000170017001700000000000000
      0000000000000000000000000000000000000000FF7F00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF7F
      005C005CFF7FFF7F000000001700170000000000000017000000000000000000
      00000000000000000000000000000000000000000000FF7F0000000000000000
      0000000000000000000000000000000010420000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FFF7FFF7F0000FF7F
      FF7FFF7FFF7FFF7F000000001700170000000000000000001700000000000000
      000000000000000000000000000000000000000000000000FF7F000000000000
      0000000000000000000000001042104210420000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FFF7F000000000000
      0000000000000000000000000000000000000000170017000000000000000000
      0000000000000000000000000000000000000000000000000000FF7FFF7FFF7F
      FF7F000000000000104210421042104210420000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FFF7F0000FF7FFF7F
      0000000000000000000000001700170000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7F00000000FF7FFF7F
      FF7F000000000000104210421042104200000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FFF7F0000FF7FFF7F
      0000000000000000000000001700170017000000170017001700000000000000
      000000000000000000000000000000000000FF7F00000000FF7F000000000000
      0000104210421042104210421042000000000000104210421042104210421042
      10421042104210421042104210421042104200000000FF7F00000000FF7FFF7F
      0000000000000000000000000000000017000000000017000000000000000000
      000000000000000000000000000000000000FF7F000000000000FF7F00000000
      0000000000000000000000000000000000000000104200001042104210420000
      10421042104200001042104210420000104200000000FF7FFF7F0000FF7FFF7F
      0000000000000000170017000000000017000000170017000000000000000000
      000000000000000000000000000000000000FF7F0000000000000000FF7F0000
      0000000000000000000000000000000000000000104210421042104210421042
      10421042104210421042104210421042104200000000FF7FFF7FFF7FFF7FFF7F
      0000000000000000170017001700170017000000000017000000000000000000
      000000000000000000000000000000000000FF7FFF7F0000000000000000FF7F
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000017001700170017000000000000000000000000000000
      0000000000000000000000000000000000001042FF7FFF7F0000000000000000
      FF7FFF7F00000000000000000000000010420000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000001042FF7FFF7F000000000000
      0000000000000000104210421042104210420000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000FF7F0000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7F0000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000000000000000000000000000
      0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F0000FF7F0000FF7F0000
      FF7FFF7FFF7F0000FF7F0000FF7F0000FF7F0000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF7F
      000000000000000000000000FF7F000000000000000000000000000000000000
      0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000FF7FFF7FFF7F0000FF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00000000FF7F0000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000FF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000E07FE07F
      0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000FF7F0000FF7F0000
      FF7F0000FF7F0000FF7F0000FF7F0000FF7F0000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000FF7F
      000000000000000000000000FF7F00000000000000000000E07FE07F00000000
      0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000
      000000000000FF7FFF7FFF7FFF7FFF7F00000000000000000000FF7FFF7F1700
      FF7FFF7F1700FF7FFF7FFF7FFF7F00000000000000000000000000000000FF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000000000000000000000000000
      0000FF7FFF7FFF7FFF7FFF7FFF7F186318630000000000000000000000001042
      0000000000000000FF7F0000FF7F0000FF7F0000000000000000FF7FFF7F1700
      FF7FFF7F1700FF7FFF7FFF7FFF7F000000000000FF7F000000001042FF7FFF7F
      000000000000000000000000FF7F000000000000000000000000000000000000
      0000FF7FFF7FFF7FFF7FFF7F0000000000000000000000000000000000000000
      000000000000FF7F0000FF7F0000FF7FFF7F0000000000000000FF7F17001700
      17001700170017001700FF7FFF7F0000000000001042000000001042E07FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000000000000000000000000000
      0000FF7FFF7FFF7FFF7FFF7F0000FF7FFF7F0000000000000000104200001042
      0000000000000000FF7F0000FF7F0000FF7F0000000000000000FF7FFF7FFF7F
      1700FF7FFF7F1700FF7FFF7FFF7F00000000000000000000FF7F1042FF7F1042
      000000000000FF7F000000000000000000000000000000000000000000000000
      0000FF7FFF7FFF7FFF7FFF7F0000FF7F00000000104200000000000010420000
      0000FF7FFF7F00000000FF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7F
      1700FF7FFF7F1700FF7FFF7FFF7F000000000000104210421042FF7FE07F0000
      FF7FFF7FFF7FFF7F0000FF7F0000000000000000000000000000000000000000
      0000FF7FFF7FFF7FFF7FFF7F0000000000001042000010420000104200001042
      0000000000000000FF7F0000FF7F0000FF7F0000000000000000FF7FFF7F1700
      170017001700170017001700FF7F000000000000FF7FE07F1042E07FFF7FE07F
      FF7FE07FFF7FE07F00000000000000000000000000000000000000000000E07F
      0000000000000000000000000000000000000000104200000000000000000000
      000000000000FF7F000000000000FF7FFF7F0000000000000000FF7FFF7FFF7F
      FF7F1700FF7FFF7F1700FF7FFF7F00000000000000001042E07F1042E07F1042
      E07F0000000000000000000000000000000000000000000000000000E07FE07F
      00000000000000000000E07FE07F00000000104200000000FF7F0000FF7F0000
      FF7F000000000000FF7F00000000000000000000000000000000000000000000
      FF7F1700FF7FFF7F1700FF7FFF7F0000000000001042E07F00001042FF7F0000
      1042E07F00000000000000000000000000000000000000000000E07F00000000
      00000000000000000000E07F0000000000000000104200000000FF7F0000FF7F
      000000000000FF7F0000000000000000000000000000000000000000FF7F0000
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000E07F000000001042E07F0000
      00001042FF7F0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000104200000000FF7F1042
      0000000000000000FF7F00000000000000000000000000000000000000000000
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000001042FF7F0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000104200000000FF7F0000FF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010420000000000001042
      00001042000010420000000000000000FF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000170000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000017000000
      0000000000000000000000000000000000000000000000000000170017000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000017001700
      00000000005C005C0000005C005C0000005C0000000017001700170017001700
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000170017001700170017001700
      17000000005C005C0000005C005C0000005C0000170000000000170017000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000017001700
      0000000000000000000000000000000000000000170000000000170000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000000017000000
      0000000000000000000000000000000000000000170000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7F00000000FF7F0000
      0000FF7F00000000FF7F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000170000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000170000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000017001700170017001700
      1700170017001700170017001700000000000000000000000000FF7FFF7FFF7F
      0000000000000000000000000000000000000000170000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000005C005C000000001700FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F170000000000000000000000000000000000FF7F
      0000000000000000000000000000000000000000170000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000005C000000001700FF7F00000000FF7F
      00000000FF7F00000000FF7F17000000000000000000FF7FFF7FFF7F0000FF7F
      0000000000000000000000000000000000000000170000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000005C000000001700FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F17000000000000000000FF7F1042FF7F00000000
      0000000000000000000000000000000000000000170000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000005C005C0000000017001700170017001700
      17001700170017001700170017000000000000000000FF7F1042FF7F00000000
      0000000000000000000000000000000000000000170000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000005C0000000017000000170017000000
      17001700000017001700000017000000000000000000FF7FFF7F000000000000
      0000000000000000000000000000000000000000170000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000017001700170017001700
      1700170017001700170017001700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000017001700170017001700
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF03
      1F00F702FF03FF031F00000010421042000000000000007C000000000000007C
      007C000000001F0000001F7C0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      186318631863186318631863186318631863000000000000000000000000FF03
      1F0000001042FF031F00000010421042000000000000007C0000104200001000
      007C00001042000000001F0010000000000000000000FF7FFF7FFF7FFF7F0000
      000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7F0000
      186318631863186318631863186318631863000000000000000000000000FF03
      1F0000000000F7021F00000010421042000000000000007C0000104200000000
      007C0000104200000000000010400000E07F00000000FF7FFF7FFF7FFF7F0000
      000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7F0000
      186318631863186318631863186318631863000000000000000000000000FF03
      1F001F001F001F001F00000010421042000000000000007C0000104200001000
      007C00001042000000001F000000E07F00000000000000000000000000000000
      000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7F0000
      186318631863186318631863186318631863000000000000000000000000FF03
      1F001F001F001F001F00000010421042104200000000007C000000000000007C
      007C00000000104200000000E07F0000104200000000FF7FFF7FFF7FFF7F0000
      0000000000000000000000000000000000000000000000000000000000000000
      186318631863186318631863186318631863000000000000000000000000FF03
      1F001F001F001F001F00000010421042104200000000007C007C007C007C007C
      00001F001F7C00001F7C0000E07F0000000000000000FF7FFF7FFF7FFF7F0000
      0000000000000000000000000000000000001863186318631863186318631863
      186317001863186300000000000000000000000000000000000000001F001F00
      1F001F001F001F001F001F0000001042104200000000007C007C007C007C0000
      000000001F001F7C1F0010000000E07FE07F0000000000000000000000000000
      0000000017000000000000000000000000001863186318631863186318631863
      17001700186318630000FF03FF7FFF03FF7F00000000000000001F001F001F00
      1F001F001F001F001F001F001F00000010420000000000000000000010420000
      0000104200000000000010421042000000000000000000000000000000000000
      00001700170000000000FF03FF7FFF03FF7F1863186318631863186318631700
      17001700170017000000FF7FFF03FF7FFF030000000000001F001F001F001F00
      1F001F001F001F001F001F001F001F0000000000000000001042000000000000
      0000000010420000000010420000104200000000000000000000000000000000
      17001700170017000000FF7FFF03FF7FFF031863186318631863186318631863
      17001700186318630000FF03FF7FFF03FF7F00000000FF031F001F001F001F00
      1F001F001F001F001F001F001F001F001F000000000000001042000000000000
      0000000010420000000000001042000000000000000000000000000000000000
      0000170017000000000000000000000000001863186318631863186318631863
      18631700186318630000000000000000000000000000FF031F001F001F001F00
      0000104200000000FF031F001F001F001F000000000000001042000000001042
      0000000010420000104200000000000000000000000000000000000000000000
      0000000017000000000000000000000000000000000000000000000000000000
      18631863186318631863186318631863186300000000FF031F001F001F000000
      10421042000000000000FF031F001F001F000000000000001042000010420000
      10420000104200000000104200000000000000000000FF7FFF7FFF7FFF7F0000
      000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7F0000
      18631863186318631863186318631863186300000000FF031F001F001F000000
      10421042000000000000FF031F001F001F000000000000001042104200000000
      00001042104200000000000010420000000000000000FF7FFF7FFF7FFF7F0000
      000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7F0000
      186318631863186318631863186318631863000000000000FF031F001F000000
      00000000000000000000FF031F001F0000000000000000001042000000000000
      0000000010420000000000001042104210420000000000000000000000000000
      000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7F0000
      1863186318631863186318631863186318630000000000000000FF03FF03F702
      00000000000000000000FF03FF03F70200000000000000000000000000000000
      0000000000000000000010420000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      1863186318631863186318631863186318630000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001863186318631863186318631863
      1863186318631863186318631863186318630000000010421863186318631863
      1042104210420000E07F1863E07F186318630000000010421863186318631863
      1042104210420000E07F1863E07F186318630000000010421863186318631863
      1042104210420000E07F1863E07F186318630000000000000000000000000000
      0000000000000000000000001042000000000000000000001042186318631863
      1863186310421042186318631863186318630000000000001042186318631863
      1863186310421042186318631863186318630000000000001042186318631863
      1863186310421042186318631863186318630000000000000000000000000000
      1042000000000000000000001042000000000000000000001042186318631863
      1863186318631863186318631863E07F18630000000000000000000000000000
      0000000000000000000000000000E07F18630000000000000000000000000000
      0000000000000000000000000000E07F18630000000000000000000000000000
      104200000000000000000000104200000000000000000000104210421863E07F
      1863186318631863186318631863186318630000000000000000000000000000
      0000000000000000000000000000186318631863186318631863186318631863
      1863186318631863186318630000186318630000000000000000000000000000
      0000104210420000000000001042000000000000000000001042104218631863
      1863186318631863186318631863186318630000000000000000000000000000
      0000000000000000000000000000186318631863186318631863186318631863
      1863186318631863186318630000186318630000000000000000000000000000
      0000000000001042000000001042000000000000000000001042104218631863
      1863186318631863186318631863186318630000000000000000000000000000
      0000000000000000000000000000186318631863186318631863186318631863
      1863186318631863186318630000186318630000000000000000000000000000
      0000000000000000000000001042000000000000000000001042104218631863
      1863186318631863186318631042186318630000000000000000000000000000
      0000000000000000000000000000186318631863186318631863186318631863
      1863186318631863186318630000186318630000000000000000000000000000
      1042000000000000000000001042000000000000000000000000104218631863
      18631863186318630000000010421042E07F0000000000000000000000000000
      00000000000000000000000000001042E07F1863186318631863186318631863
      18631863186318631863186300001042E07F0000000000000000000000000000
      1042000000000000000000001042000000000000000000000000186318631042
      1863000000000000000000000000104218630000000000000000000000000000
      0000000000000000000000000000104218631863186300000000000000000000
      0000000000000000186318630000104218630000000000000000000000000000
      1042104210420000000000000000000000000000000000000000186310421042
      000000000000000000000000000010421042000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7F000000000000104210421863186300001F001F001F001F00
      1F001F001F000000186318630000104210420000000000000000000000000000
      0000000000000000000000000000000000000000000000001042186300000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001863186300000000000000000000
      0000000000000000186318630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010421042104200000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001863186318631863186318631863
      1863186318631863186318630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000104210421042000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001863186318631863186318631863
      1863186318631863186318630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000104200000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001863186318631863186318631863
      1863186318631863186318630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001863186318631863186318631863
      1863186318631863186318630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001863186318631863186318631863
      1863186318631863186318630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000018630000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000005C000000000000
      0000000000000000000000000000000000000000000000001863000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000010420000000000000000000010420000000000001042005C104200000000
      0000000017001700170000000000170017000000000000000000186300000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000010420000104200000000000000000000005C1042005C00000000
      0000170017000000000017001700104210420000000000000000000018630000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000104200000000000010420000000000001042005C0000005C00000000
      1700170000000000000000001700000000000000000000000000000000001863
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000010420000000000000000005C005C10420000005C00000000
      1700170000000000000000001700000000000000000000000000000000000000
      1863000000000000000000000000000000000000000000000000000000001F00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001042000010420000000000000000005C10420000005C10420000
      1700170000000000000000001700104200000000000000000000000000000000
      0000186300000000000000000000000000000000000000000000000000001F00
      1F00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001042005C0000
      0000170017000000000017001700170010420000000000000000000000000000
      0000000018630000000000000000000000000000000000000000000000001F00
      1F001F0000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000005C0000
      0000000017001700170010420000104217000000000000000000000000000000
      0000000000001863186318630000000000000000000000000000000000001F00
      1F00000000000000000000000000000000000000000000000000000000000000
      17001700170017000000000000000000000000000000000000000000005C0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000186318630000FF7F000000000000000000000000000000001F00
      0000000000000000000000000000000000000000000017000000000000000000
      00001700170017000000000000000000000000000000000000000000005C1042
      1042104210421042104210421042104210420000000000000000000000000000
      00000000000018630000FF7FFF7F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000017000000000000000000
      00001700170017000000000000000000000000000000000000000000005C005C
      005C005C005C005C005C005C005C005C005C0000000000000000000000000000
      0000000000000000FF7FFF7FFF7F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001700000000000000
      1700000000001700000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000170017001700
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000186318631863
      1863186318631863186317001863186318630000000000000000000000000000
      0000005C005C005C005C00000000000000000000000000000000000010420000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001863186318631863186318631863
      1863186318631863186317001863186318630000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000010420000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001863186318631863186318631863
      1863186318631863186317001863186318630000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001042
      1042104210421042104210420000000010420000000000000000000000000000
      0000000000000000000000000000000000001863186318631700186318631863
      1863186318631863186318631863186318630000000000000000000000000000
      0000000000000000104200000000000000000000000000000000000000000000
      0000000000000000000000000000000010420000000000001042000000000000
      0000000000000000000000001042000000001863186318631700186318631863
      1863186300000000000000001863186318630000000000000000000000000000
      0000000000000000104200000000000000000000000000000000000000000000
      1042000000000000000000000000000000000000000000000000000000000000
      0000000000001042000000000000000000001863186318631700186318631863
      1863186318630000186318631863186318630000000000000000000000000000
      0000000000000000104200000000000000000000000000000000000000000000
      1042000000000000000000000000104200000000000000000000104200000000
      0000000000000000000010420000000000001863186317001863186318631863
      1863186318631863000018631863186318630000000000000000000000000000
      0000000000001042000000000000000000000000000000000000000000000000
      1042000000000000000000000000000000000000000000000000000000000000
      0000000010420000000000000000000000001863186317001863186318631863
      1863186318631863000000000000000000000000000000000000000010420000
      0000000000001042000000000000000000000000000000000000000000000000
      0000104200000000000000001042000000000000000000000000000010420000
      1042000000000000104200000000000000001700170018631863186318631863
      1863186318631863000018631863186318630000000000000000104210420000
      0000104210420000000000000000000000000000000000000000000000000000
      0000104200000000000000001042000000000000000000000000000000000000
      0000104200000000000000000000000000001863186318631863186318631863
      1863186318631863186300001863186300000000000000001042104210421042
      1042000000000000000000000000000000000000000000000000000000000000
      0000000010420000000000000000000000000000000000000000000000001042
      0000000000001042000000000000000000001863186318631863186318631863
      1863186318631863186300001863186300000000000000000000104210420000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000010420000000010420000000000000000000000000000000000000000
      0000000000000000000000000000000000001863186318631863186318631863
      1863186318631863186300001863000000000000000000000000000010420000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      1042000010420000000000000000000000001863186318631863186318631863
      1863186318631863186318630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000104200000000000000000000000000000000000000000000
      0000104200000000000000000000000000001863186318631863186318631863
      1863186318631863186318630000000018630000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001863186318631863186318631863
      1863186318631863186318631863000018630000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001863186318631863186318631863
      1863186318631863186318631863186318630000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001700000000000000
      00000000000000000000000000000000005C0000005C005C0000000000000000
      000000000000000000001042FF7F000000000000000000000000000000000000
      00001042104210421042FF7F0000000000000000000000000000170000000000
      0000000000000000000000000000000000000000000000001700000000000000
      000000000000000000000000000000000000005C005C005C0000000000000000
      000000000000000000001042FF7F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000170000000000
      0000000000000000000000000000000000000000000000001700000000000000
      000000000000000000000000000000000000005C005C00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000170000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000005C00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000001042FF7F0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042000000000000
      000000001042104210421042FF7F000000001042104210421042FF7F00000000
      00000000000000001042FF7F0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042000000000000
      0000000000001042FF7FFF7F000000000000000010421042FF7F000000000000
      00000000000000001042FF7F0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010420000000000000000
      00000000000000001042FF7F000000000000104210421042FF7F000000000000
      0000000000001042FF7F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000001042000000000000000010420000000000000000
      00000000000000001042104210421042104210421042FF7F000000001042FF7F
      0000000000001042FF7F00000000000000000000000000000000000000000000
      0000000000000000000000001700000000000000000000000000000000000000
      0000000000000000000010421042000000001042104200000000000000000000
      00000000000000001042FF7F00000000000010421042FF7F000010421042FF7F
      000010421042FF7F000000000000000000000000000000000000000000000000
      0000000000000000000017001700000000000000000000000000000000000000
      0000000000000000104210421042104210420000000000000000000000000000
      000000000000000000001042FF7F000010421042FF7F00001042104210421042
      1042FF7FFF7F0000000000000000000000000000000000000000000000000000
      0000000000000000170017001700170017000000000000000000000000000000
      0000000000000000000010421042000000000000000000000000000000000000
      000000000000000000001042FF7F000010421042FF7F0000000010421042FF7F
      FF7F000000000000000000000000000000000000000000000000000000000000
      0000000000000000000017001700000000000000000000000000000000000000
      0000000000000000000000001042000000000000000000000000000000000000
      000000000000000000001042FF7F10421042FF7F00000000000000001042FF7F
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000001700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000104210421042FF7F000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000010421042FF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF7F
      1042000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      1863104200000000000000000000000000000000000000000000000017001700
      1700170017001700170017000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF7F00000000000000000000000000000000000000000000
      FF7F18630000000000000000000000000000000000000000000000000000FF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF7FFF7FFF7F0000000000000000000000000000000000000000
      00001863104200000000104200000000000000000000000000000000FF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF7F1F00FF7FFF7FFF7F000000000000000000000000000000000000
      0000FF7F18630000000000001042000000000000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF7F1F00FF7F1F00007C005CFF7F00000000000000000000000000000000
      FF7F0000FF7F1863000000001863104200000000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF7F1F00FF7F1F00FF7F005C005C00001F7C0000000000000000000000000000
      FF7F0000FF7FFF7F18630000000010420000000000000000FF7FFF7F0000FF7F
      FF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000000000000000
      1F0000000000000000000000000000000000000000000000000000000000FF7F
      FF7FFF7F1F00FF7FFF7FFF7F000000000000000000000000000000000000FF7F
      0000FF7F0000FF7FFF7F186300001863104200000000FF7FFF7F00000000FF7F
      0000FF7F0000FF7F0000FF7F0000000000000000000000000000000000000000
      1F001F0000000000000000000000000000000000000000001042000000000000
      0000000000000000000000000000E05E00000000000000000000000000000000
      FF7F0000FF7F0000FF7F1863186318631863000000000000000000000000FF7F
      0000FF7F0000FF7F0000FF7F0000000000000000000000000000000000000000
      1F001F001F000000000000000000000000000000E07FE05E0000000000000000
      000000000000000000000000E05EE05E0000000000000000000000000000FF7F
      0000FF7F00001863FF7FFF7F186318631863000000000000000000000000FF7F
      0000FF7F0000FF7F0000FF7F0000000000000000000000000000000000000000
      1F001F000000000000000000000000000000000000000000FF7FE07FFF7FE07F
      FF7FE07FFF7FE07FFF7FE07F0000E05E00000000000000000000000000000000
      FF7F00001863FF7FFF7FFF7FFF7F18631863000000000000000000000000FF7F
      0000FF7F0000FF7F0000FF7F0000000000000000000000000000000000000000
      1F000000000000000000000000000000000000000000FF7FE07FFF7FE07FFF7F
      E07FFF7FE07FFF7FE07FFF7FE07F000000000000000000000000000000000000
      0000FF7FFF7F1863FF7FFF7FFF7FFF7F1863000000000000000000000000FF7F
      0000FF7F0000FF7F000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF7FFF7FFF7FFF7FFF7FFF7F1863000000000000000000000000FF7F
      0000FF7F0000FF7F000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF7F1863FF7FFF7FFF7FFF7F0000000000000000000000000000
      0000FF7F00000000000000000000000000000000000000000000000000000000
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
      00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7F0000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7F000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF7F0000000000000000000000000000FF7FFF7FFF7FFF7F
      000000000000000000000000000000000000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7F000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000
      000000000000FF7FFF7FFF7F00000000000000000000FF7F0000FF7FFF7FFF7F
      0000E07FFF7FFF7FFF7FE07FFF7FFF7FFF7F00000000FF7F0000FF7FFF7FFF7F
      FF7FFF7F0000FF7FFF7F000000000000000000000000FF7FFF7FFF7FFF7F1700
      1700170017001700FF7FFF7FFF7FFF7F00000000000000000000000000000000
      00000000FF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7F0000FF7FFF7F
      0000FF7FFF7FE07FFF7FFF7FFF7FE07FFF7F00000000FF7FFF7F0000FF7FFF7F
      FF7F00000000E07F1042000000001042000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000
      0000FF7F1700FF7FFF7FFF7F005CFF7F000000000000FF7F0000FF7F00000000
      0000E07FFF7F0000FF7FE07F00000000FF7F00000000FF7F0000FF7F00000000
      0000FF7F0000FF7F00000000FF7F0000000000000000FF7FFF7FFF7FFF7F1700
      17001700170017001700FF7FFF7FFF7F00000000000000000000000000000000
      FF7F1700FF7F1700FF7F005C005C005CFF7F000000000000FF7F0000FF7F0000
      0000FF7F0000E07F0000FF7FFF7FE07FFF7F000000000000FF7F0000FF7F0000
      FF7F00000000E07F00000000E07F0000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000FF7F
      1700FF7F1700FF7FFF7FFF7F005CFF7F000000000000FF7F0000FF7F0000FF7F
      0000E07FFF7FFF7FFF7F0000FF7FFF7FFF7F00000000FF7F0000FF7F0000FF7F
      0000FF7F0000FF7F00000000FF7F0000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F005C005CFF7F000000000000000000000000FF7FFF7F
      FF7F1700FF7FFF7FFF7FFF7FFF7F00000000000000000000FF7F0000FF7F0000
      0000FF7FFF7FE07FFF7FFF7FFF7FE07FFF7F000000000000FF7F0000FF7F0000
      FF7F00000000E07F00000000E07F0000000000000000FF7F0000000000000000
      FF7FFF7FFF7FFF7FFF7F005C005CFF7F000000000000E05E0000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00000000E05E0000000000000000FF7F0000FF7F
      0000E07FFF7F0000FF7FE07F00000000FF7F0000000000000000FF7F0000FF7F
      0000FF7F0000FF7F00000000FF7F0000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000001863E05E000000000000
      0000000000000000000000000000E05EE05E00000000000000000000FF7F0000
      0000FF7F0000E07F0000FF7FFF7FE07FFF7F00000000000000000000FF7F0000
      FF7F00000000E07F00000000E07FFF7FE07F0000000000000000000000000000
      0000000000000000000000000000000000000000000018630000186318631863
      18631863186318631863186318630000E05E0000000000000000000000000000
      0000E07FFF7FFF7FFF7F0000FF7FFF7FFF7F0000000000000000000000000000
      0000000000000000000010421042000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001863186318631863
      1863186318631863186318631863186300000000000000000000000000000000
      0000FF7FFF7FE07FFF7FFF7FFF7FE07FFF7F0000000000000000000000000000
      000000000000000000000000FF7F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000104200000000000000000000000000000000000000000000
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
      FF7F000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FE07FFF7F00000000
      00000000000000000000FF7FE07FFF7F00000000000000000000000000000000
      00000000000000000000E07F0000000000000000000010421042104210421042
      1042104210421042104210421042104200000000000000000000104200000000
      00000000104200000000000000000000000000000000E07FFF7FE07F00000000
      00000000000000000000E07FFF7FE07F000000000000000000000000FF7F0000
      0000000000000000E07FE07FE07F000000000000000000000000000000000000
      FF7F0000FF7FFF7F000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF7F0000
      00000000000000000000E07F0000000000000000000000000000000000000000
      FF7F0000000000000000000000000000E07F0000000000001042000000000000
      00000000FF031042000000000000000000000000000000000000000000000000
      0000FF7F000000000000000000000000000000000000000000000000FF7F0000
      0000000000000000000000000000000000000000000000000000000000000000
      FF7FFF7FFF7FFF7FFF7FFF7F0000000000000000104200000000000000000000
      0000000000000000000010420000000000000000000000000000000000000000
      FF7FFF03FF7F0000000000000000000000000000000000000000000010420000
      0000000000000000000000000000000000000000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7F0000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF7F
      FF03FF7FFF03FF7F000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF7F0000FF7F
      0000FF7F000000000000FF7FFF7F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF7FFF03FF7F000000000000000000000000000000000000000000000000FF7F
      FF7F000000000000000000000000000000000000000000000000FF7FFF7FFF7F
      FF7FFF7F0000000000000000FF7FFF7F0000000000000000FF03000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF7F00000000000000000000000000000000000000000000000000000000
      FF7FFF7F00000000000000000000000000000000000000000000FF7FFF7FFF7F
      0000FF7F00000000000000000000FF7FFF7F000000000000FF03000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000007C0000000000000000
      0000FF7FFF7F000000000000000000000000000000000000FF7FFF7F0000FF7F
      FF7FFF7F000000000000000000000000FF7F000010420000FF03FF0300000000
      0000000000000000000010420000000000000000000000000000000000000000
      0000000000000000000000000000000000000000007C007C007C000000000000
      00000000FF7FFF7F0000000000000000000000000000FF7FFF7F00000000FF7F
      0000000000000000000000000000000000000000000000001042FF03FF03FF03
      0000000000001042000000000000000000000000000000000000000000000000
      FF7FE07FFF7F00000000000000000000000000000000007C00000000FF030000
      000000000000000000000000000000000000000000000000000000000000FF7F
      00000000000000000000FF030000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      E07FFF7FE07F0000000000000000000000000000000000000000FF03FF03FF03
      000000000000000000000000000000000000000000000000000000000000FF7F
      000000000000007C0000FF03FF030000E07F0000000000000000104200000000
      0000000010420000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF030000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000007C007C00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010420000000000000000
      0000104200001042000010420000000000000000000010420000000000000000
      0000104200001042000010420000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042000000001042
      0000000010421042104210421042000010420000000000001042000000001042
      00000000104210421042104210420000104200000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000010420000
      0000000000000000000000000000000000000000000000000000000010420000
      00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7F00000000000000001042000000000000000000000000000000000000
      1042000000000000000010420000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000104200000000FF7FFF7FFF7FFF7FFF7F
      FF7F000010421863186310420000104200000000000000000000000000000000
      0000186318631863186300000000000000000000000000000000104200000000
      0000000000000000000000000000000000000000000000000000104200000000
      00000000000000000000000000000000104200000000FF7FFF7FFF7FFF7FFF7F
      0000104218631863FF0310421042000000000000000000000000000000001042
      FF03FF0318631863186318631042000000000000000000000000104200000000
      0000000000001042000000000000000000000000000000000000104200000000
      00000000000010420000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      0000186318631863186310421863000000000000000000000000104200001863
      FF03186318631863186318631863000010420000000000000000104200000000
      0000000000000000000000000000000000000000000000000000104200000000
      00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      00001863FF03186318631042186300000000000000000000000000001863FF03
      1863186318631863186318631863186300000000000000000000104200000000
      0000000000000000000000000000000000000000000000000000104200000000
      00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      00001042FF03FF03186310421042000000000000000000000000000018631863
      1863186318631863186318631863186300000000000000000000104200000000
      0000000000000000000000000000000000000000000000000000104200000000
      00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7F000010421863186310420000000000000000000000000000000018631863
      186318631863186318631863FF03186300000000000000000000104200000000
      0000000000000000000000000000000000000000000000000000104200000000
      00000000000010420000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7F00000000000000000000000000000000000000000000000018631863
      186318631863186318631863FF0318630000000000000000000000001042FF7F
      FF7F00000000000000000000000000000000000000000000000000001042FF7F
      FF7F0000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000104200001863
      18631863186318631863FF03FF03000010420000000000000000000010421042
      FF7FFF7F00001042000000000000000000000000000000000000000010421042
      FF7FFF7F000010420000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7F00000000000000000000000000000000000000000000000000001042
      186318631863FF03FF03FF031042000000000000000000000000000000001042
      1042104200000000000000000000000010420000000000000000000000001042
      10421042000000000000000000000000104200000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7F00001863000000000000000000000000000000000000000000000000
      0000186318631863186300000000000000000000000000000000000000000000
      0000104210421042104210421042000000000000000000000000000000000000
      00001042104210421042104210420000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7F00000000000000000000000000000000000000000000000000000000
      1042000000000000000010420000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001042
      1042000000000000000000000000000000000000104200000000000000000000
      0000000000000000000000001042000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF7F000000000000
      1042104200000000000000000000000000000000000010420000000000000000
      0000000000000000000010420000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000E05EE05E0000000000000000000000000000FF7F00000000
      0000104210421042104210421042104200000000000010420000000000001042
      0000104200000000000010420000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E05E0000E07FE05E0000000000000000000000000000FF7F0000
      0000000000000000000000000000104210420000000010420000000000001042
      0000104200000000000010420000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000E05E0000E07F0000E07F00000000000000000000000000000000FF7F
      0000000010421863186318631042000010420000000010420000000000001042
      0000104200000000000010420000000000000000000010420000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E05E0000E07F0000E07F0000000000000000000000000000000000000000
      0000104218631863FF7FFF7F1863104200000000000010420000000000000000
      0000000000000000000010420000000000000000104200001042000000000000
      000000000000000000000000000000000000000000000000000000000000E05E
      E05E0000E07F0000E07F00001042FF7F00000000000000000000000000000000
      104218631863186318631863FF7F186310420000000010420000000000000000
      0000000000000000000010420000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E05EE05EE05EE05E0000
      0000E07F0000E07F0000FF7FFF7FFF7F00000000000000000000000000000000
      1863186318631863186318631863FF7F18630000000010420000000000000000
      0000000000000000000010420000000000000000000000000000000000000000
      0000000000000000000000000000000000000000E05E0000E07F0000E07FE05E
      E07F0000E07F00001042FF7F1042FF7F00000000000000000000000000000000
      1042186318631863186318631863FF7F18630000104200000000000000000000
      0000000000000000000000001042000000000000104200001042000000000000
      00000000000000000000000000000000000000000000E07FE07FE05EE07F0000
      E05EE07F0000FF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000
      10421863FF7FFF7F186318631863186318630000000000000000000000000000
      0000000000000000000000000000000000000000000010420000000000000000
      0000000000000000000000000000000000000000E07FE07FE05EE07FE05EE07F
      E07F00000000FF7F1042FF7F1042FF7F00000000000000000000000000001042
      10421042FF7FFF7F186318631863186310420000000000000000000000001042
      0000104200000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000010421042E05E0000E05EE07FE05E
      E07F00000000FF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000
      0000104210421863186318631863104200000000000000000000104200000000
      0000000000001042000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000E05EE07F
      E05EE07F0000FF7F1042FF7F1042FF7F00000000000000000000000000000000
      0000000010421042104210421042000000000000000000000000000010420000
      0000000010420000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000E07F10420000E05EE07FE05E
      E07F000000001F001F001F001F001F0000000000000000000000000000000000
      0000000010420000000000001042000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E07FE07F1042E07FE07F
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000104200000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF7F00000000
      0000FF7F00000000FF7F000000000000FF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000007C005C0000E07FE07F
      E05E0000FF03F7020000E05EE05E000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000007C005C0000E07FE07F
      E05E0000FF03F7020000E05EE05E000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000007C005C0000E07FE07F
      E05E0000FF03F7020000E05EE05E000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000007C005C0000E07FE07F
      E05E0000FF03F7020000E05EE05E000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000007C005C0000E07FE07F
      E05E0000FF03F7020000E05EE05E000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000007C005C0000E07FE07F
      E05E0000FF03F7020000E05EE05E000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000007C005C000000000000
      00000000FF03F7020000E05EE05E000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000007C005C00000000FF7F
      FF7F0000FF03F702000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000005C0000
      FF7F0000FF03F70200000000FF7F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF7F0000005C0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF7F00000000
      000000000000FF7FFF7F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000001F001F001F001F001F000000000000000000FF7FFF7FFF7F
      FF7FFF7F10001000100010001000100010000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FE05EE05EE05EE05EE05EE05EE05E
      E05EE05EE05EE05EE05EE05EE05E000000000000000000000000FF7FFF7FFF7F
      FF7FFF7F10001000100010001000100010000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF7F10421042104210421042FF7FE05EE05E00000000000000000000
      0000000000000000E05EE05EE05E000000000000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF7F1042FF7FFF7FFF7F1042FF7FE05E000000000000000000000000
      000000000000E05EE05EE05EE05E000000000000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F007C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF7F10421042104210421042FF7FE05E0000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7F0000E05EE05EE05EE05E000000000000000000000000FF7F10001000
      10001000FF7FFF7FFF7FFF7FFF7FFF7F007C0000000000000000000000000000
      0000000000000000000000000000000000000000170017001700170017001700
      17000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FE05E0000FF7F1F001F001F001F00
      1F00FF7F0000E05EE05EE05EE05E000000000000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000
      0000000000000000000000000000000000000000170010421042104210421042
      10420000FF7F10421042000000000000FF7FE05E0000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7F0000E05EE05EE05EE05E000000000000000000000000000000000000
      0000000000000000000000000000000000000000000017001700170000001700
      1700170000000000000000000000000000000000170000000000000000000000
      00000000FF7FFF7FFF7FFF7F000000000000E05E0000FF7F1F001F001F001F00
      1F00FF7F0000E05EE05EE05EE05E00000000000000000000FF7F100010001000
      1000FF7FFF7FFF7FFF7FFF7FFF7F007C007C0000000010421700000000000000
      1700104200000000000000000000000000000000170000000000000000000000
      00000000FF7F104210420000000000000000E05E0000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7F0000E05EE05EE05EE05E00000000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000001700170017001700
      1700000000000000000000000000000000000000170000000000000000000000
      00000000FF7FFF7FFF7FFF7F000000000000E05E0000FF7F1F001F001F001F00
      1F00FF7F0000E05EE05EE05EE05E000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042170000001700
      1042000000000000000000000000000000000000170000000000000000000000
      000000000000000000000000000000000000E05E0000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7F0000E05EE05EE05EE05E0000000000000000FF7F1000100010001000
      FF7FFF7FFF7FFF7FFF7FFF7F007C007CFF7F0000000000000000170017001700
      0000000000000000000000000000000000000000170000000000000000000000
      000000000000000000001700000000000000E05E0000FF7F1F001F001F001F00
      1F00FF7F0000E05EE05EE05EE05E0000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000104217001042
      0000000000000000000000000000000000000000170017001700170017001700
      170017001700170017001700000000000000E05E0000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7F0000E05EE05EE05EE05E000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000017000000
      00000000000000000000000000000000000000001700FF7F17001700FF7F1700
      1700FF7F17001700FF7F1700000000000000E05E000000000000000000000000
      000000000000E05EE05EE05EE05E000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000170017001700170017001700
      170017001700170017001700000000000000E05EE05EE05EE05EE05EE05EE05E
      E05EE05EE05EE05EE05EE05EE05E000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E07FFF7FE07FFF7FE07FFF7FE07FFF7F0000000000000000000000000000
      FF7F00000000000000000000FF7FFF7F00000000000000000000000000000000
      00000000000000001F001F001F001F001F000000000000000000000000000000
      00000000000000001F001F001F001F001F000000000000000000000000000000
      0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000
      E07F0000FF7FFF7FFF7F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E07FFF7FE07FFF7FE07FFF7FE07FFF7F0000000000000000000000000000
      FF7F00000000000000000000FF7FFF7F00000000000000000000000000000000
      000000000000000000000000000000000000E05EE05EE05EE05EE05EE05EE05E
      E05EE05EE05EE05EE05EE05EE05E000000000000000000000000000000000000
      00400000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000
      E07FFF7FE07FFF7FE07FFF7F0000FF7FE07F000000000000000000000000E07F
      E07F00000000000000000000000000000000E05EE05E00000000000000000000
      0000000000000000E05EE05EE05E000000000000000000000000000000000000
      004010420000E07FFF7FE07FFF7FE07FFF7F0000000000000000000000000040
      0000FF7FFF7FFF7FFF7FFF7FFF7F000000000000000000000000000000000000
      0000E07FE07FE07F00000000000000000000E05EE05E0000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7F0000E05EE05EE05E000000000000000000000000000000000000
      0040004010420000FF7FFF7FFF7FFF7FFF7F0000000000000000000000000040
      10420000E07FFF7FE07FFF7FE07FFF7F0000000000000000000000000000E07F
      E07FE07FE07FE07F00000000000000000000E05EE05E0000FF7F170017001700
      17001700FF7F0000E05EE05EE05E000000000000000000000000000000001042
      004000400040007C0000E07FFF7FE07FFF7F0000000000000000000000000040
      004010420000FF7FFF7FFF7FFF7FFF7F0000000000000000000000000000E07F
      E07FE07FE07F000000000000000000000000E05EE05E0000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7F0000E05EE05EE05E000000000000000000000000000000001863
      18630040007C007C007C0000FF7FFF7FFF7F0000000000000000000010420040
      00400040007C0000E07FFF7FE07FFF7FE07F0000000000000000000000000000
      E07FE07FE07F000000000000000000000000E05EE05E0000FF7F170017001700
      17001700FF7F0000E05EE05EE05E000000000000000000000000000018631863
      FF7FFF7F007C007C007C007C0000000000000000000000000000000018631863
      0040007C007C007C0000FF7FFF7FFF7FFF7F0000000000000000000000000000
      0000E07F0000000000000000000000000000E05EE05E0000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7F0000E05EE05EE05E00000000000000000000000018631863FF7F
      FF7FFF7FFF7F000000000000000000000000000000000000000018631863FF7F
      FF7F007C007C007C007C00000000000000000000000000000000000000000000
      0000E07F0000000000000000000000000000E05EE05E0000FF7F170017001700
      FF7FFF7FFF7F0000E05EE05EE05E0000000000000000000018631863FF7FFF7F
      FF7F0000000000000000000000000000000000000000000018631863FF7FFF7F
      FF7FFF7F00000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E05EE05E0000FF7FFF7FFF7FFF7F
      FF7F000000000000E05EE05EE05E000000000000000018631863FF7FFF7FFF7F
      0000000000000000000000000000000000000000000018631863FF7FFF7FFF7F
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E05EE05E0000FF7F17001700FF7F
      FF7F0000FF7F0000E05EE05EE05E00000000000018631863FF7FFF7FFF7F0000
      007C00000000000000000000000000000000000018631863FF7FFF7FFF7F0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E05EE05E0000FF7FFF7FFF7FFF7F
      FF7F00000000E05EE05EE05EE05E0000000000001863FF7FFF7FFF7F0000007C
      00000000000000000000000000000000000000001863FF7FFF7FFF7F0000007C
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E05EE05E00000000000000000000
      00000000E05EE05EE05EE05EE05E0000000000000000FF7FFF7F000000000000
      00000000000000000000000000000000000000000000FF7FFF7F0000007C0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E05EE05EE05EE05EE05EE05EE05E
      E05EE05EE05EE05EE05EE05EE05E000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E05EE05EE05EE05EE05EE05EE05E
      E05EE05EE05EE05EE05EE05EE05E0000000000000000FF7F1042FF7F10421042
      00000000FF7FE07F00000000FF7F1042FF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7F1042FF7F1042FF7F1042
      10420000000000000000FF7F1042FF7F10420000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000001042FF7FFF7FFF7F1042FF7F
      104200000000000000001042FF7FFF7FFF7F00000000E07F0000000000000000
      00000000000000000000FF7F0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F1042
      10420000000000000000FF7FFF7FFF7FFF7F00000000FF7F0000000000000000
      00000000000000000000E07F0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FFF7FFF7F1042FF7F
      000000000000000000000000FF7FFF7FFF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000186300000000FF7F1042FF7F0000
      0000000000000000000000000000FF7F1042000000000000E07F000000000000
      000000000000E07F000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001863186300000000000000000000
      000000000042004200000000000000000000000000000000FF7F000000000000
      000000000000FF7F000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000018631863186318631000E07F0000
      0000000000000000000000000000FF7F1000000000000000E07F000000000000
      000000000000E07F000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000018631863186318631000FF7FE07F
      FF7FE07F00000000FF7FE07FFF7FE07F10000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000018631863186318631000E07FFF7F
      E07FFF7FE07FFF7F100010001000100010000000000000000000E07F00000000
      000000000000E07F000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000018631863186318631000FF7FE07F
      FF7FE07FFF7FE07F1000FF7FE07F100018630000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000018631863186318631000E07FFF7F
      E07FFF7FE07FFF7F1000E07F1000186318630000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000018631863186318631000FF7FE07F
      FF7FE07FFF7FE07F1000100018631863186300000000000000000000E07F0000
      0000000000000000E07F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001863186318631863100010001000
      1000100010001000100018631863186318630000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001863186318631863186318631863
      1863186318631863186318631863186318630000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001863186318631863186318631863
      1863186318631863186318631863186318630000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000017001700
      17001700170017001700170017001700170000000000E05EE07FE05EE07FE05E
      E07FE05EE07FE05EE07FE05EE07F000010420000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E07FE05EE07F10421042
      1042104210421042E05EE07FE05E000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001042FF7F000017001700
      17001700170000000000000017001700170000000000E05EE07FFF7FFF7FFF7F
      18631863186310421042E05EE07F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042FF7F00000000
      17001700000000000000000000001700170000000000E07FFF7FFF7FFF7FFF7F
      FF7FFF7F1863186310421042E05E000000000000000000000000000000000000
      0000000017001700170017001700170017000000000000000000000000000000
      10420000000000000000000000000000000000000000000000001042FF7F0000
      00001700170000000000000000001700170000000000E05EE07FE05EE07FE05E
      E07FE05EE07FE05EE07FE05EE07F000000000000000000000000000000000000
      000000001700FF7FFF7FFF7FFF7FFF7F17000000000000000000000010420000
      000000000000000000000000000000000000000000000000000000001042FF7F
      00000000170017001700170017001700170000000000E05EE05EE05EE05EE05E
      E05EE05EE05EE05EE05EE05EE05E000010420000000000000000000000000000
      0000005C1700FF7F104210421042FF7F17000000000000000000000000000000
      0000104200000000000000000000000000000000000000000000000000001042
      FF7F0000000017001700000000001700170000000000E07FE07FE07FE07FE07F
      E07FE07FE07FE07FE07FE07FE07F000000001700170017001700170017001700
      0000005C1700FF7FFF7FFF7FFF7FFF7F17000000000000000000000000001042
      0000000000000000000000000000000000000000000000000000000000000000
      1042FF7F000000001700170000001700170000000000E07F0000000000000000
      000000000000000000000000E07F000000001700FF7FFF7FFF7FFF7FFF7F1700
      005C000017001700170017001700170017000000000000000000000000000000
      0000000010420000000000000000000000000000000000000000000000000000
      00001042FF7F00000000170017001700170000000000E07F0000FF7FFF7F0000
      FF7FFF7F00001F001F000000E07F000000001700FF7F104210421042FF7F1700
      005C000017000000170000001700000017000000000000000000000000000000
      1042000000000000000000000000000000000000000010420000104200000000
      000000001042FF7F0000000017001700170000000000E07F0000007C007C0000
      007C007C0000FF7FFF7F0000E07F000000001700FF7FFF7FFF7FFF7FFF7F1700
      0000000017001700170017001700170017000000000000000000000000000000
      0000000000001042000000000000000000000000104200000000000010420000
      0000000000001042FF7F000000001700170000000000E07F0000FF7FFF7F0000
      FF7FFF7F0000007C007C0000E07F000000001700170017001700170017001700
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000001042FF7F00000000000000000000E07F0000000000000000
      000000000000000000000000E07F000000001700000017000000170000001700
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000104200000000000000000000E07FE07FE07FE07FE07F
      E07FE07FE07FE07FE07FE07FE07F000000001700170017001700170017001700
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010420000104200000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000007C
      007C007C005C0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF7FFF7FFF7FFF7F000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF03FF7FFF0300000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000000000000000
      FF7FFF7F00001042186300000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF7FFF03FF7F00000000000000000000000000000000FF7F1F001F00FF7F1F00
      1F001F001F001F00FF7F00000000000000000000000000000000000000000000
      1042FF7FFF7F0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF03FF7FFF0300000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000000000000000
      0000FF7FFF7F1042000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF7FFF03FF7F00000000000000000000000000000000FF7F1F001F00FF7F1F00
      1F001F001F001F00FF7F00000000000000000000000000000000000000000000
      00001042FF7FFF7F000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF03FF7FFF0300000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000000000000000
      00000000FF7FFF7F104200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7F0000FF7FFF7F00000000000000000000000000000000000000000000
      186310420000FF7FFF7F00000000000000000000000000000000170000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001700000000000000000000000000000000000000FF7F00000000FF7FFF7F
      FF7F0000E07F0000FF7F00000000000000000000000000000000000000000000
      0000FF7FFF7FFF7FFF7F00000000000000000000000000000000170017000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001700000000000000000000000000000000000000FF7F0000FF7F0000FF7F
      0000E07F0000FF7F000000000000000000000000000000000000000000000000
      00000000FF7FFF7F000000000000000000000000000017001700170017001700
      0000000000000000000000000000000000000000000000000000000000001700
      17001700170017000000000000000000000000000000FF7FFF7F0000E07F0000
      E07F0000FF7F0000FF7FE07FFF7F000000000000000000000000000000000000
      0000000000000000000000000000000000000000170000000000170017000000
      0000000000000000000000000000000000000000000000000000000000000000
      170017001700000000000000000000000000000000000000000000000000FF7F
      0000FF7F0000FF7FE07FFF7FE07FFF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000170000000000170000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000170000000000000000000000000000000000000000000000000000000000
      E07F0000FF7FE07FFF7FE07FFF7FE07F00000000000000000000000000000000
      000000000000FF7FFF7F00000000000000000000170000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF7FE07FFF7FE07FFF7FE07F000000000000000000000000000000000000
      000000000000FF7FFF7F00000000000000000000170000000000000000000000
      000000000000000000000000000000000000000000000000FF7FFF7FFF7F0000
      0000000000000000FF7FFF7FFF7F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000017001700170017001700
      170017000000000000000000000000000000000000000000FF7FFF7FFF7F0000
      0000000000000000FF7FFF7FFF7F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF7FFF7FFF7F0000
      0000000000000000FF7FFF7FFF7F000000000000000000000000000000000000
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
      0000000000000000000000000000000000001863186318631863186318631863
      1863186318631863186318631863186318630000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001863186318631863186318631863
      1863186318631863186318631863186318630000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001863186318631863186318631863
      1863186318631863186318631863186318630000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001863186318631863186318631863
      1863186318631700170017001863186318630000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001863186318631863186318631863
      1863186318631700186318631863186318630000000017000000000000000000
      0000000000000000000000000000000000000000000017000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001863186318631863186318631863
      1863186318631863170018631863186318630000000017001700000000000000
      0000000000000000000000000000000000000000170017000000000000000000
      0000000000000000000000000000000000000000000000001042104200000000
      1042104200000000000000000000000000001863186318631863186318631863
      1863186318631863186317001863186318631700170017001700170000000000
      0000000000000000000000000000000000001700170017001700170000000000
      000000000000000000000000000000000000000000001042FF7FFF03FF7FFF03
      FF7FFF0310420000000000000000000000001863186318630000000018631863
      0000000018631700170018631863186318630000000017001700000000000000
      0000000000000000000000000000000000000000170017000000000000000000
      000000000000000000000000000000000000000000000000FF03FF7FFF03FF7F
      FF03FF7F00000000000000000000000000001863186318631863000000000000
      0000186318631863186318631863186318630000000017000000000000000000
      0000000000000000000000000000000000000000000017000000000000000000
      000000000000000000000000000000000000000000000000FF7FFF03FF7FFF03
      FF7FFF0300000000000000000000000000001863186318631863186300000000
      1863186318631863186318631863186318630000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001042FF03FF7FFF03FF7F
      FF03FF7F10420000000000000000000000001863186318631863000000000000
      0000186318631863186318631863186318630000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042104200000000
      1042104200000000000000000000000000001863186318630000000018631863
      0000000018631863186318631863186318630000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001863186318631863186318631863
      1863186318631863186318631863186318630000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001863186318631863186318631863
      1863186318631863186318631863186318630000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001863186318631863186318631863
      1863186318631863186318631863186318630000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF030000000000000000000000000000
      1000FF7FFF7FFF7F100000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      E07F000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      1000100010001000100000000000000000000000000000000000000000001F00
      1F001F000000E003E003E00300001F7C1F7C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000100210000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001F00
      1F001F000000E003E003E00300001F7C1F7C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF0310021000100010001000100000000000
      1000100010001000100000000000100010000000000000000000000000001F00
      1F001F000000E003E003E00300001F7C1F7C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF0310021000FF7FFF7FFF7F100000000000
      1000E07FE07FE07F1000000000001000FF7F0000000000000000000000001F00
      1F001F000000E003E003E00300001F7C1F7C0000000000000000000000000000
      E07F000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF031000100010001000100000000000
      1000100010001000100000000000100010000000000000000000000000001F00
      1F001F000000E003E003E00300001F7C1F7C0000000000000000000000000000
      E07F000000000000000000000000000000000000000000000000000000000000
      0000000000000000000010021000100000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E003E003E00300001F7C1F7C0000000000000000000000000000
      E07F000000000000000000000000000000000000000000000000000000000000
      00001F001F001F00E07FFF031002100000000000000000000000000000000000
      1000100010001000100000000000100010000000000000000000000000000000
      000000000000E003E003E00300001F7C1F7C0000000000000000000000000000
      E07FE07F00000000000000000000000000000000000000000000000000000000
      00001F001F001F00E07FFF031002100210000000000000000000000000000000
      1000FF7FFF7FFF7F1000000000001000FF7F0000000000000000000000000000
      00000000000000000000000000001F7C1F7C0000000000000000000000000000
      0000E07FE07F0000000000000000000000000000000000000000000000000000
      00001F001F001F00E07FE07FFF03100210020000000000000000000000000000
      1000100010001000100000000000100010000000000000000000000000000000
      00000000000000000000000000001F7C1F7C0000000000000000E07F00000000
      00000000E07FE07F000000000000000000000000000000000000000000000000
      0000007C007C007C000200020002FF03FF030000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001F7C1F7C0000000000000000E07F00000000
      000000000000E07F000000000000000000000000000000000000000000000000
      0000007C007C007C000200020002000000000000000000000000000000000000
      0000000000000000000000000000100010000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E07FE07F0000
      00000000E07FE07F000000000000000000000000000000000000000000000000
      0000007C007C007C000200020002000000000000000000000000000000000000
      00000000000000000000000000001000FF7F0000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000E07FE07F
      E07FE07FE07F0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000100010000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000
      E07FE05EE05E0000000000000000000000000000000000000000000000000000
      0000FF0310020000104200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001042FF7FFF7FFF7FFF7FFF7F0000000000000000000000000000
      0000E07FE05EE05E000000000000000000000000000000000000000000000000
      0000FF03FF031002000000000000000000000000000000000000000000000000
      170017001700000000000000000000000000000000000000000000000000FF7F
      E07FFF7FE07F0000FF7FFF7FFF7FFF7F10420000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000010421042104200000000000000000000000000000000000000000000
      1700170017000000000000000000000000000000000000000000000000000000
      FF7FE07FFF7F00420000FF7FFF7F104200000000000000000000000000000000
      000000001042E05E000000000000000000000000000000000000000000000000
      0000100200000000104200000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF7F
      00000042E07FFF7F004200000000000000000000000000000000000000000000
      E05EE05EE05E0000000000000000000000000000000000000000000000000000
      0000FF0310020000104210420000000000000000000000000000000000000000
      170017001042000000000000000000000000000000000000000000000000E07F
      0042E07FFF7FE07FFF7FE07F0000000000000000000000000000000000000000
      E07FE05EE05E1042000000000000000000000000000000000000000000000000
      0000FF0310021002000010421042000000000000000000000000000000000000
      1700170010420000000000000000000000000000000000000000FF7FE07FFF7F
      E07FFF7FE07FFF7FE07FFF7F0000000000000000000000000000000000000000
      E07FE05EE05EE05E000000000000000000000000000000000000000000000000
      00000000FF031002100200001042104200000000000000000000000000000000
      00001700170000000000000000000000000000000000000010420042FF7F0000
      FF7F0000FF7FE07FFF7FE07F0000000000000000000000000000000000000000
      0000E07FE05EE05EE05E10420000000000000000000000000000000000000000
      000010420000FF03100210020000104210420000000000000000000000000000
      00000000170017001042000000000000000000000000000000000000E07F0000
      0000FF7FE07FFF7FE07FFF7F0000000000000000000000000000000000000000
      00000000E07FE05EE05EE05E0000000000000000000000000000000000000000
      0000104210420000FF0310021002000010420000000000000000000017001700
      000000001042170017001042000000000000000000000000000000000000E07F
      FF7FE07FFF7FE07FFF7FE07F0000000000000000000000000000000000001042
      000000000000E07FE05EE05EE05E104200000000000000000000000000001002
      10020000104210420000FF031002000010420000000000000000170017001042
      000000000000170017001700000000000000000000000000000000001F001F00
      1F001F001F001F001F001F001000000000000000000000000000E05EE05EE05E
      0000000000000000E07FE05EE05E00000000000000000000000000000000FF03
      10021002000010421042FF031002000000000000000000000000170017001042
      0000000000001700170017000000000000000000000000000000000010001F00
      1F001F001F001F001F001F001000000000000000000000000000E07FE05EE05E
      E05E104200001042E05EE05EE05E104200000000000000000000000000000000
      FF03100210020000000010021002100200000000000000000000000017001700
      0000000010421700170010420000000000000000000000000000000000001000
      1F001F001F001F001F00100000000000000000000000000000000000E07FE05E
      E05EE05EE05EE05EE05EE05EE05EE05E00000000000000000000000000000000
      0000FF031002100210021002FF03000000000000000000000000000000001700
      1700170017001700104200000000000000000000000000000000000000000000
      100010001000100010000000000000000000000000000000000000000000E07F
      E07FE05EE05EE05EE05EE05EE05E000000000000000000000000000000000000
      00000000FF03FF03FF03FF030000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E07FE07FE07FE07FE07F0000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000001042000000001042
      0000000010420000000010420000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042000000001042
      0000000010420000000010420000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000104210420000104210420000
      1042104200001042104200001042104200000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000E002E002
      0000170017000000005C005C0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042000000001042
      0000000010420000000010420000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000005C00000000E002E002
      0000170017000000005C005C0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042000000001042
      0000000010420000000010420000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000E002E002
      0000170017000000005C005C0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000104210420000104210420000
      1042104200001042104200001042104200000000000000000000000000000000
      00000000000000000000000000000000000000000000005C00000000E002E002
      0000170017000000005C005C0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042000000001042
      0000000010420000000010420000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000E002E002
      0000170017000000005C005C0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042000000001042
      0000000010420000000010420000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000005C0000000000000000
      0000170017000000005C005C0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000104210420000104210420000
      1042104200001042104200001042104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000170017000000005C005C0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042000000001042
      0000000010420000000010420000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000005C0000000000000000
      0000170017000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042000000001042
      0000000010420000000010420000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000170017000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000104210420000104210420000
      1042104200001042104200001042104200000000000000000000000000000000
      00000000000000000000000000000000000000000000005C0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042000000001042
      0000000010420000000010420000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042000000001042
      0000000010420000000010420000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000004218630000
      000000000000000018630042E07F004200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E07F00421863
      0000000000000000000018630042E07F00000000000000000000186318631863
      1863186318631863186318630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF7FFF7FFF7F
      00000000000000000000FF7FFF7F186300000000000000000000186318631863
      1863000018631863186318630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000186300000000
      0000000000000000000000000000000000000000000000000000FF7FFF7FFF7F
      00000000000000000000FF7FFF7F186300000000000000000000186318631863
      0000FF7F00001863186318630000000000000000104200000000000000000000
      0000104200000000000000000000000000000000000000000000000018631863
      0000000000000000000000000000000000000000000000000000FF7FFF7FFF7F
      0000FF7FFF7FFF7F0000FF7FFF7F186300000000000000000000186318631863
      0000FF7F00001863186318630000000000000000000018631863186318631863
      1863000000000000000000000000000000000000000000000000000018631863
      18630000000000000000000000000000000000000000000000001863FF7FFF7F
      FF7F000000000000FF7FFF7F1863104200000000000000000000186318631863
      0000FF7F00001863186318630000000000000000000018631863186318631863
      1863000010420000000000000000000000000000000000000000000000001863
      186318630000000000000000000000000000000000000000000000001863FF7F
      FF7F104200001042FF7F18631863000010420000000000000000186318631863
      0000FF7F00001863186318630000000000000000104200001863186318631863
      1863000010421042000000000000000000000000000000000000000000000000
      186318631863000000000000000000000000000000000000000000000000FF7F
      FF7F104200001042186300000000104200000000000000000000186318631863
      0000FF7F00001863186318630000000000000000000000001863FF7F1863FF7F
      1863FF7F00001042104200000000000000000000000000000000000000000000
      0000186318631863000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000018631863
      0000FF7F000018631863000000000000000000000000000000001863FF7F1863
      FF7F1863FF7F0000104210420000000000000000000000000000000000000000
      00000000186300000000000000000000000000000000000000000000FF7FFF7F
      FF7F186300001042186310421042000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000001863FF7F
      1863FF7F1863FF7F000010421042104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000104200000000
      0000000000000000000000000000104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001863
      FF7F1863FF7F1863FF7F00001042000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000104200001042000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      1863FF7F1863FF7F1863FF7F1042000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001863FF7F1863FF7F18631863000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000104200000000000000001042104200000000000000000000000000000000
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
      00000000000000000000000000000000000000000000F7021042F7021042F702
      1042F7021042F7021042F7021042F70200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7FFF7F0000104200001042
      000010420000104200001042000010420000000000001042F702000000000000
      000010420000000000000000F7021042000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000F7021042F7021042F702
      1042F7021042F7021042F7021042F70200000000E07F0000FF7F000010420000
      10420000104200001042000010420000000000000000F70210420000FF7FFF7F
      0000F7020000FF7FFF7F00001042F702000000000000FF7FFF7FFF7FFF7F0000
      00000000000000000000FF7FFF7FFF7F0000000000001042F702104200000000
      000000000000000000001042F7021042000000000000FF7F0000FF7F00001042
      000010420000104200001042000010420000000000001042F7020000FF7FFF7F
      000010420000FF7FFF7F0000F7021042000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000F7021042F7020000FF7F
      FF7FFF7FFF7FFF7F0000F7021042F70200000000FF7F0000E07F000010420000
      10420000104200001042000010420000000000000000F70210420000FF7FFF7F
      0000F7020000FF7FFF7F00001042F702000000000000FF7FFF7FFF7FFF7F0000
      0000000000000000FF7FFF7FFF7FFF7F0000000000001042F70210420000FF7F
      170017001700FF7F00001042F7021042000010420000FF7F0000FF7FFF7F1042
      000000000000104200001042000010420000000000001042F702000000000000
      000010420000000000000000F7021042000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000F7021042F7020000FF7F
      FF7FFF7FFF7FFF7F0000F7021042F70200000000104200001042000010420000
      00000000104200001042000010420000000000000000F7021042F7021042F702
      1042F7021042F7021042F7021042F702000000000000FF7FFF7F1700FF7F0000
      000000000000FF7FFF7F1700FF7FFF7F0000000000001042F70210420000FF7F
      17001700FF7FFF7F00001042F702104200001042000010420000104200000000
      000000000000104200001042000010420000000000001042F702000000000000
      000010420000000000000000F7021042000000000000FF7F17001700FF7FFF7F
      FF7FFF7FFF7FFF7FFF7F17001700FF7F000000000000F7021042F7020000FF7F
      FF7FFF7FFF7FFF7F0000F7021042F70200000000104200001042000000000000
      10420000000000001042000010420000000000000000F70210420000FF7FFF7F
      0000F7020000FF7FFF7F00001042F7020000000000001700170017001700FF7F
      000000000000FF7F17001700170017000000000000001042F70210420000FF7F
      170017001700FF7F00001042F702104200001042000010420000000000000000
      0000FF7F0000000000001042000010420000000000001042F7020000FF7FFF7F
      000010420000FF7FFF7F0000F7021042000000000000FF7F17001700FF7FFF7F
      FF7FFF7FFF7FFF7FFF7F17001700FF7F000000000000F7021042F7020000FF7F
      FF7FFF7FFF7FFF7F0000F7021042F70200000000104200001042000010420000
      1042FF7FFF7F00000000000010420000000000000000F70210420000FF7FFF7F
      0000F7020000FF7FFF7F00001042F702000000000000FF7FFF7F1700FF7F0000
      0000000000000000FF7F1700FF7FFF7F0000000000001042F702104200000000
      000000000000000000001042F702104200001042000010420000104200001042
      00001042FF7FFF7F00000000000010420000000000001042F702000000000000
      000010420000000000000000F7021042000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000F7021042F7021042F702
      1042F7021042F7021042F7021042F70200000000104200001042000010420000
      104200001042FF7FFF7F000000000000000000000000F7021042F7021042F702
      1042F7021042F7021042F7021042F70200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001042000010420000104200001042
      00001042000010420000FF7F0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000104200001042000010420000
      1042000010420000104200001042000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001042000010420000104200001042
      00001042000010420000104200001042000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7F000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000001042FF7F1042104210421042
      10421042104210421042FF7F000000000000000000001F7C000000000000FF7F
      00001F7C00001F7C000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000001042FF7F00001042FF7F0000
      00000000000000001042FF7F000000000000000000001F7C000000000000FF7F
      00001F7C00001F7C000000000000000000000000000010420000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000104200000000F7021042F7021042F702
      1042F7021042F7021042F7021042F702000000001042FF7F00001042FF7F0000
      000000001F7C1F7C1042FF7F000000000000000000001F7C1F7C000000000000
      000000001F7C1F7C000000000000000000000000000010420000FF7F00000000
      00000000000000000000FF7FFF7F00001042000000001042F702104200000000
      000000000000000000001042F7021042000000001042FF7F0000000000001040
      1F7C1F7C1F7C1F7C0000FF7F000000000000000000001F7C1F7C1F7C1F7C1F7C
      1F7C1F7C1F7C1F7C000000000000000000000000000010420000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000104200000000F7021042F7020000FF7F
      FF7FFF7FFF7FFF7F0000F7021042F702000000001042FF7F0000104000000000
      0000104010401F7C00000000000000000000000000001F7C1F7C000000000000
      0000104010401F7C000000000000000000000000000010420000FF7F00000000
      000000000000000000000000FF7F00001042000000001042F70210420000FF7F
      170017001700FF7F00001042F7021042000000001042FF7F1040FF7FFF7FFF7F
      FF7F00000000104000000000000000000000000000001F7C0000FF7FFF7FFF7F
      0000000010421040000000000000000000000000000010420000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000104200000000F7021042F7020000FF7F
      FF7FFF7FFF7FFF7F0000F7021042F702000000001042FF7F1040FF7FFF7FFF7F
      104200000000000000000000000000000000000000001F7C0000FF7FFF7FFF7F
      1042000000000000000000000000000000000000000010420000FF7F00000000
      00000000000000000000FF7FFF7F00001042000000001042F70210420000FF7F
      17001700FF7FFF7F00001042F7021042000000001042FF7F1040FF7FFF7FFF7F
      FF7F0000FF03100200000000000000000000000000001F7C0000FF7FFF7FFF7F
      FF7F0000FF031002000000000000000000000000000010420000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000104200000000F7021042F7020000FF7F
      FF7FFF7FFF7FFF7F0000F7021042F702000000001042FF7FFF7FFF7FFF7FFF7F
      FF7F0000FF7FFF0310020000000000000000000000001F7C0000FF7FFF7FFF7F
      FF7F0000FF7FFF03100200000000000000000000000010420000FF7F00000000
      000000000000000000000000FF7F00001042000000001042F70210420000FF7F
      170017001700FF7F00001042F702104200000000104210421042000000000000
      000000000000FF7FFF0310020000000000000000000000000000000000000000
      000000000000FF7FFF0310020000000000000000000010420000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000104200000000F7021042F7020000FF7F
      FF7FFF7FFF7FFF7F0000F7021042F70200000000000000000000000000000000
      0000000000000000FF7FFF031002000000000000000000000000000000000000
      0000000000000000FF7FFF031002000000000000000010420000000000000000
      000000000000000000000000000000001042000000001042F702104200000000
      000000000000000000001042F702104200000000000000000000000000000000
      00000000000000000000FF7FFF03100200000000000000000000000000000000
      00000000000000000000FF7FFF03100200000000000010421042104210421042
      10421042104210421042104210421042104200000000F7021042F7021042F702
      1042F7021042F7021042F7021042F70200000000000000000000000000000000
      000000000000000000000000FF7FFF0300000000000000000000000000000000
      000000000000000000000000FF7FFF0300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001F001F000000
      10421F001F00FF7F1863186300001F001F0000000000000000001F001F000000
      10421F001F00FF7F1863186300001F001F000000000000000000007C00000000
      00000000007C00000000000000000000000000000000FF7F007C007C18631863
      18631863186318631863104200000000000000000000000000001F001F000000
      10421F001F00FF7F1863186300001F001F0000000000000000001F001F000000
      10421F001F00FF7F1863186300001F001F000000000000000000007C007C0000
      00000000007C00000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F18630000000000001863186318631863186318631863
      18631863186318631863186318631F001F001863186318631863186318631863
      18631863186318631863186318631F001F0000000000000000000000007C0000
      0000007C00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001863186318631863186318631863
      18631863186318631863186318631F001F001863186318631863186318631863
      18631863186318631863186318631F001F0000000000000000000000007C007C
      0000007C00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001863186318631863000000000000
      00000000186318631863186318631F001F001863186318631863000000000000
      00000000186318631863186318631F001F00000000000000000000000000007C
      007C007C00000000000010420000000000000000000000000000000000000000
      0000000000000000000000000000000000001863186318631863000010421042
      104200001863186318631863186310021F0018631863186318630000007C005C
      007C00001863186318631863186310021F00000000000000000000000000007C
      007C000000000000000000001F001F001F000000000000000000000000000000
      0000000000000000000000000000000000001863186318631863000010421042
      104200001863186318631863186300001F0018631863186318630000005C007C
      005C00001863186318631863186300001F000000000000000000000000000000
      007C00000000000000001F001F00000000000000000000000000000000000000
      0000000000000000000000000000000000001863186318631863000010421042
      104200001863186318631863186300001F0018631863186318630000007C005C
      007C00001863186318631863186300001F000000000000000000000000000000
      007C00000000000000001F000000000000000000000000000000000000000000
      00000000000000000000FF7FFF7FFF7FFF7F1863186318631863000010421042
      104200001863186318631863186300001F0018631863186318630000005C007C
      005C00001863186318631863186300001F000000000000000000000000000000
      000000000000000000001F001F00000000000000000000000000000010420000
      00000000000000000000FF7F1700170017001863186318631863000010421042
      104200001863186318631863186300001F0018631863186318630000007C005C
      007C00001863186318631863186300001F000000000000000000000000000000
      000000000000000000001F001F001F001F000000000000001042000000000000
      00000000000000000000FF7FFF7FFF7FFF7F1863186300000000000010421042
      10420000000000001863186318630000000018631863000000000000005C007C
      005C000000000000186318631863000000000000000000000000000000000000
      000000000000000000001F000000000000000000000000000000104200000000
      00000000000000000000FF7F1700170017001863186318630000104210421042
      104210420000186318631863186300001F001863186318630000005C007C005C
      007C005C0000186318631863186300001F000000000000000000000000000000
      000000000000000000001F000000000000000000000000000000000000000000
      00000000000000000000FF7FFF7FFF7FFF7F1863186318631863000010421042
      10420000186318631863186318630000000018631863186318630000005C007C
      005C000018631863186318631863000000000000000000000000000000000000
      0000000000001F001F001F001F001F001F000000000000000000000000000000
      00000000000000000000FF7F17001700FF7F1863186318631863186300001042
      000018631863186318631863186300000000186318631863186318630000005C
      0000186318631863186318631863000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF7FFF7FFF7FFF7F1863186318631863186318630000
      1863186318631863186318631863000000001863186318631863186318630000
      1863186318631863186318631863000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001863186318631863186318631863
      1863186318631863186318631863000000001863186318631863186318631863
      1863186318631863186318631863000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001F001F000000
      10421F001F00FF7F1863186300001F001F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000
      000000000000FF7FFF7FFF7FFF7FFF7FFF7F00000000000000001F001F000000
      10421F001F00FF7F1863186300001F001F000000000000000042004200420042
      0042004200420042004200000000000000000000000000000000000000000000
      000000000000FF7F1042104210421042FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000001F001F000000
      18631042104218631863186300001F001F0000000000E07F0000004200420042
      0042004200420042004200420000000000000000000000000000000000000000
      000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000001F001F001002
      00000000000000000000000010021F001F0000000000FF7FE07F000000420042
      0042004200420042004200420042000000000000000000000000000000000000
      000000000000FF7F1042104210421042FF7FFF7FFF7F0000000010420000FF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000001F001F001F00
      1F001F001F001F001F001F001F001F001F0000000000E07FFF7FE07F00000042
      0042004200420042004200420042004200000000170017001700170017001700
      170017000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000E07FE05E00001042
      0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000001F0010020000
      000000000000000000000000000010021F0000000000FF7FE07FFF7FE07F0000
      0000000000000000000000000000000000000000170010421042104210421042
      104210420000FF7F1042104210421042FF7FFF7FFF7FFF7F0000E07FE07F0000
      000010420000FF7FFF7FFF7FFF7FFF7FFF7F00000000000000001F000000FF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F00001F0000000000E07FFF7FE07FFF7FE07F
      FF7FE07FFF7FE07F000000000000000000000000170000000000000000000000
      000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000E07FE07F
      E05E000000001042FF7FFF7FFF7FFF7FFF7F00000000000000001F000000FF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F00001F0000000000FF7FE07FFF7FE07FFF7F
      E07FFF7FE07FFF7F000000000000000000000000170000000000000000000000
      000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F0000E07F
      E07FE07F000000001042FF7FFF7FFF7F000000000000000000001F000000FF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F00001F0000000000E07FFF7FE07F00000000
      0000000000000000000000000000000000000000170000000000000000000000
      000000000000000000001700000000000000FF7FFF7FFF7FFF7FFF7F00000000
      E07FE07FE07F000000000000FF7FFF7F000000000000000000001F000000FF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F00001F000000000000000000000000000000
      0000000000000000000000000000000000000000170000000000000000000000
      000000000000000000001700000000000000FF7FFF7FFF7FFF7F00000000E07F
      E07FE07F000000000000FF7FFF7FFF7F0000000000000000000000000000FF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000000000000000000000000000
      0000000000000000000000000000000000000000170000000000000000000000
      000000000000000000001700000000001700FF7FFF7FFF7FFF7FFF7F00000000
      E07FE07FE07F000000000000FF7FFF7F170000000000000000001F000000FF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F00001F000000000000000000000000000000
      0000000000000000000000000000000000000000170017001700170017001700
      170017001700170017001700000017001700FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      00000000E07FE07F000000000000FF7F17000000000000001042000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000001700FF7F17001700FF7F1700
      1700FF7F17001700FF7F1700000000001700FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7F00000000E07F00000000000017000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000170017001700170017001700
      170017001700170017001700000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7F000000000000FF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000104210421042104200000000
      FF7F0000000000000000000000000000000000000000FF7FFF7F000000000000
      00000000000000000000104210421042000000001F000000FF7F0000FF7FFF7F
      FF7FFF7F1F00000000000000FF7FFF7FFF7F0000000000001042000010000000
      1000000000000000100000001000000010001042FF7FFF7FFF7FFF7F10420000
      FF7F000000000000000000000000000000000000000000000000FF7FFF7F0000
      0000000000000000FF7FFF7F00000000104200001F0000000000FF7F0000FF7F
      FF7FFF7F1F00000000000000FF7FFF7FFF7F0000000000001042100000001000
      00000000007C007C000010000000100000001042FF7F005C005CFF7F10420000
      FF7F0000000000000000000000000000000000000000FF7FFF7FFF7F00000000
      FF7FFF03FF031F000000FF7FFF7F0000000000001F00000000000000FF7F0000
      FF7FFF7F1F00000000000000FF7FFF7FFF7F0000000000001042000010000000
      0000007C007C007C007C00001000000010001042FF7F005C005CFF7F10420000
      FF7F00000000000000000000000000000000000000000000FF7FFF7F0000FF7F
      FF7F1F00FF03FF031F00FF7FFF7F0000000000001F00000000000000FF7FFF7F
      0000FF7F1F00000000000000FF7FFF7FFF7F0000000000001042100000000000
      007C007C007C007C007C007C0000100000001042FF7FFF7FFF7FFF7F10420000
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7F00000000
      FF7FFF03FF03FF030000000000000000000000001F0000000000000000000000
      000000001F000000000000000000000000000000000000001042104210421042
      10420000007C007C0000104210421042104200001042104210421042FF7F0000
      0000000000000000000000000000000000000000FF7F00000000000000000000
      00000000000000000000000000000000000000001F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000007C007C000000000000000000001042FF7FFF7FFF7FFF7F1042FF7F
      FF7FFF7FFF7F1042000000000000005C000000000000FF7F0000000000000000
      00000000000000000000000000000000104200001F0000001F001F001F001F00
      1F001F001F0000001F001F001F001F001F000000000000000000FF7FFF7FFF7F
      FF7F0000007C007C0000FF7FFF7FFF7FFF7F1042FF7FE05EE05EFF7F1042FF7F
      E002E002FF7F104200000000005C005C005C000000000000FF7F000000000000
      00000000000000000000000010421042104200001F00000000000000FF7FFF7F
      FF7FFF7F1F0000000000FF7FFF7FFF7FFF7F0000000000001042E07FFF7FE07F
      FF7F0000007C007C0000E07FFF7FE07FFF7F1042FF7FE05EE05EFF7F1042FF7F
      E002E002FF7F1042000000000000005C00000000000000000000FF7FFF7FFF7F
      FF7F0000000000001042104210421042104200001F00000000000000FF7FFF7F
      FF7FFF7F1F000000FF7F0000FF7FFF7FFF7F0000000000001042FF7FE07FFF7F
      E07F0000007C007C0000FF7FE07FFF7FE07F1042FF7FFF7FFF7FFF7F1042FF7F
      FF7FFF7FFF7F1042000000000000005C000000000000FF7F00000000FF7FFF7F
      FF7F0000000000001042104210421042000000001F00000000000000FF7FFF7F
      FF7FFF7F1F0000000000FF7F0000FF7FFF7F0000000000001042E07FFF7FE07F
      FF7F0000000000000000E07FFF7FE07FFF7F00001042104210421042FF7F1042
      1042104210420000000000000000005C0000FF7F00000000FF7F000000000000
      00001042104210421042104210420000000000001F00000000000000FF7FFF7F
      FF7FFF7F1F00000000000000FF7F0000FF7F0000000000001042FF7FE07FFF7F
      E07FFF7FE07FFF7FE07FFF7FE07FFF7FE07F1042FF7FFF7FFF7FFF7F1042FF7F
      FF7FFF7FFF7F1042000000000000005C0000FF7F000000000000FF7F00000000
      00000000000000000000000000000000000000001F00000000000000FF7FFF7F
      FF7FFF7F1F00000000000000FF7FFF7F00000000000000001042E07FFF7FE07F
      FF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7F1042FF7F1F7C1F7CFF7F1042FF7F
      1F001F00FF7F005C005C005C005C005C0000FF7F0000000000000000FF7F0000
      00000000000000000000000000000000000000001F0000000000000000000000
      000000001F000000000000000000000000000000000000001042FF7FE07FFF7F
      E07FFF7FE07FFF7FE07FFF7FE07FFF7FE07F1042FF7F1F7C1F7CFF7F1042FF7F
      1F001F00FF7F104200000000000000000000FF7FFF7F0000000000000000FF7F
      00000000000000000000000000000000000000001F0000000000000000000000
      0000000000000000000000000000000000000000000000001042104210421042
      1042104210421042104210421042104210421042FF7FFF7FFF7FFF7F1042FF7F
      FF7FFF7FFF7F1042000000000000000000001042FF7FFF7F0000000000000000
      FF7FFF7F000000000000000000000000104200001F001F001F001F001F001F00
      1F001F001F001F001F001F001F001F001F000000000000000000000000000000
      0000000000000000000000000000000000000000104210421042104200001042
      10421042104200000000000000000000000000001042FF7FFF7F000000000000
      0000000000000000104210421042104210420000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E07F
      E05E0000E07F0000E07FE05E0000E05EE07F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF030000
      E07FE05EE05EE07FE05E0000E05EE07F00000000170017001700170017000000
      000000000000000000000000F702000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF03FF03
      0000E07F0000E07F0000E05EE07F0000FF0300001700FF7FFF7FFF7FFF7F0000
      1042104210420000F70200000000000010420000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF03FF03
      FF030000E05E0000FF0300000000FF03FF0300001700FF7F0000000010420000
      000000000000F7020000FF03FF03000000000000000000000000000000000000
      0000000000000000F702F702F702000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF03FF03
      FF03FF030000FF03FF03FF03FF03FF03FF0300001700FF7FFF7FFF7FFF7FFF7F
      10420000F7020000FF03FF030000000017000000000010421042104210421042
      10420000FF030000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF03FF03
      FF03FF03FF03FF03FF03FF03FF03FF03FF0300001700FF7F0000000010421042
      0000F7020000FF03FF0300000000FF7F17000000000000000000000000000000
      000000000000FF03FF03FF030000104200000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF03FF03
      FF03FF03FF03FF03FF03FF0300000000FF0300001700FF7FFF7FFF7FFF7F0000
      F7020000FF03FF03000000000000000017000000000000001863186318631042
      FF030000FF03FF03FF0300000000104200000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF03FF03
      FF03FF03FF03FF03FF030000E07FE07F000000001700FF7F0000000010420000
      0000FF03FF030000FF03FF03000000001700000000000000000018631042FF03
      0000FF03FF03FF03000018631863000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF03FF03
      FF03FF03FF03FF03FF030000E07FE07F000000001700FF7FFF7FFF7FFF7F0000
      FF03FF030000FF7F0000FF03FF030000170000000000000000000000FF030000
      FF03FF03FF030000000000000000000000000000000000000000000000000000
      000000000000005C005C005C00000000000000000000000000000000FF03FF03
      FF03FF03FF03FF03FF03FF0300000000FF0300001700FF7F0000000010420000
      000000000000FF7F000000000000000017000000000000000000FF030000FF03
      FF03FF0300001042000000000000000000000000000000000000000000000000
      000000000000005C0000000000000000000000000000000000000000FF03FF03
      FF03FF03FF03FF03FF03FF03FF03FF03FF0300001700FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F1700000000000000FF030000FF03FF03
      FF03000018630000104200000000000000000000000000000000000000000000
      0000000000000000005C00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000170017001700170017001700
      17001700170017001700170017001700170000000000FF030000FF03FF03FF03
      0000186318631863000010420000000000000000000000000000000000000000
      00000000000000000000005C0000000000000000000000000000000000000000
      00000000000000000000000000000000000000001700FF7F170017001700FF7F
      170017001700FF7F170017001700FF7F17000000FF030000FF03FF03FF030000
      0000000018631863186300001042000000000000000000000000000000000000
      000000000000005C005C00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000170017001700170017001700
      17001700170017001700170017001700170000000000FF03FF03FF0300000000
      0000000000001863186318630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF7FFF7F00000000000000000000000000000000E05EE05EE05EE05E
      000010421863186300001042104210420000000000001042FF7F0000FF7F1042
      FF7F0000FF7F1042FF7F0000FF7F1042FF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF7F0000000000000000000000000000E05EE05EE05EE05E
      0000104210421042000010421042104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF7F0000000000000000000000000000E05EE05EE05EE05E
      0000000000000000000000000000000018630000100010001000100010001000
      1000100010001000100000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF7F000000000000E05EE05EE05EE05E
      E05EE05EE05EE05EE05EE05EE05EE05EE05E00001000E003E003E003E003E003
      E003E003E0031000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF7F0000000000000000E05EE05EE05EE05E
      E05EE05EE05EE05EE05EE05EE05EE05EE05E00001000E0031000100010001000
      E003E00310000000000000000000000000000000000000000000FF03FF03FF03
      FF03FF03FF03FF03000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF7F0000000000000000E05EE05EE05EE05E
      00000000000000000000000000000000E05E00001000E003100010421000E003
      E003100000000000104200000000000000000000000000000000FF0300000000
      00000000FF030000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF7F000000000000E05EE05EE05E0000
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000000001000E00310001000E003E003
      1000000000000000000000001042000000000000000000000000FF0300000000
      0000FF0300000000000000000000000000000000000000000000000000000000
      0000000000000000FF7F0000000000000000000000000000E05EE05EE05E0000
      FF7F170017001700170017001700FF7F000000001000E0031000E003E0031000
      0000000010420000000018630000000010420000000000000000FF0300000000
      FF03FF0300000000000000000000000000000000000000000000000000000000
      00000000FF7FFF7F00000000000000000000000000000000E05EE05EE05E0000
      FF7FFF7FFF7F1700170017001700FF7F000000001000E003E003E00310000000
      00000000000000001863FF7FFF7F186300000000000000000000FF030000FF03
      FF03000000000000000000000000000000000000000000000000000000000000
      00000000FF7FFF7F00000000000000000000000000000000E05EE05EE05E0000
      FF7FFF7F17001700170017001700FF7F000000001000E003E003100000000000
      00000000000010420000FF7FFF7FFF7F18630000000000000000FF03FF03FF03
      0000000000000000FF7FFF7F0000000000000000000000000000000000000000
      0000FF7F0000000000000000000000000000000000000000E05EE05EE05E0000
      FF7F170017001700170017001700FF7F000000001000E0031000000000000000
      000000000000000000001863FF7FFF7F18630000000000000000FF03FF030000
      0000000000000000FF7FFF7F00000000000000000000000000000000FF7F0000
      000000000000000000000000000000000000000000000000E05EE05EE05E1042
      1700170017001700FF7F17001700FF7F00000000100010000000000000000000
      0000000000000000104200001863186300000000000000000000FF0300000000
      00000000000000000000FF7FFF7F0000000000000000000000000000FF7F0000
      000000000000000000000000000000000000000000000000E05EE05EE05E1700
      170017001700FF7FFF7FFF7FFF7FFF7F00000000100000000000000000000000
      00000000000000000000000000000000FF7F0000000000000000000000000000
      00000000000000000000FF7F0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000104217001700
      1700170010420000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E07FFF7F0000000000000000000000000000
      000000000000000000000000FF7FFF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000170017001700
      1700000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000E07F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001700170017001700
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001000FF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000104200000000000000000000
      00000000005C000000000000000000000000000010420000FF7FFF7F17001700
      17001700FF7F1700170017001700FF7FFF7F000000001863004018630000FF7F
      1000100010001000FF7F0000FF7F1000100000000000000000001000FF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000010420000FF7FFF7FFF7FFF7F
      FF7FFF7F005CFF7FFF7FFF7FFF7FFF7FFF7F000010420000FF7F17001700FF7F
      17001700FF7F17001700FF7F17001700FF7F000000001863186318630000FF7F
      FF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7F0000000000000000100010001000
      100010001000100010001000100010001000000010420000FF7FFF7FFF7FFF7F
      FF7FFF7F005CFF7FFF7FFF7FFF7FFF7FFF7F000010420000FF7F17001700FF7F
      17001700FF7F17001700FF7F17001700FF7F000000001863004018630000FF7F
      1000100010001000FF7F0000FF7F100010000000000000000000000000000000
      000000000000000000000000000000000000000010420000FF7F1F001F001F00
      1F00FF7F005CFF7F1F001F001F001F00FF7F000010420000FF7FFF7F17001700
      17001700FF7F17001700FF7F17001700FF7F000000001863186318630000FF7F
      FF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7F0000000000000000000000000000
      000000000000000000000000000000000000000010420000FF7F1F00FF7F1F00
      1F00FF7F005CFF7F1F001F00FF7F1F001F00000010420000FF7FFF7FFF7FFF7F
      17001700FF7F17001700FF7F17001700FF7F000000001863004018630000FF7F
      1000100010001000FF7F0000FF7F100010000000000000000000000000000000
      00000000FF7FE07FFF7FE07FFF7FE07FFF7F000010420000FF7F1F001F001F00
      1F00FF7F005CFF7F1F001F00FF7F1F001F00000010420000FF7FFF7F17001700
      1700FF7FFF7F1700170017001700FF7FFF7F000000001863186318630000FF7F
      FF7F000000001042186300001863186318630000000000000000000000000000
      000000000000000000000000000000000000000010420000FF7FFF7FFF7F1F00
      1F00FF7F005CFF7F1F001F00FF7F1F001F00000010420000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7F17001700FF7FFF7FFF7FFF7F000000001863004018630000FF7F
      1000000000000000000010421863100010000000000000000000000000000000
      000000000000000000000000000000000000000010420000FF7F1F001F001F00
      FF7FFF7F005CFF7F1F001F001F001F00FF7F000010420000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7F17001700FF7FFF7FFF7FFF7F000000001863186318630000FF7F
      FF7F104200000000186300000000104218630000000000000000000000000000
      000000000000000000000000000000000000000010420000FF7FFF7FFF7FFF7F
      FF7FFF7F005CFF7F1F001F00FF7FFF7FFF7F000010420000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000000001863004018630000FF7F
      1000100000001863FF7FFF7F1863000000000000000000000000000000000000
      00000000FF7FE07FFF7FE07FFF7FE07FFF7F000010420000FF7FFF7FFF7FFF7F
      FF7FFF7F005CFF7F1F001F00FF7FFF7FFF7F0000104200000000000000000000
      000000000000000000000000000000000000000000001863186318630000FF7F
      FF7FFF7F10420000FF7FFF7FFF7F186300000000000000000000000000000000
      000000000000000000000000000000000000000010420000FF7FFF7FFF7FFF7F
      FF7FFF7F005CFF7FFF7FFF7FFF7FFF7FFF7F0000104210421042104210421042
      1042104210421042104210421042104210420000000000000000000000000000
      00000000000000001863FF7FFF7F186300000000000000000000000000000000
      0000000000000000000000000000000000000000104200000000000000000000
      00000000005C0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF03FF03FF03FF03FF03
      FF03FF03FF0310420000186318630000E07F0000000000000000000000000000
      0000000000000000000000000000000000000000104210421042104210421042
      10421042005C1042104210421042104210420000000000000000000000000000
      00000000000000000000000000000000005C0000000000000000000000000000
      0000000000000000000000000000FF7FE07F00000000000000000000FF7FE07F
      FF7FE07FFF7FE07FFF7F00000000000000000000000000000000000000000000
      005C005C0000005C005C00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000E07FFF7FFF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E07FFF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000E07F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042000000000000
      1042000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010420000000000000000
      0000104200000000000000000000000000000000000000000000000000000000
      1042000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010420000000000000000
      0000000000000000000000000000000000000000000000000000000000001042
      1042000000000000000000000000000000000000000018631863186318631863
      1863186318631863186318631863186300000000000000000000000000000000
      000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000000010421042
      1863000000000000000000000000000000000000000018630000000000000000
      0000000000000000000000000000186300000000000000000000FF03FF7FFF03
      FF7FFF03FF7FFF03FF7FFF03000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000000010421042104210421863
      1863000000000000000000000000000000000000000018630000FF7F1863FF03
      186318631863FF03186318630000186300000000000000000000FF7F10421042
      10421042104210421042FF7F000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F0000000000000000000000001863E07F1863E07F1863
      E07F0000000000000000000000000000000000000000186300001863FF7F1863
      FF03186318631863FF0318630000186300000000000000000000FF03FF7FFF03
      FF7FFF03FF7FFF03FF7FFF03000000000000FF7FFF7FFF7FFF7FFF7FFF7F0000
      FF7FFF7FFF7FFF7FFF7F000000000000000000000000E07F1863E07F1863E07F
      1863000000000000000000000000000000000000000018630000FF7F1863FF7F
      1863FF03186318631863FF030000186300000000000000000000FF7F10421042
      10421042104210421042FF7F000000000000FF7FFF7FFF7FFF7FFF7F00000000
      0000FF7FFF7FFF7FFF7F000000000000000000000000E07FE07FE07FE07FE07F
      E07F0000000000000000000000000000000000000000186300001863FF7F1863
      FF7F1863FF031863186318630000186300000000000000000000FF03FF7FFF03
      FF7FFF03FF7FFF03FF7FFF03000000000000FF7FFF7FFF7FFF7F000000000000
      00000000FF7FFF7FFF7F0000000000000000000000001863186318631863E07F
      E07F000000000000000000000000000000000000000018630000FF031863FF7F
      1863FF7F1863FF03186318630000186300000000000000000000FF7F10421042
      1042FF7FFF03FF7FFF03FF7F000000000000FF7FFF7FFF7F0000000000000000
      000000000000FF7FFF7F10420000000000000000000000000000000010421863
      18630000000000000000000000000000000000000000186300001863FF031863
      FF7F1863FF7F1863FF0318630000186300000000000000000000FF03FF7FFF03
      FF7FFF03FF7FFF03FF7FFF03000000000000FF7FFF7FFF7FFF7FFF7F00000000
      0000FF7FFF7FFF7FFF7F00000000000000000000000000000000000000001042
      186300000000000000000000000000000000000000001863000018631863FF03
      1863FF7F1863FF7F1863FF030000186300000000000000000000000000000000
      000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F00000000
      0000FF7FFF7FFF7FFF7F00000000000000000000000000000000000000000000
      1042000000000000000000000000000000000000000018630000000000000000
      0000000000000000000000000000186300000000000000000000000000000000
      000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F00000000
      0000FF7FFF7FFF7FFF7F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000018631863186318631863
      1863186318631863186318631863186300000000000000000000000000000000
      000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000010000000FF7FE07FFF7FE07F0000000000001042000000000000
      1042000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000010000000000000000000000000000000000010420000000000000000
      0000104200000000000000000000000000000000000000020002000200020002
      0000000200000000000000000000000000000000000000020002000200020002
      0000000200000000000000000000000000000000000000000000000000000000
      0000100000000000000000000000000000000000000010420000000000000000
      0000000000000000000000000000000000000000000000020002000200020002
      0000000200000000000000000000000000000000000000020002000200020002
      0000000200000000000000000000000000000000000010421042104210421042
      1000000000000000000010421042104210420000000000001042000000000000
      1042000000000000000000000000000000000000000000020002000200020002
      0000000200000000000000000000000000000000000000020002000200020002
      0000000200000000000000000000000000000000000000000000000000000000
      1042104210421042000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000020002000200020002
      0002000200020000000000000000000000000000000000020002000200020002
      00020002000000000000000000000000000000000000FF7FFF7FFF7FFF7F0000
      10001000100010000000FF7FE07FFF7FE07F0000000000000000000000000000
      0000000000000000000000000000000000000000000000020002000200021042
      0000104200020002000000000000000000000000000000020002000200021042
      0000104200000000000000000000000000000000000000000000000000000000
      0000104200000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000020002000200020000
      0000000000020002000200000000000000000000000000020002000200020000
      0000000000020000000000000000000000000000000000000000000000000000
      1000000010420000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000020002000200021042
      0000104200020002000200020000000000000000000000020002000200021042
      0000104200020002000200020000000000000000000000000000000000000000
      0000100000001042000010421042104210420000000000000000000000000000
      0000000000000000000000000000000000000000000000020002000200020002
      0002000200020002000200020000000000000000000000020002000200020002
      0002000200020002000200020000000000000000000000000000000000000000
      0000000010000000000000000000000000000000000000000000000000000000
      000000000000000000001042000000000000000000000002000200020002FF7F
      FF7FFF7FFF7FFF7FFF7F0002000000000000000000000002000200020002FF7F
      FF7FFF7FFF7FFF7FFF7F00020000000000000000000000000000000000000000
      00000000000010000000FF7FE07FFF7FE07F0000000000000000000000000000
      000000000000000000000000000000000000000000000002000200020002FF7F
      FF7FFF7FFF7FFF7FFF7F0002000000000000000000000002000200020002FF7F
      FF7FFF7FFF7FFF7FFF7F00020000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000020002000200020002
      0002000200020002000200020000000000000000000000020002000200020002
      0002000200020002000200020000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000010420000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001863FF7FFF0310020000
      FF7FFF7FFF031042000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7F1863186310020000
      FF7F186318631002000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001863FF7FFF0310020000
      FF7FFF7FFF031042000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7F1863186310020000
      FF7F186318631002000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000010000000FF7FFF0310020000
      FF7FFF7FFF030000100000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      104200001042000000000000000000000000000000001F00000000000000FF7F
      000000000000000000000000000000000000000000001F00000000000000FF7F
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF030000000000000000000000000000
      000000000000000000000000000000000000000000001F00000000000000FF7F
      000000000000000000000000000000000000000000001F00000000000000FF7F
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000005CFF7F0000000000000000
      000000000000000000000000000000000000000000001F001F00000000000000
      000000001F00000000000000000000000000000000001F001F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF03005C005CFF7F0000000010421042
      000000000000000000000000000000000000000000001F001F001F001F001F00
      1F001F001F001F0000000000000000000000000000001F001F001F001F001F00
      1F001F001F000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF030000005C005CFF7F005C005CFF7F
      000000000000000000000000000000000000000000001F001F00000000000000
      000000001F001F0000000000000000000000000000001F001F00000000000000
      000000001F001F00000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000005C1042005C00000000
      000000000000000000000000000000000000000000001F000000FF7FFF7FFF7F
      FF7FFF7F00001F0000000000000000000000000000001F000000FF7FFF7FFF7F
      FF7FFF7F00001F00000000000000000000000000000000000000000000000000
      000000000000000000000000FF0300000000000000001042005C005CFF7F0000
      000000000000000000000000000000000000000000001F000000FF7FFF7FFF7F
      FF7FFF7F00001F0000000000000000000000000000001F000000FF7FFF7FFF7F
      FF7FFF7F00001F00000000000000000000000000000000000000000000000000
      000000000000000000000000FF03000000001042005C005C00000000005CFF7F
      000000000000000000000000000000000000000000001F000000FF7FFF7FFF7F
      FF7FFF7F00001F0000000000000000000000000000001F000000FF7FFF7FFF7F
      FF7FFF7F00001F00000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF03FF03005C10420000000000000000005C
      000000000000000000000000000000000000000000001F000000FF7FFF7FFF7F
      FF7FFF7F00001F0000000000000000000000000000001F000000FF7FFF7FFF7F
      FF7FFF7F00001F00000000000000000000000000000000000000000000000000
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
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001042104200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF7F00000000FF7FFF7F00000000FF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      00001042FF7FFF7F000010421042000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF7F00000000FF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000FF7F0000000000000000FF7F
      00001042FF7F175CFF7FFF7F0000104210420000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000010420000
      FF7F00000000FF7FFF7F00000000FF7F000000000000000000000000FF7FFF7F
      0000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      00000000175C007C007C007CFF7FFF7F00000000170000000000000000000000
      0000FF7FFF7F0000000000000000000000000000000000000000000010420000
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000000000000000FF7FFF7F
      FF7FFF7F00000000000000000000000000000000FF7F0000000000000000FF7F
      00000000007C007C007C007CFF7F000010420000170017000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF7F00000000
      0000FF7FFF7FFF7F000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      00000000007C007C175C000010420000000000001700FF7F1700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF7F10421F7C
      1F7C0000FF7FFF7FFF7F00000000000000000000FF7F0000FF7F000000000000
      0000104210420000FF7FFF7F00001042000017001700FF7FFF7F170000000000
      0000000000000000000000000000000000000000000000000000000000001042
      0000000000001042104200000000000000000000000000000000FF7FFF7F1042
      1042FF7F10421042FF7F00000000000000000000FF7FFF7FFF7F000000000000
      10420000FF7FFF7FF702FF7F0000104200001700FF7FFF7FFF7FFF7F00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF7F1042FF7F000000000000000000000000FF7FFF7FFF7F000000001042
      FF7FFF7FF7021F001F001F00FF7F000000001700FF7F170017001700F702F702
      F702FF7F17000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      00000000FF7FFF7F000000000000000000000000000000000000000000001042
      0000FF7F1F001F00F7021F00FF7F000010421700FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7F17000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7F0000FF03FF03FF7F
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF7F1F001F001F00F702FF7FFF7F00001700FF7F17001700170017001700
      1700FF7F17000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7F000000000000FF7F
      0000000000000000000000000000000000000000000000000000000000000000
      10420000FF7FF702FF7FFF7F0000104210421700FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7F17000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF7FFF7F000010421042000000001700170017001700170017001700
      1700170017000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000104200001042104200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001042000000000000000000000000000000000000007C007C007C00000000
      00000000000000000000000000000000007C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000001042000000000000000000000000000000000000007C007C0000E07F
      FF7FFF7FFF7FE07FFF7FFF7FFF7F007C007C0000000000000000000000000000
      0000000000000000000000000000000000000000000000001042104210421042
      1042104210421042104210421042104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000007C007CFF7F
      1F001F001F001F001F001F00FF7F007C104200000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000FF7F0000000000000000
      0000000000000000000000000000104200000000000000000000000000000000
      00000000E05E1863000000000000000000000000000000000000007C007C007C
      FF7FE07FFF7FFF7FFF7FE07F007C007C104200000000FF7F0000000000000000
      000000000000FF7FFF7FFF7FFF7FFF7F000000000000FF7F0000000000000000
      0000000000000000000000000000104200000000000000000000000000000000
      1863E05EFF7FE05E1863000000000000000000000000000000000000007C007C
      007C1F001F001F00007C007C007C0000104200000000FF7F0000FF7FFF7FFF7F
      FF7F10420000FF7FFF7FFF7FFF7FFF7F000000000000FF7F0000000000000000
      0000000000000000000000000000104200000000000000000000000000001042
      1863FF7FE05EFF7FE05E0000000000000000000000000000000000000000007C
      007C007CFF7FE07F007C007CFF7F0000104200000000FF7F0000FF7FFF7FFF7F
      FF7F10420000FF7FFF7FFF7FFF7FFF7F000000000000FF7F0000000000000000
      0000000000000000000000000000104200000000000000000000000000001042
      1863E05EFF7FE05EFF7F0000000000000000000000000000000000000000FF7F
      1F00007C007C007C007C1F00FF7F0000104200000000FF7F0000000000000000
      000000000000FF7F000000000000FF7F000000000000FF7F0000000000000000
      0000000000000000000000000000104200000000000000000000000000000000
      1863FF7FE05EFF7FE05E1863000000000000000000000000000000000000FF7F
      FF7F007C007C007C007CE07FFF7F0000104200000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7F000000000000FF7F000000000000FF7F0000000000000000
      0000000000000000000000000000104200000000000000000000000000000000
      1863E05EFF7FE05EFF7FE05E000000000000000000000000000000000000FF7F
      1F00007C007C007C007C000000000000104200000000FF7F0000FF7F00000000
      000000000000FF7FFF7FFF7FFF7FFF7F000000000000FF7F00000000FF7FFF7F
      0000000000000000000000000000104200000000000000000000000000000000
      10421863E05EFF7FE05EFF7F000000000000000000000000000000000000E07F
      007C007CFF7F0000007C007CFF7F0000104200000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7F000000000000FF7F000000000000FF7F0000000000000000
      0000000000000000000000000000104200000000000000000000000000000000
      00001863FF7FE05EFF7F0000186300000000000000000000000000000000007C
      007C007CFF7F0000007C007C007C007C000000000000FF7F0000FF7F00000000
      00000000FF7FFF7F000000000000FF7F000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000000000000000000000000000
      00001042000000000000E05EE05E000000000000000000000000007C007C007C
      FF7FE07FFF7F0000FF7F00000000007C007C00000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000001863E05EE05EE05EE05E0000000000000000007C007C007C007C0000
      00000000000000000000000000000000007C0000000000000000000000000000
      00000000000000000000000000000000000000000000000000001F001F001F00
      1F001F001F001F00000000000000000000000000000000000000000000000000
      000010421863E05EE05E000000000000000000000000007C007C007C00000000
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
      0000000000000000000000000000000000000000186318631863186318631863
      186318631863186318631863186318631863000000000000000000001F000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000186318631863186300001863
      1863186318631863000018631863186318630000000010421042104210421F00
      1042104210420000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000186318631863186300000000
      186318631863186300000000186318631863000000001042E07FE07FE07F1F00
      E07FE07F1042000000000000FF7F000000000000000000000000000000000000
      0000F702F702F702F70200000000000000000000000000000000000000000000
      0000F70200000000000000000000000000000000186318631863186300000000
      000018631863186300000000000018631863000000001042E07F1F001F00E07F
      E07FE07F104200000000FF7FFF7FFF7F00000000000000000000000000000000
      F702F702F702F702F702F702000000000000000000000000FF03FF03FF03FF03
      0000F702F7020000FF03FF030000000000000000186318631863186300000000
      000000001863186300000000000000001863000000001042E07FE07FE07FE07F
      E07FE07F104200000000FF7FFF7FFF7F00000000000000000000000000000000
      F702F702F702F702F702F7020000000000000000000000000000FF03FF030000
      F702F7020000FF03FF0300000000000000000000186318631863186300000000
      000000000000186300000000000000000000000000001042E07FE07FE07FE07F
      E07FE07F104200000000FF7FFF7F104210420000000017001700170017000000
      F702F702F702F702F702F70200000000000000000000000000000000FF03FF03
      00000000FF03FF03000000000000000000000000186318631863186300000000
      000000001863186300000000000000001863000000001042E05EE05EE05EE07F
      E07FE07F1042000000000000FF7F1042E07F0000000000001700170017000000
      F702F702F702F702F702F702000000000000000000000000000000000000FF03
      FF03FF03FF030000000000000000000000000000186318631863186300000000
      000018631863186300000000000018631863000000001042000000000000E05E
      E07FE07F10420000000000001042E07F10420000000000000000170017001700
      0000F702F702F702F7020000E07F0000000000000000000000000000F7020000
      FF03FF030000F702000000000000000000000000186318631863186300000000
      18631863186318630000000018631863186300000000007C007C007C007C0000
      E05EE07F104200000000000000001042E07F0000000000000000000017000000
      00000000000000000000E07FFF7F0000000000000000000000000000F702F702
      00000000F702F702000000000000000000000000186318631863186300001863
      1863186318631863000018631863186318630000005C007C007C007C007C007C
      0000104210420000000000000000E07F10420000000000000000000000000000
      0000FF7FE07FFF7FE07FFF7FE07F000000000000000000000000F702F702F702
      F70200000000F702000000000000000000000000186318631863186318631863
      1863186318631863186318631863186318630000005C007C007C007C007C007C
      00000000000000000000000000000000E07F0000000000000000000000000000
      0000E07FFF7FE07FFF7FE07FFF7F000000000000000000000000F702F702F702
      F7020000E07F0000000000000000000000000000186318631863186318631863
      1863186318631863186318631863186318630000005C007C007C007C007C007C
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF7FE07FFF7FE07FFF7FE07F00000000000000000000000000000000F702
      F702F7020000175C000000000000000000000000186318631863186318631863
      1863186318631863186318631863186318630000005C005C007C007C007C007C
      0000000000000000000000000000000000000000000000000000000000000000
      0000E07FFF7FE07FFF7FE07FFF7F000000000000000000000000000000000000
      0000000000000000175C00000000000000001863000000000000000000000000
      00000000000000000000000000000000000000000000005C005C005C005C0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000175C0000000000001863186318631863186318631863
      1863186318631863186318631863186318630000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000175C000000001863186318631863186318631863
      1863186318631863186318631863186318630000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000005C000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000005C005C000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7F0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000005C005C005C000000000000005C0000000000000000000000000000
      0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000FF7FFF7FFF7FFF7F0000
      00000000000000000000000000000000000000000000000000000000FF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000000000000000
      000000000000005C005C00000000005C005C0000000000000000000000000000
      0000FF7F1F001F001F001F001F00FF7F00000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000000000000000
      00000000000000000000005C005C175C000000000000FF7F0000FF7F0000FF7F
      0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000FF7FFF7FFF7FFF7F0000
      00000000000000000000000000000000000000000000005CFF7F0000FF7F1042
      10421042104210421042FF7F0000000000000000000000000000000000000000
      0000000000000000175C005C005C00000000000000000000FF7F0000FF7F0000
      0000FF7F1F001F001F001F001F00FF7F000000000000FF7FFF7FFF7FFF7F0000
      0000000000000000000000000000000000000000005C005CFF7F0000FF7F1042
      175CE07FFF7FE07F1042FF7F0000000000000000000000000000000000000000
      0000000000000000005C175C005C005C000000000000FF7F0000FF7F0000FF7F
      0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000
      00000000000000000000000017000000000000000000005C005CFF7F005C005C
      E07FFF7FE07FFF7F1042FF7F0000000000000000000000000000000000000000
      000000000000005C005C00000000005C005C000000000000FF7F0000FF7F0000
      0000FF7F1F001F00FF7F0000000000000000000000000000000000000000FF7F
      FF03FF7FFF03000000000000170017000000000000000000005C175C005C0000
      10421042104210421042FF7F0000000000000000000017001700170017001700
      1700175C005C17001700170017000000175C00000000FF7F0000FF7F0000FF7F
      0000FF7FFF7FFF7FFF7F0000FF7F00000000000000000000000000000000FF03
      FF7FFF03FF7F000017001700170017001700000000000000175C005C005CFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F000000000000000000001700FF7FFF7FFF7FFF7F
      FF7F005C175CFF7FFF7FFF7F170000000000000000000000FF7F0000FF7F0000
      0000FF7FFF7FFF7FFF7F00000000000000000000000000000000000000000000
      0000000000000000000000001700170000000000175C005C005C005CFF7F005C
      FF7FFF7FFF7F000000000000000000000000000000001700FF7F00000000FF7F
      00000000FF7F00000000FF7F17000000000000000000FF7F0000FF7F0000FF7F
      00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7F0000
      0000000000000000000000001700000000000000005C175C00000000FF7FFF7F
      005CFF7FFF7F0000FF7F0000000000000000000000001700FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F170000000000000000000000FF7F0000FF7F0000
      FF7F0000000000000000000000000000000000000000FF7FFF7FFF7FFF7F0000
      00000000000000000000000000000000000000000000000000000000FF7FFF7F
      FF7FFF7FFF7F0000000000000000000000000000000017001700170017001700
      17001700170017001700170017000000000000000000FF7F0000FF7F0000FF7F
      0000FF7F00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000017000000170017000000
      1700170000001700170000001700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000017001700170017001700
      1700170017001700170017001700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000170000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      1700170017000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000017001700
      0000000000001700170000000000000000000000000000000000000000001700
      17001700170017000000000000000000000000000000000000000000FF7F0000
      0000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7F000000000000000000000000000000000000000000000000000000001700
      1700000017001700000000000000000000000000000000000000000000000000
      000017000000000000000000000000000000000000000000000000000000FF7F
      0000000000000000000000000000FF7F00000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7F000000000000000000000000000000000000000000000000000000000000
      1700170017000000000000000000000000000000000000000000000000000000
      000017000000000000000000000000000000000000000000000000000000FF7F
      000000000000000000000000FF7F000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7F000000000000000000000000000000000000000000000000000000000000
      0000170000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF7F00000000000000000000FF7F000000000000000000000000000000000000
      0000000000000000000000000000170000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF03FF7FFF030000000000000000000000000000000000000000000000000000
      0000FF7F000000000000FF7F0000000000000000FF03FF7FFF03FF7FFF03FF7F
      FF03FF7FFF03FF7F000000000000170017000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF7FFF03FF7F0000000000000000000000000000000000000000000000000000
      0000000000000000FF7F00000000000000000000FF7FFF03FF7FFF03FF7FFF03
      FF7FFF03FF7FFF03000017001700170017000000000000000000000000000000
      005C000000000000000000000000000000000000000000000000000000000000
      FF03FF7FFF030000000000000000000000000000000000000000000000000000
      000000000000FF7F000000000000000000000000FF03FF7FFF03FF7FFF03FF7F
      FF03FF7FFF03FF7F000000000000170017000000000000000000000000000000
      005C005C00000000000000000000000000000000000000000000000000000000
      FF7FFF03FF7F0000000000000000000000000000000000000000000000000000
      0000000000000000FF7F00000000000000000000000000000000000000000000
      000000000000000000000000000017000000000000000000000000000000005C
      00000000005C0000000000000000000000000000000000000000000000000000
      FF03FF7FFF030000000000000000000000000000000000000000000000000000
      0000FF7F00000000FF7F00000000000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7F0000000000000000000000000000000000000000000000000000005C005C
      00000000005C000000000000000000000000000000000000FF7FFF7FFF7F0000
      FF7FFF03FF7F0000FF7FFF7FFF7F000000000000000000000000000000000000
      FF7F00000000000000000000FF7F000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7F000000000000000000000000000000000000000000000000005C00000000
      005C005C0000000000000000000000000000000000000000FF7FFF7FFF7F0000
      FF03FF7FFF030000FF7FFF7FFF7F00000000000000000000000000000000FF7F
      0000000000000000000000000000FF7F00000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7F00000000000000000000000000000000000000000000005C000000000000
      000000000000000000000000000000000000000000000000FF7FFF7FFF7F0000
      FF7FFF03FF7F0000FF7FFF7FFF7F000000000000000000000000FF7F00000000
      00000000000000000000000000000000FF7F0000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000104200000000
      0000000000000000104200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F000000000000000000000000000010420000FF7FFF7F
      FF7F00000000FF7F000000000000000000000000000000000000000000000000
      000000000000E07F000000000000000000000000000010421042104210421042
      1042104210421042104210420000000000000000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000000010420000FF7F00000000
      00000000FF7F0000000000000000000000000000000000000000000000000000
      000000000000E07F0000E07F0000000000000000000010421042104210421042
      1042104210421042104210420000000000000000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000000000001042000000000000
      0000FF7F00000000000000000000000000000000000000000000000000000000
      00000000E07F0000E07F00000000000000000000000010421042104210421042
      E07F104210421042104200001042000000000000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000000000001042000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000E07F0000E07F00000000000000000000000010421042104210421042
      1042104210421042104200001042000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7F0000104210421042
      1042104210421042104210421042104210420000000000000000000000000000
      0000E07F0000E07F000000000000000000000000000010421042104210421042
      10421042E07F10421042000010421042E07F0000000000000000000000000000
      000000000000000000000000000000000000000000000000FF7F000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E07F0000E07F000000000000000000000000000010421042104210421042
      104210421042E07F104200001042E07F10420000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000
      E07F0000E07F0000000000000000000000000000000000000000000000000000
      00000000000000000000000000001042E07F0000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      E07F0000E07F0000000000000000000000000000000000001042104210421042
      1042000000000000000000000000104210420000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000000000000000
      0000000000000000000010420000000000000000000000000000000000000000
      0000E07F00000000000000000000000000000000000000000000000000000000
      000000000000E07F104200001042E07F10420000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000000000000000
      000000000000000010420000000000000000000000000000000000000000FF7F
      FF7F000000000000000000000000000000000000000000000000000000000000
      00000000E07F10420000000010420000E07F0000000000000000FF7FFF7FFF7F
      FF7FFF7F00000000000000000000000000000000000000000000000000000000
      000000000000104200000000104210421042000000000000000000000000FF7F
      FF7F000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000001042000000000000000000000000FF7FFF7FFF7F
      FF7FFF7F0000FF7F000000000000000000000000000000000000000000000000
      00000000FF7F000000000000000000000000000000000000000000000000FF7F
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000001042000000000000000000000000FF7FFF7FFF7F
      FF7FFF7F00000000000000000000000000000000000000000000000000000000
      000000000000FF7F00000000FF7FFF7FFF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042000010420000
      0000000000000000FF7F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000E07FFF7FFF7FFF7F
      E07FFF7FFF7FFF7F000010421042104210420000000000000000000000000000
      00000000000000000000000000000000000000000000007C007C007C00001042
      0000E003E003E0030000104200001F001F000000000010020002100200021002
      000210020002100200000000000000000000000000000000FF7F100010001000
      100010001000FF7F000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000010420000007C000010421042
      10420000E003000010421042104200001F000000000000021002000210020002
      100200021002000210020002100200021002000000000000FF7FFF7FE07FFF7F
      FF7FFF7FE07FFF7F0000FF7FE07FFF7FFF7F0000000000000000000000000000
      0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000007C007C007C00001042
      0000E003E003E0030000104200001F001F000000000010020002100200021002
      000210020002100200021002000210020002000000000000FF7F100010001000
      100010001000FF7F000010001000100010000000000000000000000000000000
      0000FF7F1F001F001F001F001F00FF7F000000000000007C007C007C00001042
      0000E003E003E0030000104200001F001F000000000000021002000210020002
      100200021002000210020002100200021002000000000000E07FFF7FFF7FFF7F
      E07FFF7FFF7FFF7F0000FF7FFF7FFF7FE07F0000000000000000000000000000
      0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000007C007C00001042
      00000000E003E00300001042000000001F000000000010020002100200021002
      000210020002100200021002000210020002000000000000FF7F100010001000
      100010001000FF7F0000100010001000100000000000FF7FFF7FFF7FFF7FFF7F
      0000FF7F1F001F001F001F001F00FF7F0000000000000000007C007C00001042
      00000000E003E00300001042000000001F000000000000021002000210020002
      100200021002000210020002100200021002000000000000FF7FFF7FE07FFF7F
      FF7FFF7FE07FFF7F0000FF7FE07FFF7FFF7F00000000FF7F1F001F001F001F00
      0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000007C007C00001042
      00000000E003E00300001042000000001F00000000001002FF7FFF7FFF7F1002
      000210020002FF7F0002FF7FFF7FFF7F0002000000000000FF7F10001000FF7F
      00000000000000000000100010001042104200000000FF7FFF7FFF7FFF7FFF7F
      0000FF7F1F001F00FF7F0000000000000000000000000000007C007C00001042
      00000000E003E00300001042000000001F00000000000002FF7F000210020002
      FF7FFF7F1002FF7FFF7FFF7FFF7F00021002000000000000E07FFF7FFF7FFF7F
      0000FF7FFF7FFF7F0000FF7FFF7F0000000000000000FF7F1F001F001F001F00
      0000FF7FFF7FFF7FFF7F0000FF7F0000000000000000007C007C007C00001042
      0000E003E003E0030000104200001F001F00000000001002FF7FFF7F00021002
      FF7FFF7F0002FF7FFF7FFF7FFF7FFF7F0002000000000000FF7F10001000FF7F
      0000FF7FE07F00000000FF7F10420000E00300000000FF7FFF7FFF7FFF7FFF7F
      0000FF7FFF7FFF7FFF7F0000000000000000000010420000007C000010421042
      10420000E003000010421042104200001F00000000000002FF7F000210020002
      10020002100200021002000210020002FF7F000000000000FF7FFF7FE07FFF7F
      0000FF7F0000FF7FFF7F000000000000E00300000000FF7F1F001F00FF7F0000
      00000000000000000000000000000000000000000000007C007C007C00001042
      0000E003E003E0030000104200001F001F00000000001002FF7FFF7FFF7F1002
      00021002000210020002100200021002FF7F0000000000000000000000000000
      00000000FF7F100010420000E003E003E00300000000FF7FFF7FFF7FFF7F0000
      FF7F00000000000000000000000000000000000010420000007C000010421042
      10420000E003000010421042104200001F000000000000021002000210020002
      1002000210020002100200021002000210020000000000000000000000000000
      00000000FF7FFF7FE07F000000000000E00300000000FF7FFF7FFF7FFF7F0000
      00000000000000000000000000000000000000000000007C007C007C00000000
      0000E003E003E0030000104200001F001F000000000010020002100200021002
      0002100200021002000210020002100200020000000000000000000000000000
      00000000000000000000104210420000E0030000000000000000000000000000
      000000000000000000000000000000000000000000000000007C000000000000
      00000000E003000000000000000000001F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000005C005C005C
      0000000000001700170017000000000000000000000000000000170017001700
      FF7F1863FF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000E07FFF7FFF7FFF7F
      E07FFF7FFF7FFF7F000010421042104210420000000000000000000000000000
      000000000000000000000000000000000000000000000000005C0000005C0000
      0000000000000000170000001700000000000000170017001700170017001700
      1700FF7F1863FF7FFF7F1863186318631863000000000000FF7F100010001000
      100010001000FF7F000000000000000000000000000000000000104210421042
      10421042104210421042104210421042104200000000005C0000000000000000
      0000000000000000000000000000170000000000170017001700170017001700
      17001700FF7F1863FF7FFF7FFF7FFF7FFF7F000000000000FF7FFF7FE07FFF7F
      FF7FFF7FE07FFF7F0000FF7FE07FFF7FFF7F0000000000000000FF7F18631863
      0000000000001863186318631863186310420000005C00000000000000000000
      0000000000000000000000000000000017000000170017001700170017001700
      170017001700FF7F1863FF7FFF7FFF7FFF7F000000000000FF7F100010001000
      100010001000FF7F000010001000100010000000000000000000FF7F18631863
      1863000018631863186318631863186310420000005C00000000000000001042
      1042104210421042104200000000000017000000170017001700170017001700
      17001700FF7F1863FF7FFF7F186318631863000000000000E07FFF7FFF7FFF7F
      E07FFF7FFF7FFF7F0000FF7FFF7FFF7FE07F00000000000000001042E07F1863
      104200001042186318631863186318631042005C0000000000000000FF7F0000
      0000000000000000104200000000000000000000170017001700170017001700
      1700FF7F1863FF7FFF7FFF7FFF7FFF7FFF7F000000000000FF7F100010001000
      100010001000FF7F000010001000100010000000E07F000000001042E07F0000
      000018630000000000000000000018631042005C0000000000000000FF7F0000
      0000000000000000104200000000000000000000000000000000170017001700
      FF7F1863FF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000FF7FFF7FE07FFF7F
      FF7FFF7FE07FFF7F0000FF7FE07FFF7FFF7F00001042E07F10421042E07F1863
      1042E07F1863186318631863186318631042005C0000000000000000FF7F0000
      000000000000000010420000000000000000000000000000000017001700FF7F
      0000FF7FFF7F186318631863186318631863000000000000FF7F10001000FF7F
      000000000000000000001000100010000000000000001042E07F1042E07F1042
      E07FFF7FFF7FFF7FFF7FFF7FFF7FFF7F1042005C0000000000000000FF7F0000
      00000000000000001042000000000000000000000000000000001700FF7FE07F
      0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000E07FFF7FFF7FFF7F
      0000FF7FFF7FFF7F0000FF7FFF7FFF7FE07F0000E07FE07F1042E07FE07FE07F
      000000000000000000000000000000000000005C0000000000000000FF7F0000
      000000000000000010420000000000000000000000000000000000000000E07F
      0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000FF7F10001000FF7F
      0000FF7FE07F00000000FF7F0000000000000000000010421042E07FE07FE07F
      0000000000000000000000000000000000000000005C000000000000FF7FFF7F
      FF7FFF7FFF7FFF7F00000000000000001700000000000000000000000000E07F
      0000FF7FFF7F000000000000000000000000000000000000FF7FFF7FE07FFF7F
      0000FF7F0000FF7FFF7FFF7F0000FF7FFF7F000000001042E07F1042E07F1042
      E07F000000000000000000000000000000000000005C00000000000000000000
      000000000000000000000000000000001700000000000000000000000000E07F
      10420000000000001863FF7F1863186318630000000000000000000000000000
      00000000FF7F10001000FF7F0000FF7FE07F00001042E07F00001042E07F0000
      00000000000000000000000000000000000000000000005C0000000000000000
      000000000000000000000000000017000000000000000000000000000000E07F
      E07FE07FE07FE07F00001863FF7F186300000000000000000000000000000000
      00000000FF7FFF7FE07FFF7F0000FF7F00000000E07F000000001042E07F0000
      00001042E07F000000000000000000000000000000000000005C0000005C0000
      0000000000000000170000001700000000000000000000000000000000000000
      0000000000000000000000001863000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001042E07F0000
      0000000000000000000000000000000000000000000000000000005C005C005C
      0000000000001700170017000000000000000000000000000000000000000000
      00000000000000000000FF7F1863186300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000005C0000
      0000000000000000170000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C
      1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00001F7C1F7C1F7C1F7C1F7C1F7C1F7C
      1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C
      1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00001F7C1F7C1F7C1F7C1F7C1F7C1F7C
      1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000000000000000FF7FE07F00000000
      00001700170017001700170017001700170000000000FF7FE07F000000001700
      170000000000FF7FE07F00000000170017001F7C000000000000000000000000
      1F7C0000000000000000000000001F7C17001F7C000000000000000000000000
      1F7C0000000000000000000000001F7C1700000000000000E07FFF7F00000000
      00000000000000000000000000000000000000000000E07FFF7F000000000000
      000000000000E07FFF7F00000000000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C
      1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00001F7C1F7C1F7C1F7C1F7C1F7C1F7C
      1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000000000000000FF7F000000000000
      00000000000000000000000000000000000000000000FF7F0000000000000000
      000000000000FF7F000000000000000000001F7C000000000000000000000000
      1F7C0000000000000000000000001F7C00000000000000000000000000000000
      00000000000000000000000000001F7C00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C
      1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000000000000000000000000000
      000000001F7C1F7C1F7C1F7C1F7C1F7C00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001F7C000000000000000000000000
      1F7C0000000000000000000000001F7C00000000000000000000000000000000
      00000000000000000000000000001F7C00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C
      1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000000000000000000000000000
      000000001F7C1F7C1F7C1F7C1F7C1F7C00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001F7C000000000000000000000000
      1F7C0000000000000000000000001F7C00000000000000000000000000000000
      00000000000000000000000000001F7C0000000000000000FF7FE07F00000000
      00001700170017001700170017001700170000000000FF7FE07F000000001700
      170000000000FF7FE07F00000000170017001F7C1F7C1F7C1F7C1F7C1F7C1F7C
      1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C17000000000000000000000000000000
      000000001F7C1F7C1F7C1F7C1F7C1F7C1700000000000000E07FFF7F00000000
      00000000000000000000000000000000000000000000E07FFF7F000000000000
      000000000000E07FFF7F00000000000000001F7C000000000000000000000000
      1F7C0000000000000000000000001F7C00000000000000000000000000000000
      00000000000000000000000000001F7C0000000000000000FF7F000000000000
      00000000000000000000000000000000000000000000FF7F0000000000000000
      000000000000FF7F000000000000000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C
      1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000000000000000000000000000
      000000001F7C1F7C1F7C1F7C1F7C1F7C00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001F7C000000000000000000000000
      1F7C0000000000000000000000001F7C00000000000000000000000000000000
      00000000000000000000000000001F7C00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C
      1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000000000000000000000000000
      000000001F7C1F7C1F7C1F7C1F7C1F7C00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001F7C1F7C1F7C1F7C1F7C1F7C1F7C
      1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000000000000000000000000000
      000000001F7C1F7C1F7C1F7C1F7C1F7C00000000000000000000000000000000
      00000000000000000000000000000000000000000000E07F0000FF7F007CFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000104200000000
      1042104210421042186300401863FF7F1863000000001863FF7F1863FF7F1863
      FF7F1863FF7F0000E07FFF7FE07FFF7FE07F0000000000000000000000000000
      00000000000000000000000000000000000000000000E07F0000170017001700
      17001700170017001700FF7FFF7FFF7FFF7F000000000000FF7F000010420000
      0000000000001042004018630040FF7F004000000000FF7F1863FF7F1863FF7F
      1863FF7F18630000FF7F18631863104210420000000000000000000000000000
      00000000000000000000000000000000000000000000E07F0000FF7F007CFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F007C007C007C0000000000000000FF7F00000000
      1042186300000000104200401863FF7F1863000000001863FF7F1863FF7F1863
      FF7F18631000100010001000E07FFF7FE07F00000000FF7FE07F000000000000
      17001700170000000000170017001700000000000000E07F0000FF7F007CFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F007C007C007C00000000000000000000FF7F0000
      0000186300001042000010420040FF7F004000000000FF7F1863FF7F1863FF7F
      1863FF7F18631F001000100018631042104200000000E07FFF7F000000000000
      00000000000000000000000000000000000000000000E07F0000170017001700
      17001700170017001700FF7F007C007C007C000000000000000000000000FF7F
      0000000000001863000010421863FF7F1863000000001863FF7F1863FF7F1863
      FF7F1863100010001F001000E07FFF7FE07F00000000FF7F0000000000000000
      00000000000000000000000000000000000000000000E07F0000FF7F007CFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000186300000000
      1863000010421863000010420040FF7F004000000000FF7F1863FF7F1863FF7F
      1863100010001000FF7F1000FF7FFF7FFF7F0000000000000000000000000000
      00000000000000000000000000000000000000000000E07F0000FF7F007CFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000104210420000
      0000000018631042000000401863FF7F1863000000001863FF7F1863FF7F1863
      1000100010000000E07FFF7FE07FFF7FE07F0000000000000000000000000000
      00000000000000000000000000000000000000000000E07F0000170017001700
      1700170017001700170017001700FF7F00000000000000000000000000000000
      1042186310420000004018630040FF7F004000000000FF7F1863FF7F18631000
      1000100018630000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E07F0000FF7F007CFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000000010421863
      1863104200000040186300401863FF7F1863000000001863FF7F1863FF7F1863
      10001863FF7F1863FF7F00000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E07F0000FF7F007CFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000
      0000000000401863004018630040FF7F004000000000FF7F1863FF7F1863FF7F
      1863FF7F1863FF7F1863000000000000000000000000FF7FE07F000000000000
      17001700170000000000170017001700000000000000E07F0000FF7F007C0000
      000000000000000000000000FF7FFF7F00000000000000000000000000000000
      0000004010420040186300401863FF7F1863000000001863FF7F1863FF7F1863
      FF7F1863FF7F1863FF7F000000000000000000000000E07FFF7F000000000000
      00000000000000000000000000000000000000000000E07F0000000000000000
      1863FF7F18631863186300000000000000000000000000000000000000000000
      000000400040FF7FFF7FFF7FFF7FFF7FFF7F00000000FF7F1863100010001000
      100010001000FF7F1863000000000000000000000000FF7F0000000000000000
      00000000000000000000000000000000000000000000E07FE07FE07FE07FE07F
      00001863FF7F18630000E07FE07FE07FE07F0000000000000000000000000000
      0000000000400040004000400040004000400000000000000000FF031F001F00
      1F001F0010000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000018630000000000000000000000000000000000000000000000000000
      0000000000000040104210421863FF7F00400000000000000000FF031F001F00
      1F001F0010000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF7F18631863000000000000000000000000000000000000000000000000
      00000000000000400040004000400040004000000000000000000000FF03FF03
      FF03FF0300000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000170000000000170000001700
      0000000000001700000017000000000000000000000000001700000000001700
      0000000000000000170000000000000017000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000170017001700000000001700
      0000170000001700000017001700170000000000000000001700000000001700
      0000000000000000170000000000000017000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000170000000000170000001700
      1700000017001700000017000000000017000000000017001700170000000000
      1700170017000000000017001700170000000000000000000000000018630000
      0000000000000000186300000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000170017001700000000001700
      0000000000001700000017001700170000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000186300001863
      1863186318631863000000000000000000000000000000000000000000000000
      1700170017001700170017001700170000000000000000000000000000000000
      0000005C00000000000000000000000000000000000000000000000000000000
      0000005C00000000000000000000000000000000000000001863186318631863
      186318631863186318631863000000000000000000000000E07F000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      005C007C005C0000000000000000000000000000000000000000000000000000
      005C007C005C0000000000000000000000000000000000001863186318631863
      186318631863186318631863FF7F000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000005C
      007C007C007C005C00000000000000000000000000000000000000000000005C
      007C007C007C005C000000000000000000000000000018631863186318631863
      1863186318631863186318630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042104210420000
      005C007C005C0000104210421042104210420000000000001042104210420000
      005C007C005C0000104210421042104210420000000018631863186318631863
      1863186318631863186318631863186300000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7F0000000000000000
      005C007C005C00000000000000000000104200000000FF7F0000000000000000
      005C007C005C0000000000000000000010420000000018631863186318631863
      1863186318631863186318631863186318630000000000000000000000000000
      00000000000000000000000000000000000000000000FF7F0000000000000000
      005C007C005C00000000000000000000104200000000FF7F0000000000000000
      005C007C005C0000000000000000000010420000000018631863000000001863
      18631863186318630000FF7F1863186318630000000000000000000000000000
      00000000000000000000000000000000000000000000FF7F0000000000000000
      005C005C005C00000000000000000000104200000000FF7F0000000000000000
      005C005C005C0000000000000000000010420000000000001863FF7FFF7F0000
      0000000018631863FF7F186318630000000000000000FF7FE07F000000000000
      17001700170017001700170017001700000000000000FF7F0000000000000000
      00000000000000000000000000000000104200000000FF7F0000000000000000
      000000000000000000000000000000001042000000000000000000001863FF7F
      FF7FFF7F186318631863186300000000000000000000E07FFF7F000000000000
      00000000000000000000000000000000000000000000FF7F0000000000000000
      00000000000000000000000000000000104200000000FF7F0000000000000000
      0000000000000000000000000000000010420000000000000000000000000000
      00000000000018630000000000000000000000000000FF7F0000000000000000
      00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000
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
      00000000000000000000000000000000000000000000000000000000FF7FFF7F
      0000000000000000000000000000000000000000000000000000000000000000
      1042000010420000000000000000000000000000000000000000000000000000
      1042000010420000000000000000000000000000000000000000000000000000
      1042000010420000000000000000000000000000000000000000FF7F00000000
      FF7FFF7F00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF7F0000FF7FFF7F
      00000000FF7FFF7F000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7F0000FF7F10420000
      FF7FFF7F00000000FF7FFF7F00000000000000000000000010420000FF7FE07F
      FF7FE07FFF7FE07FFF7F0000104200000000E05E000000000000000000000000
      000000000000000000000000104200000000E05E000000000000000000000000
      000000000000E05EE05E0000104200000000000000000000FF7F104200000000
      10420000FF7FFF7F00000000000000000000000000000000000010420000FF7F
      E07FFF7FE07FFF7F00001042000000000000E05E000000001042104210421042
      104210421042104200001042000000000000E05E0000FF7FE07FFF7FE07FFF7F
      E07FFF7F0000E05EE05E104200000000000000000000FF7F10420000FF7FE07F
      0000000010420000FF7FFF7F0000000000000000000000000000000010420000
      FF7FE07FFF7F000010420000000000000000E05E0000FF7F0000000000000000
      000000000000104200000000000000000000E05E0000E07FFF7FE07FFF7FE07F
      FF7FE07F0000E05EE05E00000000000000000000000000000000FF7FE07FFF7F
      E07FFF7F00000000104200000000000000000000000000000000000010420000
      E07FFF7FE07F000010420000000000000000E05E0000FF7F0000000000000000
      000000000000104200000000000000000000E05E0000FF7FE07FFF7F0000FF7F
      E07FFF7F0000E05EE05E0000000000000000000000000000FF7FE07FFF7FE07F
      FF7FE07FFF7FE07F000000000000000000000000000000000000000010420000
      FF7FE07FFF7F000010420000000000000000E05E0000FF7F0000000000000000
      000000000000104200000000000000000000E05E0000E07FFF7FE07F0000E07F
      FF7FE07F0000E05EE05E000000000000000000000000FF7FE07FFF7FE07FFF7F
      E07FFF7FE07FFF7FE07FFF7F0000000000000000000000000000000010420000
      E07FFF7FE07F000010420000000000000000E05E0000FF7F0000000000000000
      000000000000104200000000000000000000E05E0000FF7F0000000000000000
      0000FF7F0000E05EE05E00000000000000000000000000000000E07FFF7FE07F
      FF7FE07FFF7FE07FFF7F00000000000000000000000000000000000010420000
      FF7FE07FFF7F000010420000000000000000E05E0000FF7F0000000000000000
      000000000000104200000000000000000000E05E0000E07FFF7FE07F0000E07F
      FF7FE07F0000E05EE05E0000000000000000000000000000000000000000FF7F
      E07FFF7FE07FFF7F000000000000000000000000000000000000000000001042
      0000FF7F0000104200000000000000000000E05E0000FF7F0000000000000000
      000000000000104200000000000000000000E05E0000FF7FE07FFF7F0000FF7F
      E07FFF7F0000E05EE05E00000000000000000000000000000000000000000000
      0000E07F00000000000000000000000000000000000000000000000000000000
      104200001042000000000000000000000000E05E0000FF7F0000000000000000
      000000000000104200000000000000000000E05E0000E07FFF7FE07FFF7FE07F
      FF7FE07F0000E05EE05E00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E05E0000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7F000000000000000000000000E05E0000FF7FE07FFF7FE07FFF7F
      E07FFF7F0000E05EE05E00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E05E000000000000000000000000
      000000000000000000000000000000000000E05E000000000000000000000000
      000000000000E05EE05E00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E05EE05EE05EE05EE05EE05EE05E
      E05EE05EE05EE05EE05E0000000000000000E05EE05EE05EE05EE05EE05EE05E
      E05EE05EE05EE05EE05E00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010421000000000000000
      1000000000000000000010000000000000000000000000000000000000000000
      0000000000001700000000000000170017000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010421000000000000000
      1000000000000000000010000000000000000000000000000000000000000000
      0000000000001700000000000000170000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF7FFF7FFF7FFF7FFF7F0000000000001042100000000000
      1000104200000000104210000000000010000000000000000000000000000000
      00000000000000001700000017000000000000000000E05EE05EE05EE05EE05E
      E05EE05EE05EE05EE05EE05EE05EE05E00000000000000000000000000000000
      000000000000FF7FFF7F0000FF7FFF7FFF7F0000000000000000104210001000
      1000100010421042100010001000100010420000000000000000000000000000
      00000000000000001700000017000000000000000000FF7FFF7FE05EFF7FE05E
      FF7FE05EFF7FE05EFF7FE05EFF7FE05E00000000000000000000000000000000
      00000000FF7FFF7F0000FF7FFF7FFF7FFF7F0000000000000000000000001000
      1000100010001000100010001000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7F0000000000000000
      0000000000000000000000000000E05E00000000000000000000000000000000
      0000000000000000FF7FFF7FFF7FFF7FFF7F0000000000000000000000000000
      10001002FF7FFF7F100210000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FFF7FE05EFF7FE05E
      FF7FE05EFF7FE05EFF7FE05EFF7FE05E00000000000000000000000000000000
      000000000000FF7FFF7F0000FF7FFF7FFF7F0000000000000000000000000000
      0000FF7F00000000FF7F00000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7F0000000000000000
      0000000000000000000000000000E05E00000000000000000000000000000000
      0000FF7FFF7FFF7F0000FF7F0000FF7FFF7F0000000000000000000000000000
      FF7FFF7FFF7FFF7F0000FF7F0000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FFF7FE05EFF7FE05E
      FF7FE05EFF7FE05EFF7FE05EFF7F00000000000000000000000000000000FF7F
      FF7FFF7F00000000FF7F0000FF7F0000FF7F000000000000000000000000FF7F
      FF7FFF7F00000000FF7FFF7FFF7F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E05EE05E0000FF7FFF7F
      00000000FF7FFF7F0000FF7F0000FF7F000000000000000000000000FF7FFF7F
      FF7F0000000000000000FF7FFF7FFF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FFF7F0000FF7F0000
      E05EE05E00000000FF7F0000FF7F000000000000000000000000FF7FFF7FFF7F
      000000000000000000000000FF7FFF7FFF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7F0000000000000000
      0000000000000000000000000000E05E0000000000000000FF7FFF7FFF7F0000
      0000000000000000000000000000FF7FFF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FFF7FE05EFF7FE05E
      FF7FE05EFF7FE05EFF7FE05EFF7FE05E0000000000000000FF7FFF7F00000000
      00000000000000000000000000000000FF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7F0000000000000000
      0000000000000000000000000000E05E0000000000000000FF7F000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FFF7FE05EFF7FE05E
      FF7FE05EFF7FE05EFF7FE05EFF7F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000104200001042
      000000000000000000000000FF7FFF7FFF7F0000004000400040004010420000
      00000000000000000000000000000000FF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000010420000000010420000
      0000000000000000000000001042000000000000000000000000000010420000
      00000000000000000000FF7FFF7FFF7F00000000004010420000000000401042
      0000000000000000000000000000FF7FFF7F0000000000000000170017000000
      0000000000000000000000000000000000000000000000000000000000001042
      0000000000000000000000000000104200000000000000000000000000000000
      0000000000000000FF7FFF7FFF7F000000000000004010420000000000000040
      104200000000000000000000FF7FFF7F00000000000000001700000000001700
      0000000017001700000000000000000000000000000000001042000000000000
      1042000000001042104200001042000000000000000000000000000000000000
      000000000000FF7FFF7FFF7F0000000000000000004000401042104210420040
      00401042000000000000FF7FFF7F000000000000000000001700000000001700
      0000170000000000170000000000000000000000000000001042104210420000
      0000104210420000FF7F00000000000000000000000000000000104200000000
      0000000018631042FF7F00000000000000000000000000400040004000400040
      0040004010420000FF7FFF7F0000000000000000000000001700000000001700
      0000170000000000170000000000000000000000000000000000000000000000
      0000000000000000FF7F00000000000000000000000000000000000000001042
      0000FF7F00001863000000000000000000000000000000000000000000400040
      004000400040FF7FFF7F00000000000000000000000000000000170017001700
      0000170000000000170000000000000000000000000000000000000000000000
      00000000FF7F0000FF7F00001042000000000000000000000000000000001042
      0000FF7F0000FF7F000000000000000000000000000000000000000000000000
      004010420040FF7F000010420000000000000000000000000000000000001700
      0000170017001700000000000000000000000000000000000000000000000000
      0000000000000000104200000000104200000000000000000000104200000000
      00000000FF7FFF7FFF7F00000000000000000000000000000000000000400040
      004000400040FF7FFF7F00001042000000000000000000000000000000001700
      0000170000000000000000000000000000000000000000000000000000000000
      0000000000000000FF7F00001042000010420000000000000000000000000000
      000000000000FF7FFF7FFF7F0000000000000000000000400040004000400040
      0040004000000000FF7FFF7F0000104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF7F0000FF7F104200000000000000000000000000000000
      0000000000000000FF7FFF7FFF7F000000000000004000400000000000000040
      00400000000000000000FF7FFF7F000010420000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF7F00000000FF7F10420000000000000000000010420000
      00000000000000000000FF7FFF7FFF7F00000000004010420000000000000040
      000000000000000000000000FF7FFF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF7F000000000000FF7F0000000000000000104200001042
      000000000000000000000000FF7FFF7FFF7F0000004010421042104200400000
      0000000000000000000000000000FF7FFF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF7F00000000000000000000104200000000000010420000
      00000000000000000000000000001042FF7F0000000000400040004000000000
      00000000000000000000000000000000FF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF7F00000000000000000000000010421042104200000000
      0000000000000000000000000000104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF7F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010421863004200420000
      104200000000000000000000000000000000000000001042FF7F004200420000
      1042000000000000000000000000000000000000000000000000104200001863
      FF7FE07FE07F1863FF7F1863FF7F1863FF7F0000000000000000000000000000
      000000001700FF7F000000000000000000000000000000000042186300420042
      0000104200000000000000000000000000000000000000000042FF7F00420042
      000010420000000000000000000000000000000000000000104200001863FF7F
      E07FFF7F1863FF7F1863FF7F1863FF7F18630000000000000000000000000000
      0000170017001700FF7F00000000000000000000000000000000004218630042
      00420000104210421042104210421042000000000000000000000042FF7F0042
      00420000104210421042104210421042000000000000104200001863FF7F1863
      FF7F1863FF7F1863FF7F1863FF7F1863FF7F0000000000000000000000000000
      1700170017001700FF7F00000000000000000000000000000000000000421863
      004200420000000000000000000010421042000000000000000000000042FF7F
      0042004200000000000000000000104210420000104200001042104210421042
      1042FF7F18631042104210421863FF7F18630000000000000000000000001700
      17001700FF7F17001700FF7F0000000000000000000000000000000000000042
      1863004200421042186318631863104200000000000000000000000000000042
      FF7F0042004210421863186318631042000000000000000010421863FF7F1863
      10421042FF7F186310421042FF7F1863104200000000FF7FFF7FFF7F17001700
      1700FF7F0000000017001700FF7F000000000000000000000000000000000000
      000000421042FF7F1863FF7F1863186310420000000000000000000000000000
      000000421042FF7F1863FF7F1863186310420000000010421863FF7F1863FF7F
      1863FF7F1863FF7F186310421042FF7F104200000000FF7F1042104210421700
      FF7FFF7F0000000000001700FF7F000000000000000000000000000000000000
      00001042FF7F1F001F001F001F001F0018630000000000000000000000000000
      00001042FF7F1F001F001F001F001F001863000000001042FF7F1863FF7F1863
      FF7F1863FF7F1863FF7F186310421042104200000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7F00000000000000001700FF7F0000000000000000000000001F000000
      0000FF7F18631F001863FF7F18631F0018630000000000000000000010000000
      0000FF7F18631F001863FF7F18631F0018630000000010421042104210421042
      104210421863FF7F1863FF7F10421042104200000000FF7F1042104210421042
      1042FF7F000000000000000000001700FF7F000000000000000000001F001F00
      00001863FF7F1F001F001F001F001F00FF7F0000000000000000000010001000
      00001863FF7F1F001F001F001F001F00FF7F000000001042FF7F1863FF7F1042
      10421042FF7F1863FF7F186310421042104200000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7F0000000000000000000000001700000000000000000000001F000000
      0000FF7F18631F00FF7FFF7F1F00FF7F18630000000000000000000010000000
      0000FF7F18631F00FF7FFF7F1F00FF7F18630000000010421863FF7F18631042
      104210421863FF7F186310421042FF7F104200000000FF7F1042104200000000
      0000FF7F00000000000000000000000000000000000000000000000000001F00
      10421042FF7F1F001F001F001F001863FF7F0000000000000000000000001000
      10421042FF7F1F001F001F001F001863FF7F00000000000010421863FF7F1042
      10421863FF7F18631042104210421863FF7F00000000FF7FFF7FFF7FFF7F0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000001042FF7F1863FF7F1863FF7F10420000000000000000000000000000
      000000001042FF7F1863FF7F1863FF7F10420000000010420000104210421042
      1863FF7F18631042104210421863FF7F186300000000FF7F1042104200000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001042FF7F1863FF7F104200000000000000000000000000000000
      0000000000001042FF7F1863FF7F1042000000000000000010420000FF7F1863
      FF7F1863FF7F1863FF7F1863FF7FE07FFF7F00000000FF7FFF7FFF7FFF7F0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001042000000000000104200000000000000000000000000000000
      000000000000104200000000000010420000000000000000000010420000FF7F
      1863FF7F1863FF7F1863E07FE07FFF7F18630000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000010420000
      00001863FF7F1863FF7F1863FF7F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      104200000000000000000000000010420000000000000000FF7F186310420000
      000000000000FF7F186310420000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000010001000
      10001000000000001000100010001000000000000000000000000000FF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F0000104200000000000000000000FF7F18631042
      0000186318630000FF7F18631042000000000000000000000000000000000000
      1000100010001000000000000000000000000000000000000000000000001000
      10001042000000000000100010001042000000000000000000000000FF7FFF7F
      FF7FFF7F00000000FF7FFF7F00001042000000000000000018630000FF7F1863
      10420000186318630000FF7F1863104200000000000000000000000000000000
      1000100010420000000000000000000000000000000000000000000000001000
      10001042000000000000100010001042000000000000000000000000FF7FFF7F
      FF7F0000000000000000FF7F000010420000000000001863186300000000FF7F
      186300001863186318630000FF7F186310420000000000000000000000000000
      1000000000001042000000000000000000000000000000000000000000001000
      10001042000000000000100010001042000000000000000000000000FF7FFF7F
      10420000000000000000FF7F00001042000000000000FF7F1042000018630000
      0000186318631863186318630000FF7F18630000000000000000000000000000
      1000000000000000104200000000000000000000000000000000000000001000
      10001042000000000000100010001042000000000000000000000000FF7F1042
      00000000000000000000000000001042000000000000FF7F1042000018631863
      18631863186318631863186318630000FF7F0000000000000000000000000000
      0000000000000000000010420000000000000000000000000000104210421000
      10001042000000000000100010001042000000000000000000000000FF7F0000
      00000000FF7F000000000000000010420000000000000000FF7F10420000FF7F
      1863FF7F18631863186318631863186300000000000000000000000000000000
      0000000000000000000000001042000000000000000000001000100010001000
      10001042000000000000100010001042000000000000000000000000FF7F0000
      0000FF7FFF7FFF7F00000000000010420000000000000000FF7F186300001863
      FF7F1863FF7F1863186300000000186300000000000000000000000000000000
      0000000000000000000000000000104200000000000010001000104200001000
      10001042000000000000100010001042000000000000000000000000FF7FFF7F
      FF7FFF7FFF7F0000000000000000104200000000000000000000FF7F0000FF7F
      1863FF7F1863FF7F000018631042000000000000000000000000000000000000
      0000000000000000000000000000100010420000000010001000104200001000
      10001042000000000000100010001042000000000000000000000000FF7FFF7F
      FF7FFF7FFF7F0000FF7F000000000000000000000000FF7F00001042FF7FFF7F
      FF7FFF7FFF7F18630000FF7F1863104200000000000000000000000010001000
      1000100010001000100010001000100010420000000010001000104210421000
      10001042104210421042100010001042104200000000000000000000FF7FFF7F
      FF7FFF7FFF7F000000000000000000001042000000000000FF7FFF7FFF7FFF7F
      FF7FFF7F0000FF7F18630000FF7F186310420000000000000000000010001000
      1000100010001000100010001000100000000000000000001000100010001000
      1000100010001000100010001000100010000000000000000000000000000000
      00000000000000000000000010420000000000000000FF7F1863FF7FFF7FFF7F
      1042000010420000000000000000FF7F18630000000000000000000000000000
      0000000000000000000000000000000000000000000000000000100010001000
      1000100010001000100010001000100010000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF7F1863FF7FFF7F
      0000FF7FFF7F10421042186318630000FF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF7F0000FF7F
      000000000000FF7FFF7FFF7F0000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000170017001700170017001700
      1700170017001700170017000000000000000000170017001700170017001700
      1700170017001700170017000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000017000000000000000000
      0000000000000000170000000000000000000000000017000000000000000000
      0000000000000000170000000000000000000000000000001042104210421042
      1042000000001042104210421042104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7F0000000000000000
      10420000FF7F0000000000000000104200000000000000000000000000000000
      0000000000000000000000000000000000000000000010421042104210421042
      1042104210421042104210420000000017000000000000000000000000000000
      00000000000000000000000000000000170000000000FF7F0000000000000000
      10420000FF7F0000000000000000104200000000000000000000000000000000
      0000000000000000000000000000000000000000FF7F00000000000000000000
      0000000000000000000010420000170017000000000010421042104210421042
      10421042104210421042000000001700170000000000FF7F0000000000000000
      10420000FF7F0000000000000000104200000000000000000000000000000000
      0000000000000000000000000000000000000000FF7F00000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7F0000104200000000170000000000FF7F0000000000000000
      00000000000000001042000000000000170000000000FF7F0000000000000000
      10420000FF7F0000000000000000104200000000000000000000000000000000
      0000000000000000000000000000000000000000FF7F00001042000000000000
      000000000000FF7F0000104200000000170000000000FF7F0000000000000000
      00000000000000001042000000000000170000000000FF7FFF7FFF7FFF7FFF7F
      00000000FF7FFF7FFF7FFF7FFF7F000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7F00001042000000000000
      000000000000FF7F0000104200000000170000000000FF7F0000000000000000
      0000000000000000104200000000000017000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7F00001042000000000000
      000000000000FF7F0000104200000000170000000000FF7F0000000000000000
      0000000000000000104200000000000017000000000000001042104210421042
      1042000000001042104210421042104200000000000000000000000000000000
      0000000000000000000000000000000000000000FF7F00001042000000000000
      000000000000FF7F0000104200000000170000000000FF7F0000000000000000
      00000000000000001042000000000000170000000000FF7F0000000000000000
      10420000FF7F0000000000000000104200000000000000000000000000000000
      0000000000000000000000000000000000000000FF7F00001042000000000000
      000000000000FF7F0000104200000000170000000000FF7F0000000000000000
      00000000000000001042000000000000170000000000FF7F0000000000000000
      10420000FF7F0000000000000000104200000000000000000000000000000000
      0000000000000000000000000000000000000000FF7F00001042000000000000
      000000000000FF7F0000104200000000170000000000FF7F0000000000000000
      00000000000000001042000000000000170000000000FF7F0000000000000000
      10420000FF7F0000000000000000104200000000000000000000000000000000
      0000000000000000000000000000000000000000FF7F00001042104210421042
      10421042104200000000104200000000170000000000FF7F0000000000000000
      00000000000000001042000000000000170000000000FF7F0000000000000000
      10420000FF7F0000000000000000104200000000000000000000000000000000
      0000000000000000000000000000000000000000FF7F00000000000000000000
      00000000000000000000104200001700170000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7F0000000000001700170000000000FF7FFF7FFF7FFF7FFF7F
      00000000FF7FFF7FFF7FFF7FFF7F000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000017000000000000000000000000000000
      0000000000000000000000000000000017000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010020002100200021002
      0002100200020000FF7FFF7FFF7FFF7FFF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000010420000000000000000
      0000000000001042000000000000000000000000000000000000000000000000
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000021002000210020000
      0000000000000000FF7FFF7FFF7FFF7FFF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000001700170017001700
      1700170017000000000000000000000000000000000000000000000000000000
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000010020002100200020000
      FF7FFF7FFF7F00001F001F001F001F001F000000000000000000000000000000
      0000000000000000000000000000000000000000000000001700170017001700
      1700170017000000000000000000000000000000000000000000000000000000
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000021002000210020000
      FF7FFF7FFF7F00000000000000000000000000000000186318631863FF7F1042
      1042104210421042000018631863186300000000000000001700170017001700
      1700170017000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010020000000000000000
      FF7FFF7FFF7FFF7FFF7F000000021002000200000000FF7F186318631863FF7F
      1042104210420000186318631863186300000000000000001700170017001700
      1700170017000000000000000000000000000000000000000000FF7FFF7F0000
      00001F001F001F001F001F001F001F0000000000000000020000FF7FFF7F0000
      1F001F001F001F001F00000010020002100200000000FF7F1042FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F186300000000000000001700170017001700
      1700170017000000000000000000000000000000000000000000FF7FFF7F0000
      0000000000000000000000000000000000000000000010020000FF7FFF7F0000
      00000000000000000000000000021002000200000000FF7F1042186318631863
      186318631863186318631863FF7F186300000000000000001700170017001700
      1700170017000000000000000000000000000000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000000000020000FF7FFF7FFF7F
      FF7FFF7F000000021002000210020002100200000000FF7F1042186300000000
      186318631863000000001863FF7F186300000000000000001700170017001700
      1700170017000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000100200001F001F001F00
      1F001F00000010020002100200021002000200000000FF7F1042186300000000
      186318631863000000001863FF7F186300000000000000001700170017001700
      17001700170000000000000000000000000000000000FF7F000000001F001F00
      1F001F001F001F001F0000000000000000000000000000020000000000000000
      00000000000000021002000210020002100200000000FF7F1042186318631863
      186318631863186318631863FF7F186300000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7F0000000000000000
      0000000000000000000000000000000000000000000010020002100200021002
      00021002000210020002100200021002000200000000FF7F1042104210421042
      104210421042104210421042104218630000000000000000007C007C007CFF7F
      007C007C007C0000FF7F000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7F0000000000000000000000000000000018631F001F001F001F00
      1F001F001F001F001F001F001F001F001F0000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7F007CFF7FFF7F
      FF7F007CFF7F0000FF7F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000018631F001F001F001F00
      1F001F001F001F001F001F001F001F001F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF7F00000000000000000000000000001F001F001F001F00
      1F001F001F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7F000000000000000000000000000000000000000000000000
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
      000000000000000000000000000000000000000000000000000000000000FF7F
      1863FF7F1863FF7F1863FF7F1863FF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001863
      1F001F001F001F001F001F001F0018630000000000000000000000001042FF7F
      FF7F0000FF7FFF7F0000FF7FFF7F000000000000000000001042000000000000
      0000000000000000104200000000000000000000000000001042000000001042
      00000000104200000000104200000000000000000000FF7F1863FF7F0000FF7F
      1863FF7F1863FF7F1863FF7F1863FF7F00000000000000000000000010421042
      FF7F00001042FF7F00001042FF7F000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF7F00000000FF7F
      00000000FF7F00000000FF7F0000000000000000000018631F001F0000001863
      FF7F1863005C005CFF7F1863FF7F186300000000000010421042104210421042
      0000000010420000000010420000000000000000000000000000000010421042
      FF7F104210420000000000000000104200000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7F1863FF7F0000FF7F
      1863FF7F005C005C1863FF7F1863FF7F00000000000000000000000010420000
      000000001042FF7F00001042FF7F000000000000000000000000000000000000
      0000000000000000000010420000104200000000000000001042000000001042
      000000001042000000001042000000000000000000001863005C005C00001863
      FF7F1863FF7F005C005C1863FF7F186300000000000000000000000010420000
      FF030000FF7FFF7F00001042FF7F000000000000000000000000000000000000
      104210420000000000000000000000000000000000000000FF7F00000000FF7F
      00000000FF7F00000000FF7F00000000000000000000FF7F005CFF7F0000FF7F
      1863FF7F1863FF7F005C005C1863FF7F00000000000010421042104210420000
      0000FF0300000000000000000000000000000000000000000000000010421042
      00000000104200000000FF7F0000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001863005C005C00001863
      FF7F005C005C005C005C005CFF7F18630000000000000000000000000000FF7F
      FF7F0000FF0300000000FF7FFF7F000000000000000000000000104200000000
      1042104200000000000000000000FF7F00000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7F005CFF7F0000FF7F
      1863FF7F1863FF7F1863FF7F1863FF7F00000000000000000000000000000000
      FF7F00000000FF030000FF7FFF7F000000000000000000000000000010421042
      0000000000000000000000000000000000000000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7F00000000000000000000000000001863005C005C00000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF7F0000FF030000FF7F000000000000104200001042104200000000
      0000000000000000104200000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7F1863FF7F00001F00
      1F001F001F001F001F001F001F001F0000000000FF7F0000175C175C175C0000
      00000000FF7FFF7F0000FF030000000000000000FF7F00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7F0000175C000000000000
      000017001700170017000000FF03000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001F001F001F001F001F00
      1F001F001F000000000000000000000000000000FF7F0000175C000000000000
      0000000000000000000000000000FF0300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FFF7FFF7F00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF03000000000000
      00000000FF0300000000000000000000FF03000000000000FF03000000000000
      00000000FF0300000000000000000000FF030000000000001042000000000000
      0000000000000000000000001042000000000000000000001042000000000000
      000000000000000000000000104200000000000000000000FF7F186318631863
      18630000FF7F18631863186318630000FF7F0000000000000000000000000000
      00000000000000000000000000000000FF7F0000000010420000000000000000
      0000000000000000000000000000104200000000000010420000000000000000
      000000000000000000000000000010420000000000000000FF03FF7FFF03FF7F
      FF03FF7FFF03FF7FFF03FF7FFF03FF7FFF030000000000000000000000000000
      00000000000000000000000000000000FF030000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF7F00000000FF03
      00000000FF7F00000000FF0300000000FF7F0000000000001042104210421042
      10421042104210421042000000000000FF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF0318630000FF7F
      18630000FF0318630000FF7F18630000FF03000000000000FF7FFF7F1042FF7F
      1042FF7F1042FF7F1042000000000000FF030000000000000000000000000000
      0000000000000000000000000000000000000000000000001042000000000000
      000000000000000000000000104200000000000000000000FF7FFF03FF7FFF03
      FF7FFF03FF7FFF03FF7FFF03FF7FFF03FF7F000000000000FF7F000000000000
      00000000000000001042000000000000FF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF0300000000FF7F
      00000000FF0300000000FF7F00000000FF03000000000000FF7FFF7F1042FF7F
      1042FF7F1042FF7F1042000000000000FF030000000000000000000000000000
      0000000000000000000000000000000000000000000000001042000000000000
      000000000000000000000000104200000000000000000000FF7F18630000FF03
      18630000FF7F18630000FF0318630000FF7F000000000000FF7F000000000000
      00000000000000001042000000000000FF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF03FF7FFF03FF7F
      FF03FF7FFF03FF7FFF03FF7FFF03FF7FFF03000000000000FF7FFF7F1042FF7F
      1042FF7F1042FF7F1042000000000000FF030000000000000000000000000000
      0000000000000000000000000000000000000000000000001042000000000000
      000000000000000000000000104200000000000000000000FF7F000000000000
      00000000000000000000000000000000FF7F000000000000FF7F000000000000
      00000000000000001042000000000000FF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF03000018630040
      18630040186318630040186318630000FF03000000000000FF7FFF7F1042FF7F
      1042FF7F1042FF7F1042000000000000FF030000000000000000000000000000
      0000000000000000000000000000000000000000000000001042000000000000
      000000000000000000000000104200000000000000000000FF7F000018631863
      00401863186300401863004018630000FF7F000000000000FF7F000000000000
      00000000000000001042000000000000FF7F0000000010420000000000000000
      0000000000000000000000000000104200000000000010420000104200001042
      000010420000104200001042000010420000000000000000FF03000000000000
      00000000000000000000000000000000FF03000000000000FF7F000000000000
      00000000000000001042000000000000FF030000000000001042000000000000
      0000000000000000000000001042000000000000000000001042000000000000
      000000000000000000000000104200000000000000000000FF7FFF03FF7FFF03
      FF7FFF03FF7FFF03FF7FFF03FF7FFF03FF7F000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7F1042000000000000FF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000010420000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001042
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000170017001700000000000000
      0000000000000000000000000000000000000000000000001042000000000000
      00000000000000000000000010420000000000000000000000000000FF7F0000
      1042000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000170017001700000000000000
      0000000000000000000000000000000000000000000010420000104200001042
      00001042000010420000104200001042000000000000000000000000FF7FFF7F
      00001042104210421042104210421042104200000000000000000000FF7F0000
      0000000000000000000000000000000000000000170017001700000000000000
      0000000000000000000000000000000000000000000000001042104210421042
      10421042104210421042104210420000000000000000000000000000FF7FFF7F
      FF7F0000000000000000000000000000104200000000000000000000FF7FFF7F
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000104210421042
      104210421042104210421042000000000000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F000010420000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7F000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042104210421042
      104210421042104210421042104200000000000000000000FF7F000000000000
      000000000000000000000000FF7F0000104200000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F0000000000000000170017001700000000000000
      0000000000000000000000000000000000000000000000000000104210421042
      104210421042104210421042000000000000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F000010420000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000170017001700000000000000
      0000000000000000000000000000000000000000000000001042104210421042
      104210421042104210421042104200000000000000000000FF7F000000000000
      000000000000000000000000FF7F000010420000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000170017001700000000000000
      0000000000000000000000000000000000000000000000000000104210421042
      104210421042104210421042000000000000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F000010420000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042104210421042
      104210421042104210421042104200000000000000000000FF7F000000000000
      000000000000000000000000FF7F000010420000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000104210421042
      104210421042104210421042000000000000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000104200000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F0000000000000000170017001700000000000000
      0000000000000000000000000000000000000000000000001042104210421042
      104210421042104210421042104200000000000000000000FF7F000000000000
      000000000000000000000000FF7F000010420000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7F000000000000000000000000170017001700000000000000
      0000000000000000000000000000000000000000000010420000104200001042
      000010420000104200001042000010420000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F000010420000000000000000000000000000
      0000000000000000000000000000000000000000170017001700000000000000
      0000000000000000000000000000000000000000000000001042000000000000
      0000000000000000000000001042000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7F0000FF7FE07F0000
      1F00000010000000E003000010020000007C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E07F0000E07F18630000
      1F00000010000000FF030000000200001F7C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000
      00000000000000000000000000000000000000000000E07F0000E07F18630000
      1F001F0010000000FF03FF0300020000007C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000FF7F0000FF7FE07F0000
      1F001F0010000000E003E003100200001F7C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000FF7F0000000000000000
      0000000000000000000000000000FF7F000000000000FF7FE07FFF7FE07F0000
      1F001F0010000000E003000000020000007C0000000010421042104210421042
      1042104210421042104210420000000000001042104210421042104210420000
      00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000E07FFF7FE07F18630000
      1F001F0010000000FF030000100200001F7C00000000FF7F0000000000000000
      0000000000000000000010420000000000001042FF7FFF7FFF7FFF7FFF7F0000
      FF7F1F001F001F001F001F001F001F00000000000000FF7F0000000000000000
      0000000000000000000000000000FF7F000000000000FF7FE07FFF7FE07F0000
      1F00000010000000E003000000020000007C00000000FF7F0000000000000000
      0000000000000000000010420000000000001042FF7FFF7FFF7FFF7FFF7F0000
      00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000E07F0000000018630000
      1F00000010000000FF030000100200001F7C00000000FF7F0000000000000000
      0000000000000000000010420000000000001042FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7F104200000000000000000000000000000000FF7F0000000000000000
      0000000000000000000000000000FF7F000000000000FF7FE07FFF7FE07F0000
      1F00000010000000E003000000020000007C00000000FF7F0000000000000000
      0000000000000000000010420000000000001042104210421042104210421042
      10421042104210421042104210421042000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000E07F0000E07F18630000
      1F00000010000000FF030000100200001F7C00000000FF7F0000000000000000
      0000000000000000000010420000000000001042FF7F10421042104210421042
      104210421042FF7FFF7FFF7FFF7F1042000000000000FF7F0000000000000000
      0000000000000000000000000000FF7F000000000000FF7FE07FFF7FE07F0000
      1F00000010000000E003E00300020000007C00000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F10420000000000001042104210421042104210421042
      104210421042FF7FFF7FFF7FFF7F1042000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000E07F0000000018630000
      1F001F001000000000000000000000001F7C0000000000000000000000000000
      000000000000000000000000000000000000000000000000000000001042FF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F1042000000000000FF7F0000000000000000
      0000000000000000000000000000FF7F000000000000FF7FE07FFF7FE07F0000
      00000000000000000000000000000000007C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000010421042
      10421042104210421042104210421042000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000
      000000000000000000000000000000001F7C0000000000000000000000000000
      000000000000000000000000000000000000000000000000000000001042FF7F
      1042104210421042104210421042104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000010421042
      1042104210421042104210421042104200000000000000000000000000000000
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
      000000000000000000001042104200000000000000001863FF03186300000000
      000000001863FF03186300000000000000000000000000000000000000000000
      000000000000000000000000000000000000E05EE05EE05EE05EE05EE05EE05E
      E05EE05EE05EE05EE05EE05EE05E000000000000000000000000000000000000
      00000000000010420000000010420000000000000000FF031863FF0300000000
      00000000FF031863FF0300000000000000000000000000000000000000000000
      000000001002000000000000000000000000E05EE05EE05EE05EE05EE05EE05E
      E05EE05EE05EE05EE05EE05EE05E000000000000000000000000000000000000
      00001042000000000000000000000000000000000000FF7FFF03186300000000
      00000000FF7FFF0318630000000000000000000000000000000000000000FF7F
      FF7FFF7F00000000000000000000FF7F0000E05EE05EE05EE05EE05EE05EE05E
      E05EE05EE05EE05EE05EE05EE05EFF7F00000000000000000000000000000000
      00000000000000000000104200000000000000000000FF03FF7FFF0300000000
      00000000FF03FF7FFF030000000000000000000000000000000000000000FF7F
      FF7FFF7F000000000000000000000000FF7FE05EE05E000000000000E05EE05E
      E05E000000000000E05EE05EE05E0000FF7F0000000000000000000000000000
      1042000000000000000000000000000000000000104200000000000000000000
      0000000000000000000010420000000000000000000000000000000000000000
      FF7FFF7F000000001042104200000000FF7FE05E00001863FF7F18630000E05E
      00001863FF7F18630000E05EE05E0000FF7F0000000000000000000000000000
      0000000000000000104200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000010420000
      000000000000000000000000000000000000E05E0000FF7F1863FF7F0000E05E
      0000FF7F1863FF7F0000E05EE05E000000000000000000000000000000000000
      0000000010420000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000104200000000
      000000000000000000000000000000000000E05E0000FF7FFF7F18630000E05E
      0000FF7FFF7F18630000E05EE05E000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000104200001042000000000000
      000000000000000000000000000000000000E05E104200000000000018630000
      1863000000000000E05EE05EE05E000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E05EE05E0000E05EE05EE05EE05E
      E05EE05EE05E0000E05EE05EE05E000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E05EE05E0000E05E0000E05EE05E
      E05EE05EE05E0000E05E0000E05E000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E05EE05EE05E0000E05EE05EE05E
      E05EE05EE05EE05E0000E05EE05E000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E05EE05EE05EE05EE05EE05EE05E
      E05EE05EE05EE05EE05EE05EE05E000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E05EE05EE05EE05EE05EE05EE05E
      E05EE05EE05EE05EE05EE05EE05E000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E05EE05EE05EE05EE05EE05EE05E
      E05EE05EE05EE05EE05EE05EE05E0000000000000000005C005C005C005C005C
      00000000000000000000000000000000000000000000005C005C005C005C005C
      00000000000000000000000000000000000000000000005C005C005C005C005C
      00000000000000000000000000000000000000000000005C005C005C005C005C
      000000000000000000000000000000000000000000000000005C007C007C007C
      000000000000000000000000000000000000000000000000005C007C007C007C
      000000000000000000000000000000000000000000000000005C007C007C007C
      000000000000000000000000000000000000000000000000005C007C007C007C
      000000000000000000000000000000000000000000000000005C007C007C007C
      00000000000000000000005C005C00000000000000000000005C007C007C007C
      00000000000000000000005C005C00000000000000000000005C007C007C007C
      00000000000000000000005C005C00000000000000000000005C007C007C007C
      00000000000000000000005C005C000000001863186318631863186318631863
      186318631863186318631863007C005C00001863186318631863186318631863
      186318631863186318631863007C005C00001863186318631863186318631863
      186318631863186318631863007C005C00001863186318631863186318631863
      186318631863186318631863007C005C00001863186318631863186318630000
      186318631863186318631863007C005C00001863186318631863186318630000
      186318631863186318631863007C005C00001863186318631863186318631863
      186318631863186318631863007C005C00001863186318631863000018631863
      000018631863186318631863007C005C00001863186318631863186300000000
      1863186318631863186318630000007C005C1863186318631863186318630000
      0000186318631863186318630000007C005C1863186318631863000000000000
      0000000018631863186318630000007C005C1863186318631863000000001863
      0000000018631863186318630000007C005C18631863186318630000F7020000
      1863186318631863186318630000007C005C1863186318631863186318630000
      F702000018631863186318630000007C005C18631863186318630000F702F702
      F702000018631863186318630000007C005C18631863186318630000F7020000
      0000F70200001863186318630000007C005C1863186318630000F702F7020000
      0000000000000000186318630000007C005C1863186300000000000000000000
      F702F70200001863186318630000007C005C18631863186318630000F702F702
      F702000018631863186318630000007C005C00000000000000000000F702F702
      0000F702F7020000186318630000007C005C186318630000F702F702F702F702
      F702F702F7020000186318630000007C005C186318630000F702F702F702F702
      F702F702F7020000186318630000007C005C18631863186318630000F702F702
      F702000018631863186318630000007C005C0000F702F702F702F702F702F702
      F7020000F702F702000018630000007C005C18630000F702F702F702F702F702
      F702F702F7020000186318630000007C005C186318630000F702F702F702F702
      F702F702F702F702000018630000007C005C18630000000000000000F702F702
      F702000000000000000018630000007C005C0000F702F702F702F702F702F702
      F702F7020000F702F70200000000007C005C186318630000F702F702F702F702
      F702F702F702000018631863007C007C005C186318630000F702F702F702F702
      F702F702F702000018631863007C007C005C186318630000F702F702F702F702
      F702F702F702000018631863007C007C005C0000F702F702F702F702F702F702
      F7020000F702F70200001863007C007C005C1863186318630000F702F7020000
      000000000000000018631863007C005C00001863186300000000000000000000
      F702F7020000186318631863007C005C00001863186318630000F702F702F702
      F702F7020000186318631863007C005C000000000000000000000000F702F702
      0000F702F702000018631863007C005C000018631863186318630000F7020000
      186318631863186318631863005C000000001863186318631863186318630000
      F70200001863186318631863005C0000000018631863186318630000F702F702
      F70200001863186318631863005C0000000018631863186318630000F7020000
      0000F7020000186318631863005C000000001863186318631863186300000000
      1863186318631863186318630000000000001863186318631863186318630000
      000018631863186318631863000000000000186318631863186318630000F702
      0000186318631863186318630000000000001863186318631863000000001863
      0000000018631863186318630000000000001863186318631863186318630000
      1863186318631863186318630000000000001863186318631863186318630000
      1863186318631863186318630000000000001863186318631863186318630000
      1863186318631863186318630000000000001863186318631863000018631863
      0000186318631863186318630000000000001863186318631863186318631863
      1863186318631863186318630000000000001863186318631863186318631863
      1863186318631863186318630000000000001863186318631863186318631863
      1863186318631863186318630000000000001863186318631863186318631863
      18631863186318631863186300000000000000000000FF7FFF7FFF7FFF7FFF7F
      00000000000000000000000000000000000000000000E002E002E002E002E002
      000000000000E002E002E002E002E00200000000000000000000000000000000
      00000000000017001700170017001700000000000000005C005C005C005C005C
      0000000000000000000000000000000000000000000000001042104210421042
      000000000000000000000000000000000000000000000000E002E003E003E003
      000000000000E003E003E003E002000000000000000000000000000000000000
      0000000000001F001F001F00170000000000000000000000005C007C007C007C
      0000000000000000000000000000000000000000000000001042104210421042
      00000000000000000000FF7FFF7F00000000000000000000E002E003E003E003
      000000000000E003E003E003E002000000000000000000001700170000000000
      0000000000001F001F001F00170000000000000000000000005C007C007C007C
      00000000000000000000005C005C000000000000000010421042FF7F10421042
      0000000000000000000010421042FF7F000000000000E003E003E002E003E003
      000000000000E003E003E002E003E0020000000000001F001F00170000000000
      0000000000001F001F0017001F00170000001863186318631863186318631863
      186318631863186318631863007C005C0000000000001042FF7F000000001042
      00000000000000000000000010421042FF7F00000000E003E00200000000E003
      000000000000E00300000000E003E0020000000000001F001700000000000000
      0000000000001F00000000001F001F0017001863186318631863186318631863
      186318631863186318631863007C005C000000001042FF7F0000000000000000
      00000000000000000000000000001042FF7F0000E003E0020000000000000000
      0000000000000000000000000000E003E00200001F0017000000000000000000
      00000000000000000000000000001F0017001863186318631863186318630000
      1863186318631863186318630000007C005C00001042FF7F0000000000000000
      00000000000000000000000000001042FF7F0000E003E0020000000000000000
      0000000000000000000000000000E003E00200001F0017000000000000000000
      00000000000000000000000000001F001700186318631863186318630000F702
      0000186318631863186318630000007C005C00001042FF7F0000000000000000
      00000000000000000000000000001042FF7F0000E003E0020000000000000000
      0000000000000000000000000000E003E00200001F0017000000000000000000
      00000000000000000000000000001F00170018631863186318630000F702F702
      F702000018631863186318630000007C005C00001042FF7F0000000000000000
      00000000000000000000000000001042FF7F0000E003E0020000000000000000
      0000000000000000000000000000E003E00200001F0017000000000000000000
      00000000000000000000000000001F0017001863186318630000F702F702F702
      F702F70200001863186318630000007C005C00001042FF7F0000000000000000
      00000000000000000000000000001042FF7F0000E003E0020000000000000000
      0000000000000000000000000000E003E00200001F0017000000000000000000
      00000000000000000000000000001F001700186318630000F702F702F702F702
      F702F702F7020000186318630000007C005C000000001042FF7F000000000000
      00000000000000000000000010421042FF7F00000000E003E002000000000000
      000000000000000000000000E003E003E002000000001F001700000000000000
      0000000000000000000000001F001F00170018630000000000000000F702F702
      F70200000000000000001863007C007C005C0000000010421042FF7F00000000
      0000000000000000000010421042FF7F000000000000E003E003E00200000000
      00000000000000000000E003E003E0020000000000001F001F00170000000000
      000000000000000000001F001F001700000018631863186318630000F702F702
      F70200001863186318631863007C005C000000000000000010421042FF7F0000
      000000000000000010421042FF7F00000000000000000000E003E003E0020000
      0000000000000000E003E003E002000000000000000000001F001F0017000000
      00000000000000001F001F0017000000000018631863186318630000F702F702
      F70200001863186318631863005C00000000000000000000000010421042FF7F
      FF7FFF7FFF7FFF7F1042FF7F0000000000000000000000000000E003E003E002
      E002E002E002E002E003E00200000000000000000000000000001F001F001700
      17001700170017001F00170000000000000018631863186318630000F702F702
      F702000018631863186318630000000000000000000000000000000000001042
      104210421042104200000000000000000000000000000000000000000000E003
      E003E003E003E003000000000000000000000000000000000000000000001F00
      1F001F001F001F00000000000000000000001863186318631863000000000000
      0000000018631863186318630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001863186318631863186318631863
      1863186318631863186318630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001042
      10421042104200000000000000000000000000000000005C005C005C005C005C
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000104200000000175C175C175C
      0000000000000000000000000000000000000000000000000000000010420000
      000000000000000010420000000000000000000000000000005C007C007C007C
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000175C175C0000
      0000000000000000000000000000000000000000000000000000000000000000
      FF7FFF7F1863186300000000000000000000000000000000005C007C007C007C
      00000000000000000000005C005C000000000000000000000000000000000000
      0000000000000000000000000000000000000000104200000000175C175C0000
      0000000017000000000000000000000000000000000000000000000010420000
      00000000000000000000000000000000000000000000007C007C005C007C007C
      00000000000000000000007C007C005C00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000175C00000000
      0000170017001700170017001700000000000000000000000000000010420000
      00000000000000000000000000000000000000000000007C005C00000000007C
      000000000000000000000000007C005C00000000000000000000000000000000
      0000000000000000000000000000000000000000104200000000175C00000000
      000000001700000000000000000000000000000000000000000000000000FF7F
      104218631042FF7F000000000000000000000000007C005C0000000000000000
      0000000000000000000000000000007C005C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000001042E07F
      104218631042E07FFF7F00000000000000000000007C005C0000000000000000
      0000000000000000000000000000007C005C0000000000000000000000000000
      0000000000000000000000000000000000000000104200000000000000000000
      00000000000000000000000000000000000000000000000000000000FF7FFF7F
      104218631042FF7FFF7F00000000000000000000007C005C0000000000000000
      0000000000000000000000000000007C005C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E07FFF7FE07F
      104218631042E07FFF7F10420000000000000000007C005C0000000000000000
      0000000000000000000000000000007C005C0000000000000000000000000000
      0000000000000000000000000000000000000000104200000000000000000000
      0000000000000000000000000000000000000000000000001042FF7FFF7F1042
      1863186318631042FF7FE07F1042000000000000007C005C0000000000000000
      0000000000000000000000000000007C005C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042E07FFF7F1042
      1863186318631042FF7FFF7F10420000000000000000007C005C000000000000
      000000000000000000000000007C007C005C0000000000000000000000000000
      0000000000000000000000000000000000000000104200000000E05EE05EE05E
      0000000000001700000000000000000000000000000000001042FF7F00001042
      00000000000010420000E07F10420000000000000000007C007C005C00000000
      00000000000000000000007C007C005C00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E05EE05EE05E
      0000000017001700170017001700000000000000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F1042000000000000000000000000007C007C005C0000
      0000000000000000007C007C005C000000000000000000000000000000000000
      0000000000000000000000000000000000000000104200000000E05EE05EE05E
      00000000000017000000000000000000000000000000000000001042FF7FE07F
      FF7FE07FFF7FE07FFF7F00000000000000000000000000000000007C007C005C
      005C005C005C005C007C005C0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000010421042
      E07FFF7FE07F104210420000000000000000000000000000000000000000007C
      007C007C007C007C000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      1042104210420000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF7F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7F000000000000000000000000000000000000F702F70200000000
      0000000000000000104200000000000000001042104210421042104210421042
      1042104210420000000000000000000000000000000000000000000010420000
      00000000000010420000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7F000000000000000000000000000000000000FF03170000000000
      0000000000000000FF7FFF7F0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000010420000
      00000000000010420000000000000000000000000000FF7F0000000000000000
      00000000FF7F0000000000000000000000000000000000000000F70200000000
      0000000000000000FF7FFF7F0000000000001042104210421042104210421042
      1042104200000000000000000000000000000000000000000000104210421863
      18631863104200001042000000000000000000000000FF7F0000FF7FE07FFF7F
      E07F000000000000000000000000000000000000000000000000F70200000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF7F1863
      10421042104210420000000000000000000000000000FF7F0000E07FFF7FE07F
      FF7F0000FF7F000000000000000000000000000000000000F702170000000000
      00000000000000001042FF7F0000000000001042104210421042104210420000
      0000000000000000000000000000000000000000000000000000104210420000
      00000000000010421042000000000000000000000000FF7F0000000000000000
      00000000FF7F000000000000000000000000000000000000FF03170000000000
      0000000000000000FF7FFF7F0000000000000000000000000000000000000000
      000000000000E07F0000000000000000E07F0000000000000000104210420000
      00000000000010421042000000000000000000000000FF7FFF7F0000FF7FFF7F
      170017001700170017001700170017001700000000000000FF03F70200000000
      0000000000000000FF7FFF7F0000000000000000000000000000000000000000
      1F001F0000000000000000000000000000000000000000000000104210421863
      18631863104200001042000000000000000000000000FF7FFF7F0000FF7FFF7F
      1700FF7FE07FFF7FE07FFF7FE07FFF7FE07F0000000000000000F70217000000
      0000000000000000FF7F10420000000000000000000000000000000000000000
      1F001F00000000000000000000000000000000000000000000000000FF7F1863
      10421042104210420000000000000000000000000000FF7FFF7FFF7F0000FF7F
      1700E07FFF7FE07FFF7FE07FFF7FE07FFF7F0000000000000000F702F7020000
      000000000000000010420000FF7F000000000000000000000000000000000000
      1F001F0000000000000000000000000000000000000000000000104210420000
      00000000000010421042000000000000000000000000FF7FFF7FFF7F0000FF7F
      1700FF7FE07FFF7FE07FFF7FE07FFF7FE07F0000000017000000FF03F7021700
      000000000000FF7F000000001042000000000000000000000000000000000000
      1F001F0000000000000000000000000000000000000000000000104210420000
      0000000000001042104200000000000000000000000000000000000000000000
      1700E07FFF7FE07FFF7FE07FFF7FE07FFF7F00000000F70217000000F7021700
      00000000000010420000FF7F0000FF7F00001042104210421042104210420000
      0000000000000000E07F00000000000000000000000000000000104210421863
      1863186318630000104200000000000000000000000000000000000000000000
      17001700170017001700170017001700170000000000FF03F702F702F702F702
      0000000010420000104200000000FF7F00000000000000000000000000000000
      00000000000000000000000000000000E07F00000000000000000000FF7F1863
      1863186318631863000000000000000000000000000000000000000000000000
      1700FF7F1700170017001700170017001700000000000000FF03F702F7020000
      000000000000FF7F000000000000000000001042104210421042104210421042
      104210420000000000000000000000000000000000000000000010421863FF7F
      FF7FFF7FFF7F1042104200000000000000000000000000000000000000000000
      1700170017001700170017001700170017000000000000000000FF03FF030000
      0000000000001042FF7FFF7F1042000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000010421863FF7F
      FF7FFF7FFF7F1042104200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000104210420000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000010420000
      0000000000001042000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E05EE05EE05EE05EE05EE05EE05EE05E0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E05EE05EE05EE05EE05EE05EE05E
      E05EE05EE05EE05EE05EE05EE05EE05EE05E0000000000000000000000000000
      0000000000000000000000000000000000000000100010001000100010001000
      1000100010001000100010001000000000001000100010001000100010001000
      100010001000100010001000100010000000E05EE05EE05EE05EE05EE05EE05E
      E05EE05EE05EE05EE05EE05EE05EE05EE05E000000000000005C005C00000000
      000000000000000000000000005C005C000000001000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F1000000000001000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F10000000E05EE05EE05EE05EE05EE05EE05E
      E05EE05EE05EE05EE05EE05EE05EE05EE05E00000000005C0000000000000000
      00000000000000000000000000000000005C00001000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F1000000000001000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F10000000E05EE05EE05EE05EE05EE05EE05E
      E05EE05EE05EE05EE05EE05EE05EE05EE05E00000000005C0000000000000000
      00000000000000000000000000000000005C00001000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F1000000000001000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F10000000E05EE05EE05EE05EE05EE05EE05E
      E05EE05EE05EE05EE05EE05EE05EE05EE05E00000000005C0000000000000000
      00000000000000000000000000000000005C0000100010001000100010001000
      1000100010001000100010001000000000001000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F10000000E05EE05EE05EE05EE05EE05EE05E
      E05EE05EE05EE05EE05EE05EE05EE05EE05E00000000005C0000000000000000
      00000000000000000000000000000000005C00001000FF7F1000100010001000
      1000100010001000100010001000000000001000FF7F0000FF7F0000FF7F0000
      FF7F0000FF7F0000FF7F0000FF7F10000000E05EE05EE05EE05EE05EE05EE05E
      E05EE05EE05EE05EE05EE05EE05EE05EE05E0000005C00000000000000000000
      0000000000000000000000000000000000000000100010001000100010001000
      1000100010001000100010001000000000001000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F10000000E05EE05EE05EE05EE05EE05EE05E
      E05EE05EE05EE05EE05EE05EE05EE05EE05E0000005C00000000000000000000
      00000000000000000000000000000000000000001000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F1000000000001000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F10000000E05EE05EE05EE05EE05EE05EE05E
      E05EE05EE05EE05EE05EE05EE05EE05EE05E00000000005C0000000000000000
      00000000000000000000000000000000005C00001000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F1000000000001000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F10000000E05EE05EE05EE05EE05EE05EE05E
      E05EE05EE05EE05EE05EE05EE05EE05EE05E00000000005C0000000000000000
      00000000000000000000000000000000005C00001000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F1000000000001000100010001000100010001000
      100010001000100010001000100010000000E05EE05EE05EE05EE05EE05EE05E
      E05EE05EE05EE05EE05EE05EE05EE05EE05E00000000005C0000000000000000
      00000000000000000000000000000000005C0000100010001000100010001000
      1000100010001000100010001000000000001000FF7FFF7F1000100010001000
      100010001000100010001000100010000000E05EE05EE05EE05EE05EE05EE05E
      E05EE05EE05EE05EE05EE05EE05EE05EE05E00000000005C0000000000000000
      00000000000000000000000000000000005C00001000FF7F1000100010001000
      1000100010001000100010001000000000001000100010001000100010001000
      100010001000100010001000100010000000E05EE05EE05EE05EE05EE05EE05E
      E05EE05EE05EE05EE05EE05EE05EE05EE05E000000000000005C005C00000000
      000000000000000000000000005C005C00000000100010001000100010001000
      1000100010001000100010001000000000000000000000000000000000000000
      000000000000000000000000000000000000E05EE05EE05EE05EE05EE05EE05E
      E05EE05EE05EE05EE05EE05EE05EE05EE05E0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E05EE05EE05EE05EE05EE05EE05EE05E0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001000
      1000100010001000100010001000100010000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      1040104010420000000000000000000000000000000000000000000000001000
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F10000000000000000042004200420042
      0042004200420042004200000000000000000000000000000000006400000000
      0000000000000064000000000000000000000000000000000000000010401040
      FF7FFF7F18631042000000000000000000000000000000000000000000001000
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F100000000000E07F0000004200420042
      004200420042004200420042000000000000000000000000107E4A7D00640000
      000000000064637C0054000000000000000000000000000010401040FF7FFF7F
      0000000018631863104200000000000000000000000000000000000000001000
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F100000000000FF7FE07F000000420042
      0042004200420042004200420042000000000000000000000000107E4A7D0064
      00000078637CAD7D00000000000000000000104210401040FF7FFF7F00000000
      1040104000001863186310420000000000001002100210021002100210021000
      10001000100010001000100010001000100000000000E07FFF7FE07F00000042
      00420042004200420042004200420042000000000000000000000000107E4A7D
      0078637CAD7D00000000000000000000000010421040FF7F0000000010401040
      1040104010400000186318631042000000001002FF7FFF7FFF7FFF7FFF7F1000
      FF7F1000100010001000100010001000100000000000FF7FE07FFF7FE07F0000
      000000000000000000000000000000000000000000000000000000000000107E
      4A7D637C00000000000000000000000000001042000000001040104010400042
      E07F104010401040000018631863104200001002FF7FFF7FFF7FFF7FFF7F1000
      10001000100010001000100010001000100000000000E07FFF7FE07FFF7FE07F
      FF7FE07FFF7FE07F0000000000000000000000000000000000000000107E4A7D
      4A7D4A7D00780000000000000000000000001042104010401040104010401040
      0042104010401040104000001863000000001002FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7F100200000000000000000000000000000000FF7FE07FFF7FE07FFF7F
      E07FFF7FE07FFF7F000000000000000000000000000000000000107E4A7D107E
      0000107E4A7D00780000000000000000000000001040FF7F1040104010401040
      1040E07FE07F1040104010400000000000001002100210021002100210021002
      10021002100210021002100210021002000000000000E07FFF7FE07F00000000
      000000000000000000000000000000000000000000000000107E4A7D107E0000
      00000000107E4A7D00640000000000000000000000001040FF7F104010401040
      104010400042E07FE07F10401040000000001002FF7F10021002100210021002
      100210021002FF7FFF7FFF7FFF7F100200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F77E00000000
      000000000000107E000000000000000000000000000000001040FF7F10401040
      104000421040E07FE07F10401040104000001002100210021002100210021002
      100210021002FF7FFF7FFF7FFF7F100200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001040FF7F1040
      1040E07FE07FE07F10401040104000000000000000000000000000001002FF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F100200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000001040FF7F
      1040104010401040104000000000000000000000000000000000000010021002
      1002100210021002100210021002100200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001040
      FF7F10401040000000000000000000000000000000000000000000001002FF7F
      1002100210021002100210021002100200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      1040104000000000000000000000000000000000000000000000000010021002
      1002100210021002100210021002100200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000007C004000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7F0000
      FF7FFF7F007CFF7F00400000FF7FFF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7F000000000000000000000000000018631863186318631863
      18631863186318630000186300000000000000000000FF7FFF7F000000000000
      0000007CFF7F00400000FF7FFF7FFF7F00000000FF7F00000000000000000000
      0000000000000000FF7F00000000000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7F000000000000000010420000000000000000000000000000000000000000
      00000000000000000000000018630000000000000000FF7F0000104218631042
      104200000040000018631863FF7FFF7F00000000FF7F00000000000000000000
      0000000000000000FF7F00000000000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      0000104218631863104200001042000000000000186318631863186318631863
      E07FE07FE07F18631863000000000000000000000000000010421863FF031042
      FF7F10420000FF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F0000
      104218631863FF03104210420000000000000000186318631863186318631863
      1042104210421863186300001863000000000000000000001863FF0318631042
      1863FF7F00001863186318631863FF7F000000000000FF7F0000000000000000
      00000000FF7F0000000000000000000000000000FF7FFF7FFF7FFF7FFF7F0000
      1863186318631863104218630000000000000000000000000000000000000000
      000000000000000000000000186318630000000000000000FF03FF7FFF031042
      FF0318630000FF7FFF7FFF7FFF7FFF7F000000000000FF7F0000000000001863
      00000000FF7F0000000000000000000000000000FF7FFF7FFF7FFF7FFF7F0000
      1863FF0318631863104218630000000000000000186318631863186318631863
      1863186318631863000018630000186300000000000000001042FF7FFF7F1042
      1863104200001863186318631863FF7F000000000000FF7F0000000000001863
      00000000FF7F0000000000000000000000000000FF7FFF7FFF7FFF7FFF7F0000
      1042FF03FF031863104210420000000000000000000000000000000000000000
      00000000000000001863000018630000000000000000FF7F00001042FF031042
      10420000FF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      000010421863186310420000000000000000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7F0000186300001863000000000000FF7F1863000000000000
      000018631863186318631863FF7FFF7F0000000000000000FF7F000000000000
      00000000FF7F0000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7F000000000000000000000000000000000000000000000000FF7F00000000
      000000000000FF7F0000000000000000000000000000FF7FFF7FFF7FFF7F0000
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7F000000000000000000000000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000100010001000100010001000
      1000100010001000100010001000100010000000000000000000000000000000
      0000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7F0000000000000000000000000000000000000000000000000000FF7F0000
      0000000000000000FF7F00000000000000000000100010001000100010001000
      1000100010001000100010001000100010000000000000000000FF7F00000000
      000000000000FF7F000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7F0000186300000000000000000000000000000000000000000000FF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F0000000000000000100010001000100010001000
      1000100010001000100010001000100010000000000000000000000000000000
      0000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7F000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000FF7F00000000
      00000000000000000000FF7F0000000000000000000010421042FF7FFF7FFF7F
      1042FF7FFF7FFF7F1042FF7FFF7FFF7F00000000000000000000000000000000
      0000FF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7F000000000000000000000000000000000000000000000000FF7F00000000
      00000000000000000000FF7F0000000000000000000010421042FF7FFF7FFF7F
      1042FF7FFF7FFF7F1042FF7FFF7FFF7F00000000000000000000000000000000
      0000FF7F1F001F001F00FF7F0000000000000000FF7F18631863186318631863
      FF7F000000000000000000000000000000000000000000000000000000000000
      000000000000FF7F000000000000000000000000000000001042104210421042
      1042104210421042104210421042104200000000000000000000000000000000
      0000FF7FFF7FFF7FFF7FFF7F0000000000000000FF7F18631863186318631863
      FF7F0000000000000000000000000000000010001000100000000000FF7F0000
      000018630000FF7F000000000000000000000000E07F00000000FF7FFF7FFF7F
      1042FF7FFF7FFF7F1042FF7FFF7FFF7F00000000000000000000000000000000
      0000FF7F1F001F001F00FF7F0000000000000000FF7F18631863186310420000
      0000000010420000000000000000000000001000FF7FFF7FFF7F000000000000
      00001863000000000000000000000000000000001042E07F00000000FF7FFF7F
      1042FF7FFF7FFF7F1042FF7FFF7FFF7F00000000000000001863186318631863
      0000FF7FFF7FFF7FFF7FFF7F0000000000000000FF7F1863186300000000FF7F
      FF7FFF7F00000000000000000000000000001000FF7F104210420000FF7F0000
      000000000000FF7F00000000000000000000000000001042E07F000000000000
      10421042104210421042104210421042000000000000000018631F001F001F00
      0000FF7F1F001F001F00FF7F0000000000000000FF7F186300001042FF7FFF7F
      FF7FFF7F00001042000000000000000000001000FF7FFF7FFF7FFF7F00000000
      0000000000000000000000000000000000000000000000000000FF7FE07F0000
      0000FF7FFF7FFF7F1042FF7FFF7FFF7F00000000100200001863186318631863
      0000FF7FFF7FFF7FFF7FFF7F0000000000000000FF7F10420000FF0300000000
      0000FF7F00001863000010420000000000001000FF7F10421042FF7F0000FF7F
      0000104210420000FF7F00000000000000001042FF7FE07FE07FE07FE07FE07F
      00000000000000000000000000000000000000001002000018631F001F001F00
      0000000000000000000000000000000000000000FF7F0000FF03FF7FFF03FF7F
      FF03FF7F00001863186300000000000000001000FF7FFF7FFF7FFF7F00000000
      0000FF7FFF7F00000000000000000000000000001042FF7FE07F000000000040
      0040004000400040004000400040004000000000100200001863186318631863
      1863000000000000000000000000000000000000FF7F0000FF7F000000000000
      0000FF7F00001863186300000000000000001000FF7F10421042FF7F10421042
      FF7F10421042FF7F10000000000000000000000000001042FF7FE07F00000000
      00400040004000400040004000400040000000001002000018631F001F001F00
      186300000000000000000000000010000000000000000000FF03FF7FFF03FF7F
      FF7FFF7F00001863186300000000000000001000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7F10000000000000000000000000001042FF7FE07FE07F0000
      0000000000000000000000000000000000000000100200001863186318631863
      1863000000000000000000001000100010000000000010420000000000000000
      0000000000001863000010420000000000001000100010001000100010001000
      1000100010001000100000000000000000000000000000001042FF7FE07FE07F
      0000000000000000000000000000000000000000100200000000000000000000
      0000000000000000000000000000100000000000000000000000000018631863
      1863186318631042000000000000000000001000186310001000186310001000
      18631000100018631000000000000000000000000000000000001042FF7FE07F
      E07F000000000000000000000000000000000000100210021002100210020000
      0000000000001000000000000000100000000000000000000000000000001863
      1863186300000000000000000000000000001000100010001000100010001000
      1000100010001000100000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000100010001000000000000000000000000000000010420000
      0000000010420000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001000
      10001000100010001000100010001000100000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001000
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F100000000000FF7FFF7FFF7FFF7FFF7F
      0002FF7FFF7FFF7FFF7FFF7F0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001000
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F100000000000FF7FFF7FFF7FFF7F0002
      0002FF7FFF7FFF7FFF7FFF7F0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000186318631863186318631863
      1863186318631863186318631863186300000000000000000000000000001000
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F100000000000FF7FFF7FFF7F00020002
      000200020002FF7FFF7FFF7F0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7FFF7F1863FF7FFF7FFF7F
      1863FF7FFF7FFF7F1863FF7FFF7F186300001002100210021002100210021000
      10001000100010001000100010001000100000000000FF7FFF7FFF7FFF7F0002
      0002FF7FFF7F0002FF7FFF7F0000000000000000000000000000000000000000
      0000E07F10420000000000000000000000000000FF7FFF7F1863FF7FFF7FFF7F
      1863FF7FFF7FFF7F1863FF7FFF7F186300001002FF7FFF7FFF7FFF7FFF7F1000
      FF7F1000100010001000100010001000100000000000FF7FFF7FFF7FFF7FFF7F
      0002FF7FFF7F0002FF7FFF7F0000000000000000000000000000000000000000
      0000E07F18630000000000000000000000000000186318631863186318631863
      1863186318631863186318631863186300001002FF7FFF7FFF7FFF7FFF7F1000
      10001000100010001000100010001000100000000000FF7FFF7F0002FF7FFF7F
      FF7FFF7FFF7F0002FF7FFF7F0000000000000000000000000000000000000000
      00000000E07F1042000000000000000000000000FF7FFF7F1863FF7FFF7FFF7F
      1863FF7FFF7FFF7F1863FF7FFF7F186300001002FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7F100200000000000000000000000000000000FF7FFF7F0002FF7FFF7F
      0002FF7FFF7FFF7FFF7FFF7F0000000000000000000000000000000000000000
      00000000E07F1863000000000000000000000000FF7FFF7F1863FF7FFF7FFF7F
      1863FF7FFF7FFF7F1863FF7FFF7F186300001002100210021002100210021002
      10021002100210021002100210021002000000000000FF7FFF7F0002FF7FFF7F
      00020002FF7FFF7FFF7FFF7F0000000000000000000000000000000000000000
      000000000000E07F104200000000000000000000186318631863186318631863
      1863186318631863186318631863186300001002FF7F10021002100210021002
      100210021002FF7FFF7FFF7FFF7F1002000000000000FF7FFF7FFF7F00020002
      000200020002FF7FFF7FFF7F0000000000000000000000000000000000000000
      000000000000E07F000000001042000000000000FF7FFF7F1863FF7FFF7FFF7F
      1863FF7FFF7FFF7F1863FF7FFF7F186300001002100210021002100210021002
      100210021002FF7FFF7FFF7FFF7F1002000000000000FF7FFF7FFF7FFF7FFF7F
      00020002FF7FFF7FFF7FFF7F0000000000000000000000000000000000000000
      0000000000000000004000400000000000000000FF7FFF7F1863FF7FFF7FFF7F
      1863FF7FFF7FFF7F1863FF7FFF7F18630000000000000000000000001002FF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F1002000000000000FF7FFF7FFF7FFF7FFF7F
      0002FF7FFF7F0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000100010001000100010001000
      1000100010001000100010001000100000000000000000000000000010021002
      10021002100210021002100210021002000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7F0000FF7F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000100010001000100010001000
      100010001000100010001000100010000000000000000000000000001002FF7F
      10021002100210021002100210021002000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7F0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000010021002
      1002100210021002100210021002100200000000000000000000000000000000
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
      000000000000000000000000000000000000000094529452945294529452734E
      734E524A314631463146314631468C3100000000000000001042104210421042
      104210420000E07F000010420000000000001000100010001000100010001000
      1000100010001000100010001000100000000000100010001000100010001000
      1000100010001000100010001000000000000000FF7F9C734A294A291863FF7F
      FF7F9C739C73CE39000000000000EF3D00000000000000000000000000000000
      00000000FF7FFF7F000000001042000000001000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F1000000000001000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F1000000000000000FF7F8C31000000002925E71C
      AD35AD350000FF7F9452000000003146000000000000FF7FFF7FFF7FE07FFF7F
      E07FFF7FE07FFF7FFF7FFF7F0000104200001000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F1000000000001000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F1000000000000000FF7FCE39FF7F80732925FF7F
      FF7F9C739C739C739C73F75E00003146000000000000FF7FE07FFF7FFF7FFF7F
      10001000FF7FFF7FE07FFF7F0000104200001000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F1000000000001000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F1000000000000000FF7FCE39000000002925E71C
      AD35AD350000FF7F0000FF7F7B6F3146000000000000FF7FFF7FFF7FE07FFF7F
      FF7FFF7FE07FFF7FFF7FFF7F0000104200001000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F100000000000100010001000100010001000
      1000100010001000100010001000000000000000FF7FCE39FF7FE87F2925FF7F
      FF7F9C739C739C739C739C73FF7F3146000000000000FF7FE07FFF7FFF7FFF7F
      10001042FF7FFF7FE07FFF7F0000104200001000FF7F0000FF7F0000FF7F0000
      FF7F0000FF7F0000FF7F0000FF7F1000000000001000FF7F1000100010001000
      1000100010001000100010001000000000000000FF7FCE39000000002925E71C
      AD35AD351863AD3529251863FF7F3146000000000000FF7FFF7FFF7FE07FFF7F
      104210001863FF7FFF7FFF7F0000104200001000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F100000000000100010001000100010001000
      1000100010001000100010001000000000000000FF7FCE39FF7FEF7F2925FF7F
      FF7F9C73AD355F475E0229257B6F3146000000000000FF7FE07FFF7FFF7FFF7F
      E07F104210001042E07FFF7F0000104200001000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F1000000000001000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F1000000000000000FF7FCE39000000002925E71C
      AD359C73AD35BF67FF2AAD357B6F3146000000000000FF7FFF7FFF7F10001042
      FF7FFF7F10001000FF7FFF7F0000104200001000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F1000000000001000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F1000000000000000FF7F39674A294A2918639C73
      9C739C731863AD35AD3518639C733146000000000000FF7FE07FFF7F10001000
      E07F186310001000E07FFF7F0000104200001000100010001000100010001000
      10001000100010001000100010001000000000001000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F1000000000000000D65AFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FD65A3146000000000000FF7FFF7FFF7F18631000
      1000100010001863FF7FFF7F0000104200001000FF7FFF7F1000100010001000
      1000100010001000100010001000100000000000100010001000100010001000
      10001000100010001000100010000000000000006B2D6B2D6B2D6B2D6B2D6B2D
      6B2D6B2D6B2D6B2D6B2D6B2D6B2D6B2D000000000000FF7FE07FFF7FFF7FFF7F
      E07FFF7FFF7FFF7FE07FFF7F0000104200001000100010001000100010001000
      10001000100010001000100010001000000000001000FF7F1000100010001000
      1000100010001000100010001000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FFF7FFF7FE07FFF7F
      FF7FFF7FE07FFF7FFF7FFF7F0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000100010001000100010001000
      1000100010001000100010001000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000027FE055000000000025
      2052002500000000000000000000000000000000945294529452945294529452
      9452945294529452945294529452945294520000945294529452945294529452
      9452945294529452945294529452945294520000000000000000000000000000
      000000000000000000000000000000000000004EE020B47F687FE020004E8362
      407F803D000000000000000000000000000094527B6F7B6F7B6F00007B6F7B6F
      7B6F9452186318631863186318631863945294527B6F7B6F7B6F7B6F7B6F7B6F
      7B6F945218631863186318631863186394520000000000000000000000000000
      000000000000000000000000000000000000007B007BD77F407F007B03774E73
      202D0000000000000000000000000000000094527B6F7B6F7B6F00007B6F7B6F
      7B6F9452186318631863CE394A294A29314694527B6F7B6F7B6F7B6F7B6F7B6F
      7B6F9452186318631863CE394A294A2931460000945294529452945294529452
      94529452945294529452314631468C310000B47F8062402940298062007B8062
      80628062205200000000000000000000000094527B6F00000000000000000000
      7B6F945218631863CE390000000000004A2994527B6F00000000000000000000
      7B6F945218631863CE390000000000004A290000FF7F18630821082118639C73
      9C739C739C739C739C739C731863EF3D0000407F4029B556B5564029407FA862
      6B5A685A803D0000B556B556B556B556000094527B6F7B6F7B6F00007B6F7B6F
      7B6F94521863314600007319FF6B9D3E000094527B6F7B6F7B6F7B6F7B6F7B6F
      7B6F94521863314600007319FF6B9D3E00000000FF7F08217B03082108219C73
      082108210821AD35D65A08219C7331460000AF7F4029B556B55640296B7F645E
      00000000000039673967396739671042000094527B6F7B6F7B6F00007B6F7B6F
      7B6F9452314600007319FF7BDF467319000094527B6F7B6F7B6F7B6F7B6F7B6F
      7B6F9452314600007319FF7BDF46731900000000FF7F08217B037B0308219C73
      FF7FFF7FFF7FFF7F9C739C739C733146000000000000B556B5560000462D667F
      407F00009C739C739C739C739C73104200000000945294529452945294529452
      3146CE390000B521FF7B1F4F7319000094520000945294529452945294529452
      3146CE390000B521FF7B1F4F7319000094520000FF7F18630821082118639C73
      082108210821AD35D65A08219C73314600000000000094529452000000000000
      00009C739C739C739C739C739C73104200000000000000000000000000000000
      000000000000FF7B5F5773190000000000000000000000000000000000000000
      000000000000FF7B5F5773190000000000000000FF7F9C739C739C739C739C73
      FF7FFF7FFF7FFF7F9C739C739C7331460000000000005A6B5A6B0000BD77BD77
      BD77BD77BD77BD77BD77BD77BD7710420000000000000000000000005F22BF4F
      FF5B5F430000000073190000000000000000000000000000000000005F22BF4F
      FF5B5F4300000000731900000000000000000000FF7F18630821082118639C73
      082108210821AD35D65A08219C733146000000000000DE7BDE7B0000FF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F104200000000000000000000DF11FF5BFF5B
      9F4BFF575F430000000000000000000000000000000000000000DF11FF5BFF5B
      9F4BFF575F430000000000000000000000000000FF7F0821E003E00308219C73
      FF7FFF7FFF7FFF7F9C739C739C73314600000000000000000000DE7BDE7BDE7B
      DE7BDE7BDE7BDE7BDE7BDE7BDE7B1042000000000000000000009F4BFF6BFF6B
      FF639F4BFF57FF320000000000000000000000000000000000009F4BFF6BFF6B
      FF639F4BFF57FF32000000000000000000000000FF7F08210821E00308219C73
      082108210821AD35D65A08219C73314600000000000000007B6F5A6B5A6B5A6B
      5A6B5A6B5A6B5A6B5A6B5A6B5A6B104200000000000000000000FF5FFF7FFF63
      FF63FF639F4B1F3B000000000000000000000000000000000000FF5FFF7FFF63
      FF63FF639F4B1F3B000000000000000000000000FF7F18630821082118639C73
      9C739C739C739C739C739C739C73314600000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF5FFF7FFF6B
      FF63FF6B9F4BBF4F000000000000000000000000000000000000FF5FFF7FFF6B
      FF63FF6B9F4BBF4F000000000000000000000000D65AFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FD65A31460000000000000000C402C402C402C402
      C402C402C402C402C402C40244020302000000000000000000009F4BFF73FF73
      FF73FF73FF6BBF2E0000000000000000000000000000000000009F4BFF73FF73
      FF73FF73FF6BBF2E0000000000000000000000006B2D6B2D6B2D6B2D6B2D6B2D
      6B2D6B2D6B2D6B2D6B2D6B2D6B2D6B2D0000000000000000FF7FF95FF343EF2B
      EF2BEA13EA13EA13EA13EA13EA1344020000000000000000000000009F4BFF73
      FF73FF571F3B000000000000000000000000000000000000000000009F4BFF73
      FF73FF571F3B0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000042084208420842084208EF3D
      9452945294529452945294520000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001042B556524A524A524A524A524A
      524A524A524A524A524AEF3D210400000000000042084F7FA020006642088C31
      EF3D945294529452000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001042FF7FBD77BD77BD77BD77FF7F
      FF7F5A6B5A6B5A6B5A6B524A000000000000000042084F7FA020A37A42080000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000018631863186318631863F75E00000000000000000000000040020000
      0000000000000000000000000000000000001042FF7FBD77BD77BD77FF7FAD35
      2104BD775A6B39673967524A00000000000000004208737FC028A67A42083146
      3146B556B556B556B55694522925292500000000000000000000000000000000
      00000000FF7F9C739C739C739C73F75E00000000000000000000C002E20BC002
      0000000000000000000000000000000000001042FF7FBD77BD77FF7FAD355A6B
      31462104BD7739673967524A00000000000021044208987FC87AA67A42082104
      F75E6B2D29250821A514EF3DEF3D292500000000B556B556B556B556B556B556
      B5560000FF7F3967396739673967F75E00000000000000004003E30FF75FE413
      C002000000000000000000000000000000001042FF7FBD77FF7FAD355A6B5A6B
      5A6B31462104BD773967524A2104000000002104987FC87AC97AE97AC37A2104
      FF7FFF7FFF7FFF7FFF7FFF7FF75E6B2D00000000FF7F39673967396739673967
      39670000000000000000000000000000000000000000C002E413FF7F00000000
      E413400300000000000000000000000000001042FF7FFF7FAD35BD779C739C73
      5A6B5A6B314621043967524A0000000000002104DB7FC97AE97A0D7BEB7A2104
      EF3DEF3DEF3DEF3DEF3DEF3DEF3D8C3100000000FF7F9C739C739C739C739C73
      9C730000C402C402C402C402440203020000000000000000FF7F000000000000
      0000E92740030000000000000000000000001042FF7FAD35BD77BD77BD779C73
      5A6B5A6B5A6B3146210439670000000000002104FF7FE97A0D7B0F7FEC7E2104
      0000000000000000000000000000000000000000FF7F9C739C739C739C739C73
      9C730000FF7FF95FF343EF2BEF2B440200000000000000000000000000000000
      00000000EF3F4003000000000000000000001042524AFF7FBD77BD77BD77BD77
      9C735A6B00000000000000000000000000002104C0240A77FF7FA16E20352104
      F75EF75EF75EF75EF75EF75E0000000000000000FF7FBD77BD77BD77BD77BD77
      BD77000000000000000000000000000000000000000000000000000000000000
      000000000000F55740030000000000000000AD35FF7FFF7FFF7FFF7FFF7FFF7F
      FF7F00000000000000000000000000000000000000002104210421047B6F0821
      0F000F000F000F000F00F75E6B2D000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F10420000000000000000000000000000000000000000
      0000000000000000FF7F40030000000000000000AD35AD35AD35AD35AD35AD35
      AD350000000000000000FF7F00000000000000002104AD356B2D29252104AD35
      1F425F295F295F290F00F75EAD35000000000000FF7FDE7BDE7BDE7BDE7BDE7B
      DE7BDE7BDE7BDE7BDE7B10420000000000000000000000000000000000000000
      00000000000000000000FF7F4003000000000000000000000000000000000000
      00000000000000000000ED7F00000000000000002104D65A31466B2D2104AD35
      FF5E1F425F295F290F00F75EEF3D0000000000007B6F5A6B5A6B5A6B5A6B5A6B
      5A6B5A6B5A6B5A6B5A6B10420000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF7FED7FE67FED7FFF7F000000002104BD77D65AAD352104AD35
      FF03FF5E1F425F290F00F75EEF3D000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000ED7F000000000000000000002104210421047B6F0000
      00000000000000000000F75EEF3D000000000000C402C402C402C402C402C402
      C402C402C402C402440203020000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF7F00000000000000000000000000000000FF7F7B6F
      7B6F7B6F7B6F7B6F7B6F9452AD35000000000000FF7FF95FF343EF2BEF2BEA13
      EA13EA13EA13EA13EA1344020000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000021042104C61821042104
      0000000000020002000200020000000200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF7F0000000000000000000000000000000000000000DA7FDA7F0000DA7FDA7F
      0000000000000000000000000000000200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000EB00870000000000000000000000000000000000
      907F497F0000000000000000000000000000000000000000E93F800D20160000
      0000000000000002000200020000000000000000000000000000000000000000
      00000000000000007319FF6B9D3E000000000000000000000000000000000000
      00000000000000000000EB00D601EB0000000000000000000000000000000000
      6E7F42080000000000000000000000000000000000000000A01F201B20160000
      0000000000000000000000020000000200020000000000000000000000000000
      0000000000007319FF7BDF467319000000000000000000000000000000000000
      00000000000000002D01D6013F37000000000000000000000000000000000000
      6E7FA16E00000000000000000000000000000000DA7F400DF053EA3F001F400D
      DA7F000000000002000000020002000200000000000000000000000000000000
      00000000B521FF7B1F4F73190000000000000000000000000000000000000000
      00000000000050017E027F530000000000000000000000000000000000000000
      6E7F000000000000000000000000000000000000F053F053F053EA3F001F001F
      001F000000000002000000000000000000000000000000000000000000000000
      00000000FF7B5F57731900000000000000000000000000002925000000000000
      00006B2D0000FF1EDF7300000000000000000000000000000000000000000000
      6E7F247F000000000000000000000000000000000000F053F053EA3F001F001F
      00000000000000020000000200020002000000000000000000005F22BF4FFF5B
      5F430000000073190000000000000000000000000000000010423C023C023C02
      3C02082121040000000000000000000000000000000000000000000000000000
      6E7F00000000000000000000000000000000000000002104F053F053001F2104
      000000000000000000000002000000000000000000000000DF11FF5BFF5B9F4B
      FF575F430000000000000000000000000000000029251042DF1E3F3F3F3FDF1E
      DF1E3C0208212925000000000000000000000000000000000000000000006E7F
      237FA07260390000000000000000000000000000000000002104210421040000
      0000000200020000000200020000000200000000000000009F4BFF6BFF6BFF63
      9F4BFF57FF32000000000000000000000000000000009F5B9F5B9F5B3F3F3F3F
      DF1EDF1E3C0200000000000000000000000000000000000000000000B57F237F
      A072A072A072A04500000000000000000000000200002104D17ED17ED17E2104
      000000000000000000000000000000020002000000000000FF5FFF7FFF63FF63
      FF639F4B1F3B000000000000000000000000000000009F5BFF7F9F5B3F3F3F3F
      3F3FDF1E3C0200000000000000000000000000000000000000000000FC7F237F
      A072A072A072A045000000000000000000000002000021049A7F9A7FD17E2104
      000000020002000200020002000000020000000000000000FF5FFF7FFF6BFF63
      FF6B9F4BBF4F000000000000000000000000000000009F5BFF7F9F5B3F3F3F3F
      3F3FDF1E3C0200000000000000000000000000000000000000000000FF7F237F
      00004135A072A045000000000000000000000000000021049A7F9A7FD17E2104
      0000000000000000000000020000000000000000000000009F4BFF73FF73FF73
      FF73FF6BBF2E00000000000000000000000000000000FF7BFF7FFF7F9F5B3F3F
      3F3FDF1E3C0200000000000000000000000000000000000000000000FF7F237F
      00000125A0726039000000000000000000000002000000002104210421040000
      00000002000000020000000200020002000000000000000000009F4BFF73FF73
      FF571F3B0000000000000000000000000000000029251042FF7BFF7FFF7F9F5B
      9F5BDF1E1042292500000000000000000000000000000000000000000000FF7F
      237FA072A0450000000000000000000000000002000200000000000000000000
      0000000200000002000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042FF7B9F5B9F5B
      9F5B104200000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000002000200020000
      0002000200000002000000020002000000020000000000000000000000000000
      0000000000000000000000000000000000000000000000002925000000000000
      0000292500000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000002000200000002000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002104
      2104210400000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F053
      001F001F00000000000000000000000000000000000000000000000000000000
      F6019301A8000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000B900B900
      B900B900B900B90000000000000000000000000000000000210421040000F053
      EA3F001F00002104210400000000000000000000000000000000000000000000
      DF125B022D010000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BF01BF013601
      1801180118019E01FA0000000000000000000000000000003F677F0C0000F053
      EA3F001F0000E05EE05E00000000000000000000000000000000000000000000
      DF125B0250010000000000000000000000000000000000000000000000000000
      797FD17EB07E077E077E00000000000000000000000000007F0A3F023F029701
      FF7FFF7F5C013F02BF01FA000000110800000000000000003F673F462104F053
      EA3F001F2104ED7FE05E00000000000000000000000000000000000000000000
      1F2B5B0250010000000000000000000000000000000000000000000000000000
      D17E577F577FF27E077E0000000000000000000000007F0A3F023F023F029701
      FF7FFF7F5C013F023F02BF01FA00000000000000000000003F673F462104F053
      EA3F001F2104ED7FE05E00000000000000000000000000000000000000000000
      5F435B029301000000000000000000000000000000000000000000000000D17E
      9A7F9A7F9A7F367F6C7E000000000000000000009F4F7F0A3F023F023F029701
      FF7FFF7F5C013F023F023F029E01B90000000000000021043F673F462104F053
      EA3F001F2104ED7FE05E21040000000000000000000000000000000000000000
      5F435B029301000000000000000000000000000000000000000000002A7E9C73
      9A7F9A7F9A7F577F6C7E000000000000000000009F4F7F0A3F023F023F029701
      FF7FFF7F5C013F023F023F02BF01FA0000000000000021043F673F462104F053
      EA3F001F2104ED7FE05E21040000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A37DDE7B9A7F
      147F9A7F9A7F147F2A7E000000000000000000009F4F7F0A3F023F023F029701
      FF7FFF7F5C013F023F023F02BF01FA0000000000000021043F673F465F290000
      F0530000FB7FED7FE05E21040000000000000000000000000000000000000000
      00003C6700000000000000000000000000000000000000000000FF7F00000000
      147F6341147F633D6C7E000000000000000000009F4F7F0A3F023F023F029701
      FF7FFF7F5C013F023F023F02BF01FA000000000000002104FF7F3F465F292104
      21042104FB7FED7FE05E21040000000000000000000000000000000000000000
      0000BE7B00000000000000000000000000000000000000000000000000000000
      147F6341147F43356C7E000000000000000000009F4F7F0A3F023F023F02DA01
      DA01DA01DA013F023F023F02BF01FA0000000000000000000000FF7F2104AD35
      6B2D29252104FB7F000000000000000000000000000000000000000000000000
      0000BE7B00000000000000000000000000000000000000000000000000000000
      9A7F6341147F022D6C7E00000000000000000000FF7FDF123F023F023F02DA01
      DA01DA01DA013F023F023F02BF01FA000000000000000000210421042104D65A
      31466B2D2104210421040000000000000000000000000000AE35334600003346
      C618AE35C618C618000000002A25000000000000000000000000000000000000
      9A7F2335D17EE22C2A7E000000000000000000000000FF7F7F0A3F023F029701
      FF7FFF7F5C013F023F023F02BF0100000000000000002104AD356B2D2104BD77
      D65AAD3521046B2D29252104000000000000000000000000F85E3C67C7183346
      3346F13DF13DF13DAE35D039794E000000000000000000000000000000000000
      00002231D17E000000000000000000000000000000000000FF7F7F0A3F029701
      FF7FFF7F5C013F023F02BF01000000000000000000002104D65A31466B2D2104
      21042104D65A31466B2D2104000000000000000000000000FF7F5B6B5B6BF85E
      3C673C67D95ED95ED95E3C670000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF7F7F0A9701
      9701970197013F02BF010000000000000000000000002104BD77D65AAD352104
      00002104BD77D65AAD352104000000000000000000000000FF7FFF7F00005B6B
      5B6B5B6B5B6B5B6B5B6B00000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF7F9F4F
      9F4F9F4F9F4FBF01000000000000000000000000000000002104210421040000
      0000000021042104210400000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000006B2D00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000006B2DFF633F473F433F473F47
      3F431F431F431F3F1F3FFF3E7F2E000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E06DE06DE06DE06DE06D
      E06DE06DE06DE06DE07F00000000000000000000207620762076207620762076
      20762076207620762076207600000000000000006B2DFF63FF63BF53BF57BF57
      BF539F539F539F4F7F4F7F4B7E2E000000000000000000000000000000000000
      000000000000000000000000000000000000000000590000407FE07EE07EE07E
      E07EE07EE07EE07EA07EE07F0000000000000000007F407F407F407F407F407F
      407F407F407F407FE07FED7F00000000000000006B2DFF63BF53000000000000
      000000000000000000005F4B7D2E000000000000000000000000000000000000
      000000000000EC00000000000000000000000000407A205D0000A07F407F407F
      407F407F407F407F607F407FE07F000000000000007F407FA07FA07FA07FA07F
      A07FA07FA07FA07FE07FED7F00000000000000006B2DFF639F539F539F539F53
      9F539F4F7F4F7F4B5F4B5F4B7B2A000000000000000000000000000000000000
      00000000EC009401000000000000000000000000A07E807E20760000E07FE07F
      E07FE07FE07FE07FE07FE07FE07FE97F00000000007FA07FE07FE07FE07FE07F
      E07FE07FE07FE07FE07FED7F00000000000000006B2DFF639F53000000000000
      000000000000000000003F475A2A000000000000510195019501950195019501
      950100009301F801000000000000000000000000007FA07F407FE07E00000000
      0000000000000000000000000000000000000000007FA07FE07FE07FE07FE07F
      E07FE07FE07FE07FE07FED7F00000000000000006B2DFF639F4F7F4F9F4F9F4F
      7F4F7F4B5F4B5F4B3F473F47592A0000000000009F0A9F0A9F0A9F0A9F0A9F0A
      9F0A00005F023D02000000000000000000000000007FA07FE07FE07F407F407F
      407F407F407F407FE07FED7F0000000000000000007FA07FE07FE07FE07FE07F
      E07FE07FE07FE07FE07FED7F00000000000000006B2DFF637F4F000000000000
      000000000000000000003F435826000000000000FF7B9F5B9F5B9F5B9F5B9F5B
      9F5B0000BF129F0A000000000000000000000000007FA07FE07FE07FE07FE07F
      E07FE07FE07FE07FE47FED7F0000000000000000007FA07FE07FE07FE07FE07F
      E07FE07FE07FE07FE47FED7F00000000000000006B2DFF637F4B5F4B7F4B7F4B
      5F4B5F4B3F473F473F431F433726000000000000000000000000000000000000
      000000005F4B9F0A000000000000000000000000007FA07FE07FE07FE07FED7F
      ED7FED7FED7FED7FED7F00000000000000000000007FA07FE07FE07FE07FED7F
      ED7FED7FED7FED7FED7F000000000000000000006B2DFF635F4B000000000000
      000000003F433F431F431F433626000000000000000000000000000000000000
      0000000000001F37000000000000000000000000007FE07FE07FE07FFF7F0000
      0000000000000000000000000000000000000000007FE07FE07FE07FFF7F0000
      00000000000000000000000000000000000000006B2DFF635F4B3F475F4B5F4B
      3F473F473F432925292529252925000000000000000000000000000000000000
      00000000000000000000000000000000000000000000ED7FED7FED7F00000000
      00000000000000000000000000000000000000000000ED7FED7FED7F00000000
      00000000000000000000000000000000000000006B2DFF633F47000000000000
      000000001F432925FF63DF573F47000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000006B2DFF63FF633F433F473F47
      3F431F431F432925DF573F472925000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000006B2DFF63FF63FF5FFF63FF63
      FF5FFF5FFF5B29253F4729250000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000006B2D6B2D6B2D6B2D6B2D6B2D
      6B2D6B2D6B2D2925292500000000000000000000000000000000000000000000
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
      0000210421042104210421042104210400000000000021042104C61821042104
      0000000021042104210421042104000000000000F75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75E00004A29734E0000000000004A007A364A00FF7F5F53
      5F535F535F535F534A00F625D521000000000000000000000000000000000000
      000021044A7D4A7D4A7D4A7D4A7D21040000000000005A7FF0530000001F5A7F
      000000005A7FBF167F023B025A7F000000000000FF7F94529452945294529452
      9452945294529C739C739C730000EF3D000000004A007A36BD424A00FF7FFF7F
      FF7FFF7FFF7F5F534A00382E9319000000000000000000000000000000000000
      00002104D67E8410841084104A7D21040000000000000000F053800D001F0000
      000000000000BF167F023B020000000000000000F75EF967F147F147F147F147
      F147F147200394529C739C739C730000000000004A00BD42BD424A008C008C00
      8C008C008C008C004A00382ED521000000000000000000000000841084108410
      84102104D67E947E317E317E4A7D21040000000000000000F053EA3F001F0000
      000000000000BF167F023B020000000000000000F75EFF7FFA6BFA6BFA6BEA2B
      0002EA2BEA2B94529C739C739C733146000000004A00FF4AFF4A7A367A367A36
      7A367A367A367A367A367A36F729000000000000000000000000841026032603
      26032104D67E8410841084104A7D2104000000005A7F2104F053EA3F001F2104
      00005A7F2104BF167F023B0221045A7F00000000F75EA002FA6BFA6BFA6B0002
      FA6B0002EA2B94529C730000FF7F3146000000004A00FE46FF4AFF4AFF4AFF4A
      FF4AFF4AFF4AFF4AFF4AFE46D5210000000000000000000000008410FA678410
      84102104D67E947E317E317E4A7D210400000000F053F053F053EA3F001F001F
      0000BF16BF16BF167F023B023B023B0200000000F75EA002FA6BFA6BFA6B0002
      FA6BFA6BEA2B94529C739C739C733146000000004A00FE465111511151115111
      511151115111511151117215F72900000000E71CE71CE71CE71C8410FA67F95B
      F5472104D67E8410841084104A7D2104000000000000F053F053EA3F001F001F
      00000000BF16BF167F023B023B02000000000000F75EFF7F0002FA6B0002FA6B
      FA6BFA6BEA2B94529C730000FF7F3146000000004A003F4F4A00FF7F5F575F57
      5F575F575F575F575F577215182E00000000E71C3F3F3D023D028410FA678410
      84102104FF7F397F397F397F4A7D21040000000000002104F053F053001F2104
      000000002104BF16BF163B022104000000000000F75EFF7F0002FD770002FA6B
      FA6BFA6BEA2B94529C739C739C733146000000004A007F574A00FF7FFF7BFF7B
      FF7BFF7BFF7BFF7B5F573111593200000000E71C3F3F841084108410FA67F95B
      F547210421042104210421042104210400000000000000002104210421040000
      0000000000002104210421040000000000000000F75EFF7FEA2B0002EA2BFD77
      FD77FD77EA2B94529C730000FF7F3146000000004A00BF5F4A00FF7FFF7BFF7B
      FF7BFF7BFF7BFF7B5F5731117B3A00000000E71C3F3F1F37FF268410FA678410
      841084102603841000000000000000000000000000002104AD356B2D29252104
      000000002104AD356B2D29252104000000000000F75EFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FEA2B94529C739C739C733146000000004A00DF634A00FF7FFF7BFF7B
      FF7BFF7BFF7BFF7B5F57300DEF0400000000E71C3F3F841084108410FF7FFA67
      FA67FA672603841000000000000000000000000000002104D65A31466B2D2104
      000000002104D65A31466B2D2104000000000000BD777B6F7B6F7B6F7B6F7B6F
      7B6F7B6F7B6F7B6F7B6F7B6F7B6F734E000000004A00FF7B4A00FF7FFF7FFF7F
      FF7FFF7FFF7FFF7F3F53300D3F5300000000E71C3F3F1F37FF26841084108410
      841084108410841000000000000000000000000000002104BD77D65AAD352104
      000000002104BD77D65AAD3521040000000000006B2DCE39CE39CE39CE39CE39
      CE39CE39CE39CE39CE39CE39CE396B2D0000000000004A004A004A004A004A00
      4A004A004A004A004A004A004A0000000000E71C3F3F8410841084103D02E71C
      0000000000000000000000000000000000000000000000002104210421040000
      0000000000002104210421040000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E71CFF7B3F3F3F3F3F3F3D02E71C
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E71CE71CE71CE71CE71CE71CE71C
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000907F907F00000000402D
      8062C04100000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      B556CE390000000000000000000000000000004EE020B47F687FE020004E8362
      407F803D00000000000000000000000000000000000000000000000000000000
      00009452AD359452AD359452AD35000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B556B5568410
      B556CE390000CE3900000000000000000000007B007BD77F407F007B03774E73
      202D000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000945294529452945294529452
      94529452945294529452314631468C3100000000B556B5568410B55684108410
      B556CE390000000000000000000000000000B47F8062402940298062007B8062
      8062806280620000B55694522925292500000000000000000000000000000000
      0000DF1E9F0A9F0A9F0A9F0A3D02000000000000FF7F18639C739C739C739C73
      9C739C739C739C739C739C731863EF3D00000000841084108410B5568410B556
      B556CE390000000000000000000000000000407F4029B556B5564029407FA862
      6B5A685A405A0000A514EF3DEF3D292500000000000000000000000000000000
      0000FF7B3F3FFF26FF26FF269F0A000000000000FF7F004C004C00409C73B556
      A5149C739C73E71C10429C739C7331460000000084108410E07FC0187B6F4A29
      B556CE39CE39CE3900000000000000000000AF7F4029B556B55640296B7F645E
      000000000000FF7FFF7FFF7FF75E6B2D00000000000000000000000000000000
      0000FF7B7F533F3FFF26FF269F0A000000000000FF7F4A7D007C004C9C73FF7F
      FF7F9C739C73000010429C739C733146000000007B6F7B6F4A29B5568410BD77
      BD77804DBD770000CE390000000000000000202D0000B556B5560000462D667F
      407F0000EF3DEF3DEF3DEF3DEF3D8C3100000000000000000000000000000000
      0000FF7B7F537F533F3FFF269F0A000000000000FF7FF77E4A7D004C9C73B556
      A5149C739C73000010429C739C7331460000000084108410BD77BD77005C267F
      60666066804D8410BD7700000000000000000000000094529452000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF7FFF7BFF7BFF7B9F5BDF1E000000000000FF7F9C739C739C739C73FF7F
      FF7F9C7300000000000000009C73314600000000BD77002800280028005C0028
      F37F6066804D00280044BD77000000000000000000005A6B5A6B0000F75EF75E
      F75EF75EF75EF75EF75EF75E000000000000000000009452AD359452AD359452
      AD35000000000000000000000000000000000000FF7F6002600200029C73B556
      A5149C7300009C739C7300009C733146000000000000BD7700280028005C0044
      0028267F6066F75E0044004400000000000000000000DE7BDE7B00007B6F0000
      0F000F000F000F000F00F75E6B2D000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7FEA2BE00360029C73FF7F
      FF7F9C739C73000010429C739C73314600000000000000000000BD77005CF75E
      B556267F0821004400440044BD7700000000000000000000000000007B6F0000
      1F425F295F295F290F00F75EAD350000000000000000DF1E9F0A9F0A9F0A9F0A
      3D02000000000000000000000000000000000000FF7FF75FEA2B60029C73B556
      84109C739C73000010429C739C73314600000000000000000000000000000028
      004400440044004400440044004400000000000000000000000000007B6F0000
      FF5E1F425F295F290F00F75EEF3D0000000000000000FF7B3F3FFF26FF26FF26
      9F0A000000000000000000000000000000000000FF7F9C739C739C739C739C73
      9C739C739C739C739C739C739C7331460000000000000000000000000000F75E
      002800440044004400440028BD77BD770000000000000000000000007B6F0000
      FF03FF5E1F425F290F00F75EEF3D0000000000000000FF7B7F533F3FFF26FF26
      9F0A000000000000000000000000000000000000D65AFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FD65A314600000000000000000000000000000000
      002800440028BD77BD770000000000000000000000000000000000007B6F0000
      00000000000000000000F75EEF3D0000000000000000FF7B7F537F533F3FFF26
      9F0A0000000000000000000000000000000000006B2D6B2D6B2D6B2D6B2D6B2D
      6B2D6B2D6B2D6B2D6B2D6B2D6B2D6B2D00000000000000000000000000000000
      F75EBD77000000000000000000000000000000000000000000000000FF7F7B6F
      7B6F7B6F7B6F7B6F7B6F9452AD350000000000000000FF7FFF7BFF7BFF7B9F5B
      DF1E000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000B5560000
      00000000000000000000000000000000000000001042524AB556082194529452
      94529452945294529452314631464A290000000000000000000020672067F37F
      803180312067C018000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B556FF7FB556B5567B6F
      7B6F0000000000000000FF7FFF7F00000000000010420000B5560821FF7F0000
      9C7300009C7300009C7300009C738C31000000000000000000002067C018E67F
      EC7F0821082180310000000000000000000000000000000000001042EF3DCE39
      6B2D4A290821000000000000000000000000B556B556FF7FB556B556FF7FFF7F
      7B6FFF7F7B6FB556B556FF7FFF7FFF7F0000000010421863B5560821FF7F9C73
      9C739C739C739C739C739C739C73EF3D0000000000000000000000000000C018
      EC7FC018000000000000000000000000000000000000EF3D9452F75ED65A9452
      1042EF3D10426B2D00000000000000000000B556FF7FFF7F7B6FB5567B6FB556
      FF7FFF7F7B6FB556B556FF7FFF7FFF7F0000000010420000B5560821FF7F0000
      9C7300009C7300009C7300009C73EF3D00000000000000000000000000000000
      E67F00000000000000000000000000000000000000001863FF7F7B6F5A6B1863
      734EEF3D6B2D524AD65AF75E000000000000000000000821B556FF7FB556B556
      FF7FFF7F7B6FB556B556FF7FFF7FFF7F0000000010421863B5560821FF7F9C73
      9C739C739C739C739C739C739C73EF3D00000000000000000000000000000000
      F37F0000000000000000000000000000000000000000FF7FFF7F7B6F5A6B1863
      734EEF3D6B2D1042D65A0821EF3D31460000000000000821B556FF7FB556B556
      FF7FFF7F7B6FB556FF7FB556FF7F7B6F0000000010420000B5560821FF7F0000
      9C7300009C7300009C7300009C73EF3D00000000000000000000000000000000
      E67F0000000000000000000000000000000000000000FF7FFF7F7B6F5A6B1863
      734EEF3D4A29EF3DD65A082100005A6B0000000031460821B556FF7FFF7FB556
      B556FF7F7B6FB556FF7FFF7FFF7F7B6F0000000010421863B5560821FF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F314600000000000000000000000000000000
      E67F0000000000000000000000000000000000000000FF7FFF7F7B6F5A6B1863
      734EEF3D4A29EF3DD65AC61800005A6B0000000031460821B556B556B556B556
      FF7FFF7FFF7FFF7F7B6F31460000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      E67F0000000000000000000000000000000000000000FF7FFF7F7B6F5A6B1863
      9452EF3D6B2DCE39D65AA5142925FF7F00000000B5560821B556FF7FFF7FB556
      B556FF7F7B6F7B6FFF7FFF7F0000000000000000FA63E803E803E803E803E803
      E803E803E803E803E803E8036603E50200000000000000000000000000000000
      E67F0000000000000000000000000000000000000000FF7FFF7F7B6F5A6B1863
      945210428C3131465A6BDE7B396700000000000000000821B556B5567B6F7B6F
      7B6F7B6FFF7FFF7F7B6F7B6F0000000000000000FA630000F02F0000F02FF02F
      F02F0000F02FF02FF02FF02FF02FE50200000000000000000000000000000000
      F37F0000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FBD771042104200000000000000000000000000007B6F7B6F7B6FFF7F
      B556FF7FFF7F3967FF7FFF7F0000000000000000FC6FF7530000F7530000F753
      0000F7530000F753F753F753F02FE50200000000000000000000000000000000
      EC7F0000000000000000000000000000000000000000FF7F1863E05DE05D804D
      804D8049E05D7B6FB55600000000000000000000000000000000FF7FB5563146
      FF7FFF7F3146FF7F000000000000000000000000FC6FFC6FFC6FFC6FFC6F0000
      FC6FFC6FFC6F0000000000000402E50200000000000000000000000000008031
      F37FC0180000000000000000000000000000000000001863C05D2072A27E817E
      607A206E804D4041D65A0000000000000000000000000000000000000000FF7F
      FF7F000000000000000000000000000000000000FC6FFC6FFC6FFC6FFC6FFC6F
      FC6FFC6FFC6FFC6FFC6FFC6FFC6FF02F00000000000000000000000000002067
      604E803100000000000000000000000000000000000000009C739C739C739C73
      9C739C739C739C73000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000734E1042CE39CE39CE39CE39
      CE39CE39CE39CE39CE39CE39CE394A29000000000000000000000000E07F8031
      80318031E07F0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002067
      2067206700000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      3146000000000000190019000000000000000000000000000000000000000000
      8C3100000000000000000000000000000000000000000000BD77FF7FFF7FBD77
      BD777B6F7B6F7B6FBD7700000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003146
      7B6FCE39000019009F319F31190000000000000000000000000000000000C618
      841084100000000000000000000000000000000000000000BD77FF7FFF7FBD77
      BD777B6F7B6F7B6FBD7700000000000000000000000000000000000000000000
      FF7FF75EF75E0000000000000000000000000000000000000000000031467B6F
      7B6F39674A2900009F319F310000000000000000000000001318131813181100
      13184208420800000000000000000000000000000000000039673967FF7FBD77
      BD777B6F7B6FF75E3967000000000000000000000000000000000000FF7FFF7F
      FF7FF75EF75EF75E0000000000000000000000000000000000008C31C618C600
      C6188C31734E84109F319F310000000000000000000013181318131813181100
      FF6780004208420800000000000000000000000000000000BD77BD77FF7FBD77
      BD777B6F7B6FBD77FF7F0000000000000000000000000000FF7FFF7FFF7FFF7F
      F75E00000000F75E9452000000000000000000000000000084102C4F267F2C7F
      267F6666C61884109F319F310000000000000000131813181100131811003F67
      3F678000841084108C3100000000000000000000000000000000BD77FF7FBD77
      BD777B6F7B6FBD77000000000000000000000000F75EFF7FFF7FFF7FF75E0000
      0000007CEF3D00009452314600000000000000000000CE396C66667E267F267F
      2C7F2C7F2667C0189F319F31000000000000000013181300FF6713183F673F67
      3F67420884108410734E31460000000000000000000000000000BD77FF7FFF7F
      BD777B6F7B6FFF7F000000000000000000000000F75EFF7FFF7F00000000007C
      007C007C007CEF3D0000314631460000000000003146CE3926676C666C660821
      8410C6308031C0189F319F3131460000000000001100110013183F673F673F7F
      BD77420884108410734E396731460000000000000000000000000000BD77FF7F
      BD777B6FBD770000000000000000000000000000F75E00000000007C007C007C
      007C007C007C007CEF3D00003146CE39000000003967CE3966666C664208CE39
      FF7FCE390008C0189F319F317B6F734E0000000013181100110013183F673F67
      7B6F841084108410734E7B6F7B6F3146000000000000000000000000BD77FF7F
      BD777B6FFF7F00000000000000000000000000000000007C007C007C007C007C
      007C007C007C007C007CEF3D0000CE390000000000007B6F8C4D6C7E00183146
      FF7F734E4208C0189F319F31F96700000000000011001318131813183F7F3F67
      3F7F420884108410734E39673967000000000000000000000000000000001F00
      1F00170000000000000000000000000000000000107E4A7D847C007C007C007C
      007C007C007C007C007C007CEF3D00000000000000000000C6186C666C66C618
      8410C6308631C0189F319F31000000000000000013181318130013183F7F3F67
      7B6F841084108410734E396700000000000000000000000000000000D900D900
      D900D9001F0000000000000000000000000000000000107E4A7D847C007C007C
      007C007C007C007C007C007C007CEF3D0000000000000000000084108C4D6C66
      6C6626678031C0189F319F3100000000000000001318131813183F673F673F7F
      3F7F420884100821B55600000000000000000000000000000000D90099197F1A
      7F1A9919D900170000000000000000000000000000000000107E4A7D847C007C
      007C007C007C007C007C007C007C007C0000000000000000000000007B6F0200
      8410C018C01800009F319F31000000000000000011001300131811003F7F3F67
      BD77C6180821B556000000000000000000000000000000000000D9007F1A3F4F
      3F337F1AD9001F00000000000000000000000000000000000000107E4A7D847C
      007C007C007C007C007C007C007C000000000000000000000000000000003967
      F75EF75E314600009F319F31000000000000000013181100131811003F673F7F
      734E734EF75E000000000000000000000000000000000000000000003F33FF67
      3F4F7F1AD90000000000000000000000000000000000000000000000107E4A7D
      847C007C007C007C007C00000000000000000000000000000000000000000000
      F75EF75E000000009F319F310000000000000000131813001318130013180000
      3967396700000000000000000000000000000000000000000000000099197F1A
      7F1A9919D900000000000000000000000000000000000000000000000000107E
      4A7D847C007C0000000000000000000000000000000000000000000000000000
      0000000000000000190019000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000212C424C
      00600054004400280000000000000000000000000000DF181F00000000000000
      1F000000DF181F00DF183F670000000000000000000000000000000000000000
      3146000000000000000000000000000000000000000000000000000000000000
      3146000000000000000000000000000000000000000000000000212C00600058
      006000600054004C0030000000000000000000000000DF18DF1800000000CE39
      1D0031461B0000001F003F670000000000000000000000000000000000003146
      3967314600000000000000000000000000000000000000000000000000003146
      3967314600000000000000000000000000000000000000000030006C0068006C
      0058006000600054004C000000000000000000000000000000001500D3188C31
      1B004A29CC18000000007F4E0000000000000000000000000000000031463967
      3967396773320000000000000000000000000000000000000000000031463146
      3146396773320000000000000000000000000000000000000060637C007C0070
      007C0070006000600054004400000000000000000000000000008410C618C618
      C618C618C6184208000000000000000000000000000000000000314639673967
      396739673967CE390000000000000000000000000000000000003146734E3146
      CE39734E3967314600000000000000000000000000000020217C637C397F847C
      427CA57C0070006000540044000000000000000000000000793293199319CC18
      CC00CC008C19D3188C0102000000000000000000000000003146F75EF75EF75E
      B556F75EF75E3967CE3900000000000000000000000000003146734ECE39CE39
      CE393146734E396731460000000000000000000000000058C67C9C7F317E317E
      A57C297D007C0070006000440000000000000000000008213F4F791A791A7932
      791A791A791A731A9319C6180008000000000000000031463146314631463146
      314631463146F75E39673146000000000000000000003146734ECE390000CE39
      CE3931463146734E39673146000000000000000000000060CE7DFF7FB57E7B7F
      737ECE7D4A7D217C0060003C0000000000000000CE394A293F4F791A7F32791A
      7F327932791A7F1A931906180821000000000000314600000000000000000000
      00003146CE39B5563967396731460000000000003146734E31460000FF7F0000
      CE39CE39CE39314631463146314600000000000000000034A57CFF7FFF7F8C7D
      CE7DCE7DCE7D007C0058003C0000000000000000734EC6183F4F3933791A7932
      391B7F1A791A793293190000CE39CE3900000000000031463146082184103146
      CE390000CE39734E396739673967314600000000396739670000FF7FFF7FFF7F
      0000CE39CE39CE39CE39734E3967314600000000000000000048107EFF7F107E
      107E637CCE7D0070004000000000000000000000791A8C01793279327932791A
      79323F333F33394F7932C600F75E00000000000000004A293146082184103146
      CE390000CE39734E39673967396700000000000000000000FF7F007CFF7FFF7F
      FF7F0000CE39CE39734E396739670000000000000000000000000000107E187F
      0000007000480000000000000000000000000000393379028C313F4F7F1A7932
      3F330000000000000000396700000000000000000000F75E3146E07F8410BD77
      31464A29CE393146F75E396700000000000000000000FF7FFF7F007CFF7FFF7F
      FF7FFF7F00000000B55639670000000000000000000000000000000000000000
      00000000000000000000000000004002000000003F3379029F0142083F337932
      02007902930100004A29000000000000000000000000F75EE07FFF7F4A294A29
      BD774A29CE39B5563967000000000000000000000000FF7FFF7FC67CC67C0000
      0000337F337F0000B55600000000000000000000000000000002000000000000
      00000000000000000002000240020003000000003F3399019919790299017902
      7F0299018C19000000000000000000000000000000008410314600007B6F0000
      E07F4A293146F75E000000000000000000000000000000008C7DFF7F007CFF7F
      00000000337F0000000000000000000000000000000000000000A00240020002
      00020002000200020002A0020003000000000000393379029901791A791A7F1A
      791A791A791A000000000000000000000000000000003146E07F000000008410
      BD770000734E0000000000000000000000000000000000000000FF7FFF7FFF7F
      0000000000000000000000000000000000000000000000000000000000034002
      00000000000000000000A00200000000000000003F33791A9901791A791A0000
      000000000000000000000000000000000000000000007B6F7B6FFF7FFF7FBD77
      F75E0000000000000000000000000000000000000000000000000000FF7F0000
      3967396700000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003F333F333F3300000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000603200000000000000000000000000000000000000000000000021042104
      C6182104210400006B2D10421042104210420000000000000000000000000000
      0000000000000000000000000000000000000000000000003F3300007F1A7F1A
      7F1A7F1A99010000990100000000000000000000000000000000000000000000
      26376032000000000000000000000000000000000000000000000000DA7FDA7F
      0000517F0A7F0000AD3510420000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000003F3300007F1A7F1A
      7F1A7F1A7F1A0000990100000000000000000000000000000000000000002637
      E63360320000000000000000000000000000000000000000000000000000A055
      4208404100000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000003F333F337F1A0000
      000000009901990199010000000000000000000000000000000000002637E633
      E63360320000734E734E0000000000000000000000000000000000000000A055
      8049804900000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003F3300002C7F
      2C7F8665000099010000000000000000000000000000000000000000E633E633
      E633603200003967734E00000000000000000000000000000000DA7F8410F053
      EA3F801AA514517F000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000E633E633
      0000603200003967734E00000000000000000000000000000000F053F053F053
      0000001F001F2016000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000F37F2C7F
      2C7F2C7F606600000000000000000000000000000000000000000000E633E633
      0000603200003967734E000000000000000000000000000000000000F0530000
      A0160000C0110000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F37F2C7F0000
      000000002C7F60660000000000000000000000000000000000000000E633E633
      E633603200003967734E00000000000000000000000000000000000021044012
      D17EC01121040000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F37F2C7F2C7F
      2C7F2C7F2C7F60660000000000000000000000000000000000000000E633E633
      2637603200003967734E00000000000000000000000000000000000000002104
      2104210400000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F37F2C7F0000
      2C7F00002C7F60660000000000000000000000000000000000000000E6332637
      2637603200003967734E0000000000000000000000000000000000002104D17E
      D17ED17E21040000000000000000000000000000000000000000000021040000
      0000000021040000000000000000000000000000000000000000F37F2C7F0000
      2C7F00002C7F6066000000000000000000000000000000000000000026372637
      6032000039673967734E00000000000000000000000000000000000021040000
      D17E000021040000000000000000000000000000000000000000000021040000
      00000000210400000000000000000000000000000000000000000000F37F2C7F
      2C7F2C7F2C7F0000000000000000000000000000000000000000000026376032
      000039673967734E734E00000000000000000000000000000000000021049A7F
      9A7FD17E21040000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F37F
      2C7F2C7F00000000000000000000000000000000000000000000000060320000
      734E734E734E734E8C3100000000000000000000000000000000000000002104
      2104210400000000000000000000000000000000000000000000000000000000
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
      267F606600000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000607E207F
      607E607E867D0000000000000000000000000000000000000000000000000000
      267F6066000000000000000000000000000000000000000000000000F37F2C7F
      2C7F2C7F2C7F2C7F666600000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000867D867D
      867D867D867D0000000000000000000000000000000000000000000000000000
      804D804D00000000000000000000000000000000000000000000F37FF37F2C7F
      2C7F2C7F2C7F2C7F2C7F66660000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000F37FF37F2C7F2C7F
      2C7F2C7F2C7F2C7F2C7F666600000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F3967000000000000000000000000607E207F607E
      607E607E607E867D0000000000000000000000000000267F267F606660666066
      606660666066804D804D804D804D00000000000000000000F37F2C7F2C7F2C7F
      2C7F2C7F2C7F2C7F2C7F666600000000000000000000FF7FFF7F39673967734E
      734E734E734E39673967FF7F3967000000000000000000000000607E207F607E
      607E607E867D867D0000000000000000000000000000267F0000000000000000
      000000006066606660666066804D00000000000000000000F37F2C7F2C7F2C7F
      2C7F2C7F2C7F2C7F2C7F66660000000000000000000039673967734E734E0000
      000000000000734E734E39673967000000000000000000000000000000000000
      00000000000000000000000000000000000000000000267F6066606660666066
      606660666066606660666066804D00000000000000000000F37F00002C7F2C7F
      00002C7F00002C7F0000666600000000000000000000734E734E00000000FF7F
      FF7FFF7FFF7F00000000734E734E0000000000000000000000000000E67F0000
      E67F0000207F00000000000000000000000000000000267F0000000000000000
      000060666066606660666066804D00000000000000000000F37F00002C7F2C7F
      00002C7F00006666000000000000000000000000000000000000FF7FFF7FFF7F
      007C007CFF7FFF7FFF7F00000000000000000000000000000000E67F0000E67F
      0000E67F0000207F0000000000000000000000000000267F6066606660666066
      606660666066606660666066804D00000000000000000000000000002C7F2C7F
      00006666000000000000000000000000000000000000FF7FFF7FFF7FFF7F007C
      007C007C007CFF7FFF7FFF7F3967000000000000000000000000E67FE67F0000
      E67F0000E67F207F0000000000000000000000000000267F0000000000006066
      606660666066606660666066804D00000000000000000000000000002C7F2C7F
      00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F39673967000000000000000000000000E67FE67FE67F
      E67FE67FFF7F207F0000000000000000000000000000267F267F606660666066
      606660666066606660666066804D00000000000000000000000000002C7FFF7F
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000E67FE67F
      E67FFF7F207F0000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000002C7FFF7F
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E67F
      E67F207F00000000000000000000000000000000000000000000000000000000
      267F606600000000000000000000000000000000000000000000000066666666
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
      00000000000000000000000000000000000000000000F37FF37FF37FF37FF37F
      F37F0000CC7C0000F37FF37F267F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000003967396739673967
      3967396739673967396700000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F37FF37FF37FF37FF37F
      F37F0000737E0000F37FF37F267F000000000000000000000000797E997D0000
      E67F267F0000997D137C00000000000000000000000000003967FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000EC7F60660000
      000000006066804D000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000797E997D997D0000
      E67F267F0000997D137C137C000000000000000000000000396700000000FF7F
      00000000FF7F0000FF7F00000000000000000000000000000000606660666066
      606660666066804D00000000000000000000000000000000F37FF37FF37FF37F
      F37FF37FF37FF37FF37FF37F000000000000000000000000797E997D997D0000
      E67F267F0000997D997D137C0000000000000000000000003967FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000EC7F00000000
      000000000000804D00000000000000000000000000000000F37F000000000000
      00000000000000000000F37F000000000000000000000000797E997D997D0000
      267F267F0000997D997D137C0000000000000000000000003967FF7F00000000
      0000FF7FFF7FFF7FFF7F00000000000000000000000000000000EC7F0000FF7F
      FF7F39670000804D00000000000000000000000000000000F37F000039673967
      39673967396739670000F37F000000000000000000000000797E997D997D0000
      E67F267F0000997D997D137C0000000000000000000000003967FF7F0000E67F
      E67F0000FF7FFF7FFF7F00000000000000000000000000000000EC7F0000FF7F
      FF7F39670000804D00000000000000000000000000000000F37F00003967FF7F
      FF7FFF7F000039670000F37F000000000000000000000000797E997D997D0000
      267F267F0000997D997D137C0000000000000000000000003967FF7F0000E67F
      000086650000FF7FFF7F0000000000000000000000009F7D067C606600000000
      000000000000804D067C0664000000000000000000000000F37F00003967FF7F
      FF7FFF7FFF7F39670000F37F000000000000000000000000797E997D997D0000
      E67F267F0000997D137C137C0000000000000000000000003967FF7FFF7F0000
      8665866586650000FF7F00000000000000000000000000009F7D067C067C067C
      067C067C067C067C06640000000000000000000000000000F37F00003967FF7F
      FF7FFF7F000039670000F37F0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000003967FF7FFF7FFF7F
      00008665866586650000000000000000000000000000000000009F7D067CE67F
      E67FE67F067C066400000000000000000000000000000000F37F000039673967
      39673967396739670000F37F000000000000000000000000000000000000E07F
      00000000267F0000000000000000000000000000000000003967396739673967
      396700008665866586650000000000000000000000000000000000009F7D067C
      E67F067C0664000000000000000000000000000000000000F37F000000000000
      00000000000000000000F37F00000000000000000000000000000000E07F0000
      000000000000267F000000000000000000000000000000000000000000000000
      0000000000008665866586650000000000000000000000000000000000009F7D
      067C06640000000000000000000000000000000000000000F37FF37FF37FF37F
      F37FF37FF37FF37FF37FF37F0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000866500000000000000000000000000000000000000000000
      0664000000000000000000000000000000000000000000000000000000000000
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
      000033673367000000000000000000000000000000000000604E604E604E2667
      2667266726672667F37FF37F0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      6C4E3367000000000000000000000000000000000000207F0000000000000000
      00000000000000000000F37F000000000000000000000000734E734E734E0000
      000000000000734E734E8C3100000000000000000000000000000000C07DC07E
      C07DC07D80590000000000000000000000000000000000000000000000000000
      6C4E3367000000000000000000000000000000000000207F0000601A601A601A
      601A601A601A601A00002667000000000000000000000000000000000000FE4B
      FE4B7F037F03000000000000000000000000000000000000C07DC07DC07EC07E
      C07DC07DC07D8059805900000000000000000000000000006C4E6C4E33673367
      3367336733673367F367F36700000000000000000000E07F0000263726372637
      263726372637601A0000266700000000000000000000396739670000FE4BFE4B
      000000007F037F0300003967734E00000000000000000000C07DC07EC07EC07D
      C07DC07DC07DC07D80590000000000000000000000006C4E6C4E336733673367
      33673367336733673367F367F3670000000000000000E07F0000263726372637
      263726372637601A0000266700000000000000000000396739670000FE4B0000
      5F0EF30100007F0300003967734E0000000000000000C07DC07D000000000000
      000000000000805980598059000000000000000000006C4E3367000000000000
      000000000000000000003367F3670000000000000000E07F0000263726372637
      263726372637601A0000266700000000000000000000396739670000FE4B0000
      3F2FF3010000FE4B00003967734E0000000000000000C07D00005F015F015F01
      5F015F015F01000000008059000000000000000000006C4E3367336733673367
      336733673367336733673367F3670000000000000000E07F0000263726372637
      263726372637601A0000266700000000000000000000396739670000FE4BFE4B
      00000000FE4BFE4B00003967734E000000000000000000005F015F0160766076
      60765F015F015F015F010000000000000000000000006C4E3367000000000000
      336700000000000000003367F3670000000000000000E07F0000263726372637
      263726372637601A00002667000000000000000000000000000000000000FE4B
      FE4BFE4BFE4B000000000000000000000000000000009F0B5F015F0160765F01
      5F0A5F0A5F015F015F015F01000000000000000000006C4E3367336733673367
      336733673367336733673367F3670000000000000000E07F0000EC6700000000
      000000000000601A00002667000000000000000000000000734E734E734E0000
      000000000000734E734E8C31000000000000000000009F0B5F015F0160765F0A
      FF7F5F0A5F015F0AFF7F5F01000000000000000000006C4E3367000000000000
      00000000000033670000F367F3670000000000000000E07F000026370000FF7F
      FF7FFF7F0000601A0000604E0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000009F0B5F015F016076
      5F0A5F015F0AFF7F5F0100000000000000000000000000006C4E336733673367
      33673367336733673367F36700000000000000000000E07F0000EC6700000000
      000000000000601A0000604E00000000000000000000000000000000E07BE07B
      0000000000000000000000000000000000000000000000009F0B9F0B5F016076
      5F015F01FF7F5F015F0100000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000207F0000EC67EC672637
      263726372637601A000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000009F0B5F01
      5F015F015F010000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000900700000100010000000000803C00000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000803FE795FFFF0000803EFFBFFFFF0000
      9F3CE780FFFF00009F38E780FFFF00009C11E380FFFF00009803F980FFE70000
      90079980C1F3000080138180C3FB0000801BC380C7FB0000801BFF80CBFB0000
      801BFB80DCF30000E013F980FF070000F3E7C080FFFF0000F9CFF980FFFF0000
      FC1FFB80FFFF0000FFFFFFFFFFFF0000DFFCEFFFFC7CF8F88FFEC7FFFC7CF8F8
      07FB83FFFC38F87083F9C1FFFC00F800C00CE007FC008000E007F003FC008000
      F003F80180008000F001F80080008001F001F80080098003F001F80080098003
      F001F80080098003F001F800800F8007F803FC01800F8007FC07FE03800F8007
      FE0FFF07C7FF8007FFFFFFFFFFFFFFFFFFFFFFFF8000FF80FFFFFFFF8000FB80
      FFFFFFFF8000F980FFFFFFFF80188080000F000F801EF98000071007801FFB80
      00030803801DFF80000B040B8019E080000B020B8010E080000B010B802080FF
      00030083806080FF0007000780F180FF000F000F81FB81FF000F000FFFFF83FF
      000F000FFFFF87FF000F000FFFFFFFFFFFE0FFE0DCCCFFFFFFE0FFE08199FFFF
      FE00FE00A333FFFFFE00FE00E066FFFFC0000000C84CFFFFC00307839819FFE7
      C0030003B013C1F3C0030103E606C3FBC0030103CC04C7FBC00F010F9989CBFB
      C00F010FB31DDCF3C00F010FE66EFF07C00F112FCCC7FFFFC00F19AF999BFFFF
      FFFF000FFFFFFFFFFFFF000FFFFFFFFFC0FBC47BFFFFFFFFCEF1CE71FF2184FF
      E7F1E0F1FFEFBFFFF3E0E4E080F7DF80F9E0F1E0FFFBEFFFDCFBF1FBFFE187FF
      C0FBFBFBFFFFFFFFFFFBFFFBFFFFFFFFC47BC0FBFFFFFFFFCE7BCEFBFF2184FF
      E0FBE7FBFFEDB7FFE4FBF3FB80E18780F1FBF9FBFFFDF7FFF1FBDCFBFFE187FF
      FBFBC0FBFFFFFFFFFFFFFFFFFFFFFFFFF83FFF03F80FF780E00FFC00F007E380
      C007FC00F007C1808003F800F007F78080038000F007F78000018000F007C180
      00018000F007E38000018000F007F78000018000F007DD8000018000F007DD80
      80038000F007DD8080038003E003C180C0078003E003DD80E00F8003F007DD80
      F83F8003FE3FE380FFFFFFFFFFFFFF80FFFFFF80FFFF8208FC01FF80FC0F82A8
      FC01FF80FC0FBAA9FC01F000800092AB8001F000E00182088001F000F807FFFF
      8001F000FE1F820880018007FF3F92EA800180078000B20B800F8007800092EA
      800F800780008208800F80078000E000800F80FFFFFF8000800F80FF8000FFFF
      FFFFFFFFFFFF0000FFFFFFFFFFFF0000FFFFFFFFFF80FC00C001FC01FF80FC00
      C001FC01FF80FC00C001FC01F000FFFFC0018001F000FFFCC0018001F000FFF8
      C0018001F0008070C00180018007807CC00180018007807CC001800F80078078
      C001800F80078040C001800F80078041D041800F80FF807FC001800F80FF80FF
      FFFFFFFFFFFF81FFFFFFFFFFFFFFFFFF80008000FFFF800080008000C0018000
      80008000C001800080008000C001800080008000C001800080008000C0018000
      80008000D001800080008000C001800080008000C001800080008000C0018000
      80008000C001800080008000C001800080008000D001800080008000C0018000
      FFFF8000FFFF8000FFFFFFFFFFFFFFFFFE208000F000FFFFFC208000E000C007
      FC10C000C000C007F84880008000C007F83180008000C006F01280008000C005
      F00380008000C003F8068000C000C0077802C000E000C0077C01C000FC00C003
      3E03C000FF00C00F1F0EE000FFC3C0070FBCF000FFFFC00703F0F800FFFFC007
      0000FE23FFFFFFFF0000FFFFFFFFFFFFFFFFC000FFFF8000FF80C000F3CF8000
      C000C000E00780008000E000C00380008000E000C00380008000F000C0038000
      8000F000C003C00080008000E007C000800000008001E000800000000000E000
      800000000000C000800000008001E00080008000C003F8018000C000F00FFF07
      E03FF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFC001FFFF80008000C00180078000
      8000C001800780008000C001BFD780008000C001A48780008000C001BFC78000
      8000C001A48380008000C001BFCB80008000C001800180008000C00180058000
      8000C001800080008000C001FFF080008000C001FFF880008000C001FFF88000
      FFFFC001FFFCFFFFFFFFFFFFFFFFFFFFFFFFC000FFFF8000FFFF8000FFFF8000
      F007000080038000F007000080038000FFFF000080038000FC1F0000FFFF8000
      F88F0000FFFF8000FBCF000080038000FF1F0000FFFF8000FC1F0000FFFF8000
      F8FF80008C638000F9CFC000FFFF8000F88FE000FFFF8000FC1FF001AAAB7FFF
      FFFFF803FFFF0000FFFFFFFFFFFF0000FC1FFFFFFFFFFFFFF007FFFFFFFFF9FF
      E003FFFFF007F0FFC001E223FFFFE0FFC001FFFFF007C07F8000F9CFFFFF863F
      8000F88FF83FCF3F8000F087F99FFF9F8000F227F9CFFFCF8000F227F9CFFFE7
      C001E773F9CFA9C3C001E7F3F99FAAB9E003E7F3F83F89BDF007FFFFFFFFAABF
      FC1FFFFFFFFFD9CFFFFFFFFFFFFFFFFF8FFCFFFFFFFFFFFF8C00FFFF9FFFFFFF
      8DFCEDB78003E7FFFDFEB6DB8000E1FFFDFEDFFD8000F0FFC1FEEC178000F07F
      DDFEB99B9000F83FDDFED99DF000FC17DDFEEC97F0008607DC00BE1BF0008F07
      DFDFDB9DF0018F83DFDFEC37F80FA7018FDCB7FBFC1FF3E1801CDB6DFFFFFBF1
      8FFCEDB7FFFFFFFFFFFFFFFFFFFFFFFFFF7F9F26E1FFF1F8FFBF8020E180F000
      FF0FE0F0E1FFF1F8FE079130E1FFFBFDFC039B20E3FF1BFDFC03FFE6FFFF03FD
      FC03FFFF92481BFDFC008000FFFFBBFDE000BFFFA1FEB1F8C000A021A182B000
      C000B061E1FFB1B8C000B8E1A1FEBFBFE000BDE1A3FE1F1FFFFFBFFFFFFF001F
      FFFF800092481F1FFFFFFFFFFFFFFFFFFFFF8001FFFFFCFFC0018000C003FCE7
      803180008603F081803180008603C0FF80318000860380008001800080030000
      8001800080038000800180018003C0008FF180018003E0008FF1F00F8003E000
      8FF1F80F8003F0008FF1F04F9003F0008FF1E0EFB003F8038FF5F1FFE3C3F80F
      8001FBFFC7FFFC1FFFFFFFFFEFFFFE7FFFFFFFFFC0008000FF0F8000C0008000
      800F8000C000800000078000C000800010078000C00080000003FFFFC0008000
      8803B6DBC00080009401FFFFC0008000C8018000C0008000D4008000C0008000
      EA008000C0008000E50F8000C0008000F27F8000C0008000F57F8000C0008000
      F8FFFFFFFFFFC000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0FFF302008020FC40
      FFC302F9CFA0F000FF0382E7F3A0E000FC03829FFCA0C000F003C27FFF21C000
      E003C3FFFFE18001FFFFE3FFFFE38001FFFFE3FDDFE38001E003F3DDDDE7C001
      F3FBF39BECE7C003FCFBFB07F06FE003FF3BFF9FFCFFF007FFCBFFDFFDFFF80F
      FFF3FFFFFFFFFE1FFFFFFFFFFFFFFFFFFF00FE3FC000FFFFFF00821FC000FFFF
      FB00000FE0008181F1008007C000BD81E000C003C000DD83C0008003E000DD83
      80008003C000ED8700008003C000ED878007C003E000F58FC007C003C000F58F
      E00F8001C000F99FE07F0001E000F99FE8FF03C0C049FDBFEDFF0FE0F07FFFFF
      F3FF9FF8F03FFFFFFFFFFFFFFFFFFFFFFC008003FE67FF870000C001E027FFFF
      0000FFFFC027F3FFFC070003FE62E1FF00000001FEE0C0FF0000FFFFFFE7807E
      006432AFF7E7C060004A57FFE0C780F8004A53FFC8EF8081004A57FFCCFEC1FB
      006433FFE4E0E3FF0000FFFFF8C0F7FFFC7F0001D1FEFFFF00000001E3FEFFFF
      0000FFFFFFFFFFFF0000FFFFFFFFFFFFFF80FC008003FF80FFC00000C001FFC0
      FFFF0000FFFFFFFFD800FC200003F800EC0000130001FC00EFFF0010FFFFFFFF
      8D4B00624BABFD4B8D5B00725BBFFD5BFCCA0003CABFFCCA8D590062593FFD59
      8CCB0073CBBFFCCBFFFF0000FFFFFFFF8000FC0000018000C000003F0000C000
      FFFF0000FFFFFFFFFFFF0000FFFFFFFFFFFF8000FFC0FFFFFFFF8000FFC0F801
      FFFF8000FFFFFFFFFFFF8000DC00FF01FFFF8000EC00FFFFE7FF8000EFFFFF01
      CF8380008D4BFFFFDFC380008D5BF801DFE38000FCCAFFFFDFD380008D59F801
      CF3B80008CCBFFFFE0FF8000FFFFC801FFFF80008000FFFFFFFF80008000C001
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC00FC00FC07FC07F800F800FC01FC01
      F800F800FC010001F8000000FC000000FF000000FC000000FE000000FFF00000
      FC000000FFFC0000F8000000F7FC0000F0000000E7F00000E0000000C0000000
      E000000080000000F800000000010001FC01000080030003FC030000C0070003
      FE070000E7FF0003FFFF0000F7FF0003FFFFFFFFFFFF8000FFFFFFFF80008000
      FFFFFFFF80008000FFFFFFFF800080C0881C081C80008000DD6B9C6B800080C0
      8000DD6B80008000EB1BC11B800080C0E36BEB6B80008000F76BEA1C800080C0
      F61CE3FF80008000FFFFF7FF800080C0FFFFFFFF80008000FFFFFFFF80008000
      FFFFFFFFFFFF8000FFFFFFFFFFFFFFFF803F8000FFFFFFFF803F8000FFFBFFFB
      9B3F8000FFF7000091008000FE6F000091008000FD9F00008000E000FD5F3FE0
      8000E000FD2F3FF8E400E000FA0F0000E000FFFFF41F0000F000FFF8C8FF0000
      FC00FFF891FF0000FC00E0008BFF0000FC01E000C3FF0000FC03E000E7FF0000
      FC07FFF8FFFF0000FFFFFFF8FFFF0000E000C001FFFFFFFFC0008000FF03FFF1
      C0008000EE018031C0008000E6008031C00080000200803FC0008000E654803B
      E000C000EE048031F000E000FF018031F800F000C1038731F801F003C1818031
      FC01F80301C18571FC00F80101FF80F1FE00FC0101FF81F1FFFFFFFF03FFFFFB
      FFFFFFFF07FFFFFFFFFFFFFF0FFFFFFF8000FE00800080008000C00080008000
      800080008000800080008000800080008000800080008000800080008000E000
      800080018000E000800080018000F000800080018000F000800080018000F000
      800080018000F000800080018000F0008000C003C000F0007FFFFC3FFC0FF000
      0000FFFFFC0FFFFF0000FFFFFFFFFFFFFFFF800080008000FFFF800080008000
      C007000000008000DFFB000000008000DFFD000000008000DFFD000000008000
      DFFD000000008000DFE3000000008000DFDF000000008000EFDF800080008000
      F7DF800080008000FBEFC000C0008000FC07C000C0008000FFFFE000E0007FFF
      FFFFF800F8000000FFFFFE03FE030000CF03FFFFFFFFFFFFC023FFFFFF871FF8
      E0238782FF030000E463CFC4FE011FF8F070E78E8001BFF7F0E1E00EC001BFEF
      F881F31EE000BF1FF980F11EF0001F1FFF9CF83EF8001F1FFF00F83EFD001FEF
      FE89FC7CFF00EFF7FE08FC7EFF00F1F8FE01FE00FF00F000FF37FFFFFF00F1F8
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE03FE03FE03FFCCFC03FC03FC03C0CC
      FE07FFFFFFFFBEE4FE03FFFF0007BEF0FC03FFFF0007C0CCFC01F8FD0005FEE1
      F801F8FD0005C1FFF801F8FD0005FFE5F801C01D0005FFD9FC03C01F000788DD
      FC07C01F0007DDE0FE07F8FF0007E3FEFE0FF8FF0007EBEEFF1FF8FF0007EBF1
      FFFFFFFF0007F7FFFFFFFFFF0007E7FFC000FFFFFFFFE000C000FFEFFFFFF000
      8000FFC7FE3FC0008001FF8FFC1FC0008001FF1FF80F80008001FE3FF0074000
      8000FC7FE0038000C000F8FFC0014000C000E1FFE0010000C000C3FFF0030000
      C000C3FFFC010000E000C7FFFE000000E000CFFFFF100000E000DFFFFFF80000
      E000DFFFFFFC0000FFFFFFFFFFFF0000FFFFFFEBF5FFF000FAABFFE9E5FFF000
      FBFFFFE8C5FF8000F1FBFFE885FF8000FBFFFFE8C5FF8000FFFB80E9E407801F
      E06080EBF407801F800080FFFC07801F800080FFFC07801F808080FFFC07801F
      808080FFFC07800080808007FC00800080808007FC0080008080F007FF80F000
      8080F007FF80F000FFFFFFFFFFFFFFFF8000FFFF9FFFFF00BDB6FE7F19FFFF00
      9B6CFC3F81FFF800AFDAFC3CC7FFF800B6B6FE38C300E80FBB4EF3781900E00F
      BCFEE1FC3800600FBFFEC0E6F800200FBFE681C3F80F800FBFDA8383F80F000F
      BFDA8303F80F83FFBFE68607F80F81FFBFFECE07F80F27FF8000FE0FF80F667F
      FFFFFF1FFFFFE7FFFFFFFFFFFFFFFFFF8000FFFFFC1FFFFF8000F81FF007FFFF
      8000E007E003FC3F8000C003C00180018000C003C00180018000800180008001
      8000800180008201800080018000810180008001800080018000800180008001
      80008001C00180018000C003C001C8138000C003E003FC3F8000E007F007FFFF
      8000F81FFC1FFFFFFFFFFFFFFFFFFFFF8000FFFF8007FF01800083E08007FF01
      800083E08007FF01C00083E08000FF01E00083608000E001E000EE3B8000EF01
      E000EC1B80008801E000E00380008F01E000FC1FFC008801E000FE3FEC008FBF
      E000FF7FC40088BEE000FC1FEC008FBCE000FC1FEC01803EE000FC1FE40380EE
      F800FC1FFFFF80F1FFFFFFFFFFFFFFFFF000FFFFFFFFFF00E100C0038001FF00
      C00086038000E000810086038000C000C000860380008D008100800380008D00
      C0008003800080008000800380008000C0018003800080018003800380018003
      C007800380018007F00F801F80038007FC5F8017C1FF8007FF3F8187FFFF800F
      FFFFFFC7FFFFFFFFFFFFFF87FFFFFFFFFF03FF03FF03C000FC00FC00FC00C000
      FC00FC00FC00C000F800F800F800C000800000000000C000800000000000C000
      800000000000C000800000000000C001800000000000C082800000000000F8C0
      800000000000FFE0800300030003FFF0800300030003FFE0800300030003FFC0
      800300030003FFFFFFFF000F000FFFFFF80F9FFFCFF1FFFFF80FEFFFF000FFFF
      F80FDC018000AAAAF80F8FFF8000FFFFF80FFFFFC000BF7EF80F8FFF8000FFFF
      8009DFFFC000AAAA8009EC01A000FFFF800F9FFF80E0BF7E80F9FFFFC0E1FFFF
      80F88FFF6303800080FEDFFF71FFA22280E69C0178FF800080E0DFFF3C3CFFFF
      80F0FFFF1E00FFFFFFFFFFFF8FE0FFFFF801FE00D004FFFFF801FE00AA2AE001
      F801FE00C406E001F801F800EAAAE001F801E600FFC1E001F801FE00FDEAE001
      B001FE00FFD4E001B001FE00F5EAE001E001FE00BB30E0018203FE0155EAE001
      8007FC03BFDCE001C00FF9F36AEFE001927FF7F7B5DFF001B33FFFFFD9EFF801
      F3FFFFFFFFB5FC01FFFFFFFFDD5EFFFFFFFDFFFFF7FFFFFFFFFDFBFFF3FFFFFF
      FFF0F992C1FFFFFFFFFD8092B3FF880F8005F9FFB700DDB78007FBFFBFFFC1B7
      8007FFFFBFC0EB8F8007E0FFBFFFE3B78003E0FFBFC0F7B4C00380FFBFFFF70E
      C00380FFBFC0FFFEC00380FFBFFFFFFCC00381FFBF00FFFED24B83FFBFFFFFFF
      C00387FFC1FFFFFFFFFFFFFFFFFFFFFFFC01800181FFFE00FC01843281FF0200
      FC01843081FF0200FC01843081FF0200FC00800081FFFE00FC00800081FF001F
      F800810081A00010F000C300FF200010E000C710FE000010C000C513FF20001F
      C060C00F81BFFE00C070C01081FF0200C070C21381FF0200E1F0C71081FF0200
      F1F1CF90FFFFFE00FFFFFFFFFFFF0000800080008000F8C1C000C000C000F8E3
      C000FFFCFFFCF8E3C000FFFC0004FC23C000FFFC0004FE03C000FFFC0004FFC3
      C000FFFC0004F8E3E000FFFC0004F8E3E010C00C0004F807E0F8C00C0004FE0F
      C3FCC00C0004FFFF87FFFFFF0007FFFF07FFFFFF0007FFFF0FFFFFFF0007FFFF
      1FFFFFFF0007FFFFFFFFFFFF0007FFFFFFFFBF1FFFFFFE38FFFFCF1FFFFFFF7D
      EFFFC7BFFFFFCB01C78CE3BFFFFFB793C730F1BFFFFFB793967BF87F77BEC7C7
      167BFC7F75BEB7C79279FE3F8CC1CFEFF330FF07AC5DFFFFFB84FF83DCEBFE1F
      FBFFFF81DDEBDF1FF800FF81FFF7DF1FF800FFC1FFF7EEDFFFFFFFE3FFFFF1FF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FF0FF3FCFFFF0000FFFFF3FCFFFF
      0000FFFFF800C3C10000FFEFF800E7E300780FEFFCF9F3C700209FEFFCF1F007
      00101FDFFCF3F98F001F3BDFFE63F88F0010333FFE63FC1F000960FFFF27FC1F
      000973FFFF07FE3F000BFBFFFF8FFE3F0007FFFFFF8FFF7F0006FFFFFFDFFFFF
      0002FFFFFFFFFFFF0000FFFFFFFFFFFFEFFE9FF3FF07F7FFEFFF1FF3FFFFF7FF
      EFFF3FFFFFFFF7FFFFFFBFFFFFE7FFFFFFFFEF8307E7870FFFFFEFC78FE7DF9F
      E07FDFE70FCFEF1FCCFBDFE019CFE03BCCF33FE7111FEF33E0E0FFF2203FF660
      FCF3FFF230FFF673CCFBFFF079FFF4FBE1FFFFF87FFFF8FFFFFFFFF8FFFFF9FF
      FFFFFFFDFFFFFDFFFFFFFFFFFFFFFFFFFFFFF87FFFFFFFFFFFAFFC3FF807FFFF
      FF47FC1FF807FFFFFE83FE13F003FFFFFD01FC01E003FFFFFA00FC00E0037DDD
      F400F800C0037CDD0800F8008003826345F0F8008803BA2B0000F800F803D677
      4000FC00F803D6F70000FE00F807EFFF0000FF00F80FEFFFFFFFFF80FC1FFFFF
      FFFFFFC0FE7FFFFFFFFFFFFFFFFFFFFFFFFFFFFF800F800FFFFFFFEF800F800F
      8000FFC7800080008000FF838000800F8000FF01800080018000FE0080008009
      8000FC008A008A898000F8009400950980008000CA00CA8980008000E400E509
      80008000F200F20880008000F800F880FFFF8000FE00FFE9FFFF8000FE00FFE3
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFFFFFFFFF80FFFF883E0FFFEE003
      FFF183E0E036C001F02383E0E022FC0FE7878360E036FC06C88FEE3BE03FF003
      9DE7EC1BE03FE003BDF7E003800FE021BDF7FC1FF87FE030A877FE3FFC3FE038
      ADF7FF7FDE1FC03C85A7FC1F8F0F807EC04FFC1FDB8788F7E79FFC1FF1C3F8D2
      F03FFC1FFBE7FCCFFFFFFFFFFFFFFFFF9FFFC054C05480068FFFE182E1828004
      C7FFF3FFF3FF8000E207F7EFF7FE8001F003E7C7E7FE8001F801E78BE75B8001
      F000E7EFE6FD8001F000E7EFE4008001F000E7ABE6FD8003F000E7C7E75B8007
      F000F0EFF0FF8007F000F05FF05F8007F801F87EF87E800FFC03FC00FC00801F
      FE07FF03FF03C03FFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0FF8003FFFFFFE3C07F
      9FF3FFFFFFC1E0019C73FFFFFF81F0009C73FFC9FF01F8009C73C7C9FC00FC00
      9C7383C9C000FC009FF398008000FC009FF398002800FC00800383FF4200FC00
      EBAFC7FF0000FC00E92FFFFF0080FE00E44FFFFF5000FF01F39FFFFF0080FF83
      F83FFFFF8100FFFFFFFFFFFFC0FFFFFFFFFFFFFFFFFFFFFF0001FFFFFFFFFFFF
      0000FFFFFFFFFFFF0000FFFFFFFFFFFF8000FFFFFFFFFFFF8000FFFFFFFFC001
      8000FFFFC001FFFF8000C001FFFFFFFF8000FFFFFFFFFFFF8000C001C001C001
      8000FFFFFFFFFFFF8000FFFFFFFFFFFF8000FFFFFFFFFFFF8000FFFFFFFFFFFF
      C103FFFFFFFFFFFFE183FFFFFFFFFFFFE3C0E000FFFFFF00FFC0C000C000FF00
      0003C000FFFFFF000003C000FFFFFF0000008000C000FF0000028000FFFF8000
      00028000FFFF800E00038000C440BF0000038000CE7FA40A00038000E0FFBF01
      00028000E4C0A40300028000F1FFBFF700018000F1FF800700038000FBC08007
      0003FFFFFFFF80070003FFFFFFFFFFFFFF00FE00E3C0E3C0FF00FE00FFC0FFC0
      FE00FE00F81F0003FC00FC00F8070003FC00F800FC080000FC00F800F80E0002
      F800F800F81E0002F800F000F41F0003F003F000F63F0003E007E007F63F0003
      C03FC00FFB7E000280FF807FFBFE000200FF01FFFCF9000101FF01FFFF070003
      87FF83FFFFFF0003CFFFCFFFFFFF0003C198FFFFFFFFFFFF80F083E0FFFFFFFF
      80F083E0FC00801F80F083E0FFFFFFFFC1F88080C000800163FC8000FFFFFFFF
      3F9F8100FC00801F03FC8100FFFFFFFF0060C001C00080010000E083FFFFFFFF
      0000E083FC00801F0000F1C7FFFFFFFF0000F1C7C00080010000F1C7FFFFFFFF
      0000FFFFFFFFFFFF0000FFFFFFFFFFFFFFFFF8008000FFFFFFFFFFFF8000FFFF
      FFFFC8388000FFFFE07FE67C8000FF80F8FFF33C8000FF80F8FFF9808000FF00
      FC7FFCCC80010100FC7FFE6480010080FE3FBB30800100AAFE3F939880010180
      FF1F83CC800101FFFE0FD7E7800155FFFFFFD7F7800101FFFFFFC7FFC003FFFF
      FFFFEFFFFC3FFFFFFFFFFFFFFFFFFFFF8007FC0FFFFFFC1F8007FC07FFFFFC1F
      8007FE0FFFFFFC1F8007FE1FFF00FC1F8007FF0FFFFFFC1F8007FE0FFFE0FC1F
      8007FC07F7FFFF7F8007FE07F3E0FF7F8002FF0FC1FFFC1F8000FF9FB3E0FE3F
      8000FFCFB7FFFF7FFC00FF87BF00C1C1FE00FF87BFFFC1C1FF02FFCFC07FC1C1
      FFFFFFFFFFFFC1C1FFFFFFFFFFFFFFFFFEFFFEFFFFFFFFFFFFFFFFFFFFFF0000
      C27FC27F80000000FFFFFFFFFFFF0000C200C20080000000FFFFFFFFFFFF0000
      DE07DE0799900000CE079E07801F000007FF07FFC0300000CE009E00801F0000
      DE00DE0080100000FFFFFFFFC03F0000C200C20080100000FFFFFFFF999F0000
      FEFFFEFFFFFF0000FFFFFFFFFFFF0000FEFFFFFEFE0F8000FC7FFFFFFC0FD800
      FEFFFFFCFBFFD800FFFFFFFC060C9800FEFFFFFC0000D800FC7FF7FC060CD800
      FC7FDD51FBFF9800FC7FF701FC0CDF80FC3FDD00FE00DF80F61FF700FE0C9FF8
      E30FDD00FFF7DFF8E38FF701FFF8DFF8E00FDD01FFFC9FFFF01FFF57FFFCFFFF
      F83FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE00FE1FFF0FFFFFF800FF1FFF1FFE3F
      F800FFFFFF8FFE3FF800FF1FFF0FFFFFF801FE1FFF07FE3FE003FE1FFF03FE3F
      E003FE0FFF81FF3FE003FF07FF40FF8FF003FF83FE20F987F803F9C1FC10F1C7
      8003F0E1FC01F1C7F803F001FE01F987FC07F801FF03FC0FFE0FFC03FF87FFFF
      FFFFFF07FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFF7FFFFFFFFEDB7EFF7FFFF
      FFFFEDB7EFF7C001FFFF80010000F927FC0FEDB7EFF7D927F88FEDB7EFF7F927
      F18F8001EFF7D927F10FEDB7EFF7F927F1FFEDB7EFF7DF27F1FF8001EFF7FF27
      F18FEDB7EFF7DF3FF88FEDB70000FF3FFC1F8001EFF7DFFFFFFFEDB7EFF7FFFF
      FFFFEDB7EFF7FFFFFFFFFFFFEFF7FFFFFFFFE000F007FFFFFFFFE000E003FFFF
      E7FFE000E003FFFFE1FFE000E003807FF0FFE000E003803FF07FE000E003801F
      F83FF000E003800FFC17F801E003C007BE07F001F007E0039F07F001F80FF001
      CB83F001F80FF801E301FF1FF80FFC01E3E1FF1FFE3FFE01C3F1FFFFFE3FFF01
      FFFFFFFFFE3FFFFFFFFFFFFFFFFFFFFFC001FFFFFFFFFFFF8000C001C0019555
      800080008000AAAB800080008000D555800080008000AA2B8000800080005055
      800080008000AA2B8000800080005455800080008000A22B8000800080004115
      800080008000AA0B8000800080005505800080008000AA838000C001C0015551
      C001FFFFFFFFAAA9FFFFFFFFFFFF5555C01FC00FFFFFFFFF80078D0FC000C001
      93E78D0F800080009387800F800080009C07800F80008000900F800F80008000
      804F810F80008000808F808F80008000800F800F800080008007800780008000
      8003800380008000FFC1FFC180008000FFE0FFE080008000FFF0FFF0C000C001
      FFF9FFF9FFFFFFFFFFFFFFFFFFFFFFFFE000E000E01E8003E000E000E11E8003
      00000000F03F800300000000F03FFFFF00000000F830E7FF00000000F860E7FF
      00000000FC60E7E000000000FC63E6E000000000FEE0E26000000000FFE0E020
      00000000FFE3F02000000000FFC0FE6000000000FF80FEE000030003FF80FFE0
      00030003FFFFFFE000030003FFFFFFFFFFFFFF80FF80E000800FFF80FF80E000
      8007FF800000E0008003FF800000E0008001FF800400E000800080000100E000
      800080000040E000800FBF800000E000800FA4800000E000800FBFF70009E000
      C7F8A4970011E000FFFCBFF60008E000FFBA80040004E000FFC780060002FFFF
      FFFF80070001FFFFFFFFFFFF0001FFFF84FFCFF18818E06000E7F0009418E090
      008180009A18E10800FF80009918E2040000C0009F9FE090800280008000FF9F
      001DC0008000F0900018A0009810E090001D80E09808E090001DC0E19814E0F0
      803D6303981AE000001D71FF9819E000000178FF9F9FE000001F3C3C8000E000
      001F1E008000FFFF843F8FE0FFFFFFFFF000FFF1FFFFFFFFF0008000FFFFFFFF
      F0008000FFC1FFFFF00080018001E67FF00080008001F0FFF00080008000F9FF
      F0008002C000F0FFF0008000E000E67FF0008000F000FFC7F0008000E00FFFDF
      F0008000C007FFEFF00080008003FFF7AFFF80000101FFCF9FFF80000381FFFF
      8FFFFFFF07C1FFFFFFFFFFFFFFFFFFFFF81EC000C0008001FC0CC0008000BBF5
      FC0CC000800FAAD5FF00C000801F8001FF81C000803FE00FFF81C000800FE01F
      FF00C0008083E21FFC0CC0008180E04FF01EC00083C0E047F01EC00087C0E0C3
      C07FC0008FE0E1C3C3FFC0009FE0E3E1C3FFC000BFF0E7E1FFFFC000FFF8EFF0
      FFFFF0FFFFFCFFF1FFFFE1FFFFFFFFFF8000800080008000B000800080008000
      B000800080008000BFFF800080008000BF00800080008000B000800080008000
      B700800080008000B7FF800080008000B7008000800080008000800080008000
      BF00800080008000BFFF8000FFFF8000B0078000FFFE80008007FE4FFFFFFFF0
      B007FFFFFFFFFFF8FFFFFFFFFFFFFFFCFFFFFFF7F007FFFFE0FFFE7BFE3FC001
      C07FFC7DC001BFFEC07FF86E8000A002000FC0768000A002000F805B8000A002
      0007806B8000A0020007806B8000A0020007806B8000A0020007805B8000A002
      0007C0768000A002000FF86E8000A002000FFC7D8000BFFE000FFE7B8000C001
      000FFFF7C001FFFF000FFFFFFFFFFFFFFFFFFFFFFFE0FFFFFFC9FFC3FFC0E0FF
      80498049FFA0C07F80418049FF7FC07F80498043C0F0E07F804980498000FF6F
      802380498000FF77801780438160FF77800F803FFEBFFF7780038003FF50FF77
      80038003FFA0FF6780038003FFC0FF0F80038003FFE0FF1F80038003FFFFFF3F
      80038003FFFFFF3FFFFFFFFFFFFFFF7F800FFFFFFFFFFFFF800FEAAAFFC9FFC3
      800FFFFFFFC9FFC9800FEEBEFFC1FFC9800FFF7FC049C043E23CEEBE8D498D49
      FFFCFAAB8D638D49FFFC8FFE80378043FFFC19FF801F803FFFFC80AA800F800F
      FFF0C7FF800F800FFFF0C3FF800F800FFFF019FF800F800FFFF03DFF800F800F
      FFF8FFFF800F800FFFFFFFFFFFFFFFFFF800FC00F3FFFFFFFBFEFC00ECFF008F
      FA12FC00EF3F0003FBFEFC00D9CF0000FA128000D0730080BA1E8000B01C0080
      9A129C00A00600818BFE9C006006000100009DCF600504010000800F000D0001
      003F9DCF800B0400003F9DCF809BFE00003F9DCF80F7B000003F800F8077B903
      003F800F808FC50FFFFFFFFFFFFFFFFFF87FC000FFFF8000F83FE0008000A000
      F81FF00080009FFCF80FF0008000901CF807F80080009FFCF807F8008000901C
      F807F80080009FFCFC03F80080009084FC03F800800090FCFC03F80080009084
      FE01F80180008002FE01F00480008000FE01C00E8000A00AFE03C7FF80008000
      FF0FFFFF8000FFFFFFFFFFFFFFFFFFFF8000FBE7FFFFFFFF8000C023FF0FFF7F
      8000C021FE0780018000C020FC03C0038000C0200003E0078000C0208003F00F
      8000C030C001F81F8000C030E001F00F80008038F001F00F80000038FA01E00F
      800000FCFE01E00F800000FCFE01F00F800000FEFE01FC077FFF81FEFE01FFE3
      0000C3FFFFFFFFF10000FFFFFFFFFFF9FFFFFFFFFFDFFFFF81FFFFFFFF9FFE00
      81FFF003FF8EFE0081FFF003FFCCAA0081FFF0038001D40081FFC003BFE3AA00
      81FF8003A4A1D400801BC003BFCCAA00F819E2038002D401F800E003C003AA03
      80198003C003D40781FB9007C003AABF81FFF00FC003D57F81FFF01FD24BAABF
      FFFFFFFFC003FFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFFFFFFFFFFFE3FFFFC807F
      F9CFFC1FF3FF807FFC9FFF7FE1F9807FFE3FFF7FE1F3807FCB73FC1FF0E3800D
      B7EDFC1FF847800CB7EFFC1FFC0F8000B6EDFC1FFE1F800CC673FC1FFC0F800D
      FDBFC001F84F807FF9BFC001E0E3807FF67FC001C1F1807FEFFFC001C7F8807F
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE007F00EFFCF8003E007E01F
      FF878003E007C738FF838003E007CF7FFF07800BE007CFFFFF07800BEAA7C000
      FE0F8008FFFFE000FE0F8008E557F000FC1F801CE007FFFFFC1FC07CE0079CF7
      F83FE0C8E0079CE7F83FFF9AE007C1C0F87FFFFBE00FC980F8FFFFFBE01FE3C0
      F9FFFFFFE03FE3E7FFFFFFFFFFFFFFFFC000FFFF80008000C000FE0080008000
      C000FE0080008000C000FE0080008000C000800080008000C000800080008000
      C000800080008000C000800080008000C000800180008000C000800380008000
      C000800780008000C000807F80008000FF0080FF82008000FF0081FFC71C8000
      FFFCFFFFEFBEFFFFFFFFFFFFFFFFFFFFFFFFF1C7F000C000E000EBEB8000C000
      E000DFFD8000C000E000B80E8000C000E000B4068000C000E00073E78000C000
      A00073E7F000C000800073E7F000C000C00073E7F000C000800073E7F800C000
      C1FFB016F800C000C0FFB80EF800C00093FFDFFDF800FF00B33FEBEBFC00FF01
      F3FFF1C7FFE0FFFFFFFFFBEFFFE0FFFFFFFFFFFFFFFFFFFFFFFFFFFF00010001
      C3FF878700010001C300848400000000C3FF878700010001C3FF87870001FF81
      C7FF8F8F00018081FFFFFFFF0001FF81FFFFFFFF0001F781C3FF87870001E381
      C30084840000C180C3FF878700018081C3FF87870001E381C7FF8F8F0001E381
      FFFFFFFF0001E381FFFFFFFF0001FF81FFFF8000C6008000FFFF8000C0008000
      87FF8000E000800086318000F000800087FF8000E000800087FF8000E0008000
      8FFF8000E0008000FFFF8000E0008000FFFF8000F000800787FF8000F8008007
      86318000FF00800787FF8000FF00800787FF8000FF80C00F8FFFC000FFC0F03F
      FFFFFE0FFFC0F87FFFFFFE0FFFFFFFFFB5D7EDEEFFFFFFFF8D51EDEEF3E7FFFF
      B496C631F007EFFF8DD1FFFFE007C601FF7FFF7FC00383FFFE3FFE3FC001C7FF
      841084108001EFFFA220A2208000FFFF9E3E9E3E8000FFFF9E3E9E3E800087FF
      9E3E9E3EC00086019FFE9FFEE00387FF9FFE9FFEF80787FF80018001FFCF8FFF
      80008000FFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF07FFE3FFE3FFE3FE01F
      FE3FFE3FFE3FC007C001C001C0018203C80900090009C087E413200300038023
      F2271FC70007C007F2271DC70007C007F2271DC700078003F22710470007C007
      F2271DC70007F00DF94F1DCF000FFC58FC9F1FCF000FFF30FE3F002F000FFFFD
      FFFF000F000FFFFDFFFF000F000FFFFFCEF7FFDCFFFFFFFFCEF7FFDDC001FFC0
      E666FFEB8000FF80F000FFE38000FF00FC03FFF78000FF00FE07FFE38000FE40
      FE07FFEB8000FD00FC03FFDD8002C000F801FFDDC0018000F060FFDDF7FF8000
      E0F0FFBEF5578000C1F8FFBEFAAB8000C3FCFFBEFFFD8000C7FEFFBEFFFD8002
      CFFFFFBEFFFDC001FFFFFFFFFFFFFFFFB1F083FCFFFFC3E9B9E099F8F3FFD9E1
      9CC19CF0ED9FCCC3C0038061ED6FC007F007C003ED6FE207FC0FF807F16FFF03
      FC0FFE07FD1FFF81F007F803FC7FFFC0C003C041FEFFFFC09CC19CE0FC7FFFC0
      B9E09DF0FD7FFFC4B1F083F8F93FFFC683F8C7FCFBBFFFC7C7FCFFFEFBBFFFC7
      FFFFFFFFFBBFFFE7FFFFFFFFFFFFFFF7FFFFC0FFC0FFF000FF9FE07FE07FE000
      FF0FF001F001C000FE0FF800F80080008007FC00FC0080008023FE00FE008000
      8033FE00FE0080008039FA00FA008000803CF800F8008000803EFA00FA008000
      873FFC00FC008000803FFF00FF00C000857FFF80FF80E00080FFFFC1FFC1F000
      81FFFFFFFFFFF800FFFFFFFFFFFFFE01C003FFFFF861F001C001FE1FFC71F001
      C000FE3FFC71F0018000FE9FFC71F0018000FECFFC71F0018000FFE7F071F001
      C000FFF3E071F001C000FFF9C471F001E000FFFCC471F001C000F800C000F008
      E000F801E000F018C000FFFFF000FFFCE000FFFFFFFFFFFEF400FFFFFFFFFFFF
      FFC7FFFFFFFFFFFFFFFFFFFFFFFFFFFF800780078000FFFFDFEFDFEFA040FFFF
      FFFFFFFF9E3CE007C00680069E3CFFFFBFF480049E3C8001B0169FE69E3CFFFF
      AFD69FE68102E007AFD69FE68000FFFFAFD69FE6A0408001AFD69FE69E3CFFFF
      AFD69FE69E3CE007AFD69FE69E3CFFFFA0369FE69E3C8001BFF480148102FFFF
      800E80068000FFFFFFFFFFFFFFFFFFFFFFFFFC008000FFFFC01FFC008000FFFF
      C00FFC008000C001C017FC0080008000C017E00080008000C017E10080008000
      C017E00080008000C017E00780008000C0178007800080000003880780008000
      800B800780008000C007801F80008000C007801F8000C001E007A01F8000FFFF
      E00F801FFFFFFFFFF01FFFFFFFFFFFFFFFFFF800FFFFFFFF8000F8008001FFFF
      BFFE8000B891E00FA4928000B891EFECA492800081B5E820BFFE8000B891EFE0
      A4928000B811EE6AA4928000823DE822BFFE80008011E020A00E8000BC8121AC
      A00E80007E81060FA00E8000228119FFBFFE80002E0127FFC001801F2E00FFFF
      FFFF801F85FCFFFFFFFFFFFFC3FFFFFFEFFBEFFBC000C000EFFBEFFBC000FFFE
      80008000C000E00EE003E003C000C006E773EFFBC000C006E773EFFBC000C006
      E773EFFBC000C006E003EFFBC000C006E773EFFBC000C006E773EFFBC000C006
      E773EFFBC000C006E003EFFBC000C00680008000C000C006EFFBEFFBC000C006
      EFFBEFFBE000E00EFFFFFFFFFFFFFFFFF3FFFFFFFFFFEFFBF1FFF7FF8FFFEFFB
      F0FFF3FF8C018000F000F1FF8FFFE003C000F01FFFFFE003C000C007FFFFE003
      C00080038FFFE003C00000018C01E003C00000018FFFE003C0000001FFFFE003
      C0000001FFFFE003C00080038FFFE003C000C0078C018000C000F01F8FFFEFFB
      C001FFFFFFFFEFFBFFFFFFFFFFFFFFFF8000FFFFFC00FFFF8000FFFFFC00C001
      8000FFFFFC0080008000C007FC008000800080030000800080009FF300008000
      80009FF30000800080009FF3003F800080009FF30001800080009FF300018000
      80008003000180008000C007F8018000801CFFFFF8018000C3FCFFFFF801C001
      FFFEFFFFF801FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC78FFFFFFFFF
      FFF38307FC3C0000FFC38307FB9B0003FF078307D8590001FE078307B85A0002
      FE0F8487BA420002FF0FDFF7B0200000FE9FEEFBA7FB0003FDFFF6FD8FFC0000
      FBFFFAFEFFFF0003F7FFFDFFFFFF0003EFFFFFFFFFFF0003FFFFFFFFFFFF0003
      FFFFFFFFFFFF0003FFFFFFFFFFFF0003C1FFC1FFC1FFC1FFE1FFE1FFE1FFE1FF
      E1F3E1F3E1F3E1F3000100010001000100010001000100010004000400040004
      0004000400040004000400040004000400040004000400040004000400040004
      0000000000000000000100010001000100030003000300030007000700070007
      00070007000700070007000700070007C1FFC1C1FFC1C1FFE1FFE1C3FFC3E1FF
      E1F3E1C3E7C3E1F3C1F1C1C1C7C10001CDF8CDD9CFD800019FFC9FFC9FFC0004
      9FFC9FFC9FFC00049FFC9FFC9FFC00049FFC9FFC9FFC00049FFC9FFC9FFC0004
      CFF8CFF8CFF80000C7F1C7F1C7F10001E3E3E3E3E3E30003F007F007F0070007
      FC1FFC1FFC1F0007FFFFFFFFFFFF0007FFFFA0FFFC1FC1FFFFFFA0FFF80FE1FF
      C000A1FFF80FE1F3FFFFA1BFF80FC1F1C000A303F80FCDF9FFFFA3BFF80F9FFC
      C000A7FFF80F9FFCFFFFA7FFF00F9FFCC000AFFFF0079FFCFFFFBFFFE0039FFC
      C000A0FFE003CFF8FFFFA0DFE003C7F1C000A083F007E3E3FFFFA0DFF00FF007
      FFFFA0FFF80FFC1FFFFFFFFFFE3FFFFF801FFFEFFFFFFFFF801FE7EF003FF81F
      801FE7E7003FF81F801FF7E7007FF00F801FF7FF007FF00F8007E7E703FFF00F
      8019E7E703DEF00F8000E7E7FE7FF00F8000F3E7FE7FF00F8000F3EBFE7FF00F
      8000D1DBFE7FF00F8000C9D503EFF00FFC00C1AD03FEF00FFE00E3DF007FF00F
      FE00F3C3007FF00FFFFFFFE7FFFFF81FFFFFFFFFFF00FFFFFFFFFFFF0000FFFF
      800300010000E7F9800300010000DFFE800300010000DE0E800300010000DCCE
      800300010000DCCE800300010000BE4F800300010000BF0F800300010000DDCE
      800300010000DE1E800300010000DFFE800300010000DFFE800300010000E7F9
      8003FFFF0000FFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3FFC00
      800FF7DFF81FFC008007E38FE00FFC008003C1078007FC008001E00F00030000
      8000F01F000100008000F83F00000000800FF01F0001003F800FE00F80010001
      800FC107C0010001C7F8E38FE0000001FFFCF7DFF000F801FFBAFFFFF803F801
      FFC7FFFFFC0FF801FFFFFFFFFE3FF801FFE7FFFFFFFFFFFF8000FFFF000CC007
      800007C100088003800007C100010001800007C1000300018000010100030001
      800000010003000080000001000300008000000100038000800080030007C000
      8000C107000FE0018000C107000FE0078000E38F000FF0078000E38F001FF003
      8000E38F003FF803FFFFFFFF007FFFFFFFFFFFFFFFFFFFFFE1E18000FE03007F
      E1E18000FE03007CE0818000FE030078E0018000FE03007100018000C0030023
      00038000C0030007000380000003000F00070000000300070007000000030007
      00078000007F0007000F8000007D0007000F80000078C007000FE07F007DE00F
      000FF03F01DDF01F000FFFFF01E3F83FFFFF8003FFFFFFFFFC0080030001FFFF
      FC0080037EFD0000FC0080037E7D0000FC0080037E3D0000000080037E1D0000
      000080037E1D0000000080037E0D0000003F800300010000000180037E850000
      000180037E810000000180037EC10000F80180037EC50000F80180077EFD0000
      F801800F7EFD0000F801801F0001FFFFFFFFFFEFFFFFFFFF8001FFCFFFFFFFFF
      0000E007000180030000C0030001800300008001000180030000800100018003
      0000800100018003000080010001800300008001000180030000800100018003
      0000800100018003000080010001800300008001000180030000800100018003
      80018003FFFF8003FFFFC007FFFFFFFF003F80008000FFFF003F000000008001
      001F000000000000000000000000000000000000000000000000000000000000
      00008000800000008000F803F80300008000F007F00700008000E00FE00F0000
      C000E00FE00F0000C000E00FE00F0000C000E00FE00F0000C000E00FE00F0000
      C000F01FF01F8001C000F83FF83FFFFF80078007FFFFFFFF0003801FFF00FBFF
      00038001FF00F1FF000380000000E0FF000300000000C07F000300000000803F
      000300000000C61F000300010000EF0F007F00030000FF8700C1C0010003FFC3
      808080010003FFE1FF8080010003FFF3FF8080010003FFFFFF80C0010003FFFF
      FF80F0010003FFFFFFC1F8030003FFFFFE7F8085FFFFFFFFFC7F80FDFFE3FFF1
      FC3FC1C7FFC1FFE1FC7F80F4FF81FFC1FC3F0051FF03FF83FC7F005FF007E007
      FC3F80D1E00FC00FFC3FC1F7C01F801FF81FE325C01F801FF00F41FCC01F801F
      F00F4105C01F801FF00FC1F7C01F801FF00F6351E03F801FF81F3F5FF07FC03F
      FC3FE252FFFFE07FFFFF2FFFFFFFFFFFFC7FFE3FFFFFF00FF83FFC1FFFFFE007
      E00FFC1FFE0FC003C007FC1FFC078001C007FC1FFC070000C007FC1FF8070000
      C007FC1FF0070000C007FE3FE0070000C007FE3FE0070000C007FE3FE4070000
      E00FE419FC070000E00FC001FC070000C007C001FE0F8001C007C003FF3FC003
      C107C007FFFFE007E38FE40FFFFFF00FFFFFFFFFFFFFFFFF8001FFFF800F8007
      8001FFFF000700038001FFCF000300038001FF8F000100038001800F00000003
      8001000F000000038001000F000300038001000F000300038001800F00070007
      8001FF8F000F000F8001FFCF83FF83FF8001FFFFC7FFC7FF8003FFFFFFFFFFFF
      8007FFFFFFFFFFFF800FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8000E003FF01
      80010000C001FF01800100008001FF01C18300008001F001800100008001F001
      000000008001F00100000000800100018001000080010001C183000080010001
      E3C700008001001FC18300008001001FC18300008001001FC1830000C00301FF
      E3C78001FFFF01FFFFFFFFFFFFFF01FFFFFF003FFC00FFFFFC3F003FFE018001
      E00F0001FF03000000070000FE01000000070000FE01000000070000FE010000
      00070000FE0100000007800100010000000180038003000080018001C0EF0000
      E000C001806F0000F800F001806F0000FC01F001800F0000FC07F001807F0000
      FE3FF001807F8001FFFFF803C0FFFFFFFFFF8001F83FFFFFE1FF0000F01FE03F
      00610000F01FC01F00000000F83F800300000000FEFF800180000000FEFF8000
      80000000FEFF800000000000FEFF800000030000FEFF800000030000FEFF8001
      80030000FEFF8003E0070000FEFF8007F00F0000FC7F8007F83F0000F83FC00F
      FFFF0000F83FE01FFFFF8001F83FFFFFFEFFFEFFF83FFFFFFC67FC7FE00FFE3F
      F803F83FC007F81FF007E01FC007E00FE007C00FE00F8007C0078007E00F0003
      80038003F01F000100010001F01F000000000000F83F000080018001F83F0000
      C0038003F01F8000E0078007F01FC000F007800FF01FE000F807801FF01FF003
      FC27803FF83FF80FFE67FE7FFC7FFC3FF81FFFFFFEFFFEFFF00FCC07FC7FFC7F
      E007C827F83FF83FC003F017F01FF01FC003E00FE00FE00F8001C007C007C007
      800180038003800380010001000100018001000000000000C003800180018001
      E0078003C0038003F83D8007C0078007EEE1800F800FC00FF003801F801FE01F
      F9B7803F803FF01FFFDFC67FFE7FFA5FFFFFFF3FFFFFFFFFC007FE3FF000FC7F
      C007FC3FF007F83FC007F007F83FC007C007F007F01FB83BE00FF007E00F4005
      F01FF007E00FBC7BF01FF007F01F4005E00FF007F83FB45BE00FF007FC7F6C6D
      E00FF007F83F5835E00FF007F01FD837F01FF007F01FFC7FF83FF007F01FFFFF
      FC7FF007F01FFFFFFFFFFFFFF83FFFFFFC3FFFFFFFFFF01FFC3FF80FFFFFF01F
      FC3FF007FFFFF01FFC3FE0038001E00FC003C0038001E00F8001C0038001E00F
      8001C0038001E00F8001C0038001F01F8001C0078001E00F8001E00F8001E00F
      8001F03F8001A00B8001F0FF8001701DC003F0FFFFFFD83BFC3FF0FFFFFFBC6D
      FE7FF9FFFFFFEFF7FFFFFFFFFFFFDFFFFFFFFFFFFFFFFFFF8001FFFFC007FFFF
      8001E007C007E10F8001E007C007E00FC003C003C007E00FC003C003C007E00F
      C003C003C007E00FC003C003C007C007C003C003C0078003C003C003C007C007
      C003C003C007E00FC003F81FC007F01FC003F18FC003F83FC003FBDFFFC7FC7F
      C003FFFFFFEFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1FE007FFFFFFFF
      FE1FC003E007F83FFC3F8003C003E00FE00780038001C007C00380038001C007
      8001800380018003800180038001800380018003800180038001800380018003
      80018003C003800380018003E007C007C0038003F0FFC007E0078007F0FFE00F
      FFFFC00FFFFFF83FFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object brancheditsource: TDataSource
    DataSet = r_staffbranchedit
    Left = 128
    Top = 180
  end
  object r_staffbranchedit: TADOTable
    Connection = ADOconn
    CursorType = ctStatic
    IndexFieldNames = 'staffid'
    MasterFields = 'r_staffinfo.id'
    MasterSource = staffsource
    TableName = 'r_staffbranchedit'
    Left = 104
    Top = 172
  end
  object PopupMenu4: TPopupMenu
    Left = 144
    Top = 172
    object N49: TMenuItem
      Caption = #32534#36753#21464#21160#35828#26126'...'
      OnClick = N49Click
    end
    object N50: TMenuItem
      Caption = '-'
    end
    object N51: TMenuItem
      Caption = #21024#38500'...'
      OnClick = N51Click
    end
  end
  object tmpquery2: TADOQuery
    Connection = ADOconn
    Parameters = <>
    Left = 308
    Top = 109
  end
  object stachpostedit: TADOTable
    Connection = ADOconn
    CursorType = ctStatic
    IndexFieldNames = 'staffid'
    MasterFields = 'r_staffinfo.id'
    MasterSource = staffsource
    TableName = 'r_stachpostedit'
    Left = 16
    Top = 132
  end
  object r_staffpost: TADOTable
    Connection = ADOconn
    CursorType = ctStatic
    IndexName = 'id'
    TableName = 'r_staffpost'
    Left = 492
    Top = 77
  end
  object r_staffpostSource: TDataSource
    DataSet = r_staffpost
    Left = 524
    Top = 85
  end
  object r_staffpict: TADOTable
    Connection = ADOconn
    IndexFieldNames = 'staffid'
    MasterFields = 'r_staffinfo.id'
    MasterSource = staffsource
    TableName = 'r_staffpict'
    Left = 8
    Top = 197
  end
  object r_staffpictSource: TDataSource
    DataSet = r_staffpict
    Left = 40
    Top = 205
  end
  object PopupMenu5: TPopupMenu
    Left = 56
    Top = 208
    object N52: TMenuItem
      Caption = #22686#21152#22270#29255'...'
      OnClick = N52Click
    end
    object N162: TMenuItem
      Caption = #22270#29255#21478#23384#20026'...'
      OnClick = N162Click
    end
    object N53: TMenuItem
      Caption = '-'
    end
    object N54: TMenuItem
      Caption = #21024#38500'...'
      OnClick = N54Click
    end
  end
  object r_staffpay: TADOTable
    Connection = ADOconn
    IndexFieldNames = 'staffid'
    MasterFields = 'r_staffinfo.id'
    MasterSource = staffsource
    TableName = 'r_staffpay'
    Left = 24
    Top = 269
  end
  object r_staffpaySource: TDataSource
    DataSet = r_staffpay
    Left = 48
    Top = 277
  end
  object PopupMenu6: TPopupMenu
    Left = 64
    Top = 277
    object N114: TMenuItem
      Caption = #26032#22686#35268#21017'...'
      OnClick = N56Click
    end
    object N108: TMenuItem
      Caption = #32534#36753'...'
      OnClick = cxGrid5DBTableView1DblClick
    end
    object N109: TMenuItem
      Caption = '-'
    end
    object N58: TMenuItem
      Caption = #21024#38500'...'
      OnClick = N58Click
    end
    object N112: TMenuItem
      Caption = '-'
      Visible = False
    end
    object N113: TMenuItem
      Caption = #35745#31639'...'
      Visible = False
      OnClick = N113Click
    end
    object N127: TMenuItem
      Caption = #22871#29992#32473'...'
      OnClick = N127Click
    end
  end
  object sheetpopup: TPopupMenu
    Images = ImageList1
    Left = 272
    Top = 192
    object N69: TMenuItem
      Caption = #25764#28040'...'
      ImageIndex = 478
      ShortCut = 16474
      OnClick = N69Click
    end
    object N70: TMenuItem
      Caption = #37325#22797'...'
      ImageIndex = 388
      ShortCut = 49242
      OnClick = N70Click
    end
    object N68: TMenuItem
      Caption = '-'
    end
    object N61: TMenuItem
      Caption = #21098#20999'...'
      ImageIndex = 134
      ShortCut = 16472
      OnClick = N61Click
    end
    object N62: TMenuItem
      Caption = #22797#21046'...'
      ImageIndex = 161
      ShortCut = 16451
      OnClick = N62Click
    end
    object N63: TMenuItem
      Caption = #31896#36148'...'
      ImageIndex = 335
      ShortCut = 16470
      OnClick = N63Click
    end
    object N64: TMenuItem
      Caption = '-'
    end
    object N67: TMenuItem
      Caption = #21482#35835
      OnClick = N67Click
    end
    object N120: TMenuItem
      Caption = #32972#26223#33394'...'
      OnClick = N120Click
    end
    object N110: TMenuItem
      Caption = '-'
    end
    object N65: TMenuItem
      Caption = #20851#38381'...'
      OnClick = N65Click
    end
  end
  object imgFormatting: TImageList
    Height = 17
    Width = 17
    Left = 384
    Top = 105
    Bitmap = {
      494C01010D000E00040011001100FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000440000004400000001001000000000002024
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
      0000000000000000000000000000000000000000000010420000000000000000
      0000104200000000000000000000104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001042000000000000000000001042000000000000000000001042
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010420000104200001042
      0000104200001042000010420000104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001042000000000000000000001042000000000000000000001042
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010420000000000000000
      0000104200000000000000000000104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001042000010420000104200001042000010420000104200001042
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
      0000000000000000007C007C007C007C007C007C000000000000000000000000
      000000000000000000001F001F001F0000001F001F001F000000000000000000
      0000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000000000000000
      00000000000000000000000000000000007C007C000000000000007C00000000
      00000000945200009452000000000000000094521F000000000000001F009452
      00000000000094520000945200000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000007C007C0000
      000000000000000000000000000000000000000000000000000000001F001F00
      1F001F001F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000007C007C000000000000000000009452000000000000945200000000
      0000000094521F0000001F009452000000000000945200000000000094520000
      000000000000FF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7F000000000000000029252925292529252925292529252925292500000000
      0000000000000000000000000000007C007C0000000000000000000000000000
      00000000000000000000000000001F001F001F00000000000000000000000000
      0000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000292529250000000000000000
      00002925000000000000000000000000007C000000000000007C007C00000000
      0000000000000000000000000000000000000000000094521F00945200000000
      00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000002925
      292500000000000000000000000000000000000000000000007C007C007C007C
      007C007C00000000000000000000000000000000000000000000000000000000
      1F00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000292529250000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7F000000000000000000000000000000002925292500000000000000000000
      00000000000000001F001F001F0000001F001F001F0000000000000000000000
      00000000000000000000007C007C007C007C007C007C00000000000000000000
      0000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000000000002925292500000000
      0000000000000000000000000000000094521F000000000000001F0094520000
      000000000000000000000000000000000000007C007C000000000000007C0000
      00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000002925
      29250000000000000000000000000000000000000000000000001F001F001F00
      1F001F00000000000000000000000000000000000000000000000000007C007C
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000029252925000000000000000000002925000000000000000000000000
      000094521F0000001F0094520000000000000000000000000000000000000000
      000000000000007C007C00000000000000000000000000000000000000000000
      000000000000FF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7F000000000000000029252925292529252925292529252925292500000000
      0000000000000000000000001F001F001F000000000000000000000000000000
      00000000000000000000000000000000007C007C000000000000000000000000
      0000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000000000000000
      000000000000000000000000000000000000000094521F009452000000000000
      000000000000000000000000000000000000007C000000000000007C007C0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001F00
      0000000000000000000000000000000000000000000000000000007C007C007C
      007C007C007C0000000000000000000000000000000000000000000000000000
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
      00000000000000000000000000000000000000000000000000000000FF7FFF7F
      FF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000
      1042000000000000000000000000000000000000000000000000000000000000
      1042000010420000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF7F0000
      FF7FFF7FFF7F0000000000000000FF7FFF7FFF7F0000FF7F0000000000000000
      0000000010420000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF7FFF7FFF7F0000FF7FFF7F0000FF7FFF7FFF7F00000000
      0000000000000000000000000000000000001042000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7F0000000000000000FF7F
      0000000000000000000000000000000000000000000010420000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7F0000FF7FFF7FFF7F0000000000000000000000000000000000000000
      0000000010420000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF7F0000
      FF7FFF7FFF7F0000000000000000FF7FFF7FFF7F0000FF7F0000000000000000
      0000000000000000104200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      0000000000000000000000000000000000000000000010420000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF7FFF7F
      FF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000
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
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000044000000440000000100010000000000300300000000000000000000
      000000000000000000000000FFFFFF00FFFF80000000000000000000FFFF8000
      0000000000000000C00180000000000000000000FFFF80000000000000000000
      DF7D80000000000000000000FFFF80000000000000000000DF7D800000000000
      00000000FFFF80000000000000000000D55580000000000000000000FFFF8000
      0000000000000000DF7D80000000000000000000FFFF80000000000000000000
      DF7D80000000000000000000FFFF80000000000000000000D555800000000000
      00000000FFFF80000000000000000000FFFF80000000000000000000FFFFFFFF
      FFFFFFFFF000000080007FFFE07DF11EF000000080007FFFE778F39C70000000
      80007FFFF3F8F83C7000000080007FFFF9F079383000000080007007FCF07C78
      30000000800079F7EE7DFC7EF000000080007CFFE07DFEFEF000000080007E7F
      FFFDFFFEF000000080007F3FE23DF03EF000000080007E7FE73DF3BEF0000000
      80007CFFF07DF9FEF0000000800079F7F27DFCFEF000000080007007F8FDFE7E
      F000000080007FFFF8FDF73EF000000080007FFFFDFDF03EF0000000FFFFFFFF
      FFFFFFFFF0000000FFFFFFFFFFFFFFFFF0000000FFFFFFFFFFFFF00000000000
      FFFFFFFFFFFFF00000000000FFFFF007FFFFF00000000000FFFFFFFFFFFFF000
      00000000E07FFC1FFFFFF00000000000F8FFF88FC40E300000000000F8FFF9CF
      EEB5F00000000000FC7FF9CFC000302000000000FC7FF9CFF58DF00000000000
      FE3FF9CFF1B5F00400000000FE3FF9CFFBB5B00000000000FF1FF9CFFB0E3000
      00000000FE0FF087FFFFF00000000000FFFFFFFFFFFFF00000000000FFFFFFFF
      FFFFF00000000000FFFFFFFFFFFFFFFFF0000000FFFFFFFFFFFFFFFFF0000000
      FFFFFFFFFFFFFFFFF0000000FFFFFFFFFFFFFFFFF0000000FFFFFFFFFFFFFFFF
      F00000008003E007FC00FFFFF0000000FFFFFFFFFFFFFC03F0000000803F8001
      C000FE31F0000000FFFFFFFFFFFFFE31F00000008003E007FC00FE31F0000000
      FFFFFFFFFFFFFE03F0000000803F8001C000FE31F0000000FFFFFFFFFFFFFE31
      F00000008003E007FC00FE31F0000000FFFFFFFFFFFFFC03F0000000803F8001
      C000FFFFF0000000FFFFFFFFFFFFFFFFF0000000FFFFFFFFFFFFFFFFF0000000
      00000000000000000000000000000000000000000000}
  end
  object imgBordersImages: TImageList
    Height = 24
    Width = 24
    Left = 419
    Top = 137
    Bitmap = {
      494C01010C000E00040018001800FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000600000006000000001001000000000000048
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
      0000000000000000000000001042000010420000104200001042000010420000
      1042000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000104200000000000000000000000000000000000000000000
      0000000000000000000000001042000000000000000000001042000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000104200000000000000000000000000000000000000000000
      0000000000000000000000001042000000000000000000001042000000000000
      0000000000000000000000000000000000000000000000000000000010420000
      0000000000000000104200000000000000000000104200000000000000000000
      0000000000000000000000000000000000000000000000001042000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      1042000010420000104200001042000010420000000000000000000000000000
      0000000000000000000000001042000010420000104200001042000010420000
      1042000000000000000000000000000000000000000000000000000010420000
      1042000010420000104200001042000010420000104200000000000000000000
      0000000000000000000000000000000010420000104200001042000010420000
      1042000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000104200000000000000000000000000000000000000000000
      0000000000000000000000001042000000000000000000001042000000000000
      0000000000000000000000000000000000000000000000000000000010420000
      0000000000000000104200000000000000000000104200000000000000000000
      0000000000000000000000000000000000000000000000001042000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000104200000000000000000000000000000000000000000000
      0000000000000000000000001042000000000000000000001042000000000000
      0000000000000000000000000000000000000000000000000000000010420000
      0000000000000000104200000000000000000000104200000000000000000000
      0000000000000000000000000000000000000000000000001042000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000001042000010420000104200001042000010420000
      1042000000000000000000000000000000000000000000000000000000000000
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
      1042000010420000104200001042000010420000104200000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000010420000
      0000000000000000104200000000000000000000104200000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000104200000000000000000000104200000000000000000000
      0000000000000000000000001042000000000000000000001042000000000000
      0000000010420000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000010420000
      0000000000000000104200000000000000000000104200000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000104200000000000000000000104200000000000000000000
      0000000000000000000000001042000000000000000000001042000000000000
      0000000010420000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000010420000
      1042000010420000104200001042000010420000104200000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      1042000010420000104200001042000010420000104200000000000000000000
      0000000000000000000000001042000010420000104200001042000010420000
      1042000010420000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000010420000
      0000000000000000104200000000000000000000104200000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000104200000000000000000000104200000000000000000000
      0000000000000000000000001042000000000000000000001042000000000000
      0000000010420000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000010420000
      0000000000000000104200000000000000000000104200000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000104200000000000000000000104200000000000000000000
      0000000000000000000000001042000000000000000000001042000000000000
      0000000010420000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000010420000
      1042000010420000104200001042000010420000104200000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      1042000010420000104200001042000010420000104200000000000000000000
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
      0000000000000000000000000000000000000000000000000000000010420000
      1042000010420000104200001042000010420000104200000000000000000000
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
      0000000000000000000000000000000000000000000000000000000010420000
      0000000000000000104200000000000000000000104200000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000010420000
      0000000000000000104200000000000000000000104200000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000001042000000000000000000001042000000000000
      0000000010420000000000000000000000000000000000000000000010420000
      0000000000000000104200000000000000000000104200000000000000000000
      0000000000000000000000001042000000000000000000001042000000000000
      0000000010420000000000000000000000000000000000000000000010420000
      0000000000000000104200000000000000000000104200000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000001042000000000000000000001042000000000000
      0000000010420000000000000000000000000000000000000000000010420000
      1042000010420000104200001042000010420000104200000000000000000000
      0000000000000000000000001042000010420000104200001042000010420000
      1042000010420000000000000000000000000000000000000000000010420000
      1042000010420000104200001042000010420000104200000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000001042000010420000104200001042000010420000
      1042000010420000000000000000000000000000000000000000000010420000
      0000000000000000104200000000000000000000104200000000000000000000
      0000000000000000000000001042000000000000000000001042000000000000
      0000000010420000000000000000000000000000000000000000000010420000
      0000000000000000104200000000000000000000104200000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000001042000000000000000000001042000000000000
      0000000010420000000000000000000000000000000000000000000010420000
      0000000000000000104200000000000000000000104200000000000000000000
      0000000000000000000000001042000000000000000000001042000000000000
      0000000010420000000000000000000000000000000000000000000010420000
      0000000000000000104200000000000000000000104200000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000001042000000000000000000001042000000000000
      0000000010420000000000000000000000000000000000000000000010420000
      1042000010420000104200001042000010420000104200000000000000000000
      0000000000000000000000001042000010420000104200001042000010420000
      1042000010420000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000001042000010420000104200001042000010420000
      1042000010420000000000000000000000000000000000000000000000000000
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
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000060000000600000000100010000000000800400000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8003FFAAABFF800
      3FF8003FFBFFBFFFFFBFFFFFFFF8003FFBEFBFFBEFBFF8003FF9EF3FFBFFBFFF
      FFBFFFFFFFF9FF3FFBEFBFFBEFBFFBEFBFF9EF3FFBFFBFFFFFBFFFFFFFF9FF3F
      FAAABFFAAABFFAAABFF8AA3FFBFFBFFFFFBFFFFFFFF9FF3FFBEFBFFBEFBFFBEF
      BFF9EF3FFBFFBFFFFFBFFFFFFFF9FF3FFBEFBFFBEFBFFBEFBFF9EF3FFBFFBFFF
      FFBFFFFFFFF8003FF8003FFAAABFF8003FF8003FFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8003FF8003FFAAA
      BFF8003FF8003FFBEFBFFBFFFFFFFFFFFBEFBFFBEFBFFBEFBFFBEFBFFFFFFFFB
      EFBFFBFFFFFFFFFFFBEFBFFBEFBFFBEFBFFBEFBFFFFFFFFBEFBFFBFFFFFFFFFF
      FAAABFF8003FFAAABFFAAABFFFFFFFFBEFBFFBFFFFFFFFFFFBEFBFFBEFBFFBEF
      BFFBEFBFFFFFFFFBEFBFFBFFFFFFFFFFFBEFBFFBEFBFFBEFBFFBEFBFFFFFFFFB
      EFBFFBFFFFFFFFFFFAAABFF8003FFAAABFF8003FFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAAABFF8003FF800
      3FFFFFFFFFFFFFFFFFFFF8003FF8003FFBEFBFF8003FFBEFBFFFFFFFFFFFFFFF
      FFFFFFFFFFFBEFBFFBEFBFFBEFBFFBEFBFFFFFFFFFFFFFFFFFFFFFFFFFFBEFBF
      FAAABFFAAABFFAAABFFFFFFFFFFFFFFFFFFFFFFFFFFAAABFFBEFBFFBEFBFFBEF
      BFFFFFFFFFFFFFFFFFFFFFFFFFFBEFBFFBEFBFFBEFBFFBEFBFFFFFFFFFFFFFFF
      FFFFFFFFFFFBEFBFFAAABFFAAABFF8003FFFFFFFFFFFFFFFFFFFFFFFFFFAAABF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object imgStandart: TImageList
    Left = 400
    Top = 112
    Bitmap = {
      494C01010A000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001001000000000000020
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
      0000000000000000000000000000000000000000100010001000100010001000
      1000100010001000100010001000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000001000FF7FFF7FFF7FFF7FFF7F
      1000FF7FFF7FFF7FFF7FFF7F1000000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7F000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000001000FF7FFF7FFF7FFF7FFF7F
      1000FF7FFF7FFF7FFF7FFF7F1000000000000000FF7F00000000FF7F00000000
      000000000000FF7F000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000001000FF7FFF7FFF7FFF7FFF7F
      1000FF7FFF7FFF7FFF7FFF7F1000000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7F000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000001000FF7FFF7FFF7FFF7FFF7F
      1000FF7FFF7FFF7FFF7FFF7F1000000000000000FF7F00000000FF7F00000000
      000000000000FF7F000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000001000FF7FFF7FFF7FFF7FFF7F
      1000FF7FFF7FFF7FFF7FFF7F1000000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7F000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000001000FF7FFF7FFF7FFF7FFF7F
      1000FF7FFF7FFF7FFF7FFF7F1000000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7F0000FF7FFF7F000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000001000FF7FFF7FFF7FFF7FFF7F
      1000FF7FFF7FFF7FFF7FFF7F1000000000000000FF7F00000000FF7FFF7FFF7F
      000018630000FF7F000000000000000010000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000001000FF7FFF7FFF7FFF7FFF7F
      1000FF7FFF7FFF7FFF7FFF7F1000000000000000FF7F000018630000FF7F0000
      1863000018630000000000000000100010000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000001000FF7FFF7FFF7FFF7FFF7F
      1000FF7FFF7FFF7FFF7FFF7F1000000000000000FF7FFF7F0000186300001863
      0000186300001863186318630000100010000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000100010001000100010001000
      1000100010001000100010001000000000000000000000000000000018630000
      1863000018631863186318631863100010000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000010001000100010001000FF7F
      10001000100010001000FF7F1000000000000000000000000000000000001863
      0000186318631863186318631863100010000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000100010001000100010001000
      1000100010001000100010001000000000000000000000000000000000000000
      1863186318631863186318630000100010000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000100010000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001000
      1000100010001000100010001000100010000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001000
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F10000000100010001000100010001000
      1000100010001000100010001000000000000000000000000000000000001000
      1000100010001000100010001000100000000000000000000000000000001000
      1000100010001000100010001000100010000000000000000000000000001000
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F100000001000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F1000000000000000000000000000000000001000
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F100000000000000000000000000000001000
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F10000000000000000000000000001000
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F100000001000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F1000000000000000000000000000000000001000
      FF7F00000000000000000000FF7F100000000000104200421042004210421000
      FF7F100010001000100010001000FF7F10000000000000001000100010001000
      10001000100010001000100010001000100000001000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F1000000000000000000000000000000000001000
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F100000000000004210420042104200421000
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F10000000000000001000FF7FFF7F1000
      1000100010001000100010001000FF7F10000000100010001000100010001000
      1000100010001000100010001000000000000000FF7FFF7FFF7FFF7FFF7F1000
      FF7F00000000000000000000FF7F100000000000104200421042004210421000
      FF7F100010001000FF7F10001000100010000000000000001000FF7FFF7F1000
      1000100010001000100010001000100010000000100010001000100010001000
      10001000100010001000FF7F1000000000000000FF7F00000000000000001000
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F100000000000004210420042104200421000
      FF7FFF7FFF7FFF7FFF7F1000FF7F100000000000000000001000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F10000000000000000000100010001000100010001000
      1000100010001000100010001000000000000000FF7FFF7FFF7FFF7FFF7F1000
      FF7F00000000FF7F100010001000100000000000104200421042004210421000
      FF7FFF7FFF7FFF7FFF7F10001000000000000000100010001000100010001000
      10001000100010001000100000000000000000001000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F1000000000000000FF7F00000000000000001000
      FF7FFF7FFF7FFF7F1000FF7F1000000000000000004210420042104200421000
      10001000100010001000100000000000000000001000FF7F1000100010001000
      1000100010001000FF7F100000000000000000001000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F1000000000000000FF7FFF7FFF7FFF7FFF7F1000
      FF7FFF7FFF7FFF7F100010000000000000000000104200421042004210420042
      10420042104200421042004200000000000000001000FF7F1000100010001000
      10001000100010001000100000000000000000001000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F1000000000000000FF7F00000000FF7F00001000
      1000100010001000100000000000000000000000004210420000000000000000
      00000000000000001042104200000000000000001000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7F1000000000000000000000000000100010001000100010001000
      1000100010001000100010001000000000000000FF7FFF7FFF7FFF7F0000FF7F
      0000000000000000000000000000000000000000104210420000000000000000
      0000000000000000104200420000000000000000100010001000100010001000
      1000100010001000000000000000000000000000100010001000100010001000
      10001000100010001000FF7F1000000000000000FF7FFF7FFF7FFF7F00000000
      00000000000000000000000000000000000000000042104200420000E07F0000
      0000E07F00001042004210420000000000000000100010001000100010001000
      10001000FF7F1000000000000000000000000000100010001000100010001000
      1000100010001000100010001000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E07F
      E07F000000000000000000000000000000000000100010001000100010001000
      1000100010001000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000100010000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000420042000000000000
      0000000000000000000000000042000000000000000000001000000000001000
      000000001000100000000000000000000000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000000000420042004200420042
      0042004200420042000000000000000000000000000000420042000000000000
      0000000000000000000000000042000000000000000000001000000000001000
      000010000000000010000000000000000000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000E07F00000042004200420042
      0042004200420042004200000000000000000000000000420042000000000000
      0000000000000000000000000042000000000000000000001000000000001000
      000010000000000010000000000000000000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000FF7FE07F0000004200420042
      0042004200420042004200420000000000000000000000420042000000000000
      0000000000000000000000000042000000000000000000000000100010001000
      000010000000000010000000000000000000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000E07FFF7FE07F000000420042
      0042004200420042004200420042000000000000000000420042004200420042
      0042004200420042004200420042000000000000000000000000000000001000
      000010001000100000000000000000000000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000FF7FE07FFF7FE07F00000000
      0000000000000000000000000000000000000000000000420042000000000000
      0000000000000000000000420042000000000000000000000000000000001000
      000010000000000000000000000000000000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000E07FFF7FE07FFF7FE07FFF7F
      E07FFF7FE07F0000000000000000000000000000000000420000000000000000
      0000000000000000000000000042000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000FF7FE07FFF7FE07FFF7FE07F
      FF7FE07FFF7F0000000000000000000000000000000000420000000000000000
      0000000000000000000000000042000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000E07FFF7FE07F000000000000
      0000000000000000000000000000000000000000000000420000000000000000
      0000000000000000000000000042000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7F00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000420000000000000000
      0000000000000000000000000042000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7F0000FF7F000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000420000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7F00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000420000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFF000000008003000F00000000
      8003000F000000008003000F000000008003000F000000008003000F00000000
      8003000F000000008003000F000000008003000E000000008003000400000000
      800300000000000080030000000000008003F800000000008003FC0000000000
      FFFFFE0400000000FFFFFFFF00000000FFFFFFFFFC00FFFFFFFFFFFFFC008003
      FC01FC00FC008003FC018000FC008003FC010000E000800300010000E0008003
      00010000E000800300010001E007800300010003800780030003000380078003
      0007000380078003000F0003801F800300FF0FC3801F800301FF0003801F8003
      03FF8007801FFFFFFFFFF87FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC001F3FF
      C007001F8031ED9FC007000F8031ED6FC00700078031ED6FC00700038001F16F
      C00700018001FD1FC00700008001FC7FC007001F8FF1FEFFC007001F8FF1FC7F
      C007001F8FF1FD7FC0078FF18FF1F93FC00FFFF98FF1FBBFC01FFF758FF5FBBF
      C03FFF8F8001FBBFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object imgHistory: TImageList
    Left = 440
    Top = 112
    Bitmap = {
      494C010102000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001001000000000000008
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
      0000000000000000104210000000000000000000000000001000104200000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010001000100010001000
      0000000000000000000010001042000000000000000010421000000000000000
      0000000010001000100010001000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010001000100010000000
      0000000000000000000000001000000000000000000010000000000000000000
      0000000000001000100010001000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010001000100000000000
      0000000000000000000000001000000000000000000010000000000000000000
      0000000000000000100010001000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010001000000010000000
      0000000000000000000000001000000000000000000010000000000000000000
      0000000000001000000010001000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010000000000000001000
      1000000000000000000010001042000000000000000010421000000000000000
      0000100010000000000000001000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000100010001000100010420000000000000000000000001042100010001000
      1000000000000000000000000000000000000000000000000000000000000000
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
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF00000000FFFFFFFF00000000
      FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF00000000FFE7E7FF00000000
      C1F3CF8300000000C3FBDFC300000000C7FBDFE300000000CBFBDFD300000000
      DCF3CF3B00000000FF07E0FF00000000FFFFFFFF00000000FFFFFFFF00000000
      FFFFFFFF00000000FFFFFFFF0000000000000000000000000000000000000000
      000000000000}
  end
  object alMain: TActionList
    Left = 464
    Top = 144
    object actNew: TAction
      Category = 'File'
      Caption = '&New'
      Hint = 'New Spread Sheet'
      ImageIndex = 0
      OnExecute = actNewExecute
    end
    object actDeleteCells: TAction
      Category = 'Cells'
      Caption = 'Delete...'
    end
    object actOpenSpreadSheet: TAction
      Category = 'File'
      Caption = '&Open SpreadSheet'
      Hint = 'Open Spread Sheet'
      ImageIndex = 1
      ShortCut = 16463
    end
    object actSaveSpeadSheet: TAction
      Category = 'File'
      Caption = '&Save SpeadSheet'
      Hint = #20445#23384'...'
      ImageIndex = 2
      ShortCut = 16467
      OnExecute = actSaveSpeadSheetExecute
    end
    object actInsertCells: TAction
      Tag = 1
      Category = 'Cells'
      Caption = 'Insert...'
    end
    object actExit: TAction
      Category = 'File'
      Caption = 'E&xit'
      Hint = 'Exit'
      ShortCut = 32856
    end
    object actAutomaticCalc: TAction
      Category = 'Edit'
      Caption = '&Automatic calculation'
      Hint = 'Automatic calculation'
    end
    object actRecalcFormulas: TAction
      Category = 'Edit'
      Caption = '&Recalc formulas'
      Hint = 'Recalc formulas'
    end
    object actCut: TAction
      Category = 'Edit'
      Caption = 'Cu&t'
      Hint = 'Cut'
      ImageIndex = 3
      ShortCut = 16472
      OnExecute = actCutExecute
    end
    object actCopy: TAction
      Category = 'Edit'
      Caption = '&Copy'
      Hint = 'Copy'
      ImageIndex = 4
      ShortCut = 16451
      OnExecute = actCopyExecute
    end
    object actPaste: TAction
      Category = 'Edit'
      Caption = '&Paste'
      Hint = 'Paste'
      ImageIndex = 5
      ShortCut = 16470
      OnExecute = actPasteExecute
    end
    object actBeveledLookandFeel: TAction
      Category = 'Configuration'
      Caption = '&Beveled Look and Feel'
    end
    object actBufferedpaint: TAction
      Category = 'Configuration'
      Caption = 'B&uffered paint'
    end
    object actShowcaptions: TAction
      Category = 'Configuration'
      Caption = 'Show &captions'
    end
    object actShowgrid: TAction
      Category = 'Configuration'
      Caption = 'Show &grid'
    end
    object actShowheaders: TAction
      Category = 'Configuration'
      Caption = 'Show &headers'
    end
    object actShowformulas: TAction
      Category = 'Configuration'
      Caption = 'Show &formulas'
    end
    object actR1C1Referencestyle: TAction
      Category = 'Configuration'
      Caption = 'R1C1 &Reference style'
    end
    object actCells: TAction
      Tag = 1
      Category = 'Insert'
      Caption = '&Cells...'
    end
    object actRow: TAction
      Category = 'Insert'
      Caption = '&Row'
    end
    object actColumn: TAction
      Category = 'Insert'
      Caption = '&Column'
    end
    object actSheet: TAction
      Category = 'Insert'
      Caption = '&Sheet'
    end
    object actWindowClose: TWindowClose
      Category = 'Window'
      Caption = 'C&lose'
      Enabled = False
      Hint = 'Close'
    end
    object actWindowCascade: TWindowCascade
      Category = 'Window'
      Caption = '&Cascade'
      Enabled = False
      Hint = 'Cascade'
      ImageIndex = 6
    end
    object actWindowTileHorizontal: TWindowTileHorizontal
      Category = 'Window'
      Caption = 'Tile &Horizontally'
      Enabled = False
      Hint = 'Tile Horizontal'
      ImageIndex = 7
    end
    object actWindowTileVertical: TWindowTileVertical
      Category = 'Window'
      Caption = '&Tile Vertically'
      Enabled = False
      Hint = 'Tile Vertical'
      ImageIndex = 8
    end
    object actWindowMinimizeAll: TWindowMinimizeAll
      Category = 'Window'
      Caption = '&Minimize All'
      Enabled = False
      Hint = 'Minimize All'
    end
    object actWindowArrange: TWindowArrange
      Category = 'Window'
      Caption = '&Arrange All'
      Enabled = False
    end
    object actCellLeftAlign: TAction
      Category = 'CellAlign'
      Caption = 'actCellLeftAlign'
      Hint = 'Align Left'
      ImageIndex = 0
      OnExecute = actCellLeftAlignExecute
    end
    object actCellRightAlign: TAction
      Category = 'CellAlign'
      Caption = 'actCellRightAlign'
      Hint = 'Align Right'
      ImageIndex = 2
      OnExecute = actCellRightAlignExecute
    end
    object actCellCenterAlign: TAction
      Category = 'CellAlign'
      Caption = 'actCellCenterAlign'
      Hint = 'Center'
      ImageIndex = 1
      OnExecute = actCellCenterAlignExecute
    end
    object actBold: TAction
      Category = 'TokenStyle'
      Caption = 'actBold'
      Hint = 'Bold'
      ImageIndex = 3
      OnExecute = actBoldExecute
    end
    object actItalic: TAction
      Category = 'TokenStyle'
      Caption = 'actItalic'
      Hint = 'Italic'
      ImageIndex = 4
      OnExecute = actItalicExecute
    end
    object actUnderline: TAction
      Category = 'TokenStyle'
      Caption = 'actUnderline'
      Hint = 'Underline'
      ImageIndex = 5
      OnExecute = actUnderlineExecute
    end
    object actStrikeOut: TAction
      Category = 'TokenStyle'
      Caption = 'actStrikeOut'
      Hint = 'StrikeOut'
      ImageIndex = 6
      OnExecute = actStrikeOutExecute
    end
    object actMergeCells: TAction
      Category = 'Merge'
      Caption = 'Merge cells'
      Hint = 'Merge Cells'
      ImageIndex = 7
      OnExecute = actMergeCellsExecute
    end
    object actSplitCells: TAction
      Category = 'Merge'
      Caption = 'Split cells'
      Hint = 'Split Cells'
      ImageIndex = 8
      OnExecute = actSplitCellsExecute
    end
    object actSortAscending: TAction
      Category = 'Sort'
      Caption = 'actSortAscending'
      Hint = 'Sort Ascending'
      ImageIndex = 10
      OnExecute = actSortAscendingExecute
    end
    object actSortDescending: TAction
      Tag = 1
      Category = 'Sort'
      Caption = 'actSortDescending'
      Hint = 'Sort Descending'
      ImageIndex = 11
    end
    object actSum: TAction
      Category = 'Summary'
      Caption = 'Sum'
      ImageIndex = 9
      OnExecute = actSumExecute
    end
    object actFont: TAction
      Category = 'Others'
      Caption = 'actFont'
    end
    object actFontSize: TAction
      Category = 'Others'
      Caption = 'actFontSize'
    end
    object actAverage: TAction
      Tag = 1
      Category = 'Summary'
      Caption = 'Average'
      OnExecute = actSumExecute
    end
    object actCount: TAction
      Tag = 2
      Category = 'Summary'
      Caption = 'Count'
      OnExecute = actSumExecute
    end
    object actMax: TAction
      Tag = 3
      Category = 'Summary'
      Caption = 'Max'
      OnExecute = actSumExecute
    end
    object actMin: TAction
      Tag = 4
      Category = 'Summary'
      Caption = 'Min'
      OnExecute = actSumExecute
    end
    object actFormatCells: TAction
      Category = 'Cells'
      Caption = 'Format Cells...'
      ImageIndex = 9
    end
    object actHideCells: TAction
      Category = 'Cells'
      Caption = 'Hide'
    end
    object actShowCells: TAction
      Category = 'Cells'
      Caption = 'Show'
    end
    object actHideCol: TAction
      Category = 'Cols'
      Caption = 'Hide'
      Hint = 'Hide Col'
    end
    object actShowCol: TAction
      Category = 'Cols'
      Caption = 'Show'
      Hint = 'Show Col'
    end
    object actHideRow: TAction
      Category = 'Rows'
      Caption = 'Hide'
    end
    object actShowRow: TAction
      Category = 'Rows'
      Caption = 'Show'
    end
    object actUndo: TAction
      Category = 'History'
      Caption = 'actUndo'
      Hint = 'Undo'
      ImageIndex = 0
    end
    object actRedo: TAction
      Category = 'History'
      Caption = 'actRedo'
      Hint = 'Redo'
      ImageIndex = 1
    end
  end
  object SaveDialog1: TSaveDialog
    Left = 48
    Top = 388
  end
  object pmBorders: TPopupMenu
    OwnerDraw = True
    Left = 561
    Top = 65
    object MenuItem1: TMenuItem
      ImageIndex = 0
      OnClick = MenuItem1Click
      OnDrawItem = MenuItem1DrawItem
      OnMeasureItem = MenuItem1MeasureItem
    end
    object MenuItem2: TMenuItem
      ImageIndex = 1
      OnClick = MenuItem1Click
      OnDrawItem = MenuItem1DrawItem
      OnMeasureItem = MenuItem1MeasureItem
    end
    object MenuItem3: TMenuItem
      ImageIndex = 2
      OnClick = MenuItem1Click
      OnDrawItem = MenuItem1DrawItem
      OnMeasureItem = MenuItem1MeasureItem
    end
    object MenuItem4: TMenuItem
      Break = mbBreak
      ImageIndex = 3
      OnClick = MenuItem1Click
      OnDrawItem = MenuItem1DrawItem
      OnMeasureItem = MenuItem1MeasureItem
    end
    object MenuItem5: TMenuItem
      ImageIndex = 4
      OnClick = MenuItem1Click
      OnDrawItem = MenuItem1DrawItem
      OnMeasureItem = MenuItem1MeasureItem
    end
    object MenuItem6: TMenuItem
      ImageIndex = 5
      OnClick = MenuItem1Click
      OnDrawItem = MenuItem1DrawItem
      OnMeasureItem = MenuItem1MeasureItem
    end
    object N71: TMenuItem
      Break = mbBreak
      ImageIndex = 6
      OnClick = MenuItem1Click
      OnDrawItem = MenuItem1DrawItem
      OnMeasureItem = MenuItem1MeasureItem
    end
    object N81: TMenuItem
      ImageIndex = 7
      OnClick = MenuItem1Click
      OnDrawItem = MenuItem1DrawItem
      OnMeasureItem = MenuItem1MeasureItem
    end
    object N91: TMenuItem
      ImageIndex = 8
      OnClick = MenuItem1Click
      OnDrawItem = MenuItem1DrawItem
      OnMeasureItem = MenuItem1MeasureItem
    end
    object N101: TMenuItem
      Break = mbBreak
      ImageIndex = 9
      OnClick = MenuItem1Click
      OnDrawItem = MenuItem1DrawItem
      OnMeasureItem = MenuItem1MeasureItem
    end
    object N111: TMenuItem
      ImageIndex = 10
      OnClick = MenuItem1Click
      OnDrawItem = MenuItem1DrawItem
      OnMeasureItem = MenuItem1MeasureItem
    end
    object N121: TMenuItem
      ImageIndex = 11
      OnClick = MenuItem1Click
      OnDrawItem = MenuItem1DrawItem
      OnMeasureItem = MenuItem1MeasureItem
    end
  end
  object pmSummary: TPopupMenu
    OwnerDraw = True
    Left = 472
    Top = 128
    object Sum1: TMenuItem
      Action = actSum
      Caption = #27714#21644
    end
    object Average1: TMenuItem
      Tag = 1
      Action = actAverage
      Caption = #24179#22343#20540
    end
    object Count1: TMenuItem
      Tag = 2
      Action = actCount
      Caption = #25968#37327
    end
    object Max1: TMenuItem
      Tag = 3
      Action = actMax
      Caption = #26368#22823#20540'...'
    end
    object Min1: TMenuItem
      Tag = 4
      Action = actMin
      Caption = #26368#23567#20540'...'
    end
  end
  object cxsave: TPopupMenu
    Left = 540
    Top = 137
    object N82: TMenuItem
      Action = actSaveSpeadSheet
      Caption = #23384#20026#25991#20214'...'
    end
    object N83: TMenuItem
      Caption = #20445#23384#33267#25968#25454#24211'...'
      Visible = False
      OnClick = N83Click
    end
  end
  object tmpado: TADOTable
    Connection = ADOconn
    Left = 644
    Top = 73
  end
  object sheetopen: TPopupMenu
    Images = ImageList1
    Left = 604
    Top = 81
    object N89: TMenuItem
      Caption = #25171#24320#20174#25991#20214'...'
      OnClick = N89Click
    end
    object N88: TMenuItem
      Caption = '-'
    end
    object N84: TMenuItem
      Caption = #36873#25321#27169#29256'...'
      OnClick = N84Click
    end
    object N85: TMenuItem
      Caption = #20351#29992#27169#29256
      Visible = False
      OnClick = N85Click
    end
    object N86: TMenuItem
      Caption = #21462#28040#27169#29256'...'
      OnClick = N86Click
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 112
    Top = 384
  end
  object PrinterSetupDialog1: TPrinterSetupDialog
    Left = 104
    Top = 328
  end
  object Noset: TADOQuery
    Connection = ADOconn
    Parameters = <>
    Left = 320
    Top = 192
  end
  object nosetdatasource: TDataSource
    DataSet = Noset
    Left = 360
    Top = 192
  end
  object PopupMenu7: TPopupMenu
    Left = 232
    Top = 192
    object N19: TMenuItem
      Caption = #32534#36753'...'
      OnClick = cxGridDBTableView1DblClick
    end
    object N21: TMenuItem
      Caption = #21024#38500'...'
      OnClick = N21Click
    end
    object N22: TMenuItem
      Caption = '-'
    end
    object N23: TMenuItem
      Caption = #23548#20837'...'
      OnClick = N14Click
    end
  end
  object Branchimage: TImageList
    Height = 32
    Width = 32
    Left = 64
    Top = 352
    Bitmap = {
      494C01011F002200040020002000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000800000002001000001001000000000000020
      0100000000000000000000000000000000000000000000000000000000000000
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
      1042314A1042734E945200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000002929082D
      000085148B31AE35EF3973521042000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001042
      1042104200000000000000000000000000000000000000000000000000000000
      1042104210420000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FE7F6B31292D
      B35EC524000C641429298C31CE39524AD65A0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000010420000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001042000000000000000000000000000000000000000000000000
      0000000000000000000000000000007C007C0040004000000000000000000000
      00000000000000000000000000000000000000000000000000009B77304A2731
      71568B3D6A39E728000884146B2DAD35CE39944E104200000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000104200000000
      0000104210420000000000000000000000000000000000000000000000001042
      1042000000000000104200000000000000000000000000000000000000000000
      000000000000000000000000007C007C18631863004000400000000000000000
      1863FF7FFF7F18630000000000000000000000000000000000009B770F4A2835
      505228398B41AC41ED49E728000C841829298C31EF39324AD65A000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      1042000000000000000000000000000000000000000000000000000000000000
      0000104200000000000000000000000000000000000000000000000000000000
      00000000000000000000007C007C1863007C007C007C00400000000000001863
      FF7F18631863FF7F1863000000000000000000000000000000009B77304A4935
      0F4A49356A3D6B41AB41AC458B41E728000884146B2DAD35EF3D734E10420000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001863FF7F0000104210420000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000007C007C1863007C007C007C007C007C000000000000FF7F
      FF7FFF7FFF7F1863FF7F000000000000000000000000000000009B770F4A4A39
      30526A3D6A3D8B418A418B41AB45CD490F4EE528000C282DC51CAD35EF39524A
      D65A000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000001863FF7F00001863FF7F000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000007C007C1863007C007C007C007C007C007C0000FF7F0000FF7F
      FF7FFF7FFF7F1863FF7F00000000000000000000000000000000BB77104A6A3D
      10526A394A39AC418B418B418B41CC49AD45ED4DCC49ED45C52063104B2DAD35
      CE39944E10420000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001863FF7F00001863FF7F00001863000018631863104210420000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000007C007C1863007C007C007C007C007C007C007C0000000000001863
      FF7FFF7FFF7FFF7F1863000000000000000000000000000000007A730F4A6A39
      EE492835E62828356A398B41AB45AC45AB45CD49CC49505A89396A39210C6418
      29298C35EF3D5246D65A00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF7FFF7F00001863FF7F00001863FF7F00001863FF7F0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000007C007C1863007C007C007C007C007C007C007C00001863186300000000
      1863FF7FFF7F18630000000000000000000000000000000000009B730F4A6B3D
      CC454939325AC524493549396A3DCC49CC49CC49AC49505A683930560F4E4A39
      210C63146B2DAD35EF39734E1042000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF7FFF7F00001863FF7F000000001863FF7FFF7FFF7F186318631042
      1042000000000000000000000000000000000000000000000000000000000000
      007C007C1863007C007C007C007C007C007C007C000000001863186318630000
      00000000000000000000000000000000000000000000000000009A77304A4A39
      AD450C4AEE4D2931E628C72C2835693DAC45CC45CC49715A6939ED510D524F56
      715E6A3D4114641429298C31103E524A00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF7F000000001863000000001863FF7FFF7FFF7FFF7F1863000000000000
      000000000000000000000000000000000000000000000000000000000000007C
      007C1863007C007C007C007C007C007C007C000010420000FF7F186318631863
      00000000000000000000000000000000000000000000000000009B730F4A4939
      AC417056CC45293569354A354935C62C2831AC418A41925A693D0E520E520E52
      2E56505A705A8A394214A418F041104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F18630000186318631863
      18630000000000000000000000000000000000000000000000000000007C007C
      1863007C007C007C007C007C007C007C00001042186310420000FF7F18631863
      18630000000000000000000000000000000000000000000000009B772F4A4931
      8B3DF566693D4A352935493969398B3D4939E72C273131528A39ED510D520D52
      2E560E564E5A9162AB41E7206B31000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001863
      FF7FFF7FFF7FFF7FFF7F18630000000000001863186300001863FF7FFF7FFF7F
      1863104200000000000000000000000000000000000000000000007C007C1863
      007C007C007C007C007C007C007C0000000000001863104200000000FF7F1863
      00001863000000000000000000000000000000000000000000009B73304A0731
      8B3DF56607312935693549396A3D8B41CD49AB41E830CD418A39AB45ED492F56
      0E560E520E562E5AB26A63100000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000100200001863
      FF7FFF7FFF7FFF7FFF7F0000FF7FFF7F1863000000001863FF7FFF7FFF7FFF7F
      FF7F18631042000010420000000000000000000000000000007C007C1863007C
      007C007C007C007C007C007C0000000000000000FF7F1863000000000000FF7F
      18630000186300000000000000000000000000000000000000009B73104AE72C
      6A3D186FE7284A358A3D6A3D8B41CC45AC49ED4DCD49725AAC41A5284A39CB45
      2E520E564F5A4F5A916263140000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001002100200001863
      1863FF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7F0000186318630000104200000000000000000000007C1863007CFF7F
      007CFF7F007C007C007C00000000000000000000000018631042000000000000
      FF7F1863000018630000000000000000000000000000000000009B73304EA528
      4A39176F28316B3D6A39AC45AB41CD49CD49EC4D0D52D5668A3D0F4A6839C428
      28350E520D527062B26663140000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF03100210020000
      18631863FF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7F0000E07FE07F000010421042104200000000000000001863007C007C007C
      FF7F007C007C007C0000000000000000000000000000FF7F1863000000000000
      0000FF7F186318631863000000000000000000000000000000009B73304A8320
      6A39386F28318B418B3D8B41AB41CD45CC49CC490E526939AB3D915E50563052
      4939E4284839EC49915E63180000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000010020000FF03100210021002
      000018631863000000000000000000000000000000000000000000001042FF7F
      0000E07FE07F000010421863104210421042000000000000007C007C007CFF7F
      007CFF7F007C0000000000000000000000000000000000001863104200000000
      00000000FF7F18631863186300000000000000000000000000009B77304A8220
      8C41376B48358B418A418C418B41CD45AB45ED490E4E8B39082579772E522F5A
      915E0F524A3DA428AA3D420C0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001002100210020000FF0310021002
      1002000000000000000000000000000000000000000000000000000000000000
      E07FE07F0000104218631042186310421042000000000000007C007C007C007C
      007C007C0000000000000000000000000000000000000000FF7F186300000000
      0000000000001042FF7F186300000000000000000000000000009B7710460000
      C628176B8A3D8B41AB41AC45AC45CD45AC49ED49AC45D462AB3D705A2F524F56
      4F5A705A715E705A69392A316B31000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000010021002100210020000FF031002
      100210020000000000000000000000000000000000000000000000000000E07F
      E07F00001863186310421863104218631042000010420000007C007C007C007C
      007C000000000000000000000000000000000000000000000000186310420000
      00000000000010420000000000000000000000000000000000000000DE7B0000
      D55E0E528A41AC41AC45AB41ED45CC45AC45CD49AC45B35EAC3D0E520E564F5A
      4F56505E4F5AB266166B2F52EE4D493100000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000100210021002100210020000FF03
      FF03000000000000000000000000000000000000000000000000000010420000
      0000FF7F186318631863104218631042186300000000FF7F0000007C007C007C
      0000186318631863186318631863186318630000000000000000FF7F18630000
      000000000000000000000000000000000000000000000000000000008510FE7F
      D46250560E4ECC49AC418C41CC49ED490E4EED4DCD49B35EAB3D2E560E522E56
      4F5A705A2E5268352D4E3773B266725600000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001002100210021002100210020000
      0000000000000000000000000000000000000000000000000000000000001042
      FF7F1863FF7F1863186318631042186300000000000000001042000000000000
      0000000000000000000000000000000000000000000000000000000018631042
      0000000000000000000000000000000000000000000000000000BD779552630C
      5873166B92622F52EE49AC458B41EE49E4280E420F4EB45EAB412E520D524F5A
      2F5AEB49915A9A7345312D52715A0F4600000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001002100210021002100210020000
      0000000000000000000000000000000000000000000000000000000000000000
      1863FF7F1863FF7F186318631863104200000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF7F1863
      000000000000000000000000000000000000000000000000BD77FF7FFF7F754E
      850C38679977366FB4627156305227291763C414ED3DB45E48354F562F562E56
      CB45D45EFF7FFF7FBD7B67358A35000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001002100210021002100210020000
      0000000000000000000000000000000000000000000000000000000000000000
      FF7F1863FF7F1863FF7F18631863186300000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF7F
      00000000000000000000000000000000000000000000BD77FF7FFF7FFF7FFF7F
      A914E91CD65E5973586F797706257A6FFF7F796BA314B3566935915A705AEC49
      9156FF7FFF7FFF7FFF7F6F52452D915200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000100210021002100200000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF7F1863FF7F1863FF7F1863000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AF359C73FF7FFF7FFF7FFF7FAF35
      460801002B250000F65E8A317A6FFF7FFF7FFF7FDD776000282971560C4E925A
      FF7FFF7FFF7FFF7FBB7724316439883900000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000100210021002100200000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001863FF7F1863FF7F1863FF7F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D039D039FF7FFF7FFF7F544A0000
      3A6790354C29000082089B73FF7FFF7FFF7FFF7F71462000C30CEE49EB45EC45
      BD77FF7FFF7FBB77222D0F4A5873673500000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000100210021002000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000001863FF7F1863FF7F0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000660CCF39FF7FD0390300FF7F
      6D31B55600000000CB2DFF7FFF7FFF7FFF7F0E3A00009C736000CD412F4EEC49
      042DBD77BA77E228386B9456F862000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010021002000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF7F1863FF7F18630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000A8140100F9629D77
      BE7BEF3D0000000000006821FF7FFF7F934E810419678C31596B166BB3624F5A
      0C4A463143310B4EBD779D773246000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010020000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF7F186300000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000B035030000001863
      9B6F00000000000000000000C410CB2D0000FF7F7C73F8620000B45E9977166B
      D3664D56413D22312E5218670000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010020000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001863000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D23902003346
      0000000000000000000000000F3E400080005042BE7B7C730000000093567973
      7877366F905EE02CC845D4660000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000724AE30CA104B55200000000000000000000
      0F42796F9A7B146F146B51560000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000314A1767F66600000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000104210421042
      1042000000000000000000000000000010421042104210420000104210421042
      1042000010421042104210420000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000007C004000000000000000001F001F00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001042
      1042000000000000000000000000104210421042104210421042104210421042
      1042104210421042104210421042000000000000000000000000000000000000
      0000186318631863186318631863186318631863100200000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000186318631863186318631863104200000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000007C004200420040000000001F001F001F001F0000000000000000000000
      0000000000000000000000000000000000000000000000000000FF7F00001042
      0000000000000000000000000000000000000000104200000000000000001042
      0000000000000000104210421042000000000000000000000000000000001002
      1863FF03FF03FF03FF03FF03FF03FF03FF03FF03186310021002000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000018631863186318631863FF7FFF7FFF7F186310420000000000000000
      FF03100210020000FF0310021002100210020000000000000000000000000000
      0000004000000000004000001F001F001F001F001F001F000000000000000000
      0000000000000000000000000000000000000000000000000000000010420000
      000000000000000000000000FF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7F0000
      FF7FFF7FFF7FFF7F000010421042000000000000000000000000000000001002
      1863FF031863FF7FFF03FF03FF03FF03FF03FF03186310021002000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001863FF7FFF7FFF7F18631042000000000000
      0000FF03100210020000FF031002100210020000000000000000000000000000
      0000007C0000000000001F001F001F001F001F001F001F001F00000000000000
      000000000000000000000000000000000000000000000000FF7F000000001042
      10421042104210420000000000000000FF7F0000000000000000FF7F00000000
      00000000FF7FFF7F000010421042000000000000000000000000000000001002
      1863FF03FF7FFF7FFF03FF03FF03FF03FF03FF03186310021002000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF7FFF7F000000001863FF7FFF7FFF7F1863104210421042
      0000FF03100210020000FF031002100210020000000000000000100010001000
      1000004010001000100010001000100010001000100010001000100010001000
      1000100010001000100000000000000000000000000000000000104210421042
      1042104210420000FF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7F0000FF7FFF7F
      FF7FFF7F0000FF7F000010421042000000000000000000000000000000001002
      1863FF03FF7FFF03FF03FF03FF03FF03FF03FF03186310021002000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F186318631863
      0000FF03100210020000FF0310021002100200000000000000001000FF7FFF7F
      FF7F007CFF7FFF7FFF7FFF7FFF7FFF7F10001000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7F1000000000000000000000000000FF7F0000104210420000
      0000000010420000FF7FFF7FFF7F000000000000FF7FFF7F000000000000FF7F
      FF7FFF7F0000FF7F000010421042000000000000000000000000000000001002
      1863FF03FF7FFF03FF03FF03FF03FF03FF03FF03186310021002000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      0000FF03100210020000FF0310021002100200000000000000001000FF7F1042
      1042004010421042FF7FFF7FFF7FFF7F10001000FF7FFF7F1863186318631863
      186318631863FF7F100000000000000000000000000000000000000000001042
      1042000010420000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7F0000FF7F000010421042000000000000000000000000000000001002
      1863FF03FF03FF03FF03FF03FF03FF03FF031002100210021002000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF03FF03FF030000FF0310021002100200000000000000001000FF7F0040
      00400040004010421042FF7FFF7F0000100010000000FF7F1863FF7FFF7FFF7F
      FF7FFF7F1863FF7F100000000000000000000000000000000000104210421042
      1042000010420000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7F0000FF7F000010421042000000000000000000000000000000001002
      1002100210021002100210021002100210021002100210021002000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF03FF03100210020000000000000000100000400040
      00400040004000401042FF7FFF7FFF7F10001000FF7FFF7F1863FF7FFF7FFF7F
      FF7FFF7F1863FF7F100000000000000000000000000000001042104210421042
      1042000010420000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7F0000FF7F000010420000000000000000000000000000000000001002
      1002000000000000000000000000000000000000000010021002000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF03FF0300000000000000001000007C0040
      004000400040004010421042FF7FFF7F10001000FF7F000010001000FF7FFF7F
      FF7FFF7F1863FF7F100000000000000000000000000010421042104210421042
      1042000010420000FF7FFF7FFF7FFF7FFF7F1042104210421042104210421042
      104210420000FF7F000000000000000000000000000000000000000000000000
      0000FF03FF7FFF03FF7FFF03FF7FFF03FF7FFF03FF7F00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000010001042007C
      004000400040004000401042FF7FFF7F10001000FF7FFF7F0000004210421000
      186318631863FF7F100000000000000000000000000010421042104210421042
      1042000010420000FF7FFF7FFF7FFF7F00000000000000000000000000000000
      000000001042000010420000000000000000000000000000000000000000FF7F
      FF030000000000000000000000000000000000000000FF031002000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001000FF7F0040
      007C00400040004000401042FF7F0000100010000000FF7F0042004200421042
      1000FF7F1863FF7F10000000000000000000000010421042104210421042FF7F
      FF7F000010420000FF7FFF7FFF7F000018631863186318631863186318631863
      1863186300001042104210421042104200000000000000000000000010020000
      000000420042004200000000007C000018631863000000000000100200000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001F001000FF7F1042
      0040007C0040004000401042FF7FFF7F10001000FF7FFF7F0042E07FE07F0042
      104210001863FF7F10001F000000000000000000104210421042104200000000
      0000000010421042000000000000000018631863186318631863186318631863
      1863186300001042104210421042104200000000000000000000000000000042
      E07F18630042004200000000007C000000001863186300001042000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001F001F001000FF7F1863
      007C0040007C004000401042FF7FFF7F10001000FF7FFF7F18630042E07FE07F
      004210421000FF7F10001F001F00000000000000104210421042000000000000
      0000000000000000000000000000000018630040004018630040004018630040
      004018630000000000000000104210420000000000000000000000000000E07F
      186318630042000010020000007C000010020000186318630000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000001F001F001F001000FF7F1863
      186318631863007C00401042FF7FFF7F10001000FF7FFF7F186318630042E07F
      E07F00421042100010001F001F001F00000000001042104210420000FF7FFF7F
      FF7F1002FF7FFF7FFF7F1002FF7F00001863007C007C1863007C007C1863007C
      007C18630000FF7FFF7F0000104210420000000000000000000000000000E07F
      1863004200420000FF030000007C0000FF031002000018631863186300000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001F001F001F001F001000FF7F1863
      FF7FFF7FFF7F004000401042FF7F0000100010000000FF7F1863FF7FFF7F0042
      E07FE07F0042104210001F001F001F001F0000001042104210420000FF7FFF7F
      FF7F1002FF7FFF7FFF7F1002FF7F000018631863186318631863186318631863
      186318630000FF7FFF7F0000104210420000000000000000000000000042E07F
      186300420042000000000000007C000000000000000000001863000018630000
      0000000010421863186318631042000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000001F001F001F001000FF7F1863
      FF7FFF7FFF7F007C00401042FF7FFF7F10001000FF7FFF7F1863FF7FFF7FFF7F
      0042E07FE07F004210421F001F001F0000000000104210421042000010021002
      1002100210021002100210021002000018630040004018630040004018630040
      00401863000010021002000010421042000000000000000000000000E07F1863
      186300420000000000000000007C000000000000000000000000186318631863
      1863186300000000000000001863104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001F001F001000FF7F1863
      FF7FFF7FFF7F004000401042FF7FFF7F10001000FF7FFF7F1863FF7FFF7FFF7F
      FF7F0042E07FE07F004210421F000000000000001042104210420000FF7FFF7F
      FF7F1002FF7FFF7FFF7F1002FF7F00001863007C007C1863007C007C1863007C
      007C18630000FF7FFF7F000010421042000000000000000000000000E07F1863
      004200420000000000000000007C000000000000000000000000000018630000
      0000186300000000000000000000186300000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000E07FFF7F
      E07F000000000000000000000000000000000000000000001F001000FF7F1863
      186318631863007C00401042FF7FFF7F10001000FF7FFF7F1863186318631863
      186318630042E07FE07F000010420000000000001042104210420000FF7FFF7F
      FF7F1002FF7FFF7FFF7F1002FF7F000018631863186318631863186318631863
      186318630000FF7FFF7F00001042104200000000000000000000000000000000
      0042004200000000000000000000000000000000000000000000000018630000
      0000000018630000000000000000186300000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF7FE07F
      FF7F0000000000000000000000000000000000000000000000001000FF7F1863
      FF7FFF7FFF7F004000401042FF7F0000100010000000FF7F1863FF7FFF7FFF7F
      FF7FFF7F18630042000018631863104200000000104210421042000010021002
      1002100210021002100210021002000018630040004018630040004018630040
      0040186300001002100200001042104200000000000000000000E07FE07F1863
      000000000000000000000000FF7F000000000000000000000000000018631863
      0000000000001863000000001863104200000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000E07FFF7F
      E07F0000000000000000000000000000000000000000000000001000FF7F1863
      FF7FFF7FFF7F007C00401042FF7FFF7F10001000FF7FFF7F1863FF7FFF7FFF7F
      FF7FFF7F1863FF7F0042186318630040004000001042104210420000FF7FFF7F
      FF7F1002FF7FFF7FFF7F1002FF7F00001863007C007C1863007C007C1863007C
      007C18630000FF7FFF7F00001042104200000000000000000042E07F18631863
      0042000000000000000000001863000000000000000000000000104200000000
      1863000000000000186318631042000000000000000000000000000000000000
      000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F00000000
      00000000000000000000000000000000000000000000000000001000FF7F1863
      FF7FFF7FFF7F004000401042FF7FFF7F10001000FF7FFF7F1863FF7FFF7FFF7F
      FF7FFF7F1863FF7F100000420040007C004000001042104210420000FF7FFF7F
      FF7F1002FF7FFF7FFF7F1002FF7F000018631863186318631863186318631863
      186318630000FF7FFF7F0000104210420000000000000000E07FE07F18630042
      0042000000000000000000001042000000000000000000000000186300000000
      0000186300000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001000FF7F1863
      186318631863004000401042FF7FFF7F10001000FF7FFF7F1863186318631863
      186318631863FF7F100000000040004000000000104210421042000010021002
      1002100210021002100210021002000018630000000000000000000000000000
      0000186300001002100200001042104200000000000000420000000000000042
      0042000000000000000000000000000000000000000000000000186300000000
      0000000018630000000000000000000000000000000000000000000000000000
      000000000000000000000000186318630000FF7F000000000000000000000000
      00000000000000000000000000001002100200000000000000001000FF7FFF7F
      104210421042004000401042FF7F0000100010000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7F100000000000000000000000104210421042104200000000
      00000000FF7FFF7FFF7F1002FF7F000018630000004200420042004200420042
      000018630000FF7FFF7F0000104210420000000000000000E07F004200420000
      0042000000000000000018631042104200000000000000000000186300000000
      0000000018630000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF7F18630000000000000000000000000000
      0000000000000000FF03100210021002100200000000000000001000FF7F1042
      004000400040004000401042FF7FFF7F10001000FF7FFF7F1042104210421042
      104210421042FF7F100000000000000000000000104210421042104210421042
      10420000FF7FFF7FFF7F1002FF7F000018630000000000000000000000000000
      000018630000FF7FFF7F000010421042000000000000E07F0000000000000042
      0000000000000000000018631863104200000000000000000000104218630000
      0000186310420000000000000000000000000000000000000000000000000000
      0000FF7FFF7FFF7FFF7FFF7F00000000FF7F1863000000000000000000000000
      FF03100210020000FF03100210021002100200000000000000001000FF7F1042
      004000400040004000401042FF7FFF7F10001000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7F1000000000000000000000000000FF7F1042104210421042
      1042000010001000100010001000000018631863186318631863186318631863
      1863186300001000100000001042104200000000000000000000E07F00000042
      000000000000000000001F00FF7F1F0000000000000000000000000010421863
      1863104200000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF7F0000FF7F186310420000000000000000
      0000FF03100210020000FF03100210021002000000000000000010001000007C
      0040004000400040004010001000100010001000100010001000100010001000
      100010001000100010000000000000000000000000001042FF7F104210421042
      10420000FF7FFF7FFF7FFF7FFF7F000018631863186318631863186318631863
      186318630000FF7FFF7F00001042104200000000000000000000000000000000
      000000000000000000001F001F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF7FFF7FFF7F
      FF7FFF7F000000000000FF7F0000FF7F0000FF7FFF7F18631042104200000000
      0000FF03100210020000FF031002100210020000000000000000000018630040
      007C00400040004010421F001F001F001F001F001F001F001F00000000000000
      0000000000000000000000000000000000000000000000001042FF7F10421042
      10420000FF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000
      00000000FF7FFF7FFF7F00001042104200000000000000000000000000000000
      000000000000000000001F001F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000186318630000000000001863FF7FFF7FFF7FFF7F186310421042
      0000FF03100210020000FF03100210021002000000000000000000000040007C
      0040007C00400040104200001F001F001F001F001F001F000000000000000000
      00000000000000000000000000000000000000000000000000001042FF7FFF7F
      FF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000000000000000
      000000000000000000001F000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF7FFF7F00000000
      00000000000000000000186318631863FF7FFF7FFF7FFF7FFF7FFF7FFF7F1863
      0000FF03100210020000FF0310021002100200000000000000000000007C0040
      007C0040004000400000000000001F001F001F001F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001042
      1042000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      0000FF03100210020000FF03FF03FF03FF03000000000000000000000000007C
      0040007C0040000000000000000000001F001F00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000010420000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF03FF03FF03FF03FF03
      FF03FF030000000000001002FF03FF03FF030000000000421F7C1F7C00000000
      00001F7C1F7C000000001F7C1F7C00000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000010420000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF031002FF03FF03FF03FF03FF03
      10020000FF03FF030000FF031002FF030000FF030000E07F1040000000420042
      000010401F7C1F7C00001040104000000000FF7FE003E003E003E003E003E003
      E003E003E003E003E003E003E003E003FF7F007C007C007C007C007C007C007C
      007C007C007C007C007C007C007C007CFF7F0000000000000000000000000000
      0000000000000000000000000000000000001042000000000000100200001042
      0000000000000000000000000000000000000000000000000000000000001042
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00001002FF031002FF03FF03FF031002
      0000FF03FF03FF0300001002FF030000FF03FF0300000000E07F0042E07F0042
      104210420000104000000000000000000000FF7FE003FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FE003FF7F007CFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F007CFF7F0000000000000000000000000000
      0000000000000000000000000000104200000000000018631042100200000000
      0000000000000000000000000000000000000000000000000000000000001042
      FF7F104210421042104210421042104210421042104210421042104210421042
      1042104210421042104210421042FF7F0000FF031002FF031002FF0310020000
      FF03FF03FF03FF030000000000000000FF03FF0300000000E07FE07F00420042
      104210420000000000000000000000000000FF7FE003FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FE003FF7F007CFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F007CFF7F0000000000000000000000000000
      0000000000000000000010420000000000001863000018631F000000FF030000
      1042000000000000000000000000000000000000000000000000000000001042
      FF7F1042FF7FFF7F1042FF7FFF7F1042FF7FFF7F1042FF7FFF7F1042FF7FFF7F
      1042FF7FFF7F1042FF7FFF7F1042FF7F0000000000001002FF03100200001002
      FF03FF03FF03000010421042104200000000FF03000018630042E07F00421863
      FF7F10420000000000000000000000000000FF7FE003E003E003E003E003E003
      E003E003E003E003E003E003E003E003FF7F007C007C007C007C007C007C007C
      007C007C007C007C007C007C007C007CFF7F0000000000000000000000000000
      000000000000104200000000000000421863004200001F001F000000FF030000
      0000000000000000000000000000000000000000000000000000000000001042
      FF7F1042FF7FFF7F1042FF7FFF7F1042FF7FFF7F1042FF7FFF7F1042FF7FFF7F
      1042FF7FFF7F1042FF7FFF7F1042FF7F0000000000000000000000001002FF03
      FF03FF030000104210421042104210420000000010420042E07F00421863FF7F
      FF7F10420000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000
      0000104200000000000018630042186300421863004200001F001F0000001002
      0000104200000000000000000000000000000000000000000000000000001042
      FF7F104210421042104210421042104210421042104210421042000000000000
      0000104210421042104210421042FF7F000000000000000000000000FF031002
      FF030000104210421042104210421042000000001863E07F00421863FF7FFF7F
      186310420000000000000000000000000000FF7F000000000000000000000000
      00000000000000000000000000000000FF7F0000000000000000000000000000
      00000000000000000000000000000000FF7F0000000000000000000000001042
      0000000010421042186300421863004218630042186300001F001F000000FF03
      0000000000000000000000000000000000000000000000000000000000001042
      FF7F1042FF7FFF7F1042FF7FFF7F1042FF7FFF7F1042FF7FFF7F0000E003E003
      0000FF7FFF7F1042FF7FFF7F1042FF7F00000000000000000000000010020000
      0000104210421042104210421042000000000000186300420042FF7F10421042
      000000000000000000000000000000000000FF7F0000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F0000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F0000000000000000104200000000
      00420000000000001042104200421863004218630042186300001F001F001002
      FF03000010420000000000000000000000000000000000000000000000001042
      FF7F1042FF7FFF7F1042FF7FFF7F1042FF7FFF7F1042FF7FFF7F0000E003E003
      0000FF7FFF7F1042FF7FFF7F1042FF7F00000000000000000000000000000000
      1042104210421042000000000000000000000000000010420042FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F1042000000000000FF7F0000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F0000FF7FFF7FFF7FFF7FFF7F1000
      1000100010001000FF7FFF7FFF7F0000FF7F0000000010420000000000000042
      18631042FF031F000000104210420042186300421863004200001863E07F0000
      1002000000000000000000000000000000000000000000000000000000001042
      FF7F104210421042104210421042104210421042104210421042000000000000
      0000104210421042104210421042FF7F00000000000000000000000000000000
      10421042104210421042104210421042104210421042000010421863FF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F000000000000FF7F0000FF7FFF7FFF7FFF7F0000
      000000000000FF7FFF7FFF7FFF7F0000FF7F0000FF7FFF7FFF7FFF7FFF7F1000
      1000100010001000FF7FFF7FFF7F0000FF7F0000000000000000186300421863
      0042186300001F001F00000010421042004218630042186300420000E07FE07F
      0000100200001042000000000000000000000000000000000000000000001042
      FF7F1042FF7FFF7F1042FF7FFF7F1042FF7FFF7F1042FF7FFF7F1042FF7FFF7F
      1042FF7FFF7F1042FF7FFF7F1042FF7F00000000000000000000000000000000
      00000000104210421042104210421042104210421042104200001863FF7FFF7F
      FF7FFF7FFF7FFF7FFF7F1863000000000000FF7F0000FF7F0000000000000000
      000000000000000000000000FF7F0000FF7F0000FF7F100010001000FF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F1042000000421863004218630042
      1863004218630000FF031F0000001042104200421863004218630000E07FE07F
      0000FF0300000000000000000000000000000000000000000000000000001042
      18631042186318631042186318631042FF7FFF7F1042FF7FFF7F1042FF7FFF7F
      1042FF7FFF7F1042FF7FFF7F1042FF7F00000000000000000000000000000000
      00000000104210421042104210421042104210421042104200001863FF7FFF7F
      FF7FFF7FFF7F104200000000000000000000FF7F0000FF7FFF7FFF7FFF7F0000
      000000000000FF7FFF7FFF7FFF7F0000FF7F0000FF7F100010001000FF7FFF7F
      FF7FFF7FFF7FFF7FFF7F007C007C0000FF7F0000000000000042186300421863
      00421863004218630000FF031F0000001042104200421863004218630000E07F
      E07F0000FF030000104200000000000000000000000000000000000000001863
      1042000000000000000000001042186310421042104210421042104210421042
      1042104210421042104210421042FF7F00000000000000000000000000000000
      00000000104210421042104210421042104210420000000010421863FF7FFF7F
      FF7FFF7FFF7FFF7FFF7F1863000000000000FF7F0000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F0000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F007C007C0000FF7F0000104200001863004218630042
      186300421863004218630000FF031F000000104200001042186300420000E07F
      0000104210020000000000000000000000000000000000000000000010420000
      00001042104210421042104200000000104218631042FF7FFF7F1042FF7FFF7F
      1042FF7FFF7F1042FF7FFF7F1042FF7F00000000000000000000000000000000
      00000000104210421042104210421042104210421042104200001863FF7FFF7F
      FF7FFF7FFF7FFF7F00000000000000000000FF7F0000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F0000000000000000000000000000
      00000000000000000000000000000000FF7F0000000000000000186310421042
      1042104210421042004218630000FF031F000000004200001042186300420000
      1F7C0000FF031002000010420000000000000000000000000000000000001042
      104218631863FF7F18631863104210420000000010421863FF7F1042FF7FFF7F
      1042FF7FFF7F1042FF7FFF7F1042FF7F00000000000000000000000000000000
      000010421042104210421042104210421042104210421042000018631863FF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000FF7F000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000010420000104210420000
      000000000000104210421042186300001F001F00000000420000104218630000
      1F7C1F7C0000FF03000000000000000000000000000000000000000010421863
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F186310420000000010421042104210421042
      1042104210421042104210421042FF7F00000000000000000000000000000000
      104210421042104210421042104210421042104210420000000000001863FF7F
      FF7FFF7FFF7FFF7FFF7FFF7F000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F000000000000000000000000000000000000FF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000001042000000001042
      104210421042000000001042104218630000FF031F0000000042000010421863
      00001F7C00001002FF03000010420000000000000000104200001042FF7FFF7F
      FF7FFF7F0000FF7FFF7F0000FF7FFF7F186310420000104218631042FF7FFF7F
      1042FF7FFF7F1042FF7FFF7F1042FF7F00000000000000000000000000000000
      10421042104210421042104210421042104210421042104210420000FF7FFF7F
      FF7F1F001F00FF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000FF7FFF7F
      FF7FFF7F1F001F001F001F001F001F00FF7F000000001042000010421863FF7F
      FF7FFF7FFF7F1863104200001042104218630000FF031F000000004200000042
      00001F7C1F7C00001002000000000000000000001863000010421863FF7F0000
      1863FF7FFF7FFF7FFF7FFF7FFF7F0000186318631042000018631042FF7FFF7F
      1042FF7FFF7F1042FF7FFF7F1042FF7F00000000000000000000000000000000
      00000000104210421042104210421042000010421042104200001042FF7FFF7F
      FF7F10420000000010420000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7F
      1F001F001F001F001F001F001F001F00FF7F00000000000010421863FF7FFF7F
      FF7FFF7FFF7FFF7F1863104200001042004218630000FF031F00000000420000
      0042000018630000FF0310020000104200000000104200001042FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F1863104200001042104210421042
      1042104210421042104210421042FF7F00000000000000000000000000000000
      00000000104210421042104210420000000010421042000010421863FF7FFF7F
      FF7FFF7F1863186318630000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000001F00
      1F00FF03FF03FF03FF03FF031F001F00FF7F0000104200001863FF7F0000FF7F
      FF7FFF7FFF7F0000FF7F1863000010421042004218630000FF031F0000000000
      18630000186300001002FF030000000000000000000010421863FF7F0000FF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F18631042000018631863FF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000
      000000000000000010421042104210420000000000001042E07F00421863FF7F
      FF7FFF7FFF7FFF7FFF7F1042000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000001F001F00
      FF03FF03FF03FF03FF031F001F00FF7FFF7F000000001042FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F1042000010421863004218630000100200000000
      0042104210420000FF031002FF03000010420000000010421863FF7FFF7FFF7F
      FF7FFF7FFF7FFF7F10421042104210421042104218631042000018631863FF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000
      0000000000000000104210421042104210420000000010421863004200001863
      FF7F0000FF7F0000FF7F0042104200000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000000001F00FF03FF03
      FF03FF03FF03FF031F001F00FF7FFF7FFF7F000000001042FF7FFF7FFF7FFF7F
      18630000000000000000FF7F1042000010420042186300421863000000000042
      186300000000FF0310021042000000000000000000001042FF7FFF7FFF7FFF7F
      FF7FFF7FFF7F000000000000000000000000FF7F18631042000018631863FF7F
      0000104200001042000010420000FF7F00000000000000000000000000000000
      000000000000000010421042104210421042104200001042E07F0000E07F0042
      0042E07F0042E07F00421863E07F00000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00001F001F00FF03FF03
      FF03FF03FF031F001F00FF7FFF7FFF7FFF7F000000001042FF7FFF7FFF7FFF7F
      00001863FF7FFF7FFF7FFF7F1042000010421863004218630042186300420000
      00001002FF031042000000001042000000000000000010421863FF7F0000FF7F
      FF7FFF7F00001042FF7FFF7FFF7FFF7FFF7FFF7F18631042000018631863FF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000
      0000000000000000104210421042104210420000000010421863E07F1863E07F
      E07FE07FE07F0042E07FE07FE07F00000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F1F001F00FF03FF03FF03
      FF03FF031F001F00FF7FFF7FFF7FFF7FFF7F000000001042FF7FFF7FFF7FFF7F
      0000FF7FFF7FFF7FFF7FFF7F104200001042004218630042186300000000FF03
      1002104200000000104200000000000000000000000010421863FF7FFF7FFF7F
      FF7F00001042FF7FFF7FFF7FFF7FFF7F1042FF7F186310420000104210421042
      1042104210421042104210421042104200000000000000000000000000000000
      000000000000000000000000000000000000000000001042E07F1863E07FE07F
      E07FE07FE07FE07FE07FE07F000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F1F001F00FF03FF03FF03FF03
      FF031F001F00FF7FFF7FFF7FFF7FFF7FFF7F0000104200001863FF7F0000FF7F
      0000FF7FFF7F0000FF7F186300001042004218630042000000001002FF031042
      0000000010420000000000000000000000000000104200001042FF7FFF7FFF7F
      FF7F1042FF7FFF7FFF7FFF7FFF7FFF7FFF7F1863104200001042000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010421863E07F1863E07F
      E07FE07FE07FE07FE07F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F1F001F00FF03FF03FF03FF03
      1F001F00FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000010421863FF7FFF7F
      FF7FFF7FFF7FFF7F1863104200001042186300000000FF031002104200000000
      10420000000000000000000000000000000000001863000010421863FF7F0000
      1863FF7FFF7FFF7FFF7FFF7FFF7F0000FF7F1863104200001863000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000E07F1863E07FE07F
      E07FE07FE07F000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F1F001F00FF03FF03FF031F00
      1F00FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000000010421863FF7F
      FF7FFF7FFF7F1863104200001042000000001002FF0310420000000010420000
      00000000000000000000000000000000000000000000104200001042FF7FFF7F
      FF7FFF7F0000FF7FFF7F0000FF7FFF7F18631042000010420000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F1F001F00FF03FF031F001F00
      FF7FFF7F007C007C007C007C007CFF7FFF7F0000000000000000000000001042
      1042104210420000000010421002FF0310021042000000001042000000000000
      0000000000000000000000000000000000000000000010420000000010421863
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F186310420000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F1F001F00FF031F001F00FF7F
      FF7FFF7F007C007C007CFF7FFF7FFF7FFF7F0000000000000000000010420000
      000000000000104210421002FF03104200000000104200000000000000000000
      000000000000000000000000000000000000000010420000FF7F000000001042
      104218631863FF7F186318631042104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F1F001F001F001F00FF7FFF7F
      FF7FFF7F007C007C007C007CFF7FFF7FFF7F0000000000000000000000000000
      000010420000FF03100210420000000010420000000000000000000000000000
      0000000000000000000000000000000000000000000010420000104210420000
      0000000010421042104210420000000010420000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F1F001F001F00FF7FFF7FFF7F
      FF7FFF7F007CFF7F007C007C007CFF7FFF7F0000000000000000000000000000
      0000000000000000000000001042000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042000000001863
      1042000000000000000000001042186300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F1F001F00FF7FFF7FFF7FFF7F
      FF7FFF7F007CFF7FFF7F007C007CFF7FFF7F0000000000000000000000000000
      0000000000000000104200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      1042104210421042104210421042104210421042104210421042104210421042
      1042104210421042104210421042000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      1042104210421042104210421042104210421042104210421042104210421042
      1042104210421042000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      1042186318631863186318631863186318631863186318631863186318631863
      1863186318631863186318631863000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001042
      1042104210421042104210421042104210421042104210421042104210421042
      1042104210421042000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000010421042
      1042104210421042104210421042104210421042104210421042104210421042
      1042104210421042104210421863104200000000000000000000000000000000
      0000000000000000000000000000186318631863186318631863186318631863
      1863186300000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000010421042000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000010421863
      1863186318631863186318631863186318631863186318631863186318631863
      1863186318631863186318631042104200000000000000000000000000000000
      000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      1863186300000000000000000000000000000000000000001F00FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7F000010421042000000000000000000000000000000000000000000000000
      0000000000001042186318631863186318631863186318631863186318631863
      1863186318631863186300000000000000000000000000000000104210421042
      1042104210421042104210421042104210421042104210421042104210421042
      1042104210421042104218631042104200000000000000000000000000000000
      00000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7F18630000000000000000000000000000000000001F001F001F001F001F00
      1F001F001F001F001F001F001F001F001F001F001F001F001F001F001F001F00
      FF7F000010421042000000000000000000000000000000000000000000000000
      0000000000001042FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7F18631863000000000000000000000000000000001042FF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7F104218631863104200000000000000000000000000000000
      0000000000000000FF7FFF7F186300000000000000001863FF7FFF7FFF7FFF7F
      FF7F18630000000000000000000000000000000000001F001F001F0018631F00
      18631F0018631F0018631F0018631F0018631F0018631F0018631F0018631F00
      FF7F000010421042000000000000000000000000000000000000000000000000
      0000000000001042FF7F186318631863186318631863FF7F1863186318631863
      1863186318631863FF7F0000000000000000000000000000000000001042FF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F10421863104200000000000000000000000000000000
      000000000000FF7FFF7F18630000186318631863186300001863FF7FFF7FFF7F
      FF7F00000000000000000000000000000000000000001F001F001F001F001863
      1F0018631F0018631F0018631F0018631F0018631F0018631F0018631F001F00
      FF7F000010421042000000000000000000000000000000000000000000000000
      0000000000001042FF7F1863FF7FFF7FFF7F1863FF7FFF7F186318631863FF7F
      FF7F186318631863FF7F0000000000000000000000000000000000001042FF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F10421863104200000000000000000000000000000000
      00000000FF7FFF7F18630000FF7FFF7F00001863186300001863FF7FFF7FFF7F
      000000000000000000000000000000000000000000001F001F001F0018631F00
      18631F0018631F0018631F0018631F0018631F0018631F0018631F0018631F00
      FF7F000010421042000000000000000000000000000000000000000000000000
      0000000000001042FF7F1863FF7FFF7FFF7F1863FF7FFF7F186318631863FF7F
      FF7F186318631863FF7F0000000000000000000000000000000000001042FF7F
      FF7FFF7FFF7F1863186318631863186318631863FF7F18631863186318631863
      1863186318631863FF7F10421863104200000000000000000000000000000000
      0000FF7FFF7F18630000FF7FFF7F0000FF7F1863104200001863FF7FFF7F0000
      000000000000000000000000000000000000000000001F001F001F001F001863
      1F0018631F0018631F0018631F0000001F0018631F0018631F0018631F001F00
      FF7F000010421042000000000000000000000000000000000000000000000000
      0000000000001042FF7F186318631863186318631863FF7F1863186318631863
      1863186318631863FF7F00001863186300000000000000000000000000001042
      FF7FFF7FFF7F1863FF7FFF7FFF7FFF7F1863FF7FFF7F186318631863FF7FFF7F
      186318631863FF7FFF7FFF7F1042104200000000000000000000000000000000
      FF7FFF7F18630000FF7FFF7F0000FF7FFF7F104200001863FF7FFF7F00000000
      000000000000000000000000000000000000000000001F001F001F0018631F00
      18631F0018631F0018631F0018631F000000186318631F0018631F0018631F00
      FF7F000010421042000000000000000000000000000000000000000000000000
      0000000000001042FF7F1863FF7FFF7FFF7F1863FF7FFF7F186318631863FF7F
      FF7F186318631863FF7F0000FF7FFF7F00000000000000000000000000001042
      FF7FFF7FFF7F1863FF7FFF7FFF7FFF7F1863FF7FFF7F186318631863FF7FFF7F
      186318631863FF7FFF7FFF7F1042104200000000000000000000000000000000
      FF7F18630000FF7FFF7F0000FF7FFF7F000000000000FF7FFF7F000000000000
      000000000000000000000000000000000000000000001F001F001F001F001863
      1F0018631F0018631F0018631F00186318631863186318631F0018631F001F00
      FF7F000010421042000000000000000000000000000000000000000000000000
      0000000000001042FF7F1863FF7FFF7FFF7F1863FF7FFF7F186318631863FF7F
      FF7F186318631863FF7F0000FF7FFF7F00000000000000000000000000001042
      FF7FFF7FFF7F1863186318631863186318631863FF7F186318631863FF7FFF7F
      186318631863FF7FFF7FFF7F1042104200000000000000000000000000000000
      00000000FF7FFF7F0000FF7FFF7F0000000000000000FF7F0000000000000000
      000000000000000000000000000000000000000000001F001F001F0018631F00
      18631F0018631F0018631F0018631F0018631863E07FE07F18631F0018631F00
      FF7F000010421042000000000000000000000000000000000000000000000000
      0000000000001042FF7F186318631863186318631863FF7FFF7FFF7FFF7FFF7F
      FF7F186318631863FF7F00001863FF7F00000000000000000000000000001042
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F1863FF7FFF7F18631863186318631863
      186318631863FF7FFF7FFF7F1042104200000000000000000000000000000000
      0000000000000000000000000000000000000000104200000000000000001042
      000000000000000010420000000000000000000000001F001F001F001F001863
      1F0018631F0018631F0018631F0018631F001863E07FE07FE07F18631F001F00
      FF7F000010421042000000000000000000000000000000000000000000000000
      0000000000001042FF7F1863FF7FFF7FFF7F1863FF7FFF7FFF7FFF7FFF7FFF7F
      FF7F186318631863FF7F0000FF7FFF7F00000000000000000000000000001042
      104210421042104210421042FF7FFF7F1863FF7FFF7F186318631863FF7FFF7F
      186318631863FF7FFF7FFF7F1042104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000010420000
      000200020002000200001042000000000000000000001F001F001F0018631F00
      18631F0018631F0018631F0018631F0018631F001863E07FE07FE07F18631F00
      FF7F000010421042000000000000000000000000000000000000000000000000
      0000000000001042FF7F1863FF7FFF7FFF7F1863FF7FFF7FFF7FFF7F1863FF7F
      FF7FFF7FFF7FFF7FFF7F00001863FF7F00000000000000000000000000000000
      0000000000000000000010421863186318631863FF7F186318631863FF7FFF7F
      186318631863FF7FFF7FFF7F1042104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000104200000002
      000200020002000200020000104200000000000000001F001F001F001F001863
      1F001F001F001F001F001F001F001F001F001F001F001F00E07FE07FE07F1F00
      FF7F000010421042000000000000000000000000000000000000000000000000
      0000000000001042FF7F18631863186318631863186318631863186318631863
      1863186318631863FF7F0000FF7FFF7F00000000104210420000000000000000
      000000000000000000001042FF7FFF7F1863FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      186318631863FF7FFF7FFF7F1042104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000020002
      000200020002000200020002000000000000000000001F001F001F0018631F00
      18631F00FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F1F001863E07FE07FE07F
      FF7F000010421042000000000000000000000000000000000000000000000000
      0000000000001042FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F1863FF7F
      FF7FFF7FFF7F1863FF7F00001863FF7F00001042000000001042104200000000
      186318631863186318631042FF7FFF7F1863FF7FFF7FFF7FFF7F1863FF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F1042104200000000000000000000104200000000
      0000000010420000000000000000000000000000000000000000000000020002
      000200020002000200020002000000000000000000001F001F001F001F001863
      1F001F00FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F1F001F001863E07FE07F
      E07F104210421042000000000000000000000000000000000000000000000000
      000010421042104210421042104210421042FF7FFF7FFF7FFF7FFF7F1863FF7F
      FF7FFF7FFF7F1863FF7F0000FF7FFF7F00000000000000000000000018631863
      0000000000000000000010421863186318631863186318631863186318631863
      186318631863FF7FFF7FFF7F1042104200000000000000001042000010401040
      10401040000010420000000000000000000000000000000000000000E003E003
      E00300020002000200020002000000000000000000001F001F001F0018631F00
      18631F00FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F1F0018631F001863E07F
      E07FE07F10421042104200000000000000000000000000000000000000000000
      0000000000000000000000000000000010421863186318631863186318631863
      1863186318631863FF7F00001863FF7F00000000000000000000000000000000
      000000000000000000001042FF7FFF7F1863FF7FFF7FFF7FFF7F1863FF7FFF7F
      FF7FFF7F1863FF7FFF7FFF7F1042104200000000000010420000104010401040
      10401040104000001042000000000000000000000000000000000000FF7FFF7F
      E003E0030002000200020002000000000000000000001F001F001F001F001863
      1F001F00FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F1F001F0018631F001863
      E07FE07FE07F1042104210420000000000000000000000000000104210420000
      000000000000000000000000000000001042FF7FFF7FFF7FFF7FFF7F1863FF7F
      FF7FFF7FFF7F1863FF7F0000FF7FFF7F00000000000000000000000000000000
      000000000000000000001042FF7FFF7F1863FF7FFF7FFF7FFF7F1863FF7FFF7F
      FF7FFF7F1863FF7FFF7FFF7F10421042000000000000000010401F7C1F7C1F7C
      1F7C10401040104000000000000000000000000000000000000010420000FF7F
      FF7FE0030002000200020000104200000000000000001F001F001F0018631F00
      18631F00FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F1F0018631F0018631F00
      FF7FE07FE07FE07F104210421042000000000000000000001042000000001042
      104200000000186318631863186318631042FF7FFF7FFF7FFF7FFF7F1863FF7F
      FF7FFF7FFF7F1863FF7F00001863FF7F00000000000000001042104200000000
      0000000000000000000010421863186318631863186318631863186318631863
      186318631863FF7FFF7FFF7F1042104200000000000000001F7C1F7C1F7C1F7C
      1F7C1F7C10401040000000000000000000000000000000000000000010420000
      FF7FE0030002000200001042000000000000000000001F001F001F001F001863
      1F001F00FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F1F001F0018631F001F00
      FF7F0000E07FE07FE07F10421042104200000000000000000000000000000000
      0000186318630000000000000000000010421863186318631863186318631863
      1863186318631863FF7F0000FF7FFF7F00000000104210420000000018631863
      000000000000000000001042FF7FFF7F1863FF7FFF7FFF7FFF7F1863FF7FFF7F
      FF7FFF7F1863FF7FFF7FFF7F1042104200000000000000001F7C1F7C1F7C1F7C
      1F7C1F7C10401040000000000000000010420000000000000000104200001042
      000000000000000010420000000000000000000000001F001F001F0018631F00
      18631F001F001F001F001F001F001F001F001F001F001F0018631F0018631F00
      FF7F00001042E07FFF7FFF7F1042104200000000000000000000000000000000
      000000000000000000000000000000001042FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7F000000000000000000001863FF7F00000000000000000000000000000000
      186318631863186318631042FF7FFF7F1863FF7FFF7FFF7FFF7F1863FF7FFF7F
      FF7FFF7F1863FF7FFF7FFF7F104210420000000000000000FF7FFF7F1F7C1F7C
      1F7C1F7C10401040000000000000104200000042004200420042000010420000
      000000000000000000000000000000000000000000001F001F001F001F001863
      1F0018631F0018631F0018631F0018631F0018631F0018631F0018631F001F00
      FF7F000010420000FF7FFF7FFF7F104200000000000000000000000000000000
      000000000000000000000000000000001042186318631863186318631863FF7F
      FF7F1042FF7F18630000FF7FFF7FFF7F00000000000000000000000000000000
      0000000000000000000010421863186318631863186318631863186318631863
      186318631863FF7FFF7FFF7F1042104200000000000010420000FF7FFF7F1F7C
      1F7C1F7C10400000104200001042000000420042004200420042004200001042
      000000000000000000000000000000000000000000001F001F001F0018631F00
      18631F0018631F0018631F0018631F0018631F0018631F0018631F0018631F00
      FF7F0000000000000000FF7F007C007C00000000000000000000000000001042
      104200000000000000000000000000001042FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7F104218630000FF7FFF7F1863FF7F00000000000000000000000000000000
      00000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F10421042000000000000000010420000FF7F1F7C
      1F7C1040000010420000000000000042E07FE07FE07FE07F0042004200420000
      000000000000000000000000000000000000000000001F001F001F001F001863
      1F0018631F0018631F0018631F0018631F0018631F0018631F0018631F001F00
      FF7F00000000000000000000007C000000000000000000000000104210420000
      000018631863000000000000000000001042FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7F10420000FF7FFF7FFF7FFF7FFF7F00000000000000000000000000001042
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F1042104200000000000000000000104200000000
      0000000010420000000000000000E07FE07FE07FE07FE07FE07F004200420000
      000000000000000000000000000000000000000000001F001F001F0018631F00
      18631F0018631F0018631F0018631F0018631F0018631F0018631F0018631F00
      1F00000000000000000000000000000000000000000000000000000000000000
      0000000000001863186318631863186310421863104210421042104210421042
      10421042FF7FFF7FFF7FFF7F1863FF7F00000000000000000000000000001042
      FF7F1042FF7F1042FF7F1042FF7F1042FF7F1042FF7F1042FF7F1042FF7F1042
      FF7F1042FF7F1042FF7F10421042104200000000000000000000000000000000
      0000000000000000000000000000E07FE07FE07FE07FE07FE07F004200420000
      000000000000000000000000000000000000000000001F001F001F001F001F00
      1F001F001F001F001F001F001F001F001F001F001F001F001F001F001F001F00
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000001042FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7F000000000000000000000000000000000000000000000042
      1863E07F1863E07F1863E07F1863E07F1863E07F1863E07F1863E07F1863E07F
      1863E07F1863E07F1863E07F0042104200000000000000000000000000000000
      0000000000000000000000000000FF7FFF7FE07FE07FE07FE07F004200420000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000018631863186318631863186318631863
      186318631863FF7F1042FF7F1863000000000000000000000000000000000042
      E07F1863E07F1863E07F1863E07F1863E07F1863E07F1863E07F1863E07F1863
      E07F1863E07F1863E07F18630042004200000000000000000000000000000000
      00000000000000000000000010420000FF7FFF7FE07FE07FE07F004200001042
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000001042FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7F104218630000000000000000000000000000000000000042
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F0042004200000000000000000000000000000000
      000000000000000000000000000010420000FF7FE07FE07F0042000010420000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000001042FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7F104200000000000000000000000000000000000000000042
      E07F1863E07F1863E07F1863E07F1863E07F1863E07F1863E07F1863E07F1863
      E07F1863E07F1863E07F1863E07F004200000000000000000000000000000000
      0000000000000000000000000000000010420000000000000000104200000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000001042104210421042104210421042104210421042
      1042104210421042104200000000000000000000000000000000000000000000
      0042004200420042004200420042004200420042004200420042004200420042
      0042004200420042004200420042004200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001963514610421042314231423042
      10420F3E9552EF3D1042CE39EF3D8C31934E0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006B2D
      EF3D734E524A945294521042000000000000DF7BB342396B10427D73BE735C6B
      3B6BFA669D73734E534A6C313146324675520000000000000000000000000000
      00000000000000000000000000000000000000001042E07F1042000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E07FFF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7FE07F
      FF7FE07F00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001863000000000000000000000000
      000000000000000000000000000000000000000000000000000000000729E728
      84140000C6186B2DCE391042B55631460000FF7FDF7BD75ACF396B2DF75E3A67
      3A673963196339673A675B6B9D733A63F85E0000000000000000000000000000
      000000000000000000000000E07FFF7FE07F18630000FF7FFF7FE07F10420000
      0000000000000000000000000000000000000000000000000000000000000000
      000000420000FF7FE07FFF7FE07FFF7F00000000000000000000FF7FE07FFF7F
      E07FFF7F00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000018631863186300000000000000000000
      0000000000000000000000000000000000000000000000000000000010526821
      B362493DC4240000C618CE39AD35524A734E0000DE7B31467C6FF03D29291863
      196339673A6719671967534A7452324A00000000000000000000000000000000
      0000000000000000FF7FE07FFF7FE07FFF7FE07F000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      004200420000E07FFF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7FE07F
      FF7FE07F00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000186300001863186318630000000000000000
      00000000000000000000000000000000000000000000000000000000715A2A31
      925A6B41AB41AC49A41C0004C6186B2DCE3910421863F75EB556D75A113E2821
      F039091D85108B2D524A6C2DD03DD55A00000000000000000000000000000000
      00000000E07FFF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7F18631042
      0000000000000000000000000000000000000000000000000000000000000042
      004200420000FF7FE07FFF7FE07FFF7F00000000000000000000FF7FE07FFF7F
      E07FFF7F00000000000000000000000000000000000000000000000000000000
      0000000000000000000000001863186318630000186318631863000000000000
      00000000000000000000000000000000000000000000000000000000715A892D
      5052693D8B45AC41CD4D893DA51C0000C614524AD65AD039F041F0391963AE35
      A6183142F141AE356D316E396E35CE3900000000000000000000000000000000
      FF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7FE07F
      0042000000000000000000000000000000000000000000000000000000420042
      004200420000E07FFF7FE07FFF7FE07F0000FF7FFF7FFF7F0000E07FFF7FE07F
      FF7FE07F00000000000000000000000000000000000000000000000000000000
      0000000000000000000018630000186318631863186318631863186300000000
      00000000000000000000000000000000000000000000000000000000525A6B35
      3052493D6B3D8B45AB45AC49AD4DCC4D84182925FF7FBD739D73BD779D735B6B
      3242EF4139637C6F7B6F3653775BCE39000000000000000000000000E07FFF7F
      E07FFF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7F
      E07F004200000000000000000000000000000000000000000000004200420042
      004200420000FF7FE07FFF7F0042004200000000000000000000004200420042
      0042004200000000000000000000000000000000000000000000000000000000
      0000000000000000186318631863000018631863186318631863186318630000
      00000000000000000000000000000000000000000000000000000000515A8B35
      505A8B418B418B458B45AB45AB45EC49ED4DF04DFF7FB5562C296E316E314D2D
      B656CF39C81C4D2D6D2DD2415B6BCF3900000000000000001042E07FFF7FE07F
      FF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7FE07F
      FF7F004200420000000000000000000000000000000000000042004200420042
      004200420000E07FFF7FE07F0042004200420042004200420042004200420042
      0042004200000000000000000000000000000000000000000000000000000000
      0000000000001863000018631863186318631863186318630000000000000000
      0000000000000000FF7FFF7F00000000000000000000000000000000715A6B3D
      1152483549318C41AB41AC45AC45CC49AC499156FF7FB552EC246E294F316F29
      EC20D85A8D2D422045146D297B6BF03D000000000000FF7FE07FFF7FE07FFF7F
      E07FFF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7F
      E07FFF7F00420000000000000000000000000000000000000042004200420042
      004200420000FF7FE07FFF7F0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000001863186318630000186318631863186300000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000725AAB39
      EF4D4939C72C4A3969398B41AC49CC49AC457156FF7FB5562C2570359135B235
      92396F292939C3710228C918195F124200000000FF7FE07FFF7FE07FFF7FE07F
      FF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7FE07F
      FF7FE07F00420042000000000000000000000000000000000042004200420042
      004200420000E07FFF7F00000000E07FFF7FE07FFF7FE07FFF7FE07FFF7FE07F
      FF7FE07FFF7FE07FFF7F00000000000000000000000000000000000000000000
      0000186300001863186318631863186318630000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000505A6B3D
      CC498B45F46AC62448312935493DCC49CC49705AFF7FB5522F29F539F545143E
      F43DB23D525E296A256A63406A29F13D0000000000000000E07FFF7FE07FFF7F
      E07FFF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7F
      E07FFF7FE07F0042000000000000000000000000000000000042004200420042
      004200420000FF7F000010420000FF7FE07FFF7FE07FFF7F0000000000000000
      0000FF7FE07FFF7FE07F00000000000000000000000000000000000000000000
      186318631863000018631863186318630000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000525A8B39
      CD490E52CD492939272DE82CE72C893D8A453152FF7FB5524D2DF44515461546
      F445D43D53290A7AAD7AA25543404D2500000000000000000000E07FFF7FE07F
      FF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7FE07F
      FF7FE07FFF7F0042004200000000000000000000000000000042004200420042
      0042004200000000104210420000E07FFF7FE07FFF7FE07FFF7FE07FFF7FE07F
      FF7FE07FFF7FE07FFF7F00000000000000000000000000000000000000000000
      18631863186318631863186318630000FF7FFF7FFF7F00000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000715A6A35
      AC41D46ACC4549354A396A396C410729E72C2E4EFF7FB5520E25F43915461642
      1542D33DB2350E292F62AF7A2462A540000000000000000000000000E07FFF7F
      E07FFF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7F
      E07FFF7FE07FFF7F004200000000000000000000000000000042004200420042
      0042004200001042104210420000FF7FE07FFF7FE07FFF7F0000000000000000
      0000FF7FE07FFF7FE07F00000000000000000000000000000000000000001F00
      00001863186318631863000000000000FF7FFF7F000000000000000000000000
      00000000FF7FFF7FFF7F000000000000000000000000000000000000915A2A2D
      8B41F46A8A3D6A3549358A3D6A3DAC418C3DEE45FF7F9452C8180E292E29522D
      51312F290D29EE1CA9204F768D76A259C43C000000000000000000000000E07F
      FF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7FE07F
      FF7F004218630042004200420000000000000000000000000042004200420042
      0042004200001042104210420000E07FFF7FE07FFF7FE07F0000FF7FFF7FFF7F
      0000E07FFF7FE07FFF7F0000000000000000000000000000000000001F001F00
      1F000000186318631863186318631863000000000000FF7FFF7F0000FF7FFF7F
      FF7FFF7FFF7FFF7F0000186300000000000000000000000000000000535E2829
      6C41586BC82C4A398A394941AC41CA45AC4D7156FF7B5A6B524A524A524A514A
      514A514A5146514631421046B26E2976D27E000000000000000000000000FF7F
      E07FFF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7F
      0042186300421863004200420000000000000000000000000042004200420042
      0042004200001042104210420000FF7FE07FFF7FE07FFF7F0000000000000000
      0000FF7FE07FFF7FE07F00000000000000000000000000001863186300001F00
      1F001F000000186318631863186318630000FF7FFF7F00000000FF7FFF7FFF7F
      FF7FFF7FFF7F00001863186318630000000000000000000000000000715EE828
      6941386F083169396A41AB3DAB45CD4DED4D735AFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FBC7F1A7300000000000000000000000000000000
      FF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7FE07F
      0000004218630042186300420042000000000000000000000042004200420042
      0042004200001042104210420000E07FFF7FE07FFF7FE07FFF7FE07FFF7FE07F
      FF7FE07FFF7FE07FFF7F00000000000000000000000018630000186318630000
      1F001F001F000000186318631863186318630000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7F000018631863186318631863000000000000000000000000925AC524
      4A3D586F29358B418B3DCC45CC45EE49ED4DEC4DEB4DB3626B350D52AB45C524
      8524A941CA454E5A8F6A010C0000000000000000000000000000000000000000
      E07FFF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7F
      0000186300421863004218630042000000000000000000000042004200420042
      0042004200001042104210420000FF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7F
      E07FFF7FE07FFF7FE07F00000000000000000000186318631863000018631863
      00001F001F001F000000186318631863186318630000FF7FFF7FFF7FFF7FFF7F
      FF7F0000186318631863186318630000000000000000000000000000735AC51C
      8C4558734A398C418C41AC45AC45CD49CD490E4E2F5AA5188B3D1573505A705E
      0E52082DE728CC45905E82100000000000000000000000000000000000000000
      0000E07FFF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7F000000000000
      0000000000000000186300420042004200000000000000000042004200420042
      0042004200001042104210420000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000018631863186318631863
      186300001F001F001F0000001863186318631863186300000000000000000000
      00001863186318631863186300000000000000000000000000000000925E400C
      2939786F6A398B458B45AC45AC45CC49CC49ED510D4EB25E282558732E5A4F5A
      916291622F56082D072DA7240000000000000000000000000000000000000000
      0000FF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7F0000100210021002
      1002100210021002000018630042000000000000000000000042004200420042
      004200420000104210420000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7F000000000000000000000000000000001863186318631863
      1863186300001F001F001F000000186318631863186318631863186318631863
      18631863186318631863000000000000000000000000000000000000315A0000
      2931F46A8B41AC45AC45AC49CD45CC49CC49ED4DCD4DD466CE414F5A4F5A4F5A
      705E705E7162B16291560A350000000000000000000000000000000000000000
      00000000FF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7F000010021002FF03FF03
      FF03FF03FF031002100200000000000000000000000000000042004200420042
      0042004200001042000018631042000000000000000000000000000000000000
      0000104218630000000000000000000000000000000000000000186318631863
      18631863186300001F001F001F00000018631863186318631863186318631863
      18631863186318630000000000000000000000000000000000000000FE7F4829
      59730E52CC45CD45CD49CC45ED4DED49ED49EE4DCD49D366CD3D2F562F5A705E
      705A715E9162B26A146F3573505A6C4500000000000000000000000000000000
      00000000E07FFF7FE07FFF7FE07FFF7FE07FFF7FE07F00001002FF0310021002
      100210021002FF03100200000000000000000000000000000042004200420042
      0042004200000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7F00000000000000000000000000000000000000000000000018631863
      186318631863186300001F001F001F0000001863186318631863186318631863
      186318631863000000000000000000000000000000000000000000000000FF7F
      156F915E505AEE49CD49AC45CD45EE4D0E4E0E4E0D52D362CD3D2E562E564F5A
      4F5A705A9162B266F46E156FF26EAC4100000000000000000000000000000000
      000000000000E07FFF7FE07FFF7FE07FFF7FE07FFF7F0000FF03100210020000
      0000000010021002100200000000000000000000000000000042004200420042
      0042004200001863104200000000000000000000000000000000000000001042
      1863000000000000000000000000000000000000000000000000000000001863
      1863186318631863186300001F001F001F000000186318631863186318631863
      1863186300000000000000000000000000000000000000000000000000000000
      925ABB7F56779262505AEE51AE49ED4D0E522E521056D362AC392E5A305A4F5A
      4F5A705E4F5E9162B266136B305A000000000000000000000000000000000000
      000000000000FF7FE07FFF7FE07FFF7FE07FFF7FE07F0000FF0310020000FF03
      1002100200001002100200000000000000000000000000000042004200420042
      004200420000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      0000000000000000000000000000000000000000000000000000000000000000
      18631863186318631863186300001F001F001F00000018631863186318631863
      1863000000000000000000000000000000000000000000000000000000000000
      00000000D566DB7F3673B362305AED4DEE51EE513056D2626A35705E4F5E4F5A
      4F5A505E705E8F629166D16ACE51000000000000000000000000000000000000
      0000000000000000FF7FE07FFF7FE07FFF7FE07FFF7FE07F000010020000FF03
      1002100200001002000000000000000000000000000000000042004200420042
      0042000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000018631863186318631863186300001F001F001F0000001863186318631863
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000009256DA7F5777B25E505A0F4EEE4DB2626A35B15E915A725E
      705E915A505E905E91624F5A314E000000000000000000000000000000000000
      0000000000000000E07FFF7FE07FFF7FE07FFF7FE07F00000000000000001002
      1002100200000000000000000000000000000000000000000042004200420042
      00000000E07FFF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7F
      E07F000000000000000000000000000000000000000000000000000000000000
      0000000018631863186318631863186300001F001F001F000000186318630000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000F562DA7F156F92622F56725A6A355052515AB262
      925EB2629162915E91624F5AC61C000000000000000000000000000000000000
      00000000000000000000E07FFF7FE07FFF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000042004200420000
      0000E07FFF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7FE07F
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000018631863186318631863186300001F001F001F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000997B58775877B35E8B410F52ED49715E
      D266B266F266D366D26A4F5A0000000000000000000000000000000000000000
      00000000000000000000FF7FE07F000000000000000000000000000010021002
      1002100210020000000000000000000000000000000000000042004200000000
      E07FFF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7FE07F0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000018631863186318631863186300001F000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000003667BB7F1673CE45156B926230562E52
      905EB35EB266D366F36A705A0000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001002FF03FF03
      FF03FF03FF03100200000000000000000000000000000000004200000000E07F
      FF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7FE07F00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000018631863186318631863186300000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000B356DA7F5777B262
      305A705A915EF46E156F71560000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF0310021002
      10021002100210020000000000000000000000000000000000000000E07FFF7F
      E07FFF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7FE07F000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000001863186318631863186300000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000F462DB7F
      3673B362D362F46AF46ED3660000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000100210021002
      1002100210021002000000000000000000000000000000000000E07FFF7FE07F
      FF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7FE07FFF7FE07F0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000186318631863000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      915ABB7F3673B266F36AD36A0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000010021002
      1002100210020000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000018630000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000935A5677147300000000000000000000000000000000000000000000
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
      000000000000443944390000000000000000B421311100000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B421311100000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000524AB5561042E71C00000000000000000C15ED0C0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000CE394A290000000000000000
      0000000000000000000000000000000000000000000000000000000000004010
      4010443944394439233100000000C9107121D529311131113011000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000044042300D429D425D529311131113011000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      524AD65A18637B6F524A29254A290000860CA70C0B15ED0C0F11101100000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000630C2104EF3DEF3D10426B2D4A294A2900000000
      0000000000000000000000000000000000000000000000000000A11CA11CA645
      A645A645A6458541A11CC2204010A7106F21D42931118A048A04301110110000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C910A70C173617321632F62DF52931118A048A04301110110000
      00000000000000000000000000000000000000000000000000000000734ED65A
      1863BD77DE7BE71C29258C316B2D6B2D0000A710EB14ED0C89008A0430111011
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000C618A514314631463146314610426B2DA514A5144A294A29
      0000000000000000000000000000000000000000000003290329C74D0756E751
      E751C649C64D653DA11CC51C40106508EA14B22531158A041C5B8A048A041011
      1011000000000000000000000000000000000000000000000000000000000000
      00002D190C19163637361636163229258410F62D31158A041C5B8A048A041011
      101100000000000000000000000000000000000000000000734EF75E1863DE7B
      FF7F4A29E71C524AE71CAD358C318C310000A7100B19ED0C89001B5B8A048A04
      1011101100000000000000000000000000000000000000000000000000000000
      000000000821E71CCE39EF3DEF3D10423146314631466B2DA5143967A514A514
      4A294A2900000000000000000000000000000000000007564862085A0856E755
      E751C74DE75103299C73E61C44394010A7106F2131118A041C5BF62DF62D8A04
      8A04101110110000000000000000000000000000000000000000000000000000
      4F1D583E583A573A4A2900004A2939671632163232158A041C5BF62DF62D8A04
      8A0410111011000000000000000000000000AD35734EF75E3967DE7BDE7B4A29
      4A29524AD65AD65AE71CCE39AD35AD350000A7100B19ED0C89001B5BF62DF62D
      8A048A0410111011000000000000000000000000000000000000000000000000
      0000C6184A294A294A294A298C31EF3D1042314631466B2DA514396710421042
      A514A5144A294A29000000000000000000000000000048624962285E085AE755
      E755E755E75503299C73E61C44394010650CEA180F118A041C5B1732F62DF62D
      F6298A048A0410110F1100000000000000000000000000000000000000000000
      4F1D583E583E0000000000004A2937361736173252158A041C5B1732F62DF62D
      F6298A048A0410110F110000000000000000AD351863BD77BD774A294A29524A
      F75ED65AD65AD65AE71CCE39CE39AD350000A8100B19ED0C89001B5B1732F62D
      F62DF6298A048A0410110F110000000000000000000000000000000000000000
      000084100821E71CE71C08214A29CE393146524A524A6B2DA514396731461042
      10421042A514A5144A2929250000000000000000AA6E696A49624862285E4862
      4862AA6EAA6E9C739C730725653D85414010EA180F118A041C5B3736F62DF62D
      F62DD529D5258A048A040F110000000000000000000000000000000000000000
      4F1D783E583E0000000000004A2929258410163252158A041C5B3736F62DF62D
      F62DD529D5258A048A040F110000000000000000AD354A294A29524AF75EF75E
      F75EF75ED65AD65AEF3DE71CAD35CE390000C8100B19ED1089001B5B3736F62D
      F62DF62DD529D5258A048A040F11000000000000000000000000000000000000
      00000000000000000000E71C4A29EF3D3146524A31468C31A5143967524A3146
      104210421042EF3DA514A5142925000000000000AA6E8A6E8A6AAA72AA72CB76
      EB7AFF7FFF7F3967F75E6639A645A6454010912932158A041C5B783EF62DFB4E
      FF7FF62DB4259321711D8A040000000000000000000000000000000000000000
      4F1D783E783E0000000000004A2939673736373652158A041C5B783EF62DFB4E
      FF7FF62DB4259321711D8A040000000000000000AD35D65A1863F75EF75E607C
      F75EF75EF75E5A6B524AAD35C618CE390000C8100C1DEE1089001B5B783EF62D
      FB4EFF7FF62DB4259321711D8A04000000000000FF7F18631863F75EF75EF75E
      B556B556945210420000E71C4A29EF3D3146524A524A8C31A514396794521042
      F75EFF7F1042CE39CE398C31A51400000000EB7EAA72AA6EEB7E4D7F4D7FFF7F
      FF7F9C735A6BE755E75549624D7F4D7FD32D153252158A041C5B1C5B583E1632
      F62DFF7BFE4EB42592218A040000000000000000000000000000000000000000
      4F1D7842783E0000000000004A29573A3736373653158A041C5B1C5B583E1632
      F62DFF7BFE4EB42592218A040000000000000000AD35F75E1863F75EF75E8007
      18635A6B7B6FAD35AD35AD352925EF3D0000A7100B19ED1089001B5B1C5B583E
      1632F62DFF7BFE4EB42592218A04000000000000FF7F3967186318631863D65A
      D65AB556B556524A000008214A29EF3D524A524A524A8C31A51439673967734E
      31463146FF7F1863EF3DAD35A514000000000C7F0B7F4D7F4D7FFF7FFF7FFF7F
      BD774862486248624D7F4D7FF4313636373A373A531553158A048A04BA4E583E
      1632F62DF62DD529B4258A040000000000000000000000000000000000000000
      4F1D794279420000000000004A2929258410373A531553158A048A04BA4E583E
      1632F62DF62DD529B4258A040000000000000000AD3518631863186318639C73
      7B6F10421042F75EB55631463146EF3D0000A7100B19EC0C301189048A04BA4E
      583E1632F62DF62DD529B4258A04000000000000FF7F39673967186300000000
      31469452D65A734E000008216B2D1042524A734E734E8C318C31A514A514D65A
      734E314631461042EF3DCE39A514000000004D7F4D7F0000FF7FFF7FFF7FAA6E
      AA6EAA6E4D7F4D7F1436363A583E583E373A573A53158A04531552158A048A04
      DB529946F62DF62DD5298A040000000000000000000000000000000000000000
      4F1D99467942000000000000E71CE71C373A573A53158A04531552158A048A04
      DB529946F62DF62DD5298A040000000000000000AD35186339677B6F7B6F1042
      1042F75E3967E71C7B6F94521042EF3D0000A710E914CB0C6800311552158A04
      8A04DB529946F62DF62DD5298A04000000000000FF7F5A6B5A6B0000D65A1863
      0000B556D65AB556000008214A291042734E524A734E8C31A5148C318C31A514
      A514F75EB556314610421042A5140000000000000000000000004D7FEB7EEB7E
      4D7F4D7F353A7842783E7942783E583E583E583A73158A048A048A0452155215
      8A048A04FB56583EF62D8A040000000000000000000000000000000000000000
      4F1DBA4A9A460000E71CE71CEF3DE71C373A583A73158A048A048A0452155215
      8A048A04FB56583EF62D8A040000000000000000AD357B6F9C7310421042F75E
      F75E5A6B7B6F9C73BD779C73B5568C310000A710C814A908670089008A045215
      52158A048A04FB56583EF62D8A04000000000000FF7F5A6B5A6B000039671863
      0000D65AB556D65A000008216B2D1042734E734E734E8C31A514A514A5148C31
      8C31A514A5141863734E1042A51400000000000000000000000000004D7F4D7F
      2D197842BA4A994699427942783E783E583E583A73198A045D6317328A048A04
      521552158A048A0499468A040000000000000000000000000000000000000000
      4F1D9946E71CE71CEF3DEF3D734EE71C8410583A73198A045D6317328A048A04
      521552158A048A0499468A04000000000000000000001042734E186339675A6B
      39679C73BD77BD779C73D65AAD351042AD350000A71088084600B852F6318A04
      8A04521552158A048A0499468A04000000000000FF7F7B6F7B6F000000003967
      0000D65AF75EF75E000008216B2D1042734E734E734EAD35A5145A6B524AA514
      A5148C316B2DA514A514B556A514000000000000000000000000000000000000
      4F1DBA4A99469946994699427842783E783E373A52158A045D633736F62DF62D
      8A048A04521532158A048A040000000000000000000000000000000000000000
      4F1DBA4AE71CEF3D734E39671863EF3D783E373A52158A045D633736F62DF62D
      8A048A04521532158A048A0400000000000000000000104239675A6B7B6F9C73
      BD77BD779C73D65A104210427B6FBD77734E0000C814A8084600B8521636F62D
      F62D8A048A04521532158A048A04000000000000FF7F9C737B6F000039670000
      000018631863F75E000008216B2D1042734E9452524A8C31A5145A6B524A1042
      1042A514A5146B2D6B2DA514A514000000000000000000000000000000000000
      4F1DDA4EBA4ABA46994699467942783E583E163631158A045D63373AF62DF62D
      F62DF6298A048A04321531150000000000000000000000000000000000000000
      4F1DDA4EEF3D39673967EF3DEF3D783E583E163631158A045D63373AF62DF62D
      F62DF6298A048A04321531150000000000000000000010427B6F9C739C73BD77
      9C731863104210425A6B5A6B3967FF7F734EAD350000CA0C6700FA56373AF62D
      F62DF62DF6298A048A0432153115000000000000FF7F9C73BD770000DE7B7B6F
      0000396718631863000008218C313146734E734E524A6B2DA5145A6B734E3146
      104210421042A514A5146B2D6B2D000000000000000000000000000000000000
      4F1DBA4EDA4EBA4ABA4699467942783E583AF52D0F118A045D63583E17321D53
      FF7F172ED529B4258A048A040000000000000000000000000000000000000000
      4F1DBA4EBA4AEF3DEF3D00004A2929258410F52D0F118A045D63583E17321D53
      FF7F172ED529B4258A048A0400000000000000000000000010429C737B6F1863
      104210427B6F7B6F7B6F5A6B5A6B9C73FF7F734E0000CC0C89003B5F583E1732
      1D53FF7F172ED529B4258A048A04000000000000FF7FFF7FDE7B0000DE7B7B6F
      00003967F75ED65A00004A29AD353146734E734E10424A29A5145A6B94523146
      1863FF7F3146EF3DEF3DA514A514000000000000000000000000000000000000
      4F1DFB52BA4ADA4EBA4A99427842583A3736F52D8A048A045D63FB52583E1632
      F62DFF7BBB46B32571218A040000000000000000000000000000000000000000
      4F1DFB52BA4A0000000000004A2939673736F52D8A048A045D63FB52583E1632
      F62DFF7BBB46B32571218A040000000000000000000000000000104210421042
      AD35FF7FBD777B6F7B6F5A6B5A6B5A6B4A294A29B32589008A043C63FB52583E
      1632F62DFF7BBB46B32571218A04000000000000FF7FDE7BBD77396700000000
      7B6F7B6F396718630000CE391042734E524A524A1042A514A5145A6B18639452
      31463146FF7FD65ACE398C31A514000000000000000000000000000000000000
      4F1DFB52DB4EBA4A99467842583E583E93214F1DD525B5258A048A04FB52DB52
      1632F62DF62DD529B4258A040000000000000000000000000000000000000000
      4F1DFB52DB4E00000000AD35583E583E93214F1DD525B5258A048A04FB52DB52
      1632F62DF62DD529B4258A040000000000000000000000000000000000000000
      0000AD35FF7F7B6F7B6F7B6FAD35AD35153672214E1DD525B5258A048A04FB52
      DB521632F62DF62DD529B4258A04000000000000FF7FFF7FFF7FDE7BDE7B9C73
      7B6F5A6B5A6B39670000524A734E734E734ECE396B2DEF3DEF3DA514A5141863
      F75E3146314610421042EF3DA514000000000000000000000000000000000000
      4F1DDB4EBA4A99469946583E93219321BA4ADA52573AD525B525B5258A048A04
      DA4EDA52F62DF62DD5298A040000000000000000000000000000000000000000
      4F1DDB4EBA4A99469946583E93219321BA4ADA52573AD525B525B5258A048A04
      DA4EDA52F62DF62DD5298A040000000000000000000000000000000000000000
      0000AD35FF7FBD77AD35AD35153672219221B94ADA4E573AD525B525B5258A04
      8A04DA4EDA52F62DF62DD5298A04000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7F94529452734ECE39CE39D65AF75E734EEF3DEF3DEF3DA514
      A514F75EF75E314610421042A514000000000000000000000000000000000000
      4F1DB94A9946583E93219321DA4EFB52DB527D673C5FFB56783EB525B525B525
      8A048A04DA52DB52F62D8A040000000000000000000000000000000000000000
      4F1DB94A9946583E93219321DA4EFB52DB527D673C5FFB56783EB525B525B525
      8A048A04DA52DB52F62D8A040000000000000000000000000000000000000000
      00004F1DAD35AD35373A92219221BA4AFB52DB527D673C5FFB56783EB525B525
      B5258A048A04DA52DB52F62D8A04000000000000000000000000000000000000
      00006B2DB556B556734ECE39CE39D65A1863F75E7B6F5A6B18639452EF3DEF3D
      EF3DA514A514F75EF75E1042A514000000000000000000000000000000000000
      4F1D583E93219321FB521C5BFB567E6B7E6B3C631C5B1B57FB56DA52583EB525
      B525B5218A048A04BA4A8A040000000000000000000000000000000000000000
      4F1D583E93219321FB521C5BFB567E6B7E6B3C631C5B1B57FB56DA52583EB525
      B525B5218A048A04BA4A8A040000000000000000000000000000000000000000
      00004F1D583E93219321FB521C5BFB567E6B7E6B3C631C5B1B57FB56DA52583E
      B525B525B5218A048A04BA4A8A04000000000000000000000000000000000000
      00006B2D734ECE39CE39F75E396718639C739C735A6B396718631863F75E734E
      EF3DEF3DEF3DA514A514D65AA514000000000000000000000000000000000000
      4F1DF52DFB563C633C5FFF7FFF7B7E6B7D673D631C5B1B5BFB56FB56DA52DA52
      583AB525B521B5218A048A040000000000000000000000000000000000000000
      4F1DF52DFB563C633C5FFF7FFF7B7E6B7D673D631C5B1B5BFB56FB56DA52DA52
      583AB525B521B5218A048A040000000000000000000000000000000000000000
      00004F1DF52DFB563C633C5FFF7FFF7B7E6B7D673D631C5B1B5BFB56FB56DA52
      DA52583AB525B521B5218A048A04000000000000000000000000000000000000
      00006B2D104218635A6B5A6BFF7FFF7F9C737B6F5A6B3967396718631863F75E
      F75E734EEF3DEF3DEF3DA514A514000000000000000000000000000000004F1D
      DA525D675D63FF7FFF7FBF739E6F7E6B7D673C5F3C5F1C5B1B5BFB56FB56DA52
      DA4EDA4E373AB521B521B5210000000000000000000000000000000000004F1D
      DA525D675D63FF7FFF7FBF739E6F7E6B7D673C5F3C5F1C5B1B5BFB56FB56DA52
      DA4EDA4E373AB521B521B5210000000000000000000000000000000000000000
      4F1DDA525D675D63FF7FFF7FBF739E6F7E6B7D673C5F3C5F1C5B1B5BFB56FB56
      DA52DA4EDA4E373AB521B521B521000000000000000000000000000000000000
      6B2DF75E7B6F7B6FFF7FFF7FBD779C739C737B6F5A6B39673967396718631863
      F75EF75ED65A734EEF3DEF3DCE39000000000000000000000000000000004F1D
      3C5FFF7FFF7FFF7FDF77BF73BE6F7D6B5D635D633C5F3C5F1C5B1B5BFB56FB56
      DA52DA4EDA4EBA4A3736B521B521000000000000000000000000000000004F1D
      3C5FFF7FFF7FFF7FDF77BF73BE6F7D6B5D635D633C5F3C5F1C5B1B5BFB56FB56
      DA52DA4EDA4EBA4A3736B521B521000000000000000000000000000000000000
      4F1D3C5FFF7FFF7FFF7FDF77BF73BE6F7D6B5D635D633C5F3C5F1C5B1B5BFB56
      FB56DA52DA4EDA4EBA4A3736B521B52100000000000000000000000000000000
      6B2D5A6BFF7FFF7FFF7FDE7BDE7BBD779C737B6F5A6B5A6B3967396739671863
      1863F75EF75ED65AD65A524AEF3DCE3900000000000000000000000000004F1D
      DF77FF7FFF7FFF7FDF77DF77BF737E6B7D675D635D633C5F3C5F1C5B1B5BFB56
      FB56DA52DA4EDA4EBA4AB94A3736000000000000000000000000000000004F1D
      DF77FF7FFF7FFF7FDF77DF77BF737E6B7D675D635D633C5F3C5F1C5B1B5BFB56
      FB56DA52DA4EDA4EBA4AB94A3736000000000000000000000000000000000000
      4F1DDF77FF7FFF7FFF7FDF77DF77BF737E6B7D675D635D633C5F3C5F1C5B1B5B
      FB56FB56DA52DA4EDA4EBA4AB94A373600000000000000000000000000000000
      6B2DDE7BFF7FFF7FFF7FDE7BDE7BBD779C737B6F7B6F5A6B5A6B396739673967
      18631863F75EF75ED65AD65AD65A524A00000000000000000000000000000000
      4F1D4F1DDF77FF7FFF7FDF77BE6F9E6B7D677D675D635D633C5F3C5F1C5B1B5B
      FB56FB56DA52DA4EDA4E00000000000000000000000000000000000000000000
      4F1D4F1DDF77FF7FFF7FDF77BE6F9E6B7D677D675D635D633C5F3C5F1C5B1B5B
      FB56FB56DA52DA4EDA4E00000000000000000000000000000000000000000000
      00004F1D4F1DDF77FF7FFF7FDF77BE6F9E6B7D677D675D635D633C5F3C5F1C5B
      1B5BFB56FB56DA52DA4EDA4E0000000000000000000000000000000000000000
      00006B2D6B2DDE7BFF7FFF7FDE7BBD779C737B6F7B6F7B6F5A6B5A6B39673967
      396718631863F75EF75ED65A0000000000000000000000000000000000000000
      000000004F1D4F1DDF77DF77BE6FBE739E6F7E6B7D675D635D633C5F3C5F1C5B
      1B5BFB56FB560100000000000000000000000000000000000000000000000000
      000000004F1D4F1DDF77DF77BE6FBE739E6F7E6B7D675D635D633C5F3C5F1C5B
      1B5BFB56FB560100000000000000000000000000000000000000000000000000
      0000000000004F1D4F1DDF77DF77BE6FBE739E6F7E6B7D675D635D633C5F3C5F
      1C5B1B5BFB56FB56010000000000000000000000000000000000000000000000
      0000000000006B2D6B2DDE7BDE7BBD77BD779C739C737B6F7B6F5A6B5A6B3967
      3967396718631863000000000000000000000000000000000000000000000000
      00000000000000004F1D4F1D7E6B7E6B9E6F9E6B7E6B7D675D635D633C5F3C5F
      1C5B440423000000000000000000000000000000000000000000000000000000
      00000000000000004F1D4F1D7E6B7E6B9E6F9E6B7E6B7D675D635D633C5F3C5F
      1C5B440423000000000000000000000000000000000000000000000000000000
      000000000000000000004F1D4F1D7E6B7E6B9E6F9E6B7E6B7D675D635D633C5F
      3C5F1C5B44042300000000000000000000000000000000000000000000000000
      000000000000000000006B2D6B2D9C739C73BD779C739C737B6F7B6F5A6B5A6B
      39673967630C2104000000000000000000000000000000000000000000000000
      0000000000000000000000004F1D4F1D7E6B9E6F7E6B7D677D675D635D63A80C
      8708000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000004F1D4F1D7E6B9E6F7E6B7D677D675D635D63A80C
      8708000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000004F1D4F1D7E6B9E6F7E6B7D677D675D635D63
      A80C870800000000000000000000000000000000000000000000000000000000
      00000000000000000000000000006B2D6B2D9C739C739C737B6F7B6F7B6F5A6B
      C618A51400000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000004F1D4F1D7E6B7E6B7D670C19EB140000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000004F1D4F1D7E6B7E6B7D670C19EB140000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004F1D4F1D7E6B7E6B7D670C19EB14
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006B2D6B2D9C739C737B6F29250821
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000004F1D4F1D4F1D000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000004F1D4F1D4F1D000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004F1D4F1D4F1D00000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006B2D6B2D6B2D00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002118
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000443944390000000000000000B421311100000000000000000000
      00000000000000000000000000000000000000000000000000000000003C0034
      2118000000000000000000000000000000000000B42131110000000000000000
      0000000000000000000000000000000000000000AD3521042104210421042104
      210442089452945294529452734E734E734E524A1042EF3DCE39630C00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004010
      4010443944394439233100000000C9107121D529311131113011000000000000
      0000000000000000000000000000000000000000000000000000004000340038
      00342118000000000000000044042300D429D425D52931113111301100000000
      0000000000000000000000000000000000000000734E29252925292508210821
      0821E71C1863F75EF75EF75EF75EF75ED65AD65AD65AD65AD65A2925734E0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A11CA11CA645
      A645A645A6458541A11CC2204010A7106F21D42931118A048A04301110110000
      00000000000000000000000000000000000000000000000000000040003C0040
      003800342118000044046508F63116321632F62DF52931118A048A0430111011
      0000000000000000000000000000000000000000734E4A29292529250821E71C
      E71CE71C18631863F75EF75EF75EF75EF75ED65AD65AD65AD65A8C31D65AEF3D
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000003290329C74D0756E751
      E751C649C64D653DA11CC51C40106508EA14B22531158A041C5B8A048A041011
      10110000000000000000000000000000000000000000000000400048004C0044
      0040003C00382118650CEA149125F52D16321632F62D31158A041C5B8A048A04
      1011101100000000000000000000000000000000734E4A294A292925E71C8410
      8410C618F75E18631863F75EF75EF75EF75EF75ED65AD65AD65ACE393967734E
      B55600000000000000000000000000000000000000007646353E343A343A343A
      143A143613361336F335F331F331F231D22DD22DD22DB129B125912590219021
      701D4F1D4E192E190B1100000000000000000000000007564862085A0856E755
      E751C74DE75103299C73E61C44394010A7106F2131118A041C5BF62DF62D8A04
      8A04101110110000000000000000000000000000000000000048004C0058004C
      00480048004000402118650CE9149125D52D1632163232158A041C5BF62DF62D
      8A048A0410111011000000000000000000000000734E4A294A29082184104208
      4208630C524AF75E18631863F75EF75EF75EF75EF75ED65AD65A10429C731863
      F75EB556000000000000000000000000000000000000D8527646764676427542
      55425542343E343A133A133A1336F235F235F231F231F231F231F231F231F331
      F331D22DD22DD22D2E1900000000000000000000000048624962285E085AE755
      E755E755E75503299C73E61C44394010650CEA180F118A041C5B1732F62DF62D
      F6298A048A0410110F1100000000000000000000000000500054005C0068005C
      0054004C0048004400402118850CE91491291632173252158A041C5B1732F62D
      F62DF6298A048A0410110F110000000000000000734E4A294A29082100000000
      420842084A29524AF75E18631863F75EF75EF75EF75EF75ED65A734EFF7FFF7F
      DE7B9C735A6B00000000000000000000000000000000D8527646B02DB74ED856
      F856D856B752954E744A744A534A534A534A534A534A744A744A954ED756195F
      1A5F3A63D852D22D4E1900000000000000000000AA6E696A49624862285E4862
      4862AA6EAA6E9C739C730725653D85414010EA180F118A041C5B3736F62DF62D
      F62DD529D5258A048A040F1100000000000000000000005C00600064006C0068
      006000580054004C004800402118850C0A19D32D163252158A041C5B3736F62D
      F62DF62DD529D5258A048A040F11000000000000734E6B2D4A2929258C312925
      00004208A5144A29524AF75E18631863F75EF75EF75EF75EF75EF75E94529452
      9452524A3146CE390000000000000000000000000000D852964A6604F75EF75E
      D65A94521042AD356B2D6B2D4A294A294A294A294A294A294A296B2DCE391042
      314631463A63D22D6F1D00000000000000000000AA6E8A6E8A6AAA72AA72CB76
      EB7AFF7FFF7F3967F75E6639A645A6454010912932158A041C5B783EF62DFB4E
      FF7FF62DB4259321711D8A040000000000000000005842700068006000680074
      21780074006800600058004C00302118C814D32D373652158A041C5B783EF62D
      FB4EF62DF62DB4259321711D8A04000000000000734E6B2D6B2DAD353146AD35
      29250000A514A5144A29524AF75E18631863F75EF75EF75EF75EF75ED65AD65A
      D65AD65AD65A10420000000000000000000000000000D856964A6604F75EF75E
      D65A734ECE394A290821E71CE71CE71CE71CE71CE71CE71CE71C29258C31EF3D
      314631463A63F331701D0000000000000000EB7EAA72AA6EEB7E4D7F4D7FFF7F
      FF7F9C735A6BE755E75549624D7F4D7FD32D153252158A041C5B1C5B583E1632
      F62DFF7BFE4EB42592218A0400000000000000002158637C007400600068007C
      637C8C7D007400740068005800442120C814D22D163653158A041C5B1C5B583E
      1632F62DFF7BFE4EB42592218A04000000000000734E6B2D6B2D6B2DCE39B556
      AD3529250000A514A5144A29524AF75E18631863F75EF75EF75EF75ED65AD65A
      D65AD65AD65A734E0000000000000000000000000000D856974A66041863F75E
      D65A524A00000000000000000000000000000000000000000000E71C6B2DEF3D
      3146524A3A63F331902100000000000000000C7F0B7F4D7F4D7FFF7FFF7FFF7F
      BD774862486248624D7F4D7FF4313636373A373A531553158A048A04BA4E583E
      1632F62DF62DD529B4258A040000000000000000425C297D007C00740060006C
      C67C947A4A7DC67842740064005421300B19F431373A531553158A048A04BA4E
      583E1632F62DF62DD529B4258A04000000000000734E8C316B2D6B2D6B2D1042
      B556AD3529250000A514A5144A29524AD65AD65A9452734E734E734E734EB556
      D65AD65AD65A734E0000000000000000000000000000F956974A660418631863
      D65AA51418637B6F7B6F7B6F7B6F7B6F7B6F7B6F5A6B3967186300006B2DEF3D
      524A524A3A63F331912100000000000000004D7F4D7F0000FF7FFF7FFF7FAA6E
      AA6EAA6E4D7F4D7F1436363A583E583E373A573A53158A04531552158A048A04
      DB529946F62DF62DD5298A040000000000000000A5648C7D297D007C00740060
      E77CAD7D947A8C7D087900740060003CB22D1636573A53158A04531552158A04
      8A04DB529946F62DF62DD5298A04000000000000734E8C318C316B2D6B2D6B2D
      1042D65ACE39292500008410A5144A293146524ACE39AD35AD35AD35CE393146
      734EB556D65A734E0000000000000000000000000000F956B74E660418631863
      F75EEF3DFF7F627A627A627A627A627A627A417A417A407A39670000AD353146
      524A524A3A63F3319125000000000000000000000000000000004D7FEB7EEB7E
      4D7F4D7F353A7842783E7942783E583E583E583A73158A048A048A0452155215
      8A048A04FB56583EF62D8A0400000000000000000000E77C317E297D007C0054
      0000E77CAD7D087D427C007C0054D22D373A583E583A73158A048A048A045215
      52158A048A04FB56583EF62D8A04000000000000734E8C318C318C316B2D6B2D
      6B2D104239671042292500008410C6186B2DCE39524A734E524A1042CE396B2D
      6B2DCE39314610420000000000000000000000000000F95AB74E660439671863
      1863EF3D7B6F0E7F837A837A837A0000837A627A627ACA76945200001042524A
      734E734E3A631336B1250000000000000000000000000000000000004D7F4D7F
      2D197842BA4A994699427942783E783E583E583A73198A045D6317328A048A04
      521552158A048A0499468A04000000000000000000000000E77C637421640000
      00004F1DE77CA57442700070353A573E583E583E583A73198A045D6317328A04
      8A04521552158A048A0499468A04000000000000734EAD358C318C318C316B2D
      6B2D6B2D10429C73EF3D630C00006B2D29258410630C0000000000000821E71C
      E71CC618E71CE71C0000000000000000000000000000F95AB74E660439673967
      18639452EF3DFF7F847A847A847A847A847A837A627A7B6F0000CE393146734E
      734E734E3A631336B22900000000000000000000000000000000000000000000
      4F1DBA4A99469946994699427842783E783E373A52158A045D633736F62DF62D
      8A048A04521532158A048A040000000000000000000000000000000000000000
      00004F1DBA4A99469946994699427842783E783E373A52158A045D633736F62D
      F62D8A048A04521532158A048A04000000000000734EAD35AD358C318C318C31
      6B2D6B2D5A6B10428C31E05D2039630CC61809214B294B292921E71C630C0000
      8410630C630C630C0000000000000000000000000000195BB74E660439673967
      39671863EF3DFF7F0F7FA67E847A0000847A847ACC767B6F00001042734E9452
      9452734E3A631436D22D00000000000000000000000000000000000000000000
      4F1DDA4EBA4ABA46994699467942783E583E163631158A045D63373AF62DF62D
      F62DF6298A048A04321531150000000000000000000000000000000000000000
      00004F1DDA4EBA4ABA46994699467942783E583E163631158A045D63373AF62D
      F62DF62DF6298A048A0432153115000000000000734EAD35AD35AD358C318C31
      8C316B2D5A6B5A6BAD35287FC6184B298C2DAE35CF358D316C2D6C296B29C618
      00000000000000000000000000000000000000000000195FD85266045A6B3967
      39673967B556EF3DFF7FA77EA77E0000847A847A7B6F0000CE39524A94529452
      945294523A631436D22D00000000000000000000000000000000000000000000
      4F1DBA4EDA4EBA4ABA4699467942783E583AF52D0F118A045D63583E17321D53
      FF7F172ED529B4258A048A040000000000000000000000000000000000000000
      00004F1DBA4EDA4EBA4ABA4699467942783E583AF52D0F118A045D63583E1732
      1D53172E172ED529B4258A048A04000000000000734EAD35AD35AD35AD358C31
      8C318C315A6B5A6B5A6B4B298C318C318C2D8C31AE35AE35CE35CF39F039F039
      092100004A291042524A524A524A31460000000000001A5FD85266045A6B5A6B
      396739671863EF3DFF7F317FC87E0000637AED767B6F000031469452B556B556
      B55694521A5F343AD22D00000000000000000000000000000000000000000000
      4F1DFB52BA4ADA4EBA4A99427842583A3736F52D8A048A045D63FB52583E1632
      F62DFF7BBB46B32571218A040000000000000000000000000000000000000000
      00004F1DFB52BA4ADA4EBA4A99427842583A3736F52D8A048A045D63FB52583E
      1632F62DFF7BBB46B32571218A04000000000000734ECE39AD35AD35AD35AD35
      8C318C317B6F5A6B9452EF391142534A534A32421142EF39CF39CF39AE35AE39
      AE39C71CE71C8C311042734E524A524A0000000000001A5FD85266045A6B5A6B
      5A6B39673967B556EF3DFF7FC97E0000A77E7B6F0000EF3D734EB556B556B556
      B5569452195F343AF33100000000000000000000000000000000000000000000
      4F1DFB52DB4EBA4A99467842583E583E93214F1DD525B5258A048A04FB52DB52
      1632F62DF62DD529B4258A040000000000000000000000000000000000000000
      00004F1DFB52DB4EBA4A99467842583E583E93214F1DD525B5258A048A04FB52
      DB521632F62DF62DD529B4258A04000000000000734ECE39CE39AD35AD35AD35
      AD358C317B6F7B6F734E1142954E954E954E954E954E534A3246F0398C396B3D
      8D3D2A2D630C0821EF3D734E734E734E0000000000003A63D85666047B6F5A6B
      5A6B5A6B39673967EF3DFF7F517FC87EA77E7B6F0000524AB556D65AD65AB556
      B556B556F95A343AF33100000000000000000000000000000000000000000000
      4F1DDB4EBA4A99469946583E93219321BA4ADA52573AD525B525B5258A048A04
      DA4EDA52F62DF62DD5298A040000000000000000000000000000000000000000
      00004F1DDB4EBA4A99469946583E93219321BA4ADA52573AD525B525B5258A04
      8A04DA4EDA52F62DF62DD5298A04000000000000734ECE39CE39CE39AD35AD35
      AD35AD357B6F7B6F524A744A954ED756D85AB756B652954E744AF049AD456C3D
      8C414B390000A5148C31524A734E734E0000000000003A63D85666047B6F7B6F
      5A6B5A6B5A6B3967B556EF3DFF7F317F7B6F000031469452D65AD65AD65AD65A
      B556B556F956343EF33100000000000000000000000000000000000000000000
      4F1DB94A9946583E93219321DA4EFB52DB527D673C5FFB56783EB525B525B525
      8A048A04DA52DB52F62D8A040000000000000000000000000000000000000000
      00004F1DB94A9946583E93219321DA4EFB52DB527D673C5FFB56783EB525B525
      B5258A048A04DA52DB52F62D8A04000000000000734EEF3DCE39CE39CE39AD35
      AD35AD357B6F7B6F524A9652F85AF95EF95EF95E195FD75674521152F04D6C41
      6C416C3D000084140821EF3D734E94520000000000003A63F85666047B6F7B6F
      7B6F5A6B5A6B5A6B3967EF3D1863FF7F18630000B556D65AF75EF75ED65AD65A
      D65AB556D856353E133600000000000000000000000000000000000000000000
      4F1D583E93219321FB521C5BFB567E6B7E6B3C631C5B1B57FB56DA52583EB525
      B525B5218A048A04BA4A8A040000000000000000000000000000000000000000
      00004F1D583E93219321FB521C5BFB567E6B7E6B3C631C5B1B57FB56DA52583E
      B525B525B5218A048A04BA4A8A04000000000000734EEF3DEF3DCE39CE39CE39
      AD35AD357B6F7B6F734AB6521A633B675B673B631A5FF95E955612521152CF3D
      8D3D6C3D0000A558E7204A29524AB5560000000000003A63F95666047B6F7B6F
      7B6F7B6F5A6B5A6B5A6B39679452EF3DA514F75EF75EF75EF75EF75EF75ED65A
      D65AB556D852553E133600000000000000000000000000000000000000000000
      4F1DF52DFB563C633C5FFF7FFF7B7E6B7D673D631C5B1B5BFB56FB56DA52DA52
      583AB525B521B5218A048A040000000000000000000000000000000000000000
      00004F1DF52DFB563C633C5FFF7FFF7B7E6B7D673D631C5B1B5BFB56FB56DA52
      DA52583AB525B521B5218A048A04000000000000734EEF3DEF3DEF3DCE39CE39
      CE39AD359C737B6F9452954E1A5FBE739E6F7D6B5C67195FD75E7456534A3242
      F03D6B350000A570A5642925524AB5560000000000003B67F95A66047B6F7B6F
      7B6F7B6F7B6F5A6B5A6B5A6B396739673967186318631863F75EF75EF75EF75E
      D65AD65AB74E553E133600000000000000000000000000000000000000004F1D
      DA525D675D63FF7FFF7FBF739E6F7E6B7D673C5F3C5F1C5B1B5BFB56FB56DA52
      DA4EDA4E373AB521B521B5210000000000000000000000000000000000000000
      4F1DDA525D675D63FF7FFF7FBF739E6F7E6B7D673C5F3C5F1C5B1B5BFB56FB56
      DA52DA4EDA4E373AB521B521B521000000000000734E1042EF3DEF3DEF3DCE39
      CE39CE399C739C73F75E534A195FFF7FFF7FBF779E6F3A63F85EB656954E744A
      113E29250851C678A5706B2D524A94520000000000005B67F95A6D2566046604
      6604660466046604660466046604660466046604660466046604660466046604
      660466042C1D5542143600000000000000000000000000000000000000004F1D
      3C5FFF7FFF7FFF7FDF77BF73BE6F7D6B5D635D633C5F3C5F1C5B1B5BFB56FB56
      DA52DA4EDA4EBA4A3736B521B521000000000000000000000000000000000000
      4F1D3C5FFF7FFF7FFF7FDF77BF73BE6F7D6B5D635D633C5F3C5F1C5B1B5BFB56
      FB56DA52DA4EDA4EBA4A3736B521B52100000000734E10421042EF3DEF3DEF3D
      CE39CE399C739C735A6B944ED7567C6BFF7FFF7FBE737C6B195FF85A9552534A
      1142292539678C71C6781042734E524A0000000000005B67195BF95AF95AF956
      F856D856D856D852D852D852B74EB74EB74EB74E974A974A964A964A76467646
      7646764275425542143A00000000000000000000000000000000000000004F1D
      DF77FF7FFF7FFF7FDF77DF77BF737E6B7D675D635D633C5F3C5F1C5B1B5BFB56
      FB56DA52DA4EDA4EBA4AB94A3736000000000000000000000000000000000000
      4F1DDF77FF7FFF7FDF77DF77DF77BF737E6B7D675D635D633C5F3C5F1C5B1B5B
      FB56FB56DA52DA4EDA4EBA4AB94A373600000000734E104210421042EF3DEF3D
      EF3DCE399C739C739C733967744EF85A9D73FF7FFF7F7C6B1A63195F96523142
      2925B5565A6B39678C71734E734E10420000000000005B67195BDF77CF35F95A
      F956F856D856D856D852D852D852B74EB74EB74EB74E974A974AF9568D297646
      D9526D2976427542343A00000000000000000000000000000000000000000000
      4F1D4F1DDF77FF7FFF7FDF77BE6F9E6B7D677D675D635D633C5F3C5F1C5B1B5B
      FB56FB56DA52DA4EDA4E00000000000000000000000000000000000000000000
      00004F1D4F1DDF77FF7FDF77DF77BE6F9E6B7D677D675D635D633C5F3C5F1C5B
      1B5BFB56FB56DA52DA4EDA4E0000000000000000734E1042104210421042EF3D
      EF3DEF3D9C739C739C739C731863744E524A9552F85AD756B6523246AE354B29
      D65A7B6F5A6B3967D65AB556524ACE390000000000005B6B195FFF7F9E6FF95A
      F95AF956F856D856D856D852D852D852B74EB74EB74EB74E974ADF73FA56964A
      BF6FD85276467642343A00000000000000000000000000000000000000000000
      000000004F1D4F1DDF77DF77BE6FBE739E6F7E6B7D675D635D633C5F3C5F1C5B
      1B5BFB56FB560100000000000000000000000000000000000000000000000000
      0000000000004F1D4F1DDF77DF77BE6FBE739E6F7E6B7D675D635D633C5F3C5F
      1C5B1B5BFB56FB56010000000000000000000000734E31461042104210421042
      EF3DEF3DBD779C739C739C739C735A6BF75E734EEF3DAD358D311042B5563967
      9C737B6F7B6F524AAD354A29E71CA5140000000000007C6B1A5F195F195B195B
      F95AF95AF956F856D856D856D852D852D852B74EB74EB74EB74E974A974A964A
      964A764676467646343A00000000000000000000000000000000000000000000
      00000000000000004F1D4F1D7E6B7E6B9E6F9E6B7E6B7D675D635D633C5F3C5F
      1C5B440423000000000000000000000000000000000000000000000000000000
      000000000000000000004F1D4F1D7E6B7E6B9E6F9E6B7E6B7D675D635D633C5F
      3C5F1C5B44042300000000000000000000000000734E734E734E734E734E734E
      734E734EFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FDE7BDE7BBD77BD77
      BD779C739C73F75EDE7B5A6BB55642080000000000007C6B7C6B5B6B5B675B67
      5B673B673A633A633A633A631A5F1A5F195F195BF95AF95AF956F956D856D856
      D852D852D852B852764600000000000000000000000000000000000000000000
      0000000000000000000000004F1D4F1D7E6B9E6F7E6B7D677D675D635D63A80C
      8708000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000004F1D4F1D7E6B9E6F7E6B7D677D675D635D63
      A80C870800000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7FFF7FFF7FFF7FDE7BDE7B
      BD77BD779C73F75EFF7F7B6F8410000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000004F1D4F1D7E6B7E6B7D670C19EB140000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004F1D4F1D7E6B7E6B7D670C19EB14
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FDE7B
      DE7BBD77BD771863FF7F8C310000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000004F1D4F1D4F1D000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004F1D4F1D4F1D00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7F5A6BCE3900000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      8C313146524A31469452EF3D0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001042186300000000000000000000
      0000000000000000000000000000000000000000000000000000104200000000
      000000000000000000000000000000000000000000000000000000000000EF4D
      63102204C618EF3DAD35524A9452104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B421311100000000000000000000
      0000000000000000000000000000000000000000000000000000630063006300
      630042000000000000000000000000000000B421311100000000000000000000
      0000000000000000000000000000000000001042186300000000000000000000
      0000000000000000000000000000000000000000000000000000104218631042
      104210421042104210421042104210420000000000000000796F0000596F0000
      56676B45A4180000C6186B2DCE391042B5563146000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000044042300D429D425D529311131113011000000000000
      00000000000000000000000000000000000000000000A700A700E900E900E900
      E900E900630042000000010001002E1D9221D529311131113011000000000000
      0000000000000000000000000000000000001042186300000000000000000000
      00000000000000000000000000000000000000000000000010421863FF7F1863
      1863186318631863186318631863186300000000000000001663A4281563A620
      F55E8B41CD4D4939A5200000C618CE39AD35524A945210420000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C910A70C173617321632F62DF52931118A048A04301110110000
      0000000000000000000000000000000000000000A6042B010A01C800A7008600
      86008600E700C7004200650CA7100C199225D52931118A048A04301110110000
      0000000000000000000000000000000000001042186300000000000000000000
      00000000000000000000000000000000000000000000000010421863FF7F1863
      186318631863186318631863186318630000000000000000F762C424155FA628
      F5626B418A3DAC45AC45CC45841C0000C6186B2DCE391042B556314600000000
      0000000000000000000000000000000000000000000000000000000000000000
      00002D190C19163637361636163217321632F62D31158A041C5B8A048A041011
      1011000000000000000000000000000000000000061D4D014D014D012C01EA00
      C800A600C304E70063006408860CEA189125F52D31158A041C5B8A048A041011
      1011000000000000000000000000000000001042186300000000000000000000
      00000000000000000000000000000000000000000000000010421863FF7F1863
      18631863FF7FFF7F18631863186318630000000000000000F662C528935AC724
      F45E69418B418B418C41AC45CD4D6A39A5200000C618CE39AD35524A94521042
      0000000000000000000000000000000000000000000000000000000000000000
      4F1D583E583A573A163637361636F6311632163232158A041C5BF62DF62D8A04
      8A0410111011000000000000000000000000271DA3518E01AC1927528E016D05
      490D0415E214012141316300850CEA149125F52D32158A041C5BF62DF62D8A04
      8A04101110110000000000000000000000001042186300000000000000000000
      00000000000000000000000000000000000000000000000010421863FF7FFF7F
      FF7FFF7F00000000FF7FFF7FFF7F186300000000000000001663C728945AE628
      D35A4B418B458B45CB458C458C45CB45EC49EE51C4180000C6186B2DCE391042
      B556314600000000000000000000000000000000000000000000000000000000
      4F1D583E583E3736573A3736373637361736173252158A041C5B1732F62DF62D
      F6298A048A0410110F110000000000000000682123626566EC72B009B009B009
      CD19254A6329202D61398504860C0A19B229163252158A041C5B1732F62DF62D
      F6298A048A0410110F1100000000000000001042186300000000000000000000
      0000000000000000000000000000000000000000000000001042186300000000
      0000000000000000000000000000000000000000000000009252E72C9252E72C
      B35E4A3D6A418B3D8B45AB49AB49CC49CD49EC4D0E568B41A5200000C618CE39
      AD35524A94521042000000000000000000000000000000000000000000000000
      4F1D783E583E583E373A373A373A37363736163252158A041C5B3736F62DF62D
      F62DD529D5258A048A040F110000000000006925236A4D7F2F73D20DD20DD20D
      A95A6472E3494031A5318504A7102C1DD32DF63152158A041C5B3736F62DF62D
      F62DD529D5258A048A040F110000000000001042186300000000000000000000
      00000000000000000000000000000000000000000000000010421863FF7F1863
      1863186318631863186318631863186300000000000000009B77C5289252E828
      B45A08316A398B416B3DCC45CC45ED49ED49ED49ED492E562F562F5AC6240004
      C6146B2DCE391042B55631460000000000000000000000000000000000000000
      4F1D783E783E583E373A583A373A37363736373652158A041C5B783EF62DFB4E
      FF7FF62DB4259321711D8A040000000000008A25866E4B4A561E762213168E42
      0A6F6472244A6035C729A604E9146F25F531373652158A041C5B783EF62DFB4E
      FF7FF62DB4259321711D8A040000000000001042186300000000000000000000
      00000000000000000000000000000000000000000000000010421863FF7F1863
      18631863FF7FFF7F18631863186318630000000000000000176FE6247252E834
      935A29398B3D8B418B3D8A3DAC41CC49CD49ED4DED4DEE510E4E0E566F5ACE4D
      28310000C618CE35AD353146D65A000000000000000000000000000000000000
      4F1D7842783E783E583E583E373A573A3736373653158A041C5B1C5B583E1632
      F62DFF7BFE4EB42592218A040000000000008831E35577263D3FF77FEF7F8A7F
      497BA55A4352A141823DA6042C1DD32D1636373653158A041C5B1C5B583E1632
      F62DFF7BFE4EB42592218A040000000000001042186300000000000000000000
      00000000000000000000000000000000000000000000000010421863FF7FFF7F
      FF7FFF7F00000000FF7FFF7FFF7F186300000000000000007156072D304E0831
      915649398B418A418A41AC418B45AA41AC49EC51ED4D0D520D520E560D564E5A
      6F5E706206292208A6148C311042524A00000000000000000000000000000000
      4F1D79427942783E783E583E583E583A573A373A531553158A048A04BA4E583E
      1632F62DF62DD529B4258A040000000000000000D111351A3D3F3D3BEF7F267B
      1316D20D2356C24545254D21B22D1536373A373A531553158A048A04BA4E583E
      1632F62DF62DD529B4258A040000000000001042186300000000000010421042
      1042104210421042104210421042104210421042104210421042186300000000
      0000000000000000000000000000000000000000000000005156E82C304EE82C
      5052493D4B3D8A418A418C458C45AC41CC45CC49CD4D0D520D520E560E562E56
      4F5A2E5A91620E564835630C1042186300000000000000000000000000000000
      4F1D994679427942783E583E583E583E373A573A53158A04531552158A048A04
      DB529946F62DF62DD5298A040000000000000000D111351A7722DB32DA2E351A
      1316D20DB0098E016D09F3313636573A373A573A53158A04531552158A048A04
      DB529946F62DF62DD5298A040000000000001042186300000000000010421042
      10421042104210421042104210421042104210421042104210421863FF7F1863
      18631863186318631863186318631863000000000000EE3DF051E61C2F4AE930
      314A49396B398C418C41AC41AC41CC49CD49CC45ED49EE4D0E4E0E522E562E56
      2F564F5A4F5A705EB16A0829AD31000000000000000000000000000000000000
      4F1DBA4A9A46994678427942783E583E583E583A73158A048A048A0452155215
      8A048A04FB56583EF62D8A0400000000000000000000F315141A77227722351A
      1316D20D6D096D09363A583E583E583E583E583A73158A048A048A0452155215
      8A048A04FB56583EF62D8A040000000000001042186300000000000010421042
      10421042104210421042104210421042104210421042104210421863FF7F1863
      18631863FF7FFF7F1863186318631863000000000000FD7F8D4147250F46082D
      0F4E4A396B398B418B3DAC45AC45CD49CD49CC49ED49ED49ED510E4E2E562E5A
      4E564F5A4F5A4F5A9066A51C0000000000000000000000000000000000000000
      4F1D9946BA4A994699427942783E783E583E583A73198A045D6317328A048A04
      521552158A048A0499468A040000000000000000000000000000F211D111B011
      8F0D6E099946784279427942783E783E583E583A73198A045D6317328A048A04
      521552158A048A0499468A040000000000001042186300000000000010421042
      10421042104210421042104210421042104210421042104210421863FF7FFF7F
      FF7FFF7F00000000FF7FFF7FFF7F1863000000000000BB7B6B3D092DCE45072D
      CD4149396B3D8B418B418C458C45CC45AC49EE4DEE4DED4D0D4EAD49ED49EE4D
      2F5A2E562E5E4F5A906264180000000000000000000000000000000000000000
      4F1DBA4A99469946994699427842783E783E373A52158A045D633736F62DF62D
      8A048A04521532158A048A040000000000000000000000000000000000000000
      4F1DBA4A99469946994699427842783E783E373A52158A045D633736F62DF62D
      8A048A04521532158A048A040000000000001042186300000000000000000000
      0000000000000000000000000000000000000000000000000000104210421042
      1042104210421042104210421042104200000000000079772939292D6C390731
      AC3D2A394B3D8B418B41AB45AB45CC49CC49EE4DEE4DED55AC49EC49EC4DAB45
      4F562E562E5A4F5E7062841C0000000000000000000000000000000000000000
      4F1DDA4EBA4ABA46994699467942783E583E163631158A045D63373AF62DF62D
      F62DF6298A048A04321531150000000000000000000000000000000000000000
      4F1DDA4EBA4ABA46994699467942783E583E163631158A045D63373AF62DF62D
      F62DF6298A048A04321531150000000000001042000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000099772A3969296935E928
      6A352A356B398C458C41AC45AC45CC45CD49ED49EE490C4A8B3D4F5A5056AC41
      30562F562F564F5A906264180000000000000000000000000000000000000000
      4F1DBA4EDA4EBA4ABA4699467942783E583AF52D0F118A045D63583E17321D53
      FF7F172ED529B4258A048A040000000000000000000000000000000000000000
      4F1DBA4EDA4EBA4ABA4699467942783E583AF52D0F118A045D63583E17321D53
      FF7F172ED529B4258A048A040000000000001042186318631863186318631863
      1863186318631863186318631863186318631863186318631863186318631863
      186318631863186318631863186318630000000000007A772A3D09296C35082D
      2831AB418B414A354A39CD45AC45CC49CD49ED49ED4DCC49ED490E565056AB41
      4F564F562F5A705AB16664180000000000000000000000000000000000000000
      4F1DFB52BA4ADA4EBA4A99427842583A3736F52D8A048A045D63FB52583E1632
      F62DFF7BBB46B32571218A040000000000000000000000000000000000000000
      4F1DFB52BA4ADA4EBA4A99427842583A3736F52D8A048A045D63FB52583E1632
      F62DFF7BBB46B32571218A040000000000001042FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F10420000000058734935AB450931C418
      0000C6282A3D4839283149356A3DCC450D4ECD4DEE4D8B3D0D56B35EEE492E56
      4F5A505E4F564F5AB06664180000000000000000000000000000000000000000
      4F1DFB52DB4EBA4A99467842583E583E93214F1DD525B5258A048A04FB52DB52
      1632F62DF62DD529B4258A040000000000000000000000000000000000000000
      4F1DFB52DB4EBA4A99467842583E583E93214F1DD525B5258A048A04FB52DB52
      1632F62DF62DD529B4258A040000000000001042186318631863186318631863
      1863186318631863186318631863186318631863186318631863186318631863
      1863186318631863186318631863186310420000000093626B39E628C82C8314
      000000000000A51C69396A3D4A396A3D8A410E520E528A41156B50565773AA41
      4F5A505A505A705EB062641C0000000000000000000000000000000000000000
      4F1DDB4EBA4A99469946583E93219321BA4ADA52573AD525B525B5258A048A04
      DA4EDA52F62DF62DD5298A040000000000000000000000000000000000000000
      4F1DDB4EBA4A99469946583E93219321BA4ADA52573AD525B525B5258A048A04
      DA4EDA52F62DF62DD5298A040000000000000000104218631863186318631863
      1863186318631863186318631863186318631863186318631863186318631863
      1863186318631863186318631863104200000000376BED450935210800002104
      6C3D6318000000000000C61C492D693D8B396A3DAB4131527152ED51596FCB41
      2F5A305E705A515EB16A64180000000000000000000000000000000000000000
      4F1DB94A9946583E93219321DA4EFB52DB527D673C5FFB56783EB525B525B525
      8A048A04DA52DB52F62D8A040000000000000000000000000000000000000000
      4F1DB94A9946583E93219321DA4EFB52DB527D673C5FFB56783EB525B525B525
      8A048A04DA52DB52F62D8A040000000000000000104218631863186318631863
      1863186318631863186318631863186318631863186318631863186318631863
      18631863186318631002100200001042000000001663E8300000A51CC61C0000
      0000C6246935A624000000000004A4186B3D6A3DA520B45E915A915EB356EE4D
      4F5A2F5A705A705EB16664180000000000000000000000000000000000000000
      4F1D583E93219321FB521C5BFB567E6B7E6B3C631C5B1B57FB56DA52583EB525
      B525B5218A048A04BA4A8A040000000000000000000000000000000000000000
      4F1D583E93219321FB521C5BFB567E6B7E6B3C631C5B1B57FB56DA52583EB525
      B525B5218A048A04BA4A8A040000000000000000000010421042104210421042
      1042104210421042104210421042104210421042104210421042104210421042
      10421042104210421002FF0300000000000000001663A524000000000000A51C
      220C20040000C7288B418314000000000000A520E82CF462A620725A715E505A
      2F5A705E4F5E4F62B062641C0000000000000000000000000000000000000000
      4F1DF52DFB563C633C5FFF7FFF7B7E6B7D673D631C5B1B5BFB56FB56DA52DA52
      583AB525B521B5218A048A040000000000000000000000000000000000000000
      4F1DF52DFB563C633C5FFF7FFF7B7E6B7D673D631C5B1B5BFB56FB56DA52DA52
      583AB525B521B5218A048A040000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000010020000000000000000376B8D350000000000004214
      9256AB49631C00000000C51C0939C51C000000006A3550522731D55EAC45ED49
      70567162505E705EB06664180000000000000000000000000000000000004F1D
      DA525D675D63FF7FFF7FBF739E6F7E6B7D673C5F3C5F1C5B1B5BFB56FB56DA52
      DA4EDA4E373AB521B521B5210000000000000000000000000000000000004F1D
      DA525D675D63FF7FFF7FBF739E6F7E6B7D673C5F3C5F1C5B1B5BFB56FB56DA52
      DA4EDA4E373AB521B521B5210000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000100200000000000000000000FF7FCE35A5200E4A997B
      DC7FBA77FC7FD366ED45C518410CE6244B3DA61CD45E0000F66663148A3D0E46
      CD450D4A70569062D36664180000000000000000000000000000000000004F1D
      3C5FFF7FFF7FFF7FDF77BF73BE6F7D6B5D635D633C5F3C5F1C5B1B5BFB56FB56
      DA52DA4EDA4EBA4A3736B521B521000000000000000000000000000000004F1D
      3C5FFF7FFF7FFF7FDF77BF73BE6F7D6B5D635D633C5F3C5F1C5B1B5BFB56FB56
      DA52DA4EDA4EBA4A3736B521B521000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000042E07F00000000
      000000000000000000000000100200000000000000000000396BFC7FDB7F9A77
      3873586F586F386F57733873F5663052492D2F56E628D45E072500000004C51C
      CE4D2E4E0D4A2F4ED26A64180000000000000000000000000000000000004F1D
      DF77FF7FFF7FFF7FDF77DF77BF737E6B7D675D635D633C5F3C5F1C5B1B5BFB56
      FB56DA52DA4EDA4EBA4AB94A3736000000000000000000000000000000004F1D
      DF77FF7FFF7FFF7FDF77DF77BF737E6B7D675D635D633C5F3C5F1C5B1B5BFB56
      FB56DA52DA4EDA4EBA4AB94A3736000000000000000000000000000000000000
      0000000000000000000000000000000000000000100210021002100210020000
      00000000000000000000000010020000000000000000000000000000B35AF562
      DA7F7A7B376F366F176F156BF46EF56A5056376B1567156F8C41200400000000
      0000E6288C3D4E525052841C0000000000000000000000000000000000000000
      4F1D4F1DDF77FF7FFF7FDF77BE6F9E6B7D677D675D635D633C5F3C5F1C5B1B5B
      FB56FB56DA52DA4EDA4E00000000000000000000000000000000000000000000
      4F1D4F1DDF77FF7FFF7FDF77BE6F9E6B7D677D675D635D633C5F3C5F1C5B1B5B
      FB56FB56DA52DA4EDA4E00000000000000000000000000000000000000000000
      00000000000000000000000000000000000000001002FF03FF7FFF03FF031002
      0000000000000000100210020000000000000000000000000000000000000000
      00000000DC7F9977376BF46A72620E4E862C156FB466D466156BD566D5624935
      641C00000000C520F36A43180000000000000000000000000000000000000000
      000000004F1D4F1DDF77DF77BE6FBE739E6F7E6B7D675D635D633C5F3C5F1C5B
      1B5BFB56FB560100000000000000000000000000000000000000000000000000
      000000004F1D4F1DDF77DF77BE6FBE739E6F7E6B7D675D635D633C5F3C5F1C5B
      1B5BFB56FB560100000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001002FF03FF7FFF030000
      00000000100210020000000000000000000000000000000000000F46386B5777
      3673156FF4663873D362D462BB7BBA7B366FF462B362B25E915EB2621567797B
      FE7FD366104E410800004F520000000000000000000000000000000000000000
      00000000000000004F1D4F1D7E6B7E6B9E6F9E6B7E6B7D675D635D633C5F3C5F
      1C5B440423000000000000000000000000000000000000000000000000000000
      00000000000000004F1D4F1D7E6B7E6B9E6F9E6B7E6B7D675D635D633C5F3C5F
      1C5B440423000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001002FF0300000000
      1002100200000000000000000000000000000000000000001667705600000000
      0000000000000000D45EFD7F0000DD7FFB7F366FB262915A915E915A915EB362
      D4665873DB7B7977386FB2560000000000000000000000000000000000000000
      0000000000000000000000004F1D4F1D7E6B9E6F7E6B7D677D675D635D63A80C
      8708000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000004F1D4F1D7E6B9E6F7E6B7D677D675D635D63A80C
      8708000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001002FF7F00000000
      0000000000000000000000000000000000000000000000000000B562176F3673
      367717731673156FD45E0000000000000000376BFC7F386FD3629262515E9162
      B166925A3056C4208B2D00000000000000000000000000000000000000000000
      000000000000000000000000000000004F1D4F1D7E6B7E6B7D670C19EB140000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000004F1D4F1D7E6B7E6B7D670C19EB140000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BA77BB7B1567146B3252
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000004F1D4F1D4F1D000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000004F1D4F1D4F1D000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000080000000200100000100010000000000001200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
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
      00000000000000000000000000000000FFFFFFFFFFFFFFFFFE0FFFFF00000000
      FFFFFFFFFFFFFFFFF803FFFF00000000FC7FFE3FFFFC3FFFF000FFFF00000000
      FBFFFFDFFFF81E1FF0003FFF00000000F73FFCEFFFF00C0FF0000FFF00000000
      FEFC1F7FFFE00807F00003FF00000000FFF00FFFFFC00007F00000FF00000000
      FFC003FFFF800007F000003F00000000FF0001FFFF000007F000000F00000000
      FE0000FFFE00000FF000000300000000FE00007FFC00001FF000000100000000
      FE00007FF80000FFF000000100000000FC00007FF000007FF000000300000000
      F000000FE001003FF000000700000000E0000003C002081FF000000700000000
      C0000001C007840FF00000070000000080000000C00F0607F000000700000000
      00000000C01FC303F000000700000000003FF800C03F8383F000000300000000
      003FF8008000E1C3F800000100000000007FF800800041FFF800000100000000
      00FFF801800070FFF00000010000000001FFFC01FF7FE0FFC000000300000000
      01FFFC01FF4FF8FFC00000010000000083FFFE03FF2FF0FF0020000100000000
      83FFFE03FFD3FFFF002000010000000087FFFF07FFCBFFFF8060000300000000
      C7FFFF07FFF4FFFFE070000300000000CFFFFF8FFFF2FFFFE0F8100700000000
      CFFFFF9FFFFEFFFFF1F8180700000000FFFFFFFFFFFF7FFFFFFC3E0700000000
      FFFFFFFFFFFFFFFFFFFFFF8F00000000FFFE7FFFF0FE1087FF003FFFFFE03FFF
      FF9C3FFFE0FC0003FC000FFFFF801E00FF081FFFE1F80003F80007FFFE000C00
      FF600FFFC3F00003F80007FF00000000FF6007FFC4000003F80007FF00000000
      F000000F80000003F80007FF00000000F000000F80000003F80007FF00000000
      F000000FC0000003F80007FF00000000F000000FC0000003F80007FF00000000
      F000000FC0000007F80007FF000000F0F000000F8000000FF80007FF000000FC
      F000000F8000000FF00003FF000000FFE000000700000001F00003FF000000FF
      C000000300000001F00003FF000000FF8000000100000001F80007FF000000FF
      0000000000000001F8000183000000FF0000000000000001F0000001000000FF
      8000000100000001F031E000000000FFC000000300000001F031F0380000007F
      E000000300000001E031F118FFFFC07FF000000100000001E071F080FFFF007F
      F000000000000001C071E041FFFC00FFF000000000000001C071E223FFF007FC
      F0000009000000018071E31FFFC01FE0F000000F000000018060E31FFF007E00
      F000000F000000018060E01FFC001C00F000000F80000001C060F03FF0000400
      F000000F80000001E0E1F87FC0000000F8000FFFC0000001FFE1FFFF80000000
      F8081FFFE0000007FFE3FFFFC1C00000F81C3FFFF0000007FFE7FFFFE7F00000
      FC3E7FFFFC7FFFFFFFDFFFFFFFFC0000FFFFF3FFFFFFFFFFC000000000000000
      FFFFC3FFFC0000000000000000000000FFFF01FFFC0000000000000300000000
      FFFC01FFFC0000000000000F00000000FFF000FFFC0000000000003F00000000
      FFC000FFFC000000C000003F00000000FF00007FFC000000F000003F00000000
      FC00007FFC000000F000000700000000F000003FFC000000F000000300000000
      C000003FFC000000F8000003000000000000001FFC000000E000000300000000
      0000001FFC000000E0000003000000008000000FFC000000C000000300000000
      8000000FF8000000C000000100000000C0000007F00000008000000100000000
      C0000007E00000000000000300000000E0000003C00000000000000700000000
      C0000003800000000000000700000000C0000001800000000000000700000000
      8000000180000000000000030000000080000000800000000000000100000000
      8000000080000000000000010000000080000003800000008000000100000000
      8000000F8000000080000003000000008000003F80000FFFC000000700000000
      C00000FF80000FFFC000000F00000000800003FFC0001FFFE000003F00000000
      80000FFF80003FFFF0007FFF00000000C8003FFF80007FFFFC00FFFF00000000
      FF00FFFFC000FFFFFFFFFFFF00000000FF83FFFFE401FFFFFFFFFFFF00000000
      FFCFFFFFFFFFFFFFFFFFFFFF00000000FFFFFFFFFFFFFFFFFE000003FFFFFFFF
      FE00001FFFFFFFFFFE000001FFFC000FFC00001FFFFFFFFFF8000000FFF8000F
      F800001FFFC00007F8000000FFF0000FE000001FFFC00007F0000000FFE0000F
      C000001FFFC00007F0000000FFC0000FC000001FFFC00007F8000000FF80000F
      C000001FFFC00007F8000000FF00008FC000001FFFC00000F8000000FE0001FF
      C000001FFFC00000FC000000FC0003FFC000001FFFC00000FC000000FC0087FF
      C000001FFFC00000FC000000FE018FFFC000001FFFC00000FC000000FF939C0F
      C000001FFFC00000FC000000FFFFF807C000001FFFC00000F8000000FFFFF003
      C000001FFFC0000098000000FFFFF003C000001FFFC0000000000000F03FF003
      C000001FFF00000060000000E01FF003C000000FFF00000078000000C00FF003
      C0000007F300000078000000C00FF003C0000003E000000060000000C00FF807
      C0000001EC00000000000000C00E040FC0000001EF00000098000000C00C03FF
      C0000021EF000000F8000000C00801FFC0000071EC000000F8000000E01801FF
      C00000FBE0000000FC000000F03801FFC00000FFF3000000FC000000FFF801FF
      C00001FFFF000000FC000000FFF801FFFFFFFFFFFF000001FC000000FFF801FF
      FFFFFFFFFFF80003FC000000FFFC03FFFFFFFFFFFFF80007FC000000FFFE07FF
      FFFFFFFFFFF8000FFE000000FFFFFFFFFFFF0000FFFE0FFFFF80003FFFFF7FFF
      FC070000FFF803FFFF00003FFFFE3FFFF8010000FFE001FFFE00003FFFFC1FFF
      F8008001FF8000FFFC00003FFFF80FFFF8000001FE00007FF800003FFFF007FF
      F8000001F800003FF000003FFFE003F8F8000001E000003FE000003FFFC001E0
      F8000001C000001FC000003FFC000000F80000018000001FC0000007C0000000
      F80000010000000FC0000007B0000000F80000010000000FC0000007B0000000
      F8000001E0000007C000000780000000F8000001F0000007C000000780000000
      F8000000F8000003C000000700000003F8000000F8000003C000000700000001
      F8000001FC000001C000000700000000F8000007FC000001C000000700000001
      F8000007FE000000C000000780000003F8000007FE000000C000000FC0000007
      F8000007FF000003C000001FE000000FF8000001FF000007C000003FF000001F
      FC000001FF800007C000003FF800003FFE000003FF800007C000003FFC00007F
      FF800003FFC0000FC000003FFE0000FFFFE00003FFC0001FC000007FFF0001FF
      FFF80003FFE0383FC00000FFFF8003FFFFFE0007FFE0F01FC00001FFFFC007FF
      FFFE0007FFF3E00FC00003FFFFE00FFFFFFFE007FFFFE00FC00007FFFFF01FFF
      FFFFF807FFFFE00FC0000FFFFFF83FFFFFFFFE07FFFFF01FC0001FFFFFFC7FFF
      FFFFFF8FFFFFF83FFFFFFFFFFFFEFFFFFFCF3FFFFFFF3FFFFF879FFFFFFF9FFF
      FF040FFFFFFC0FFFFE0207FFFFFE07FFFC0003FFFFF003FFF80001FFFFF801FF
      F00000FFFFC000FFE000007FFFE0007FC000003FFF00003F8000001FFF80001F
      C000000FFE00000F00000007FF000007C0000007FE00000700000003FF000003
      80000003FE00000380000001C000000180000003FE0000038000000180000001
      00000003FE000003800000018000000100000003FE0000038000000180000001
      20000003FE0000038000000180000001F0000003FE0000038000000180000001
      F8000003FE000003C000000180000001FE000003FE000003C000000180000001
      FE000003FE000003C000000180000001FE000003FE000003E000000180000001
      FE000003FE000003F000000180000001FE000003FE000003FF00000180000001
      FE000003FE000003FF00000180000001FE000003FE000003FF000001FF000001
      FE000003FE000003FF000001FF000001FE000003FE000003FF000001FF000001
      FC000003FC000003FE000001FE000001FC000001FC000001FE000000FE000000
      FC000001FC000001FE000000FE000000FE000003FE000003FF000001FF000001
      FF80000FFF80000FFFC00007FFC00007FFE0003FFFE0003FFFF0001FFFF0001F
      FFF800FFFFF800FFFFFC007FFFFC007FFFFE03FFFFFE03FFFFFF01FFFFFF01FF
      FFFF8FFFFFFF8FFFFFFFC7FFFFFFC7FFFFCF3FFFFDFF9FFFC00007FFFFFFFFFF
      FF040FFFF8FE07FF800003FFFFFFFFFFFC0003FFF07801FF800001FFFFFFFFFF
      F00000FFF020007F800000FFE0000007C000003FE000001F8000007FC0000007
      C000000FE00000078000003FC0000007C0000007C00000038000001FC0000007
      80000003C00000018000000FC000000780000003800000018000000FC0000007
      00000003800000018000000FC000000700000003800000018000000FC0000007
      20000003800000018000000FC0000007F0000003C10000018000000FC0000007
      F8000003E30000018000000FC0000007FE000003FF0000018000000FC0000007
      FE000003FF00000180000000C0000007FE000003FF00000180000000C0000007
      FE000003FF00000180000000C0000007FE000003FF00000180000000C0000007
      FE000003FF00000180000000C0000007FE000003FF00000180000000C0000007
      FE000003FF00000180000000C0000007FE000003FF00000180000000C0000007
      FC000003FE00000180000000C0000007FC000001FE00000080000000C0000007
      FC000001FE00000080000000C0000007FE000003FF00000180000000C0000007
      FF80000FFFC0000780000000C0000007FFE0003FFFF0001F80000001C000000F
      FFF800FFFFFC007FFFFF8003FFFFFFFFFFFE03FFFFFF01FFFFFF8007FFFFFFFF
      FFFF8FFFFFFFC7FFFFFF800FFFFFFFFF1FFFF9F9FE07FFFFFFFF3FFFFFFF3FFF
      0FFFF000FC01FFFFFFFC0FFFF07C0FFF0FFFF000E0007FFFFFF003FFC01003FF
      07FFE000E0001FFFFFC000FF800000FF07FFE000E00007FFFF00003F8000003F
      07FFE000E00001FFFE00000F0000000F07FFE000E000007FFE00000700000007
      07FFE000E000001FFE0000030000000307FFE000E0000007FE00000300000003
      07FFE000E0000003FE0000030000000307FFE000E0000001FE00000380000003
      00000000E0000001FE0000038000000300000000C0000003FE000003C0000003
      00000000C0000007FE000003F000000300000000C0000007FE000003FE000003
      00000000C0000007FE000003FE00000300000000C0000007FE000003FE000003
      00000000C0000007FE000003FE00000300000000C0000007FE000003FE000003
      00000000C0000007FE000003FE0000038000000180000007FE000003FE000003
      8000000180000007FE000003FE000003C000000380000007FE000003FE000003
      FFFFFFF780000007FC000003FC000003FFFFF7F3C0000007FC000001FC000001
      FFFFE3FBE0000007FC000001FC000001FFFF80F3F8000007FE000003FE000003
      FFFF80C7FF800007FF80000FFF80000FFFFFC11FF0000007FFE0003FFFE0003F
      FFFFE27FE7E40007FFF800FFFFF800FFFFFFE3FFF00F000FFFFE03FFFFFE03FF
      FFFFF7FFFFFFC1FFFFFF8FFFFFFF8FFF00000000000000000000000000000000
      000000000000}
  end
  object r_staffteach: TADOTable
    Connection = ADOconn
    IndexName = 'id'
    TableName = 'r_staffteach'
    Left = 488
    Top = 185
  end
  object r_staffteachDataSource: TDataSource
    DataSet = r_staffteach
    Left = 504
    Top = 192
  end
  object r_staffteachid: TADOTable
    Connection = ADOconn
    IndexFieldNames = 'staffid'
    MasterFields = 'r_staffinfo.id'
    MasterSource = staffsource
    TableName = 'r_staffteachid'
    Left = 648
    Top = 193
    object r_staffteachidid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object r_staffteachidstaffid: TIntegerField
      FieldName = 'staffid'
    end
    object r_staffteachidteachid: TIntegerField
      FieldName = 'teachid'
      LookupDataSet = r_staffteach
      LookupKeyFields = 'id'
      LookupResultField = 'teachname'
    end
    object r_staffteachidmemo: TMemoField
      FieldName = 'memo'
      BlobType = ftMemo
    end
    object r_staffteachiddelrecy: TWideStringField
      FieldName = 'delrecy'
      Size = 50
    end
    object r_staffteachidteachresult: TWideStringField
      FieldName = 'teachresult'
      Size = 50
    end
  end
  object r_staffteachidDataSource: TDataSource
    DataSet = r_staffteachid
    Left = 672
    Top = 200
  end
  object PopupMenu8: TPopupMenu
    Left = 624
    Top = 185
    object N116: TMenuItem
      Caption = #26032#30340#22521#35757#35760#24405'...'
      OnClick = N116Click
    end
    object N117: TMenuItem
      Caption = '-'
    end
    object N118: TMenuItem
      Caption = #21024#38500'...'
      OnClick = N118Click
    end
    object N119: TMenuItem
      Caption = #20445#23384'...'
      OnClick = N119Click
    end
  end
  object StyleRepository: TcxStyleRepository
    Left = 593
    Top = 153
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = clWhite
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor]
      Color = clSilver
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16777088
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlue
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object cxStyle15: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle16: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle17: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle18: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle19: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle20: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle21: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle22: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle23: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle24: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle25: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle26: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle27: TcxStyle
      AssignedValues = [svColor]
      Color = 8453888
    end
    object cxStyle28: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle29: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16777088
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlue
    end
    object cxStyle30: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle1
      Styles.Content = cxStyle2
      Styles.ContentEven = cxStyle3
      Styles.ContentOdd = cxStyle4
      Styles.Inactive = cxStyle10
      Styles.IncSearch = cxStyle11
      Styles.Selection = cxStyle14
      Styles.FilterBox = cxStyle5
      Styles.Footer = cxStyle6
      Styles.Group = cxStyle7
      Styles.GroupByBox = cxStyle8
      Styles.Header = cxStyle9
      Styles.Indicator = cxStyle12
      Styles.Preview = cxStyle13
    end
    object GridBandedTableViewStyleSheetDevExpress: TcxGridBandedTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle15
      Styles.Content = cxStyle18
      Styles.ContentEven = cxStyle19
      Styles.ContentOdd = cxStyle20
      Styles.Inactive = cxStyle26
      Styles.IncSearch = cxStyle27
      Styles.Selection = cxStyle30
      Styles.FilterBox = cxStyle21
      Styles.Footer = cxStyle22
      Styles.Group = cxStyle23
      Styles.GroupByBox = cxStyle24
      Styles.Header = cxStyle25
      Styles.Indicator = cxStyle28
      Styles.Preview = cxStyle29
      Styles.BandBackground = cxStyle16
      Styles.BandHeader = cxStyle17
    end
  end
  object XPManifest1: TXPManifest
    Left = 452
    Top = 193
  end
  object ColorDialog1: TColorDialog
    Left = 720
    Top = 169
  end
  object r_staffcontract: TADOTable
    Connection = ADOconn
    IndexFieldNames = 'staffid'
    MasterFields = 'r_staffinfo.id'
    MasterSource = staffsource
    TableName = 'r_staffcontract'
    Left = 224
    Top = 281
  end
  object r_staffcontractDataSource: TDataSource
    DataSet = r_staffcontract
    Left = 264
    Top = 289
  end
  object PopupMenu9: TPopupMenu
    Left = 224
    Top = 353
    object N122: TMenuItem
      Caption = #31614#35746#21512#21516'...'
      OnClick = ToolButton7Click
    end
    object N123: TMenuItem
      Caption = '-'
    end
    object N124: TMenuItem
      Caption = #32534#36753'...'
      OnClick = cxGrid8DBTableView1DblClick
    end
    object N125: TMenuItem
      Caption = #21024#38500'...'
      OnClick = N125Click
    end
    object N128: TMenuItem
      Caption = '-'
    end
    object N129: TMenuItem
      Caption = #22871#29992#32473'...'
      OnClick = N129Click
    end
  end
  object p_w_tools: TADOTable
    Connection = ADOconn
    IndexFieldNames = 'userid'
    MasterFields = 'r_staffinfo.id'
    MasterSource = staffsource
    TableName = 'p_w_tools'
    Left = 408
    Top = 311
  end
  object p_w_toolsSource: TDataSource
    DataSet = p_w_tools
    Left = 464
    Top = 319
  end
  object w_tools: TADOTable
    Connection = ADOconn
    IndexName = 'id'
    TableName = 'w_tools'
    Left = 376
    Top = 375
  end
  object w_toolsSource: TDataSource
    DataSet = w_tools
    Left = 424
    Top = 383
  end
  object PopupMenu10: TPopupMenu
    Left = 320
    Top = 367
    object N141: TMenuItem
      Caption = #39046#29992#26032#35760#24405'...'
      OnClick = N141Click
    end
    object N142: TMenuItem
      Caption = '-'
    end
    object N140: TMenuItem
      Caption = #21024#38500'...'
      OnClick = N140Click
    end
    object N143: TMenuItem
      Caption = #32534#36753'...'
      OnClick = N143Click
    end
  end
  object dxComponentPrinter1: TdxComponentPrinter
    CurrentLink = dxComponentPrinter1Link1
    PreviewOptions.Caption = #25171#21360#39044#35272
    PreviewOptions.VisibleOptions = [pvoPrint]
    PreviewOptions.WindowState = wsMaximized
    PreviewOptions.PreviewBoundsRect = {000000000000000000050000C4030000}
    Version = 0
    Left = 701
    Top = 107
    object dxComponentPrinter1Link1: TdxSpreadSheetBookReportLink
      Caption = 'New Report'
      Component = cxSpreadSheetBook1
      DesignerHelpContext = 0
      PrinterPage.Footer = 6350
      PrinterPage.Header = 6350
      PrinterPage.Margins.Bottom = 12700
      PrinterPage.Margins.Left = 12700
      PrinterPage.Margins.Right = 12700
      PrinterPage.Margins.Top = 12700
      PrinterPage.MinMargins.Bottom = 0
      PrinterPage.MinMargins.Left = 0
      PrinterPage.MinMargins.Right = 0
      PrinterPage.MinMargins.Top = 0
      PrinterPage.PageFooter.Font.Charset = DEFAULT_CHARSET
      PrinterPage.PageFooter.Font.Color = clWindowText
      PrinterPage.PageFooter.Font.Height = -11
      PrinterPage.PageFooter.Font.Name = 'Tahoma'
      PrinterPage.PageFooter.Font.Style = []
      PrinterPage.PageHeader.Font.Charset = DEFAULT_CHARSET
      PrinterPage.PageHeader.Font.Color = clWindowText
      PrinterPage.PageHeader.Font.Height = -11
      PrinterPage.PageHeader.Font.Name = 'Tahoma'
      PrinterPage.PageHeader.Font.Style = []
      PrinterPage.PageSize.X = 215900
      PrinterPage.PageSize.Y = 279400
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      ReportTitle.Font.Charset = DEFAULT_CHARSET
      ReportTitle.Font.Color = clWindowText
      ReportTitle.Font.Height = -19
      ReportTitle.Font.Name = 'Times New Roman'
      ReportTitle.Font.Style = [fsBold]
      FixedFont.Charset = DEFAULT_CHARSET
      FixedFont.Color = clWindowText
      FixedFont.Height = -11
      FixedFont.Name = 'Times New Roman'
      FixedFont.Style = [fsBold]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Times New Roman'
      Font.Style = []
      OptionsView = []
      BuiltInReportLink = True
    end
  end
  object TMenu: TPopupMenu
    Left = 584
    Top = 311
    object N163: TMenuItem
      Caption = #33258#23450#20041#24037#20855#26639'...'
      OnClick = N90Click
    end
  end
end
