inherited frmEmpView: TfrmEmpView
  Left = 18
  Top = 53
  Width = 982
  Height = 680
  ActiveControl = eEmpCD
  Caption = #21592#24037#31649#29702
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar1: TToolBar
    Width = 974
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
    Top = 293
    Width = 974
    Height = 360
    KeyField = 'I_EMP_CD'
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCanAppend, edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoSmartRefresh, edgoSmartReload, edgoUseBookmarks]
    OptionsView = [edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
    object grdListI_SHOP_CD: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Visible = False
      Width = 58
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_SHOP_CD'
    end
    object grdListI_EMP_CD: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 74
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_EMP_CD'
    end
    object grdListI_EMP_NAME: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 127
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_EMP_NAME'
    end
    object grdListI_EMP_JOB: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 74
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_EMP_JOB'
    end
    object grdListI_EMP_POWER_CD: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 45
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_EMP_POWER_CD'
    end
    object grdListI_UNLOCK: TdxDBGridCheckColumn
      HeaderAlignment = taCenter
      Width = 50
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_UNLOCK'
      ValueChecked = 'True'
      ValueGrayed = 'True'
      ValueUnchecked = 'False'
      DisplayUnChecked = 'False'
      DisplayNull = 'False'
    end
    object grdListI_CHANGE: TdxDBGridCheckColumn
      HeaderAlignment = taCenter
      Width = 50
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_CHANGE'
      ValueChecked = 'True'
      ValueGrayed = 'True'
      ValueUnchecked = 'False'
      DisplayUnChecked = 'False'
      DisplayNull = 'False'
    end
    object grdListI_DELETE: TdxDBGridCheckColumn
      HeaderAlignment = taCenter
      Width = 50
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_DELETE'
      ValueChecked = 'True'
      ValueGrayed = 'True'
      ValueUnchecked = 'False'
      DisplayUnChecked = 'False'
      DisplayNull = 'False'
    end
    object grdListI_OUTDISCOUNT: TdxDBGridCheckColumn
      HeaderAlignment = taCenter
      Width = 61
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_OUTDISCOUNT'
      ValueChecked = 'True'
      ValueGrayed = 'True'
      ValueUnchecked = 'False'
      DisplayUnChecked = 'False'
      DisplayNull = 'False'
    end
    object grdListI_POS_SET: TdxDBGridCheckColumn
      HeaderAlignment = taCenter
      Width = 61
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_POS_SET'
      ValueChecked = 'True'
      ValueGrayed = 'True'
      ValueUnchecked = 'False'
      DisplayUnChecked = 'False'
      DisplayNull = 'False'
    end
    object grdListI_BEGINNING: TdxDBGridCheckColumn
      HeaderAlignment = taCenter
      Width = 59
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_BEGINNING'
      ValueChecked = 'True'
      ValueGrayed = 'True'
      ValueUnchecked = 'False'
      DisplayUnChecked = 'False'
      DisplayNull = 'False'
    end
    object grdListI_EXIT: TdxDBGridCheckColumn
      HeaderAlignment = taCenter
      Width = 61
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_EXIT'
      ValueChecked = 'True'
      ValueGrayed = 'True'
      ValueUnchecked = 'False'
      DisplayUnChecked = 'False'
      DisplayNull = 'False'
    end
    object grdListI_DATETIME: TdxDBGridCheckColumn
      HeaderAlignment = taCenter
      Width = 66
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_DATETIME'
      ValueChecked = 'True'
      ValueGrayed = 'True'
      ValueUnchecked = 'False'
      DisplayUnChecked = 'False'
      DisplayNull = 'False'
    end
  end
  object Panel1: TPanel [2]
    Left = 0
    Top = 38
    Width = 974
    Height = 255
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 2
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 26
      Height = 13
      Caption = #24037#21495
    end
    object Label2: TLabel
      Left = 24
      Top = 60
      Width = 26
      Height = 13
      Caption = #22995#21517
    end
    object Label3: TLabel
      Left = 24
      Top = 104
      Width = 26
      Height = 13
      Caption = #32844#20301
    end
    object Label4: TLabel
      Left = 24
      Top = 148
      Width = 39
      Height = 13
      Caption = #26435#38480#21495
    end
    object Label5: TLabel
      Left = 24
      Top = 194
      Width = 47
      Height = 13
      Caption = 'POS'#39640#32423
    end
    object eEmpCD: TdxEdit
      Left = 24
      Top = 32
      Width = 65
      Style.BorderStyle = xbsSingle
      TabOrder = 0
      MaxLength = 4
      StoredValues = 2
    end
    object eEmpName: TdxEdit
      Left = 24
      Top = 76
      Width = 121
      Style.BorderStyle = xbsSingle
      TabOrder = 1
      MaxLength = 30
      StoredValues = 2
    end
    object eJob: TdxEdit
      Left = 24
      Top = 120
      Width = 121
      Style.BorderStyle = xbsSingle
      TabOrder = 2
      MaxLength = 30
      StoredValues = 2
    end
    object ePowerCD: TdxPickEdit
      Left = 24
      Top = 164
      Width = 121
      Style.BorderStyle = xbsSingle
      TabOrder = 3
    end
    object chbUnLock: TdxCheckEdit
      Left = 76
      Top = 190
      Width = 53
      Style.BorderStyle = xbsSingle
      TabOrder = 4
      Caption = #35299#25346
    end
    object chbChange: TdxCheckEdit
      Left = 132
      Top = 190
      Width = 53
      Style.BorderStyle = xbsSingle
      TabOrder = 5
      Caption = #25913#39184
    end
    object chbDelete: TdxCheckEdit
      Left = 188
      Top = 190
      Width = 53
      Style.BorderStyle = xbsSingle
      TabOrder = 6
      Caption = #20316#24223
    end
    object chbOutDiscount: TdxCheckEdit
      Left = 244
      Top = 190
      Width = 81
      Style.BorderStyle = xbsSingle
      TabOrder = 7
      Caption = #22806#21334#25171#25240
    end
    object chbPosSet: TdxCheckEdit
      Left = 76
      Top = 218
      Width = 73
      Style.BorderStyle = xbsSingle
      TabOrder = 8
      Caption = 'POS'#37197#32622
    end
    object chbBeginning: TdxCheckEdit
      Left = 152
      Top = 218
      Width = 65
      Style.BorderStyle = xbsSingle
      TabOrder = 9
      Caption = #21021#22987#21270
    end
    object chbExit: TdxCheckEdit
      Left = 220
      Top = 218
      Width = 77
      Style.BorderStyle = xbsSingle
      TabOrder = 10
      Caption = #31995#32479#36864#20986
    end
    object chbDateTime: TdxCheckEdit
      Left = 304
      Top = 218
      Width = 77
      Style.BorderStyle = xbsSingle
      TabOrder = 11
      Caption = #26102#38388#20462#25913
    end
  end
  inherited ImageList: TImageList
    Left = 316
    Top = 316
  end
  inherited ActionList1: TActionList
    Left = 288
    Top = 312
  end
  inherited Viewd: TDataSource
    Left = 236
    Top = 360
  end
  inherited Viewq: TCSADOQuery
    BeforePost = ViewqBeforePost
    AfterScroll = ViewqAfterScroll
    SQL.Strings = ()
    Left = 236
    Top = 332
    object ViewqI_SHOP_CD: TStringField
      DisplayLabel = #20998#24215#32534#21495
      FieldName = 'I_SHOP_CD'
      Size = 4
    end
    object ViewqI_EMP_CD: TStringField
      DisplayLabel = #24037#21495
      FieldName = 'I_EMP_CD'
      Size = 4
    end
    object ViewqI_EMP_NAME: TStringField
      DisplayLabel = #22995#21517
      FieldName = 'I_EMP_NAME'
      Size = 30
    end
    object ViewqI_EMP_JOB: TStringField
      DisplayLabel = #32844#20301
      FieldName = 'I_EMP_JOB'
      Size = 10
    end
    object ViewqI_EMP_POWER_CD: TStringField
      DisplayLabel = #26435#38480#21495
      FieldName = 'I_EMP_POWER_CD'
      Size = 2
    end
    object ViewqI_UNLOCK: TBooleanField
      DisplayLabel = #35299#25346
      FieldName = 'I_UNLOCK'
    end
    object ViewqI_CHANGE: TBooleanField
      DisplayLabel = #25913#39184
      FieldName = 'I_CHANGE'
    end
    object ViewqI_DELETE: TBooleanField
      DisplayLabel = #20316#24223
      FieldName = 'I_DELETE'
    end
    object ViewqI_OUTDISCOUNT: TBooleanField
      DisplayLabel = #22806#21334#25171#25240
      FieldName = 'I_OUTDISCOUNT'
    end
    object ViewqI_POS_SET: TBooleanField
      DisplayLabel = 'POS'#37197#32622
      FieldName = 'I_POS_SET'
    end
    object ViewqI_BEGINNING: TBooleanField
      DisplayLabel = #21021#22987#21270
      FieldName = 'I_BEGINNING'
    end
    object ViewqI_EXIT: TBooleanField
      DisplayLabel = #31995#32479#36864#20986
      FieldName = 'I_EXIT'
    end
    object ViewqI_DATETIME: TBooleanField
      DisplayLabel = #26102#38388#20462#25913
      FieldName = 'I_DATETIME'
    end
  end
  inherited grdPrint: TdxComponentPrinter
    Left = 264
    Top = 332
  end
end
