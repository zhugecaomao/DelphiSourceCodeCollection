object CardData: TCardData
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 192
  Top = 104
  Height = 150
  Width = 215
  object tblSysData: TTable
    DatabaseName = 'LfHotelUser'
    Left = 24
    Top = 16
  end
  object qrySysData: TQuery
    DatabaseName = 'LfHotelUser'
    Left = 96
    Top = 16
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
    Top = 72
  end
end
