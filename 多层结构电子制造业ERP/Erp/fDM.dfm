object DM: TDM
  OldCreateOrder = False
  Left = 109
  Top = 153
  Height = 382
  Width = 648
  object UserInfor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'tblUserInforDsp'
    RemoteServer = ErpDcom
    Left = 80
    Top = 8
  end
  object ErpDcom: TDCOMConnection
    ServerGUID = '{B1F4B863-8FA5-11D7-BDAA-5254AB374BF2}'
    ServerName = 'erpServer.EServer'
    ComputerName = '14'
    Left = 24
    Top = 8
  end
end
