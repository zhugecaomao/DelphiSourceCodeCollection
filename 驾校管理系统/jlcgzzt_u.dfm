object jlcgzzt: Tjlcgzzt
  Left = 297
  Top = 218
  Width = 698
  Height = 410
  Caption = #25945#32451#36710#24037#20316#29366#24577
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object Label8: TLabel
    Left = 256
    Top = 8
    Width = 210
    Height = 29
    Caption = #25945#32451#36710#24037#20316#29366#24577
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -29
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 40
    Width = 689
    Height = 337
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #24405#20837
      object GroupBox1: TGroupBox
        Left = 2
        Top = 8
        Width = 673
        Height = 113
        Caption = #22522#26412#20449#24687
        TabOrder = 0
        object Label1: TLabel
          Left = 8
          Top = 32
          Width = 48
          Height = 16
          Caption = #36710#21495#65306
        end
        object Label2: TLabel
          Left = 200
          Top = 32
          Width = 48
          Height = 16
          Caption = #23398#21495#65306
        end
        object Label3: TLabel
          Left = 512
          Top = 32
          Width = 80
          Height = 16
          Caption = #26412#26085#20219#21153#65306
        end
        object Label4: TLabel
          Left = 8
          Top = 72
          Width = 80
          Height = 16
          Caption = #21463#35757#20154#25968#65306
          FocusControl = DBEdit4
        end
        object Label5: TLabel
          Left = 192
          Top = 72
          Width = 80
          Height = 16
          Caption = #20998#37197#27773#27833#65306
          FocusControl = DBEdit5
        end
        object Label6: TLabel
          Left = 344
          Top = 72
          Width = 80
          Height = 16
          Caption = #20998#37197#26612#27833#65306
          FocusControl = DBEdit6
        end
        object Label7: TLabel
          Left = 512
          Top = 72
          Width = 80
          Height = 16
          Caption = #24037#20316#29366#24577#65306
        end
        object SpeedButton1: TSpeedButton
          Left = 152
          Top = 32
          Width = 23
          Height = 22
          Caption = '...'
          OnClick = SpeedButton1Click
        end
        object Label9: TLabel
          Left = 312
          Top = 72
          Width = 16
          Height = 16
          Caption = #21319
        end
        object Label10: TLabel
          Left = 464
          Top = 72
          Width = 16
          Height = 16
          Caption = #21319
        end
        object Label14: TLabel
          Left = 360
          Top = 32
          Width = 48
          Height = 16
          Caption = #25945#32451#65306
        end
        object SpeedButton3: TSpeedButton
          Left = 480
          Top = 32
          Width = 23
          Height = 22
          Caption = '...'
          OnClick = SpeedButton3Click
        end
        object DBEdit4: TDBEdit
          Left = 80
          Top = 72
          Width = 41
          Height = 24
          DataField = #21463#35757#20154#25968
          DataSource = DataSource1
          TabOrder = 0
        end
        object DBEdit5: TDBEdit
          Left = 264
          Top = 72
          Width = 41
          Height = 24
          DataField = #20998#37197#27773#27833
          DataSource = DataSource1
          TabOrder = 1
        end
        object DBEdit6: TDBEdit
          Left = 416
          Top = 72
          Width = 41
          Height = 24
          DataField = #20998#37197#26612#27833
          DataSource = DataSource1
          TabOrder = 2
        end
        object Edit1: TEdit
          Left = 48
          Top = 32
          Width = 97
          Height = 24
          TabOrder = 3
          OnExit = Edit1Exit
          OnKeyPress = Edit1KeyPress
        end
        object Edit2: TEdit
          Left = 240
          Top = 32
          Width = 97
          Height = 24
          Enabled = False
          TabOrder = 4
          OnExit = Edit2Exit
          OnKeyPress = Edit2KeyPress
        end
        object DBLookupComboBox1: TDBLookupComboBox
          Left = 584
          Top = 32
          Width = 81
          Height = 24
          DataField = #26412#26085#20219#21153
          DataSource = DataSource1
          DropDownRows = 3
          KeyField = #26412#26085#20219#21153
          ListField = #26412#26085#20219#21153
          ListSource = DataSource2
          TabOrder = 5
        end
        object DBLookupComboBox2: TDBLookupComboBox
          Left = 584
          Top = 72
          Width = 81
          Height = 24
          DataField = #24037#20316#29366#24577
          DataSource = DataSource1
          DropDownRows = 3
          KeyField = #24037#20316#29366#24577
          ListField = #24037#20316#29366#24577
          ListSource = DataSource2
          TabOrder = 6
        end
        object Edit3: TEdit
          Left = 400
          Top = 32
          Width = 73
          Height = 24
          TabOrder = 7
          OnExit = Edit3Exit
          OnKeyPress = Edit3KeyPress
        end
      end
      object GroupBox2: TGroupBox
        Left = 2
        Top = 128
        Width = 249
        Height = 121
        Caption = #22791#27880
        TabOrder = 1
        object DBMemo1: TDBMemo
          Left = 8
          Top = 32
          Width = 233
          Height = 81
          DataField = #22791#27880
          DataSource = DataSource1
          TabOrder = 0
        end
      end
      object GroupBox3: TGroupBox
        Left = 274
        Top = 128
        Width = 217
        Height = 121
        Caption = #20854#23427
        TabOrder = 2
        object Label11: TLabel
          Left = 17
          Top = 33
          Width = 64
          Height = 16
          Caption = #24314#26723#20154#65306
          FocusControl = DBEdit1
        end
        object Label12: TLabel
          Left = 17
          Top = 81
          Width = 80
          Height = 16
          Caption = #24314#26723#26085#26399#65306
          FocusControl = DBEdit2
        end
        object DBEdit1: TDBEdit
          Left = 88
          Top = 33
          Width = 81
          Height = 24
          DataField = #24314#26723#20154
          DataSource = DataSource1
          TabOrder = 0
        end
        object DBEdit2: TDBEdit
          Left = 88
          Top = 81
          Width = 89
          Height = 24
          DataField = #24314#26723#26085#26399
          DataSource = DataSource1
          TabOrder = 1
        end
      end
      object Panel1: TPanel
        Left = 2
        Top = 264
        Width = 673
        Height = 41
        BevelInner = bvLowered
        TabOrder = 3
        object DBNavigator1: TDBNavigator
          Left = 8
          Top = 8
          Width = 220
          Height = 25
          DataSource = DataSource1
          TabOrder = 0
        end
        object BitBtn4: TBitBtn
          Left = 584
          Top = 8
          Width = 81
          Height = 25
          Caption = #36864#20986'(&X)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = BitBtn4Click
          Glyph.Data = {
            F6000000424DF60000000000000076000000280000000F000000100000000100
            04000000000080000000C40E0000C40E00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033BBBBBBBBBB
            BB3033BB00BBBBBBBB3033BB0BBBBBB0BB3033BBB0BBBB000B3033BBB00BB00B
            BB3033BBBB0B00BBBB3033BBBB000BBBBB3033EEEE000EEEEE3033EE0E80000E
            EE3033EEE0800EEEEE3033EEEE000EEEEE3033EEEEE00EEEEE3033EEEEEE00EE
            EE3033EEEEEE00EEEE3033EEEEEEEEEEEE3033EEEEEEEEEEEE30}
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #26597#35810
      ImageIndex = 1
      object Panel2: TPanel
        Left = 2
        Top = 8
        Width = 673
        Height = 41
        BevelInner = bvLowered
        TabOrder = 0
        object Label15: TLabel
          Left = 240
          Top = 11
          Width = 80
          Height = 16
          Caption = #26597#35810#26465#20214#65306
        end
        object DBNavigator2: TDBNavigator
          Left = 8
          Top = 8
          Width = 220
          Height = 25
          DataSource = DataSource3
          TabOrder = 0
        end
        object ComboBox3: TComboBox
          Left = 312
          Top = 8
          Width = 73
          Height = 24
          ItemHeight = 16
          TabOrder = 1
        end
        object ComboBox4: TComboBox
          Left = 384
          Top = 8
          Width = 41
          Height = 24
          ItemHeight = 16
          ItemIndex = 0
          TabOrder = 2
          Text = '='
          Items.Strings = (
            '='
            '>'
            '<'
            '>='
            '<='
            '<>')
        end
        object Edit5: TEdit
          Left = 432
          Top = 8
          Width = 65
          Height = 24
          TabOrder = 3
        end
        object BitBtn5: TBitBtn
          Left = 504
          Top = 8
          Width = 33
          Height = 25
          Caption = #26597#35810
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnClick = BitBtn5Click
        end
        object BitBtn6: TBitBtn
          Left = 536
          Top = 8
          Width = 65
          Height = 25
          Caption = #23548#20986'EXCEL'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 5
        end
        object BitBtn7: TBitBtn
          Left = 600
          Top = 8
          Width = 33
          Height = 25
          Caption = #25171#21360
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          OnClick = BitBtn7Click
        end
        object BitBtn8: TBitBtn
          Left = 632
          Top = 8
          Width = 33
          Height = 25
          Caption = #36864#20986
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          OnClick = BitBtn4Click
        end
      end
      object DBGridEh1: TDBGridEh
        Left = 0
        Top = 56
        Width = 681
        Height = 241
        FooterColor = clInfoBk
        FooterFont.Charset = ANSI_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -16
        FooterFont.Name = #23435#20307
        FooterFont.Style = []
        FooterRowCount = 1
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDblClickOptimizeColWidth, dghDialogFind]
        SortLocal = True
        SumList.Active = True
        TabOrder = 1
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -16
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        OnDblClick = DBGridEh1DblClick
        OnGetCellParams = DBGridEh1GetCellParams
        Columns = <
          item
            EditButtons = <>
            FieldName = #36710#21495
            Footer.Value = #21512#35745#65306
            Footer.ValueType = fvtStaticText
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = #23398#21495
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = #25945#32451
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = #26412#26085#20219#21153
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = #21463#35757#20154#25968
            Footer.FieldName = #21463#35757#20154#25968
            Footer.ValueType = fvtSum
            Footers = <>
            Title.SortIndex = 1
            Title.SortMarker = smDownEh
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = #20998#37197#27773#27833
            Footer.ValueType = fvtSum
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = #20998#37197#26612#27833
            Footer.ValueType = fvtSum
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = #24037#20316#29366#24577
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = #22791#27880
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = #24314#26723#20154
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = #24314#26723#26085#26399
            Footers = <>
          end>
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = Table4
    Left = 160
  end
  object Table1: TTable
    Active = True
    DatabaseName = 'jx'
    IndexFieldNames = #32534#21495
    TableName = #25945#32451#36710#24773#20917#32479#35745#34920
    object Table1BDEDesigner: TStringField
      FieldName = #32534#21495
      Size = 6
    end
    object Table1BDEDesigner2: TStringField
      FieldName = #36710#21495
      Size = 9
    end
    object Table1BDEDesigner3: TStringField
      FieldName = #23398#21495
      Size = 10
    end
  end
  object Database1: TDatabase
    AliasName = 'jx'
    Connected = True
    DatabaseName = 'jx'
    LoginPrompt = False
    SessionName = 'Default'
    Left = 32
  end
  object Table2: TTable
    Active = True
    DatabaseName = 'jx'
    IndexFieldNames = #32534#21495
    TableName = #25945#32451#21592#26723#26696
    Left = 64
    object Table2BDEDesigner: TStringField
      FieldName = #32534#21495
      Size = 6
    end
    object Table2BDEDesigner2: TStringField
      FieldName = #22995#21517
      Size = 10
    end
  end
  object Table3: TTable
    Active = True
    DatabaseName = 'jx'
    TableName = #21442#25968#35774#32622
    Left = 128
    object Table3BDEDesigner: TStringField
      FieldName = #26412#26085#20219#21153
      Size = 10
    end
    object Table3BDEDesigner2: TStringField
      FieldName = #24037#20316#29366#24577
      Size = 6
    end
  end
  object DataSource2: TDataSource
    DataSet = Table3
    Left = 96
  end
  object Table4: TTable
    Active = True
    AfterInsert = Table4AfterInsert
    BeforePost = Table4BeforePost
    AfterScroll = Table4AfterScroll
    DatabaseName = 'jx'
    TableName = #25945#32451#36710#24037#20316#29366#24577
    Left = 192
    object Table4_jlc: TStringField
      FieldName = #32534#21495'_jlc'
      Size = 6
    end
    object Table4_jly: TStringField
      FieldName = #32534#21495'_jly'
      Size = 6
    end
    object Table4BDEDesigner: TStringField
      FieldName = #26412#26085#20219#21153
      Size = 6
    end
    object Table4BDEDesigner2: TIntegerField
      FieldName = #21463#35757#20154#25968
    end
    object Table4BDEDesigner3: TIntegerField
      FieldName = #20998#37197#27773#27833
    end
    object Table4BDEDesigner4: TIntegerField
      FieldName = #20998#37197#26612#27833
    end
    object Table4BDEDesigner5: TStringField
      FieldName = #24037#20316#29366#24577
      Size = 6
    end
    object Table4BDEDesigner6: TMemoField
      FieldName = #22791#27880
      BlobType = ftMemo
      Size = 1
    end
    object Table4BDEDesigner7: TStringField
      FieldName = #24314#26723#20154
      Size = 8
    end
    object Table4BDEDesigner8: TDateTimeField
      FieldName = #24314#26723#26085#26399
    end
  end
  object Query1: TQuery
    DatabaseName = 'jx'
    SQL.Strings = (
      
        'SELECT cqktj.'#36710#21495', cqktj.'#23398#21495', jlyda.'#22995#21517' as '#25945#32451', cgzzt.'#26412#26085#20219#21153', cgzzt.'#21463#35757#20154 +
        #25968', cgzzt.'#20998#37197#27773#27833', cgzzt.'#20998#37197#26612#27833', cgzzt.'#24037#20316#29366#24577', cgzzt.'#22791#27880', cgzzt.'#24314#26723#20154', cgzz' +
        't.'#24314#26723#26085#26399
      'FROM '#25945#32451#36710#24773#20917#32479#35745#34920' cqktj, '#25945#32451#36710#24037#20316#29366#24577' cgzzt, '#25945#32451#21592#26723#26696' jlyda'
      'WHERE  (cqktj.'#32534#21495' = cgzzt.'#32534#21495'_jlc)  '
      '   AND  (jlyda.'#32534#21495' = cgzzt.'#32534#21495'_jly)  ')
    Left = 576
  end
  object DataSource3: TDataSource
    DataSet = Query1
    Left = 544
  end
  object PrintDBGridEh1: TPrintDBGridEh
    DBGridEh = DBGridEh1
    Options = [pghFitGridToPageWidth, pghOptimalColWidths]
    Page.BottomMargin = 1.000000000000000000
    Page.LeftMargin = 1.000000000000000000
    Page.RightMargin = 1.000000000000000000
    Page.TopMargin = 1.000000000000000000
    PageFooter.Font.Charset = DEFAULT_CHARSET
    PageFooter.Font.Color = clWindowText
    PageFooter.Font.Height = -11
    PageFooter.Font.Name = 'MS Sans Serif'
    PageFooter.Font.Style = []
    PageHeader.Font.Charset = DEFAULT_CHARSET
    PageHeader.Font.Color = clWindowText
    PageHeader.Font.Height = -11
    PageHeader.Font.Name = 'MS Sans Serif'
    PageHeader.Font.Style = []
    Units = MM
    Left = 608
  end
end
