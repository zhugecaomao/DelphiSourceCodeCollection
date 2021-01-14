inherited NbjdForm: TNbjdForm
  Left = 66
  Top = -2
  Width = 700
  Height = 550
  Caption = #25509#24453
  Font.Height = -16
  Font.Name = 'System'
  Font.Style = [fsBold]
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited Panel1: TPanel
    Width = 692
    Height = 68
    DesignSize = (
      692
      68)
    inherited lblTitile: TLabel
      Left = 278
      Width = 125
      Caption = #20869#23486#25509#24453
    end
    inherited Image1: TImage
      Left = 218
    end
    object lblHelp: TLabel
      Left = 8
      Top = 47
      Width = 80
      Height = 16
      Caption = #25805#20316#24110#21161#65306
    end
    object lblInfo: TLabel
      Left = 392
      Top = 47
      Width = 80
      Height = 16
      Caption = #21451#24773#25552#37266#65306
    end
  end
  inherited Panel2: TPanel
    Top = 68
    Width = 692
    Height = 420
    BorderStyle = bsSingle
    Color = clMoneyGreen
    ParentColor = False
    inherited Bevel1: TBevel
      Width = 285
      Height = 406
    end
    object Label2: TLabel
      Left = 9
      Top = 76
      Width = 48
      Height = 16
      Caption = #25151#38388#21495
      FocusControl = dbeKfbh
    end
    object Label3: TLabel
      Left = 150
      Top = 76
      Width = 64
      Height = 16
      Caption = #23454#38469#25151#20215
      FocusControl = dbeSjfj
    end
    object Label4: TLabel
      Left = 9
      Top = 128
      Width = 32
      Height = 16
      Caption = #22995#21517
      FocusControl = dbeKrxm
    end
    object Label5: TLabel
      Left = 94
      Top = 128
      Width = 64
      Height = 16
      Caption = #21040#24215#26085#26399
      FocusControl = dbeDdrq
    end
    object Label6: TLabel
      Left = 187
      Top = 128
      Width = 64
      Height = 16
      Caption = #21040#24215#26102#38388
      FocusControl = dbeDdsj
    end
    object Label7: TLabel
      Left = 150
      Top = 179
      Width = 64
      Height = 16
      Caption = #39044#20184#26041#24335
      FocusControl = dbcFkfs
    end
    object lblYfje: TLabel
      Left = 9
      Top = 230
      Width = 64
      Height = 16
      Caption = #39044#20184#37329#39069
      FocusControl = dbeYfje
    end
    object Label17: TLabel
      Left = 9
      Top = 179
      Width = 64
      Height = 16
      Caption = #25311#20303#22825#25968
      FocusControl = dbeNzts
    end
    object Label24: TLabel
      Left = 9
      Top = 23
      Width = 48
      Height = 16
      Caption = #25805#20316#21592
    end
    object Label25: TLabel
      Left = 151
      Top = 23
      Width = 48
      Height = 16
      Caption = #32467#24080#21592
    end
    object lblMc: TLabel
      Left = 10
      Top = 278
      Width = 35
      Height = 16
      Caption = 'lblMc'
    end
    object dbeKfbh: TDBEdit
      Tag = 3
      Left = 9
      Top = 92
      Width = 135
      Height = 24
      DataField = 'D_KFBH'
      DataSource = dsKrzd
      TabOrder = 2
      OnEnter = HelpInfo
      OnExit = dbeKfbhExit
    end
    object dbeSjfj: TDBEdit
      Tag = 4
      Left = 150
      Top = 92
      Width = 135
      Height = 24
      DataField = 'D_SJFJ'
      DataSource = dsKrzd
      TabOrder = 3
      OnEnter = HelpInfo
      OnExit = dbeSjfjExit
    end
    object dbeKrxm: TDBEdit
      Tag = 5
      Left = 9
      Top = 144
      Width = 83
      Height = 24
      DataField = 'D_KRXM'
      DataSource = dsKrxx
      TabOrder = 4
      OnEnter = HelpInfo
      OnExit = dbeKrxmExit
    end
    object dbeDdrq: TDBEdit
      Tag = 10
      Left = 94
      Top = 144
      Width = 94
      Height = 24
      DataField = 'D_DDRQ'
      DataSource = dsKrxx
      TabOrder = 5
      OnEnter = HelpInfo
    end
    object dbeDdsj: TDBEdit
      Tag = 11
      Left = 187
      Top = 144
      Width = 97
      Height = 24
      DataField = 'D_DDSJ'
      DataSource = dsKrxx
      TabOrder = 6
      OnEnter = HelpInfo
    end
    object dbeYfje: TDBEdit
      Tag = 7
      Left = 9
      Top = 246
      Width = 135
      Height = 24
      DataField = 'D_YFJE'
      DataSource = dsKryj
      TabOrder = 9
      OnEnter = HelpInfo
      OnExit = dbeYfjeExit
    end
    object dbeNzts: TDBEdit
      Tag = 12
      Left = 9
      Top = 195
      Width = 135
      Height = 24
      DataField = 'D_NZTS'
      DataSource = dsKrxx
      TabOrder = 7
      OnEnter = HelpInfo
    end
    object dbcFkfs: TDBComboBox
      Tag = 6
      Left = 150
      Top = 195
      Width = 135
      Height = 24
      Style = csDropDownList
      DataField = 'D_FKFS'
      DataSource = dsKryj
      ItemHeight = 16
      Items.Strings = (
        #20154#27665#24065
        #20449#29992#21345
        #25903#31080
        #35760#24080)
      TabOrder = 8
      OnEnter = HelpInfo
      OnKeyPress = dbcFkfsKeyPress
    end
    object dbcCzyxm: TDBComboBox
      Left = 9
      Top = 39
      Width = 135
      Height = 24
      DataField = 'D_CZYXM'
      DataSource = dsKrzd
      ItemHeight = 16
      TabOrder = 0
      OnExit = dbcCzyxmExit
    end
    object dbcJzyxm: TDBComboBox
      Left = 150
      Top = 39
      Width = 135
      Height = 24
      DataField = 'D_JZYXM'
      DataSource = dsKrzd
      ItemHeight = 16
      TabOrder = 1
      OnExit = dbcJzyxmExit
    end
    object dbcXykbh: TDBComboBox
      Left = 8
      Top = 310
      Width = 135
      Height = 24
      DataField = 'D_XYKBH'
      DataSource = dsKryj
      ItemHeight = 16
      TabOrder = 10
      OnExit = dbcXykbhExit
    end
    object dbcKhbh: TDBComboBox
      Left = 8
      Top = 336
      Width = 200
      Height = 24
      DataField = 'D_KHBH'
      DataSource = dsKryj
      ItemHeight = 16
      TabOrder = 11
      OnDblClick = dbcKhbhDblClick
      OnExit = dbcKhbhExit
    end
    object Panel4: TPanel
      Left = 290
      Top = 5
      Width = 393
      Height = 406
      Align = alRight
      AutoSize = True
      BorderWidth = 5
      BorderStyle = bsSingle
      Color = clSkyBlue
      TabOrder = 12
      object Label11: TLabel
        Left = 6
        Top = 16
        Width = 32
        Height = 16
        Caption = #24615#21035
        FocusControl = dbcXb
      end
      object Label12: TLabel
        Left = 181
        Top = 16
        Width = 32
        Height = 16
        Caption = #27665#26063
      end
      object Label13: TLabel
        Left = 6
        Top = 67
        Width = 32
        Height = 16
        Caption = #22320#21306
      end
      object Label14: TLabel
        Left = 181
        Top = 67
        Width = 64
        Height = 16
        Caption = #35777#20214#31867#22411
      end
      object Label15: TLabel
        Left = 6
        Top = 119
        Width = 64
        Height = 16
        Caption = #35777#20214#21495#30721
        FocusControl = dbeZjhm
      end
      object Label16: TLabel
        Left = 181
        Top = 119
        Width = 64
        Height = 16
        Caption = #20986#29983#24180#26376
        FocusControl = dbeCsny
      end
      object Label18: TLabel
        Left = 6
        Top = 171
        Width = 64
        Height = 16
        Caption = #20572#30041#20107#30001
        FocusControl = dbeTlsy
      end
      object Label19: TLabel
        Left = 282
        Top = 119
        Width = 32
        Height = 16
        Caption = #32844#19994
        FocusControl = dbeZy
      end
      object Label20: TLabel
        Left = 181
        Top = 171
        Width = 48
        Height = 16
        Caption = #20309#22788#26469
        FocusControl = dbeHcl
      end
      object Label21: TLabel
        Left = 280
        Top = 171
        Width = 48
        Height = 16
        Caption = #20309#22788#21435
        FocusControl = dbeHcq
      end
      object Label22: TLabel
        Left = 6
        Top = 222
        Width = 64
        Height = 16
        Caption = #23478#24237#22320#22336
        FocusControl = dbeJtdz
      end
      object Label23: TLabel
        Left = 6
        Top = 326
        Width = 32
        Height = 16
        Caption = #22791#27880
        FocusControl = dbeBz
      end
      object lblMz: TLabel
        Left = 284
        Top = 41
        Width = 36
        Height = 16
        Caption = 'lblMz'
      end
      object lblDqmc: TLabel
        Left = 108
        Top = 93
        Width = 53
        Height = 16
        Caption = 'lblDqmc'
      end
      object lblZjmc: TLabel
        Left = 285
        Top = 93
        Width = 48
        Height = 16
        Caption = 'lblZjmc'
      end
      object Label8: TLabel
        Left = 6
        Top = 274
        Width = 64
        Height = 16
        Caption = #24037#20316#21333#20301
      end
      object dbeZjhm: TDBEdit
        Tag = 17
        Left = 6
        Top = 137
        Width = 172
        Height = 24
        DataField = 'D_ZJHM'
        DataSource = dsKrxx
        TabOrder = 4
        OnEnter = HelpInfo
        OnExit = dbeZjhmExit
        OnKeyPress = dbeZjhmKeyPress
        OnKeyUp = dbeZjhmKeyUp
      end
      object dbeCsny: TDBEdit
        Tag = 18
        Left = 182
        Top = 137
        Width = 99
        Height = 24
        DataField = 'D_CSNY'
        DataSource = dsKrxx
        TabOrder = 5
        OnEnter = HelpInfo
      end
      object dbeTlsy: TDBEdit
        Tag = 20
        Left = 6
        Top = 188
        Width = 172
        Height = 24
        DataField = 'D_TLSY'
        DataSource = dsKrxx
        TabOrder = 7
        OnEnter = HelpInfo
      end
      object dbeZy: TDBEdit
        Tag = 19
        Left = 281
        Top = 137
        Width = 102
        Height = 24
        DataField = 'D_ZY'
        DataSource = dsKrxx
        TabOrder = 6
        OnEnter = HelpInfo
      end
      object dbeHcl: TDBEdit
        Tag = 21
        Left = 182
        Top = 188
        Width = 101
        Height = 24
        DataField = 'D_HCL'
        DataSource = dsKrxx
        TabOrder = 8
        OnEnter = HelpInfo
      end
      object dbeHcq: TDBEdit
        Tag = 22
        Left = 281
        Top = 188
        Width = 102
        Height = 24
        DataField = 'D_HCQ'
        DataSource = dsKrxx
        TabOrder = 9
        OnEnter = HelpInfo
      end
      object dbeJtdz: TDBEdit
        Tag = 23
        Left = 6
        Top = 240
        Width = 363
        Height = 24
        DataField = 'D_JTDZ'
        DataSource = dsKrxx
        TabOrder = 10
        OnEnter = HelpInfo
      end
      object dbeBz: TDBEdit
        Tag = 24
        Left = 6
        Top = 344
        Width = 363
        Height = 24
        DataField = 'D_BZ'
        DataSource = dsKrxx
        TabOrder = 12
        OnEnter = HelpInfo
      end
      object dbcXb: TDBComboBox
        Tag = 13
        Left = 6
        Top = 33
        Width = 172
        Height = 24
        Style = csDropDownList
        DataField = 'D_XB'
        DataSource = dsKrxx
        ItemHeight = 16
        Items.Strings = (
          #30007
          #22899)
        TabOrder = 0
        OnEnter = HelpInfo
        OnKeyPress = dbcXbKeyPress
      end
      object dbcMz: TDBComboBox
        Left = 182
        Top = 33
        Width = 99
        Height = 24
        AutoComplete = False
        DataField = 'D_MZBH'
        DataSource = dsKrxx
        ItemHeight = 16
        TabOrder = 1
        OnExit = dbcMzExit
      end
      object dbcDqbh: TDBComboBox
        Left = 6
        Top = 85
        Width = 100
        Height = 24
        AutoComplete = False
        DataField = 'D_DQBH'
        DataSource = dsKrxx
        ItemHeight = 16
        TabOrder = 2
        OnExit = dbcDqbhExit
      end
      object dbcZjlx: TDBComboBox
        Left = 182
        Top = 85
        Width = 99
        Height = 24
        AutoComplete = False
        DataField = 'D_ZJBH'
        DataSource = dsKrxx
        ItemHeight = 16
        TabOrder = 3
        OnExit = dbcZjlxExit
      end
      object dbeDwmc: TDBEdit
        Left = 6
        Top = 292
        Width = 364
        Height = 24
        DataField = 'D_DWMC'
        DataSource = dsKrxx
        TabOrder = 11
      end
    end
  end
  inherited Panel3: TPanel
    Top = 488
    Width = 692
    DesignSize = (
      692
      35)
    inherited btnOK: TBitBtn
      Left = 527
      Font.Height = -16
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnOKClick
    end
    inherited btnCanc: TBitBtn
      Left = 607
      Font.Height = -16
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnCancClick
    end
    object btnDyfk: TBitBtn
      Left = 110
      Top = 5
      Width = 100
      Height = 25
      Caption = #25171#21360#25151#21345
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888F8800000000000888808888888880808800000000000008080888888BBB88
        0008088888877788080800000000000008800888888888808080800000000008
        0800880FFFFFFFF080808880F00000F000088880FFFFFFFF088888880F00000F
        088888880FFFFFFFF08888888000000000888888888888888888}
    end
    object btnSk: TBitBtn
      Left = 5
      Top = 5
      Width = 100
      Height = 25
      Caption = #21047#21345
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        55555555FFFFFFFF5555555000000005555555577777777FF555550999999900
        55555575555555775F55509999999901055557F55555557F75F5001111111101
        105577FFFFFFFF7FF75F00000000000011057777777777775F755070FFFFFF0F
        01105777F555557F7FF75500FFFFFF0F00105577F555FF7F77575550FF70000F
        0F0055575FF777757F775555000FFFFF0F005555777555FF7F77555550FF7000
        0F055555575FF777757F555555000FFFFF05555555777555FF7F55555550FF70
        0005555555575FF7777555555555000555555555555577755555555555555555
        5555555555555555555555555555555555555555555555555555}
      NumGlyphs = 2
    end
  end
  object tblKrzd: TTable
    CachedUpdates = True
    BeforeOpen = tblKrzdBeforeOpen
    BeforeClose = tblKrzdBeforeClose
    BeforePost = tblKrzdBeforePost
    AfterCancel = tblKrzdAfterCancel
    OnNewRecord = tblKrzdNewRecord
    DatabaseName = 'LfHotelUser'
    TableName = 'KRZD'
    Left = 8
    object tblKrzdD_ZDBH: TStringField
      FieldName = 'D_ZDBH'
      Required = True
      Size = 12
    end
    object tblKrzdD_HH: TIntegerField
      FieldName = 'D_HH'
    end
    object tblKrzdD_ZDLB: TStringField
      FieldName = 'D_ZDLB'
      FixedChar = True
      Size = 1
    end
    object tblKrzdD_KRBH: TStringField
      FieldName = 'D_KRBH'
      Size = 12
    end
    object tblKrzdD_YJBH: TStringField
      FieldName = 'D_YJBH'
      Size = 12
    end
    object tblKrzdD_KFBH: TStringField
      FieldName = 'D_KFBH'
      OnValidate = tblKrzdD_KFBHValidate
      Size = 5
    end
    object tblKrzdD_SJFJ: TFloatField
      FieldName = 'D_SJFJ'
      OnValidate = tblKrzdD_SJFJValidate
    end
    object tblKrzdD_XMBH: TStringField
      FieldName = 'D_XMBH'
      Size = 5
    end
    object tblKrzdD_XFDJ: TFloatField
      FieldName = 'D_XFDJ'
    end
    object tblKrzdD_XFSL: TFloatField
      FieldName = 'D_XFSL'
    end
    object tblKrzdD_XFJE: TFloatField
      FieldName = 'D_XFJE'
    end
    object tblKrzdD_XFRQ: TDateTimeField
      FieldName = 'D_XFRQ'
    end
    object tblKrzdD_XFSJ: TDateTimeField
      FieldName = 'D_XFSJ'
    end
    object tblKrzdD_YHJE: TFloatField
      FieldName = 'D_YHJE'
    end
    object tblKrzdD_JZRQ: TDateTimeField
      FieldName = 'D_JZRQ'
    end
    object tblKrzdD_JZSJ: TDateTimeField
      FieldName = 'D_JZSJ'
    end
    object tblKrzdD_JZBZ: TStringField
      FieldName = 'D_JZBZ'
      FixedChar = True
      Size = 1
    end
    object tblKrzdD_JSBZ: TStringField
      FieldName = 'D_JSBZ'
      FixedChar = True
      Size = 1
    end
    object tblKrzdD_DLR1: TStringField
      FieldName = 'D_DLR1'
      Size = 8
    end
    object tblKrzdD_DLR2: TStringField
      FieldName = 'D_DLR2'
      Size = 8
    end
    object tblKrzdD_DLR3: TStringField
      FieldName = 'D_DLR3'
      Size = 8
    end
    object tblKrzdD_DLR4: TStringField
      FieldName = 'D_DLR4'
      Size = 8
    end
    object tblKrzdD_CZYXM: TStringField
      FieldName = 'D_CZYXM'
      OnChange = tblKrzdD_CZYXMChange
      Size = 8
    end
    object tblKrzdD_JZYXM: TStringField
      FieldName = 'D_JZYXM'
      OnChange = tblKrzdD_JZYXMChange
      Size = 8
    end
    object tblKrzdD_TYR: TStringField
      FieldName = 'D_TYR'
      Size = 8
    end
    object tblKrzdD_BZ: TStringField
      FieldName = 'D_BZ'
      Size = 30
    end
    object tblKrzdD_YSRQ: TStringField
      FieldName = 'D_YSRQ'
      Size = 8
    end
    object tblKrzdD_JZBH: TStringField
      FieldName = 'D_JZBH'
      Size = 12
    end
    object tblKrzdD_BMBH: TStringField
      FieldName = 'D_BMBH'
      Size = 5
    end
  end
  object tblKrxx: TTable
    CachedUpdates = True
    OnNewRecord = tblKrxxNewRecord
    DatabaseName = 'LfHotelUser'
    TableName = 'KRXX'
    Left = 40
    object tblKrxxD_KRBH: TStringField
      FieldName = 'D_KRBH'
      Required = True
      Size = 12
    end
    object tblKrxxD_KRXM: TStringField
      FieldName = 'D_KRXM'
      Size = 30
    end
    object tblKrxxD_KRLX: TStringField
      FieldName = 'D_KRLX'
      FixedChar = True
      Size = 1
    end
    object tblKrxxD_DDRQ: TDateTimeField
      FieldName = 'D_DDRQ'
    end
    object tblKrxxD_DDSJ: TDateTimeField
      FieldName = 'D_DDSJ'
      DisplayFormat = 'hh:nn:ss'
      EditMask = '!90:00;1; '
    end
    object tblKrxxD_LDRQ: TDateTimeField
      FieldName = 'D_LDRQ'
    end
    object tblKrxxD_LDSJ: TDateTimeField
      FieldName = 'D_LDSJ'
    end
    object tblKrxxD_YWX: TStringField
      FieldName = 'D_YWX'
      Size = 8
    end
    object tblKrxxD_YWM: TStringField
      FieldName = 'D_YWM'
      Size = 8
    end
    object tblKrxxD_XB: TStringField
      FieldName = 'D_XB'
      Size = 2
    end
    object tblKrxxD_MZBH: TStringField
      FieldName = 'D_MZBH'
      Size = 5
    end
    object tblKrxxD_DQBH: TStringField
      FieldName = 'D_DQBH'
      Size = 5
    end
    object tblKrxxD_GBBH: TStringField
      FieldName = 'D_GBBH'
      Size = 5
    end
    object tblKrxxD_NZTS: TIntegerField
      FieldName = 'D_NZTS'
    end
    object tblKrxxD_TLSY: TStringField
      FieldName = 'D_TLSY'
      Size = 10
    end
    object tblKrxxD_ZJBH: TStringField
      FieldName = 'D_ZJBH'
      OnChange = tblKrxxD_ZJBHChange
      Size = 5
    end
    object tblKrxxD_ZJHM: TStringField
      FieldName = 'D_ZJHM'
      OnValidate = tblKrxxD_ZJHMValidate
      Size = 18
    end
    object tblKrxxD_CSNY: TDateTimeField
      FieldName = 'D_CSNY'
      EditMask = '!0000/99/99;1; '
    end
    object tblKrxxD_HCL: TStringField
      FieldName = 'D_HCL'
      Size = 10
    end
    object tblKrxxD_HCQ: TStringField
      FieldName = 'D_HCQ'
      Size = 10
    end
    object tblKrxxD_QZBH: TStringField
      FieldName = 'D_QZBH'
      Size = 5
    end
    object tblKrxxD_QZYXQ: TDateTimeField
      FieldName = 'D_QZYXQ'
    end
    object tblKrxxD_ZY: TStringField
      FieldName = 'D_ZY'
      Size = 10
    end
    object tblKrxxD_LXDH: TStringField
      FieldName = 'D_LXDH'
      Size = 16
    end
    object tblKrxxD_DWMC: TStringField
      FieldName = 'D_DWMC'
      Size = 60
    end
    object tblKrxxD_JTDZ: TStringField
      FieldName = 'D_JTDZ'
      Size = 60
    end
    object tblKrxxD_JDR: TStringField
      FieldName = 'D_JDR'
      Size = 8
    end
    object tblKrxxD_JDDW: TStringField
      FieldName = 'D_JDDW'
      Size = 30
    end
    object tblKrxxD_BZ: TStringField
      FieldName = 'D_BZ'
      Size = 30
    end
  end
  object tblKryj: TTable
    CachedUpdates = True
    OnNewRecord = tblKryjNewRecord
    DatabaseName = 'LfHotelUser'
    FieldDefs = <
      item
        Name = 'D_YJBH'
        Attributes = [faRequired]
        DataType = ftString
        Size = 12
      end
      item
        Name = 'D_HH'
        DataType = ftInteger
      end
      item
        Name = 'D_FKFS'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'D_XYKBH'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'D_KHBH'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'D_YFJE'
        DataType = ftFloat
      end
      item
        Name = 'D_YFRQ'
        DataType = ftDateTime
      end
      item
        Name = 'D_YFSJ'
        DataType = ftDateTime
      end
      item
        Name = 'D_BZ'
        DataType = ftString
        Size = 30
      end>
    StoreDefs = True
    TableName = 'KRYJ'
    Left = 72
    object tblKryjD_YJBH: TStringField
      FieldName = 'D_YJBH'
      Required = True
      Size = 12
    end
    object tblKryjD_HH: TIntegerField
      FieldName = 'D_HH'
    end
    object tblKryjD_FKFS: TStringField
      FieldName = 'D_FKFS'
      OnChange = tblKryjD_FKFSChange
      Size = 10
    end
    object tblKryjD_XYKBH: TStringField
      FieldName = 'D_XYKBH'
      Size = 5
    end
    object tblKryjD_KHBH: TStringField
      FieldName = 'D_KHBH'
      Size = 5
    end
    object tblKryjD_YFJE: TFloatField
      FieldName = 'D_YFJE'
      OnValidate = tblKryjD_YFJEValidate
    end
    object tblKryjD_YFRQ: TDateTimeField
      FieldName = 'D_YFRQ'
    end
    object tblKryjD_YFSJ: TDateTimeField
      FieldName = 'D_YFSJ'
    end
    object tblKryjD_BZ: TStringField
      FieldName = 'D_BZ'
      Size = 30
    end
  end
  object dsKrzd: TDataSource
    DataSet = tblKrzd
    Left = 8
    Top = 32
  end
  object dsKrxx: TDataSource
    DataSet = tblKrxx
    Left = 40
    Top = 32
  end
  object dsKryj: TDataSource
    DataSet = tblKryj
    Left = 72
    Top = 32
  end
  object tblKfzt: TTable
    CachedUpdates = True
    DatabaseName = 'LfHotelUser'
    TableName = 'KFZT'
    Left = 408
    Top = 8
    object tblKfztD_KFBH: TStringField
      FieldName = 'D_KFBH'
      Required = True
      Size = 5
    end
    object tblKfztD_ZDBH: TStringField
      FieldName = 'D_ZDBH'
      Size = 12
    end
    object tblKfztD_KRBH: TStringField
      FieldName = 'D_KRBH'
      Size = 12
    end
    object tblKfztD_YJBH: TStringField
      FieldName = 'D_YJBH'
      Size = 12
    end
    object tblKfztD_SJFJ: TFloatField
      FieldName = 'D_SJFJ'
    end
    object tblKfztD_KFZT: TStringField
      FieldName = 'D_KFZT'
      FixedChar = True
      Size = 1
    end
    object tblKfztD_KFBZ: TStringField
      FieldName = 'D_KFBZ'
      FixedChar = True
      Size = 1
    end
    object tblKfztD_KRSL: TIntegerField
      FieldName = 'D_KRSL'
    end
    object tblKfztD_DHKT: TStringField
      FieldName = 'D_DHKT'
      FixedChar = True
      Size = 1
    end
    object tblKfztD_BZFJ: TFloatField
      FieldName = 'D_BZFJ'
    end
    object tblKfztD_CWS: TIntegerField
      FieldName = 'D_CWS'
    end
    object tblKfztD_BJS: TIntegerField
      FieldName = 'D_BJS'
    end
    object tblKfztD_QJS: TIntegerField
      FieldName = 'D_QJS'
    end
    object tblKfztD_JJFJ: TFloatField
      FieldName = 'D_JJFJ'
    end
    object tblKfztD_FXBH: TStringField
      FieldName = 'D_FXBH'
      Size = 5
    end
    object tblKfztD_LCBH: TStringField
      FieldName = 'D_LCBH'
      Size = 5
    end
    object tblKfztD_KRXM: TStringField
      FieldName = 'D_KRXM'
      Size = 30
    end
  end
  object tblZd: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'KRZD'
    Left = 448
    Top = 8
    object tblZdD_ZDBH: TStringField
      FieldName = 'D_ZDBH'
      Required = True
      Size = 12
    end
    object tblZdD_HH: TIntegerField
      FieldName = 'D_HH'
    end
    object tblZdD_ZDLB: TStringField
      FieldName = 'D_ZDLB'
      FixedChar = True
      Size = 1
    end
    object tblZdD_KRBH: TStringField
      FieldName = 'D_KRBH'
      Size = 12
    end
    object tblZdD_YJBH: TStringField
      FieldName = 'D_YJBH'
      Size = 12
    end
    object tblZdD_KFBH: TStringField
      FieldName = 'D_KFBH'
      Size = 5
    end
    object tblZdD_SJFJ: TFloatField
      FieldName = 'D_SJFJ'
    end
    object tblZdD_XMBH: TStringField
      FieldName = 'D_XMBH'
      Size = 5
    end
    object tblZdD_XFDJ: TFloatField
      FieldName = 'D_XFDJ'
    end
    object tblZdD_XFSL: TFloatField
      FieldName = 'D_XFSL'
    end
    object tblZdD_XFJE: TFloatField
      FieldName = 'D_XFJE'
    end
    object tblZdD_XFRQ: TDateTimeField
      FieldName = 'D_XFRQ'
    end
    object tblZdD_XFSJ: TDateTimeField
      FieldName = 'D_XFSJ'
    end
    object tblZdD_YHJE: TFloatField
      FieldName = 'D_YHJE'
    end
    object tblZdD_JZRQ: TDateTimeField
      FieldName = 'D_JZRQ'
    end
    object tblZdD_JZSJ: TDateTimeField
      FieldName = 'D_JZSJ'
    end
    object tblZdD_JZBZ: TStringField
      FieldName = 'D_JZBZ'
      FixedChar = True
      Size = 1
    end
    object tblZdD_JSBZ: TStringField
      FieldName = 'D_JSBZ'
      FixedChar = True
      Size = 1
    end
    object tblZdD_DLR1: TStringField
      FieldName = 'D_DLR1'
      Size = 8
    end
    object tblZdD_DLR2: TStringField
      FieldName = 'D_DLR2'
      Size = 8
    end
    object tblZdD_DLR3: TStringField
      FieldName = 'D_DLR3'
      Size = 8
    end
    object tblZdD_DLR4: TStringField
      FieldName = 'D_DLR4'
      Size = 8
    end
    object tblZdD_CZYXM: TStringField
      FieldName = 'D_CZYXM'
      Size = 8
    end
    object tblZdD_JZYXM: TStringField
      FieldName = 'D_JZYXM'
      Size = 8
    end
    object tblZdD_TYR: TStringField
      FieldName = 'D_TYR'
      Size = 8
    end
    object tblZdD_BZ: TStringField
      FieldName = 'D_BZ'
      Size = 30
    end
    object tblZdD_YSRQ: TStringField
      FieldName = 'D_YSRQ'
      Size = 8
    end
    object tblZdD_JZBH: TStringField
      FieldName = 'D_JZBH'
      Size = 12
    end
    object tblZdD_BMBH: TStringField
      FieldName = 'D_BMBH'
      Size = 5
    end
  end
end
