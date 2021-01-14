inherited frmSaleTimeGatherStatic: TfrmSaleTimeGatherStatic
  Left = 248
  Top = 196
  Caption = #25104#21697#23567#26102#29992#37327
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    object Label3: TLabel [0]
      Left = 8
      Top = 9
      Width = 39
      Height = 13
      Caption = #26085#26399#65306
    end
    object eDate: TdxDateEdit
      Left = 40
      Top = 5
      Width = 117
      Style.BorderStyle = xbsSingle
      TabOrder = 1
      Date = -700000
      UseEditMask = True
      StoredValues = 4
    end
    object bbtnStatic: TBitBtn
      Left = 160
      Top = 4
      Width = 93
      Height = 22
      Caption = #24320#22987#32479#35745
      TabOrder = 2
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
      Left = 256
      Top = 4
      Width = 93
      Height = 22
      Caption = #23548#20986#25968#25454
      TabOrder = 3
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
      KeyField = 'I_SALE_CD'
      SummaryGroups = <>
      SummarySeparator = ', '
      Align = alClient
      TabOrder = 0
      DataSource = Viewd
      Filter.Criteria = {00000000}
      HeaderColor = 4227327
      LookAndFeel = lfFlat
      OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoSmartRefresh, edgoSmartReload, edgoUseBookmarks]
      object grdListI_SALE_CD: TdxDBGridMaskColumn
        HeaderAlignment = taCenter
        Width = 83
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_SALE_CD'
      end
      object grdListI_SALE_NAME: TdxDBGridMaskColumn
        HeaderAlignment = taCenter
        Width = 171
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_SALE_NAME'
      end
      object grdListI_HOUR1: TdxDBGridMaskColumn
        HeaderAlignment = taCenter
        Visible = False
        Width = 74
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_HOUR1'
      end
      object grdListI_HOUR2: TdxDBGridMaskColumn
        HeaderAlignment = taCenter
        Visible = False
        Width = 74
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_HOUR2'
      end
      object grdListI_HOUR3: TdxDBGridMaskColumn
        HeaderAlignment = taCenter
        Visible = False
        Width = 74
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_HOUR3'
      end
      object grdListI_HOUR4: TdxDBGridMaskColumn
        HeaderAlignment = taCenter
        Visible = False
        Width = 74
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_HOUR4'
      end
      object grdListI_HOUR5: TdxDBGridMaskColumn
        HeaderAlignment = taCenter
        Visible = False
        Width = 74
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_HOUR5'
      end
      object grdListI_HOUR6: TdxDBGridMaskColumn
        HeaderAlignment = taCenter
        Visible = False
        Width = 74
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_HOUR6'
      end
      object grdListI_HOUR7: TdxDBGridMaskColumn
        HeaderAlignment = taCenter
        Visible = False
        Width = 74
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_HOUR7'
      end
      object grdListI_HOUR8: TdxDBGridMaskColumn
        HeaderAlignment = taCenter
        Visible = False
        Width = 74
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_HOUR8'
      end
      object grdListI_HOUR9: TdxDBGridMaskColumn
        HeaderAlignment = taCenter
        Visible = False
        Width = 74
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_HOUR9'
      end
      object grdListI_HOUR10: TdxDBGridMaskColumn
        HeaderAlignment = taCenter
        Width = 74
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_HOUR10'
      end
      object grdListI_HOUR11: TdxDBGridMaskColumn
        HeaderAlignment = taCenter
        Width = 74
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_HOUR11'
      end
      object grdListI_HOUR12: TdxDBGridMaskColumn
        HeaderAlignment = taCenter
        Width = 74
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_HOUR12'
      end
      object grdListI_HOUR13: TdxDBGridMaskColumn
        HeaderAlignment = taCenter
        Width = 74
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_HOUR13'
      end
      object grdListI_HOUR14: TdxDBGridMaskColumn
        HeaderAlignment = taCenter
        Width = 74
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_HOUR14'
      end
      object grdListI_HOUR15: TdxDBGridMaskColumn
        HeaderAlignment = taCenter
        Width = 74
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_HOUR15'
      end
      object grdListI_HOUR16: TdxDBGridMaskColumn
        HeaderAlignment = taCenter
        Width = 74
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_HOUR16'
      end
      object grdListI_HOUR17: TdxDBGridMaskColumn
        HeaderAlignment = taCenter
        Width = 74
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_HOUR17'
      end
      object grdListI_HOUR18: TdxDBGridMaskColumn
        HeaderAlignment = taCenter
        Width = 74
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_HOUR18'
      end
      object grdListI_HOUR19: TdxDBGridMaskColumn
        HeaderAlignment = taCenter
        Width = 74
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_HOUR19'
      end
      object grdListI_HOUR20: TdxDBGridMaskColumn
        HeaderAlignment = taCenter
        Width = 74
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_HOUR20'
      end
      object grdListI_HOUR21: TdxDBGridMaskColumn
        HeaderAlignment = taCenter
        Width = 74
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_HOUR21'
      end
      object grdListI_HOUR22: TdxDBGridMaskColumn
        HeaderAlignment = taCenter
        Width = 74
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_HOUR22'
      end
      object grdListI_HOUR23: TdxDBGridMaskColumn
        HeaderAlignment = taCenter
        Width = 74
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_HOUR23'
      end
      object grdListI_HOUR24: TdxDBGridMaskColumn
        HeaderAlignment = taCenter
        Width = 74
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_HOUR24'
      end
    end
  end
  object Viewq: TCSADOQuery
    Parameters = <>
    Left = 216
    Top = 92
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
    object ViewqI_HOUR1: TIntegerField
      FieldName = 'I_HOUR1'
    end
    object ViewqI_HOUR2: TIntegerField
      FieldName = 'I_HOUR2'
    end
    object ViewqI_HOUR3: TIntegerField
      FieldName = 'I_HOUR3'
    end
    object ViewqI_HOUR4: TIntegerField
      FieldName = 'I_HOUR4'
    end
    object ViewqI_HOUR5: TIntegerField
      FieldName = 'I_HOUR5'
    end
    object ViewqI_HOUR6: TIntegerField
      FieldName = 'I_HOUR6'
    end
    object ViewqI_HOUR7: TIntegerField
      FieldName = 'I_HOUR7'
    end
    object ViewqI_HOUR8: TIntegerField
      FieldName = 'I_HOUR8'
    end
    object ViewqI_HOUR9: TIntegerField
      FieldName = 'I_HOUR9'
    end
    object ViewqI_HOUR10: TIntegerField
      DisplayLabel = '10'
      FieldName = 'I_HOUR10'
    end
    object ViewqI_HOUR11: TIntegerField
      DisplayLabel = '11'
      FieldName = 'I_HOUR11'
    end
    object ViewqI_HOUR12: TIntegerField
      DisplayLabel = '12'
      FieldName = 'I_HOUR12'
    end
    object ViewqI_HOUR13: TIntegerField
      DisplayLabel = '13'
      FieldName = 'I_HOUR13'
    end
    object ViewqI_HOUR14: TIntegerField
      DisplayLabel = '14'
      FieldName = 'I_HOUR14'
    end
    object ViewqI_HOUR15: TIntegerField
      DisplayLabel = '15'
      FieldName = 'I_HOUR15'
    end
    object ViewqI_HOUR16: TIntegerField
      DisplayLabel = '16'
      FieldName = 'I_HOUR16'
    end
    object ViewqI_HOUR17: TIntegerField
      DisplayLabel = '17'
      FieldName = 'I_HOUR17'
    end
    object ViewqI_HOUR18: TIntegerField
      DisplayLabel = '18'
      FieldName = 'I_HOUR18'
    end
    object ViewqI_HOUR19: TIntegerField
      DisplayLabel = '19'
      FieldName = 'I_HOUR19'
    end
    object ViewqI_HOUR20: TIntegerField
      DisplayLabel = '20'
      FieldName = 'I_HOUR20'
    end
    object ViewqI_HOUR21: TIntegerField
      DisplayLabel = '21'
      FieldName = 'I_HOUR21'
    end
    object ViewqI_HOUR22: TIntegerField
      DisplayLabel = '22'
      FieldName = 'I_HOUR22'
    end
    object ViewqI_HOUR23: TIntegerField
      DisplayLabel = '23'
      FieldName = 'I_HOUR23'
    end
    object ViewqI_HOUR24: TIntegerField
      DisplayLabel = '24'
      FieldName = 'I_HOUR24'
    end
  end
  object Viewd: TDataSource
    DataSet = Viewq
    Left = 216
    Top = 120
  end
end
