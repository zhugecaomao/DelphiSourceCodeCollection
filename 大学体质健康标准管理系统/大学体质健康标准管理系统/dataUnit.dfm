object DataModule1: TDataModule1
  OldCreateOrder = False
  Left = 191
  Top = 300
  Height = 527
  Width = 798
  object xibie: TTable
    Active = True
    DatabaseName = 'sport'
    TableName = 'xibie.db'
    Left = 24
  end
  object banjixinxi: TTable
    Active = True
    DatabaseName = 'sport'
    TableName = 'banji.db'
    Left = 104
  end
  object xueshengxinxi: TTable
    Active = True
    DatabaseName = 'sport'
    TableName = 'xueshengxinxi.db'
    Left = 192
  end
  object yonghu: TTable
    Active = True
    DatabaseName = 'sport'
    TableName = 'yonghu.db'
    Left = 264
  end
  object Dxibie: TDataSource
    AutoEdit = False
    DataSet = xibie
    Left = 24
    Top = 64
  end
  object Dbanjixinxi: TDataSource
    AutoEdit = False
    DataSet = banjixinxi
    Left = 104
    Top = 64
  end
  object Dxueshengxinxi: TDataSource
    AutoEdit = False
    DataSet = xueshengxinxi
    Left = 192
    Top = 64
  end
  object Dyonghu: TDataSource
    AutoEdit = False
    DataSet = yonghu
    Left = 264
    Top = 64
  end
  object Dnull: TDataSource
    Left = 640
    Top = 64
  end
  object bzdxbothboy: TDataSource
    AutoEdit = False
    DataSet = zdxbothstandboy
    Left = 24
    Top = 152
  end
  object bzdxbothgirl: TDataSource
    AutoEdit = False
    DataSet = zdxbothstandgirl
    Left = 112
    Top = 152
  end
  object bzdxheighboy: TDataSource
    AutoEdit = False
    DataSet = zdxstandhboy
    Left = 200
    Top = 152
  end
  object bzdxheiggirl: TDataSource
    AutoEdit = False
    DataSet = zdxstandhgirl
    Left = 272
    Top = 152
  end
  object bzgzoneboy: TDataSource
    AutoEdit = False
    DataSet = zgzonestandboy
    Left = 368
    Top = 152
  end
  object bzgzonegirl: TDataSource
    AutoEdit = False
    DataSet = zgzonestandgirl
    Left = 456
    Top = 152
  end
  object bzgzheigboy: TDataSource
    AutoEdit = False
    DataSet = zgzstandhboy
    Left = 552
    Top = 152
  end
  object bzgzheiggirl: TDataSource
    AutoEdit = False
    DataSet = zgzstandhgirl
    Left = 632
    Top = 152
  end
  object bzgzthreeboy: TDataSource
    AutoEdit = False
    DataSet = zgzthreestandboy
    Left = 720
    Top = 152
  end
  object bzgzthreegirl: TDataSource
    AutoEdit = False
    DataSet = zgzthreestandgirl
    Left = 24
    Top = 288
  end
  object bzgztwoboy: TDataSource
    AutoEdit = False
    DataSet = zgztwostandboy
    Left = 112
    Top = 288
  end
  object bzgztwogirl: TDataSource
    AutoEdit = False
    DataSet = zgztwostandgirl
    Left = 200
    Top = 288
  end
  object zdxbothstandboy: TTable
    Active = True
    DatabaseName = 'standard'
    TableName = 'dxbothstandboy.db'
    Left = 24
    Top = 216
  end
  object zdxbothstandgirl: TTable
    Active = True
    DatabaseName = 'standard'
    TableName = 'dxbothstandgirl.db'
    Left = 112
    Top = 216
  end
  object zdxstandhboy: TTable
    Active = True
    DatabaseName = 'standard'
    TableName = 'dxstandhboy.db'
    Left = 200
    Top = 216
  end
  object zdxstandhgirl: TTable
    Active = True
    DatabaseName = 'standard'
    TableName = 'dxstandhgirl.db'
    Left = 272
    Top = 216
  end
  object zgzonestandboy: TTable
    Active = True
    DatabaseName = 'standard'
    TableName = 'gzonestandboy.db'
    Left = 368
    Top = 216
  end
  object zgzonestandgirl: TTable
    Active = True
    DatabaseName = 'standard'
    TableName = 'gzonestandgirl.db'
    Left = 456
    Top = 216
  end
  object zgzstandhboy: TTable
    Active = True
    DatabaseName = 'standard'
    TableName = 'gzstandhboy.db'
    Left = 552
    Top = 216
  end
  object zgzstandhgirl: TTable
    Active = True
    DatabaseName = 'standard'
    TableName = 'gzstandhgirl.db'
    Left = 632
    Top = 216
  end
  object zgzthreestandboy: TTable
    Active = True
    DatabaseName = 'standard'
    TableName = 'gzthreestandboy.db'
    Left = 720
    Top = 216
  end
  object zgzthreestandgirl: TTable
    Active = True
    DatabaseName = 'standard'
    TableName = 'gzthreestandgirl.db'
    Left = 24
    Top = 352
  end
  object zgztwostandboy: TTable
    Active = True
    DatabaseName = 'standard'
    TableName = 'gztwostandboy.db'
    Left = 112
    Top = 352
  end
  object zgztwostandgirl: TTable
    Active = True
    DatabaseName = 'standard'
    TableName = 'gztwostandgirl.db'
    Left = 200
    Top = 352
  end
  object dstugread: TDataSource
    AutoEdit = False
    DataSet = stugread
    Left = 344
    Top = 64
  end
  object stugread: TTable
    Active = True
    DatabaseName = 'sport'
    TableName = 'stugread.db'
    Left = 344
  end
  object Ddengji: TDataSource
    AutoEdit = False
    DataSet = studengji
    Left = 424
    Top = 64
  end
  object studengji: TTable
    Active = True
    DatabaseName = 'sport'
    TableName = 'studengji.db'
    Left = 424
  end
  object stugreadinfo: TTable
    Active = True
    DatabaseName = 'sport'
    TableName = 'stugreaninfo.db'
    Left = 512
  end
  object Dstugreadinfo: TDataSource
    AutoEdit = False
    DataSet = stugreadinfo
    Left = 512
    Top = 64
  end
end
