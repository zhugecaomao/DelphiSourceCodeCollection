object frmSuprExam: TfrmSuprExam
  Left = 192
  Top = 107
  Width = 696
  Height = 480
  Caption = #23433#20840#30417#30563#26816#26597
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object Splitter2: TSplitter
    Left = 0
    Top = 313
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
    object Panel3: TPanel
      Left = 533
      Top = 1
      Width = 154
      Height = 26
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 4
      object bbtnClose: TBitBtn
        Left = 77
        Top = 2
        Width = 75
        Height = 22
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
      object bbtnHelp: TBitBtn
        Left = 0
        Top = 2
        Width = 75
        Height = 22
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
    end
    object bbtnConfirm: TBitBtn
      Left = 127
      Top = 3
      Width = 60
      Height = 22
      Caption = #30830#35748
      TabOrder = 2
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
    object bbtnSave: TBitBtn
      Left = 3
      Top = 3
      Width = 60
      Height = 22
      Caption = #20445#23384
      Enabled = False
      TabOrder = 0
      OnClick = bbtnSaveClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000C40E0000C40E00000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A6000020400000206000002080000020A0000020C0000020E000004000000040
        20000040400000406000004080000040A0000040C0000040E000006000000060
        20000060400000606000006080000060A0000060C0000060E000008000000080
        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
        20004000400040006000400080004000A0004000C0004000E000402000004020
        20004020400040206000402080004020A0004020C0004020E000404000004040
        20004040400040406000404080004040A0004040C0004040E000406000004060
        20004060400040606000406080004060A0004060C0004060E000408000004080
        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
        20008000400080006000800080008000A0008000C0008000E000802000008020
        20008020400080206000802080008020A0008020C0008020E000804000008040
        20008040400080406000804080008040A0008040C0008040E000806000008060
        20008060400080606000806080008060A0008060C0008060E000808000008080
        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFDFD
        FDFDFDFDFDFDFDFDFDFDFDFD00000000000000000000000000FDFD00E4E40000
        00000000070700E400FDFD00E4E4000000000000070700E400FDFD00E4E40000
        00000000070700E400FDFD00E4E4000000000000000000E400FDFD00E4E4E4E4
        E4E4E4E4E4E4E4E400FDFD00E4E40000000000000000E4E400FDFD00E4000707
        07070707070700E400FDFD00E400070707070707070700E400FDFD00E4000707
        07070707070700E400FDFD00E400070707070707070700E400FDFD00E4000707
        070707070707000000FDFD00E4000707070707070707000700FDFD0000000000
        000000000000000000FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD}
    end
    object bbtnCancel: TBitBtn
      Left = 65
      Top = 3
      Width = 60
      Height = 22
      Caption = #21462#28040
      Enabled = False
      TabOrder = 1
      OnClick = bbtnCancelClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000C40E0000C40E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333333333333333333333333333331333333333
        3133338333333333383331113333333331333838333333333833311113333333
        1333383383333333833333111333333133333383833333383333333111333311
        3333333838333388333333331113311333333333838338833333333331111133
        3333333338388833333333333311133333333333338383333333333331111133
        3333333338388833333333331113311333333333838338833333331111333311
        3333338838333388333331111333333113333833833333388333311133333333
        3133388833333333383333333333333333333333333333333333}
      NumGlyphs = 2
    end
    object bbtnPrint: TBitBtn
      Left = 189
      Top = 3
      Width = 60
      Height = 22
      Hint = #25171#21360#21015#34920#21306#22495#30340#20869#23481
      Caption = #25171#21360
      TabOrder = 3
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
  object GroupBox3: TGroupBox
    Left = 0
    Top = 316
    Width = 688
    Height = 109
    Align = alClient
    Caption = ' '#30417#30563#26816#26597#19968#35272#34920' '
    TabOrder = 1
    object Panel4: TPanel
      Left = 2
      Top = 79
      Width = 684
      Height = 28
      Align = alBottom
      BevelOuter = bvLowered
      TabOrder = 0
      object Panel5: TPanel
        Left = 332
        Top = 1
        Width = 351
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
          Width = 250
          Height = 22
          DataSource = Listd
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
          TabOrder = 2
          BeforeAction = navListBeforeAction
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
      Height = 65
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
          FieldName = 'exam_no'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'exam_date'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'examcom_name'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Width = 250
        end
        item
          EditButtons = <>
          FieldName = 'exam_manager'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'exam_com_persons'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'dev_num'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'dev_reg_num'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'reg_percent'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'req_verify_num'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'fin_verify_num'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'verify_percent'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'operator_num'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'cert_operator_num'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'cert_percent'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'state'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end>
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 313
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object Splitter1: TSplitter
      Left = 431
      Top = 0
      Width = 3
      Height = 313
      Cursor = crSizeWE
    end
    object GroupBox2: TGroupBox
      Left = 434
      Top = 0
      Width = 254
      Height = 313
      Align = alClient
      Caption = ' '#26816#26597#30340#20869#23481#12289#35201#27714' '
      TabOrder = 0
      object grdExamContent: TdxDBGrid
        Left = 2
        Top = 14
        Width = 250
        Height = 269
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        KeyField = 'sysid'
        SummaryGroups = <>
        SummarySeparator = ', '
        Align = alClient
        TabOrder = 0
        DataSource = ExamContentd
        Filter.Criteria = {00000000}
        LookAndFeel = lfFlat
        OptionsBehavior = [edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoTabThrough, edgoVertThrough]
        OptionsCustomize = [edgoBandMoving, edgoBandSizing, edgoColumnMoving, edgoColumnSizing, edgoRowSizing]
        OptionsDB = [edgoCancelOnExit, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoBandHeaderWidth, edgoRowAutoHeight, edgoUseBitmap]
        object grdExamContentexam_no: TdxDBGridColumn
          Alignment = taCenter
          DisableEditor = True
          HeaderAlignment = taCenter
          Width = 40
          BandIndex = 0
          RowIndex = 0
          FieldName = 'exam_no'
        end
        object grdExamContentreq_exam_content: TdxDBGridMemoColumn
          DisableEditor = True
          HeaderAlignment = taCenter
          Width = 250
          BandIndex = 0
          RowIndex = 0
          HeaderMaxLineCount = 1
          FieldName = 'req_exam_content'
        end
        object grdExamContentfact_exam_circs: TdxDBGridMemoColumn
          HeaderAlignment = taCenter
          Width = 250
          BandIndex = 0
          RowIndex = 0
          HeaderMaxLineCount = 1
          FieldName = 'fact_exam_circs'
        end
      end
      object panRequirement: TPanel
        Left = 2
        Top = 283
        Width = 250
        Height = 28
        Align = alBottom
        BevelOuter = bvLowered
        TabOrder = 1
        object Panel8: TPanel
          Left = 35
          Top = 1
          Width = 214
          Height = 26
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 0
          object bbtnExamGenerate: TBitBtn
            Left = 0
            Top = 2
            Width = 60
            Height = 22
            Caption = #29983#25104
            TabOrder = 0
            OnClick = bbtnExamGenerateClick
            Glyph.Data = {
              0E010000424D0E01000000000000760000002800000010000000100000000100
              04000200000098000000C40E0000C40E00000000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0010DD000010DD
              000006DD0A77000004DD02D00800020700000006DDD7700004FB000600FB0700
              000002DD040004BF0006080F070000000006D70FB00004FB00060B8007000000
              0006000BF00004BF040002070000040F02B008FB02070000040B02F00800020D
              0000040F06BF0006B07DDD000000020B0A0004DD0000020F06BF0004B07D04DD
              00000A0006DD000010DD000010DD00000001}
            Spacing = 2
          end
          object navExamContent: TCSDBNavigator
            Left = 62
            Top = 2
            Width = 150
            Height = 22
            DataSource = ExamContentd
            VisibleButtons = [nbPost, nbCancel, nbRefresh]
            TabOrder = 1
            Captions.Strings = (
              #26368#21069
              #21518#36864
              #21069#36827
              #26368#21518
              #28155#21152
              #21024#38500
              #20462#25913
              #30830#35748
              #21462#28040
              #21047#26032)
          end
        end
      end
    end
    object ScrollBox1: TScrollBox
      Left = 0
      Top = 0
      Width = 431
      Height = 313
      Align = alLeft
      TabOrder = 1
      object Label3: TLabel
        Left = 18
        Top = 8
        Width = 60
        Height = 12
        Caption = #26816#26597#32534#21495#65306
      end
      object Label1: TLabel
        Left = 18
        Top = 56
        Width = 60
        Height = 12
        Caption = #35774#22791#21488#25968#65306
      end
      object Label2: TLabel
        Left = 6
        Top = 80
        Width = 72
        Height = 12
        Caption = #27880#20876#30331#35760#25968#65306
      end
      object Label4: TLabel
        Left = 6
        Top = 104
        Width = 72
        Height = 12
        Caption = #27880#20876#30331#35760#29575#65306
      end
      object Label5: TLabel
        Left = 142
        Top = 56
        Width = 72
        Height = 12
        Caption = #24212#26816#35774#22791#25968#65306
      end
      object Label6: TLabel
        Left = 142
        Top = 80
        Width = 72
        Height = 12
        Caption = #24050#26816#35774#22791#25968#65306
      end
      object Label7: TLabel
        Left = 166
        Top = 104
        Width = 48
        Height = 12
        Caption = #23450#26816#29575#65306
      end
      object Label8: TLabel
        Left = 278
        Top = 56
        Width = 84
        Height = 12
        Caption = #22312#23703#25805#20316#21592#25968#65306
      end
      object Label9: TLabel
        Left = 278
        Top = 80
        Width = 84
        Height = 12
        Caption = #25345#35777#19978#23703#20154#25968#65306
      end
      object Label10: TLabel
        Left = 290
        Top = 104
        Width = 72
        Height = 12
        Caption = #25345#35777#19978#23703#29575#65306
      end
      object Label11: TLabel
        Left = 18
        Top = 32
        Width = 60
        Height = 12
        Caption = #21463#26816#21333#20301#65306
      end
      object Label12: TLabel
        Left = 262
        Top = 8
        Width = 60
        Height = 12
        Caption = #26816#26597#26085#26399#65306
      end
      object Label13: TLabel
        Left = 6
        Top = 128
        Width = 72
        Height = 12
        Caption = #26816#26597#36127#36131#20154#65306
      end
      object Label14: TLabel
        Left = 8
        Top = 150
        Width = 84
        Height = 12
        Caption = #21463#26816#21333#20301#24847#35265#65306
      end
      object Label15: TLabel
        Left = 8
        Top = 230
        Width = 240
        Height = 12
        Caption = #23384#22312#38382#39064#12289#20027#35201#20107#25925#38544#24739#21450#25972#25913#24847#35265#12289#35201#27714#65306
      end
      object Label16: TLabel
        Left = 142
        Top = 128
        Width = 108
        Height = 12
        Caption = #21463#26816#21333#20301#37197#21512#20154#21592#65306
      end
      object eExamNo: TdxDBEdit
        Left = 76
        Top = 4
        Width = 100
        TabOrder = 0
        DataField = 'exam_no'
        DataSource = ExamInfod
        StyleController = dxEditStyleController1
      end
      object eDevNum: TdxDBEdit
        Left = 76
        Top = 52
        Width = 60
        TabOrder = 1
        DataField = 'dev_num'
        DataSource = ExamInfod
        StyleController = dxEditStyleController1
      end
      object eDevRegNum: TdxDBEdit
        Left = 76
        Top = 76
        Width = 60
        TabOrder = 2
        DataField = 'dev_reg_num'
        DataSource = ExamInfod
        StyleController = dxEditStyleController1
      end
      object eReqVerifyNum: TdxDBEdit
        Left = 212
        Top = 52
        Width = 60
        TabOrder = 3
        DataField = 'req_verify_num'
        DataSource = ExamInfod
        StyleController = dxEditStyleController1
      end
      object eFinVerifyNum: TdxDBEdit
        Left = 212
        Top = 76
        Width = 60
        TabOrder = 4
        DataField = 'fin_verify_num'
        DataSource = ExamInfod
        StyleController = dxEditStyleController1
      end
      object eOperatorNum: TdxDBEdit
        Left = 360
        Top = 52
        Width = 60
        TabOrder = 5
        DataField = 'operator_num'
        DataSource = ExamInfod
        StyleController = dxEditStyleController1
      end
      object eCertOperatorNum: TdxDBEdit
        Left = 360
        Top = 76
        Width = 60
        TabOrder = 6
        DataField = 'cert_operator_num'
        DataSource = ExamInfod
        StyleController = dxEditStyleController1
      end
      object deExamDate: TCSdxDBDateEdit
        Left = 320
        Top = 4
        Width = 100
        TabOrder = 7
        DataField = 'exam_date'
        DataSource = ExamInfod
        StyleController = dxEditStyleController1
        FixedDateFormat = 'yyyy-MM-dd'
        StoredValues = 4
      end
      object eExamManager: TdxDBEdit
        Left = 76
        Top = 124
        Width = 60
        TabOrder = 8
        DataField = 'exam_manager'
        DataSource = ExamInfod
        StyleController = dxEditStyleController1
      end
      object mExamComIdea: TdxDBMemo
        Left = 4
        Top = 164
        Width = 413
        TabOrder = 9
        DataField = 'exam_com_idea'
        DataSource = ExamInfod
        StyleController = dxEditStyleController1
        Height = 60
      end
      object mExamCircs: TdxDBMemo
        Left = 6
        Top = 244
        Width = 413
        TabOrder = 10
        DataField = 'exam_circs'
        DataSource = ExamInfod
        StyleController = dxEditStyleController1
        Height = 60
      end
      object eExamComPersons: TdxDBEdit
        Left = 248
        Top = 124
        Width = 172
        TabOrder = 11
        DataField = 'exam_com_persons'
        DataSource = ExamInfod
        StyleController = dxEditStyleController1
      end
      object eExamCom: TdxDBButtonEdit
        Left = 76
        Top = 28
        Width = 343
        TabOrder = 12
        DataField = 'examcom_name'
        DataSource = ExamInfod
        StyleController = dxEditStyleController1
        Buttons = <
          item
            Default = True
          end>
        OnButtonClick = eExamComButtonClick
        ExistButtons = True
      end
      object eRegPercent: TdxDBButtonEdit
        Left = 76
        Top = 100
        Width = 60
        TabOrder = 13
        DataField = 'reg_percent'
        DataSource = ExamInfod
        ReadOnly = True
        StyleController = dxEditStyleController1
        Buttons = <
          item
            Default = True
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              1800000000000003000000000000000000000000000000000000F7FFFFFFFFF7
              F7F7F7F7F7FFF7F7F7F7FFF7F7F7FFF7F7F7FFF7FFF7F7F7F7F7F7F7FFF7F7F7
              F7F7F7FFF7FFF7F7F7F7F7F7F7F7F7F7F7F7F7FFFFF7F7F7F7FFF7F7F7F7F7F7
              FFF7F7F7F7FFF7FFF7F7F7FFF7F7F7F7F7F7F7F7FFF7F7FFF7FFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFCECED610000029000031000029000031000029000031
              00003100002900003100003100003100003100002100005A394273738CE7E700
              5A6B003942006B73003942006373003942006B73003942006B6B003139003139
              003942009CAD004200007B7B94CECE009CA54A636384D6D694635A7BD6DE945A
              5A7BDED6945A5A7BDEDE94FFFFFFFFFFFF73738C9494004200007B7B94D6D600
              525A003931005A63003939005A5A003931005A63003939005A5A00292100525A
              0031310094A5003900007B7B94CEC600A5A54A636384D6D6945A5A7BDEDE945A
              5A7BD6D694635A7BD6DE945A5A7BD6D6945A638C949C004200007B7B94D6D600
              525200313900635A003939005A5A003939005A5A003931005A5A00313900635A
              003131009C9C003900007B7B94CECE00A59C42525284CECE944A527BCEC6944A
              4A7BCECE944A5284D6D69452527BD6D6945A5A84949C004200007B7B94CED600
              525200D6CE00BDBD00CEC600BDBD00CEC600BDBD00CECE007B7B008C8C007B84
              008C8C008C94004200007B7B8CCED600101000FFFFFFEFEFFFEFEFFFEFEFFFE7
              EFFFEFE7FFFFFF8C7373007B7B00847B008484008C8C003900006B6384FFFF00
              ADAD007373007B7B007B7300737B007B7B00737B00736B00D6D600CED600CECE
              00CECE00DEE700290000FFFFFF5A5A73736B84737384737384737B8473738473
              7384737384737384736B846B6B846B6B84736B8463637BCECECEF7F7F7FFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFF7F7F7F7FFF7F7F7F7F7F7F7F7FFF7F7F7F7F7F7F7FF
              F7F7F7F7F7F7F7F7F7FFFFFFF7F7F7FFF7F7F7FFF7FFF7F7F7F7}
            Kind = bkGlyph
          end>
        OnButtonClick = eRegPercentButtonClick
        StoredValues = 64
        ExistButtons = True
      end
      object eVerifyPercent: TdxDBButtonEdit
        Left = 212
        Top = 100
        Width = 60
        TabOrder = 14
        DataField = 'verify_percent'
        DataSource = ExamInfod
        ReadOnly = True
        StyleController = dxEditStyleController1
        Buttons = <
          item
            Default = True
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              1800000000000003000000000000000000000000000000000000F7FFFFFFFFF7
              F7F7F7F7F7FFF7F7F7F7FFF7F7F7FFF7F7F7FFF7FFF7F7F7F7F7F7F7FFF7F7F7
              F7F7F7FFF7FFF7F7F7F7F7F7F7F7F7F7F7F7F7FFFFF7F7F7F7FFF7F7F7F7F7F7
              FFF7F7F7F7FFF7FFF7F7F7FFF7F7F7F7F7F7F7F7FFF7F7FFF7FFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFCECED610000029000031000029000031000029000031
              00003100002900003100003100003100003100002100005A394273738CE7E700
              5A6B003942006B73003942006373003942006B73003942006B6B003139003139
              003942009CAD004200007B7B94CECE009CA54A636384D6D694635A7BD6DE945A
              5A7BDED6945A5A7BDEDE94FFFFFFFFFFFF73738C9494004200007B7B94D6D600
              525A003931005A63003939005A5A003931005A63003939005A5A00292100525A
              0031310094A5003900007B7B94CEC600A5A54A636384D6D6945A5A7BDEDE945A
              5A7BD6D694635A7BD6DE945A5A7BD6D6945A638C949C004200007B7B94D6D600
              525200313900635A003939005A5A003939005A5A003931005A5A00313900635A
              003131009C9C003900007B7B94CECE00A59C42525284CECE944A527BCEC6944A
              4A7BCECE944A5284D6D69452527BD6D6945A5A84949C004200007B7B94CED600
              525200D6CE00BDBD00CEC600BDBD00CEC600BDBD00CECE007B7B008C8C007B84
              008C8C008C94004200007B7B8CCED600101000FFFFFFEFEFFFEFEFFFEFEFFFE7
              EFFFEFE7FFFFFF8C7373007B7B00847B008484008C8C003900006B6384FFFF00
              ADAD007373007B7B007B7300737B007B7B00737B00736B00D6D600CED600CECE
              00CECE00DEE700290000FFFFFF5A5A73736B84737384737384737B8473738473
              7384737384737384736B846B6B846B6B84736B8463637BCECECEF7F7F7FFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFF7F7F7F7FFF7F7F7F7F7F7F7F7FFF7F7F7F7F7F7F7FF
              F7F7F7F7F7F7F7F7F7FFFFFFF7F7F7FFF7F7F7FFF7FFF7F7F7F7}
            Kind = bkGlyph
          end>
        OnButtonClick = eVerifyPercentButtonClick
        StoredValues = 64
        ExistButtons = True
      end
      object eCertPercent: TdxDBButtonEdit
        Left = 360
        Top = 100
        Width = 60
        TabOrder = 15
        DataField = 'cert_percent'
        DataSource = ExamInfod
        ReadOnly = True
        StyleController = dxEditStyleController1
        Buttons = <
          item
            Default = True
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              1800000000000003000000000000000000000000000000000000F7FFFFFFFFF7
              F7F7F7F7F7FFF7F7F7F7FFF7F7F7FFF7F7F7FFF7FFF7F7F7F7F7F7F7FFF7F7F7
              F7F7F7FFF7FFF7F7F7F7F7F7F7F7F7F7F7F7F7FFFFF7F7F7F7FFF7F7F7F7F7F7
              FFF7F7F7F7FFF7FFF7F7F7FFF7F7F7F7F7F7F7F7FFF7F7FFF7FFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFCECED610000029000031000029000031000029000031
              00003100002900003100003100003100003100002100005A394273738CE7E700
              5A6B003942006B73003942006373003942006B73003942006B6B003139003139
              003942009CAD004200007B7B94CECE009CA54A636384D6D694635A7BD6DE945A
              5A7BDED6945A5A7BDEDE94FFFFFFFFFFFF73738C9494004200007B7B94D6D600
              525A003931005A63003939005A5A003931005A63003939005A5A00292100525A
              0031310094A5003900007B7B94CEC600A5A54A636384D6D6945A5A7BDEDE945A
              5A7BD6D694635A7BD6DE945A5A7BD6D6945A638C949C004200007B7B94D6D600
              525200313900635A003939005A5A003939005A5A003931005A5A00313900635A
              003131009C9C003900007B7B94CECE00A59C42525284CECE944A527BCEC6944A
              4A7BCECE944A5284D6D69452527BD6D6945A5A84949C004200007B7B94CED600
              525200D6CE00BDBD00CEC600BDBD00CEC600BDBD00CECE007B7B008C8C007B84
              008C8C008C94004200007B7B8CCED600101000FFFFFFEFEFFFEFEFFFEFEFFFE7
              EFFFEFE7FFFFFF8C7373007B7B00847B008484008C8C003900006B6384FFFF00
              ADAD007373007B7B007B7300737B007B7B00737B00736B00D6D600CED600CECE
              00CECE00DEE700290000FFFFFF5A5A73736B84737384737384737B8473738473
              7384737384737384736B846B6B846B6B84736B8463637BCECECEF7F7F7FFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFF7F7F7F7FFF7F7F7F7F7F7F7F7FFF7F7F7F7F7F7F7FF
              F7F7F7F7F7F7F7F7F7FFFFFFF7F7F7FFF7F7F7FFF7FFF7F7F7F7}
            Kind = bkGlyph
          end>
        OnButtonClick = eCertPercentButtonClick
        StoredValues = 64
        ExistButtons = True
      end
    end
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
      'device.usp_getsuprexaminfo')
    Left = 462
    Top = 100
    object Listsysid: TStringField
      DisplayLabel = #31995#32479#20195#30721
      FieldName = 'sysid'
    end
    object Listexam_no: TStringField
      DisplayLabel = #26816#26597#32534#21495
      FieldName = 'exam_no'
    end
    object Listexam_date: TStringField
      DisplayLabel = #26816#26597#26085#26399
      FieldName = 'exam_date'
      Size = 10
    end
    object Listexamcom_sysid: TStringField
      DisplayLabel = #21463#26816#21333#20301#31995#32479#20195#30721
      FieldName = 'examcom_sysid'
    end
    object Listexamcom_name: TStringField
      DisplayLabel = #21463#26816#21333#20301
      FieldName = 'examcom_name'
      Size = 60
    end
    object Listexam_manager: TStringField
      DisplayLabel = #26816#26597#36127#36131#20154
      FieldName = 'exam_manager'
      Size = 30
    end
    object Listexam_com_persons: TStringField
      DisplayLabel = #21463#26816#21333#20301#37197#21512#20154#21592
      FieldName = 'exam_com_persons'
      Size = 50
    end
    object Listdev_num: TIntegerField
      DisplayLabel = #22312#29992#35774#22791#25968
      FieldName = 'dev_num'
    end
    object Listdev_reg_num: TIntegerField
      DisplayLabel = #27880#20876#30331#35760#25968
      FieldName = 'dev_reg_num'
    end
    object Listreg_percent: TBCDField
      DisplayLabel = #27880#20876#30331#35760#29575
      FieldName = 'reg_percent'
      Precision = 18
      Size = 1
    end
    object Listreq_verify_num: TIntegerField
      DisplayLabel = #24212#26816#35774#22791#25968
      FieldName = 'req_verify_num'
    end
    object Listfin_verify_num: TIntegerField
      DisplayLabel = #24050#26816#35774#22791#25968
      FieldName = 'fin_verify_num'
    end
    object Listverify_percent: TBCDField
      DisplayLabel = #23450#26816#29575
      FieldName = 'verify_percent'
      Precision = 18
      Size = 1
    end
    object Listoperator_num: TIntegerField
      DisplayLabel = #25805#20316#20154#25968
      FieldName = 'operator_num'
    end
    object Listcert_operator_num: TIntegerField
      DisplayLabel = #25345#35777#20154#25968
      FieldName = 'cert_operator_num'
    end
    object Listcert_percent: TBCDField
      DisplayLabel = #25345#35777#19978#23703#29575
      FieldName = 'cert_percent'
      Precision = 18
      Size = 1
    end
    object Liststate: TIntegerField
      DisplayLabel = #29366#24577
      FieldName = 'state'
    end
  end
  object Listd: TDataSource
    DataSet = List
    Left = 490
    Top = 100
  end
  object ExamInfo: TCSADOQuery
    Connection = dmData.adocon
    CursorType = ctStatic
    AfterInsert = ExamInfoAfterInsert
    BeforeEdit = ExamInfoBeforeEdit
    AfterScroll = ExamInfoAfterScroll
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM device.supr_exam_info')
    Left = 518
    Top = 100
    object ExamInfosysid: TStringField
      DisplayLabel = #31995#32479#20195#30721
      FieldName = 'sysid'
    end
    object ExamInfoexam_no: TStringField
      DisplayLabel = #26816#26597#32534#21495
      FieldName = 'exam_no'
    end
    object ExamInfoexam_date: TStringField
      DisplayLabel = #26816#26597#26085#26399
      FieldName = 'exam_date'
      Size = 10
    end
    object ExamInfoexamcom_sysid: TStringField
      DisplayLabel = #21463#26816#21333#20301
      FieldName = 'examcom_sysid'
    end
    object ExamInfoexamcom_name: TStringField
      FieldKind = fkLookup
      FieldName = 'examcom_name'
      LookupDataSet = mComInfo
      LookupKeyFields = 'examcom_sysid'
      LookupResultField = 'examcom_name'
      KeyFields = 'examcom_sysid'
      Size = 60
      Lookup = True
    end
    object ExamInfoexam_manager: TStringField
      DisplayLabel = #26816#26597#36127#36131#20154
      FieldName = 'exam_manager'
      Size = 30
    end
    object ExamInfoexam_com_persons: TStringField
      DisplayLabel = #21463#26816#21333#20301#37197#21512#20154#21592
      FieldName = 'exam_com_persons'
      Size = 50
    end
    object ExamInfoexam_com_idea: TStringField
      DisplayLabel = #21463#26816#21333#20301#24847#35265
      FieldName = 'exam_com_idea'
      Size = 300
    end
    object ExamInfoexam_circs: TStringField
      DisplayLabel = #26816#26597#24773#20917
      FieldName = 'exam_circs'
      Size = 300
    end
    object ExamInfodev_num: TIntegerField
      DisplayLabel = #22312#29992#35774#22791#25968
      FieldName = 'dev_num'
    end
    object ExamInfodev_reg_num: TIntegerField
      DisplayLabel = #27880#20876#30331#35760#25968
      FieldName = 'dev_reg_num'
    end
    object ExamInforeg_percent: TBCDField
      DisplayLabel = #27880#20876#30331#35760#29575
      FieldName = 'reg_percent'
      Precision = 18
      Size = 1
    end
    object ExamInforeq_verify_num: TIntegerField
      DisplayLabel = #24212#26816#25968
      FieldName = 'req_verify_num'
    end
    object ExamInfofin_verify_num: TIntegerField
      DisplayLabel = #24050#26816#25968
      FieldName = 'fin_verify_num'
    end
    object ExamInfoverify_percent: TBCDField
      DisplayLabel = #23450#26816#29575
      FieldName = 'verify_percent'
      Precision = 18
      Size = 1
    end
    object ExamInfooperator_num: TIntegerField
      DisplayLabel = #22312#23703#25805#20316#21592#25968
      FieldName = 'operator_num'
    end
    object ExamInfocert_operator_num: TIntegerField
      DisplayLabel = #25345#35777#19978#23703#20154#25968
      FieldName = 'cert_operator_num'
    end
    object ExamInfocert_percent: TBCDField
      DisplayLabel = #25345#35777#19978#23703#29575
      FieldName = 'cert_percent'
      Precision = 18
      Size = 1
    end
    object ExamInfostate: TIntegerField
      DisplayLabel = #29366#24577
      FieldName = 'state'
    end
  end
  object ExamInfod: TDataSource
    DataSet = ExamInfo
    Left = 546
    Top = 100
  end
  object Temp: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltReadOnly
    Parameters = <>
    Left = 630
    Top = 100
  end
  object mComInfo: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 462
    Top = 156
    object mComInfoexamcom_sysid: TStringField
      FieldName = 'examcom_sysid'
    end
    object mComInfoexamcom_name: TStringField
      FieldName = 'examcom_name'
      Size = 60
    end
  end
  object mComInfoBak: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 490
    Top = 156
    object mComInfoBakexamcom_sysid: TStringField
      FieldName = 'examcom_sysid'
    end
    object mComInfoBakexamcom_name: TStringField
      FieldName = 'examcom_name'
      Size = 60
    end
  end
  object ListFind: TCSDBEhGrdFind
    EhDBGrid = grdList
    Left = 462
    Top = 128
  end
  object ListFilter: TCSADOEhGrdFilter
    EhDBGrid = grdList
    Left = 490
    Top = 128
  end
  object ListColCtrl: TCSEhGrdColCtrl
    EhDBGrid = grdList
    ColList = <
      item
        ColIndex = 0
        Name = 'Columns[0]'
        Visible = True
      end>
    Left = 518
    Top = 128
  end
  object CSBarMDIChild1: TCSBarMDIChild
    Left = 546
    Top = 128
  end
  object ScrChild: TCSScrCtrlChild
    Master = dmData.ScrMaster
    Left = 574
    Top = 128
  end
  object mComInfod: TDataSource
    DataSet = mComInfo
    Left = 462
    Top = 184
  end
  object ListEhGrdStore: TCSDBEhGrdStore
    StoreToIniFile = True
    EhDBGrid = grdList
    Left = 630
    Top = 128
  end
  object ExamContent: TCSADOQuery
    CacheSize = 1
    Connection = dmData.adocon
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM device.supr_exam_content')
    Left = 574
    Top = 100
    object ExamContentsysid: TStringField
      DisplayLabel = #31995#32479#20195#30721
      FieldName = 'sysid'
    end
    object ExamContentexam_sysid: TStringField
      DisplayLabel = #30417#30563#26816#26597#31995#32479#20195#30721
      FieldName = 'exam_sysid'
    end
    object ExamContentexam_no: TIntegerField
      DisplayLabel = #24207#21495
      FieldName = 'exam_no'
    end
    object ExamContentreq_exam_content: TStringField
      DisplayLabel = #26816#26597#20869#23481#12289#35201#27714
      FieldName = 'req_exam_content'
      Size = 300
    end
    object ExamContentfact_exam_circs: TStringField
      DisplayLabel = #26816#26597#23454#38469#24773#20917
      FieldName = 'fact_exam_circs'
      Size = 300
    end
  end
  object ExamContentd: TDataSource
    DataSet = ExamContent
    Left = 602
    Top = 100
  end
  object StyleController: TdxEditStyleController
    BorderColor = 14859373
    BorderStyle = xbsSingle
    ButtonStyle = btsSimple
    HotTrack = True
    Shadow = True
    Left = 518
    Top = 156
  end
  object dxEditStyleController1: TdxEditStyleController
    BorderColor = 14065456
    BorderStyle = xbsSingle
    ButtonStyle = btsSimple
    HotTrack = True
    Left = 546
    Top = 156
  end
  object frPrintExam: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Left = 574
    Top = 156
    ReportForm = {18000000}
  end
  object frDBExamContent: TfrDBDataSet
    DataSet = ExamContent
    Left = 602
    Top = 156
  end
end
