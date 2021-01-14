inherited frmAllocSaleView: TfrmAllocSaleView
  Left = 13
  Top = 182
  Width = 1022
  Height = 738
  Caption = #25104#21697#35843#25320#21333#22788#29702
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar1: TToolBar
    Width = 1014
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
    Top = 177
    Width = 1014
    Height = 534
    KeyField = 'RecId'
    DataSource = Allocd
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoSmartRefresh, edgoSmartReload, edgoUseBookmarks]
    OptionsView = [edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
    object grdListRecId: TdxDBGridColumn
      Visible = False
      Width = 109
      BandIndex = 0
      RowIndex = 0
      FieldName = 'RecId'
    end
    object grdListI_SALE_CD: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 96
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_SALE_CD'
    end
    object grdListI_SALE_NAME: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 214
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_SALE_NAME'
    end
    object grdListI_UNIT: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 58
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_UNIT'
    end
    object grdListI_QTY: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 98
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_QTY'
    end
    object grdListI_SHOP_CD: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 188
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_SHOP_CD'
    end
  end
  object Panel1: TPanel [2]
    Left = 0
    Top = 38
    Width = 1014
    Height = 139
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 39
      Height = 13
      Caption = #31867#21035#65306
    end
    object Label2: TLabel
      Left = 88
      Top = 8
      Width = 94
      Height = 13
      Caption = '1-'#25320#20837'  2-'#25320#20986
    end
    object Label3: TLabel
      Left = 8
      Top = 36
      Width = 39
      Height = 13
      Caption = #26085#26399#65306
    end
    object Label4: TLabel
      Left = 184
      Top = 36
      Width = 21
      Height = 13
      Caption = 'NO.'
    end
    object Label5: TLabel
      Left = 336
      Top = 36
      Width = 65
      Height = 13
      Caption = #23545#26041#21333#20301#65306
    end
    object Label6: TLabel
      Left = 8
      Top = 62
      Width = 65
      Height = 13
      Caption = #25104#21697#36873#25321#65306
    end
    object Label7: TLabel
      Left = 8
      Top = 86
      Width = 65
      Height = 13
      Caption = #25104#21697#21333#20301#65306
    end
    object Label8: TLabel
      Left = 34
      Top = 111
      Width = 39
      Height = 13
      Caption = #25968#37327#65306
    end
    object eFlag: TdxEdit
      Left = 40
      Top = 4
      Width = 41
      Style.BorderStyle = xbsSingle
      TabOrder = 0
      OnKeyPress = eFlagKeyPress
      MaxLength = 1
      StoredValues = 2
    end
    object eDate: TdxDateEdit
      Left = 40
      Top = 32
      Width = 141
      Style.BorderStyle = xbsSingle
      TabOrder = 1
      OnKeyDown = eDateKeyDown
      Date = -700000
      UseEditMask = True
      StoredValues = 4
    end
    object eNo: TdxEdit
      Left = 208
      Top = 32
      Width = 121
      Style.BorderStyle = xbsSingle
      TabOrder = 2
      OnKeyDown = eNoKeyDown
    end
    object eShop: TdxPickEdit
      Left = 396
      Top = 32
      Width = 269
      Style.BorderStyle = xbsSingle
      TabOrder = 3
      OnKeyPress = eShopKeyPress
      MaxLength = 6
      StoredValues = 2
    end
    object eSale: TdxPickEdit
      Left = 68
      Top = 58
      Width = 257
      Style.BorderStyle = xbsSingle
      TabOrder = 4
      OnChange = eSaleChange
    end
    object eUnit: TdxEdit
      Left = 68
      Top = 82
      Width = 150
      Enabled = False
      Style.BorderStyle = xbsSingle
      TabOrder = 5
    end
    object eQty: TdxEdit
      Left = 68
      Top = 107
      Width = 150
      Style.BorderStyle = xbsSingle
      TabOrder = 6
      Text = '0'
      OnKeyDown = eQtyKeyDown
      OnKeyPress = eQtyKeyPress
    end
  end
  inherited Viewq: TCSADOQuery
    object ViewqI_SALE_CD: TStringField
      FieldName = 'I_SALE_CD'
      Size = 6
    end
    object ViewqI_SALE_NAME: TStringField
      FieldName = 'I_SALE_NAME'
      Size = 30
    end
    object ViewqI_UNIT: TStringField
      FieldName = 'I_UNIT'
      Size = 2
    end
  end
  object memAlloc: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 280
    Top = 184
    object memAllocI_SALE_CD: TStringField
      DisplayLabel = #21697#21495
      FieldName = 'I_SALE_CD'
      Size = 6
    end
    object memAllocI_SALE_NAME: TStringField
      DisplayLabel = #21517#31216
      FieldName = 'I_SALE_NAME'
      Size = 30
    end
    object memAllocI_UNIT: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'I_UNIT'
      Size = 2
    end
    object memAllocI_QTY: TIntegerField
      DisplayLabel = #25968#37327
      FieldName = 'I_QTY'
    end
    object memAllocI_SHOP_CD: TStringField
      DisplayLabel = #23545#26041#21333#20301
      FieldName = 'I_SHOP_CD'
      Size = 10
    end
  end
  object Allocd: TDataSource
    AutoEdit = False
    DataSet = memAlloc
    Left = 280
    Top = 212
  end
end
