inherited frmSaleItemView: TfrmSaleItemView
  VertScrollBar.Range = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #25104#21697#20998#31867
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar1: TToolBar
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
    Top = 137
    Height = 316
    KeyField = 'I_ITEM_CD'
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoSmartRefresh, edgoSmartReload, edgoUseBookmarks]
    OptionsView = [edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
    object grdListI_ITEM_CD: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 75
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_ITEM_CD'
    end
    object grdListI_ITEM_NAME: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 214
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_ITEM_NAME'
    end
    object grdListI_ITEM_COLOR: TdxDBGridColumn
      HeaderAlignment = taCenter
      Visible = False
      Width = 128
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_ITEM_COLOR'
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
      Left = 12
      Top = 8
      Width = 26
      Height = 13
      Caption = #32534#21495
    end
    object Label2: TLabel
      Left = 108
      Top = 8
      Width = 26
      Height = 13
      Caption = #21517#31216
    end
    object Label3: TLabel
      Left = 264
      Top = 8
      Width = 26
      Height = 13
      Caption = #39068#33394
    end
    object spColor: TShape
      Left = 264
      Top = 28
      Width = 113
      Height = 21
      Brush.Color = clRed
      OnMouseDown = spColorMouseDown
    end
    object eItemCD: TdxEdit
      Left = 12
      Top = 28
      Width = 61
      Style.BorderStyle = xbsSingle
      TabOrder = 0
      MaxLength = 4
      StoredValues = 2
    end
    object eItemName: TdxEdit
      Left = 108
      Top = 28
      Width = 121
      Style.BorderStyle = xbsSingle
      TabOrder = 1
      MaxLength = 30
      StoredValues = 2
    end
  end
  inherited Viewd: TDataSource
    Left = 192
    Top = 252
  end
  inherited Viewq: TCSADOQuery
    BeforePost = ViewqBeforePost
    AfterScroll = ViewqAfterScroll
    SQL.Strings = ()
    Left = 192
    Top = 224
    object ViewqI_ITEM_CD: TStringField
      DisplayLabel = #32534#21495
      FieldName = 'I_ITEM_CD'
      Size = 4
    end
    object ViewqI_ITEM_NAME: TStringField
      DisplayLabel = #21517#31216
      FieldName = 'I_ITEM_NAME'
      Size = 30
    end
    object ViewqI_ITEM_COLOR: TStringField
      FieldName = 'I_ITEM_COLOR'
      Size = 50
    end
  end
end
