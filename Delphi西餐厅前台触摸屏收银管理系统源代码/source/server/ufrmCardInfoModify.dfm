inherited frmCardInfoModify: TfrmCardInfoModify
  Left = 259
  Top = 95
  HorzScrollBar.Range = 0
  VertScrollBar.Range = 0
  ActiveControl = eCardKindId
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #20250#21592#36164#26009#31649#29702'->%s'
  ClientHeight = 563
  ClientWidth = 406
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 20
    Top = 36
    Width = 65
    Height = 13
    Caption = #23458#25143#32534#21495#65306
  end
  object Label2: TLabel [1]
    Left = 20
    Top = 109
    Width = 65
    Height = 13
    Caption = #23458#25143#22995#21517#65306
  end
  object Label11: TLabel [2]
    Left = 20
    Top = 233
    Width = 65
    Height = 13
    Caption = #32852#31995#30005#35805#65306
  end
  object Label16: TLabel [3]
    Left = 46
    Top = 183
    Width = 39
    Height = 13
    Caption = #24615#21035#65306
  end
  object Label3: TLabel [4]
    Left = 46
    Top = 134
    Width = 39
    Height = 13
    Caption = #24180#40836#65306
  end
  object Label4: TLabel [5]
    Left = 20
    Top = 258
    Width = 65
    Height = 13
    Caption = #37038#20214#22320#22336#65306
  end
  object Label8: TLabel [6]
    Left = 20
    Top = 208
    Width = 65
    Height = 13
    Caption = #32852#31995#22320#22336#65306
  end
  object Label5: TLabel [7]
    Left = 20
    Top = 283
    Width = 65
    Height = 13
    Caption = #26377#25928#35777#20214#65306
  end
  object Label9: TLabel [8]
    Left = 20
    Top = 308
    Width = 65
    Height = 13
    Caption = #30331#35760#26085#26399#65306
  end
  object Label6: TLabel [9]
    Left = 20
    Top = 333
    Width = 65
    Height = 13
    Caption = #30331#35760#26102#38388#65306
  end
  object Label7: TLabel [10]
    Left = 20
    Top = 12
    Width = 65
    Height = 13
    Caption = #20250#21592#21345#21495#65306
  end
  object Label10: TLabel [11]
    Left = 20
    Top = 61
    Width = 65
    Height = 13
    Caption = #20250#21592#31867#22411#65306
  end
  object Label12: TLabel [12]
    Left = 20
    Top = 85
    Width = 65
    Height = 13
    Caption = #21592#24037#24037#21495#65306
    Visible = False
  end
  object Label13: TLabel [13]
    Left = 20
    Top = 159
    Width = 65
    Height = 13
    Caption = #20986#29983#26085#26399#65306
  end
  object Label14: TLabel [14]
    Left = 20
    Top = 413
    Width = 65
    Height = 13
    Caption = #29031#29255#25991#20214#65306
  end
  object imgView: TImage [15]
    Left = 252
    Top = 408
    Width = 121
    Height = 109
    Stretch = True
  end
  object Label15: TLabel [16]
    Left = 20
    Top = 360
    Width = 65
    Height = 13
    Caption = #24320#22987#26085#26399#65306
  end
  object Label17: TLabel [17]
    Left = 20
    Top = 385
    Width = 65
    Height = 13
    Caption = #32467#26463#26085#26399#65306
  end
  inherited bbtnConfirm: TBitBtn
    Left = 224
    Top = 528
    OnClick = bbtnConfirmClick
  end
  inherited bbtnCancel: TBitBtn
    Left = 308
    Top = 528
  end
  object eCMId: TdxDBEdit [20]
    Left = 92
    Top = 32
    Width = 121
    Color = clAqua
    Style.BorderStyle = xbsSingle
    TabOrder = 3
    DataField = 'cm_id'
    DataSource = Viewd
    ReadOnly = True
    StoredValues = 64
  end
  object eCMName: TdxDBEdit [21]
    Left = 92
    Top = 104
    Width = 121
    Style.BorderStyle = xbsSingle
    TabOrder = 6
    DataField = 'cm_name'
    DataSource = Viewd
  end
  object eCMTel: TdxDBEdit [22]
    Left = 92
    Top = 228
    Width = 121
    Style.BorderStyle = xbsSingle
    TabOrder = 11
    DataField = 'cm_tel'
    DataSource = Viewd
  end
  object eCMMail: TdxDBEdit [23]
    Left = 92
    Top = 253
    Width = 205
    Style.BorderStyle = xbsSingle
    TabOrder = 12
    DataField = 'cm_mail'
    DataSource = Viewd
  end
  object eCMOnlyNo: TdxDBEdit [24]
    Left = 92
    Top = 278
    Width = 205
    Style.BorderStyle = xbsSingle
    TabOrder = 13
    DataField = 'cm_onlyno'
    DataSource = Viewd
  end
  object eCMDate: TCSdxDBDateEdit [25]
    Left = 92
    Top = 303
    Width = 121
    Style.BorderStyle = xbsSingle
    TabOrder = 14
    DataField = 'cm_date'
    DataSource = Viewd
    FixedDateFormat = 'yyyy-MM-dd'
    StoredValues = 4
  end
  object eCMOld: TdxDBSpinEdit [26]
    Left = 92
    Top = 129
    Width = 58
    Style.BorderStyle = xbsSingle
    TabOrder = 7
    DataField = 'cm_old'
    DataSource = Viewd
    MaxValue = 100
    MinValue = 1
    StoredValues = 48
  end
  object eCMSex: TdxDBPickEdit [27]
    Left = 92
    Top = 178
    Width = 57
    Style.BorderStyle = xbsSingle
    TabOrder = 9
    DataField = 'cm_sex'
    DataSource = Viewd
    Items.Strings = (
      #30007
      #22899)
  end
  object eCMAddRess: TdxDBEdit [28]
    Left = 92
    Top = 203
    Width = 281
    Style.BorderStyle = xbsSingle
    TabOrder = 10
    DataField = 'cm_address'
    DataSource = Viewd
  end
  object eCMTime: TdxDBEdit [29]
    Left = 92
    Top = 328
    Width = 121
    Style.BorderStyle = xbsSingle
    TabOrder = 15
    DataField = 'cm_time'
    DataSource = Viewd
  end
  object eCardId: TdxDBEdit [30]
    Left = 92
    Top = 8
    Width = 121
    Color = clAqua
    Style.BorderStyle = xbsSingle
    TabOrder = 2
    DataField = 'card_id'
    DataSource = cardinfod
    ReadOnly = False
    StoredValues = 64
  end
  object eCardKindId: TdxDBButtonEdit [31]
    Left = 92
    Top = 56
    Width = 121
    Color = clAqua
    Style.BorderStyle = xbsSingle
    TabOrder = 4
    DataField = 'kind_id'
    DataSource = cardinfod
    Buttons = <
      item
        Default = True
      end>
    OnButtonClick = eCardKindIdButtonClick
    ExistButtons = True
  end
  object eEmpId: TdxDBButtonEdit [32]
    Left = 92
    Top = 80
    Width = 121
    Style.BorderStyle = xbsSingle
    TabOrder = 5
    Visible = False
    DataField = 'emp_id'
    DataSource = cardinfod
    Buttons = <
      item
        Default = True
      end>
    OnButtonClick = eEmpIdButtonClick
    ExistButtons = True
  end
  object eBirthday: TCSdxDBDateEdit [33]
    Left = 92
    Top = 154
    Width = 121
    Style.BorderStyle = xbsSingle
    TabOrder = 8
    DataField = 'cm_birthday'
    DataSource = Viewd
    FixedDateFormat = 'yyyy-MM-dd'
    StoredValues = 4
  end
  object bbtnServiceFix: TBitBtn [34]
    Left = 220
    Top = 8
    Width = 90
    Height = 22
    Caption = #26381#21153#23450#39069#35774#23450
    TabOrder = 17
    OnClick = bbtnServiceFixClick
  end
  object bbtnPrcFix: TBitBtn [35]
    Left = 220
    Top = 32
    Width = 90
    Height = 22
    Caption = #21830#21697#23450#39069#35774#23450
    TabOrder = 18
    Visible = False
  end
  object MSComm: TMSComm [36]
    Left = 260
    Top = 132
    Width = 32
    Height = 32
    ControlData = {
      2143341208000000ED030000ED03000001568A64000006000000010000040000
      00020000802500000000080000000000000000003F00000001000000}
  end
  object bbtnSelect: TBitBtn [37]
    Left = 92
    Top = 408
    Width = 125
    Height = 22
    Caption = #36873#25321#22270#29255
    TabOrder = 16
    OnClick = bbtnSelectClick
  end
  object eStartDate: TCSdxDBDateEdit [38]
    Left = 92
    Top = 355
    Width = 121
    Style.BorderStyle = xbsSingle
    TabOrder = 20
    DataField = 'start_date'
    DataSource = Imgd
    FixedDateFormat = 'yyyy-MM-dd'
    StoredValues = 4
  end
  object eEndDate: TCSdxDBDateEdit [39]
    Left = 92
    Top = 380
    Width = 121
    Style.BorderStyle = xbsSingle
    TabOrder = 21
    DataField = 'end_date'
    DataSource = Imgd
    FixedDateFormat = 'yyyy-MM-dd'
    StoredValues = 4
  end
  inherited ImageList: TImageList
    Left = 308
    Top = 264
  end
  object Viewq: TCSADOQuery
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from customerinfo')
    Left = 224
    Top = 264
    object Viewqcm_id: TStringField
      FieldName = 'cm_id'
      Size = 10
    end
    object Viewqcm_name: TStringField
      FieldName = 'cm_name'
      Size = 30
    end
    object Viewqcm_old: TIntegerField
      FieldName = 'cm_old'
    end
    object Viewqcm_birthday: TStringField
      FieldName = 'cm_birthday'
      Size = 10
    end
    object Viewqcm_sex: TStringField
      FieldName = 'cm_sex'
      Size = 2
    end
    object Viewqcm_address: TStringField
      FieldName = 'cm_address'
      Size = 50
    end
    object Viewqcm_tel: TStringField
      FieldName = 'cm_tel'
      Size = 30
    end
    object Viewqcm_mail: TStringField
      FieldName = 'cm_mail'
      Size = 50
    end
    object Viewqcm_onlyno: TStringField
      FieldName = 'cm_onlyno'
      Size = 30
    end
    object Viewqcm_date: TStringField
      FieldName = 'cm_date'
      Size = 10
    end
    object Viewqcm_time: TStringField
      FieldName = 'cm_time'
      Size = 10
    end
    object Viewqlast_time: TDateTimeField
      FieldName = 'last_time'
    end
    object Viewqlogin_id: TStringField
      FieldName = 'login_id'
      Size = 10
    end
  end
  object Viewd: TDataSource
    DataSet = Viewq
    Left = 224
    Top = 296
  end
  object cardinfoq: TCSADOQuery
    CursorType = ctStatic
    Parameters = <>
    Left = 252
    Top = 264
    object cardinfoqcard_id: TStringField
      FieldName = 'card_id'
      Size = 10
    end
    object cardinfoqcm_id: TStringField
      FieldName = 'cm_id'
      Size = 10
    end
    object cardinfoqkind_id: TIntegerField
      FieldName = 'kind_id'
    end
    object cardinfoqcard_money: TBCDField
      FieldName = 'card_money'
      Precision = 19
    end
    object cardinfoqcard_state: TIntegerField
      FieldName = 'card_state'
    end
    object cardinfoqemp_id: TStringField
      FieldName = 'emp_id'
      Size = 10
    end
    object cardinfoqlogin_id: TStringField
      FieldName = 'login_id'
      Size = 10
    end
  end
  object cardinfod: TDataSource
    DataSet = cardinfoq
    Left = 252
    Top = 296
  end
  object Imgd: TDataSource
    DataSet = Imgq
    Left = 280
    Top = 296
  end
  object Imgq: TCSADOQuery
    Parameters = <>
    Left = 280
    Top = 264
    object Imgqcardid: TStringField
      FieldName = 'cardid'
      Size = 10
    end
    object Imgqcardimg: TStringField
      FieldName = 'cardimg'
      Size = 50
    end
    object Imgqstart_date: TStringField
      FieldName = 'start_date'
      Size = 10
    end
    object Imgqend_date: TStringField
      FieldName = 'end_date'
      Size = 10
    end
  end
end
