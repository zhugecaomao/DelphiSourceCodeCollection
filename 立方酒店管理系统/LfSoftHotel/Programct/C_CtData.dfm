object CtData: TCtData
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 192
  Top = 107
  Height = 266
  Width = 320
  object tblCtxm: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'CTXM'
    Left = 16
    Top = 16
  end
  object tblSysData: TTable
    DatabaseName = 'LfHotelUser'
    Left = 16
    Top = 72
  end
  object tblUserData: TTable
    DatabaseName = 'LfHotelUser'
    Left = 80
    Top = 72
  end
  object qrySum: TQuery
    DatabaseName = 'LfHotelUser'
    Left = 80
    Top = 16
  end
  object tblCtdm: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'CTDM'
    Left = 176
    Top = 16
  end
  object qrySysData: TQuery
    DatabaseName = 'LfHotelUser'
    Left = 176
    Top = 72
  end
  object DatabaseUser: TDatabase
    AliasName = 'HOTELUSER'
    DatabaseName = 'LfHotelUser'
    LoginPrompt = False
    Params.Strings = (
      'USER NAME=SYSDBA'
      'PASSWORD=masterkey')
    SessionName = 'Default'
    Left = 24
    Top = 144
  end
  object tblFldm: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'FLDM'
    Left = 96
    Top = 144
  end
end
