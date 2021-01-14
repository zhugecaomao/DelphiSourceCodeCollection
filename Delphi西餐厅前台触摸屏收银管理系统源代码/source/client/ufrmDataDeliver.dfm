object frmDataDeliver: TfrmDataDeliver
  Left = -4
  Top = -4
  BorderStyle = bsNone
  ClientHeight = 551
  ClientWidth = 800
  Color = clGradientActiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -40
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 48
  object Label1: TLabel
    Left = 28
    Top = 6
    Width = 90
    Height = 37
    Caption = #36827#24230#65306
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 28
    Top = 96
    Width = 90
    Height = 37
    Caption = #36827#24230#65306
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 28
    Top = 190
    Width = 90
    Height = 37
    Caption = #36827#24230#65306
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 28
    Top = 284
    Width = 90
    Height = 37
    Caption = #36827#24230#65306
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 28
    Top = 378
    Width = 90
    Height = 37
    Caption = #36827#24230#65306
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object bbtnDownEmp: TBitBtn
    Left = 124
    Top = 42
    Width = 669
    Height = 50
    Caption = #26356#26032#21592#24037#20449#24687
    TabOrder = 0
    OnClick = bbtnDownEmpClick
  end
  object bbtnDownMachines: TBitBtn
    Left = 120
    Top = 136
    Width = 669
    Height = 50
    Caption = #26356#26032#25910#38134#26426#20449#24687
    TabOrder = 1
    OnClick = bbtnDownMachinesClick
  end
  object bbtnDownSale: TBitBtn
    Left = 120
    Top = 324
    Width = 669
    Height = 50
    Caption = #26356#26032#25104#21697#20449#24687
    TabOrder = 2
    OnClick = bbtnDownSaleClick
  end
  object bbtnDownPosParam: TBitBtn
    Left = 120
    Top = 230
    Width = 669
    Height = 50
    Caption = #26356#26032'POS'#37197#32622#20449#24687
    TabOrder = 3
    OnClick = bbtnDownPosParamClick
  end
  object bbtnUpTradeInfo: TBitBtn
    Left = 120
    Top = 418
    Width = 669
    Height = 50
    Caption = #19978#20256#25910#36153#36134#21333
    TabOrder = 4
    OnClick = bbtnUpTradeInfoClick
  end
  object bbtnExit: TBitBtn
    Left = 120
    Top = 478
    Width = 669
    Height = 65
    Caption = #36820#22238
    TabOrder = 5
    OnClick = bbtnExitClick
  end
  object ProbEmp: TProgressBar
    Left = 123
    Top = 2
    Width = 665
    Height = 37
    Min = 0
    Max = 100
    TabOrder = 6
  end
  object ProbMachines: TProgressBar
    Left = 123
    Top = 95
    Width = 665
    Height = 37
    Min = 0
    Max = 100
    TabOrder = 7
  end
  object ProbPosParam: TProgressBar
    Left = 123
    Top = 189
    Width = 665
    Height = 37
    Min = 0
    Max = 100
    TabOrder = 8
  end
  object ProbSale: TProgressBar
    Left = 123
    Top = 282
    Width = 665
    Height = 37
    Min = 0
    Max = 100
    TabOrder = 9
  end
  object ProbTradeInfo: TProgressBar
    Left = 123
    Top = 376
    Width = 665
    Height = 37
    Min = 0
    Max = 100
    TabOrder = 10
  end
  object ClientEmpq: TCSADOQuery
    Parameters = <>
    Left = 572
    Top = 42
    object ClientEmpqI_SHOP_CD: TStringField
      DisplayLabel = #20998#24215#32534#21495
      FieldName = 'I_SHOP_CD'
      Size = 4
    end
    object ClientEmpqI_EMP_CD: TStringField
      DisplayLabel = #24037#21495
      FieldName = 'I_EMP_CD'
      Size = 4
    end
    object ClientEmpqI_EMP_NAME: TStringField
      DisplayLabel = #22995#21517
      FieldName = 'I_EMP_NAME'
      Size = 30
    end
    object ClientEmpqI_EMP_JOB: TStringField
      DisplayLabel = #32844#20301
      FieldName = 'I_EMP_JOB'
      Size = 10
    end
    object ClientEmpqI_EMP_POWER_CD: TStringField
      DisplayLabel = #26435#38480#21495
      FieldName = 'I_EMP_POWER_CD'
      Size = 2
    end
    object ClientEmpqI_UNLOCK: TBooleanField
      DisplayLabel = #35299#25346
      FieldName = 'I_UNLOCK'
    end
    object ClientEmpqI_CHANGE: TBooleanField
      DisplayLabel = #25913#39184
      FieldName = 'I_CHANGE'
    end
    object ClientEmpqI_DELETE: TBooleanField
      DisplayLabel = #20316#24223
      FieldName = 'I_DELETE'
    end
    object ClientEmpqI_OUTDISCOUNT: TBooleanField
      DisplayLabel = #22806#21334#25171#25240
      FieldName = 'I_OUTDISCOUNT'
    end
    object ClientEmpqI_POS_SET: TBooleanField
      DisplayLabel = 'POS'#37197#32622
      FieldName = 'I_POS_SET'
    end
    object ClientEmpqI_BEGINNING: TBooleanField
      DisplayLabel = #21021#22987#21270
      FieldName = 'I_BEGINNING'
    end
    object ClientEmpqI_EXIT: TBooleanField
      DisplayLabel = #31995#32479#36864#20986
      FieldName = 'I_EXIT'
    end
    object ClientEmpqI_DATETIME: TBooleanField
      DisplayLabel = #26102#38388#20462#25913
      FieldName = 'I_DATETIME'
    end
  end
  object ServerEmpq: TCSADOQuery
    Parameters = <>
    Left = 600
    Top = 42
    object ServerEmpqI_SHOP_CD: TStringField
      DisplayLabel = #20998#24215#32534#21495
      FieldName = 'I_SHOP_CD'
      Size = 4
    end
    object ServerEmpqI_EMP_CD: TStringField
      DisplayLabel = #24037#21495
      FieldName = 'I_EMP_CD'
      Size = 4
    end
    object ServerEmpqI_EMP_NAME: TStringField
      DisplayLabel = #22995#21517
      FieldName = 'I_EMP_NAME'
      Size = 30
    end
    object ServerEmpqI_EMP_JOB: TStringField
      DisplayLabel = #32844#20301
      FieldName = 'I_EMP_JOB'
      Size = 10
    end
    object ServerEmpqI_EMP_POWER_CD: TStringField
      DisplayLabel = #26435#38480#21495
      FieldName = 'I_EMP_POWER_CD'
      Size = 2
    end
    object ServerEmpqI_UNLOCK: TBooleanField
      DisplayLabel = #35299#25346
      FieldName = 'I_UNLOCK'
    end
    object ServerEmpqI_CHANGE: TBooleanField
      DisplayLabel = #25913#39184
      FieldName = 'I_CHANGE'
    end
    object ServerEmpqI_DELETE: TBooleanField
      DisplayLabel = #20316#24223
      FieldName = 'I_DELETE'
    end
    object ServerEmpqI_OUTDISCOUNT: TBooleanField
      DisplayLabel = #22806#21334#25171#25240
      FieldName = 'I_OUTDISCOUNT'
    end
    object ServerEmpqI_POS_SET: TBooleanField
      DisplayLabel = 'POS'#37197#32622
      FieldName = 'I_POS_SET'
    end
    object ServerEmpqI_BEGINNING: TBooleanField
      DisplayLabel = #21021#22987#21270
      FieldName = 'I_BEGINNING'
    end
    object ServerEmpqI_EXIT: TBooleanField
      DisplayLabel = #31995#32479#36864#20986
      FieldName = 'I_EXIT'
    end
    object ServerEmpqI_DATETIME: TBooleanField
      DisplayLabel = #26102#38388#20462#25913
      FieldName = 'I_DATETIME'
    end
  end
  object ClientMachinesq: TCSADOQuery
    Parameters = <>
    Left = 572
    Top = 146
  end
  object ServerMachinesq: TCSADOQuery
    Parameters = <>
    Left = 600
    Top = 146
  end
  object AdoServer: TADOConnection
    LoginPrompt = False
    Left = 348
    Top = 34
  end
  object AdoClient: TADOConnection
    LoginPrompt = False
    Left = 376
    Top = 34
  end
  object SysUserClientq: TCSADOQuery
    Parameters = <>
    Left = 572
    Top = 70
    object SysUserClientquser_id: TStringField
      DisplayLabel = #29992#25143#32534#21495
      FieldName = 'user_id'
      Size = 6
    end
    object SysUserClientquser_name: TStringField
      DisplayLabel = #29992#25143#21517#31216
      FieldName = 'user_name'
      Size = 30
    end
    object SysUserClientqpassword: TStringField
      DisplayLabel = #29992#25143#23494#30721
      FieldName = 'password'
      Size = 6
    end
    object SysUserClientqcreate_time: TDateTimeField
      DisplayLabel = #28155#21152#26102#38388
      FieldName = 'create_time'
    end
    object SysUserClientqmodify_time: TDateTimeField
      DisplayLabel = #26368#21518#30331#38470#26102#38388
      FieldName = 'modify_time'
    end
  end
  object SysUserServerq: TCSADOQuery
    Parameters = <>
    Left = 600
    Top = 70
    object SysUserServerquser_id: TStringField
      DisplayLabel = #29992#25143#32534#21495
      FieldName = 'user_id'
      Size = 6
    end
    object SysUserServerquser_name: TStringField
      DisplayLabel = #29992#25143#21517#31216
      FieldName = 'user_name'
      Size = 30
    end
    object SysUserServerqpassword: TStringField
      DisplayLabel = #29992#25143#23494#30721
      FieldName = 'password'
      Size = 6
    end
    object SysUserServerqcreate_time: TDateTimeField
      DisplayLabel = #28155#21152#26102#38388
      FieldName = 'create_time'
    end
    object SysUserServerqmodify_time: TDateTimeField
      DisplayLabel = #26368#21518#30331#38470#26102#38388
      FieldName = 'modify_time'
    end
  end
  object ClientPosParamq: TCSADOQuery
    Parameters = <>
    Left = 572
    Top = 242
  end
  object ServerPosParamq: TCSADOQuery
    Parameters = <>
    Left = 600
    Top = 242
  end
  object ServerSaleItemq: TCSADOQuery
    Parameters = <>
    Left = 576
    Top = 326
    object ServerSaleItemqI_ITEM_CD: TStringField
      DisplayLabel = #32534#21495
      FieldName = 'I_ITEM_CD'
      Size = 4
    end
    object ServerSaleItemqI_ITEM_NAME: TStringField
      DisplayLabel = #21517#31216
      FieldName = 'I_ITEM_NAME'
      Size = 30
    end
    object ServerSaleItemqI_ITEM_COLOR: TStringField
      FieldName = 'I_ITEM_COLOR'
      Size = 50
    end
  end
  object ClientSaleItemq: TCSADOQuery
    Parameters = <>
    Left = 604
    Top = 326
    object ClientSaleItemqI_ITEM_CD: TStringField
      DisplayLabel = #32534#21495
      FieldName = 'I_ITEM_CD'
      Size = 4
    end
    object ClientSaleItemqI_ITEM_NAME: TStringField
      DisplayLabel = #21517#31216
      FieldName = 'I_ITEM_NAME'
      Size = 30
    end
    object ClientSaleItemqI_ITEM_COLOR: TStringField
      FieldName = 'I_ITEM_COLOR'
      Size = 50
    end
  end
  object ServerSaleq: TCSADOQuery
    Parameters = <>
    Left = 576
    Top = 354
    object ServerSaleqI_SALE_CD: TStringField
      DisplayLabel = #25104#21697#32534#21495
      FieldName = 'I_SALE_CD'
      Size = 6
    end
    object ServerSaleqI_SALE_NAME: TStringField
      DisplayLabel = #25104#21697#21517#31216
      FieldName = 'I_SALE_NAME'
      Size = 30
    end
    object ServerSaleqI_PRICE: TBCDField
      DisplayLabel = #21333#20215
      FieldName = 'I_PRICE'
      Precision = 19
    end
    object ServerSaleqI_UNIT: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'I_UNIT'
      Size = 2
    end
    object ServerSaleqI_SALE_ITEM_CD: TStringField
      DisplayLabel = #20998#31867
      FieldName = 'I_SALE_ITEM_CD'
      Size = 4
    end
    object ServerSaleqI_FIX_SALE: TBooleanField
      DisplayLabel = #26159#21542#22871#39184
      FieldName = 'I_FIX_SALE'
    end
    object ServerSaleqI_SALE_RECORD: TBooleanField
      DisplayLabel = #20135#21697#38144#21806#35760#24405
      FieldName = 'I_SALE_RECORD'
    end
    object ServerSaleqI_OTHER_RECORD: TBooleanField
      DisplayLabel = #33829#19994#22806#25910#20837
      FieldName = 'I_OTHER_RECORD'
    end
    object ServerSaleqI_HELPER_CODE: TStringField
      DisplayLabel = #21161#35760#31526
      FieldName = 'I_HELPER_CODE'
      Size = 10
    end
    object ServerSaleqI_LSM: TBooleanField
      DisplayLabel = 'LSM'#20419#38144
      FieldName = 'I_LSM'
    end
    object ServerSaleqI_COST: TBCDField
      DisplayLabel = #25104#26412#26680#31639
      FieldName = 'I_COST'
      Precision = 19
    end
  end
  object ClientSaleq: TCSADOQuery
    Parameters = <>
    Left = 604
    Top = 354
    object ClientSaleqI_SALE_CD: TStringField
      DisplayLabel = #25104#21697#32534#21495
      FieldName = 'I_SALE_CD'
      Size = 6
    end
    object ClientSaleqI_SALE_NAME: TStringField
      DisplayLabel = #25104#21697#21517#31216
      FieldName = 'I_SALE_NAME'
      Size = 30
    end
    object ClientSaleqI_PRICE: TBCDField
      DisplayLabel = #21333#20215
      FieldName = 'I_PRICE'
      Precision = 19
    end
    object ClientSaleqI_UNIT: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'I_UNIT'
      Size = 2
    end
    object ClientSaleqI_SALE_ITEM_CD: TStringField
      DisplayLabel = #20998#31867
      FieldName = 'I_SALE_ITEM_CD'
      Size = 4
    end
    object ClientSaleqI_FIX_SALE: TBooleanField
      DisplayLabel = #26159#21542#22871#39184
      FieldName = 'I_FIX_SALE'
    end
    object ClientSaleqI_SALE_RECORD: TBooleanField
      DisplayLabel = #20135#21697#38144#21806#35760#24405
      FieldName = 'I_SALE_RECORD'
    end
    object ClientSaleqI_OTHER_RECORD: TBooleanField
      DisplayLabel = #33829#19994#22806#25910#20837
      FieldName = 'I_OTHER_RECORD'
    end
    object ClientSaleqI_HELPER_CODE: TStringField
      DisplayLabel = #21161#35760#31526
      FieldName = 'I_HELPER_CODE'
      Size = 10
    end
    object ClientSaleqI_LSM: TBooleanField
      DisplayLabel = 'LSM'#20419#38144
      FieldName = 'I_LSM'
    end
    object ClientSaleqI_COST: TBCDField
      DisplayLabel = #25104#26412#26680#31639
      FieldName = 'I_COST'
      Precision = 19
    end
  end
  object ClientLSMq: TCSADOQuery
    Parameters = <>
    Left = 672
    Top = 326
  end
  object ServerLSMq: TCSADOQuery
    Parameters = <>
    Left = 700
    Top = 326
  end
  object ServerTradeInfoq: TCSADOQuery
    Parameters = <>
    Left = 676
    Top = 418
  end
  object ClientTradeInfoq: TCSADOQuery
    Parameters = <>
    Left = 708
    Top = 418
  end
  object ClientTradeDetailq: TCSADOQuery
    Parameters = <>
    Left = 676
    Top = 446
  end
  object ServerTradeDetailq: TCSADOQuery
    Parameters = <>
    Left = 708
    Top = 446
  end
  object ClientOnLineq: TCSADOQuery
    CursorType = ctStatic
    Parameters = <>
    Left = 648
    Top = 418
    object ClientOnLineqI_MACHINES_CD: TStringField
      FieldName = 'I_MACHINES_CD'
      Size = 2
    end
    object ClientOnLineqI_LOGIN_CD: TStringField
      FieldName = 'I_LOGIN_CD'
      Size = 6
    end
    object ClientOnLineqI_DATE: TStringField
      FieldName = 'I_DATE'
      Size = 10
    end
    object ClientOnLineqI_TIME: TStringField
      FieldName = 'I_TIME'
      Size = 10
    end
    object ClientOnLineqI_WORK_CD: TStringField
      FieldName = 'I_WORK_CD'
      Size = 2
    end
    object ClientOnLineqI_AMOUNT: TBCDField
      FieldName = 'I_AMOUNT'
      Precision = 19
    end
    object ClientOnLineqI_FLAG: TIntegerField
      FieldName = 'I_FLAG'
    end
  end
  object ServerOnLineq: TCSADOQuery
    CursorType = ctStatic
    Parameters = <>
    Left = 648
    Top = 446
    object StringField1: TStringField
      FieldName = 'I_MACHINES_CD'
      Size = 2
    end
    object StringField2: TStringField
      FieldName = 'I_LOGIN_CD'
      Size = 6
    end
    object StringField3: TStringField
      FieldName = 'I_DATE'
      Size = 10
    end
    object StringField4: TStringField
      FieldName = 'I_TIME'
      Size = 10
    end
    object StringField5: TStringField
      FieldName = 'I_WORK_CD'
      Size = 2
    end
    object BCDField1: TBCDField
      FieldName = 'I_AMOUNT'
      Precision = 19
    end
    object IntegerField1: TIntegerField
      FieldName = 'I_FLAG'
    end
  end
end
