inherited YddForm: TYddForm
  Left = 150
  Top = 21
  Height = 500
  ActiveControl = dbeRq
  Caption = #39044#23450
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Height = 250
    object Bevel2: TBevel [0]
      Left = 11
      Top = 116
      Width = 515
      Height = 129
      Shape = bsFrame
    end
    inherited lblTitle: TLabel
      Width = 126
      Caption = #39044' '#23450' '#21333
    end
    object Label1: TLabel [3]
      Left = 276
      Top = 125
      Width = 48
      Height = 12
      Caption = #22995'    '#21517
      FocusControl = dbeXm
    end
    object Label10: TLabel [4]
      Left = 397
      Top = 125
      Width = 60
      Height = 12
      Caption = #23486#39302#32852#31995#20154
      FocusControl = dbeLxr
    end
    object Label3: TLabel [5]
      Left = 27
      Top = 165
      Width = 48
      Height = 12
      Caption = #21333#20301#21517#31216
      FocusControl = dbeDwmc
    end
    object Label2: TLabel [6]
      Left = 27
      Top = 205
      Width = 48
      Height = 12
      Caption = #39044#23450#26085#26399
      FocusControl = dbeRq
    end
    object Label4: TLabel [7]
      Left = 153
      Top = 205
      Width = 48
      Height = 12
      Caption = #39044#23450#26102#38388
      FocusControl = dbeSj
    end
    object Label5: TLabel [8]
      Left = 154
      Top = 125
      Width = 60
      Height = 12
      Caption = #25805'  '#20316'  '#21592
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel [9]
      Left = 276
      Top = 165
      Width = 48
      Height = 12
      Caption = #39044#20184#26041#24335
      FocusControl = dbeFkfs
    end
    object Label7: TLabel [10]
      Left = 30
      Top = 125
      Width = 48
      Height = 12
      Caption = #32534'    '#21495
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel [11]
      Left = 396
      Top = 205
      Width = 48
      Height = 12
      Caption = #21512#35745#37329#39069
    end
    object Label9: TLabel [12]
      Left = 397
      Top = 165
      Width = 48
      Height = 12
      Caption = #39044#20184#37329#39069
    end
    inherited DBNavPlus1: TDBNavPlus
      Top = 71
      Hints.Strings = ()
      TabOrder = 1
    end
    inherited cmbOption: TComboBox
      Top = 47
      ItemIndex = 0
      TabOrder = 3
      Text = #22995#21517
      Items.Strings = (
        #22995#21517)
    end
    inherited cmbExpress: TComboBox
      Top = 47
      TabOrder = 4
    end
    inherited edtValue: TEdit
      Top = 47
      TabOrder = 5
    end
    inherited btnLoca: TBitBtn
      Left = 362
      Top = 44
      TabOrder = 6
    end
    object dbeXm: TDBEdit [18]
      Left = 276
      Top = 138
      Width = 110
      Height = 20
      Color = clSilver
      DataField = 'D_XM'
      DataSource = dsWork
      ReadOnly = True
      TabOrder = 9
    end
    object dbeLxr: TDBEdit [19]
      Left = 397
      Top = 138
      Width = 110
      Height = 20
      Color = clSilver
      DataField = 'D_LXR'
      DataSource = dsWork
      ReadOnly = True
      TabOrder = 10
    end
    object dbeDwmc: TDBEdit [20]
      Left = 28
      Top = 178
      Width = 235
      Height = 20
      Color = clSilver
      DataField = 'D_DWMC'
      DataSource = dsWork
      ReadOnly = True
      TabOrder = 11
    end
    object dbeRq: TDBEdit [21]
      Left = 27
      Top = 219
      Width = 110
      Height = 20
      DataField = 'D_YDRQ'
      DataSource = dsWork
      TabOrder = 15
    end
    object dbeSj: TDBEdit [22]
      Left = 153
      Top = 219
      Width = 110
      Height = 20
      DataField = 'D_YDSJ'
      DataSource = dsWork
      TabOrder = 16
    end
    inherited DBNavPlus2: TDBNavPlus
      Top = 71
      Hints.Strings = ()
      TabOrder = 2
    end
    object dbeFkfs: TDBEdit [24]
      Left = 276
      Top = 177
      Width = 110
      Height = 20
      Color = clSilver
      DataField = 'D_FKFS'
      DataSource = dsWork
      ReadOnly = True
      TabOrder = 12
    end
    inherited lblState: TStaticText
      TabOrder = 0
    end
    object dbeYdbh: TDBEdit
      Left = 28
      Top = 139
      Width = 110
      Height = 20
      Color = clSilver
      DataField = 'D_YDBH'
      DataSource = dsWork
      ReadOnly = True
      TabOrder = 7
    end
    object dbeCzyxm: TDBEdit
      Left = 153
      Top = 139
      Width = 110
      Height = 20
      Color = clSilver
      DataField = 'D_CZYXM'
      DataSource = dsWork
      ReadOnly = True
      TabOrder = 8
    end
    object dbeYfje: TDBEdit
      Left = 396
      Top = 177
      Width = 110
      Height = 20
      Color = clSilver
      DataField = 'D_YFJE'
      DataSource = dsWork
      ReadOnly = True
      TabOrder = 13
    end
    object dbeJe: TDBEdit
      Left = 396
      Top = 219
      Width = 110
      Height = 20
      Color = clSkyBlue
      DataField = 'D_JE'
      DataSource = dsWork
      ReadOnly = True
      TabOrder = 14
    end
    object btnDr: TBitBtn
      Left = 437
      Top = 44
      Width = 75
      Height = 25
      Caption = #23548#20837'(I)'
      TabOrder = 17
      OnClick = btnDrClick
      NumGlyphs = 2
    end
  end
  inherited Panel2: TPanel
    Top = 250
    Height = 182
    inherited Bevel1: TBevel
      Height = 162
    end
    object dbgYdd: TDBGrid
      Left = 10
      Top = 10
      Width = 522
      Height = 162
      Align = alClient
      DataSource = dsYdd
      TabOrder = 0
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnColEnter = dbgYddColEnter
      Columns = <
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_XFMC'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = #39044#23450#31867#21035
          Width = 60
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_XMMC'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = #39044#23450#39033#30446
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_SL'
          Title.Alignment = taCenter
          Title.Caption = #25968#37327
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_DJ'
          Title.Alignment = taCenter
          Title.Caption = #21333#20215
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_JE'
          Title.Alignment = taCenter
          Title.Caption = #37329#39069
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_BZ'
          Title.Alignment = taCenter
          Title.Caption = #22791#27880
          Visible = True
        end>
    end
  end
  inherited Panel3: TPanel
    Top = 432
    object btnYdcx: TBitBtn
      Left = 10
      Top = 8
      Width = 75
      Height = 25
      Caption = #26597#35810'(&Q)'
      TabOrder = 3
      OnClick = btnYdcxClick
      NumGlyphs = 2
    end
  end
  inherited qryWork: TQuery
    BeforeOpen = qryWorkBeforeOpen
    BeforeClose = qryWorkBeforeClose
    BeforeInsert = qryWorkBeforeInsert
    BeforeEdit = qryWorkBeforeEdit
    BeforePost = qryWorkBeforePost
    AfterPost = qryWorkAfterPost
    BeforeCancel = qryWorkBeforeCancel
    AfterCancel = qryWorkAfterCancel
    AfterDelete = qryWorkAfterDelete
    OnNewRecord = qryWorkNewRecord
    DatabaseName = 'LFHOTELUSER'
    RequestLive = True
    SQL.Strings = (
      'select * from YDD where (D_HH=0) and (D_RZ="1")')
    object qryWorkD_YDBH: TStringField
      FieldName = 'D_YDBH'
      Origin = 'LFHOTELUSER."YDD.DB".D_YDBH'
      Size = 12
    end
    object qryWorkD_HH: TIntegerField
      FieldName = 'D_HH'
      Origin = 'LFHOTELUSER."YDD.DB".D_HH'
    end
    object qryWorkD_KRBH: TStringField
      FieldName = 'D_KRBH'
      Origin = 'LFHOTELUSER."YDD.DB".D_KRBH'
      Size = 12
    end
    object qryWorkD_YDRQ: TDateField
      FieldName = 'D_YDRQ'
      Origin = 'LFHOTELUSER."YDD.DB".D_YDRQ'
      Required = True
      OnValidate = qryWorkD_YDRQValidate
      EditMask = '!0000/99/99;1; '
    end
    object qryWorkD_YDSJ: TTimeField
      FieldName = 'D_YDSJ'
      Origin = 'LFHOTELUSER."YDD.DB".D_YDSJ'
      Required = True
      EditMask = '!90:00;1; '
    end
    object qryWorkD_XFBH: TStringField
      FieldName = 'D_XFBH'
      Origin = 'LFHOTELUSER."YDD.DB".D_XFBH'
      Size = 5
    end
    object qryWorkD_XMMC: TStringField
      FieldName = 'D_XMMC'
      Origin = 'LFHOTELUSER."YDD.DB".D_XMMC'
      Size = 10
    end
    object qryWorkD_SL: TFloatField
      FieldName = 'D_SL'
      Origin = 'LFHOTELUSER."YDD.DB".D_SL'
    end
    object qryWorkD_DJ: TCurrencyField
      FieldName = 'D_DJ'
      Origin = 'LFHOTELUSER."YDD.DB".D_DJ'
    end
    object qryWorkD_JE: TCurrencyField
      FieldName = 'D_JE'
      Origin = 'LFHOTELUSER."YDD.DB".D_JE'
    end
    object qryWorkD_RZ: TStringField
      FieldName = 'D_RZ'
      Origin = 'LFHOTELUSER."YDD.DB".D_RZ'
      Size = 1
    end
    object qryWorkD_CZYXM: TStringField
      FieldName = 'D_CZYXM'
      Origin = 'LFHOTELUSER."YDD.DB".D_CZYXM'
      Size = 8
    end
    object qryWorkD_BZ: TStringField
      FieldName = 'D_BZ'
      Origin = 'LFHOTELUSER."YDD.DB".D_BZ'
    end
    object qryWorkD_XM: TStringField
      FieldKind = fkLookup
      FieldName = 'D_XM'
      LookupDataSet = tblYdxx
      LookupKeyFields = 'D_KRBH'
      LookupResultField = 'D_XM'
      KeyFields = 'D_KRBH'
      Lookup = True
    end
    object qryWorkD_LXR: TStringField
      FieldKind = fkLookup
      FieldName = 'D_LXR'
      LookupDataSet = tblYdxx
      LookupKeyFields = 'D_KRBH'
      LookupResultField = 'D_LXR'
      KeyFields = 'D_KRBH'
      Lookup = True
    end
    object qryWorkD_DWMC: TStringField
      FieldKind = fkLookup
      FieldName = 'D_DWMC'
      LookupDataSet = tblYdxx
      LookupKeyFields = 'D_KRBH'
      LookupResultField = 'D_DWMC'
      KeyFields = 'D_KRBH'
      Lookup = True
    end
    object qryWorkD_YFFS: TStringField
      FieldKind = fkLookup
      FieldName = 'D_FKFS'
      LookupDataSet = tblYdxx
      LookupKeyFields = 'D_KRBH'
      LookupResultField = 'D_FKFS'
      KeyFields = 'D_KRBH'
      Lookup = True
    end
    object qryWorkD_YFJE: TCurrencyField
      FieldKind = fkLookup
      FieldName = 'D_YFJE'
      LookupDataSet = tblYdxx
      LookupKeyFields = 'D_KRBH'
      LookupResultField = 'D_YFJE'
      KeyFields = 'D_KRBH'
      Lookup = True
    end
  end
  object dsYdd: TDataSource
    DataSet = tblYdd
    Left = 336
    Top = 312
  end
  object tblYdxx: TTable
    Active = True
    DatabaseName = 'LFHOTELUSER'
    TableName = 'YDXX.db'
    Left = 360
    Top = 8
  end
  object qryMaxHh: TQuery
    DatabaseName = 'LFHOTELUSER'
    DataSource = dsWork
    SQL.Strings = (
      'select max(D_HH) from YDD where (D_YDBH=:D_YDBH) and (D_HH<>0)')
    Left = 376
    Top = 312
    ParamData = <
      item
        DataType = ftString
        Name = 'D_YDBH'
        ParamType = ptUnknown
        Size = 13
      end>
  end
  object tblYdd: TTable
    CachedUpdates = True
    BeforeInsert = tblYddBeforeEdit
    BeforeEdit = tblYddBeforeEdit
    BeforePost = tblYddBeforePost
    AfterPost = tblYddAfterPost
    BeforeDelete = tblYddBeforeEdit
    OnNewRecord = tblYddNewRecord
    DatabaseName = 'LFHOTELUSER'
    Filter = 'D_HH<>0'
    Filtered = True
    IndexFieldNames = 'D_YDBH'
    MasterFields = 'D_YDBH'
    MasterSource = dsWork
    TableName = 'YDD.db'
    Left = 304
    Top = 312
    object tblYddD_YDBH: TStringField
      FieldName = 'D_YDBH'
      Size = 12
    end
    object tblYddD_HH: TIntegerField
      FieldName = 'D_HH'
    end
    object tblYddD_KRBH: TStringField
      FieldName = 'D_KRBH'
      Size = 12
    end
    object tblYddD_YDRQ: TDateField
      FieldName = 'D_YDRQ'
    end
    object tblYddD_YDSJ: TTimeField
      FieldName = 'D_YDSJ'
    end
    object tblYddD_XFBH: TStringField
      FieldName = 'D_XFBH'
      Size = 5
    end
    object tblYddD_XMMC: TStringField
      FieldName = 'D_XMMC'
      Size = 10
    end
    object tblYddD_SL: TFloatField
      FieldName = 'D_SL'
    end
    object tblYddD_DJ: TCurrencyField
      FieldName = 'D_DJ'
    end
    object tblYddD_JE: TCurrencyField
      FieldName = 'D_JE'
      Required = True
    end
    object tblYddD_RZ: TStringField
      FieldName = 'D_RZ'
      Size = 1
    end
    object tblYddD_CZYXM: TStringField
      FieldName = 'D_CZYXM'
      Size = 8
    end
    object tblYddD_BZ: TStringField
      FieldName = 'D_BZ'
    end
    object tblYddD_XFMC: TStringField
      FieldKind = fkLookup
      FieldName = 'D_XFMC'
      LookupDataSet = HotelData.tblXFDM
      LookupKeyFields = 'D_XFBH'
      LookupResultField = 'D_XFMC'
      KeyFields = 'D_XFBH'
      Lookup = True
    end
  end
end
