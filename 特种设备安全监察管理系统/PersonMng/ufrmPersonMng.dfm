object frmPersonMng: TfrmPersonMng
  Left = -1
  Top = 93
  Width = 787
  Height = 499
  Caption = #20154#21592#20449#24687
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object Splitter1: TSplitter
    Left = 0
    Top = 278
    Width = 779
    Height = 3
    Cursor = crSizeNS
    Align = alTop
  end
  object Panel1: TPanel
    Left = 0
    Top = 444
    Width = 779
    Height = 28
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 4
    object Panel5: TPanel
      Left = 418
      Top = 1
      Width = 360
      Height = 26
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 1
      object bbtnExport: TBitBtn
        Left = 62
        Top = 2
        Width = 60
        Height = 22
        Hint = #23548#20986#21015#34920#21306#22495#20013#36873#20013#30340#25968#25454
        Caption = #23548#20986
        TabOrder = 0
        OnClick = bbtnExportClick
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
      object bbtnPrint: TBitBtn
        Left = 124
        Top = 2
        Width = 80
        Height = 22
        Hint = #25171#21360#21015#34920#21306#22495#30340#20869#23481
        Caption = #25171#21360#21015#34920
        TabOrder = 1
        OnClick = bbtnPrintClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000C40E0000C40E00001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          FFFFFF00000000000FFFF0FFFFFFFFF0F0FF0000000000000F0F0FFFFFFAAAFF
          000F0FFFFFF777FF0F0F0000000000000FF00FFFFFFFFFF0F0F0F0000000000F
          0F00FF0FFFFF8880F0F0FFF0F7777780000FFFF0FFFFFFF80FFFFFFF0F77777F
          0FFFFFFF0FFFFFFFF0FFFFFFF000000000FFFFFFFFFFFFFFFFFF}
      end
      object bbtnHelp: TBitBtn
        Left = 206
        Top = 2
        Width = 75
        Height = 22
        Hint = #33719#21462#30456#20851#24110#21161
        Caption = #24110#21161'(&H)'
        TabOrder = 2
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
        Left = 283
        Top = 2
        Width = 75
        Height = 22
        Hint = #20851#38381#24403#21069#31383#21475
        Caption = #20851#38381'(&C)'
        TabOrder = 3
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
      object bbtnReplace: TBitBtn
        Left = 0
        Top = 2
        Width = 60
        Height = 22
        Hint = #23548#20986#21015#34920#21306#22495#20013#36873#20013#30340#25968#25454
        Caption = #21512#24182
        TabOrder = 4
        Glyph.Data = {
          42020000424D4202000000000000420000002800000010000000100000000100
          1000030000000002000000000000000000000000000000000000007C0000E003
          00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C000000000000000000000000
          00001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7F
          00001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000FF7F1F001F001F00FF7F
          00001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7F
          00001F7C1F7C1F7C1F7C000000000000000000000000FF7F1F001F001F00FF7F
          00001F7C1F7C1F7C1F7C000018631863186318630000FF7FFF7FFF7FFF7FFF7F
          00001F7C1F7C00000000000018631F001F001F000000FF7F1F001F001F00FF7F
          00001F7C1F7C00001002000018631863186318630000FF7FFF7FFF7FFF7FFF7F
          00001F7C1F7C00001002000018631F001F001F00000000000000000000000000
          00001F7C1F7C0000100200001863186318631863186300001F7C1F7C1F7C1F7C
          1F7C1F7C1F7C00001002000018631F001F001F00186300001F7C1F7C1F7C1F7C
          1F7C10001F7C0000100200001863186318631863186300001F7C1F7C1F7C1F7C
          1000100010000000100200000000000000000000000000001F7C1F7C1F7C1F7C
          1F7C10001F7C00001002100210021002100200001F7C1F7C1F7C10001F7C1F7C
          1F7C10001F7C00000000000000000000000000001F7C1F7C1F7C1F7C10001000
          10001F7C1F7C}
      end
    end
    object bbtnSelect: TBitBtn
      Left = 3
      Top = 3
      Width = 80
      Height = 22
      Caption = #30830#35748#36873#25321
      ModalResult = 1
      TabOrder = 0
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
  end
  object Panel2: TPanel
    Left = 0
    Top = 416
    Width = 779
    Height = 28
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 3
    object Panel4: TPanel
      Left = 326
      Top = 1
      Width = 452
      Height = 26
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 3
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
          #30830#35748
          #21462#28040
          #21047#26032)
      end
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
        Spacing = 2
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
        Spacing = 2
      end
      object navPersonInfo: TCSDBNavigator
        Left = 300
        Top = 2
        Width = 100
        Height = 22
        DataSource = PersonInfod
        VisibleButtons = [nbPost, nbCancel]
        TabOrder = 3
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
      object bbtnRefresh: TBitBtn
        Left = 400
        Top = 2
        Width = 50
        Height = 22
        Caption = #21047#26032
        TabOrder = 4
        OnClick = bbtnRefreshClick
        Glyph.Data = {
          DE000000424DDE0000000000000076000000280000000E0000000D0000000100
          04000000000068000000C40E0000C40E00001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3300333337073333330033370073333333003330073333333300337073333333
          3300330033333333330033003330000033003300733370003300337007370000
          3300333000000070330033337000733033003333333333333300333333333333
          3300}
      end
    end
    object bbtnFind: TBitBtn
      Left = 3
      Top = 3
      Width = 60
      Height = 22
      Hint = #26597#25214#35760#24405
      Caption = #26597#25214
      TabOrder = 0
      OnClick = bbtnFindClick
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
    object bbtnFilter: TBitBtn
      Left = 65
      Top = 3
      Width = 60
      Height = 22
      Hint = #36807#28388#35760#24405
      Caption = #36807#28388
      TabOrder = 1
      OnClick = bbtnFilterClick
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
    object bbtnColunm: TBitBtn
      Left = 127
      Top = 3
      Width = 70
      Height = 22
      Hint = #25511#21046#21015#34920#21306#22495#30340#26174#31034#39118#26684
      Caption = #21015#25511#21046
      TabOrder = 2
      OnClick = bbtnColunmClick
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
  object grdPersonList: TDBGridEh
    Left = 0
    Top = 281
    Width = 779
    Height = 113
    Align = alClient
    AllowedOperations = []
    AllowedSelections = [gstRecordBookmarks, gstRectangle, gstAll]
    DataSource = Listd
    EditActions = [geaCutEh, geaCopyEh, geaPasteEh, geaDeleteEh, geaSelectAllEh]
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = GB2312_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -12
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    InternalSort = True
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking]
    ReadOnly = True
    SumList.Active = True
    TabOrder = 1
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'name'
        Footers = <>
        Title.Alignment = taCenter
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'organ_sysid_name'
        Footers = <>
        Title.Alignment = taCenter
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'cardid'
        Footers = <>
        Title.Alignment = taCenter
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'regno'
        Footers = <>
        Title.Alignment = taCenter
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'birthdate'
        Footers = <>
        Title.Alignment = taCenter
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'sex_name'
        Footers = <>
        Title.Alignment = taCenter
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'addr'
        Footers = <>
        Title.Alignment = taCenter
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'tel'
        Footers = <>
        Title.Alignment = taCenter
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'edudegree_name'
        Footers = <>
        Title.Alignment = taCenter
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'speciality'
        Footers = <>
        Title.Alignment = taCenter
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'zip'
        Footers = <>
        Title.Alignment = taCenter
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'titleofpost'
        Footers = <>
        Title.Alignment = taCenter
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'nation_name'
        Footers = <>
        Title.Alignment = taCenter
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'polity'
        Footers = <>
        Title.Alignment = taCenter
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'workinfo_name'
        Footers = <>
        Title.Alignment = taCenter
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'ismarry_name'
        Footers = <>
        Title.Alignment = taCenter
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'mate'
        Footers = <>
        Title.Alignment = taCenter
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'passportid'
        Footers = <>
        Title.Alignment = taCenter
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'degree_name'
        Footers = <>
        Title.Alignment = taCenter
        Title.TitleButton = True
      end>
  end
  object CSRowCountPanel1: TCSRowCountPanel
    Left = 0
    Top = 394
    Width = 779
    Align = alBottom
    TabOrder = 2
    CaptionFormat = ' '#35760#24405#25968#65306'%d'
    DataSource = Listd
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 779
    Height = 278
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    object pagPsnInfo: TPageControl
      Left = 1
      Top = 1
      Width = 777
      Height = 276
      ActivePage = tsBaseInfo
      Align = alClient
      TabIndex = 0
      TabOrder = 0
      object tsBaseInfo: TTabSheet
        Caption = #22522#26412#20449#24687
        object scrbDetail: TScrollBox
          Left = 0
          Top = 0
          Width = 769
          Height = 249
          Align = alClient
          TabOrder = 0
          object Label2: TLabel
            Left = 36
            Top = 8
            Width = 36
            Height = 12
            Alignment = taRightJustify
            Caption = #22995#21517#65306
          end
          object Label13: TLabel
            Left = 208
            Top = 8
            Width = 48
            Height = 12
            Alignment = taRightJustify
            Caption = #36523#20221#35777#65306
          end
          object Label14: TLabel
            Left = 12
            Top = 125
            Width = 60
            Height = 12
            Alignment = taRightJustify
            Caption = #23478#24237#22320#22336#65306
          end
          object Label6: TLabel
            Left = 380
            Top = 125
            Width = 60
            Height = 12
            Alignment = taRightJustify
            Caption = #20303#23429#30005#35805#65306
          end
          object Label11: TLabel
            Left = 36
            Top = 31
            Width = 36
            Height = 12
            Alignment = taRightJustify
            Caption = #24615#21035#65306
          end
          object Label1: TLabel
            Left = 380
            Top = 31
            Width = 60
            Height = 12
            Alignment = taRightJustify
            Caption = #20986#29983#26085#26399#65306
          end
          object Label3: TLabel
            Left = 566
            Top = 125
            Width = 60
            Height = 12
            Alignment = taRightJustify
            Caption = #37038#25919#32534#30721#65306
          end
          object Label18: TLabel
            Left = 196
            Top = 102
            Width = 60
            Height = 12
            Alignment = taRightJustify
            Caption = #25152#23398#19987#19994#65306
          end
          object Label32: TLabel
            Left = 28
            Top = 148
            Width = 44
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = #32844#31216#65306
          end
          object Label4: TLabel
            Left = 400
            Top = 102
            Width = 36
            Height = 12
            Alignment = taRightJustify
            Caption = #23398#20301#65306
          end
          object Label5: TLabel
            Left = 566
            Top = 102
            Width = 60
            Height = 12
            Alignment = taRightJustify
            Caption = #27605#19994#26102#38388#65306
          end
          object Label7: TLabel
            Left = 12
            Top = 102
            Width = 60
            Height = 12
            Alignment = taRightJustify
            Caption = #27605#19994#23398#26657#65306
          end
          object Label8: TLabel
            Left = 196
            Top = 148
            Width = 60
            Height = 12
            Alignment = taRightJustify
            Caption = #35780#23450#26102#38388#65306
          end
          object Label9: TLabel
            Left = 377
            Top = 171
            Width = 63
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = #29031#29255#20449#24687#65306
          end
          object Label10: TLabel
            Left = 590
            Top = 31
            Width = 36
            Height = 12
            Alignment = taRightJustify
            Caption = #27665#26063#65306
          end
          object Label12: TLabel
            Left = 12
            Top = 55
            Width = 60
            Height = 12
            Alignment = taRightJustify
            Caption = #25919#27835#38754#35980#65306
          end
          object Label15: TLabel
            Left = 195
            Top = 78
            Width = 61
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = #22312#32844#24773#20917#65306
          end
          object Label16: TLabel
            Left = 380
            Top = 55
            Width = 60
            Height = 12
            Alignment = taRightJustify
            Caption = #23130#23035#29366#20917#65306
          end
          object Label17: TLabel
            Left = 566
            Top = 55
            Width = 60
            Height = 12
            Alignment = taRightJustify
            Caption = #37197#20598#22995#21517#65306
          end
          object Label20: TLabel
            Left = 195
            Top = 31
            Width = 61
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = #25252#29031#21495#30721#65306
          end
          object Label21: TLabel
            Left = 220
            Top = 55
            Width = 36
            Height = 12
            Alignment = taRightJustify
            Caption = #23398#21382#65306
          end
          object Label22: TLabel
            Left = 36
            Top = 78
            Width = 36
            Height = 12
            Alignment = taRightJustify
            Caption = #23703#20301#65306
          end
          object Label23: TLabel
            Left = 36
            Top = 171
            Width = 36
            Height = 12
            Alignment = taRightJustify
            Caption = #22791#27880#65306
          end
          object Label24: TLabel
            Left = 404
            Top = 8
            Width = 36
            Height = 12
            Caption = #21333#20301#65306
          end
          object Label19: TLabel
            Left = 396
            Top = 78
            Width = 44
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = #24037#21495#65306
          end
          object eName: TDBEditEh
            Left = 72
            Top = 5
            Width = 118
            Height = 18
            Color = clSkyBlue
            Ctl3D = False
            DataField = 'name'
            DataSource = PersonInfod
            EditButtons = <>
            ParentCtl3D = False
            TabOrder = 0
            Visible = True
          end
          object eCardid: TDBEditEh
            Left = 256
            Top = 5
            Width = 118
            Height = 18
            Color = clSkyBlue
            Ctl3D = False
            DataField = 'cardid'
            DataSource = PersonInfod
            EditButtons = <>
            ParentCtl3D = False
            TabOrder = 1
            Visible = True
          end
          object eTel: TDBEditEh
            Left = 440
            Top = 122
            Width = 118
            Height = 18
            Ctl3D = False
            DataField = 'tel'
            DataSource = PersonInfod
            EditButtons = <>
            ParentCtl3D = False
            TabOrder = 19
            Visible = True
          end
          object ePassid: TDBEditEh
            Left = 256
            Top = 28
            Width = 118
            Height = 18
            Ctl3D = False
            DataField = 'passportid'
            DataSource = PersonInfod
            EditButtons = <>
            ParentCtl3D = False
            TabOrder = 4
            Visible = True
          end
          object ePolity: TDBEditEh
            Left = 72
            Top = 52
            Width = 118
            Height = 18
            Ctl3D = False
            DataField = 'polity'
            DataSource = PersonInfod
            EditButtons = <>
            ParentCtl3D = False
            TabOrder = 7
            Visible = True
          end
          object eMate: TDBEditEh
            Left = 626
            Top = 52
            Width = 118
            Height = 18
            Ctl3D = False
            DataField = 'mate'
            DataSource = PersonInfod
            EditButtons = <>
            ParentCtl3D = False
            TabOrder = 10
            Visible = True
          end
          object eZip: TDBEditEh
            Left = 626
            Top = 122
            Width = 118
            Height = 18
            Ctl3D = False
            DataField = 'zip'
            DataSource = PersonInfod
            EditButtons = <>
            ParentCtl3D = False
            TabOrder = 20
            Visible = True
          end
          object ePost: TDBEditEh
            Left = 72
            Top = 75
            Width = 118
            Height = 18
            Ctl3D = False
            DataField = 'post'
            DataSource = PersonInfod
            EditButtons = <>
            ParentCtl3D = False
            TabOrder = 11
            Visible = True
          end
          object eTitleofpast: TDBEditEh
            Left = 72
            Top = 145
            Width = 121
            Height = 18
            Ctl3D = False
            DataField = 'titleofpost'
            DataSource = PersonInfod
            EditButtons = <>
            ParentCtl3D = False
            TabOrder = 21
            Visible = True
          end
          object mRemark: TdxDBMemo
            Left = 72
            Top = 168
            Width = 301
            TabOrder = 23
            DataField = 'remark'
            DataSource = PersonInfod
            StyleController = dmData.dxStyleCtrl
            Height = 97
          end
          object eAddr: TDBEditEh
            Left = 72
            Top = 122
            Width = 302
            Height = 18
            Ctl3D = False
            DataField = 'addr'
            DataSource = PersonInfod
            EditButtons = <>
            ParentCtl3D = False
            TabOrder = 18
            Visible = True
          end
          object lcmbSex: TDBLookupComboboxEh
            Left = 72
            Top = 28
            Width = 118
            Height = 18
            Ctl3D = False
            DataField = 'sex'
            DataSource = PersonInfod
            EditButtons = <>
            KeyField = 'id'
            ListField = 'name'
            ListSource = sexd
            ParentCtl3D = False
            TabOrder = 3
            Visible = True
          end
          object lcmbZzqk: TDBLookupComboboxEh
            Left = 256
            Top = 75
            Width = 118
            Height = 18
            Ctl3D = False
            DataField = 'workinfo'
            DataSource = PersonInfod
            EditButtons = <>
            KeyField = 'id'
            ListField = 'name'
            ListSource = zzqkd
            ParentCtl3D = False
            TabOrder = 12
            Visible = True
          end
          object lcmbDegree: TDBLookupComboboxEh
            Left = 440
            Top = 99
            Width = 118
            Height = 18
            Ctl3D = False
            DataField = 'degree'
            DataSource = PersonInfod
            EditButtons = <>
            KeyField = 'id'
            ListField = 'name'
            ListSource = degreed
            ParentCtl3D = False
            TabOrder = 16
            Visible = True
          end
          object lcmbEdudegree: TDBLookupComboboxEh
            Left = 256
            Top = 52
            Width = 118
            Height = 18
            Ctl3D = False
            DataField = 'education'
            DataSource = PersonInfod
            EditButtons = <>
            KeyField = 'id'
            ListField = 'name'
            ListSource = edudegreed
            ParentCtl3D = False
            TabOrder = 8
            Visible = True
          end
          object lcmbMarry: TDBLookupComboboxEh
            Left = 440
            Top = 52
            Width = 118
            Height = 18
            Ctl3D = False
            DataField = 'ismarry'
            DataSource = PersonInfod
            EditButtons = <>
            KeyField = 'id'
            ListField = 'name'
            ListSource = marrystatusd
            ParentCtl3D = False
            TabOrder = 9
            Visible = True
          end
          object lcmbNation: TDBLookupComboboxEh
            Left = 626
            Top = 28
            Width = 118
            Height = 18
            Ctl3D = False
            DataField = 'nation'
            DataSource = PersonInfod
            EditButtons = <>
            KeyField = 'id'
            ListField = 'name'
            ListSource = nationd
            ParentCtl3D = False
            TabOrder = 6
            Visible = True
          end
          object eSpecial: TDBEditEh
            Left = 256
            Top = 99
            Width = 118
            Height = 18
            Ctl3D = False
            DataField = 'speciality'
            DataSource = PersonInfod
            EditButtons = <>
            ParentCtl3D = False
            TabOrder = 15
            Visible = True
          end
          object dteBirthday: TCSdxDBDateEdit
            Left = 440
            Top = 27
            Width = 118
            TabOrder = 5
            DataField = 'birthdate'
            DataSource = PersonInfod
            StyleController = dmData.dxStyleCtrl
            FixedDateFormat = 'yyyy-MM-dd'
            StoredValues = 4
          end
          object dteGratime: TCSdxDBDateEdit
            Left = 626
            Top = 98
            Width = 118
            TabOrder = 17
            DataField = 'gradua_time'
            DataSource = PersonInfod
            StyleController = dmData.dxStyleCtrl
            FixedDateFormat = 'yyyy-MM-dd'
            StoredValues = 4
          end
          object dteZcpdtime: TCSdxDBDateEdit
            Left = 256
            Top = 144
            Width = 118
            TabOrder = 22
            DataField = 'zcpd_time'
            DataSource = PersonInfod
            StyleController = dmData.dxStyleCtrl
            FixedDateFormat = 'yyyy-MM-dd'
            StoredValues = 4
          end
          object eGraSchool: TDBEditEh
            Left = 72
            Top = 99
            Width = 118
            Height = 18
            Ctl3D = False
            DataField = 'gradua_school'
            DataSource = PersonInfod
            EditButtons = <>
            ParentCtl3D = False
            TabOrder = 14
            Visible = True
          end
          object lcmbOrgan: TDBLookupComboboxEh
            Left = 440
            Top = 5
            Width = 304
            Height = 18
            Color = clSkyBlue
            Ctl3D = False
            DataField = 'organ_sysid'
            DataSource = PersonInfod
            EditButton.Visible = False
            EditButtons = <
              item
                Style = ebsEllipsisEh
                OnClick = lcmbOrganEditButtons0Click
              end>
            KeyField = 'organ_sysid'
            ListField = 'organ_sysid_name'
            ListSource = mComd
            ParentCtl3D = False
            TabOrder = 2
            Visible = True
          end
          object eRegno: TDBEditEh
            Left = 440
            Top = 75
            Width = 118
            Height = 18
            Ctl3D = False
            DataField = 'regno'
            DataSource = PersonInfod
            EditButtons = <>
            ParentCtl3D = False
            TabOrder = 13
            Visible = True
          end
          object ePic: TdxDBGraphicEdit
            Left = 440
            Top = 168
            Width = 90
            TabOrder = 24
            ReadOnly = False
            StyleController = dmData.dxStyleCtrl
            CustomGraphic = True
            DataField = 'pic_info'
            DataSource = PersonInfod
            Stretch = True
            OnAssignPicture = ePicAssignPicture
            OnGetGraphicClass = ePicGetGraphicClass
            Height = 120
            StoredValues = 64
          end
        end
      end
      object tsLicense: TTabSheet
        Caption = #20154#21592#36164#36136
        ImageIndex = 3
        object Splitter2: TSplitter
          Left = 381
          Top = 0
          Width = 3
          Height = 221
          Cursor = crHSplit
        end
        object Panel10: TPanel
          Left = 0
          Top = 221
          Width = 769
          Height = 28
          Align = alBottom
          BevelOuter = bvLowered
          TabOrder = 0
          object bbtnView: TBitBtn
            Left = 3
            Top = 3
            Width = 60
            Height = 22
            Hint = #26597#30475#20154#21592#36164#36136#35814#32454#20449#24687
            Caption = #26597#30475
            TabOrder = 0
            OnClick = bbtnViewClick
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              04000000000080000000120B0000120B00001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
              DADAADADADADAD00ADAD000000000910000A0FFFF0FF9F10FF0D0FF00009F10F
              FF0A0F0787701088FF0D0078E7F70FFFFF0A008E878F08888F0D00EFE7E80FFF
              FF0A007FF78708888F0D0F07E770FFFFFF0A0F8000088888FF0D0FFFF0FFFFFF
              FF0A444444444444444D444444444444444A444444444444444D}
            Spacing = 2
          end
          object bbtnApply: TBitBtn
            Left = 147
            Top = 3
            Width = 80
            Height = 22
            Hint = #30003#35831#26032#36164#36136
            Caption = #39033#30446#30003#35831
            TabOrder = 2
            OnClick = bbtnApplyClick
            NumGlyphs = 2
            Spacing = 2
          end
          object bbtnUpdate: TBitBtn
            Left = 311
            Top = 3
            Width = 80
            Height = 22
            Hint = #21464#26356#36164#36136#20449#24687
            Caption = #39033#30446#21464#26356
            TabOrder = 4
            OnClick = bbtnUpdateClick
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              04000000000080000000120B0000120B00001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
              DADAAD77777777777777D000000000000007A0FBFBFBFB00FB07D0BFBFBFBF08
              0F07A0F0F0F0FB0B8007D0BFBFB00F000007A0FBFBF0B0FBFB07D0BFBFB0B0BF
              BF07A0FBFBF0BB0BFB07D0BFBFB0BB0FBF07A00000000BB0000DDADADADA0BB0
              DADAADADADADA0000DADDADADADAD0110ADAADADADADAD00ADAD}
          end
          object bbtnChange: TBitBtn
            Left = 475
            Top = 3
            Width = 80
            Height = 22
            Hint = #25442#35777
            Caption = #23457#26597#22791#26696
            TabOrder = 6
            OnClick = bbtnChangeClick
            Glyph.Data = {
              1C010000424D1C01000000000000760000002800000010000000100000000100
              040002000000A6000000C40E0000C40E00000000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0010DD000002DD
              0E77000002D00C000207000002D008FB000600FB0700000002D008BF0006080F
              0700000002D008FB00060B80070000000006D0BFFF0004BF0400020700000008
              D0FF4FF406FB02070000000AD0F44FF44F0004BF0207000002DF084404FB0207
              000002F4084400064FBF070000000C440004000D000002D40844024D04DD0000
              02DD084406DD0000000ADDD44DD44D0006DD000004DD00044DD408DD00000001}
          end
          object bbtnLogout: TBitBtn
            Left = 557
            Top = 3
            Width = 80
            Height = 22
            Hint = #27880#38144#36164#36136
            Caption = #35777#20070#21514#38144
            TabOrder = 7
            OnClick = bbtnLogoutClick
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              04000000000080000000120B0000120B00001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
              DADAAD77777777777777D000000000000007A0FBFBFBFB00FB0770BFBFBFBF08
              0F0710FBFBFBFB0B800711BFBF71BF000007717BF717FBFBFB07D117B11FBFBF
              BF07A71111FBFBFBFB07D7111FBFBFBFBF07711117000000000D117A117ADADA
              DADAADADA117ADADADADDADADA117ADADADAADADADADADADADAD}
          end
          object bbtnEngage: TBitBtn
            Left = 393
            Top = 3
            Width = 80
            Height = 22
            Hint = #26597#30475#36164#36136#32856#29992#24773#20917
            Caption = #32856#29992#24773#20917
            TabOrder = 5
            OnClick = bbtnEngageClick
          end
          object bbtnIssue: TBitBtn
            Left = 229
            Top = 3
            Width = 80
            Height = 22
            Hint = #21457#35777
            Caption = #39033#30446#23457#25209
            TabOrder = 3
            OnClick = bbtnIssueClick
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              04000000000080000000120B0000120B00001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
              DADAAD77777777777777D000000000000007A0FBFBFBFB00FB07D0BFBFBFBF08
              0F07A0FBFBFBFB0B8007D0BFBFBFBF000007F0F7BFBFBBFBFB077BB7FB7BFFBF
              BF07A7F7B7BFBBFBFB07777F7FBFBFBFBF07FB7BF7777000000DD7B7B7BADADA
              DADA7BA7FD7BADADADADBAD7BAD7DADADADAADA7FDADADADADAD}
            Spacing = 2
          end
          object bbtnLogin: TBitBtn
            Left = 65
            Top = 3
            Width = 80
            Height = 22
            Hint = #25345#35777#30331#35760
            Caption = #25345#35777#30331#35760
            TabOrder = 1
            OnClick = bbtnLoginClick
          end
        end
        object grdLicns: TDBGridEh
          Left = 0
          Top = 0
          Width = 381
          Height = 221
          Align = alLeft
          DataSource = licenselistd
          Flat = True
          FooterColor = clWindow
          FooterFont.Charset = GB2312_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -12
          FooterFont.Name = #23435#20307
          FooterFont.Style = []
          InternalSort = True
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 1
          TitleFont.Charset = GB2312_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          Columns = <
            item
              EditButtons = <>
              FieldName = 'licnsno'
              Footers = <>
            end
            item
              EditButtons = <>
              FieldName = 'licns_state_name'
              Footers = <>
              Width = 51
            end
            item
              EditButtons = <>
              FieldName = 'licns_kind_name'
              Footers = <>
              Width = 69
            end
            item
              EditButtons = <>
              FieldName = 'licns_category_name'
              Footers = <>
              Width = 122
            end
            item
              EditButtons = <>
              FieldName = 'organ_sysid_name'
              Footers = <>
              Width = 99
            end
            item
              EditButtons = <>
              FieldName = 'issue_date'
              Footers = <>
            end>
        end
        object DBGridEh1: TDBGridEh
          Left = 384
          Top = 0
          Width = 385
          Height = 221
          Align = alClient
          Ctl3D = True
          DataSource = licnsprjlistd
          Flat = True
          FooterColor = clWindow
          FooterFont.Charset = GB2312_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -12
          FooterFont.Name = #23435#20307
          FooterFont.Style = []
          InternalSort = True
          ParentCtl3D = False
          TabOrder = 2
          TitleFont.Charset = GB2312_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          Columns = <
            item
              EditButtons = <>
              FieldName = 'psnlicns_prjname'
              Footers = <>
              Width = 149
            end
            item
              EditButtons = <>
              FieldName = 'psnlicns_prjcode_name'
              Footers = <>
              Width = 81
            end
            item
              EditButtons = <>
              FieldName = 'psnlicns_levelcode_name'
              Footers = <>
              Width = 41
            end
            item
              EditButtons = <>
              FieldName = 'auth_date'
              Footers = <>
              Width = 70
            end
            item
              EditButtons = <>
              FieldName = 'end_date'
              Footers = <>
              Width = 70
            end
            item
              EditButtons = <>
              FieldName = 'state_name'
              Footers = <>
              Width = 44
            end>
        end
      end
    end
  end
  object PersonInfo: TCSADOQuery
    Connection = dmData.adocon
    AfterInsert = PersonInfoAfterInsert
    BeforePost = PersonInfoBeforePost
    AfterPost = PersonInfoAfterPost
    AfterCancel = PersonInfoAfterCancel
    AfterDelete = PersonInfoAfterDelete
    CommandTimeOut = 300
    Parameters = <>
    Left = 312
    Top = 315
  end
  object PersonInfod: TDataSource
    DataSet = PersonInfo
    Left = 340
    Top = 315
  end
  object ListFind: TCSDBEhGrdFind
    EhDBGrid = grdPersonList
    Left = 20
    Top = 315
  end
  object ListFilter: TCSADOEhGrdFilter
    EhDBGrid = grdPersonList
    Left = 48
    Top = 315
  end
  object ListColCtrl: TCSEhGrdColCtrl
    EhDBGrid = grdPersonList
    ColList = <
      item
        ColIndex = 0
        Name = 'Columns[0]'
        Visible = True
      end>
    Left = 76
    Top = 315
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'xls'
    FileName = 'export'
    Filter = 
      'Microsoft Excel'#25991#20214'(*.xls)|*.xls|'#25991#26412#25991#20214'(*.txt)|*.txt|HTML'#25991#20214'(*.htm)|*' +
      '.htm|Rich Text Format(*.rtf)|*.rtf|csv'#25991#20214'(*.csv)|*.csv'
    Left = 132
    Top = 315
  end
  object ListPrint: TPrintDBGridEh
    DBGridEh = grdPersonList
    Options = [pghOptimalColWidths]
    Page.BottomMargin = 2
    Page.LeftMargin = 2
    Page.RightMargin = 1
    Page.TopMargin = 1
    PageFooter.Font.Charset = DEFAULT_CHARSET
    PageFooter.Font.Color = clWindowText
    PageFooter.Font.Height = -11
    PageFooter.Font.Name = 'MS Sans Serif'
    PageFooter.Font.Style = []
    PageHeader.Font.Charset = DEFAULT_CHARSET
    PageHeader.Font.Color = clWindowText
    PageHeader.Font.Height = -11
    PageHeader.Font.Name = 'MS Sans Serif'
    PageHeader.Font.Style = []
    Units = MM
    Left = 160
    Top = 315
  end
  object CSBarMDIChild1: TCSBarMDIChild
    Left = 188
    Top = 315
  end
  object ScrChild: TCSScrCtrlChild
    Master = dmData.ScrMaster
    Left = 216
    Top = 315
  end
  object ListEhGrdStore: TCSDBEhGrdStore
    StoreToIniFile = True
    EhDBGrid = grdPersonList
    Left = 104
    Top = 315
  end
  object licenselist: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltReadOnly
    AfterScroll = licenselistAfterScroll
    Parameters = <>
    Left = 605
    Top = 315
    object licenselistsysid: TStringField
      FieldName = 'sysid'
    end
    object licenselistlicnsno: TStringField
      DisplayLabel = #35777#20070#32534#21495
      FieldName = 'licnsno'
    end
    object licenselistperson_sysid: TStringField
      FieldName = 'person_sysid'
    end
    object licenselistlicns_kind_code: TStringField
      FieldName = 'licns_kind_code'
      Size = 4
    end
    object licenselistlicns_kind_name: TStringField
      DisplayLabel = #35777#20070#24615#36136
      FieldName = 'licns_kind_name'
      Size = 30
    end
    object licenselistlicns_category_code: TStringField
      FieldName = 'licns_category_code'
      Size = 4
    end
    object licenselistlicns_category_name: TStringField
      DisplayLabel = #35777#20070#31867#21035
      FieldName = 'licns_category_name'
      Size = 30
    end
    object licenselistorgan_sysid: TStringField
      FieldName = 'organ_sysid'
    end
    object licenselistorgan_sysid_name: TStringField
      DisplayLabel = #21457#35777#26426#26500
      FieldName = 'organ_sysid_name'
      Size = 60
    end
    object licenselistissue_date: TStringField
      DisplayLabel = #21457#35777#26085#26399
      FieldName = 'issue_date'
      Size = 10
    end
    object licenselistlicns_state: TStringField
      FieldName = 'licns_state'
      Size = 2
    end
    object licenselistlicns_state_name: TStringField
      DisplayLabel = #35777#20070#29366#24577
      FieldName = 'licns_state_name'
    end
  end
  object licenselistd: TDataSource
    DataSet = licenselist
    Left = 633
    Top = 315
  end
  object sex: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltReadOnly
    CommandTimeOut = 300
    Parameters = <>
    Left = 488
    Top = 315
  end
  object sexd: TDataSource
    DataSet = sex
    Left = 516
    Top = 315
  end
  object nation: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltReadOnly
    CommandTimeOut = 300
    Parameters = <>
    Left = 376
    Top = 315
  end
  object nationd: TDataSource
    DataSet = nation
    Left = 404
    Top = 315
  end
  object marrystatus: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltReadOnly
    CommandTimeOut = 300
    Parameters = <>
    Left = 432
    Top = 315
  end
  object marrystatusd: TDataSource
    DataSet = marrystatus
    Left = 460
    Top = 315
  end
  object edudegree: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltReadOnly
    CommandTimeOut = 300
    Parameters = <>
    Left = 544
    Top = 315
  end
  object edudegreed: TDataSource
    DataSet = edudegree
    Left = 572
    Top = 315
  end
  object zzqkd: TDataSource
    DataSet = zzqk
    Left = 404
    Top = 343
  end
  object zzqk: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltReadOnly
    CommandTimeOut = 300
    Parameters = <>
    Left = 376
    Top = 343
  end
  object degreed: TDataSource
    DataSet = degree
    Left = 460
    Top = 343
  end
  object degree: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltReadOnly
    CommandTimeOut = 300
    Parameters = <>
    Left = 432
    Top = 343
  end
  object List: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltReadOnly
    AfterScroll = ListAfterScroll
    Parameters = <>
    SQL.Strings = (
      'device.usp_getpersoninfo')
    Left = 312
    Top = 343
    object Listsysid: TStringField
      FieldName = 'sysid'
    end
    object Listname: TStringField
      DisplayLabel = #22995#21517
      FieldName = 'name'
      Size = 30
    end
    object Listorgan_sysid: TStringField
      FieldName = 'organ_sysid'
    end
    object Listorgan_sysid_name: TStringField
      DisplayLabel = #25152#23646#21333#20301
      FieldName = 'organ_sysid_name'
      Size = 60
    end
    object Listcardid: TStringField
      DisplayLabel = #36523#20221#35777#21495#30721
      FieldName = 'cardid'
    end
    object Listregno: TStringField
      DisplayLabel = #24037#21495
      FieldName = 'regno'
    end
    object Listbirthdate: TStringField
      DisplayLabel = #29983#26085
      FieldName = 'birthdate'
      Size = 10
    end
    object Listsex: TStringField
      FieldName = 'sex'
      Size = 2
    end
    object Listsex_name: TStringField
      DisplayLabel = #24615#21035
      FieldName = 'sex_name'
    end
    object Listaddr: TStringField
      DisplayLabel = #23478#24237#20303#22336
      FieldName = 'addr'
      Size = 60
    end
    object Listtel: TStringField
      DisplayLabel = #30005#35805
      FieldName = 'tel'
      Size = 30
    end
    object Listedudegree: TStringField
      FieldName = 'education'
      Size = 4
    end
    object Listedudegree_name: TStringField
      DisplayLabel = #23398#21382
      FieldName = 'education_name'
    end
    object Listspeciality: TStringField
      DisplayLabel = #19987#19994
      FieldName = 'speciality'
    end
    object Listzip: TStringField
      DisplayLabel = #37038#32534
      FieldName = 'zip'
      Size = 6
    end
    object Listpost: TStringField
      DisplayLabel = #34892#25919#23703#20301
      FieldName = 'post'
    end
    object Listtitleofpost: TStringField
      DisplayLabel = #32844#31216
      FieldName = 'titleofpost'
    end
    object Listnation: TStringField
      FieldName = 'nation'
      Size = 4
    end
    object Listnation_name: TStringField
      DisplayLabel = #27665#26063
      FieldName = 'nation_name'
    end
    object Listpolity: TStringField
      DisplayLabel = #25919#27835#38754#35980
      FieldName = 'polity'
    end
    object Listworkinfo: TStringField
      FieldName = 'workinfo'
      Size = 2
    end
    object Listworkinfo_name: TStringField
      DisplayLabel = #22312#32844#24773#20917
      FieldName = 'workinfo_name'
    end
    object Listismarry: TStringField
      FieldName = 'ismarry'
      Size = 2
    end
    object Listismarry_name: TStringField
      DisplayLabel = #23130#23035#29366#20917
      FieldName = 'ismarry_name'
    end
    object Listmate: TStringField
      DisplayLabel = #37197#20598#22995#21517
      FieldName = 'mate'
      Size = 30
    end
    object Listpassportid: TStringField
      DisplayLabel = #25252#29031#21495#30721
      FieldName = 'passportid'
      Size = 30
    end
    object Listdegree: TStringField
      FieldName = 'degree'
      Size = 4
    end
    object Listdegree_name: TStringField
      DisplayLabel = #23398#20301
      FieldName = 'degree_name'
    end
  end
  object Listd: TDataSource
    DataSet = List
    Left = 340
    Top = 343
  end
  object mComBak: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 516
    Top = 343
    object mComBakorgan_sysid: TStringField
      FieldName = 'organ_sysid'
    end
    object mComBakorgan_sysid_name: TStringField
      FieldName = 'organ_sysid_name'
      Size = 60
    end
  end
  object mCom: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 544
    Top = 343
    object mComorgan_sysid: TStringField
      FieldName = 'organ_sysid'
    end
    object mComorgan_sysid_name: TStringField
      FieldName = 'organ_sysid_name'
      Size = 60
    end
  end
  object mComd: TDataSource
    DataSet = mCom
    Left = 572
    Top = 343
  end
  object Temp: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltReadOnly
    Parameters = <>
    Left = 488
    Top = 343
  end
  object licnsprjlist: TCSADOQuery
    Connection = dmData.adocon
    Parameters = <>
    Left = 605
    Top = 344
    object licnsprjlistsysid: TStringField
      FieldName = 'sysid'
    end
    object licnsprjlistpsnlicns_sysid: TStringField
      FieldName = 'psnlicns_sysid'
    end
    object licnsprjlistpsnlicns_prjcode: TStringField
      FieldName = 'psnlicns_prjcode'
      Size = 4
    end
    object licnsprjlistpsnlicns_prjcode_name: TStringField
      DisplayLabel = #39033#30446
      FieldName = 'psnlicns_prjcode_name'
      Size = 30
    end
    object licnsprjlistpsnlicns_levelcode: TStringField
      FieldName = 'psnlicns_levelcode'
      Size = 4
    end
    object licnsprjlistpsnlicns_levelcode_name: TStringField
      DisplayLabel = #32423#21035
      FieldName = 'psnlicns_levelcode_name'
      Size = 30
    end
    object licnsprjlistpsnlicns_prjname: TStringField
      DisplayLabel = #39033#30446#21517#31216
      FieldName = 'psnlicns_prjname'
      Size = 60
    end
    object licnsprjlisttest_organ_sysid: TStringField
      FieldName = 'test_organ_sysid'
    end
    object licnsprjlisttest_organ_sysid_name: TStringField
      DisplayLabel = #32771#26680#26426#26500
      FieldName = 'test_organ_sysid_name'
      Size = 60
    end
    object licnsprjlistauth_organ_sysid: TStringField
      FieldName = 'auth_organ_sysid'
    end
    object licnsprjlistauth_organ_sysid_name: TStringField
      DisplayLabel = #25209#20934#26426#26500
      FieldName = 'auth_organ_sysid_name'
      Size = 60
    end
    object licnsprjlistauth_date: TStringField
      DisplayLabel = #25209#20934#26085#26399
      FieldName = 'auth_date'
      Size = 10
    end
    object licnsprjlistend_date: TStringField
      DisplayLabel = #26377#25928#26085#26399
      FieldName = 'end_date'
      Size = 10
    end
    object licnsprjlistapply_date: TStringField
      DisplayLabel = #30003#35831#26085#26399
      FieldName = 'apply_date'
      Size = 10
    end
    object licnsprjliststate: TStringField
      FieldName = 'state'
      Size = 2
    end
    object licnsprjliststate_name: TStringField
      DisplayLabel = #29366#24577
      FieldName = 'state_name'
    end
  end
  object licnsprjlistd: TDataSource
    DataSet = licnsprjlist
    Left = 633
    Top = 344
  end
end
