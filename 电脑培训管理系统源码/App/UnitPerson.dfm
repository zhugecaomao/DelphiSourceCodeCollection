inherited frmPerson: TfrmPerson
  Left = 68
  Top = 91
  Width = 597
  Height = 439
  Caption = 'frmPerson'
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelBkGnd: TPanel
    Width = 589
    Height = 405
    inherited ToolBar1: TToolBar
      Width = 589
      inherited DN: TDBNavigator
        DataSource = DS
        Hints.Strings = ()
      end
      inherited ToolButton4: TToolButton
        OnClick = ToolButton4Click
      end
    end
    object PageControl1: TPageControl
      Left = 97
      Top = 57
      Width = 492
      Height = 348
      ActivePage = TabSheet1
      Align = alClient
      HotTrack = True
      TabIndex = 0
      TabOrder = 1
      object TabSheet1: TTabSheet
        Caption = #20010#20154
        object Label1: TLabel
          Left = 8
          Top = 16
          Width = 52
          Height = 13
          Caption = #20154#21592#32534#21495
          FocusControl = DBEdit1
        end
        object Label2: TLabel
          Left = 8
          Top = 40
          Width = 26
          Height = 13
          Caption = #22995#21517
          FocusControl = DBEdit2
        end
        object Label3: TLabel
          Left = 8
          Top = 64
          Width = 26
          Height = 13
          Caption = #31616#25340
          FocusControl = DBEdit3
        end
        object Label4: TLabel
          Left = 8
          Top = 88
          Width = 26
          Height = 13
          Caption = #24615#21035
        end
        object Label5: TLabel
          Left = 8
          Top = 112
          Width = 26
          Height = 13
          Caption = #29983#26085
          FocusControl = DBEdit5
        end
        object Label6: TLabel
          Left = 8
          Top = 136
          Width = 26
          Height = 13
          Caption = #29983#32918
        end
        object Label7: TLabel
          Left = 8
          Top = 160
          Width = 26
          Height = 13
          Caption = #26143#24231
        end
        object Label8: TLabel
          Left = 8
          Top = 184
          Width = 26
          Height = 13
          Caption = #29233#22909
          FocusControl = DBEdit8
        end
        object Label9: TLabel
          Left = 8
          Top = 208
          Width = 26
          Height = 13
          Caption = #29305#38271
          FocusControl = DBEdit9
        end
        object Label10: TLabel
          Left = 8
          Top = 232
          Width = 26
          Height = 13
          Caption = #26165#31216
          FocusControl = DBEdit10
        end
        object Label11: TLabel
          Left = 144
          Top = 232
          Width = 28
          Height = 13
          Caption = 'OICQ'
          FocusControl = DBEdit11
        end
        object Label12: TLabel
          Left = 8
          Top = 256
          Width = 35
          Height = 13
          Caption = 'EMAIL'
          FocusControl = DBEdit12
        end
        object Label13: TLabel
          Left = 8
          Top = 280
          Width = 52
          Height = 13
          Caption = #32852#31995#30005#35805
          FocusControl = DBEdit13
        end
        object Label14: TLabel
          Left = 8
          Top = 304
          Width = 52
          Height = 13
          Caption = #20010#20154#20027#39029
          FocusControl = DBEdit14
        end
        object btnSaveAs: TDsFancyButton
          Left = 240
          Top = 8
          Width = 73
          Height = 25
          ButtonColor = clBtnFace
          Caption = #21478#23384#20026'...'
          FrameColor = clGray
          FrameWidth = 6
          CornerRadius = 10
          TextStyle = txRaised
          OnClick = btnSaveAsClick
        end
        object DBEdit1: TDBEdit
          Left = 64
          Top = 8
          Width = 134
          Height = 21
          DataField = 'BH'
          DataSource = DS
          TabOrder = 0
        end
        object DBEdit2: TDBEdit
          Left = 64
          Top = 32
          Width = 134
          Height = 21
          DataField = 'NAME'
          DataSource = DS
          TabOrder = 1
        end
        object DBEdit3: TDBEdit
          Left = 64
          Top = 56
          Width = 69
          Height = 21
          DataField = 'NAME_JP'
          DataSource = DS
          TabOrder = 2
        end
        object DBEdit5: TDBEdit
          Left = 64
          Top = 104
          Width = 137
          Height = 21
          DataField = 'BIRTHDAY'
          DataSource = DS
          TabOrder = 4
        end
        object DBEdit8: TDBEdit
          Left = 64
          Top = 176
          Width = 249
          Height = 21
          DataField = 'AH'
          DataSource = DS
          TabOrder = 7
          OnDblClick = DBEdit8DblClick
        end
        object DBEdit9: TDBEdit
          Left = 64
          Top = 200
          Width = 417
          Height = 21
          DataField = 'TC'
          DataSource = DS
          TabOrder = 8
          OnDblClick = DBEdit9DblClick
        end
        object DBEdit10: TDBEdit
          Left = 64
          Top = 224
          Width = 73
          Height = 21
          DataField = 'NC'
          DataSource = DS
          TabOrder = 9
        end
        object DBEdit11: TDBEdit
          Left = 176
          Top = 224
          Width = 305
          Height = 21
          DataField = 'OICQ'
          DataSource = DS
          TabOrder = 10
        end
        object DBEdit12: TDBEdit
          Left = 64
          Top = 248
          Width = 417
          Height = 21
          DataField = 'EMAIL'
          DataSource = DS
          TabOrder = 11
          OnDblClick = DBEdit12DblClick
        end
        object DBEdit13: TDBEdit
          Left = 64
          Top = 272
          Width = 417
          Height = 21
          DataField = 'LXDH'
          DataSource = DS
          TabOrder = 12
          OnDblClick = DBEdit13DblClick
        end
        object DBEdit14: TDBEdit
          Left = 64
          Top = 296
          Width = 417
          Height = 21
          DataField = 'WEB'
          DataSource = DS
          TabOrder = 13
          OnDblClick = DBEdit14DblClick
        end
        object DBImage1: TDBImage
          Left = 320
          Top = 0
          Width = 161
          Height = 193
          DataField = 'PHOTO'
          DataSource = DS
          TabOrder = 14
          OnDblClick = DBImage1DblClick
        end
        object dcb_SEX: TDBComboBox
          Left = 64
          Top = 80
          Width = 73
          Height = 21
          Style = csDropDownList
          DataField = 'SEX'
          DataSource = DS
          ItemHeight = 13
          TabOrder = 3
        end
        object dcb_SX: TDBComboBox
          Left = 64
          Top = 128
          Width = 73
          Height = 21
          Style = csDropDownList
          DataField = 'SX'
          DataSource = DS
          ItemHeight = 13
          TabOrder = 5
        end
        object dcb_STAR: TDBComboBox
          Left = 64
          Top = 152
          Width = 73
          Height = 21
          Style = csDropDownList
          DataField = 'XZ'
          DataSource = DS
          ItemHeight = 13
          TabOrder = 6
        end
      end
      object TabSheet2: TTabSheet
        Caption = #23478#24237
        ImageIndex = 1
        object Label16: TLabel
          Left = 8
          Top = 16
          Width = 13
          Height = 13
          Caption = #30465
          FocusControl = DBLookupComboBox1
        end
        object Label17: TLabel
          Left = 8
          Top = 40
          Width = 13
          Height = 13
          Caption = #24066
          FocusControl = DBLookupComboBox2
        end
        object Label18: TLabel
          Left = 8
          Top = 64
          Width = 13
          Height = 13
          Caption = #21306
          FocusControl = DBLookupComboBox3
        end
        object Label19: TLabel
          Left = 8
          Top = 88
          Width = 26
          Height = 13
          Caption = #22320#22336
          FocusControl = DBEdit4
        end
        object Label20: TLabel
          Left = 8
          Top = 112
          Width = 26
          Height = 13
          Caption = #37038#32534
          FocusControl = DBEdit6
        end
        object Label21: TLabel
          Left = 8
          Top = 136
          Width = 26
          Height = 13
          Caption = #30005#35805
          FocusControl = DBEdit7
        end
        object Label22: TLabel
          Left = 8
          Top = 160
          Width = 52
          Height = 13
          Caption = #23478#24237#25104#21592
        end
        object DBLookupComboBox1: TDBLookupComboBox
          Left = 64
          Top = 8
          Width = 113
          Height = 21
          DataField = 'family_province_mc'
          DataSource = DS
          TabOrder = 0
        end
        object DBLookupComboBox2: TDBLookupComboBox
          Left = 64
          Top = 32
          Width = 113
          Height = 21
          DataField = 'family_city_mc'
          DataSource = DS
          TabOrder = 1
        end
        object DBLookupComboBox3: TDBLookupComboBox
          Left = 64
          Top = 56
          Width = 113
          Height = 21
          DataField = 'family_belt_mc'
          DataSource = DS
          TabOrder = 2
        end
        object DBEdit4: TDBEdit
          Left = 64
          Top = 80
          Width = 393
          Height = 21
          DataField = 'FAMILY_ADDRESS'
          DataSource = DS
          TabOrder = 3
        end
        object DBEdit6: TDBEdit
          Left = 64
          Top = 104
          Width = 82
          Height = 21
          DataField = 'FAMILY_POST'
          DataSource = DS
          TabOrder = 4
        end
        object DBEdit7: TDBEdit
          Left = 64
          Top = 128
          Width = 201
          Height = 21
          DataField = 'FAMILY_PHONE'
          DataSource = DS
          TabOrder = 5
        end
        object DBMemo1: TDBMemo
          Left = 64
          Top = 152
          Width = 393
          Height = 89
          DataField = 'FAMILY_FAMILY'
          DataSource = DS
          ScrollBars = ssVertical
          TabOrder = 6
          OnDblClick = DBMemo1DblClick
        end
      end
      object TabSheet3: TTabSheet
        Caption = #21333#20301
        ImageIndex = 2
        object Label23: TLabel
          Left = 8
          Top = 16
          Width = 13
          Height = 13
          Caption = #30465
          FocusControl = DBLookupComboBox4
        end
        object Label24: TLabel
          Left = 8
          Top = 40
          Width = 13
          Height = 13
          Caption = #24066
          FocusControl = DBLookupComboBox5
        end
        object Label25: TLabel
          Left = 8
          Top = 64
          Width = 13
          Height = 13
          Caption = #21306
          FocusControl = DBLookupComboBox6
        end
        object Label26: TLabel
          Left = 8
          Top = 88
          Width = 26
          Height = 13
          Caption = #32844#19994
          FocusControl = DBLookupComboBox7
        end
        object Label27: TLabel
          Left = 8
          Top = 112
          Width = 26
          Height = 13
          Caption = #30005#35805
          FocusControl = DBEdit15
        end
        object Label28: TLabel
          Left = 8
          Top = 136
          Width = 26
          Height = 13
          Caption = #20256#30495
          FocusControl = DBEdit16
        end
        object Label29: TLabel
          Left = 8
          Top = 160
          Width = 26
          Height = 13
          Caption = #37096#38376
          FocusControl = DBLookupComboBox8
        end
        object Label30: TLabel
          Left = 8
          Top = 184
          Width = 26
          Height = 13
          Caption = #32844#20301
          FocusControl = DBLookupComboBox9
        end
        object Label31: TLabel
          Left = 8
          Top = 208
          Width = 26
          Height = 13
          Caption = #22320#22336
          FocusControl = DBEdit17
        end
        object Label32: TLabel
          Left = 8
          Top = 232
          Width = 52
          Height = 13
          Caption = #20844#21496#20027#39029
          FocusControl = DBEdit18
        end
        object Label33: TLabel
          Left = 8
          Top = 256
          Width = 52
          Height = 13
          Caption = #20154#21592#31867#22411
          FocusControl = DBLookupComboBox10
        end
        object Label34: TLabel
          Left = 8
          Top = 280
          Width = 26
          Height = 13
          Caption = #26631#24535
          FocusControl = DBLookupComboBox11
        end
        object DBLookupComboBox4: TDBLookupComboBox
          Left = 64
          Top = 8
          Width = 113
          Height = 21
          DataField = 'company_province_mc'
          DataSource = DS
          TabOrder = 0
        end
        object DBLookupComboBox5: TDBLookupComboBox
          Left = 64
          Top = 32
          Width = 113
          Height = 21
          DataField = 'company_city_mc'
          DataSource = DS
          TabOrder = 1
        end
        object DBLookupComboBox6: TDBLookupComboBox
          Left = 64
          Top = 56
          Width = 113
          Height = 21
          DataField = 'company_belt_mc'
          DataSource = DS
          TabOrder = 2
        end
        object DBLookupComboBox7: TDBLookupComboBox
          Left = 64
          Top = 80
          Width = 113
          Height = 21
          DataField = 'company_job_mc'
          DataSource = DS
          TabOrder = 3
        end
        object DBEdit15: TDBEdit
          Left = 64
          Top = 104
          Width = 201
          Height = 21
          DataField = 'COMPANY_PHONE'
          DataSource = DS
          TabOrder = 4
        end
        object DBEdit16: TDBEdit
          Left = 64
          Top = 128
          Width = 201
          Height = 21
          DataField = 'COMPANY_CZ'
          DataSource = DS
          TabOrder = 5
        end
        object DBLookupComboBox8: TDBLookupComboBox
          Left = 64
          Top = 152
          Width = 113
          Height = 21
          DataField = 'company_part_mc'
          DataSource = DS
          TabOrder = 6
        end
        object DBLookupComboBox9: TDBLookupComboBox
          Left = 64
          Top = 176
          Width = 113
          Height = 21
          DataField = 'company_zw_mc'
          DataSource = DS
          TabOrder = 7
        end
        object DBEdit17: TDBEdit
          Left = 64
          Top = 200
          Width = 393
          Height = 21
          DataField = 'COMPANY_ADDRESS'
          DataSource = DS
          TabOrder = 8
        end
        object DBEdit18: TDBEdit
          Left = 64
          Top = 224
          Width = 393
          Height = 21
          DataField = 'COMAPNY_WEB'
          DataSource = DS
          TabOrder = 9
          OnDblClick = DBEdit18DblClick
        end
        object DBLookupComboBox10: TDBLookupComboBox
          Left = 64
          Top = 248
          Width = 113
          Height = 21
          DataField = 'xtype_mc'
          DataSource = DS
          TabOrder = 10
        end
        object DBLookupComboBox11: TDBLookupComboBox
          Left = 64
          Top = 272
          Width = 113
          Height = 21
          DataField = 'flag_mc'
          DataSource = DS
          TabOrder = 11
        end
      end
    end
    object DBGrid1: TDBGrid
      Left = 0
      Top = 57
      Width = 97
      Height = 348
      Align = alLeft
      DataSource = DS
      FixedColor = 14935011
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 2
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'NAME'
          Width = 62
          Visible = True
        end>
    end
  end
  object DS: TDataSource
    DataSet = DM.T_Person
    Left = 312
    Top = 88
  end
  object OPD: TOpenPictureDialog
    DefaultExt = 'bmp'
    Filter = 'Bitmaps (*.bmp)|*.bmp'
    Left = 360
    Top = 160
  end
  object SPD: TSavePictureDialog
    DefaultExt = 'bmp'
    Filter = 'Bitmaps (*.bmp)|*.bmp'
    Left = 360
    Top = 200
  end
end
