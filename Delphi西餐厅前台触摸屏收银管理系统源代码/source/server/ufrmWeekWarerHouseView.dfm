inherited frmWeekWarerHouseView: TfrmWeekWarerHouseView
  Left = 200
  Top = 203
  Caption = #21407#26009#26085#30424#28857
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar1: TToolBar
    inherited tbNew: TToolButton
      Visible = False
    end
    inherited tbDel: TToolButton
      Visible = False
    end
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
    Top = 129
    Height = 324
    KeyField = 'RecId'
    ShowGroupPanel = True
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoSmartRefresh, edgoSmartReload, edgoUseBookmarks]
    object grdListRecId: TdxDBGridColumn
      Visible = False
      Width = 73
      BandIndex = 0
      RowIndex = 0
      FieldName = 'RecId'
    end
    object grdListI_DATE: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Sorted = csUp
      Visible = False
      Width = 73
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_DATE'
      GroupIndex = 0
    end
    object grdListI_ORIGINAL_CD: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 77
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_ORIGINAL_CD'
    end
    object grdListI_ORIGINAL_NAME: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 167
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_ORIGINAL_NAME'
    end
    object grdListI_UNIT: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 74
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_UNIT'
    end
    object grdListI_YESTERDAY_QTY: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 84
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_YESTERDAY_QTY'
    end
    object grdListI_IN_QTY: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 74
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_IN_QTY'
    end
    object grdListI_OUT_QTY: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 74
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_OUT_QTY'
    end
    object grdListI_ALLOC_IN_QTY: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 74
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_ALLOC_IN_QTY'
    end
    object grdListI_ALLOC_OUT_QTY: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 74
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_ALLOC_OUT_QTY'
    end
    object grdListI_LOST_QTY: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 74
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_LOST_QTY'
    end
    object grdListI_TODAY_QTY: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 84
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_TODAY_QTY'
    end
    object grdListI_CALC_USE_QTY: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 84
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_CALC_USE_QTY'
    end
    object grdListI_REAL_USE_QTY: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 84
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_REAL_USE_QTY'
    end
    object grdListI_DIFFERENCE_QTY: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 74
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_DIFFERENCE_QTY'
    end
    object grdListI_DIFFERENCE_COUNT_QTY: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 74
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_DIFFERENCE_COUNT_QTY'
    end
  end
  object Panel1: TPanel [2]
    Left = 0
    Top = 74
    Width = 688
    Height = 55
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 33
      Width = 13
      Height = 13
      Caption = #20174
    end
    object Label2: TLabel
      Left = 148
      Top = 33
      Width = 13
      Height = 13
      Caption = #33267
    end
    object Label3: TLabel
      Left = 8
      Top = 8
      Width = 91
      Height = 13
      Caption = #26368#21518#30424#28857#26085#26399#65306
    end
    object Label7: TLabel
      Left = 8
      Top = 86
      Width = 65
      Height = 13
      Caption = #21407#26009#21333#20301#65306
      Visible = False
    end
    object Label6: TLabel
      Left = 8
      Top = 62
      Width = 65
      Height = 13
      Caption = #21407#26009#21517#31216#65306
      Visible = False
    end
    object Label8: TLabel
      Left = 8
      Top = 111
      Width = 65
      Height = 13
      Caption = #20462#25913#25968#37327#65306
      Visible = False
    end
    object Label4: TLabel
      Left = 304
      Top = 111
      Width = 182
      Height = 13
      Caption = #20462#25913#27492#21407#26009#24403#26085#23454#38469#20351#29992#30340#25968#37327
      Visible = False
    end
    object labState: TLabel
      Left = 448
      Top = 32
      Width = 7
      Height = 13
      Visible = False
    end
    object eStartDate: TdxDateEdit
      Left = 24
      Top = 29
      Width = 116
      Style.BorderStyle = xbsSingle
      TabOrder = 0
      Date = -700000
      UseEditMask = True
      StoredValues = 4
    end
    object eEndDate: TdxDateEdit
      Left = 168
      Top = 29
      Width = 119
      Style.BorderStyle = xbsSingle
      TabOrder = 1
      Date = -700000
      UseEditMask = True
      StoredValues = 4
    end
    object bbtnStart: TBitBtn
      Left = 293
      Top = 28
      Width = 75
      Height = 22
      Caption = #24320#22987#30424#28857
      Enabled = False
      TabOrder = 2
      OnClick = bbtnStartClick
    end
    object eLastDate: TdxDateEdit
      Left = 96
      Top = 4
      Width = 120
      Enabled = False
      Style.BorderStyle = xbsSingle
      TabOrder = 3
      Date = -700000
      UseEditMask = True
      StoredValues = 4
    end
    object eUnit: TdxEdit
      Left = 68
      Top = 82
      Width = 149
      Enabled = False
      Style.BorderStyle = xbsSingle
      TabOrder = 4
      Visible = False
    end
    object eRealUseQty: TdxEdit
      Left = 68
      Top = 107
      Width = 150
      Style.BorderStyle = xbsSingle
      TabOrder = 5
      Text = '0'
      Visible = False
    end
    object bbtnEditQty: TBitBtn
      Left = 221
      Top = 105
      Width = 75
      Height = 22
      Caption = #20462#25913#25968#37327
      Enabled = False
      TabOrder = 6
      Visible = False
    end
    object eOriginal: TdxEdit
      Left = 68
      Top = 56
      Width = 150
      Enabled = False
      Style.BorderStyle = xbsSingle
      TabOrder = 7
      Visible = False
    end
    object chbAuto: TCheckBox
      Left = 372
      Top = 30
      Width = 97
      Height = 17
      Caption = #33258#21160#20445#23384
      Enabled = False
      TabOrder = 8
      Visible = False
    end
  end
  inherited ImageList: TImageList
    Left = 340
    Top = 264
  end
  inherited ActionList1: TActionList
    Left = 312
    Top = 264
  end
  inherited Viewd: TDataSource
    DataSet = memView
    Left = 228
    Top = 292
  end
  inherited Viewq: TCSADOQuery
    CacheSize = 1
    LockType = ltBatchOptimistic
    SQL.Strings = ()
    Left = 228
    Top = 264
    object ViewqI_ORIGINAL_CD: TStringField
      DisplayLabel = #21697#21495
      FieldName = 'I_ORIGINAL_CD'
      Size = 6
    end
    object ViewqI_ORIGINAL_NAME: TStringField
      DisplayLabel = #21517#31216
      FieldName = 'I_ORIGINAL_NAME'
      Size = 30
    end
    object ViewqI_UNIT: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'I_UNIT'
      Size = 10
    end
    object ViewqI_YESTERDAY_QTY: TFloatField
      DisplayLabel = #26152#26085#30424#28857#25968#37327
      FieldName = 'I_YESTERDAY_QTY'
    end
    object ViewqI_IN_QTY: TFloatField
      DisplayLabel = #36827#36135#25968#37327
      FieldName = 'I_IN_QTY'
    end
    object ViewqI_OUT_QTY: TFloatField
      DisplayLabel = #36864#36135#25968#37327
      FieldName = 'I_OUT_QTY'
    end
    object ViewqI_ALLOC_IN_QTY: TFloatField
      DisplayLabel = #25320#20837#25968#37327
      FieldName = 'I_ALLOC_IN_QTY'
    end
    object ViewqI_ALLOC_OUT_QTY: TFloatField
      DisplayLabel = #25320#20986#25968#37327
      FieldName = 'I_ALLOC_OUT_QTY'
    end
    object ViewqI_LOST_QTY: TFloatField
      DisplayLabel = #25439#32791#25968#37327
      FieldName = 'I_LOST_QTY'
    end
    object ViewqI_TODAY_QTY: TFloatField
      DisplayLabel = #20170#26085#30424#28857#25968#37327
      FieldName = 'I_TODAY_QTY'
    end
    object ViewqI_CALC_USE_QTY: TFloatField
      DisplayLabel = #35745#31639#20351#29992#25968#37327
      FieldName = 'I_CALC_USE_QTY'
    end
    object ViewqI_REAL_USE_QTY: TFloatField
      DisplayLabel = #23454#38469#20351#29992#25968#37327
      FieldName = 'I_REAL_USE_QTY'
    end
    object ViewqI_DIFFERENCE_QTY: TFloatField
      DisplayLabel = #24046#24322#25968#37327
      FieldName = 'I_DIFFERENCE_QTY'
    end
    object ViewqI_DIFFERENCE_COUNT_QTY: TFloatField
      DisplayLabel = #24046#24322#32047#35745
      FieldName = 'I_DIFFERENCE_COUNT_QTY'
    end
  end
  inherited grdPrint: TdxComponentPrinter
    Left = 256
    Top = 264
  end
  object memView: TdxMemData
    Indexes = <>
    SortOptions = []
    BeforePost = memViewBeforePost
    Left = 284
    Top = 264
    object memViewI_DATE: TStringField
      DisplayLabel = #26085#26399
      FieldName = 'I_DATE'
      ReadOnly = True
      Size = 10
    end
    object memViewI_ORIGINAL_CD: TStringField
      DisplayLabel = #21697#21495
      FieldName = 'I_ORIGINAL_CD'
      ReadOnly = True
      Size = 6
    end
    object memViewI_ORIGINAL_NAME: TStringField
      DisplayLabel = #21517#31216
      FieldName = 'I_ORIGINAL_NAME'
      ReadOnly = True
      Size = 30
    end
    object memViewI_UNIT: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'I_UNIT'
      ReadOnly = True
      Size = 10
    end
    object memViewI_YESTERDAY_QTY: TFloatField
      DisplayLabel = #26152#26085#30424#28857#25968#37327
      FieldName = 'I_YESTERDAY_QTY'
      ReadOnly = True
    end
    object memViewI_IN_QTY: TFloatField
      DisplayLabel = #36827#36135#25968#37327
      FieldName = 'I_IN_QTY'
      ReadOnly = True
    end
    object memViewI_OUT_QTY: TFloatField
      DisplayLabel = #36864#36135#25968#37327
      FieldName = 'I_OUT_QTY'
      ReadOnly = True
    end
    object memViewI_ALLOC_IN_QTY: TFloatField
      DisplayLabel = #25320#20837#25968#37327
      FieldName = 'I_ALLOC_IN_QTY'
      ReadOnly = True
    end
    object memViewI_ALLOC_OUT_QTY: TFloatField
      DisplayLabel = #25320#20986#25968#37327
      FieldName = 'I_ALLOC_OUT_QTY'
      ReadOnly = True
    end
    object memViewI_LOST_QTY: TFloatField
      DisplayLabel = #25439#32791#25968#37327
      FieldName = 'I_LOST_QTY'
      ReadOnly = True
    end
    object memViewI_TODAY_QTY: TFloatField
      DisplayLabel = #20170#26085#30424#28857#25968#37327
      FieldName = 'I_TODAY_QTY'
    end
    object memViewI_CALC_USE_QTY: TFloatField
      DisplayLabel = #35745#31639#20351#29992#25968#37327
      FieldName = 'I_CALC_USE_QTY'
    end
    object memViewI_REAL_USE_QTY: TFloatField
      DisplayLabel = #23454#38469#20351#29992#25968#37327
      FieldName = 'I_REAL_USE_QTY'
    end
    object memViewI_DIFFERENCE_QTY: TFloatField
      DisplayLabel = #24046#24322#25968#37327
      FieldName = 'I_DIFFERENCE_QTY'
    end
    object memViewI_DIFFERENCE_COUNT_QTY: TFloatField
      DisplayLabel = #24046#24322#32047#35745
      FieldName = 'I_DIFFERENCE_COUNT_QTY'
    end
  end
end
