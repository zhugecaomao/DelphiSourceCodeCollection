inherited frmFactoryView: TfrmFactoryView
  Left = 1
  Top = 1
  VertScrollBar.Range = 0
  ActiveControl = eCD
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #21378#21830#20449#24687#31649#29702
  ClientHeight = 616
  ClientWidth = 923
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar1: TToolBar
    Width = 923
    Height = 38
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
    Top = 141
    Width = 923
    Height = 475
    KeyField = 'I_FACTORY_CD'
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoSmartRefresh, edgoSmartReload, edgoUseBookmarks]
    OptionsView = [edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
    object grdListI_FACTORY_CD: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 94
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_FACTORY_CD'
    end
    object grdListI_FACTORY_NAME: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 120
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_FACTORY_NAME'
    end
    object grdListI_FACTORY_ZIPCODE: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 120
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_FACTORY_ZIPCODE'
    end
    object grdListI_FACTORY_ADDRESS: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 261
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_FACTORY_ADDRESS'
    end
    object grdListI_FACTORY_TEL: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 120
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_FACTORY_TEL'
    end
    object grdListI_FACTORY_CONNECT_MAN: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 120
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_FACTORY_CONNECT_MAN'
    end
    object grdListI_REMARK: TdxDBGridMaskColumn
      Visible = False
      Width = 817
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_REMARK'
    end
  end
  object Panel1: TPanel [2]
    Left = 0
    Top = 38
    Width = 923
    Height = 103
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 26
      Height = 13
      Caption = #32534#21495
    end
    object Label2: TLabel
      Left = 104
      Top = 8
      Width = 26
      Height = 13
      Caption = #21517#31216
    end
    object Label3: TLabel
      Left = 344
      Top = 8
      Width = 26
      Height = 13
      Caption = #37038#32534
    end
    object Label4: TLabel
      Left = 468
      Top = 8
      Width = 26
      Height = 13
      Caption = #22320#22336
    end
    object Label5: TLabel
      Left = 8
      Top = 52
      Width = 26
      Height = 13
      Caption = #30005#35805
    end
    object Label6: TLabel
      Left = 144
      Top = 52
      Width = 39
      Height = 13
      Caption = #32852#31995#20154
    end
    object Label7: TLabel
      Left = 276
      Top = 52
      Width = 26
      Height = 13
      Caption = #22791#27880
    end
    object eCD: TdxEdit
      Left = 8
      Top = 24
      Width = 85
      Style.BorderStyle = xbsSingle
      TabOrder = 0
      MaxLength = 6
      StoredValues = 2
    end
    object eName: TdxEdit
      Left = 103
      Top = 24
      Width = 225
      Style.BorderStyle = xbsSingle
      TabOrder = 1
      MaxLength = 30
      StoredValues = 2
    end
    object eZipCode: TdxEdit
      Left = 338
      Top = 24
      Width = 121
      Style.BorderStyle = xbsSingle
      TabOrder = 2
      MaxLength = 10
      StoredValues = 2
    end
    object eAddress: TdxEdit
      Left = 468
      Top = 24
      Width = 357
      Style.BorderStyle = xbsSingle
      TabOrder = 3
      MaxLength = 50
      StoredValues = 2
    end
    object eTel: TdxEdit
      Left = 8
      Top = 68
      Width = 121
      Style.BorderStyle = xbsSingle
      TabOrder = 4
      MaxLength = 20
      StoredValues = 2
    end
    object eConnectMan: TdxEdit
      Left = 140
      Top = 68
      Width = 121
      Style.BorderStyle = xbsSingle
      TabOrder = 5
      MaxLength = 30
      StoredValues = 2
    end
    object eRemark: TdxEdit
      Left = 272
      Top = 68
      Width = 553
      Style.BorderStyle = xbsSingle
      TabOrder = 6
      MaxLength = 100
      StoredValues = 2
    end
  end
  inherited Viewq: TCSADOQuery
    AutoCalcFields = False
    BeforePost = ViewqBeforePost
    AfterScroll = ViewqAfterScroll
    SQL.Strings = (
      'select * from T_FACTORY_MS')
    object ViewqI_FACTORY_CD: TStringField
      DisplayLabel = #32534#21495
      FieldName = 'I_FACTORY_CD'
      Size = 6
    end
    object ViewqI_FACTORY_NAME: TStringField
      DisplayLabel = #21517#31216
      FieldName = 'I_FACTORY_NAME'
      Size = 30
    end
    object ViewqI_FACTORY_ZIPCODE: TStringField
      DisplayLabel = #37038#32534
      FieldName = 'I_FACTORY_ZIPCODE'
      Size = 10
    end
    object ViewqI_FACTORY_ADDRESS: TStringField
      DisplayLabel = #22320#22336
      FieldName = 'I_FACTORY_ADDRESS'
      Size = 50
    end
    object ViewqI_FACTORY_TEL: TStringField
      DisplayLabel = #30005#35805
      FieldName = 'I_FACTORY_TEL'
    end
    object ViewqI_FACTORY_CONNECT_MAN: TStringField
      DisplayLabel = #32852#31995#20154
      FieldName = 'I_FACTORY_CONNECT_MAN'
      Size = 30
    end
    object ViewqI_REMARK: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'I_REMARK'
      Size = 100
    end
  end
end
