inherited frmTestSaleView: TfrmTestSaleView
  Left = 186
  Top = 251
  Caption = #25104#21697#27979#35797#22788#29702
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar1: TToolBar
    inherited tbFindData: TToolButton
      Visible = False
    end
    inherited ToolButton1: TToolButton
      Visible = False
    end
    inherited ToolButton2: TToolButton
      Visible = False
    end
    inherited tbConfirm: TToolButton
      Visible = False
    end
  end
  inherited grdList: TdxDBGrid
    Top = 193
    Height = 260
    KeyField = 'RecId'
    DataSource = Lostd
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoSmartRefresh, edgoSmartReload, edgoUseBookmarks]
    OptionsView = [edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
    object grdListRecId: TdxDBGridColumn
      Visible = False
      Width = 65
      BandIndex = 0
      RowIndex = 0
      FieldName = 'RecId'
    end
    object grdListI_SALE_CD: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 102
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
      Width = 68
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_UNIT'
    end
    object grdListI_QTY: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 91
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_QTY'
    end
    object grdListI_DATE: TdxDBGridMaskColumn
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_DATE'
    end
  end
  object Panel1: TPanel [2]
    Left = 0
    Top = 74
    Width = 688
    Height = 119
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 2
    object Label1: TLabel
      Left = 36
      Top = 12
      Width = 39
      Height = 13
      Caption = #26085#26399#65306
    end
    object Label6: TLabel
      Left = 10
      Top = 38
      Width = 65
      Height = 13
      Caption = #25104#21697#36873#25321#65306
    end
    object Label11: TLabel
      Left = 36
      Top = 93
      Width = 39
      Height = 13
      Caption = #25968#37327#65306
    end
    object Label3: TLabel
      Left = 36
      Top = 65
      Width = 39
      Height = 13
      Caption = #21333#20301#65306
    end
    object eDate: TdxDateEdit
      Left = 72
      Top = 8
      Width = 120
      Style.BorderStyle = xbsSingle
      TabOrder = 0
      OnKeyDown = eDateKeyDown
      Date = -700000
      UseEditMask = True
      StoredValues = 4
    end
    object eSale: TdxPickEdit
      Left = 72
      Top = 34
      Width = 257
      Style.BorderStyle = xbsSingle
      TabOrder = 1
      OnKeyDown = eSaleKeyDown
    end
    object eQty: TdxEdit
      Left = 72
      Top = 89
      Width = 121
      Style.BorderStyle = xbsSingle
      TabOrder = 2
      Text = '0'
      OnKeyDown = eQtyKeyDown
      OnKeyPress = eQtyKeyPress
    end
    object eUnit: TdxEdit
      Left = 72
      Top = 61
      Width = 121
      Enabled = False
      Style.BorderStyle = xbsSingle
      TabOrder = 3
      OnKeyPress = eQtyKeyPress
    end
  end
  inherited ActionList1: TActionList
    Top = 212
  end
  object memLost: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 280
    Top = 184
    object memLostI_SALE_CD: TStringField
      DisplayLabel = #21697#21495
      FieldName = 'I_SALE_CD'
      Size = 6
    end
    object memLostI_SALE_NAME: TStringField
      DisplayLabel = #21517#31216
      FieldName = 'I_SALE_NAME'
      Size = 30
    end
    object memLostI_UNIT: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'I_UNIT'
      Size = 2
    end
    object memLostI_QTY: TIntegerField
      DisplayLabel = #25968#37327
      FieldName = 'I_QTY'
    end
    object memLostI_DATE: TStringField
      FieldName = 'I_DATE'
      Size = 10
    end
  end
  object Lostd: TDataSource
    DataSet = memLost
    Left = 280
    Top = 212
  end
end
