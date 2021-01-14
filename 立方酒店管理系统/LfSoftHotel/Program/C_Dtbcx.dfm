inherited DtbCxForm: TDtbCxForm
  Caption = #25253#34920
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    inherited lblTitle: TLabel
      Width = 156
      Caption = #22823#22530#21543#33829#19994
    end
    object Label1: TLabel [2]
      Left = 16
      Top = 64
      Width = 60
      Height = 12
      Caption = #26597#35810#26085#26399#65306
    end
    inherited cmbOption: TComboBox
      Top = 16
      Visible = False
    end
    inherited cmbExpress: TComboBox
      Top = 16
      Visible = False
    end
    inherited edtValue: TEdit
      Top = 16
      Visible = False
    end
    inherited btnLoca: TBitBtn
      Top = 13
      Visible = False
    end
    object DateTimePicker1: TDateTimePicker
      Left = 80
      Top = 56
      Width = 121
      Height = 20
      CalAlignment = dtaLeft
      Date = 37383.3733280093
      Time = 37383.3733280093
      DateFormat = dfLong
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 4
      OnChange = DateTimePicker1Change
    end
  end
  inherited Panel2: TPanel
    inherited DBGrid1: TDBGrid
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      Columns = <
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_JZRQ'
          Title.Alignment = taCenter
          Title.Caption = #32467#24080#26085#26399
          Width = 120
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_JZSJ'
          Title.Alignment = taCenter
          Title.Caption = #32467#24080#26102#38388
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_XFJE'
          Title.Alignment = taCenter
          Title.Caption = #28040#36153#37329#39069
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_YHJE'
          Title.Alignment = taCenter
          Title.Caption = #20248#24800#37329#39069
          Width = 120
          Visible = True
        end>
    end
  end
  inherited Panel3: TPanel
    inherited btnPrint: TBitBtn
      OnClick = btnPrintClick
    end
  end
  inherited qryWork: TQuery
    DatabaseName = 'LfHotelUser'
    SQL.Strings = (
      'select * from KRJZ')
    object qryWorkD_JZBH: TStringField
      FieldName = 'D_JZBH'
      Origin = 'LFHOTELUSER."KRJZ.DB".D_JZBH'
      Size = 12
    end
    object qryWorkD_HH: TIntegerField
      FieldName = 'D_HH'
      Origin = 'LFHOTELUSER."KRJZ.DB".D_HH'
    end
    object qryWorkD_XMBH: TStringField
      FieldName = 'D_XMBH'
      Origin = 'LFHOTELUSER."KRJZ.DB".D_XMBH'
      Size = 5
    end
    object qryWorkD_XFDJ: TCurrencyField
      FieldName = 'D_XFDJ'
      Origin = 'LFHOTELUSER."KRJZ.DB".D_XFDJ'
    end
    object qryWorkD_XFSL: TFloatField
      FieldName = 'D_XFSL'
      Origin = 'LFHOTELUSER."KRJZ.DB".D_XFSL'
    end
    object qryWorkD_XFJE: TCurrencyField
      FieldName = 'D_XFJE'
      Origin = 'LFHOTELUSER."KRJZ.DB".D_XFJE'
    end
    object qryWorkD_YJJE: TCurrencyField
      FieldName = 'D_YJJE'
      Origin = 'LFHOTELUSER."KRJZ.DB".D_YJJE'
    end
    object qryWorkD_YHJE: TCurrencyField
      FieldName = 'D_YHJE'
      Origin = 'LFHOTELUSER."KRJZ.DB".D_YHJE'
    end
    object qryWorkD_JZFS: TStringField
      FieldName = 'D_JZFS'
      Origin = 'LFHOTELUSER."KRJZ.DB".D_JZFS'
      Size = 6
    end
    object qryWorkD_JZLX: TStringField
      FieldName = 'D_JZLX'
      Origin = 'LFHOTELUSER."KRJZ.DB".D_JZLX'
      Size = 1
    end
    object qryWorkD_XYKBH: TStringField
      FieldName = 'D_XYKBH'
      Origin = 'LFHOTELUSER."KRJZ.DB".D_XYKBH'
      Size = 5
    end
    object qryWorkD_KHBH: TStringField
      FieldName = 'D_KHBH'
      Origin = 'LFHOTELUSER."KRJZ.DB".D_KHBH'
      Size = 5
    end
    object qryWorkD_JZRQ: TDateField
      FieldName = 'D_JZRQ'
      Origin = 'LFHOTELUSER."KRJZ.DB".D_JZRQ'
    end
    object qryWorkD_JZSJ: TTimeField
      FieldName = 'D_JZSJ'
      Origin = 'LFHOTELUSER."KRJZ.DB".D_JZSJ'
    end
    object qryWorkD_CZYXM: TStringField
      FieldName = 'D_CZYXM'
      Origin = 'LFHOTELUSER."KRJZ.DB".D_CZYXM'
      Size = 8
    end
    object qryWorkD_BZ: TStringField
      FieldName = 'D_BZ'
      Origin = 'LFHOTELUSER."KRJZ.DB".D_BZ'
      Size = 10
    end
    object qryWorkD_YSRQ: TStringField
      FieldName = 'D_YSRQ'
      Origin = 'LFHOTELUSER."KRJZ.DB".D_YSRQ'
      Size = 8
    end
  end
end
