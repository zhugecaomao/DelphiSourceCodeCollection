object Chat: TChat
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 279
  Top = 154
  Height = 375
  Width = 544
  object Con: TADOConnection
    LoginPrompt = False
    Mode = cmReadWrite
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    AfterConnect = ConAfterConnect
    Left = 72
    Top = 32
  end
  object UpUser: TADOQuery
    Connection = Con
    Parameters = <
      item
        Name = 'Logined'
        DataType = ftSmallint
        Size = -1
        Value = Null
      end
      item
        Name = 'Host'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'Address'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'Handle'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'ID'
        DataType = ftString
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'update UserInfo'
      'set Logined=:Logined,'
      '  Host=:Host,'
      '  Address=:Address,'
      '  Handle=:Handle'
      'where ID=:ID'
      ' '
      ' '
      ' '
      ' ')
    Left = 72
    Top = 88
  end
  object InsUser: TADOQuery
    Connection = Con
    Parameters = <
      item
        Name = 'ID'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'UserName'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'PasswordA'
        Attributes = [paNullable]
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'Host'
        DataType = ftString
        Size = 16
        Value = Null
      end
      item
        Name = 'Address'
        Attributes = [paNullable]
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'Handle'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'Logined'
        DataType = ftSmallint
        Size = -1
        Value = Null
      end
      item
        Name = 'Sex'
        DataType = ftSmallint
        Size = -1
        Value = Null
      end
      item
        Name = 'Remark'
        DataType = ftMemo
        Size = -1
        Value = Null
      end
      item
        Name = 'ImageIndex'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'insert into'
      
        '  UserInfo(ID,UserName,PasswordA,Host,Address,Handle,Logined,Sex' +
        ',Remark,ImageIndex)'
      
        'values(:ID,:UserName,:PasswordA,:Host,:Address,:Handle,:Logined,' +
        ':Sex,:Remark,:ImageIndex)'
      ' '
      ' '
      ' '
      ' ')
    Left = 72
    Top = 152
  end
  object qryUser: TADOQuery
    Connection = Con
    CursorLocation = clUseServer
    Parameters = <
      item
        Name = 'ID'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'c'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'PasswordA'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'a'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'b'
        Attributes = [paNullable]
        DataType = ftFixedChar
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      
        'select ID,UserName,Sex,Host,Address,ImageIndex,Remark,Logined,Ha' +
        'ndle,Deleted'
      'from UserInfo'
      'where (ID=:ID or 0=:c)'
      'and (PasswordA=:PasswordA or 0=:a)'
      'and (Logined=0 or 0=:b)'
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 144
    Top = 88
    object qryUserID: TWideStringField
      FieldName = 'ID'
      Size = 50
    end
    object qryUserUserName: TWideStringField
      FieldName = 'UserName'
      Size = 50
    end
    object qryUserSex: TIntegerField
      FieldName = 'Sex'
    end
    object qryUserHost: TWideStringField
      FieldName = 'Host'
      Size = 50
    end
    object qryUserAddress: TWideStringField
      FieldName = 'Address'
      Size = 50
    end
    object qryUserImageIndex: TIntegerField
      FieldName = 'ImageIndex'
    end
    object qryUserRemark: TMemoField
      FieldName = 'Remark'
      BlobType = ftMemo
    end
    object qryUserLogined: TIntegerField
      FieldName = 'Logined'
    end
    object qryUserHandle: TIntegerField
      FieldName = 'Handle'
    end
    object qryUserDeleted: TIntegerField
      FieldName = 'Deleted'
    end
  end
  object qryTemp: TADOQuery
    Connection = Con
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ID'
        DataType = ftString
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select Handle,UserName,Host,Address,Sex,Logined,ID'
      'from UserInfo'
      'where ID<>:ID'
      'order by Logined Desc'
      ' '
      ' '
      ' '
      ' ')
    Left = 144
    Top = 152
    object qryTempHandle: TIntegerField
      FieldName = 'Handle'
    end
    object qryTempUserName: TStringField
      FieldName = 'UserName'
    end
    object qryTempHost: TStringField
      FieldName = 'Host'
    end
    object qryTempAddress: TStringField
      FieldName = 'Address'
      Size = 15
    end
    object qryTempSex: TSmallintField
      FieldName = 'Sex'
    end
    object qryTempLogined: TSmallintField
      FieldName = 'Logined'
    end
    object qryTempID: TStringField
      FieldName = 'ID'
    end
  end
  object Temp: TADOQuery
    Connection = Con
    CursorType = ctStatic
    Parameters = <>
    Prepared = True
    SQL.Strings = (
      ''
      ' ')
    Left = 72
    Top = 208
  end
  object UpTemp: TADOQuery
    Connection = Con
    Parameters = <>
    SQL.Strings = (
      '')
    Left = 144
    Top = 208
  end
  object qryUserInfo: TADOQuery
    Connection = Con
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Handle'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select ID,UserName,Sex,Host,Address,ImageIndex,Remark'
      'from UserInfo'
      'where Logined=1'
      'and Handle=:Handle')
    Left = 208
    Top = 88
    object qryUserInfoID: TStringField
      FieldName = 'ID'
    end
    object qryUserInfoUserName: TStringField
      FieldName = 'UserName'
    end
    object qryUserInfoSex: TIntegerField
      FieldName = 'Sex'
    end
    object qryUserInfoHost: TStringField
      FieldName = 'Host'
    end
    object qryUserInfoAddress: TStringField
      FieldName = 'Address'
      Size = 15
    end
    object qryUserInfoImageIndex: TIntegerField
      FieldName = 'ImageIndex'
    end
    object qryUserInfoRemark: TMemoField
      FieldName = 'Remark'
      BlobType = ftMemo
    end
  end
  object qryOffUser: TADOQuery
    Connection = Con
    Parameters = <>
    SQL.Strings = (
      'Select Handle,ID,UserName,Sex'
      'from UserInfo'
      'where Logined=1'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 208
    Top = 152
  end
  object RealTemp: TADOQuery
    Connection = Con
    Parameters = <>
    Left = 208
    Top = 208
  end
end
