object frmCMBirthday: TfrmCMBirthday
  Left = 240
  Top = 218
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #20250#21592#29983#26085#25552#37266
  ClientHeight = 301
  ClientWidth = 546
  Color = clGradientActiveCaption
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 271
    Width = 546
    Height = 30
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 9
      Width = 65
      Height = 13
      Caption = #36873#25321#26085#26399#65306
    end
    object Panel2: TPanel
      Left = 460
      Top = 2
      Width = 84
      Height = 26
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object bbtnExit: TBitBtn
        Left = 4
        Top = 2
        Width = 75
        Height = 22
        Caption = #36864#20986
        TabOrder = 0
        OnClick = bbtnExitClick
      end
    end
    object eDate: TdxDateEdit
      Left = 72
      Top = 5
      Width = 121
      Style.BorderStyle = xbsSingle
      TabOrder = 1
      Date = -700000
    end
    object bbtnView: TBitBtn
      Left = 196
      Top = 4
      Width = 75
      Height = 22
      Caption = #26597#30475
      TabOrder = 2
      OnClick = bbtnViewClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 546
    Height = 271
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 1
    object grdList: TdxDBGrid
      Left = 2
      Top = 2
      Width = 542
      Height = 267
      Bands = <
        item
        end>
      DefaultLayout = True
      HeaderPanelRowCount = 1
      KeyField = 'card_id'
      SummaryGroups = <>
      SummarySeparator = ', '
      Align = alClient
      TabOrder = 0
      DataSource = Birthdayd
      Filter.Criteria = {00000000}
      HeaderColor = 4227327
      LookAndFeel = lfFlat
      OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanInsert, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoSmartRefresh, edgoSmartReload, edgoUseBookmarks]
      object grdListcard_id: TdxDBGridMaskColumn
        HeaderAlignment = taCenter
        Width = 120
        BandIndex = 0
        RowIndex = 0
        FieldName = 'card_id'
      end
      object grdListcm_name: TdxDBGridMaskColumn
        HeaderAlignment = taCenter
        Width = 120
        BandIndex = 0
        RowIndex = 0
        FieldName = 'cm_name'
      end
      object grdListcm_sex: TdxDBGridMaskColumn
        HeaderAlignment = taCenter
        Width = 48
        BandIndex = 0
        RowIndex = 0
        FieldName = 'cm_sex'
      end
      object grdListcm_address: TdxDBGridMaskColumn
        HeaderAlignment = taCenter
        Width = 120
        BandIndex = 0
        RowIndex = 0
        FieldName = 'cm_address'
      end
      object grdListcm_tel: TdxDBGridMaskColumn
        HeaderAlignment = taCenter
        Width = 120
        BandIndex = 0
        RowIndex = 0
        FieldName = 'cm_tel'
      end
    end
  end
  object Birthdayq: TCSADOQuery
    Parameters = <>
    Left = 168
    Top = 96
    object Birthdayqcard_id: TStringField
      DisplayLabel = #20250#21592#21345#21495
      FieldName = 'card_id'
      Size = 10
    end
    object Birthdayqcm_id: TStringField
      FieldName = 'cm_id'
      Size = 10
    end
    object Birthdayqcm_name: TStringField
      DisplayLabel = #22995#21517
      FieldName = 'cm_name'
      Size = 30
    end
    object Birthdayqcm_sex: TStringField
      DisplayLabel = #24615#21035
      FieldName = 'cm_sex'
      Size = 2
    end
    object Birthdayqcm_address: TStringField
      DisplayLabel = #32852#31995#22320#22336
      FieldName = 'cm_address'
      Size = 50
    end
    object Birthdayqcm_tel: TStringField
      DisplayLabel = #32852#31995#30005#35805
      FieldName = 'cm_tel'
      Size = 30
    end
  end
  object Birthdayd: TDataSource
    DataSet = Birthdayq
    Left = 168
    Top = 124
  end
end
