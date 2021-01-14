object Form6: TForm6
  Left = 196
  Top = 86
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #21416#24072#32534#21495#8212#8212#28248#20891#24773#37202#24215
  ClientHeight = 295
  ClientWidth = 492
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
    Width = 48
    Height = 12
    Caption = #21416#24072#32534#21495
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 192
    Top = 256
    Width = 48
    Height = 12
    Caption = #21416#24072#22995#21517
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 336
    Top = 256
    Width = 24
    Height = 12
    Caption = #28790#21488
  end
  object cxGrid1: TcxGrid
    Left = 40
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
      object cxGrid1DBTableView1DBColumn1: TcxGridDBColumn
        DataBinding.FieldName = #21416#24072#32534#21495
        SortIndex = 0
        SortOrder = soAscending
        Width = 136
      end
      object cxGrid1DBTableView1DBColumn: TcxGridDBColumn
        Caption = #21416#24072#22995#21517
        DataBinding.FieldName = #21416#24072
        Width = 103
      end
      object cxGrid1DBTableView1DBColumn2: TcxGridDBColumn
        DataBinding.FieldName = #28790#21488
        Width = 160
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
    Caption = #28155#21152#32534#21495
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
    Left = 312
    Top = 216
    Width = 65
    Height = 25
    Caption = #21024#38500#32534#21495
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
    Left = 384
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
    Left = 96
    Top = 256
    Width = 81
    Height = 20
    DataField = #21416#24072#32534#21495
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
    Left = 248
    Top = 256
    Width = 73
    Height = 20
    DataField = #21416#24072
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
    Left = 368
    Top = 256
    Width = 81
    Height = 20
    DataField = #28790#21488
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
    TableName = 'csbh'
    Left = 80
    Top = 56
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 152
    Top = 56
  end
  object XPManifest1: TXPManifest
    Top = 176
  end
end
