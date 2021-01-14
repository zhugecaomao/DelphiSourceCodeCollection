inherited frmUnitView: TfrmUnitView
  Left = 214
  Top = 230
  VertScrollBar.Range = 0
  ActiveControl = eUnitCD
  BorderStyle = bsSingle
  Caption = #21407#26009#21333#20301#31649#29702
  ClientHeight = 349
  ClientWidth = 422
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar1: TToolBar
    Width = 422
    Height = 74
    inherited tbFindData: TToolButton
      Visible = False
    end
    inherited ToolButton1: TToolButton
      Wrap = True
      Visible = False
    end
    inherited ToolButton2: TToolButton
      Left = 0
      Top = 36
      Visible = False
    end
    inherited tbConfirm: TToolButton
      Left = 68
      Top = 36
    end
    inherited tbExport: TToolButton
      Left = 136
      Top = 36
      Visible = False
    end
    inherited tbCancel: TToolButton
      Left = 204
      Top = 36
    end
    inherited ToolButton6: TToolButton
      Left = 272
      Top = 36
    end
    inherited tbExit: TToolButton
      Left = 280
      Top = 36
    end
  end
  inherited grdList: TdxDBGrid
    Top = 117
    Width = 422
    Height = 232
    KeyField = 'I_UNIT_CD'
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoSmartRefresh, edgoSmartReload, edgoUseBookmarks]
    object grdListI_UNIT_CD: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 64
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_UNIT_CD'
    end
    object grdListI_UNIT_NAME: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 158
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_UNIT_NAME'
    end
  end
  object Panel1: TPanel [2]
    Left = 0
    Top = 74
    Width = 422
    Height = 43
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 2
    object Label1: TLabel
      Left = 12
      Top = 16
      Width = 39
      Height = 13
      Caption = #32534#21495#65306
    end
    object Label2: TLabel
      Left = 156
      Top = 16
      Width = 65
      Height = 13
      Caption = #21333#20301#21517#31216#65306
    end
    object eUnitCD: TdxEdit
      Left = 48
      Top = 12
      Width = 61
      Color = clAqua
      Style.BorderStyle = xbsSingle
      TabOrder = 0
      MaxLength = 2
      StoredValues = 2
    end
    object eUnitName: TdxEdit
      Left = 216
      Top = 12
      Width = 121
      Color = clAqua
      Style.BorderStyle = xbsSingle
      TabOrder = 1
      MaxLength = 10
      StoredValues = 2
    end
  end
  inherited Viewq: TCSADOQuery
    AfterScroll = ViewqAfterScroll
    object ViewqI_UNIT_CD: TStringField
      DisplayLabel = #32534#21495
      FieldName = 'I_UNIT_CD'
      Size = 2
    end
    object ViewqI_UNIT_NAME: TStringField
      DisplayLabel = #21333#20301#21517#31216
      FieldName = 'I_UNIT_NAME'
      Size = 10
    end
  end
end
