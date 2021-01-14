inherited frmSysUserView: TfrmSysUserView
  VertScrollBar.Range = 0
  BorderStyle = bsSingle
  Caption = #31995#32479#29992#25143#31649#29702
  ClientHeight = 381
  ClientWidth = 701
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar1: TToolBar
    Width = 701
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
    inherited tbExport: TToolButton
      Visible = False
    end
  end
  inherited grdList: TdxDBGrid
    Width = 701
    Height = 307
    KeyField = 'user_id'
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoSmartRefresh, edgoSmartReload, edgoUseBookmarks]
    OptionsView = [edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
    object grdListuser_id: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'user_id'
    end
    object grdListuser_name: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 120
      BandIndex = 0
      RowIndex = 0
      FieldName = 'user_name'
    end
    object grdListpassword: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      PasswordChar = '*'
      Width = 120
      BandIndex = 0
      RowIndex = 0
      FieldName = 'password'
    end
    object grdListcreate_time: TdxDBGridDateColumn
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'create_time'
    end
    object grdListmodify_time: TdxDBGridDateColumn
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'modify_time'
    end
  end
  inherited Viewq: TCSADOQuery
    SQL.Strings = (
      'select * from sys_user')
    object Viewquser_id: TStringField
      DisplayLabel = #29992#25143#32534#21495
      FieldName = 'user_id'
      Size = 6
    end
    object Viewquser_name: TStringField
      DisplayLabel = #29992#25143#21517#31216
      FieldName = 'user_name'
      Size = 30
    end
    object Viewqpassword: TStringField
      DisplayLabel = #29992#25143#23494#30721
      FieldName = 'password'
      Size = 6
    end
    object Viewqcreate_time: TDateTimeField
      DisplayLabel = #28155#21152#26102#38388
      FieldName = 'create_time'
    end
    object Viewqmodify_time: TDateTimeField
      DisplayLabel = #26368#21518#30331#38470#26102#38388
      FieldName = 'modify_time'
    end
  end
end
