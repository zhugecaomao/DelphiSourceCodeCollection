object frmOrganCertMng: TfrmOrganCertMng
  Left = 38
  Top = 59
  Width = 761
  Height = 515
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'frmOrganCertMng'
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
    Top = 460
    Width = 753
    Height = 28
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 1
    object Panel4: TPanel
      Left = 598
      Top = 1
      Width = 154
      Height = 26
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 1
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
    object bbtnDiscard: TBitBtn
      Left = 3
      Top = 3
      Width = 80
      Height = 22
      Caption = #20316#24223#36755#20837
      TabOrder = 0
      OnClick = bbtnDiscardClick
      Glyph.Data = {
        34010000424D3401000000000000760000002800000010000000100000000100
        040002000000BE000000C40E0000C40E00000000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0010FF000002FF
        0A00020F02FF00000004FF0F08FF020F02FF00000004FF0F067700047F0F02FF
        00000004FF0F08FF020F02FF00000004FF0F047700067FFF0F0002FF00000004
        FF0F08FF020F02FF00000004FF0F06770004FF0F02FF00000004FF0F08FF020F
        02FF00000004FF0F047704FF020F02FF00000004FF0F04FF0477020F02FF0000
        000AFF0F777F70000400020F00000004FF0F04FF020104110210000002FF0600
        020904990290000008FF02F00400020F000010FF00000001}
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 753
    Height = 460
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 0
    object pagCert: TPageControl
      Left = 1
      Top = 1
      Width = 751
      Height = 458
      ActivePage = tsBaseInfo
      Align = alClient
      TabIndex = 0
      TabOrder = 0
      OnChange = pagCertChange
      OnChanging = pagCertChanging
      object tsBaseInfo: TTabSheet
        Caption = #22522#26412#20449#24687
        object Panel3: TPanel
          Left = 0
          Top = 403
          Width = 743
          Height = 28
          Align = alBottom
          BevelOuter = bvLowered
          Caption = '`'
          TabOrder = 0
          object Panel5: TPanel
            Left = 590
            Top = 1
            Width = 152
            Height = 26
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 1
            object CSDBNavigator1: TCSDBNavigator
              Left = 0
              Top = 2
              Width = 150
              Height = 22
              DataSource = CertInfod
              VisibleButtons = [nbPost, nbCancel, nbRefresh]
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
          object bbtnLogout: TBitBtn
            Left = 3
            Top = 3
            Width = 60
            Height = 22
            Caption = #27880#38144
            TabOrder = 0
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
        end
        object ScrollBox1: TScrollBox
          Left = 0
          Top = 0
          Width = 743
          Height = 403
          Align = alClient
          TabOrder = 1
          object Label1: TLabel
            Left = 304
            Top = 8
            Width = 60
            Height = 12
            Caption = #25152#23646#26426#26500#65306
          end
          object Label2: TLabel
            Left = 213
            Top = 31
            Width = 60
            Height = 12
            Caption = #35774#22791#22823#31867#65306
          end
          object Label3: TLabel
            Left = 20
            Top = 77
            Width = 60
            Height = 12
            Caption = #25209#20934#26426#26500#65306
          end
          object Label4: TLabel
            Left = 315
            Top = 77
            Width = 60
            Height = 12
            Caption = #25209#20934#26085#26399#65306
          end
          object Label6: TLabel
            Left = 470
            Top = 77
            Width = 60
            Height = 12
            Caption = #26377#25928#26085#26399#65306
          end
          object Label7: TLabel
            Left = 8
            Top = 434
            Width = 36
            Height = 12
            Caption = #29366#24577#65306
          end
          object Label8: TLabel
            Left = 20
            Top = 31
            Width = 60
            Height = 12
            Caption = #35768#21487#24615#36136#65306
          end
          object Label9: TLabel
            Left = 331
            Top = 354
            Width = 36
            Height = 12
            Caption = #22791#27880#65306
          end
          object Label5: TLabel
            Left = 8
            Top = 8
            Width = 72
            Height = 12
            Caption = #35768#21487#35777#32534#21495#65306
          end
          object Label10: TLabel
            Left = 8
            Top = 54
            Width = 72
            Height = 12
            Caption = #30003#35831#20070#32534#21495#65306
          end
          object Label11: TLabel
            Left = 213
            Top = 54
            Width = 60
            Height = 12
            Caption = #30003#35831#31181#31867#65306
          end
          object Label12: TLabel
            Left = 406
            Top = 54
            Width = 60
            Height = 12
            Caption = #30003#35831#26085#26399#65306
          end
          object Label13: TLabel
            Left = 406
            Top = 31
            Width = 60
            Height = 12
            Caption = #35774#22791#31181#31867#65306
          end
          object Label32: TLabel
            Left = 8
            Top = 277
            Width = 84
            Height = 12
            Caption = #20027#31649#37096#38376#24847#35265#65306
          end
          object Label33: TLabel
            Left = 331
            Top = 277
            Width = 132
            Height = 12
            Caption = #22320#26041#23433#20840#30417#23519#26426#26500#24847#35265#65306
          end
          object Label34: TLabel
            Left = 8
            Top = 354
            Width = 132
            Height = 12
            Caption = #21463#29702#23433#20840#30417#23519#26426#26500#24847#35265#65306
          end
          object lcmbAuthOrgan: TDBLookupComboboxEh
            Left = 80
            Top = 74
            Width = 230
            Height = 18
            Color = clSkyBlue
            Ctl3D = False
            DataField = 'auth_organ_sysid'
            DataSource = CertInfod
            EditButton.Visible = False
            EditButtons = <
              item
                Style = ebsEllipsisEh
                OnClick = lcmbAuthOrganEditButtons0Click
              end>
            KeyField = 'auth_organ_sysid'
            ListField = 'auth_organ_name'
            ListSource = mOrganInfod
            ParentCtl3D = False
            TabOrder = 8
            Visible = True
            OnDropDown = AbortDropDown
          end
          object lcmbOrgan: TDBLookupComboboxEh
            Left = 364
            Top = 5
            Width = 230
            Height = 18
            Color = clSkyBlue
            Ctl3D = False
            DataField = 'organ_sysid'
            DataSource = CertInfod
            EditButton.Visible = False
            EditButtons = <
              item
                Style = ebsEllipsisEh
                OnClick = lcmbOrganEditButtons0Click
              end>
            KeyField = 'organ_sysid'
            ListField = 'organ_name'
            ListSource = mOrganInfod
            ParentCtl3D = False
            TabOrder = 1
            Visible = True
            OnDropDown = AbortDropDown
          end
          object deAuthDate: TCSdxDBDateEdit
            Left = 375
            Top = 73
            Width = 90
            Color = clSkyBlue
            TabOrder = 9
            DataField = 'auth_date'
            DataSource = CertInfod
            StyleController = dmData.dxStyleCtrl
            FixedDateFormat = 'yyyy-MM-dd'
            StoredValues = 4
          end
          object deEndDate: TCSdxDBDateEdit
            Left = 530
            Top = 73
            Width = 90
            Color = clSkyBlue
            TabOrder = 10
            DataField = 'end_date'
            DataSource = CertInfod
            StyleController = dmData.dxStyleCtrl
            FixedDateFormat = 'yyyy-MM-dd'
            StoredValues = 4
          end
          object lcmbState: TDBLookupComboboxEh
            Left = 44
            Top = 431
            Width = 121
            Height = 18
            Ctl3D = False
            DataField = 'state'
            DataSource = CertInfod
            EditButtons = <>
            KeyField = 'id'
            ListField = 'name'
            ListSource = CodeCertStated
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 17
            Visible = True
          end
          object lcmbLevel1: TDBLookupComboboxEh
            Left = 80
            Top = 28
            Width = 128
            Height = 18
            Color = clSkyBlue
            Ctl3D = False
            DataField = 'level1_id'
            DataSource = CertInfod
            EditButtons = <>
            KeyField = 'id'
            ListField = 'name'
            ListSource = CertLevel1d
            ParentCtl3D = False
            TabOrder = 2
            Visible = True
            OnKeyValueChanged = lcmbLevel1KeyValueChanged
          end
          object mRemark: TdxDBMemo
            Left = 331
            Top = 366
            Width = 318
            TabOrder = 16
            DataField = 'remark'
            DataSource = CertInfod
            StyleController = dmData.dxStyleCtrl
            Height = 60
          end
          object eCertNo: TDBEditEh
            Left = 80
            Top = 5
            Width = 193
            Height = 18
            Color = clSkyBlue
            Ctl3D = False
            DataField = 'certno'
            DataSource = CertInfod
            EditButtons = <>
            ParentCtl3D = False
            TabOrder = 0
            Visible = True
          end
          object eAcceptNo: TDBEditEh
            Left = 80
            Top = 51
            Width = 128
            Height = 18
            Ctl3D = False
            DataField = 'accept_no'
            DataSource = CertInfod
            EditButtons = <>
            ParentCtl3D = False
            TabOrder = 5
            Visible = True
          end
          object eAcceptType: TDBEditEh
            Left = 273
            Top = 51
            Width = 128
            Height = 18
            Ctl3D = False
            DataField = 'accept_type'
            DataSource = CertInfod
            EditButtons = <>
            ParentCtl3D = False
            TabOrder = 6
            Visible = True
          end
          object deApplyDate: TCSdxDBDateEdit
            Left = 466
            Top = 50
            Width = 90
            TabOrder = 7
            DataField = 'apply_date'
            DataSource = CertInfod
            StyleController = dmData.dxStyleCtrl
            FixedDateFormat = 'yyyy-MM-dd'
            StoredValues = 4
          end
          object lcmbLevel2: TDBLookupComboboxEh
            Left = 273
            Top = 28
            Width = 128
            Height = 18
            Color = clSkyBlue
            Ctl3D = False
            DataField = 'level2_id'
            DataSource = CertInfod
            EditButtons = <>
            KeyField = 'id'
            ListField = 'name'
            ListSource = CertLevel2d
            ParentCtl3D = False
            TabOrder = 3
            Visible = True
            OnKeyValueChanged = lcmbLevel2KeyValueChanged
          end
          object lcmbLevel3: TDBLookupComboboxEh
            Left = 466
            Top = 28
            Width = 128
            Height = 18
            Color = clSkyBlue
            Ctl3D = False
            DataField = 'level3_id'
            DataSource = CertInfod
            EditButtons = <>
            KeyField = 'id'
            ListField = 'name'
            ListSource = CertLevel3d
            ParentCtl3D = False
            TabOrder = 4
            Visible = True
            OnKeyValueChanged = lcmbLevel3KeyValueChanged
          end
          object gbMiscInfo: TGroupBox
            Left = 8
            Top = 97
            Width = 641
            Height = 84
            Caption = ' '#30456#20851#20449#24687' '
            TabOrder = 11
            object Label14: TLabel
              Left = 8
              Top = 15
              Width = 60
              Height = 12
              Caption = #21344#22320#38754#31215#65306
            end
            object Label15: TLabel
              Left = 165
              Top = 15
              Width = 60
              Height = 12
              Caption = #21378#25151#38754#31215#65306
            end
            object Label16: TLabel
              Left = 322
              Top = 15
              Width = 72
              Height = 12
              Caption = #26333#20809#23460#38754#31215#65306
            end
            object Label17: TLabel
              Left = 491
              Top = 15
              Width = 72
              Height = 12
              Caption = #35774#35745#20154#21592#25968#65306
            end
            object Label18: TLabel
              Left = 8
              Top = 38
              Width = 72
              Height = 12
              Caption = #26816#26597#20154#21592#25968#65306
            end
            object Label19: TLabel
              Left = 153
              Top = 38
              Width = 96
              Height = 12
              Caption = #26080#25439#26816#27979#20154#21592#25968#65306
            end
            object Label20: TLabel
              Left = 322
              Top = 38
              Width = 72
              Height = 12
              Caption = #28938#25509#20154#21592#25968#65306
            end
            object Label21: TLabel
              Left = 467
              Top = 38
              Width = 96
              Height = 12
              Caption = #20854#20182#19987#19994#20154#21592#25968#65306
            end
            object Label22: TLabel
              Left = 8
              Top = 61
              Width = 60
              Height = 12
              Caption = #35774#35745#33021#21147#65306
            end
            object Label23: TLabel
              Left = 322
              Top = 61
              Width = 48
              Height = 12
              Caption = #24180#20135#20540#65306
            end
            object eComArea: TDBNumberEditEh
              Left = 68
              Top = 12
              Width = 92
              Height = 18
              Ctl3D = False
              DataField = 'com_area'
              DataSource = CertInfod
              EditButtons = <>
              ParentCtl3D = False
              TabOrder = 0
              Visible = True
            end
            object eWorkshopArea: TDBNumberEditEh
              Left = 225
              Top = 12
              Width = 92
              Height = 18
              Ctl3D = False
              DataField = 'workshop_area'
              DataSource = CertInfod
              EditButtons = <>
              ParentCtl3D = False
              TabOrder = 1
              Visible = True
            end
            object eExposalArea: TDBNumberEditEh
              Left = 394
              Top = 12
              Width = 92
              Height = 18
              Ctl3D = False
              DataField = 'exposal_area'
              DataSource = CertInfod
              EditButtons = <>
              ParentCtl3D = False
              TabOrder = 2
              Visible = True
            end
            object eDesignerNum: TDBNumberEditEh
              Left = 563
              Top = 12
              Width = 68
              Height = 18
              Ctl3D = False
              DataField = 'designer_num'
              DataSource = CertInfod
              EditButtons = <>
              ParentCtl3D = False
              TabOrder = 3
              Visible = True
            end
            object eCheckerNum: TDBNumberEditEh
              Left = 80
              Top = 35
              Width = 68
              Height = 18
              Ctl3D = False
              DataField = 'checker_num'
              DataSource = CertInfod
              EditButtons = <>
              ParentCtl3D = False
              TabOrder = 4
              Visible = True
            end
            object eInspectorNum: TDBNumberEditEh
              Left = 249
              Top = 35
              Width = 68
              Height = 18
              Ctl3D = False
              DataField = 'inspector_num'
              DataSource = CertInfod
              EditButtons = <>
              ParentCtl3D = False
              TabOrder = 5
              Visible = True
            end
            object eWelderNum: TDBNumberEditEh
              Left = 394
              Top = 35
              Width = 68
              Height = 18
              Ctl3D = False
              DataField = 'welder_num'
              DataSource = CertInfod
              EditButtons = <>
              ParentCtl3D = False
              TabOrder = 6
              Visible = True
            end
            object eOtherNum: TDBNumberEditEh
              Left = 563
              Top = 35
              Width = 68
              Height = 18
              Ctl3D = False
              DataField = 'other_num'
              DataSource = CertInfod
              EditButtons = <>
              ParentCtl3D = False
              TabOrder = 7
              Visible = True
            end
            object eDesignType: TDBEditEh
              Left = 68
              Top = 58
              Width = 249
              Height = 18
              Ctl3D = False
              DataField = 'design_type'
              DataSource = CertInfod
              EditButtons = <>
              ParentCtl3D = False
              TabOrder = 8
              Visible = True
            end
            object eYearValue: TDBNumberEditEh
              Left = 370
              Top = 58
              Width = 121
              Height = 18
              Ctl3D = False
              DataField = 'year_value'
              DataSource = CertInfod
              EditButtons = <>
              ParentCtl3D = False
              TabOrder = 9
              Visible = True
            end
          end
          object gbAgent: TGroupBox
            Left = 8
            Top = 186
            Width = 641
            Height = 86
            Caption = ' '#20195#29702#26426#26500' '
            TabOrder = 12
            object Label24: TLabel
              Left = 8
              Top = 15
              Width = 60
              Height = 12
              Caption = #26426#26500#21517#31216#65306
            end
            object Label25: TLabel
              Left = 303
              Top = 15
              Width = 60
              Height = 12
              Caption = #26426#26500#20195#30721#65306
            end
            object Label26: TLabel
              Left = 495
              Top = 15
              Width = 60
              Height = 12
              Caption = #27861#20154#20195#34920#65306
            end
            object Label27: TLabel
              Left = 8
              Top = 38
              Width = 60
              Height = 12
              Caption = #26426#26500#22320#22336#65306
            end
            object Label28: TLabel
              Left = 303
              Top = 38
              Width = 60
              Height = 12
              Caption = #37038#25919#32534#30721#65306
            end
            object Label29: TLabel
              Left = 303
              Top = 61
              Width = 60
              Height = 12
              Caption = #30005'    '#35805#65306
            end
            object Label30: TLabel
              Left = 470
              Top = 61
              Width = 60
              Height = 12
              Caption = #20256'    '#30495#65306
            end
            object Label31: TLabel
              Left = 8
              Top = 61
              Width = 60
              Height = 12
              Caption = #30005#23376#37038#20214#65306
            end
            object cmbAgentName: TDBComboBoxEh
              Left = 68
              Top = 12
              Width = 230
              Height = 18
              Ctl3D = False
              DataField = 'agent_name'
              DataSource = CertInfod
              EditButton.Visible = False
              EditButtons = <
                item
                  Style = ebsEllipsisEh
                  OnClick = cmbAgentNameEditButtons0Click
                end>
              ParentCtl3D = False
              TabOrder = 0
              Visible = True
            end
            object eAgentRegno: TDBEditEh
              Left = 363
              Top = 12
              Width = 127
              Height = 18
              Ctl3D = False
              DataField = 'agent_regno'
              DataSource = CertInfod
              EditButtons = <>
              ParentCtl3D = False
              TabOrder = 1
              Visible = True
            end
            object eAgentLegalperson: TDBEditEh
              Left = 555
              Top = 12
              Width = 76
              Height = 18
              Ctl3D = False
              DataField = 'agent_legalperson'
              DataSource = CertInfod
              EditButtons = <>
              ParentCtl3D = False
              TabOrder = 2
              Visible = True
            end
            object eAgentAddr: TDBEditEh
              Left = 68
              Top = 35
              Width = 230
              Height = 18
              Ctl3D = False
              DataField = 'agent_addr'
              DataSource = CertInfod
              EditButtons = <>
              ParentCtl3D = False
              TabOrder = 3
              Visible = True
            end
            object eAgentZip: TDBEditEh
              Left = 363
              Top = 35
              Width = 62
              Height = 18
              Ctl3D = False
              DataField = 'agent_zip'
              DataSource = CertInfod
              EditButtons = <>
              ParentCtl3D = False
              TabOrder = 4
              Visible = True
            end
            object eAgentTel: TDBEditEh
              Left = 363
              Top = 58
              Width = 102
              Height = 18
              Ctl3D = False
              DataField = 'agent_tel'
              DataSource = CertInfod
              EditButtons = <>
              ParentCtl3D = False
              TabOrder = 6
              Visible = True
            end
            object eAgentFax: TDBEditEh
              Left = 530
              Top = 58
              Width = 101
              Height = 18
              Ctl3D = False
              DataField = 'agent_fax'
              DataSource = CertInfod
              EditButtons = <>
              ParentCtl3D = False
              TabOrder = 7
              Visible = True
            end
            object eAgentEmail: TDBEditEh
              Left = 68
              Top = 58
              Width = 230
              Height = 18
              Ctl3D = False
              DataField = 'agent_email'
              DataSource = CertInfod
              EditButtons = <>
              ParentCtl3D = False
              TabOrder = 5
              Visible = True
            end
          end
          object mChargeRemark: TdxDBMemo
            Left = 8
            Top = 289
            Width = 318
            TabOrder = 13
            DataField = 'charge_remark'
            DataSource = CertInfod
            StyleController = dmData.dxStyleCtrl
            Height = 60
          end
          object mLocalSuperviseRemark: TdxDBMemo
            Left = 331
            Top = 289
            Width = 318
            TabOrder = 14
            DataField = 'local_supervise_remark'
            DataSource = CertInfod
            StyleController = dmData.dxStyleCtrl
            Height = 60
          end
          object mAcceptSuperviseRemark: TdxDBMemo
            Left = 8
            Top = 366
            Width = 318
            TabOrder = 15
            DataField = 'accept_supervise_remark'
            DataSource = CertInfod
            StyleController = dmData.dxStyleCtrl
            Height = 60
          end
        end
      end
      object tsDetailInfo: TTabSheet
        Caption = #35814#32454#20449#24687
        ImageIndex = 1
        object Splitter1: TSplitter
          Left = 0
          Top = 186
          Width = 743
          Height = 3
          Cursor = crSizeNS
          Align = alBottom
        end
        object GroupBox1: TGroupBox
          Left = 0
          Top = 0
          Width = 743
          Height = 186
          Align = alClient
          Caption = ' '#35768#21487#35777#39033#30446#21015#34920' '
          TabOrder = 0
          object panItem: TPanel
            Left = 2
            Top = 156
            Width = 739
            Height = 28
            Align = alBottom
            BevelOuter = bvLowered
            TabOrder = 1
            object Panel7: TPanel
              Left = 486
              Top = 1
              Width = 252
              Height = 26
              Align = alRight
              BevelOuter = bvNone
              TabOrder = 0
              object bbtnPrjInsert: TBitBtn
                Left = 0
                Top = 2
                Width = 50
                Height = 22
                Hint = #28155#21152#35760#24405
                Caption = #28155#21152
                TabOrder = 0
                OnClick = bbtnPrjInsertClick
                OnExit = CertPrjExit
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
              object bbtnPrjDelete: TBitBtn
                Left = 50
                Top = 2
                Width = 50
                Height = 22
                Hint = #21024#38500#35760#24405
                Caption = #21024#38500
                TabOrder = 1
                OnClick = bbtnPrjDeleteClick
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
              object navItem: TCSDBNavigator
                Left = 100
                Top = 2
                Width = 150
                Height = 22
                DataSource = CertPrjd
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
          object grdCertPrj: TdxDBGrid
            Left = 2
            Top = 14
            Width = 739
            Height = 142
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
            OnClick = grdCertPrjClick
            OnExit = CertPrjExit
            DataSource = CertPrjd
            Filter.Criteria = {00000000}
            LookAndFeel = lfFlat
            OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
            OptionsView = [edgoBandHeaderWidth, edgoShowButtonAlways, edgoUseBitmap]
            object grdCertPrjsysid: TdxDBGridColumn
              HeaderAlignment = taCenter
              Visible = False
              BandIndex = 0
              RowIndex = 0
              FieldName = 'sysid'
            end
            object grdCertPrjcert_sysid: TdxDBGridColumn
              HeaderAlignment = taCenter
              Visible = False
              BandIndex = 0
              RowIndex = 0
              FieldName = 'cert_sysid'
            end
            object grdCertPrjlevel4_id: TdxDBGridColumn
              HeaderAlignment = taCenter
              Visible = False
              BandIndex = 0
              RowIndex = 0
              FieldName = 'level4_id'
            end
            object grdCertPrjlevel4: TdxDBGridLookupColumn
              HeaderAlignment = taCenter
              Width = 120
              BandIndex = 0
              RowIndex = 0
              OnChange = grdCertPrjlevel4Change
              FieldName = 'level4'
            end
            object grdCertPrjlevel5_id: TdxDBGridColumn
              HeaderAlignment = taCenter
              Visible = False
              BandIndex = 0
              RowIndex = 0
              FieldName = 'level5_id'
            end
            object grdCertPrjlevel5: TdxDBGridLookupColumn
              HeaderAlignment = taCenter
              Width = 120
              BandIndex = 0
              RowIndex = 0
              OnChange = grdCertPrjlevel5Change
              FieldName = 'level5'
              OnEditButtonClick = grdCertPrjLevel5EditButtonClick
              OnCloseUp = grdCertPrjlevel5CloseUp
            end
            object grdCertPrjapply_date: TdxDBGridColumn
              HeaderAlignment = taCenter
              Width = 80
              BandIndex = 0
              RowIndex = 0
              FieldName = 'apply_date'
            end
            object grdCertPrjauth_date: TdxDBGridColumn
              HeaderAlignment = taCenter
              Width = 80
              BandIndex = 0
              RowIndex = 0
              FieldName = 'auth_date'
            end
            object grdCertPrjend_date: TdxDBGridColumn
              HeaderAlignment = taCenter
              Width = 80
              BandIndex = 0
              RowIndex = 0
              FieldName = 'end_date'
            end
            object grdCertPrjstate: TdxDBGridColumn
              HeaderAlignment = taCenter
              Visible = False
              BandIndex = 0
              RowIndex = 0
              FieldName = 'state'
            end
            object grdCertPrjstate_name: TdxDBGridLookupColumn
              HeaderAlignment = taCenter
              BandIndex = 0
              RowIndex = 0
              FieldName = 'state_name'
            end
            object grdCertPrjauth_organ_sysid: TdxDBGridColumn
              HeaderAlignment = taCenter
              Visible = False
              BandIndex = 0
              RowIndex = 0
              FieldName = 'auth_organ_sysid'
            end
            object grdCertPrjauth_organ: TdxDBGridButtonColumn
              HeaderAlignment = taCenter
              Width = 200
              BandIndex = 0
              RowIndex = 0
              FieldName = 'auth_organ'
              Buttons = <
                item
                  Default = True
                end
                item
                  Default = False
                  Glyph.Data = {
                    DE000000424DDE0000000000000076000000280000000D0000000D0000000100
                    04000000000068000000C40E0000C40E00001000000000000000000000000000
                    8000008000000080800080000000800080008080000080808000C0C0C0000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                    3000333333333333300033333333333330003330033300333000333000300033
                    3000333300000333300033333000333330003333000003333000333000300033
                    3000333003330033300033333333333330003333333333333000333333333333
                    3000}
                  Kind = bkGlyph
                end>
              HideEditCursor = True
              OnButtonClick = grdCertPrjauth_organButtonClick
            end
            object grdCertPrjremark: TdxDBGridBlobColumn
              HeaderAlignment = taCenter
              Width = 100
              BandIndex = 0
              RowIndex = 0
              FieldName = 'remark'
              BlobKind = bkMemo
            end
          end
          object deApplyDateA: TCSAdxDBDateEdit
            Left = 48
            Top = 37
            Width = 121
            TabOrder = 2
            TabStop = False
            Visible = False
            DataField = 'apply_date'
            DataSource = CertPrjd
            StyleController = dmData.dxStyleCtrl
            FixedDateFormat = 'yyyy-MM-dd'
            StoredValues = 4
          end
          object deAuthDateA: TCSAdxDBDateEdit
            Left = 48
            Top = 61
            Width = 121
            TabOrder = 3
            TabStop = False
            Visible = False
            DataField = 'auth_date'
            DataSource = CertPrjd
            StyleController = dmData.dxStyleCtrl
            FixedDateFormat = 'yyyy-MM-dd'
            StoredValues = 4
          end
          object deEndDateA: TCSAdxDBDateEdit
            Left = 48
            Top = 85
            Width = 121
            TabOrder = 4
            TabStop = False
            Visible = False
            DataField = 'end_date'
            DataSource = CertPrjd
            StyleController = dmData.dxStyleCtrl
            FixedDateFormat = 'yyyy-MM-dd'
            StoredValues = 4
          end
        end
        object GroupBox5: TGroupBox
          Left = 0
          Top = 189
          Width = 743
          Height = 242
          Align = alBottom
          Caption = ' '#35768#21487#35777#39033#30446#22411#24335#21015#34920' '
          TabOrder = 1
          object grdCertPrjModal: TdxDBGrid
            Left = 2
            Top = 14
            Width = 739
            Height = 198
            Bands = <
              item
              end>
            DefaultLayout = False
            HeaderPanelRowCount = 1
            KeyField = 'sysid'
            SummaryGroups = <>
            SummarySeparator = ', '
            Align = alClient
            TabOrder = 0
            DataSource = CertPrjModald
            Filter.Criteria = {00000000}
            LookAndFeel = lfFlat
            OptionsCustomize = [edgoBandMoving, edgoBandSizing, edgoColumnMoving, edgoColumnSizing, edgoHeaderPanelSizing]
            OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
            OptionsView = [edgoBandHeaderWidth, edgoShowButtonAlways, edgoUseBitmap]
            object grdCertPrjModalsysid: TdxDBGridColumn
              HeaderAlignment = taCenter
              Visible = False
              Width = 124
              BandIndex = 0
              RowIndex = 0
              FieldName = 'sysid'
            end
            object grdCertPrjModalprj_sysid: TdxDBGridColumn
              HeaderAlignment = taCenter
              Visible = False
              Width = 124
              BandIndex = 0
              RowIndex = 0
              FieldName = 'prj_sysid'
            end
            object grdCertPrjModallevel6_id: TdxDBGridColumn
              HeaderAlignment = taCenter
              Visible = False
              Width = 79
              BandIndex = 0
              RowIndex = 0
              FieldName = 'level6_id'
            end
            object grdCertPrjModallevel6: TdxDBGridLookupColumn
              HeaderAlignment = taCenter
              Width = 120
              BandIndex = 0
              RowIndex = 0
              FieldName = 'level6'
            end
            object grdCertPrjModaltypical_prd: TdxDBGridColumn
              HeaderAlignment = taCenter
              Width = 150
              BandIndex = 0
              RowIndex = 0
              FieldName = 'typical_prd'
            end
            object grdCertPrjModalIsOld: TdxDBGridPickColumn
              HeaderAlignment = taCenter
              Width = 126
              BandIndex = 0
              RowIndex = 0
              FieldName = 'IsOld'
              ShowButtonStyle = sbAlways
              Items.Strings = (
                #9675
                '')
            end
            object grdCertPrjModalIsModal: TdxDBGridColumn
              HeaderAlignment = taCenter
              Width = 124
              BandIndex = 0
              RowIndex = 0
              FieldName = 'IsModal'
              StoredRowIndex = 1
            end
            object grdCertPrjModalmodal_com: TdxDBGridButtonColumn
              HeaderAlignment = taCenter
              Width = 200
              BandIndex = 0
              RowIndex = 0
              FieldName = 'modal_com'
              Buttons = <
                item
                  Default = True
                end>
              OnButtonClick = grdCertPrjModalmodal_comButtonClick
              StoredRowIndex = 1
            end
            object grdCertPrjModalremark: TdxDBGridBlobColumn
              HeaderAlignment = taCenter
              Width = 100
              BandIndex = 0
              RowIndex = 0
              FieldName = 'remark'
              BlobKind = bkMemo
              StoredRowIndex = 1
            end
          end
          object panProdRange: TPanel
            Left = 2
            Top = 212
            Width = 739
            Height = 28
            Align = alBottom
            BevelOuter = bvLowered
            TabOrder = 1
            object Panel9: TPanel
              Left = 486
              Top = 1
              Width = 252
              Height = 26
              Align = alRight
              BevelOuter = bvNone
              TabOrder = 0
              object bbtnModalInsert: TBitBtn
                Left = 0
                Top = 2
                Width = 50
                Height = 22
                Hint = #28155#21152#35760#24405
                Caption = #28155#21152
                TabOrder = 0
                OnClick = bbtnModalInsertClick
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
              object bbtnModalDelete: TBitBtn
                Left = 50
                Top = 2
                Width = 50
                Height = 22
                Hint = #21024#38500#35760#24405
                Caption = #21024#38500
                TabOrder = 1
                OnClick = bbtnModalDeleteClick
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
              object navProdRange: TCSDBNavigator
                Left = 100
                Top = 2
                Width = 150
                Height = 22
                DataSource = CertPrjModald
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
        end
      end
      object tsRequirement: TTabSheet
        Caption = #35780#23457#35760#24405
        ImageIndex = 6
        object grdRequirement: TdxDBGrid
          Left = 0
          Top = 0
          Width = 743
          Height = 403
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
          DataSource = Requirementd
          Filter.Criteria = {00000000}
          LookAndFeel = lfFlat
          OptionsBehavior = [edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoTabThrough, edgoVertThrough]
          OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
          OptionsView = [edgoBandHeaderWidth, edgoRowAutoHeight, edgoShowButtonAlways, edgoUseBitmap]
          object grdRequirementsysid: TdxDBGridColumn
            HeaderAlignment = taCenter
            Visible = False
            BandIndex = 0
            RowIndex = 0
            FieldName = 'sysid'
          end
          object grdRequirementcert_sysid: TdxDBGridColumn
            HeaderAlignment = taCenter
            Visible = False
            BandIndex = 0
            RowIndex = 0
            FieldName = 'cert_sysid'
          end
          object grdRequirementtemp_sysid: TdxDBGridColumn
            HeaderAlignment = taCenter
            Visible = False
            BandIndex = 0
            RowIndex = 0
            FieldName = 'temp_sysid'
          end
          object grdRequirementrec_no: TdxDBGridColumn
            HeaderAlignment = taCenter
            Visible = False
            Width = 20
            BandIndex = 0
            RowIndex = 0
            FieldName = 'rec_no'
          end
          object grdRequirementsegment: TdxDBGridColumn
            DisableEditor = True
            HeaderAlignment = taCenter
            Sorted = csUp
            Visible = False
            Width = 120
            BandIndex = 0
            RowIndex = 0
            FieldName = 'segment'
            GroupIndex = 0
            SummaryType = cstMin
            SummaryField = 'rec_no'
            SummaryFormat = ' '
            SortBySummary = True
          end
          object grdRequirementchapter: TdxDBGridMemoColumn
            DisableEditor = True
            HeaderAlignment = taCenter
            Sorted = csUp
            Visible = False
            Width = 120
            BandIndex = 0
            RowIndex = 0
            FieldName = 'chapter'
            GroupIndex = 1
            SummaryType = cstMin
            SummaryField = 'rec_no'
            SummaryFormat = ' '
            SortBySummary = True
          end
          object grdRequirementitem: TdxDBGridMemoColumn
            DisableEditor = True
            HeaderAlignment = taCenter
            Width = 192
            BandIndex = 0
            RowIndex = 0
            FieldName = 'item'
          end
          object grdRequirementrequirement: TdxDBGridMemoColumn
            DisableEditor = True
            HeaderAlignment = taCenter
            Width = 300
            BandIndex = 0
            RowIndex = 0
            FieldName = 'requirement'
          end
          object grdRequirementexamination: TdxDBGridMemoColumn
            DisableEditor = True
            HeaderAlignment = taCenter
            Width = 200
            BandIndex = 0
            RowIndex = 0
            FieldName = 'examination'
          end
          object grdRequirementestimate: TdxDBGridMemoColumn
            DisableEditor = True
            HeaderAlignment = taCenter
            Width = 200
            BandIndex = 0
            RowIndex = 0
            FieldName = 'estimate'
          end
          object grdRequirementdata: TdxDBGridMemoColumn
            HeaderAlignment = taCenter
            Width = 200
            BandIndex = 0
            RowIndex = 0
            FieldName = 'data'
          end
          object grdRequirementresult: TdxDBGridColumn
            HeaderAlignment = taCenter
            BandIndex = 0
            RowIndex = 0
            FieldName = 'result'
          end
        end
        object panRequirement: TPanel
          Left = 0
          Top = 403
          Width = 743
          Height = 28
          Align = alBottom
          BevelOuter = bvLowered
          TabOrder = 1
          object Panel8: TPanel
            Left = 528
            Top = 1
            Width = 214
            Height = 26
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 2
            object bbtnReqGenerate: TBitBtn
              Left = 0
              Top = 2
              Width = 60
              Height = 22
              Caption = #29983#25104
              TabOrder = 0
              OnClick = bbtnReqGenerateClick
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
            object navRequirement: TCSDBNavigator
              Left = 62
              Top = 2
              Width = 150
              Height = 22
              DataSource = Requirementd
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
          object bbtnExpand: TBitBtn
            Left = 3
            Top = 3
            Width = 60
            Height = 22
            Caption = #23637#24320
            TabOrder = 0
            OnClick = bbtnExpandClick
            Glyph.Data = {
              0C010000424D0C01000000000000760000002800000010000000100000000100
              04000200000096000000C40E0000C40E00000000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0010FF000010FF
              00000A00020F04FF000002000833023004FF000000040B030833020F02FF0000
              00040FB00833023002FF000000060BFB03000833020F000000060FBFB0000A00
              0000020B08FB020F04FF0000020F08BF020F04FF000000040BFB0600020F04FF
              00000004F00008FF0004000F00000CFF0004F00F000008FF00040FFF040F0000
              08FF0004F00004FF000010FF00000001}
          end
          object bbtnCollapse: TBitBtn
            Left = 65
            Top = 3
            Width = 60
            Height = 22
            Caption = #25910#36215
            TabOrder = 1
            OnClick = bbtnCollapseClick
            Glyph.Data = {
              0E010000424D0E01000000000000760000002800000010000000100000000100
              04000200000098000000C40E0000C40E00000000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0010FF000010FF
              00000A00020F04FF000002000833023004FF000000040B030833020F02FF0000
              00040FB00833023002FF000000060BFB03000833020F000000060FBFB0000A00
              0000020B08FB020F04FF0000020F08BF020F04FF000000040BFB0600020F04FF
              00000004F0000CFF000008FF0004000F04FF000008FF020006FF000008FF040F
              0004FF0F00000AFF0004F00002FF00000001}
          end
        end
      end
      object tsAuthDoc: TTabSheet
        Caption = #35748#35777#24773#20917#21450#36164#26009#24773#20917
        ImageIndex = 3
        object Splitter3: TSplitter
          Left = 457
          Top = 0
          Width = 3
          Height = 431
          Cursor = crSizeWE
          Align = alRight
        end
        object GroupBox8: TGroupBox
          Left = 0
          Top = 0
          Width = 457
          Height = 431
          Align = alClient
          Caption = ' '#35748#35777#24773#20917' '
          TabOrder = 0
          object grdAuthInfo: TdxDBGrid
            Left = 2
            Top = 14
            Width = 453
            Height = 387
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
            OnClick = grdAuthInfoClick
            DataSource = AuthInfod
            Filter.Criteria = {00000000}
            LookAndFeel = lfFlat
            OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
            OptionsView = [edgoBandHeaderWidth, edgoShowButtonAlways, edgoUseBitmap]
            object grdAuthInfosysid: TdxDBGridColumn
              HeaderAlignment = taCenter
              Visible = False
              BandIndex = 0
              RowIndex = 0
              FieldName = 'sysid'
            end
            object grdAuthInfoorgan_sysid: TdxDBGridColumn
              HeaderAlignment = taCenter
              Visible = False
              BandIndex = 0
              RowIndex = 0
              FieldName = 'organ_sysid'
            end
            object grdAuthInfoname: TdxDBGridColumn
              HeaderAlignment = taCenter
              Width = 120
              BandIndex = 0
              RowIndex = 0
              FieldName = 'name'
            end
            object grdAuthInfoorgan_name: TdxDBGridButtonColumn
              HeaderAlignment = taCenter
              Width = 260
              BandIndex = 0
              RowIndex = 0
              FieldName = 'organ_name'
              Buttons = <
                item
                  Default = True
                end>
              OnButtonClick = grdAuthInfoorgan_nameButtonClick
            end
            object grdAuthInfoauth_date: TdxDBGridColumn
              HeaderAlignment = taCenter
              Width = 80
              BandIndex = 0
              RowIndex = 0
              FieldName = 'auth_date'
            end
            object grdAuthInfovalid_date: TdxDBGridColumn
              HeaderAlignment = taCenter
              BandIndex = 0
              RowIndex = 0
              FieldName = 'valid_date'
            end
            object grdAuthInforemark: TdxDBGridBlobColumn
              HeaderAlignment = taCenter
              Width = 100
              BandIndex = 0
              RowIndex = 0
              FieldName = 'remark'
              BlobKind = bkMemo
            end
          end
          object Panel10: TPanel
            Left = 2
            Top = 401
            Width = 453
            Height = 28
            Align = alBottom
            BevelOuter = bvLowered
            TabOrder = 1
            object Panel19: TPanel
              Left = 200
              Top = 1
              Width = 252
              Height = 26
              Align = alRight
              BevelOuter = bvNone
              TabOrder = 0
              object bbtnAuthInsert: TBitBtn
                Left = 0
                Top = 2
                Width = 50
                Height = 22
                Hint = #28155#21152#35760#24405
                Caption = #28155#21152
                TabOrder = 0
                OnClick = bbtnAuthInsertClick
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
              object bbtnAuthDelete: TBitBtn
                Left = 50
                Top = 2
                Width = 50
                Height = 22
                Hint = #21024#38500#35760#24405
                Caption = #21024#38500
                TabOrder = 1
                OnClick = bbtnAuthDeleteClick
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
              object navAuthInfo: TCSDBNavigator
                Left = 100
                Top = 2
                Width = 150
                Height = 22
                DataSource = AuthInfod
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
          object deAIAuthDateA: TCSAdxDBDateEdit
            Left = 136
            Top = 60
            Width = 121
            TabOrder = 2
            Visible = False
            DataField = 'auth_date'
            DataSource = AuthInfod
            StyleController = dmData.dxStyleCtrl
            FixedDateFormat = 'yyyy-MM-dd'
            StoredValues = 4
          end
          object deAIValidDateA: TCSAdxDBDateEdit
            Left = 136
            Top = 88
            Width = 121
            TabOrder = 3
            Visible = False
            DataField = 'valid_date'
            DataSource = AuthInfod
            StyleController = dmData.dxStyleCtrl
            FixedDateFormat = 'yyyy-MM-dd'
            StoredValues = 4
          end
        end
        object GroupBox9: TGroupBox
          Left = 460
          Top = 0
          Width = 283
          Height = 431
          Align = alRight
          Caption = ' '#25991#26723#36164#26009#24773#20917' '
          TabOrder = 1
          object grdCertDoc: TdxDBGrid
            Left = 2
            Top = 14
            Width = 279
            Height = 387
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
            DataSource = CertDocd
            Filter.Criteria = {00000000}
            LookAndFeel = lfFlat
            OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
            object grdCertDocsysid: TdxDBGridColumn
              HeaderAlignment = taCenter
              Visible = False
              BandIndex = 0
              RowIndex = 0
              FieldName = 'sysid'
            end
            object grdCertDoccert_sysid: TdxDBGridColumn
              HeaderAlignment = taCenter
              Visible = False
              BandIndex = 0
              RowIndex = 0
              FieldName = 'cert_sysid'
            end
            object grdCertDocserial_no: TdxDBGridColumn
              HeaderAlignment = taCenter
              Width = 50
              BandIndex = 0
              RowIndex = 0
              FieldName = 'serial_no'
            end
            object grdCertDocname: TdxDBGridColumn
              HeaderAlignment = taCenter
              Width = 200
              BandIndex = 0
              RowIndex = 0
              FieldName = 'name'
            end
            object grdCertDocquantity: TdxDBGridColumn
              HeaderAlignment = taCenter
              Width = 70
              BandIndex = 0
              RowIndex = 0
              FieldName = 'quantity'
            end
            object grdCertDocremark: TdxDBGridBlobColumn
              HeaderAlignment = taCenter
              Width = 100
              BandIndex = 0
              RowIndex = 0
              FieldName = 'remark'
              BlobKind = bkMemo
            end
          end
          object Panel20: TPanel
            Left = 2
            Top = 401
            Width = 279
            Height = 28
            Align = alBottom
            BevelOuter = bvLowered
            TabOrder = 1
            object Panel21: TPanel
              Left = 26
              Top = 1
              Width = 252
              Height = 26
              Align = alRight
              BevelOuter = bvNone
              TabOrder = 0
              object bbtnDocInsert: TBitBtn
                Left = 0
                Top = 2
                Width = 50
                Height = 22
                Hint = #28155#21152#35760#24405
                Caption = #28155#21152
                TabOrder = 0
                OnClick = bbtnDocInsertClick
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
              object bbtnDocDelete: TBitBtn
                Left = 50
                Top = 2
                Width = 50
                Height = 22
                Hint = #21024#38500#35760#24405
                Caption = #21024#38500
                TabOrder = 1
                OnClick = bbtnDocDeleteClick
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
              object navCertDoc: TCSDBNavigator
                Left = 100
                Top = 2
                Width = 150
                Height = 22
                DataSource = CertDocd
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
        end
      end
      object tsPrdConst: TTabSheet
        Caption = #24037#20316#24773#20917#21450#20998#21253#22806#21327#24773#20917
        ImageIndex = 2
        object Splitter4: TSplitter
          Left = 390
          Top = 0
          Width = 3
          Height = 431
          Cursor = crSizeWE
          Align = alRight
        end
        object GroupBox3: TGroupBox
          Left = 0
          Top = 0
          Width = 390
          Height = 431
          Align = alClient
          Caption = ' '#24037#20316#24773#20917' '
          TabOrder = 0
          object grdCertPrd: TdxDBGrid
            Left = 2
            Top = 14
            Width = 386
            Height = 387
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
            DataSource = CertPrdd
            Filter.Criteria = {00000000}
            LookAndFeel = lfFlat
            OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
            OptionsView = [edgoBandHeaderWidth, edgoShowButtonAlways, edgoUseBitmap]
            object grdCertPrdsysid: TdxDBGridColumn
              HeaderAlignment = taCenter
              Visible = False
              BandIndex = 0
              RowIndex = 0
              FieldName = 'sysid'
            end
            object grdCertPrdcert_sysid: TdxDBGridColumn
              HeaderAlignment = taCenter
              Visible = False
              BandIndex = 0
              RowIndex = 0
              FieldName = 'cert_sysid'
            end
            object grdCertPrdyear: TdxDBGridColumn
              HeaderAlignment = taCenter
              Width = 56
              BandIndex = 0
              RowIndex = 0
              FieldName = 'year'
            end
            object grdCertPrdlevel4_id: TdxDBGridColumn
              HeaderAlignment = taCenter
              Visible = False
              BandIndex = 0
              RowIndex = 0
              FieldName = 'level4_id'
            end
            object grdCertPrdlevel4: TdxDBGridLookupColumn
              HeaderAlignment = taCenter
              Width = 120
              BandIndex = 0
              RowIndex = 0
              FieldName = 'level4'
            end
            object grdCertPrdquantity: TdxDBGridColumn
              HeaderAlignment = taCenter
              Width = 80
              BandIndex = 0
              RowIndex = 0
              FieldName = 'quantity'
            end
            object grdCertPrdvalue: TdxDBGridColumn
              HeaderAlignment = taCenter
              Width = 100
              BandIndex = 0
              RowIndex = 0
              FieldName = 'value'
            end
            object grdCertPrdremark: TdxDBGridBlobColumn
              HeaderAlignment = taCenter
              Width = 100
              BandIndex = 0
              RowIndex = 0
              FieldName = 'remark'
              BlobKind = bkMemo
            end
          end
          object Panel11: TPanel
            Left = 2
            Top = 401
            Width = 386
            Height = 28
            Align = alBottom
            BevelOuter = bvLowered
            TabOrder = 1
            object Panel13: TPanel
              Left = 133
              Top = 1
              Width = 252
              Height = 26
              Align = alRight
              BevelOuter = bvNone
              TabOrder = 0
              object bbtnPrdInsert: TBitBtn
                Left = 0
                Top = 2
                Width = 50
                Height = 22
                Hint = #28155#21152#35760#24405
                Caption = #28155#21152
                TabOrder = 0
                OnClick = bbtnPrdInsertClick
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
              object bbtnPrdDelete: TBitBtn
                Left = 50
                Top = 2
                Width = 50
                Height = 22
                Hint = #21024#38500#35760#24405
                Caption = #21024#38500
                TabOrder = 1
                OnClick = bbtnPrdDeleteClick
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
              object navCertPrd: TCSDBNavigator
                Left = 100
                Top = 2
                Width = 150
                Height = 22
                DataSource = CertPrdd
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
        end
        object GroupBox7: TGroupBox
          Left = 393
          Top = 0
          Width = 350
          Height = 431
          Align = alRight
          Caption = ' '#20998#21253#22806#21327#24773#20917' '
          TabOrder = 1
          object grdCertConst: TdxDBGrid
            Left = 2
            Top = 14
            Width = 346
            Height = 387
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
            DataSource = CertConstd
            Filter.Criteria = {00000000}
            LookAndFeel = lfFlat
            OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
            OptionsView = [edgoBandHeaderWidth, edgoShowButtonAlways, edgoUseBitmap]
            object grdCertConstsysid: TdxDBGridColumn
              HeaderAlignment = taCenter
              Visible = False
              BandIndex = 0
              RowIndex = 0
              FieldName = 'sysid'
            end
            object grdCertConstcert_id: TdxDBGridColumn
              HeaderAlignment = taCenter
              Visible = False
              BandIndex = 0
              RowIndex = 0
              FieldName = 'cert_id'
            end
            object grdCertConstname: TdxDBGridColumn
              HeaderAlignment = taCenter
              Width = 120
              BandIndex = 0
              RowIndex = 0
              FieldName = 'name'
            end
            object grdCertConstorgan_name: TdxDBGridButtonColumn
              HeaderAlignment = taCenter
              Width = 200
              BandIndex = 0
              RowIndex = 0
              FieldName = 'organ_name'
              Buttons = <
                item
                  Default = True
                end>
              OnButtonClick = grdCertConstorgan_nameButtonClick
            end
            object grdCertConstorgan_regno: TdxDBGridColumn
              HeaderAlignment = taCenter
              BandIndex = 0
              RowIndex = 0
              FieldName = 'organ_regno'
            end
            object grdCertConstremark: TdxDBGridBlobColumn
              HeaderAlignment = taCenter
              Width = 100
              BandIndex = 0
              RowIndex = 0
              FieldName = 'remark'
              BlobKind = bkMemo
            end
          end
          object Panel17: TPanel
            Left = 2
            Top = 401
            Width = 346
            Height = 28
            Align = alBottom
            BevelOuter = bvLowered
            TabOrder = 1
            object Panel18: TPanel
              Left = 93
              Top = 1
              Width = 252
              Height = 26
              Align = alRight
              BevelOuter = bvNone
              TabOrder = 0
              object bbtnCnsInsert: TBitBtn
                Left = 0
                Top = 2
                Width = 50
                Height = 22
                Hint = #28155#21152#35760#24405
                Caption = #28155#21152
                TabOrder = 0
                OnClick = bbtnCnsInsertClick
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
              object bbtnCnsDelete: TBitBtn
                Left = 50
                Top = 2
                Width = 50
                Height = 22
                Hint = #21024#38500#35760#24405
                Caption = #21024#38500
                TabOrder = 1
                OnClick = bbtnCnsDeleteClick
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
              object navCertConst: TCSDBNavigator
                Left = 100
                Top = 2
                Width = 150
                Height = 22
                DataSource = CertConstd
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
        end
      end
      object tsDeptPsn: TTabSheet
        Caption = #37096#38376#24773#20917#21450#20154#21592#24773#20917
        ImageIndex = 4
        object Splitter5: TSplitter
          Left = 350
          Top = 0
          Width = 3
          Height = 431
          Cursor = crSizeWE
        end
        object GroupBox4: TGroupBox
          Left = 0
          Top = 0
          Width = 350
          Height = 431
          Align = alLeft
          Caption = ' '#37096#38376#24773#20917' '
          TabOrder = 0
          object Panel12: TPanel
            Left = 2
            Top = 401
            Width = 346
            Height = 28
            Align = alBottom
            BevelOuter = bvLowered
            TabOrder = 1
            object Panel14: TPanel
              Left = 93
              Top = 1
              Width = 252
              Height = 26
              Align = alRight
              BevelOuter = bvNone
              TabOrder = 0
              object bbtnDeptInsert: TBitBtn
                Left = 0
                Top = 2
                Width = 50
                Height = 22
                Hint = #28155#21152#35760#24405
                Caption = #28155#21152
                TabOrder = 0
                OnClick = bbtnDeptInsertClick
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
              object bbtnDeptDelete: TBitBtn
                Left = 50
                Top = 2
                Width = 50
                Height = 22
                Hint = #21024#38500#35760#24405
                Caption = #21024#38500
                TabOrder = 1
                OnClick = bbtnDeptDeleteClick
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
              object navCertDept: TCSDBNavigator
                Left = 100
                Top = 2
                Width = 150
                Height = 22
                DataSource = CertDeptd
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
          object grdCertDept: TdxDBGrid
            Left = 2
            Top = 14
            Width = 346
            Height = 387
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
            DataSource = CertDeptd
            Filter.Criteria = {00000000}
            LookAndFeel = lfFlat
            OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
            object grdCertDeptsysid: TdxDBGridColumn
              HeaderAlignment = taCenter
              Visible = False
              BandIndex = 0
              RowIndex = 0
              FieldName = 'sysid'
            end
            object grdCertDeptcert_sysid: TdxDBGridColumn
              HeaderAlignment = taCenter
              Visible = False
              BandIndex = 0
              RowIndex = 0
              FieldName = 'cert_sysid'
            end
            object grdCertDeptname: TdxDBGridColumn
              HeaderAlignment = taCenter
              Width = 80
              BandIndex = 0
              RowIndex = 0
              FieldName = 'name'
            end
            object grdCertDeptmanager: TdxDBGridColumn
              HeaderAlignment = taCenter
              Width = 80
              BandIndex = 0
              RowIndex = 0
              FieldName = 'manager'
            end
            object grdCertDeptquantity: TdxDBGridColumn
              HeaderAlignment = taCenter
              BandIndex = 0
              RowIndex = 0
              FieldName = 'quantity'
            end
            object grdCertDeptremark: TdxDBGridBlobColumn
              HeaderAlignment = taCenter
              Width = 100
              BandIndex = 0
              RowIndex = 0
              FieldName = 'remark'
              BlobKind = bkMemo
            end
          end
        end
        object GroupBox6: TGroupBox
          Left = 353
          Top = 0
          Width = 390
          Height = 431
          Align = alClient
          Caption = ' '#20154#21592#24773#20917' '
          TabOrder = 1
          object grdCertPsn: TdxDBGrid
            Left = 2
            Top = 14
            Width = 386
            Height = 387
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
            DataSource = CertPsnd
            Filter.Criteria = {00000000}
            LookAndFeel = lfFlat
            OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
            OptionsView = [edgoBandHeaderWidth, edgoShowButtonAlways, edgoUseBitmap]
            object grdCertPsnsysid: TdxDBGridColumn
              HeaderAlignment = taCenter
              Visible = False
              BandIndex = 0
              RowIndex = 0
              FieldName = 'sysid'
            end
            object grdCertPsncert_sysid: TdxDBGridColumn
              HeaderAlignment = taCenter
              Visible = False
              BandIndex = 0
              RowIndex = 0
              FieldName = 'cert_sysid'
            end
            object grdCertPsnpsn_sysid: TdxDBGridColumn
              HeaderAlignment = taCenter
              Visible = False
              BandIndex = 0
              RowIndex = 0
              FieldName = 'psn_sysid'
            end
            object grdCertPsnname: TdxDBGridColumn
              HeaderAlignment = taCenter
              Width = 80
              BandIndex = 0
              RowIndex = 0
              FieldName = 'name'
            end
            object grdCertPsncardid: TdxDBGridColumn
              HeaderAlignment = taCenter
              BandIndex = 0
              RowIndex = 0
              FieldName = 'cardid'
            end
            object grdCertPsneducation: TdxDBGridColumn
              HeaderAlignment = taCenter
              Visible = False
              Width = 54
              BandIndex = 0
              RowIndex = 0
              FieldName = 'education'
            end
            object grdCertPsneducation_name: TdxDBGridColumn
              HeaderAlignment = taCenter
              Width = 80
              BandIndex = 0
              RowIndex = 0
              FieldName = 'education_name'
            end
            object grdCertPsnspeciality: TdxDBGridColumn
              HeaderAlignment = taCenter
              Width = 120
              BandIndex = 0
              RowIndex = 0
              FieldName = 'speciality'
            end
            object grdCertPsntitleofpost: TdxDBGridColumn
              HeaderAlignment = taCenter
              Width = 120
              BandIndex = 0
              RowIndex = 0
              FieldName = 'titleofpost'
            end
            object grdCertPsnlicns_sysid: TdxDBGridColumn
              HeaderAlignment = taCenter
              Visible = False
              BandIndex = 0
              RowIndex = 0
              FieldName = 'licns_sysid'
            end
            object grdCertPsnlicns_category: TdxDBGridColumn
              HeaderAlignment = taCenter
              Visible = False
              BandIndex = 0
              RowIndex = 0
              FieldName = 'licns_category'
            end
            object grdCertPsnlicns_category_name: TdxDBGridColumn
              HeaderAlignment = taCenter
              Width = 180
              BandIndex = 0
              RowIndex = 0
              FieldName = 'licns_category_name'
            end
            object grdCertPsnlicns_prj_sysid: TdxDBGridColumn
              HeaderAlignment = taCenter
              Visible = False
              BandIndex = 0
              RowIndex = 0
              FieldName = 'licns_prj_sysid'
            end
            object grdCertPsnlicns_prj: TdxDBGridColumn
              HeaderAlignment = taCenter
              BandIndex = 0
              RowIndex = 0
              FieldName = 'licns_prj'
            end
            object grdCertPsnpsnlicns_levelcode: TdxDBGridColumn
              HeaderAlignment = taCenter
              Visible = False
              BandIndex = 0
              RowIndex = 0
              FieldName = 'psnlicns_levelcode'
            end
            object grdCertPsnpsnlicns_level: TdxDBGridColumn
              HeaderAlignment = taCenter
              Width = 180
              BandIndex = 0
              RowIndex = 0
              FieldName = 'psnlicns_level'
            end
          end
          object Panel22: TPanel
            Left = 2
            Top = 401
            Width = 386
            Height = 28
            Align = alBottom
            BevelOuter = bvLowered
            TabOrder = 1
            object Panel23: TPanel
              Left = 133
              Top = 1
              Width = 252
              Height = 26
              Align = alRight
              BevelOuter = bvNone
              TabOrder = 0
              object bbtnPsnInsert: TBitBtn
                Left = 0
                Top = 2
                Width = 50
                Height = 22
                Hint = #28155#21152#35760#24405
                Caption = #28155#21152
                TabOrder = 0
                OnClick = bbtnPsnInsertClick
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
              object bbtnPsnDelete: TBitBtn
                Left = 50
                Top = 2
                Width = 50
                Height = 22
                Hint = #21024#38500#35760#24405
                Caption = #21024#38500
                TabOrder = 1
                OnClick = bbtnPsnDeleteClick
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
              object nabCertPsn: TCSDBNavigator
                Left = 100
                Top = 2
                Width = 150
                Height = 22
                DataSource = CertPsnd
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
        end
      end
      object tsEquip: TTabSheet
        Caption = #29983#20135#35774#22791#21450#26816#39564#20202#22120#24773#20917
        ImageIndex = 5
        object grdCertEquip: TdxDBGrid
          Left = 0
          Top = 0
          Width = 743
          Height = 403
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
          DataSource = CertEquipd
          Filter.Criteria = {00000000}
          LookAndFeel = lfFlat
          OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
          OptionsView = [edgoBandHeaderWidth, edgoShowButtonAlways, edgoUseBitmap]
          object grdCertEquipsysid: TdxDBGridColumn
            HeaderAlignment = taCenter
            Visible = False
            BandIndex = 0
            RowIndex = 0
            FieldName = 'sysid'
          end
          object grdCertEquipcert_sysid: TdxDBGridColumn
            HeaderAlignment = taCenter
            Visible = False
            BandIndex = 0
            RowIndex = 0
            FieldName = 'cert_sysid'
          end
          object grdCertEquipserial_no: TdxDBGridColumn
            HeaderAlignment = taCenter
            Sorted = csUp
            BandIndex = 0
            RowIndex = 0
            FieldName = 'serial_no'
          end
          object grdCertEquipname: TdxDBGridColumn
            HeaderAlignment = taCenter
            BandIndex = 0
            RowIndex = 0
            FieldName = 'name'
          end
          object grdCertEquippower: TdxDBGridColumn
            HeaderAlignment = taCenter
            BandIndex = 0
            RowIndex = 0
            FieldName = 'power'
          end
          object grdCertEquipquantity: TdxDBGridColumn
            HeaderAlignment = taCenter
            BandIndex = 0
            RowIndex = 0
            FieldName = 'quantity'
          end
          object grdCertEquipis_instru: TdxDBGridColumn
            HeaderAlignment = taCenter
            BandIndex = 0
            RowIndex = 0
            FieldName = 'is_instru'
          end
          object grdCertEquipis_selfcheck: TdxDBGridColumn
            HeaderAlignment = taCenter
            BandIndex = 0
            RowIndex = 0
            FieldName = 'is_selfcheck'
          end
          object grdCertEquipcheck_range: TdxDBGridColumn
            HeaderAlignment = taCenter
            BandIndex = 0
            RowIndex = 0
            FieldName = 'check_range'
          end
          object grdCertEquipremark: TdxDBGridBlobColumn
            HeaderAlignment = taCenter
            Width = 100
            BandIndex = 0
            RowIndex = 0
            FieldName = 'remark'
            BlobKind = bkMemo
          end
        end
        object Panel15: TPanel
          Left = 0
          Top = 403
          Width = 743
          Height = 28
          Align = alBottom
          BevelOuter = bvLowered
          TabOrder = 1
          object Panel16: TPanel
            Left = 490
            Top = 1
            Width = 252
            Height = 26
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 0
            object bbtnEqpInsert: TBitBtn
              Left = 0
              Top = 2
              Width = 50
              Height = 22
              Hint = #28155#21152#35760#24405
              Caption = #28155#21152
              TabOrder = 0
              OnClick = bbtnEqpInsertClick
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
            object bbtnEqpDelete: TBitBtn
              Left = 50
              Top = 2
              Width = 50
              Height = 22
              Hint = #21024#38500#35760#24405
              Caption = #21024#38500
              TabOrder = 1
              OnClick = bbtnEqpDeleteClick
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
            object navCertEquip: TCSDBNavigator
              Left = 100
              Top = 2
              Width = 150
              Height = 22
              DataSource = CertEquipd
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
      end
    end
  end
  object CertPrj: TCSADOQuery
    CacheSize = 1
    Connection = dmData.adocon
    AfterInsert = CertPrjAfterInsert
    BeforeEdit = CertPrjBeforeEdit
    BeforePost = CertPrjBeforePost
    AfterPost = CertPrjAfterPost
    AfterCancel = CertPrjAfterCancel
    AfterScroll = CertPrjAfterScroll
    Parameters = <>
    Left = 136
    Top = 334
    object CertPrjsysid: TStringField
      DisplayLabel = #31995#32479'ID'
      DisplayWidth = 20
      FieldName = 'sysid'
    end
    object CertPrjcert_sysid: TStringField
      DisplayLabel = #31995#32479#35777#20070'ID'
      FieldName = 'cert_sysid'
    end
    object CertPrjlevel4_id: TStringField
      DisplayLabel = #35774#22791#31867#22411#20195#30721
      FieldName = 'level4_id'
      Size = 4
    end
    object CertPrjlevel4: TStringField
      DisplayLabel = #35774#22791#31867#22411
      FieldKind = fkLookup
      FieldName = 'level4'
      LookupDataSet = CertLevel4
      LookupKeyFields = 'id'
      LookupResultField = 'name'
      KeyFields = 'level4_id'
      Size = 100
      Lookup = True
    end
    object CertPrjlevel5_id: TStringField
      DisplayLabel = #35768#21487#31561#32423#20195#30721
      FieldName = 'level5_id'
      Size = 4
    end
    object CertPrjlevel5: TStringField
      DisplayLabel = #35768#21487#31561#32423
      FieldKind = fkLookup
      FieldName = 'level5'
      LookupDataSet = CertLevel5
      LookupKeyFields = 'id'
      LookupResultField = 'name'
      KeyFields = 'level5_id'
      Size = 100
      Lookup = True
    end
    object CertPrjapply_date: TStringField
      DisplayLabel = #30003#35831#26085#26399
      FieldName = 'apply_date'
      Size = 10
    end
    object CertPrjauth_date: TStringField
      DisplayLabel = #25209#20934#26085#26399
      FieldName = 'auth_date'
      Size = 10
    end
    object CertPrjend_date: TStringField
      DisplayLabel = #26377#25928#26085#26399
      FieldName = 'end_date'
      Size = 10
    end
    object CertPrjstate: TStringField
      DisplayLabel = #39033#30446#29366#24577#20195#30721
      FieldName = 'state'
      Size = 4
    end
    object CertPrjstate_name: TStringField
      DisplayLabel = #39033#30446#29366#24577
      FieldKind = fkLookup
      FieldName = 'state_name'
      LookupDataSet = OrganPrjState
      LookupKeyFields = 'id'
      LookupResultField = 'name'
      KeyFields = 'state'
      Lookup = True
    end
    object CertPrjauth_organ_sysid: TStringField
      DisplayLabel = #25209#20934#26426#26500#31995#32479'ID'
      FieldName = 'auth_organ_sysid'
    end
    object CertPrjauth_organ: TStringField
      DisplayLabel = #25209#20934#26426#26500
      FieldKind = fkLookup
      FieldName = 'auth_organ'
      LookupDataSet = mPrjOrganInfo
      LookupKeyFields = 'auth_organ_sysid'
      LookupResultField = 'auth_organ'
      KeyFields = 'auth_organ_sysid'
      Size = 60
      Lookup = True
    end
    object CertPrjremark: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'remark'
      Size = 200
    end
  end
  object CertPrjd: TDataSource
    DataSet = CertPrj
    Left = 136
    Top = 362
  end
  object Requirement: TCSADOQuery
    CacheSize = 1
    Connection = dmData.adocon
    Parameters = <>
    Left = 164
    Top = 334
    object Requirementsysid: TStringField
      DisplayLabel = #31995#32479#24517#22791#26465#20214'ID'
      FieldName = 'sysid'
    end
    object Requirementcert_sysid: TStringField
      DisplayLabel = #31995#32479#35777#20070'ID'
      FieldName = 'cert_sysid'
    end
    object Requirementtemp_sysid: TStringField
      DisplayLabel = #31995#32479#27169#26495'ID'
      FieldName = 'temp_sysid'
    end
    object Requirementrec_no: TIntegerField
      DisplayLabel = #24207#21495
      FieldName = 'rec_no'
    end
    object Requirementsegment: TStringField
      DisplayLabel = #35780#23457#20998#31867
      FieldName = 'segment'
      Size = 50
    end
    object Requirementchapter: TStringField
      DisplayLabel = #35780#23457#39033#30446
      FieldName = 'chapter'
      Size = 50
    end
    object Requirementitem: TStringField
      DisplayLabel = #35780#23457#20869#23481
      FieldName = 'item'
      Size = 80
    end
    object Requirementrequirement: TStringField
      DisplayLabel = #35780#23457#35201#28857
      FieldName = 'requirement'
      Size = 800
    end
    object Requirementexamination: TStringField
      DisplayLabel = #32771#26680#26041#27861
      FieldName = 'examination'
      Size = 400
    end
    object Requirementcontent: TStringField
      DisplayLabel = #35780#20215#26041#27861
      FieldName = 'estimate'
      Size = 400
    end
    object Requirementdata: TStringField
      DisplayLabel = #32771#26680#35760#24405
      FieldName = 'data'
      Size = 400
    end
    object Requirementresult: TStringField
      DisplayLabel = #35780#23457#32467#26524
      FieldName = 'result'
      Size = 10
    end
  end
  object Requirementd: TDataSource
    DataSet = Requirement
    Left = 164
    Top = 362
  end
  object CertPrjModal: TCSADOQuery
    CacheSize = 1
    Connection = dmData.adocon
    AfterInsert = CertPrjModalAfterInsert
    BeforePost = CertPrjModalBeforePost
    Parameters = <>
    Left = 192
    Top = 334
    object CertPrjModalsysid: TStringField
      DisplayLabel = #31995#32479'ID'
      FieldName = 'sysid'
    end
    object CertPrjModalprj_sysid: TStringField
      DisplayLabel = #31995#32479#39033#30446'ID'
      FieldName = 'prj_sysid'
    end
    object CertPrjModallevel6_id: TStringField
      DisplayLabel = #35774#22791#22411#24335#20195#30721
      FieldName = 'level6_id'
      Size = 4
    end
    object CertPrjModallevel6: TStringField
      DisplayLabel = #35774#22791#22411#24335
      FieldKind = fkLookup
      FieldName = 'level6'
      LookupDataSet = CertLevel6
      LookupKeyFields = 'id'
      LookupResultField = 'name'
      KeyFields = 'level6_id'
      Size = 100
      Lookup = True
    end
    object CertPrjModaltypical_prd: TStringField
      DisplayLabel = #20195#34920#20135#21697
      FieldName = 'typical_prd'
      Size = 200
    end
    object CertPrjModalIsOld: TStringField
      DisplayLabel = #21407#26377#35768#21487#65288#21040#26399#22797#26597#65289
      FieldName = 'IsOld'
      Size = 2
    end
    object CertPrjModalIsModal: TStringField
      DisplayLabel = #26159#21542#22411#24335#35797#39564
      FieldName = 'IsModal'
    end
    object CertPrjModalmodal_com: TStringField
      DisplayLabel = #22411#24335#35797#39564#21333#20301
      FieldName = 'modal_com'
      Size = 60
    end
    object CertPrjModalremark: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'remark'
      Size = 200
    end
  end
  object CertPrjModald: TDataSource
    DataSet = CertPrjModal
    Left = 192
    Top = 362
  end
  object Temp: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltReadOnly
    Parameters = <>
    Left = 220
    Top = 334
  end
  object CertInfo: TCSADOQuery
    Connection = dmData.adocon
    AfterInsert = CertInfoAfterInsert
    BeforeEdit = CertInfoBeforeEdit
    BeforePost = CertInfoBeforePost
    AfterPost = CertInfoAfterPost
    AfterCancel = CertInfoAfterCancel
    Parameters = <>
    Left = 108
    Top = 334
  end
  object CertInfod: TDataSource
    DataSet = CertInfo
    OnDataChange = CertInfodDataChange
    Left = 108
    Top = 362
  end
  object mOrganInfo: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 260
    Top = 334
    object mOrganInfoorgan_sysid: TStringField
      FieldName = 'organ_sysid'
    end
    object mOrganInfoorgan_name: TStringField
      FieldName = 'organ_name'
      Size = 60
    end
    object mOrganInfoauth_organ_sysid: TStringField
      FieldName = 'auth_organ_sysid'
    end
    object mOrganInfoauth_organ_name: TStringField
      FieldName = 'auth_organ_name'
      Size = 60
    end
  end
  object mOrganInfod: TDataSource
    DataSet = mOrganInfo
    Left = 260
    Top = 362
  end
  object CertLevel1: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltReadOnly
    Parameters = <>
    Left = 316
    Top = 334
  end
  object CertLevel1d: TDataSource
    DataSet = CertLevel1
    Left = 316
    Top = 362
  end
  object CertState: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltReadOnly
    Parameters = <>
    Left = 484
    Top = 334
  end
  object CodeCertStated: TDataSource
    DataSet = CertState
    Left = 484
    Top = 362
  end
  object CertLevel2: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltReadOnly
    Parameters = <>
    Left = 344
    Top = 334
  end
  object CertLevel3: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltReadOnly
    Parameters = <>
    Left = 372
    Top = 334
  end
  object CertLevel4: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltReadOnly
    Parameters = <>
    Left = 400
    Top = 334
  end
  object CertLevel5: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltReadOnly
    Parameters = <>
    Left = 428
    Top = 334
  end
  object mOrganInfoBak: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 288
    Top = 334
    object mOrganInfoBakorgan_sysid: TStringField
      FieldName = 'organ_sysid'
    end
    object mOrganInfoBakorgan_name: TStringField
      FieldName = 'organ_name'
      Size = 60
    end
    object mOrganInfoBakissueorgan_sysid: TStringField
      FieldName = 'issueorgan_sysid'
    end
    object mOrganInfoBakissueorgan_name: TStringField
      FieldName = 'issueorgan_name'
      Size = 60
    end
    object mOrganInfoBakpzorgan_sysid: TStringField
      FieldName = 'pzorgan_sysid'
    end
    object mOrganInfoBakpzorgan_name: TStringField
      FieldName = 'pzorgan_name'
      Size = 60
    end
  end
  object CertLevel6: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltReadOnly
    Parameters = <>
    Left = 456
    Top = 334
  end
  object CertLevel2d: TDataSource
    DataSet = CertLevel2
    Left = 344
    Top = 362
  end
  object CertLevel3d: TDataSource
    DataSet = CertLevel3
    Left = 372
    Top = 362
  end
  object OrganPrjState: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltReadOnly
    Parameters = <>
    Left = 512
    Top = 334
  end
  object mPrjOrganInfo: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 552
    Top = 334
    object mPrjOrganInfoauth_organ_sysid: TStringField
      FieldName = 'auth_organ_sysid'
    end
    object mPrjOrganInfoauth_organ: TStringField
      FieldName = 'auth_organ'
      Size = 60
    end
  end
  object mPrjOrganInfoBak: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 580
    Top = 334
    object mPrjOrganInfoBakauth_organ_sysid: TStringField
      FieldName = 'auth_organ_sysid'
    end
    object mPrjOrganInfoBakauth_organ: TStringField
      FieldName = 'auth_organ'
      Size = 60
    end
  end
  object AuthInfo: TCSADOQuery
    CacheSize = 1
    Connection = dmData.adocon
    AfterInsert = AuthInfoAfterInsert
    Parameters = <>
    Left = 684
    Top = 62
    object AuthInfosysid: TStringField
      DisplayLabel = #31995#32479#20195#30721
      FieldName = 'sysid'
    end
    object AuthInfoorgan_sysid: TStringField
      DisplayLabel = #31995#32479#26426#26500#20195#30721
      FieldName = 'organ_sysid'
    end
    object AuthInfoname: TStringField
      DisplayLabel = #35748#35777#39033#30446
      FieldName = 'name'
      Size = 30
    end
    object AuthInfoorgan_name: TStringField
      DisplayLabel = #35748#35777#26426#26500
      FieldName = 'organ_name'
      Size = 60
    end
    object AuthInfoauth_date: TStringField
      DisplayLabel = #35748#35777#26102#38388
      FieldName = 'auth_date'
      Size = 10
    end
    object AuthInfovalid_date: TStringField
      DisplayLabel = #35748#35777#26377#25928#26399#65288#25130#27490#65289
      FieldName = 'valid_date'
      Size = 10
    end
    object AuthInforemark: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'remark'
      Size = 200
    end
  end
  object AuthInfod: TDataSource
    DataSet = AuthInfo
    Left = 712
    Top = 62
  end
  object CertPrd: TCSADOQuery
    CacheSize = 1
    Connection = dmData.adocon
    AfterInsert = CommonAfterInsert
    Parameters = <>
    Left = 684
    Top = 118
    object CertPrdsysid: TStringField
      DisplayLabel = #31995#32479#20195#30721
      FieldName = 'sysid'
    end
    object CertPrdcert_sysid: TStringField
      DisplayLabel = #31995#32479#35777#20070#20195#30721
      FieldName = 'cert_sysid'
    end
    object CertPrdyear: TStringField
      DisplayLabel = #24180#20221
      FieldName = 'year'
      Size = 10
    end
    object CertPrdlevel4_id: TStringField
      DisplayLabel = #20195#34920#20135#21697#21697#31181#20195#30721
      FieldName = 'level4_id'
      Visible = False
      Size = 10
    end
    object CertPrdlevel4: TStringField
      DisplayLabel = #20195#34920#20135#21697#21697#31181
      FieldKind = fkLookup
      FieldName = 'level4'
      LookupDataSet = CertLevel4
      LookupKeyFields = 'id'
      LookupResultField = 'name'
      KeyFields = 'level4_id'
      Size = 100
      Lookup = True
    end
    object CertPrdquantity: TIntegerField
      DisplayLabel = #20135#37327
      FieldName = 'quantity'
    end
    object CertPrdvalue: TBCDField
      DisplayLabel = #20135#20540
      FieldName = 'value'
    end
    object CertPrdremark: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'remark'
      Size = 200
    end
  end
  object CertPrdd: TDataSource
    DataSet = CertPrd
    Left = 712
    Top = 118
  end
  object CertDept: TCSADOQuery
    CacheSize = 1
    Connection = dmData.adocon
    AfterInsert = CommonAfterInsert
    Parameters = <>
    Left = 684
    Top = 174
    object CertDeptsysid: TStringField
      DisplayLabel = #31995#32479#20195#30721
      FieldName = 'sysid'
    end
    object CertDeptcert_sysid: TStringField
      DisplayLabel = #31995#32479#35777#20070#20195#30721
      FieldName = 'cert_sysid'
    end
    object CertDeptname: TStringField
      DisplayLabel = #37096#38376#21517#31216
      FieldName = 'name'
      Size = 10
    end
    object CertDeptmanager: TStringField
      DisplayLabel = #37096#38376#36127#36131#20154
      FieldName = 'manager'
      Size = 30
    end
    object CertDeptquantity: TIntegerField
      DisplayLabel = #37096#38376#20154#25968
      FieldName = 'quantity'
    end
    object CertDeptremark: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'remark'
      Size = 200
    end
  end
  object CertDeptd: TDataSource
    DataSet = CertDept
    Left = 712
    Top = 174
  end
  object CertEquip: TCSADOQuery
    CacheSize = 1
    Connection = dmData.adocon
    AfterInsert = CommonAfterInsert
    Parameters = <>
    Left = 684
    Top = 230
    object CertEquipsysid: TStringField
      DisplayLabel = #31995#32479#20195#30721
      FieldName = 'sysid'
    end
    object CertEquipcert_sysid: TStringField
      DisplayLabel = #31995#32479#35777#20070#20195#30721
      FieldName = 'cert_sysid'
    end
    object CertEquipserial_no: TIntegerField
      DisplayLabel = #24207#21495
      FieldName = 'serial_no'
    end
    object CertEquipname: TStringField
      DisplayLabel = #35774#22791#21517#31216
      FieldName = 'name'
      Size = 30
    end
    object CertEquippower: TStringField
      DisplayLabel = #35774#22791#33021#21147
      FieldName = 'power'
      Size = 60
    end
    object CertEquipquantity: TIntegerField
      DisplayLabel = #35774#22791#25968#37327
      FieldName = 'quantity'
    end
    object CertEquipis_instru: TStringField
      DisplayLabel = #26159#21542#26816#39564#20202#22120
      FieldName = 'is_instru'
      Size = 2
    end
    object CertEquipis_selfcheck: TStringField
      DisplayLabel = #26159#21542#33258#34892#26657#39564
      FieldName = 'is_selfcheck'
      Size = 2
    end
    object CertEquipcheck_range: TStringField
      DisplayLabel = #26816#39564#33539#22260
      FieldName = 'check_range'
      Size = 60
    end
    object CertEquipremark: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'remark'
      Size = 200
    end
  end
  object CertEquipd: TDataSource
    DataSet = CertEquip
    Left = 712
    Top = 230
  end
  object CertPsn: TCSADOQuery
    CacheSize = 1
    Connection = dmData.adocon
    LockType = ltReadOnly
    Parameters = <>
    Left = 684
    Top = 202
    object CertPsnsysid: TStringField
      DisplayLabel = #31995#32479#20195#30721
      FieldName = 'sysid'
    end
    object CertPsncert_sysid: TStringField
      DisplayLabel = #31995#32479#35777#20070#20195#30721
      FieldName = 'cert_sysid'
    end
    object CertPsnpsn_sysid: TStringField
      DisplayLabel = #31995#32479#20154#21592#20195#30721
      FieldName = 'psn_sysid'
    end
    object CertPsnname: TStringField
      DisplayLabel = #22995#21517
      FieldName = 'name'
      Size = 30
    end
    object CertPsncardid: TStringField
      DisplayLabel = #36523#20221#35777#21495#30721
      FieldName = 'cardid'
    end
    object CertPsneducation: TStringField
      DisplayLabel = #23398#21382#20195#30721
      FieldName = 'education'
      Size = 4
    end
    object CertPsneducation_name: TStringField
      DisplayLabel = #23398#21382
      FieldName = 'education_name'
    end
    object CertPsnspeciality: TStringField
      DisplayLabel = #25152#23398#19987#19994
      FieldName = 'speciality'
    end
    object CertPsntitleofpost: TStringField
      DisplayLabel = #32844#31216
      FieldName = 'titleofpost'
    end
    object CertPsnlicns_sysid: TStringField
      DisplayLabel = #31995#32479#36164#36136#20195#30721
      FieldName = 'licns_sysid'
    end
    object CertPsnlicns_category: TStringField
      DisplayLabel = #36164#36136#31867#21035#20195#30721
      FieldName = 'licns_category'
      Size = 4
    end
    object CertPsnlicns_category_name: TStringField
      DisplayLabel = #36164#36136#31867#21035
      FieldName = 'licns_category_name'
      Size = 30
    end
    object CertPsnlicns_prj_sysid: TStringField
      DisplayLabel = #31995#32479#39033#30446#20195#30721
      FieldName = 'licns_prj_sysid'
    end
    object CertPsnlicns_prj: TStringField
      DisplayLabel = #36164#36136#39033#30446
      FieldName = 'licns_prj'
      Size = 60
    end
    object CertPsnpsnlicns_levelcode: TStringField
      DisplayLabel = #36164#36136#39033#30446#32423#21035#20195#30721
      FieldName = 'psnlicns_levelcode'
      Size = 4
    end
    object CertPsnpsnlicns_level: TStringField
      DisplayLabel = #36164#36136#39033#30446#32423#21035
      FieldName = 'psnlicns_level'
      Size = 30
    end
    object CertPsnremark: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'remark'
      Size = 200
    end
  end
  object CertPsnd: TDataSource
    DataSet = CertPsn
    Left = 712
    Top = 202
  end
  object CertConst: TCSADOQuery
    CacheSize = 1
    Connection = dmData.adocon
    AfterInsert = CommonAfterInsert
    Parameters = <>
    Left = 684
    Top = 146
    object CertConstsysid: TStringField
      DisplayLabel = #31995#32479#20195#30721
      FieldName = 'sysid'
    end
    object CertConstcert_sysid: TStringField
      DisplayLabel = #31995#32479#35777#20070#20195#30721
      FieldName = 'cert_sysid'
    end
    object CertConstname: TStringField
      DisplayLabel = #39033#30446#21517#31216
      FieldName = 'name'
      Size = 30
    end
    object CertConstorgan_name: TStringField
      DisplayLabel = #21333#20301#21517#31216
      FieldName = 'organ_name'
      Size = 60
    end
    object CertConstorgan_regno: TStringField
      DisplayLabel = #21333#20301#26426#26500#20195#30721
      FieldName = 'organ_regno'
      Size = 12
    end
    object CertConstremark: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'remark'
      Size = 200
    end
  end
  object CertConstd: TDataSource
    DataSet = CertConst
    Left = 712
    Top = 146
  end
  object CertDoc: TCSADOQuery
    CacheSize = 1
    Connection = dmData.adocon
    AfterInsert = CommonAfterInsert
    Parameters = <>
    Left = 684
    Top = 90
    object CertDocsysid: TStringField
      DisplayLabel = #31995#32479#20195#30721
      FieldName = 'sysid'
    end
    object CertDoccert_sysid: TStringField
      DisplayLabel = #31995#32479#35777#20070#20195#30721
      FieldName = 'cert_sysid'
    end
    object CertDocserial_no: TIntegerField
      DisplayLabel = #24207#21495
      FieldName = 'serial_no'
    end
    object CertDocname: TStringField
      DisplayLabel = #21517#31216
      FieldName = 'name'
      Size = 60
    end
    object CertDocquantity: TStringField
      DisplayLabel = #31687#24133#25110#39029#25968
      FieldName = 'quantity'
      Size = 30
    end
    object CertDocremark: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'remark'
      Size = 200
    end
  end
  object CertDocd: TDataSource
    DataSet = CertDoc
    Left = 712
    Top = 90
  end
end
