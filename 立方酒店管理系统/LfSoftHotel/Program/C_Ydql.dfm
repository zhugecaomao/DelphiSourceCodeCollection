inherited YdqlForm: TYdqlForm
  Height = 450
  ActiveControl = edtValue
  Caption = #39044#23450
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Height = 80
    inherited lblTitle: TLabel
      Caption = #39044#23450#28165#29702
    end
    inherited DBNavPlus1: TDBNavPlus
      Hints.Strings = ()
      Visible = False
    end
    inherited cmbOption: TComboBox
      ItemIndex = 0
      Text = #39044#23450#39033#30446
      Items.Strings = (
        #39044#23450#39033#30446)
    end
    inherited btnLoca: TBitBtn
      OnClick = btnLocaClick
    end
    inherited DBNavPlus2: TDBNavPlus
      Hints.Strings = ()
      Visible = False
    end
    inherited lblState: TStaticText
      Visible = False
    end
  end
  inherited Panel2: TPanel
    Top = 80
    Height = 302
    inherited Bevel1: TBevel
      Height = 282
    end
    object dbgDetail: TDBGrid
      Left = 10
      Top = 10
      Width = 522
      Height = 282
      Align = alClient
      DataSource = dsWork
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'D_SX'
          Title.Alignment = taCenter
          Title.Caption = #23646#24615
          Width = 60
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_XFMC'
          Title.Alignment = taCenter
          Title.Caption = #39044#23450#31867#21035
          Width = 70
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_XMMC'
          Title.Alignment = taCenter
          Title.Caption = #39044#23450#39033#30446
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_XM'
          Title.Alignment = taCenter
          Title.Caption = #22995#21517
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_DWMC'
          Title.Alignment = taCenter
          Title.Caption = #21333#20301#21517#31216
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_JE'
          Title.Alignment = taCenter
          Title.Caption = #37329#39069
          Visible = True
        end>
    end
  end
  inherited Panel3: TPanel
    Top = 382
    inherited btnPrint: TBitBtn
      Visible = False
    end
    object btnClear: TBitBtn
      Left = 8
      Top = 7
      Width = 75
      Height = 25
      Caption = #28165#31354'(&K)'
      TabOrder = 3
      OnClick = btnClearClick
      NumGlyphs = 2
    end
  end
  inherited qryWork: TQuery
    BeforeDelete = nil
    OnCalcFields = qryWorkCalcFields
    DatabaseName = 'LFHOTELUSER'
    RequestLive = True
    SQL.Strings = (
      'select * from YDD where (D_RZ="2")or(D_YDRQ<:YDRQ)')
    ParamData = <
      item
        DataType = ftDate
        Name = 'YDRQ'
        ParamType = ptInput
      end>
    object qryWorkD_YDBH: TStringField
      FieldName = 'D_YDBH'
      Origin = 'LFHOTELUSER."YDD.DB".D_YDBH'
      Size = 12
    end
    object qryWorkD_HH: TIntegerField
      FieldName = 'D_HH'
      Origin = 'LFHOTELUSER."YDD.DB".D_HH'
    end
    object qryWorkD_KRBH: TStringField
      FieldName = 'D_KRBH'
      Origin = 'LFHOTELUSER."YDD.DB".D_KRBH'
      Size = 12
    end
    object qryWorkD_YDRQ: TDateField
      FieldName = 'D_YDRQ'
      Origin = 'LFHOTELUSER."YDD.DB".D_YDRQ'
    end
    object qryWorkD_YDSJ: TTimeField
      FieldName = 'D_YDSJ'
      Origin = 'LFHOTELUSER."YDD.DB".D_YDSJ'
    end
    object qryWorkD_XFBH: TStringField
      FieldName = 'D_XFBH'
      Origin = 'LFHOTELUSER."YDD.DB".D_XFBH'
      Size = 5
    end
    object qryWorkD_XMMC: TStringField
      FieldName = 'D_XMMC'
      Origin = 'LFHOTELUSER."YDD.DB".D_XMMC'
      Size = 10
    end
    object qryWorkD_SL: TFloatField
      FieldName = 'D_SL'
      Origin = 'LFHOTELUSER."YDD.DB".D_SL'
    end
    object qryWorkD_DJ: TCurrencyField
      FieldName = 'D_DJ'
      Origin = 'LFHOTELUSER."YDD.DB".D_DJ'
    end
    object qryWorkD_JE: TCurrencyField
      FieldName = 'D_JE'
      Origin = 'LFHOTELUSER."YDD.DB".D_JE'
    end
    object qryWorkD_RZ: TStringField
      FieldName = 'D_RZ'
      Origin = 'LFHOTELUSER."YDD.DB".D_RZ'
      Size = 1
    end
    object qryWorkD_CZYXM: TStringField
      FieldName = 'D_CZYXM'
      Origin = 'LFHOTELUSER."YDD.DB".D_CZYXM'
      Size = 8
    end
    object qryWorkD_BZ: TStringField
      FieldName = 'D_BZ'
      Origin = 'LFHOTELUSER."YDD.DB".D_BZ'
    end
    object qryWorkD_XM: TStringField
      FieldKind = fkLookup
      FieldName = 'D_XM'
      LookupDataSet = tblYdxx
      LookupKeyFields = 'D_KRBH'
      LookupResultField = 'D_XM'
      KeyFields = 'D_KRBH'
      Lookup = True
    end
    object qryWorkD_DWMC: TStringField
      FieldKind = fkLookup
      FieldName = 'D_DWMC'
      LookupDataSet = tblYdxx
      LookupKeyFields = 'D_KRBH'
      LookupResultField = 'D_DWMC'
      KeyFields = 'D_KRBH'
      Lookup = True
    end
    object qryWorkD_SX: TStringField
      FieldKind = fkCalculated
      FieldName = 'D_SX'
      Calculated = True
    end
    object qryWorkD_XFMC: TStringField
      FieldKind = fkLookup
      FieldName = 'D_XFMC'
      LookupDataSet = HotelData.tblXFDM
      LookupKeyFields = 'D_XFBH'
      LookupResultField = 'D_XFMC'
      KeyFields = 'D_XFBH'
      Lookup = True
    end
  end
  object tblYdxx: TTable
    DatabaseName = 'LFHOTELUSER'
    TableName = 'YDXX.db'
    Left = 352
    Top = 8
  end
end
