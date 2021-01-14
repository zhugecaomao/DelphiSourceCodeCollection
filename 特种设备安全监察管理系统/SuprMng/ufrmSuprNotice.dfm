object frmSuprNotice: TfrmSuprNotice
  Left = 92
  Top = 16
  Width = 696
  Height = 480
  Caption = #30417#23519#24847#35265#20070
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object Splitter1: TSplitter
    Left = 0
    Top = 249
    Width = 688
    Height = 3
    Cursor = crSizeNS
    Align = alTop
  end
  object Panel1: TPanel
    Left = 0
    Top = 425
    Width = 688
    Height = 28
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 0
    object Panel5: TPanel
      Left = 533
      Top = 1
      Width = 154
      Height = 26
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object bbtnHelp: TBitBtn
        Left = 0
        Top = 2
        Width = 75
        Height = 22
        Hint = #33719#21462#30456#20851#24110#21161
        Caption = #24110#21161'(&H)'
        TabOrder = 0
        Glyph.Data = {
          36010000424D3601000000000000760000002800000010000000100000000100
          040002000000C0000000C40E0000C40E00000000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000ADD02D004DD
          00000ADD020004DD00000004DDD70477000870B07DDD000002DD060000080FF0
          07DD00000004D0FF06FB0006FFF07D0000000010D0FBFFF44FFBF07D00000010
          D0FFFBFFFBFFF07D00000010D0FBFFF47FFBF07D00000010D0FFFBF748FFF07D
          00000010D0FBFFFB747BF07D00000010D0FFF47FF44FF07D00000010D0FBF44B
          844BF07D00000006D0FFF800044400068FF07D0000000010D0FBFFFBFFFBF07D
          00000010D0FFFBFFFBFFF0DD000002DD0A0000040DDD00000001}
      end
      object bbtnClose: TBitBtn
        Left = 77
        Top = 2
        Width = 75
        Height = 22
        Hint = #20851#38381#24403#21069#31383#21475
        Caption = #20851#38381'(&C)'
        TabOrder = 1
        OnClick = bbtnCloseClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000C40E0000C40E00001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFF000FFF
          FFFFFFFF005000FFFFFFFF0055500000FFFF0055555000000FFF055555507880
          00FF055555507770FFFF05555B5077700FF005555B507770B00B05555550770B
          BBBB05555550770BBBBB055555507770B00B0555555077700FF0055555007770
          FFFF055500777770FFFF050077777770FFFF000000000000FFFF}
      end
    end
    object bbtnConfirm: TBitBtn
      Left = 3
      Top = 3
      Width = 60
      Height = 22
      Caption = #30830#35748
      TabOrder = 1
      OnClick = bbtnConfirmClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000C40E0000C40E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333333333333333FF3333333333333344333333
        3333333F88F333333333333422433333333333F8338F33333333334222243333
        33333F833F38F333333334222A224333333338F3F8F38F3333333222A3A22433
        333338FF838F38F333333A2A333A2243333338F83338F38F333333A33333A224
        3333338333338F38F333333333333A2243333333333338F38F333333333333A2
        243333333333338F38F333333333333A2243333333333338F383333333333333
        A2233333333333338F833333333333333A233333333333333883333333333333
        33A3333333333333338333333333333333333333333333333333}
      NumGlyphs = 2
    end
    object bbtnPrint: TBitBtn
      Left = 65
      Top = 3
      Width = 60
      Height = 22
      Hint = #25171#21360#21015#34920#21306#22495#30340#20869#23481
      Caption = #25171#21360
      TabOrder = 2
      OnMouseUp = bbtnPrintMouseUp
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000C40E0000C40E00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00030888888888888880088888888888888000000000000000000F8F8F8F8F8F
        8F8008F8F8F8F8F8F9F00F8F8F8F8F8F8F8000000000000000003330FFFFFFFF
        03333330F0000F0F03333330FFFFFFFF03333330F00F000003333330FFFF0FF0
        33333330F08F0F0333333330FFFF003333333330000003333333}
    end
  end
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 0
    Width = 688
    Height = 249
    Align = alTop
    Color = clBtnFace
    ParentColor = False
    TabOrder = 1
    object Label1: TLabel
      Left = 0
      Top = 0
      Width = 684
      Height = 47
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Caption = #29305#31181#35774#22791#23433#20840#30417#23519#24847#35265#36890#30693#20070
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
    object Label9: TLabel
      Left = 20
      Top = 69
      Width = 60
      Height = 12
      Caption = #25509#25910#21333#20301#65306
    end
    object labUseCertId: TLabel
      Left = 8
      Top = 46
      Width = 72
      Height = 12
      Caption = #36890#30693#20070#32534#21495#65306
    end
    object Label2: TLabel
      Left = 20
      Top = 116
      Width = 60
      Height = 12
      Caption = #23384#22312#38382#39064#65306
    end
    object Label3: TLabel
      Left = 327
      Top = 69
      Width = 60
      Height = 12
      Caption = #31614#21457#21333#20301#65306
    end
    object labDevKind: TLabel
      Left = 327
      Top = 46
      Width = 60
      Height = 12
      Caption = #35774#22791#21517#31216#65306
    end
    object Label4: TLabel
      Left = 20
      Top = 170
      Width = 60
      Height = 12
      Caption = #21453#39304#24847#35265#65306
    end
    object Label8: TLabel
      Left = 20
      Top = 225
      Width = 60
      Height = 12
      Caption = #31614#21457#26085#26399#65306
    end
    object Label5: TLabel
      Left = 327
      Top = 225
      Width = 60
      Height = 12
      Caption = #21453#39304#26085#26399#65306
    end
    object Label6: TLabel
      Left = 8
      Top = 93
      Width = 108
      Height = 12
      Caption = #19979#36848#20027#35201#38382#39064#65292#38480#20110
    end
    object Label7: TLabel
      Left = 219
      Top = 93
      Width = 48
      Height = 12
      Caption = #21069#35299#20915#12290
    end
    object lcmbRecOrg: TDBLookupComboboxEh
      Left = 80
      Top = 66
      Width = 241
      Height = 18
      Color = clSkyBlue
      Ctl3D = False
      DataField = 'recorg_sysid'
      DataSource = NoticeInfod
      EditButton.Visible = False
      EditButtons = <
        item
          Style = ebsEllipsisEh
          OnClick = lcmbRecOrgEditButtons0Click
        end>
      KeyField = 'recorg_sysid'
      ListField = 'recorg_name'
      ListSource = mComInfod
      ParentCtl3D = False
      TabOrder = 0
      Visible = True
      OnDropDown = lcmbRecOrgDropDown
    end
    object eNoticeNo: TDBEditEh
      Left = 80
      Top = 43
      Width = 139
      Height = 18
      Color = clSkyBlue
      Ctl3D = False
      DataField = 'notice_no'
      DataSource = NoticeInfod
      EditButtons = <>
      MaxLength = 18
      ParentCtl3D = False
      TabOrder = 1
      Visible = True
      EditMask = '0000('#29305')'#23383#31532'0000'#21495';0; '
    end
    object mMatter: TdxDBMemo
      Left = 79
      Top = 113
      Width = 550
      TabOrder = 2
      DataField = 'matter'
      DataSource = NoticeInfod
      StyleController = dmData.dxStyleCtrl
      Height = 51
    end
    object lcmbSendOrg: TDBLookupComboboxEh
      Left = 386
      Top = 66
      Width = 241
      Height = 18
      Color = clSkyBlue
      Ctl3D = False
      DataField = 'sendorg_sysid'
      DataSource = NoticeInfod
      EditButton.Visible = False
      EditButtons = <
        item
          Style = ebsEllipsisEh
          OnClick = lcmbSendOrgEditButtons0Click
        end>
      KeyField = 'sendorg_sysid'
      ListField = 'sendorg_name'
      ListSource = mComInfod
      ParentCtl3D = False
      TabOrder = 3
      Visible = True
      OnDropDown = lcmbSendOrgDropDown
    end
    object eDevKind: TdxDBPickEdit
      Left = 386
      Top = 42
      Width = 161
      Style.BorderStyle = xbsSingle
      Style.ButtonStyle = btsFlat
      TabOrder = 4
      DataField = 'dev_name'
      DataSource = NoticeInfod
      StyleController = dmData.dxStyleCtrl
      DropDownListStyle = True
    end
    object mReturnIdea: TdxDBMemo
      Left = 79
      Top = 167
      Width = 550
      TabOrder = 5
      DataField = 'return_idea'
      DataSource = NoticeInfod
      StyleController = dmData.dxStyleCtrl
      Height = 51
    end
    object deSendDate: TCSdxDBDateEdit
      Left = 79
      Top = 221
      Width = 100
      Color = clSkyBlue
      Style.BorderStyle = xbsSingle
      Style.ButtonStyle = btsFlat
      TabOrder = 6
      DataField = 'send_date'
      DataSource = NoticeInfod
      StyleController = dmData.dxStyleCtrl
      DateOnError = deToday
      FixedDateFormat = 'yyyy-MM-dd'
      StoredValues = 4
    end
    object deReturnDate: TCSdxDBDateEdit
      Left = 386
      Top = 221
      Width = 100
      Style.BorderStyle = xbsSingle
      Style.ButtonStyle = btsFlat
      TabOrder = 7
      DataField = 'return_date'
      DataSource = NoticeInfod
      StyleController = dmData.dxStyleCtrl
      DateOnError = deToday
      FixedDateFormat = 'yyyy-MM-dd'
      StoredValues = 4
    end
    object deEndDate: TCSdxDBDateEdit
      Left = 117
      Top = 89
      Width = 100
      Color = clSkyBlue
      Style.BorderStyle = xbsSingle
      Style.ButtonStyle = btsFlat
      TabOrder = 8
      DataField = 'end_date'
      DataSource = NoticeInfod
      StyleController = dmData.dxStyleCtrl
      DateOnError = deToday
      FixedDateFormat = 'yyyy-MM-dd'
      StoredValues = 4
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 252
    Width = 688
    Height = 173
    Align = alClient
    Caption = ' '#30417#23519#24847#35265#20070#19968#35272#34920' '
    TabOrder = 2
    object Panel2: TPanel
      Left = 2
      Top = 143
      Width = 684
      Height = 28
      Align = alBottom
      BevelOuter = bvLowered
      TabOrder = 0
      object Panel4: TPanel
        Left = 231
        Top = 1
        Width = 452
        Height = 26
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 3
        object bbtnInsert: TBitBtn
          Left = 0
          Top = 2
          Width = 50
          Height = 22
          Hint = #28155#21152#35760#24405
          Caption = #28155#21152
          TabOrder = 0
          OnClick = bbtnInsertClick
          Glyph.Data = {
            46010000424D460100000000000076000000280000001C0000000D0000000100
            040000000000D000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            333333333333333300003333333333333333333FFFF333330000333330003333
            3333337333F3333300003333300033333333337333F333330000333330003333
            3333FF3333FFFF3300003300000000033337333333333F330000330000000003
            3337333333333F3300003300000000033337333333333F330000333330003333
            333777733337733300003333300033333333337333F333330000333330003333
            3333337333F33333000033333333333333333377773333330000333333333333
            33333333333333330000}
          NumGlyphs = 2
        end
        object bbtnDelete: TBitBtn
          Left = 50
          Top = 2
          Width = 50
          Height = 22
          Hint = #21024#38500#35760#24405
          Caption = #21024#38500
          TabOrder = 1
          OnClick = bbtnDeleteClick
          Glyph.Data = {
            46010000424D460100000000000076000000280000001C0000000D0000000100
            040000000000D000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333333333000033333333333333333333333333330000333333333333
            3333333333333333000033333333333333333333333333330000333333333333
            3337FFFFFFFFFFF3000033000000000033373333333333F30000330000000000
            33373333333333F3000033000000000033373333333333F30000333333333333
            33377777777777F3000033333333333333333333333333330000333333333333
            3333333333333333000033333333333333333333333333330000333333333333
            33333333333333330000}
          NumGlyphs = 2
        end
        object navList: TCSDBNavigator
          Left = 100
          Top = 2
          Width = 200
          Height = 22
          DataSource = Listd
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          TabOrder = 2
          Captions.Strings = (
            #26368#21069
            #21518#36864
            #21069#36827
            #26368#21518
            #28155#21152
            #21024#38500
            #20462#25913
            #20445#23384
            #21462#28040
            #21047#26032)
        end
        object navInfo: TCSDBNavigator
          Left = 300
          Top = 2
          Width = 150
          Height = 22
          DataSource = NoticeInfod
          VisibleButtons = [nbPost, nbCancel, nbRefresh]
          TabOrder = 3
          BeforeAction = navInfoBeforeAction
          Captions.Strings = (
            #26368#21069
            #21518#36864
            #21069#36827
            #26368#21518
            #28155#21152
            #21024#38500
            #20462#25913
            #20445#23384
            #21462#28040
            #21047#26032)
        end
      end
      object bbtnListFind: TBitBtn
        Left = 3
        Top = 3
        Width = 60
        Height = 22
        Hint = #26597#25214#35760#24405
        Caption = #26597#25214
        TabOrder = 0
        OnClick = bbtnListFindClick
        Glyph.Data = {
          42020000424D4202000000000000420000002800000010000000100000000100
          1000030000000002000000000000000000000000000000000000007C0000E003
          00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C000000000000000000001F7C1F7C1F7C1F7C1F7C000000000000
          000000001F7C0000FF7F0000000000001F7C1F7C1F7C1F7C1F7C0000FF7F0000
          000000001F7C0000FF7F0000000000001F7C1F7C1F7C1F7C1F7C0000FF7F0000
          000000001F7C00000000000000000000000000001F7C00000000000000000000
          000000001F7C00000000FF7F000000000000000000000000FF7F000000000000
          000000001F7C00000000FF7F000000000000186300000000FF7F000000000000
          000000001F7C00000000FF7F000000000000186300000000FF7F000000000000
          000000001F7C1F7C000000000000000000000000000000000000000000000000
          00001F7C1F7C1F7C1F7C0000FF7F0000000000001F7C0000FF7F000000000000
          1F7C1F7C1F7C1F7C1F7C000000000000000000001F7C00000000000000000000
          1F7C1F7C1F7C1F7C1F7C1F7C0000000000001F7C1F7C1F7C0000000000001F7C
          1F7C1F7C1F7C1F7C1F7C1F7C0000FF7F00001F7C1F7C1F7C0000FF7F00001F7C
          1F7C1F7C1F7C1F7C1F7C1F7C0000000000001F7C1F7C1F7C0000000000001F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C}
      end
      object bbtnListFilter: TBitBtn
        Left = 65
        Top = 3
        Width = 60
        Height = 22
        Hint = #36807#28388#35760#24405
        Caption = #36807#28388
        TabOrder = 1
        OnClick = bbtnListFilterClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777770000000
          0000777770F7F7F7F7F07777707F7F700070777770F7F7F0F0F0777770700070
          0070777770F7F7F7F7F07777707F7F70007077770007F7F0F0F0777706000070
          007077770707F7F7F7F077770704444444447770776044444444770777760777
          7777706FF7776077777700000000000777777777777777777777}
      end
      object bbtnListColumn: TBitBtn
        Left = 127
        Top = 3
        Width = 70
        Height = 22
        Hint = #25511#21046#21015#34920#21306#22495#30340#26174#31034#39118#26684
        Caption = #21015#25511#21046
        TabOrder = 2
        OnClick = bbtnListColumnClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000C40E0000C40E00001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FFFFFFFF333
          333330888888F333303030880888F333003030800088F330003030808008F333
          003030888808F333303030888888F33333333000000003333333333333333333
          333300000000000000000F888888F88888870F800088F80008870F888888F888
          88870F888888F88888870FFFFFF8FFFFFF870000000000000000}
      end
    end
    object grdList: TDBGridEh
      Left = 2
      Top = 14
      Width = 684
      Height = 129
      Align = alClient
      AllowedOperations = []
      AllowedSelections = [gstRecordBookmarks, gstRectangle, gstAll]
      DataSource = Listd
      Flat = True
      FooterColor = clWindow
      FooterFont.Charset = GB2312_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -12
      FooterFont.Name = #23435#20307
      FooterFont.Style = []
      InternalSort = True
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghFitRowHeightToText, dghAutoSortMarking, dghMultiSortMarking, dghTraceColSizing]
      RowHeight = 2
      RowLines = 1
      TabOrder = 1
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnGetCellParams = grdListGetCellParams
      Columns = <
        item
          EditButtons = <>
          FieldName = 'notice_no'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'recorg_name'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Width = 250
        end
        item
          EditButtons = <>
          FieldName = 'dev_name'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Width = 200
        end
        item
          EditButtons = <>
          FieldName = 'end_date'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'send_date'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'return_date'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'sendorg_name'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Width = 250
        end
        item
          EditButtons = <>
          FieldName = 'state_name'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Width = 100
        end>
    end
  end
  object ListFind: TCSDBEhGrdFind
    EhDBGrid = grdList
    Left = 18
    Top = 338
  end
  object ListFilter: TCSADOEhGrdFilter
    EhDBGrid = grdList
    Left = 46
    Top = 338
  end
  object ListColCtrl: TCSEhGrdColCtrl
    EhDBGrid = grdList
    ColList = <
      item
        ColIndex = 0
        Name = 'Columns[0]'
        Visible = True
      end>
    Left = 74
    Top = 338
  end
  object CSBarMDIChild1: TCSBarMDIChild
    Left = 102
    Top = 338
  end
  object ScrChild: TCSScrCtrlChild
    Master = dmData.ScrMaster
    Left = 130
    Top = 338
  end
  object List: TCSADOQuery
    CacheSize = 1
    Connection = dmData.adocon
    CursorType = ctStatic
    LockType = ltReadOnly
    AfterScroll = ListAfterScroll
    CommandTimeOut = 300
    Parameters = <>
    SQL.Strings = (
      'device.usp_getsupervisenotice')
    Left = 18
    Top = 310
    object Listsysid: TStringField
      DisplayLabel = #36890#30693#20070#31995#32479#20195#30721
      FieldName = 'sysid'
    end
    object Listnotice_no: TStringField
      DisplayLabel = #36890#30693#20070#32534#21495
      FieldName = 'notice_no'
      Size = 10
    end
    object Listrecorg_sysid: TStringField
      DisplayLabel = #25509#25910#21333#20301#31995#32479#20195#30721#12289
      FieldName = 'recorg_sysid'
    end
    object Listrecorg_name: TStringField
      DisplayLabel = #25509#25910#21333#20301
      FieldName = 'recorg_name'
      Size = 60
    end
    object Listdev_name: TStringField
      DisplayLabel = #35774#22791#21517#31216
      FieldName = 'dev_name'
      Size = 50
    end
    object Listend_date: TStringField
      DisplayLabel = #38480#26399#26085#26399
      FieldName = 'end_date'
      Size = 10
    end
    object Listsend_date: TStringField
      DisplayLabel = #31614#21457#26085#26399
      FieldName = 'send_date'
      Size = 10
    end
    object Listreturn_date: TStringField
      DisplayLabel = #21453#39304#26085#26399
      FieldName = 'return_date'
      Size = 10
    end
    object Listsendorg_sysid: TStringField
      DisplayLabel = #31614#21457#21333#20301#31995#32479#20195#30721
      FieldName = 'sendorg_sysid'
    end
    object Listsendorg_name: TStringField
      DisplayLabel = #31614#21457#21333#20301
      FieldName = 'sendorg_name'
      Size = 60
    end
    object Liststate: TIntegerField
      DisplayLabel = #29366#24577#26631#35782
      FieldName = 'state'
    end
    object Liststate_name: TStringField
      DisplayLabel = #29366#24577
      FieldName = 'state_name'
    end
  end
  object Listd: TDataSource
    DataSet = List
    Left = 46
    Top = 310
  end
  object NoticeInfo: TCSADOQuery
    Connection = dmData.adocon
    CursorType = ctStatic
    BeforeInsert = NoticeInfoBeforeInsert
    AfterInsert = NoticeInfoAfterInsert
    BeforeEdit = NoticeInfoBeforeEdit
    BeforePost = NoticeInfoBeforePost
    AfterPost = NoticeInfoAfterPost
    AfterCancel = NoticeInfoAfterCancel
    AfterDelete = NoticeInfoAfterDelete
    AfterScroll = NoticeInfoAfterScroll
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM device.supervise_notice')
    Left = 74
    Top = 310
    object NoticeInfosysid: TStringField
      DisplayLabel = #31995#32479#20195#30721
      FieldName = 'sysid'
    end
    object NoticeInfonotice_no: TStringField
      DisplayLabel = #36890#30693#20070#32534#21495
      FieldName = 'notice_no'
      Size = 10
    end
    object NoticeInforecorg_sysid: TStringField
      DisplayLabel = #25509#25910#21333#20301#31995#32479#20195#30721
      FieldName = 'recorg_sysid'
    end
    object NoticeInfodev_name: TStringField
      DisplayLabel = #35774#22791#21517#31216
      FieldName = 'dev_name'
      Size = 50
    end
    object NoticeInfoend_date: TStringField
      DisplayLabel = #38480#26399#26085#26399
      FieldName = 'end_date'
      Size = 10
    end
    object NoticeInfomatter: TStringField
      DisplayLabel = #23384#22312#38382#39064
      FieldName = 'matter'
      Size = 300
    end
    object NoticeInfosendorg_sysid: TStringField
      DisplayLabel = #31614#21457#21333#20301#31995#32479#20195#30721
      FieldName = 'sendorg_sysid'
    end
    object NoticeInfosend_date: TStringField
      DisplayLabel = #31614#21457#26085#26399
      FieldName = 'send_date'
      Size = 10
    end
    object NoticeInforeturn_idea: TStringField
      DisplayLabel = #21453#39304#24847#35265
      FieldName = 'return_idea'
      Size = 300
    end
    object NoticeInforeturn_date: TStringField
      DisplayLabel = #21453#39304#26085#26399
      FieldName = 'return_date'
      Size = 10
    end
    object NoticeInfostate: TIntegerField
      DisplayLabel = #24847#35265#20070#29366#24577
      FieldName = 'state'
    end
  end
  object NoticeInfod: TDataSource
    DataSet = NoticeInfo
    Left = 102
    Top = 310
  end
  object Temp: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltReadOnly
    Parameters = <>
    Left = 130
    Top = 310
  end
  object mComInfo: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 158
    Top = 310
    object mComInforecorg_sysid: TStringField
      FieldName = 'recorg_sysid'
    end
    object mComInforecorg_name: TStringField
      FieldName = 'recorg_name'
      Size = 60
    end
    object mComInfosendorg_sysid: TStringField
      FieldName = 'sendorg_sysid'
    end
    object mComInfosendorg_name: TStringField
      FieldName = 'sendorg_name'
      Size = 60
    end
  end
  object mComInfod: TDataSource
    DataSet = mComInfo
    Left = 158
    Top = 338
  end
  object mComInfoBak: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 186
    Top = 310
    object StringField1: TStringField
      FieldName = 'recorg_sysid'
    end
    object StringField2: TStringField
      FieldName = 'recorg_name'
      Size = 60
    end
    object StringField3: TStringField
      FieldName = 'sendorg_sysid'
    end
    object StringField4: TStringField
      FieldName = 'sendorg_name'
      Size = 60
    end
  end
  object frPrintNotice: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Left = 186
    Top = 338
    ReportForm = {18000000}
  end
  object ListEhGrdStore: TCSDBEhGrdStore
    StoreToIniFile = True
    EhDBGrid = grdList
    Left = 214
    Top = 338
  end
end
