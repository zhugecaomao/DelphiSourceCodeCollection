object BriefCaseDemo: TBriefCaseDemo
  OldCreateOrder = False
  Left = 384
  Top = 324
  Height = 479
  Width = 741
  object Query1: TQuery
    DatabaseName = 'DBDEMO'
    SessionName = 'Session1_1'
    SQL.Strings = (
      'select * from country')
    Left = 128
    Top = 16
  end
  object Session1: TSession
    Active = True
    AutoSessionName = True
    Left = 16
    Top = 16
  end
  object Database1: TDatabase
    AliasName = 'IBLOCAL'
    DatabaseName = 'DBDEMO'
    HandleShared = True
    LoginPrompt = False
    Params.Strings = (
      'USER NAME=SYSDBA'
      'PASSWORD=masterkey')
    SessionName = 'Session1_1'
    Left = 72
    Top = 16
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = Query1
    Constraints = True
    Left = 192
    Top = 16
  end
end
