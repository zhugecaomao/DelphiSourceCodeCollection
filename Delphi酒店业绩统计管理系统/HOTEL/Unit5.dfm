object Form5: TForm5
  Left = 380
  Top = 138
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #29992#25143#31649#29702#8212#8212#28248#20891#24773#37202#24215
  ClientHeight = 292
  ClientWidth = 385
  Color = clWhite
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel
    Left = 40
    Top = 256
    Width = 60
    Height = 12
    Caption = #29992#25143#21517#31216#65306
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 208
    Top = 256
    Width = 36
    Height = 12
    Caption = #23494#30721#65306
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object cxGrid1: TcxGrid
    Left = 40
    Top = 8
    Width = 305
    Height = 200
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object cxGrid1DBTableView1: TcxGridDBTableView
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
      object cxGrid1DBTableView1DBColumn: TcxGridDBColumn
        DataBinding.FieldName = #29992#25143#21517#31216
        Width = 148
      end
      object cxGrid1DBTableView1pas: TcxGridDBColumn
        Caption = #23494#30721
        DataBinding.FieldName = 'pas'
        Width = 143
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object Button1: TButton
    Left = 40
    Top = 216
    Width = 65
    Height = 25
    Caption = #28155#21152#29992#25143
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 112
    Top = 216
    Width = 65
    Height = 25
    Caption = #25552#20132#20462#25913
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 208
    Top = 216
    Width = 65
    Height = 25
    Caption = #21024#38500#29992#25143
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 280
    Top = 216
    Width = 65
    Height = 25
    Caption = #36864#20986
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ModalResult = 9
    ParentFont = False
    TabOrder = 4
  end
  object dbedit1: TDBEdit
    Left = 104
    Top = 256
    Width = 81
    Height = 20
    DataField = #29992#25143#21517#31216
    DataSource = DataSource1
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object dbedit2: TDBEdit
    Left = 248
    Top = 256
    Width = 97
    Height = 20
    DataField = 'pas'
    DataSource = DataSource1
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 6
  end
  object ADOTable1: TADOTable
    CursorType = ctStatic
    TableName = #29992#25143
    Left = 72
    Top = 8
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 152
    Top = 8
  end
  object XPManifest1: TXPManifest
    Top = 176
  end
end
