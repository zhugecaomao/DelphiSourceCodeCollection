object Form10: TForm10
  Left = 206
  Top = 162
  Width = 603
  Height = 375
  Caption = 'Form10'
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 12
  object ADOTable1: TADOTable
    Active = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=D:\01'#24037#20316#20219#21153'\'#21416#25151#19994#32489#32479#35745#31995#32479'\' +
      'Db1.mdb;Persist Security Info=False'
    CursorType = ctStatic
    TableName = #34920'1'
    Left = 56
    Top = 32
  end
  object RMDBDataSet1: TRMDBDataSet
    DataSet = ADOTable1
    Left = 96
    Top = 32
  end
  object RMReport1: TRMReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbPageSetup, pbExit, pbSaveToXLS]
    DefaultCopies = 0
    DefaultCollate = False
    SaveReportOptions.RegistryPath = 'ReportMachine\ReportSettings\'
    Dataset = RMDBDataSet1
    Left = 16
    Top = 32
    ReportData = {}
  end
end
