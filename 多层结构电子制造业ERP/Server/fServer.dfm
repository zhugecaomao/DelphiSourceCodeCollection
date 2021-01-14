object EServer: TEServer
  OldCreateOrder = False
  Left = 103
  Top = 200
  Height = 303
  Width = 542
  object ErpDBC: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Persist Security Info=False;User ID=sa;Initi' +
      'al Catalog=ErpDB;Data Source=14'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 8
    Top = 8
  end
  object tblUserInfor: TADOTable
    Connection = ErpDBC
    CursorType = ctStatic
    TableName = 'tblUserInfor'
    Left = 64
    Top = 8
  end
  object tblUserInforDsp: TDataSetProvider
    DataSet = tblUserInfor
    Constraints = True
    Left = 64
    Top = 72
  end
end
