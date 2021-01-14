object frmDeviceManage: TfrmDeviceManage
  Left = 51
  Top = 94
  Width = 748
  Height = 478
  Caption = #35774#22791#31649#29702
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
  object Panel1: TPanel
    Left = 0
    Top = 423
    Width = 740
    Height = 28
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 1
    object Panel5: TPanel
      Left = 585
      Top = 1
      Width = 154
      Height = 26
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 4
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
    object bbtnGenerateId: TBitBtn
      Left = 3
      Top = 3
      Width = 80
      Height = 22
      Hint = #33258#21160#29983#25104#24517#35201#30340#32534#21495
      Caption = #29983#25104#32534#21495
      TabOrder = 0
      OnClick = bbtnGenerateIdClick
      Glyph.Data = {
        42020000424D4202000000000000420000002800000010000000100000000100
        1000030000000002000000000000000000000000000000000000007C0000E003
        00001F000000FF7FFF7FFF7F0000000000000000000000000000000000000000
        00000000FF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        FF7F0000FF7FFF7FFF7FFF7F0000FF7FF75EF75EF75EF75EF75EF75EF75EFF7F
        FF7F0000FF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        FF7F0000FF7FFF7FFF7FFF7F0000FF7FF75EF75EF75EFF7FF75EF75EF75EFF7F
        FF7F0000FF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FF75EF75EF75EFF7F
        FF7F0000FF7FFF7FFF7FFF7F0000FF7FF75EF75EF75EFF7FF75EF75EF75EFF7F
        FF7F0000FF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7F
        FF7F0000FF7FFF7FFF7FFF7F0000FF7FF75E003C003C0000FF7FFF7FFF7FFF7F
        FF7F0000FF7FFF7FFF7FFF7F00000000003C003C003C0000FF7F000000000000
        00000000FF7FFF7FFF7FFF7F0000003C007C007C007C0000FF7F0000FF7FFF7F
        0000FF7FFF7FFF7FFF7FFF7F003C003C007C003C0000FF7FFF7F0000FF7F0000
        FF7FFF7FFF7FFF7FFF7F003C007C007C003C007C0000FF7FFF7F00000000FF7F
        FF7FFF7FFF7FFF7F003C007C007C003C007C00000000000000000000FF7FFF7F
        FF7FFF7FFF7F003C007C003C003C003C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
        FF7FFF7FFF7F003C003C003C003CFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        FF7FFF7FFF7F}
    end
    object bbtnPrint: TBitBtn
      Left = 85
      Top = 3
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
    object bbtnExport: TBitBtn
      Left = 167
      Top = 3
      Width = 60
      Height = 22
      Hint = #23548#20986#21015#34920#21306#22495#20013#36873#20013#30340#25968#25454
      Caption = #23548#20986
      TabOrder = 2
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
    object bbtnReplaceDevice: TBitBtn
      Left = 229
      Top = 3
      Width = 60
      Height = 22
      Hint = #21512#24182#35774#22791#21488#24080#20449#24687
      Caption = #21512#24182
      TabOrder = 3
      OnClick = bbtnReplaceDeviceClick
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
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 740
    Height = 423
    Align = alClient
    BevelOuter = bvLowered
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 0
    object pagDetail: TPageControl
      Left = 1
      Top = 1
      Width = 738
      Height = 421
      ActivePage = tsBaseInfo
      Align = alClient
      HotTrack = True
      MultiLine = True
      TabIndex = 0
      TabOrder = 0
      OnChange = pagDetailChange
      OnChanging = pagDetailChanging
      object tsBaseInfo: TTabSheet
        Caption = #35774#22791#22522#26412#20449#24687
        object spList: TSplitter
          Left = 0
          Top = 262
          Width = 730
          Height = 3
          Cursor = crSizeNS
          Align = alBottom
        end
        object scrbBaseInfo: TScrollBox
          Left = 0
          Top = 0
          Width = 730
          Height = 262
          Align = alClient
          BevelInner = bvNone
          BevelKind = bkSoft
          BorderStyle = bsNone
          TabOrder = 0
          object Label1: TLabel
            Left = 8
            Top = 8
            Width = 84
            Height = 12
            Caption = #35774#22791#27880#20876#20195#30721#65306
          end
          object labLiberId: TLabel
            Left = 424
            Top = 31
            Width = 96
            Height = 12
            Caption = #26222#26597#30331#35760#34920#32534#21495#65306
          end
          object labCustomId: TLabel
            Left = 32
            Top = 31
            Width = 60
            Height = 12
            Caption = #27969#27700#32534#21495#65306
          end
          object Label7: TLabel
            Left = 32
            Top = 54
            Width = 60
            Height = 12
            Caption = #35774#22791#31867#21035#65306
          end
          object Label8: TLabel
            Left = 582
            Top = 77
            Width = 60
            Height = 12
            Caption = #21551#23553#26085#26399#65306
          end
          object Label23: TLabel
            Left = 33
            Top = 77
            Width = 60
            Height = 12
            Caption = #25237#29992#26085#26399#65306
          end
          object labDevInnerId: TLabel
            Left = 241
            Top = 31
            Width = 84
            Height = 12
            Caption = #35774#22791#20869#37096#32534#21495#65306
          end
          object Label4: TLabel
            Left = 33
            Top = 100
            Width = 60
            Height = 12
            Caption = #30417#23519#26426#26500#65306
          end
          object Label5: TLabel
            Left = 341
            Top = 100
            Width = 84
            Height = 12
            Caption = #27880#20876#30331#35760#20154#21592#65306
          end
          object Label6: TLabel
            Left = 553
            Top = 100
            Width = 84
            Height = 12
            Caption = #27880#20876#30331#35760#26085#26399#65306
          end
          object Label9: TLabel
            Left = 33
            Top = 123
            Width = 60
            Height = 12
            Caption = #20351#29992#21333#20301#65306
          end
          object Label10: TLabel
            Left = 341
            Top = 123
            Width = 84
            Height = 12
            Caption = #20351#29992#21333#20301#20195#30721#65306
          end
          object Label11: TLabel
            Left = 220
            Top = 146
            Width = 60
            Height = 12
            Caption = #37038#25919#32534#30721#65306
          end
          object Label24: TLabel
            Left = 553
            Top = 123
            Width = 84
            Height = 12
            Caption = #23433#20840#31649#29702#37096#38376#65306
          end
          object Label25: TLabel
            Left = 377
            Top = 146
            Width = 48
            Height = 12
            Caption = #32852#31995#20154#65306
          end
          object Label41: TLabel
            Left = 33
            Top = 146
            Width = 60
            Height = 12
            Caption = #32852#31995#30005#35805#65306
          end
          object Label20: TLabel
            Left = 33
            Top = 253
            Width = 60
            Height = 12
            Caption = #21046#36896#21333#20301#65306
          end
          object Label21: TLabel
            Left = 33
            Top = 276
            Width = 60
            Height = 12
            Caption = #23433#35013#21333#20301#65306
          end
          object Label22: TLabel
            Left = 33
            Top = 299
            Width = 60
            Height = 12
            Caption = #32500#20445#21333#20301#65306
          end
          object Label27: TLabel
            Left = 341
            Top = 299
            Width = 60
            Height = 12
            Caption = #35774#35745#21333#20301#65306
          end
          object Label28: TLabel
            Left = 341
            Top = 253
            Width = 60
            Height = 12
            Caption = #20135#26435#21333#20301#65306
          end
          object Label29: TLabel
            Left = 341
            Top = 276
            Width = 60
            Height = 12
            Caption = #26816#39564#21333#20301#65306
          end
          object Label30: TLabel
            Left = 9
            Top = 322
            Width = 84
            Height = 12
            Caption = #22303#24314#26045#24037#21333#20301#65306
          end
          object Label31: TLabel
            Left = 9
            Top = 345
            Width = 84
            Height = 12
            Caption = #22303#24314#39564#25910#21333#20301#65306
          end
          object Label33: TLabel
            Left = 528
            Top = 322
            Width = 84
            Height = 12
            Caption = #24320#22987#26045#24037#26085#26399#65306
          end
          object Label34: TLabel
            Left = 528
            Top = 345
            Width = 84
            Height = 12
            Caption = #31459#24037#39564#25910#26085#26399#65306
          end
          object Label37: TLabel
            Left = 341
            Top = 345
            Width = 60
            Height = 12
            Caption = #32500#20445#21608#26399#65306
          end
          object Label39: TLabel
            Left = 341
            Top = 322
            Width = 60
            Height = 12
            Caption = #25805#20316#20154#21592#65306
          end
          object Label32: TLabel
            Left = 9
            Top = 368
            Width = 84
            Height = 12
            Caption = #39564#25910#26816#39564#26426#26500#65306
          end
          object Label35: TLabel
            Left = 528
            Top = 368
            Width = 84
            Height = 12
            Caption = #39564#25910#25253#21578#32534#21495#65306
          end
          object Label36: TLabel
            Left = 540
            Top = 391
            Width = 72
            Height = 12
            Caption = #39033#30446#36127#36131#20154#65306
          end
          object Label38: TLabel
            Left = 341
            Top = 368
            Width = 60
            Height = 12
            Caption = #22823#20462#21608#26399#65306
          end
          object Label26: TLabel
            Left = 341
            Top = 391
            Width = 60
            Height = 12
            Caption = #36866#29992#22330#21512#65306
          end
          object Label43: TLabel
            Left = 575
            Top = 146
            Width = 60
            Height = 12
            Caption = #35774#22791#29366#24577#65306
          end
          object labDevName: TLabel
            Left = 242
            Top = 54
            Width = 60
            Height = 12
            Caption = #23481#22120#21517#31216#65306
          end
          object labDevKind: TLabel
            Left = 460
            Top = 54
            Width = 60
            Height = 12
            Caption = #23481#22120#20998#31867#65306
          end
          object labPressureRate: TLabel
            Left = 612
            Top = 54
            Width = 60
            Height = 12
            Caption = #21387#21147#31561#32423#65306
          end
          object labUseCertId: TLabel
            Left = 242
            Top = 8
            Width = 72
            Height = 12
            Caption = #20351#29992#35777#32534#21495#65306
          end
          object Label2: TLabel
            Left = 216
            Top = 77
            Width = 60
            Height = 12
            Caption = #20572#29992#26085#26399#65306
          end
          object Label3: TLabel
            Left = 399
            Top = 77
            Width = 60
            Height = 12
            Caption = #25253#24223#26085#26399#65306
          end
          object eLiberId: TDBEditEh
            Left = 520
            Top = 28
            Width = 83
            Height = 18
            Ctl3D = False
            DataField = 'liber_id'
            DataSource = BaseInfod
            EditButtons = <>
            ParentCtl3D = False
            TabOrder = 0
            Visible = True
          end
          object eCustomId: TDBEditEh
            Left = 92
            Top = 28
            Width = 143
            Height = 18
            Color = clSkyBlue
            Ctl3D = False
            DataField = 'custom_id'
            DataSource = BaseInfod
            EditButtons = <>
            ParentCtl3D = False
            TabOrder = 1
            Visible = True
          end
          object lcmbDeviceCode: TDBLookupComboboxEh
            Left = 92
            Top = 51
            Width = 143
            Height = 18
            Color = clSkyBlue
            Ctl3D = False
            DataField = 'dev_code_id'
            DataSource = BaseInfod
            EditButtons = <>
            KeyField = 'id'
            ListField = 'name'
            ListSource = DeviceCoded
            ParentCtl3D = False
            TabOrder = 2
            Visible = True
            OnChange = lcmbDeviceCodeChange
            OnKeyValueChanged = lcmbDeviceCodeKeyValueChanged
          end
          object CSdxDBDateEdit2: TCSdxDBDateEdit
            Left = 641
            Top = 73
            Width = 115
            Style.BorderStyle = xbsSingle
            Style.ButtonStyle = btsFlat
            TabOrder = 3
            DataField = 'reuse_date'
            DataSource = BaseInfod
            StyleController = dmData.dxStyleCtrl
            DateOnError = deToday
            FixedDateFormat = 'yyyy-MM-dd'
            StoredValues = 4
          end
          object CSdxDBDateEdit3: TCSdxDBDateEdit
            Left = 92
            Top = 73
            Width = 115
            Style.BorderStyle = xbsSingle
            Style.ButtonStyle = btsFlat
            TabOrder = 4
            DataField = 'run_date'
            DataSource = BaseInfod
            StyleController = dmData.dxStyleCtrl
            DateOnError = deToday
            FixedDateFormat = 'yyyy-MM-dd'
            StoredValues = 4
          end
          object eDevInnerId: TDBEditEh
            Left = 325
            Top = 28
            Width = 92
            Height = 18
            Ctl3D = False
            DataField = 'dev_inner_id'
            DataSource = BaseInfod
            EditButtons = <>
            ParentCtl3D = False
            TabOrder = 5
            Visible = True
          end
          object eRegId: TDBEditEh
            Left = 92
            Top = 5
            Width = 143
            Height = 18
            Color = clSkyBlue
            Ctl3D = False
            DataField = 'reg_id'
            DataSource = BaseInfod
            EditButtons = <>
            MaxLength = 23
            ParentCtl3D = False
            TabOrder = 6
            Visible = True
            EditMask = '9999-999999-999999-9999;0; '
          end
          object lcmbSuperviseOrg: TDBLookupComboboxEh
            Left = 93
            Top = 97
            Width = 241
            Height = 18
            Color = clSkyBlue
            Ctl3D = False
            DataField = 'supervise_id'
            DataSource = BaseInfod
            EditButton.Visible = False
            EditButtons = <
              item
                Style = ebsEllipsisEh
                OnClick = lcmbSuperviseOrgEditButtons0Click
              end>
            KeyField = 'supervise_id'
            ListField = 'supervise_name'
            ListSource = mComInfod
            ParentCtl3D = False
            TabOrder = 7
            Visible = True
          end
          object eRegPerson: TDBEditEh
            Left = 425
            Top = 97
            Width = 120
            Height = 18
            Ctl3D = False
            DataField = 'reg_person'
            DataSource = BaseInfod
            EditButtons = <>
            ParentCtl3D = False
            TabOrder = 8
            Visible = True
          end
          object lcmbUserCom: TDBLookupComboboxEh
            Left = 93
            Top = 120
            Width = 241
            Height = 18
            Color = clSkyBlue
            Ctl3D = False
            DataField = 'user_id'
            DataSource = BaseInfod
            EditButton.Visible = False
            EditButtons = <
              item
                Style = ebsEllipsisEh
                OnClick = lcmbUserComEditButtons0Click
              end>
            KeyField = 'user_id'
            ListField = 'user_name'
            ListSource = mComInfod
            ParentCtl3D = False
            TabOrder = 9
            Visible = True
          end
          object eUserId: TDBEditEh
            Left = 425
            Top = 120
            Width = 120
            Height = 18
            Ctl3D = False
            DataField = 'reg_id'
            EditButtons = <>
            Enabled = False
            ParentCtl3D = False
            TabOrder = 10
            Visible = True
          end
          object eZip: TDBEditEh
            Left = 280
            Top = 143
            Width = 90
            Height = 18
            Ctl3D = False
            DataField = 'dev_zip'
            DataSource = BaseInfod
            EditButtons = <>
            ParentCtl3D = False
            TabOrder = 11
            Visible = True
          end
          object eSafetyDept: TDBEditEh
            Left = 637
            Top = 120
            Width = 118
            Height = 18
            Ctl3D = False
            DataField = 'dev_safety_dept'
            DataSource = BaseInfod
            EditButtons = <>
            ParentCtl3D = False
            TabOrder = 12
            Visible = True
          end
          object eLinkman: TDBEditEh
            Left = 425
            Top = 143
            Width = 120
            Height = 18
            Ctl3D = False
            DataField = 'dev_linkman'
            DataSource = BaseInfod
            EditButtons = <>
            ParentCtl3D = False
            TabOrder = 13
            Visible = True
          end
          object CSdxDBDateEdit1: TCSdxDBDateEdit
            Left = 636
            Top = 96
            Width = 120
            Style.BorderStyle = xbsSingle
            Style.ButtonStyle = btsFlat
            TabOrder = 14
            DataField = 'reg_date'
            DataSource = BaseInfod
            StyleController = dmData.dxStyleCtrl
            DateOnError = deToday
            FixedDateFormat = 'yyyy-MM-dd'
            StoredValues = 4
          end
          object eTel: TDBEditEh
            Left = 93
            Top = 143
            Width = 120
            Height = 18
            Ctl3D = False
            DataField = 'dev_tel'
            DataSource = BaseInfod
            EditButtons = <>
            ParentCtl3D = False
            TabOrder = 15
            Visible = True
          end
          object GroupBox1: TGroupBox
            Left = 33
            Top = 207
            Width = 723
            Height = 39
            Caption = ' '#35774#22791#20351#29992#22320#22336' '
            TabOrder = 16
            object Label12: TLabel
              Left = 140
              Top = 16
              Width = 24
              Height = 12
              Caption = #24066#65306
            end
            object Label13: TLabel
              Left = 248
              Top = 16
              Width = 48
              Height = 12
              Caption = #21306'('#21439')'#65306
            end
            object Label14: TLabel
              Left = 380
              Top = 16
              Width = 60
              Height = 12
              Caption = #20351#29992#22330#25152#65306
            end
            object Label15: TLabel
              Left = 8
              Top = 16
              Width = 48
              Height = 12
              Caption = #30465'('#24066')'#65306
            end
            object lcmbDevProvince: TDBLookupComboboxEh
              Left = 56
              Top = 13
              Width = 77
              Height = 18
              Color = clSkyBlue
              Ctl3D = False
              DataField = 'province_id'
              DataSource = BaseInfod
              EditButtons = <>
              KeyField = 'id'
              ListField = 'name'
              ListSource = provinced
              ParentCtl3D = False
              TabOrder = 0
              Visible = True
              OnKeyValueChanged = lcmbDevProvinceKeyValueChanged
            end
            object lcmbDevCity: TDBLookupComboboxEh
              Left = 164
              Top = 13
              Width = 77
              Height = 18
              Color = clSkyBlue
              Ctl3D = False
              DataField = 'city_id'
              DataSource = BaseInfod
              EditButtons = <>
              KeyField = 'id'
              ListField = 'name'
              ListSource = cityd
              ParentCtl3D = False
              TabOrder = 1
              Visible = True
              OnKeyValueChanged = lcmbDevCityKeyValueChanged
            end
            object lcmbDevBorough: TDBLookupComboboxEh
              Left = 296
              Top = 13
              Width = 77
              Height = 18
              Color = clSkyBlue
              Ctl3D = False
              DataField = 'borough_id'
              DataSource = BaseInfod
              EditButtons = <>
              KeyField = 'id'
              ListField = 'name'
              ListSource = boroughd
              ParentCtl3D = False
              TabOrder = 2
              Visible = True
            end
            object eDevAddress: TDBEditEh
              Left = 440
              Top = 13
              Width = 275
              Height = 18
              Ctl3D = False
              DataField = 'dev_address'
              DataSource = BaseInfod
              EditButtons = <>
              ParentCtl3D = False
              TabOrder = 3
              Visible = True
            end
          end
          object GroupBox2: TGroupBox
            Left = 33
            Top = 166
            Width = 723
            Height = 39
            Caption = ' '#20351#29992#21333#20301#22320#22336' '
            TabOrder = 17
            object Label16: TLabel
              Left = 140
              Top = 16
              Width = 24
              Height = 12
              Caption = #24066#65306
            end
            object Label17: TLabel
              Left = 248
              Top = 16
              Width = 48
              Height = 12
              Caption = #21306'('#21439')'#65306
            end
            object Label18: TLabel
              Left = 380
              Top = 16
              Width = 60
              Height = 12
              Caption = #20855#20307#22320#22336#65306
            end
            object Label19: TLabel
              Left = 8
              Top = 16
              Width = 48
              Height = 12
              Caption = #30465'('#24066')'#65306
            end
            object lcmbUserProvince: TDBLookupComboboxEh
              Left = 56
              Top = 13
              Width = 77
              Height = 18
              Ctl3D = False
              DataField = 'province_id'
              DataSource = UserComd
              Enabled = False
              EditButtons = <>
              KeyField = 'id'
              ListField = 'name'
              ListSource = provinced
              ParentCtl3D = False
              TabOrder = 0
              Visible = True
            end
            object lcmbUserCity: TDBLookupComboboxEh
              Left = 164
              Top = 13
              Width = 77
              Height = 18
              Ctl3D = False
              DataField = 'city_id'
              DataSource = UserComd
              Enabled = False
              EditButtons = <>
              KeyField = 'id'
              ListField = 'name'
              ListSource = cityd
              ParentCtl3D = False
              TabOrder = 1
              Visible = True
            end
            object lcmbUserBorough: TDBLookupComboboxEh
              Left = 296
              Top = 13
              Width = 77
              Height = 18
              Ctl3D = False
              DataField = 'borough_id'
              DataSource = UserComd
              Enabled = False
              EditButtons = <>
              KeyField = 'id'
              ListField = 'name'
              ListSource = boroughd
              ParentCtl3D = False
              TabOrder = 2
              Visible = True
            end
            object eAddress: TDBEditEh
              Left = 440
              Top = 13
              Width = 275
              Height = 18
              Ctl3D = False
              DataField = 'addr'
              DataSource = UserComd
              EditButtons = <>
              Enabled = False
              ParentCtl3D = False
              TabOrder = 3
              Visible = True
            end
          end
          object lcmbManuCom: TDBLookupComboboxEh
            Left = 93
            Top = 250
            Width = 241
            Height = 18
            Ctl3D = False
            DataField = 'manu_id'
            DataSource = BaseInfod
            EditButton.Visible = False
            EditButtons = <
              item
                Style = ebsEllipsisEh
                OnClick = lcmbManuComEditButtons0Click
              end>
            KeyField = 'manu_id'
            ListField = 'manu_name'
            ListSource = mComInfod
            ParentCtl3D = False
            TabOrder = 18
            Visible = True
          end
          object lcmbInstCom: TDBLookupComboboxEh
            Left = 93
            Top = 273
            Width = 241
            Height = 18
            Ctl3D = False
            DataField = 'inst_id'
            DataSource = BaseInfod
            EditButton.Visible = False
            EditButtons = <
              item
                Style = ebsEllipsisEh
                OnClick = lcmbInstComEditButtons0Click
              end>
            KeyField = 'inst_id'
            ListField = 'inst_name'
            ListSource = mComInfod
            ParentCtl3D = False
            TabOrder = 19
            Visible = True
          end
          object lcmbRepairCom: TDBLookupComboboxEh
            Left = 93
            Top = 296
            Width = 241
            Height = 18
            Ctl3D = False
            DataField = 'repair_id'
            DataSource = BaseInfod
            EditButton.Visible = False
            EditButtons = <
              item
                Style = ebsEllipsisEh
                OnClick = lcmbRepairComEditButtons0Click
              end>
            KeyField = 'repair_id'
            ListField = 'repair_name'
            ListSource = mComInfod
            ParentCtl3D = False
            TabOrder = 20
            Visible = True
          end
          object lcmbDesignCom: TDBLookupComboboxEh
            Left = 401
            Top = 296
            Width = 241
            Height = 18
            Ctl3D = False
            DataField = 'design_id'
            DataSource = BaseInfod
            EditButton.Visible = False
            EditButtons = <
              item
                Style = ebsEllipsisEh
                OnClick = lcmbDesignComEditButtons0Click
              end>
            KeyField = 'design_id'
            ListField = 'design_name'
            ListSource = mComInfod
            ParentCtl3D = False
            TabOrder = 21
            Visible = True
          end
          object lcmbPropertyCom: TDBLookupComboboxEh
            Left = 401
            Top = 250
            Width = 241
            Height = 18
            Ctl3D = False
            DataField = 'property_id'
            DataSource = BaseInfod
            EditButton.Visible = False
            EditButtons = <
              item
                Style = ebsEllipsisEh
                OnClick = lcmbPropertyComEditButtons0Click
              end>
            KeyField = 'property_id'
            ListField = 'property_name'
            ListSource = mComInfod
            ParentCtl3D = False
            TabOrder = 22
            Visible = True
          end
          object lcmbVerifyCom: TDBLookupComboboxEh
            Left = 401
            Top = 273
            Width = 241
            Height = 18
            Color = clSkyBlue
            Ctl3D = False
            DataField = 'verify_id'
            DataSource = BaseInfod
            EditButton.Visible = False
            EditButtons = <
              item
                Style = ebsEllipsisEh
                OnClick = lcmbVerifyComEditButtons0Click
              end>
            KeyField = 'verify_id'
            ListField = 'verify_name'
            ListSource = mComInfod
            ParentCtl3D = False
            TabOrder = 23
            Visible = True
          end
          object lcmbBuildCom: TDBLookupComboboxEh
            Left = 93
            Top = 319
            Width = 241
            Height = 18
            Ctl3D = False
            DataField = 'build_id'
            DataSource = BaseInfod
            EditButton.Visible = False
            EditButtons = <
              item
                Style = ebsEllipsisEh
                OnClick = lcmbBuildComEditButtons0Click
              end>
            KeyField = 'build_id'
            ListField = 'build_name'
            ListSource = mComInfod
            ParentCtl3D = False
            TabOrder = 24
            Visible = True
          end
          object lcmbBuildVerifyCom: TDBLookupComboboxEh
            Left = 93
            Top = 342
            Width = 241
            Height = 18
            Ctl3D = False
            DataField = 'buildverify_id'
            DataSource = BaseInfod
            EditButton.Visible = False
            EditButtons = <
              item
                Style = ebsEllipsisEh
                OnClick = lcmbBuildVerifyComEditButtons0Click
              end>
            KeyField = 'buildverify_id'
            ListField = 'buildverify_name'
            ListSource = mComInfod
            ParentCtl3D = False
            TabOrder = 25
            Visible = True
          end
          object DBEdit12: TDBEditEh
            Left = 401
            Top = 342
            Width = 120
            Height = 18
            Ctl3D = False
            DataField = 'wb_cycle'
            DataSource = BaseInfod
            EditButtons = <>
            ParentCtl3D = False
            TabOrder = 26
            Visible = True
          end
          object DBEdit14: TDBEditEh
            Left = 401
            Top = 319
            Width = 120
            Height = 18
            Ctl3D = False
            DataField = 'dev_operator'
            DataSource = BaseInfod
            EditButtons = <>
            ParentCtl3D = False
            TabOrder = 27
            Visible = True
          end
          object CSdxDBDateEdit4: TCSdxDBDateEdit
            Left = 612
            Top = 318
            Width = 121
            Style.BorderStyle = xbsSingle
            Style.ButtonStyle = btsFlat
            TabOrder = 28
            DataField = 'start_date'
            DataSource = BaseInfod
            StyleController = dmData.dxStyleCtrl
            DateOnError = deToday
            FixedDateFormat = 'yyyy-MM-dd'
            StoredValues = 4
          end
          object CSdxDBDateEdit5: TCSdxDBDateEdit
            Left = 612
            Top = 341
            Width = 121
            Style.BorderStyle = xbsSingle
            Style.ButtonStyle = btsFlat
            TabOrder = 29
            DataField = 'end_date'
            DataSource = BaseInfod
            StyleController = dmData.dxStyleCtrl
            DateOnError = deToday
            FixedDateFormat = 'yyyy-MM-dd'
            StoredValues = 4
          end
          object lcmbVerifyOrg: TDBLookupComboboxEh
            Left = 93
            Top = 365
            Width = 241
            Height = 18
            Ctl3D = False
            DataField = 'verifyorg_id'
            DataSource = BaseInfod
            EditButton.Visible = False
            EditButtons = <
              item
                Style = ebsEllipsisEh
                OnClick = lcmbVerifyOrgEditButtons0Click
              end>
            KeyField = 'verifyorg_id'
            ListField = 'verifyorg_name'
            ListSource = mComInfod
            ParentCtl3D = False
            TabOrder = 30
            Visible = True
          end
          object DBEdit10: TDBEditEh
            Left = 612
            Top = 365
            Width = 120
            Height = 18
            Ctl3D = False
            DataField = 'ys_report_id'
            DataSource = BaseInfod
            EditButtons = <>
            ParentCtl3D = False
            TabOrder = 31
            Visible = True
          end
          object DBEdit11: TDBEditEh
            Left = 612
            Top = 388
            Width = 120
            Height = 18
            Ctl3D = False
            DataField = 'project_manager'
            DataSource = BaseInfod
            EditButtons = <>
            ParentCtl3D = False
            TabOrder = 32
            Visible = True
          end
          object DBEdit13: TDBEditEh
            Left = 401
            Top = 365
            Width = 120
            Height = 18
            Ctl3D = False
            DataField = 'dx_cycle'
            DataSource = BaseInfod
            EditButtons = <>
            ParentCtl3D = False
            TabOrder = 33
            Visible = True
          end
          object DBEdit9: TDBEditEh
            Left = 401
            Top = 388
            Width = 120
            Height = 18
            Ctl3D = False
            DataField = 'fit_situation'
            DataSource = BaseInfod
            EditButtons = <>
            ParentCtl3D = False
            TabOrder = 34
            Visible = True
          end
          object eDevName: TDBEditEh
            Left = 302
            Top = 51
            Width = 151
            Height = 18
            Color = clSkyBlue
            Ctl3D = False
            DataField = 'dev_name'
            DataSource = BaseInfod
            EditButtons = <>
            ParentCtl3D = False
            TabOrder = 35
            Visible = True
          end
          object eDevKind: TdxDBPickEdit
            Left = 519
            Top = 50
            Width = 84
            Style.BorderStyle = xbsSingle
            Style.ButtonStyle = btsFlat
            TabOrder = 36
            DataField = 'dev_kind'
            DataSource = BaseInfod
            StyleController = dmData.dxStyleCtrl
            DropDownListStyle = True
            Items.Strings = (
              #8544
              #8545
              #8546)
          end
          object ePressureRate: TdxDBPickEdit
            Left = 671
            Top = 50
            Width = 84
            Style.BorderStyle = xbsSingle
            Style.ButtonStyle = btsFlat
            TabOrder = 37
            DataField = 'pressure_rate'
            DataSource = BaseInfod
            StyleController = dmData.dxStyleCtrl
            DropDownListStyle = True
            Items.Strings = (
              'H'
              'M'
              'L')
          end
          object eUseCertId: TDBEditEh
            Left = 314
            Top = 5
            Width = 143
            Height = 18
            Color = clSkyBlue
            Ctl3D = False
            DataField = 'use_cert_id'
            DataSource = BaseInfod
            EditButtons = <>
            ParentCtl3D = False
            TabOrder = 38
            Visible = True
          end
          object CSdxDBDateEdit6: TCSdxDBDateEdit
            Left = 275
            Top = 73
            Width = 115
            Style.BorderStyle = xbsSingle
            Style.ButtonStyle = btsFlat
            TabOrder = 39
            DataField = 'stop_date'
            DataSource = BaseInfod
            StyleController = dmData.dxStyleCtrl
            DateOnError = deToday
            FixedDateFormat = 'yyyy-MM-dd'
            StoredValues = 4
          end
          object CSdxDBDateEdit7: TCSdxDBDateEdit
            Left = 458
            Top = 73
            Width = 115
            Style.BorderStyle = xbsSingle
            Style.ButtonStyle = btsFlat
            TabOrder = 40
            DataField = 'reject_date'
            DataSource = BaseInfod
            StyleController = dmData.dxStyleCtrl
            DateOnError = deToday
            FixedDateFormat = 'yyyy-MM-dd'
            StoredValues = 4
          end
          object lcmbDevState: TDBLookupComboboxEh
            Left = 636
            Top = 143
            Width = 119
            Height = 18
            Color = clSkyBlue
            Ctl3D = False
            DataField = 'dev_state'
            DataSource = BaseInfod
            EditButtons = <>
            KeyField = 'id'
            ListField = 'name'
            ListSource = DevStated
            ParentCtl3D = False
            TabOrder = 41
            Visible = True
            OnChange = lcmbDeviceCodeChange
            OnKeyValueChanged = lcmbDeviceCodeKeyValueChanged
          end
        end
        object grdList: TDBGridEh
          Left = 0
          Top = 265
          Width = 730
          Height = 79
          Align = alBottom
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
          OnDblClick = grdListDblClick
          OnGetCellParams = grdListGetCellParams
          Columns = <
            item
              EditButtons = <>
              FieldName = 'reg_id'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
            end
            item
              EditButtons = <>
              FieldName = 'use_cert_id'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
            end
            item
              EditButtons = <>
              FieldName = 'custom_id'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
            end
            item
              EditButtons = <>
              FieldName = 'dev_inner_id'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
            end
            item
              EditButtons = <>
              FieldName = 'dev_code'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 92
            end
            item
              EditButtons = <>
              FieldName = 'dev_code_name'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 193
            end
            item
              EditButtons = <>
              FieldName = 'user_name'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 250
            end
            item
              EditButtons = <>
              FieldName = 'inst_name'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 250
            end
            item
              EditButtons = <>
              FieldName = 'manu_name'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 250
            end
            item
              EditButtons = <>
              FieldName = 'repair_name'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 250
            end
            item
              EditButtons = <>
              FieldName = 'property_name'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 250
            end
            item
              EditButtons = <>
              FieldName = 'province_name'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'city_name'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'borough_name'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'dev_address'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
            end
            item
              EditButtons = <>
              FieldName = 'dev_safety_dept'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 120
            end
            item
              EditButtons = <>
              FieldName = 'dev_linkman'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
            end
            item
              EditButtons = <>
              FieldName = 'dev_tel'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'dev_fax'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'dev_zip'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 80
            end
            item
              EditButtons = <>
              FieldName = 'run_date'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'verify_start_date'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'verify_type_name'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 150
            end
            item
              EditButtons = <>
              FieldName = 'manual_verify_result_name'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 150
            end
            item
              EditButtons = <>
              FieldName = 'next_verify_date'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'dev_state_name'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
            end>
        end
        object Panel2: TPanel
          Left = 0
          Top = 366
          Width = 730
          Height = 28
          Align = alBottom
          BevelOuter = bvLowered
          TabOrder = 3
          object Panel4: TPanel
            Left = 277
            Top = 1
            Width = 452
            Height = 26
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 3
            object bbtnListInsert: TBitBtn
              Left = 0
              Top = 2
              Width = 50
              Height = 22
              Hint = #28155#21152#35760#24405
              Caption = #28155#21152
              TabOrder = 0
              OnClick = bbtnListInsertClick
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
            object bbtnListDelete: TBitBtn
              Left = 50
              Top = 2
              Width = 50
              Height = 22
              Hint = #21024#38500#35760#24405
              Caption = #21024#38500
              TabOrder = 1
              OnClick = bbtnListDeleteClick
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
              DataSource = BaseInfod
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
        object rcpList: TCSRowCountPanel
          Left = 0
          Top = 344
          Width = 730
          Align = alBottom
          TabOrder = 2
          CaptionFormat = ' '#35760#24405#25968#65306'%d'
          DataSource = Listd
        end
      end
      object tsTechInfo: TTabSheet
        Caption = #35774#22791#25216#26415#21442#25968
        ImageIndex = 1
      end
      object tsVerifyInfo: TTabSheet
        Caption = #35774#22791#26816#39564#20449#24687
        ImageIndex = 2
        object grdVerifyInfo: TDBGridEh
          Left = 0
          Top = 0
          Width = 730
          Height = 344
          Align = alClient
          AllowedOperations = []
          AllowedSelections = [gstRecordBookmarks, gstRectangle, gstAll]
          DataSource = VerifyInfod
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
          TabOrder = 0
          TitleFont.Charset = GB2312_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          Columns = <
            item
              EditButtons = <>
              FieldName = 'accept_date'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'verify_plan_custom_id'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
            end
            item
              EditButtons = <>
              FieldName = 'main_checker'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'checker1'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'checker2'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'checker3'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'checker4'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'verify_start_date'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'verify_end_date'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'input_date'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 146
            end
            item
              EditButtons = <>
              FieldName = 'inputor'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'first_audit_date'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'first_auditor'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'second_audit_date'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'second_auditor'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'third_audit_date'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'third_auditor'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'report_print_date'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'refit_return_date'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'cert_begin_date'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 144
            end
            item
              EditButtons = <>
              FieldName = 'cert_end_date'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 146
            end
            item
              EditButtons = <>
              FieldName = 'cert_print_date'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'get_cert_date'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'next_verify_date'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'verify_type_name'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'next_verify_type_name'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'verify_result_name'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'manual_verify_result_name'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'report_custom_id'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
            end
            item
              EditButtons = <>
              FieldName = 'refit_times'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
            end
            item
              EditButtons = <>
              FieldName = 'master_problem_name'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 200
            end
            item
              EditButtons = <>
              FieldName = 'is_case'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
            end>
        end
        object Panel6: TPanel
          Left = 0
          Top = 366
          Width = 730
          Height = 28
          Align = alBottom
          BevelOuter = bvLowered
          TabOrder = 1
          object Panel7: TPanel
            Left = 327
            Top = 1
            Width = 402
            Height = 26
            Align = alRight
            BevelOuter = bvNone
            BorderWidth = 2
            TabOrder = 3
            object navVerify: TCSDBNavigator
              Left = 150
              Top = 2
              Width = 250
              Height = 22
              DataSource = VerifyInfod
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
              TabOrder = 0
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
          object bbtnVerifyColumn: TBitBtn
            Left = 127
            Top = 3
            Width = 70
            Height = 22
            Hint = #25511#21046#21015#34920#21306#22495#30340#26174#31034#39118#26684
            Caption = #21015#25511#21046
            TabOrder = 2
            OnClick = bbtnVerifyColumnClick
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
          object bbtnVerifyFilter: TBitBtn
            Left = 65
            Top = 3
            Width = 60
            Height = 22
            Hint = #36807#28388#35760#24405
            Caption = #36807#28388
            TabOrder = 1
            OnClick = bbtnVerifyFilterClick
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
          object bbtnVerifyFind: TBitBtn
            Left = 3
            Top = 3
            Width = 60
            Height = 22
            Hint = #26597#25214#35760#24405
            Caption = #26597#25214
            TabOrder = 0
            OnClick = bbtnVerifyFindClick
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
        end
        object CSRowCountPanel1: TCSRowCountPanel
          Left = 0
          Top = 344
          Width = 730
          Align = alBottom
          TabOrder = 2
          CaptionFormat = ' '#35760#24405#25968#65306'%d'
          DataSource = VerifyInfod
        end
      end
      object tsDeviceLog: TTabSheet
        Caption = #35774#22791#26085#24535#20449#24687
        ImageIndex = 3
        TabVisible = False
        object Panel10: TPanel
          Left = 0
          Top = 366
          Width = 730
          Height = 28
          Align = alBottom
          BevelOuter = bvLowered
          TabOrder = 1
          object bbtnLogPrint: TBitBtn
            Left = 3
            Top = 3
            Width = 80
            Height = 22
            Hint = #25171#21360#35774#22791#26085#24535
            Caption = #26085#24535#25171#21360
            TabOrder = 0
            OnClick = bbtnLogPrintClick
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
          object Panel11: TPanel
            Left = 527
            Top = 1
            Width = 202
            Height = 26
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 1
            object navDeviceLog: TCSDBNavigator
              Left = 0
              Top = 2
              Width = 200
              Height = 22
              DataSource = DeviceLogd
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
              TabOrder = 0
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
        end
        object grdDeviceLog: TDBGridEh
          Left = 0
          Top = 0
          Width = 730
          Height = 366
          Align = alClient
          DataSource = DeviceLogd
          Flat = True
          FooterColor = clWindow
          FooterFont.Charset = GB2312_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -12
          FooterFont.Name = #23435#20307
          FooterFont.Style = []
          InternalSort = True
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking]
          TabOrder = 0
          TitleFont.Charset = GB2312_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          Columns = <
            item
              EditButtons = <>
              FieldName = 'device_id'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Visible = False
              Width = 126
            end
            item
              EditButtons = <>
              FieldName = 'device_reg_id'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
            end
            item
              EditButtons = <>
              FieldName = 'device_custom_id'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 90
            end
            item
              EditButtons = <>
              FieldName = 'user_id'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 120
            end
            item
              EditButtons = <>
              FieldName = 'operation_type'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
            end
            item
              EditButtons = <>
              FieldName = 'operation_time'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 130
            end
            item
              EditButtons = <>
              FieldName = 'operation_machine'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 150
            end
            item
              EditButtons = <>
              FieldName = 'operation_content'
              Footers = <>
              Title.Alignment = taCenter
              Title.TitleButton = True
              Width = 300
            end>
        end
      end
    end
  end
  object List: TCSADOQuery
    CacheSize = 1
    Connection = dmData.adocon
    CursorType = ctStatic
    LockType = ltReadOnly
    AfterOpen = ListAfterOpen
    BeforeScroll = ListBeforeScroll
    AfterScroll = ListAfterScroll
    CommandTimeOut = 300
    Parameters = <>
    SQL.Strings = (
      'device.usp_getdevicedata')
    Left = 18
    Top = 310
    object Listid: TStringField
      DisplayLabel = #31995#32479#20195#30721
      FieldName = 'id'
    end
    object Listreg_id: TStringField
      DisplayLabel = #35774#22791#27880#20876#20195#30721
      FieldName = 'reg_id'
      Size = 23
    end
    object Listuse_cert_id: TStringField
      DisplayLabel = #20351#29992#35777#32534#21495
      FieldName = 'use_cert_id'
    end
    object Listcustom_id: TStringField
      DisplayLabel = #35774#22791#27969#27700#21495
      FieldName = 'custom_id'
    end
    object Listdev_inner_id: TStringField
      DisplayLabel = #35774#22791#20869#37096#32534#21495
      FieldName = 'dev_inner_id'
    end
    object Listdev_code_id: TStringField
      DisplayLabel = #35774#22791#31867#21035#31995#32479#20195#30721
      FieldName = 'dev_code_id'
      Size = 4
    end
    object Listdev_code: TStringField
      DisplayLabel = #35774#22791#31867#21035#20195#30721
      FieldName = 'dev_code'
      Size = 6
    end
    object Listdev_code_name: TStringField
      DisplayLabel = #35774#22791#31867#21035
      FieldName = 'dev_code_name'
      Size = 50
    end
    object Listuser_name: TStringField
      DisplayLabel = #20351#29992#21333#20301
      FieldName = 'user_name'
      Size = 60
    end
    object Listinst_name: TStringField
      DisplayLabel = #23433#35013#21333#20301
      FieldName = 'inst_name'
      Size = 60
    end
    object Listmanu_name: TStringField
      DisplayLabel = #21046#36896#21333#20301
      FieldName = 'manu_name'
      Size = 60
    end
    object Listrepair_name: TStringField
      DisplayLabel = #32500#20445#21333#20301
      FieldName = 'repair_name'
      Size = 60
    end
    object Listproperty_name: TStringField
      DisplayLabel = #20135#26435#21333#20301
      FieldName = 'property_name'
      Size = 60
    end
    object Listprovince_name: TStringField
      DisplayLabel = #30465
      FieldName = 'province_name'
      Size = 50
    end
    object Listcity_name: TStringField
      DisplayLabel = #24066
      FieldName = 'city_name'
      Size = 50
    end
    object Listborough_name: TStringField
      DisplayLabel = #21306
      FieldName = 'borough_name'
      Size = 50
    end
    object Listdev_address: TStringField
      DisplayLabel = #20351#29992#22330#25152
      FieldName = 'dev_address'
      Size = 60
    end
    object Listdev_safety_dept: TStringField
      DisplayLabel = #23433#20840#31649#29702#37096#38376
      FieldName = 'dev_safety_dept'
      Size = 50
    end
    object Listdev_linkman: TStringField
      DisplayLabel = #32852#31995#20154
      FieldName = 'dev_linkman'
    end
    object Listdev_tel: TStringField
      DisplayLabel = #32852#31995#30005#35805
      FieldName = 'dev_tel'
      Size = 30
    end
    object Listdev_fax: TStringField
      DisplayLabel = #20256#30495
      FieldName = 'dev_fax'
      Size = 30
    end
    object Listdev_zip: TStringField
      DisplayLabel = #37038#32534
      FieldName = 'dev_zip'
      Size = 6
    end
    object Listrun_date: TStringField
      DisplayLabel = #25237#29992#26085#26399
      FieldName = 'run_date'
      Size = 10
    end
    object Listverify_start_date: TStringField
      DisplayLabel = #26816#39564#26085#26399
      FieldName = 'verify_start_date'
      Size = 10
    end
    object Listverify_type_name: TStringField
      DisplayLabel = #26816#39564#31867#22411
      FieldName = 'verify_type_name'
      Size = 50
    end
    object Listmanual_verify_result_name: TStringField
      DisplayLabel = #26816#39564#32467#35770
      FieldName = 'manual_verify_result_name'
      Size = 80
    end
    object Listnext_verify_date: TStringField
      DisplayLabel = #19979#27425#26816#39564#26085#26399
      FieldName = 'next_verify_date'
      Size = 10
    end
    object Listdev_state: TStringField
      DisplayLabel = #35774#22791#29366#24577#26631#35782
      FieldName = 'dev_state'
      Size = 2
    end
    object Listdev_state_name: TStringField
      DisplayLabel = #35774#22791#29366#24577
      FieldName = 'dev_state_name'
      Size = 10
    end
  end
  object Listd: TDataSource
    DataSet = List
    Left = 46
    Top = 310
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
  object SaveDialog: TSaveDialog
    DefaultExt = 'xls'
    FileName = 'export'
    Filter = 
      'Microsoft Excel'#25991#20214'(*.xls)|*.xls|'#25991#26412#25991#20214'(*.txt)|*.txt|HTML'#25991#20214'(*.htm)|*' +
      '.htm|Rich Text Format(*.rtf)|*.rtf|csv'#25991#20214'(*.csv)|*.csv'
    Left = 18
    Top = 366
  end
  object PrintGrd: TPrintDBGridEh
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
    Left = 46
    Top = 366
  end
  object CSBarMDIChild1: TCSBarMDIChild
    Left = 74
    Top = 366
  end
  object BaseInfo: TCSADOQuery
    Connection = dmData.adocon
    CursorType = ctStatic
    BeforeInsert = BaseInfoBeforeInsert
    AfterInsert = BaseInfoAfterInsert
    BeforeEdit = BaseInfoBeforeEdit
    BeforePost = BaseInfoBeforePost
    AfterPost = BaseInfoAfterPost
    AfterCancel = BaseInfoAfterCancel
    AfterDelete = BaseInfoAfterDelete
    AfterScroll = BaseInfoAfterScroll
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM device.equipment_info')
    Left = 74
    Top = 310
    object BaseInfosysid: TStringField
      DisplayLabel = #31995#32479#35774#22791#20195#30721'('#26816#39564')'
      FieldName = 'sysid'
    end
    object BaseInforeg_id: TStringField
      DisplayLabel = #35774#22791#27880#20876#20195#30721
      FieldName = 'reg_id'
      Size = 23
    end
    object BaseInfocustom_id: TStringField
      DisplayLabel = #33258#23450#20041#35774#22791#20195#30721'('#27969#27700#21495')'
      FieldName = 'custom_id'
    end
    object BaseInfouse_cert_id: TStringField
      DisplayLabel = #20351#29992#35777#32534#21495
      FieldName = 'use_cert_id'
    end
    object BaseInfodev_inner_id: TStringField
      DisplayLabel = #20351#29992#21333#20301#35774#22791#20869#37096#32534#21495
      FieldName = 'dev_inner_id'
    end
    object BaseInfodev_code_id: TStringField
      DisplayLabel = #35774#22791#31867#21035#20195#30721
      FieldName = 'dev_code_id'
      Size = 6
    end
    object BaseInfodev_kind: TStringField
      DisplayLabel = #35774#22791#20998#31867'('#23481#22120')'
      FieldName = 'dev_kind'
    end
    object BaseInfodev_name: TStringField
      DisplayLabel = #35774#22791#21517#31216'('#23481#22120')'
      FieldName = 'dev_name'
      Size = 30
    end
    object BaseInfopressure_rate: TStringField
      DisplayLabel = #21387#21147#31561#32423'('#23481#22120')'
      FieldName = 'pressure_rate'
      Size = 30
    end
    object BaseInfouser_id: TStringField
      DisplayLabel = #20351#29992#21333#20301#20195#30721
      FieldName = 'user_id'
    end
    object BaseInfoinst_id: TStringField
      DisplayLabel = #23433#35013#21333#20301#20195#30721
      FieldName = 'inst_id'
    end
    object BaseInfomanu_id: TStringField
      DisplayLabel = #21046#36896#21333#20301#20195#30721
      FieldName = 'manu_id'
    end
    object BaseInforepair_id: TStringField
      DisplayLabel = #32500#20445#21333#20301#20195#30721
      FieldName = 'repair_id'
    end
    object BaseInfoproperty_id: TStringField
      DisplayLabel = #20135#26435#21333#20301#20195#30721
      FieldName = 'property_id'
    end
    object BaseInfodesign_id: TStringField
      DisplayLabel = #35774#35745#21333#20301#20195#30721
      FieldName = 'design_id'
    end
    object BaseInfoverify_id: TStringField
      DisplayLabel = #26816#39564#21333#20301#20195#30721
      FieldName = 'verify_id'
    end
    object BaseInfobuild_id: TStringField
      DisplayLabel = #22303#24314#26045#24037#21333#20301#20195#30721
      FieldName = 'build_id'
    end
    object BaseInfobuildverify_id: TStringField
      DisplayLabel = #22303#24314#39564#25910#21333#20301#20195#30721
      FieldName = 'buildverify_id'
    end
    object BaseInfosupervise_id: TStringField
      DisplayLabel = #30417#23519#26426#26500#20195#30721
      FieldName = 'supervise_id'
    end
    object BaseInfoverifyorg_id: TStringField
      DisplayLabel = #39564#25910#26816#39564#26426#26500#20195#30721
      FieldName = 'verifyorg_id'
    end
    object BaseInfoprovince_id: TStringField
      DisplayLabel = #35774#22791#20351#29992#22320#28857#30465#20195#30721
      FieldName = 'province_id'
      Size = 6
    end
    object BaseInfocity_id: TStringField
      DisplayLabel = #35774#22791#20351#29992#22320#28857#24066#20195#30721
      FieldName = 'city_id'
      Size = 6
    end
    object BaseInfoborough_id: TStringField
      DisplayLabel = #35774#22791#20351#29992#22320#28857#21306#20195#30721
      FieldName = 'borough_id'
      Size = 6
    end
    object BaseInfodev_address: TStringField
      DisplayLabel = #35774#22791#20351#29992#22320#28857
      FieldName = 'dev_address'
      Size = 60
    end
    object BaseInfodev_safety_dept: TStringField
      DisplayLabel = #35774#22791#23433#20840#31649#29702#37096#38376
      FieldName = 'dev_safety_dept'
      Size = 50
    end
    object BaseInfodev_linkman: TStringField
      DisplayLabel = #35774#22791#32852#31995#20154
      FieldName = 'dev_linkman'
    end
    object BaseInfodev_tel: TStringField
      DisplayLabel = #35774#22791#32852#31995#30005#35805
      FieldName = 'dev_tel'
      Size = 30
    end
    object BaseInfodev_fax: TStringField
      DisplayLabel = #35774#22791#20256#30495
      FieldName = 'dev_fax'
      Size = 30
    end
    object BaseInfodev_zip: TStringField
      DisplayLabel = #35774#22791#37038#32534
      FieldName = 'dev_zip'
      Size = 6
    end
    object BaseInfodev_email: TStringField
      DisplayLabel = #35774#22791#30005#23376#37038#20214
      FieldName = 'dev_email'
      Size = 60
    end
    object BaseInfodev_operator: TStringField
      DisplayLabel = #35774#22791#25805#20316#20154#21592
      FieldName = 'dev_operator'
    end
    object BaseInforun_date: TStringField
      DisplayLabel = #25237#29992#26085#26399
      FieldName = 'run_date'
      Size = 10
    end
    object BaseInfoupdate_date: TStringField
      DisplayLabel = #26356#26032#26085#26399
      FieldName = 'update_date'
      Size = 10
    end
    object BaseInfostart_date: TStringField
      DisplayLabel = #24320#22987#26045#24037#26085#26399
      FieldName = 'start_date'
      Size = 10
    end
    object BaseInfoend_date: TStringField
      DisplayLabel = #31459#24037#39564#25910#26085#26399
      FieldName = 'end_date'
      Size = 10
    end
    object BaseInfoliber_id: TStringField
      DisplayLabel = #26222#26597#30331#35760#34920#32534#21495
      FieldName = 'liber_id'
      Size = 10
    end
    object BaseInforeg_person: TStringField
      DisplayLabel = #27880#20876#30331#35760#20154#21592
      FieldName = 'reg_person'
    end
    object BaseInforeg_date: TStringField
      DisplayLabel = #27880#20876#30331#35760#26085#26399
      FieldName = 'reg_date'
      Size = 10
    end
    object BaseInfowb_cycle: TStringField
      DisplayLabel = #32500#20445#21608#26399
      FieldName = 'wb_cycle'
      Size = 10
    end
    object BaseInfodx_cycle: TStringField
      DisplayLabel = #22823#20462#21608#26399
      FieldName = 'dx_cycle'
      Size = 10
    end
    object BaseInfoproject_manager: TStringField
      DisplayLabel = #39033#30446#36127#36131#20154
      FieldName = 'project_manager'
      Size = 16
    end
    object BaseInfoys_report_id: TStringField
      DisplayLabel = #39564#25910#25253#21578#32534#21495
      FieldName = 'ys_report_id'
    end
    object BaseInfofit_situation: TStringField
      DisplayLabel = #36866#29992#22330#21512
      FieldName = 'fit_situation'
    end
    object BaseInfostop_date: TStringField
      FieldName = 'stop_date'
      Size = 10
    end
    object BaseInforeject_date: TStringField
      FieldName = 'reject_date'
      Size = 10
    end
    object BaseInforeuse_date: TStringField
      FieldName = 'reuse_date'
      Size = 10
    end
    object BaseInfodev_use_id: TStringField
      FieldName = 'dev_use_id'
    end
    object BaseInfodev_state: TStringField
      DisplayLabel = #35774#22791#20351#29992#29366#24577
      FieldName = 'dev_state'
      Size = 2
    end
    object BaseInfosupdevice_id: TStringField
      DisplayLabel = #30417#26816#35777#31995#32479#20195#30721
      FieldName = 'supdevice_id'
    end
    object BaseInfosupdevice_custom_id: TStringField
      DisplayLabel = #30417#26816#35777#32534#21495
      FieldName = 'supdevice_custom_id'
      Size = 30
    end
    object BaseInfooutflag: TIntegerField
      DisplayLabel = #23548#20986#26631#24535
      FieldName = 'outflag'
    end
  end
  object BaseInfod: TDataSource
    DataSet = BaseInfo
    Left = 102
    Top = 310
  end
  object VerifyInfo: TCSADOQuery
    CacheSize = 1
    Connection = dmData.adocon
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM device.equipment_use_info')
    Left = 130
    Top = 310
    object VerifyInfosysid: TStringField
      DisplayLabel = #31995#32479#32534#21495'('#26816#39564')'
      FieldName = 'sysid'
    end
    object VerifyInfodev_id: TStringField
      DisplayLabel = #31995#32479#35774#22791#20195#30721
      FieldName = 'dev_id'
      Size = 23
    end
    object VerifyInfoaccept_date: TStringField
      DisplayLabel = #25253#26816#26085#26399
      FieldName = 'accept_date'
      Size = 10
    end
    object VerifyInfoverify_plan_custom_id: TStringField
      DisplayLabel = #29992#25143#27966#24037#21333#32534#21495
      FieldName = 'verify_plan_custom_id'
    end
    object VerifyInfomain_checker: TStringField
      DisplayLabel = #36131#20219#26816#39564#21592
      FieldName = 'main_checker'
      Size = 30
    end
    object VerifyInfochecker1: TStringField
      DisplayLabel = #26816#39564#21592'1'
      FieldName = 'checker1'
      Size = 30
    end
    object VerifyInfochecker2: TStringField
      DisplayLabel = #26816#39564#21592'2'
      FieldName = 'checker2'
      Size = 30
    end
    object VerifyInfochecker3: TStringField
      DisplayLabel = #26816#39564#21592'3'
      FieldName = 'checker3'
      Size = 30
    end
    object VerifyInfochecker4: TStringField
      DisplayLabel = #26816#39564#21592'4'
      FieldName = 'checker4'
      Size = 30
    end
    object VerifyInfoverify_start_date: TStringField
      DisplayLabel = #26816#39564#24320#22987#26085#26399
      FieldName = 'verify_start_date'
      Size = 10
    end
    object VerifyInfoverify_end_date: TStringField
      DisplayLabel = #26816#39564#32467#26463#26085#26399
      FieldName = 'verify_end_date'
      Size = 10
    end
    object VerifyInfoinput_date: TStringField
      DisplayLabel = #21407#22987#25968#25454#36755#20837#30830#35748#26085#26399
      FieldName = 'input_date'
      Size = 10
    end
    object VerifyInfoinputor: TStringField
      DisplayLabel = #36755#20837#21592
      FieldName = 'inputor'
      Size = 30
    end
    object VerifyInfofirst_audit_date: TStringField
      DisplayLabel = #19968#32423#23457#26680#26085#26399
      FieldName = 'first_audit_date'
      Size = 10
    end
    object VerifyInfofirst_auditor: TStringField
      DisplayLabel = #26816#39564#21592
      FieldName = 'first_auditor'
      Size = 30
    end
    object VerifyInfosecond_audit_date: TStringField
      DisplayLabel = #20108#32423#23457#26680#26085#26399
      FieldName = 'second_audit_date'
      Size = 10
    end
    object VerifyInfosecond_auditor: TStringField
      DisplayLabel = #36131#20219#24037#31243#24072
      FieldName = 'second_auditor'
      Size = 30
    end
    object VerifyInfothird_audit_date: TStringField
      DisplayLabel = #19977#32423#23457#26680#26085#26399
      FieldName = 'third_audit_date'
      Size = 10
    end
    object VerifyInfothird_auditor: TStringField
      DisplayLabel = #24635#24037#31243#24072
      FieldName = 'third_auditor'
      Size = 30
    end
    object VerifyInforeport_print_date: TStringField
      DisplayLabel = #25253#21578#20070#25171#21360#26085#26399
      FieldName = 'report_print_date'
      Size = 10
    end
    object VerifyInforefit_return_date: TStringField
      DisplayLabel = #25972#25913#21333#36820#22238#26085#26399
      FieldName = 'refit_return_date'
      Size = 10
    end
    object VerifyInfocert_begin_date: TStringField
      DisplayLabel = #20934#29992#35777#26377#25928#26399#24320#22987#26085#26399
      FieldName = 'cert_begin_date'
      Size = 10
    end
    object VerifyInfocert_end_date: TStringField
      DisplayLabel = #20934#29992#35777#26377#25928#26399#32467#26463#26085#26399
      FieldName = 'cert_end_date'
      Size = 10
    end
    object VerifyInfocert_print_date: TStringField
      DisplayLabel = #20934#29992#35777#25171#21360#26085#26399
      FieldName = 'cert_print_date'
      Size = 10
    end
    object VerifyInfoget_cert_date: TStringField
      DisplayLabel = #21457#35777#26085#26399
      FieldName = 'get_cert_date'
      Size = 10
    end
    object VerifyInfonext_verify_date: TStringField
      DisplayLabel = #19979#27425#26816#39564#26085#26399
      FieldName = 'next_verify_date'
      Size = 10
    end
    object VerifyInfoverify_type_name: TStringField
      DisplayLabel = #26816#39564#31867#22411
      FieldName = 'verify_type_name'
      Size = 50
    end
    object VerifyInfonext_verify_type_name: TStringField
      DisplayLabel = #19979#27425#26816#39564#31867#22411
      FieldName = 'next_verify_type_name'
      Size = 50
    end
    object VerifyInfoverify_result_name: TStringField
      DisplayLabel = #26816#39564#32467#35770
      FieldName = 'verify_result_name'
      Size = 80
    end
    object VerifyInfomanual_verify_result_name: TStringField
      DisplayLabel = #20154#24037#26816#39564#32467#35770
      FieldName = 'manual_verify_result_name'
      Size = 80
    end
    object VerifyInforeport_custom_id: TStringField
      DisplayLabel = #25253#21578#20070#32534#21495
      FieldName = 'report_custom_id'
    end
    object VerifyInforefit_times: TIntegerField
      DisplayLabel = #22797#26816#27425#25968
      FieldName = 'refit_times'
    end
    object VerifyInfomaster_problem_name: TStringField
      DisplayLabel = #20027#35201#38382#39064
      FieldName = 'master_problem_name'
      Size = 100
    end
    object VerifyInfois_case: TStringField
      DisplayLabel = #26159#21542#26696#20363
      FieldName = 'is_case'
      Size = 10
    end
  end
  object VerifyInfod: TDataSource
    DataSet = VerifyInfo
    Left = 158
    Top = 310
  end
  object VerifyFind: TCSDBEhGrdFind
    EhDBGrid = grdVerifyInfo
    Left = 102
    Top = 338
  end
  object VerifyFilter: TCSADOEhGrdFilter
    EhDBGrid = grdVerifyInfo
    Left = 130
    Top = 338
  end
  object VerifyColCtrl: TCSEhGrdColCtrl
    EhDBGrid = grdVerifyInfo
    ColList = <>
    Left = 158
    Top = 338
  end
  object Province: TCSADOQuery
    Connection = dmData.adocon
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    Left = 402
    Top = 311
  end
  object City: TCSADOQuery
    Connection = dmData.adocon
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    Left = 430
    Top = 311
  end
  object Borough: TCSADOQuery
    Connection = dmData.adocon
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    Left = 458
    Top = 311
  end
  object boroughd: TDataSource
    DataSet = Borough
    Left = 458
    Top = 339
  end
  object cityd: TDataSource
    DataSet = City
    Left = 430
    Top = 339
  end
  object provinced: TDataSource
    DataSet = Province
    Left = 402
    Top = 339
  end
  object DeviceCode: TCSADOQuery
    Connection = dmData.adocon
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    Left = 486
    Top = 311
  end
  object DeviceCoded: TDataSource
    DataSet = DeviceCode
    Left = 486
    Top = 339
  end
  object DeviceLog: TCSADOQuery
    Connection = dmData.adocon
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    Left = 186
    Top = 310
    object DeviceLogdevice_id: TStringField
      DisplayLabel = #31995#32479#35774#22791#20195#30721
      FieldName = 'device_id'
      Visible = False
    end
    object DeviceLogdevice_reg_id: TStringField
      DisplayLabel = #35774#22791#27880#20876#20195#30721
      FieldName = 'device_reg_id'
      Size = 23
    end
    object DeviceLogdevice_custom_id: TStringField
      DisplayLabel = #35774#22791#27969#27700#21495
      FieldName = 'device_custom_id'
    end
    object DeviceLoguser_id: TStringField
      DisplayLabel = #25805#20316#21592#32534#21495
      FieldName = 'user_id'
      Size = 30
    end
    object DeviceLogoperation_type: TStringField
      DisplayLabel = #25805#20316#31181#31867
      FieldName = 'operation_type'
    end
    object DeviceLogoperation_time: TDateTimeField
      DisplayLabel = #25805#20316#26102#38388
      FieldName = 'operation_time'
    end
    object DeviceLogoperation_machine: TStringField
      DisplayLabel = #25805#20316#22320#28857
      FieldName = 'operation_machine'
      Size = 60
    end
    object DeviceLogoperation_content: TStringField
      DisplayLabel = #25805#20316#20869#23481
      FieldName = 'operation_content'
      Size = 250
    end
  end
  object DeviceLogd: TDataSource
    DataSet = DeviceLog
    Left = 214
    Top = 310
  end
  object ScrChild: TCSScrCtrlChild
    Left = 102
    Top = 366
  end
  object Temp: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltReadOnly
    Parameters = <>
    Left = 242
    Top = 310
  end
  object frPrintReg: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbPrint, pbFind, pbExit, pbPageSetup]
    Left = 158
    Top = 366
    ReportForm = {18000000}
  end
  object RegData: TCSADOQuery
    Parameters = <>
    Left = 130
    Top = 366
  end
  object frPrintRegData: TfrDBDataSet
    DataSet = RegData
    Left = 186
    Top = 366
  end
  object ListEhGrdStore: TCSDBEhGrdStore
    StoreToIniFile = True
    EhDBGrid = grdList
    Left = 186
    Top = 338
  end
  object VerifyEhGrdStore: TCSDBEhGrdStore
    StoreToIniFile = True
    EhDBGrid = grdVerifyInfo
    Left = 214
    Top = 338
  end
  object mComInfo: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 318
    Top = 311
    object mComInfouser_id: TStringField
      FieldName = 'user_id'
    end
    object mComInfouser_name: TStringField
      FieldName = 'user_name'
      Size = 60
    end
    object mComInfoinst_id: TStringField
      FieldName = 'inst_id'
    end
    object mComInfoinst_name: TStringField
      FieldName = 'inst_name'
      Size = 60
    end
    object mComInfomanu_id: TStringField
      FieldName = 'manu_id'
    end
    object mComInfomanu_name: TStringField
      FieldName = 'manu_name'
      Size = 60
    end
    object mComInforepair_id: TStringField
      FieldName = 'repair_id'
    end
    object mComInforepair_name: TStringField
      FieldName = 'repair_name'
      Size = 60
    end
    object mComInfoproperty_id: TStringField
      FieldName = 'property_id'
    end
    object mComInfoproperty_name: TStringField
      FieldName = 'property_name'
      Size = 60
    end
    object mComInfodesign_id: TStringField
      FieldName = 'design_id'
    end
    object mComInfodesign_name: TStringField
      FieldName = 'design_name'
      Size = 60
    end
    object mComInfoverify_id: TStringField
      FieldName = 'verify_id'
    end
    object mComInfoverify_name: TStringField
      FieldName = 'verify_name'
      Size = 60
    end
    object mComInfobuild_id: TStringField
      FieldName = 'build_id'
    end
    object mComInfobuild_name: TStringField
      FieldName = 'build_name'
      Size = 60
    end
    object mComInfobuildverify_id: TStringField
      FieldName = 'buildverify_id'
    end
    object mComInfobuildverify_name: TStringField
      FieldName = 'buildverify_name'
      Size = 60
    end
    object mComInfosupervise_id: TStringField
      FieldName = 'supervise_id'
    end
    object mComInfosupervise_name: TStringField
      FieldName = 'supervise_name'
      Size = 60
    end
    object mComInfoverifyorg_id: TStringField
      FieldName = 'verifyorg_id'
    end
    object mComInfoverifyorg_name: TStringField
      FieldName = 'verifyorg_name'
      Size = 60
    end
  end
  object mComInfod: TDataSource
    DataSet = mComInfo
    Left = 318
    Top = 339
  end
  object mComInfoBak: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 346
    Top = 311
    object mComInfoBakuser_id: TStringField
      FieldName = 'user_id'
    end
    object mComInfoBakuser_name: TStringField
      FieldName = 'user_name'
      Size = 60
    end
    object mComInfoBakinst_id: TStringField
      FieldName = 'inst_id'
    end
    object mComInfoBakinst_name: TStringField
      FieldName = 'inst_name'
      Size = 60
    end
    object mComInfoBakmanu_id: TStringField
      FieldName = 'manu_id'
    end
    object mComInfoBakmanu_name: TStringField
      FieldName = 'manu_name'
      Size = 60
    end
    object mComInfoBakrepair_id: TStringField
      FieldName = 'repair_id'
    end
    object mComInfoBakrepair_name: TStringField
      FieldName = 'repair_name'
      Size = 60
    end
    object mComInfoBakproperty_id: TStringField
      FieldName = 'property_id'
    end
    object mComInfoBakproperty_name: TStringField
      FieldName = 'property_name'
      Size = 60
    end
    object mComInfoBakdesign_id: TStringField
      FieldName = 'design_id'
    end
    object mComInfoBakdesign_name: TStringField
      FieldName = 'design_name'
      Size = 60
    end
    object mComInfoBakverify_id: TStringField
      FieldName = 'verify_id'
    end
    object mComInfoBakverify_name: TStringField
      FieldName = 'verify_name'
      Size = 60
    end
    object mComInfoBakbuild_id: TStringField
      FieldName = 'build_id'
    end
    object mComInfoBakbuild_name: TStringField
      FieldName = 'build_name'
      Size = 60
    end
    object mComInfoBakbuildverify_id: TStringField
      FieldName = 'buildverify_id'
    end
    object mComInfoBakbuildverify_name: TStringField
      FieldName = 'buildverify_name'
      Size = 60
    end
    object mComInfoBaksupervise_id: TStringField
      FieldName = 'supervise_id'
    end
    object mComInfoBaksupervise_name: TStringField
      FieldName = 'supervise_name'
      Size = 60
    end
    object mComInfoBakverifyorg_id: TStringField
      FieldName = 'verifyorg_id'
    end
    object mComInfoBakverifyorg_name: TStringField
      FieldName = 'verifyorg_name'
      Size = 60
    end
  end
  object UserCom: TCSADOQuery
    CacheSize = 1
    Connection = dmData.adocon
    LockType = ltReadOnly
    Parameters = <>
    Left = 374
    Top = 311
  end
  object UserComd: TDataSource
    DataSet = UserCom
    Left = 374
    Top = 339
  end
  object DevState: TCSADOQuery
    Connection = dmData.adocon
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    Left = 514
    Top = 311
  end
  object DevStated: TDataSource
    DataSet = DevState
    Left = 514
    Top = 339
  end
end
