inherited frmLSMSaleView: TfrmLSMSaleView
  Left = -4
  Top = -4
  Width = 1032
  Height = 746
  ActiveControl = eLSMRemark
  Caption = 'LSM'#20419#38144#31649#29702
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar1: TToolBar
    Width = 1024
    Height = 38
    inherited tbEdit: TToolButton
      Visible = False
    end
    inherited tbDel: TToolButton
      Visible = False
    end
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
    Top = 38
    Width = 1024
    Height = 159
    KeyField = 'I_SALE_CD'
    Align = alTop
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoSmartRefresh, edgoSmartReload, edgoUseBookmarks]
    OptionsView = [edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
    object grdListI_SALE_CD: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 100
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_SALE_CD'
    end
    object grdListI_SALE_NAME: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 283
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_SALE_NAME'
    end
    object grdListI_UNIT: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 89
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_UNIT'
    end
    object grdListI_PRICE: TdxDBGridCurrencyColumn
      HeaderAlignment = taCenter
      Width = 74
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_PRICE'
      Nullable = False
    end
    object grdListI_COST: TdxDBGridCurrencyColumn
      HeaderAlignment = taCenter
      Width = 74
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_COST'
      Nullable = False
    end
  end
  object GroupBox1: TGroupBox [2]
    Left = 0
    Top = 197
    Width = 1024
    Height = 522
    Align = alClient
    Caption = #20419#38144#26041#26696
    TabOrder = 2
    object grdLSMList: TdxDBGrid
      Left = 2
      Top = 145
      Width = 1020
      Height = 375
      Bands = <
        item
        end>
      DefaultLayout = True
      HeaderPanelRowCount = 1
      KeyField = 'I_ID'
      SummaryGroups = <>
      SummarySeparator = ', '
      Align = alClient
      TabOrder = 0
      DataSource = LSMd
      Filter.Criteria = {00000000}
      HeaderColor = 4227327
      LookAndFeel = lfFlat
      OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoSmartRefresh, edgoSmartReload, edgoUseBookmarks]
      OptionsView = [edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
      object grdLSMListI_ID: TdxDBGridMaskColumn
        Visible = False
        Width = 55
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_ID'
      end
      object grdLSMListI_SALE_CD: TdxDBGridMaskColumn
        Visible = False
        Width = 51
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_SALE_CD'
      end
      object grdLSMListI_SALE_NAME: TdxDBGridMaskColumn
        Visible = False
        Width = 159
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_SALE_NAME'
      end
      object grdLSMListI_LSM_REMARK: TdxDBGridMaskColumn
        HeaderAlignment = taCenter
        Width = 340
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_LSM_REMARK'
      end
      object grdLSMListI_LSM_PRICE: TdxDBGridCurrencyColumn
        HeaderAlignment = taCenter
        Width = 122
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_LSM_PRICE'
        Nullable = False
      end
      object grdLSMListI_START_DATE: TdxDBGridMaskColumn
        HeaderAlignment = taCenter
        Width = 120
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_START_DATE'
      end
      object grdLSMListI_END_DATE: TdxDBGridMaskColumn
        HeaderAlignment = taCenter
        Width = 104
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_END_DATE'
      end
    end
    object Panel1: TPanel
      Left = 2
      Top = 15
      Width = 1020
      Height = 130
      Align = alTop
      BevelInner = bvLowered
      TabOrder = 1
      object Label1: TLabel
        Left = 16
        Top = 12
        Width = 52
        Height = 13
        Caption = #20419#38144#35828#26126
      end
      object Label2: TLabel
        Left = 16
        Top = 64
        Width = 39
        Height = 13
        Caption = #20419#38144#20215
      end
      object Label3: TLabel
        Left = 144
        Top = 64
        Width = 52
        Height = 13
        Caption = #24320#22987#26085#26399
      end
      object Label4: TLabel
        Left = 286
        Top = 64
        Width = 52
        Height = 13
        Caption = #32467#26463#26085#26399
      end
      object eLSMRemark: TdxEdit
        Left = 16
        Top = 32
        Width = 585
        Style.BorderStyle = xbsSingle
        TabOrder = 0
      end
      object ePrice: TdxCurrencyEdit
        Left = 16
        Top = 84
        Width = 73
        Style.BorderStyle = xbsSingle
        TabOrder = 1
      end
      object eStart: TdxDateEdit
        Left = 144
        Top = 84
        Width = 119
        Style.BorderStyle = xbsSingle
        TabOrder = 2
        Date = -700000
        UseEditMask = True
        StoredValues = 4
      end
      object eEnd: TdxDateEdit
        Left = 288
        Top = 84
        Width = 119
        Style.BorderStyle = xbsSingle
        TabOrder = 3
        Date = -700000
        UseEditMask = True
        StoredValues = 4
      end
    end
  end
  inherited ImageList: TImageList
    Left = 328
    Top = 424
  end
  inherited ActionList1: TActionList
    Left = 300
    Top = 424
  end
  inherited Viewd: TDataSource
    Left = 244
    Top = 424
  end
  inherited Viewq: TCSADOQuery
    AfterScroll = ViewqAfterScroll
    Left = 244
    Top = 396
    object ViewqI_SALE_CD: TStringField
      DisplayLabel = #21697#21495
      FieldName = 'I_SALE_CD'
      Size = 6
    end
    object ViewqI_SALE_NAME: TStringField
      DisplayLabel = #21517#31216
      FieldName = 'I_SALE_NAME'
      Size = 30
    end
    object ViewqI_UNIT: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'I_UNIT'
      Size = 2
    end
    object ViewqI_PRICE: TCurrencyField
      DisplayLabel = #21333#20215
      FieldName = 'I_PRICE'
    end
    object ViewqI_COST: TCurrencyField
      DisplayLabel = #25104#26412#26680#31639
      FieldName = 'I_COST'
    end
  end
  inherited grdPrint: TdxComponentPrinter
    Left = 272
    Top = 424
  end
  object LSMq: TCSADOQuery
    BeforePost = LSMqBeforePost
    AfterScroll = LSMqAfterScroll
    Parameters = <>
    Left = 216
    Top = 396
    object LSMqI_ID: TIntegerField
      FieldName = 'I_ID'
    end
    object LSMqI_SALE_CD: TStringField
      FieldName = 'I_SALE_CD'
      Size = 6
    end
    object LSMqI_SALE_NAME: TStringField
      FieldName = 'I_SALE_NAME'
      Size = 30
    end
    object LSMqI_LSM_REMARK: TStringField
      DisplayLabel = #20419#38144#35828#26126
      FieldName = 'I_LSM_REMARK'
      Size = 100
    end
    object LSMqI_LSM_PRICE: TCurrencyField
      DisplayLabel = #20419#38144#20215
      FieldName = 'I_LSM_PRICE'
    end
    object LSMqI_START_DATE: TStringField
      DisplayLabel = #24320#22987#26085#26399
      FieldName = 'I_START_DATE'
      Size = 10
    end
    object LSMqI_END_DATE: TStringField
      DisplayLabel = #32467#26463#26085#26399
      FieldName = 'I_END_DATE'
      Size = 10
    end
  end
  object LSMd: TDataSource
    DataSet = LSMq
    Left = 216
    Top = 424
  end
end
