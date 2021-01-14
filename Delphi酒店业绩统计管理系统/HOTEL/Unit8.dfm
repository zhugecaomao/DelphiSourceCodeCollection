object Form8: TForm8
  Left = 192
  Top = 107
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #33756#21697#36164#26009#24405#20837#8212#8212#28248#20891#24773#37202#24215
  ClientHeight = 315
  ClientWidth = 460
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
    Left = 24
    Top = 256
    Width = 48
    Height = 12
    Caption = #33756#21697#21517#31216
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 176
    Top = 256
    Width = 36
    Height = 12
    Caption = #36895#26597#30721
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 320
    Top = 256
    Width = 24
    Height = 12
    Caption = #20215#26684
  end
  object Label4: TLabel
    Left = 24
    Top = 288
    Width = 396
    Height = 12
    Caption = #27880#24847#65306#36895#26597#30721#23601#26159#33756#21517#27599#20010#27721#23383#25340#38899#30340#39318#23383#27597#65292#26041#20415#20110#24555#36895#26597#35810#33756#21697#36873#25321#65281
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object cxGrid1: TcxGrid
    Left = 24
    Top = 8
    Width = 409
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
        DataBinding.FieldName = #33756#21697#21517#31216
        Width = 153
      end
      object cxGrid1DBTableView1DBColumn1: TcxGridDBColumn
        DataBinding.FieldName = #36895#26597#30721
        Width = 112
      end
      object cxGrid1DBTableView1DBColumn2: TcxGridDBColumn
        DataBinding.FieldName = #20215#26684
        Width = 130
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object Button1: TButton
    Left = 24
    Top = 216
    Width = 65
    Height = 25
    Caption = #28155#21152#35760#24405
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
    Left = 96
    Top = 216
    Width = 65
    Height = 25
    Caption = #25552#20132#20445#23384
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
    Left = 296
    Top = 216
    Width = 65
    Height = 25
    Caption = #21024#38500#35760#24405
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
    Left = 368
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
  object DBEdit1: TDBEdit
    Left = 80
    Top = 256
    Width = 81
    Height = 20
    DataField = #33756#21697#21517#31216
    DataSource = DataSource1
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object DBEdit2: TDBEdit
    Left = 232
    Top = 256
    Width = 73
    Height = 20
    DataField = #36895#26597#30721
    DataSource = DataSource1
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 6
  end
  object DBEdit3: TDBEdit
    Left = 352
    Top = 256
    Width = 81
    Height = 20
    DataField = #20215#26684
    DataSource = DataSource1
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 7
  end
  object ADOTable1: TADOTable
    CursorType = ctStatic
    TableName = #33756#21517
    Left = 64
    Top = 56
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 136
    Top = 56
  end
  object XPManifest1: TXPManifest
    Left = 72
    Top = 160
  end
end
