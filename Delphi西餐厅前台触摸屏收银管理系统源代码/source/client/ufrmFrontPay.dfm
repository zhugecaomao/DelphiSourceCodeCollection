object frmFrontPay: TfrmFrontPay
  Left = 133
  Top = 124
  BorderStyle = bsNone
  ClientHeight = 551
  ClientWidth = 800
  Color = clGradientActiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 342
    Top = 0
    Width = 458
    Height = 551
    Align = alRight
    BevelInner = bvLowered
    TabOrder = 0
    object pSaleName: TPanel
      Left = 2
      Top = 181
      Width = 454
      Height = 368
      Align = alClient
      BevelOuter = bvLowered
      Color = clGradientActiveCaption
      TabOrder = 0
    end
    object pItem: TPanel
      Left = 2
      Top = 2
      Width = 454
      Height = 179
      Align = alTop
      BevelOuter = bvLowered
      Color = clGradientActiveCaption
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 342
    Height = 551
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 1
    object Panel5: TPanel
      Left = 2
      Top = 444
      Width = 338
      Height = 105
      Align = alBottom
      BevelOuter = bvLowered
      Color = clGradientActiveCaption
      TabOrder = 0
      object Label9: TLabel
        Left = 12
        Top = 9
        Width = 96
        Height = 33
        Caption = #21512#35745#65306
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -32
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object eMoney: TdxCurrencyEdit
        Left = 92
        Top = 2
        Width = 229
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -32
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Style.BorderColor = clNavy
        Style.BorderStyle = xbsSingle
        Style.ButtonStyle = btsSimple
        TabOrder = 0
        Alignment = taRightJustify
        StoredValues = 1
      end
      object bbtnInner: TdxfColorButton
        Left = 24
        Top = 51
        Width = 50
        Height = 50
        Caption.Strings = (
          #20869#29992)
        Color = clRed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -24
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        OnClick = bbtnInnerClick
      end
      object bbtnOutSelf: TdxfColorButton
        Left = 91
        Top = 51
        Width = 50
        Height = 50
        Caption.Strings = (
          #22806#24102)
        Color = clLime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -24
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        OnClick = bbtnOutSelfClick
      end
      object bbtnOutSend: TdxfColorButton
        Left = 158
        Top = 51
        Width = 50
        Height = 50
        Caption.Strings = (
          #22806#36865)
        Color = clLime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -24
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        OnClick = bbtnOutSendClick
      end
      object btnCharge: TdxfColorButton
        Left = 225
        Top = 51
        Width = 50
        Height = 50
        Caption.Strings = (
          #32467#36134)
        Color = 164351
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -24
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        OnClick = btnChargeClick
      end
    end
    object Panel6: TPanel
      Left = 2
      Top = 2
      Width = 338
      Height = 215
      Align = alTop
      BevelOuter = bvLowered
      Color = clGradientActiveCaption
      TabOrder = 1
      object btnExit: TdxfColorButton
        Left = 4
        Top = 3
        Width = 50
        Height = 50
        Caption.Strings = (
          #36864#20986)
        Color = clRed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -24
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        OnClick = btnExitClick
      end
      object bbtnDelAll: TdxfColorButton
        Left = 71
        Top = 3
        Width = 50
        Height = 50
        Caption.Strings = (
          #25913#39184)
        Color = clBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -24
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        OnClick = bbtnDelAllClick
      end
      object btnVip: TdxfColorButton
        Left = 138
        Top = 3
        Width = 50
        Height = 50
        Caption.Strings = (
          #20250#21592)
        Color = clBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -24
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object btnDiscount: TdxfColorButton
        Left = 205
        Top = 3
        Width = 50
        Height = 50
        Caption.Strings = (
          #25171#25240)
        Color = clBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -24
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        OnClick = btnDiscountClick
      end
      object bbtnDelete: TdxfColorButton
        Left = 272
        Top = 3
        Width = 50
        Height = 50
        Caption.Strings = (
          #20316#24223)
        Color = clBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -24
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        OnClick = bbtnDeleteClick
      end
      object bbtnChange: TdxfColorButton
        Left = 4
        Top = 55
        Width = 50
        Height = 50
        Caption.Strings = (
          #26356#27491)
        Color = clBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -24
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        OnClick = bbtnChangeClick
      end
      object bbtnSwitchDrink: TdxfColorButton
        Left = 71
        Top = 55
        Width = 50
        Height = 50
        Caption.Strings = (
          #25442#39278)
        Color = clBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -24
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object bbtnLSM: TdxfColorButton
        Left = 138
        Top = 55
        Width = 50
        Height = 50
        Caption.Strings = (
          'LSM')
        Color = clBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -24
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        OnClick = bbtnLSMClick
      end
      object bbtnWait: TdxfColorButton
        Left = 205
        Top = 55
        Width = 50
        Height = 50
        Caption.Strings = (
          #25346#36134)
        Color = clBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -24
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        OnClick = bbtnWaitClick
      end
      object bbtnTradeInfo: TdxfColorButton
        Left = 272
        Top = 55
        Width = 50
        Height = 50
        Caption.Strings = (
          #26597#21333)
        Color = clBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -24
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        OnClick = bbtnTradeInfoClick
      end
      object MSComm: TMSComm
        Left = 152
        Top = 40
        Width = 32
        Height = 32
        ControlData = {
          2143341208000000ED030000ED03000001568A64000006000000010000040000
          00020000802500000000080000000000000000003F00000001000000}
      end
      object btnNum4: TdxfColorButton
        Tag = 4
        Left = 272
        Top = 107
        Width = 50
        Height = 50
        Caption.Strings = (
          '4')
        Color = clBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -24
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object btnNum3: TdxfColorButton
        Tag = 3
        Left = 205
        Top = 107
        Width = 50
        Height = 50
        Caption.Strings = (
          '3')
        Color = clBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -24
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object btnNum2: TdxfColorButton
        Tag = 2
        Left = 138
        Top = 107
        Width = 50
        Height = 50
        Caption.Strings = (
          '2')
        Color = clBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -24
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object btnNum1: TdxfColorButton
        Tag = 1
        Left = 71
        Top = 107
        Width = 50
        Height = 50
        Caption.Strings = (
          '1')
        Color = clBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -24
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object btnNum0: TdxfColorButton
        Left = 4
        Top = 107
        Width = 50
        Height = 50
        Caption.Strings = (
          '0')
        Color = clBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -24
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object btnNumNext: TdxfColorButton
        Left = 272
        Top = 159
        Width = 50
        Height = 50
        Caption.Strings = (
          '>>')
        Color = clBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -24
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        OnClick = btnNumNextClick
      end
      object btnEditNum: TdxfColorButton
        Left = 205
        Top = 159
        Width = 50
        Height = 50
        Caption.Strings = (
          #20462#25913)
        Color = clBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -24
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        OnClick = btnEditNumClick
      end
    end
    object Panel7: TPanel
      Left = 2
      Top = 217
      Width = 338
      Height = 227
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 2
      object grdList: TdxDBGrid
        Left = 1
        Top = 1
        Width = 336
        Height = 225
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        KeyField = 'RecId'
        SummaryGroups = <>
        SummarySeparator = ', '
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        BandFont.Charset = DEFAULT_CHARSET
        BandFont.Color = clWindowText
        BandFont.Height = -11
        BandFont.Name = 'MS Sans Serif'
        BandFont.Style = []
        DataSource = Consumed
        Filter.Criteria = {00000000}
        GridLineColor = 4227072
        HeaderColor = clBlue
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWhite
        HeaderFont.Height = -11
        HeaderFont.Name = 'MS Sans Serif'
        HeaderFont.Style = []
        LookAndFeel = lfFlat
        OptionsCustomize = [edgoBandMoving, edgoBandSizing]
        OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoSmartRefresh, edgoSmartReload, edgoUseBookmarks]
        OptionsView = [edgoBandHeaderWidth, edgoRowSelect]
        PreviewFont.Charset = DEFAULT_CHARSET
        PreviewFont.Color = clBlue
        PreviewFont.Height = -11
        PreviewFont.Name = 'MS Sans Serif'
        PreviewFont.Style = []
        object grdListRecId: TdxDBGridColumn
          Visible = False
          BandIndex = 0
          RowIndex = 0
          FieldName = 'RecId'
        end
        object grdListI_SALE_CD: TdxDBGridMaskColumn
          Visible = False
          BandIndex = 0
          RowIndex = 0
          FieldName = 'I_SALE_CD'
        end
        object grdListI_SALE_ITEM_CD: TdxDBGridMaskColumn
          Visible = False
          BandIndex = 0
          RowIndex = 0
          FieldName = 'I_SALE_ITEM_CD'
        end
        object grdListI_SALE_NAME: TdxDBGridMaskColumn
          HeaderAlignment = taCenter
          BandIndex = 0
          RowIndex = 0
          FieldName = 'I_SALE_NAME'
        end
        object grdListI_QTY: TdxDBGridMaskColumn
          HeaderAlignment = taCenter
          BandIndex = 0
          RowIndex = 0
          FieldName = 'I_QTY'
        end
        object grdListI_PRICE: TdxDBGridCurrencyColumn
          Visible = False
          BandIndex = 0
          RowIndex = 0
          FieldName = 'I_PRICE'
          Nullable = False
        end
        object grdListI_MONEY: TdxDBGridCurrencyColumn
          HeaderAlignment = taCenter
          BandIndex = 0
          RowIndex = 0
          FieldName = 'I_MONEY'
          Nullable = False
        end
      end
    end
  end
  object memConsume: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 4
    Top = 228
    object memConsumeI_SALE_CD: TStringField
      FieldName = 'I_SALE_CD'
      Size = 6
    end
    object memConsumeI_SALE_ITEM_CD: TStringField
      FieldName = 'I_SALE_ITEM_CD'
      Size = 4
    end
    object memConsumeI_SALE_NAME: TStringField
      DisplayLabel = #21697#21517
      FieldName = 'I_SALE_NAME'
      Size = 30
    end
    object memConsumeI_FIX_SALE: TBooleanField
      FieldName = 'I_FIX_SALE'
    end
    object memConsumeI_SALE_RECORD: TBooleanField
      FieldName = 'I_SALE_RECORD'
    end
    object memConsumeI_OTHER_RECORD: TBooleanField
      FieldName = 'I_OTHER_RECORD'
    end
    object memConsumeI_LSM: TBooleanField
      FieldName = 'I_LSM'
    end
    object memConsumeI_QTY: TIntegerField
      DisplayLabel = #25968#37327
      FieldName = 'I_QTY'
    end
    object memConsumeI_PRICE: TCurrencyField
      FieldName = 'I_PRICE'
    end
    object memConsumeI_MONEY: TCurrencyField
      DisplayLabel = #37329#39069
      FieldName = 'I_MONEY'
    end
    object memConsumeI_FIX_SALE_CD: TStringField
      FieldName = 'I_FIX_SALE_CD'
      Size = 6
    end
  end
  object Consumed: TDataSource
    DataSet = memConsume
    Left = 4
    Top = 256
  end
  object SaleItemq: TCSADOQuery
    CursorType = ctStatic
    Parameters = <>
    Left = 344
    Top = 4
    object SaleItemqI_ORIGINAL_CD: TStringField
      FieldName = 'I_ITEM_CD'
      Size = 4
    end
    object SaleItemqI_ORIGINAL_NAME: TStringField
      FieldName = 'I_ITEM_NAME'
      Size = 30
    end
    object SaleItemqI_ITEM_COLOR: TStringField
      FieldName = 'I_ITEM_COLOR'
      Size = 50
    end
  end
  object Saleq: TCSADOQuery
    CursorType = ctStatic
    Parameters = <>
    Left = 348
    Top = 184
    object SaleqI_SALE_CD: TStringField
      FieldName = 'I_SALE_CD'
      Size = 6
    end
    object SaleqI_SALE_NAME: TStringField
      FieldName = 'I_SALE_NAME'
      Size = 30
    end
    object SaleqI_PRICE: TBCDField
      FieldName = 'I_PRICE'
      Precision = 19
    end
    object SaleqI_UNIT: TStringField
      FieldName = 'I_UNIT'
      Size = 2
    end
    object SaleqI_FIX_SALE: TBooleanField
      FieldName = 'I_FIX_SALE'
    end
    object SaleqI_SALE_RECORD: TBooleanField
      FieldName = 'I_SALE_RECORD'
    end
    object SaleqI_OTHER_RECORD: TBooleanField
      FieldName = 'I_OTHER_RECORD'
    end
    object SaleqI_LSM: TBooleanField
      FieldName = 'I_LSM'
    end
    object SaleqI_SALE_ITEM_CD: TStringField
      FieldName = 'I_SALE_ITEM_CD'
      Size = 4
    end
    object SaleqI_HELPER_CODE: TStringField
      FieldName = 'I_HELPER_CODE'
      Size = 10
    end
  end
  object Tradeq: TCSADOQuery
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      '')
    Left = 32
    Top = 228
    object TradeqI_TRADE_CD: TStringField
      FieldName = 'I_TRADE_CD'
    end
    object TradeqI_MACHINES_CD: TStringField
      FieldName = 'I_MACHINES_CD'
      Size = 2
    end
    object TradeqI_TRADE_MONEY: TBCDField
      FieldName = 'I_TRADE_MONEY'
      Precision = 19
    end
    object TradeqI_TRADE_DATE: TStringField
      FieldName = 'I_TRADE_DATE'
      Size = 10
    end
    object TradeqI_TRADE_TIME: TStringField
      FieldName = 'I_TRADE_TIME'
      Size = 10
    end
    object TradeqI_EMP_CD: TStringField
      FieldName = 'I_EMP_CD'
      Size = 6
    end
    object TradeqI_WORK_CD: TStringField
      FieldName = 'I_WORK_CD'
      Size = 2
    end
    object TradeqI_TRADE_FLAG1: TIntegerField
      FieldName = 'I_TRADE_FLAG1'
    end
    object TradeqI_TRADE_FLAG2: TIntegerField
      FieldName = 'I_TRADE_FLAG2'
    end
    object TradeqI_TRADE_FLAG3: TIntegerField
      FieldName = 'I_TRADE_FLAG3'
    end
    object TradeqI_DISCOUNT: TIntegerField
      FieldName = 'I_DISCOUNT'
    end
  end
  object TradeDetailq: TCSADOQuery
    CursorType = ctStatic
    Parameters = <>
    Left = 32
    Top = 256
    object TradeDetailqI_TRADE_CD: TStringField
      FieldName = 'I_TRADE_CD'
    end
    object TradeDetailqI_SALE_CD: TStringField
      FieldName = 'I_SALE_CD'
      Size = 6
    end
    object TradeDetailqI_SALE_ITEM_CD: TStringField
      FieldName = 'I_SALE_ITEM_CD'
      Size = 4
    end
    object TradeDetailqI_QTY: TIntegerField
      FieldName = 'I_QTY'
    end
    object TradeDetailqI_PRICE: TBCDField
      FieldName = 'I_PRICE'
      Precision = 19
    end
    object TradeDetailqI_AMOUNT: TBCDField
      FieldName = 'I_AMOUNT'
      Precision = 19
    end
    object TradeDetailqI_TRADE_FLAG1: TIntegerField
      FieldName = 'I_TRADE_FLAG1'
    end
    object TradeDetailqI_TRADE_FLAG2: TIntegerField
      FieldName = 'I_TRADE_FLAG2'
    end
    object TradeDetailqI_TRADE_FLAG3: TIntegerField
      FieldName = 'I_TRADE_FLAG3'
    end
    object TradeDetailqI_TRADE_FLAG4: TIntegerField
      FieldName = 'I_TRADE_FLAG4'
    end
    object TradeDetailqI_TRADE_FLAG5: TIntegerField
      FieldName = 'I_TRADE_FLAG5'
    end
    object TradeDetailqI_FIX_SALE_CD: TStringField
      FieldName = 'I_FIX_SALE_CD'
      Size = 6
    end
  end
  object FixSaleq: TCSADOQuery
    Parameters = <>
    Left = 376
    Top = 184
    object FixSaleqI_ITEM_CD: TStringField
      FieldName = 'I_ITEM_CD'
      Size = 6
    end
    object FixSaleqI_SALE_CD: TStringField
      FieldName = 'I_SALE_CD'
      Size = 6
    end
    object FixSaleqI_SALE_NAME: TStringField
      FieldName = 'I_SALE_NAME'
      Size = 30
    end
    object FixSaleqI_PRICE: TBCDField
      FieldName = 'I_PRICE'
      Precision = 19
    end
    object FixSaleqI_UNIT: TStringField
      FieldName = 'I_UNIT'
      Size = 2
    end
    object FixSaleqI_FIX_SALE: TBooleanField
      FieldName = 'I_FIX_SALE'
    end
    object FixSaleqI_SALE_RECORD: TBooleanField
      FieldName = 'I_SALE_RECORD'
    end
    object FixSaleqI_OTHER_RECORD: TBooleanField
      FieldName = 'I_OTHER_RECORD'
    end
    object FixSaleqI_LSM: TBooleanField
      FieldName = 'I_LSM'
    end
    object FixSaleqI_SALE_ITEM_CD: TStringField
      FieldName = 'I_SALE_ITEM_CD'
      Size = 4
    end
    object FixSaleqI_HELPER_CODE: TStringField
      FieldName = 'I_HELPER_CODE'
      Size = 10
    end
  end
  object memLock: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 60
    Top = 228
    object memLockI_SALE_CD: TStringField
      FieldName = 'I_SALE_CD'
      Size = 6
    end
    object memLockI_SALE_ITEM_CD: TStringField
      FieldName = 'I_SALE_ITEM_CD'
      Size = 4
    end
    object memLockI_SALE_NAME: TStringField
      FieldName = 'I_SALE_NAME'
      Size = 30
    end
    object memLockI_FIX_SALE: TBooleanField
      FieldName = 'I_FIX_SALE'
    end
    object memLockI_SALE_RECORD: TBooleanField
      FieldName = 'I_SALE_RECORD'
    end
    object memLockI_OTHER_PECORD: TBooleanField
      FieldName = 'I_OTHER_PECORD'
    end
    object memLockI_LSM: TBooleanField
      FieldName = 'I_LSM'
    end
    object memLockI_QTY: TIntegerField
      FieldName = 'I_QTY'
    end
    object memLockI_PRICE: TCurrencyField
      FieldName = 'I_PRICE'
    end
    object memLockI_MONEY: TCurrencyField
      FieldName = 'I_MONEY'
    end
    object memLockI_FIX_SALE_CD: TStringField
      FieldName = 'I_FIX_SALE_CD'
      Size = 6
    end
  end
  object LSMq: TCSADOQuery
    Parameters = <>
    Left = 404
    Top = 184
    object LSMqI_SALE_CD: TStringField
      FieldName = 'I_SALE_CD'
      Size = 6
    end
    object LSMqI_SALE_NAME: TStringField
      FieldName = 'I_SALE_NAME'
      Size = 30
    end
    object LSMqI_PRICE: TBCDField
      FieldName = 'I_PRICE'
      Precision = 19
    end
    object LSMqI_UNIT: TStringField
      FieldName = 'I_UNIT'
      Size = 2
    end
    object LSMqI_FIX_SALE: TBooleanField
      FieldName = 'I_FIX_SALE'
    end
    object LSMqI_SALE_RECORD: TBooleanField
      FieldName = 'I_SALE_RECORD'
    end
    object LSMqI_OTHER_RECORD: TBooleanField
      FieldName = 'I_OTHER_RECORD'
    end
    object LSMqI_LSM: TBooleanField
      FieldName = 'I_LSM'
    end
    object LSMqI_SALE_ITEM_CD: TStringField
      FieldName = 'I_SALE_ITEM_CD'
      Size = 4
    end
    object LSMqI_HELPER_CODE: TStringField
      FieldName = 'I_HELPER_CODE'
      Size = 10
    end
  end
end
