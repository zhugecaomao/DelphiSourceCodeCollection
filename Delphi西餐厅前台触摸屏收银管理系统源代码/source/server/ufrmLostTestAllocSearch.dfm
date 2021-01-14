inherited frmLostTestAllocSearch: TfrmLostTestAllocSearch
  Left = 226
  Top = 220
  Caption = #25104#21697#25439#32791'/'#27979#35797'/'#35843#25320
  OldCreateOrder = True
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
      Width = 119
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
      KeyField = 'I_DATE'
      ShowGroupPanel = True
      ShowSummaryFooter = True
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
      object grdListI_DATE: TdxDBGridMaskColumn
        HeaderAlignment = taCenter
        ReadOnly = True
        Sorted = csUp
        Visible = False
        Width = 124
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_DATE'
        GroupIndex = 0
      end
      object grdListI_SALE_CD: TdxDBGridMaskColumn
        HeaderAlignment = taCenter
        ReadOnly = True
        Width = 91
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_SALE_CD'
      end
      object grdListI_SALE_NAME: TdxDBGridMaskColumn
        HeaderAlignment = taCenter
        ReadOnly = True
        Width = 214
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_SALE_NAME'
      end
      object grdListI_UNIT: TdxDBGridMaskColumn
        HeaderAlignment = taCenter
        ReadOnly = True
        Width = 80
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_UNIT'
      end
      object grdListI_LOST_COUNT: TdxDBGridMaskColumn
        HeaderAlignment = taCenter
        ReadOnly = True
        Width = 173
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_LOST_COUNT'
        SummaryFooterType = cstSum
        SummaryFooterField = 'I_LOST_COUNT'
        SummaryFooterFormat = #21512#35745':0.00'
      end
      object grdListI_TEST_COUNT: TdxDBGridMaskColumn
        HeaderAlignment = taCenter
        ReadOnly = True
        Width = 161
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_TEST_COUNT'
        SummaryFooterType = cstSum
        SummaryFooterField = 'I_TEST_COUNT'
        SummaryFooterFormat = #21512#35745':0.00'
      end
      object grdListI_ALLOC_COUNT: TdxDBGridMaskColumn
        HeaderAlignment = taCenter
        ReadOnly = True
        Width = 154
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_ALLOC_COUNT'
        SummaryFooterType = cstSum
        SummaryFooterField = 'I_ALLOC_COUNT'
        SummaryFooterFormat = #21512#35745':0.00'
      end
    end
  end
  object Viewq: TCSADOQuery
    CacheSize = 1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      ' ')
    Left = 140
    Top = 84
    object ViewqI_DATE: TStringField
      DisplayLabel = #26085#26399
      FieldName = 'I_DATE'
      Size = 10
    end
    object ViewqI_SALE_CD: TStringField
      DisplayLabel = #21697#21495
      FieldName = 'I_SALE_CD'
      Size = 6
    end
    object ViewqI_SALE_NAME: TStringField
      DisplayLabel = #21697#21517#31216
      FieldName = 'I_SALE_NAME'
      Size = 30
    end
    object ViewqI_UNIT: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'I_UNIT'
      Size = 2
    end
    object ViewqI_LOST_COUNT: TIntegerField
      DisplayLabel = #25439#32791#25968#37327
      FieldName = 'I_LOST_COUNT'
    end
    object ViewqI_TEST_COUNT: TIntegerField
      DisplayLabel = #27979#35797#25968#37327
      FieldName = 'I_TEST_COUNT'
    end
    object ViewqI_ALLOC_COUNT: TIntegerField
      DisplayLabel = #35843#25320#25968#37327
      FieldName = 'I_ALLOC_COUNT'
    end
  end
  object Viewd: TDataSource
    DataSet = Viewq
    Left = 140
    Top = 112
  end
end
