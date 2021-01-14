object frmPersonlicnsMng: TfrmPersonlicnsMng
  Left = 0
  Top = 80
  Width = 799
  Height = 526
  Caption = 'frmPersonlicnsMng'
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
    Top = 58
    Width = 791
    Height = 3
    Cursor = crSizeNS
    Align = alTop
  end
  object Panel1: TPanel
    Left = 0
    Top = 471
    Width = 791
    Height = 28
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 0
    object Panel5: TPanel
      Left = 430
      Top = 1
      Width = 360
      Height = 26
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object bbtnHelp: TBitBtn
        Left = 206
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
        Left = 283
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
    object bbtnSave: TBitBtn
      Left = 3
      Top = 3
      Width = 60
      Height = 22
      Caption = #20445#23384
      TabOrder = 1
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
      TabOrder = 2
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
    object bbtnOperate: TBitBtn
      Left = 127
      Top = 3
      Width = 60
      Height = 22
      Caption = #25805#20316
      TabOrder = 3
      OnClick = bbtnOperateClick
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
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 0
    Width = 791
    Height = 58
    Align = alTop
    TabOrder = 1
    object Label12: TLabel
      Left = 11
      Top = 8
      Width = 60
      Height = 12
      Alignment = taRightJustify
      Caption = #35777#20070#32534#21495#65306
    end
    object Label1: TLabel
      Left = 387
      Top = 8
      Width = 60
      Height = 12
      Alignment = taRightJustify
      Caption = #35777#20070#24615#36136#65306
    end
    object Label2: TLabel
      Left = 199
      Top = 8
      Width = 60
      Height = 12
      Alignment = taRightJustify
      Caption = #20154#21592#22995#21517#65306
    end
    object Label3: TLabel
      Left = 557
      Top = 8
      Width = 60
      Height = 12
      Alignment = taRightJustify
      Caption = #25805#20316#31867#21035#65306
    end
    object Label4: TLabel
      Left = 11
      Top = 31
      Width = 60
      Height = 12
      Alignment = taRightJustify
      Caption = #21457#35777#26426#26500#65306
    end
    object Label5: TLabel
      Left = 199
      Top = 31
      Width = 60
      Height = 12
      Alignment = taRightJustify
      Caption = #21457#35777#26085#26399#65306
    end
    object Label6: TLabel
      Left = 387
      Top = 31
      Width = 60
      Height = 12
      Alignment = taRightJustify
      Caption = #35777#20070#29366#24577#65306
    end
    object eLicnsNo: TDBEditEh
      Left = 71
      Top = 5
      Width = 118
      Height = 18
      Ctl3D = False
      DataField = 'licnsno'
      DataSource = psnlicnsd
      EditButtons = <>
      ParentCtl3D = False
      TabOrder = 0
      Visible = True
    end
    object lcmbName: TDBLookupComboboxEh
      Left = 259
      Top = 5
      Width = 118
      Height = 18
      Ctl3D = False
      DataField = 'person_sysid'
      DataSource = psnlicnsd
      EditButton.Visible = False
      EditButtons = <
        item
          Style = ebsEllipsisEh
          OnClick = lcmbNameEditButtons0Click
        end>
      KeyField = 'licnspsn'
      ListField = 'licnspsn_name'
      ListSource = mlicnspsnd
      ParentCtl3D = False
      TabOrder = 1
      Visible = True
    end
    object lcmbkind: TDBLookupComboboxEh
      Left = 447
      Top = 5
      Width = 100
      Height = 18
      Ctl3D = False
      DataField = 'licns_kind'
      DataSource = psnlicnsd
      EditButtons = <>
      KeyField = 'id'
      ListField = 'name'
      ListSource = licnskindd
      ParentCtl3D = False
      TabOrder = 2
      Visible = True
      OnKeyValueChanged = lcmbkindKeyValueChanged
    end
    object lcmbcategory: TDBLookupComboboxEh
      Left = 617
      Top = 5
      Width = 100
      Height = 18
      Ctl3D = False
      DataField = 'licns_category'
      DataSource = psnlicnsd
      EditButtons = <>
      KeyField = 'id'
      ListField = 'name'
      ListSource = licnscategoryd
      ParentCtl3D = False
      TabOrder = 3
      Visible = True
      OnKeyValueChanged = lcmbcategoryKeyValueChanged
    end
    object lcmborgan: TDBLookupComboboxEh
      Left = 71
      Top = 28
      Width = 118
      Height = 18
      Ctl3D = False
      DataField = 'organ_sysid'
      DataSource = psnlicnsd
      EditButton.Visible = False
      EditButtons = <
        item
          Style = ebsEllipsisEh
          OnClick = lcmborganEditButtons0Click
        end>
      KeyField = 'organ_sysid'
      ListField = 'organ_sysid_name'
      ListSource = mlicnscomd
      ParentCtl3D = False
      TabOrder = 4
      Visible = True
    end
    object dteDate: TCSdxDBDateEdit
      Left = 259
      Top = 27
      Width = 118
      TabOrder = 5
      DataField = 'issue_date'
      DataSource = psnlicnsd
      StyleController = dmData.dxStyleCtrl
      FixedDateFormat = 'yyyy-MM-dd'
      StoredValues = 4
    end
    object lcmbstate: TDBLookupComboboxEh
      Left = 447
      Top = 28
      Width = 100
      Height = 18
      Ctl3D = False
      DataField = 'state'
      DataSource = psnlicnsd
      EditButtons = <>
      KeyField = 'id'
      ListField = 'name'
      ListSource = licnsstated
      ParentCtl3D = False
      TabOrder = 6
      Visible = True
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 61
    Width = 791
    Height = 410
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 2
    object paglicnsInfo: TPageControl
      Left = 1
      Top = 1
      Width = 789
      Height = 408
      ActivePage = tsPrjInfo
      Align = alClient
      TabIndex = 0
      TabOrder = 0
      object tsPrjInfo: TTabSheet
        Caption = #36164#36136#39033#30446
        object Splitter2: TSplitter
          Left = 0
          Top = 89
          Width = 781
          Height = 3
          Cursor = crSizeNS
          Align = alTop
        end
        object Panel7: TPanel
          Left = 0
          Top = 353
          Width = 781
          Height = 28
          Align = alBottom
          BevelOuter = bvLowered
          TabOrder = 0
          object Panel8: TPanel
            Left = 328
            Top = 1
            Width = 452
            Height = 26
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 0
            object bbtnPrjIns: TBitBtn
              Left = 52
              Top = 2
              Width = 50
              Height = 22
              Hint = #28155#21152#35760#24405
              Caption = #28155#21152
              TabOrder = 0
              OnClick = bbtnPrjInsClick
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
            object bbtnPrjDel: TBitBtn
              Left = 102
              Top = 2
              Width = 50
              Height = 22
              Hint = #21024#38500#35760#24405
              Caption = #21024#38500
              TabOrder = 1
              OnClick = bbtnPrjDelClick
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
            object navprjlist: TCSDBNavigator
              Left = 152
              Top = 2
              Width = 300
              Height = 22
              DataSource = licnsprjd
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbCancel, nbRefresh]
              Align = alCustom
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
          object bbtnprjPrint: TBitBtn
            Left = 2
            Top = 3
            Width = 60
            Height = 22
            Hint = #25171#21360#36164#36136#39033#30446
            Caption = #25171#21360
            TabOrder = 1
            OnClick = bbtnprjPrintClick
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
        object CSRowCountPanel1: TCSRowCountPanel
          Left = 0
          Top = 331
          Width = 781
          Align = alBottom
          TabOrder = 1
          CaptionFormat = ' '#35760#24405#25968#65306'%d'
        end
        object grdLicnsPrj: TDBGridEh
          Left = 0
          Top = 92
          Width = 781
          Height = 239
          Align = alClient
          AllowedOperations = []
          AllowedSelections = [gstRecordBookmarks, gstRectangle, gstAll]
          DataSource = licnsprjd
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
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 265
            end
            item
              EditButtons = <>
              FieldName = 'state_name'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 88
            end
            item
              EditButtons = <>
              FieldName = 'apply_date'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 70
            end
            item
              EditButtons = <>
              FieldName = 'auth_date'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 71
            end
            item
              EditButtons = <>
              FieldName = 'end_date'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
            end>
        end
        object scrbDetail: TScrollBox
          Left = 0
          Top = 0
          Width = 781
          Height = 89
          Align = alTop
          TabOrder = 3
          object Label7: TLabel
            Left = 11
            Top = 8
            Width = 60
            Height = 12
            Alignment = taRightJustify
            Caption = #35777#20070#39033#30446#65306
          end
          object Label8: TLabel
            Left = 199
            Top = 8
            Width = 60
            Height = 12
            Alignment = taRightJustify
            Caption = #35777#20070#32423#21035#65306
          end
          object Label9: TLabel
            Left = 11
            Top = 31
            Width = 60
            Height = 12
            Alignment = taRightJustify
            Caption = #32771#26680#26426#26500#65306
          end
          object Label10: TLabel
            Left = 199
            Top = 31
            Width = 60
            Height = 12
            Alignment = taRightJustify
            Caption = #25209#20934#26426#26500#65306
          end
          object Label11: TLabel
            Left = 387
            Top = 31
            Width = 60
            Height = 12
            Alignment = taRightJustify
            Caption = #30003#35831#26085#26399#65306
          end
          object Label13: TLabel
            Left = 11
            Top = 55
            Width = 60
            Height = 12
            Alignment = taRightJustify
            Caption = #25209#20934#26085#26399#65306
          end
          object Label14: TLabel
            Left = 199
            Top = 55
            Width = 60
            Height = 12
            Alignment = taRightJustify
            Caption = #26377#25928#26085#26399#65306
          end
          object Label15: TLabel
            Left = 387
            Top = 55
            Width = 60
            Height = 12
            Alignment = taRightJustify
            Caption = #39033#30446#29366#24577#65306
          end
          object Label16: TLabel
            Left = 387
            Top = 8
            Width = 60
            Height = 12
            Alignment = taRightJustify
            Caption = #39033#30446#21517#31216#65306
          end
          object lcmblicnsprj: TDBLookupComboboxEh
            Left = 71
            Top = 5
            Width = 118
            Height = 18
            Ctl3D = False
            DataField = 'psnlicns_prjcode'
            DataSource = licnsprjd
            EditButtons = <>
            KeyField = 'id'
            ListField = 'name'
            ListSource = licnsprojectd
            ParentCtl3D = False
            TabOrder = 0
            Visible = True
            OnKeyValueChanged = lcmblicnsprjKeyValueChanged
          end
          object lcmblicnslevel: TDBLookupComboboxEh
            Left = 259
            Top = 5
            Width = 118
            Height = 18
            Ctl3D = False
            DataField = 'psnlicns_levelcode'
            DataSource = licnsprjd
            EditButtons = <>
            KeyField = 'id'
            ListField = 'name'
            ListSource = licnsleveld
            ParentCtl3D = False
            TabOrder = 1
            Visible = True
            OnKeyValueChanged = lcmblicnslevelKeyValueChanged
          end
          object lcmbtestorgan: TDBLookupComboboxEh
            Left = 71
            Top = 28
            Width = 118
            Height = 18
            Ctl3D = False
            DataField = 'test_organ_sysid'
            DataSource = licnsprjd
            EditButton.Visible = False
            EditButtons = <
              item
                Style = ebsEllipsisEh
                OnClick = lcmbtestorganEditButtons0Click
              end>
            KeyField = 'test_organ_sysid'
            ListField = 'test_organ_name'
            ListSource = mprjorgand
            ParentCtl3D = False
            TabOrder = 3
            Visible = True
          end
          object lcmbauthorgan: TDBLookupComboboxEh
            Left = 259
            Top = 28
            Width = 118
            Height = 18
            Ctl3D = False
            DataField = 'auth_organ_sysid'
            DataSource = licnsprjd
            EditButton.Visible = False
            EditButtons = <
              item
                Style = ebsEllipsisEh
                OnClick = lcmbauthorganEditButtons0Click
              end>
            KeyField = 'auth_organ_sysid'
            ListField = 'auth_organ_name'
            ListSource = mprjorgand
            ParentCtl3D = False
            TabOrder = 4
            Visible = True
          end
          object dteapplydate: TCSdxDBDateEdit
            Left = 447
            Top = 27
            Width = 118
            TabOrder = 5
            DataField = 'apply_date'
            DataSource = licnsprjd
            StyleController = dmData.dxStyleCtrl
            FixedDateFormat = 'yyyy-MM-dd'
            StoredValues = 4
          end
          object dteauthdate: TCSdxDBDateEdit
            Left = 71
            Top = 51
            Width = 118
            TabOrder = 6
            DataField = 'auth_date'
            DataSource = licnsprjd
            StyleController = dmData.dxStyleCtrl
            OnChange = dteauthdateChange
            FixedDateFormat = 'yyyy-MM-dd'
            StoredValues = 4
          end
          object dteenddate: TCSdxDBDateEdit
            Left = 259
            Top = 51
            Width = 118
            TabOrder = 7
            DataField = 'end_date'
            DataSource = licnsprjd
            StyleController = dmData.dxStyleCtrl
            FixedDateFormat = 'yyyy-MM-dd'
            StoredValues = 4
          end
          object lcmbprjstate: TDBLookupComboboxEh
            Left = 447
            Top = 52
            Width = 118
            Height = 18
            Ctl3D = False
            DataField = 'state'
            DataSource = licnsprjd
            EditButtons = <>
            KeyField = 'id'
            ListField = 'name'
            ListSource = prjstated
            ParentCtl3D = False
            TabOrder = 8
            Visible = True
          end
          object elicnsprjname: TDBEditEh
            Left = 447
            Top = 5
            Width = 236
            Height = 18
            Ctl3D = False
            DataField = 'psnlicns_prjname'
            DataSource = licnsprjd
            EditButtons = <
              item
                Style = ebsEllipsisEh
              end>
            ParentCtl3D = False
            TabOrder = 2
            Visible = True
          end
        end
      end
      object tsEngageInfo: TTabSheet
        Caption = #32856#29992#24773#20917
        ImageIndex = 1
        object Splitter3: TSplitter
          Left = 0
          Top = 89
          Width = 781
          Height = 3
          Cursor = crSizeNS
          Align = alTop
        end
        object ScrollBox2: TScrollBox
          Left = 0
          Top = 0
          Width = 781
          Height = 89
          Align = alTop
          TabOrder = 0
          object Label17: TLabel
            Left = 11
            Top = 8
            Width = 60
            Height = 12
            Alignment = taRightJustify
            Caption = #32856#29992#39033#30446#65306
          end
          object Label18: TLabel
            Left = 11
            Top = 31
            Width = 60
            Height = 12
            Alignment = taRightJustify
            Caption = #22791'    '#27880#65306
          end
          object Label21: TLabel
            Left = 199
            Top = 8
            Width = 60
            Height = 12
            Alignment = taRightJustify
            Caption = #32856#29992#21333#20301#65306
          end
          object Label23: TLabel
            Left = 387
            Top = 8
            Width = 60
            Height = 12
            Alignment = taRightJustify
            Caption = #32856#29992#26085#26399#65306
          end
          object lcmbengorgan: TDBLookupComboboxEh
            Left = 259
            Top = 5
            Width = 118
            Height = 18
            Ctl3D = False
            DataField = 'organ_sysid'
            DataSource = licnsengaged
            EditButton.Visible = False
            EditButtons = <
              item
                Style = ebsEllipsisEh
                OnClick = lcmbengorganEditButtons0Click
              end>
            KeyField = 'organ_sysid'
            ListField = 'organ_sysid_name'
            ListSource = mengagecomd
            ParentCtl3D = False
            TabOrder = 0
            Visible = True
          end
          object dteengdate: TCSdxDBDateEdit
            Left = 447
            Top = 4
            Width = 118
            TabOrder = 1
            DataField = 'engage_date'
            DataSource = licnsengaged
            StyleController = dmData.dxStyleCtrl
            FixedDateFormat = 'yyyy-MM-dd'
            StoredValues = 4
          end
          object mengRemark: TdxDBMemo
            Left = 71
            Top = 28
            Width = 494
            TabOrder = 2
            DataField = 'remark'
            DataSource = licnsengaged
            StyleController = dmData.dxStyleCtrl
            Height = 57
          end
          object lcmbengprj: TDBLookupComboboxEh
            Left = 71
            Top = 5
            Width = 118
            Height = 18
            Ctl3D = False
            DataField = 'licns_prj_sysid'
            DataSource = licnsengaged
            EditButtons = <>
            KeyField = 'sysid'
            ListField = 'psnlicns_prjname'
            ListSource = licnsprjd
            ParentCtl3D = False
            TabOrder = 3
            Visible = True
            OnKeyValueChanged = lcmbengprjKeyValueChanged
          end
        end
        object grdEngage: TDBGridEh
          Left = 0
          Top = 92
          Width = 781
          Height = 239
          Align = alClient
          AllowedOperations = []
          AllowedSelections = [gstRecordBookmarks, gstRectangle, gstAll]
          DataSource = licnsengaged
          EditActions = [geaCutEh, geaCopyEh, geaPasteEh, geaDeleteEh, geaSelectAllEh]
          Flat = True
          FooterColor = clWindow
          FooterFont.Charset = GB2312_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -12
          FooterFont.Name = #23435#20307
          FooterFont.Style = []
          ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
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
              FieldName = 'licns_prj_name'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 370
            end
            item
              EditButtons = <>
              FieldName = 'engage_date'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 94
            end>
        end
        object CSRowCountPanel2: TCSRowCountPanel
          Left = 0
          Top = 331
          Width = 781
          Align = alBottom
          TabOrder = 2
          CaptionFormat = ' '#35760#24405#25968#65306'%d'
        end
        object Panel6: TPanel
          Left = 0
          Top = 353
          Width = 781
          Height = 28
          Align = alBottom
          BevelOuter = bvLowered
          TabOrder = 3
          object Panel2: TPanel
            Left = 328
            Top = 1
            Width = 452
            Height = 26
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 0
            object bbtnEngageIns: TBitBtn
              Left = 52
              Top = 2
              Width = 50
              Height = 22
              Hint = #28155#21152#35760#24405
              Caption = #28155#21152
              TabOrder = 0
              OnClick = bbtnEngageInsClick
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
            object bbtnEngageDel: TBitBtn
              Left = 102
              Top = 2
              Width = 50
              Height = 22
              Hint = #21024#38500#35760#24405
              Caption = #21024#38500
              TabOrder = 1
              OnClick = bbtnEngageDelClick
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
            object navengagelist: TCSDBNavigator
              Left = 152
              Top = 2
              Width = 300
              Height = 22
              DataSource = licnsengaged
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbCancel, nbRefresh]
              Align = alCustom
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
          object bbtnengPrint: TBitBtn
            Left = 2
            Top = 3
            Width = 60
            Height = 22
            Hint = #25171#21360#36164#36136#39033#30446#32856#29992#24773#20917
            Caption = #25171#21360
            TabOrder = 1
            Visible = False
            OnClick = bbtnengPrintClick
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
      end
      object tsCheckInfo: TTabSheet
        Caption = #23457#26597#22791#26696
        ImageIndex = 2
        object Splitter4: TSplitter
          Left = 0
          Top = 89
          Width = 781
          Height = 3
          Cursor = crSizeNS
          Align = alTop
        end
        object ScrollBox3: TScrollBox
          Left = 0
          Top = 0
          Width = 781
          Height = 89
          Align = alTop
          TabOrder = 0
          object Label19: TLabel
            Left = 8
            Top = 8
            Width = 84
            Height = 12
            Alignment = taRightJustify
            Caption = #23457#26597#22791#26696#39033#30446#65306
          end
          object Label20: TLabel
            Left = 220
            Top = 8
            Width = 84
            Height = 12
            Alignment = taRightJustify
            Caption = #23457#26597#22791#26696#26426#26500#65306
          end
          object Label22: TLabel
            Left = 220
            Top = 32
            Width = 84
            Height = 12
            Alignment = taRightJustify
            Caption = #23457#26597#22791#26696#26085#26399#65306
          end
          object Label24: TLabel
            Left = 432
            Top = 7
            Width = 36
            Height = 12
            Alignment = taRightJustify
            Caption = #22791#27880#65306
          end
          object Label25: TLabel
            Left = 8
            Top = 31
            Width = 84
            Height = 12
            Alignment = taRightJustify
            Caption = #23457#26597#21150#29702#20154#21592#65306
          end
          object Label26: TLabel
            Left = 8
            Top = 55
            Width = 84
            Height = 12
            Alignment = taRightJustify
            Caption = #23457#26597#22791#26696#32467#35770#65306
          end
          object lcmbchkorgan: TDBLookupComboboxEh
            Left = 304
            Top = 5
            Width = 118
            Height = 18
            Ctl3D = False
            DataField = 'check_organ_sysid'
            DataSource = licnschkd
            EditButton.Visible = False
            EditButtons = <
              item
                Style = ebsEllipsisEh
                OnClick = lcmbchkorganEditButtons0Click
              end>
            KeyField = 'check_organ_sysid'
            ListField = 'check_organ_sysid_name'
            ListSource = mchkorgand
            ParentCtl3D = False
            TabOrder = 0
            Visible = True
          end
          object dtechkdate: TCSdxDBDateEdit
            Left = 304
            Top = 28
            Width = 118
            TabOrder = 2
            DataField = 'check_date'
            DataSource = licnschkd
            StyleController = dmData.dxStyleCtrl
            FixedDateFormat = 'yyyy-MM-dd'
            StoredValues = 4
          end
          object mchkremark: TdxDBMemo
            Left = 465
            Top = 4
            Width = 255
            TabOrder = 3
            DataField = 'remark'
            DataSource = licnschkd
            StyleController = dmData.dxStyleCtrl
            Height = 77
          end
          object echkname: TDBEditEh
            Left = 92
            Top = 28
            Width = 118
            Height = 18
            Ctl3D = False
            DataField = 'check_psn_name'
            DataSource = licnschkd
            EditButtons = <>
            ParentCtl3D = False
            TabOrder = 1
            Visible = True
          end
          object mchkresult: TdxDBMemo
            Left = 92
            Top = 51
            Width = 330
            TabOrder = 4
            DataField = 'check_result'
            DataSource = licnschkd
            StyleController = dmData.dxStyleCtrl
            Height = 32
          end
          object lcmbchkprj: TDBLookupComboboxEh
            Left = 92
            Top = 5
            Width = 118
            Height = 18
            Ctl3D = False
            DataField = 'licns_prj_sysid'
            DataSource = licnschkd
            EditButtons = <>
            KeyField = 'sysid'
            ListField = 'psnlicns_prjname'
            ListSource = licnsprjd
            ParentCtl3D = False
            TabOrder = 5
            Visible = True
            OnKeyValueChanged = lcmbchkprjKeyValueChanged
          end
        end
        object grdCheck: TDBGridEh
          Left = 0
          Top = 92
          Width = 781
          Height = 239
          Align = alClient
          AllowedOperations = []
          AllowedSelections = [gstRecordBookmarks, gstRectangle, gstAll]
          DataSource = licnschkd
          EditActions = [geaCutEh, geaCopyEh, geaPasteEh, geaDeleteEh, geaSelectAllEh]
          Flat = True
          FooterColor = clWindow
          FooterFont.Charset = GB2312_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -12
          FooterFont.Name = #23435#20307
          FooterFont.Style = []
          ImeName = #20013#25991' ('#31616#20307') - '#26234#33021' ABC'
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
              FieldName = 'licns_prj_name'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 156
            end
            item
              EditButtons = <>
              FieldName = 'check_psn_name'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 80
            end
            item
              EditButtons = <>
              FieldName = 'check_result'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 347
            end
            item
              EditButtons = <>
              FieldName = 'check_date'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 81
            end>
        end
        object CSRowCountPanel3: TCSRowCountPanel
          Left = 0
          Top = 331
          Width = 781
          Align = alBottom
          TabOrder = 2
          CaptionFormat = ' '#35760#24405#25968#65306'%d'
        end
        object Panel10: TPanel
          Left = 0
          Top = 353
          Width = 781
          Height = 28
          Align = alBottom
          BevelOuter = bvLowered
          TabOrder = 3
          object Panel4: TPanel
            Left = 328
            Top = 1
            Width = 452
            Height = 26
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 0
            object bbtnCheckIns: TBitBtn
              Left = 52
              Top = 2
              Width = 50
              Height = 22
              Hint = #28155#21152#35760#24405
              Caption = #28155#21152
              TabOrder = 0
              OnClick = bbtnCheckInsClick
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
            object bbtnCheckDel: TBitBtn
              Left = 102
              Top = 2
              Width = 50
              Height = 22
              Hint = #21024#38500#35760#24405
              Caption = #21024#38500
              TabOrder = 1
              OnClick = bbtnCheckDelClick
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
            object navchecklist: TCSDBNavigator
              Left = 152
              Top = 2
              Width = 300
              Height = 22
              DataSource = licnschkd
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbCancel, nbRefresh]
              Align = alCustom
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
          object bbtnchkPrint: TBitBtn
            Left = 2
            Top = 3
            Width = 60
            Height = 22
            Hint = #25171#21360#36164#36136#39033#30446#23457#26597#22791#26696
            Caption = #25171#21360
            TabOrder = 1
            Visible = False
            OnClick = bbtnchkPrintClick
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
      end
    end
  end
  object ListFind: TCSDBEhGrdFind
    Left = 8
    Top = 271
  end
  object ListFilter: TCSADOEhGrdFilter
    Left = 36
    Top = 271
  end
  object ListColCtrl: TCSEhGrdColCtrl
    ColList = <
      item
        ColIndex = 0
        Name = 'Columns[0]'
        Visible = True
      end>
    Left = 64
    Top = 271
  end
  object ListEhGrdStore: TCSDBEhGrdStore
    StoreToIniFile = True
    Left = 92
    Top = 271
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'xls'
    FileName = 'export'
    Filter = 
      'Microsoft Excel'#25991#20214'(*.xls)|*.xls|'#25991#26412#25991#20214'(*.txt)|*.txt|HTML'#25991#20214'(*.htm)|*' +
      '.htm|Rich Text Format(*.rtf)|*.rtf|csv'#25991#20214'(*.csv)|*.csv'
    Left = 120
    Top = 271
  end
  object ListPrint: TPrintDBGridEh
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
    Left = 148
    Top = 271
  end
  object CSBarMDIChild1: TCSBarMDIChild
    Left = 176
    Top = 271
  end
  object ScrChild: TCSScrCtrlChild
    Master = dmData.ScrMaster
    Left = 204
    Top = 271
  end
  object psnlicns: TCSADOQuery
    Connection = dmData.adocon
    AfterInsert = psnlicnsAfterInsert
    AfterScroll = psnlicnsAfterScroll
    Parameters = <>
    Left = 8
    Top = 216
  end
  object psnlicnsd: TDataSource
    DataSet = psnlicns
    Left = 8
    Top = 244
  end
  object licnsprj: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltBatchOptimistic
    AfterInsert = licnsprjAfterInsert
    AfterPost = licnsprjAfterPost
    AfterScroll = licnsprjAfterScroll
    Parameters = <>
    Left = 128
    Top = 216
    object licnsprjsysid: TStringField
      FieldName = 'sysid'
    end
    object licnsprjpsnlicns_sysid: TStringField
      FieldName = 'psnlicns_sysid'
    end
    object licnsprjpsnlicns_prjcode: TStringField
      FieldName = 'psnlicns_prjcode'
      Size = 4
    end
    object licnsprjpsnlicns_prjcode_name: TStringField
      DisplayLabel = #39033#30446
      FieldKind = fkLookup
      FieldName = 'psnlicns_prjcode_name'
      LookupDataSet = licnsproject
      LookupKeyFields = 'id'
      LookupResultField = 'name'
      KeyFields = 'psnlicns_prjcode'
      Size = 30
      Lookup = True
    end
    object licnsprjpsnlicns_levelcode: TStringField
      FieldName = 'psnlicns_levelcode'
      Size = 4
    end
    object licnsprjpsnlicns_levelcode_name: TStringField
      DisplayLabel = #32423#21035
      FieldKind = fkLookup
      FieldName = 'psnlicns_levelcode_name'
      LookupDataSet = licnslevel
      LookupKeyFields = 'id'
      LookupResultField = 'name'
      KeyFields = 'psnlicns_levelcode'
      Size = 30
      Lookup = True
    end
    object licnsprjpsnlicns_prjname: TStringField
      DisplayLabel = #39033#30446#21517#31216
      FieldName = 'psnlicns_prjname'
      Size = 60
    end
    object licnsprjtest_organ_sysid: TStringField
      FieldName = 'test_organ_sysid'
    end
    object licnsprjapply_date: TStringField
      DisplayLabel = #30003#35831#26085#26399
      FieldName = 'apply_date'
      Size = 10
    end
    object licnsprjauth_date: TStringField
      DisplayLabel = #25209#20934#26085#26399
      FieldName = 'auth_date'
      Size = 10
    end
    object licnsprjend_date: TStringField
      DisplayLabel = #26377#25928#26085#26399
      FieldName = 'end_date'
      Size = 10
    end
    object licnsprjstate: TStringField
      FieldName = 'state'
      Size = 2
    end
    object licnsprjstate_name: TStringField
      DisplayLabel = #29366#24577
      FieldKind = fkLookup
      FieldName = 'state_name'
      LookupDataSet = prjstate
      LookupKeyFields = 'id'
      LookupResultField = 'name'
      KeyFields = 'state'
      Lookup = True
    end
    object licnsprjauth_organ_sysid: TStringField
      FieldName = 'auth_organ_sysid'
    end
  end
  object licnsprjd: TDataSource
    DataSet = licnsprj
    Left = 128
    Top = 244
  end
  object licnsengage: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltBatchOptimistic
    AfterInsert = licnsengageAfterInsert
    AfterScroll = licnsengageAfterScroll
    Parameters = <>
    Left = 156
    Top = 216
    object licnsengagesysid: TStringField
      FieldName = 'sysid'
    end
    object licnsengageperson_sysid: TStringField
      FieldName = 'person_sysid'
    end
    object licnsengagelicns_prj_sysid: TStringField
      FieldName = 'licns_prj_sysid'
    end
    object licnsengagelicns_prj_name: TStringField
      DisplayLabel = #32856#29992#39033#30446
      FieldName = 'licns_prj_name'
      Size = 60
    end
    object licnsengageorgan_sysid: TStringField
      FieldName = 'organ_sysid'
    end
    object licnsengageengage_date: TStringField
      DisplayLabel = #32856#29992#26085#26399
      FieldName = 'engage_date'
      Size = 10
    end
    object licnsengageremark: TStringField
      FieldName = 'remark'
      Size = 200
    end
  end
  object licnsengaged: TDataSource
    DataSet = licnsengage
    Left = 156
    Top = 244
  end
  object licnschk: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltBatchOptimistic
    AfterInsert = licnschkAfterInsert
    AfterScroll = licnschkAfterScroll
    Parameters = <>
    Left = 184
    Top = 216
    object licnschksysid: TStringField
      FieldName = 'sysid'
    end
    object licnschkperson_sysid: TStringField
      FieldName = 'person_sysid'
    end
    object licnschklicns_prj_sysid: TStringField
      FieldName = 'licns_prj_sysid'
    end
    object licnschklicns_prj_name: TStringField
      DisplayLabel = #23457#26597#22791#26696#39033#30446
      FieldName = 'licns_prj_name'
      Size = 60
    end
    object licnschkcheck_psn_name: TStringField
      DisplayLabel = #23457#26597#22791#26696#20154#21592
      FieldName = 'check_psn_name'
      Size = 30
    end
    object licnschkcheck_result: TStringField
      DisplayLabel = #23457#26597#22791#26696#32467#35770
      DisplayWidth = 40
      FieldName = 'check_result'
      Size = 200
    end
    object licnschkcheck_organ_sysid: TStringField
      FieldName = 'check_organ_sysid'
    end
    object licnschkcheck_date: TStringField
      DisplayLabel = #23457#26597#22791#26696#26085#26399
      FieldName = 'check_date'
      Size = 10
    end
    object licnschkremark: TStringField
      FieldName = 'remark'
      Size = 200
    end
  end
  object licnschkd: TDataSource
    DataSet = licnschk
    Left = 184
    Top = 244
  end
  object licnskind: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltReadOnly
    Parameters = <>
    Left = 216
    Top = 216
  end
  object licnskindd: TDataSource
    DataSet = licnskind
    Left = 216
    Top = 244
  end
  object licnscategory: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltReadOnly
    Parameters = <>
    Left = 244
    Top = 216
  end
  object licnscategoryd: TDataSource
    DataSet = licnscategory
    Left = 244
    Top = 244
  end
  object licnsstate: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltReadOnly
    Parameters = <>
    Left = 272
    Top = 216
  end
  object licnsstated: TDataSource
    DataSet = licnsstate
    Left = 272
    Top = 244
  end
  object licnsproject: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltReadOnly
    Parameters = <>
    Left = 300
    Top = 216
  end
  object licnsprojectd: TDataSource
    DataSet = licnsproject
    Left = 300
    Top = 244
  end
  object licnslevel: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltReadOnly
    Parameters = <>
    Left = 328
    Top = 216
  end
  object licnsleveld: TDataSource
    DataSet = licnslevel
    Left = 328
    Top = 244
  end
  object prjstate: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltReadOnly
    Parameters = <>
    Left = 356
    Top = 216
  end
  object prjstated: TDataSource
    DataSet = prjstate
    Left = 356
    Top = 244
  end
  object Temp: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltReadOnly
    Parameters = <>
    Left = 392
    Top = 216
  end
  object mlicnscombak: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 420
    Top = 216
    object mlicnscombakissueorgan: TStringField
      FieldName = 'organ_sysid'
    end
    object mlicnscombakissueorgan_name: TStringField
      FieldName = 'organ_sysid_name'
      Size = 60
    end
  end
  object mlicnscom: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 448
    Top = 216
    object mlicnscomissueorgan: TStringField
      FieldName = 'organ_sysid'
    end
    object mlicnscomissueorgan_name: TStringField
      FieldName = 'organ_sysid_name'
      Size = 60
    end
  end
  object mlicnscomd: TDataSource
    DataSet = mlicnscom
    Left = 476
    Top = 216
  end
  object mlicnspsnbak: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 504
    Top = 216
    object mlicnspsnbaklicnspsn: TStringField
      FieldName = 'licnspsn'
    end
    object mlicnspsnbaklicnspsn_name: TStringField
      FieldName = 'licnspsn_name'
      Size = 30
    end
    object mlicnspsnbakcardid: TStringField
      FieldName = 'cardid'
    end
  end
  object mlicnspsn: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 532
    Top = 216
    object mlicnspsnlicnspsn: TStringField
      FieldName = 'licnspsn'
    end
    object mlicnspsnlicnspsn_name: TStringField
      FieldName = 'licnspsn_name'
      Size = 30
    end
    object mlicnspsncardid: TStringField
      FieldName = 'cardid'
    end
  end
  object mlicnspsnd: TDataSource
    DataSet = mlicnspsn
    Left = 560
    Top = 216
  end
  object mprjorganbak: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 420
    Top = 244
    object mprjorganbaktestorgan: TStringField
      FieldName = 'test_organ_sysid'
    end
    object mprjorganbaktestorgan_name: TStringField
      FieldName = 'test_organ_name'
      Size = 60
    end
    object mprjorganbakauthorgan: TStringField
      FieldName = 'auth_organ_sysid'
    end
    object mprjorganbakauthorgan_name: TStringField
      FieldName = 'auth_organ_name'
      Size = 60
    end
  end
  object mprjorgan: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 448
    Top = 244
    object mprjorgantestorgan: TStringField
      FieldName = 'test_organ_sysid'
    end
    object mprjorgantestorgan_name: TStringField
      FieldName = 'test_organ_name'
      Size = 60
    end
    object mprjorganauthorgan: TStringField
      FieldName = 'auth_organ_sysid'
    end
    object mprjorganauthorgan_name: TStringField
      FieldName = 'auth_organ_name'
      Size = 60
    end
  end
  object mprjorgand: TDataSource
    DataSet = mprjorgan
    Left = 476
    Top = 244
  end
  object mengagecombak: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 504
    Top = 244
    object mengagecombakorgan_sysid: TStringField
      FieldName = 'organ_sysid'
    end
    object mengagecombakorgan_sysid_name: TStringField
      FieldName = 'organ_sysid_name'
      Size = 60
    end
  end
  object mengagecom: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 532
    Top = 244
    object mengagecomorgan_sysid: TStringField
      FieldName = 'organ_sysid'
    end
    object mengagecomorgan_sysid_name: TStringField
      FieldName = 'organ_sysid_name'
      Size = 60
    end
  end
  object mengagecomd: TDataSource
    DataSet = mengagecom
    Left = 560
    Top = 244
  end
  object mchkorganbak: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 588
    Top = 244
    object mchkorganbakcheck_organ_sysid: TStringField
      FieldName = 'check_organ_sysid'
    end
    object mchkorganbakcheck_organ_sysid_name: TStringField
      FieldName = 'check_organ_sysid_name'
      Size = 60
    end
  end
  object mchkorgan: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 616
    Top = 244
    object mchkorgancheck_organ_sysid: TStringField
      FieldName = 'check_organ_sysid'
    end
    object mchkorgancheck_organ_sysid_name: TStringField
      FieldName = 'check_organ_sysid_name'
      Size = 60
    end
  end
  object mchkorgand: TDataSource
    DataSet = mchkorgan
    Left = 644
    Top = 244
  end
  object frReport: TfrReport
    Dataset = frLicnsPrj
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Left = 232
    Top = 272
    ReportForm = {18000000}
  end
  object frPsnLicns: TfrDBDataSet
    DataSource = mPsnlicnsd
    Left = 260
    Top = 272
  end
  object frLicnsPrj: TfrDBDataSet
    DataSource = mLicnsPrjd
    Left = 288
    Top = 272
  end
  object frLicnsEng: TfrDBDataSet
    DataSource = mLicnsEngd
    Left = 316
    Top = 272
  end
  object frLicnsChk: TfrDBDataSet
    DataSource = mLicnsChkd
    Left = 344
    Top = 272
  end
  object mPsnlicns: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 260
    Top = 300
    object mPsnlicnsname: TStringField
      FieldName = 'name'
      Size = 30
    end
    object mPsnlicnscardid: TStringField
      FieldName = 'cardid'
    end
    object mPsnlicnslicns_category_name: TStringField
      FieldName = 'licns_category_name'
      Size = 30
    end
    object mPsnlicnslicnsno: TStringField
      FieldName = 'licnsno'
    end
    object mPsnlicnsissueorgan_name: TStringField
      FieldName = 'issueorgan_name'
      Size = 60
    end
  end
  object mLicnsPrj: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 288
    Top = 300
    object mLicnsPrjlicnsprj_name: TStringField
      FieldName = 'licnsprj_name'
      Size = 60
    end
    object mLicnsPrjtestorgan_name: TStringField
      FieldName = 'testorgan_name'
      Size = 60
    end
    object mLicnsPrjauthorgan_name: TStringField
      FieldName = 'authorgan_name'
      Size = 60
    end
    object mLicnsPrjauth_date: TStringField
      FieldName = 'auth_date'
      Size = 10
    end
    object mLicnsPrjend_date: TStringField
      FieldName = 'end_date'
      Size = 10
    end
  end
  object mLicnsEng: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 316
    Top = 300
  end
  object mLicnsChk: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 344
    Top = 300
  end
  object mPsnlicnsd: TDataSource
    DataSet = mPsnlicns
    Left = 260
    Top = 328
  end
  object mLicnsPrjd: TDataSource
    DataSet = mLicnsPrj
    Left = 288
    Top = 328
  end
  object mLicnsEngd: TDataSource
    DataSet = mLicnsEng
    Left = 316
    Top = 328
  end
  object mLicnsChkd: TDataSource
    DataSet = mLicnsChk
    Left = 344
    Top = 328
  end
end
