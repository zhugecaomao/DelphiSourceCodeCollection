object frmHR: TfrmHR
  Left = 106
  Top = 107
  Width = 676
  Height = 491
  Caption = #20154#20107#31649#29702
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 12
  object Splitter1: TSplitter
    Left = 209
    Top = 0
    Width = 3
    Height = 408
    Cursor = crSizeWE
  end
  object scrbGroupDetail: TScrollBox
    Left = 212
    Top = 0
    Width = 456
    Height = 408
    Align = alClient
    TabOrder = 4
    object Label24: TLabel
      Left = 5
      Top = 7
      Width = 60
      Height = 12
      Caption = #37096#38376#20195#30721#65306
    end
    object Label25: TLabel
      Left = 29
      Top = 29
      Width = 36
      Height = 12
      Caption = #21517#31216#65306
    end
    object e_deptid: TDBEditEh
      Left = 65
      Top = 4
      Width = 121
      Height = 18
      Color = clSkyBlue
      Ctl3D = False
      DataField = 'itemcode'
      EditButtons = <>
      ParentCtl3D = False
      TabOrder = 0
      Visible = True
    end
    object e_deptname: TDBEditEh
      Left = 65
      Top = 26
      Width = 121
      Height = 18
      Color = clSkyBlue
      Ctl3D = False
      DataField = 'name'
      EditButtons = <>
      ParentCtl3D = False
      TabOrder = 1
      Visible = True
    end
  end
  object scrbUserDetail: TScrollBox
    Left = 212
    Top = 0
    Width = 456
    Height = 408
    Align = alClient
    TabOrder = 3
    object Label2: TLabel
      Left = 36
      Top = 53
      Width = 36
      Height = 12
      Alignment = taRightJustify
      Caption = #22995#21517#65306
    end
    object Label13: TLabel
      Left = 208
      Top = 53
      Width = 48
      Height = 12
      Alignment = taRightJustify
      Caption = #36523#20221#35777#65306
    end
    object Label11: TLabel
      Left = 36
      Top = 77
      Width = 36
      Height = 12
      Alignment = taRightJustify
      Caption = #24615#21035#65306
    end
    object Label20: TLabel
      Left = 195
      Top = 77
      Width = 61
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #25252#29031#21495#30721#65306
    end
    object Label3: TLabel
      Left = 12
      Top = 100
      Width = 60
      Height = 12
      Alignment = taRightJustify
      Caption = #20986#29983#26085#26399#65306
    end
    object Label10: TLabel
      Left = 220
      Top = 100
      Width = 36
      Height = 12
      Alignment = taRightJustify
      Caption = #27665#26063#65306
    end
    object Label12: TLabel
      Left = 12
      Top = 124
      Width = 60
      Height = 12
      Alignment = taRightJustify
      Caption = #25919#27835#38754#35980#65306
    end
    object Label21: TLabel
      Left = 220
      Top = 124
      Width = 36
      Height = 12
      Alignment = taRightJustify
      Caption = #23398#21382#65306
    end
    object Label16: TLabel
      Left = 196
      Top = 147
      Width = 60
      Height = 12
      Alignment = taRightJustify
      Caption = #23130#23035#29366#20917#65306
    end
    object Label17: TLabel
      Left = 12
      Top = 147
      Width = 60
      Height = 12
      Alignment = taRightJustify
      Caption = #37197#20598#22995#21517#65306
    end
    object Label22: TLabel
      Left = 36
      Top = 170
      Width = 36
      Height = 12
      Alignment = taRightJustify
      Caption = #23703#20301#65306
    end
    object Label15: TLabel
      Left = 195
      Top = 170
      Width = 61
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #22312#32844#24773#20917#65306
    end
    object Label7: TLabel
      Left = 12
      Top = 193
      Width = 60
      Height = 12
      Alignment = taRightJustify
      Caption = #27605#19994#23398#26657#65306
    end
    object Label18: TLabel
      Left = 196
      Top = 193
      Width = 60
      Height = 12
      Alignment = taRightJustify
      Caption = #25152#23398#19987#19994#65306
    end
    object Label4: TLabel
      Left = 36
      Top = 216
      Width = 36
      Height = 12
      Alignment = taRightJustify
      Caption = #23398#20301#65306
    end
    object Label5: TLabel
      Left = 196
      Top = 216
      Width = 60
      Height = 12
      Alignment = taRightJustify
      Caption = #27605#19994#26102#38388#65306
    end
    object Label14: TLabel
      Left = 12
      Top = 239
      Width = 60
      Height = 12
      Alignment = taRightJustify
      Caption = #23478#24237#22320#22336#65306
    end
    object Label6: TLabel
      Left = 12
      Top = 262
      Width = 60
      Height = 12
      Alignment = taRightJustify
      Caption = #20303#23429#30005#35805#65306
    end
    object Label8: TLabel
      Left = 196
      Top = 262
      Width = 60
      Height = 12
      Alignment = taRightJustify
      Caption = #37038#25919#32534#30721#65306
    end
    object Label32: TLabel
      Left = 28
      Top = 285
      Width = 44
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #32844#31216#65306
    end
    object Label9: TLabel
      Left = 196
      Top = 285
      Width = 60
      Height = 12
      Alignment = taRightJustify
      Caption = #35780#23450#26102#38388#65306
    end
    object Label19: TLabel
      Left = 9
      Top = 309
      Width = 63
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #29031#29255#20449#24687#65306
    end
    object Label23: TLabel
      Left = 24
      Top = 8
      Width = 48
      Height = 12
      Caption = #29992#25143#21517#65306
    end
    object l_password: TLabel
      Left = 220
      Top = 8
      Width = 36
      Height = 12
      Caption = #23494#30721#65306
      Visible = False
    end
    object Label28: TLabel
      Left = 12
      Top = 30
      Width = 60
      Height = 12
      Caption = #29992#25143#32534#21495#65306
    end
    object l_confirmpwd: TLabel
      Left = 196
      Top = 30
      Width = 60
      Height = 12
      Caption = #30830#35748#23494#30721#65306
      Visible = False
    end
    object eName: TDBEditEh
      Left = 72
      Top = 50
      Width = 118
      Height = 18
      Color = clSkyBlue
      Ctl3D = False
      DataField = 'name'
      DataSource = person_baseinfod
      EditButtons = <>
      ParentCtl3D = False
      TabOrder = 0
      Visible = True
    end
    object eCardid: TDBEditEh
      Left = 256
      Top = 50
      Width = 118
      Height = 18
      Color = clSkyBlue
      Ctl3D = False
      DataField = 'cardid'
      DataSource = person_baseinfod
      EditButtons = <>
      ParentCtl3D = False
      TabOrder = 1
      Visible = True
    end
    object lcmbSex: TDBLookupComboboxEh
      Left = 72
      Top = 74
      Width = 118
      Height = 18
      Ctl3D = False
      DataField = 'sex'
      DataSource = person_baseinfod
      EditButtons = <>
      KeyField = 'id'
      ListField = 'name'
      ParentCtl3D = False
      TabOrder = 2
      Visible = True
    end
    object ePassid: TDBEditEh
      Left = 256
      Top = 74
      Width = 118
      Height = 18
      Ctl3D = False
      DataField = 'passportid'
      DataSource = person_baseinfod
      EditButtons = <>
      ParentCtl3D = False
      TabOrder = 3
      Visible = True
    end
    object dteBirthday: TCSdxDBDateEdit
      Left = 72
      Top = 96
      Width = 118
      TabOrder = 4
      DataField = 'birthdate'
      DataSource = person_baseinfod
      StyleController = dmData.dxStyleCtrl
      FixedDateFormat = 'yyyy-MM-dd'
      StoredValues = 4
    end
    object lcmbNation: TDBLookupComboboxEh
      Left = 256
      Top = 97
      Width = 118
      Height = 18
      Ctl3D = False
      DataField = 'nation'
      DataSource = person_baseinfod
      EditButtons = <>
      KeyField = 'id'
      ListField = 'name'
      ListSource = nationd
      ParentCtl3D = False
      TabOrder = 5
      Visible = True
    end
    object ePolity: TDBEditEh
      Left = 72
      Top = 121
      Width = 118
      Height = 18
      Ctl3D = False
      DataField = 'polity'
      DataSource = person_baseinfod
      EditButtons = <>
      ParentCtl3D = False
      TabOrder = 6
      Visible = True
    end
    object lcmbEdudegree: TDBLookupComboboxEh
      Left = 256
      Top = 121
      Width = 118
      Height = 18
      Ctl3D = False
      DataField = 'education'
      DataSource = person_baseinfod
      EditButtons = <>
      KeyField = 'id'
      ListField = 'name'
      ListSource = edudegreed
      ParentCtl3D = False
      TabOrder = 7
      Visible = True
    end
    object lcmbMarry: TDBLookupComboboxEh
      Left = 256
      Top = 144
      Width = 118
      Height = 18
      Ctl3D = False
      DataField = 'ismarry'
      DataSource = person_baseinfod
      EditButtons = <>
      KeyField = 'id'
      ListField = 'name'
      ListSource = marrystatusd
      ParentCtl3D = False
      TabOrder = 8
      Visible = True
    end
    object eMate: TDBEditEh
      Left = 72
      Top = 144
      Width = 118
      Height = 18
      Ctl3D = False
      DataField = 'mate'
      DataSource = person_baseinfod
      EditButtons = <>
      ParentCtl3D = False
      TabOrder = 9
      Visible = True
    end
    object ePost: TDBEditEh
      Left = 72
      Top = 167
      Width = 118
      Height = 18
      Ctl3D = False
      DataField = 'post'
      DataSource = person_baseinfod
      EditButtons = <>
      ParentCtl3D = False
      TabOrder = 10
      Visible = True
    end
    object lcmbZzqk: TDBLookupComboboxEh
      Left = 256
      Top = 167
      Width = 118
      Height = 18
      Ctl3D = False
      DataField = 'workinfo'
      DataSource = person_baseinfod
      EditButtons = <>
      KeyField = 'id'
      ListField = 'name'
      ListSource = zzqkd
      ParentCtl3D = False
      TabOrder = 11
      Visible = True
    end
    object eGraSchool: TDBEditEh
      Left = 72
      Top = 190
      Width = 118
      Height = 18
      Ctl3D = False
      DataField = 'gradua_school'
      DataSource = person_baseinfod
      EditButtons = <>
      ParentCtl3D = False
      TabOrder = 12
      Visible = True
    end
    object eSpecial: TDBEditEh
      Left = 256
      Top = 190
      Width = 118
      Height = 18
      Ctl3D = False
      DataField = 'speciality'
      DataSource = person_baseinfod
      EditButtons = <>
      ParentCtl3D = False
      TabOrder = 13
      Visible = True
    end
    object lcmbDegree: TDBLookupComboboxEh
      Left = 72
      Top = 213
      Width = 118
      Height = 18
      Ctl3D = False
      DataField = 'degree'
      DataSource = person_baseinfod
      EditButtons = <>
      KeyField = 'id'
      ListField = 'name'
      ListSource = degreed
      ParentCtl3D = False
      TabOrder = 14
      Visible = True
    end
    object dteGratime: TCSdxDBDateEdit
      Left = 256
      Top = 212
      Width = 118
      TabOrder = 15
      DataField = 'gradua_time'
      DataSource = person_baseinfod
      StyleController = dmData.dxStyleCtrl
      FixedDateFormat = 'yyyy-MM-dd'
      StoredValues = 4
    end
    object eAddr: TDBEditEh
      Left = 72
      Top = 236
      Width = 302
      Height = 18
      Ctl3D = False
      DataField = 'addr'
      DataSource = person_baseinfod
      EditButtons = <>
      ParentCtl3D = False
      TabOrder = 16
      Visible = True
    end
    object eTel: TDBEditEh
      Left = 72
      Top = 259
      Width = 118
      Height = 18
      Ctl3D = False
      DataField = 'tel'
      DataSource = person_baseinfod
      EditButtons = <>
      ParentCtl3D = False
      TabOrder = 17
      Visible = True
    end
    object eZip: TDBEditEh
      Left = 256
      Top = 259
      Width = 118
      Height = 18
      Ctl3D = False
      DataField = 'zip'
      DataSource = person_baseinfod
      EditButtons = <>
      ParentCtl3D = False
      TabOrder = 18
      Visible = True
    end
    object eTitleofpast: TDBEditEh
      Left = 72
      Top = 282
      Width = 121
      Height = 18
      Ctl3D = False
      DataField = 'titleofpost'
      DataSource = person_baseinfod
      EditButtons = <>
      ParentCtl3D = False
      TabOrder = 19
      Visible = True
    end
    object dteZcpdtime: TCSdxDBDateEdit
      Left = 256
      Top = 281
      Width = 118
      TabOrder = 20
      DataField = 'zcpd_time'
      DataSource = person_baseinfod
      StyleController = dmData.dxStyleCtrl
      FixedDateFormat = 'yyyy-MM-dd'
      StoredValues = 4
    end
    object ePic: TdxDBGraphicEdit
      Left = 72
      Top = 305
      Width = 90
      TabOrder = 21
      ReadOnly = False
      StyleController = dmData.dxStyleCtrl
      CustomGraphic = True
      DataField = 'pic_info'
      DataSource = person_baseinfod
      Stretch = True
      Height = 120
      StoredValues = 64
    end
    object e_loginname: TDBEditEh
      Left = 72
      Top = 5
      Width = 118
      Height = 18
      Color = clSkyBlue
      Ctl3D = False
      DataField = 'scr_user'
      EditButtons = <>
      Enabled = False
      ParentCtl3D = False
      TabOrder = 22
      Visible = True
    end
    object e_password: TDBEditEh
      Left = 256
      Top = 5
      Width = 118
      Height = 18
      Color = clSkyBlue
      Ctl3D = False
      DataField = 'item_pwd'
      EditButtons = <>
      ParentCtl3D = False
      PasswordChar = '*'
      TabOrder = 23
      Visible = False
    end
    object e_customid: TDBEditEh
      Left = 72
      Top = 27
      Width = 118
      Height = 18
      Ctl3D = False
      DataField = 'itemcode'
      EditButtons = <>
      ParentCtl3D = False
      TabOrder = 24
      Visible = True
    end
    object e_confirmpwd: TEdit
      Left = 256
      Top = 27
      Width = 118
      Height = 18
      Color = clSkyBlue
      Ctl3D = False
      MaxLength = 30
      ParentCtl3D = False
      PasswordChar = '*'
      TabOrder = 25
      Visible = False
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 436
    Width = 668
    Height = 28
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 0
    object Panel5: TPanel
      Left = 449
      Top = 1
      Width = 218
      Height = 26
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object bbtnPrint: TBitBtn
        Left = 2
        Top = 2
        Width = 60
        Height = 22
        Caption = #25171#21360
        TabOrder = 0
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
      object bbtnHelp: TBitBtn
        Left = 64
        Top = 2
        Width = 75
        Height = 22
        Hint = #33719#21462#30456#20851#24110#21161
        Caption = #24110#21161'(&H)'
        TabOrder = 1
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
        Left = 141
        Top = 2
        Width = 75
        Height = 22
        Hint = #20851#38381#24403#21069#31383#21475
        Caption = #20851#38381'(&C)'
        TabOrder = 2
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
  end
  object Panel2: TPanel
    Left = 0
    Top = 408
    Width = 668
    Height = 28
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 1
    object Panel4: TPanel
      Left = 309
      Top = 1
      Width = 358
      Height = 26
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 4
      object bbtnAddGroup: TBitBtn
        Left = 102
        Top = 2
        Width = 75
        Height = 22
        Hint = #28155#21152#19968#20010#37096#38376
        Caption = #28155#21152#37096#38376
        TabOrder = 0
      end
      object bbtnAddUser: TBitBtn
        Left = 179
        Top = 2
        Width = 75
        Height = 22
        Hint = #28155#21152#19968#21517#20154#21592
        Caption = #28155#21152#20154#21592
        TabOrder = 1
      end
      object bbtnDelete: TBitBtn
        Left = 256
        Top = 2
        Width = 50
        Height = 22
        Hint = #21024#38500#24403#21069#20154#21592#25110#37096#38376
        Caption = #21024#38500
        TabOrder = 2
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
      object navPersonMge: TCSDBNavigator
        Left = 308
        Top = 2
        Width = 50
        Height = 22
        VisibleButtons = [nbRefresh]
        Align = alCustom
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 3
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
    object bbtnFind: TBitBtn
      Left = 3
      Top = 3
      Width = 60
      Height = 22
      Hint = #26597#25214#20154#21592#25110#37096#38376
      Caption = #26597#25214
      TabOrder = 0
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
    object bbtnCopy: TBitBtn
      Left = 65
      Top = 3
      Width = 60
      Height = 22
      Caption = #22797#21046
      TabOrder = 1
      Visible = False
      Glyph.Data = {
        9C010000424D9C01000000000000760000002800000020000000100000000100
        04000200000026010000C40E0000C40E00000000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00203300001633
        023F08FF000006330234084406330877027F00000633023406FF02F406330004
        7F3F04FF027F00000633000434F004000004F43F04FF027F04770004737F0000
        02300400020406FF02F4067700047F3F04FF027F0000023004FF0004F4F00400
        000AF47F3FFF7F0004770004737F0000000830F0000406FF0004F47F0477000A
        7F3FF3FF7F000000023004FF0006F4F00F00044400107F3FFF7F773777730000
        000830F0000404FF00064F437F000477000A7F3337F733000000023004FF02F4
        04FF001444337F3FF37FFFF773330000000830F00F040444000A43337F773700
        067704330000023004FF00040F03063300087F3337F708330000023004FF0200
        083300087FFFF77308330000023004000203083306770A330000203300000001}
      NumGlyphs = 2
    end
    object bbtnCut: TBitBtn
      Left = 65
      Top = 3
      Width = 60
      Height = 22
      Hint = #23558#24403#21069#20154#21592#22797#21046#21040#21098#36148#26495#20197#20415#29992#31896#36148#26469#23454#29616#31227#21160
      Caption = #21098#20999
      TabOrder = 2
      Glyph.Data = {
        90010000424D9001000000000000760000002800000020000000100000000100
        0400020000001A010000C40E0000C40E00000000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00163302FF0833
        00000433000434430C33000C3773F33FF333000004330008433433440833000C
        7F37F3773F330000043302430434000433430633000C7F37F7F37F3300000433
        02430434000433430633027304F70006F37F330000000433000A344434334300
        0633000C3777F7FF733300000633043402440A33000637F77700043300000633
        000434040C330004377706330000083302030E3300047FF30433000006330004
        30000C3300063777F30004330000063304300C33000637F7FF00043300000633
        0006003003000A33000677377F000433000006330006033303000A3300067F33
        7F000433000006330006033303000A3300067F337F0004330000063300060333
        03000A3300067333730004330000203300000001}
      NumGlyphs = 2
    end
    object bbtnPaste: TBitBtn
      Left = 127
      Top = 3
      Width = 60
      Height = 22
      Hint = #25226#21098#36148#26495#20013#30340#20154#21592#22797#21046#21040#24403#21069#20301#32622
      Caption = #31896#36148
      Enabled = False
      TabOrder = 3
      Glyph.Data = {
        94010000424D9401000000000000760000002800000020000000100000000100
        0400020000001E010000C40E0000C40E00000000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0016DD02DF08FF
        000006DD0A4402DD04FF0A77000002D00400024F06FF0004F4D7047700047FDF
        04FF02F7000002070437024F060002F40677027F067702D7000002030473024F
        06FF02F40677000A7FDFFFDDD70000000207043700064F000F00044406770006
        7F777D000477000002030473024F04FF00044F4D0677027F04DD047D00000207
        0437024F04FF000444DD0677027F04FF000477FD0000020304730644000440DD
        0E7702FD000002070A37000430DD0E7702FD000000040370060000060770DD00
        0E7702FD000000040770068800060730DD000E7702FD0000001003730B00B073
        70DD0E7702DD000002D0040002BB040000060DDDD7000A7700047DDD000004DD
        0006D0000D000ADD0006D7777D0006DD000020DD00000001}
      NumGlyphs = 2
    end
    object bbtnPerDefine: TBitBtn
      Left = 189
      Top = 3
      Width = 75
      Height = 22
      Hint = #23545#24403#21069#20154#21592#25110#37096#38376#35774#32622#31995#32479#20351#29992#26435#38480
      Caption = #26435#38480#35774#32622
      TabOrder = 5
    end
  end
  object tvPersonMge: TdxDBTreeView
    Left = 0
    Top = 0
    Width = 209
    Height = 408
    ShowNodeHint = True
    ImageIndexField = 'is_user'
    KeyField = 'id'
    ListField = 'name'
    ParentField = 'parent_id'
    SeparatedSt = '  '
    RaiseOnError = True
    ReadOnly = True
    DragMode = dmAutomatic
    HideSelection = False
    Indent = 19
    Align = alLeft
    ParentColor = False
    ParentCtl3D = False
    Ctl3D = True
    Options = [trCanDBNavigate, trSmartRecordCopy, trCheckHasChildren]
    SortType = stData
    SelectedIndex = -1
    TabOrder = 2
    ParentShowHint = False
    ShowHint = False
  end
  object ImageList: TImageList
    Left = 6
    Top = 6
    Bitmap = {
      494C010102000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001001000000000000008
      000000000000000000000000000000000000000000000000000000000000FE7F
      000000518020082190320000000000000000000000000000000000003E530031
      0031083090319052000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000088313E530820
      0073006380720820000008219862000000000000000000000000186380518072
      0063807108209031102118630000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000008310800185110218052
      88728072806210300071082090210831000000000000000000009031E07F8062
      8072807108019031905290511853000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010211851183110218851
      0873886200731021107100009862000000000000000000000000903200638862
      8062806108219032905194520000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010211031985110318852
      1073806280711030887190320000000000000000000000000000945208730873
      8872887208001863903290319062000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010319831983110310863
      1063106380721031907190320000000000000000000000000000945210730863
      1063906110530000FE7F18533E53000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000090319031986290219073
      1063887380728051105110530000000000000000000000000000905208630873
      8862087308310000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000945298629852985194529063
      9073106310638832907100000000000000000000000000000000905190739063
      8873907290310000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000985290621863986290321073
      1063FE7F90728852907208310000000000000000000000000000945290631063
      9063107390510000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000010633E533E53986294529073
      9073086308739052987208510000000000000000000000000000906290730000
      1073806288520000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000010633E533E53FE7F78631063
      0000000090519852FE7F88510000000000000000000000000000105390720831
      0031806190510000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000105318639051082110300800
      1063986200000851106108210000000000000000000000000000FE7F90319031
      0821102100000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000094520821903200210021
      0000FE7F00009031902100000000000000000000000000000000000090511063
      9032000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000090310000000090329052
      9051080018630000000000000000000000000000000000000000000018637863
      9051902100000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000018631863FE7F08201863
      0000905100009062080100000000000000000000000000000000000000001863
      1063000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001853903198720000
      0000000090319052000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FC0FF81F00000000F003F00700000000
      C001F00300000000C003F00700000000C007F00300000000C007F02300000000
      C007F03F000000008007F03F000000008007F03F000000008007F23F00000000
      8007F03F000000008007F07F00000000C10FF87F00000000D82FF87F00000000
      C14FFCFF00000000E39FFFFF0000000000000000000000000000000000000000
      000000000000}
  end
  object CSBarMDIChild1: TCSBarMDIChild
    Left = 62
    Top = 6
  end
  object ScrChild: TCSScrCtrlChild
    Master = dmData.ScrMaster
    Left = 90
    Top = 6
  end
  object Find: TCSDBFind
    Left = 34
    Top = 6
  end
  object hr: TCSADOQuery
    Parameters = <>
    Left = 6
    Top = 34
    object hrsysid: TStringField
      FieldName = 'sysid'
      Size = 4
    end
    object hrname: TStringField
      DisplayLabel = #21517#31216
      FieldName = 'name'
      Size = 30
    end
    object hritemcode: TStringField
      DisplayLabel = #32534#21495
      FieldName = 'itemcode'
      Size = 10
    end
    object hrscr_user: TStringField
      DisplayLabel = #29992#25143#21517
      FieldName = 'scr_user'
      Size = 30
    end
    object hrparent_sysid: TStringField
      FieldName = 'parent_sysid'
      Size = 4
    end
    object hrcode_level: TStringField
      DisplayLabel = #32423#21035
      FieldName = 'code_level'
      Size = 1
    end
    object hrperson_sysid: TStringField
      DisplayLabel = #20154#21592'ID'
      FieldName = 'person_sysid'
    end
  end
  object person_baseinfo: TCSADOQuery
    Parameters = <>
    Left = 34
    Top = 34
  end
  object scr_items_bpaspr: TCSADOQuery
    Parameters = <>
    Left = 62
    Top = 34
  end
  object hrd: TDataSource
    DataSet = hr
    Left = 6
    Top = 62
  end
  object scr_items_bpasprd: TDataSource
    DataSet = scr_items_bpaspr
    Left = 62
    Top = 62
  end
  object person_baseinfod: TDataSource
    DataSet = person_baseinfo
    Left = 34
    Top = 62
  end
  object nation: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltReadOnly
    CommandTimeOut = 300
    Parameters = <>
    Left = 6
    Top = 95
  end
  object nationd: TDataSource
    DataSet = nation
    Left = 34
    Top = 95
  end
  object marrystatus: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltReadOnly
    CommandTimeOut = 300
    Parameters = <>
    Left = 62
    Top = 95
  end
  object marrystatusd: TDataSource
    DataSet = marrystatus
    Left = 90
    Top = 95
  end
  object sex: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltReadOnly
    CommandTimeOut = 300
    Parameters = <>
    Left = 118
    Top = 95
  end
  object sexd: TDataSource
    DataSet = sex
    Left = 146
    Top = 95
  end
  object edudegree: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltReadOnly
    CommandTimeOut = 300
    Parameters = <>
    Left = 118
    Top = 123
  end
  object edudegreed: TDataSource
    DataSet = edudegree
    Left = 146
    Top = 123
  end
  object zzqk: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltReadOnly
    CommandTimeOut = 300
    Parameters = <>
    Left = 6
    Top = 123
  end
  object zzqkd: TDataSource
    DataSet = zzqk
    Left = 34
    Top = 123
  end
  object degree: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltReadOnly
    CommandTimeOut = 300
    Parameters = <>
    Left = 62
    Top = 123
  end
  object degreed: TDataSource
    DataSet = degree
    Left = 90
    Top = 123
  end
end
