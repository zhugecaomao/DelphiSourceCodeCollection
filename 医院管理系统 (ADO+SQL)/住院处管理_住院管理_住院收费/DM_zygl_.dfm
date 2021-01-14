object DMzygl: TDMzygl
  OldCreateOrder = False
  Left = 225
  Top = 193
  Height = 303
  Width = 443
  object ADOCzygl: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=hhx;Persist Security Info=True;User' +
      ' ID=sa;Initial Catalog=biye;Data Source=cax'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 8
    Top = 8
  end
  object ADOTbab: TADOTable
    Connection = ADOCzygl
    CursorType = ctStatic
    TableName = #30149#26696#34920
    Left = 64
    Top = 24
    object ADOTbabid: TStringField
      FieldName = #30149#20154'id'
      Size = 10
    end
    object ADOTbabDSDesigner: TStringField
      FieldName = #21307#30103#20184#27454#26041#24335
      Size = 4
    end
    object ADOTbabDSDesigner2: TStringField
      FieldName = #22995#21517
      Size = 8
    end
    object ADOTbabDSDesigner3: TStringField
      FieldName = #24615#21035
      Size = 4
    end
    object ADOTbabDSDesigner4: TDateTimeField
      FieldName = #20986#29983#24180#26376
    end
    object ADOTbabDSDesigner5: TStringField
      FieldName = #24180#40836
      Size = 3
    end
    object ADOTbabDSDesigner6: TStringField
      FieldName = #23130#23035
      Size = 2
    end
    object ADOTbabDSDesigner7: TStringField
      FieldName = #32844#19994
    end
    object ADOTbabDSDesigner8: TStringField
      FieldName = #20986#29983#22320
      Size = 40
    end
    object ADOTbabDSDesigner9: TStringField
      FieldName = #27665#26063
    end
    object ADOTbabDSDesigner10: TStringField
      FieldName = #22269#31821
    end
    object ADOTbabDSDesigner11: TStringField
      FieldName = #36523#20221#35777#21495
      Size = 18
    end
    object ADOTbabDSDesigner12: TStringField
      FieldName = #24037#20316#21333#20301#22320#22336
      Size = 30
    end
    object ADOTbabDSDesigner13: TStringField
      FieldName = #30005#35805
    end
    object ADOTbabDSDesigner14: TStringField
      FieldName = #37038#25919#32534#21495
      Size = 6
    end
    object ADOTbabDSDesigner15: TStringField
      FieldName = #25143#21475#22320#22336
      Size = 40
    end
    object ADOTbabDSDesigner16: TStringField
      FieldName = #32852#31995#20154#22995#21517
      Size = 8
    end
    object ADOTbabDSDesigner17: TStringField
      FieldName = #20851#31995
      Size = 12
    end
    object ADOTbabDSDesigner18: TStringField
      FieldName = #22320#22336
      Size = 40
    end
    object ADOTbabDSDesigner19: TStringField
      FieldName = #32852#31995#20154#30005#35805
    end
    object ADOTbabDSDesigner20: TDateTimeField
      FieldName = #20837#38498#26085#26399
    end
    object ADOTbabDSDesigner21: TStringField
      FieldName = #20837#38498#31185#21035
      Size = 10
    end
    object ADOTbabDSDesigner22: TStringField
      FieldName = #20837#38498#30149#23460
      Size = 10
    end
    object ADOTbabDSDesigner23: TStringField
      FieldName = #36716#31185#24773#20917
      Size = 10
    end
    object ADOTbabDSDesigner24: TDateTimeField
      FieldName = #20986#38498#26085#26399
    end
    object ADOTbabDSDesigner25: TStringField
      FieldName = #20986#38498#31185#21035
      Size = 10
    end
    object ADOTbabDSDesigner26: TStringField
      FieldName = #20986#38498#30149#23460
      Size = 10
    end
    object ADOTbabDSDesigner27: TStringField
      FieldName = #23454#38469#20303#38498#22825#25968
      Size = 3
    end
    object ADOTbab_: TStringField
      FieldName = #38376'_'#24613#35786#35786#26029
      Size = 50
    end
    object ADOTbabDSDesigner28: TStringField
      FieldName = #20837#38498#26102#24773#20917
      Size = 4
    end
    object ADOTbabDSDesigner29: TStringField
      FieldName = #20837#38498#35786#26029
      Size = 50
    end
    object ADOTbabDSDesigner30: TDateTimeField
      FieldName = #20837#38498#21518#30830#35786#26085#26399
    end
    object ADOTbabDSDesigner31: TStringField
      FieldName = #20986#38498#20027#35201#35786#26029
      Size = 100
    end
    object ADOTbabDSDesigner32: TStringField
      FieldName = #20986#38498#24773#20917
      Size = 4
    end
    object ADOTbabDSDesigner33: TFloatField
      FieldName = #25276#37329
    end
  end
  object DSbab: TDataSource
    DataSet = ADOTbab
    Left = 96
    Top = 24
  end
  object ADOTmrqdb: TADOTable
    Connection = ADOCzygl
    CursorType = ctStatic
    TableName = #27599#26085#28165#21333#34920
    Left = 224
    Top = 24
    object ADOTmrqdbid: TStringField
      FieldName = #30149#20154'id'
      Size = 10
    end
    object ADOTmrqdbDSDesigner: TStringField
      FieldName = #39033#30446#36153#29992#21517#31216
      Size = 40
    end
    object ADOTmrqdbDSDesigner2: TIntegerField
      FieldName = #25968#37327
    end
    object ADOTmrqdbDSDesigner3: TStringField
      FieldName = #21333#20301
      Size = 2
    end
    object ADOTmrqdbDSDesigner4: TFloatField
      FieldName = #36153#29992
    end
    object ADOTmrqdbDSDesigner5: TDateTimeField
      FieldName = #26085#26399
    end
    object ADOTmrqdbDSDesigner6: TStringField
      FieldName = #22791#27880
      Size = 100
    end
  end
  object DSmrqdb: TDataSource
    DataSet = ADOTmrqdb
    Left = 256
    Top = 24
  end
  object ADOTxmfymxb: TADOTable
    Connection = ADOCzygl
    CursorType = ctStatic
    TableName = #39033#30446#36153#29992#26126#32454#34920
    Left = 64
    Top = 88
    object ADOTxmfymxbid: TStringField
      FieldName = #39033#30446'id'
      Size = 10
    end
    object ADOTxmfymxbDSDesigner: TStringField
      DisplayWidth = 48
      FieldName = #39033#30446#36153#29992#21517#31216
      Size = 40
    end
    object ADOTxmfymxbDSDesigner2: TFloatField
      DisplayWidth = 12
      FieldName = #39033#30446#36153#29992
    end
    object ADOTxmfymxbDSDesigner3: TStringField
      DisplayWidth = 5
      FieldName = #21333#20301
      Size = 2
    end
    object ADOTxmfymxbDSDesigner4: TStringField
      DisplayWidth = 120
      FieldName = #22791#27880
      Size = 100
    end
  end
  object DSxmfymxb: TDataSource
    DataSet = ADOTxmfymxb
    Left = 96
    Top = 88
  end
  object ADOQxmfymxb: TADOQuery
    Connection = ADOCzygl
    CursorType = ctStatic
    Parameters = <
      item
        Name = #39033#30446'id'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    SQL.Strings = (
      'select * from '#39033#30446#36153#29992#26126#32454#34920' where '#39033#30446'id like :'#39033#30446'id')
    Left = 224
    Top = 88
    object ADOQxmfymxbid: TStringField
      FieldName = #39033#30446'id'
      Size = 10
    end
    object ADOQxmfymxbDSDesigner: TStringField
      FieldName = #39033#30446#36153#29992#21517#31216
      Size = 40
    end
    object ADOQxmfymxbDSDesigner2: TFloatField
      FieldName = #39033#30446#36153#29992
    end
    object ADOQxmfymxbDSDesigner3: TStringField
      FieldName = #21333#20301
      Size = 2
    end
    object ADOQxmfymxbDSDesigner4: TStringField
      FieldName = #22791#27880
      Size = 100
    end
  end
  object DSxmfymxbQ: TDataSource
    DataSet = ADOQxmfymxb
    Left = 280
    Top = 88
  end
  object ADOQyrqdXG: TADOQuery
    Connection = ADOCzygl
    CursorType = ctStatic
    Parameters = <
      item
        Name = #30149#20154'id'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    SQL.Strings = (
      'select * from '#27599#26085#28165#21333#34920' where '#30149#20154'id=:'#30149#20154'id order by '#26085#26399' desc ')
    Left = 48
    Top = 144
    object ADOQyrqdXGid: TStringField
      FieldName = #30149#20154'id'
      Size = 10
    end
    object ADOQyrqdXGDSDesigner: TStringField
      FieldName = #39033#30446#36153#29992#21517#31216
      Size = 40
    end
    object ADOQyrqdXGDSDesigner2: TIntegerField
      FieldName = #25968#37327
    end
    object ADOQyrqdXGDSDesigner3: TStringField
      FieldName = #21333#20301
      Size = 2
    end
    object ADOQyrqdXGDSDesigner4: TFloatField
      FieldName = #36153#29992
    end
    object ADOQyrqdXGDSDesigner5: TDateTimeField
      FieldName = #26085#26399
    end
    object ADOQyrqdXGDSDesigner6: TStringField
      FieldName = #22791#27880
      Size = 100
    end
  end
  object DSyrqdXG: TDataSource
    DataSet = ADOQyrqdXG
    Left = 80
    Top = 144
  end
  object DSyrqdXG1: TDataSource
    DataSet = ADOQyrqdXG
    Enabled = False
    Left = 112
    Top = 144
  end
  object ADOQbab_bb: TADOQuery
    Connection = ADOCzygl
    CursorType = ctStatic
    Parameters = <
      item
        Name = #30149#20154'id'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    SQL.Strings = (
      'select * from '#30149#26696#34920' where '#30149#20154'id like :'#30149#20154'id ')
    Left = 128
    Top = 24
    object ADOQbab_bbid: TStringField
      FieldName = #30149#20154'id'
      Size = 10
    end
    object ADOQbab_bbDSDesigner: TStringField
      FieldName = #21307#30103#20184#27454#26041#24335
      Size = 4
    end
    object ADOQbab_bbDSDesigner2: TStringField
      FieldName = #22995#21517
      Size = 8
    end
    object ADOQbab_bbDSDesigner3: TStringField
      FieldName = #24615#21035
      Size = 4
    end
    object ADOQbab_bbDSDesigner4: TDateTimeField
      FieldName = #20986#29983#24180#26376
    end
    object ADOQbab_bbDSDesigner5: TStringField
      FieldName = #24180#40836
      Size = 3
    end
    object ADOQbab_bbDSDesigner6: TStringField
      FieldName = #23130#23035
      Size = 2
    end
    object ADOQbab_bbDSDesigner7: TStringField
      FieldName = #32844#19994
    end
    object ADOQbab_bbDSDesigner8: TStringField
      FieldName = #20986#29983#22320
      Size = 40
    end
    object ADOQbab_bbDSDesigner9: TStringField
      FieldName = #27665#26063
    end
    object ADOQbab_bbDSDesigner10: TStringField
      FieldName = #22269#31821
    end
    object ADOQbab_bbDSDesigner11: TStringField
      FieldName = #36523#20221#35777#21495
      Size = 18
    end
    object ADOQbab_bbDSDesigner12: TStringField
      FieldName = #24037#20316#21333#20301#22320#22336
      Size = 30
    end
    object ADOQbab_bbDSDesigner13: TStringField
      FieldName = #30005#35805
    end
    object ADOQbab_bbDSDesigner14: TStringField
      FieldName = #37038#25919#32534#21495
      Size = 6
    end
    object ADOQbab_bbDSDesigner15: TStringField
      FieldName = #25143#21475#22320#22336
      Size = 40
    end
    object ADOQbab_bbDSDesigner16: TStringField
      FieldName = #32852#31995#20154#22995#21517
      Size = 8
    end
    object ADOQbab_bbDSDesigner17: TStringField
      FieldName = #20851#31995
      Size = 12
    end
    object ADOQbab_bbDSDesigner18: TStringField
      FieldName = #22320#22336
      Size = 40
    end
    object ADOQbab_bbDSDesigner19: TStringField
      FieldName = #32852#31995#20154#30005#35805
    end
    object ADOQbab_bbDSDesigner20: TDateTimeField
      FieldName = #20837#38498#26085#26399
    end
    object ADOQbab_bbDSDesigner21: TStringField
      FieldName = #20837#38498#31185#21035
      Size = 10
    end
    object ADOQbab_bbDSDesigner22: TStringField
      FieldName = #20837#38498#30149#23460
      Size = 10
    end
    object ADOQbab_bbDSDesigner23: TStringField
      FieldName = #36716#31185#24773#20917
      Size = 10
    end
    object ADOQbab_bbDSDesigner24: TDateTimeField
      FieldName = #20986#38498#26085#26399
    end
    object ADOQbab_bbDSDesigner25: TStringField
      FieldName = #20986#38498#31185#21035
      Size = 10
    end
    object ADOQbab_bbDSDesigner26: TStringField
      FieldName = #20986#38498#30149#23460
      Size = 10
    end
    object ADOQbab_bbDSDesigner27: TStringField
      FieldName = #23454#38469#20303#38498#22825#25968
      Size = 3
    end
    object ADOQbab_bb_: TStringField
      FieldName = #38376'_'#24613#35786#35786#26029
      Size = 50
    end
    object ADOQbab_bbDSDesigner28: TStringField
      FieldName = #20837#38498#26102#24773#20917
      Size = 4
    end
    object ADOQbab_bbDSDesigner29: TStringField
      FieldName = #20837#38498#35786#26029
      Size = 50
    end
    object ADOQbab_bbDSDesigner30: TDateTimeField
      FieldName = #20837#38498#21518#30830#35786#26085#26399
    end
    object ADOQbab_bbDSDesigner31: TStringField
      FieldName = #20986#38498#20027#35201#35786#26029
      Size = 100
    end
    object ADOQbab_bbDSDesigner32: TStringField
      FieldName = #20986#38498#24773#20917
      Size = 4
    end
    object ADOQbab_bbDSDesigner33: TFloatField
      FieldName = #25276#37329
    end
  end
  object DSbab_bb: TDataSource
    DataSet = ADOQbab_bb
    Left = 160
    Top = 24
  end
  object ADOQyrqd_bb: TADOQuery
    Connection = ADOCzygl
    CursorType = ctStatic
    Parameters = <
      item
        Name = #30149#20154'id'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end
      item
        Name = #26085#26399
        DataType = ftString
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      'select * from '#27599#26085#28165#21333#34920' where ('#30149#20154'id=:'#30149#20154'id) and ('#26085#26399'=:'#26085#26399')'
      '')
    Left = 208
    Top = 144
    object ADOQyrqd_bbid: TStringField
      FieldName = #30149#20154'id'
      Size = 10
    end
    object ADOQyrqd_bbField: TStringField
      FieldKind = fkLookup
      FieldName = #30149#20154#21517#31216
      LookupDataSet = ADOTbab
      LookupKeyFields = #30149#20154'id'
      LookupResultField = #22995#21517
      KeyFields = #30149#20154'id'
      Size = 8
      Lookup = True
    end
    object ADOQyrqd_bbDSDesigner: TStringField
      FieldName = #39033#30446#36153#29992#21517#31216
      Size = 40
    end
    object ADOQyrqd_bbDSDesigner2: TIntegerField
      FieldName = #25968#37327
    end
    object ADOQyrqd_bbDSDesigner3: TStringField
      FieldName = #21333#20301
      Size = 2
    end
    object ADOQyrqd_bbDSDesigner4: TFloatField
      FieldName = #36153#29992
    end
    object ADOQyrqd_bbDSDesigner5: TDateTimeField
      FieldName = #26085#26399
    end
    object ADOQyrqd_bbDSDesigner6: TStringField
      FieldName = #22791#27880
      Size = 100
    end
  end
  object DSyrqd_bb: TDataSource
    DataSet = ADOQyrqd_bb
    Left = 272
    Top = 144
  end
  object ADOTzysf: TADOTable
    Connection = ADOCzygl
    CursorType = ctStatic
    TableName = #20303#38498#25910#36153#34920
    Left = 320
    Top = 24
    object ADOTzysfid: TStringField
      FieldName = #30149#20154'id'
      Size = 10
    end
    object ADOTzysfDSDesigner: TFloatField
      FieldName = #20303#38498#36153
    end
    object ADOTzysfDSDesigner2: TDateTimeField
      FieldName = #20132#36153#26102#38388
    end
  end
  object DSzysf: TDataSource
    DataSet = ADOTzysf
    Left = 376
    Top = 24
  end
  object ADOQdenglu: TADOQuery
    Connection = ADOCzygl
    CursorType = ctStatic
    Parameters = <
      item
        Name = #21592#24037#32534#21495
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 5
        Value = Null
      end>
    SQL.Strings = (
      'select * from '#30331#38470#34920' where '#21592#24037#32534#21495'=:'#21592#24037#32534#21495)
    Left = 56
    Top = 208
    object ADOQdengluDSDesigner: TStringField
      FieldName = #21592#24037#32534#21495
      Size = 5
    end
    object ADOQdengluDSDesigner2: TStringField
      FieldName = #23494#30721
      Size = 10
    end
    object ADOQdengluDSDesigner3: TStringField
      FieldName = #25152#22312#32844#20301
    end
  end
  object DSdenglu: TDataSource
    DataSet = ADOQdenglu
    Left = 120
    Top = 208
  end
end
