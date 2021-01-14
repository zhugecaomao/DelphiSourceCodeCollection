inherited frmCMModify: TfrmCMModify
  Left = 280
  Top = 274
  HorzScrollBar.Range = 0
  VertScrollBar.Range = 0
  ActiveControl = eCMName
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #23458#25143#36164#26009#31649#29702'->%s'
  ClientHeight = 329
  ClientWidth = 390
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 20
    Top = 16
    Width = 65
    Height = 13
    Caption = #23458#25143#32534#21495#65306
  end
  object Label2: TLabel [1]
    Left = 20
    Top = 41
    Width = 65
    Height = 13
    Caption = #23458#25143#22995#21517#65306
  end
  object Label11: TLabel [2]
    Left = 20
    Top = 165
    Width = 65
    Height = 13
    Caption = #32852#31995#30005#35805#65306
  end
  object Label16: TLabel [3]
    Left = 46
    Top = 115
    Width = 39
    Height = 13
    Caption = #24615#21035#65306
  end
  object Label3: TLabel [4]
    Left = 46
    Top = 66
    Width = 39
    Height = 13
    Caption = #24180#40836#65306
  end
  object Label4: TLabel [5]
    Left = 20
    Top = 190
    Width = 65
    Height = 13
    Caption = #37038#20214#22320#22336#65306
  end
  object Label8: TLabel [6]
    Left = 20
    Top = 140
    Width = 65
    Height = 13
    Caption = #32852#31995#22320#22336#65306
  end
  object Label5: TLabel [7]
    Left = 20
    Top = 215
    Width = 65
    Height = 13
    Caption = #26377#25928#35777#20214#65306
  end
  object Label9: TLabel [8]
    Left = 20
    Top = 240
    Width = 65
    Height = 13
    Caption = #30331#35760#26085#26399#65306
  end
  object Label6: TLabel [9]
    Left = 20
    Top = 265
    Width = 65
    Height = 13
    Caption = #30331#35760#26102#38388#65306
  end
  object Label7: TLabel [10]
    Left = 20
    Top = 91
    Width = 65
    Height = 13
    Caption = #20986#29983#26085#26399#65306
  end
  inherited bbtnConfirm: TBitBtn
    Left = 196
    Top = 300
    OnClick = bbtnConfirmClick
  end
  inherited bbtnCancel: TBitBtn
    Left = 280
    Top = 300
  end
  object eCMId: TdxDBEdit [13]
    Left = 92
    Top = 12
    Width = 121
    Color = clAqua
    Style.BorderStyle = xbsSingle
    TabOrder = 2
    DataField = 'cm_id'
    DataSource = Viewd
    ReadOnly = True
    StoredValues = 64
  end
  object eCMName: TdxDBEdit [14]
    Left = 92
    Top = 36
    Width = 121
    Color = clAqua
    Style.BorderStyle = xbsSingle
    TabOrder = 3
    DataField = 'cm_name'
    DataSource = Viewd
  end
  object eCMTel: TdxDBEdit [15]
    Left = 92
    Top = 160
    Width = 121
    Style.BorderStyle = xbsSingle
    TabOrder = 7
    DataField = 'cm_tel'
    DataSource = Viewd
  end
  object eCMMail: TdxDBEdit [16]
    Left = 92
    Top = 185
    Width = 205
    Style.BorderStyle = xbsSingle
    TabOrder = 8
    DataField = 'cm_mail'
    DataSource = Viewd
  end
  object eCMOnlyNo: TdxDBEdit [17]
    Left = 92
    Top = 210
    Width = 205
    Style.BorderStyle = xbsSingle
    TabOrder = 9
    DataField = 'cm_onlyno'
    DataSource = Viewd
  end
  object eCMDate: TCSdxDBDateEdit [18]
    Left = 92
    Top = 235
    Width = 121
    Style.BorderStyle = xbsSingle
    TabOrder = 10
    DataField = 'cm_date'
    DataSource = Viewd
    FixedDateFormat = 'yyyy-MM-dd'
    StoredValues = 4
  end
  object eCMOld: TdxDBSpinEdit [19]
    Left = 92
    Top = 61
    Width = 58
    Style.BorderStyle = xbsSingle
    TabOrder = 4
    DataField = 'cm_old'
    DataSource = Viewd
    MaxValue = 100
    MinValue = 1
    StoredValues = 48
  end
  object eCMSex: TdxDBPickEdit [20]
    Left = 92
    Top = 110
    Width = 57
    Style.BorderStyle = xbsSingle
    TabOrder = 5
    DataField = 'cm_sex'
    DataSource = Viewd
    Items.Strings = (
      #30007
      #22899)
  end
  object eCMAddRess: TdxDBEdit [21]
    Left = 92
    Top = 135
    Width = 281
    Style.BorderStyle = xbsSingle
    TabOrder = 6
    DataField = 'cm_address'
    DataSource = Viewd
  end
  object eCMTime: TdxDBEdit [22]
    Left = 92
    Top = 260
    Width = 121
    Style.BorderStyle = xbsSingle
    TabOrder = 11
    DataField = 'cm_time'
    DataSource = Viewd
  end
  object eBirthday: TCSdxDBDateEdit [23]
    Left = 92
    Top = 86
    Width = 119
    Style.BorderStyle = xbsSingle
    TabOrder = 12
    DataField = 'cm_birthday'
    DataSource = Viewd
    FixedDateFormat = 'yyyy-mm-dd'
    StoredValues = 4
  end
  inherited ImageList: TImageList
    Top = 256
  end
  object Viewq: TCSADOQuery
    CursorType = ctStatic
    Parameters = <>
    Left = 224
    Top = 205
    object Viewqcm_id: TStringField
      DisplayLabel = #23458#25151#32534#21495
      FieldName = 'cm_id'
      Size = 10
    end
    object Viewqcm_name: TStringField
      DisplayLabel = #23458#25151#22995#21517
      FieldName = 'cm_name'
      Size = 30
    end
    object Viewqcm_old: TIntegerField
      DisplayLabel = #23458#25143#24180#40836
      FieldName = 'cm_old'
    end
    object Viewqcm_birthday: TStringField
      FieldName = 'cm_birthday'
      Size = 10
    end
    object Viewqcm_sex: TStringField
      DisplayLabel = #23458#25143#24615#21035
      FieldName = 'cm_sex'
      Size = 2
    end
    object Viewqcm_address: TStringField
      DisplayLabel = #23458#25143#22320#22336
      FieldName = 'cm_address'
      Size = 50
    end
    object Viewqcm_tel: TStringField
      DisplayLabel = #32852#31995#30005#35805
      FieldName = 'cm_tel'
      Size = 30
    end
    object Viewqcm_mail: TStringField
      DisplayLabel = #37038#20214#22320#22336
      FieldName = 'cm_mail'
      Size = 50
    end
    object Viewqcm_onlyno: TStringField
      DisplayLabel = #26377#25928#35777#20214
      FieldName = 'cm_onlyno'
      Size = 30
    end
    object Viewqcm_date: TStringField
      DisplayLabel = #30331#35760#26085#26399
      FieldName = 'cm_date'
      Size = 10
    end
    object Viewqcm_time: TStringField
      DisplayLabel = #30331#35760#26102#38388
      FieldName = 'cm_time'
      Size = 10
    end
    object Viewqlast_time: TDateTimeField
      DisplayLabel = #26368#21518#28040#36153#26102#38388
      FieldName = 'last_time'
    end
    object Viewqlogin_id: TStringField
      DisplayLabel = #25805#20316#21592
      FieldName = 'login_id'
      Size = 10
    end
  end
  object Viewd: TDataSource
    DataSet = Viewq
    Left = 224
    Top = 236
  end
end
