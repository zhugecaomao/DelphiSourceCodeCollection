inherited frmInOutOriginal: TfrmInOutOriginal
  Left = 116
  Top = 201
  Height = 456
  Caption = #36827'/'#36864#36135#21333#22788#29702
  PixelsPerInch = 96
  TextHeight = 13
  inherited grdList: TdxDBGrid
    Top = 137
    Height = 292
    KeyField = 'I_ORIGINAL_CD'
    DataSource = Originald
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoSmartRefresh, edgoSmartReload, edgoUseBookmarks]
    object grdListI_ORIGINAL_CD: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 77
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_ORIGINAL_CD'
    end
    object grdListI_ORIGINAL_NAME: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 120
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_ORIGINAL_NAME'
    end
    object grdListI_PROPERTY_CODE: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 120
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_PROPERTY_CODE'
    end
    object grdListI_UNIT: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 154
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_UNIT'
    end
    object grdListI_QTY1: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 65
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_QTY1'
    end
    object grdListI_QTY2: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 63
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_QTY2'
    end
    object grdListI_QTY3: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 71
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_QTY3'
    end
    object grdListI_COUNT: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 120
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_COUNT'
    end
  end
  object Panel1: TPanel [2]
    Left = 0
    Top = 74
    Width = 688
    Height = 63
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
      Caption = '1-'#36827#36135'  2-'#36864#36135
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
      Width = 52
      Height = 13
      Caption = #20379#36135#21830#65306
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
    end
    object eFactory: TdxPickEdit
      Left = 384
      Top = 32
      Width = 269
      Style.BorderStyle = xbsSingle
      TabOrder = 3
      MaxLength = 6
      StoredValues = 2
    end
  end
  inherited ActionList1: TActionList
    Left = 312
  end
  object Originalq: TCSADOQuery
    Parameters = <>
    Left = 252
    Top = 184
    object OriginalqI_ORIGINAL_CD: TStringField
      DisplayLabel = #21697#21495
      FieldName = 'I_ORIGINAL_CD'
      ReadOnly = True
      Size = 6
    end
    object OriginalqI_ORIGINAL_NAME: TStringField
      DisplayLabel = #21697#21517
      FieldName = 'I_ORIGINAL_NAME'
      ReadOnly = True
      Size = 30
    end
    object OriginalqI_PROPERTY_CODE: TStringField
      DisplayLabel = #23646#24615#30721
      FieldName = 'I_PROPERTY_CODE'
      ReadOnly = True
      Size = 4
    end
    object OriginalqI_UNIT: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'I_UNIT'
      ReadOnly = True
      Size = 100
    end
    object OriginalqI_QTY1: TIntegerField
      DisplayLabel = #22806#21253#25968#37327
      FieldName = 'I_QTY1'
    end
    object OriginalqI_QTY2: TIntegerField
      DisplayLabel = #20869#21253#25968#37327
      FieldName = 'I_QTY2'
    end
    object OriginalqI_QTY3: TIntegerField
      DisplayLabel = #25955#35013#25968#37327
      FieldName = 'I_QTY3'
    end
    object OriginalqI_COUNT: TIntegerField
      DisplayLabel = #24635#25968#37327
      FieldName = 'I_COUNT'
      ReadOnly = True
    end
  end
  object Originald: TDataSource
    DataSet = Originalq
    Left = 252
    Top = 212
  end
  object dxMemData1: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 280
    Top = 184
  end
end
