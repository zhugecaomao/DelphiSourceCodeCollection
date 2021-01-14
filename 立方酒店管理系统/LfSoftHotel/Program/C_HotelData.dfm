object HotelData: THotelData
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 246
  Top = 137
  Height = 380
  Width = 451
  object tblSysData: TTable
    DatabaseName = 'LfHotelUser'
    Left = 32
    Top = 24
  end
  object tblUserdata: TTable
    DatabaseName = 'LfHotelUser'
    Left = 88
    Top = 24
  end
  object qryUserData: TQuery
    DatabaseName = 'LfHotelUser'
    Left = 152
    Top = 24
  end
  object tblBMDM: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'BMDM'
    Left = 32
    Top = 88
  end
  object tblCTDM: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'CTDM'
    Left = 88
    Top = 88
  end
  object tblDQDM: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'DQDM'
    Left = 144
    Top = 88
  end
  object tblFLDM: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'FLDM'
    Left = 32
    Top = 144
  end
  object tblFXDM: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'FXDM'
    Left = 88
    Top = 144
  end
  object tblGBDM: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'GBDM'
    Left = 144
    Top = 144
  end
  object tblHCDM: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'HCDM'
    Left = 32
    Top = 200
  end
  object tblKFDM: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'KFDM'
    Left = 88
    Top = 200
  end
  object tblLCDM: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'LCDM'
    Left = 144
    Top = 200
  end
  object tblMZDM: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'MZDM'
    Left = 32
    Top = 248
  end
  object tblQZDM: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'QZDM'
    Left = 88
    Top = 248
  end
  object tblXMDM: TTable
    Active = True
    DatabaseName = 'LfHotelUser'
    TableName = 'XMDM'
    Left = 32
    Top = 296
  end
  object tblXYK: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'XYK'
    Left = 88
    Top = 296
  end
  object tblZJDM: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'ZJDM'
    Left = 144
    Top = 296
  end
  object tblKHDA: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'KHDA'
    Left = 200
    Top = 88
  end
  object tblBqj: TTable
    DatabaseName = 'LfHotelUser'
    FieldDefs = <
      item
        Name = 'D_KFBH'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'D_SJFJ'
        DataType = ftCurrency
      end
      item
        Name = 'D_BJS'
        DataType = ftInteger
      end
      item
        Name = 'D_QJS'
        DataType = ftInteger
      end
      item
        Name = 'D_JJFJ'
        DataType = ftCurrency
      end>
    StoreDefs = True
    TableName = 'BQJ'
    Left = 368
    Top = 16
  end
  object tblKfzt: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'KFZT'
    Left = 200
    Top = 144
  end
  object tblKrxx: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'KRXX'
    Left = 200
    Top = 200
  end
  object tblKryj: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'KRYJ'
    Left = 200
    Top = 248
  end
  object tblKrzd: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'KRZD'
    Left = 200
    Top = 296
  end
  object tblEwf: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'EWF'
    Left = 328
    Top = 16
  end
  object BatchMove1: TBatchMove
    Mode = batAppendUpdate
    Left = 368
    Top = 88
  end
  object tblLctj: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'LCTJ'
    Left = 336
    Top = 136
  end
  object tblLctjda: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'LCTJDA'
    Left = 384
    Top = 136
  end
  object qrySysData: TQuery
    DatabaseName = 'LfHotelUser'
    Left = 224
    Top = 24
  end
  object tblCtdc: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'CTDC'
    Left = 336
    Top = 192
  end
  object tblCtdcda: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'CTDCDA'
    Left = 384
    Top = 192
  end
  object tblDcmx: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'DCMX'
    Left = 336
    Top = 248
  end
  object tblDcmxda: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'DCMXDA'
    Left = 384
    Top = 248
  end
  object tblYdxx: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'YDXX'
    Left = 248
    Top = 88
  end
  object qryDhf: TQuery
    DatabaseName = 'LfHotelUser'
    Left = 264
    Top = 144
  end
  object tblXxdc: TTable
    DatabaseName = 'LfHotelUser'
    IndexFieldNames = 'D_KRBH'
    TableName = 'XXDC'
    Left = 264
    Top = 200
  end
  object DatabaseUser: TDatabase
    AliasName = 'HOTELUSER'
    Connected = True
    DatabaseName = 'LfHotelUser'
    LoginPrompt = False
    Params.Strings = (
      'USER NAME=SYSDBA'
      'PASSWORD=masterkey')
    SessionName = 'Default'
    Left = 336
    Top = 296
  end
  object tblDhfOld: TTable
    Left = 296
    Top = 144
  end
  object tblKrzdcx: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'KRZDCX'
    Left = 276
    Top = 17
  end
  object tblYssj: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'YSSJ'
    Left = 296
    Top = 80
  end
end
