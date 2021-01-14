inherited frmCardKindView: TfrmCardKindView
  VertScrollBar.Range = 0
  BorderStyle = bsSingle
  Caption = #20250#21592#31867#22411
  ClientHeight = 350
  ClientWidth = 618
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar1: TToolBar
    Width = 618
  end
  object Panel1: TPanel [1]
    Left = 0
    Top = 74
    Width = 618
    Height = 276
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 2
  end
  inherited grdList: TdxDBGrid
    Width = 618
    Height = 276
    KeyField = 'kind_id'
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoSmartRefresh, edgoSmartReload, edgoUseBookmarks]
    OptionsView = [edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
    object grdListkind_id: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'kind_id'
    end
    object grdListkind_name: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'kind_name'
    end
    object grdListis_saving: TdxDBGridCheckColumn
      HeaderAlignment = taCenter
      Width = 100
      BandIndex = 0
      RowIndex = 0
      FieldName = 'is_saving'
      ValueChecked = #30495
      ValueUnchecked = #20551
    end
    object grdListis_discount: TdxDBGridCheckColumn
      HeaderAlignment = taCenter
      Width = 100
      BandIndex = 0
      RowIndex = 0
      FieldName = 'is_discount'
      ValueChecked = #30495
      ValueUnchecked = #20551
    end
    object grdListdiscount_point: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'discount_point'
    end
  end
  inherited ActionList1: TActionList
    inherited atConfirm: TAction
      OnExecute = atConfirmExecute
    end
  end
  inherited Viewq: TCSADOQuery
    AfterScroll = ViewqAfterScroll
    SQL.Strings = ()
    object Viewqkind_id: TIntegerField
      DisplayLabel = #31867#22411#32534#21495
      FieldName = 'kind_id'
    end
    object Viewqkind_name: TStringField
      DisplayLabel = #31867#22411#21517#31216
      FieldName = 'kind_name'
      Size = 10
    end
    object Viewqis_saving: TBooleanField
      DisplayLabel = #26159#21542#20805#20540
      FieldName = 'is_saving'
    end
    object Viewqis_discount: TBooleanField
      DisplayLabel = #26159#21542#25240#25187
      FieldName = 'is_discount'
    end
    object Viewqdiscount_point: TFloatField
      DisplayLabel = #25240#25187#28857#25968
      FieldName = 'discount_point'
    end
  end
end
