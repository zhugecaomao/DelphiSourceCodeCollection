inherited TdjdForm: TTdjdForm
  Left = 137
  Top = 74
  Width = 600
  Height = 443
  ActiveControl = dbcJzyxm
  Caption = #25509#24453
  Font.Name = 'System'
  Font.Style = [fsBold]
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited Panel1: TPanel
    Width = 592
    Height = 58
    inherited lblTitile: TLabel
      Left = 231
      Width = 125
      Caption = #22242#38431#25509#24453
    end
    object lblInfo: TLabel
      Left = 8
      Top = 41
      Width = 60
      Height = 12
      Caption = #21451#24773#25552#37266#65306
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
  end
  inherited Panel2: TPanel
    Top = 58
    Width = 592
    Height = 323
    inherited Bevel1: TBevel
      Width = 331
      Height = 313
    end
    object Label24: TLabel
      Left = 14
      Top = 22
      Width = 48
      Height = 16
      Caption = #25805#20316#21592
    end
    object Label25: TLabel
      Left = 174
      Top = 22
      Width = 48
      Height = 16
      Caption = #32467#24080#21592
    end
    object Label4: TLabel
      Left = 13
      Top = 62
      Width = 64
      Height = 16
      Caption = #22242#38431#21517#31216
      FocusControl = dbeKrxm
    end
    object Label7: TLabel
      Left = 173
      Top = 62
      Width = 64
      Height = 16
      Caption = #39044#20184#26041#24335
      FocusControl = dbcFkfs
    end
    object lblYfje: TLabel
      Left = 13
      Top = 102
      Width = 64
      Height = 16
      Caption = #39044#20184#37329#39069
      FocusControl = dbeYfje
    end
    object Label5: TLabel
      Left = 13
      Top = 142
      Width = 64
      Height = 16
      Caption = #21040#24215#26085#26399
      FocusControl = dbeDdrq
    end
    object Label6: TLabel
      Left = 88
      Top = 142
      Width = 64
      Height = 16
      Caption = #21040#24215#26102#38388
      FocusControl = dbeDdsj
    end
    object Label17: TLabel
      Left = 173
      Top = 142
      Width = 48
      Height = 16
      Caption = #25509#24453#20154
      FocusControl = dbeJdr
    end
    object Label1: TLabel
      Left = 13
      Top = 184
      Width = 64
      Height = 16
      Caption = #25509#24453#21333#20301
      FocusControl = dbeJddw
    end
    object Label2: TLabel
      Left = 173
      Top = 184
      Width = 64
      Height = 16
      Caption = #21333#20301#22320#22336
      FocusControl = dbeDwdz
    end
    object Label3: TLabel
      Left = 13
      Top = 224
      Width = 64
      Height = 16
      Caption = #32852#31995#30005#35805
      FocusControl = dbeLxdh
    end
    object Label11: TLabel
      Left = 173
      Top = 224
      Width = 32
      Height = 16
      Caption = #22791#27880
      FocusControl = dbeBz
    end
    object Label12: TLabel
      Left = 13
      Top = 264
      Width = 64
      Height = 16
      Caption = #31614#21333#20154#19968
      FocusControl = dbeQdr1
    end
    object Label13: TLabel
      Left = 88
      Top = 264
      Width = 64
      Height = 16
      Caption = #31614#21333#20154#20108
      FocusControl = dbeQdr2
    end
    object Label14: TLabel
      Left = 173
      Top = 264
      Width = 64
      Height = 16
      Caption = #31614#21333#20154#19977
      FocusControl = dbeQdr3
    end
    object Label15: TLabel
      Left = 248
      Top = 264
      Width = 64
      Height = 16
      Caption = #31614#21333#20154#22235
      FocusControl = dbeQdr4
    end
    object lblMc: TLabel
      Left = 168
      Top = 125
      Width = 30
      Height = 12
      Caption = 'lblMc'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object dbeKrxm: TDBEdit
      Left = 13
      Top = 78
      Width = 150
      Height = 24
      DataField = 'D_KRXM'
      DataSource = dsKrxx
      TabOrder = 2
      OnExit = dbeKrxmExit
    end
    object dbcFkfs: TDBComboBox
      Left = 172
      Top = 78
      Width = 150
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
      TabOrder = 3
      OnKeyPress = dbcFkfsKeyPress
    end
    object dbeYfje: TDBEdit
      Left = 13
      Top = 118
      Width = 150
      Height = 24
      DataField = 'D_YFJE'
      DataSource = dsKryj
      TabOrder = 4
      OnExit = dbeYfjeExit
    end
    object dbeDdrq: TDBEdit
      Left = 13
      Top = 158
      Width = 75
      Height = 24
      DataField = 'D_DDRQ'
      DataSource = dsKrxx
      TabOrder = 7
    end
    object dbeDdsj: TDBEdit
      Left = 88
      Top = 158
      Width = 75
      Height = 24
      DataField = 'D_DDSJ'
      DataSource = dsKrxx
      MaxLength = 5
      TabOrder = 8
    end
    object dbeJdr: TDBEdit
      Left = 173
      Top = 158
      Width = 150
      Height = 24
      DataField = 'D_JDR'
      DataSource = dsKrxx
      TabOrder = 9
    end
    object dbeJddw: TDBEdit
      Left = 13
      Top = 200
      Width = 150
      Height = 24
      DataField = 'D_JDDW'
      DataSource = dsKrxx
      TabOrder = 10
    end
    object dbeDwdz: TDBEdit
      Left = 173
      Top = 200
      Width = 150
      Height = 24
      DataField = 'D_JTDZ'
      DataSource = dsKrxx
      TabOrder = 11
    end
    object dbeLxdh: TDBEdit
      Left = 13
      Top = 240
      Width = 150
      Height = 24
      DataField = 'D_LXDH'
      DataSource = dsKrxx
      TabOrder = 12
    end
    object dbeBz: TDBEdit
      Left = 173
      Top = 240
      Width = 150
      Height = 24
      DataField = 'D_BZ'
      DataSource = dsKrxx
      TabOrder = 13
    end
    object dbeQdr1: TDBEdit
      Left = 13
      Top = 280
      Width = 75
      Height = 24
      DataField = 'D_QDR1'
      DataSource = dsKrxx
      TabOrder = 14
    end
    object dbeQdr2: TDBEdit
      Left = 88
      Top = 280
      Width = 75
      Height = 24
      DataField = 'D_QDR2'
      DataSource = dsKrxx
      TabOrder = 15
    end
    object dbeQdr3: TDBEdit
      Left = 173
      Top = 280
      Width = 75
      Height = 24
      DataField = 'D_QDR3'
      DataSource = dsKrxx
      TabOrder = 16
    end
    object dbeQdr4: TDBEdit
      Left = 248
      Top = 280
      Width = 75
      Height = 24
      DataField = 'D_QDR4'
      DataSource = dsKrxx
      TabOrder = 17
    end
    object Panel4: TPanel
      Left = 336
      Top = 5
      Width = 251
      Height = 313
      Align = alRight
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 18
      object Panel5: TPanel
        Left = 2
        Top = 2
        Width = 247
        Height = 45
        Align = alTop
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 0
        object lblBfh: TLabeledEdit
          Left = 0
          Top = 22
          Width = 50
          Height = 24
          EditLabel.Width = 32
          EditLabel.Height = 16
          EditLabel.Caption = #36215#22987
          LabelPosition = lpAbove
          LabelSpacing = 3
          TabOrder = 0
          OnKeyPress = vleKfKeyPress
        end
        object lblEfh: TLabeledEdit
          Left = 50
          Top = 22
          Width = 50
          Height = 24
          EditLabel.Width = 32
          EditLabel.Height = 16
          EditLabel.Caption = #32456#27490
          LabelPosition = lpAbove
          LabelSpacing = 3
          TabOrder = 1
          OnKeyPress = vleKfKeyPress
        end
        object lblFj: TLabeledEdit
          Left = 104
          Top = 22
          Width = 60
          Height = 24
          EditLabel.Width = 32
          EditLabel.Height = 16
          EditLabel.Caption = #25151#20215
          LabelPosition = lpAbove
          LabelSpacing = 3
          TabOrder = 2
          OnKeyPress = vleKfKeyPress
        end
        object btnInsert: TBitBtn
          Left = 165
          Top = 19
          Width = 75
          Height = 25
          Caption = #28155#21152
          TabOrder = 3
          OnClick = btnInsertClick
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            888888888888888888888800000000000888880FFFFFFFFF0888880FFFFFFFFF
            0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFFFFF
            0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFF0000888880FFFFFF0F0
            8888880FFFFFF008888888000000008888888888888888888888}
        end
      end
      object vleKf: TValueListEditor
        Left = 2
        Top = 47
        Width = 247
        Height = 264
        Align = alClient
        DefaultColWidth = 120
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'System'
        Font.Style = [fsBold]
        KeyOptions = [keyDelete, keyUnique]
        ParentFont = False
        TabOrder = 1
        TitleCaptions.Strings = (
          #25151#38388#21495
          #25151#20215)
        OnKeyPress = vleKfKeyPress
        ColWidths = (
          120
          121)
      end
    end
    object dbcCzyxm: TDBComboBox
      Left = 14
      Top = 38
      Width = 150
      Height = 24
      DataField = 'D_CZYXM'
      DataSource = dsKrzd
      ItemHeight = 16
      TabOrder = 0
      OnExit = dbcCzyxmExit
    end
    object dbcJzyxm: TDBComboBox
      Left = 171
      Top = 38
      Width = 150
      Height = 24
      DataField = 'D_JZYXM'
      DataSource = dsKrzd
      ItemHeight = 16
      TabOrder = 1
      OnExit = dbcJzyxmExit
    end
    object dbcXykbh: TDBComboBox
      Left = 203
      Top = 102
      Width = 150
      Height = 24
      DataField = 'D_XYKBH'
      DataSource = dsKryj
      ItemHeight = 16
      TabOrder = 5
      OnExit = dbcXykbhExit
    end
    object dbcKhbh: TDBComboBox
      Left = 203
      Top = 119
      Width = 150
      Height = 24
      DataField = 'D_KHBH'
      DataSource = dsKryj
      ItemHeight = 16
      TabOrder = 6
      OnExit = dbcKhbhExit
    end
  end
  inherited Panel3: TPanel
    Top = 381
    Width = 592
    inherited btnOK: TBitBtn
      Left = 431
      OnClick = btnOKClick
    end
    inherited btnCanc: TBitBtn
      Left = 510
      OnClick = btnCancClick
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
      Size = 5
    end
    object tblKrzdD_SJFJ: TFloatField
      FieldName = 'D_SJFJ'
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
  object dsKrzd: TDataSource
    DataSet = tblKrzd
    Left = 8
    Top = 32
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
      EditMask = '!90:00:00;1; '
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
      Size = 5
    end
    object tblKrxxD_ZJHM: TStringField
      FieldName = 'D_ZJHM'
      Size = 18
    end
    object tblKrxxD_CSNY: TDateTimeField
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
      Size = 30
    end
    object tblKrxxD_JTDZ: TStringField
      FieldName = 'D_JTDZ'
      Size = 30
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
    object tblKrxxD_QDR1: TStringField
      FieldName = 'D_QDR1'
      Size = 8
    end
    object tblKrxxD_QDR2: TStringField
      FieldName = 'D_QDR2'
      Size = 8
    end
    object tblKrxxD_QDR3: TStringField
      FieldName = 'D_QDR3'
      Size = 8
    end
    object tblKrxxD_QDR4: TStringField
      FieldName = 'D_QDR4'
      Size = 8
    end
  end
  object dsKrxx: TDataSource
    DataSet = tblKrxx
    Left = 40
    Top = 32
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
  object dsKryj: TDataSource
    DataSet = tblKryj
    Left = 72
    Top = 32
  end
end
