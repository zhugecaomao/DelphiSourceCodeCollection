inherited frmOriginalView: TfrmOriginalView
  Left = 50
  Top = 197
  Width = 800
  Height = 514
  ActiveControl = eOriginalCD
  Caption = #21407#26009#31649#29702
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar1: TToolBar
    Width = 792
    Height = 38
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
    Top = 297
    Width = 792
    Height = 190
    Filter.Criteria = {00000000}
    OptionsDB = [edgoCanAppend, edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoUseBookmarks]
    OptionsView = [edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
    object grdListI_ORIGINAL_CD: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 91
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_ORIGINAL_CD'
    end
    object grdListI_PROPERTY_CODE: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 89
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_PROPERTY_CODE'
    end
    object grdListI_ORIGINAL_NAME: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 214
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_ORIGINAL_NAME'
    end
    object grdListI_ORIGINAL_ITEM_CD: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 58
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_ORIGINAL_ITEM_CD'
    end
    object grdListI_MODEL: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 144
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_MODEL'
    end
    object grdListI_UNIT5: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 74
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_UNIT5'
    end
    object grdListI_QTY1: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 74
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_QTY1'
    end
    object grdListI_UNIT1: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 74
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_UNIT1'
    end
    object grdListI_QTY2: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 74
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_QTY2'
    end
    object grdListI_UNIT2: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 74
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_UNIT2'
    end
    object grdListI_QTY3: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 77
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_QTY3'
    end
    object grdListI_UNIT3: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 74
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_UNIT3'
    end
    object grdListI_QTY4: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 81
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_QTY4'
    end
    object grdListI_UNIT4: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 74
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_UNIT4'
    end
    object grdListI_DAY: TdxDBGridCheckColumn
      HeaderAlignment = taCenter
      Width = 100
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_DAY'
      ValueChecked = 'True'
      ValueGrayed = 'True'
      ValueUnchecked = 'False'
      DisplayUnChecked = 'False'
      DisplayNull = 'False'
    end
    object grdListI_WEEK: TdxDBGridCheckColumn
      HeaderAlignment = taCenter
      Width = 100
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_WEEK'
      ValueChecked = 'True'
      ValueGrayed = 'True'
      ValueUnchecked = 'False'
      DisplayUnChecked = 'False'
      DisplayNull = 'False'
    end
    object grdListI_MONTH: TdxDBGridCheckColumn
      HeaderAlignment = taCenter
      Width = 100
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_MONTH'
      ValueChecked = 'True'
      ValueGrayed = 'True'
      ValueUnchecked = 'False'
      DisplayUnChecked = 'False'
      DisplayNull = 'False'
    end
    object grdListI_COST_CHECK: TdxDBGridCheckColumn
      HeaderAlignment = taCenter
      Width = 100
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_COST_CHECK'
      ValueChecked = 'True'
      ValueGrayed = 'True'
      ValueUnchecked = 'False'
      DisplayUnChecked = 'False'
      DisplayNull = 'False'
    end
    object grdListI_PURCHASE: TdxDBGridMaskColumn
      HeaderAlignment = taCenter
      Width = 74
      BandIndex = 0
      RowIndex = 0
      FieldName = 'I_PURCHASE'
    end
  end
  object Panel1: TPanel [2]
    Left = 0
    Top = 38
    Width = 792
    Height = 259
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 2
    object Label1: TLabel
      Left = 4
      Top = 4
      Width = 26
      Height = 13
      Caption = #21697#21495
    end
    object Label2: TLabel
      Left = 136
      Top = 4
      Width = 39
      Height = 13
      Caption = #23646#24615#30721
    end
    object Label3: TLabel
      Left = 264
      Top = 4
      Width = 26
      Height = 13
      Caption = #21697#21517
    end
    object Label4: TLabel
      Left = 396
      Top = 4
      Width = 52
      Height = 13
      Caption = #21407#26009#20998#31867
    end
    object Label5: TLabel
      Left = 528
      Top = 4
      Width = 26
      Height = 13
      Caption = #35268#26684
    end
    object Label6: TLabel
      Left = 4
      Top = 48
      Width = 52
      Height = 13
      Caption = #22806#21253#21253#35013
    end
    object Label7: TLabel
      Left = 192
      Top = 48
      Width = 52
      Height = 13
      Caption = #20869#21253#21253#35013
    end
    object Label8: TLabel
      Left = 374
      Top = 48
      Width = 52
      Height = 13
      Caption = #31995#25968#21333#20301
    end
    object Label9: TLabel
      Left = 566
      Top = 44
      Width = 52
      Height = 13
      Caption = #25104#26412#21333#20301
    end
    object Label10: TLabel
      Left = 656
      Top = 4
      Width = 52
      Height = 13
      Caption = #30424#28857#21333#20301
    end
    object labUnit1: TLabel
      Left = 84
      Top = 68
      Width = 48
      Height = 13
      AutoSize = False
      Caption = '/'
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object labUnit2: TLabel
      Left = 272
      Top = 68
      Width = 44
      Height = 13
      AutoSize = False
      Caption = '/'
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object labUnit3: TLabel
      Left = 454
      Top = 68
      Width = 46
      Height = 13
      AutoSize = False
      Caption = '/'
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object labUnit4: TLabel
      Left = 646
      Top = 68
      Width = 38
      Height = 13
      AutoSize = False
      Caption = '/'
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object rbgPurchase: TRadioGroup
      Left = 8
      Top = 148
      Width = 185
      Height = 105
      Caption = #37319#36141#32423#21035
      ItemIndex = 0
      Items.Strings = (
        #24503#30431
        #33258#37319
        #32479#35758)
      TabOrder = 0
    end
    object eOriginalCD: TdxEdit
      Left = 4
      Top = 20
      Width = 121
      Style.BorderStyle = xbsSingle
      TabOrder = 1
      MaxLength = 6
      StoredValues = 2
    end
    object ePropertyCD: TdxEdit
      Left = 134
      Top = 20
      Width = 121
      Style.BorderStyle = xbsSingle
      TabOrder = 2
      MaxLength = 4
      StoredValues = 2
    end
    object eOriginalName: TdxEdit
      Left = 264
      Top = 20
      Width = 121
      Style.BorderStyle = xbsSingle
      TabOrder = 3
      MaxLength = 30
      StoredValues = 2
    end
    object eItemCD: TdxPickEdit
      Left = 395
      Top = 20
      Width = 122
      Style.BorderStyle = xbsSingle
      TabOrder = 4
    end
    object eModel: TdxEdit
      Left = 525
      Top = 20
      Width = 121
      Style.BorderStyle = xbsSingle
      TabOrder = 5
      MaxLength = 20
      StoredValues = 2
    end
    object eUnit5: TdxEdit
      Left = 656
      Top = 20
      Width = 121
      Style.BorderStyle = xbsSingle
      TabOrder = 6
      OnChange = eUnit5Change
    end
    object eQty1: TdxEdit
      Left = 4
      Top = 64
      Width = 81
      Style.BorderStyle = xbsSingle
      Style.ButtonStyle = btsDefault
      TabOrder = 7
    end
    object eUnit1: TdxEdit
      Left = 130
      Top = 64
      Width = 53
      Style.BorderStyle = xbsSingle
      Style.ButtonStyle = btsDefault
      TabOrder = 8
    end
    object eQty2: TdxEdit
      Left = 192
      Top = 64
      Width = 81
      Style.BorderStyle = xbsSingle
      Style.ButtonStyle = btsDefault
      TabOrder = 9
    end
    object eUnit2: TdxEdit
      Left = 316
      Top = 64
      Width = 53
      Style.BorderStyle = xbsSingle
      Style.ButtonStyle = btsDefault
      TabOrder = 10
    end
    object eQty3: TdxEdit
      Left = 374
      Top = 64
      Width = 81
      Style.BorderStyle = xbsSingle
      Style.ButtonStyle = btsDefault
      TabOrder = 11
    end
    object eUnit3: TdxEdit
      Left = 500
      Top = 64
      Width = 53
      Style.BorderStyle = xbsSingle
      Style.ButtonStyle = btsDefault
      TabOrder = 12
    end
    object eQty4: TdxEdit
      Left = 566
      Top = 64
      Width = 81
      Style.BorderStyle = xbsSingle
      Style.ButtonStyle = btsDefault
      TabOrder = 13
    end
    object eUnit4: TdxEdit
      Left = 684
      Top = 64
      Width = 53
      Style.BorderStyle = xbsSingle
      Style.ButtonStyle = btsDefault
      TabOrder = 14
    end
    object chbDay: TdxCheckEdit
      Left = 8
      Top = 92
      Width = 49
      TabOrder = 15
      Caption = #26085#30424
    end
    object chbWeek: TdxCheckEdit
      Left = 68
      Top = 92
      Width = 49
      TabOrder = 16
      Caption = #21608#30424
    end
    object chbMonth: TdxCheckEdit
      Left = 128
      Top = 92
      Width = 49
      TabOrder = 17
      Caption = #26376#30424
    end
    object chbCostCheck: TdxCheckEdit
      Left = 8
      Top = 120
      Width = 121
      TabOrder = 18
      Caption = #26159'/'#21542#25104#26412#26680#31639
    end
  end
  inherited Viewq: TCSADOQuery
    BeforePost = ViewqBeforePost
    AfterScroll = ViewqAfterScroll
    SQL.Strings = (
      '')
    Left = 336
    Top = 268
    object ViewqI_ORIGINAL_CD: TStringField
      DisplayLabel = #21697#21495
      FieldName = 'I_ORIGINAL_CD'
      Size = 6
    end
    object ViewqI_PROPERTY_CODE: TStringField
      DisplayLabel = #23646#24615#30721
      FieldName = 'I_PROPERTY_CODE'
      Size = 4
    end
    object ViewqI_ORIGINAL_NAME: TStringField
      DisplayLabel = #21697#21517
      FieldName = 'I_ORIGINAL_NAME'
      Size = 30
    end
    object ViewqI_ORIGINAL_ITEM_CD: TStringField
      DisplayLabel = #21407#26009#20998#31867
      FieldName = 'I_ORIGINAL_ITEM_CD'
      Size = 4
    end
    object ViewqI_UNIT1: TStringField
      DisplayLabel = #22806#21253#21253#35013
      FieldName = 'I_UNIT1'
      FixedChar = True
      Size = 10
    end
    object ViewqI_UNIT2: TStringField
      DisplayLabel = #20869#21253#21253#35013
      FieldName = 'I_UNIT2'
      FixedChar = True
      Size = 10
    end
    object ViewqI_UNIT3: TStringField
      DisplayLabel = #31995#25968#21333#20301
      FieldName = 'I_UNIT3'
      FixedChar = True
      Size = 10
    end
    object ViewqI_UNIT4: TStringField
      DisplayLabel = #25104#26412#21333#20301
      FieldName = 'I_UNIT4'
      FixedChar = True
      Size = 10
    end
    object ViewqI_QTY1: TIntegerField
      DisplayLabel = #22806#21253#25968#37327
      FieldName = 'I_QTY1'
    end
    object ViewqI_QTY2: TIntegerField
      DisplayLabel = #20869#21253#25968#37327
      FieldName = 'I_QTY2'
    end
    object ViewqI_QTY3: TIntegerField
      DisplayLabel = #31995#25968#25968#37327
      FieldName = 'I_QTY3'
    end
    object ViewqI_QTY4: TFloatField
      DisplayLabel = #25104#26412#25968#37327
      FieldName = 'I_QTY4'
    end
    object ViewqI_UNIT5: TStringField
      DisplayLabel = #30424#28857#21333#20301
      FieldName = 'I_UNIT5'
      FixedChar = True
      Size = 10
    end
    object ViewqI_MODEL: TStringField
      DisplayLabel = #35268#26684
      FieldName = 'I_MODEL'
    end
    object ViewqI_DAY: TBooleanField
      DisplayLabel = #26085#30424
      FieldName = 'I_DAY'
    end
    object ViewqI_WEEK: TBooleanField
      DisplayLabel = #21608#30424
      FieldName = 'I_WEEK'
    end
    object ViewqI_MONTH: TBooleanField
      DisplayLabel = #26376#30424
      FieldName = 'I_MONTH'
    end
    object ViewqI_COST_CHECK: TBooleanField
      DisplayLabel = #25104#26412#26680#31639
      FieldName = 'I_COST_CHECK'
    end
    object ViewqI_PURCHASE: TStringField
      DisplayLabel = #37319#36141#32423#21035
      FieldName = 'I_PURCHASE'
      Size = 10
    end
  end
end
