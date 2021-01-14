inherited frmSaleView: TfrmSaleView
  Left = 224
  Top = 232
  Caption = #25104#21697#31649#29702
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar1: TToolBar
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
    Top = 225
    Height = 228
    KeyField = 'I_SALE_CD'
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoSmartRefresh, edgoSmartReload, edgoUseBookmarks]
    OptionsView = [edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
    object grdListI_SALE_CD: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 58
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
    object grdListI_PRICE: TdxDBGridCurrencyColumn
      HeaderAlignment = taCenter
      Width = 144
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_PRICE'
      Nullable = False
    end
    object grdListI_UNIT: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 46
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_UNIT'
    end
    object grdListI_SALE_ITEM_CD: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 32
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_SALE_ITEM_CD'
    end
    object grdListI_FIX_SALE: TdxDBGridCheckColumn
      HeaderAlignment = taCenter
      Width = 103
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_FIX_SALE'
      ValueChecked = 'True'
      ValueGrayed = 'True'
      ValueUnchecked = 'False'
      DisplayUnChecked = 'False'
      DisplayNull = 'False'
    end
    object grdListI_SALE_RECORD: TdxDBGridCheckColumn
      HeaderAlignment = taCenter
      Width = 103
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_SALE_RECORD'
      ValueChecked = 'True'
      ValueGrayed = 'True'
      ValueUnchecked = 'False'
      DisplayUnChecked = 'False'
      DisplayNull = 'False'
    end
    object grdListI_OTHER_RECORD: TdxDBGridCheckColumn
      HeaderAlignment = taCenter
      Width = 103
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_OTHER_RECORD'
      ValueChecked = 'True'
      ValueGrayed = 'True'
      ValueUnchecked = 'False'
      DisplayUnChecked = 'False'
      DisplayNull = 'False'
    end
    object grdListI_HELPER_CODE: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 100
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_HELPER_CODE'
    end
    object grdListI_LSM: TdxDBGridCheckColumn
      HeaderAlignment = taCenter
      Width = 103
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_LSM'
      ValueChecked = 'True'
      ValueGrayed = 'True'
      ValueUnchecked = 'False'
      DisplayUnChecked = 'False'
      DisplayNull = 'False'
    end
    object grdListI_COST: TdxDBGridCurrencyColumn
      HeaderAlignment = taCenter
      Width = 148
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_COST'
      Nullable = False
    end
  end
  object Panel1: TPanel [2]
    Left = 0
    Top = 74
    Width = 688
    Height = 151
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 52
      Height = 13
      Caption = #25104#21697#32534#21495
    end
    object Label2: TLabel
      Left = 132
      Top = 8
      Width = 52
      Height = 13
      Caption = #25104#21697#21517#31216
    end
    object Label3: TLabel
      Left = 348
      Top = 8
      Width = 26
      Height = 13
      Caption = #21333#20215
    end
    object Label4: TLabel
      Left = 484
      Top = 8
      Width = 26
      Height = 13
      Caption = #21333#20301
    end
    object Label5: TLabel
      Left = 532
      Top = 8
      Width = 26
      Height = 13
      Caption = #20998#31867
    end
    object Label9: TLabel
      Left = 8
      Top = 56
      Width = 39
      Height = 13
      Caption = #21161#35760#31526
    end
    object Label11: TLabel
      Left = 8
      Top = 100
      Width = 52
      Height = 13
      Caption = #25104#26412#26680#31639
    end
    object chbFixSale: TdxCheckEdit
      Left = 136
      Top = 72
      Width = 121
      Style.BorderStyle = xbsSingle
      TabOrder = 6
      Caption = #26159#21542#22871#39184
    end
    object chbSaleRecord: TdxCheckEdit
      Left = 286
      Top = 72
      Width = 121
      Style.BorderStyle = xbsSingle
      TabOrder = 7
      Caption = #20135#21697#38144#21806#35760#24405
      State = cbsChecked
    end
    object chbOtherRecord: TdxCheckEdit
      Left = 437
      Top = 72
      Width = 121
      Style.BorderStyle = xbsSingle
      TabOrder = 8
      Caption = #33829#19994#22806#25910#20837
    end
    object chbLsm: TdxCheckEdit
      Left = 588
      Top = 72
      Width = 121
      Style.BorderStyle = xbsSingle
      TabOrder = 9
      Caption = 'LSM'#20419#38144#26041#26696
    end
    object eSaleCD: TdxEdit
      Left = 8
      Top = 24
      Width = 121
      Style.BorderStyle = xbsSingle
      TabOrder = 0
      MaxLength = 6
      StoredValues = 2
    end
    object eSaleName: TdxEdit
      Left = 132
      Top = 24
      Width = 213
      Style.BorderStyle = xbsSingle
      TabOrder = 1
      MaxLength = 30
      StoredValues = 2
    end
    object ePrice: TdxCurrencyEdit
      Left = 348
      Top = 24
      Width = 121
      Style.BorderStyle = xbsSingle
      TabOrder = 2
    end
    object eUnit: TdxEdit
      Left = 480
      Top = 24
      Width = 41
      Style.BorderStyle = xbsSingle
      TabOrder = 3
      MaxLength = 2
      StoredValues = 2
    end
    object eSaleItem: TdxPickEdit
      Left = 528
      Top = 24
      Width = 121
      Style.BorderStyle = xbsSingle
      TabOrder = 4
    end
    object eHelperCode: TdxEdit
      Left = 8
      Top = 72
      Width = 121
      Style.BorderStyle = xbsSingle
      TabOrder = 5
      MaxLength = 10
      StoredValues = 2
    end
    object eCost: TdxCurrencyEdit
      Left = 8
      Top = 116
      Width = 121
      Style.BorderStyle = xbsSingle
      TabOrder = 10
    end
  end
  inherited Viewq: TCSADOQuery
    BeforePost = ViewqBeforePost
    AfterScroll = ViewqAfterScroll
    SQL.Strings = (
      '')
    object ViewqI_SALE_CD: TStringField
      DisplayLabel = #25104#21697#32534#21495
      FieldName = 'I_SALE_CD'
      Size = 6
    end
    object ViewqI_SALE_NAME: TStringField
      DisplayLabel = #25104#21697#21517#31216
      FieldName = 'I_SALE_NAME'
      Size = 30
    end
    object ViewqI_PRICE: TBCDField
      DisplayLabel = #21333#20215
      FieldName = 'I_PRICE'
      Precision = 19
    end
    object ViewqI_UNIT: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'I_UNIT'
      Size = 2
    end
    object ViewqI_SALE_ITEM_CD: TStringField
      DisplayLabel = #20998#31867
      FieldName = 'I_SALE_ITEM_CD'
      Size = 4
    end
    object ViewqI_FIX_SALE: TBooleanField
      DisplayLabel = #26159#21542#22871#39184
      FieldName = 'I_FIX_SALE'
    end
    object ViewqI_SALE_RECORD: TBooleanField
      DisplayLabel = #20135#21697#38144#21806#35760#24405
      FieldName = 'I_SALE_RECORD'
    end
    object ViewqI_OTHER_RECORD: TBooleanField
      DisplayLabel = #33829#19994#22806#25910#20837
      FieldName = 'I_OTHER_RECORD'
    end
    object ViewqI_HELPER_CODE: TStringField
      DisplayLabel = #21161#35760#31526
      FieldName = 'I_HELPER_CODE'
      Size = 10
    end
    object ViewqI_LSM: TBooleanField
      DisplayLabel = 'LSM'#20419#38144
      FieldName = 'I_LSM'
    end
    object ViewqI_COST: TBCDField
      DisplayLabel = #25104#26412#26680#31639
      FieldName = 'I_COST'
      Precision = 19
    end
  end
end
