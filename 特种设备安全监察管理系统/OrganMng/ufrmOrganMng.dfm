object frmOrganMng: TfrmOrganMng
  Left = 92
  Top = 44
  Width = 706
  Height = 528
  Caption = #21333#20301#20449#24687
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
    Top = 255
    Width = 698
    Height = 3
    Cursor = crSizeNS
    Align = alTop
  end
  object Panel1: TPanel
    Left = 0
    Top = 473
    Width = 698
    Height = 28
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 4
    object Panel5: TPanel
      Left = 337
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
        TabOrder = 1
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
        TabOrder = 2
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
        TabOrder = 3
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
        TabOrder = 4
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
        TabOrder = 0
        OnClick = bbtnReplaceClick
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
    Top = 445
    Width = 698
    Height = 28
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 3
    object Panel4: TPanel
      Left = 245
      Top = 1
      Width = 452
      Height = 26
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 3
      object Navigator: TCSDBNavigator
        Left = 100
        Top = 2
        Width = 350
        Height = 22
        DataSource = OrganInfod
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbPost, nbCancel, nbRefresh]
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
  object grdList: TDBGridEh
    Left = 0
    Top = 258
    Width = 698
    Height = 165
    Align = alClient
    AllowedOperations = []
    AllowedSelections = [gstRecordBookmarks, gstRectangle, gstAll]
    DataSource = OrganInfod
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
    OnDblClick = grdListDblClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'sysid'
        Footers = <>
        Title.Alignment = taCenter
        Title.TitleButton = True
        Visible = False
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
        FieldName = 'name'
        Footers = <>
        Title.Alignment = taCenter
        Title.TitleButton = True
        Width = 200
      end
      item
        EditButtons = <>
        FieldName = 'type_id'
        Footers = <>
        Title.Alignment = taCenter
        Title.TitleButton = True
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'type'
        Footers = <>
        Title.Alignment = taCenter
        Width = 120
      end
      item
        EditButtons = <>
        FieldName = 'charge_com'
        Footers = <>
        Title.Alignment = taCenter
        Title.TitleButton = True
        Width = 200
      end
      item
        EditButtons = <>
        FieldName = 'auth_com'
        Footers = <>
        Title.Alignment = taCenter
        Title.TitleButton = True
        Width = 200
      end
      item
        EditButtons = <>
        FieldName = 'licns_com'
        Footers = <>
        Title.Alignment = taCenter
        Title.TitleButton = True
        Width = 200
      end
      item
        EditButtons = <>
        FieldName = 'licns_no'
        Footers = <>
        Title.Alignment = taCenter
        Title.TitleButton = True
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'estab_date'
        Footers = <>
        Title.Alignment = taCenter
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'start_date'
        Footers = <>
        Title.Alignment = taCenter
        Title.TitleButton = True
        Width = 76
      end
      item
        EditButtons = <>
        FieldName = 'legalperson'
        Footers = <>
        Title.Alignment = taCenter
        Title.TitleButton = True
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'country'
        Footers = <>
        Title.Alignment = taCenter
        Title.TitleButton = True
        Width = 120
      end
      item
        EditButtons = <>
        FieldName = 'province_id'
        Footers = <>
        Title.Alignment = taCenter
        Title.TitleButton = True
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'province'
        Footers = <>
        Title.Alignment = taCenter
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'city_id'
        Footers = <>
        Title.Alignment = taCenter
        Title.TitleButton = True
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'city'
        Footers = <>
        Title.Alignment = taCenter
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'borough_id'
        Footers = <>
        Title.Alignment = taCenter
        Title.TitleButton = True
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'borough'
        Footers = <>
        Title.Alignment = taCenter
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'addr'
        Footers = <>
        Title.Alignment = taCenter
        Title.TitleButton = True
        Width = 200
      end
      item
        EditButtons = <>
        FieldName = 'zip'
        Footers = <>
        Title.Alignment = taCenter
        Title.TitleButton = True
        Width = 56
      end
      item
        EditButtons = <>
        FieldName = 'tel'
        Footers = <>
        Title.Alignment = taCenter
        Title.TitleButton = True
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'fax'
        Footers = <>
        Title.Alignment = taCenter
        Title.TitleButton = True
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'web'
        Footers = <>
        Title.Alignment = taCenter
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'capital_asserts'
        Footers = <>
        Title.Alignment = taCenter
        Title.TitleButton = True
        Width = 110
      end
      item
        EditButtons = <>
        FieldName = 'capital_register'
        Footers = <>
        Title.Alignment = taCenter
        Title.TitleButton = True
        Width = 110
      end
      item
        EditButtons = <>
        FieldName = 'manager'
        Footers = <>
        Title.Alignment = taCenter
        Title.TitleButton = True
        Width = 76
      end
      item
        EditButtons = <>
        FieldName = 'manager_post'
        Footers = <>
        Title.Alignment = taCenter
        Title.TitleButton = True
        Width = 90
      end
      item
        EditButtons = <>
        FieldName = 'isomanager'
        Footers = <>
        Title.Alignment = taCenter
        Title.TitleButton = True
        Width = 90
      end
      item
        EditButtons = <>
        FieldName = 'man_quantity'
        Footers = <>
        Title.Alignment = taCenter
        Title.TitleButton = True
        Width = 52
      end
      item
        EditButtons = <>
        FieldName = 'state'
        Footers = <>
        Title.Alignment = taCenter
        Title.TitleButton = True
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'state_name'
        Footers = <>
        Title.Alignment = taCenter
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'category'
        Footers = <>
        Title.Alignment = taCenter
        Title.TitleButton = True
        Visible = False
      end>
  end
  object CSRowCountPanel1: TCSRowCountPanel
    Left = 0
    Top = 423
    Width = 698
    Align = alBottom
    TabOrder = 2
    CaptionFormat = ' '#35760#24405#25968#65306'%d'
    DataSource = OrganInfod
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 698
    Height = 255
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    object pagDetail: TPageControl
      Left = 1
      Top = 1
      Width = 696
      Height = 253
      ActivePage = tsBaseInfo
      Align = alClient
      TabIndex = 0
      TabOrder = 0
      OnChanging = pagDetailChanging
      object tsBaseInfo: TTabSheet
        Caption = #22522#26412#20449#24687
        object scrbDetail: TScrollBox
          Left = 0
          Top = 0
          Width = 688
          Height = 226
          Align = alClient
          TabOrder = 0
          object Label1: TLabel
            Left = 8
            Top = 8
            Width = 60
            Height = 12
            Caption = #26426#26500#20195#30721#65306
          end
          object Label2: TLabel
            Left = 165
            Top = 8
            Width = 60
            Height = 12
            Caption = #21333#20301#21517#31216#65306
          end
          object Label3: TLabel
            Left = 531
            Top = 8
            Width = 60
            Height = 12
            Caption = #27861#20154#20195#34920#65306
          end
          object Label10: TLabel
            Left = 8
            Top = 74
            Width = 60
            Height = 12
            Caption = #32852#31995#30005#35805#65306
          end
          object Label11: TLabel
            Left = 178
            Top = 74
            Width = 60
            Height = 12
            Caption = #20256'    '#30495#65306
          end
          object Label12: TLabel
            Left = 348
            Top = 74
            Width = 60
            Height = 12
            Caption = #37038#25919#32534#30721#65306
          end
          object Label8: TLabel
            Left = 8
            Top = 97
            Width = 60
            Height = 12
            Caption = #32593'    '#22336#65306
          end
          object Label9: TLabel
            Left = 8
            Top = 120
            Width = 60
            Height = 12
            Caption = #32463#27982#31867#22411#65306
          end
          object Label13: TLabel
            Left = 8
            Top = 301
            Width = 60
            Height = 12
            Caption = #21333#20301#29366#24577#65306
          end
          object Label14: TLabel
            Left = 348
            Top = 97
            Width = 60
            Height = 12
            Caption = #22269#23478#22320#21306#65306
          end
          object Label15: TLabel
            Left = 235
            Top = 120
            Width = 60
            Height = 12
            Caption = #25152#23646#34892#19994#65306
          end
          object Label16: TLabel
            Left = 8
            Top = 143
            Width = 84
            Height = 12
            Caption = #25209#20934#25104#31435#26426#26500#65306
          end
          object Label17: TLabel
            Left = 8
            Top = 166
            Width = 108
            Height = 12
            Caption = #33829#19994#25191#29031#30331#35760#26426#26500#65306
          end
          object Label18: TLabel
            Left = 372
            Top = 143
            Width = 60
            Height = 12
            Caption = #25104#31435#26102#38388#65306
          end
          object Label19: TLabel
            Left = 509
            Top = 143
            Width = 84
            Height = 12
            Caption = #24320#22987#24037#20316#26102#38388#65306
          end
          object Label20: TLabel
            Left = 396
            Top = 166
            Width = 96
            Height = 12
            Caption = #33829#19994#25191#29031#27880#20876#21495#65306
          end
          object Label21: TLabel
            Left = 8
            Top = 255
            Width = 108
            Height = 12
            Caption = #22266#23450#36164#20135#65288#19975#20803#65289#65306
          end
          object Label22: TLabel
            Left = 242
            Top = 255
            Width = 108
            Height = 12
            Caption = #27880#20876#36164#37329#65288#19975#20803#65289#65306
          end
          object Label23: TLabel
            Left = 476
            Top = 255
            Width = 48
            Height = 12
            Caption = #24635#20154#25968#65306
          end
          object Label24: TLabel
            Left = 8
            Top = 278
            Width = 72
            Height = 12
            Caption = #31649#29702#32773#20195#34920#65306
          end
          object Label25: TLabel
            Left = 162
            Top = 278
            Width = 96
            Height = 12
            Caption = #31649#29702#32773#20195#34920#32844#20301#65306
          end
          object Label26: TLabel
            Left = 384
            Top = 278
            Width = 96
            Height = 12
            Caption = #36136#37327#20445#35777#36127#36131#20154#65306
          end
          object eRegNo: TDBEditEh
            Left = 68
            Top = 5
            Width = 92
            Height = 18
            CharCase = ecUpperCase
            Color = clSkyBlue
            Ctl3D = False
            DataField = 'regno'
            DataSource = OrganInfod
            EditButtons = <>
            ParentCtl3D = False
            TabOrder = 0
            Visible = True
          end
          object eName: TDBEditEh
            Left = 225
            Top = 5
            Width = 301
            Height = 18
            Color = clSkyBlue
            Ctl3D = False
            DataField = 'name'
            DataSource = OrganInfod
            EditButtons = <>
            ParentCtl3D = False
            TabOrder = 1
            Visible = True
          end
          object eLegalperson: TDBEditEh
            Left = 591
            Top = 5
            Width = 77
            Height = 18
            Ctl3D = False
            DataField = 'legalperson'
            DataSource = OrganInfod
            EditButtons = <>
            ParentCtl3D = False
            TabOrder = 2
            Visible = True
          end
          object gbx_address: TGroupBox
            Left = 8
            Top = 28
            Width = 667
            Height = 38
            Caption = ' '#21333#20301#22320#22336' '
            TabOrder = 3
            TabStop = True
            object Label5: TLabel
              Left = 138
              Top = 16
              Width = 24
              Height = 12
              Caption = #24066#65306
            end
            object Label6: TLabel
              Left = 244
              Top = 16
              Width = 48
              Height = 12
              Caption = #21306'('#21439')'#65306
            end
            object Label7: TLabel
              Left = 376
              Top = 16
              Width = 60
              Height = 12
              Caption = #20855#20307#22320#22336#65306
            end
            object Label4: TLabel
              Left = 8
              Top = 16
              Width = 48
              Height = 12
              Caption = #30465'('#24066')'#65306
            end
            object lcmbProvince: TDBLookupComboboxEh
              Left = 56
              Top = 13
              Width = 77
              Height = 18
              Ctl3D = False
              DataField = 'province_id'
              DataSource = OrganInfod
              EditButtons = <>
              KeyField = 'id'
              ListField = 'name'
              ListSource = provinced
              ParentCtl3D = False
              TabOrder = 0
              Visible = True
              OnKeyValueChanged = lcmbProvinceKeyValueChanged
            end
            object lcmbCity: TDBLookupComboboxEh
              Left = 162
              Top = 13
              Width = 77
              Height = 18
              Ctl3D = False
              DataField = 'city_id'
              DataSource = OrganInfod
              EditButtons = <>
              KeyField = 'id'
              ListField = 'name'
              ListSource = cityd
              ParentCtl3D = False
              TabOrder = 1
              Visible = True
              OnKeyValueChanged = lcmbCityKeyValueChanged
            end
            object lcmbBorough: TDBLookupComboboxEh
              Left = 292
              Top = 13
              Width = 77
              Height = 18
              Ctl3D = False
              DataField = 'borough_id'
              DataSource = OrganInfod
              EditButtons = <>
              KeyField = 'id'
              ListField = 'name'
              ListSource = boroughd
              ParentCtl3D = False
              TabOrder = 2
              Visible = True
            end
            object eAddress: TDBEditEh
              Left = 436
              Top = 13
              Width = 225
              Height = 18
              Ctl3D = False
              DataField = 'addr'
              DataSource = OrganInfod
              EditButtons = <>
              ParentCtl3D = False
              TabOrder = 3
              Visible = True
            end
          end
          object eTel: TDBEditEh
            Left = 68
            Top = 71
            Width = 105
            Height = 18
            Ctl3D = False
            DataField = 'tel'
            DataSource = OrganInfod
            EditButtons = <>
            ParentCtl3D = False
            TabOrder = 4
            Visible = True
          end
          object eFax: TDBEditEh
            Left = 238
            Top = 71
            Width = 105
            Height = 18
            Ctl3D = False
            DataField = 'fax'
            DataSource = OrganInfod
            EditButtons = <>
            ParentCtl3D = False
            TabOrder = 5
            Visible = True
          end
          object eZip: TDBEditEh
            Left = 408
            Top = 71
            Width = 101
            Height = 18
            Ctl3D = False
            DataField = 'zip'
            DataSource = OrganInfod
            EditButtons = <>
            ParentCtl3D = False
            TabOrder = 6
            Visible = True
          end
          object eWeb: TDBEditEh
            Left = 68
            Top = 94
            Width = 275
            Height = 18
            Ctl3D = False
            DataField = 'web'
            DataSource = OrganInfod
            EditButtons = <>
            ParentCtl3D = False
            TabOrder = 7
            Visible = True
          end
          object lcmbType: TDBLookupComboboxEh
            Left = 68
            Top = 117
            Width = 162
            Height = 18
            Ctl3D = False
            DataField = 'type_id'
            DataSource = OrganInfod
            EditButtons = <>
            KeyField = 'id'
            ListField = 'name'
            ListSource = OrganTyped
            ParentCtl3D = False
            TabOrder = 8
            Visible = True
          end
          object lcmbState: TDBLookupComboboxEh
            Left = 66
            Top = 298
            Width = 106
            Height = 18
            Ctl3D = False
            DataField = 'state'
            DataSource = OrganInfod
            EditButtons = <>
            KeyField = 'id'
            ListField = 'name'
            ListSource = OrganStated
            ParentCtl3D = False
            TabOrder = 9
            Visible = True
          end
          object gbCategory: TGroupBox
            Left = 8
            Top = 186
            Width = 667
            Height = 61
            Caption = ' '#21333#20301#31867#21035' '
            TabOrder = 10
            object CSCheckBox1: TCSCheckBox
              Left = 8
              Top = 16
              Width = 50
              Height = 17
              Caption = #30417#23519
              TabOrder = 0
              OnClick = CategoryClick
              ValueChecked = '1'
              ValueUnChecked = '0'
              ValueGrayed = Null
            end
            object CSCheckBox2: TCSCheckBox
              Left = 63
              Top = 16
              Width = 50
              Height = 17
              Caption = #21046#36896
              TabOrder = 1
              OnClick = CategoryClick
              ValueChecked = '2'
              ValueUnChecked = '0'
              ValueGrayed = Null
            end
            object CSCheckBox3: TCSCheckBox
              Left = 118
              Top = 16
              Width = 50
              Height = 17
              Caption = #23433#35013
              TabOrder = 2
              OnClick = CategoryClick
              ValueChecked = '4'
              ValueUnChecked = '0'
              ValueGrayed = Null
            end
            object CSCheckBox4: TCSCheckBox
              Left = 173
              Top = 16
              Width = 50
              Height = 17
              Caption = #32500#20445
              TabOrder = 3
              OnClick = CategoryClick
              ValueChecked = '8'
              ValueUnChecked = '0'
              ValueGrayed = Null
            end
            object CSCheckBox5: TCSCheckBox
              Left = 228
              Top = 16
              Width = 50
              Height = 17
              Caption = #26816#39564
              TabOrder = 4
              OnClick = CategoryClick
              ValueChecked = '16'
              ValueUnChecked = '0'
              ValueGrayed = Null
            end
            object CSCheckBox6: TCSCheckBox
              Left = 283
              Top = 16
              Width = 50
              Height = 17
              Caption = #39564#25910
              TabOrder = 5
              OnClick = CategoryClick
              ValueChecked = '32'
              ValueUnChecked = '0'
              ValueGrayed = Null
            end
            object CSCheckBox7: TCSCheckBox
              Left = 338
              Top = 16
              Width = 70
              Height = 17
              Caption = #22303#24314#26045#24037
              TabOrder = 6
              OnClick = CategoryClick
              ValueChecked = '64'
              ValueUnChecked = '0'
              ValueGrayed = Null
            end
            object CSCheckBox8: TCSCheckBox
              Left = 413
              Top = 16
              Width = 70
              Height = 17
              Caption = #22303#24314#39564#25910
              TabOrder = 7
              OnClick = CategoryClick
              ValueChecked = '128'
              ValueUnChecked = '0'
              ValueGrayed = Null
            end
            object CSCheckBox9: TCSCheckBox
              Left = 488
              Top = 16
              Width = 50
              Height = 17
              Caption = #32771#26680
              TabOrder = 8
              OnClick = CategoryClick
              ValueChecked = '256'
              ValueUnChecked = '0'
              ValueGrayed = Null
            end
            object CSCheckBox10: TCSCheckBox
              Left = 543
              Top = 16
              Width = 50
              Height = 17
              Caption = #28165#27927
              TabOrder = 9
              OnClick = CategoryClick
              ValueChecked = '512'
              ValueUnChecked = '0'
              ValueGrayed = Null
            end
            object CSCheckBox11: TCSCheckBox
              Left = 598
              Top = 16
              Width = 50
              Height = 17
              Caption = #20805#35013
              TabOrder = 10
              OnClick = CategoryClick
              ValueChecked = '1024'
              ValueUnChecked = '0'
              ValueGrayed = Null
            end
            object CSCheckBox12: TCSCheckBox
              Left = 8
              Top = 38
              Width = 50
              Height = 17
              Caption = #20351#29992
              TabOrder = 11
              OnClick = CategoryClick
              ValueChecked = '2048'
              ValueUnChecked = '0'
              ValueGrayed = Null
            end
            object CSCheckBox13: TCSCheckBox
              Left = 63
              Top = 38
              Width = 50
              Height = 17
              Caption = #20135#26435
              TabOrder = 12
              OnClick = CategoryClick
              ValueChecked = '4096'
              ValueUnChecked = '0'
              ValueGrayed = Null
            end
            object CSCheckBox14: TCSCheckBox
              Left = 118
              Top = 38
              Width = 50
              Height = 17
              Caption = #35774#35745
              TabOrder = 13
              OnClick = CategoryClick
              ValueChecked = '8192'
              ValueUnChecked = '0'
              ValueGrayed = Null
            end
            object CSCheckBox15: TCSCheckBox
              Left = 173
              Top = 38
              Width = 50
              Height = 17
              Caption = #23457#22270
              TabOrder = 14
              OnClick = CategoryClick
              ValueChecked = '16384'
              ValueUnChecked = '0'
              ValueGrayed = Null
            end
          end
          object eCountry: TDBEditEh
            Left = 408
            Top = 94
            Width = 153
            Height = 18
            Ctl3D = False
            DataField = 'country'
            DataSource = OrganInfod
            EditButtons = <>
            ParentCtl3D = False
            TabOrder = 11
            Visible = True
          end
          object cmbChargeCom: TDBComboBoxEh
            Left = 295
            Top = 117
            Width = 301
            Height = 18
            Ctl3D = False
            DataField = 'charge_com'
            DataSource = OrganInfod
            EditButton.Visible = False
            EditButtons = <
              item
                Style = ebsEllipsisEh
                Visible = False
                OnClick = cmbChargeComEditButtons0Click
              end>
            ParentCtl3D = False
            TabOrder = 12
            Visible = True
          end
          object cmbAuthCom: TDBComboBoxEh
            Left = 92
            Top = 140
            Width = 275
            Height = 18
            Ctl3D = False
            DataField = 'auth_com'
            DataSource = OrganInfod
            EditButton.Visible = False
            EditButtons = <
              item
                Style = ebsEllipsisEh
                OnClick = cmbAuthComEditButtons0Click
              end>
            ParentCtl3D = False
            TabOrder = 13
            Visible = True
          end
          object cmbLicnsCom: TDBComboBoxEh
            Left = 116
            Top = 163
            Width = 275
            Height = 18
            Ctl3D = False
            DataField = 'licns_com'
            DataSource = OrganInfod
            EditButton.Visible = False
            EditButtons = <
              item
                Style = ebsEllipsisEh
                OnClick = cmbLicnsComEditButtons0Click
              end>
            ParentCtl3D = False
            TabOrder = 14
            Visible = True
          end
          object deEstabDate: TCSdxDBDateEdit
            Left = 432
            Top = 139
            Width = 72
            TabOrder = 15
            DataField = 'estab_date'
            DataSource = OrganInfod
            StyleController = dmData.dxStyleCtrl
            FixedDateFormat = 'yyyy-MM-dd'
            StoredValues = 4
          end
          object deStartDate: TCSdxDBDateEdit
            Left = 593
            Top = 139
            Width = 72
            TabOrder = 16
            DataField = 'start_date'
            DataSource = OrganInfod
            StyleController = dmData.dxStyleCtrl
            FixedDateFormat = 'yyyy-MM-dd'
            StoredValues = 4
          end
          object eLicnsNo: TDBEditEh
            Left = 492
            Top = 163
            Width = 173
            Height = 18
            Ctl3D = False
            DataField = 'licns_no'
            DataSource = OrganInfod
            EditButtons = <>
            ParentCtl3D = False
            TabOrder = 17
            Visible = True
          end
          object eCapitalAsserts: TDBNumberEditEh
            Left = 116
            Top = 252
            Width = 121
            Height = 18
            Ctl3D = False
            DataField = 'capital_asserts'
            DataSource = OrganInfod
            DecimalPlaces = 3
            EditButtons = <>
            ParentCtl3D = False
            TabOrder = 18
            Visible = True
          end
          object eCapitalRegister: TDBNumberEditEh
            Left = 350
            Top = 252
            Width = 121
            Height = 18
            Ctl3D = False
            DataField = 'capital_register'
            DataSource = OrganInfod
            DecimalPlaces = 3
            EditButtons = <>
            ParentCtl3D = False
            TabOrder = 19
            Visible = True
          end
          object eManQuantity: TDBNumberEditEh
            Left = 534
            Top = 252
            Width = 65
            Height = 18
            Ctl3D = False
            DataField = 'man_quantity'
            DataSource = OrganInfod
            EditButtons = <>
            ParentCtl3D = False
            TabOrder = 20
            Visible = True
          end
          object eManager: TDBEditEh
            Left = 80
            Top = 275
            Width = 77
            Height = 18
            Ctl3D = False
            DataField = 'manager'
            DataSource = OrganInfod
            EditButtons = <>
            ParentCtl3D = False
            TabOrder = 21
            Visible = True
          end
          object eManagerPost: TDBEditEh
            Left = 258
            Top = 275
            Width = 121
            Height = 18
            Ctl3D = False
            DataField = 'manager_post'
            DataSource = OrganInfod
            EditButtons = <>
            ParentCtl3D = False
            TabOrder = 22
            Visible = True
          end
          object eIsoManager: TDBEditEh
            Left = 480
            Top = 275
            Width = 77
            Height = 18
            Ctl3D = False
            DataField = 'isomanager'
            DataSource = OrganInfod
            EditButtons = <>
            ParentCtl3D = False
            TabOrder = 23
            Visible = True
          end
        end
      end
      object tsContact: TTabSheet
        Caption = #32852#31995#26041#24335
        ImageIndex = 1
        object Panel6: TPanel
          Left = 0
          Top = 198
          Width = 688
          Height = 28
          Align = alBottom
          BevelOuter = bvLowered
          TabOrder = 1
          object Panel7: TPanel
            Left = 435
            Top = 1
            Width = 252
            Height = 26
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 0
            object bbtnContactInsert: TBitBtn
              Left = 0
              Top = 2
              Width = 50
              Height = 22
              Hint = #28155#21152#35760#24405
              Caption = #28155#21152
              TabOrder = 0
              OnClick = bbtnContactInsertClick
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
            object bbtnContactDelete: TBitBtn
              Left = 50
              Top = 2
              Width = 50
              Height = 22
              Hint = #21024#38500#35760#24405
              Caption = #21024#38500
              TabOrder = 1
              OnClick = bbtnContactDeleteClick
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
            object navLinkman: TCSDBNavigator
              Left = 100
              Top = 2
              Width = 150
              Height = 22
              DataSource = contactd
              VisibleButtons = [nbPost, nbCancel, nbRefresh]
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
          end
        end
        object grdContact: TDBGridEh
          Left = 0
          Top = 0
          Width = 688
          Height = 198
          Align = alClient
          AllowedOperations = [alopUpdateEh]
          DataSource = contactd
          Flat = True
          FooterColor = clWindow
          FooterFont.Charset = GB2312_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -12
          FooterFont.Name = #23435#20307
          FooterFont.Style = []
          InternalSort = True
          TabOrder = 0
          TitleFont.Charset = GB2312_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          Columns = <
            item
              EditButtons = <>
              FieldName = 'sysid'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Visible = False
            end
            item
              Alignment = taLeftJustify
              AlwaysShowEditButton = True
              EditButtons = <>
              FieldName = 'category'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 70
            end
            item
              EditButtons = <>
              FieldName = 'organ_sysid'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'name'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 60
            end
            item
              EditButtons = <>
              FieldName = 'tel'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 90
            end
            item
              EditButtons = <>
              FieldName = 'addr'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 200
            end
            item
              EditButtons = <>
              FieldName = 'zip'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 60
            end
            item
              EditButtons = <>
              FieldName = 'email'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 180
            end>
        end
      end
      object tsCert: TTabSheet
        Caption = #35768#21487#35777
        ImageIndex = 3
        object Panel10: TPanel
          Left = 0
          Top = 198
          Width = 688
          Height = 28
          Align = alBottom
          BevelOuter = bvLowered
          TabOrder = 1
          object bbtnView: TBitBtn
            Left = 127
            Top = 3
            Width = 60
            Height = 22
            Caption = #26597#30475
            TabOrder = 2
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
          end
          object bbtnAdd: TBitBtn
            Left = 189
            Top = 3
            Width = 80
            Height = 22
            Caption = #21462#35777#30331#35760
            TabOrder = 3
            OnClick = bbtnAddClick
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              04000000000080000000120B0000120B00001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
              DADAAD77777777777777D000000000000007A0FBFBFBFB00FB07D0BFBFBFBF08
              0F07A0FBFBFBFB0B8007D0BFBFBFBF000007F0F7BFBFBBFBFB077BB7FB7BFFBF
              BF07A7F7B7BFBBFBFB07777F7FBFBFBFBF07FB7BF7777000000DD7B7B7BADADA
              DADA7BA7FD7BADADADADBAD7BAD7DADADADAADA7FDADADADADAD}
          end
          object bbtnChange: TBitBtn
            Left = 271
            Top = 3
            Width = 60
            Height = 22
            Caption = #21464#26356
            TabOrder = 4
            OnClick = bbtnChangeClick
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
          object bbtnExchange: TBitBtn
            Left = 333
            Top = 3
            Width = 60
            Height = 22
            Caption = #25442#35777
            TabOrder = 5
            OnClick = bbtnExchangeClick
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
            Left = 395
            Top = 3
            Width = 60
            Height = 22
            Caption = #27880#38144
            TabOrder = 6
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
          object bbtnFindCert: TBitBtn
            Left = 3
            Top = 3
            Width = 60
            Height = 22
            Hint = #26597#25214#35760#24405
            Caption = #26597#25214
            TabOrder = 0
            OnClick = bbtnFindCertClick
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
          object bbtnFilterCert: TBitBtn
            Left = 65
            Top = 3
            Width = 60
            Height = 22
            Hint = #36807#28388#35760#24405
            Caption = #36807#28388
            TabOrder = 1
            OnClick = bbtnFilterCertClick
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
        end
        object grdCert: TDBGridEh
          Left = 0
          Top = 0
          Width = 688
          Height = 198
          Align = alClient
          DataSource = CertListd
          Flat = True
          FooterColor = clWindow
          FooterFont.Charset = GB2312_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -12
          FooterFont.Name = #23435#20307
          FooterFont.Style = []
          InternalSort = True
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          RowSizingAllowed = True
          TabOrder = 0
          TitleFont.Charset = GB2312_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          OnGetCellParams = grdCertGetCellParams
          Columns = <
            item
              EditButtons = <>
              FieldName = 'sysid'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'certno'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 120
            end
            item
              EditButtons = <>
              FieldName = 'level1'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'level2'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 80
            end
            item
              EditButtons = <>
              FieldName = 'level3'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 80
            end
            item
              EditButtons = <>
              FieldName = 'apply_date'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
            end
            item
              EditButtons = <>
              FieldName = 'auth_date'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
            end
            item
              EditButtons = <>
              FieldName = 'end_date'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
            end
            item
              EditButtons = <>
              FieldName = 'state_name'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 66
            end
            item
              EditButtons = <>
              FieldName = 'auth_organ'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 200
            end
            item
              EditButtons = <>
              FieldName = 'charge_remark'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 200
            end
            item
              EditButtons = <>
              FieldName = 'local_supervise_remark'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 200
            end
            item
              EditButtons = <>
              FieldName = 'accept_supervise_remark'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 200
            end
            item
              EditButtons = <>
              FieldName = 'accept_no'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'accept_type'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 120
            end
            item
              EditButtons = <>
              FieldName = 'com_area'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
            end
            item
              EditButtons = <>
              FieldName = 'workshop_area'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
            end
            item
              EditButtons = <>
              FieldName = 'exposal_area'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
            end
            item
              EditButtons = <>
              FieldName = 'designer_num'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
            end
            item
              EditButtons = <>
              FieldName = 'checker_num'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
            end
            item
              EditButtons = <>
              FieldName = 'inspector_num'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 90
            end
            item
              EditButtons = <>
              FieldName = 'welder_num'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
            end
            item
              EditButtons = <>
              FieldName = 'other_num'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 90
            end
            item
              EditButtons = <>
              FieldName = 'design_type'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
            end
            item
              EditButtons = <>
              FieldName = 'year_value'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
            end
            item
              EditButtons = <>
              FieldName = 'agent_name'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 200
            end
            item
              EditButtons = <>
              FieldName = 'agent_regno'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
            end
            item
              EditButtons = <>
              FieldName = 'agent_legalperson'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'agent_addr'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 200
            end
            item
              EditButtons = <>
              FieldName = 'agent_zip'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'agent_tel'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 120
            end
            item
              EditButtons = <>
              FieldName = 'agent_fax'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 120
            end
            item
              EditButtons = <>
              FieldName = 'agent_email'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
            end
            item
              EditButtons = <>
              FieldName = 'remark'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 200
            end>
        end
      end
    end
  end
  object OrganInfo: TCSADOQuery
    Connection = dmData.adocon
    BeforeInsert = OrganInfoBeforeInsert
    AfterInsert = OrganInfoAfterInsert
    BeforeEdit = OrganInfoBeforeEdit
    BeforePost = OrganInfoBeforePost
    AfterPost = OrganInfoAfterPost
    AfterDelete = OrganInfoAfterDelete
    AfterScroll = OrganInfoAfterScroll
    CommandTimeOut = 300
    Parameters = <>
    Left = 20
    Top = 295
    object OrganInfosysid: TStringField
      DisplayLabel = #31995#32479#26426#26500'ID'
      FieldName = 'sysid'
    end
    object OrganInforegno: TStringField
      DisplayLabel = #26426#26500#20195#30721
      FieldName = 'regno'
      Size = 12
    end
    object OrganInfoname: TStringField
      DisplayLabel = #21333#20301#21517#31216
      FieldName = 'name'
      Size = 60
    end
    object OrganInfotype_id: TStringField
      DisplayLabel = #32463#27982#31867#22411#20195#30721
      FieldName = 'type_id'
      Size = 4
    end
    object OrganInfotype: TStringField
      DisplayLabel = #32463#27982#31867#22411
      FieldKind = fkLookup
      FieldName = 'type'
      LookupDataSet = OrganType
      LookupKeyFields = 'id'
      LookupResultField = 'name'
      KeyFields = 'type_id'
      Size = 30
      Lookup = True
    end
    object OrganInfocharge_com: TStringField
      DisplayLabel = #25152#23646#34892#19994
      FieldName = 'charge_com'
      Size = 60
    end
    object OrganInfoauth_com: TStringField
      DisplayLabel = #25209#20934#25104#31435#26426#26500
      FieldName = 'auth_com'
      Size = 60
    end
    object OrganInfolicns_com: TStringField
      DisplayLabel = #33829#19994#25191#29031#30331#35760#26426#26500
      FieldName = 'licns_com'
      Size = 60
    end
    object OrganInfolicns_no: TStringField
      DisplayLabel = #33829#19994#25191#29031#27880#20876#21495
      FieldName = 'licns_no'
      Size = 30
    end
    object OrganInfoestab_date: TStringField
      DisplayLabel = #25104#31435#26102#38388
      FieldName = 'estab_date'
      Size = 10
    end
    object OrganInfostart_date: TStringField
      DisplayLabel = #24320#22987#24037#20316#26102#38388
      FieldName = 'start_date'
      Size = 10
    end
    object OrganInfolegalperson: TStringField
      DisplayLabel = #27861#20154#20195#34920
      FieldName = 'legalperson'
      Size = 30
    end
    object OrganInfocountry: TStringField
      DisplayLabel = #22269#23478#22320#21306
      FieldName = 'country'
      Size = 30
    end
    object OrganInfoprovince_id: TStringField
      DisplayLabel = #30465#20195#30721
      FieldName = 'province_id'
      Size = 6
    end
    object OrganInfoprovince: TStringField
      DisplayLabel = #30465
      FieldKind = fkLookup
      FieldName = 'province'
      LookupDataSet = area
      LookupKeyFields = 'id'
      LookupResultField = 'name'
      KeyFields = 'province_id'
      Size = 50
      Lookup = True
    end
    object OrganInfocity_id: TStringField
      DisplayLabel = #24066#20195#30721
      FieldName = 'city_id'
      Size = 6
    end
    object OrganInfocity: TStringField
      DisplayLabel = #24066
      FieldKind = fkLookup
      FieldName = 'city'
      LookupDataSet = area
      LookupKeyFields = 'id'
      LookupResultField = 'name'
      KeyFields = 'city_id'
      Size = 50
      Lookup = True
    end
    object OrganInfoborough_id: TStringField
      DisplayLabel = #21306#20195#30721
      FieldName = 'borough_id'
      Size = 6
    end
    object OrganInfoborough: TStringField
      DisplayLabel = #21306
      FieldKind = fkLookup
      FieldName = 'borough'
      LookupDataSet = area
      LookupKeyFields = 'id'
      LookupResultField = 'name'
      KeyFields = 'borough_id'
      Size = 50
      Lookup = True
    end
    object OrganInfoaddr: TStringField
      DisplayLabel = #22320#22336
      FieldName = 'addr'
      Size = 60
    end
    object OrganInfozip: TStringField
      DisplayLabel = #37038#25919#32534#30721
      FieldName = 'zip'
      Size = 6
    end
    object OrganInfotel: TStringField
      DisplayLabel = #30005#35805
      FieldName = 'tel'
      Size = 30
    end
    object OrganInfofax: TStringField
      DisplayLabel = #20256#30495
      FieldName = 'fax'
      Size = 30
    end
    object OrganInfoweb: TStringField
      DisplayLabel = #32593#22336
      FieldName = 'web'
      Size = 30
    end
    object OrganInfocapital_asserts: TBCDField
      DisplayLabel = #22266#23450#36164#20135#65288#19975#20803#65289
      FieldName = 'capital_asserts'
      Size = 0
    end
    object OrganInfocapital_register: TBCDField
      DisplayLabel = #27880#20876#36164#37329#65288#19975#20803#65289
      FieldName = 'capital_register'
    end
    object OrganInfomanager: TStringField
      DisplayLabel = #31649#29702#32773#20195#34920
      FieldName = 'manager'
      Size = 30
    end
    object OrganInfomanager_post: TStringField
      DisplayLabel = #31649#29702#32773#20195#34920#32844#20301
      FieldName = 'manager_post'
      Size = 10
    end
    object OrganInfoisomanager: TStringField
      DisplayLabel = #36136#37327#20445#35777#36127#36131#20154
      FieldName = 'isomanager'
      Size = 30
    end
    object OrganInfoman_quantity: TIntegerField
      DisplayLabel = #24635#20154#25968
      FieldName = 'man_quantity'
    end
    object OrganInfostate: TStringField
      DisplayLabel = #21333#20301#29366#24577#20195#30721
      FieldName = 'state'
      Size = 2
    end
    object OrganInfostate_name: TStringField
      DisplayLabel = #21333#20301#29366#24577
      FieldKind = fkLookup
      FieldName = 'state_name'
      LookupDataSet = OrganState
      LookupKeyFields = 'id'
      LookupResultField = 'name'
      KeyFields = 'state'
      Lookup = True
    end
    object OrganInfocategory: TIntegerField
      DisplayLabel = #21333#20301#31867#21035
      FieldName = 'category'
    end
  end
  object OrganInfod: TDataSource
    DataSet = OrganInfo
    Left = 48
    Top = 295
  end
  object ListFind: TCSDBEhGrdFind
    EhDBGrid = grdList
    Left = 20
    Top = 366
  end
  object ListFilter: TCSADOEhGrdFilter
    EhDBGrid = grdList
    Left = 48
    Top = 366
  end
  object ListColCtrl: TCSEhGrdColCtrl
    EhDBGrid = grdList
    ColList = <
      item
        ColIndex = 0
        Name = 'Columns[0]'
        Visible = True
      end>
    Left = 76
    Top = 366
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'xls'
    FileName = 'export'
    Filter = 
      'Microsoft Excel'#25991#20214'(*.xls)|*.xls|'#25991#26412#25991#20214'(*.txt)|*.txt|HTML'#25991#20214'(*.htm)|*' +
      '.htm|Rich Text Format(*.rtf)|*.rtf|csv'#25991#20214'(*.csv)|*.csv'
    Left = 132
    Top = 366
  end
  object ListPrint: TPrintDBGridEh
    DBGridEh = grdList
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
    Top = 366
  end
  object CSBarMDIChild1: TCSBarMDIChild
    Left = 188
    Top = 366
  end
  object province: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltReadOnly
    Parameters = <>
    Left = 20
    Top = 330
  end
  object city: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltReadOnly
    Parameters = <>
    Left = 76
    Top = 330
  end
  object borough: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltReadOnly
    Parameters = <>
    Left = 132
    Top = 330
  end
  object provinced: TDataSource
    DataSet = province
    Left = 48
    Top = 330
  end
  object cityd: TDataSource
    DataSet = city
    Left = 104
    Top = 330
  end
  object boroughd: TDataSource
    DataSet = borough
    Left = 160
    Top = 330
  end
  object area: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltReadOnly
    Parameters = <>
    Left = 197
    Top = 330
  end
  object ScrChild: TCSScrCtrlChild
    Master = dmData.ScrMaster
    Left = 216
    Top = 366
  end
  object Temp: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltReadOnly
    Parameters = <>
    Left = 217
    Top = 294
  end
  object contact: TCSADOQuery
    Connection = dmData.adocon
    AfterInsert = contactAfterInsert
    Parameters = <>
    Left = 85
    Top = 295
    object contactsysid: TStringField
      DisplayLabel = #31995#32479'ID'
      FieldName = 'sysid'
    end
    object contactcategory: TIntegerField
      DisplayLabel = #21333#20301#31867#21035
      FieldName = 'category'
    end
    object contactorgan_sysid: TStringField
      DisplayLabel = #31995#32479#26426#26500'ID'
      FieldName = 'organ_sysid'
    end
    object contactname: TStringField
      DisplayLabel = #32852#31995#20154
      FieldName = 'name'
      Size = 30
    end
    object contacttel: TStringField
      DisplayLabel = #32852#31995#30005#35805
      FieldName = 'tel'
      Size = 30
    end
    object contactaddr: TStringField
      DisplayLabel = #32852#31995#22320#22336
      FieldName = 'addr'
      Size = 60
    end
    object contactzip: TStringField
      DisplayLabel = #37038#32534
      FieldName = 'zip'
      Size = 6
    end
    object contactemail: TStringField
      DisplayLabel = #30005#23376#37038#20214
      FieldName = 'email'
      Size = 30
    end
  end
  object contactd: TDataSource
    DataSet = contact
    Left = 113
    Top = 295
  end
  object CertList: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltReadOnly
    AfterScroll = CertListAfterScroll
    Parameters = <>
    Left = 151
    Top = 295
    object CertListsysid: TStringField
      DisplayLabel = #31995#32479'ID'
      FieldName = 'sysid'
    end
    object CertListcertno: TStringField
      DisplayLabel = #35768#21487#35777#32534#21495
      FieldName = 'certno'
      Size = 50
    end
    object CertListagent_name: TStringField
      DisplayLabel = #20195#29702#26426#26500#21517#31216
      FieldName = 'agent_name'
      Size = 60
    end
    object CertListagent_regno: TStringField
      DisplayLabel = #20195#29702#26426#26500#20195#30721
      FieldName = 'agent_regno'
      Size = 12
    end
    object CertListagent_legalperson: TStringField
      DisplayLabel = #20195#29702#26426#26500#27861#20154#20195#34920
      FieldName = 'agent_legalperson'
      Size = 30
    end
    object CertListagent_addr: TStringField
      DisplayLabel = #20195#29702#26426#26500#22320#22336
      FieldName = 'agent_addr'
      Size = 60
    end
    object CertListagent_zip: TStringField
      DisplayLabel = #20195#29702#26426#26500#37038#25919#32534#30721
      FieldName = 'agent_zip'
      Size = 6
    end
    object CertListagent_tel: TStringField
      DisplayLabel = #20195#29702#26426#26500#30005#35805
      FieldName = 'agent_tel'
      Size = 30
    end
    object CertListagent_fax: TStringField
      DisplayLabel = #20195#29702#26426#26500#20256#30495
      FieldName = 'agent_fax'
      Size = 30
    end
    object CertListagent_email: TStringField
      DisplayLabel = #20195#29702#26426#26500'EMAIL'
      FieldName = 'agent_email'
      Size = 30
    end
    object CertListcharge_remark: TStringField
      DisplayLabel = #20027#31649#37096#38376#24847#35265
      FieldName = 'charge_remark'
      Size = 100
    end
    object CertListlocal_supervise_remark: TStringField
      DisplayLabel = #22320#26041#23433#20840#30417#23519#26426#26500#24847#35265
      FieldName = 'local_supervise_remark'
      Size = 100
    end
    object CertListaccept_supervise_remark: TStringField
      DisplayLabel = #21463#29702#23433#20840#30417#23519#26426#26500#24847#35265
      FieldName = 'accept_supervise_remark'
      Size = 100
    end
    object CertListaccept_no: TStringField
      DisplayLabel = #30003#35831#20070#32534#21495
      FieldName = 'accept_no'
    end
    object CertListaccept_type: TStringField
      DisplayLabel = #30003#35831#31181#31867
      FieldName = 'accept_type'
      Size = 30
    end
    object CertListcom_area: TBCDField
      DisplayLabel = #21344#22320#38754#31215
      FieldName = 'com_area'
    end
    object CertListworkshop_area: TBCDField
      DisplayLabel = #21378#25151#38754#31215
      FieldName = 'workshop_area'
    end
    object CertListexposal_area: TBCDField
      DisplayLabel = #26333#20809#23460#38754#31215
      FieldName = 'exposal_area'
    end
    object CertListdesigner_num: TIntegerField
      DisplayLabel = #35774#35745#20154#21592#25968
      FieldName = 'designer_num'
    end
    object CertListchecker_num: TIntegerField
      DisplayLabel = #26816#26597#20154#21592#25968
      FieldName = 'checker_num'
    end
    object CertListinspector_num: TIntegerField
      DisplayLabel = #26080#25439#26816#27979#20154#21592#25968
      FieldName = 'inspector_num'
    end
    object CertListwelder_num: TIntegerField
      DisplayLabel = #28938#25509#20154#21592#25968
      FieldName = 'welder_num'
    end
    object CertListother_num: TIntegerField
      DisplayLabel = #20854#20182#19987#19994#20154#21592#25968
      FieldName = 'other_num'
    end
    object CertListdesign_type: TStringField
      DisplayLabel = #35774#35745#33021#21147
      FieldName = 'design_type'
      Size = 30
    end
    object CertListyear_value: TBCDField
      DisplayLabel = #24180#20135#20540
      FieldName = 'year_value'
    end
    object CertListlevel1_id: TStringField
      DisplayLabel = #35768#21487#24615#36136#20195#30721
      FieldName = 'level1_id'
      Size = 4
    end
    object CertListlevel1: TStringField
      DisplayLabel = #35768#21487#24615#36136
      FieldName = 'level1'
      Size = 100
    end
    object CertListlevel2_id: TStringField
      DisplayLabel = #35774#22791#22823#31867#20195#30721
      FieldName = 'level2_id'
      Size = 4
    end
    object CertListlevel2: TStringField
      DisplayLabel = #35774#22791#22823#31867
      FieldName = 'level2'
      Size = 100
    end
    object CertListlevel3_id: TStringField
      DisplayLabel = #35774#22791#31181#31867#20195#30721
      FieldName = 'level3_id'
      Size = 4
    end
    object CertListlevel3: TStringField
      DisplayLabel = #35774#22791#31181#31867
      FieldName = 'level3'
      Size = 100
    end
    object CertListapply_date: TStringField
      DisplayLabel = #30003#35831#26085#26399
      FieldName = 'apply_date'
      Size = 10
    end
    object CertListauth_date: TStringField
      DisplayLabel = #25209#20934#26085#26399
      FieldName = 'auth_date'
      Size = 10
    end
    object CertListend_date: TStringField
      DisplayLabel = #26377#25928#26085#26399
      FieldName = 'end_date'
      Size = 10
    end
    object CertListstate: TStringField
      DisplayLabel = #35768#21487#35777#29366#24577#20195#30721
      FieldName = 'state'
      Size = 4
    end
    object CertListstate_name: TStringField
      DisplayLabel = #35768#21487#35777#29366#24577
      FieldName = 'state_name'
    end
    object CertListauth_organ_sysid: TStringField
      DisplayLabel = #25209#20934#26426#26500#31995#32479'ID'
      FieldName = 'auth_organ_sysid'
    end
    object CertListauth_organ: TStringField
      DisplayLabel = #25209#20934#26426#26500
      FieldName = 'auth_organ'
      Size = 60
    end
    object CertListremark: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'remark'
      Size = 200
    end
  end
  object CertListd: TDataSource
    DataSet = CertList
    Left = 179
    Top = 295
  end
  object OrganType: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltReadOnly
    Parameters = <>
    Left = 235
    Top = 330
  end
  object OrganTyped: TDataSource
    DataSet = OrganType
    Left = 263
    Top = 330
  end
  object OrganState: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltReadOnly
    Parameters = <>
    Left = 291
    Top = 330
  end
  object OrganStated: TDataSource
    DataSet = OrganState
    Left = 319
    Top = 330
  end
  object CertFind: TCSDBEhGrdFind
    EhDBGrid = grdCert
    Left = 256
    Top = 366
  end
  object CertFilter: TCSADOEhGrdFilter
    EhDBGrid = grdCert
    Left = 284
    Top = 366
  end
  object ListEhGrdStore: TCSDBEhGrdStore
    StoreToIniFile = True
    EhDBGrid = grdList
    Left = 104
    Top = 366
  end
end
