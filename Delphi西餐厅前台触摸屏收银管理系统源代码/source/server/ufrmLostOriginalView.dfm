inherited frmLostOriginalView: TfrmLostOriginalView
  Left = 146
  Top = 100
  Width = 1032
  Height = 746
  Caption = #21407#26009#25439#32791#22788#29702
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar1: TToolBar
    Width = 1024
    Height = 38
    inherited tbEdit: TToolButton
      Visible = False
    end
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
    Top = 181
    Width = 1024
    Height = 538
    KeyField = 'RecId'
    DataSource = Lostd
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoSmartRefresh, edgoSmartReload, edgoUseBookmarks]
    OptionsView = [edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
    object grdListRecId: TdxDBGridColumn
      Visible = False
      Width = 57
      BandIndex = 0
      RowIndex = 0
      FieldName = 'RecId'
    end
    object grdListI_ORIGINAL_CD: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 91
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
    object grdListI_PROPERTY_CODE: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 82
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_PROPERTY_CODE'
    end
    object grdListI_UNIT: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 55
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_UNIT'
    end
    object grdListI_QTY: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 74
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_QTY'
    end
    object grdListI_LOST_QTY: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 74
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_LOST_QTY'
    end
    object grdListI_REMARK: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 304
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_REMARK'
    end
    object grdListI_DATE: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Visible = False
      Width = 74
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_DATE'
    end
  end
  object Panel1: TPanel [2]
    Left = 0
    Top = 38
    Width = 1024
    Height = 143
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
      Caption = #21407#26009#36873#25321#65306
    end
    object Label11: TLabel
      Left = 36
      Top = 91
      Width = 39
      Height = 13
      Caption = #25968#37327#65306
    end
    object Label2: TLabel
      Left = 36
      Top = 118
      Width = 39
      Height = 13
      Caption = #21407#22240#65306
    end
    object Label7: TLabel
      Left = 10
      Top = 65
      Width = 65
      Height = 13
      Caption = #21407#26009#21333#20301#65306
    end
    object Label3: TLabel
      Left = 154
      Top = 65
      Width = 65
      Height = 13
      Caption = #25104#26412#25968#37327#65306
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
    object eOriginal: TdxPickEdit
      Left = 72
      Top = 34
      Width = 257
      Style.BorderStyle = xbsSingle
      TabOrder = 1
      OnKeyDown = eOriginalKeyDown
    end
    object eLostQty: TdxEdit
      Left = 72
      Top = 87
      Width = 121
      Style.BorderStyle = xbsSingle
      TabOrder = 2
      OnKeyPress = eLostQtyKeyPress
    end
    object eRemark: TdxEdit
      Left = 72
      Top = 114
      Width = 381
      Style.BorderStyle = xbsSingle
      TabOrder = 3
      OnKeyDown = eRemarkKeyDown
    end
    object eUnit: TdxEdit
      Left = 72
      Top = 61
      Width = 45
      Enabled = False
      Style.BorderStyle = xbsSingle
      TabOrder = 4
    end
    object eQty: TdxEdit
      Left = 212
      Top = 61
      Width = 133
      Enabled = False
      Style.BorderStyle = xbsSingle
      TabOrder = 5
    end
  end
  inherited ImageList: TImageList
    Top = 184
  end
  inherited ActionList1: TActionList
    Top = 184
  end
  inherited Viewq: TCSADOQuery
    object ViewqI_ORIGINAL_CD: TStringField
      FieldName = 'I_ORIGINAL_CD'
      Size = 6
    end
    object ViewqI_ORIGINAL_NAME: TStringField
      FieldName = 'I_ORIGINAL_NAME'
      Size = 30
    end
    object ViewqI_PROPERTY_CODE: TStringField
      FieldName = 'I_PROPERTY_CODE'
      Size = 4
    end
    object ViewqI_UNIT4: TStringField
      FieldName = 'I_UNIT4'
      Size = 10
    end
    object ViewqI_QTY4: TFloatField
      FieldName = 'I_QTY4'
    end
  end
  object LostMem: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 280
    Top = 184
    object LostMemI_ORIGINAL_CD: TStringField
      DisplayLabel = #21697#21495
      FieldName = 'I_ORIGINAL_CD'
      Size = 6
    end
    object LostMemI_ORIGINAL_NAME: TStringField
      DisplayLabel = #21517#31216
      FieldName = 'I_ORIGINAL_NAME'
      Size = 30
    end
    object LostMemI_PROPERTY_CODE: TStringField
      DisplayLabel = #23646#24615#30721
      FieldName = 'I_PROPERTY_CODE'
      Size = 4
    end
    object LostMemI_UNIT: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'I_UNIT'
      Size = 4
    end
    object LostMemI_QTY: TFloatField
      DisplayLabel = #25104#26412#25968#37327
      FieldName = 'I_QTY'
    end
    object LostMemI_LOST_QTY: TFloatField
      DisplayLabel = #25439#32791#25968#37327
      FieldName = 'I_LOST_QTY'
    end
    object LostMemI_REMARK: TStringField
      DisplayLabel = #21407#22240
      FieldName = 'I_REMARK'
      Size = 100
    end
    object LostMemI_DATE: TStringField
      DisplayLabel = #26085#26399
      FieldName = 'I_DATE'
      Size = 10
    end
  end
  object Lostd: TDataSource
    DataSet = LostMem
    Left = 280
    Top = 212
  end
end
