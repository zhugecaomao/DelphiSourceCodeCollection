object ConditionForm: TConditionForm
  Left = 129
  Top = 91
  Width = 641
  Height = 431
  Caption = #26465#20214
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 633
    Height = 89
    Align = alTop
    TabOrder = 0
    object lblTitle: TLabel
      Left = 240
      Top = 9
      Width = 101
      Height = 24
      Caption = #26597#35810#26465#20214
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = #26999#20307'_GB2312'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 136
      Top = 45
      Width = 72
      Height = 12
      Caption = #24320#22987#26085#26399#26102#38388
    end
    object Label2: TLabel
      Left = 328
      Top = 45
      Width = 72
      Height = 12
      Caption = #32467#26463#26085#26399#26102#38388
    end
    object edtRoom: TLabeledEdit
      Left = 16
      Top = 61
      Width = 119
      Height = 20
      EditLabel.Width = 36
      EditLabel.Height = 12
      EditLabel.Caption = #20998#26426#21495
      LabelPosition = lpAbove
      LabelSpacing = 3
      TabOrder = 0
    end
    object dtpBd: TDateTimePicker
      Left = 136
      Top = 61
      Width = 119
      Height = 20
      CalAlignment = dtaLeft
      Date = 37421.3497881944
      Time = 37421.3497881944
      DateFormat = dfLong
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 1
    end
    object edtBt: TMaskEdit
      Left = 256
      Top = 61
      Width = 71
      Height = 20
      EditMask = '!90:00;1; '
      MaxLength = 5
      TabOrder = 2
      Text = '  :  '
    end
    object dtpEd: TDateTimePicker
      Left = 328
      Top = 61
      Width = 120
      Height = 20
      CalAlignment = dtaLeft
      Date = 37421.3500603009
      Time = 37421.3500603009
      DateFormat = dfLong
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 3
    end
    object edtEt: TMaskEdit
      Left = 449
      Top = 61
      Width = 71
      Height = 20
      EditMask = '!90:00;1; '
      MaxLength = 5
      TabOrder = 4
      Text = '  :  '
    end
    object btnQuery: TBitBtn
      Left = 522
      Top = 58
      Width = 75
      Height = 25
      Caption = #26597#35810
      TabOrder = 5
      OnClick = btnQueryClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 363
    Width = 633
    Height = 41
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      633
      41)
    object btnCanc: TBitBtn
      Left = 550
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = #20851#38381
      ModalResult = 2
      TabOrder = 0
    end
    object btnPrint: TBitBtn
      Left = 472
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #25171#21360'(&P)'
      TabOrder = 1
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 89
    Width = 633
    Height = 274
    Align = alClient
    TabOrder = 2
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 631
      Height = 272
      Align = alClient
      DataSource = dsWork
      TabOrder = 0
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'CLASS'
          Title.Alignment = taCenter
          Title.Caption = #20998#26426#21495
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PLACE'
          Title.Alignment = taCenter
          Title.Caption = #22320#28857
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NUMBER'
          Title.Alignment = taCenter
          Title.Caption = #30005#35805#21495#30721
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SDATE'
          Title.Alignment = taCenter
          Title.Caption = #26085#26399
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STIME'
          Title.Alignment = taCenter
          Title.Caption = #26102#38388
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIT'
          Title.Alignment = taCenter
          Title.Caption = #21333#20215
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FEE'
          Title.Alignment = taCenter
          Title.Caption = #30005#35805#36153
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ADDIFEE'
          Title.Alignment = taCenter
          Title.Caption = #38468#21152#36153
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SVCFEE'
          Title.Alignment = taCenter
          Title.Caption = #26381#21153#36153
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TOTAL'
          Title.Alignment = taCenter
          Title.Caption = #24635#37329#39069
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FLTY'
          Title.Alignment = taCenter
          Title.Caption = #30005#35805#20998#31867
          Visible = True
        end>
    end
  end
  object qryWork: TQuery
    DatabaseName = 'LFHOTELUSER'
    SQL.Strings = (
      'select * from NEWDATA')
    Left = 448
    Top = 16
    object qryWorkCLASS: TStringField
      FieldName = 'CLASS'
      Origin = 'LFHOTELUSER."NEWDATA.DB".CLASS'
      Size = 5
    end
    object qryWorkROOM: TStringField
      FieldName = 'ROOM'
      Origin = 'LFHOTELUSER."NEWDATA.DB".ROOM'
      Size = 5
    end
    object qryWorkPLACE: TStringField
      FieldName = 'PLACE'
      Origin = 'LFHOTELUSER."NEWDATA.DB".PLACE'
    end
    object qryWorkNUMBER: TStringField
      FieldName = 'NUMBER'
      Origin = 'LFHOTELUSER."NEWDATA.DB".NUMBER'
      Size = 16
    end
    object qryWorkSDATE: TStringField
      FieldName = 'SDATE'
      Origin = 'LFHOTELUSER."NEWDATA.DB".SDATE'
      Size = 8
    end
    object qryWorkSTIME: TStringField
      FieldName = 'STIME'
      Origin = 'LFHOTELUSER."NEWDATA.DB".STIME'
      Size = 6
    end
    object qryWorkLAST: TFloatField
      FieldName = 'LAST'
      Origin = 'LFHOTELUSER."NEWDATA.DB".LAST'
    end
    object qryWorkUNIT: TCurrencyField
      FieldName = 'UNIT'
      Origin = 'LFHOTELUSER."NEWDATA.DB".UNIT'
    end
    object qryWorkFEE: TCurrencyField
      FieldName = 'FEE'
      Origin = 'LFHOTELUSER."NEWDATA.DB".FEE'
    end
    object qryWorkADDIFEE: TCurrencyField
      FieldName = 'ADDIFEE'
      Origin = 'LFHOTELUSER."NEWDATA.DB".ADDIFEE'
    end
    object qryWorkSVCFEE: TCurrencyField
      FieldName = 'SVCFEE'
      Origin = 'LFHOTELUSER."NEWDATA.DB".SVCFEE'
    end
    object qryWorkTOTAL: TCurrencyField
      FieldName = 'TOTAL'
      Origin = 'LFHOTELUSER."NEWDATA.DB".TOTAL'
    end
    object qryWorkFLTY: TSmallintField
      FieldName = 'FLTY'
      Origin = 'LFHOTELUSER."NEWDATA.DB".FLTY'
      OnGetText = qryWorkFLTYGetText
    end
  end
  object dsWork: TDataSource
    DataSet = qryWork
    Left = 480
    Top = 16
  end
end
