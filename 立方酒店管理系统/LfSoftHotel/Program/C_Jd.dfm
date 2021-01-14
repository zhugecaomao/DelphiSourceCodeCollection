inherited JdForm: TJdForm
  Left = 185
  Top = 95
  Width = 600
  Height = 483
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Width = 592
    inherited lblTitle: TLabel
      Left = 227
      Width = 218
      Caption = #25509#24453#21333#65288#20869#23486#65289
    end
    inherited Image1: TImage
      Left = 187
    end
  end
  inherited Panel2: TPanel
    Width = 592
    Height = 334
    object Label1: TLabel
      Left = 24
      Top = 0
      Width = 48
      Height = 12
      Caption = #24080#21333#32534#21495
      FocusControl = dbeZdbh
    end
    object Label2: TLabel
      Left = 24
      Top = 48
      Width = 36
      Height = 12
      Caption = #25151#38388#21495
      FocusControl = dbeKfbh
    end
    object Label3: TLabel
      Left = 96
      Top = 48
      Width = 48
      Height = 12
      Caption = #23454#38469#25151#20215
      FocusControl = dbeSjfj
    end
    object Label4: TLabel
      Left = 168
      Top = 48
      Width = 24
      Height = 12
      Caption = #22995#21517
      FocusControl = dbeKrxm
    end
    object Label5: TLabel
      Left = 240
      Top = 48
      Width = 48
      Height = 12
      Caption = #21040#24215#26085#26399
      FocusControl = dbeDdrq
    end
    object Label6: TLabel
      Left = 352
      Top = 48
      Width = 48
      Height = 12
      Caption = #21040#24215#26102#38388
      FocusControl = dbeDdsj
    end
    object Label7: TLabel
      Left = 24
      Top = 88
      Width = 48
      Height = 12
      Caption = #39044#20184#26041#24335
      FocusControl = dbcFkfs
    end
    object Label8: TLabel
      Left = 168
      Top = 88
      Width = 36
      Height = 12
      Caption = #20449#29992#21345
      FocusControl = dblXyk
    end
    object Label9: TLabel
      Left = 304
      Top = 88
      Width = 48
      Height = 12
      Caption = #35760#24080#23458#25143
      FocusControl = dblKhda
    end
    object Label10: TLabel
      Left = 96
      Top = 88
      Width = 48
      Height = 12
      Caption = #39044#20184#37329#39069
      FocusControl = dbeYfje
    end
    object Label11: TLabel
      Left = 24
      Top = 128
      Width = 24
      Height = 12
      Caption = #24615#21035
      FocusControl = dbcXb
    end
    object Label12: TLabel
      Left = 96
      Top = 128
      Width = 24
      Height = 12
      Caption = #27665#26063
      FocusControl = dblMzdm
    end
    object Label13: TLabel
      Left = 168
      Top = 128
      Width = 24
      Height = 12
      Caption = #22320#21306
      FocusControl = dblDqdm
    end
    object Label14: TLabel
      Left = 280
      Top = 128
      Width = 48
      Height = 12
      Caption = #35777#20214#31867#22411
      FocusControl = dblZjdm
    end
    object Label15: TLabel
      Left = 368
      Top = 128
      Width = 48
      Height = 12
      Caption = #35777#20214#21495#30721
      FocusControl = dbeZjhm
    end
    object Label16: TLabel
      Left = 24
      Top = 168
      Width = 48
      Height = 12
      Caption = #20986#29983#24180#26376
      FocusControl = dbeCsny
    end
    object Label17: TLabel
      Left = 464
      Top = 48
      Width = 48
      Height = 12
      Caption = #25311#20303#22825#25968
      FocusControl = dbeNzts
    end
    object Label18: TLabel
      Left = 160
      Top = 168
      Width = 48
      Height = 12
      Caption = #20572#30041#20107#30001
      FocusControl = dbeTlsy
    end
    object Label19: TLabel
      Left = 296
      Top = 168
      Width = 24
      Height = 12
      Caption = #32844#19994
      FocusControl = dbeZy
    end
    object Label20: TLabel
      Left = 24
      Top = 208
      Width = 36
      Height = 12
      Caption = #20309#22788#26469
      FocusControl = dbeHcl
    end
    object Label21: TLabel
      Left = 160
      Top = 208
      Width = 36
      Height = 12
      Caption = #20309#22788#21435
      FocusControl = dbeHcq
    end
    object Label22: TLabel
      Left = 24
      Top = 248
      Width = 48
      Height = 12
      Caption = #23478#24237#22320#22336
      FocusControl = dbeJtdz
    end
    object Label23: TLabel
      Left = 24
      Top = 288
      Width = 24
      Height = 12
      Caption = #22791#27880
      FocusControl = dbeBz
    end
    object Label24: TLabel
      Left = 184
      Top = 0
      Width = 36
      Height = 12
      Caption = #25805#20316#21592
    end
    object Label25: TLabel
      Left = 280
      Top = 0
      Width = 36
      Height = 12
      Caption = #32467#24080#21592
    end
    object dbeZdbh: TDBEdit
      Left = 24
      Top = 16
      Width = 148
      Height = 20
      DataField = 'D_ZDBH'
      DataSource = dsKrzd
      ReadOnly = True
      TabOrder = 0
    end
    object dbeKfbh: TDBEdit
      Left = 24
      Top = 64
      Width = 64
      Height = 20
      DataField = 'D_KFBH'
      DataSource = dsKrzd
      TabOrder = 1
    end
    object dbeSjfj: TDBEdit
      Left = 96
      Top = 64
      Width = 64
      Height = 20
      DataField = 'D_SJFJ'
      DataSource = dsKrzd
      TabOrder = 2
    end
    object dbeKrxm: TDBEdit
      Left = 168
      Top = 64
      Width = 64
      Height = 20
      DataField = 'D_KRXM'
      DataSource = dsKrxx
      TabOrder = 3
    end
    object dbeDdrq: TDBEdit
      Left = 240
      Top = 64
      Width = 110
      Height = 20
      DataField = 'D_DDRQ'
      DataSource = dsKrxx
      TabOrder = 4
    end
    object dbeDdsj: TDBEdit
      Left = 352
      Top = 64
      Width = 110
      Height = 20
      DataField = 'D_DDSJ'
      DataSource = dsKrxx
      TabOrder = 5
    end
    object dbeYfje: TDBEdit
      Left = 96
      Top = 104
      Width = 64
      Height = 20
      DataField = 'D_YFJE'
      DataSource = dsKryj
      TabOrder = 6
    end
    object dbeZjhm: TDBEdit
      Left = 368
      Top = 144
      Width = 220
      Height = 20
      DataField = 'D_ZJHM'
      DataSource = dsKrxx
      TabOrder = 7
    end
    object dbeCsny: TDBEdit
      Left = 24
      Top = 184
      Width = 124
      Height = 20
      DataField = 'D_CSNY'
      DataSource = dsKrxx
      TabOrder = 8
    end
    object dbeNzts: TDBEdit
      Left = 464
      Top = 64
      Width = 124
      Height = 20
      DataField = 'D_NZTS'
      DataSource = dsKrxx
      TabOrder = 9
    end
    object dbeTlsy: TDBEdit
      Left = 160
      Top = 184
      Width = 124
      Height = 20
      DataField = 'D_TLSY'
      DataSource = dsKrxx
      TabOrder = 10
    end
    object dbeZy: TDBEdit
      Left = 296
      Top = 184
      Width = 124
      Height = 20
      DataField = 'D_ZY'
      DataSource = dsKrxx
      TabOrder = 11
    end
    object dbeHcl: TDBEdit
      Left = 24
      Top = 224
      Width = 124
      Height = 20
      DataField = 'D_HCL'
      DataSource = dsKrxx
      TabOrder = 12
    end
    object dbeHcq: TDBEdit
      Left = 160
      Top = 224
      Width = 124
      Height = 20
      DataField = 'D_HCQ'
      DataSource = dsKrxx
      TabOrder = 13
    end
    object dbeJtdz: TDBEdit
      Left = 24
      Top = 264
      Width = 364
      Height = 20
      DataField = 'D_JTDZ'
      DataSource = dsKrxx
      TabOrder = 14
    end
    object dbeBz: TDBEdit
      Left = 24
      Top = 304
      Width = 244
      Height = 20
      DataField = 'D_BZ'
      DataSource = dsKrxx
      TabOrder = 15
    end
    object dbcFkfs: TDBComboBox
      Left = 23
      Top = 104
      Width = 66
      Height = 20
      Style = csDropDownList
      DataField = 'D_FKFS'
      DataSource = dsKryj
      ItemHeight = 12
      Items.Strings = (
        #20154#27665#24065
        #20449#29992#21345
        #25903#31080
        #35760#24080)
      TabOrder = 16
    end
    object dblXyk: TDBLookupComboBox
      Left = 169
      Top = 103
      Width = 110
      Height = 20
      DataField = 'D_XYKBH'
      KeyField = 'D_XYKBH'
      ListField = 'D_XYKMC'
      ListSource = dsXyk
      TabOrder = 17
    end
    object dblKhda: TDBLookupComboBox
      Left = 303
      Top = 103
      Width = 230
      Height = 20
      DataField = 'D_KHBH'
      KeyField = 'D_KHBH'
      ListField = 'D_KHMC'
      ListSource = dsKhda
      TabOrder = 18
    end
    object dbcXb: TDBComboBox
      Left = 24
      Top = 144
      Width = 65
      Height = 20
      DataField = 'D_XB'
      DataSource = dsKrxx
      ItemHeight = 12
      Items.Strings = (
        #30007
        #22899)
      TabOrder = 19
    end
    object dblMzdm: TDBLookupComboBox
      Left = 96
      Top = 144
      Width = 65
      Height = 20
      DataField = 'D_MZBH'
      DataSource = dsKrxx
      KeyField = 'D_MZBH'
      ListField = 'D_MZMC'
      ListSource = dsMzdm
      TabOrder = 20
    end
    object dblDqdm: TDBLookupComboBox
      Left = 168
      Top = 144
      Width = 105
      Height = 20
      DataField = 'D_DQBH'
      DataSource = dsKrxx
      KeyField = 'D_DQBH'
      ListField = 'D_DQMC'
      ListSource = dsDqdm
      TabOrder = 21
    end
    object dblZjdm: TDBLookupComboBox
      Left = 280
      Top = 144
      Width = 81
      Height = 20
      DataField = 'D_ZJBH'
      DataSource = dsKrxx
      KeyField = 'D_ZJBH'
      ListField = 'D_ZJMC'
      ListSource = dsZjdm
      TabOrder = 22
    end
    object dblCzyxm: TDBLookupComboBox
      Left = 184
      Top = 16
      Width = 81
      Height = 20
      DataField = 'D_CZYXM'
      DataSource = dsKrzd
      KeyField = 'D_YGXM'
      ListField = 'D_YGXM'
      ListSource = dsYgda
      TabOrder = 23
    end
    object dblJzyxm: TDBLookupComboBox
      Left = 280
      Top = 16
      Width = 81
      Height = 20
      DataField = 'D_JZYXM'
      DataSource = dsKrzd
      KeyField = 'D_YGXM'
      ListField = 'D_YGXM'
      ListSource = dsYgda
      TabOrder = 24
    end
  end
  inherited Panel3: TPanel
    Top = 415
    Width = 592
    inherited btnOK: TBitBtn
      Left = 432
    end
    inherited btnCanc: TBitBtn
      Left = 512
    end
  end
  object tblKrzd: TTable [3]
    BeforeOpen = tblKrzdBeforeOpen
    BeforeClose = tblKrzdBeforeClose
    OnNewRecord = tblKrzdNewRecord
    DatabaseName = 'LFHOTELUSER'
    TableName = 'KRZD.db'
    Left = 16
    Top = 8
    object tblKrzdD_ZDBH: TStringField
      FieldName = 'D_ZDBH'
      Size = 12
    end
    object tblKrzdD_HH: TIntegerField
      FieldName = 'D_HH'
    end
    object tblKrzdD_ZDLB: TStringField
      FieldName = 'D_ZDLB'
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
      Size = 5
    end
    object tblKrzdD_SJFJ: TCurrencyField
      FieldName = 'D_SJFJ'
    end
    object tblKrzdD_XMBH: TStringField
      FieldName = 'D_XMBH'
      Size = 5
    end
    object tblKrzdD_XFDJ: TCurrencyField
      FieldName = 'D_XFDJ'
    end
    object tblKrzdD_XFSL: TFloatField
      FieldName = 'D_XFSL'
    end
    object tblKrzdD_XFJE: TCurrencyField
      FieldName = 'D_XFJE'
    end
    object tblKrzdD_XFRQ: TDateField
      FieldName = 'D_XFRQ'
    end
    object tblKrzdD_XFSJ: TTimeField
      FieldName = 'D_XFSJ'
    end
    object tblKrzdD_YHJE: TCurrencyField
      FieldName = 'D_YHJE'
    end
    object tblKrzdD_JZRQ: TDateField
      FieldName = 'D_JZRQ'
    end
    object tblKrzdD_JZSJ: TTimeField
      FieldName = 'D_JZSJ'
    end
    object tblKrzdD_JZBZ: TStringField
      FieldName = 'D_JZBZ'
      Size = 1
    end
    object tblKrzdD_JSBZ: TStringField
      FieldName = 'D_JSBZ'
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
      Size = 8
    end
    object tblKrzdD_JZYXM: TStringField
      FieldName = 'D_JZYXM'
      Size = 8
    end
    object tblKrzdD_TYR: TStringField
      FieldName = 'D_TYR'
      Size = 8
    end
    object tblKrzdD_BZ: TStringField
      FieldName = 'D_BZ'
    end
    object tblKrzdD_YSRQ: TDateField
      FieldName = 'D_YSRQ'
    end
  end
  object tblKrxx: TTable [4]
    CachedUpdates = True
    OnNewRecord = tblKrxxNewRecord
    DatabaseName = 'LFHOTELUSER'
    IndexFieldNames = 'D_KRBH'
    MasterFields = 'D_KRBH'
    MasterSource = dsKrzd
    TableName = 'KRXX.db'
    Left = 48
    Top = 8
    object tblKrxxD_KRBH: TStringField
      FieldName = 'D_KRBH'
      Size = 12
    end
    object tblKrxxD_KRXM: TStringField
      FieldName = 'D_KRXM'
      Size = 30
    end
    object tblKrxxD_KRLX: TStringField
      FieldName = 'D_KRLX'
      Size = 1
    end
    object tblKrxxD_DDRQ: TDateField
      FieldName = 'D_DDRQ'
    end
    object tblKrxxD_DDSJ: TTimeField
      FieldName = 'D_DDSJ'
    end
    object tblKrxxD_LDRQ: TDateField
      FieldName = 'D_LDRQ'
    end
    object tblKrxxD_LDSJ: TTimeField
      FieldName = 'D_LDSJ'
    end
    object tblKrxxD_XB: TStringField
      FieldName = 'D_XB'
      Size = 2
    end
    object tblKrxxD_YWX: TStringField
      FieldName = 'D_YWX'
      Size = 8
    end
    object tblKrxxD_YWM: TStringField
      FieldName = 'D_YWM'
      Size = 8
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
    object tblKrxxD_NZTS: TSmallintField
      FieldName = 'D_NZTS'
    end
    object tblKrxxD_TLSY: TStringField
      FieldName = 'D_TLSY'
      Size = 10
    end
    object tblKrxxD_ZJBH: TStringField
      FieldName = 'D_ZJBH'
      Size = 5
    end
    object tblKrxxD_ZJHM: TStringField
      FieldName = 'D_ZJHM'
      Size = 18
    end
    object tblKrxxD_CSNY: TDateField
      FieldName = 'D_CSNY'
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
    object tblKrxxD_QZYXQ: TDateField
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
      Size = 30
    end
    object tblKrxxD_JTDZ: TStringField
      FieldName = 'D_JTDZ'
      Size = 30
    end
    object tblKrxxD_JDDW: TStringField
      FieldName = 'D_JDDW'
      Size = 30
    end
    object tblKrxxD_BZ: TStringField
      FieldName = 'D_BZ'
    end
  end
  object tblKryj: TTable [5]
    CachedUpdates = True
    OnNewRecord = tblKryjNewRecord
    DatabaseName = 'LFHOTELUSER'
    IndexFieldNames = 'D_YJBH'
    MasterFields = 'D_YJBH'
    MasterSource = dsKrzd
    TableName = 'KRYJ.db'
    Left = 80
    Top = 8
    object tblKryjD_YJBH: TStringField
      FieldName = 'D_YJBH'
      Size = 12
    end
    object tblKryjD_FKFS: TStringField
      FieldName = 'D_FKFS'
      Size = 6
    end
    object tblKryjD_XYKBH: TStringField
      FieldName = 'D_XYKBH'
      Size = 5
    end
    object tblKryjD_KHBH: TStringField
      FieldName = 'D_KHBH'
      Size = 5
    end
    object tblKryjD_YFJE: TCurrencyField
      FieldName = 'D_YFJE'
    end
    object tblKryjD_BZ: TStringField
      FieldName = 'D_BZ'
    end
  end
  object dsKrzd: TDataSource [6]
    DataSet = tblKrzd
    Left = 16
    Top = 40
  end
  object dsKrxx: TDataSource [7]
    DataSet = tblKrxx
    Left = 48
    Top = 40
  end
  object dsKryj: TDataSource [8]
    DataSet = tblKryj
    Left = 80
    Top = 40
  end
  object tblXYK: TTable [9]
    DatabaseName = 'LFHOTELSYS'
    TableName = 'XYK.db'
    Left = 448
    Top = 8
  end
  object dsXyk: TDataSource [10]
    DataSet = tblXYK
    Left = 480
    Top = 8
  end
  object dsKhda: TDataSource [11]
    DataSet = tblKhda
    Left = 480
    Top = 40
  end
  object tblKhda: TTable [12]
    DatabaseName = 'LFHOTELSYS'
    TableName = 'KHDA.db'
    Left = 448
    Top = 40
  end
  object tblMzdm: TTable [13]
    DatabaseName = 'LFHOTELSYS'
    TableName = 'MZDM.db'
    Left = 512
    Top = 8
  end
  object dsMzdm: TDataSource [14]
    DataSet = tblMzdm
    Left = 544
    Top = 8
  end
  object tblDqdm: TTable [15]
    DatabaseName = 'LFHOTELSYS'
    TableName = 'DQDM.db'
    Left = 512
    Top = 40
  end
  object dsDqdm: TDataSource [16]
    DataSet = tblDqdm
    Left = 544
    Top = 40
  end
  object tblZjdm: TTable [17]
    DatabaseName = 'LFHOTELSYS'
    TableName = 'ZJDM.db'
    Left = 448
    Top = 72
  end
  object dsZjdm: TDataSource [18]
    DataSet = tblZjdm
    Left = 480
    Top = 72
  end
  object tblYgda: TTable [19]
    DatabaseName = 'LFHOTELSYS'
    TableName = 'YGDA.db'
    Left = 512
    Top = 72
  end
  object dsYgda: TDataSource [20]
    DataSet = tblYgda
    Left = 544
    Top = 72
  end
end
