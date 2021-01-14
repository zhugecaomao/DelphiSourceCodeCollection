inherited frmCardInfoView: TfrmCardInfoView
  Left = -4
  Top = -4
  VertScrollBar.Range = 0
  BorderStyle = bsSingle
  Caption = #20250#21592#36164#26009#31649#29702
  ClientHeight = 719
  ClientWidth = 1024
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar1: TToolBar
    Width = 1024
    Height = 38
    inherited ToolButton1: TToolButton
      Wrap = False
    end
    inherited ToolButton2: TToolButton
      Left = 408
      Top = 0
    end
    inherited tbConfirm: TToolButton
      Left = 476
      Top = 0
    end
    inherited tbExport: TToolButton
      Left = 544
      Top = 0
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
  object Panel1: TPanel [1]
    Left = 0
    Top = 38
    Width = 1024
    Height = 681
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 2
  end
  inherited grdList: TdxDBGrid
    Top = 38
    Width = 1024
    Height = 681
    KeyField = 'card_id'
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoSmartRefresh, edgoSmartReload, edgoUseBookmarks]
    OptionsView = [edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
    object grdListcard_id: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 123
      BandIndex = 0
      RowIndex = 0
      FieldName = 'card_id'
    end
    object grdListcm_id: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 74
      BandIndex = 0
      RowIndex = 0
      FieldName = 'cm_id'
    end
    object grdListkind_id: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 74
      BandIndex = 0
      RowIndex = 0
      FieldName = 'kind_id'
    end
    object grdListkind_name: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 214
      BandIndex = 0
      RowIndex = 0
      FieldName = 'kind_name'
    end
    object grdListcard_money: TdxDBGridCurrencyColumn
      HeaderAlignment = taCenter
      Width = 144
      BandIndex = 0
      RowIndex = 0
      FieldName = 'card_money'
      Nullable = False
    end
    object grdListemp_name: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 214
      BandIndex = 0
      RowIndex = 0
      FieldName = 'emp_name'
    end
    object grdListcm_time: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 74
      BandIndex = 0
      RowIndex = 0
      FieldName = 'cm_time'
    end
    object grdListcm_date: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 74
      BandIndex = 0
      RowIndex = 0
      FieldName = 'cm_date'
    end
    object grdListcm_onlyno: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 214
      BandIndex = 0
      RowIndex = 0
      FieldName = 'cm_onlyno'
    end
    object grdListcm_mail: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 354
      BandIndex = 0
      RowIndex = 0
      FieldName = 'cm_mail'
    end
    object grdListcm_tel: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 214
      BandIndex = 0
      RowIndex = 0
      FieldName = 'cm_tel'
    end
    object grdListcm_address: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 354
      BandIndex = 0
      RowIndex = 0
      FieldName = 'cm_address'
    end
    object grdListcm_sex: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 58
      BandIndex = 0
      RowIndex = 0
      FieldName = 'cm_sex'
    end
    object grdListcm_old: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 74
      BandIndex = 0
      RowIndex = 0
      FieldName = 'cm_old'
    end
    object grdListcm_name: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 214
      BandIndex = 0
      RowIndex = 0
      FieldName = 'cm_name'
    end
    object grdListcard_state: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 74
      BandIndex = 0
      RowIndex = 0
      FieldName = 'card_state'
    end
    object grdListemp_id: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 74
      BandIndex = 0
      RowIndex = 0
      FieldName = 'emp_id'
    end
    object grdListlogin_id: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 74
      BandIndex = 0
      RowIndex = 0
      FieldName = 'login_id'
    end
  end
  inherited ActionList1: TActionList
    Left = 224
    Top = 160
    inherited atConfirm: TAction
      OnExecute = atConfirmExecute
    end
  end
  inherited Viewq: TCSADOQuery
    CacheSize = 1
    LockType = ltBatchOptimistic
    AfterScroll = ViewqAfterScroll
    SQL.Strings = ()
    object Viewqcard_id: TStringField
      DisplayLabel = #20250#21592#21345#21495
      FieldName = 'card_id'
      Size = 10
    end
    object Viewqcm_id: TStringField
      DisplayLabel = #23458#25143#32534#21495
      FieldName = 'cm_id'
      Size = 10
    end
    object Viewqkind_id: TIntegerField
      DisplayLabel = #31867#22411#32534#21495
      FieldName = 'kind_id'
    end
    object Viewqkind_name: TStringField
      DisplayLabel = #20250#21592#31867#22411
      FieldName = 'kind_name'
      Size = 30
    end
    object Viewqcard_money: TBCDField
      DisplayLabel = #21345#20869#37329#39069
      FieldName = 'card_money'
      Precision = 19
    end
    object Viewqemp_name: TStringField
      DisplayLabel = #38144#21806#21592#24037
      FieldName = 'emp_name'
      Size = 30
    end
    object Viewqcm_time: TStringField
      DisplayLabel = #30331#35760#26102#38388
      FieldName = 'cm_time'
      Size = 10
    end
    object Viewqcm_date: TStringField
      DisplayLabel = #30331#35760#26085#26399
      FieldName = 'cm_date'
      Size = 10
    end
    object Viewqcm_onlyno: TStringField
      DisplayLabel = #26377#25928#35777#20214
      FieldName = 'cm_onlyno'
      Size = 30
    end
    object Viewqcm_mail: TStringField
      DisplayLabel = #37038#20214#22320#22336
      FieldName = 'cm_mail'
      Size = 50
    end
    object Viewqcm_tel: TStringField
      DisplayLabel = #32852#31995#30005#35805
      FieldName = 'cm_tel'
      Size = 30
    end
    object Viewqcm_address: TStringField
      DisplayLabel = #32852#31995#22320#22336
      FieldName = 'cm_address'
      Size = 50
    end
    object Viewqcm_sex: TStringField
      DisplayLabel = #23458#25143#24615#21035
      FieldName = 'cm_sex'
      Size = 2
    end
    object Viewqcm_old: TIntegerField
      DisplayLabel = #24180#40836
      FieldName = 'cm_old'
    end
    object Viewqcm_name: TStringField
      DisplayLabel = #23458#25143#22995#21517
      FieldName = 'cm_name'
      Size = 30
    end
    object Viewqcard_state: TIntegerField
      DisplayLabel = #20250#21592#29366#24577
      FieldName = 'card_state'
    end
    object Viewqemp_id: TStringField
      FieldName = 'emp_id'
      Size = 10
    end
    object Viewqlogin_id: TStringField
      DisplayLabel = #25805#20316#21592
      FieldName = 'login_id'
      Size = 10
    end
  end
  inherited grdPrint: TdxComponentPrinter
    CurrentLink = grdPrintLink1
    object grdPrintLink1: TdxCompositionReportLink
      Caption = #26032#24314#25253#34920
      DesignerCaption = #24067#23616#35774#35745#22120
      DesignerHelpContext = 0
      PrinterPage.Footer = 6350
      PrinterPage.Header = 6350
      PrinterPage.Margins.Bottom = 12700
      PrinterPage.Margins.Left = 12700
      PrinterPage.Margins.Right = 12700
      PrinterPage.Margins.Top = 12700
      PrinterPage.PageFooter.Font.Charset = DEFAULT_CHARSET
      PrinterPage.PageFooter.Font.Color = clWindowText
      PrinterPage.PageFooter.Font.Height = -11
      PrinterPage.PageFooter.Font.Name = 'Tahoma'
      PrinterPage.PageFooter.Font.Style = []
      PrinterPage.PageHeader.Font.Charset = DEFAULT_CHARSET
      PrinterPage.PageHeader.Font.Color = clWindowText
      PrinterPage.PageHeader.Font.Height = -11
      PrinterPage.PageHeader.Font.Name = 'Tahoma'
      PrinterPage.PageHeader.Font.Style = []
      PrinterPage.PageSize.X = 215900
      PrinterPage.PageSize.Y = 279400
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      ReportTitle.Font.Charset = DEFAULT_CHARSET
      ReportTitle.Font.Color = clWindowText
      ReportTitle.Font.Height = -19
      ReportTitle.Font.Name = 'Times New Roman'
      ReportTitle.Font.Style = [fsBold]
      Items = <>
      BuiltInReportLink = True
    end
  end
end
