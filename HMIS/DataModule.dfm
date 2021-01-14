object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 266
  Top = 145
  Height = 342
  Width = 487
  object ADOConnection: TADOConnection
    CommandTimeout = 5
    ConnectionTimeout = 5
    KeepConnection = False
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 16
  end
  object AT_Assis: TADOTable
    Connection = ADOConnection
    CursorType = ctStatic
    TableName = 'Company'
    Left = 24
    Top = 80
  end
  object DS_Assis: TDataSource
    DataSet = AT_Assis
    Left = 24
    Top = 136
  end
  object AQ_Person: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM Person')
    Left = 89
    Top = 200
    object AQ_PersonPer_ID: TIntegerField
      FieldName = 'Per_ID'
    end
    object AQ_PersonPer_Name: TWideStringField
      FieldName = 'Per_Name'
      FixedChar = True
      Size = 10
    end
    object AQ_PersonPer_Bra: TWideStringField
      FieldName = 'Per_Bra'
      FixedChar = True
    end
    object AQ_PersonPer_Duty: TWideStringField
      FieldName = 'Per_Duty'
      FixedChar = True
    end
    object AQ_PersonPer_Tel: TWideStringField
      FieldName = 'Per_Tel'
      FixedChar = True
      Size = 18
    end
    object AQ_PersonWork_Mon: TBooleanField
      FieldName = 'Work_Mon'
    end
    object AQ_PersonWork_Tue: TBooleanField
      FieldName = 'Work_Tue'
    end
    object AQ_PersonWork_Wen: TBooleanField
      FieldName = 'Work_Wen'
    end
    object AQ_PersonWork_Thu: TBooleanField
      FieldName = 'Work_Thu'
    end
    object AQ_PersonWork_Fri: TBooleanField
      FieldName = 'Work_Fri'
    end
    object AQ_PersonWork_Sat: TBooleanField
      FieldName = 'Work_Sat'
    end
    object AQ_PersonWork_Sun: TBooleanField
      FieldName = 'Work_Sun'
    end
    object AQ_PersonMon_Name: TStringField
      FieldKind = fkLookup
      FieldName = 'Mon_Name'
      LookupDataSet = AT_OFWork
      LookupKeyFields = 'Work_Flag'
      LookupResultField = 'Work_Value'
      KeyFields = 'Work_Mon'
      LookupCache = True
      Lookup = True
    end
    object AQ_PersonTue_Name: TStringField
      FieldKind = fkLookup
      FieldName = 'Tue_Name'
      LookupDataSet = AT_OFWork
      LookupKeyFields = 'Work_Flag'
      LookupResultField = 'Work_Value'
      KeyFields = 'Work_Tue'
      LookupCache = True
      Lookup = True
    end
    object AQ_PersonWen_Name: TStringField
      FieldKind = fkLookup
      FieldName = 'Wen_Name'
      LookupDataSet = AT_OFWork
      LookupKeyFields = 'Work_Flag'
      LookupResultField = 'Work_Value'
      KeyFields = 'Work_Wen'
      LookupCache = True
      Lookup = True
    end
    object AQ_PersonThu_Name: TStringField
      FieldKind = fkLookup
      FieldName = 'Thu_Name'
      LookupDataSet = AT_OFWork
      LookupKeyFields = 'Work_Flag'
      LookupResultField = 'Work_Value'
      KeyFields = 'Work_Thu'
      LookupCache = True
      Lookup = True
    end
    object AQ_PersonFri_Name: TStringField
      FieldKind = fkLookup
      FieldName = 'Fri_Name'
      LookupDataSet = AT_OFWork
      LookupKeyFields = 'Work_Flag'
      LookupResultField = 'Work_Value'
      KeyFields = 'Work_Fri'
      LookupCache = True
      Lookup = True
    end
    object AQ_PersonSat_Name: TStringField
      FieldKind = fkLookup
      FieldName = 'Sat_Name'
      LookupDataSet = AT_OFWork
      LookupKeyFields = 'Work_Flag'
      LookupResultField = 'Work_Value'
      KeyFields = 'Work_Sat'
      LookupCache = True
      Lookup = True
    end
    object AQ_PersonSun_Name: TStringField
      FieldKind = fkLookup
      FieldName = 'Sun_Name'
      LookupDataSet = AT_OFWork
      LookupKeyFields = 'Work_Flag'
      LookupResultField = 'Work_Value'
      KeyFields = 'Work_Sun'
      LookupCache = True
      Lookup = True
    end
  end
  object DS_Person: TDataSource
    DataSet = AQ_Person
    Left = 89
    Top = 256
  end
  object AT_Count: TADOTable
    Connection = ADOConnection
    CursorType = ctStatic
    TableName = 'Count'
    Left = 90
    Top = 80
    object AT_CountCount_Name: TWideStringField
      FieldName = 'Count_Name'
      FixedChar = True
    end
    object AT_CountCount_Value: TIntegerField
      FieldName = 'Count_Value'
    end
  end
  object DS_Count: TDataSource
    DataSet = AT_Count
    Left = 90
    Top = 136
  end
  object AT_OFWork: TADOTable
    Connection = ADOConnection
    CursorType = ctStatic
    TableName = 'On_Off_Work'
    Left = 154
    Top = 80
  end
  object DS_OFWork: TDataSource
    DataSet = AT_OFWork
    Left = 154
    Top = 136
  end
  object AQ_CDrug: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM CDrug')
    Left = 23
    Top = 200
  end
  object DS_CDrug: TDataSource
    DataSet = AQ_CDrug
    Left = 23
    Top = 256
  end
  object AQ_SQL: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      '')
    Left = 405
    Top = 256
  end
  object AQ_PInputB: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM PInputB')
    Left = 155
    Top = 200
  end
  object DS_PInputB: TDataSource
    DataSet = AQ_PInputB
    Left = 155
    Top = 256
  end
  object DS_PInput: TDataSource
    DataSet = AT_PInput
    Left = 226
    Top = 136
  end
  object AQ_PKucun: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM PKucun')
    Left = 227
    Top = 200
    object AQ_PKucunPK_No: TIntegerField
      FieldName = 'PK_No'
    end
    object AQ_PKucunPK_INumber: TIntegerField
      FieldName = 'PK_INumber'
    end
    object AQ_PKucunPK_ONumber: TIntegerField
      FieldName = 'PK_ONumber'
    end
    object AQ_PKucunPK_TNumber: TIntegerField
      FieldName = 'PK_TNumber'
    end
    object AQ_PKucunNo_Name: TStringField
      FieldKind = fkLookup
      FieldName = 'No_Name'
      LookupDataSet = AQ_CDrug
      LookupKeyFields = 'CDrug_No'
      LookupResultField = 'CDrug_Name'
      KeyFields = 'PK_No'
      LookupCache = True
      Lookup = True
    end
    object AQ_PKucunNo_Kind: TStringField
      FieldKind = fkLookup
      FieldName = 'No_Kind'
      LookupDataSet = AQ_CDrug
      LookupKeyFields = 'CDrug_No'
      LookupResultField = 'CDrug_Kind'
      KeyFields = 'PK_No'
      LookupCache = True
      Lookup = True
    end
    object AQ_PKucunNo_Unit: TStringField
      FieldKind = fkLookup
      FieldName = 'No_Unit'
      LookupDataSet = AQ_CDrug
      LookupKeyFields = 'CDrug_No'
      LookupResultField = 'CDrug_Unit'
      KeyFields = 'PK_No'
      LookupCache = True
      Lookup = True
    end
  end
  object DS_PKucun: TDataSource
    DataSet = AQ_PKucun
    Left = 227
    Top = 256
  end
  object DS_CReg: TDataSource
    DataSet = AT_CReg
    Left = 294
    Top = 136
  end
  object AT_CReg: TADOTable
    Connection = ADOConnection
    CursorType = ctStatic
    TableName = 'CRegister'
    Left = 294
    Top = 79
  end
  object DS_TCMoney: TDataSource
    DataSet = AQ_TCMoney
    Left = 311
    Top = 256
  end
  object AT_CMoney: TADOTable
    Connection = ADOConnection
    CursorType = ctStatic
    IndexFieldNames = 'CM_ID'
    MasterFields = 'TCM_ID'
    MasterSource = DS_TCMoney
    TableName = 'CMoney'
    Left = 362
    Top = 79
    object AT_CMoneyCM_ID: TIntegerField
      FieldName = 'CM_ID'
    end
    object AT_CMoneyCM_Name: TWideStringField
      FieldName = 'CM_Name'
      FixedChar = True
      Size = 40
    end
    object AT_CMoneyCM_Num: TIntegerField
      FieldName = 'CM_Num'
    end
    object AT_CMoneyCM_Price: TBCDField
      FieldName = 'CM_Price'
      Precision = 19
    end
    object AT_CMoneyCM_Tatol: TBCDField
      FieldName = 'CM_Tatol'
      Precision = 19
    end
  end
  object DS_CMoney: TDataSource
    DataSet = AT_CMoney
    Left = 362
    Top = 136
  end
  object AT_HReg: TADOTable
    Connection = ADOConnection
    CursorType = ctStatic
    TableName = 'HRegister'
    Left = 430
    Top = 79
  end
  object DS_HReg: TDataSource
    DataSet = AT_HReg
    Left = 430
    Top = 136
  end
  object ASP_HMIS: TADOStoredProc
    Connection = ADOConnection
    ProcedureName = 'MRegister;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@time_start'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = 37774d
      end
      item
        Name = '@end_start'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = 37774.9583333333d
      end
      item
        Name = '@tmoney'
        Attributes = [paNullable]
        DataType = ftBCD
        Direction = pdInputOutput
        Precision = 19
        Value = 25000c
      end>
    Left = 410
    Top = 200
  end
  object AT_PInput: TADOTable
    Connection = ADOConnection
    CursorType = ctStatic
    TableName = 'PInput'
    Left = 224
    Top = 74
    object AT_PInputPIN_ID: TIntegerField
      FieldName = 'PIN_ID'
    end
    object AT_PInputPIN_PID: TIntegerField
      FieldName = 'PIN_PID'
    end
    object AT_PInputPIN_Name: TIntegerField
      FieldName = 'PIN_Name'
    end
    object AT_PInputPIN_Kind: TWideStringField
      FieldName = 'PIN_Kind'
      FixedChar = True
    end
    object AT_PInputPIN_Unit: TWideStringField
      FieldName = 'PIN_Unit'
      FixedChar = True
      Size = 10
    end
    object AT_PInputPIN_Company: TIntegerField
      FieldName = 'PIN_Company'
    end
    object AT_PInputPIN_UPrice: TBCDField
      FieldName = 'PIN_UPrice'
      Precision = 19
    end
    object AT_PInputPIN_Number: TIntegerField
      FieldName = 'PIN_Number'
    end
    object AT_PInputPIN_TPrice: TBCDField
      FieldName = 'PIN_TPrice'
      Precision = 19
    end
    object AT_PInputComp_Name: TStringField
      FieldKind = fkLookup
      FieldName = 'Comp_Name'
      LookupDataSet = AT_Assis
      LookupKeyFields = 'Company_No'
      LookupResultField = 'Company_Name'
      KeyFields = 'PIN_Company'
      LookupCache = True
      Lookup = True
    end
    object AT_PInputName_Physic: TStringField
      FieldKind = fkLookup
      FieldName = 'Name_Physic'
      LookupDataSet = AQ_CDrug
      LookupKeyFields = 'CDrug_No'
      LookupResultField = 'CDrug_Name'
      KeyFields = 'PIN_Name'
      LookupCache = True
      Lookup = True
    end
    object AT_PInputName_kind: TStringField
      FieldKind = fkLookup
      FieldName = 'Name_kind'
      LookupDataSet = AQ_CDrug
      LookupKeyFields = 'CDrug_No'
      LookupResultField = 'CDrug_Kind'
      KeyFields = 'PIN_Name'
      LookupCache = True
      Lookup = True
    end
    object AT_PInputName_Unit: TStringField
      FieldKind = fkLookup
      FieldName = 'Name_Unit'
      LookupDataSet = AQ_CDrug
      LookupKeyFields = 'CDrug_No'
      LookupResultField = 'CDrug_Unit'
      KeyFields = 'PIN_Name'
      LookupCache = True
      Lookup = True
    end
  end
  object AQ_TCMoney: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM TCMoney')
    Left = 312
    Top = 200
    object AQ_TCMoneyTCM_ID: TIntegerField
      FieldName = 'TCM_ID'
    end
    object AQ_TCMoneyTCM_RID: TIntegerField
      FieldName = 'TCM_RID'
    end
    object AQ_TCMoneyTCM_Name: TWideStringField
      FieldName = 'TCM_Name'
      FixedChar = True
      Size = 10
    end
    object AQ_TCMoneyTCM_Date: TDateTimeField
      FieldName = 'TCM_Date'
    end
    object AQ_TCMoneyTHM_Doctor: TWideStringField
      FieldName = 'THM_Doctor'
      FixedChar = True
      Size = 10
    end
    object AQ_TCMoneyTCM_WMDrug: TBCDField
      FieldName = 'TCM_WMDrug'
      Precision = 19
    end
    object AQ_TCMoneyTCM_CMDrug: TBCDField
      FieldName = 'TCM_CMDrug'
      Precision = 19
    end
    object AQ_TCMoneyTCM_HMDrug: TBCDField
      FieldName = 'TCM_HMDrug'
      Precision = 19
    end
    object AQ_TCMoneyTCM_MExam: TBCDField
      FieldName = 'TCM_MExam'
      Precision = 19
    end
    object AQ_TCMoneyTCM_MInject: TBCDField
      FieldName = 'TCM_MInject'
      Precision = 19
    end
    object AQ_TCMoneyTCM_MEmit: TBCDField
      FieldName = 'TCM_MEmit'
      Precision = 19
    end
    object AQ_TCMoneyTCM_MDiag: TBCDField
      FieldName = 'TCM_MDiag'
      Precision = 19
    end
    object AQ_TCMoneyTCM_MChem: TBCDField
      FieldName = 'TCM_MChem'
      Precision = 19
    end
    object AQ_TCMoneyTCM_MCure: TBCDField
      FieldName = 'TCM_MCure'
      Precision = 19
    end
    object AQ_TCMoneyTCM_MSurgery: TBCDField
      FieldName = 'TCM_MSurgery'
      Precision = 19
    end
    object AQ_TCMoneyTCM_MBlood: TBCDField
      FieldName = 'TCM_MBlood'
      Precision = 19
    end
    object AQ_TCMoneyTCM_MOxygen: TBCDField
      FieldName = 'TCM_MOxygen'
      Precision = 19
    end
    object AQ_TCMoneyTCM_MOther: TBCDField
      FieldName = 'TCM_MOther'
      Precision = 19
    end
    object AQ_TCMoneyTCM_Total: TBCDField
      FieldName = 'TCM_Total'
      Precision = 19
    end
  end
end
