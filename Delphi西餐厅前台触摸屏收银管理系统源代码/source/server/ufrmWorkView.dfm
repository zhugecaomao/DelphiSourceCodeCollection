inherited frmWorkView: TfrmWorkView
  VertScrollBar.Range = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #29677#27425#35774#23450
  ClientHeight = 473
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
    Top = 229
    Height = 244
    KeyField = 'I_WORK_CD'
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoSmartRefresh, edgoSmartReload, edgoUseBookmarks]
    OptionsView = [edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
    object grdListI_WORK_CD: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_WORK_CD'
    end
    object grdListI_WORK_NAME: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 120
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_WORK_NAME'
    end
    object grdListI_START_TIME: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 120
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_START_TIME'
    end
    object grdListI_END_TIME: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 120
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_END_TIME'
    end
    object grdListI_LEN_DATE: TdxDBGridCheckColumn
      HeaderAlignment = taCenter
      Width = 120
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_LEN_DATE'
      ValueChecked = 'True'
      ValueGrayed = 'True'
      ValueUnchecked = 'False'
    end
    object grdListI_LEN_TIME: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 120
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_LEN_TIME'
    end
  end
  object Panel1: TPanel [2]
    Left = 0
    Top = 74
    Width = 688
    Height = 155
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 65
      Height = 13
      Caption = #29677#27425#32534#21495#65306
    end
    object Label2: TLabel
      Left = 8
      Top = 31
      Width = 65
      Height = 13
      Caption = #29677#27425#21517#31216#65306
    end
    object Label3: TLabel
      Left = 8
      Top = 54
      Width = 65
      Height = 13
      Caption = #24320#22987#26102#38388#65306
    end
    object Label4: TLabel
      Left = 8
      Top = 77
      Width = 65
      Height = 13
      Caption = #32467#26463#26102#38388#65306
    end
    object Label5: TLabel
      Left = 8
      Top = 124
      Width = 65
      Height = 13
      Caption = #36328#22825#26102#38388#65306
    end
    object Label6: TLabel
      Left = 8
      Top = 100
      Width = 65
      Height = 13
      Caption = #26159#21542#36328#22825#65306
    end
    object dxDBEdit1: TdxDBEdit
      Left = 68
      Top = 4
      Width = 121
      Color = clAqua
      Style.BorderStyle = xbsSingle
      TabOrder = 0
      DataField = 'I_WORK_CD'
      DataSource = Viewd
      ReadOnly = True
      StoredValues = 64
    end
    object dxDBEdit2: TdxDBEdit
      Left = 68
      Top = 27
      Width = 121
      Style.BorderStyle = xbsSingle
      TabOrder = 1
      DataField = 'I_WORK_NAME'
      DataSource = Viewd
    end
    object dxDBEdit3: TdxDBEdit
      Left = 68
      Top = 50
      Width = 121
      Style.BorderStyle = xbsSingle
      TabOrder = 2
      DataField = 'I_START_TIME'
      DataSource = Viewd
    end
    object dxDBEdit4: TdxDBEdit
      Left = 68
      Top = 73
      Width = 121
      Style.BorderStyle = xbsSingle
      TabOrder = 3
      DataField = 'I_END_TIME'
      DataSource = Viewd
    end
    object dxDBEdit5: TdxDBEdit
      Left = 68
      Top = 120
      Width = 121
      Style.BorderStyle = xbsSingle
      TabOrder = 4
      DataField = 'I_LEN_TIME'
      DataSource = Viewd
    end
    object dxDBCheckEdit1: TdxDBCheckEdit
      Left = 68
      Top = 96
      Width = 21
      Style.BorderStyle = xbsSingle
      TabOrder = 5
      DataField = 'I_LEN_DATE'
      DataSource = Viewd
      ValueChecked = 'True'
      ValueGrayed = 'True'
      ValueUnchecked = 'False'
      NullStyle = nsUnchecked
    end
  end
  inherited Viewq: TCSADOQuery
    SQL.Strings = ()
    object ViewqI_WORK_CD: TStringField
      DisplayLabel = #29677#27425#32534#21495
      FieldName = 'I_WORK_CD'
      Size = 2
    end
    object ViewqI_WORK_NAME: TStringField
      DisplayLabel = #29677#27425#21517#31216
      FieldName = 'I_WORK_NAME'
      Size = 30
    end
    object ViewqI_START_TIME: TStringField
      DisplayLabel = #24320#22987#26102#38388
      FieldName = 'I_START_TIME'
      Size = 10
    end
    object ViewqI_END_TIME: TStringField
      DisplayLabel = #24320#22987#26102#38388
      FieldName = 'I_END_TIME'
      Size = 10
    end
    object ViewqI_LEN_DATE: TBooleanField
      DisplayLabel = #26159#21542#36328#22825
      FieldName = 'I_LEN_DATE'
    end
    object ViewqI_LEN_TIME: TStringField
      DisplayLabel = #36328#22825#26102#38388
      FieldName = 'I_LEN_TIME'
      Size = 10
    end
  end
end
