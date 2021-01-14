object frmPersonlicnsMng: TfrmPersonlicnsMng
  Left = 42
  Top = 76
  Width = 721
  Height = 470
  ActiveControl = eCertNO
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'frmPersonlicnsMng'
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 415
    Width = 713
    Height = 28
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 1
    object Panel4: TPanel
      Left = 558
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
    object bbtnTrainInfo: TBitBtn
      Left = 3
      Top = 3
      Width = 80
      Height = 22
      Caption = #22521#35757#32771#26680
      TabOrder = 1
      OnClick = bbtnTrainInfoClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 713
    Height = 415
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 0
    object pagPsnLicns: TPageControl
      Left = 1
      Top = 1
      Width = 711
      Height = 413
      ActivePage = tsLicnsInfo
      Align = alClient
      TabIndex = 0
      TabOrder = 0
      object tsLicnsInfo: TTabSheet
        Caption = #36164#36136#20449#24687
        object Splitter2: TSplitter
          Left = 0
          Top = 125
          Width = 703
          Height = 3
          Cursor = crSizeNS
          Align = alTop
        end
        object Splitter3: TSplitter
          Left = 350
          Top = 128
          Width = 3
          Height = 230
          Cursor = crSizeWE
        end
        object Panel3: TPanel
          Left = 0
          Top = 358
          Width = 703
          Height = 28
          Align = alBottom
          BevelOuter = bvLowered
          TabOrder = 3
          object Panel5: TPanel
            Left = 550
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
              DataSource = personlicensed
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
          object bbtnOperate: TBitBtn
            Left = 3
            Top = 3
            Width = 60
            Height = 22
            Caption = 'Operate'
            TabOrder = 0
            OnClick = bbtnOperateClick
          end
        end
        object ScrollBox1: TScrollBox
          Left = 0
          Top = 0
          Width = 703
          Height = 125
          Align = alTop
          TabOrder = 0
          object Label1: TLabel
            Left = 8
            Top = 8
            Width = 60
            Height = 12
            Caption = #35777#20070#32534#21495#65306
          end
          object Label11: TLabel
            Left = 8
            Top = 31
            Width = 60
            Height = 12
            Caption = #35777#20070#24615#36136#65306
          end
          object Label4: TLabel
            Left = 332
            Top = 31
            Width = 60
            Height = 12
            Caption = #35777#20070#31867#21035#65306
          end
          object Label2: TLabel
            Left = 8
            Top = 54
            Width = 60
            Height = 12
            Caption = #21457#35777#26426#26500#65306
          end
          object Label3: TLabel
            Left = 332
            Top = 54
            Width = 60
            Height = 12
            Caption = #25209#20934#26426#26500#65306
          end
          object Label7: TLabel
            Left = 8
            Top = 77
            Width = 60
            Height = 12
            Caption = #22521#35757#26426#26500#65306
          end
          object Label8: TLabel
            Left = 332
            Top = 77
            Width = 60
            Height = 12
            Caption = #32771#26680#26426#26500#65306
          end
          object Label5: TLabel
            Left = 8
            Top = 101
            Width = 60
            Height = 12
            Caption = #36215#22987#26085#26399#65306
          end
          object Label6: TLabel
            Left = 318
            Top = 101
            Width = 60
            Height = 12
            Caption = #25209#20934#26085#26399#65306
          end
          object Label9: TLabel
            Left = 163
            Top = 101
            Width = 60
            Height = 12
            Caption = #25130#27490#26085#26399#65306
          end
          object Label10: TLabel
            Left = 473
            Top = 101
            Width = 60
            Height = 12
            Caption = #25442#35777#26085#26399#65306
          end
          object Label16: TLabel
            Left = 332
            Top = 8
            Width = 60
            Height = 12
            Caption = #20154#21592#22995#21517#65306
          end
          object eCertNO: TDBEditEh
            Left = 68
            Top = 5
            Width = 230
            Height = 18
            Color = clSkyBlue
            Ctl3D = False
            DataField = 'certno'
            DataSource = personlicensed
            EditButtons = <>
            ParentCtl3D = False
            TabOrder = 0
            Visible = True
          end
          object lcmbIssueOrgan: TDBLookupComboboxEh
            Left = 68
            Top = 51
            Width = 230
            Height = 18
            Ctl3D = False
            DataField = 'organ_sysid'
            DataSource = personlicensed
            EditButton.Visible = False
            EditButtons = <
              item
                Style = ebsEllipsisEh
                OnClick = lcmbIssueOrganEditButtons0Click
              end>
            KeyField = 'organ_sysid'
            ListField = 'organ_sysid_name'
            ListSource = mComd
            ParentCtl3D = False
            TabOrder = 4
            Visible = True
          end
          object lcmbConfirmOrgan: TDBLookupComboboxEh
            Left = 392
            Top = 51
            Width = 230
            Height = 18
            Ctl3D = False
            DataField = 'pass_organ_sysid'
            DataSource = personlicensed
            EditButton.Visible = False
            EditButtons = <
              item
                Style = ebsEllipsisEh
                OnClick = lcmbConfirmOrganEditButtons0Click
              end>
            KeyField = 'pass_organ_sysid'
            ListField = 'pass_organ_sysid_name'
            ListSource = mComd
            ParentCtl3D = False
            TabOrder = 5
            Visible = True
          end
          object lcmbTrainOrgan: TDBLookupComboboxEh
            Left = 68
            Top = 74
            Width = 230
            Height = 18
            Ctl3D = False
            DataField = 'train_organ_sysid'
            DataSource = personlicensed
            EditButton.Visible = False
            EditButtons = <
              item
                Style = ebsEllipsisEh
                OnClick = lcmbTrainOrganEditButtons0Click
              end>
            KeyField = 'train_organ_sysid'
            ListField = 'train_organ_sysid_name'
            ListSource = mComd
            ParentCtl3D = False
            TabOrder = 6
            Visible = True
          end
          object lcmbTestOrgan: TDBLookupComboboxEh
            Left = 392
            Top = 74
            Width = 230
            Height = 18
            Ctl3D = False
            DataField = 'test_organ_sysid'
            DataSource = personlicensed
            EditButton.Visible = False
            EditButtons = <
              item
                Style = ebsEllipsisEh
                OnClick = lcmbTestOrganEditButtons0Click
              end>
            KeyField = 'test_organ_sysid'
            ListField = 'test_organ_sysid_name'
            ListSource = mComd
            ParentCtl3D = False
            TabOrder = 7
            Visible = True
          end
          object dteStartDate: TCSdxDBDateEdit
            Left = 68
            Top = 97
            Width = 90
            TabOrder = 8
            DataField = 'start_date'
            DataSource = personlicensed
            StyleController = dmData.dxStyleCtrl
            FixedDateFormat = 'yyyy-MM-dd'
            StoredValues = 4
          end
          object dteConfirmDate: TCSdxDBDateEdit
            Left = 378
            Top = 97
            Width = 90
            TabOrder = 10
            DataField = 'pass_date'
            DataSource = personlicensed
            StyleController = dmData.dxStyleCtrl
            FixedDateFormat = 'yyyy-MM-dd'
            StoredValues = 4
          end
          object dteEndDate: TCSdxDBDateEdit
            Left = 223
            Top = 97
            Width = 90
            TabOrder = 9
            DataField = 'end_date'
            DataSource = personlicensed
            StyleController = dmData.dxStyleCtrl
            FixedDateFormat = 'yyyy-MM-dd'
            StoredValues = 4
          end
          object dteChangeDate: TCSdxDBDateEdit
            Left = 533
            Top = 97
            Width = 90
            TabOrder = 11
            DataField = 'licns_change_date'
            DataSource = personlicensed
            StyleController = dmData.dxStyleCtrl
            FixedDateFormat = 'yyyy-MM-dd'
            StoredValues = 4
          end
          object lcmbLicnsKind: TDBLookupComboboxEh
            Left = 68
            Top = 28
            Width = 230
            Height = 18
            Color = clSkyBlue
            Ctl3D = False
            DataField = 'licns_kind'
            DataSource = personlicensed
            EditButtons = <>
            KeyField = 'id'
            ListField = 'name'
            ListSource = licnskindd
            ParentCtl3D = False
            TabOrder = 2
            Visible = True
            OnKeyValueChanged = lcmbLicnsKindKeyValueChanged
          end
          object lcmbLicnsCategory: TDBLookupComboboxEh
            Left = 392
            Top = 28
            Width = 230
            Height = 18
            Color = clSkyBlue
            Ctl3D = False
            DataField = 'licns_category'
            DataSource = personlicensed
            EditButtons = <>
            KeyField = 'id'
            ListField = 'name'
            ListSource = licnscategoryd
            ParentCtl3D = False
            TabOrder = 3
            Visible = True
            OnKeyValueChanged = lcmbLicnsCategoryKeyValueChanged
          end
          object lcmbName: TDBLookupComboboxEh
            Left = 392
            Top = 5
            Width = 93
            Height = 18
            Color = clSkyBlue
            Ctl3D = False
            DataField = 'person_sysid'
            DataSource = personlicensed
            EditButton.Visible = False
            EditButtons = <
              item
                Style = ebsEllipsisEh
                OnClick = lcmbNameEditButtons0Click
              end>
            KeyField = 'person_sysid'
            ListField = 'person_sysid_name'
            ListSource = mPersond
            ParentCtl3D = False
            TabOrder = 1
            Visible = True
          end
        end
        object Panel6: TPanel
          Left = 353
          Top = 128
          Width = 350
          Height = 230
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 2
          object grdLicnsLevel: TDBGridEh
            Left = 0
            Top = 0
            Width = 350
            Height = 202
            Align = alClient
            DataSource = licnsleveld
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
            OnEnter = grdLicnsLevelEnter
            Columns = <
              item
                EditButtons = <>
                FieldName = 'level_no_name'
                Footers = <>
                Width = 300
              end>
          end
          object Panel11: TPanel
            Left = 0
            Top = 202
            Width = 350
            Height = 28
            Align = alBottom
            BevelOuter = bvLowered
            TabOrder = 1
            object Panel12: TPanel
              Left = 97
              Top = 1
              Width = 252
              Height = 26
              Align = alRight
              BevelOuter = bvNone
              TabOrder = 0
              object bbtnLicnsLevelIns: TBitBtn
                Left = 0
                Top = 2
                Width = 50
                Height = 22
                Hint = #28155#21152#35760#24405
                Caption = #28155#21152
                TabOrder = 0
                OnClick = bbtnLicnsLevelInsClick
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
              object bbtnLicnsLevelDel: TBitBtn
                Left = 50
                Top = 2
                Width = 50
                Height = 22
                Hint = #21024#38500#35760#24405
                Caption = #21024#38500
                TabOrder = 1
                OnClick = bbtnLicnsLevelDelClick
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
              object CSDBNavigator2: TCSDBNavigator
                Left = 100
                Top = 2
                Width = 150
                Height = 22
                DataSource = licnsleveld
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
        object Panel9: TPanel
          Left = 0
          Top = 128
          Width = 350
          Height = 230
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 1
          object grdLicnsPrj: TDBGridEh
            Left = 0
            Top = 0
            Width = 350
            Height = 202
            Align = alClient
            DataSource = licnsprjd
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
            OnEnter = grdLicnsPrjEnter
            Columns = <
              item
                EditButtons = <>
                FieldName = 'prj_no_name'
                Footers = <>
                Width = 300
              end>
          end
          object panItem: TPanel
            Left = 0
            Top = 202
            Width = 350
            Height = 28
            Align = alBottom
            BevelOuter = bvLowered
            TabOrder = 1
            object Panel10: TPanel
              Left = 97
              Top = 1
              Width = 252
              Height = 26
              Align = alRight
              BevelOuter = bvNone
              TabOrder = 0
              object bbtnLicnsPrjIns: TBitBtn
                Left = 0
                Top = 2
                Width = 50
                Height = 22
                Hint = #28155#21152#35760#24405
                Caption = #28155#21152
                TabOrder = 0
                OnClick = bbtnLicnsPrjInsClick
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
              object bbtnLicnsPrjDel: TBitBtn
                Left = 50
                Top = 2
                Width = 50
                Height = 22
                Hint = #21024#38500#35760#24405
                Caption = #21024#38500
                TabOrder = 1
                OnClick = bbtnLicnsPrjDelClick
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
                DataSource = licnsprjd
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
      object tsEngageInfo: TTabSheet
        Caption = #36164#36136#32856#29992#20449#24687
        ImageIndex = 1
        object Splitter1: TSplitter
          Left = 0
          Top = 101
          Width = 703
          Height = 3
          Cursor = crSizeNS
          Align = alTop
        end
        object scrbDetail: TScrollBox
          Left = 0
          Top = 0
          Width = 703
          Height = 101
          Align = alTop
          TabOrder = 0
          object Label14: TLabel
            Left = 8
            Top = 8
            Width = 60
            Height = 12
            Alignment = taRightJustify
            Caption = #20154#21592#22995#21517#65306
          end
          object Label15: TLabel
            Left = 191
            Top = 8
            Width = 60
            Height = 12
            Alignment = taRightJustify
            Caption = #35777#20070#32534#21495#65306
          end
          object Label19: TLabel
            Left = 8
            Top = 78
            Width = 60
            Height = 12
            Alignment = taRightJustify
            Caption = #32856#29992#26085#26399#65306
          end
          object Label27: TLabel
            Left = 8
            Top = 31
            Width = 60
            Height = 12
            Alignment = taRightJustify
            Caption = #35777#20070#24615#36136#65306
          end
          object Label30: TLabel
            Left = 191
            Top = 31
            Width = 60
            Height = 12
            Alignment = taRightJustify
            Caption = #35777#20070#31867#21035#65306
          end
          object Label36: TLabel
            Left = 374
            Top = 8
            Width = 36
            Height = 12
            Alignment = taRightJustify
            Caption = #22791#27880#65306
          end
          object Label37: TLabel
            Left = 8
            Top = 54
            Width = 60
            Height = 12
            Caption = #32856#29992#21333#20301#65306
          end
          object Label18: TLabel
            Left = 191
            Top = 78
            Width = 60
            Height = 12
            Alignment = taRightJustify
            Caption = #39033#30446#21517#31216#65306
          end
          object eLicnsNO: TDBEditEh
            Left = 251
            Top = 5
            Width = 118
            Height = 18
            Ctl3D = False
            DataField = 'certno'
            DataSource = personlicensed
            EditButtons = <>
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 0
            Visible = True
          end
          object mRemark: TdxDBMemo
            Left = 374
            Top = 24
            Width = 275
            TabOrder = 1
            StyleController = dmData.dxStyleCtrl
            Height = 70
          end
          object dteApplayDate: TCSdxDBDateEdit
            Left = 68
            Top = 74
            Width = 118
            TabOrder = 2
            DataField = 'engage_date'
            DataSource = licnsengaged
            StyleController = dmData.dxStyleCtrl
            FixedDateFormat = 'yyyy-MM-dd'
            StoredValues = 4
          end
          object lcmbOrgan: TDBLookupComboboxEh
            Left = 68
            Top = 51
            Width = 301
            Height = 18
            Ctl3D = False
            DataField = 'organ_sysid'
            DataSource = licnsengaged
            EditButton.Visible = False
            EditButtons = <
              item
                Style = ebsEllipsisEh
                OnClick = lcmbOrganEditButtons0Click
              end>
            KeyField = 'organ_sysid'
            ListField = 'organ_sysid_name'
            ListSource = mEngageOrgand
            ParentCtl3D = False
            TabOrder = 3
            Visible = True
          end
          object lcmbLicnsPrj: TDBLookupComboboxEh
            Left = 251
            Top = 75
            Width = 118
            Height = 18
            Ctl3D = False
            DataField = 'licns_prj_code'
            DataSource = licnsengaged
            EditButtons = <>
            KeyField = 'prj_no'
            ListField = 'prj_no_name'
            ListSource = licnsprjd
            ParentCtl3D = False
            TabOrder = 4
            Visible = True
            OnKeyValueChanged = lcmbLicnsPrjKeyValueChanged
          end
          object lcmbPrsName: TDBLookupComboboxEh
            Left = 68
            Top = 5
            Width = 118
            Height = 18
            Ctl3D = False
            DataField = 'person_sysid'
            DataSource = licnsengaged
            EditButton.Visible = False
            EditButtons = <>
            KeyField = 'person_sysid'
            ListField = 'person_sysid_name'
            ListSource = mPersond
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 5
            Visible = True
          end
          object eKind: TDBEditEh
            Left = 68
            Top = 28
            Width = 118
            Height = 18
            Ctl3D = False
            DataField = 'name'
            DataSource = licnskindd
            EditButtons = <>
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 6
            Visible = True
          end
          object eCategory: TDBEditEh
            Left = 251
            Top = 28
            Width = 118
            Height = 18
            Ctl3D = False
            DataField = 'name'
            DataSource = licnscategoryd
            EditButtons = <>
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 7
            Visible = True
          end
        end
        object grdEngageList: TDBGridEh
          Left = 0
          Top = 104
          Width = 703
          Height = 232
          Align = alClient
          AllowedOperations = []
          AllowedSelections = [gstRecordBookmarks, gstRectangle, gstAll]
          DataSource = engageListd
          EditActions = [geaCutEh, geaCopyEh, geaPasteEh, geaDeleteEh, geaSelectAllEh]
          Flat = True
          FooterColor = clWindow
          FooterFont.Charset = GB2312_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -12
          FooterFont.Name = #23435#20307
          FooterFont.Style = []
          InternalSort = True
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
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
              FieldName = 'person_sysid_name'
              Footers = <>
              Width = 56
            end
            item
              EditButtons = <>
              FieldName = 'cert_no'
              Footers = <>
            end
            item
              EditButtons = <>
              FieldName = 'licns_kind'
              Footers = <>
              Width = 103
            end
            item
              EditButtons = <>
              FieldName = 'licns_category'
              Footers = <>
              Width = 95
            end
            item
              EditButtons = <>
              FieldName = 'licns_prj_code_name'
              Footers = <>
              Width = 76
            end
            item
              EditButtons = <>
              FieldName = 'organ_sysid_name'
              Footers = <>
              Width = 212
            end
            item
              EditButtons = <>
              FieldName = 'engage_date'
              Footers = <>
            end>
        end
        object Panel7: TPanel
          Left = 0
          Top = 358
          Width = 703
          Height = 28
          Align = alBottom
          BevelOuter = bvLowered
          TabOrder = 2
          object Panel8: TPanel
            Left = 250
            Top = 1
            Width = 452
            Height = 26
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 3
            object bbtnEngageIns: TBitBtn
              Left = 0
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
              Left = 50
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
            object navList: TCSDBNavigator
              Left = 100
              Top = 2
              Width = 200
              Height = 22
              DataSource = engageListd
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
            object navEngage: TCSDBNavigator
              Left = 300
              Top = 2
              Width = 100
              Height = 22
              DataSource = licnsengaged
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
        object CSRowCountPanel1: TCSRowCountPanel
          Left = 0
          Top = 336
          Width = 703
          Align = alBottom
          TabOrder = 3
          CaptionFormat = ' '#35760#24405#25968#65306'%d'
          DataSource = engageListd
        end
      end
    end
  end
  object personlicense: TCSADOQuery
    Connection = dmData.adocon
    AfterInsert = personlicenseAfterInsert
    AfterPost = personlicenseAfterPost
    AfterScroll = personlicenseAfterScroll
    CommandTimeOut = 300
    Parameters = <>
    Left = 60
    Top = 211
    object personlicensesysid: TStringField
      FieldName = 'sysid'
    end
    object personlicensecertno: TStringField
      FieldName = 'certno'
    end
    object personlicenseperson_sysid: TStringField
      FieldName = 'person_sysid'
    end
    object personlicenselicns_kind: TStringField
      FieldName = 'licns_kind'
      Size = 4
    end
    object personlicenselicns_category: TStringField
      FieldName = 'licns_category'
      Size = 4
    end
    object personlicenseorgan_sysid: TStringField
      FieldName = 'organ_sysid'
    end
    object personlicensetrain_organ_sysid: TStringField
      FieldName = 'train_organ_sysid'
    end
    object personlicensetest_organ_sysid: TStringField
      FieldName = 'test_organ_sysid'
    end
    object personlicensepass_organ_sysid: TStringField
      FieldName = 'pass_organ_sysid'
    end
    object personlicenselen_of_service: TIntegerField
      FieldName = 'len_of_service'
    end
    object personlicensestartdate: TStringField
      FieldName = 'start_date'
      Size = 10
    end
    object personlicenseenddate: TStringField
      FieldName = 'end_date'
      Size = 10
    end
    object personlicensepass_date: TStringField
      FieldName = 'pass_date'
      Size = 10
    end
    object personlicensestate: TStringField
      FieldName = 'state'
      Size = 2
    end
    object personlicenselicns_change_date: TStringField
      FieldName = 'licns_change_date'
      Size = 10
    end
  end
  object personlicensed: TDataSource
    DataSet = personlicense
    Left = 60
    Top = 239
  end
  object licnsprj: TCSADOQuery
    Connection = dmData.adocon
    AfterInsert = licnsprjAfterInsert
    BeforeEdit = licnsprjBeforeEdit
    AfterScroll = licnsprjAfterScroll
    CommandTimeOut = 300
    Parameters = <>
    Left = 88
    Top = 211
    object licnsprjsysid: TStringField
      DisplayLabel = #31995#32479'ID'
      FieldName = 'sysid'
    end
    object licnsprjlicns_sysid: TStringField
      DisplayLabel = #36164#36136#35777#20070#31995#32479'ID'
      FieldName = 'licns_sysid'
    end
    object licnsprjprj_no: TStringField
      DisplayLabel = #36164#36136#39033#30446#20195#30721
      FieldName = 'prj_no'
      Size = 4
    end
    object licnsprjprj_no_name: TStringField
      DisplayLabel = #36164#36136#39033#30446
      FieldKind = fkLookup
      FieldName = 'prj_no_name'
      LookupDataSet = prjCode
      LookupKeyFields = 'id'
      LookupResultField = 'name'
      KeyFields = 'prj_no'
      Size = 30
      Lookup = True
    end
  end
  object licnsprjd: TDataSource
    DataSet = licnsprj
    Left = 88
    Top = 239
  end
  object licnsleveld: TDataSource
    DataSet = licnslevel
    Left = 116
    Top = 239
  end
  object licnslevel: TCSADOQuery
    Connection = dmData.adocon
    AfterInsert = licnslevelAfterInsert
    CommandTimeOut = 300
    Parameters = <>
    Left = 116
    Top = 211
    object licnslevelsysid: TStringField
      DisplayLabel = #31995#32479'ID'
      FieldName = 'sysid'
    end
    object licnslevellicns_prj_sysid: TStringField
      DisplayLabel = #36164#36136#35777#20070#39033#30446#31995#32479'ID'
      FieldName = 'licns_prj_sysid'
    end
    object licnslevellevel_no: TStringField
      DisplayLabel = #36164#36136#39033#30446#32423#21035'id'
      FieldName = 'level_no'
      Size = 4
    end
    object licnslevellevel_no_name: TStringField
      DisplayLabel = #39033#30446#32423#21035
      FieldKind = fkLookup
      FieldName = 'level_no_name'
      LookupDataSet = levelCode
      LookupKeyFields = 'id'
      LookupResultField = 'name'
      KeyFields = 'level_no'
      Size = 30
      Lookup = True
    end
  end
  object licnskind: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltReadOnly
    CommandTimeOut = 300
    Parameters = <>
    Left = 211
    Top = 211
  end
  object licnskindd: TDataSource
    DataSet = licnskind
    Left = 211
    Top = 239
  end
  object licnscategory: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltReadOnly
    CommandTimeOut = 300
    Parameters = <>
    Left = 239
    Top = 211
  end
  object licnscategoryd: TDataSource
    DataSet = licnscategory
    Left = 239
    Top = 239
  end
  object licnsstate: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltReadOnly
    CommandTimeOut = 300
    Parameters = <>
    Left = 267
    Top = 211
  end
  object licnsstated: TDataSource
    DataSet = licnsstate
    Left = 267
    Top = 239
  end
  object licnsengage: TCSADOQuery
    Connection = dmData.adocon
    AfterInsert = licnsengageAfterInsert
    AfterPost = licnsengageAfterPost
    AfterDelete = licnsengageAfterDelete
    CommandTimeOut = 300
    Parameters = <>
    Left = 144
    Top = 211
  end
  object licnsengaged: TDataSource
    DataSet = licnsengage
    Left = 144
    Top = 239
  end
  object mCom: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 88
    Top = 279
    object mComorgan_sysid: TStringField
      FieldName = 'organ_sysid'
    end
    object mComorgan_sysid_name: TStringField
      FieldName = 'organ_sysid_name'
      Size = 60
    end
    object mComtrain_organ_sysid: TStringField
      FieldName = 'train_organ_sysid'
    end
    object mComtrain_organ_sysid_name: TStringField
      FieldName = 'train_organ_sysid_name'
      Size = 60
    end
    object mComtest_organ_sysid: TStringField
      FieldName = 'test_organ_sysid'
    end
    object mComtest_organ_sysid_name: TStringField
      FieldName = 'test_organ_sysid_name'
      Size = 60
    end
    object mCompass_organ_sysid: TStringField
      FieldName = 'pass_organ_sysid'
    end
    object mCompass_organ_sysid_name: TStringField
      FieldName = 'pass_organ_sysid_name'
      Size = 60
    end
  end
  object Temp: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltReadOnly
    Parameters = <>
    Left = 240
    Top = 279
  end
  object mComBak: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 60
    Top = 279
    object mComBakorgan_sysid: TStringField
      FieldName = 'organ_sysid'
    end
    object mComBakorgan_sysid_name: TStringField
      FieldName = 'organ_sysid_name'
      Size = 60
    end
    object mComBaktrain_organ_sysid: TStringField
      FieldName = 'train_organ_sysid'
    end
    object mComBaktrain_organ_sysid_name: TStringField
      FieldName = 'train_organ_sysid_name'
      Size = 60
    end
    object mComBaktest_organ_sysid: TStringField
      FieldName = 'test_organ_sysid'
    end
    object mComBaktest_organ_sysid_name: TStringField
      FieldName = 'test_organ_sysid_name'
      Size = 60
    end
    object mComBakpass_organ_sysid: TStringField
      FieldName = 'pass_organ_sysid'
    end
    object mComBakpass_organ_sysid_name: TStringField
      FieldName = 'pass_organ_sysid_name'
      Size = 60
    end
  end
  object mComd: TDataSource
    DataSet = mCom
    Left = 88
    Top = 307
  end
  object mPerson: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 144
    Top = 279
    object mPersonperson_sysid: TStringField
      FieldName = 'person_sysid'
    end
    object mPersonperson_sysid_name: TStringField
      FieldName = 'person_sysid_name'
      Size = 30
    end
  end
  object mPersonBak: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 116
    Top = 279
    object mPersonBakperson_sysid: TStringField
      FieldName = 'person_sysid'
    end
    object mPersonBakperson_sysid_name: TStringField
      FieldName = 'person_sysid_name'
      Size = 30
    end
  end
  object mPersond: TDataSource
    DataSet = mPerson
    Left = 144
    Top = 307
  end
  object mEngageOrganBak: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 172
    Top = 279
    object mEngageOrganBakorgan_sysid: TStringField
      FieldName = 'organ_sysid'
    end
    object mEngageOrganBakorgan_sysid_name: TStringField
      FieldName = 'organ_sysid_name'
      Size = 60
    end
  end
  object mEngageOrgan: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 200
    Top = 279
    object mEngageOrganorgan_sysid: TStringField
      FieldName = 'organ_sysid'
    end
    object mEngageOrganorgan_sysid_name: TStringField
      FieldName = 'organ_sysid_name'
      Size = 60
    end
  end
  object mEngageOrgand: TDataSource
    DataSet = mEngageOrgan
    Left = 200
    Top = 307
  end
  object prjCode: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltReadOnly
    Parameters = <>
    Left = 295
    Top = 211
  end
  object levelCode: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltReadOnly
    Parameters = <>
    Left = 323
    Top = 211
  end
  object engageList: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltReadOnly
    AfterScroll = engageListAfterScroll
    Parameters = <>
    Left = 183
    Top = 211
    object engageListsysid: TStringField
      FieldName = 'sysid'
    end
    object engageListperson_sysid: TStringField
      FieldName = 'person_sysid'
    end
    object engageListperson_sysid_name: TStringField
      DisplayLabel = #20154#21592#22995#21517
      FieldName = 'person_sysid_name'
      Size = 30
    end
    object engageListlicns_sysid: TStringField
      FieldName = 'licns_sysid'
    end
    object engageListcert_no: TStringField
      DisplayLabel = #36164#36136#32534#21495
      FieldName = 'cert_no'
    end
    object engageListlicns_kind: TStringField
      DisplayLabel = #36164#36136#24615#36136
      FieldName = 'licns_kind'
      Size = 30
    end
    object engageListlicns_category: TStringField
      DisplayLabel = #36164#36136#31867#21035
      FieldName = 'licns_category'
      Size = 30
    end
    object engageListlicns_prj_sysid: TStringField
      FieldName = 'licns_prj_sysid'
      Size = 4
    end
    object engageListlicns_prj_code: TStringField
      FieldName = 'licns_prj_code'
      Size = 4
    end
    object engageListlicns_prj_sysid_name: TStringField
      DisplayLabel = #36164#36136#39033#30446
      FieldName = 'licns_prj_code_name'
      Size = 30
    end
    object engageListorgan_sysid: TStringField
      FieldName = 'organ_sysid'
    end
    object engageListorgan_sysid_name: TStringField
      DisplayLabel = #32856#29992#21333#20301
      FieldName = 'organ_sysid_name'
      Size = 60
    end
    object engageListengage_date: TStringField
      DisplayLabel = #32856#29992#26085#26399
      FieldName = 'engage_date'
      Size = 10
    end
  end
  object engageListd: TDataSource
    DataSet = engageList
    Left = 183
    Top = 239
  end
  object EngageFind: TCSDBEhGrdFind
    EhDBGrid = grdEngageList
    Left = 280
    Top = 280
  end
  object EngageFilter: TCSADOEhGrdFilter
    EhDBGrid = grdEngageList
    Left = 308
    Top = 280
  end
  object EngageColCtrl: TCSEhGrdColCtrl
    EhDBGrid = grdEngageList
    ColList = <>
    Left = 336
    Top = 280
  end
  object ImageList1: TImageList
    Left = 372
    Top = 280
    Bitmap = {
      494C010102000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001001000000000000008
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010421042104210421042
      1042104210421042104210421042104210420000000010421042104210421042
      1042104210421042104210421042104210420000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000010420000000000000000000000000000
      0000000000000000000000000000000010420000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FE07FFF7FE07FFF7F
      E07FFF7FE07F00000000FF7FE07F0000104200000000FF7FE07FFF7FE07FFF7F
      E07FFF7FE07F00000000FF7FE07F000010420000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E07FFF7FE07FFF7FE07F
      FF7FE07FFF7F000000000000FF7F0000104210420000E07FFF7FE07FFF7FE07F
      FF7FE07FFF7F000000000000FF7F000010420000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7FE07FFF7FE07FFF7F
      E07FFF7FE07F0000E07F000000000000104200400000FF7FE07FFF7FE07FFF7F
      E07FFF7FE07F0000E07F00000000000010420000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E07FFF7FE07FFF7FE07F
      FF7FE07FFF7F00000000000000000000104200400040E07FFF7FE07FFF7F1042
      0040E07FFF7F0000000000000000000010420000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7F0000FF7F1042E07FFF7FE07F
      FF7FE07FE07FFF7FE07FFF7FE07F00001042104200401042E07FFF7F10420040
      1042FF7FE07FFF7FE07FFF7FE07F000010420000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001042E07FE07F1042FF7FE07F1042
      E07FFF7FFF7FE07FFF7FE07FFF7F000010420000004000401042E07F00400040
      FF7FE07FFF7FE07FFF7FE07FFF7F000010420000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000001042FF7F1042E07F1042E07F
      FF7FE07FE07FFF7FE07FFF7FE07F00001042000010420040004000400040FF7F
      E07FFF7FE07FFF7FE07FFF7FE07F000010420000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000104210421042FF7F1042FF7FE07F
      FF7FE07FFF7FE07FFF7FE07FFF7F0000104200001042004000400040FF7FE07F
      FF7FE07FFF7FE07FFF7FE07FFF7F000010420000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7FE07F1042E07FFF7F10421042
      1042104200000000000000000000000000001042004000400040004010420000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000001042E07F1042E07F1042E07F
      0000000000000000000000000000000000000040004010420000004000401042
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001042E07F00001042FF7F00001042
      E07F000000000000000000000000000000000000000000000000000000400040
      1042000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E07F000000001042E07F00000000
      1042000000000000000000000000000000000000000000000000000000000040
      0040104200000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042FF7F00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF00000000C000C00000000000
      8000800000000000800080000000000080100010000000008008000800000000
      8000000000000000000000000000000000008000000000008000800000000000
      0000800000000000000100010000000081FF11FF0000000024FFF8FF00000000
      66FFFC7F00000000E7FFFFFF0000000000000000000000000000000000000000
      000000000000}
  end
  object tmp1: TCSADOQuery
    Parameters = <>
    Left = 240
    Top = 308
  end
end
