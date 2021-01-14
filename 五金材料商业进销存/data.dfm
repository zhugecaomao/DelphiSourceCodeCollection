object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 300
  Top = 212
  Height = 431
  Width = 462
  object DB: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=Saory;Persist Security Info=True;Us' +
      'er ID=sa;Initial Catalog='#36827#38144#23384';Data Source=WWnt'
    LoginPrompt = False
    Mode = cmReadWrite
    Provider = 'SQLOLEDB.1'
    Left = 16
    Top = 8
  end
  object wwIntl1: TwwIntl
    Navigator.ConfirmDeleteMessage = #21024#38500#35760#24405'?'
    Navigator.Hints.FirstHint = #31532#19968#26465#35760#24405
    Navigator.Hints.PriorHint = #19978#19968#26465#35760#24405
    Navigator.Hints.NextHint = #19979#19968#26465#35760#24405
    Navigator.Hints.LastHint = #26368#21518#19968#26465#35760#24405
    Navigator.Hints.InsertHint = #22686#21152
    Navigator.Hints.DeleteHint = #21024#38500
    Navigator.Hints.EditHint = #20462#25913
    Navigator.Hints.PostHint = #20445#23384
    Navigator.Hints.CancelHint = #21462#28040
    Navigator.Hints.RefreshHint = #20445#23384#25968#25454
    Navigator.Hints.PriorPageHint = #19978' %d '#26465#35760#24405
    Navigator.Hints.NextPageHint = #19979' %d '#26465#35760#24405
    Navigator.Hints.SaveBookmarkHint = #35774#23450#20070#31614
    Navigator.Hints.RestoreBookmarkHint = #22238#21040#20070#31614#20301#32622
    Navigator.Hints.RecordViewDialogHint = #26597#30475#24403#21069#35760#24405
    Navigator.Hints.LocateDialogHint = #35760#24405#23450#20301
    Navigator.Hints.FilterDialogHint = #36807#28388#25968#25454
    Navigator.Hints.SearchDialogHint = #26597#35810#25968#25454
    SearchDialog.SearchCharLabel = #26597#35810#23383#31526#20018'[&S]'
    SearchDialog.SearchCharShortLabel = #26597#35810#23383#31526'[&S]'
    SearchDialog.SearchByLabel = #25353#26597#35810'[&B]'
    SearchDialog.StatusRecLabel = #35760#24405#21495' #'
    SearchDialog.StatusOfLabel = #30340
    SearchDialog.SearchCharHint = #36755#20837#26597#35810#30340#23383#31526#20018
    SearchDialog.SearchByHint = #22686#37327#24335#26597#35810#21644#25490#24207#26041#24335
    LocateDialog.FieldValueLabel = #23383#27573#20540'[&V]'
    LocateDialog.SearchTypeLabel = #26597#35810#26041#24335'[&S]'
    LocateDialog.CaseSensitiveLabel = #21306#20998#22823#23567#20889'[&C]'
    LocateDialog.MatchExactLabel = #23436#20840#21305#37197'[&E]'
    LocateDialog.MatchStartLabel = #36215#22987#37096#20998#21305#37197'[&P]'
    LocateDialog.MatchAnyLabel = #20219#20309#20301#32622#21305#37197'[&A]'
    LocateDialog.FieldsLabel = #26597#35810#23383#27573'[&F]'
    LocateDialog.BtnFirst = #31532#19968#26465#35760#24405'[&r]'
    LocateDialog.BtnNext = #19979#19968#26465#35760#24405'[&N]'
    LocateDialog.BtnCancel = #21462#28040
    LocateDialog.BtnClose = 'Close'
    LocateDialog.FieldValueHint = #36755#20837#35201#26597#25214#30340#23383#27573#20540
    LocateDialog.CaseSensitiveHint = #21306#20998#22823#23567#20889
    LocateDialog.MatchExactHint = #23436#20840#21305#37197
    LocateDialog.MatchStartHint = #36215#22987#37096#20998#21305#37197
    LocateDialog.MatchAnyHint = #20219#20309#20301#32622#21305#37197
    LocateDialog.BtnFirstHint = #26597#25214#31532#19968#26465#21305#37197#35760#24405
    LocateDialog.BtnNextHint = #26597#25214#19979#19968#26465#21305#37197#35760#24405
    LocateDialog.FieldNameHint = #36873#25321#35201#26597#35810#30340#23383#27573#21517
    MonthCalendar.PopupYearLabel = #20462#25913#24180#20221
    MonthCalendar.EnterYearPrompt = #36755#20837#27491#30830#24180#20221
    FilterDialog.BtnViewSummary = #26597#30475#25688#35201'[&m]'
    FilterDialog.BtnViewSummaryHint = #25353#30446#21069#26597#35810#26465#20214#26597#30475#25688#35201
    FilterDialog.BtnNewSearch = #26032#26597#35810'[&N]'
    FilterDialog.BtnNewSearchHint = #24320#22987#26032#26597#35810
    FilterDialog.FieldOrderLabel = #23383#27573#27425#24207
    FilterDialog.FieldOrderHint = #23558#23383#27573#25353#23383#27597#25110#21407#22987#39034#24207#25490#24207
    FilterDialog.AlphabeticLabel = #23383#27597'[&b]'#39034#24207
    FilterDialog.LogicalLabel = #21407#22987#39034#24207'[&L]'#39034#24207
    FilterDialog.AllFieldsLabel = #20840#37096'[&A]'
    FilterDialog.SearchedFieldsLabel = #24050#35774#23450#26597#35810'[&S]'
    FilterDialog.StartingRangeLabel = #36215#22987#33539#22260'[&S]'
    FilterDialog.EndingRangeLabel = #32456#27490#33539#22260'[&d]'
    FilterDialog.StartingRangeHint = #36755#20837#23383#27573#36215#22987#33539#22260
    FilterDialog.EndingRangeHint = #36755#20837#23383#27573#32456#27490#33539#22260
    FilterDialog.BtnClearMin = #28165#38500'[&C]'
    FilterDialog.BtnClearMax = #28165#38500'[&e]'
    FilterDialog.BtnClearFilterValue = #28165#38500'[&C]'
    FilterDialog.BtnClearMinHint = #28165#38500#23383#27573#36215#22987#33539#22260
    FilterDialog.BtnClearMaxHint = #28165#38500#23383#27573#32456#27490#33539#22260
    FilterDialog.BtnClearFilterValueHint = #28165#38500#30446#21069#23383#27573#26465#20214#20540
    FilterDialog.ByValueLabel = #25353#25968#20540'[&V]'
    FilterDialog.ByRangeLabel = #25353#26465#20214'[&R]'
    FilterDialog.FieldValueLabel = #23383#27573#20540'[&V]'
    FilterDialog.FieldValueHint = #36755#20837#23383#27573#26597#35810#20540
    FilterDialog.SearchTypeLabel = #26597#35810#26041#24335
    FilterDialog.SearchTypeHint = #35774#23450#22914#20309#27604#36739#23383#27573#20540
    FilterDialog.MatchExactLabel = #20840#37096#21305#37197'[&E]'
    FilterDialog.MatchStartLabel = #36215#22987#37096#20998#21305#37197'[&P]'
    FilterDialog.MatchAnyLabel = #20219#20309#20301#32622#21305#37197'[&w]'
    FilterDialog.CaseSensitiveLabel = #21306#20998#22823#23567#20889'[&t]'
    FilterDialog.CaseSensitiveHint = #26597#35810#26102#20998#22823#23567#20889
    FilterDialog.NonMatchingLabel = #19981#21305#37197#30340#35760#24405'[&o]'
    FilterDialog.NonMatchingHint = #26174#31034#19981#21305#37197#26597#35810#26465#20214#30340#35760#24405
    FilterDialog.SummaryFieldLabel = #23383#27573
    FilterDialog.SummarySearchLabel = #26597#35810#26041#24335
    FilterDialog.SummaryValueLabel = #25968#20540
    FilterDialog.SummaryCaption = #24635#35745
    FilterDialog.FieldsLabel = #23383#27573'[&F]'
    FilterDialog.ValueRangeTabHint = #25353#25968#20540#25110#33539#22260#26597#35810
    FilterDialog.AllSearchedTabHint = #26174#31034#20840#37096#23383#27573#25110#24050#35774#23450#26597#35810#30340#23383#27573
    FilterDialog.ViewSummaryNotText = #38750
    RichEdit.FontNameComboHint = #23383#20307' | '#26356#25913#23383#20307
    RichEdit.FontSizeComboHint = #23383#20307#22823#23567' | '#26356#25913#23383#20307#22823#23567
    RichEdit.NewButtonHint = #26032#24314' | '#24314#31435#26032#25991#20214
    RichEdit.LoadButtonHint = #25171#24320' | '#25171#24320#24050#26377#25991#20214
    RichEdit.SaveAsButtonHint = #21478#23384#20026'... | '#20445#23384#25991#20214
    RichEdit.PrintButtonHint = #25171#21360' | '#25171#21360#24403#21069#25991#26723
    RichEdit.FindButtonHint = #26597#25214' | '#26597#25214#25351#23450#20869#23481
    RichEdit.CutButtonHint = #21098#20999' | '#21098#20999#36873#23450#20869#23481#24182#32622#20110#21098#36148#31807
    RichEdit.CopyButtonHint = #22797#21046' | '#22797#21046#24182#32622#20110#21098#36148#31807
    RichEdit.UndoButtonHint = #25764#28040' | '#25764#28040#24403#21069#25805#20316
    RichEdit.RedoButtonHint = #24674#22797' | '#24674#22797#19978#19968#25764#28040#25805#20316
    RichEdit.PasteButtonHint = #31896#36148' | '#31896#36148#21098#36148#31807#20869#23481
    RichEdit.BoldButtonHint = #31895#20307' | '#31895#20307#25110#21462#28040#31895#20307#23383
    RichEdit.ColorButtonHint = #39068#33394' | '#21464#26356#39068#33394
    RichEdit.UnderlineButtonHint = #19979#21010#32447' | '#19979#21010#32447#25110#21462#28040#19979#21010#32447
    RichEdit.ItalicButtonHint = #26012#20307' | '#26012#20307#23383#25110#21462#28040#26012#20307#23383
    RichEdit.LeftButtonHint = #24038#23545#40784' | '#27573#33853#23621#24038'('#25110#28165#38500')'
    RichEdit.CenterButtonHint = #23621#20013' | '#27573#33853#23621#20013'('#25110#28165#38500')'
    RichEdit.RightButtonHint = #21491#23545#40784' | '#27573#33853#23621#21491'('#25110#28165#38500')'
    RichEdit.JustifyButtonHint = 'Justify | Full Justification for paragraph (toggle)'
    RichEdit.BulletButtonHint = #39033#30446#31526#21495' | '#22312#26412#34892#25554#20837'('#21024#38500')'#39033#30446#31526#21495
    RichEdit.HighlightButtonHint = #26631#31034#25991#23383' | '#23558#30446#21069#36873#20013#25991#23383#26631#31034
    RichEdit.SaveExitHint = #20445#23384#24182#36864#20986' | '#20445#23384#20462#25913#24182#36864#20986#32534#36753
    RichEdit.PageSetupHint = #39029#38754#35774#23450' | '#26356#25913#39029#38754#35774#23450
    RichEdit.ExitHint = #36864#20986
    RichEdit.ClearHint = #21024#38500#36873#20013#20869#23481
    RichEdit.SelectAllHint = #20840#36873
    RichEdit.FindNextHint = #26597#25214#19979#19968#20010
    RichEdit.ReplaceHint = #26367#25442
    RichEdit.InsertObjectHint = #25554#20837#23545#35937
    RichEdit.SpellCheckHint = #25340#20889#26816#26597
    RichEdit.ToolbarHint = #26174#31034'/'#38544#34255#24037#20855#26639
    RichEdit.FormatBarHint = #26174#31034'/'#38544#34255#26684#24335#24037#20855
    RichEdit.ViewStatusBarHint = #26174#31034'/'#38544#34255#29366#24577#26639
    RichEdit.OptionsHint = #35774#32622#36873#39033
    RichEdit.FontHint = #25913#21464#36873#20013#20869#23481#30340#23383#20307
    RichEdit.ParagraphHint = #26684#24335#21270#36873#20013#30340#27573#33853
    RichEdit.TabsHint = #21046#34920#20301#35774#32622
    RichEdit.CAPLockCaption = #22823#20889#38190
    RichEdit.NUMLockCaption = #25968#23383#38190
    RichEdit.MenuLabels.FileCaption = #25991#20214'[&F]'
    RichEdit.MenuLabels.LoadCaption = #25171#24320'[&L]'
    RichEdit.MenuLabels.SaveAsCaption = #21478#23384#20026'...[&A]'
    RichEdit.MenuLabels.SaveExitCaption = #20445#23384#24182#36864#20986'[&S]'
    RichEdit.MenuLabels.PrintCaption = #25171#21360'[&P]'
    RichEdit.MenuLabels.PageSetupCaption = #39029#38754#35774#32622'[&u]'
    RichEdit.MenuLabels.ExitCaption = #36864#20986'[&x]'
    RichEdit.MenuLabels.EditCaption = #32534#36753'[&E]'
    RichEdit.MenuLabels.UndoCaption = #25764#28040'[&U]'
    RichEdit.MenuLabels.CutCaption = #21098#20999'[&t]'
    RichEdit.MenuLabels.CopyCaption = #22797#21046'[&C]'
    RichEdit.MenuLabels.PasteCaption = #31896#36148'[&P]'
    RichEdit.MenuLabels.ClearCaption = #28165#38500'[&a]'
    RichEdit.MenuLabels.SelectallCaption = #20840#36873'[&l]'
    RichEdit.MenuLabels.FindCaption = #26597#25214'[&F]'
    RichEdit.MenuLabels.FindNextCaption = #26597#25214#19979#19968#20010'[&N]'
    RichEdit.MenuLabels.ReplaceCaption = #26367#25442'[&e]'
    RichEdit.MenuLabels.InsertObjectCaption = #25554#20837#23545#35937'...[&O]'
    RichEdit.MenuLabels.ToolCaption = #24037#20855'[&T]'
    RichEdit.MenuLabels.SpellCheckCaption = #25340#20889#26816#26597'[&S]'
    RichEdit.MenuLabels.InsertCaption = #25554#20837'[&I]'
    RichEdit.MenuLabels.RulerCaption = #26631#23610'[&R]'
    RichEdit.MenuLabels.ViewCaption = #26597#30475'[&V]'
    RichEdit.MenuLabels.ToolbarCaption = #24037#20855#26639'[&T]'
    RichEdit.MenuLabels.FormatBarCaption = #26684#24335#26639'[&F]'
    RichEdit.MenuLabels.ViewStatusBarCaption = #29366#24577#26639'[&S]'
    RichEdit.MenuLabels.OptionsCaption = #36873#39033'[&O]'
    RichEdit.MenuLabels.FormatCaption = #26684#24335'[&o]'
    RichEdit.MenuLabels.FontCaption = #23383#20307'[&F]'
    RichEdit.MenuLabels.BulletStyleCaption = #39033#30446#31526#21495#26679#24335'[&B]'
    RichEdit.MenuLabels.ParagraphCaption = #27573#33853'[&P]'
    RichEdit.MenuLabels.TabsCaption = #21046#34920#20301'[&T]'
    RichEdit.MenuLabels.HelpCaption = #24110#21161
    RichEdit.PopupMenuLabels.EditCaption = #32534#36753'[&E]'
    RichEdit.PopupMenuLabels.ViewCaption = #26597#30475'[&V]'
    RichEdit.PopupMenuLabels.CutCaption = #21098#20999'[&t]'
    RichEdit.PopupMenuLabels.CopyCaption = #22797#21046'[&C]'
    RichEdit.PopupMenuLabels.PasteCaption = #31896#36148'[&P]'
    RichEdit.PopupMenuLabels.FontCaption = #23383#20307'[&F]'
    RichEdit.PopupMenuLabels.BulletStyleCaption = #39033#30446#31526#21495#26679#24335'[&B]'
    RichEdit.PopupMenuLabels.BoldCaption = #31895#20307'[&o]'
    RichEdit.PopupMenuLabels.ItalicCaption = #26012#20307'[&I]'
    RichEdit.PopupMenuLabels.UnderlineCaption = #19979#21010#32447'[&U]'
    RichEdit.PopupMenuLabels.ParagraphCaption = #27573#33853'[&a]'
    RichEdit.PopupMenuLabels.TabsCaption = #21046#34920#20301'[&T]'
    RichEdit.PopupMenuLabels.FindCaption = #26597#25214'[&d]'
    RichEdit.PopupMenuLabels.ReplaceCaption = #26367#25442'[&R]'
    RichEdit.PopupMenuLabels.InsertObjectCaption = #25554#20837#23545#35937'...[&O]'
    RichEdit.PopupMenuLabels.ObjectPropertiesCaption = 'Object P&roperties'
    RichEdit.PopupMenuLabels.SpellCheckCaption = #25340#20889#26816#26597'[&S]'
    RichEdit.ParagraphDialog.ParagraphDlgCaption = #27573#33853
    RichEdit.ParagraphDialog.IndentationGroupBoxCaption = #32553#36827
    RichEdit.ParagraphDialog.LeftEditHint = #24038#32553#36827
    RichEdit.ParagraphDialog.RightEditHint = #21491#32553#36827
    RichEdit.ParagraphDialog.FirstLineEditHint = #27573#33853#39318#34892#32553#36827
    RichEdit.ParagraphDialog.AlignmentHint = #26356#25913#27573#33853#23545#40784#26041#24335
    RichEdit.ParagraphDialog.LeftEditCaption = #24038':'
    RichEdit.ParagraphDialog.RightEditCaption = #21491':'
    RichEdit.ParagraphDialog.FirstLineEditCaption = #39318#34892':'
    RichEdit.ParagraphDialog.SpacingGroupCaption = #38388#38548
    RichEdit.ParagraphDialog.BeforeParagraphCaption = #20043#21069'[&B]'
    RichEdit.ParagraphDialog.AfterParagraphCaption = #20043#21518'[&e]'
    RichEdit.ParagraphDialog.WithinParagraphCaption = #34892#38388#38548'[&n]'
    RichEdit.ParagraphDialog.WithinParagraphAtCaption = #22312'[&A]'
    RichEdit.ParagraphDialog.AlignmentCaption = #23545#40784#26041#24335
    RichEdit.ParagraphDialog.AlignLeft = #23621#24038
    RichEdit.ParagraphDialog.AlignRight = #23621#21491
    RichEdit.ParagraphDialog.AlignCenter = #23621#20013
    RichEdit.ParagraphDialog.AlignJustify = 'Justify'
    RichEdit.TabDialog.TabDlgCaption = #21046#34920#20301
    RichEdit.TabDialog.TabGroupBoxCaption = #21046#34920#20301#32456#27490#20301#32622'[&T]'
    RichEdit.TabDialog.SetTabButtonCaption = #35774#32622
    RichEdit.TabDialog.ClearTabButtonCaption = #28165#38500
    RichEdit.TabDialog.ClearAllButtonCaption = #20840#37096#28165#38500
    RichEdit.TabDialog.TabPositionEditHint = #32534#36753#21046#34920#20301
    RichEdit.TabDialog.ListBoxHint = #21015#20986#21046#34920#20301#20301#32622
    RichEdit.TabDialog.SetButtonHint = #35774#23450#26032#21046#34920#20301
    RichEdit.TabDialog.ClearButtonHint = #28165#38500#36873#20013#30340#21046#34920#20301#20301#32622
    RichEdit.TabDialog.ClearAllButtonHint = #28165#38500#20840#37096#21046#34920#20301
    UserMessages.wwDBGridDiscardChanges = #25918#24323#23545#24403#21069#35760#24405#30340#26356#25913'?'
    UserMessages.PictureValidateError = #19981#21512#27861#20043#23383#31526'. '#23383#27573' : '
    UserMessages.LocateNoMatches = #26410#25214#21040#21305#37197#30340#35760#24405
    UserMessages.LocateNoMoreMatches = #24050#27809#26377#21305#37197#30340#35760#24405
    UserMessages.MemoChangesWarning = #20869#23481#24050#26356#25913'!  '#24744#30830#23450#35201#21462#28040#21527'?'
    UserMessages.RichEditExitWarning = #20869#23481#24050#26356#25913'!  '#24744#35201#20445#23384#21527'?'
    UserMessages.RichEditClearWarning = #28165#38500#20840#37096#25991#23383'?'
    UserMessages.RichEditSpellCheckComplete = #25340#20889#26816#26597#24050#23436#25104'.'
    UserMessages.RichEditMSWordNotFound = #26080#27861#21551#21160#24494#36719'Word'#30340#25340#20889#26816#26597#24037#20855'.'
    UserMessages.FilterDlgNoCriteria = #24744#36824#27809#26377#36873#25321#20219#20309#26597#35810#26465#20214
    UserMessages.RecordViewExitWarning = #35760#24405#24050#26356#25913'! '#24744#35201#20445#23384#21527'?'
    OKCancelBitmapped = False
    BtnOKCaption = #30830#23450'[&O]'
    BtnCancelCaption = #21462#28040
    CheckBoxInGridStyle = cbStyleAuto
    VersionInfoPower = '3000.05.01'
    FilterMemoSize = 65536
    DialogFontStyle = []
    Connected = True
    Left = 16
    Top = 53
  end
  object tabEmp: TADOTable
    Active = True
    Connection = DB
    CursorType = ctStatic
    BeforeDelete = tabBeforeDelete
    OnPostError = tabPostError
    IndexName = 'PrimaryKey'
    TableName = 'Employee'
    Left = 64
    Top = 5
  end
  object dsEmp: TwwDataSource
    DataSet = tabEmp
    Left = 64
    Top = 53
  end
  object qryOwner: TADOQuery
    Connection = DB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from owner')
    Left = 120
    Top = 5
  end
  object dsOwner: TwwDataSource
    DataSet = qryOwner
    Left = 120
    Top = 53
  end
  object tabCust: TADOQuery
    Active = True
    Connection = DB
    CursorType = ctStatic
    AfterOpen = tabCustAfterOpen
    BeforeDelete = tabBeforeDelete
    OnPostError = tabPostError
    Parameters = <>
    SQL.Strings = (
      'select * from customer')
    Left = 176
    Top = 5
  end
  object dsCust: TwwDataSource
    DataSet = tabCust
    Left = 176
    Top = 53
  end
  object tabSupp: TADOQuery
    Active = True
    Connection = DB
    CursorType = ctStatic
    AfterOpen = tabCustAfterOpen
    BeforeDelete = tabBeforeDelete
    OnPostError = tabPostError
    Parameters = <>
    SQL.Strings = (
      'select * from Supplier')
    Left = 224
    Top = 5
  end
  object dsSupp: TwwDataSource
    DataSet = tabSupp
    Left = 224
    Top = 53
  end
  object tabType: TADOQuery
    Active = True
    Connection = DB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from gdsType')
    Left = 328
    Top = 8
  end
  object tabGoods: TADODataSet
    Active = True
    Connection = DB
    CursorType = ctStatic
    AfterOpen = tabGoodsAfterOpen
    AfterPost = tabGoodsAfterPost
    OnNewRecord = tabGoodsNewRecord
    CommandText = 'Goods'
    CommandType = cmdTable
    IndexName = 'PK_Goods'
    Parameters = <>
    Prepared = True
    Left = 272
    Top = 8
    object tabGoodsgdsid: TStringField
      DisplayLabel = #32534#21495
      DisplayWidth = 20
      FieldName = 'gdsid'
      Size = 50
    end
    object tabGoodsgdsname: TStringField
      DisplayLabel = #21517#31216
      DisplayWidth = 40
      FieldName = 'gdsname'
      Size = 128
    end
    object tabGoodsunit: TStringField
      DisplayLabel = #21333#20301
      DisplayWidth = 12
      FieldName = 'unit'
      Size = 50
    end
    object tabGoodsgdstypename: TStringField
      DisplayLabel = #21830#21697#31867
      FieldKind = fkLookup
      FieldName = 'gdstypename'
      LookupDataSet = tabType
      LookupKeyFields = 'typeid'
      LookupResultField = 'typename'
      KeyFields = 'gdstypeid'
      Lookup = True
    end
    object tabGoodsmaxres: TFloatField
      FieldName = 'maxres'
    end
    object tabGoodsminres: TFloatField
      FieldName = 'minres'
    end
    object tabGoodsinprice: TBCDField
      FieldName = 'inprice'
      Precision = 19
    end
    object tabGoodsoutprice1: TBCDField
      FieldName = 'outprice1'
      Precision = 19
    end
    object tabGoodsoutprice2: TBCDField
      FieldName = 'outprice2'
      Precision = 19
    end
    object tabGoodsoutprice3: TBCDField
      FieldName = 'outprice3'
      Precision = 19
    end
    object tabGoodsoutprice4: TBCDField
      FieldName = 'outprice4'
      Precision = 19
    end
    object tabGoodsgdstypeid: TStringField
      FieldName = 'gdstypeid'
    end
    object tabGoodsinUse: TBooleanField
      FieldName = 'inUse'
    end
    object tabGoodsnotes: TMemoField
      FieldName = 'notes'
      BlobType = ftMemo
    end
  end
  object dsGoods: TwwDataSource
    DataSet = tabGoods
    Left = 272
    Top = 53
  end
  object dsType: TwwDataSource
    DataSet = tabType
    Left = 328
    Top = 53
  end
  object dsOut: TwwDataSource
    DataSet = tabOut
    Left = 16
    Top = 149
  end
  object dsOutItems: TwwDataSource
    DataSet = tabOutItems
    Left = 80
    Top = 149
  end
  object tabFirstStore: TADOTable
    Connection = DB
    CursorType = ctStatic
    TableName = 'Firststore'
    Left = 392
    Top = 112
    object tabFirstStoregdsid: TWideStringField
      DisplayWidth = 20
      FieldName = 'gdsid'
    end
    object tabFirstStoregdsName: TStringField
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'gdsName'
      LookupDataSet = tabGoods
      LookupKeyFields = 'GdsID'
      LookupResultField = 'GdsName'
      KeyFields = 'gdsid'
      Lookup = True
    end
    object tabFirstStorestoreid: TWideStringField
      DisplayWidth = 20
      FieldName = 'storeid'
    end
    object tabFirstStorestorename: TStringField
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'storename'
      LookupDataSet = tabStore
      LookupKeyFields = 'storeID'
      LookupResultField = 'storeName'
      KeyFields = 'storeid'
      Lookup = True
    end
    object tabFirstStoreamo: TBCDField
      FieldName = 'amo'
      Precision = 19
    end
    object tabFirstStorequa: TFloatField
      FieldName = 'qua'
    end
  end
  object dsFirstStore: TwwDataSource
    DataSet = tabFirstStore
    Left = 392
    Top = 157
  end
  object tabStore: TADOTable
    Active = True
    Connection = DB
    CursorType = ctStatic
    TableName = 'Store'
    Left = 384
    Top = 56
  end
  object tabNextId: TADOTable
    Connection = DB
    CursorType = ctStatic
    IndexFieldNames = 'tablename'
    TableName = 'nextid'
    Left = 384
    Top = 5
  end
  object tabOut: TADOTable
    Active = True
    Connection = DB
    CursorType = ctStatic
    BeforePost = tabOutBeforePost
    OnNewRecord = tabOutNewRecord
    IndexName = 'PK_outSheet'
    TableName = 'outSheet'
    Left = 16
    Top = 104
    object tabOutcustname: TStringField
      FieldKind = fkLookup
      FieldName = 'custname'
      LookupDataSet = tabCust
      LookupKeyFields = 'CustID'
      LookupResultField = 'CustName'
      KeyFields = 'CustID'
      Lookup = True
    end
    object tabOutempname: TStringField
      FieldKind = fkLookup
      FieldName = 'empname'
      LookupDataSet = tabEmp
      LookupKeyFields = 'EmpID'
      LookupResultField = 'Name'
      KeyFields = 'empid'
      Lookup = True
    end
    object tabOutType: TStringField
      FieldName = 'Type'
      Size = 10
    end
    object tabOutStatus: TWordField
      FieldName = 'Status'
    end
    object tabOutIsBack: TBooleanField
      FieldName = 'IsBack'
    end
    object tabOutSheetID: TWideStringField
      FieldName = 'SheetID'
    end
    object tabOutCustID: TWideStringField
      FieldName = 'CustID'
    end
    object tabOutDate: TDateTimeField
      FieldName = 'Date'
    end
    object tabOutEmpId: TStringField
      FieldName = 'EmpId'
      Size = 10
    end
    object tabOutOrderID: TWideStringField
      FieldName = 'OrderID'
    end
    object tabOutDiscount: TFloatField
      FieldName = 'Discount'
    end
    object tabOutAmo: TBCDField
      FieldName = 'Amo'
      Precision = 19
    end
    object tabOutPayAmo: TBCDField
      FieldName = 'PayAmo'
      Precision = 19
    end
    object tabOutdefaultStoreId: TStringField
      FieldName = 'defaultStoreId'
      Size = 10
    end
    object tabOutNotes: TMemoField
      FieldName = 'Notes'
      BlobType = ftMemo
    end
    object tabOutStatusDate: TDateTimeField
      FieldName = 'StatusDate'
    end
  end
  object tabOutItems: TADOTable
    Connection = DB
    CursorType = ctStatic
    BeforePost = tabOutItemsBeforePost
    OnCalcFields = tabOutItemsCalcFields
    OnNewRecord = tabOutItemsNewRecord
    IndexFieldNames = 'SheetID'
    MasterFields = 'SheetID'
    MasterSource = dsOut
    TableName = 'outItems'
    Left = 80
    Top = 104
    object tabOutItemsGdsID: TWideStringField
      DisplayLabel = #21830#21697#32534#21495
      DisplayWidth = 17
      FieldName = 'GdsID'
      OnChange = tabOutItemsGdsIDChange
    end
    object tabOutItemsgdsname: TStringField
      DisplayLabel = #21830#21697#21517#31216
      DisplayWidth = 19
      FieldKind = fkLookup
      FieldName = 'gdsname'
      LookupDataSet = tabGoods
      LookupKeyFields = 'GdsID'
      LookupResultField = 'GdsName'
      KeyFields = 'GdsID'
      LookupCache = True
      ProviderFlags = []
      Lookup = True
    end
    object tabOutItemsUnit: TWideStringField
      DisplayLabel = #21333#20301
      DisplayWidth = 7
      FieldName = 'Unit'
    end
    object tabOutItemsQua: TFloatField
      DisplayLabel = #25968#37327
      DisplayWidth = 10
      FieldName = 'Qua'
    end
    object tabOutItemsPrice: TBCDField
      DisplayLabel = #21333#20215
      DisplayWidth = 14
      FieldName = 'Price'
      Precision = 19
    end
    object tabOutItemsamo: TCurrencyField
      DisplayLabel = #37329#39069
      DisplayWidth = 14
      FieldKind = fkCalculated
      FieldName = 'amo'
      Calculated = True
    end
    object tabOutItemsbigPrice: TBCDField
      DisplayLabel = #24320#22823#21333#20215
      DisplayWidth = 10
      FieldName = 'bigPrice'
      Precision = 19
    end
    object tabOutItemsbigAmo: TCurrencyField
      DisplayLabel = #21478#24320#37329#39069
      DisplayWidth = 14
      FieldKind = fkCalculated
      FieldName = 'bigAmo'
      Calculated = True
    end
    object tabOutItemsNotes: TMemoField
      DisplayLabel = #22791#27880
      DisplayWidth = 10
      FieldName = 'Notes'
      BlobType = ftMemo
    end
    object tabOutItemsSheetID: TWideStringField
      DisplayLabel = #21333#25454#21495
      DisplayWidth = 12
      FieldName = 'SheetID'
    end
    object tabOutItemsstorename: TStringField
      DisplayLabel = #20179#21517
      DisplayWidth = 10
      FieldKind = fkLookup
      FieldName = 'storename'
      LookupDataSet = tabStore
      LookupKeyFields = 'storeID'
      LookupResultField = 'storeName'
      KeyFields = 'storeid'
      LookupCache = True
      ProviderFlags = []
      Visible = False
      Lookup = True
    end
    object tabOutItemsautoid: TAutoIncField
      FieldName = 'autoid'
      ReadOnly = True
      Visible = False
    end
    object tabOutItemsstoreid: TStringField
      FieldName = 'storeid'
      Visible = False
      Size = 10
    end
  end
  object dsOutPrice: TwwDataSource
    DataSet = qryOutPrice
    Left = 144
    Top = 149
  end
  object qryOutPrice: TADOQuery
    Active = True
    Connection = DB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM outPriceHistory')
    Left = 144
    Top = 105
  end
  object qryUnit: TADOQuery
    Connection = DB
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'gdsid'
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = Null
      end>
    SQL.Strings = (
      'select * from v_unit'
      'where gdsid =:gdsid')
    Left = 328
    Top = 112
  end
  object dsIn: TwwDataSource
    DataSet = tabIn
    Left = 16
    Top = 253
  end
  object dsInItems: TwwDataSource
    DataSet = tabInItems
    Left = 80
    Top = 253
  end
  object tabIn: TADOTable
    Active = True
    Connection = DB
    CursorType = ctStatic
    BeforePost = tabInBeforePost
    OnNewRecord = tabInNewRecord
    IndexName = 'PK_outSheet'
    TableName = 'inSheet'
    Left = 16
    Top = 208
    object StringField2: TStringField
      FieldKind = fkLookup
      FieldName = 'empname'
      LookupDataSet = tabEmp
      LookupKeyFields = 'EmpID'
      LookupResultField = 'Name'
      KeyFields = 'empid'
      Lookup = True
    end
    object WordField1: TWordField
      FieldName = 'Status'
    end
    object BooleanField1: TBooleanField
      FieldName = 'IsBack'
    end
    object WideStringField1: TWideStringField
      FieldName = 'SheetID'
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'Date'
    end
    object StringField4: TStringField
      FieldName = 'EmpId'
      Size = 10
    end
    object WideStringField3: TWideStringField
      FieldName = 'OrderID'
    end
    object BCDField1: TBCDField
      FieldName = 'Amo'
      Precision = 19
    end
    object BCDField2: TBCDField
      FieldName = 'PayAmo'
      Precision = 19
    end
    object StringField5: TStringField
      FieldName = 'defaultStoreId'
      Size = 10
    end
    object MemoField1: TMemoField
      FieldName = 'Notes'
      BlobType = ftMemo
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'StatusDate'
    end
    object tabInSuppID: TWideStringField
      FieldName = 'SuppID'
    end
    object tabInType: TStringField
      FieldName = 'Type'
      Size = 10
    end
  end
  object tabInItems: TADODataSet
    Connection = DB
    CursorType = ctStatic
    BeforePost = tabInItemsBeforePost
    OnCalcFields = tabInItemsCalcFields
    OnNewRecord = tabInItemsNewRecord
    CommandText = 'inItems'
    CommandType = cmdTable
    DataSource = dsIn
    IndexFieldNames = 'SheetID'
    MasterFields = 'SheetID'
    Parameters = <>
    Prepared = True
    Left = 80
    Top = 208
    object tabInItemsGdsId: TWideStringField
      DisplayLabel = #21830#21697#32534#21495
      DisplayWidth = 17
      FieldName = 'GdsID'
      OnChange = tabInItemsGdsIdChange
    end
    object StringField6: TStringField
      DisplayLabel = #21830#21697#21517#31216
      DisplayWidth = 19
      FieldKind = fkLookup
      FieldName = 'gdsname'
      LookupDataSet = tabGoods
      LookupKeyFields = 'GdsID'
      LookupResultField = 'GdsName'
      KeyFields = 'GdsID'
      LookupCache = True
      ProviderFlags = []
      Lookup = True
    end
    object WideStringField5: TWideStringField
      DisplayLabel = #21333#20301
      DisplayWidth = 7
      FieldName = 'Unit'
    end
    object FloatField2: TFloatField
      DisplayLabel = #25968#37327
      DisplayWidth = 10
      FieldName = 'Qua'
    end
    object BCDField3: TBCDField
      DisplayLabel = #21333#20215
      DisplayWidth = 14
      FieldName = 'Price'
      Precision = 19
    end
    object CurrencyField1: TCurrencyField
      DisplayLabel = #37329#39069
      DisplayWidth = 14
      FieldKind = fkCalculated
      FieldName = 'amo'
      Calculated = True
    end
    object MemoField2: TMemoField
      DisplayLabel = #22791#27880
      DisplayWidth = 10
      FieldName = 'Notes'
      BlobType = ftMemo
    end
    object WideStringField6: TWideStringField
      DisplayLabel = #21333#25454#21495
      DisplayWidth = 12
      FieldName = 'SheetID'
    end
    object StringField7: TStringField
      DisplayLabel = #20179#21517
      DisplayWidth = 10
      FieldKind = fkLookup
      FieldName = 'storename'
      LookupDataSet = tabStore
      LookupKeyFields = 'storeID'
      LookupResultField = 'storeName'
      KeyFields = 'storeid'
      LookupCache = True
      ProviderFlags = []
      Visible = False
      Lookup = True
    end
    object AutoIncField1: TAutoIncField
      FieldName = 'autoid'
      ReadOnly = True
      Visible = False
    end
    object StringField8: TStringField
      FieldName = 'storeid'
      Visible = False
      Size = 10
    end
  end
  object dsInprice: TwwDataSource
    DataSet = qryInPrice
    Left = 144
    Top = 253
  end
  object qryInPrice: TADOQuery
    Active = True
    Connection = DB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM inPriceHistory')
    Left = 144
    Top = 209
  end
end
