object DM: TDM
  OldCreateOrder = False
  Left = 80
  Top = 124
  Height = 300
  Width = 435
  object Ball01: TTable
    AfterPost = FlushBuffer
    DatabaseName = 'PlayBall'
    TableName = 'BALL01.DB'
    Left = 64
    Top = 9
  end
  object Ball01s: TDataSource
    DataSet = Ball01
    Left = 64
    Top = 65
  end
  object Ball00: TTable
    AfterPost = FlushBuffer
    DatabaseName = 'PlayBall'
    TableName = 'BALL00.DB'
    Left = 20
    Top = 9
  end
  object Ball00s: TDataSource
    DataSet = Ball00
    Left = 20
    Top = 65
  end
  object Rate: TTable
    AfterPost = FlushBuffer
    DatabaseName = 'PlayBall'
    TableName = 'RATE.db'
    Left = 282
    Top = 9
  end
  object Rates: TDataSource
    DataSet = Rate
    Left = 282
    Top = 65
  end
  object PassWord: TTable
    AfterPost = FlushBuffer
    DatabaseName = 'PlayBall'
    TableName = 'PASSWORD.DB'
    Left = 193
    Top = 9
  end
  object Passs: TDataSource
    Left = 193
    Top = 65
  end
  object Water: TTable
    AfterPost = FlushBuffer
    DatabaseName = 'PlayBall'
    TableName = '9Water.db'
    Left = 327
    Top = 9
  end
  object Waters: TDataSource
    DataSet = Water
    Left = 327
    Top = 65
  end
  object Ball02: TTable
    AfterPost = FlushBuffer
    DatabaseName = 'PlayBall'
    TableName = 'Ball02.DB'
    Left = 107
    Top = 9
  end
  object Ball02s: TDataSource
    DataSet = Ball02
    Left = 107
    Top = 65
  end
  object State: TQuery
    AfterPost = FlushBuffer
    DatabaseName = 'PlayBall'
    SQL.Strings = (
      'Select * From Ball01  Where '#32467#24080#26631#24535'=false or '#32467#24080#26631#24535' is Null'
      'and '#23089#20048#31867#21035'=1')
    Left = 237
    Top = 9
  end
  object States: TDataSource
    DataSet = State
    Left = 237
    Top = 65
  end
  object Ball03: TTable
    AfterPost = FlushBuffer
    DatabaseName = 'PlayBall'
    TableName = 'Ball03.DB'
    Left = 150
    Top = 9
  end
  object Ball03s: TDataSource
    DataSet = Ball03
    Left = 150
    Top = 65
  end
end
