inherited XxxgForm: TXxxgForm
  Left = 157
  Top = 70
  Height = 450
  Caption = #25509#24453
  Font.Name = 'System'
  Font.Style = [fsBold]
  PixelsPerInch = 96
  TextHeight = 16
  inherited Panel1: TPanel
    Height = 164
    inherited lblTitle: TLabel
      Left = 203
      Caption = #20449#24687#20462#25913
    end
    inherited Image1: TImage
      Left = 166
    end
    object Label4: TLabel [2]
      Left = 14
      Top = 118
      Width = 32
      Height = 16
      Caption = #22995#21517
      FocusControl = dbeKrxm
    end
    object DBText1: TDBText [3]
      Left = 378
      Top = 135
      Width = 85
      Height = 21
      AutoSize = True
      DataField = 'D_KRLX'
      DataSource = dsWork
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = #26999#20307'_GB2312'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label36: TLabel [4]
      Left = 232
      Top = 119
      Width = 64
      Height = 16
      Caption = #21040#24215#26102#38388
      FocusControl = dbeKrxm
    end
    inherited DBNavPlus1: TDBNavPlus
      Hints.Strings = ()
    end
    inherited cmbOption: TComboBox
      Height = 24
      ItemHeight = 16
      ItemIndex = 0
      Text = #22995#21517
      Items.Strings = (
        #22995#21517)
    end
    inherited cmbExpress: TComboBox
      Height = 24
      ItemHeight = 16
    end
    inherited edtValue: TEdit
      Height = 24
    end
    inherited btnLoca: TBitBtn
      OnClick = btnLocaClick
    end
    inherited DBNavPlus2: TDBNavPlus
      Width = 200
      VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
      Hints.Strings = ()
    end
    object dbeKrxm: TDBEdit
      Left = 13
      Top = 135
      Width = 220
      Height = 24
      DataField = 'D_KRXM'
      DataSource = dsWork
      TabOrder = 7
    end
    object dbeDdsj: TDBEdit
      Left = 232
      Top = 135
      Width = 121
      Height = 24
      DataField = 'D_DDSJ'
      DataSource = dsWork
      TabOrder = 8
    end
  end
  inherited Panel2: TPanel
    Top = 164
    Height = 224
    inherited Bevel1: TBevel
      Height = 204
    end
    object PageControl1: TPageControl
      Left = 10
      Top = 10
      Width = 522
      Height = 204
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'TabSheet1'
        TabVisible = False
        object Label11: TLabel
          Left = 13
          Top = 6
          Width = 32
          Height = 16
          Caption = #24615#21035
          FocusControl = dbcXb
        end
        object Label12: TLabel
          Left = 88
          Top = 6
          Width = 32
          Height = 16
          Caption = #27665#26063
          FocusControl = dblMzdm
        end
        object Label13: TLabel
          Left = 169
          Top = 6
          Width = 32
          Height = 16
          Caption = #22320#21306
          FocusControl = dblDqdm
        end
        object Label14: TLabel
          Left = 323
          Top = 6
          Width = 64
          Height = 16
          Caption = #35777#20214#31867#22411
          FocusControl = dblZjdm
        end
        object Label15: TLabel
          Left = 13
          Top = 49
          Width = 64
          Height = 16
          Caption = #35777#20214#21495#30721
          FocusControl = dbeZjhm
        end
        object Label16: TLabel
          Left = 168
          Top = 49
          Width = 64
          Height = 16
          Caption = #20986#29983#24180#26376
          FocusControl = dbeCsny
        end
        object Label18: TLabel
          Left = 323
          Top = 49
          Width = 64
          Height = 16
          Caption = #20572#30041#20107#30001
          FocusControl = dbeTlsy
        end
        object Label19: TLabel
          Left = 243
          Top = 49
          Width = 32
          Height = 16
          Caption = #32844#19994
          FocusControl = dbeZy
        end
        object Label20: TLabel
          Left = 13
          Top = 92
          Width = 48
          Height = 16
          Caption = #20309#22788#26469
          FocusControl = dbeHcl
        end
        object Label21: TLabel
          Left = 170
          Top = 92
          Width = 48
          Height = 16
          Caption = #20309#22788#21435
          FocusControl = dbeHcq
        end
        object Label22: TLabel
          Left = 325
          Top = 93
          Width = 64
          Height = 16
          Caption = #23478#24237#22320#22336
          FocusControl = dbeJtdz
        end
        object Label23: TLabel
          Left = 169
          Top = 135
          Width = 32
          Height = 16
          Caption = #22791#27880
          FocusControl = dbeBz
        end
        object Label35: TLabel
          Left = 16
          Top = 137
          Width = 64
          Height = 16
          Caption = #21333#20301#22320#22336
        end
        object dbeZjhm: TDBEdit
          Left = 13
          Top = 65
          Width = 150
          Height = 24
          DataField = 'D_ZJHM'
          DataSource = dsWork
          TabOrder = 4
          OnKeyPress = dbeZjhmKeyPress
        end
        object dbeCsny: TDBEdit
          Left = 168
          Top = 65
          Width = 75
          Height = 24
          DataField = 'D_CSNY'
          DataSource = dsWork
          TabOrder = 5
        end
        object dbeTlsy: TDBEdit
          Left = 323
          Top = 65
          Width = 150
          Height = 24
          DataField = 'D_TLSY'
          DataSource = dsWork
          TabOrder = 7
        end
        object dbeZy: TDBEdit
          Left = 242
          Top = 65
          Width = 75
          Height = 24
          DataField = 'D_ZY'
          DataSource = dsWork
          TabOrder = 6
        end
        object dbeHcl: TDBEdit
          Left = 13
          Top = 108
          Width = 150
          Height = 24
          DataField = 'D_HCL'
          DataSource = dsWork
          TabOrder = 8
        end
        object dbeHcq: TDBEdit
          Left = 168
          Top = 108
          Width = 150
          Height = 24
          DataField = 'D_HCQ'
          DataSource = dsWork
          TabOrder = 9
        end
        object dbeJtdz: TDBEdit
          Left = 324
          Top = 108
          Width = 150
          Height = 24
          DataField = 'D_JTDZ'
          DataSource = dsWork
          TabOrder = 10
        end
        object dbeBz: TDBEdit
          Left = 169
          Top = 150
          Width = 150
          Height = 24
          DataField = 'D_BZ'
          DataSource = dsWork
          TabOrder = 12
        end
        object dbcXb: TDBComboBox
          Left = 13
          Top = 22
          Width = 75
          Height = 24
          Style = csDropDownList
          DataField = 'D_XB'
          DataSource = dsWork
          ItemHeight = 16
          Items.Strings = (
            #30007
            #22899)
          TabOrder = 0
        end
        object dblMzdm: TDBLookupComboBox
          Left = 88
          Top = 22
          Width = 75
          Height = 24
          DataField = 'D_MZBH'
          DataSource = dsWork
          KeyField = 'D_MZBH'
          ListField = 'D_MZMC'
          ListSource = dsMzdm
          TabOrder = 1
        end
        object dblDqdm: TDBLookupComboBox
          Left = 168
          Top = 22
          Width = 150
          Height = 24
          DataField = 'D_DQBH'
          DataSource = dsWork
          KeyField = 'D_DQBH'
          ListField = 'D_DQMC'
          ListSource = dsDqdm
          TabOrder = 2
        end
        object dblZjdm: TDBLookupComboBox
          Left = 323
          Top = 22
          Width = 150
          Height = 24
          DataField = 'D_ZJBH'
          DataSource = dsWork
          KeyField = 'D_ZJBH'
          ListField = 'D_ZJMC'
          ListSource = dsZjdm
          TabOrder = 3
        end
        object dbeDwmc: TDBEdit
          Left = 13
          Top = 150
          Width = 150
          Height = 24
          DataField = 'D_DWMC'
          DataSource = dsWork
          TabOrder = 11
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'TabSheet2'
        ImageIndex = 1
        TabVisible = False
        object Label1: TLabel
          Left = 325
          Top = 6
          Width = 32
          Height = 16
          Caption = #24615#21035
          FocusControl = DBComboBox1
        end
        object Label2: TLabel
          Left = 400
          Top = 6
          Width = 64
          Height = 16
          Caption = #31614#35777#31867#22411
          FocusControl = DBLookupComboBox1
        end
        object Label3: TLabel
          Left = 13
          Top = 90
          Width = 32
          Height = 16
          Caption = #22269#23478
          FocusControl = DBLookupComboBox2
        end
        object Label5: TLabel
          Left = 168
          Top = 48
          Width = 64
          Height = 16
          Caption = #35777#20214#31867#22411
          FocusControl = DBLookupComboBox3
        end
        object Label6: TLabel
          Left = 325
          Top = 48
          Width = 64
          Height = 16
          Caption = #35777#20214#21495#30721
          FocusControl = DBEdit1
        end
        object Label8: TLabel
          Left = 168
          Top = 90
          Width = 64
          Height = 16
          Caption = #20572#30041#20107#30001
          FocusControl = DBEdit3
        end
        object Label10: TLabel
          Left = 325
          Top = 90
          Width = 48
          Height = 16
          Caption = #20309#22788#26469
          FocusControl = DBEdit5
        end
        object Label17: TLabel
          Left = 13
          Top = 132
          Width = 48
          Height = 16
          Caption = #20309#22788#21435
          FocusControl = DBEdit6
        end
        object Label24: TLabel
          Left = 168
          Top = 132
          Width = 64
          Height = 16
          Caption = #23478#24237#22320#22336
          FocusControl = DBEdit7
        end
        object Label25: TLabel
          Left = 325
          Top = 132
          Width = 32
          Height = 16
          Caption = #22791#27880
          FocusControl = DBEdit8
        end
        object lblYwx: TLabel
          Left = 13
          Top = 6
          Width = 48
          Height = 16
          Caption = #33521#25991#22995
          FocusControl = dbeYwx
        end
        object lblYwm: TLabel
          Left = 168
          Top = 6
          Width = 48
          Height = 16
          Caption = #33521#25991#21517
          FocusControl = dbeYwm
        end
        object Label7: TLabel
          Left = 13
          Top = 48
          Width = 80
          Height = 16
          Caption = #31614#35777#26377#25928#26399
        end
        object DBEdit1: TDBEdit
          Left = 325
          Top = 64
          Width = 150
          Height = 24
          DataField = 'D_ZJHM'
          DataSource = dsWork
          TabOrder = 6
          OnKeyPress = dbeZjhmKeyPress
        end
        object DBEdit3: TDBEdit
          Left = 168
          Top = 106
          Width = 150
          Height = 24
          DataField = 'D_TLSY'
          DataSource = dsWork
          TabOrder = 8
        end
        object DBEdit5: TDBEdit
          Left = 325
          Top = 106
          Width = 150
          Height = 24
          DataField = 'D_HCL'
          DataSource = dsWork
          TabOrder = 9
        end
        object DBEdit6: TDBEdit
          Left = 13
          Top = 148
          Width = 150
          Height = 24
          DataField = 'D_HCQ'
          DataSource = dsWork
          TabOrder = 10
        end
        object DBEdit7: TDBEdit
          Left = 168
          Top = 148
          Width = 150
          Height = 24
          DataField = 'D_JTDZ'
          DataSource = dsWork
          TabOrder = 11
        end
        object DBEdit8: TDBEdit
          Left = 325
          Top = 148
          Width = 150
          Height = 24
          DataField = 'D_BZ'
          DataSource = dsWork
          TabOrder = 12
        end
        object DBComboBox1: TDBComboBox
          Left = 325
          Top = 22
          Width = 75
          Height = 24
          Style = csDropDownList
          DataField = 'D_XB'
          DataSource = dsWork
          ItemHeight = 16
          Items.Strings = (
            #30007
            #22899)
          TabOrder = 2
        end
        object DBLookupComboBox1: TDBLookupComboBox
          Left = 400
          Top = 22
          Width = 75
          Height = 24
          DataField = 'D_MZBH'
          DataSource = dsWork
          KeyField = 'D_QZBH'
          ListField = 'D_QZMC'
          ListSource = dsQzdm
          TabOrder = 3
        end
        object DBLookupComboBox2: TDBLookupComboBox
          Left = 13
          Top = 106
          Width = 150
          Height = 24
          DataField = 'D_DQBH'
          DataSource = dsWork
          KeyField = 'D_GBBH'
          ListField = 'D_GBMC'
          ListSource = dsGbdm
          TabOrder = 5
        end
        object DBLookupComboBox3: TDBLookupComboBox
          Left = 168
          Top = 64
          Width = 150
          Height = 24
          DataField = 'D_ZJBH'
          DataSource = dsWork
          KeyField = 'D_ZJBH'
          ListField = 'D_ZJMC'
          ListSource = dsZjdm
          TabOrder = 7
        end
        object dbeYwx: TDBEdit
          Left = 13
          Top = 22
          Width = 150
          Height = 24
          DataField = 'D_YWX'
          DataSource = dsWork
          TabOrder = 0
        end
        object dbeYwm: TDBEdit
          Left = 168
          Top = 22
          Width = 150
          Height = 24
          DataField = 'D_YWM'
          DataSource = dsWork
          TabOrder = 1
        end
        object DBEdit2: TDBEdit
          Left = 13
          Top = 64
          Width = 150
          Height = 24
          DataField = 'D_QZYXQ'
          DataSource = dsWork
          TabOrder = 4
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'TabSheet3'
        ImageIndex = 2
        TabVisible = False
        object Label9: TLabel
          Left = 13
          Top = 6
          Width = 48
          Height = 16
          Caption = #25509#24453#20154
          FocusControl = dbeJdr
        end
        object Label26: TLabel
          Left = 173
          Top = 6
          Width = 64
          Height = 16
          Caption = #25509#24453#21333#20301
          FocusControl = dbeJddw
        end
        object Label27: TLabel
          Left = 13
          Top = 51
          Width = 64
          Height = 16
          Caption = #21333#20301#22320#22336
          FocusControl = dbeDwdz
        end
        object Label28: TLabel
          Left = 333
          Top = 4
          Width = 64
          Height = 16
          Caption = #32852#31995#30005#35805
          FocusControl = dbeLxdh
        end
        object Label29: TLabel
          Left = 173
          Top = 51
          Width = 32
          Height = 16
          Caption = #22791#27880
          FocusControl = DBEdit4
        end
        object Label30: TLabel
          Left = 13
          Top = 98
          Width = 64
          Height = 16
          Caption = #31614#21333#20154#19968
          FocusControl = dbeQdr1
        end
        object Label31: TLabel
          Left = 88
          Top = 98
          Width = 64
          Height = 16
          Caption = #31614#21333#20154#20108
          FocusControl = dbeQdr2
        end
        object Label32: TLabel
          Left = 174
          Top = 98
          Width = 64
          Height = 16
          Caption = #31614#21333#20154#19977
          FocusControl = dbeQdr3
        end
        object Label33: TLabel
          Left = 248
          Top = 98
          Width = 64
          Height = 16
          Caption = #31614#21333#20154#22235
          FocusControl = dbeQdr4
        end
        object dbeJdr: TDBEdit
          Left = 13
          Top = 22
          Width = 150
          Height = 24
          DataField = 'D_JDR'
          DataSource = dsWork
          TabOrder = 0
        end
        object dbeJddw: TDBEdit
          Left = 173
          Top = 22
          Width = 150
          Height = 24
          DataField = 'D_JDDW'
          DataSource = dsWork
          TabOrder = 1
        end
        object dbeDwdz: TDBEdit
          Left = 13
          Top = 68
          Width = 150
          Height = 24
          DataField = 'D_JTDZ'
          DataSource = dsWork
          TabOrder = 3
        end
        object dbeLxdh: TDBEdit
          Left = 333
          Top = 21
          Width = 150
          Height = 24
          DataField = 'D_LXDH'
          DataSource = dsWork
          TabOrder = 2
        end
        object DBEdit4: TDBEdit
          Left = 173
          Top = 68
          Width = 150
          Height = 24
          DataField = 'D_BZ'
          DataSource = dsWork
          TabOrder = 4
        end
        object dbeQdr1: TDBEdit
          Left = 13
          Top = 114
          Width = 75
          Height = 24
          DataField = 'D_QDR1'
          DataSource = dsWork
          TabOrder = 5
        end
        object dbeQdr2: TDBEdit
          Left = 88
          Top = 114
          Width = 75
          Height = 24
          DataField = 'D_QDR2'
          DataSource = dsWork
          TabOrder = 6
        end
        object dbeQdr3: TDBEdit
          Left = 174
          Top = 114
          Width = 75
          Height = 24
          DataField = 'D_QDR3'
          DataSource = dsWork
          TabOrder = 7
        end
        object dbeQdr4: TDBEdit
          Left = 248
          Top = 114
          Width = 75
          Height = 24
          DataField = 'D_QDR4'
          DataSource = dsWork
          TabOrder = 8
        end
      end
      object TabSheet4: TTabSheet
        Caption = 'TabSheet4'
        ImageIndex = 3
        TabVisible = False
        object Label34: TLabel
          Left = 8
          Top = 6
          Width = 48
          Height = 16
          Caption = #21516#24847#20154
          FocusControl = DBEdit9
        end
        object DBEdit9: TDBEdit
          Left = 8
          Top = 22
          Width = 100
          Height = 24
          DataField = 'D_JDR'
          DataSource = dsWork
          TabOrder = 0
        end
      end
    end
  end
  inherited Panel3: TPanel
    Top = 388
    inherited btnHelp: TBitBtn
      Left = 376
    end
    inherited btnClose: TBitBtn
      Left = 454
    end
    inherited btnPrint: TBitBtn
      Left = 298
    end
  end
  inherited qryWork: TQuery
    AfterOpen = qryWorkAfterOpen
    AfterClose = qryWorkAfterClose
    BeforeInsert = qryWorkBeforeInsert
    BeforeEdit = qryWorkBeforeEdit
    AfterPost = qryWorkAfterPost
    DatabaseName = 'LfHotelUser'
    RequestLive = True
    SQL.Strings = (
      'select * from KRXX')
    Left = 64
    object qryWorkD_KRBH: TStringField
      FieldName = 'D_KRBH'
      Origin = 'LFHOTELUSER.KRXX.D_KRBH'
      Size = 12
    end
    object qryWorkD_KRXM: TStringField
      FieldName = 'D_KRXM'
      Origin = 'LFHOTELUSER.KRXX.D_KRXM'
      Size = 30
    end
    object qryWorkD_KRLX: TStringField
      FieldName = 'D_KRLX'
      Origin = 'LFHOTELUSER.KRXX.D_KRLX'
      OnGetText = qryWorkD_KRLXGetText
      FixedChar = True
      Size = 1
    end
    object qryWorkD_DDRQ: TDateTimeField
      FieldName = 'D_DDRQ'
      Origin = 'LFHOTELUSER.KRXX.D_DDRQ'
    end
    object qryWorkD_DDSJ: TDateTimeField
      FieldName = 'D_DDSJ'
      Origin = 'LFHOTELUSER.KRXX.D_DDSJ'
      DisplayFormat = 'hh:nn:ss'
      EditMask = '!90:00;1; '
    end
    object qryWorkD_LDRQ: TDateTimeField
      FieldName = 'D_LDRQ'
      Origin = 'LFHOTELUSER.KRXX.D_LDRQ'
    end
    object qryWorkD_LDSJ: TDateTimeField
      FieldName = 'D_LDSJ'
      Origin = 'LFHOTELUSER.KRXX.D_LDSJ'
    end
    object qryWorkD_YWX: TStringField
      FieldName = 'D_YWX'
      Origin = 'LFHOTELUSER.KRXX.D_YWX'
      Size = 8
    end
    object qryWorkD_YWM: TStringField
      FieldName = 'D_YWM'
      Origin = 'LFHOTELUSER.KRXX.D_YWM'
      Size = 8
    end
    object qryWorkD_XB: TStringField
      FieldName = 'D_XB'
      Origin = 'LFHOTELUSER.KRXX.D_XB'
      Size = 2
    end
    object qryWorkD_MZBH: TStringField
      FieldName = 'D_MZBH'
      Origin = 'LFHOTELUSER.KRXX.D_MZBH'
      Size = 5
    end
    object qryWorkD_DQBH: TStringField
      FieldName = 'D_DQBH'
      Origin = 'LFHOTELUSER.KRXX.D_DQBH'
      Size = 5
    end
    object qryWorkD_GBBH: TStringField
      FieldName = 'D_GBBH'
      Origin = 'LFHOTELUSER.KRXX.D_GBBH'
      Size = 5
    end
    object qryWorkD_NZTS: TIntegerField
      FieldName = 'D_NZTS'
      Origin = 'LFHOTELUSER.KRXX.D_NZTS'
    end
    object qryWorkD_TLSY: TStringField
      FieldName = 'D_TLSY'
      Origin = 'LFHOTELUSER.KRXX.D_TLSY'
      Size = 10
    end
    object qryWorkD_ZJBH: TStringField
      FieldName = 'D_ZJBH'
      Origin = 'LFHOTELUSER.KRXX.D_ZJBH'
      OnChange = qryWorkD_ZJBHChange
      Size = 5
    end
    object qryWorkD_ZJHM: TStringField
      FieldName = 'D_ZJHM'
      Origin = 'LFHOTELUSER.KRXX.D_ZJHM'
      OnValidate = qryWorkD_ZJHMValidate
      Size = 18
    end
    object qryWorkD_CSNY: TDateTimeField
      FieldName = 'D_CSNY'
      Origin = 'LFHOTELUSER.KRXX.D_CSNY'
      DisplayFormat = 'yyyy-mm-dd'
      EditMask = '!0000/99/99;1; '
    end
    object qryWorkD_HCL: TStringField
      FieldName = 'D_HCL'
      Origin = 'LFHOTELUSER.KRXX.D_HCL'
      Size = 10
    end
    object qryWorkD_HCQ: TStringField
      FieldName = 'D_HCQ'
      Origin = 'LFHOTELUSER.KRXX.D_HCQ'
      Size = 10
    end
    object qryWorkD_QZBH: TStringField
      FieldName = 'D_QZBH'
      Origin = 'LFHOTELUSER.KRXX.D_QZBH'
      Size = 5
    end
    object qryWorkD_QZYXQ: TDateTimeField
      FieldName = 'D_QZYXQ'
      Origin = 'LFHOTELUSER.KRXX.D_QZYXQ'
    end
    object qryWorkD_ZY: TStringField
      FieldName = 'D_ZY'
      Origin = 'LFHOTELUSER.KRXX.D_ZY'
      Size = 10
    end
    object qryWorkD_LXDH: TStringField
      FieldName = 'D_LXDH'
      Origin = 'LFHOTELUSER.KRXX.D_LXDH'
      Size = 16
    end
    object qryWorkD_DWMC: TStringField
      FieldName = 'D_DWMC'
      Origin = 'LFHOTELUSER.KRXX.D_DWMC'
      Size = 30
    end
    object qryWorkD_JTDZ: TStringField
      FieldName = 'D_JTDZ'
      Origin = 'LFHOTELUSER.KRXX.D_JTDZ'
      Size = 30
    end
    object qryWorkD_JDR: TStringField
      FieldName = 'D_JDR'
      Origin = 'LFHOTELUSER.KRXX.D_JDR'
      Size = 8
    end
    object qryWorkD_JDDW: TStringField
      FieldName = 'D_JDDW'
      Origin = 'LFHOTELUSER.KRXX.D_JDDW'
      Size = 30
    end
    object qryWorkD_BZ: TStringField
      FieldName = 'D_BZ'
      Origin = 'LFHOTELUSER.KRXX.D_BZ'
      Size = 30
    end
    object qryWorkD_QDR1: TStringField
      FieldName = 'D_QDR1'
      Origin = 'LFHOTELUSER.KRXX.D_QDR1'
      Size = 8
    end
    object qryWorkD_QDR2: TStringField
      FieldName = 'D_QDR2'
      Origin = 'LFHOTELUSER.KRXX.D_QDR2'
      Size = 8
    end
    object qryWorkD_QDR3: TStringField
      FieldName = 'D_QDR3'
      Origin = 'LFHOTELUSER.KRXX.D_QDR3'
      Size = 8
    end
    object qryWorkD_QDR4: TStringField
      FieldName = 'D_QDR4'
      Origin = 'LFHOTELUSER.KRXX.D_QDR4'
      Size = 8
    end
  end
  inherited dsWork: TDataSource
    OnDataChange = dsWorkDataChange
    Left = 16
  end
  inherited DosMove1: TDosMove
    Left = 96
  end
  object tblMzdm: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'MZDM'
    Left = 424
  end
  object dsMzdm: TDataSource
    DataSet = tblMzdm
    Left = 456
  end
  object tblDqdm: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'DQDM'
    Left = 424
    Top = 32
  end
  object dsDqdm: TDataSource
    DataSet = tblDqdm
    Left = 456
    Top = 32
  end
  object tblZjdm: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'ZJDM'
    Left = 360
  end
  object dsZjdm: TDataSource
    DataSet = tblZjdm
    Left = 392
  end
  object tblGbdm: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'GBDM'
    Left = 360
    Top = 32
  end
  object tblQzdm: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'QZDM'
    Left = 360
    Top = 64
  end
  object dsGbdm: TDataSource
    DataSet = tblGbdm
    Left = 392
    Top = 32
  end
  object dsQzdm: TDataSource
    DataSet = tblQzdm
    Left = 392
    Top = 64
  end
end
