inherited frmShopView: TfrmShopView
  Left = -4
  Top = -4
  Width = 1032
  Height = 746
  ActiveControl = eShopCD
  BorderIcons = [biSystemMenu]
  Caption = #39184#21381#20449#24687#31649#29702
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar1: TToolBar
    Width = 1024
    Height = 38
    inherited tbFindData: TToolButton
      Visible = False
    end
    inherited ToolButton1: TToolButton
      Wrap = False
      Visible = False
    end
    inherited ToolButton2: TToolButton
      Left = 408
      Top = 0
      Visible = False
    end
    inherited tbConfirm: TToolButton
      Left = 476
      Top = 0
      Visible = False
    end
    inherited tbExport: TToolButton
      Left = 544
      Top = 0
      Visible = False
    end
    inherited tbCancel: TToolButton
      Left = 612
      Top = 0
    end
    inherited ToolButton6: TToolButton
      Left = 680
      Top = 0
    end
    inherited tbExit: TToolButton
      Left = 688
      Top = 0
    end
  end
  inherited grdList: TdxDBGrid
    Top = 237
    Width = 1024
    Height = 482
    Filter.Criteria = {00000000}
    OptionsView = [edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
    object grdListI_SHOP_CD: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 72
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_SHOP_CD'
    end
    object grdListI_SHOP_NAME: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 146
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_SHOP_NAME'
    end
    object grdListI_COMPANY_NAME: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 136
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_COMPANY_NAME'
    end
    object grdListI_SHOP_FULL_NAME: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 120
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_SHOP_FULL_NAME'
    end
    object grdListI_IS_QUCIK: TdxDBGridCheckColumn
      HeaderAlignment = taCenter
      Width = 63
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_IS_QUCIK'
      ValueChecked = 'True'
      ValueGrayed = 'True'
      ValueUnchecked = 'False'
      DisplayUnChecked = 'False'
      DisplayNull = 'False'
    end
    object grdListI_SHOP_TYPE: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 77
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_SHOP_TYPE'
    end
    object grdListI_AREA_TRADE: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 52
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_AREA_TRADE'
    end
    object grdListI_TRADE_TYPE: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 71
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_TRADE_TYPE'
    end
    object grdListI_CITY: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 79
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_CITY'
    end
    object grdListI_CITY_TYPE: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 83
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_CITY_TYPE'
    end
    object grdListI_SHOP_ITEM_CD: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Visible = False
      Width = 104
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_SHOP_ITEM_CD'
    end
    object grdListI_SHOP_ADDRESS: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 207
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_SHOP_ADDRESS'
    end
    object grdListI_SHOP_TEL: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 120
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_SHOP_TEL'
    end
    object grdListI_SHOP_START_DATE: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 120
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_SHOP_START_DATE'
    end
    object grdListI_SHOP_CONNECT_MAN: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 120
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_SHOP_CONNECT_MAN'
    end
  end
  object Panel1: TPanel [2]
    Left = 0
    Top = 38
    Width = 1024
    Height = 199
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 2
    object Label1: TLabel
      Left = 12
      Top = 8
      Width = 26
      Height = 13
      Caption = #32534#21495
    end
    object Label2: TLabel
      Left = 112
      Top = 8
      Width = 26
      Height = 13
      Caption = #21517#31216
    end
    object Label3: TLabel
      Left = 300
      Top = 8
      Width = 52
      Height = 13
      Caption = #20844#21496#21517#31216
    end
    object Label4: TLabel
      Left = 548
      Top = 4
      Width = 52
      Height = 13
      Caption = #39184#21381#20840#31216
    end
    object Label5: TLabel
      Left = 260
      Top = 54
      Width = 26
      Height = 13
      Caption = #19994#24577
    end
    object Label6: TLabel
      Left = 12
      Top = 54
      Width = 52
      Height = 13
      Caption = #39184#21381#31867#22411
    end
    object Label7: TLabel
      Left = 136
      Top = 54
      Width = 52
      Height = 13
      Caption = #32463#33829#26041#24335
    end
    object Label8: TLabel
      Left = 388
      Top = 54
      Width = 26
      Height = 13
      Caption = #22478#24066
    end
    object Label9: TLabel
      Left = 516
      Top = 54
      Width = 52
      Height = 13
      Caption = #22478#24066#31867#22411
    end
    object Label10: TLabel
      Left = 8
      Top = 98
      Width = 26
      Height = 13
      Caption = #22320#22336
    end
    object Label11: TLabel
      Left = 386
      Top = 98
      Width = 26
      Height = 13
      Caption = #30005#35805
    end
    object Label12: TLabel
      Left = 512
      Top = 98
      Width = 39
      Height = 13
      Caption = #32852#31995#20154
    end
    object Label13: TLabel
      Left = 8
      Top = 145
      Width = 52
      Height = 13
      Caption = #24320#22987#26085#26399
    end
    object eShopCD: TdxEdit
      Left = 8
      Top = 24
      Width = 85
      Style.BorderStyle = xbsSingle
      TabOrder = 0
      MaxLength = 4
      StoredValues = 2
    end
    object eShopName: TdxEdit
      Left = 108
      Top = 24
      Width = 173
      Style.BorderStyle = xbsSingle
      TabOrder = 1
      MaxLength = 30
      StoredValues = 2
    end
    object eComName: TdxEdit
      Left = 296
      Top = 24
      Width = 233
      Style.BorderStyle = xbsSingle
      TabOrder = 2
      MaxLength = 30
      StoredValues = 2
    end
    object eShopFullName: TdxEdit
      Left = 544
      Top = 24
      Width = 245
      Style.BorderStyle = xbsSingle
      TabOrder = 3
    end
    object eShopType: TdxEdit
      Left = 8
      Top = 70
      Width = 121
      Style.BorderStyle = xbsSingle
      TabOrder = 4
    end
    object eTradeType: TdxEdit
      Left = 132
      Top = 70
      Width = 121
      Style.BorderStyle = xbsSingle
      TabOrder = 5
    end
    object eAreaTrade: TdxEdit
      Left = 256
      Top = 70
      Width = 121
      Style.BorderStyle = xbsSingle
      TabOrder = 6
    end
    object eCity: TdxEdit
      Left = 384
      Top = 70
      Width = 121
      Style.BorderStyle = xbsSingle
      TabOrder = 7
    end
    object eCityType: TdxEdit
      Left = 512
      Top = 70
      Width = 121
      Style.BorderStyle = xbsSingle
      TabOrder = 8
    end
    object eAddress: TdxEdit
      Left = 8
      Top = 114
      Width = 365
      Style.BorderStyle = xbsSingle
      TabOrder = 9
    end
    object eTel: TdxEdit
      Left = 386
      Top = 114
      Width = 121
      Style.BorderStyle = xbsSingle
      TabOrder = 10
    end
    object eConnectMan: TdxEdit
      Left = 512
      Top = 114
      Width = 121
      Style.BorderStyle = xbsSingle
      TabOrder = 11
    end
    object eStartDate: TdxDateEdit
      Left = 8
      Top = 161
      Width = 120
      Style.BorderStyle = xbsSingle
      TabOrder = 12
      Date = -700000
      UseEditMask = True
      StoredValues = 4
    end
    object chbIsQuick: TdxCheckEdit
      Left = 140
      Top = 160
      Width = 81
      Style.BorderStyle = xbsSingle
      TabOrder = 13
      Caption = #26159'/'#21542#39184#21381
    end
  end
  inherited ImageList: TImageList
    Left = 488
    Top = 532
  end
  inherited ActionList1: TActionList
    Left = 460
    Top = 528
  end
  inherited Viewd: TDataSource
    Left = 376
    Top = 516
  end
  inherited Viewq: TCSADOQuery
    BeforePost = ViewqBeforePost
    AfterScroll = ViewqAfterScroll
    SQL.Strings = (
      '')
    Left = 376
    Top = 488
    object ViewqI_SHOP_CD: TStringField
      DisplayLabel = #32534#21495
      FieldName = 'I_SHOP_CD'
      Size = 10
    end
    object ViewqI_SHOP_NAME: TStringField
      DisplayLabel = #21517#31216
      FieldName = 'I_SHOP_NAME'
      Size = 100
    end
    object ViewqI_COMPANY_NAME: TStringField
      DisplayLabel = #20844#21496#21517#31216
      FieldName = 'I_COMPANY_NAME'
      Size = 100
    end
    object ViewqI_SHOP_FULL_NAME: TStringField
      DisplayLabel = #39184#21381#20840#31216
      FieldName = 'I_SHOP_FULL_NAME'
      Size = 200
    end
    object ViewqI_SHOP_ITEM_CD: TStringField
      FieldName = 'I_SHOP_ITEM_CD'
      Size = 2
    end
    object ViewqI_SHOP_ADDRESS: TStringField
      DisplayLabel = #22320#22336
      FieldName = 'I_SHOP_ADDRESS'
      Size = 200
    end
    object ViewqI_SHOP_TEL: TStringField
      DisplayLabel = #30005#35805
      FieldName = 'I_SHOP_TEL'
    end
    object ViewqI_SHOP_START_DATE: TStringField
      DisplayLabel = #24320#22987#26085#26399
      FieldName = 'I_SHOP_START_DATE'
      Size = 10
    end
    object ViewqI_SHOP_CONNECT_MAN: TStringField
      DisplayLabel = #32852#31995#20154
      FieldName = 'I_SHOP_CONNECT_MAN'
      Size = 30
    end
    object ViewqI_SHOP_TYPE: TStringField
      DisplayLabel = #39184#21381#31867#22411
      FieldName = 'I_SHOP_TYPE'
      Size = 10
    end
    object ViewqI_TRADE_TYPE: TStringField
      DisplayLabel = #32463#33829#26041#24335
      FieldName = 'I_TRADE_TYPE'
      Size = 10
    end
    object ViewqI_CITY: TStringField
      DisplayLabel = #22478#24066
      FieldName = 'I_CITY'
      Size = 10
    end
    object ViewqI_CITY_TYPE: TStringField
      DisplayLabel = #22478#24066#31867#22411
      FieldName = 'I_CITY_TYPE'
      Size = 10
    end
    object ViewqI_IS_QUCIK: TBooleanField
      DisplayLabel = #26159#21542#39184#21381
      FieldName = 'I_IS_QUCIK'
    end
    object ViewqI_AREA_TRADE: TStringField
      DisplayLabel = #19994#24577
      FieldName = 'I_AREA_TRADE'
      Size = 10
    end
  end
end
