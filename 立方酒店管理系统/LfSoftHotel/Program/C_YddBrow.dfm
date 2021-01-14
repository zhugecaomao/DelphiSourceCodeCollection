inherited YddBrowForm: TYddBrowForm
  Left = 64
  Top = 20
  Height = 550
  ActiveControl = dbgMaster
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    inherited lblTitle: TLabel
      Left = 209
      Width = 156
      Caption = #39044#23450#21333#27983#35272
    end
    inherited Image1: TImage
      Left = 176
    end
    inherited btnLoca: TBitBtn
      OnClick = btnLocaClick
    end
  end
  inherited Panel2: TPanel
    Height = 402
    inherited dbgMaster: TDBGrid
      Height = 188
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    end
    inherited dbgDetail: TDBGrid
      Top = 193
      Height = 204
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    end
  end
  inherited Panel3: TPanel
    Top = 482
    inherited btnHelp: TBitBtn
      Left = 434
    end
  end
  inherited DosMove1: TDosMove
    Left = 88
  end
  inherited qryMaster: TQuery
    BeforeOpen = qryMasterBeforeOpen
    AfterClose = qryMasterAfterClose
    DatabaseName = 'LFHOTELUSER'
    SQL.Strings = (
      'select * from YDXX')
    Left = 368
    object qryMasterD_KRBH: TStringField
      FieldName = 'D_KRBH'
      Origin = 'LFHOTELUSER."YDXX.DB".D_KRBH'
      Size = 12
    end
    object qryMasterD_XM: TStringField
      FieldName = 'D_XM'
      Origin = 'LFHOTELUSER."YDXX.DB".D_XM'
      Size = 8
    end
    object qryMasterD_FKFS: TStringField
      FieldName = 'D_FKFS'
      Origin = 'LFHOTELUSER."YDXX.DB".D_FKFS'
      Size = 6
    end
    object qryMasterD_XYKBH: TStringField
      FieldName = 'D_XYKBH'
      Origin = 'LFHOTELUSER."YDXX.DB".D_XYKBH'
      Size = 5
    end
    object qryMasterD_KHBH: TStringField
      FieldName = 'D_KHBH'
      Origin = 'LFHOTELUSER."YDXX.DB".D_KHBH'
      Size = 5
    end
    object qryMasterD_YFJE: TCurrencyField
      FieldName = 'D_YFJE'
      Origin = 'LFHOTELUSER."YDXX.DB".D_YFJE'
    end
    object qryMasterD_DWMC: TStringField
      FieldName = 'D_DWMC'
      Origin = 'LFHOTELUSER."YDXX.DB".D_DWMC'
      Size = 30
    end
    object qryMasterD_LXDH: TStringField
      FieldName = 'D_LXDH'
      Origin = 'LFHOTELUSER."YDXX.DB".D_LXDH'
    end
    object qryMasterD_LXR: TStringField
      FieldName = 'D_LXR'
      Origin = 'LFHOTELUSER."YDXX.DB".D_LXR'
      Size = 8
    end
    object qryMasterD_BZ: TStringField
      FieldName = 'D_BZ'
      Origin = 'LFHOTELUSER."YDXX.DB".D_BZ'
    end
    object qryMasterD_CZYXM: TStringField
      FieldName = 'D_CZYXM'
      Origin = 'LFHOTELUSER."YDXX.DB".D_CZYXM'
      Size = 8
    end
  end
  inherited qryDetail: TQuery
    DatabaseName = 'LFHOTELUSER'
    SQL.Strings = (
      'select * from YDHC where D_KRBH=:D_KRBH')
    Left = 440
    ParamData = <
      item
        DataType = ftString
        Name = 'D_KRBH'
        ParamType = ptUnknown
        Size = 13
      end>
    object qryDetailD_YDBH: TStringField
      FieldName = 'D_YDBH'
      Origin = 'LFHOTELUSER."YDHC.DB".D_YDBH'
      Size = 12
    end
    object qryDetailD_KRBH: TStringField
      FieldName = 'D_KRBH'
      Origin = 'LFHOTELUSER."YDHC.DB".D_KRBH'
      Size = 12
    end
    object qryDetailD_YDRQ: TDateField
      FieldName = 'D_YDRQ'
      Origin = 'LFHOTELUSER."YDHC.DB".D_YDRQ'
    end
    object qryDetailD_SYRQ: TDateField
      FieldName = 'D_SYRQ'
      Origin = 'LFHOTELUSER."YDHC.DB".D_SYRQ'
    end
    object qryDetailD_SYSJ: TTimeField
      FieldName = 'D_SYSJ'
      Origin = 'LFHOTELUSER."YDHC.DB".D_SYSJ'
    end
    object qryDetailD_SJDM: TStringField
      FieldName = 'D_SJDM'
      Origin = 'LFHOTELUSER."YDHC.DB".D_SJDM'
      Size = 4
    end
    object qryDetailD_HCDM: TStringField
      FieldName = 'D_HCDM'
      Origin = 'LFHOTELUSER."YDHC.DB".D_HCDM'
      Size = 5
    end
    object qryDetailD_HCZJ: TCurrencyField
      FieldName = 'D_HCZJ'
      Origin = 'LFHOTELUSER."YDHC.DB".D_HCZJ'
    end
    object qryDetailD_HCRS: TIntegerField
      FieldName = 'D_HCRS'
      Origin = 'LFHOTELUSER."YDHC.DB".D_HCRS'
    end
    object qryDetailD_HCRS1: TIntegerField
      FieldName = 'D_HCRS1'
      Origin = 'LFHOTELUSER."YDHC.DB".D_HCRS1'
    end
    object qryDetailD_HFSL: TFloatField
      FieldName = 'D_HFSL'
      Origin = 'LFHOTELUSER."YDHC.DB".D_HFSL'
    end
    object qryDetailD_HFJE: TCurrencyField
      FieldName = 'D_HFJE'
      Origin = 'LFHOTELUSER."YDHC.DB".D_HFJE'
    end
    object qryDetailD_HFBZ: TStringField
      FieldName = 'D_HFBZ'
      Origin = 'LFHOTELUSER."YDHC.DB".D_HFBZ'
      Size = 30
    end
    object qryDetailD_XHSL: TFloatField
      FieldName = 'D_XHSL'
      Origin = 'LFHOTELUSER."YDHC.DB".D_XHSL'
    end
    object qryDetailD_XHJE: TCurrencyField
      FieldName = 'D_XHJE'
      Origin = 'LFHOTELUSER."YDHC.DB".D_XHJE'
    end
    object qryDetailD_XHBZ: TStringField
      FieldName = 'D_XHBZ'
      Origin = 'LFHOTELUSER."YDHC.DB".D_XHBZ'
      Size = 30
    end
    object qryDetailD_SGSL: TFloatField
      FieldName = 'D_SGSL'
      Origin = 'LFHOTELUSER."YDHC.DB".D_SGSL'
    end
    object qryDetailD_SGJE: TCurrencyField
      FieldName = 'D_SGJE'
      Origin = 'LFHOTELUSER."YDHC.DB".D_SGJE'
    end
    object qryDetailD_SGBZ: TStringField
      FieldName = 'D_SGBZ'
      Origin = 'LFHOTELUSER."YDHC.DB".D_SGBZ'
      Size = 30
    end
    object qryDetailD_QTJE: TCurrencyField
      FieldName = 'D_QTJE'
      Origin = 'LFHOTELUSER."YDHC.DB".D_QTJE'
    end
    object qryDetailD_QTBZ: TStringField
      FieldName = 'D_QTBZ'
      Origin = 'LFHOTELUSER."YDHC.DB".D_QTBZ'
      Size = 30
    end
    object qryDetailD_HTSL: TFloatField
      FieldName = 'D_HTSL'
      Origin = 'LFHOTELUSER."YDHC.DB".D_HTSL'
    end
    object qryDetailD_HTBZ: TStringField
      FieldName = 'D_HTBZ'
      Origin = 'LFHOTELUSER."YDHC.DB".D_HTBZ'
      Size = 30
    end
    object qryDetailD_BZ: TStringField
      FieldName = 'D_BZ'
      Origin = 'LFHOTELUSER."YDHC.DB".D_BZ'
      Size = 30
    end
    object qryDetailD_RZBZ: TStringField
      FieldName = 'D_RZBZ'
      Origin = 'LFHOTELUSER."YDHC.DB".D_RZBZ'
      Size = 1
    end
    object qryDetailD_JSBZ: TStringField
      FieldName = 'D_JSBZ'
      Origin = 'LFHOTELUSER."YDHC.DB".D_JSBZ'
      Size = 1
    end
    object qryDetailD_CZYXM: TStringField
      FieldName = 'D_CZYXM'
      Origin = 'LFHOTELUSER."YDHC.DB".D_CZYXM'
      Size = 8
    end
  end
  inherited dsMaster: TDataSource
    Left = 400
  end
  inherited dsDetail: TDataSource
    Left = 472
  end
  object tblYdxx: TTable
    DatabaseName = 'LFHOTELUSER'
    TableName = 'YDXX.db'
    Left = 528
    Top = 8
  end
end
