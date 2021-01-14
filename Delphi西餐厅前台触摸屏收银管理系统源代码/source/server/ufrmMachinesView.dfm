inherited frmMachinesView: TfrmMachinesView
  Left = 157
  Top = 166
  Caption = #25910#38134#26426#31649#29702
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
  end
  inherited grdList: TdxDBGrid
    Top = 181
    Height = 272
    KeyField = 'I_MACHINES_CD'
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoSmartRefresh, edgoSmartReload, edgoUseBookmarks]
    object grdListI_MACHINES_CD: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_MACHINES_CD'
    end
    object grdListI_MACHINES_NAME: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_MACHINES_NAME'
    end
    object grdListI_MACHINES_FREE: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_MACHINES_FREE'
    end
    object grdListI_LAST_ON_TIME: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_LAST_ON_TIME'
    end
    object grdListI_LAST_OFF_TIME: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_LAST_OFF_TIME'
    end
  end
  object Panel1: TPanel [2]
    Left = 0
    Top = 74
    Width = 688
    Height = 107
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 2
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 65
      Height = 13
      Caption = #25910#38134#26426#32534#21495
    end
    object Label2: TLabel
      Left = 24
      Top = 60
      Width = 52
      Height = 13
      Caption = #30005#33041#21517#31216
    end
    object eMachinesCD: TdxEdit
      Left = 24
      Top = 32
      Width = 65
      Style.BorderStyle = xbsSingle
      TabOrder = 0
      MaxLength = 2
      StoredValues = 2
    end
    object eMachinesName: TdxEdit
      Left = 24
      Top = 76
      Width = 205
      Style.BorderStyle = xbsSingle
      TabOrder = 1
      MaxLength = 30
      StoredValues = 2
    end
  end
  inherited Viewq: TCSADOQuery
    BeforePost = ViewqBeforePost
    AfterScroll = ViewqAfterScroll
    SQL.Strings = ()
    object ViewqI_MACHINES_CD: TStringField
      DisplayLabel = #25910#38134#26426#32534#21495
      FieldName = 'I_MACHINES_CD'
      Size = 2
    end
    object ViewqI_MACHINES_NAME: TStringField
      DisplayLabel = #30005#33041#21517#31216
      FieldName = 'I_MACHINES_NAME'
      Size = 30
    end
    object ViewqI_MACHINES_FREE: TIntegerField
      DisplayLabel = #26159#21542#31354#38386
      FieldName = 'I_MACHINES_FREE'
    end
    object ViewqI_LAST_ON_TIME: TStringField
      DisplayLabel = #26368#21518#19978#32447#26102#38388
      FieldName = 'I_LAST_ON_TIME'
    end
    object ViewqI_LAST_OFF_TIME: TStringField
      DisplayLabel = #26368#21518#19979#32447#26102#38388
      FieldName = 'I_LAST_OFF_TIME'
    end
  end
end
