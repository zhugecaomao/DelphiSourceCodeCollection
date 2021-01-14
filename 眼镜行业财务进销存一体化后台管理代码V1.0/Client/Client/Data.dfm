object frm_Data: Tfrm_Data
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 1
  Top = 1
  Height = 450
  Width = 638
  object Socket_Connection: TSocketConnection
    ServerGUID = '{70D825D1-C4AD-4E28-B216-FF5152FF6118}'
    ServerName = 'GD_Chain_Server.Easy_Dcom_Server'
    Port = 5000
    SupportCallbacks = False
    ObjectBroker = Simple
    Left = 64
    Top = 16
  end
  object Simple: TSimpleObjectBroker
    LoadBalanced = True
    Left = 248
    Top = 16
  end
  object ClientDataSet_Add: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    ProviderName = 'DataSetProvider_Server'
    RemoteServer = Socket_Connection
    StoreDefs = True
    Left = 56
    Top = 80
  end
  object DataSource1: TDataSource
    Left = 160
    Top = 16
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    RemoteServer = Socket_Connection
    StoreDefs = True
    Left = 408
    Top = 80
  end
  object ClientDataSet2: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    ProviderName = 'DataSetProvider_Server'
    RemoteServer = Socket_Connection
    StoreDefs = True
    Left = 152
    Top = 80
  end
  object ClientDataSet3: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    ProviderName = 'DataSetProvider_Server'
    RemoteServer = Socket_Connection
    StoreDefs = True
    Left = 240
    Top = 80
  end
  object ClientDataSet4: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    ProviderName = 'DataSetProvider_Server'
    RemoteServer = Socket_Connection
    StoreDefs = True
    Left = 320
    Top = 80
  end
  object ClientDataSet_Goods: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    ProviderName = 'DataSetProvider_Server'
    RemoteServer = Socket_Connection
    StoreDefs = True
    Left = 64
    Top = 144
  end
  object Client_Temp: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    ProviderName = 'Data_Temp'
    RemoteServer = Socket_Connection
    StoreDefs = True
    Left = 152
    Top = 144
  end
  object DataSource_Search: TDataSource
    Left = 240
    Top = 144
  end
  object ClientDataSet_Select: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    ProviderName = 'DataSetProvider_Server'
    RemoteServer = Socket_Connection
    StoreDefs = True
    Left = 360
    Top = 136
  end
  object ClientDataSet_Stock_States: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    ProviderName = 'DataSetProvider_Server'
    RemoteServer = Socket_Connection
    StoreDefs = True
    Left = 48
    Top = 176
  end
  object DataSource_Stock_States: TDataSource
    DataSet = ClientDataSet_Stock_States
    Left = 48
    Top = 232
  end
  object DataSource_Stock_States_detail: TDataSource
    DataSet = ClientDataSet_Stock_States_detail
    Left = 208
    Top = 232
  end
  object ClientDataSet_Stock_States_detail: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    ProviderName = 'DataSetProvider_Server'
    RemoteServer = Socket_Connection
    StoreDefs = True
    Left = 216
    Top = 176
  end
  object ClientDataSet_Stock_States_Total: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    ProviderName = 'DataSetProvider_Server'
    RemoteServer = Socket_Connection
    StoreDefs = True
    Left = 424
    Top = 168
  end
  object DataSource_Stock_States_Total: TDataSource
    DataSet = ClientDataSet_Stock_States_Total
    Left = 416
    Top = 232
  end
  object ClientDataSet_Goods_Information: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    ProviderName = 'DataSetProvider_Server'
    RemoteServer = Socket_Connection
    StoreDefs = True
    Left = 528
    Top = 24
  end
  object DataSource_Goods_Information: TDataSource
    DataSet = ClientDataSet_Goods_Information
    Left = 528
    Top = 80
  end
  object DataSource_StoreProdc: TDataSource
    Left = 584
    Top = 168
  end
  object StoredProc1: TStoredProc
    Left = 584
    Top = 232
  end
  object ClientDataSet_Stock_Jion_Search: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    ProviderName = 'DataSetProvider_Server'
    RemoteServer = Socket_Connection
    StoreDefs = True
    Left = 208
    Top = 296
  end
  object DataSource_Stock_Jion_Search: TDataSource
    DataSet = ClientDataSet_Stock_Jion_Search
    Left = 208
    Top = 352
  end
  object ClientDataSet_Submit_adopt: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    ProviderName = 'DataSetProvider_Server'
    RemoteServer = Socket_Connection
    StoreDefs = True
    Left = 416
    Top = 304
  end
  object DataSource_Submit_adopt: TDataSource
    DataSet = ClientDataSet_Submit_adopt
    Left = 416
    Top = 360
  end
  object ClientDataSet_Submit_adopt_detail: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    ProviderName = 'DataSetProvider_Server'
    RemoteServer = Socket_Connection
    StoreDefs = True
    Left = 608
    Top = 296
  end
  object DataSource_Submit_adopt_detail: TDataSource
    DataSet = ClientDataSet_Submit_adopt_detail
    Left = 608
    Top = 352
  end
  object ClientDataSet_Receipt: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    ProviderName = 'DataSetProvider_Server'
    RemoteServer = Socket_Connection
    StoreDefs = True
    Left = 208
    Top = 408
  end
  object DataSource_Receipt: TDataSource
    DataSet = ClientDataSet_Receipt
    Left = 208
    Top = 456
  end
  object ClientDataSet_Submit_quit_detail: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    ProviderName = 'DataSetProvider_Server'
    RemoteServer = Socket_Connection
    StoreDefs = True
    Left = 344
    Top = 376
  end
  object DataSource_Submit_quit_detail: TDataSource
    DataSet = ClientDataSet_Submit_quit_detail
    Left = 344
    Top = 432
  end
  object ClientDataSet_Submit_quit: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    ProviderName = 'DataSetProvider_Server'
    RemoteServer = Socket_Connection
    StoreDefs = True
    Left = 560
    Top = 391
  end
  object DataSource_Submit_quit: TDataSource
    DataSet = ClientDataSet_Submit_quit
    Left = 560
    Top = 447
  end
  object ClientDataSet_Storage_Warn: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    ProviderName = 'DataSetProvider_Server'
    RemoteServer = Socket_Connection
    StoreDefs = True
    Left = 712
    Top = 88
  end
  object DataSource_Storage_Warn: TDataSource
    Left = 712
    Top = 24
  end
  object ClientDataSet_Company: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    ProviderName = 'DataSetProvider_Server'
    RemoteServer = Socket_Connection
    StoreDefs = True
    Left = 728
    Top = 152
  end
  object DataSource_Company: TDataSource
    DataSet = ClientDataSet_Company
    Left = 712
    Top = 184
  end
  object ClientDataSet_TMP: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'Company_Name'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Company_NO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Company_address'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Company_ZIP'
        Attributes = [faFixed]
        DataType = ftString
        Size = 6
      end
      item
        Name = 'Company_TEL'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Company_TAX'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Company_WWW'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Company_Email'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Sign_Flag'
        Attributes = [faFixed]
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Use_Flag'
        Attributes = [faFixed]
        DataType = ftString
        Size = 2
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'DataSetProvider_Store_Prodc'
    RemoteServer = Socket_Connection
    StoreDefs = True
    Left = 744
    Top = 304
  end
  object DataSource_TMP: TDataSource
    DataSet = ClientDataSet_TMP
    Left = 744
    Top = 360
  end
  object Data_SP_Part_Set: TDataSource
    Left = 48
    Top = 288
  end
  object Data_Goods: TDataSource
    Left = 49
    Top = 351
  end
  object Client_Goods: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    ProviderName = 'DataSetProvider_Server'
    RemoteServer = Socket_Connection
    StoreDefs = True
    Left = 51
    Top = 349
  end
  object Data_Part_Set: TDataSource
    DataSet = Client_Part_Set
    Left = 40
    Top = 408
  end
  object Client_Part_Set: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    ProviderName = 'DataSetProvider_Server'
    RemoteServer = Socket_Connection
    StoreDefs = True
    Left = 40
    Top = 408
  end
  object Client_SP_Part_Set: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'Company_Name'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Company_NO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Company_address'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Company_ZIP'
        Attributes = [faFixed]
        DataType = ftString
        Size = 6
      end
      item
        Name = 'Company_TEL'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Company_TAX'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Company_WWW'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Company_Email'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Sign_Flag'
        Attributes = [faFixed]
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Use_Flag'
        Attributes = [faFixed]
        DataType = ftString
        Size = 2
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'Data_Sp_Part_set'
    RemoteServer = Socket_Connection
    StoreDefs = True
    Left = 48
    Top = 288
  end
  object Data_Stock_States: TDataSource
    DataSet = Client_Stock_States
    Left = 40
    Top = 456
  end
  object Client_Stock_States: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    ProviderName = 'DataSetProvider_Server'
    RemoteServer = Socket_Connection
    StoreDefs = True
    Left = 40
    Top = 456
  end
end
