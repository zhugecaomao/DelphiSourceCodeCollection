object JfData: TJfData
  OldCreateOrder = False
  Left = 192
  Top = 107
  Height = 289
  Width = 342
  object tblBasicFmt: TTable
    DatabaseName = 'LFHOTELUSER'
    TableName = 'BASICFMT'
    Left = 24
    Top = 32
  end
  object tblNewData: TTable
    DatabaseName = 'LFHOTELUSER'
    TableName = 'NEWDATA'
    Left = 24
    Top = 88
  end
  object tblJfConfig: TTable
    DatabaseName = 'LFHOTELUSER'
    TableName = 'JFCONFIG'
    Left = 96
    Top = 32
  end
  object tblFare: TTable
    DatabaseName = 'LFHOTELUSER'
    TableName = 'FARE'
    Left = 96
    Top = 88
  end
  object tblShfare: TTable
    DatabaseName = 'LFHOTELUSER'
    TableName = 'SHFARE'
    Left = 168
    Top = 32
  end
  object tblOldData: TTable
    DatabaseName = 'LFHOTELUSER'
    TableName = 'OLDDATA'
    Left = 168
    Top = 88
  end
  object tblUserData: TTable
    DatabaseName = 'LFHOTELUSER'
    TableName = 'NEWDATA'
    Left = 24
    Top = 144
  end
  object tblDhf: TTable
    DatabaseName = 'd:'
    TableName = 'DHF.db'
    Left = 96
    Top = 144
  end
  object HotelDatabase: TDatabase
    AliasName = 'HOTELUSER'
    Connected = True
    DatabaseName = 'LfHotelUser'
    LoginPrompt = False
    Params.Strings = (
      'USER NAME=SYSDBA'
      'PASSWORD=masterkey')
    SessionName = 'Default'
    Left = 168
    Top = 144
  end
end
