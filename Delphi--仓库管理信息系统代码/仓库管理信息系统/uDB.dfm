object dmWarehouse: TdmWarehouse
  OldCreateOrder = False
  Left = 603
  Top = 294
  Height = 320
  Width = 340
  object ACWarehouse: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=Database\Warehouse.' +
      'mdb;Persist Security Info=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 40
    Top = 16
  end
  object XXDB_CKDYB: TADOQuery
    Connection = ACWarehouse
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from CKDYB order by id')
    Left = 32
    Top = 88
  end
end
