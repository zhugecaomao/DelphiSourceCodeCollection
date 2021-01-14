object Form9: TForm9
  Left = 200
  Top = 156
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #26085#32479#35745#25253#34920#8212#8212#28248#20891#24773#37202#24215
  ClientHeight = 309
  ClientWidth = 560
  Color = clWhite
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  Scaled = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel
    Left = 152
    Top = 64
    Width = 14
    Height = 14
    Caption = #33267
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlack
    Font.Height = -14
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 24
    Top = 64
    Width = 14
    Height = 14
    Caption = #20174
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlack
    Font.Height = -14
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 328
    Top = 64
    Width = 56
    Height = 14
    Caption = #36873#25321#21416#24072
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlack
    Font.Height = -14
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object BitBtn1: TBitBtn
    Left = 224
    Top = 16
    Width = 105
    Height = 33
    Caption = #32479#35745#20840#37096#21416#24072
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -14
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = BitBtn5Click
  end
  object ComboBox1: TComboBox
    Left = 384
    Top = 64
    Width = 81
    Height = 20
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ItemHeight = 12
    ParentFont = False
    TabOrder = 1
    OnKeyPress = ComboBox1KeyPress
  end
  object DateTimePicker1: TDateTimePicker
    Left = 40
    Top = 64
    Width = 113
    Height = 20
    CalColors.TextColor = clBlue
    Date = 38791.902878472220000000
    Time = 38791.902878472220000000
    DateFormat = dfLong
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object DateTimePicker2: TDateTimePicker
    Left = 168
    Top = 64
    Width = 113
    Height = 20
    CalColors.TextColor = clBlue
    Date = 38791.902878472220000000
    Time = 38791.902878472220000000
    DateFormat = dfLong
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object BitBtn3: TBitBtn
    Left = 88
    Top = 16
    Width = 75
    Height = 33
    Caption = #25171' '#21360
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -14
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = BitBtn3Click
  end
  object cxGrid2: TcxGrid
    Left = 24
    Top = 104
    Width = 513
    Height = 185
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    object cxGridDBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = DataSource1
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsCustomize.ColumnSorting = False
      OptionsData.Editing = False
      OptionsView.GroupByBox = False
      object cxGridDBTableView1DBColumn: TcxGridDBColumn
        DataBinding.FieldName = #21416#24072#32534#21495
        Width = 87
      end
      object cxGridDBTableView1DBColumn1: TcxGridDBColumn
        DataBinding.FieldName = #21416#24072
        Width = 72
      end
      object cxGridDBTableView1DBColumn2: TcxGridDBColumn
        DataBinding.FieldName = #21512#35745#25968#37327
      end
      object cxGridDBTableView1DBColumn3: TcxGridDBColumn
        DataBinding.FieldName = #21512#35745#37329#39069
        Width = 65
      end
      object cxGridDBTableView1DBColumn4: TcxGridDBColumn
        DataBinding.FieldName = #32047#35745#25968#37327
        Width = 90
      end
      object cxGridDBTableView1DBColumn5: TcxGridDBColumn
        DataBinding.FieldName = #32047#35745#37329#39069
        Width = 107
      end
    end
    object cxGridLevel1: TcxGridLevel
      GridView = cxGridDBTableView1
    end
  end
  object BitBtn4: TBitBtn
    Left = 384
    Top = 16
    Width = 75
    Height = 33
    Caption = #36864' '#20986
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -14
    Font.Name = #23435#20307
    Font.Style = []
    ModalResult = 9
    ParentFont = False
    TabOrder = 6
  end
  object BitBtn5: TBitBtn
    Left = 472
    Top = 56
    Width = 65
    Height = 33
    Caption = #24320#22987#32479#35745
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = BitBtn1Click
  end
  object ADOTable1: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'rtj'
    Left = 136
    Top = 168
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 136
    Top = 200
  end
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 96
    Top = 168
  end
  object ADOTable2: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = #34920'1'
    Left = 176
    Top = 168
  end
  object ADOTable3: TADOTable
    Connection = ADOConnection1
    TableName = 'csbh'
    Left = 216
    Top = 168
  end
  object DataSource2: TDataSource
    DataSet = ADOTable2
    Left = 176
    Top = 200
  end
  object RMReport1: TRMReport
    ModifyPrepared = True
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbPrint, pbFind, pbPageSetup, pbExit, pbDesign, pbSaveToXLS]
    DefaultCopies = 0
    DefaultCollate = False
    SaveReportOptions.RegistryPath = 'ReportMachine\ReportSettings\'
    Dataset = RMDBDataSet2
    Left = 408
    Top = 200
    ReportData = {}
  end
  object RMDBDataSet1: TRMDBDataSet
    DataSet = ADOTable4
    Left = 448
    Top = 160
  end
  object ADOTable4: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'rtjrq'
    Left = 256
    Top = 168
  end
  object RMDBDataSet2: TRMDBDataSet
    DataSet = ADOTable1
    Left = 408
    Top = 160
  end
end
