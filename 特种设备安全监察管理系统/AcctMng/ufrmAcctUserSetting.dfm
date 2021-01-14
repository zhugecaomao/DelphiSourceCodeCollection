object frmAcctUserSetting: TfrmAcctUserSetting
  Left = 300
  Top = 270
  BorderStyle = bsDialog
  Caption = #36719#20214#29992#25143#20449#24687#35774#32622
  ClientHeight = 200
  ClientWidth = 446
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
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel
    Left = 18
    Top = 7
    Width = 60
    Height = 12
    Caption = #29992#25143#32423#21035#65306
  end
  object Label2: TLabel
    Left = 18
    Top = 30
    Width = 60
    Height = 12
    Caption = #29992#25143#21517#31216#65306
  end
  object Label6: TLabel
    Left = 18
    Top = 78
    Width = 60
    Height = 12
    Caption = #20855#20307#22320#22336#65306
  end
  object Label7: TLabel
    Left = 322
    Top = 78
    Width = 60
    Height = 12
    Caption = #37038#25919#32534#21495#65306
  end
  object Label8: TLabel
    Left = 18
    Top = 102
    Width = 60
    Height = 12
    Caption = #21333#20301#30005#35805#65306
  end
  object Label9: TLabel
    Left = 262
    Top = 102
    Width = 60
    Height = 12
    Caption = #20256'    '#30495#65306
  end
  object Label10: TLabel
    Left = 18
    Top = 126
    Width = 60
    Height = 12
    Caption = #30005#23376#37038#20214#65306
  end
  object Label11: TLabel
    Left = 262
    Top = 126
    Width = 60
    Height = 12
    Caption = #20027#39029#22320#22336#65306
  end
  object Label12: TLabel
    Left = 6
    Top = 150
    Width = 72
    Height = 12
    Caption = #21333#20301#36127#36131#20154#65306
  end
  object Label13: TLabel
    Left = 190
    Top = 150
    Width = 132
    Height = 12
    Caption = #20107#25925#32479#35745#12289#19978#25253#36127#36131#20154#65306
  end
  object Label4: TLabel
    Left = 30
    Top = 54
    Width = 48
    Height = 12
    Caption = #30465'('#24066')'#65306
  end
  object Label3: TLabel
    Left = 160
    Top = 54
    Width = 24
    Height = 12
    Caption = #24066#65306
  end
  object Label14: TLabel
    Left = 266
    Top = 54
    Width = 48
    Height = 12
    Caption = #21306'('#21439')'#65306
  end
  object Panel11: TPanel
    Left = 0
    Top = 172
    Width = 446
    Height = 28
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 0
    object bbtnConfirm: TBitBtn
      Left = 164
      Top = 3
      Width = 60
      Height = 22
      Caption = #30830#35748
      Default = True
      TabOrder = 0
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
    object bbtnCancel: TBitBtn
      Left = 226
      Top = 3
      Width = 60
      Height = 22
      Cancel = True
      Caption = #21462#28040
      ModalResult = 2
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
  end
  object dxDBEdit1: TdxDBEdit
    Left = 77
    Top = 26
    Width = 364
    Color = clSkyBlue
    TabOrder = 1
    DataField = 'user_com'
    DataSource = AcctUserInfod
    StyleController = dmData.dxStyleCtrl
  end
  object dxDBEdit3: TdxDBEdit
    Left = 381
    Top = 74
    Width = 60
    Color = clSkyBlue
    TabOrder = 2
    DataField = 'zip'
    DataSource = AcctUserInfod
    StyleController = dmData.dxStyleCtrl
  end
  object dxDBEdit5: TdxDBEdit
    Left = 77
    Top = 74
    Width = 240
    Color = clSkyBlue
    TabOrder = 3
    DataField = 'address'
    DataSource = AcctUserInfod
    StyleController = dmData.dxStyleCtrl
  end
  object dxDBEdit6: TdxDBEdit
    Left = 77
    Top = 98
    Width = 120
    Color = clSkyBlue
    TabOrder = 4
    DataField = 'tel'
    DataSource = AcctUserInfod
    StyleController = dmData.dxStyleCtrl
  end
  object dxDBEdit7: TdxDBEdit
    Left = 321
    Top = 98
    Width = 120
    TabOrder = 5
    DataField = 'fax'
    DataSource = AcctUserInfod
    StyleController = dmData.dxStyleCtrl
  end
  object dxDBEdit8: TdxDBEdit
    Left = 77
    Top = 122
    Width = 120
    TabOrder = 6
    DataField = 'email'
    DataSource = AcctUserInfod
    StyleController = dmData.dxStyleCtrl
  end
  object dxDBEdit10: TdxDBEdit
    Left = 77
    Top = 146
    Width = 108
    Color = clSkyBlue
    TabOrder = 7
    DataField = 'deputy'
    DataSource = AcctUserInfod
    StyleController = dmData.dxStyleCtrl
  end
  object dxDBEdit11: TdxDBEdit
    Left = 321
    Top = 146
    Width = 120
    Color = clSkyBlue
    TabOrder = 8
    DataField = 'declarer'
    DataSource = AcctUserInfod
    StyleController = dmData.dxStyleCtrl
  end
  object dxDBHyperLinkEdit1: TdxDBHyperLinkEdit
    Left = 321
    Top = 122
    Width = 120
    TabOrder = 9
    DataField = 'web'
    DataSource = AcctUserInfod
    StyleController = dmData.dxStyleCtrl
  end
  object lcmbProvince: TDBLookupComboboxEh
    Left = 78
    Top = 51
    Width = 77
    Height = 18
    Color = clSkyBlue
    Ctl3D = False
    DataField = 'province_id'
    DataSource = AcctUserInfod
    EditButtons = <>
    KeyField = 'id'
    ListField = 'name'
    ListSource = provinced
    ParentCtl3D = False
    TabOrder = 10
    Visible = True
    OnKeyValueChanged = lcmbProvinceKeyValueChanged
  end
  object lcmbCity: TDBLookupComboboxEh
    Left = 184
    Top = 51
    Width = 77
    Height = 18
    Color = clSkyBlue
    Ctl3D = False
    DataField = 'city_id'
    DataSource = AcctUserInfod
    EditButtons = <>
    KeyField = 'id'
    ListField = 'name'
    ListSource = cityd
    ParentCtl3D = False
    TabOrder = 11
    Visible = True
    OnKeyValueChanged = lcmbCityKeyValueChanged
  end
  object lcmbBorough: TDBLookupComboboxEh
    Left = 314
    Top = 51
    Width = 77
    Height = 18
    Color = clSkyBlue
    Ctl3D = False
    DataField = 'borough_id'
    DataSource = AcctUserInfod
    EditButtons = <>
    KeyField = 'id'
    ListField = 'name'
    ListSource = boroughd
    ParentCtl3D = False
    TabOrder = 12
    Visible = True
  end
  object DBLookupComboboxEh1: TDBLookupComboboxEh
    Left = 78
    Top = 4
    Width = 100
    Height = 18
    Color = clSkyBlue
    Ctl3D = False
    DataField = 'com_level_id'
    DataSource = AcctUserInfod
    EditButtons = <>
    KeyField = 'id'
    ListField = 'name'
    ListSource = memComLeveld
    ParentCtl3D = False
    TabOrder = 13
    Visible = True
  end
  object AcctUserInfo: TCSADOQuery
    Connection = dmData.adocon
    AfterInsert = AcctUserInfoAfterInsert
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM device.acct_user_info')
    Left = 188
    object AcctUserInfosysid: TStringField
      DisplayLabel = #31995#32479#20195#30721
      FieldName = 'sysid'
    end
    object AcctUserInfouser_com: TStringField
      DisplayLabel = #29992#25143#21517#31216
      FieldName = 'user_com'
      Size = 60
    end
    object AcctUserInfocom_level_id: TIntegerField
      DisplayLabel = #29992#25143#32423#21035
      FieldName = 'com_level_id'
    end
    object AcctUserInfocom_level: TStringField
      DisplayLabel = #29992#25143#32423#21035
      FieldName = 'com_level'
      Size = 10
    end
    object AcctUserInfopath: TStringField
      FieldName = 'path'
      Size = 2
    end
    object AcctUserInfoprovince_id: TStringField
      DisplayLabel = #30465
      FieldName = 'province_id'
      Size = 6
    end
    object AcctUserInfoprovince: TStringField
      FieldName = 'province'
      Size = 50
    end
    object AcctUserInfocity_id: TStringField
      DisplayLabel = #24066
      FieldName = 'city_id'
      Size = 6
    end
    object AcctUserInfocity: TStringField
      FieldName = 'city'
      Size = 50
    end
    object AcctUserInfoborough_id: TStringField
      DisplayLabel = #21306'/'#21439
      FieldName = 'borough_id'
      Size = 6
    end
    object AcctUserInfoborough: TStringField
      FieldName = 'borough'
      Size = 50
    end
    object AcctUserInfoaddress: TStringField
      DisplayLabel = #22320#22336
      FieldName = 'address'
      Size = 60
    end
    object AcctUserInfotel: TStringField
      DisplayLabel = #21333#20301#30005#35805
      FieldName = 'tel'
      Size = 30
    end
    object AcctUserInfofax: TStringField
      DisplayLabel = #20256#30495
      FieldName = 'fax'
      Size = 30
    end
    object AcctUserInfozip: TStringField
      DisplayLabel = #37038#25919#32534#30721
      FieldName = 'zip'
      Size = 10
    end
    object AcctUserInfoemail: TStringField
      DisplayLabel = #30005#23376#37038#20214
      FieldName = 'email'
      Size = 30
    end
    object AcctUserInfoweb: TStringField
      DisplayLabel = #20027#39029#22320#22336
      FieldName = 'web'
      Size = 30
    end
    object AcctUserInfodeputy: TStringField
      DisplayLabel = #21333#20301#36127#36131#20154
      FieldName = 'deputy'
      Size = 10
    end
    object AcctUserInfodeclarer: TStringField
      DisplayLabel = #20107#25925#32479#35745#12289#19978#25253#36127#36131#20154
      FieldName = 'declarer'
      Size = 10
    end
    object AcctUserInfouser_num: TIntegerField
      FieldName = 'user_num'
    end
    object AcctUserInfooutflag: TIntegerField
      FieldName = 'outflag'
    end
  end
  object AcctUserInfod: TDataSource
    DataSet = AcctUserInfo
    Left = 216
  end
  object Province: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltReadOnly
    Parameters = <>
    Left = 244
  end
  object provinced: TDataSource
    DataSet = Province
    Left = 272
  end
  object City: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltReadOnly
    Parameters = <>
    Left = 300
  end
  object cityd: TDataSource
    DataSet = City
    Left = 328
  end
  object Borough: TCSADOQuery
    Connection = dmData.adocon
    LockType = ltReadOnly
    Parameters = <>
    Left = 356
  end
  object boroughd: TDataSource
    DataSet = Borough
    Left = 384
  end
  object CSBarMDIChild1: TCSBarMDIChild
    Left = 198
    Top = 96
  end
  object ScrChild: TCSScrCtrlChild
    Master = dmData.ScrMaster
    Left = 226
    Top = 96
  end
  object memComLevel: TdxMemData
    Active = True
    Indexes = <>
    Persistent.Data = {
      566572CDCCCCCCCCCCFC3F0200000004000000030003006964000B0000000100
      05006E616D6500010100000007000000B9FABCD2BED600010200000005000000
      CAA1BCB600010300000007000000B5D8CAD0BCB600010400000005000000CFD8
      BCB600}
    SortOptions = []
    Left = 390
    Top = 46
    object memComLevelid: TIntegerField
      FieldName = 'id'
    end
    object memComLevelname: TStringField
      FieldName = 'name'
      Size = 10
    end
  end
  object memComLeveld: TDataSource
    DataSet = memComLevel
    Left = 418
    Top = 46
  end
end
