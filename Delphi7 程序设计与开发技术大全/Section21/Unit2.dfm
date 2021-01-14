object DataModule2: TDataModule2
  OldCreateOrder = False
  Left = 316
  Top = 304
  Height = 213
  Width = 267
  object StudentTable: TTable
    DatabaseName = 'work'
    IndexFieldNames = 'StuNo'
    TableName = 'StuTable.DB'
    Left = 16
    Top = 16
  end
  object RecordTable: TTable
    DatabaseName = 'work'
    TableName = 'bRecord.DB'
    Left = 80
    Top = 16
  end
  object Booktable: TTable
    DatabaseName = 'work'
    IndexFieldNames = 'BookNo'
    TableName = 'BookTable.DB'
    Left = 128
    Top = 16
  end
  object Query1: TQuery
    DatabaseName = 'work'
    Left = 176
    Top = 16
  end
  object StudentDS: TDataSource
    DataSet = StudentTable
    Left = 16
    Top = 88
  end
  object RecordDS: TDataSource
    DataSet = RecordTable
    Left = 64
    Top = 96
  end
  object BookDS: TDataSource
    DataSet = Booktable
    Left = 104
    Top = 88
  end
  object QueryDS: TDataSource
    DataSet = Query1
    Left = 160
    Top = 88
  end
  object usertable: TTable
    DatabaseName = 'work'
    TableName = 'User1.DB'
    Left = 216
    Top = 24
  end
end
