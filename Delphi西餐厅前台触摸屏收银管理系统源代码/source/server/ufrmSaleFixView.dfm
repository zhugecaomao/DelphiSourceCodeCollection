inherited frmSaleFixView: TfrmSaleFixView
  Left = -4
  Top = -4
  Width = 1032
  Height = 746
  Caption = #22871#39184#20869#23481#35774#23450
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar1: TToolBar
    Width = 1024
    Height = 38
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
      Visible = False
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
    Top = 38
    Width = 1024
    Height = 135
    KeyField = 'I_SALE_CD'
    Align = alTop
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoSmartRefresh, edgoSmartReload, edgoUseBookmarks]
    OptionsView = [edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
    object grdListI_SALE_CD: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Sorted = csUp
      Width = 85
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
      Width = 120
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_PRICE'
      Nullable = False
    end
    object grdListI_COST: TdxDBGridCurrencyColumn
      HeaderAlignment = taCenter
      Width = 114
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_COST'
      Nullable = False
    end
  end
  object GroupBox1: TGroupBox [2]
    Left = 0
    Top = 173
    Width = 1024
    Height = 331
    Align = alClient
    Caption = ' '#26410#36873#25104#21697' '
    TabOrder = 2
    object grdSaleList: TdxDBGrid
      Left = 2
      Top = 15
      Width = 1020
      Height = 314
      Bands = <
        item
        end>
      DefaultLayout = True
      HeaderPanelRowCount = 1
      KeyField = 'RecId'
      SummaryGroups = <>
      SummarySeparator = ', '
      Align = alClient
      TabOrder = 0
      OnDblClick = grdSaleListDblClick
      DataSource = unSelectd
      Filter.Criteria = {00000000}
      HeaderColor = 4227327
      LookAndFeel = lfFlat
      OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoSmartRefresh, edgoSmartReload, edgoUseBookmarks]
      OptionsView = [edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
      object grdSaleListRecId: TdxDBGridColumn
        HeaderAlignment = taCenter
        Visible = False
        Width = 84
        BandIndex = 0
        RowIndex = 0
        FieldName = 'RecId'
      end
      object grdSaleListI_SALE_CD: TdxDBGridMaskColumn
        HeaderAlignment = taCenter
        Width = 84
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_SALE_CD'
      end
      object grdSaleListI_SALE_NAME: TdxDBGridMaskColumn
        HeaderAlignment = taCenter
        Width = 214
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_SALE_NAME'
      end
      object grdSaleListI_UNIT: TdxDBGridMaskColumn
        HeaderAlignment = taCenter
        Width = 90
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_UNIT'
      end
      object grdSaleListI_PRICE: TdxDBGridCurrencyColumn
        HeaderAlignment = taCenter
        Width = 74
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_PRICE'
        Nullable = False
      end
      object grdSaleListI_COST: TdxDBGridCurrencyColumn
        HeaderAlignment = taCenter
        Width = 74
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_COST'
        Nullable = False
      end
      object grdSaleListI_SALE_RECORD: TdxDBGridCheckColumn
        HeaderAlignment = taCenter
        Width = 100
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_SALE_RECORD'
        ValueChecked = 'True'
        ValueGrayed = 'True'
        ValueUnchecked = 'False'
        DisplayChecked = 'True'
        DisplayUnChecked = 'False'
        DisplayNull = 'False'
      end
      object grdSaleListI_OTHER_RECORD: TdxDBGridCheckColumn
        HeaderAlignment = taCenter
        Width = 100
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_OTHER_RECORD'
        ValueChecked = 'True'
        ValueGrayed = 'True'
        ValueUnchecked = 'False'
        DisplayChecked = 'True'
        DisplayUnChecked = 'False'
        DisplayNull = 'False'
      end
      object grdSaleListI_LSM: TdxDBGridCheckColumn
        HeaderAlignment = taCenter
        Width = 100
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_LSM'
        ValueChecked = 'True'
        ValueGrayed = 'True'
        ValueUnchecked = 'False'
        DisplayChecked = 'True'
        DisplayUnChecked = 'False'
        DisplayNull = 'False'
      end
    end
  end
  object GroupBox2: TGroupBox [3]
    Left = 0
    Top = 504
    Width = 1024
    Height = 215
    Align = alBottom
    Caption = ' '#24050#36873#25104#21697' '
    TabOrder = 3
    object grdFixSaleList: TdxDBGrid
      Left = 2
      Top = 15
      Width = 1020
      Height = 198
      Bands = <
        item
        end>
      DefaultLayout = True
      HeaderPanelRowCount = 1
      KeyField = 'RecId'
      SummaryGroups = <>
      SummarySeparator = ', '
      Align = alClient
      TabOrder = 0
      OnDblClick = grdFixSaleListDblClick
      DataSource = Selectd
      Filter.Criteria = {00000000}
      HeaderColor = 4227327
      LookAndFeel = lfFlat
      OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoSmartRefresh, edgoSmartReload, edgoUseBookmarks]
      OptionsView = [edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
      object grdFixSaleListRecId: TdxDBGridColumn
        Visible = False
        Width = 84
        BandIndex = 0
        RowIndex = 0
        FieldName = 'RecId'
      end
      object grdFixSaleListI_SALE_CD: TdxDBGridMaskColumn
        HeaderAlignment = taCenter
        Width = 46
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_SALE_CD'
      end
      object grdFixSaleListI_SALE_NAME: TdxDBGridMaskColumn
        HeaderAlignment = taCenter
        Width = 263
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_SALE_NAME'
      end
      object grdFixSaleListI_UNIT: TdxDBGridMaskColumn
        HeaderAlignment = taCenter
        Width = 67
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_UNIT'
      end
      object grdFixSaleListI_PRICE: TdxDBGridCurrencyColumn
        HeaderAlignment = taCenter
        Width = 73
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_PRICE'
        Nullable = False
      end
      object grdFixSaleListI_COST: TdxDBGridCurrencyColumn
        HeaderAlignment = taCenter
        Width = 81
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_COST'
        Nullable = False
      end
      object grdFixSaleListI_SALE_RECORD: TdxDBGridCheckColumn
        HeaderAlignment = taCenter
        Width = 100
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_SALE_RECORD'
        ValueChecked = #30495
        ValueUnchecked = #20551
      end
      object grdFixSaleListI_OTHER_RECORD: TdxDBGridCheckColumn
        HeaderAlignment = taCenter
        Width = 100
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_OTHER_RECORD'
        ValueChecked = #30495
        ValueUnchecked = #20551
      end
      object grdFixSaleListI_LSM: TdxDBGridCheckColumn
        HeaderAlignment = taCenter
        Width = 100
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_LSM'
        ValueChecked = #30495
        ValueUnchecked = #20551
      end
    end
  end
  inherited Viewq: TCSADOQuery
    object ViewqI_SALE_CD: TStringField
      DisplayLabel = #21697#21495
      FieldName = 'I_SALE_CD'
      Size = 6
    end
    object ViewqI_SALE_NAME: TStringField
      DisplayLabel = #21517#31216
      FieldName = 'I_SALE_NAME'
      Size = 30
    end
    object ViewqI_PRICE: TCurrencyField
      DisplayLabel = #21333#20215
      FieldName = 'I_PRICE'
    end
    object ViewqI_COST: TCurrencyField
      DisplayLabel = #25104#26412#26680#31639
      FieldName = 'I_COST'
    end
  end
  object memUnSelect: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 208
    Top = 324
    object memUnSelectI_SALE_CD: TStringField
      DisplayLabel = #21697#21495
      FieldName = 'I_SALE_CD'
      Size = 6
    end
    object memUnSelectI_SALE_NAME: TStringField
      DisplayLabel = #21517#31216
      FieldName = 'I_SALE_NAME'
      Size = 30
    end
    object memUnSelectI_UNIT: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'I_UNIT'
      Size = 2
    end
    object memUnSelectI_PRICE: TCurrencyField
      DisplayLabel = #21333#20215
      FieldName = 'I_PRICE'
    end
    object memUnSelectI_COST: TCurrencyField
      DisplayLabel = #25104#26412#26680#31639
      FieldName = 'I_COST'
    end
    object memUnSelectI_SALE_RECORD: TBooleanField
      DisplayLabel = #20135#21697#38144#21806#35760#24405
      FieldName = 'I_SALE_RECORD'
    end
    object memUnSelectI_OTHER_RECORD: TBooleanField
      DisplayLabel = #33829#19994#25910#20837
      FieldName = 'I_OTHER_RECORD'
    end
    object memUnSelectI_LSM: TBooleanField
      DisplayLabel = 'LSM'#20419#38144
      FieldName = 'I_LSM'
    end
  end
  object unSelectd: TDataSource
    AutoEdit = False
    DataSet = memUnSelect
    Left = 208
    Top = 352
  end
  object Selectd: TDataSource
    AutoEdit = False
    DataSet = memSelect
    Left = 236
    Top = 352
  end
  object unSelectq: TCSADOQuery
    Parameters = <>
    Left = 208
    Top = 296
    object unSelectqI_SALE_CD: TStringField
      FieldName = 'I_SALE_CD'
      Size = 6
    end
    object unSelectqI_SALE_NAME: TStringField
      FieldName = 'I_SALE_NAME'
      Size = 30
    end
    object unSelectqI_UNIT: TStringField
      FieldName = 'I_UNIT'
      Size = 2
    end
    object unSelectqI_PRICE: TCurrencyField
      FieldName = 'I_PRICE'
    end
    object unSelectqI_SALE_RECORD: TBooleanField
      FieldName = 'I_SALE_RECORD'
    end
    object unSelectqI_OTHER_RECORD: TBooleanField
      FieldName = 'I_OTHER_RECORD'
    end
    object unSelectqI_LSM: TBooleanField
      FieldName = 'I_LSM'
    end
    object unSelectqI_COST: TCurrencyField
      FieldName = 'I_COST'
    end
  end
  object Selectq: TCSADOQuery
    Parameters = <>
    Left = 236
    Top = 296
    object StringField1: TStringField
      FieldName = 'I_SALE_CD'
      Size = 6
    end
    object StringField2: TStringField
      FieldName = 'I_SALE_NAME'
      Size = 30
    end
    object StringField3: TStringField
      FieldName = 'I_UNIT'
      Size = 2
    end
    object CurrencyField1: TCurrencyField
      FieldName = 'I_PRICE'
    end
    object BooleanField1: TBooleanField
      FieldName = 'I_SALE_RECORD'
    end
    object BooleanField2: TBooleanField
      FieldName = 'I_OTHER_RECORD'
    end
    object BooleanField3: TBooleanField
      FieldName = 'I_LSM'
    end
    object CurrencyField2: TCurrencyField
      FieldName = 'I_COST'
    end
  end
  object memSelect: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 236
    Top = 324
    object StringField4: TStringField
      DisplayLabel = #21697#21495
      FieldName = 'I_SALE_CD'
      Size = 6
    end
    object StringField5: TStringField
      DisplayLabel = #21517#31216
      FieldName = 'I_SALE_NAME'
      Size = 30
    end
    object StringField6: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'I_UNIT'
      Size = 2
    end
    object CurrencyField3: TCurrencyField
      DisplayLabel = #21333#20215
      FieldName = 'I_PRICE'
    end
    object CurrencyField4: TCurrencyField
      DisplayLabel = #25104#26412#26680#31639
      FieldName = 'I_COST'
    end
    object BooleanField4: TBooleanField
      DisplayLabel = #20135#21697#38144#21806#35760#24405
      FieldName = 'I_SALE_RECORD'
    end
    object BooleanField5: TBooleanField
      DisplayLabel = #33829#19994#25910#20837
      FieldName = 'I_OTHER_RECORD'
    end
    object BooleanField6: TBooleanField
      DisplayLabel = 'LSM'#20419#38144
      FieldName = 'I_LSM'
    end
  end
end
