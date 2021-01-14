object train: Ttrain
  Left = 249
  Top = 147
  BorderStyle = bsDialog
  Caption = #22521#35757#35745#21010
  ClientHeight = 280
  ClientWidth = 416
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 12
  object cxGrid1: TcxGrid
    Left = 8
    Top = 8
    Width = 113
    Height = 233
    TabOrder = 0
    LookAndFeel.Kind = lfFlat
    object cxGrid1DBTableView1: TcxGridDBTableView
      DataController.DataSource = Main.r_staffteachDataSource
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.KeyFieldNames = 'id'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object cxGrid1DBTableView1DBColumn1: TcxGridDBColumn
        Caption = #22521#35757#21517#31216
        Options.Editing = False
        SortOrder = soDescending
        DataBinding.FieldName = 'teachname'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object Button1: TButton
    Left = 328
    Top = 248
    Width = 75
    Height = 25
    Cancel = True
    Caption = #21462#28040
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button3: TButton
    Left = 248
    Top = 248
    Width = 75
    Height = 25
    Caption = #21024#38500
    TabOrder = 2
    OnClick = Button3Click
  end
  object PageControl1: TPageControl
    Left = 128
    Top = 8
    Width = 281
    Height = 233
    ActivePage = TabSheet1
    TabOrder = 3
    object TabSheet1: TTabSheet
      Caption = #22522#26412
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 273
        Height = 206
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object Label1: TLabel
          Left = 16
          Top = 24
          Width = 48
          Height = 12
          Caption = #22521#35757#21517#31216
        end
        object Label2: TLabel
          Left = 16
          Top = 56
          Width = 48
          Height = 12
          Caption = #22521#35757#35762#24072
        end
        object Label3: TLabel
          Left = 16
          Top = 88
          Width = 48
          Height = 12
          Caption = #36215#22987#26085#26399
        end
        object Label4: TLabel
          Left = 16
          Top = 120
          Width = 48
          Height = 12
          Caption = #32467#26463#26085#26399
        end
        object DBEdit1: TDBEdit
          Left = 72
          Top = 20
          Width = 177
          Height = 20
          DataField = 'teachname'
          DataSource = Main.r_staffteachDataSource
          TabOrder = 0
        end
        object DBEdit2: TDBEdit
          Left = 72
          Top = 52
          Width = 121
          Height = 20
          DataField = 'teachman'
          DataSource = Main.r_staffteachDataSource
          TabOrder = 1
        end
        object cxDBDateEdit1: TcxDBDateEdit
          Left = 72
          Top = 84
          Width = 121
          Height = 20
          DataBinding.DataSource = Main.r_staffteachDataSource
          DataBinding.DataField = 'stardate'
          Style.LookAndFeel.Kind = lfFlat
          TabOrder = 2
        end
        object cxDBDateEdit2: TcxDBDateEdit
          Left = 72
          Top = 116
          Width = 121
          Height = 20
          DataBinding.DataSource = Main.r_staffteachDataSource
          DataBinding.DataField = 'enddtae'
          Style.LookAndFeel.Kind = lfFlat
          TabOrder = 3
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #22521#35757#20869#23481
      ImageIndex = 1
      object DBRichEdit1: TDBRichEdit
        Left = 8
        Top = 8
        Width = 257
        Height = 185
        DataField = 'memo'
        DataSource = Main.r_staffteachDataSource
        ScrollBars = ssBoth
        TabOrder = 0
      end
    end
  end
  object Button4: TButton
    Left = 88
    Top = 248
    Width = 75
    Height = 25
    Caption = #22686#21152
    TabOrder = 4
    OnClick = Button4Click
  end
  object Button2: TButton
    Left = 168
    Top = 248
    Width = 75
    Height = 25
    Caption = #20445#23384
    Default = True
    TabOrder = 5
    OnClick = Button2Click
  end
end
