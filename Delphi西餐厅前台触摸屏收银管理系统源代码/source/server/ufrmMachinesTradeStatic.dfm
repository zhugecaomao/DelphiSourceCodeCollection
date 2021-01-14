inherited frmMachinesTradeStatic: TfrmMachinesTradeStatic
  Caption = #25910#38134#26426#38144#21806#26085#25253#34920
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    object Label1: TLabel [0]
      Left = 8
      Top = 9
      Width = 13
      Height = 13
      Caption = #20174
    end
    object Label2: TLabel [1]
      Left = 148
      Top = 9
      Width = 13
      Height = 13
      Caption = #33267
    end
    object eStartDate: TdxDateEdit
      Left = 24
      Top = 5
      Width = 116
      Style.BorderStyle = xbsSingle
      TabOrder = 1
      Date = -700000
      UseEditMask = True
      StoredValues = 4
    end
    object eEndDate: TdxDateEdit
      Left = 168
      Top = 5
      Width = 119
      Style.BorderStyle = xbsSingle
      TabOrder = 2
      Date = -700000
      UseEditMask = True
      StoredValues = 4
    end
    object bbtnStatic: TBitBtn
      Left = 292
      Top = 4
      Width = 93
      Height = 22
      Caption = #24320#22987#32479#35745
      TabOrder = 3
      OnClick = bbtnStaticClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333333333333333333FFFFFFFFFFF33330000000000
        03333377777777777F33333003333330033333377FF333377F33333300333333
        0333333377FF33337F3333333003333303333333377FF3337333333333003333
        333333333377FF3333333333333003333333333333377FF33333333333330033
        3333333333337733333333333330033333333333333773333333333333003333
        33333333337733333F3333333003333303333333377333337F33333300333333
        03333333773333337F33333003333330033333377FFFFFF77F33330000000000
        0333337777777777733333333333333333333333333333333333}
      NumGlyphs = 2
    end
    object bbtnExport: TBitBtn
      Left = 388
      Top = 4
      Width = 93
      Height = 22
      Caption = #23548#20986#25968#25454
      TabOrder = 4
      OnClick = bbtnExportClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333303
        333333333333337FF3333333333333903333333333333377FF33333333333399
        03333FFFFFFFFF777FF3000000999999903377777777777777FF0FFFF0999999
        99037F3337777777777F0FFFF099999999907F3FF777777777770F00F0999999
        99037F773777777777730FFFF099999990337F3FF777777777330F00FFFFF099
        03337F773333377773330FFFFFFFF09033337F3FF3FFF77733330F00F0000003
        33337F773777777333330FFFF0FF033333337F3FF7F3733333330F08F0F03333
        33337F7737F7333333330FFFF003333333337FFFF77333333333000000333333
        3333777777333333333333333333333333333333333333333333}
      NumGlyphs = 2
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 423
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 1
    object grdList: TdxDBGrid
      Left = 2
      Top = 2
      Width = 684
      Height = 419
      Bands = <
        item
        end>
      DefaultLayout = True
      HeaderPanelRowCount = 1
      KeyField = 'I_TRADE_DATE'
      ShowGroupPanel = True
      SummaryGroups = <>
      SummarySeparator = ', '
      Align = alClient
      TabOrder = 0
      DataSource = Viewd
      Filter.Criteria = {00000000}
      HeaderColor = 4227327
      LookAndFeel = lfFlat
      OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoSmartRefresh, edgoSmartReload, edgoUseBookmarks]
      OptionsView = [edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
      object grdListI_TRADE_DATE: TdxDBGridMaskColumn
        HeaderAlignment = taCenter
        Sorted = csUp
        Visible = False
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_TRADE_DATE'
        GroupIndex = 0
      end
      object grdListI_MACHINES_CD: TdxDBGridMaskColumn
        HeaderAlignment = taCenter
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_MACHINES_CD'
      end
      object grdListI_AMOUNT1: TdxDBGridCurrencyColumn
        HeaderAlignment = taCenter
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_AMOUNT1'
        Nullable = False
      end
      object grdListI_AMOUNT2: TdxDBGridCurrencyColumn
        HeaderAlignment = taCenter
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_AMOUNT2'
        Nullable = False
      end
      object grdListI_AMOUNT3: TdxDBGridCurrencyColumn
        HeaderAlignment = taCenter
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_AMOUNT3'
        Nullable = False
      end
      object grdListI_AMOUNT4: TdxDBGridCurrencyColumn
        HeaderAlignment = taCenter
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_AMOUNT4'
        Nullable = False
      end
      object grdListI_AMOUNT5: TdxDBGridCurrencyColumn
        HeaderAlignment = taCenter
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_AMOUNT5'
        Nullable = False
      end
      object grdListI_COUNT: TdxDBGridMaskColumn
        HeaderAlignment = taCenter
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_COUNT'
      end
      object grdListI_AVG: TdxDBGridCurrencyColumn
        HeaderAlignment = taCenter
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_AVG'
        Nullable = False
      end
    end
  end
  object Viewq: TCSADOQuery
    CacheSize = 1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <>
    Left = 164
    Top = 104
    object ViewqI_TRADE_DATE: TStringField
      DisplayLabel = #26085#26399
      FieldName = 'I_TRADE_DATE'
      Size = 10
    end
    object ViewqI_MACHINES_CD: TStringField
      DisplayLabel = #25910#38134#26426#21495
      FieldName = 'I_MACHINES_CD'
      Size = 2
    end
    object ViewqI_AMOUNT1: TBCDField
      DisplayLabel = #24403#26085#24635#32467
      FieldName = 'I_AMOUNT1'
      Precision = 19
    end
    object ViewqI_AMOUNT2: TBCDField
      DisplayLabel = #29616#37329#30408#20111
      FieldName = 'I_AMOUNT2'
      Precision = 19
    end
    object ViewqI_AMOUNT3: TBCDField
      DisplayLabel = #33829#19994#25910#20837
      FieldName = 'I_AMOUNT3'
      Precision = 19
    end
    object ViewqI_AMOUNT4: TBCDField
      DisplayLabel = #29616#37329#25910#20837
      FieldName = 'I_AMOUNT4'
      Precision = 19
    end
    object ViewqI_AMOUNT5: TBCDField
      DisplayLabel = #20316#24223#24635#39069
      FieldName = 'I_AMOUNT5'
      Precision = 19
    end
    object ViewqI_COUNT: TIntegerField
      DisplayLabel = #26469#23458#25968
      FieldName = 'I_COUNT'
    end
    object ViewqI_AVG: TBCDField
      DisplayLabel = #24179#22343#23458#21333#20215
      FieldName = 'I_AVG'
      Precision = 19
    end
  end
  object Viewd: TDataSource
    DataSet = Viewq
    Left = 164
    Top = 132
  end
end
