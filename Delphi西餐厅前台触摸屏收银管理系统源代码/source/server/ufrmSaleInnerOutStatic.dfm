inherited frmSaleInnerOutStatic: TfrmSaleInnerOutStatic
  Left = -4
  Top = -4
  Width = 1032
  Height = 746
  Caption = #25104#21697#20869#29992'/'#22806#24102'/'#22806#36865#25253#34920
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 689
    Width = 1024
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
    inherited Panel2: TPanel
      Left = 941
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
    Width = 1024
    Height = 689
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 1
    object grdList: TdxDBGrid
      Left = 2
      Top = 2
      Width = 1020
      Height = 685
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
        Width = 63
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_TRADE_DATE'
        GroupIndex = 0
      end
      object grdListI_SALE_CD: TdxDBGridMaskColumn
        HeaderAlignment = taCenter
        Width = 78
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_SALE_CD'
      end
      object grdListI_SALE_NAME: TdxDBGridMaskColumn
        HeaderAlignment = taCenter
        Width = 154
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_SALE_NAME'
      end
      object grdListI_PRICE: TdxDBGridCurrencyColumn
        HeaderAlignment = taCenter
        Width = 91
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_PRICE'
        Nullable = False
      end
      object grdListI_COUNT: TdxDBGridMaskColumn
        HeaderAlignment = taCenter
        Visible = False
        Width = 63
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_COUNT'
      end
      object grdListI_INNER_COUNT: TdxDBGridMaskColumn
        HeaderAlignment = taCenter
        Width = 74
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_INNER_COUNT'
      end
      object grdListI_INNER_AMOUNT: TdxDBGridCurrencyColumn
        HeaderAlignment = taCenter
        Width = 104
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_INNER_AMOUNT'
        Nullable = False
      end
      object grdListI_INNER_DISCOUNT: TdxDBGridMaskColumn
        HeaderAlignment = taCenter
        Width = 74
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_INNER_DISCOUNT'
      end
      object grdListI_OUTSELF_COUNT: TdxDBGridMaskColumn
        HeaderAlignment = taCenter
        Width = 74
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_OUTSELF_COUNT'
      end
      object grdListI_OUTSELF_AMOUNT: TdxDBGridCurrencyColumn
        HeaderAlignment = taCenter
        Width = 113
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_OUTSELF_AMOUNT'
        Nullable = False
      end
      object grdListI_OUTSELF_DISCOUNT: TdxDBGridMaskColumn
        HeaderAlignment = taCenter
        Width = 74
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_OUTSELF_DISCOUNT'
      end
      object grdListI_OUTSEND_COUNT: TdxDBGridMaskColumn
        HeaderAlignment = taCenter
        Width = 74
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_OUTSEND_COUNT'
      end
      object grdListI_OUTSEND_AMOUNT: TdxDBGridCurrencyColumn
        HeaderAlignment = taCenter
        Width = 102
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_OUTSEND_AMOUNT'
        Nullable = False
      end
      object grdListI_OUTSEND_DISCOUNT: TdxDBGridMaskColumn
        HeaderAlignment = taCenter
        Width = 74
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_OUTSEND_DISCOUNT'
      end
    end
  end
  object Viewq: TCSADOQuery
    CacheSize = 1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <>
    Left = 148
    Top = 168
    object ViewqI_TRADE_DATE: TStringField
      DisplayLabel = #26085#26399
      FieldName = 'I_TRADE_DATE'
      Size = 10
    end
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
    object ViewqI_PRICE: TBCDField
      DisplayLabel = #21333#20215
      FieldName = 'I_PRICE'
      Precision = 19
    end
    object ViewqI_COUNT: TIntegerField
      FieldName = 'I_COUNT'
    end
    object ViewqI_INNER_COUNT: TIntegerField
      DisplayLabel = #20869#29992#25968#37327
      FieldName = 'I_INNER_COUNT'
    end
    object ViewqI_INNER_AMOUNT: TBCDField
      DisplayLabel = #20869#29992#37329#39069
      FieldName = 'I_INNER_AMOUNT'
      Precision = 19
    end
    object ViewqI_INNER_DISCOUNT: TFloatField
      DisplayLabel = #20869#29992#30334#20998#27604
      FieldName = 'I_INNER_DISCOUNT'
    end
    object ViewqI_OUTSELF_COUNT: TIntegerField
      DisplayLabel = #22806#24102#25968#37327
      FieldName = 'I_OUTSELF_COUNT'
    end
    object ViewqI_OUTSELF_AMOUNT: TBCDField
      DisplayLabel = #22806#24102#37329#39069
      FieldName = 'I_OUTSELF_AMOUNT'
      Precision = 19
    end
    object ViewqI_OUTSELF_DISCOUNT: TFloatField
      DisplayLabel = #22806#24102#30334#20998#27604
      FieldName = 'I_OUTSELF_DISCOUNT'
    end
    object ViewqI_OUTSEND_COUNT: TIntegerField
      DisplayLabel = #22806#36865#25968#37327
      FieldName = 'I_OUTSEND_COUNT'
    end
    object ViewqI_OUTSEND_AMOUNT: TBCDField
      DisplayLabel = #22806#36865#37329#39069
      FieldName = 'I_OUTSEND_AMOUNT'
      Precision = 19
    end
    object ViewqI_OUTSEND_DISCOUNT: TFloatField
      DisplayLabel = #22806#36865#30334#20998#27604
      FieldName = 'I_OUTSEND_DISCOUNT'
    end
  end
  object Viewd: TDataSource
    DataSet = Viewq
    Left = 148
    Top = 196
  end
end
