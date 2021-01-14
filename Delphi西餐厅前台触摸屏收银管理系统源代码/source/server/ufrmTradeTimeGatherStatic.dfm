inherited frmTradeTimeGatherStatic: TfrmTradeTimeGatherStatic
  Left = 221
  Top = 179
  Caption = #26102#27573#38144#21806#27719#24635
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    object Label1: TLabel [0]
      Left = 160
      Top = 9
      Width = 13
      Height = 13
      Caption = #20174
    end
    object Label2: TLabel [1]
      Left = 224
      Top = 9
      Width = 13
      Height = 13
      Caption = #33267
    end
    object Label3: TLabel [2]
      Left = 8
      Top = 9
      Width = 39
      Height = 13
      Caption = #26085#26399#65306
    end
    object eStartTime: TdxTimeEdit
      Left = 176
      Top = 5
      Width = 45
      Style.BorderStyle = xbsSingle
      TabOrder = 1
      TimeEditFormat = tfHour
      StoredValues = 4
    end
    object eEndTime: TdxTimeEdit
      Left = 244
      Top = 5
      Width = 40
      Style.BorderStyle = xbsSingle
      TabOrder = 2
      TimeEditFormat = tfHour
      StoredValues = 4
    end
    object bbtnStatic: TBitBtn
      Left = 288
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
      Left = 384
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
    object eDate: TdxDateEdit
      Left = 40
      Top = 5
      Width = 117
      Style.BorderStyle = xbsSingle
      TabOrder = 5
      Date = -700000
      UseEditMask = True
      StoredValues = 4
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
      KeyField = 'RecId'
      SummaryGroups = <>
      SummarySeparator = ', '
      Align = alClient
      TabOrder = 0
      DataSource = Viewd
      Filter.Criteria = {00000000}
      HeaderColor = 4227327
      LookAndFeel = lfFlat
      OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoPartialLoad, edgoSmartRefresh, edgoSmartReload, edgoUseBookmarks]
      OptionsView = [edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
      RowFooterColor = clLime
      object grdListRecId: TdxDBGridColumn
        Visible = False
        Width = 127
        BandIndex = 0
        RowIndex = 0
        FieldName = 'RecId'
      end
      object grdListI_TIME: TdxDBGridMaskColumn
        HeaderAlignment = taCenter
        Width = 144
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_TIME'
      end
      object grdListI_AMOUNT: TdxDBGridCurrencyColumn
        HeaderAlignment = taCenter
        Width = 176
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_AMOUNT'
        SummaryFooterType = cstSum
        SummaryFooterField = 'I_AMOUNT'
        SummaryFooterFormat = #21512#35745#65306' 0.00'
        Nullable = False
      end
      object grdListI_TC: TdxDBGridMaskColumn
        HeaderAlignment = taCenter
        Width = 160
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_TC'
        SummaryFooterType = cstSum
        SummaryFooterField = 'I_TC'
        SummaryFooterFormat = #21512#35745#65306' 0.00'
      end
      object grdListI_AC: TdxDBGridMaskColumn
        HeaderAlignment = taCenter
        Width = 86
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_AC'
      end
      object grdListI_COUNT_AMOUNT: TdxDBGridCurrencyColumn
        HeaderAlignment = taCenter
        Width = 183
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_COUNT_AMOUNT'
        SummaryFooterType = cstMax
        SummaryFooterField = 'I_COUNT_AMOUNT'
        SummaryFooterFormat = #21512#35745#65306' 0.00'
        Nullable = False
      end
    end
  end
  object Viewq: TCSADOQuery
    Parameters = <>
    Left = 244
    Top = 84
    object ViewqI_AMOUNT: TCurrencyField
      FieldName = 'I_AMOUNT'
    end
    object ViewqI_TC: TIntegerField
      FieldName = 'I_TC'
    end
    object ViewqI_AC: TFloatField
      FieldName = 'I_AC'
    end
  end
  object Viewd: TDataSource
    DataSet = memView
    Left = 272
    Top = 112
  end
  object memView: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 272
    Top = 84
    object memViewI_TIME: TStringField
      DisplayLabel = #26102#27573
      FieldName = 'I_TIME'
    end
    object memViewI_AMOUNT: TCurrencyField
      DisplayLabel = #23454#25910#37329#39069
      FieldName = 'I_AMOUNT'
    end
    object memViewI_TC: TIntegerField
      DisplayLabel = 'TC'
      FieldName = 'I_TC'
    end
    object memViewI_AC: TFloatField
      DisplayLabel = 'AC'
      FieldName = 'I_AC'
    end
    object memViewI_COUNT_AMOUNT: TCurrencyField
      DisplayLabel = #32047#31215#37329#39069
      FieldName = 'I_COUNT_AMOUNT'
    end
  end
end
