object pxxy: Tpxxy
  Left = 275
  Top = 139
  BorderStyle = bsSingle
  Caption = #22521#35757#21327#35758
  ClientHeight = 557
  ClientWidth = 713
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 12
  object Label18: TLabel
    Left = 336
    Top = 8
    Width = 116
    Height = 29
    Caption = #22521#35757#21327#35758
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -29
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 40
    Width = 713
    Height = 513
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #24405#20837
      object GroupBox1: TGroupBox
        Left = 8
        Top = 8
        Width = 689
        Height = 129
        Caption = #22522#26412#20449#24687
        TabOrder = 0
        object Label1: TLabel
          Left = 16
          Top = 27
          Width = 36
          Height = 12
          Caption = #23398#21495#65306
        end
        object Label2: TLabel
          Left = 144
          Top = 27
          Width = 36
          Height = 12
          Caption = #22995#21517#65306
        end
        object Label3: TLabel
          Left = 272
          Top = 27
          Width = 60
          Height = 12
          Caption = #36523#20221#35777#21495#65306
        end
        object Label4: TLabel
          Left = 496
          Top = 27
          Width = 60
          Height = 12
          Caption = #23398#20064#36710#22411#65306
        end
        object Label5: TLabel
          Left = 16
          Top = 91
          Width = 60
          Height = 12
          Caption = #25253#21517#26102#38388#65306
        end
        object Label6: TLabel
          Left = 160
          Top = 59
          Width = 60
          Height = 12
          Caption = #24212#20184#23398#36153#65306
        end
        object Label7: TLabel
          Left = 288
          Top = 59
          Width = 36
          Height = 12
          Caption = #39318#20184#65306
        end
        object Label8: TLabel
          Left = 400
          Top = 59
          Width = 72
          Height = 12
          Caption = #31532#20108#27425#20184#36153#65306
        end
        object Label9: TLabel
          Left = 624
          Top = 59
          Width = 48
          Height = 12
          Caption = #20132#28165#20313#39069
        end
        object Label10: TLabel
          Left = 16
          Top = 59
          Width = 60
          Height = 12
          Caption = #35757#32451#26041#24335#65306
        end
        object Label11: TLabel
          Left = 160
          Top = 91
          Width = 48
          Height = 12
          Caption = #34917#32771#36153#65306
        end
        object Label12: TLabel
          Left = 288
          Top = 91
          Width = 48
          Height = 12
          Caption = #37325#32771#36153#65306
        end
        object Label13: TLabel
          Left = 416
          Top = 91
          Width = 48
          Height = 12
          Caption = #24314#26723#20154#65306
          FocusControl = DBEdit13
        end
        object Label14: TLabel
          Left = 536
          Top = 91
          Width = 60
          Height = 12
          Caption = #24314#26723#26085#26399#65306
          FocusControl = DBEdit14
        end
        object SpeedButton1: TSpeedButton
          Left = 102
          Top = 24
          Width = 23
          Height = 22
          Caption = '...'
          OnClick = SpeedButton1Click
        end
        object DBEdit13: TDBEdit
          Left = 464
          Top = 88
          Width = 57
          Height = 20
          DataField = #24314#26723#20154
          DataSource = DataSource2
          TabOrder = 0
        end
        object DBEdit14: TDBEdit
          Left = 592
          Top = 88
          Width = 81
          Height = 20
          DataField = #24314#26723#26085#26399
          DataSource = DataSource2
          TabOrder = 1
        end
        object Edit1: TEdit
          Left = 48
          Top = 24
          Width = 49
          Height = 20
          TabOrder = 2
          OnExit = Edit1Exit
          OnKeyPress = Edit1KeyPress
        end
        object Edit2: TEdit
          Left = 184
          Top = 24
          Width = 57
          Height = 20
          Enabled = False
          TabOrder = 3
        end
        object Edit4: TEdit
          Left = 552
          Top = 24
          Width = 57
          Height = 20
          Enabled = False
          TabOrder = 4
        end
        object Edit5: TEdit
          Left = 72
          Top = 56
          Width = 73
          Height = 20
          TabOrder = 5
        end
        object Edit6: TEdit
          Left = 216
          Top = 56
          Width = 57
          Height = 20
          Enabled = False
          TabOrder = 6
        end
        object Edit7: TEdit
          Left = 320
          Top = 56
          Width = 65
          Height = 20
          Enabled = False
          TabOrder = 7
        end
        object Edit8: TEdit
          Left = 472
          Top = 56
          Width = 65
          Height = 20
          Enabled = False
          TabOrder = 8
        end
        object Edit9: TEdit
          Left = 552
          Top = 56
          Width = 73
          Height = 20
          Enabled = False
          TabOrder = 9
        end
        object Edit10: TEdit
          Left = 72
          Top = 88
          Width = 73
          Height = 20
          Enabled = False
          TabOrder = 10
        end
        object Edit11: TEdit
          Left = 208
          Top = 88
          Width = 65
          Height = 20
          TabOrder = 11
        end
        object Edit12: TEdit
          Left = 336
          Top = 88
          Width = 65
          Height = 20
          TabOrder = 12
        end
        object Edit3: TEdit
          Left = 328
          Top = 24
          Width = 129
          Height = 20
          Enabled = False
          TabOrder = 13
        end
      end
      object GroupBox2: TGroupBox
        Left = 8
        Top = 144
        Width = 689
        Height = 193
        Caption = #25215#35834
        TabOrder = 1
        object DBMemo1: TDBMemo
          Left = 15
          Top = 19
          Width = 661
          Height = 166
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Color = clSkyBlue
          DataField = #25215#35834
          DataSource = DataSource3
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -14
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
      end
      object GroupBox3: TGroupBox
        Left = 8
        Top = 348
        Width = 689
        Height = 81
        Caption = #20849#35745#36153#29992
        TabOrder = 2
        object Label15: TLabel
          Left = 16
          Top = 27
          Width = 84
          Height = 12
          Caption = #32564#36153#37329#39069#22823#20889#65306
          FocusControl = DBEdit15
        end
        object Label16: TLabel
          Left = 176
          Top = 27
          Width = 84
          Height = 12
          Caption = #32564#36153#37329#39069#23567#20889#65306
          FocusControl = DBEdit16
        end
        object Label17: TLabel
          Left = 512
          Top = 51
          Width = 60
          Height = 12
          Caption = #27861#20154#20195#34920#65306
          FocusControl = DBEdit17
        end
        object DBEdit15: TDBEdit
          Left = 96
          Top = 24
          Width = 65
          Height = 20
          DataField = #32564#36153#37329#39069#22823#20889
          DataSource = DataSource2
          TabOrder = 0
        end
        object DBEdit16: TDBEdit
          Left = 256
          Top = 24
          Width = 65
          Height = 20
          DataField = #32564#36153#37329#39069#23567#20889
          DataSource = DataSource2
          TabOrder = 1
        end
        object DBEdit17: TDBEdit
          Left = 568
          Top = 48
          Width = 100
          Height = 20
          DataField = #27861#20154#20195#34920
          DataSource = DataSource2
          TabOrder = 2
        end
      end
      object Panel1: TPanel
        Left = 8
        Top = 440
        Width = 689
        Height = 41
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 3
        object DBNavigator1: TDBNavigator
          Left = 16
          Top = 6
          Width = 240
          Height = 25
          DataSource = DataSource2
          TabOrder = 0
        end
        object BitBtn1: TBitBtn
          Left = 496
          Top = 6
          Width = 75
          Height = 25
          Caption = #25171#21360
          TabOrder = 1
        end
        object BitBtn2: TBitBtn
          Left = 592
          Top = 6
          Width = 75
          Height = 25
          Caption = #36864#20986
          TabOrder = 2
          OnClick = BitBtn2Click
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #26597#35810
      ImageIndex = 1
      object DBGridEh1: TDBGridEh
        Left = 0
        Top = 56
        Width = 705
        Height = 425
        DataSource = DataSource4
        FooterColor = clWindow
        FooterFont.Charset = ANSI_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -12
        FooterFont.Name = #23435#20307
        FooterFont.Style = []
        OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghFitRowHeightToText, dghTraceColSizing, dghDblClickOptimizeColWidth, dghDialogFind]
        RowHeight = 4
        RowLines = 1
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
      end
      object Panel2: TPanel
        Left = 0
        Top = 8
        Width = 705
        Height = 41
        BevelInner = bvLowered
        TabOrder = 1
        object Label19: TLabel
          Left = 8
          Top = 16
          Width = 60
          Height = 12
          Caption = #26597#35810#26465#20214#65306
        end
        object ComboBox1: TComboBox
          Left = 64
          Top = 12
          Width = 81
          Height = 20
          ItemHeight = 12
          TabOrder = 0
          OnDropDown = ComboBox1DropDown
        end
        object ComboBox2: TComboBox
          Left = 144
          Top = 12
          Width = 41
          Height = 20
          ItemHeight = 12
          TabOrder = 1
          Items.Strings = (
            '='
            '>'
            '<'
            '>='
            '<='
            '<>')
        end
        object Edit13: TEdit
          Left = 185
          Top = 12
          Width = 72
          Height = 20
          TabOrder = 2
        end
        object BitBtn3: TBitBtn
          Left = 464
          Top = 8
          Width = 49
          Height = 25
          Caption = #26597#35810'(&S)'
          TabOrder = 3
          OnClick = BitBtn3Click
        end
        object BitBtn4: TBitBtn
          Left = 520
          Top = 8
          Width = 57
          Height = 25
          Caption = #23548#20986'EXCEL'
          TabOrder = 4
        end
        object BitBtn5: TBitBtn
          Left = 584
          Top = 8
          Width = 49
          Height = 25
          Caption = #25171#21360'(&P)'
          TabOrder = 5
          OnClick = BitBtn5Click
        end
        object BitBtn6: TBitBtn
          Left = 640
          Top = 8
          Width = 49
          Height = 25
          Caption = #36864#20986'(&X)'
          TabOrder = 6
        end
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 8
    Top = 8
  end
  object Table1: TTable
    Active = True
    DatabaseName = 'jx'
    IndexFieldNames = #23398#21495
    MasterFields = #23398#21495
    MasterSource = DataSource2
    TableName = 'student'
    Left = 40
    Top = 8
    object Table1BDEDesigner: TStringField
      FieldName = #23398#21495
      Size = 6
    end
    object Table1BDEDesigner2: TStringField
      FieldName = #22995#21517
      Size = 8
    end
    object Table1BDEDesigner3: TStringField
      FieldName = #36523#20221#35777#21495
    end
    object Table1BDEDesigner4: TStringField
      FieldName = #23398#20064#36710#22411
      Size = 4
    end
    object Table1BDEDesigner5: TDateTimeField
      FieldName = #25253#21517#26102#38388
    end
    object Table1BDEDesigner6: TFloatField
      FieldName = #24212#20184#23398#36153
    end
    object Table1BDEDesigner7: TFloatField
      FieldName = #39318#20184
    end
    object Table1BDEDesigner8: TFloatField
      FieldName = #31532#20108#27425#20184#36153
    end
    object Table1BDEDesigner9: TDateTimeField
      FieldName = #31532#20108#27425#20184#36153#26085#26399
    end
  end
  object Database1: TDatabase
    AliasName = 'jx'
    Connected = True
    DatabaseName = 'jx'
    LoginPrompt = False
    SessionName = 'Default'
    Left = 72
    Top = 8
  end
  object Table2: TTable
    Active = True
    AfterInsert = Table2AfterInsert
    BeforePost = Table2BeforePost
    BeforeScroll = Table2BeforeScroll
    DatabaseName = 'jx'
    TableName = #22521#35757#21327#35758
    Left = 104
    Top = 8
    object Table2BDEDesigner: TStringField
      FieldName = #23398#21495
      Size = 50
    end
    object Table2BDEDesigner2: TStringField
      FieldName = #35757#32451#26041#24335
      Size = 10
    end
    object Table2BDEDesigner3: TFloatField
      FieldName = #34917#32771#36153
    end
    object Table2BDEDesigner4: TFloatField
      FieldName = #37325#32771#36153
    end
    object Table2BDEDesigner5: TFloatField
      FieldName = #32564#36153#37329#39069#22823#20889
    end
    object Table2BDEDesigner6: TFloatField
      FieldName = #32564#36153#37329#39069#23567#20889
    end
    object Table2BDEDesigner7: TStringField
      FieldName = #27861#20154#20195#34920
      Size = 8
    end
    object Table2BDEDesigner8: TDateTimeField
      FieldName = #24314#26723#26085#26399
    end
    object Table2BDEDesigner9: TStringField
      FieldName = #24314#26723#20154
      Size = 8
    end
  end
  object DataSource2: TDataSource
    DataSet = Table2
    Left = 136
    Top = 8
  end
  object Table3: TTable
    Active = True
    DatabaseName = 'jx'
    TableName = #21442#25968#35774#32622
    Left = 176
    Top = 8
    object Table3BDEDesigner: TMemoField
      FieldName = #25215#35834
      BlobType = ftMemo
      Size = 1
    end
    object Table3BDEDesigner2: TStringField
      FieldName = #35757#32451#26041#24335
    end
  end
  object DataSource3: TDataSource
    DataSet = Table3
    Left = 208
    Top = 8
  end
  object DataSource4: TDataSource
    DataSet = Query1
    Left = 480
  end
  object Query1: TQuery
    DatabaseName = 'jx'
    SQL.Strings = (
      '  ')
    Left = 512
  end
  object PrintDBGridEh1: TPrintDBGridEh
    DBGridEh = DBGridEh1
    Options = [pghFitGridToPageWidth, pghRowAutoStretch, pghOptimalColWidths]
    Page.BottomMargin = 1.000000000000000000
    Page.LeftMargin = 1.000000000000000000
    Page.RightMargin = 1.000000000000000000
    Page.TopMargin = 1.000000000000000000
    PageFooter.Font.Charset = DEFAULT_CHARSET
    PageFooter.Font.Color = clWindowText
    PageFooter.Font.Height = -11
    PageFooter.Font.Name = 'MS Sans Serif'
    PageFooter.Font.Style = []
    PageHeader.CenterText.Strings = (
      #22521#35757#21327#35758)
    PageHeader.Font.Charset = ANSI_CHARSET
    PageHeader.Font.Color = clWindowText
    PageHeader.Font.Height = -29
    PageHeader.Font.Name = #23435#20307
    PageHeader.Font.Style = []
    Units = MM
    Left = 544
  end
end
