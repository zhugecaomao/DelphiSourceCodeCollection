object frmCardServiceFix: TfrmCardServiceFix
  Left = 249
  Top = 220
  Width = 609
  Height = 393
  Caption = #20250#21592#26381#21153#39033#30446#23450#39069#35774#23450
  Color = clGradientActiveCaption
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 601
    Height = 61
    Align = alTop
    Caption = ' '#20250#21592#20449#24687' '
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 28
      Width = 65
      Height = 13
      Caption = #20250#21592#21345#21495#65306
    end
    object Label2: TLabel
      Left = 212
      Top = 28
      Width = 65
      Height = 13
      Caption = #20250#21592#22995#21517#65306
    end
    object eCardId: TdxEdit
      Left = 76
      Top = 24
      Width = 121
      Style.BorderStyle = xbsSingle
      TabOrder = 0
    end
    object eCMName: TdxEdit
      Left = 284
      Top = 24
      Width = 121
      Style.BorderStyle = xbsSingle
      TabOrder = 1
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 61
    Width = 601
    Height = 275
    Align = alClient
    Caption = ' '#26381#21153#39033#30446#21015#34920' '
    TabOrder = 1
    object grdList: TdxDBGrid
      Left = 2
      Top = 15
      Width = 597
      Height = 258
      Bands = <
        item
        end>
      DefaultLayout = True
      HeaderPanelRowCount = 1
      KeyField = 'service_id'
      SummaryGroups = <>
      SummarySeparator = ', '
      Align = alClient
      TabOrder = 0
      DataSource = Serviced
      Filter.Criteria = {00000000}
      HeaderColor = 4227327
      LookAndFeel = lfFlat
      OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoSmartRefresh, edgoSmartReload, edgoUseBookmarks]
      OptionsView = [edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
      object grdListRecId: TdxDBGridColumn
        Visible = False
        Width = 59
        BandIndex = 0
        RowIndex = 0
        FieldName = 'RecId'
      end
      object grdListservice_id: TdxDBGridMaskColumn
        HeaderAlignment = taCenter
        Width = 100
        BandIndex = 0
        RowIndex = 0
        FieldName = 'service_id'
      end
      object grdListservice_name: TdxDBGridMaskColumn
        HeaderAlignment = taCenter
        Width = 133
        BandIndex = 0
        RowIndex = 0
        FieldName = 'service_name'
      end
      object grdListservice_money: TdxDBGridCurrencyColumn
        HeaderAlignment = taCenter
        Width = 92
        BandIndex = 0
        RowIndex = 0
        FieldName = 'service_money'
        Nullable = False
      end
      object grdListbase_comparison: TdxDBGridCurrencyColumn
        HeaderAlignment = taCenter
        Width = 86
        BandIndex = 0
        RowIndex = 0
        FieldName = 'base_comparison'
        Nullable = False
      end
      object grdListfix_money: TdxDBGridCurrencyColumn
        HeaderAlignment = taCenter
        Width = 91
        BandIndex = 0
        RowIndex = 0
        FieldName = 'fix_money'
        Nullable = False
      end
      object grdListnew_fix_money: TdxDBGridCurrencyColumn
        HeaderAlignment = taCenter
        Width = 83
        BandIndex = 0
        RowIndex = 0
        FieldName = 'new_fix_money'
        Nullable = False
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 336
    Width = 601
    Height = 30
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 2
    object Label3: TLabel
      Left = 8
      Top = 9
      Width = 65
      Height = 13
      Caption = #20250#21592#23450#39069#65306
    end
    object eNewFixMoney: TdxDBCurrencyEdit
      Left = 68
      Top = 5
      Width = 121
      Style.BorderStyle = xbsSingle
      TabOrder = 0
      DataField = 'new_fix_money'
      DataSource = Serviced
      Nullable = False
    end
    object btnSave: TBitBtn
      Left = 196
      Top = 4
      Width = 90
      Height = 22
      Caption = #20445#23384#20250#21592#23450#39069
      TabOrder = 1
      OnClick = btnSaveClick
    end
    object bbtnExit: TBitBtn
      Left = 288
      Top = 4
      Width = 75
      Height = 22
      Caption = #36864#20986
      TabOrder = 2
      OnClick = bbtnExitClick
    end
  end
  object Serviced: TDataSource
    DataSet = Viewq
    Left = 212
    Top = 144
  end
  object Viewq: TCSADOQuery
    CursorType = ctStatic
    Parameters = <>
    Left = 212
    Top = 116
    object Viewqservice_id: TStringField
      DisplayLabel = #39033#30446#32534#21495
      FieldName = 'service_id'
      Size = 10
    end
    object Viewqservice_name: TStringField
      DisplayLabel = #39033#30446#21517#31216
      FieldName = 'service_name'
      Size = 30
    end
    object Viewqservice_money: TBCDField
      DisplayLabel = #39033#30446#37329#39069
      FieldName = 'service_money'
      Precision = 19
    end
    object Viewqbase_comparison: TBCDField
      DisplayLabel = #22522#26412#25552#25104
      FieldName = 'base_comparison'
      Precision = 19
    end
    object Viewqfix_money: TCurrencyField
      DisplayLabel = #39033#30446#23450#39069
      FieldName = 'fix_money'
    end
    object Viewqnew_fix_money: TCurrencyField
      DisplayLabel = #20250#21592#23450#39069
      FieldName = 'new_fix_money'
    end
  end
end
