object frmTradeInfo: TfrmTradeInfo
  Left = 1
  Top = 1
  BorderStyle = bsNone
  ClientHeight = 541
  ClientWidth = 790
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 418
    Width = 790
    Height = 123
    Align = alBottom
    BevelInner = bvLowered
    Color = clGradientActiveCaption
    TabOrder = 0
    object Label1: TLabel
      Left = 454
      Top = 12
      Width = 109
      Height = 29
      AutoSize = False
      Caption = #20132#26131#21495#65306
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 454
      Top = 46
      Width = 109
      Height = 29
      AutoSize = False
      Caption = #26102'     '#38388#65306
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 454
      Top = 80
      Width = 109
      Height = 29
      AutoSize = False
      Caption = #37329'     '#39069#65306
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object labTradeCD: TLabel
      Left = 559
      Top = 12
      Width = 181
      Height = 29
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object labTime: TLabel
      Left = 559
      Top = 46
      Width = 181
      Height = 29
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object labAmount: TLabel
      Left = 559
      Top = 80
      Width = 181
      Height = 29
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object bbtnUp: TdxfColorButton
      Tag = 5
      Left = 4
      Top = 53
      Width = 105
      Height = 64
      Caption.Strings = (
        #19978#31508
        #20132#26131)
      Color = clBlue
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      OnMouseDown = bbtnUpMouseDown
    end
    object bbtnDown: TdxfColorButton
      Tag = 5
      Left = 116
      Top = 53
      Width = 105
      Height = 64
      Caption.Strings = (
        #19979#31508
        #20132#26131)
      Color = clBlue
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      OnMouseDown = bbtnDownMouseDown
    end
    object bbtnExit: TdxfColorButton
      Tag = 5
      Left = 340
      Top = 53
      Width = 105
      Height = 64
      Caption.Strings = (
        #36820#22238)
      Color = clBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      OnClick = bbtnExitClick
    end
    object bbtnPrint: TdxfColorButton
      Tag = 5
      Left = 228
      Top = 53
      Width = 105
      Height = 64
      Caption.Strings = (
        #25171#21360
        #36134#21333)
      Color = clBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      OnClick = bbtnPrintClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 285
    Height = 418
    Align = alLeft
    BevelInner = bvLowered
    TabOrder = 1
    object TradeList: TdxDBGrid
      Left = 2
      Top = 2
      Width = 281
      Height = 414
      Bands = <
        item
        end>
      DefaultLayout = True
      HeaderPanelRowCount = 1
      KeyField = 'I_TRADE_CD'
      ShowSummaryFooter = True
      SummaryGroups = <>
      SummarySeparator = ', '
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      BandFont.Charset = DEFAULT_CHARSET
      BandFont.Color = clWindowText
      BandFont.Height = -11
      BandFont.Name = 'MS Sans Serif'
      BandFont.Style = []
      DataSource = Traded
      Filter.Criteria = {00000000}
      GridLineColor = clGreen
      HeaderColor = 4227327
      HeaderFont.Charset = DEFAULT_CHARSET
      HeaderFont.Color = clWindowText
      HeaderFont.Height = -11
      HeaderFont.Name = 'MS Sans Serif'
      HeaderFont.Style = []
      LookAndFeel = lfFlat
      OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoSmartRefresh, edgoSmartReload, edgoUseBookmarks]
      OptionsView = [edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
      PreviewFont.Charset = DEFAULT_CHARSET
      PreviewFont.Color = clBlue
      PreviewFont.Height = -11
      PreviewFont.Name = 'MS Sans Serif'
      PreviewFont.Style = []
      ShowRowFooter = True
      object TradeListI_TRADE_CD: TdxDBGridMaskColumn
        HeaderAlignment = taCenter
        Width = 124
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_TRADE_CD'
      end
      object TradeListI_TRADE_TIME: TdxDBGridMaskColumn
        HeaderAlignment = taCenter
        Width = 79
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_TRADE_TIME'
      end
      object TradeListI_TRADE_MONEY: TdxDBGridCurrencyColumn
        HeaderAlignment = taCenter
        Width = 75
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_TRADE_MONEY'
        SummaryFooterType = cstSum
        SummaryFooterField = 'I_TRADE_MONEY'
        SummaryFooterFormat = ' 0.00'
        Nullable = False
      end
      object TradeListI_TRADE_DATE: TdxDBGridMaskColumn
        Visible = False
        Width = 77
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_TRADE_DATE'
      end
      object TradeListI_EMP_CD: TdxDBGridMaskColumn
        Visible = False
        Width = 52
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_EMP_CD'
      end
      object TradeListI_WORK_CD: TdxDBGridMaskColumn
        Visible = False
        Width = 63
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_WORK_CD'
      end
      object TradeListI_TRADE_FLAG1: TdxDBGridMaskColumn
        Visible = False
        Width = 80
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_TRADE_FLAG1'
      end
      object TradeListI_TRADE_FLAG2: TdxDBGridMaskColumn
        Visible = False
        Width = 80
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_TRADE_FLAG2'
      end
      object TradeListI_TRADE_FLAG3: TdxDBGridMaskColumn
        Visible = False
        Width = 80
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_TRADE_FLAG3'
      end
    end
  end
  object Panel3: TPanel
    Left = 285
    Top = 0
    Width = 505
    Height = 418
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 2
    object TradeDetailList: TdxDBGrid
      Left = 2
      Top = 2
      Width = 501
      Height = 414
      Bands = <
        item
        end>
      DefaultLayout = True
      HeaderPanelRowCount = 1
      KeyField = 'I_SALE_NAME'
      SummaryGroups = <>
      SummarySeparator = ', '
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      BandFont.Charset = DEFAULT_CHARSET
      BandFont.Color = clWindowText
      BandFont.Height = -11
      BandFont.Name = 'MS Sans Serif'
      BandFont.Style = []
      DataSource = TradeDetaild
      Filter.Criteria = {00000000}
      GridLineColor = clGreen
      HeaderColor = 4227327
      HeaderFont.Charset = DEFAULT_CHARSET
      HeaderFont.Color = clWindowText
      HeaderFont.Height = -11
      HeaderFont.Name = 'MS Sans Serif'
      HeaderFont.Style = []
      LookAndFeel = lfFlat
      OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoSmartRefresh, edgoSmartReload, edgoUseBookmarks]
      OptionsView = [edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
      PreviewFont.Charset = DEFAULT_CHARSET
      PreviewFont.Color = clBlue
      PreviewFont.Height = -11
      PreviewFont.Name = 'MS Sans Serif'
      PreviewFont.Style = []
      object TradeDetailListI_SALE_NAME: TdxDBGridMaskColumn
        HeaderAlignment = taCenter
        Width = 213
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_SALE_NAME'
      end
      object TradeDetailListI_QTY: TdxDBGridMaskColumn
        HeaderAlignment = taCenter
        Width = 85
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_QTY'
      end
      object TradeDetailListI_PRICE: TdxDBGridCurrencyColumn
        HeaderAlignment = taCenter
        Width = 87
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_PRICE'
        Nullable = False
      end
      object TradeDetailListI_AMOUNT: TdxDBGridCurrencyColumn
        HeaderAlignment = taCenter
        Width = 124
        BandIndex = 0
        RowIndex = 0
        FieldName = 'I_AMOUNT'
        Nullable = False
      end
    end
  end
  object TradeDetailq: TCSADOQuery
    CursorType = ctStatic
    Parameters = <>
    Left = 288
    Top = 4
    object TradeDetailqI_SALE_NAME: TStringField
      DisplayLabel = #21697#21517
      FieldName = 'I_SALE_NAME'
      ReadOnly = True
      Size = 10
    end
    object TradeDetailqI_QTY: TIntegerField
      DisplayLabel = #25968#37327
      FieldName = 'I_QTY'
      ReadOnly = True
    end
    object TradeDetailqI_PRICE: TBCDField
      DisplayLabel = #21333#20215
      FieldName = 'I_PRICE'
      ReadOnly = True
      Precision = 19
    end
    object TradeDetailqI_AMOUNT: TBCDField
      DisplayLabel = #37329#39069
      FieldName = 'I_AMOUNT'
      ReadOnly = True
      Precision = 19
    end
  end
  object Traded: TDataSource
    DataSet = Tradeq
    Left = 4
    Top = 32
  end
  object TradeDetaild: TDataSource
    DataSet = TradeDetailq
    Left = 288
    Top = 32
  end
  object Tradeq: TCSADOQuery
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      '')
    Left = 4
    Top = 4
    object TradeqI_TRADE_CD: TStringField
      DisplayLabel = #20132#26131#21495
      FieldName = 'I_TRADE_CD'
      ReadOnly = True
    end
    object TradeqI_TRADE_MONEY: TBCDField
      DisplayLabel = #37329#39069
      FieldName = 'I_TRADE_MONEY'
      ReadOnly = True
      Precision = 19
    end
    object TradeqI_TRADE_DATE: TStringField
      FieldName = 'I_TRADE_DATE'
      ReadOnly = True
      Size = 10
    end
    object TradeqI_TRADE_TIME: TStringField
      DisplayLabel = #26102#38388
      FieldName = 'I_TRADE_TIME'
      ReadOnly = True
      Size = 10
    end
    object TradeqI_EMP_CD: TStringField
      FieldName = 'I_EMP_CD'
      ReadOnly = True
      Size = 6
    end
    object TradeqI_WORK_CD: TStringField
      FieldName = 'I_WORK_CD'
      ReadOnly = True
      Size = 2
    end
    object TradeqI_TRADE_FLAG1: TIntegerField
      FieldName = 'I_TRADE_FLAG1'
      ReadOnly = True
    end
    object TradeqI_TRADE_FLAG2: TIntegerField
      FieldName = 'I_TRADE_FLAG2'
      ReadOnly = True
    end
    object TradeqI_TRADE_FLAG3: TIntegerField
      FieldName = 'I_TRADE_FLAG3'
      ReadOnly = True
    end
  end
end
