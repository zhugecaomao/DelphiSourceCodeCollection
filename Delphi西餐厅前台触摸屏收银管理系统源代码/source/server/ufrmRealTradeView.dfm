inherited frmRealTradeView: TfrmRealTradeView
  VertScrollBar.Range = 0
  ActiveControl = eMachinesCD
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #25910#38134#21592#23454#25910#22788#29702
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
    Top = 129
    Height = 324
    KeyField = 'I_SHOP_CD'
    Filter.Criteria = {00000000}
    OptionsView = [edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
    object grdListI_SHOP_CD: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Visible = False
      Width = 87
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_SHOP_CD'
    end
    object grdListI_MACHINES_CD: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 73
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_MACHINES_CD'
    end
    object grdListI_WORK_CD: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 71
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_WORK_CD'
    end
    object grdListI_EMP_CD: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 74
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_EMP_CD'
    end
    object grdListI_AMOUNT: TdxDBGridCurrencyColumn
      HeaderAlignment = taCenter
      Width = 144
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_AMOUNT'
      Nullable = False
    end
    object grdListI_INPUT_DATE: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Visible = False
      Width = 105
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_INPUT_DATE'
    end
  end
  object Panel1: TPanel [2]
    Left = 0
    Top = 74
    Width = 688
    Height = 55
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 2
    object Label1: TLabel
      Left = 12
      Top = 8
      Width = 52
      Height = 13
      Caption = #25910#38134#26426#21495
    end
    object Label2: TLabel
      Left = 76
      Top = 8
      Width = 26
      Height = 13
      Caption = #29677#27425
    end
    object Label3: TLabel
      Left = 120
      Top = 8
      Width = 26
      Height = 13
      Caption = #24037#21495
    end
    object Label4: TLabel
      Left = 212
      Top = 8
      Width = 26
      Height = 13
      Caption = #37329#39069
    end
    object Label5: TLabel
      Left = 356
      Top = 8
      Width = 26
      Height = 13
      Caption = #26085#26399
    end
    object eMachinesCD: TdxEdit
      Left = 11
      Top = 28
      Width = 49
      Style.BorderStyle = xbsSingle
      TabOrder = 0
    end
    object eWorkCD: TdxEdit
      Left = 74
      Top = 28
      Width = 29
      Style.BorderStyle = xbsSingle
      TabOrder = 1
    end
    object eEmpCD: TdxEdit
      Left = 120
      Top = 28
      Width = 73
      Style.BorderStyle = xbsSingle
      TabOrder = 2
    end
    object eAmount: TdxCurrencyEdit
      Left = 204
      Top = 28
      Width = 121
      Style.BorderStyle = xbsSingle
      TabOrder = 3
    end
    object eInputDate: TdxDateEdit
      Left = 352
      Top = 28
      Width = 120
      Style.BorderStyle = xbsSingle
      TabOrder = 4
      Date = -700000
      UseEditMask = True
      StoredValues = 4
    end
  end
  inherited Viewq: TCSADOQuery
    BeforePost = ViewqBeforePost
    AfterScroll = ViewqAfterScroll
    SQL.Strings = (
      'select * from t_real_trade_ms')
    object ViewqI_SHOP_CD: TStringField
      FieldName = 'I_SHOP_CD'
      Size = 10
    end
    object ViewqI_MACHINES_CD: TStringField
      DisplayLabel = #25910#38134#26426#21495
      FieldName = 'I_MACHINES_CD'
      Size = 2
    end
    object ViewqI_WORK_CD: TStringField
      DisplayLabel = #29677#27425
      FieldName = 'I_WORK_CD'
      Size = 2
    end
    object ViewqI_EMP_CD: TStringField
      DisplayLabel = #24037#21495
      FieldName = 'I_EMP_CD'
      Size = 10
    end
    object ViewqI_AMOUNT: TBCDField
      DisplayLabel = #37329#39069
      FieldName = 'I_AMOUNT'
      Precision = 19
    end
    object ViewqI_INPUT_DATE: TStringField
      DisplayLabel = #26085#26399
      FieldName = 'I_INPUT_DATE'
      Size = 10
    end
  end
end
