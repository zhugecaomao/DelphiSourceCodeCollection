inherited frmOutInvoceView: TfrmOutInvoceView
  Left = 1
  Top = 1
  Width = 798
  Height = 568
  ActiveControl = eInvoceCD
  Caption = 'AA'#38646#29992#37329#25253#25903#21333#22788#29702
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar1: TToolBar
    Width = 790
    Height = 38
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
    Top = 313
    Width = 790
    Height = 228
    Filter.Criteria = {00000000}
    OptionsView = [edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
    object grdListI_INVOCE_CD: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_INVOCE_CD'
    end
    object grdListI_REMARK: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 200
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_REMARK'
    end
    object grdListI_JT: TdxDBGridCurrencyColumn
      HeaderAlignment = taCenter
      Width = 80
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_JT'
      Nullable = False
    end
    object grdListI_BC: TdxDBGridCurrencyColumn
      HeaderAlignment = taCenter
      Width = 80
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_BC'
      Nullable = False
    end
    object grdListI_DH: TdxDBGridCurrencyColumn
      HeaderAlignment = taCenter
      Width = 80
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_DH'
      Nullable = False
    end
    object grdListI_YS: TdxDBGridCurrencyColumn
      HeaderAlignment = taCenter
      Width = 80
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_YS'
      Nullable = False
    end
    object grdListI_SD: TdxDBGridCurrencyColumn
      HeaderAlignment = taCenter
      Width = 80
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_SD'
      Nullable = False
    end
    object grdListI_HB: TdxDBGridCurrencyColumn
      HeaderAlignment = taCenter
      Width = 80
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_HB'
      Nullable = False
    end
    object grdListI_XL: TdxDBGridCurrencyColumn
      HeaderAlignment = taCenter
      Width = 80
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_XL'
      Nullable = False
    end
    object grdListI_WL: TdxDBGridCurrencyColumn
      HeaderAlignment = taCenter
      Width = 80
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_WL'
      Nullable = False
    end
    object grdListI_CX: TdxDBGridCurrencyColumn
      HeaderAlignment = taCenter
      Width = 80
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_CX'
      Nullable = False
    end
    object grdListI_TEL: TdxDBGridCurrencyColumn
      HeaderAlignment = taCenter
      Width = 80
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_TEL'
      Nullable = False
    end
    object grdListI_YG: TdxDBGridCurrencyColumn
      HeaderAlignment = taCenter
      Width = 80
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_YG'
      Nullable = False
    end
    object grdListI_OTHER: TdxDBGridCurrencyColumn
      HeaderAlignment = taCenter
      Width = 80
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_OTHER'
      Nullable = False
    end
    object grdListI_INPUT_DATE: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 80
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_INPUT_DATE'
    end
    object grdListI_SHOP_CD: TdxDBGridMaskColumn
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_SHOP_CD'
    end
  end
  object Panel1: TPanel [2]
    Left = 0
    Top = 38
    Width = 790
    Height = 275
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
      Left = 148
      Top = 8
      Width = 26
      Height = 13
      Caption = #25688#35201
    end
    object Label3: TLabel
      Left = 8
      Top = 56
      Width = 39
      Height = 13
      Caption = #20132#36890#36153
    end
    object Label4: TLabel
      Left = 8
      Top = 100
      Width = 39
      Height = 13
      Caption = #21150#20844#21697
    end
    object Label5: TLabel
      Left = 8
      Top = 140
      Width = 39
      Height = 13
      Caption = #20302#32791#21697
    end
    object Label6: TLabel
      Left = 8
      Top = 180
      Width = 39
      Height = 13
      Caption = #36816#36755#36153
    end
    object Label7: TLabel
      Left = 8
      Top = 224
      Width = 39
      Height = 13
      Caption = #27700#30005#36153
    end
    object Label8: TLabel
      Left = 136
      Top = 56
      Width = 39
      Height = 13
      Caption = #29615#20445#36153
    end
    object Label9: TLabel
      Left = 136
      Top = 100
      Width = 39
      Height = 13
      Caption = #20462#29702#36153
    end
    object Label10: TLabel
      Left = 136
      Top = 140
      Width = 39
      Height = 13
      Caption = #29289#26009#32791
    end
    object Label11: TLabel
      Left = 136
      Top = 180
      Width = 39
      Height = 13
      Caption = #20419#38144#36153
    end
    object Label12: TLabel
      Left = 136
      Top = 224
      Width = 39
      Height = 13
      Caption = #30005#35805#36153
    end
    object Label13: TLabel
      Left = 264
      Top = 56
      Width = 39
      Height = 13
      Caption = #21592#24037#39184
    end
    object Label14: TLabel
      Left = 264
      Top = 100
      Width = 26
      Height = 13
      Caption = #20854#23427
    end
    object Label15: TLabel
      Left = 264
      Top = 140
      Width = 26
      Height = 13
      Caption = #26085#26399
    end
    object eInvoceCD: TdxEdit
      Left = 8
      Top = 24
      Width = 121
      Style.BorderStyle = xbsSingle
      TabOrder = 0
      MaxLength = 6
      StoredValues = 2
    end
    object eRemark: TdxEdit
      Left = 148
      Top = 24
      Width = 237
      Style.BorderStyle = xbsSingle
      TabOrder = 1
      MaxLength = 30
      StoredValues = 2
    end
    object eJT: TdxCurrencyEdit
      Left = 8
      Top = 72
      Width = 121
      Style.BorderStyle = xbsSingle
      TabOrder = 2
    end
    object eBG: TdxCurrencyEdit
      Left = 8
      Top = 116
      Width = 121
      Style.BorderStyle = xbsSingle
      TabOrder = 3
    end
    object eDH: TdxCurrencyEdit
      Left = 8
      Top = 156
      Width = 121
      Style.BorderStyle = xbsSingle
      TabOrder = 4
    end
    object eYS: TdxCurrencyEdit
      Left = 8
      Top = 196
      Width = 121
      Style.BorderStyle = xbsSingle
      TabOrder = 5
    end
    object eSD: TdxCurrencyEdit
      Left = 8
      Top = 240
      Width = 121
      Style.BorderStyle = xbsSingle
      TabOrder = 6
    end
    object eHB: TdxCurrencyEdit
      Left = 136
      Top = 72
      Width = 121
      Style.BorderStyle = xbsSingle
      TabOrder = 7
    end
    object eXL: TdxCurrencyEdit
      Left = 136
      Top = 116
      Width = 121
      Style.BorderStyle = xbsSingle
      TabOrder = 8
    end
    object eWL: TdxCurrencyEdit
      Left = 136
      Top = 156
      Width = 121
      Style.BorderStyle = xbsSingle
      TabOrder = 9
    end
    object eCX: TdxCurrencyEdit
      Left = 136
      Top = 196
      Width = 121
      Style.BorderStyle = xbsSingle
      TabOrder = 10
    end
    object eTEL: TdxCurrencyEdit
      Left = 136
      Top = 240
      Width = 121
      Style.BorderStyle = xbsSingle
      TabOrder = 11
    end
    object eYG: TdxCurrencyEdit
      Left = 264
      Top = 72
      Width = 121
      Style.BorderStyle = xbsSingle
      TabOrder = 12
    end
    object eOther: TdxCurrencyEdit
      Left = 264
      Top = 116
      Width = 121
      Style.BorderStyle = xbsSingle
      TabOrder = 13
    end
    object eInputDate: TdxDateEdit
      Left = 264
      Top = 156
      Width = 120
      Style.BorderStyle = xbsSingle
      TabOrder = 14
      Date = -700000
      UseEditMask = True
      StoredValues = 4
    end
  end
  inherited ImageList: TImageList
    Left = 300
    Top = 404
  end
  inherited ActionList1: TActionList
    Left = 272
    Top = 400
  end
  inherited Viewd: TDataSource
    Left = 208
    Top = 428
  end
  inherited Viewq: TCSADOQuery
    BeforePost = ViewqBeforePost
    AfterScroll = ViewqAfterScroll
    SQL.Strings = ()
    Left = 208
    Top = 400
    object ViewqI_INVOCE_CD: TStringField
      DisplayLabel = #32534#21495
      FieldName = 'I_INVOCE_CD'
      Size = 10
    end
    object ViewqI_REMARK: TStringField
      DisplayLabel = #25688#35201
      FieldName = 'I_REMARK'
    end
    object ViewqI_JT: TBCDField
      DisplayLabel = #20132#36890#36153
      FieldName = 'I_JT'
      Precision = 19
    end
    object ViewqI_BC: TBCDField
      DisplayLabel = #21150#20844#21697
      FieldName = 'I_BC'
      Precision = 19
    end
    object ViewqI_DH: TBCDField
      DisplayLabel = #20302#32791#21697
      FieldName = 'I_DH'
      Precision = 19
    end
    object ViewqI_YS: TBCDField
      DisplayLabel = #36816#36755#36153
      FieldName = 'I_YS'
      Precision = 19
    end
    object ViewqI_SD: TBCDField
      DisplayLabel = #27700#30005#36153
      FieldName = 'I_SD'
      Precision = 19
    end
    object ViewqI_HB: TBCDField
      DisplayLabel = #29615#20445#36153
      FieldName = 'I_HB'
      Precision = 19
    end
    object ViewqI_XL: TBCDField
      DisplayLabel = #20462#29702#36153
      FieldName = 'I_XL'
      Precision = 19
    end
    object ViewqI_WL: TBCDField
      DisplayLabel = #29289#26009#32791
      FieldName = 'I_WL'
      Precision = 19
    end
    object ViewqI_CX: TBCDField
      DisplayLabel = #20419#38144#36153
      FieldName = 'I_CX'
      Precision = 19
    end
    object ViewqI_TEL: TBCDField
      DisplayLabel = #30005#35805#36153
      FieldName = 'I_TEL'
      Precision = 19
    end
    object ViewqI_YG: TBCDField
      DisplayLabel = #21592#24037#39184
      FieldName = 'I_YG'
      Precision = 19
    end
    object ViewqI_OTHER: TBCDField
      DisplayLabel = #20854#23427
      FieldName = 'I_OTHER'
      Precision = 19
    end
    object ViewqI_INPUT_DATE: TStringField
      DisplayLabel = #26085#26399
      FieldName = 'I_INPUT_DATE'
      Size = 10
    end
    object ViewqI_SHOP_CD: TStringField
      FieldName = 'I_SHOP_CD'
      Size = 10
    end
  end
end
