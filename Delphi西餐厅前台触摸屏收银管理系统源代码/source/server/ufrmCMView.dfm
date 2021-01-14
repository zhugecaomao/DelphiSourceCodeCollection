inherited frmCMView: TfrmCMView
  Left = 10
  Top = 127
  VertScrollBar.Range = 0
  BorderStyle = bsSingle
  Caption = #23458#25143#36164#26009#31649#29702
  ClientHeight = 719
  ClientWidth = 1024
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar1: TToolBar
    Width = 1024
    Height = 38
    inherited ToolButton1: TToolButton
      Wrap = False
    end
    inherited ToolButton2: TToolButton
      Left = 408
      Top = 0
    end
    inherited tbConfirm: TToolButton
      Left = 476
      Top = 0
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
  object Panel1: TPanel [1]
    Left = 0
    Top = 38
    Width = 1024
    Height = 681
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 2
  end
  inherited grdList: TdxDBGrid
    Top = 38
    Width = 1024
    Height = 681
    KeyField = 'cm_id'
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoSmartRefresh, edgoSmartReload, edgoUseBookmarks]
    OptionsView = [edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
    object grdListcm_id: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 74
      BandIndex = 0
      RowIndex = 0
      FieldName = 'cm_id'
    end
    object grdListcm_name: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 132
      BandIndex = 0
      RowIndex = 0
      FieldName = 'cm_name'
    end
    object grdListcm_old: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 74
      BandIndex = 0
      RowIndex = 0
      FieldName = 'cm_old'
    end
    object grdListcm_birthday: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Visible = False
      Width = 59
      BandIndex = 0
      RowIndex = 0
      FieldName = 'cm_birthday'
    end
    object grdListcm_sex: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 58
      BandIndex = 0
      RowIndex = 0
      FieldName = 'cm_sex'
    end
    object grdListcm_address: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 187
      BandIndex = 0
      RowIndex = 0
      FieldName = 'cm_address'
    end
    object grdListcm_tel: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 147
      BandIndex = 0
      RowIndex = 0
      FieldName = 'cm_tel'
    end
    object grdListcm_mail: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 201
      BandIndex = 0
      RowIndex = 0
      FieldName = 'cm_mail'
    end
    object grdListcm_onlyno: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 104
      BandIndex = 0
      RowIndex = 0
      FieldName = 'cm_onlyno'
    end
    object grdListcm_date: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 74
      BandIndex = 0
      RowIndex = 0
      FieldName = 'cm_date'
    end
    object grdListcm_time: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 74
      BandIndex = 0
      RowIndex = 0
      FieldName = 'cm_time'
    end
    object grdListlast_time: TdxDBGridDateColumn
      HeaderAlignment = taCenter
      Width = 130
      BandIndex = 0
      RowIndex = 0
      FieldName = 'last_time'
    end
    object grdListlogin_id: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 74
      BandIndex = 0
      RowIndex = 0
      FieldName = 'login_id'
    end
  end
  inherited ActionList1: TActionList
    Left = 224
    Top = 156
  end
  inherited Viewq: TCSADOQuery
    SQL.Strings = ()
    object Viewqcm_id: TStringField
      DisplayLabel = #23458#25151#32534#21495
      FieldName = 'cm_id'
      Size = 10
    end
    object Viewqcm_name: TStringField
      DisplayLabel = #23458#25143#22995#21517
      FieldName = 'cm_name'
      Size = 30
    end
    object Viewqcm_old: TIntegerField
      DisplayLabel = #23458#25143#24180#40836
      FieldName = 'cm_old'
    end
    object Viewqcm_birthday: TStringField
      FieldName = 'cm_birthday'
      Size = 10
    end
    object Viewqcm_sex: TStringField
      DisplayLabel = #23458#25143#24615#21035
      FieldName = 'cm_sex'
      Size = 2
    end
    object Viewqcm_address: TStringField
      DisplayLabel = #23458#25143#22320#22336
      FieldName = 'cm_address'
      Size = 50
    end
    object Viewqcm_tel: TStringField
      DisplayLabel = #32852#31995#30005#35805
      FieldName = 'cm_tel'
      Size = 30
    end
    object Viewqcm_mail: TStringField
      DisplayLabel = #37038#20214#22320#22336
      FieldName = 'cm_mail'
      Size = 50
    end
    object Viewqcm_onlyno: TStringField
      DisplayLabel = #26377#25928#35777#20214
      FieldName = 'cm_onlyno'
      Size = 30
    end
    object Viewqcm_date: TStringField
      DisplayLabel = #30331#35760#26085#26399
      FieldName = 'cm_date'
      Size = 10
    end
    object Viewqcm_time: TStringField
      DisplayLabel = #30331#35760#26102#38388
      FieldName = 'cm_time'
      Size = 10
    end
    object Viewqlast_time: TDateTimeField
      DisplayLabel = #26368#21518#28040#36153#26102#38388
      FieldName = 'last_time'
    end
    object Viewqlogin_id: TStringField
      DisplayLabel = #25805#20316#21592
      FieldName = 'login_id'
      Size = 10
    end
  end
end
