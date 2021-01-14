object frmAcctManage: TfrmAcctManage
  Left = 24
  Top = 45
  Width = 776
  Height = 480
  Caption = #20107#25925#31649#29702
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object Splitter1: TSplitter
    Left = 0
    Top = 257
    Width = 768
    Height = 3
    Cursor = crSizeNS
    Align = alTop
  end
  object Panel1: TPanel
    Left = 0
    Top = 425
    Width = 768
    Height = 28
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 0
    object Panel5: TPanel
      Left = 613
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
    object bbtnSave: TBitBtn
      Left = 3
      Top = 3
      Width = 60
      Height = 22
      Caption = #20445#23384
      Enabled = False
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
      Enabled = False
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
    object bbtnConfirm: TBitBtn
      Left = 127
      Top = 3
      Width = 60
      Height = 22
      Caption = #30830#35748
      TabOrder = 3
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
      Left = 189
      Top = 3
      Width = 60
      Height = 22
      Hint = #25171#21360#21015#34920#21306#22495#30340#20869#23481
      Caption = #25171#21360
      TabOrder = 4
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
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 768
    Height = 257
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 1
    object pcMain: TPageControl
      Left = 1
      Top = 1
      Width = 766
      Height = 255
      ActivePage = TabSheet3
      Align = alClient
      MultiLine = True
      TabIndex = 2
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = #20107#25925#22522#26412#24773#20917
        object ScrollBox1: TScrollBox
          Left = 0
          Top = 0
          Width = 758
          Height = 211
          Align = alClient
          TabOrder = 0
          object GroupBox3: TGroupBox
            Left = 12
            Top = 3
            Width = 689
            Height = 110
            Caption = ' '#21333#20301#22522#26412#24773#20917' '
            TabOrder = 0
            object Label9: TLabel
              Left = 8
              Top = 16
              Width = 60
              Height = 12
              Caption = #20107#25925#21333#20301#65306
            end
            object Label10: TLabel
              Left = 322
              Top = 16
              Width = 84
              Height = 12
              Caption = #20107#25925#21333#20301#20195#30721#65306
            end
            object Label24: TLabel
              Left = 255
              Top = 39
              Width = 48
              Height = 12
              Caption = #32852#31995#20154#65306
            end
            object Label41: TLabel
              Left = 474
              Top = 39
              Width = 60
              Height = 12
              Caption = #20027#31649#37096#38376#65306
            end
            object Label1: TLabel
              Left = 8
              Top = 62
              Width = 60
              Height = 12
              Caption = #32852#31995#30005#35805#65306
            end
            object Label11: TLabel
              Left = 243
              Top = 62
              Width = 60
              Height = 12
              Caption = #37038#25919#32534#30721#65306
            end
            object Label25: TLabel
              Left = 498
              Top = 62
              Width = 36
              Height = 12
              Caption = #20256#30495#65306
            end
            object Label12: TLabel
              Left = 486
              Top = 85
              Width = 48
              Height = 12
              Caption = 'E-mail'#65306
            end
            object Label2: TLabel
              Left = 8
              Top = 39
              Width = 60
              Height = 12
              Caption = #20225#19994#24615#36136#65306
            end
            object Label38: TLabel
              Left = 8
              Top = 85
              Width = 60
              Height = 12
              Caption = #21333#20301#22320#22336#65306
            end
            object eAcctCom: TDBEditEh
              Left = 68
              Top = 13
              Width = 235
              Height = 18
              Color = clSkyBlue
              Ctl3D = False
              DataField = 'acct_com'
              DataSource = Generald
              EditButtons = <
                item
                  Style = ebsEllipsisEh
                end>
              ParentCtl3D = False
              TabOrder = 0
              Visible = True
            end
            object eAcctRegNo: TDBEditEh
              Left = 405
              Top = 13
              Width = 122
              Height = 18
              Color = clSkyBlue
              Ctl3D = False
              DataField = 'acct_reg_no'
              DataSource = Generald
              EditButtons = <>
              Enabled = False
              ParentCtl3D = False
              TabOrder = 1
              Visible = True
            end
            object eContact: TDBEditEh
              Left = 302
              Top = 36
              Width = 165
              Height = 18
              Ctl3D = False
              DataField = 'contact'
              DataSource = Generald
              EditButtons = <>
              ParentCtl3D = False
              TabOrder = 2
              Visible = True
            end
            object eChiefDept: TDBEditEh
              Left = 533
              Top = 36
              Width = 146
              Height = 18
              Ctl3D = False
              DataField = 'chief_dept'
              DataSource = Generald
              EditButtons = <>
              ParentCtl3D = False
              TabOrder = 3
              Visible = True
            end
            object eTel: TDBEditEh
              Left = 68
              Top = 59
              Width = 166
              Height = 18
              Ctl3D = False
              DataField = 'tel'
              DataSource = Generald
              EditButtons = <>
              ParentCtl3D = False
              TabOrder = 4
              Visible = True
            end
            object eZip: TDBEditEh
              Left = 302
              Top = 59
              Width = 165
              Height = 18
              Ctl3D = False
              DataField = 'zip'
              DataSource = Generald
              EditButtons = <>
              ParentCtl3D = False
              TabOrder = 5
              Visible = True
            end
            object eFax: TDBEditEh
              Left = 533
              Top = 59
              Width = 146
              Height = 18
              Ctl3D = False
              DataField = 'fax'
              DataSource = Generald
              EditButtons = <>
              ParentCtl3D = False
              TabOrder = 6
              Visible = True
            end
            object eEmail: TDBEditEh
              Left = 533
              Top = 82
              Width = 146
              Height = 18
              Ctl3D = False
              DataField = 'email'
              DataSource = Generald
              EditButtons = <>
              ParentCtl3D = False
              TabOrder = 7
              Visible = True
            end
            object lcmbOrgProperty: TdxDBPickEdit
              Left = 67
              Top = 35
              Width = 168
              TabOrder = 8
              DataField = 'org_property'
              DataSource = Generald
              StyleController = dmData.dxStyleCtrl
              DropDownListStyle = True
              Items.Strings = (
                #20840#27665
                #38598#20307
                #32929#20221
                #21512#36164
                #29420#36164
                #31169#33829
                #20010#20307)
            end
            object eOrgAdress: TDBEditEh
              Left = 68
              Top = 82
              Width = 399
              Height = 18
              Ctl3D = False
              DataField = 'org_address'
              DataSource = Generald
              EditButtons = <>
              ParentCtl3D = False
              TabOrder = 9
              Visible = True
            end
          end
          object GroupBox2: TGroupBox
            Left = 12
            Top = 117
            Width = 689
            Height = 64
            Caption = ' '#20107#25925#21457#29983
            TabOrder = 1
            object Label18: TLabel
              Left = 8
              Top = 39
              Width = 60
              Height = 12
              Caption = #21457#29983#22320#22336#65306
            end
            object Label16: TLabel
              Left = 20
              Top = 16
              Width = 48
              Height = 12
              Caption = #30465'('#24066')'#65306
            end
            object Label17: TLabel
              Left = 180
              Top = 16
              Width = 24
              Height = 12
              Caption = #24066#65306
            end
            object Label19: TLabel
              Left = 316
              Top = 16
              Width = 48
              Height = 12
              Caption = #21306'('#21439')'#65306
            end
            object Label39: TLabel
              Left = 498
              Top = 16
              Width = 36
              Height = 12
              Caption = #20065#38215#65306
            end
            object Label43: TLabel
              Left = 474
              Top = 39
              Width = 60
              Height = 12
              Caption = #21457#29983#26102#38388#65306
            end
            object eAcctAddress: TDBEditEh
              Left = 68
              Top = 36
              Width = 399
              Height = 18
              Color = clSkyBlue
              Ctl3D = False
              DataField = 'acct_address'
              DataSource = Generald
              EditButtons = <>
              ParentCtl3D = False
              TabOrder = 0
              Visible = True
            end
            object lcmbProvince: TDBLookupComboboxEh
              Left = 68
              Top = 13
              Width = 103
              Height = 18
              Color = clSkyBlue
              Ctl3D = False
              DataField = 'province_id'
              DataSource = Generald
              EditButtons = <>
              KeyField = 'id'
              ListField = 'name'
              ListSource = provinced
              ParentCtl3D = False
              TabOrder = 1
              Visible = True
              OnKeyValueChanged = lcmbProvinceKeyValueChanged
            end
            object lcmbCity: TDBLookupComboboxEh
              Left = 204
              Top = 13
              Width = 103
              Height = 18
              Color = clSkyBlue
              Ctl3D = False
              DataField = 'city_id'
              DataSource = Generald
              EditButtons = <>
              KeyField = 'id'
              ListField = 'name'
              ListSource = cityd
              ParentCtl3D = False
              TabOrder = 2
              Visible = True
              OnKeyValueChanged = lcmbCityKeyValueChanged
            end
            object lcmbBorough: TDBLookupComboboxEh
              Left = 364
              Top = 13
              Width = 103
              Height = 18
              Color = clSkyBlue
              Ctl3D = False
              DataField = 'borough_id'
              DataSource = Generald
              EditButtons = <>
              KeyField = 'id'
              ListField = 'name'
              ListSource = boroughd
              ParentCtl3D = False
              TabOrder = 3
              Visible = True
            end
            object eTown: TDBEditEh
              Left = 534
              Top = 13
              Width = 144
              Height = 18
              Color = clSkyBlue
              Ctl3D = False
              DataField = 'town'
              DataSource = Generald
              EditButtons = <>
              ParentCtl3D = False
              TabOrder = 4
              Visible = True
            end
            object CSdxDBDateEdit1: TCSdxDBDateEdit
              Left = 533
              Top = 35
              Width = 146
              Color = clSkyBlue
              Style.BorderStyle = xbsSingle
              Style.ButtonStyle = btsFlat
              TabOrder = 5
              DataField = 'acct_date'
              DataSource = Generald
              DateOnError = deToday
              FixedDateFormat = 'yyyy-MM-dd'
              StoredValues = 4
            end
          end
          object GroupBox4: TGroupBox
            Left = 12
            Top = 184
            Width = 689
            Height = 132
            Caption = ' '#35774#22791#22522#26412#24773#20917' '
            TabOrder = 2
            object Label6: TLabel
              Left = 242
              Top = 62
              Width = 60
              Height = 12
              Caption = #35774#22791#31867#21035#65306
            end
            object labDevName: TLabel
              Left = 8
              Top = 38
              Width = 60
              Height = 12
              Caption = #35774#22791#21517#31216#65306
            end
            object Label13: TLabel
              Left = 242
              Top = 39
              Width = 60
              Height = 12
              Caption = #35774#22791#22411#21495#65306
            end
            object Label4: TLabel
              Left = 8
              Top = 16
              Width = 60
              Height = 12
              Caption = #35774#22791#20195#30721#65306
            end
            object labUseCertId: TLabel
              Left = 230
              Top = 16
              Width = 72
              Height = 12
              Caption = #20351#29992#35777#32534#21495#65306
            end
            object labDevInnerId: TLabel
              Left = 449
              Top = 16
              Width = 84
              Height = 12
              Caption = #35774#22791#20869#37096#32534#21495#65306
            end
            object Label8: TLabel
              Left = 473
              Top = 40
              Width = 60
              Height = 12
              Caption = #35774#22791#29992#36884#65306
            end
            object Label40: TLabel
              Left = 8
              Top = 62
              Width = 60
              Height = 12
              Caption = #35774#22791#31181#31867#65306
            end
            object Label42: TLabel
              Left = 473
              Top = 62
              Width = 60
              Height = 12
              Caption = #35774#22791#20998#31867#65306
            end
            object Label20: TLabel
              Left = 7
              Top = 84
              Width = 60
              Height = 12
              Caption = #21046#36896#21333#20301#65306
            end
            object Label27: TLabel
              Left = 7
              Top = 107
              Width = 60
              Height = 12
              Caption = #35774#35745#21333#20301#65306
            end
            object Label21: TLabel
              Left = 242
              Top = 107
              Width = 60
              Height = 12
              Caption = #23433#35013#21333#20301#65306
            end
            object Label29: TLabel
              Left = 242
              Top = 84
              Width = 60
              Height = 12
              Caption = #26816#39564#21333#20301#65306
            end
            object Label14: TLabel
              Left = 474
              Top = 107
              Width = 60
              Height = 12
              Caption = #25237#29992#26085#26399#65306
            end
            object Label15: TLabel
              Left = 474
              Top = 84
              Width = 60
              Height = 12
              Caption = #26816#39564#26085#26399#65306
            end
            object eDevName: TDBEditEh
              Left = 68
              Top = 36
              Width = 157
              Height = 18
              Color = clSkyBlue
              Ctl3D = False
              DataField = 'dev_name'
              DataSource = Generald
              EditButtons = <>
              ParentCtl3D = False
              TabOrder = 0
              Visible = True
            end
            object eDevType: TDBEditEh
              Left = 302
              Top = 36
              Width = 141
              Height = 18
              Color = clSkyBlue
              Ctl3D = False
              DataField = 'dev_type'
              DataSource = Generald
              EditButtons = <>
              ParentCtl3D = False
              TabOrder = 1
              Visible = True
            end
            object eDevRegNo: TDBEditEh
              Left = 68
              Top = 13
              Width = 157
              Height = 18
              Ctl3D = False
              DataField = 'dev_reg_no'
              DataSource = Generald
              EditButtons = <>
              MaxLength = 23
              ParentCtl3D = False
              TabOrder = 2
              Visible = True
              EditMask = '9999-999999-999999-9999;0; '
            end
            object eDevCertNo: TDBEditEh
              Left = 302
              Top = 13
              Width = 141
              Height = 18
              Ctl3D = False
              DataField = 'dev_cert_no'
              DataSource = Generald
              EditButtons = <>
              ParentCtl3D = False
              TabOrder = 3
              Visible = True
            end
            object eDevInnerNo: TDBEditEh
              Left = 533
              Top = 13
              Width = 146
              Height = 18
              Ctl3D = False
              DataField = 'dev_inner_no'
              DataSource = Generald
              EditButtons = <>
              ParentCtl3D = False
              TabOrder = 4
              Visible = True
            end
            object lcmbDevCategory: TDBLookupComboboxEh
              Left = 302
              Top = 59
              Width = 141
              Height = 18
              Color = clSkyBlue
              Ctl3D = False
              DataField = 'dev_category_id'
              DataSource = Generald
              EditButtons = <>
              KeyField = 'id'
              ListField = 'name'
              ListSource = DevCategoryd
              ParentCtl3D = False
              TabOrder = 5
              Visible = True
            end
            object lcmbDevPurpose: TDBLookupComboboxEh
              Left = 533
              Top = 36
              Width = 146
              Height = 18
              Color = clSkyBlue
              Ctl3D = False
              DataField = 'dev_purpose_id'
              DataSource = Generald
              EditButtons = <>
              KeyField = 'id'
              ListField = 'name'
              ListSource = DevPurposed
              ParentCtl3D = False
              TabOrder = 6
              Visible = True
            end
            object lcmbDevKind: TDBLookupComboboxEh
              Left = 68
              Top = 59
              Width = 157
              Height = 18
              Color = clSkyBlue
              Ctl3D = False
              DataField = 'dev_kind_id'
              DataSource = Generald
              EditButtons = <>
              KeyField = 'id'
              ListField = 'name'
              ListSource = DevKindd
              ParentCtl3D = False
              TabOrder = 7
              Visible = True
            end
            object lcmbDevSort: TDBLookupComboboxEh
              Left = 533
              Top = 59
              Width = 146
              Height = 18
              Color = clSkyBlue
              Ctl3D = False
              DataField = 'dev_sort_id'
              DataSource = Generald
              EditButtons = <>
              KeyField = 'id'
              ListField = 'name'
              ListSource = DevSortd
              ParentCtl3D = False
              TabOrder = 8
              Visible = True
            end
            object deUseDate: TCSdxDBDateEdit
              Left = 532
              Top = 104
              Width = 148
              Style.BorderStyle = xbsSingle
              Style.ButtonStyle = btsFlat
              TabOrder = 9
              DataField = 'use_date'
              DataSource = Generald
              DateOnError = deToday
              FixedDateFormat = 'yyyy-MM-dd'
              StoredValues = 4
            end
            object deVerifyDate: TCSdxDBDateEdit
              Left = 532
              Top = 81
              Width = 148
              Style.BorderStyle = xbsSingle
              Style.ButtonStyle = btsFlat
              TabOrder = 10
              DataField = 'verify_date'
              DataSource = Generald
              DateOnError = deToday
              FixedDateFormat = 'yyyy-MM-dd'
              StoredValues = 4
            end
            object eManuCom: TDBEditEh
              Left = 68
              Top = 82
              Width = 157
              Height = 18
              Color = clSkyBlue
              Ctl3D = False
              DataField = 'manu_com'
              DataSource = Generald
              EditButtons = <
                item
                  Style = ebsEllipsisEh
                end>
              ParentCtl3D = False
              TabOrder = 11
              Visible = True
            end
            object eDesignCom: TDBEditEh
              Left = 68
              Top = 105
              Width = 157
              Height = 18
              Color = clSkyBlue
              Ctl3D = False
              DataField = 'design_com'
              DataSource = Generald
              EditButtons = <
                item
                  Style = ebsEllipsisEh
                end>
              ParentCtl3D = False
              TabOrder = 12
              Visible = True
            end
            object eVerifyCom: TDBEditEh
              Left = 302
              Top = 82
              Width = 157
              Height = 18
              Color = clSkyBlue
              Ctl3D = False
              DataField = 'verify_com'
              DataSource = Generald
              EditButtons = <
                item
                  Style = ebsEllipsisEh
                end>
              ParentCtl3D = False
              TabOrder = 13
              Visible = True
            end
            object eInstCom: TDBEditEh
              Left = 302
              Top = 105
              Width = 157
              Height = 18
              Color = clSkyBlue
              Ctl3D = False
              DataField = 'inst_com'
              DataSource = Generald
              EditButtons = <
                item
                  Style = ebsEllipsisEh
                end>
              ParentCtl3D = False
              TabOrder = 14
              Visible = True
            end
          end
          object GroupBox5: TGroupBox
            Left = 12
            Top = 319
            Width = 689
            Height = 109
            Caption = ' '#20107#25925#22522#26412#24773#20917
            TabOrder = 3
            object Label7: TLabel
              Left = 8
              Top = 16
              Width = 60
              Height = 12
              Caption = #20107#25925#31867#21035#65306
            end
            object Label3: TLabel
              Left = 474
              Top = 85
              Width = 60
              Height = 12
              Caption = #25209#22797#26102#38388#65306
            end
            object Label23: TLabel
              Left = 474
              Top = 16
              Width = 60
              Height = 12
              Caption = #20855#20307#21407#22240#65306
            end
            object Label26: TLabel
              Left = 8
              Top = 38
              Width = 60
              Height = 12
              Caption = #20107#25925#24418#24335#65306
            end
            object Label28: TLabel
              Left = 242
              Top = 40
              Width = 60
              Height = 12
              Caption = #20107#25925#29305#24449#65306
            end
            object Label30: TLabel
              Left = 8
              Top = 85
              Width = 60
              Height = 12
              Caption = #30452#25509#25439#22833#65306
            end
            object Label31: TLabel
              Left = 242
              Top = 85
              Width = 60
              Height = 12
              Caption = #38388#25509#25439#22833#65306
            end
            object Label32: TLabel
              Left = 8
              Top = 62
              Width = 60
              Height = 12
              Caption = #27515#20129#20154#25968#65306
            end
            object Label33: TLabel
              Left = 242
              Top = 62
              Width = 60
              Height = 12
              Caption = #37325#20260#20154#25968#65306
            end
            object Label34: TLabel
              Left = 474
              Top = 62
              Width = 60
              Height = 12
              Caption = #36731#20260#20154#25968#65306
            end
            object Label35: TLabel
              Left = 474
              Top = 39
              Width = 60
              Height = 12
              Caption = #29305#27530#20998#31867#65306
            end
            object Label22: TLabel
              Left = 242
              Top = 16
              Width = 60
              Height = 12
              Caption = #20107#25925#21407#22240#65306
            end
            object deAuthDate: TCSdxDBDateEdit
              Left = 532
              Top = 81
              Width = 148
              Style.BorderStyle = xbsSingle
              Style.ButtonStyle = btsFlat
              TabOrder = 0
              DataField = 'auth_date'
              DataSource = Generald
              DateOnError = deToday
              FixedDateFormat = 'yyyy-MM-dd'
              StoredValues = 4
            end
            object eDirectLoss: TDBEditEh
              Left = 68
              Top = 82
              Width = 157
              Height = 18
              Ctl3D = False
              DataField = 'direct_loss'
              DataSource = Generald
              EditButtons = <>
              ParentCtl3D = False
              TabOrder = 1
              Visible = True
            end
            object eIndirectLoss: TDBEditEh
              Left = 302
              Top = 82
              Width = 141
              Height = 18
              Ctl3D = False
              DataField = 'indirect_loss'
              DataSource = Generald
              EditButtons = <>
              ParentCtl3D = False
              TabOrder = 2
              Visible = True
            end
            object eDeadNum: TDBEditEh
              Left = 68
              Top = 59
              Width = 157
              Height = 18
              Ctl3D = False
              DataField = 'dead_num'
              DataSource = Generald
              EditButtons = <>
              ParentCtl3D = False
              TabOrder = 3
              Visible = True
            end
            object eHighHarmNum: TDBEditEh
              Left = 302
              Top = 59
              Width = 141
              Height = 18
              Ctl3D = False
              DataField = 'high_harm_num'
              DataSource = Generald
              EditButtons = <>
              ParentCtl3D = False
              TabOrder = 4
              Visible = True
            end
            object eLightHarmNum: TDBEditEh
              Left = 533
              Top = 59
              Width = 146
              Height = 18
              Ctl3D = False
              DataField = 'light_harm_num'
              DataSource = Generald
              EditButtons = <>
              ParentCtl3D = False
              TabOrder = 5
              Visible = True
            end
            object eSpecKind: TDBEditEh
              Left = 533
              Top = 36
              Width = 146
              Height = 18
              Ctl3D = False
              DataField = 'spec_kind'
              DataSource = Generald
              EditButtons = <>
              ParentCtl3D = False
              TabOrder = 6
              Visible = True
            end
            object lcmbAcctKind: TDBLookupComboboxEh
              Left = 68
              Top = 13
              Width = 157
              Height = 18
              Color = clSkyBlue
              Ctl3D = False
              DataField = 'acct_kind_id'
              DataSource = Generald
              EditButtons = <>
              KeyField = 'id'
              ListField = 'name'
              ListSource = AcctKindd
              ParentCtl3D = False
              TabOrder = 7
              Visible = True
            end
            object lcmbAcctReason: TDBLookupComboboxEh
              Left = 302
              Top = 13
              Width = 141
              Height = 18
              Color = clSkyBlue
              Ctl3D = False
              DataField = 'acct_reason_id'
              DataSource = Generald
              EditButtons = <>
              KeyField = 'id'
              ListField = 'name'
              ListSource = AcctReasond
              ParentCtl3D = False
              TabOrder = 8
              Visible = True
            end
            object lcmbReasonDetail: TDBLookupComboboxEh
              Left = 533
              Top = 13
              Width = 146
              Height = 18
              Color = clSkyBlue
              Ctl3D = False
              DataField = 'reason_detail_id'
              DataSource = Generald
              EditButtons = <>
              KeyField = 'id'
              ListField = 'name'
              ListSource = ReasonDetaild
              ParentCtl3D = False
              TabOrder = 9
              Visible = True
            end
            object lcmbAcctType: TDBLookupComboboxEh
              Left = 68
              Top = 36
              Width = 157
              Height = 18
              Color = clSkyBlue
              Ctl3D = False
              DataField = 'acct_type_id'
              DataSource = Generald
              EditButtons = <>
              KeyField = 'id'
              ListField = 'name'
              ListSource = AcctTyped
              ParentCtl3D = False
              TabOrder = 10
              Visible = True
            end
            object lcmbAcctChar: TDBLookupComboboxEh
              Left = 302
              Top = 36
              Width = 141
              Height = 18
              Color = clSkyBlue
              Ctl3D = False
              DataField = 'acct_char_id'
              DataSource = Generald
              EditButtons = <>
              KeyField = 'id'
              ListField = 'name'
              ListSource = AcctChard
              ParentCtl3D = False
              TabOrder = 11
              Visible = True
            end
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = #27515#20129#20154#21592#21015#34920
        ImageIndex = 1
        object Panel6: TPanel
          Left = 0
          Top = 0
          Width = 758
          Height = 33
          Align = alTop
          BevelOuter = bvNone
          Caption = #20107#25925#27515#20129#24773#20917#19968#35272#34920
          TabOrder = 0
        end
        object grdDeathDetail: TDBGridEh
          Left = 0
          Top = 33
          Width = 758
          Height = 150
          Align = alClient
          AllowedOperations = []
          AllowedSelections = [gstRecordBookmarks, gstRectangle, gstAll]
          DataSource = DeathDetaild
          Flat = True
          FooterColor = clWindow
          FooterFont.Charset = GB2312_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -12
          FooterFont.Name = #23435#20307
          FooterFont.Style = []
          InternalSort = True
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghFitRowHeightToText, dghAutoSortMarking, dghMultiSortMarking, dghTraceColSizing]
          RowHeight = 2
          RowLines = 1
          TabOrder = 1
          TitleFont.Charset = GB2312_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          Columns = <
            item
              EditButtons = <>
              FieldName = 'acct_no'
              Footers = <>
              ReadOnly = True
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'acct_date'
              Footers = <>
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'no'
              Footers = <>
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'name'
              Footers = <>
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'sex'
              Footers = <>
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'age'
              Footers = <>
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'occup'
              Footers = <>
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'remark'
              Footers = <>
              Width = 100
            end>
        end
        object Panel7: TPanel
          Left = 0
          Top = 183
          Width = 758
          Height = 28
          Align = alBottom
          BevelOuter = bvLowered
          TabOrder = 2
          object Panel8: TPanel
            Left = 406
            Top = 1
            Width = 351
            Height = 26
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 0
            object bbtnAddDeathDetail: TBitBtn
              Left = 0
              Top = 2
              Width = 50
              Height = 22
              Hint = #28155#21152#35760#24405
              Caption = #28155#21152
              TabOrder = 0
              OnClick = bbtnAddDeathDetailClick
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
            object bbtnDeleteDeathDetail: TBitBtn
              Left = 50
              Top = 2
              Width = 50
              Height = 22
              Hint = #21024#38500#35760#24405
              Caption = #21024#38500
              TabOrder = 1
              OnClick = bbtnDeleteDeathDetailClick
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
            object navDeathDetail: TCSDBNavigator
              Left = 100
              Top = 2
              Width = 250
              Height = 22
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
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
          end
        end
      end
      object TabSheet3: TTabSheet
        Caption = #35774#22791#24773#20917#25551#36848
        ImageIndex = 2
        object Panel17: TPanel
          Left = 0
          Top = 0
          Width = 401
          Height = 211
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
          object GroupBox9: TGroupBox
            Left = 0
            Top = 85
            Width = 401
            Height = 89
            Align = alClient
            Caption = ' '#20107#25925#21069#35774#22791#29366#20917
            TabOrder = 0
            object mDevCircs: TdxDBMemo
              Left = 2
              Top = 14
              Width = 397
              Align = alClient
              TabOrder = 0
              DataField = 'dev_circs'
              DataSource = Generald
              StyleController = dmData.dxStyleCtrl
              Height = 73
            end
          end
          object GroupBox10: TGroupBox
            Left = 0
            Top = 0
            Width = 401
            Height = 85
            Align = alTop
            Caption = ' '#35774#22791#20027#35201#25216#26415#21442#25968
            TabOrder = 1
            object mTechParam: TdxDBMemo
              Left = 2
              Top = 14
              Width = 397
              Align = alClient
              TabOrder = 0
              DataField = 'tech_param'
              DataSource = Generald
              StyleController = dmData.dxStyleCtrl
              Height = 69
            end
          end
          object Panel29: TPanel
            Left = 0
            Top = 174
            Width = 401
            Height = 37
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 2
            object StaticText1: TStaticText
              Left = 4
              Top = 9
              Width = 388
              Height = 16
              Caption = #27880#65306#21253#25324#35774#35745#12289#21046#36896#12289#23433#35013#12289#23450#26816#21333#20301#65307#21046#36896#12289#23433#35013#12289#25237#29992#12289#23450#26816#26102#38388#65307
              TabOrder = 0
            end
            object StaticText2: TStaticText
              Left = 29
              Top = 25
              Width = 304
              Height = 16
              Caption = #20351#29992#27880#20876#30331#35760#24773#20917#12289#25805#20316#20154#21592#25345#35777#24773#20917#12289#20462#29702#25913#36896#24773#20917#31561
              TabOrder = 1
            end
          end
        end
        object Panel18: TPanel
          Left = 401
          Top = 0
          Width = 357
          Height = 211
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object Panel21: TPanel
            Left = 0
            Top = 0
            Width = 357
            Height = 19
            Align = alTop
            Alignment = taLeftJustify
            BevelOuter = bvNone
            Caption = #35774#22791#31616#22270#65306
            TabOrder = 0
          end
          object eDevDiagram: TdxDBGraphicEdit
            Left = 0
            Top = 19
            Width = 357
            Align = alClient
            TabOrder = 1
            ReadOnly = False
            StyleController = dmData.dxStyleCtrl
            CustomGraphic = True
            DataField = 'dev_diagram'
            DataSource = Generald
            Stretch = True
            OnAssignPicture = eDevDiagramAssignPicture
            OnGetGraphicClass = eDevDiagramGetGraphicClass
            Height = 192
            StoredValues = 64
          end
        end
      end
      object TabSheet4: TTabSheet
        Caption = #20107#25925#31616#35201#32463#36807
        ImageIndex = 3
        object Panel15: TPanel
          Left = 0
          Top = 0
          Width = 758
          Height = 19
          Align = alTop
          Alignment = taLeftJustify
          BevelOuter = bvNone
          Caption = #20107#25925#31616#35201#32463#36807#25551#36848#65306
          TabOrder = 0
        end
        object mAcctCourse: TdxDBMemo
          Left = 0
          Top = 19
          Width = 758
          Align = alClient
          TabOrder = 1
          DataField = 'acct_course'
          DataSource = Generald
          StyleController = dmData.dxStyleCtrl
          Height = 192
        end
      end
      object TabSheet5: TTabSheet
        Caption = #29616#22330#30772#22351#24773#20917
        ImageIndex = 4
        object Panel16: TPanel
          Left = 0
          Top = 0
          Width = 758
          Height = 19
          Align = alTop
          Alignment = taLeftJustify
          BevelOuter = bvNone
          Caption = #20107#25925#29616#22330#30772#22351#24773#20917'('#21442#29031#26377#20851#29031#29255')'#65306
          TabOrder = 0
        end
        object mDestroyCircs: TdxDBMemo
          Left = 0
          Top = 19
          Width = 758
          Align = alClient
          TabOrder = 1
          DataField = 'destroy_circs'
          DataSource = Generald
          StyleController = dmData.dxStyleCtrl
          Height = 192
        end
      end
      object TabSheet6: TTabSheet
        Caption = #29616#22330#29031#29255'1'#12289'2'
        ImageIndex = 5
        object Panel19: TPanel
          Left = 375
          Top = 0
          Width = 383
          Height = 211
          Align = alClient
          Alignment = taLeftJustify
          BevelOuter = bvNone
          TabOrder = 0
          object Panel23: TPanel
            Left = 0
            Top = 0
            Width = 383
            Height = 19
            Align = alTop
            Alignment = taLeftJustify
            BevelOuter = bvNone
            Caption = #29616#22330#29031#29255'2'#65306
            TabOrder = 0
          end
          object eSpotPhoto2: TdxDBGraphicEdit
            Left = 0
            Top = 19
            Width = 383
            Align = alClient
            TabOrder = 1
            ReadOnly = False
            StyleController = dmData.dxStyleCtrl
            CustomGraphic = True
            DataField = 'spot_photo2'
            DataSource = Generald
            Stretch = True
            OnAssignPicture = eSpotPhoto2AssignPicture
            OnGetGraphicClass = eSpotPhoto2GetGraphicClass
            Height = 192
            StoredValues = 64
          end
        end
        object Panel20: TPanel
          Left = 0
          Top = 0
          Width = 375
          Height = 211
          Align = alLeft
          Alignment = taLeftJustify
          BevelOuter = bvNone
          TabOrder = 1
          object Panel22: TPanel
            Left = 0
            Top = 0
            Width = 375
            Height = 19
            Align = alTop
            Alignment = taLeftJustify
            BevelOuter = bvNone
            Caption = #29616#22330#29031#29255'1'#65306
            TabOrder = 0
          end
          object eSpotPhoto1: TdxDBGraphicEdit
            Left = 0
            Top = 19
            Width = 375
            Align = alClient
            TabOrder = 1
            ReadOnly = False
            StyleController = dmData.dxStyleCtrl
            CustomGraphic = True
            DataField = 'spot_photo1'
            DataSource = Generald
            Stretch = True
            OnAssignPicture = eSpotPhoto1AssignPicture
            OnGetGraphicClass = eSpotPhoto1GetGraphicClass
            Height = 192
            StoredValues = 64
          end
        end
      end
      object TabSheet7: TTabSheet
        Caption = #29616#22330#29031#29255'3'#12289'4'
        ImageIndex = 6
        object Panel24: TPanel
          Left = 0
          Top = 0
          Width = 375
          Height = 211
          Align = alLeft
          Alignment = taLeftJustify
          BevelOuter = bvNone
          TabOrder = 0
          object Panel25: TPanel
            Left = 0
            Top = 0
            Width = 375
            Height = 19
            Align = alTop
            Alignment = taLeftJustify
            BevelOuter = bvNone
            Caption = #29616#22330#29031#29255'3'#65306
            TabOrder = 0
          end
          object eSpotPhoto3: TdxDBGraphicEdit
            Left = 0
            Top = 19
            Width = 375
            Align = alClient
            TabOrder = 1
            ReadOnly = False
            StyleController = dmData.dxStyleCtrl
            CustomGraphic = True
            DataField = 'spot_photo3'
            DataSource = Generald
            Stretch = True
            OnAssignPicture = eSpotPhoto3AssignPicture
            OnGetGraphicClass = eSpotPhoto3GetGraphicClass
            Height = 192
            StoredValues = 64
          end
        end
        object Panel27: TPanel
          Left = 375
          Top = 0
          Width = 383
          Height = 211
          Align = alClient
          Alignment = taLeftJustify
          BevelOuter = bvNone
          TabOrder = 1
          object Panel28: TPanel
            Left = 0
            Top = 0
            Width = 383
            Height = 19
            Align = alTop
            Alignment = taLeftJustify
            BevelOuter = bvNone
            Caption = #29616#22330#29031#29255'4'#65306
            TabOrder = 0
          end
          object eSpotPhoto4: TdxDBGraphicEdit
            Left = 0
            Top = 19
            Width = 383
            Align = alClient
            TabOrder = 1
            ReadOnly = False
            StyleController = dmData.dxStyleCtrl
            CustomGraphic = True
            DataField = 'spot_photo4'
            DataSource = Generald
            Stretch = True
            OnAssignPicture = eSpotPhoto4AssignPicture
            OnGetGraphicClass = eSpotPhoto4GetGraphicClass
            Height = 192
            StoredValues = 64
          end
        end
      end
      object TabSheet8: TTabSheet
        Caption = #21407#22240#20998#26512#21450#32467#35770
        ImageIndex = 7
        object Panel26: TPanel
          Left = 0
          Top = 0
          Width = 758
          Height = 20
          Align = alTop
          Alignment = taLeftJustify
          BevelOuter = bvNone
          Caption = #20107#25925#21407#22240#20998#26512#21450#32467#35770#65306
          TabOrder = 0
        end
        object mAcctResult: TdxDBMemo
          Left = 0
          Top = 20
          Width = 758
          Align = alClient
          TabOrder = 1
          DataField = 'acct_result'
          DataSource = Generald
          StyleController = dmData.dxStyleCtrl
          Height = 191
        end
      end
      object TabSheet10: TTabSheet
        Caption = #19981#21516#22788#29702#24847#35265
        ImageIndex = 9
        object Panel32: TPanel
          Left = 0
          Top = 0
          Width = 758
          Height = 24
          Align = alTop
          Alignment = taLeftJustify
          BevelOuter = bvNone
          Caption = #38468#39029#65306#20107#25925#35843#26597#32452#25104#21592#30340#19981#21516#24847#35265
          TabOrder = 0
        end
        object Panel33: TPanel
          Left = 0
          Top = 187
          Width = 758
          Height = 24
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 1
          object Panel34: TPanel
            Left = 264
            Top = 0
            Width = 494
            Height = 24
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 0
            object Label52: TLabel
              Left = 9
              Top = 7
              Width = 108
              Height = 12
              Caption = #25345#19981#21516#24847#35265#30340#25104#21592#65306
            end
            object Label53: TLabel
              Left = 326
              Top = 7
              Width = 60
              Height = 12
              Caption = #31614#23383#26085#26399#65306
            end
            object eInquiryDifferPersons: TDBEditEh
              Left = 117
              Top = 4
              Width = 196
              Height = 18
              Ctl3D = False
              DataField = 'inquiry_differ_persons'
              DataSource = Generald
              EditButtons = <>
              ParentCtl3D = False
              TabOrder = 0
              Visible = True
            end
            object deInquiryDifferDate: TCSdxDBDateEdit
              Left = 385
              Top = 3
              Width = 100
              Style.BorderStyle = xbsSingle
              Style.ButtonStyle = btsFlat
              TabOrder = 1
              DataField = 'inquiry_differ_date'
              DataSource = Generald
              DateOnError = deToday
              FixedDateFormat = 'yyyy-MM-dd'
              StoredValues = 4
            end
          end
        end
        object mInquiryDifferIdea: TdxDBMemo
          Left = 0
          Top = 24
          Width = 758
          Align = alClient
          TabOrder = 2
          DataField = 'inquiry_differ_idea'
          DataSource = Generald
          StyleController = dmData.dxStyleCtrl
          Height = 163
        end
      end
      object TabSheet11: TTabSheet
        Caption = #35843#26597#32452#20154#21592
        ImageIndex = 10
        object Panel9: TPanel
          Left = 0
          Top = 0
          Width = 758
          Height = 33
          Align = alTop
          BevelOuter = bvNone
          Caption = #20107#25925#35843#26597#32452#25104#21592#19968#35272#34920
          TabOrder = 0
        end
        object grdInquiryDetail: TDBGridEh
          Left = 0
          Top = 33
          Width = 758
          Height = 150
          Align = alClient
          AllowedOperations = []
          AllowedSelections = [gstRecordBookmarks, gstRectangle, gstAll]
          DataSource = InquiryDetaild
          Flat = True
          FooterColor = clWindow
          FooterFont.Charset = GB2312_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -12
          FooterFont.Name = #23435#20307
          FooterFont.Style = []
          InternalSort = True
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghFitRowHeightToText, dghAutoSortMarking, dghMultiSortMarking, dghTraceColSizing]
          RowHeight = 2
          RowLines = 1
          TabOrder = 1
          TitleFont.Charset = GB2312_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          Columns = <
            item
              EditButtons = <>
              FieldName = 'acct_no'
              Footers = <>
              ReadOnly = True
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'acct_date'
              Footers = <>
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'no'
              Footers = <>
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'name'
              Footers = <>
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'duty'
              Footers = <>
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'company'
              Footers = <>
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'tel'
              Footers = <>
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'occup'
              Footers = <>
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'remark'
              Footers = <>
              Width = 100
            end>
        end
        object Panel10: TPanel
          Left = 0
          Top = 183
          Width = 758
          Height = 28
          Align = alBottom
          BevelOuter = bvLowered
          TabOrder = 2
          object Panel11: TPanel
            Left = 406
            Top = 1
            Width = 351
            Height = 26
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 0
            object bbtnAddInquiryDetail: TBitBtn
              Left = 0
              Top = 2
              Width = 50
              Height = 22
              Hint = #28155#21152#35760#24405
              Caption = #28155#21152
              TabOrder = 0
              OnClick = bbtnAddInquiryDetailClick
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
            object bbtnDeleteInquiryDetail: TBitBtn
              Left = 50
              Top = 2
              Width = 50
              Height = 22
              Hint = #21024#38500#35760#24405
              Caption = #21024#38500
              TabOrder = 1
              OnClick = bbtnDeleteInquiryDetailClick
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
            object navInquiryDetail: TCSDBNavigator
              Left = 100
              Top = 2
              Width = 250
              Height = 22
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
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
          end
        end
      end
      object TabSheet12: TTabSheet
        Caption = #23545#25253#21578#30340#24847#35265
        ImageIndex = 11
        object Panel35: TPanel
          Left = 0
          Top = 0
          Width = 758
          Height = 22
          Align = alTop
          Alignment = taLeftJustify
          BevelOuter = bvNone
          Caption = #20107#25925#32452#32455#35843#26597#37096#38376#23545#20107#25925#35843#26597#25253#21578#20070#30340#24847#35265#65306
          TabOrder = 0
        end
        object Panel36: TPanel
          Left = 0
          Top = 183
          Width = 758
          Height = 28
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 1
          object Panel37: TPanel
            Left = 361
            Top = 0
            Width = 397
            Height = 28
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 0
            object Label55: TLabel
              Left = 5
              Top = 7
              Width = 120
              Height = 12
              Caption = #32452#32455#35843#26597#37096#38376#36127#36131#20154#65306
            end
            object Label56: TLabel
              Left = 230
              Top = 7
              Width = 60
              Height = 12
              Caption = #31614#23383#26085#26399#65306
            end
            object eInquiryDeptManager: TDBEditEh
              Left = 125
              Top = 4
              Width = 100
              Height = 18
              Ctl3D = False
              DataField = 'inquiry_dept_manager'
              DataSource = Generald
              EditButtons = <>
              ParentCtl3D = False
              TabOrder = 0
              Visible = True
            end
            object deInquiryDeptDate: TCSdxDBDateEdit
              Left = 289
              Top = 3
              Width = 100
              Style.BorderStyle = xbsSingle
              Style.ButtonStyle = btsFlat
              TabOrder = 1
              DataField = 'inquiry_dept_date'
              DataSource = Generald
              DateOnError = deToday
              FixedDateFormat = 'yyyy-MM-dd'
              StoredValues = 4
            end
          end
        end
        object mInquiryDeptIdea: TdxDBMemo
          Left = 0
          Top = 22
          Width = 758
          Align = alClient
          TabOrder = 2
          DataField = 'inquiry_dept_idea'
          DataSource = Generald
          StyleController = dmData.dxStyleCtrl
          Height = 161
        end
      end
      object TabSheet13: TTabSheet
        Caption = #24037#20316#35760#36733
        ImageIndex = 12
        object Panel12: TPanel
          Left = 0
          Top = 0
          Width = 758
          Height = 33
          Align = alTop
          BevelOuter = bvNone
          Caption = #20107#25925#35843#26597#24037#20316#24773#20917#35760#36733'('#26085#35760')'
          TabOrder = 0
        end
        object grdLogDetail: TDBGridEh
          Left = 0
          Top = 33
          Width = 758
          Height = 150
          Align = alClient
          AllowedOperations = []
          AllowedSelections = [gstRecordBookmarks, gstRectangle, gstAll]
          DataSource = LogDetaild
          Flat = True
          FooterColor = clWindow
          FooterFont.Charset = GB2312_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -12
          FooterFont.Name = #23435#20307
          FooterFont.Style = []
          InternalSort = True
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghFitRowHeightToText, dghAutoSortMarking, dghMultiSortMarking, dghTraceColSizing]
          RowHeight = 2
          RowLines = 1
          TabOrder = 1
          TitleFont.Charset = GB2312_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          Columns = <
            item
              EditButtons = <>
              FieldName = 'acct_no'
              Footers = <>
              ReadOnly = True
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'acct_date'
              Footers = <>
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'work_date'
              Footers = <>
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'work_content'
              Footers = <>
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'remark'
              Footers = <>
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'gzdw'
              Footers = <>
              Width = 100
            end>
        end
        object Panel13: TPanel
          Left = 0
          Top = 183
          Width = 758
          Height = 28
          Align = alBottom
          BevelOuter = bvLowered
          TabOrder = 2
          object Panel14: TPanel
            Left = 406
            Top = 1
            Width = 351
            Height = 26
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 0
            object bbtnAddLogDetail: TBitBtn
              Left = 0
              Top = 2
              Width = 50
              Height = 22
              Hint = #28155#21152#35760#24405
              Caption = #28155#21152
              TabOrder = 0
              OnClick = bbtnAddLogDetailClick
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
            object bbtnDeleteLogDetail: TBitBtn
              Left = 50
              Top = 2
              Width = 50
              Height = 22
              Hint = #21024#38500#35760#24405
              Caption = #21024#38500
              TabOrder = 1
              OnClick = bbtnDeleteLogDetailClick
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
            object navLogDetail: TCSDBNavigator
              Left = 100
              Top = 2
              Width = 250
              Height = 22
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
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
          end
        end
      end
      object TabSheet14: TTabSheet
        Caption = #24773#20917#22791#27880
        ImageIndex = 13
        object Panel38: TPanel
          Left = 0
          Top = 0
          Width = 758
          Height = 22
          Align = alTop
          Alignment = taLeftJustify
          BevelOuter = bvNone
          Caption = #26377#20851#26412#20107#25925#30340#22791#27880#20107#39033#65306
          TabOrder = 0
        end
        object mAcctRemark: TdxDBMemo
          Left = 0
          Top = 22
          Width = 758
          Align = alClient
          TabOrder = 1
          DataField = 'acct_remark'
          DataSource = Generald
          StyleController = dmData.dxStyleCtrl
          Height = 189
        end
      end
      object TabSheet9: TTabSheet
        Caption = #20107#25925#22788#29702#24847#35265
        ImageIndex = 8
        object Panel30: TPanel
          Left = 0
          Top = 182
          Width = 758
          Height = 29
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 0
          object Panel31: TPanel
            Left = 368
            Top = 0
            Width = 390
            Height = 29
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 0
            object Label50: TLabel
              Left = 9
              Top = 7
              Width = 108
              Height = 12
              Caption = #20107#25925#35843#26597#32452#36127#36131#20154#65306
            end
            object Label49: TLabel
              Left = 221
              Top = 7
              Width = 60
              Height = 12
              Caption = #31614#23383#26085#26399#65306
            end
            object eInquiryManager: TDBEditEh
              Left = 117
              Top = 4
              Width = 100
              Height = 18
              Ctl3D = False
              DataField = 'inquiry_manager'
              DataSource = Generald
              EditButtons = <>
              ParentCtl3D = False
              TabOrder = 0
              Visible = True
            end
            object deInquiryDate: TCSdxDBDateEdit
              Left = 285
              Top = 3
              Width = 100
              Style.BorderStyle = xbsSingle
              Style.ButtonStyle = btsFlat
              TabOrder = 1
              DataField = 'inquiry_date'
              DataSource = Generald
              DateOnError = deToday
              FixedDateFormat = 'yyyy-MM-dd'
              StoredValues = 4
            end
          end
        end
        object GroupBox6: TGroupBox
          Left = 0
          Top = 0
          Width = 423
          Height = 100
          Align = alLeft
          Caption = ' '#20107#25925#24615#36136#21644#36131#20219
          TabOrder = 1
          object mAcctDuty: TdxDBMemo
            Left = 2
            Top = 14
            Width = 419
            Align = alClient
            TabOrder = 0
            DataField = 'acct_duty'
            DataSource = Generald
            StyleController = dmData.dxStyleCtrl
            Height = 84
          end
        end
        object GroupBox7: TGroupBox
          Left = 0
          Top = 100
          Width = 758
          Height = 82
          Align = alBottom
          Caption = ' '#37325#22797#21457#29983#30340#25514#26045#24314#35758
          TabOrder = 2
          object mAcctMeasure: TdxDBMemo
            Left = 2
            Top = 14
            Width = 754
            Align = alClient
            TabOrder = 0
            DataField = 'acct_measure'
            DataSource = Generald
            StyleController = dmData.dxStyleCtrl
            Height = 66
          end
        end
        object GroupBox8: TGroupBox
          Left = 423
          Top = 0
          Width = 335
          Height = 100
          Align = alClient
          Caption = ' '#23545#20107#25925#26377#20851#36131#20219#20154#21592#30340#22788#29702#24847#35265#24314#35758
          TabOrder = 3
          object mAcctIdea: TdxDBMemo
            Left = 2
            Top = 14
            Width = 331
            Align = alClient
            TabOrder = 0
            DataField = 'acct_idea'
            DataSource = Generald
            StyleController = dmData.dxStyleCtrl
            Height = 84
          end
        end
      end
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 260
    Width = 768
    Height = 165
    Align = alClient
    Caption = ' '#20107#25925#19968#35272#34920' '
    TabOrder = 2
    object grdList: TDBGridEh
      Left = 2
      Top = 14
      Width = 764
      Height = 121
      Align = alClient
      AllowedOperations = []
      AllowedSelections = [gstRecordBookmarks, gstRectangle, gstAll]
      DataSource = Generald
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
          FieldName = 'acct_com'
          Footers = <>
          ReadOnly = True
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'acct_reg_no'
          Footers = <>
          ReadOnly = True
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'chief_dept'
          Footers = <>
          ReadOnly = True
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'org_property'
          Footers = <>
          ReadOnly = True
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'contact'
          Footers = <>
          ReadOnly = True
        end
        item
          EditButtons = <>
          FieldName = 'tel'
          Footers = <>
          ReadOnly = True
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'fax'
          Footers = <>
          ReadOnly = True
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'email'
          Footers = <>
          ReadOnly = True
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'zip'
          Footers = <>
          ReadOnly = True
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'province'
          Footers = <>
          ReadOnly = True
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'city'
          Footers = <>
          ReadOnly = True
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'borough'
          Footers = <>
          ReadOnly = True
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'town'
          Footers = <>
          ReadOnly = True
        end
        item
          EditButtons = <>
          FieldName = 'org_address'
          Footers = <>
          ReadOnly = True
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'acct_address'
          Footers = <>
          ReadOnly = True
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'acct_date'
          Footers = <>
          ReadOnly = True
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'auth_date'
          Footers = <>
          ReadOnly = True
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'dev_name'
          Footers = <>
          ReadOnly = True
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'dev_reg_no'
          Footers = <>
          ReadOnly = True
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'dev_cert_no'
          Footers = <>
          ReadOnly = True
        end
        item
          EditButtons = <>
          FieldName = 'dev_inner_no'
          Footers = <>
          ReadOnly = True
        end
        item
          EditButtons = <>
          FieldName = 'dev_type'
          Footers = <>
          ReadOnly = True
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'dev_purpose'
          Footers = <>
          ReadOnly = True
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'dev_kind'
          Footers = <>
          ReadOnly = True
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'dev_category'
          Footers = <>
          ReadOnly = True
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'dev_sort'
          Footers = <>
          ReadOnly = True
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'manu_com'
          Footers = <>
          ReadOnly = True
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'inst_com'
          Footers = <>
          ReadOnly = True
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'use_date'
          Footers = <>
          ReadOnly = True
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'design_com'
          Footers = <>
          ReadOnly = True
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'verify_com'
          Footers = <>
          ReadOnly = True
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'verify_date'
          Footers = <>
          ReadOnly = True
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'acct_kind'
          Footers = <>
          ReadOnly = True
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'acct_reason'
          Footers = <>
          ReadOnly = True
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'reason_detail'
          Footers = <>
          ReadOnly = True
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'acct_type'
          Footers = <>
          ReadOnly = True
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'acct_char'
          Footers = <>
          ReadOnly = True
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'spec_kind'
          Footers = <>
          ReadOnly = True
        end
        item
          Alignment = taLeftJustify
          EditButtons = <>
          FieldName = 'direct_loss'
          Footers = <>
          ReadOnly = True
          Width = 100
        end
        item
          Alignment = taLeftJustify
          EditButtons = <>
          FieldName = 'indirect_loss'
          Footers = <>
          ReadOnly = True
          Width = 100
        end
        item
          Alignment = taLeftJustify
          EditButtons = <>
          FieldName = 'dead_num'
          Footers = <>
          ReadOnly = True
          Width = 100
        end
        item
          Alignment = taLeftJustify
          EditButtons = <>
          FieldName = 'high_harm_num'
          Footers = <>
          ReadOnly = True
          Width = 100
        end
        item
          Alignment = taLeftJustify
          EditButtons = <>
          FieldName = 'light_harm_num'
          Footers = <>
          ReadOnly = True
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'tech_param'
          Footers = <>
          ReadOnly = True
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'dev_diagram'
          Footers = <>
          ReadOnly = True
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'dev_circs'
          Footers = <>
          ReadOnly = True
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'acct_course'
          Footers = <>
          ReadOnly = True
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'destroy_circs'
          Footers = <>
          ReadOnly = True
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'spot_photo1'
          Footers = <>
          ReadOnly = True
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'spot_photo2'
          Footers = <>
          ReadOnly = True
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'spot_photo3'
          Footers = <>
          ReadOnly = True
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'spot_photo4'
          Footers = <>
          ReadOnly = True
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'acct_result'
          Footers = <>
          ReadOnly = True
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'acct_duty'
          Footers = <>
          ReadOnly = True
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'acct_idea'
          Footers = <>
          ReadOnly = True
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'acct_measure'
          Footers = <>
          ReadOnly = True
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'inquiry_manager'
          Footers = <>
          ReadOnly = True
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'inquiry_date'
          Footers = <>
          ReadOnly = True
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'inquiry_differ_idea'
          Footers = <>
          ReadOnly = True
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'inquiry_differ_persons'
          Footers = <>
          ReadOnly = True
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'inquiry_differ_date'
          Footers = <>
          ReadOnly = True
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'inquiry_dept_idea'
          Footers = <>
          ReadOnly = True
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'inquiry_dept_manager'
          Footers = <>
          ReadOnly = True
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'inquiry_dept_date'
          Footers = <>
          ReadOnly = True
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'pass_circs'
          Footers = <>
          ReadOnly = True
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'acct_remark'
          Footers = <>
          ReadOnly = True
          Width = 100
        end>
    end
    object Panel3: TPanel
      Left = 2
      Top = 135
      Width = 764
      Height = 28
      Align = alBottom
      BevelOuter = bvLowered
      TabOrder = 1
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
      object Panel4: TPanel
        Left = 412
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
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
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
      end
    end
  end
  object CSBarMDIChild1: TCSBarMDIChild
    Left = 178
    Top = 306
  end
  object ScrChild: TCSScrCtrlChild
    Master = dmData.ScrMaster
    Left = 206
    Top = 306
  end
  object Temp: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltReadOnly
    Parameters = <>
    Left = 150
    Top = 306
  end
  object General: TCSADOQuery
    Connection = dmData.adocon
    AfterInsert = GeneralAfterInsert
    Parameters = <>
    SQL.Strings = (
      'select * from device.acct_info')
    Left = 38
    Top = 306
    object Generalsysid: TStringField
      DisplayLabel = #20107#25925#31995#32479#20195#30721
      FieldName = 'sysid'
    end
    object Generalacct_no: TStringField
      DisplayLabel = #20107#25925#26631#35782
      FieldName = 'acct_no'
      Size = 100
    end
    object Generalacct_com: TStringField
      DisplayLabel = #20107#25925#21333#20301
      FieldName = 'acct_com'
      Size = 60
    end
    object Generalacct_reg_no: TStringField
      DisplayLabel = #26426#26500#20195#30721
      FieldName = 'acct_reg_no'
      Size = 24
    end
    object Generalchief_dept: TStringField
      DisplayLabel = #20027#31649#37096#38376
      FieldName = 'chief_dept'
      Size = 30
    end
    object Generalorg_property: TStringField
      DisplayLabel = #20225#19994#24615#36136
      FieldName = 'org_property'
      Size = 12
    end
    object Generalcontact: TStringField
      DisplayLabel = #32852#31995#20154
      FieldName = 'contact'
      Size = 16
    end
    object Generaltel: TStringField
      DisplayLabel = #30005#35805
      FieldName = 'tel'
      Size = 28
    end
    object Generalfax: TStringField
      DisplayLabel = #20256#30495
      FieldName = 'fax'
      Size = 14
    end
    object Generalemail: TStringField
      DisplayLabel = 'E-mail'
      FieldName = 'email'
      Size = 30
    end
    object Generalzip: TStringField
      DisplayLabel = #37038#25919#32534#30721
      FieldName = 'zip'
      Size = 8
    end
    object Generalprovince_id: TStringField
      DisplayLabel = #30465
      FieldName = 'province_id'
      Size = 6
    end
    object Generalprovince: TStringField
      DisplayLabel = #30465
      FieldName = 'province'
      Size = 50
    end
    object Generalcity_id: TStringField
      DisplayLabel = #22320#24066
      FieldName = 'city_id'
      Size = 6
    end
    object Generalcity: TStringField
      DisplayLabel = #22320#24066
      FieldName = 'city'
      Size = 50
    end
    object Generalborough_id: TStringField
      DisplayLabel = #21306#21439
      FieldName = 'borough_id'
      Size = 6
    end
    object Generalborough: TStringField
      DisplayLabel = #21306#21439
      FieldName = 'borough'
      Size = 50
    end
    object Generaltown: TStringField
      DisplayLabel = #35774#22791#20065#38215
      FieldName = 'town'
      Size = 16
    end
    object Generalorg_address: TStringField
      DisplayLabel = #20351#29992#21333#20301#22320#28857
      FieldName = 'org_address'
      Size = 40
    end
    object Generalacct_address: TStringField
      DisplayLabel = #20107#25925#21457#29983#22320#28857
      FieldName = 'acct_address'
      Size = 60
    end
    object Generalacct_date: TStringField
      DisplayLabel = #20107#25925#21457#29983#26102#38388
      FieldName = 'acct_date'
    end
    object Generalauth_date: TStringField
      DisplayLabel = #25209#22797#26102#38388
      FieldName = 'auth_date'
      Size = 10
    end
    object Generaldev_name: TStringField
      DisplayLabel = #35774#22791#21517#31216
      FieldName = 'dev_name'
      Size = 30
    end
    object Generaldev_reg_no: TStringField
      DisplayLabel = #35774#22791#27880#20876#20195#30721
      FieldName = 'dev_reg_no'
      Size = 30
    end
    object Generaldev_cert_no: TStringField
      DisplayLabel = #20351#29992#35777#32534#21495
      FieldName = 'dev_cert_no'
      Size = 16
    end
    object Generaldev_inner_no: TStringField
      DisplayLabel = #21333#20301#20869#37096#32534#21495
      FieldName = 'dev_inner_no'
      Size = 16
    end
    object Generaldev_type: TStringField
      DisplayLabel = #35774#22791#22411#21495
      FieldName = 'dev_type'
      Size = 24
    end
    object Generaldev_purpose_id: TStringField
      DisplayLabel = #35774#22791#29992#36884
      FieldName = 'dev_purpose_id'
      Size = 2
    end
    object Generaldev_purpose: TStringField
      DisplayLabel = #35774#22791#29992#36884
      FieldName = 'dev_purpose'
    end
    object Generaldev_kind_id: TStringField
      DisplayLabel = #35774#22791#31181#31867
      FieldName = 'dev_kind_id'
      Size = 4
    end
    object Generaldev_kind: TStringField
      DisplayLabel = #35774#22791#31181#31867
      FieldName = 'dev_kind'
      Size = 50
    end
    object Generaldev_category_id: TStringField
      DisplayLabel = #35774#22791#31867#21035
      FieldName = 'dev_category_id'
      Size = 4
    end
    object Generaldev_category: TStringField
      DisplayLabel = #35774#22791#31867#21035
      FieldName = 'dev_category'
      Size = 50
    end
    object Generaldev_sort_id: TStringField
      DisplayLabel = #35774#22791#20998#31867
      FieldName = 'dev_sort_id'
      Size = 4
    end
    object Generaldev_sort: TStringField
      DisplayLabel = #35774#22791#20998#31867
      FieldName = 'dev_sort'
      Size = 50
    end
    object Generalmanu_com: TStringField
      DisplayLabel = #21046#36896#21333#20301
      FieldName = 'manu_com'
      Size = 60
    end
    object Generalinst_com: TStringField
      DisplayLabel = #23433#35013#21333#20301
      FieldName = 'inst_com'
      Size = 60
    end
    object Generaluse_date: TStringField
      DisplayLabel = #25237#29992#26085#26399
      FieldName = 'use_date'
      Size = 10
    end
    object Generaldesign_com: TStringField
      DisplayLabel = #35774#35745#21333#20301
      FieldName = 'design_com'
      Size = 60
    end
    object Generalverify_com: TStringField
      DisplayLabel = #26816#39564#21333#20301
      FieldName = 'verify_com'
      Size = 60
    end
    object Generalverify_date: TStringField
      DisplayLabel = #26816#39564#26085#26399
      FieldName = 'verify_date'
      Size = 10
    end
    object Generalacct_kind_id: TStringField
      DisplayLabel = #20107#25925#20998#31867
      FieldName = 'acct_kind_id'
      Size = 2
    end
    object Generalacct_kind: TStringField
      DisplayLabel = #20107#25925#20998#31867
      FieldName = 'acct_kind'
    end
    object Generalacct_reason_id: TStringField
      DisplayLabel = #20107#25925#21407#22240
      FieldName = 'acct_reason_id'
      Size = 2
    end
    object Generalacct_reason: TStringField
      DisplayLabel = #20107#25925#21407#22240
      FieldName = 'acct_reason'
    end
    object Generalreason_detail_id: TStringField
      DisplayLabel = #20855#20307#21407#22240
      FieldName = 'reason_detail_id'
      Size = 2
    end
    object Generalreason_detail: TStringField
      DisplayLabel = #20855#20307#21407#22240
      FieldName = 'reason_detail'
    end
    object Generalacct_type_id: TStringField
      DisplayLabel = #20107#25925#24418#24335
      FieldName = 'acct_type_id'
      Size = 2
    end
    object Generalacct_type: TStringField
      DisplayLabel = #20107#25925#24418#24335
      FieldName = 'acct_type'
    end
    object Generalacct_char_id: TStringField
      DisplayLabel = #20107#25925#29305#24449
      FieldName = 'acct_char_id'
      Size = 2
    end
    object Generalacct_char: TStringField
      DisplayLabel = #20107#25925#29305#24449
      FieldName = 'acct_char'
    end
    object Generalspec_kind: TStringField
      DisplayLabel = #29305#27530#20998#31867
      FieldName = 'spec_kind'
      Size = 16
    end
    object Generaldirect_loss: TBCDField
      DisplayLabel = #30452#25509#25439#22833
      FieldName = 'direct_loss'
      Precision = 18
      Size = 1
    end
    object Generalindirect_loss: TBCDField
      DisplayLabel = #38388#25509#25439#22833
      FieldName = 'indirect_loss'
      Precision = 18
      Size = 1
    end
    object Generaldead_num: TIntegerField
      DisplayLabel = #27515#20129#20154#25968
      FieldName = 'dead_num'
    end
    object Generalhigh_harm_num: TIntegerField
      DisplayLabel = #37325#20260#20154#25968
      FieldName = 'high_harm_num'
    end
    object Generallight_harm_num: TIntegerField
      DisplayLabel = #36731#20260#20154#25968
      FieldName = 'light_harm_num'
    end
    object Generaltech_param: TStringField
      DisplayLabel = #25216#26415#21442#25968
      FieldName = 'tech_param'
      Size = 300
    end
    object Generaldev_diagram: TBlobField
      DisplayLabel = #35774#22791#31616#22270
      FieldName = 'dev_diagram'
    end
    object Generaldev_circs: TStringField
      DisplayLabel = #35774#22791#24403#21069#29366#20917
      FieldName = 'dev_circs'
      Size = 300
    end
    object Generalacct_course: TStringField
      DisplayLabel = #20107#25925#32463#36807
      FieldName = 'acct_course'
      Size = 300
    end
    object Generaldestroy_circs: TStringField
      DisplayLabel = #30772#22351#24773#20917
      FieldName = 'destroy_circs'
      Size = 300
    end
    object Generalspot_photo1: TBlobField
      DisplayLabel = #29616#22330#29031#29255'1'
      FieldName = 'spot_photo1'
    end
    object Generalpic_type1: TStringField
      DisplayLabel = #22270#29255#31867#22411'1'
      FieldName = 'pic_type1'
      Size = 30
    end
    object Generalspot_photo2: TBlobField
      DisplayLabel = #29616#22330#29031#29255'2'
      FieldName = 'spot_photo2'
    end
    object Generalpic_type2: TStringField
      DisplayLabel = #22270#29255#31867#22411'2'
      FieldName = 'pic_type2'
      Size = 30
    end
    object Generalspot_photo3: TBlobField
      DisplayLabel = #29616#22330#29031#29255'3'
      FieldName = 'spot_photo3'
    end
    object Generalpic_type3: TStringField
      DisplayLabel = #22270#29255#31867#22411'3'
      FieldName = 'pic_type3'
      Size = 30
    end
    object Generalspot_photo4: TBlobField
      DisplayLabel = #29616#22330#29031#29255'4'
      FieldName = 'spot_photo4'
    end
    object Generalpic_type4: TStringField
      DisplayLabel = #22270#29255#31867#22411'4'
      FieldName = 'pic_type4'
      Size = 30
    end
    object Generalacct_result: TStringField
      DisplayLabel = #20107#25925#20998#26512#21450#32467#35770
      FieldName = 'acct_result'
      Size = 300
    end
    object Generalacct_duty: TStringField
      DisplayLabel = #20107#25925#24615#36136#21644#36131#20219
      FieldName = 'acct_duty'
      Size = 300
    end
    object Generalacct_idea: TStringField
      DisplayLabel = #26377#20851#36131#20219#20154#22788#29702#24847#35265
      FieldName = 'acct_idea'
      Size = 300
    end
    object Generalacct_measure: TStringField
      DisplayLabel = #37325#22797#21457#29983#30340#25514#26045#24314#35758
      FieldName = 'acct_measure'
      Size = 300
    end
    object Generalinquiry_manager: TStringField
      DisplayLabel = #35843#26597#36127#36131#20154
      FieldName = 'inquiry_manager'
      Size = 14
    end
    object Generalinquiry_date: TStringField
      DisplayLabel = #35843#26597#26085#26399
      FieldName = 'inquiry_date'
      Size = 10
    end
    object Generalinquiry_differ_idea: TStringField
      DisplayLabel = #35843#26597#32452#25104#21592#19981#21516#24847#35265
      FieldName = 'inquiry_differ_idea'
      Size = 300
    end
    object Generalinquiry_differ_persons: TStringField
      DisplayLabel = #25345#19981#21516#24847#35265#30340#25104#21592
      FieldName = 'inquiry_differ_persons'
      Size = 30
    end
    object Generalinquiry_differ_date: TStringField
      DisplayLabel = #31614#23383#26085#26399
      FieldName = 'inquiry_differ_date'
      Size = 10
    end
    object Generalinquiry_dept_idea: TStringField
      DisplayLabel = #35843#26597#37096#38376#24847#35265
      FieldName = 'inquiry_dept_idea'
      Size = 300
    end
    object Generalinquiry_dept_manager: TStringField
      DisplayLabel = #35843#26597#37096#38376#36127#36131#20154
      FieldName = 'inquiry_dept_manager'
      Size = 14
    end
    object Generalinquiry_dept_date: TStringField
      DisplayLabel = #35843#26597#37096#38376#31614#23383#26085#26399
      FieldName = 'inquiry_dept_date'
      Size = 10
    end
    object Generalpass_circs: TStringField
      DisplayLabel = #25209#22797#24773#20917
      FieldName = 'pass_circs'
      Size = 8
    end
    object Generalacct_remark: TStringField
      DisplayLabel = #20107#25925#22791#27880
      FieldName = 'acct_remark'
      Size = 300
    end
    object Generaloutflag: TIntegerField
      DisplayLabel = #23548#20986#26631#35760
      FieldName = 'outflag'
    end
    object Generaldev_diagram_type: TStringField
      FieldName = 'dev_diagram_type'
      Size = 30
    end
    object Generalstate: TIntegerField
      FieldName = 'state'
    end
  end
  object Generald: TDataSource
    DataSet = General
    Left = 66
    Top = 306
  end
  object DeathDetaild: TDataSource
    DataSet = DeathDetail
    Left = 122
    Top = 306
  end
  object DeathDetail: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltBatchOptimistic
    AfterInsert = DeathDetailAfterInsert
    Parameters = <>
    SQL.Strings = (
      'select * from device.acct_death_info')
    Left = 94
    Top = 306
    object DeathDetailsysid: TStringField
      DisplayLabel = #31995#32479#20195#30721
      FieldName = 'sysid'
    end
    object DeathDetailacct_sysid: TStringField
      DisplayLabel = #20107#25925#31995#32479#20195#30721
      FieldName = 'acct_sysid'
    end
    object DeathDetailacct_no: TStringField
      DisplayLabel = #20107#25925#26631#35782
      FieldName = 'acct_no'
      Size = 100
    end
    object DeathDetailacct_date: TStringField
      DisplayLabel = #20107#25925#21457#29983#26102#38388
      FieldName = 'acct_date'
    end
    object DeathDetailno: TIntegerField
      DisplayLabel = #27515#32773#24207#21495
      FieldName = 'no'
    end
    object DeathDetailname: TStringField
      DisplayLabel = #27515#32773#22995#21517
      FieldName = 'name'
      Size = 14
    end
    object DeathDetailsex: TStringField
      DisplayLabel = #27515#32773#24615#21035
      FieldName = 'sex'
      Size = 4
    end
    object DeathDetailage: TStringField
      DisplayLabel = #27515#32773#24180#40836
      FieldName = 'age'
      Size = 3
    end
    object DeathDetailoccup: TStringField
      DisplayLabel = #27515#32773#32844#19994
      FieldName = 'occup'
    end
    object DeathDetailremark: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'remark'
      Size = 80
    end
    object DeathDetailoutflag: TIntegerField
      DisplayLabel = #23548#20986#26631#24535
      FieldName = 'outflag'
    end
  end
  object InquiryDetaild: TDataSource
    DataSet = InquiryDetail
    Left = 66
    Top = 334
  end
  object InquiryDetail: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltBatchOptimistic
    AfterInsert = InquiryDetailAfterInsert
    Parameters = <>
    SQL.Strings = (
      'select * from device.acct_inquiry_info')
    Left = 38
    Top = 334
    object InquiryDetailsysid: TStringField
      DisplayLabel = #31995#32479#20195#30721
      FieldName = 'sysid'
    end
    object InquiryDetailacct_sysid: TStringField
      DisplayLabel = #20107#25925#31995#32479#20195#30721
      FieldName = 'acct_sysid'
    end
    object InquiryDetailacct_no: TStringField
      DisplayLabel = #20107#25925#26631#35782
      FieldName = 'acct_no'
      Size = 100
    end
    object InquiryDetailacct_date: TStringField
      DisplayLabel = #20107#25925#26102#38388
      FieldName = 'acct_date'
    end
    object InquiryDetailno: TIntegerField
      DisplayLabel = #24207#21495
      FieldName = 'no'
    end
    object InquiryDetailname: TStringField
      DisplayLabel = #22995#21517
      FieldName = 'name'
      Size = 12
    end
    object InquiryDetailduty: TStringField
      DisplayLabel = #32844#21153
      FieldName = 'duty'
    end
    object InquiryDetailcompany: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'company'
      Size = 60
    end
    object InquiryDetailtel: TStringField
      DisplayLabel = #30005#35805
      FieldName = 'tel'
      Size = 24
    end
    object InquiryDetailoccup: TStringField
      DisplayLabel = #32844#19994
      FieldName = 'occup'
      Size = 12
    end
    object InquiryDetailremark: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'remark'
      Size = 60
    end
    object InquiryDetailoutflag: TIntegerField
      DisplayLabel = #23548#20986#26631#24535
      FieldName = 'outflag'
    end
  end
  object LogDetail: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltBatchOptimistic
    AfterInsert = LogDetailAfterInsert
    Parameters = <>
    SQL.Strings = (
      'select * from device.acct_log_info')
    Left = 94
    Top = 334
    object LogDetailsysid: TStringField
      DisplayLabel = #31995#32479#20195#30721
      FieldName = 'sysid'
    end
    object LogDetailacct_sysid: TStringField
      DisplayLabel = #20107#25925#31995#32479#20195#30721
      FieldName = 'acct_sysid'
    end
    object LogDetailacct_no: TStringField
      DisplayLabel = #20107#25925#26631#35782
      FieldName = 'acct_no'
      Size = 100
    end
    object LogDetailacct_date: TStringField
      DisplayLabel = #20107#25925#26102#38388
      FieldName = 'acct_date'
    end
    object LogDetailwork_date: TStringField
      DisplayLabel = #24037#20316#26085#26399
      FieldName = 'work_date'
      Size = 10
    end
    object LogDetailwork_content: TStringField
      DisplayLabel = #24037#20316#20869#23481
      FieldName = 'work_content'
      Size = 120
    end
    object LogDetailremark: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'remark'
      Size = 100
    end
    object LogDetailgzdw: TStringField
      DisplayLabel = #26410#29992
      FieldName = 'gzdw'
      Size = 60
    end
    object LogDetailoutflag: TIntegerField
      DisplayLabel = #23548#20986#26631#24535
      FieldName = 'outflag'
    end
  end
  object LogDetaild: TDataSource
    DataSet = LogDetail
    Left = 122
    Top = 334
  end
  object Province: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltReadOnly
    Parameters = <>
    Left = 38
    Top = 362
  end
  object provinced: TDataSource
    DataSet = Province
    Left = 66
    Top = 362
  end
  object City: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltReadOnly
    Parameters = <>
    Left = 94
    Top = 362
  end
  object cityd: TDataSource
    DataSet = City
    Left = 122
    Top = 362
  end
  object Borough: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltReadOnly
    Parameters = <>
    Left = 150
    Top = 362
  end
  object boroughd: TDataSource
    DataSet = Borough
    Left = 178
    Top = 362
  end
  object DevPurpose: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select * from device.code_dev_use')
    Left = 38
    Top = 390
    object DevPurposeid: TStringField
      FieldName = 'id'
      Size = 2
    end
    object DevPurposecode: TStringField
      FieldName = 'code'
      Size = 2
    end
    object DevPurposename: TStringField
      FieldName = 'name'
    end
    object DevPurposeoutflag: TIntegerField
      FieldName = 'outflag'
    end
  end
  object DevPurposed: TDataSource
    DataSet = DevPurpose
    Left = 66
    Top = 390
  end
  object DevKind: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select * from device.code_device')
    Left = 94
    Top = 390
    object DevKindid: TStringField
      FieldName = 'id'
      Size = 4
    end
    object DevKindparent_id: TStringField
      FieldName = 'parent_id'
      Size = 4
    end
    object DevKindname: TStringField
      FieldName = 'name'
      Size = 50
    end
    object DevKindcode_level: TStringField
      FieldName = 'code_level'
      Size = 1
    end
    object DevKindcode: TStringField
      FieldName = 'code'
      Size = 6
    end
    object DevKindoutflag: TIntegerField
      FieldName = 'outflag'
    end
  end
  object DevKindd: TDataSource
    DataSet = DevKind
    Left = 122
    Top = 390
  end
  object DevCategory: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select * from device.code_device')
    Left = 150
    Top = 390
    object DevCategoryid: TStringField
      FieldName = 'id'
      Size = 4
    end
    object DevCategoryparent_id: TStringField
      FieldName = 'parent_id'
      Size = 4
    end
    object DevCategoryname: TStringField
      FieldName = 'name'
      Size = 50
    end
    object DevCategorycode_level: TStringField
      FieldName = 'code_level'
      Size = 1
    end
    object DevCategorycode: TStringField
      FieldName = 'code'
      Size = 6
    end
    object DevCategoryoutflag: TIntegerField
      FieldName = 'outflag'
    end
  end
  object DevCategoryd: TDataSource
    DataSet = DevCategory
    Left = 178
    Top = 390
  end
  object DevSort: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select * from device.code_device')
    Left = 206
    Top = 390
    object DevSortid: TStringField
      FieldName = 'id'
      Size = 4
    end
    object DevSortparent_id: TStringField
      FieldName = 'parent_id'
      Size = 4
    end
    object DevSortname: TStringField
      FieldName = 'name'
      Size = 50
    end
    object DevSortcode_level: TStringField
      FieldName = 'code_level'
      Size = 1
    end
    object DevSortcode: TStringField
      FieldName = 'code'
      Size = 6
    end
    object DevSortoutflag: TIntegerField
      FieldName = 'outflag'
    end
  end
  object DevSortd: TDataSource
    DataSet = DevSort
    Left = 234
    Top = 390
  end
  object AcctKind: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select * from device.code_acct_kind')
    Left = 38
    Top = 418
    object AcctKindid: TStringField
      FieldName = 'id'
      Size = 2
    end
    object AcctKindcode: TStringField
      FieldName = 'code'
      Size = 2
    end
    object AcctKindname: TStringField
      FieldName = 'name'
    end
    object AcctKindoutflag: TIntegerField
      FieldName = 'outflag'
    end
  end
  object AcctKindd: TDataSource
    DataSet = AcctKind
    Left = 66
    Top = 418
  end
  object AcctReason: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select * from device.code_acct_reason')
    Left = 94
    Top = 418
    object AcctReasonid: TStringField
      FieldName = 'id'
      Size = 2
    end
    object AcctReasoncode: TStringField
      FieldName = 'code'
      Size = 2
    end
    object AcctReasonname: TStringField
      FieldName = 'name'
    end
    object AcctReasonoutflag: TIntegerField
      FieldName = 'outflag'
    end
  end
  object AcctReasond: TDataSource
    DataSet = AcctReason
    Left = 122
    Top = 418
  end
  object ReasonDetail: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select * from device.code_acct_reasondetail')
    Left = 150
    Top = 418
    object ReasonDetailid: TStringField
      FieldName = 'id'
      Size = 2
    end
    object ReasonDetailcode: TStringField
      FieldName = 'code'
      Size = 2
    end
    object ReasonDetailname: TStringField
      FieldName = 'name'
    end
    object ReasonDetailoutflag: TIntegerField
      FieldName = 'outflag'
    end
  end
  object ReasonDetaild: TDataSource
    DataSet = ReasonDetail
    Left = 178
    Top = 418
  end
  object AcctType: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select * from device.code_acct_type')
    Left = 206
    Top = 418
    object AcctTypeid: TStringField
      FieldName = 'id'
      Size = 2
    end
    object AcctTypecode: TStringField
      FieldName = 'code'
      Size = 2
    end
    object AcctTypename: TStringField
      FieldName = 'name'
    end
    object AcctTypeoutflag: TIntegerField
      FieldName = 'outflag'
    end
  end
  object AcctTyped: TDataSource
    DataSet = AcctType
    Left = 234
    Top = 418
  end
  object AcctChar: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select * from device.code_acct_char')
    Left = 262
    Top = 418
    object AcctCharid: TStringField
      FieldName = 'id'
      Size = 2
    end
    object AcctCharcode: TStringField
      FieldName = 'code'
      Size = 2
    end
    object AcctCharname: TStringField
      FieldName = 'name'
    end
    object AcctCharoutflag: TIntegerField
      FieldName = 'outflag'
    end
  end
  object AcctChard: TDataSource
    DataSet = AcctChar
    Left = 290
    Top = 418
  end
  object ListFind: TCSDBdxGrdFind
    QuantumCtrl = grdList
    Left = 150
    Top = 334
  end
  object ListFilter: TCSADOdxGrdFilter
    QuantumCtrl = grdList
    Left = 178
    Top = 334
  end
  object ListColCtrl: TCSdxGrdColCtrl
    QuantumCtrl = grdList
    ColList = <
      item
        ColIndex = 0
        Name = 'grdListreport_no'
        Caption = #23457#25209#32534#21495
        Visible = True
      end
      item
        ColIndex = 1
        Name = 'grdListreport_kind'
        Caption = #25253#21578#31867#22411
        Visible = True
      end
      item
        ColIndex = 2
        Name = 'grdListwork_state'
        Caption = #24320#24037#24615#36136
        Visible = True
      end
      item
        ColIndex = 3
        Name = 'grdListdeclare_date'
        Caption = #30003#25253#26085#26399
        Visible = True
      end
      item
        ColIndex = 4
        Name = 'grdListstart_date'
        Caption = #24320#24037#26085#26399
        Visible = True
      end
      item
        ColIndex = 5
        Name = 'grdListend_date'
        Caption = #31459#24037#26085#26399
        Visible = True
      end
      item
        ColIndex = 6
        Name = 'grdListaudit_date'
        Caption = #25209#20934#26085#26399
        Visible = True
      end
      item
        ColIndex = 7
        Name = 'grdListinst_name'
        Caption = #23433#35013#21333#20301
        Visible = True
      end
      item
        ColIndex = 8
        Name = 'grdListinst_deputy'
        Caption = #23433#35013#21333#20301#27861#20154
        Visible = True
      end
      item
        ColIndex = 9
        Name = 'grdListinst_deputy_tel'
        Caption = #23433#35013#21333#20301#27861#20154#30005#35805
        Visible = True
      end
      item
        ColIndex = 10
        Name = 'grdListinst_principal'
        Caption = #23433#35013#29616#22330#36127#36131#20154
        Visible = True
      end
      item
        ColIndex = 11
        Name = 'grdListinst_principal_tel'
        Caption = #23433#35013#29616#22330#36127#36131#20154#30005#35805
        Visible = True
      end
      item
        ColIndex = 12
        Name = 'grdListuser_name'
        Caption = #20351#29992#21333#20301
        Visible = True
      end
      item
        ColIndex = 13
        Name = 'grdListuser_contact'
        Caption = #20351#29992#21333#20301#32852#31995#20154
        Visible = True
      end
      item
        ColIndex = 14
        Name = 'grdListuser_tel'
        Caption = #20351#29992#21333#20301#32852#31995#30005#35805
        Visible = True
      end
      item
        ColIndex = 15
        Name = 'grdListmanu_name'
        Caption = #21046#36896#21333#20301
        Visible = True
      end
      item
        ColIndex = 16
        Name = 'grdListstate'
        Caption = 'state'
        Visible = False
      end>
    Left = 206
    Top = 334
  end
end
