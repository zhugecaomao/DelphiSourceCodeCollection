inherited frmSaleStructView: TfrmSaleStructView
  Left = 221
  Top = 176
  Caption = #25104#21697#37197#26041#31649#29702
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
    Top = 245
    Height = 208
    KeyField = 'RecId'
    DataSource = Structd
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoSmartRefresh, edgoSmartReload, edgoUseBookmarks]
    OptionsView = [edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
    object grdListRecId: TdxDBGridColumn
      Visible = False
      Width = 84
      BandIndex = 0
      RowIndex = 0
      FieldName = 'RecId'
    end
    object grdListI_SALE_CD: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 101
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_SALE_CD'
    end
    object grdListI_SALE_NAME: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 161
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_SALE_NAME'
    end
    object grdListI_ORIGINAL_CD: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 80
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_ORIGINAL_CD'
    end
    object grdListI_ORIGINAL_NAME: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 214
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_ORIGINAL_NAME'
    end
    object grdListI_UNIT: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 70
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_UNIT'
    end
    object grdListI_QTY: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 159
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_QTY'
    end
    object grdListI_RANGE: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 74
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_RANGE'
    end
  end
  object Panel1: TPanel [2]
    Left = 0
    Top = 74
    Width = 688
    Height = 171
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 2
    object Label6: TLabel
      Left = 10
      Top = 14
      Width = 65
      Height = 13
      Caption = #25104#21697#36873#25321#65306
    end
    object Label3: TLabel
      Left = 36
      Top = 39
      Width = 39
      Height = 13
      Caption = #21333#20301#65306
    end
    object Label7: TLabel
      Left = 10
      Top = 90
      Width = 65
      Height = 13
      Caption = #31995#25968#21333#20301#65306
    end
    object Label1: TLabel
      Left = 10
      Top = 64
      Width = 65
      Height = 13
      Caption = #21407#26009#36873#25321#65306
    end
    object Label11: TLabel
      Left = 36
      Top = 117
      Width = 39
      Height = 13
      Caption = #25968#37327#65306
    end
    object Label2: TLabel
      Left = 10
      Top = 145
      Width = 65
      Height = 13
      Caption = #36866#29992#33539#22260#65306
    end
    object Label4: TLabel
      Left = 198
      Top = 145
      Width = 134
      Height = 13
      Caption = '0-'#20840#37096' 1-'#20869#29992' 2-'#22806#24102
    end
    object eSale: TdxPickEdit
      Left = 72
      Top = 10
      Width = 257
      Style.BorderStyle = xbsSingle
      TabOrder = 0
      OnKeyDown = eSaleKeyDown
    end
    object eUnit: TdxEdit
      Left = 72
      Top = 35
      Width = 121
      Enabled = False
      Style.BorderStyle = xbsSingle
      TabOrder = 1
    end
    object eOriginal: TdxPickEdit
      Left = 72
      Top = 60
      Width = 257
      Style.BorderStyle = xbsSingle
      TabOrder = 2
      OnChange = eOriginalChange
    end
    object eUnit3: TdxEdit
      Left = 72
      Top = 86
      Width = 121
      Enabled = False
      Style.BorderStyle = xbsSingle
      TabOrder = 3
    end
    object eQty: TdxEdit
      Left = 72
      Top = 113
      Width = 121
      Style.BorderStyle = xbsSingle
      TabOrder = 4
      Text = '0'
      OnKeyPress = eQtyKeyPress
    end
    object eRange: TdxPickEdit
      Left = 72
      Top = 140
      Width = 121
      Style.BorderStyle = xbsSingle
      TabOrder = 5
      OnKeyDown = eRangeKeyDown
      OnKeyPress = eRangeKeyPress
      Text = '0-'#20840#37096
      Items.Strings = (
        '0-'#20840#37096
        '1-'#20869#29992
        '2-'#22806#24102)
    end
  end
  inherited ImageList: TImageList
    Left = 544
    Top = 464
  end
  inherited ActionList1: TActionList
    Left = 544
    Top = 436
  end
  inherited Viewd: TDataSource
    Left = 460
    Top = 464
  end
  inherited Viewq: TCSADOQuery
    Left = 460
    Top = 436
    object ViewqI_ORIGINAL_CD: TStringField
      DisplayLabel = #21697#21495
      FieldName = 'I_ORIGINAL_CD'
      ReadOnly = True
      Size = 6
    end
    object ViewqI_ORIGINAL_NAME: TStringField
      DisplayLabel = #21697#21517
      FieldName = 'I_ORIGINAL_NAME'
      ReadOnly = True
      Size = 30
    end
    object Viewqi_unit3: TStringField
      FieldName = 'i_unit3'
      Size = 2
    end
    object Viewqi_qty3: TIntegerField
      FieldName = 'i_qty3'
    end
  end
  inherited grdPrint: TdxComponentPrinter
    Left = 488
    Top = 436
  end
  object memStruct: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 516
    Top = 436
    object memStructI_SALE_CD: TStringField
      DisplayLabel = #25104#21697#21697#21495
      FieldName = 'I_SALE_CD'
      Size = 6
    end
    object memStructI_SALE_NAME: TStringField
      DisplayLabel = #25104#21697#21517#31216
      FieldName = 'I_SALE_NAME'
      Size = 30
    end
    object memStructI_ORIGINAL_CD: TStringField
      DisplayLabel = #21407#26009#21697#21495
      FieldName = 'I_ORIGINAL_CD'
      Size = 6
    end
    object memStructI_ORIGINAL_NAME: TStringField
      DisplayLabel = #21407#26009#21517#31216
      FieldName = 'I_ORIGINAL_NAME'
      Size = 30
    end
    object memStructI_UNIT: TStringField
      DisplayLabel = #31995#25968#21333#20301
      FieldName = 'I_UNIT'
      Size = 2
    end
    object memStructI_QTY: TFloatField
      DisplayLabel = #25968#37327
      FieldName = 'I_QTY'
    end
    object memStructI_RANGE: TIntegerField
      DisplayLabel = #36866#21512#33539#22260
      FieldName = 'I_RANGE'
    end
  end
  object Structd: TDataSource
    DataSet = memStruct
    Left = 516
    Top = 464
  end
  object Saleq: TCSADOQuery
    Parameters = <>
    Left = 432
    Top = 436
    object SaleqI_SALE_CD: TStringField
      FieldName = 'I_SALE_CD'
      Size = 6
    end
    object SaleqI_SALE_NAME: TStringField
      FieldName = 'I_SALE_NAME'
      Size = 30
    end
    object SaleqI_UNIT: TStringField
      FieldName = 'I_UNIT'
      Size = 2
    end
  end
end
