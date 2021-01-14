object cyzgzda: Tcyzgzda
  Left = 256
  Top = 132
  Width = 746
  Height = 541
  Caption = #20174#19994#36164#26684#35777#22521#35757#26723#26696
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object Label25: TLabel
    Left = 232
    Top = 16
    Width = 270
    Height = 29
    Caption = #20174#19994#36164#26684#35777#22521#35757#26723#26696
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -29
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
  end
  object PageControl1: TPageControl
    Left = 5
    Top = 48
    Width = 729
    Height = 457
    ActivePage = TabSheet1
    Style = tsFlatButtons
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #24405#20837
      object GroupBox1: TGroupBox
        Left = 0
        Top = 8
        Width = 705
        Height = 129
        Caption = #22522#26412#20449#24687
        TabOrder = 0
        object Label1: TLabel
          Left = 8
          Top = 28
          Width = 36
          Height = 12
          Caption = #23398#21495#65306
          FocusControl = DBEdit1
        end
        object Label2: TLabel
          Left = 96
          Top = 28
          Width = 36
          Height = 12
          Caption = #22995#21517#65306
          FocusControl = DBEdit2
        end
        object Label3: TLabel
          Left = 200
          Top = 28
          Width = 36
          Height = 12
          Caption = #24615#21035#65306
        end
        object Label4: TLabel
          Left = 280
          Top = 28
          Width = 36
          Height = 12
          Caption = #24180#40836#65306
          FocusControl = DBEdit4
        end
        object Label5: TLabel
          Left = 360
          Top = 28
          Width = 60
          Height = 12
          Caption = #25253#21517#26102#38388#65306
        end
        object Label6: TLabel
          Left = 296
          Top = 59
          Width = 60
          Height = 12
          Caption = #36523#20221#35777#21495#65306
          FocusControl = DBEdit6
        end
        object Label7: TLabel
          Left = 8
          Top = 91
          Width = 72
          Height = 12
          Caption = #20303#22336#25110#21333#20301#65306
          FocusControl = DBEdit7
        end
        object Label8: TLabel
          Left = 144
          Top = 59
          Width = 60
          Height = 12
          Caption = #32852#31995#30005#35805#65306
          FocusControl = DBEdit8
        end
        object Label9: TLabel
          Left = 8
          Top = 59
          Width = 36
          Height = 12
          Caption = #25163#26426#65306
          FocusControl = DBEdit9
        end
        object Image1: TImage
          Left = 600
          Top = 11
          Width = 89
          Height = 113
          Stretch = True
        end
        object DBEdit1: TDBEdit
          Left = 40
          Top = 24
          Width = 49
          Height = 20
          DataField = #23398#21495
          DataSource = DataSource1
          TabOrder = 0
        end
        object DBEdit2: TDBEdit
          Left = 128
          Top = 24
          Width = 57
          Height = 20
          DataField = #22995#21517
          DataSource = DataSource1
          TabOrder = 1
        end
        object DBEdit4: TDBEdit
          Left = 312
          Top = 24
          Width = 33
          Height = 20
          DataField = #24180#40836
          DataSource = DataSource1
          TabOrder = 2
        end
        object DBEdit6: TDBEdit
          Left = 360
          Top = 56
          Width = 113
          Height = 20
          DataField = #36523#20221#35777#21495
          DataSource = DataSource1
          TabOrder = 3
        end
        object DBEdit7: TDBEdit
          Left = 80
          Top = 88
          Width = 265
          Height = 20
          DataField = #20303#22336#25110#21333#20301
          DataSource = DataSource1
          TabOrder = 4
        end
        object DBEdit8: TDBEdit
          Left = 40
          Top = 56
          Width = 89
          Height = 20
          DataField = #32852#31995#30005#35805
          DataSource = DataSource1
          TabOrder = 5
        end
        object DBEdit9: TDBEdit
          Left = 200
          Top = 56
          Width = 81
          Height = 20
          DataField = #25163#26426
          DataSource = DataSource1
          TabOrder = 6
        end
        object DBComboBox1: TDBComboBox
          Left = 232
          Top = 24
          Width = 41
          Height = 20
          DataField = #24615#21035
          DataSource = DataSource1
          ItemHeight = 12
          TabOrder = 7
          OnDropDown = DBComboBox1DropDown
        end
        object sDateEdit1: TsDateEdit
          Left = 416
          Top = 24
          Width = 89
          Height = 21
          GlyphMode.Grayed = False
          sStyle.GroupIndex = 0
          sStyle.SkinSection = 'TsDateEdit'
          sStyle.Painting.ColorBorderTop = clBtnHighlight
          sStyle.Caption.Layout = sclLeft
          sStyle.Caption.MaxWidth = 0
          sStyle.Caption.Font.Charset = DEFAULT_CHARSET
          sStyle.Caption.Font.Color = clWindowText
          sStyle.Caption.Font.Height = -11
          sStyle.Caption.Font.Name = 'MS Sans Serif'
          sStyle.Caption.Font.Style = []
          sStyle.Caption.Active = False
          EditMask = '!9999/99/99;1; '
          TabOrder = 8
          Text = '    -  -  '
          OnAcceptDate = sDateEdit1AcceptDate
        end
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 144
        Width = 705
        Height = 121
        Caption = #35777#29031
        TabOrder = 1
        object Label10: TLabel
          Left = 16
          Top = 21
          Width = 72
          Height = 12
          Caption = #25345#39550#29031#31867#21035#65306
        end
        object Label11: TLabel
          Left = 152
          Top = 21
          Width = 84
          Height = 12
          Caption = #21021#27425#39046#35777#26085#26399#65306
        end
        object Label12: TLabel
          Left = 328
          Top = 24
          Width = 60
          Height = 12
          Caption = #39550#29031#21495#30721#65306
          FocusControl = DBEdit12
        end
        object Label13: TLabel
          Left = 520
          Top = 21
          Width = 96
          Height = 12
          Caption = #25311#21150#36164#26684#35777#31181#31867#65306
        end
        object Label14: TLabel
          Left = 16
          Top = 53
          Width = 72
          Height = 12
          Caption = #21407#27605#19994#23398#26657#65306
        end
        object Label15: TLabel
          Left = 200
          Top = 53
          Width = 72
          Height = 12
          Caption = #32467#19994#35777#21495#30721#65306
          FocusControl = DBEdit15
        end
        object Label16: TLabel
          Left = 424
          Top = 53
          Width = 36
          Height = 12
          Caption = #32564#36153#65306
          FocusControl = DBEdit16
        end
        object Label19: TLabel
          Left = 16
          Top = 90
          Width = 60
          Height = 12
          Caption = #36164#26684#35777#21495#65306
          FocusControl = DBEdit19
        end
        object Label20: TLabel
          Left = 208
          Top = 90
          Width = 60
          Height = 12
          Caption = #21457#35777#36884#24452#65306
        end
        object Label21: TLabel
          Left = 352
          Top = 90
          Width = 84
          Height = 12
          Caption = #19981#33021#21457#35777#21407#22240#65306
        end
        object DBEdit12: TDBEdit
          Left = 384
          Top = 16
          Width = 129
          Height = 20
          DataField = #39550#29031#21495#30721
          DataSource = DataSource1
          TabOrder = 0
        end
        object DBEdit15: TDBEdit
          Left = 272
          Top = 50
          Width = 137
          Height = 20
          DataField = #32467#19994#35777#21495#30721
          DataSource = DataSource1
          TabOrder = 1
        end
        object DBEdit16: TDBEdit
          Left = 456
          Top = 50
          Width = 49
          Height = 20
          DataField = #32564#36153
          DataSource = DataSource1
          TabOrder = 2
        end
        object DBEdit19: TDBEdit
          Left = 72
          Top = 85
          Width = 129
          Height = 20
          DataField = #36164#26684#35777#21495
          DataSource = DataSource1
          TabOrder = 3
        end
        object DBComboBox2: TDBComboBox
          Left = 88
          Top = 16
          Width = 57
          Height = 20
          DataField = #25345#39550#29031#31867#21035
          DataSource = DataSource1
          ItemHeight = 12
          TabOrder = 4
          OnDropDown = DBComboBox2DropDown
        end
        object DBComboBox3: TDBComboBox
          Left = 616
          Top = 16
          Width = 81
          Height = 20
          DataField = #25311#21150#36164#26684#35777#31181#31867
          DataSource = DataSource1
          ItemHeight = 12
          TabOrder = 5
          OnDropDown = DBComboBox3DropDown
        end
        object DBComboBox4: TDBComboBox
          Left = 88
          Top = 50
          Width = 97
          Height = 20
          DataField = #21407#27605#19994#23398#26657
          DataSource = DataSource1
          ItemHeight = 12
          TabOrder = 6
          OnDropDown = DBComboBox4DropDown
        end
        object DBComboBox7: TDBComboBox
          Left = 432
          Top = 88
          Width = 89
          Height = 20
          DataField = #19981#33021#21457#35777#21407#22240
          DataSource = DataSource1
          ItemHeight = 12
          TabOrder = 7
          OnDropDown = DBComboBox7DropDown
        end
        object DBComboBox8: TDBComboBox
          Left = 264
          Top = 88
          Width = 81
          Height = 20
          DataField = #21457#35777#36884#24452
          DataSource = DataSource1
          ItemHeight = 12
          TabOrder = 8
          OnDropDown = DBComboBox8DropDown
        end
        object sDateEdit2: TsDateEdit
          Left = 232
          Top = 16
          Width = 89
          Height = 21
          GlyphMode.Grayed = False
          sStyle.GroupIndex = 0
          sStyle.SkinSection = 'TsDateEdit'
          sStyle.Painting.ColorBorderTop = clBtnHighlight
          sStyle.Caption.Layout = sclLeft
          sStyle.Caption.MaxWidth = 0
          sStyle.Caption.Font.Charset = DEFAULT_CHARSET
          sStyle.Caption.Font.Color = clWindowText
          sStyle.Caption.Font.Height = -11
          sStyle.Caption.Font.Name = 'MS Sans Serif'
          sStyle.Caption.Font.Style = []
          sStyle.Caption.Active = False
          EditMask = '!9999/99/99;1; '
          TabOrder = 9
          Text = '    -  -  '
          OnAcceptDate = sDateEdit2AcceptDate
        end
      end
      object GroupBox3: TGroupBox
        Left = 320
        Top = 272
        Width = 385
        Height = 57
        Caption = #38656#21578#30693#20154
        TabOrder = 2
        object Label22: TLabel
          Left = 16
          Top = 24
          Width = 36
          Height = 12
          Caption = #22995#21517#65306
          FocusControl = DBEdit22
        end
        object Label23: TLabel
          Left = 120
          Top = 24
          Width = 36
          Height = 12
          Caption = #30005#35805#65306
          FocusControl = DBEdit23
        end
        object Label24: TLabel
          Left = 248
          Top = 24
          Width = 36
          Height = 12
          Caption = #25163#26426#65306
          FocusControl = DBEdit24
        end
        object DBEdit22: TDBEdit
          Left = 48
          Top = 21
          Width = 57
          Height = 20
          DataField = #38656#21578#30693#20154
          DataSource = DataSource1
          TabOrder = 0
        end
        object DBEdit23: TDBEdit
          Left = 152
          Top = 21
          Width = 81
          Height = 20
          DataField = #38656#21578#30693#20154#30005#35805
          DataSource = DataSource1
          TabOrder = 1
        end
        object DBEdit24: TDBEdit
          Left = 280
          Top = 21
          Width = 81
          Height = 20
          DataField = #38656#21578#30693#20154#25163#26426
          DataSource = DataSource1
          TabOrder = 2
        end
      end
      object DBNavigator1: TDBNavigator
        Left = 2
        Top = 374
        Width = 700
        Height = 25
        DataSource = DataSource1
        TabOrder = 3
      end
      object GroupBox4: TGroupBox
        Left = 0
        Top = 272
        Width = 273
        Height = 57
        Caption = #25104#32489
        TabOrder = 4
        object Label17: TLabel
          Left = 8
          Top = 28
          Width = 36
          Height = 12
          Caption = #29702#35770#65306
        end
        object Label26: TLabel
          Left = 120
          Top = 28
          Width = 36
          Height = 12
          Caption = #25805#20316#65306
        end
        object DBComboBox5: TDBComboBox
          Left = 40
          Top = 24
          Width = 65
          Height = 20
          DataField = #29702#35770
          DataSource = DataSource1
          ItemHeight = 12
          TabOrder = 0
          OnDropDown = DBComboBox5DropDown
        end
        object DBComboBox6: TDBComboBox
          Left = 152
          Top = 24
          Width = 73
          Height = 20
          DataField = #25805#20316
          DataSource = DataSource1
          ItemHeight = 12
          TabOrder = 1
          OnDropDown = DBComboBox6DropDown
        end
      end
      object GroupBox5: TGroupBox
        Left = 0
        Top = 333
        Width = 705
        Height = 41
        TabOrder = 5
        object Label18: TLabel
          Left = 16
          Top = 19
          Width = 48
          Height = 12
          Caption = #24314#26723#20154#65306
        end
        object Label27: TLabel
          Left = 144
          Top = 19
          Width = 60
          Height = 12
          Caption = #24314#26723#26085#26399#65306
        end
        object DBEdit3: TDBEdit
          Left = 64
          Top = 16
          Width = 65
          Height = 20
          DataField = #24314#26723#20154
          DataSource = DataSource1
          Enabled = False
          TabOrder = 0
        end
        object DBEdit5: TDBEdit
          Left = 200
          Top = 16
          Width = 73
          Height = 20
          DataField = #24314#26723#26085#26399
          DataSource = DataSource1
          Enabled = False
          TabOrder = 1
        end
      end
      object BitBtn2: TBitBtn
        Left = 624
        Top = 402
        Width = 75
        Height = 25
        Caption = #36864#20986'(&X)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        OnClick = BitBtn2Click
      end
    end
    object TabSheet2: TTabSheet
      Caption = #26597#35810
      ImageIndex = 1
      object GroupBox6: TGroupBox
        Left = 0
        Top = 0
        Width = 720
        Height = 65
        Caption = #26597#35810#26465#20214
        TabOrder = 0
        object Label28: TLabel
          Left = 267
          Top = 27
          Width = 48
          Height = 12
          Caption = #26085#26399#33258#65306
        end
        object Label29: TLabel
          Left = 403
          Top = 27
          Width = 24
          Height = 12
          Caption = #33267#65306
        end
        object ComboBox1: TComboBox
          Left = 8
          Top = 24
          Width = 73
          Height = 20
          ItemHeight = 12
          TabOrder = 0
          OnDropDown = ComboBox1DropDown
        end
        object Edit1: TEdit
          Left = 136
          Top = 24
          Width = 81
          Height = 20
          TabOrder = 1
        end
        object DateTimePicker1: TDateTimePicker
          Left = 312
          Top = 24
          Width = 89
          Height = 20
          BevelOuter = bvNone
          Date = 38334.877195451390000000
          Time = 38334.877195451390000000
          TabOrder = 2
        end
        object DateTimePicker2: TDateTimePicker
          Left = 424
          Top = 24
          Width = 89
          Height = 20
          Date = 38334.877195451390000000
          Time = 38334.877195451390000000
          Checked = False
          TabOrder = 3
        end
        object BitBtn4: TBitBtn
          Left = 528
          Top = 24
          Width = 60
          Height = 25
          Caption = #26597#35810
          TabOrder = 4
          OnClick = BitBtn4Click
        end
        object BitBtn5: TBitBtn
          Left = 592
          Top = 24
          Width = 60
          Height = 25
          Caption = #25171#21360
          TabOrder = 5
          OnClick = BitBtn5Click
        end
        object BitBtn6: TBitBtn
          Left = 656
          Top = 24
          Width = 60
          Height = 25
          Caption = #36864#20986
          TabOrder = 6
          OnClick = BitBtn6Click
        end
        object ComboBox2: TComboBox
          Left = 88
          Top = 24
          Width = 49
          Height = 20
          ItemHeight = 12
          TabOrder = 7
          Items.Strings = (
            '='
            '<'
            '>'
            '<='
            '>='
            '<>'
            'like')
        end
        object CheckBox1: TCheckBox
          Left = 248
          Top = 24
          Width = 17
          Height = 17
          TabOrder = 8
        end
      end
      object DBGridEh1: TDBGridEh
        Left = 0
        Top = 72
        Width = 721
        Height = 329
        FooterColor = clWindow
        FooterFont.Charset = ANSI_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -12
        FooterFont.Name = #23435#20307
        FooterFont.Style = []
        TabOrder = 1
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Top = 8
  end
  object Table1: TTable
    Active = True
    AfterInsert = Table1AfterInsert
    BeforePost = Table1BeforePost
    AfterPost = Table1AfterPost
    AfterCancel = Table1AfterCancel
    AfterScroll = Table1AfterScroll
    DatabaseName = 'jx'
    TableName = #20174#19994#36164#26684#35777#22521#35757#26723#26696
    Left = 32
    Top = 8
    object Table1BDEDesigner: TStringField
      FieldName = #23398#21495
      Size = 50
    end
    object Table1BDEDesigner2: TStringField
      FieldName = #22995#21517
      Size = 8
    end
    object Table1BDEDesigner3: TStringField
      FieldName = #24615#21035
      Size = 2
    end
    object Table1BDEDesigner4: TSmallintField
      FieldName = #24180#40836
    end
    object Table1BDEDesigner5: TDateTimeField
      FieldName = #25253#21517#26102#38388
    end
    object Table1BDEDesigner6: TStringField
      FieldName = #36523#20221#35777#21495
    end
    object Table1BDEDesigner7: TStringField
      FieldName = #20303#22336#25110#21333#20301
      Size = 50
    end
    object Table1BDEDesigner8: TStringField
      FieldName = #32852#31995#30005#35805
      Size = 13
    end
    object Table1BDEDesigner9: TStringField
      FieldName = #25163#26426
      Size = 13
    end
    object Table1BDEDesigner10: TStringField
      FieldName = #25345#39550#29031#31867#21035
      Size = 4
    end
    object Table1BDEDesigner11: TDateTimeField
      FieldName = #21021#27425#39046#35777#26085#26399
    end
    object Table1BDEDesigner12: TStringField
      FieldName = #39550#29031#21495#30721
      Size = 18
    end
    object Table1BDEDesigner13: TStringField
      FieldName = #25311#21150#36164#26684#35777#31181#31867
      Size = 15
    end
    object Table1BDEDesigner14: TStringField
      FieldName = #21407#27605#19994#23398#26657
      Size = 50
    end
    object Table1BDEDesigner15: TStringField
      FieldName = #32467#19994#35777#21495#30721
    end
    object Table1BDEDesigner16: TFloatField
      FieldName = #32564#36153
    end
    object Table1BDEDesigner17: TStringField
      FieldName = #29702#35770
      Size = 8
    end
    object Table1BDEDesigner18: TStringField
      FieldName = #25805#20316
      Size = 8
    end
    object Table1BDEDesigner19: TStringField
      FieldName = #36164#26684#35777#21495
      Size = 18
    end
    object Table1BDEDesigner20: TStringField
      FieldName = #21457#35777#36884#24452
      Size = 10
    end
    object Table1BDEDesigner21: TStringField
      FieldName = #19981#33021#21457#35777#21407#22240
      Size = 12
    end
    object Table1BDEDesigner22: TStringField
      FieldName = #38656#21578#30693#20154
      Size = 8
    end
    object Table1BDEDesigner23: TStringField
      FieldName = #38656#21578#30693#20154#30005#35805
      Size = 13
    end
    object Table1BDEDesigner24: TStringField
      FieldName = #38656#21578#30693#20154#25163#26426
      Size = 13
    end
    object Table1BDEDesigner25: TStringField
      FieldName = #24314#26723#20154
      Size = 8
    end
    object Table1BDEDesigner26: TDateTimeField
      FieldName = #24314#26723#26085#26399
    end
  end
  object Database1: TDatabase
    AliasName = 'jx'
    Connected = True
    DatabaseName = 'jx'
    LoginPrompt = False
    SessionName = 'Default'
    Left = 64
    Top = 8
  end
  object Table2: TTable
    Active = True
    DatabaseName = 'jx'
    TableName = #21442#25968#35774#32622
    Left = 96
    Top = 8
  end
  object Table3: TTable
    DatabaseName = 'jx'
    TableName = #35745#25968#22120
    Left = 128
    Top = 8
    object Table3cyzgzpxda: TIntegerField
      FieldName = 'cyzgzpxda'
    end
  end
  object frxReport1: TfrxReport
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38527.916086516200000000
    ReportOptions.LastChange = 38528.950980358790000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 536
    Top = 16
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object PageHeader1: TfrxPageHeader
        Height = 71.811070000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 201.574933330000000000
          Top = 3.779530000000001000
          Width = 317.480520000000000000
          Height = 37.795300000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -35
          Font.Name = #23435#20307
          Font.Style = []
          Memo.Strings = (
            #20174#19994#36164#26684#35777#22521#35757#26723#26696)
          ParentFont = False
        end
        object Line44: TfrxLineView
          Left = 204.094620000000000000
          Top = 45.354360000000000000
          Width = 309.921460000000000000
          Frame.Style = fsDouble
          Frame.Typ = [ftTop]
        end
      end
      object MasterData1: TfrxMasterData
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = #23435#20307
        Font.Style = []
        Height = 797.480830000000000000
        ParentFont = False
        Top = 151.181200000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Memo2: TfrxMemoView
          Left = 68.031540000000000000
          Top = 13.118120000000000000
          Width = 60.472480000000000000
          Height = 22.677165350000000000
          DataField = #23398#21495
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.Strings = (
            '[frxDBDataset1."'#23398#21495'"]')
        end
        object Memo3: TfrxMemoView
          Left = 11.338590000000000000
          Top = 13.118120000000000000
          Width = 56.692950000000000000
          Height = 22.677180000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = #23435#20307
          Font.Style = []
          Memo.Strings = (
            #23398' '#21495)
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 209.874150000000000000
          Top = 11.338590000000010000
          Width = 75.590600000000000000
          Height = 22.677180000000000000
          DataField = #22995#21517
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.Strings = (
            '[frxDBDataset1."'#22995#21517'"]')
        end
        object Memo5: TfrxMemoView
          Left = 145.622140000000000000
          Top = 13.118120000000000000
          Width = 52.913420000000000000
          Height = 22.677165350000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = #23435#20307
          Font.Style = []
          Memo.Strings = (
            #22995' '#21517)
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 366.614410000000000000
          Top = 13.118120000000000000
          Width = 41.574830000000000000
          Height = 22.677165350000000000
          DataField = #24615#21035
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.Strings = (
            '[frxDBDataset1."'#24615#21035'"]')
        end
        object Memo7: TfrxMemoView
          Left = 302.362400000000000000
          Top = 13.118120000000000000
          Width = 52.913420000000000000
          Height = 22.677165350000000000
          Memo.Strings = (
            #24615' '#21035)
        end
        object Memo8: TfrxMemoView
          Left = 491.338900000000000000
          Top = 13.118120000000000000
          Width = 37.795300000000000000
          Height = 22.677165350000000000
          DataField = #24180#40836
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.Strings = (
            '[frxDBDataset1."'#24180#40836'"]')
        end
        object Memo9: TfrxMemoView
          Left = 427.086890000000000000
          Top = 13.118120000000000000
          Width = 52.913420000000000000
          Height = 22.677165350000000000
          Memo.Strings = (
            #24180' '#40836)
        end
        object Memo10: TfrxMemoView
          Left = 103.826840000000000000
          Top = 50.913420000000000000
          Width = 98.267718980000000000
          Height = 22.677165350000000000
          DataField = #25253#21517#26102#38388
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.Strings = (
            '[frxDBDataset1."'#25253#21517#26102#38388'"]')
        end
        object Memo11: TfrxMemoView
          Left = 11.338590000000000000
          Top = 50.913420000000000000
          Width = 83.149660000000000000
          Height = 22.677165350000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = #23435#20307
          Font.Style = []
          Memo.Strings = (
            #25253#21517#26102#38388)
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 309.921460000000000000
          Top = 50.913420000000000000
          Width = 158.740260000000000000
          Height = 22.677165350000000000
          DataField = #36523#20221#35777#21495
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.Strings = (
            '[frxDBDataset1."'#36523#20221#35777#21495'"]')
        end
        object Memo13: TfrxMemoView
          Left = 211.653680000000000000
          Top = 50.913420000000000000
          Width = 79.370130000000000000
          Height = 22.677165350000000000
          Memo.Strings = (
            #36523#20221#35777#21495)
        end
        object Memo14: TfrxMemoView
          Left = 105.826840000000000000
          Top = 127.283550000000000000
          Width = 487.559370000000000000
          Height = 22.677165350000000000
          DataField = #20303#22336#25110#21333#20301
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.Strings = (
            '[frxDBDataset1."'#20303#22336#25110#21333#20301'"]')
        end
        object Memo15: TfrxMemoView
          Left = 2.779530000000000000
          Top = 127.283550000000000000
          Width = 98.267780000000000000
          Height = 22.677165350000000000
          Memo.Strings = (
            #20303#22336#25110#21333#20301)
        end
        object Line1: TfrxLineView
          Left = 2.779530000000000000
          Width = 714.331170000000000000
          Frame.Typ = [ftTop]
        end
        object Line2: TfrxLineView
          Left = 1.779530000000000000
          Height = 793.700787401575000000
          Frame.Typ = [ftLeft]
        end
        object Line3: TfrxLineView
          Left = 716.551640000000000000
          Height = 793.701300000000000000
          Frame.Typ = [ftLeft]
        end
        object Line4: TfrxLineView
          Left = 3.779530000000000000
          Top = 41.574829999999990000
          Width = 593.386210000000000000
          Frame.Typ = [ftTop]
        end
        object Line5: TfrxLineView
          Left = 3.779530000000000000
          Top = 79.370129999999990000
          Width = 593.386210000000000000
          Frame.Typ = [ftTop]
        end
        object Line6: TfrxLineView
          Left = 2.779530000000000000
          Top = 117.165430000000000000
          Width = 593.385748660000000000
          Frame.Typ = [ftTop]
        end
        object Line7: TfrxLineView
          Left = 64.252010000000000000
          Height = 41.574803150000000000
          Frame.Typ = [ftLeft]
        end
        object Line8: TfrxLineView
          Left = 136.063080000000000000
          Height = 41.574830000000000000
          Frame.Typ = [ftLeft]
        end
        object Line9: TfrxLineView
          Left = 207.874150000000000000
          Height = 79.370130000000000000
          Frame.Typ = [ftLeft]
        end
        object Line10: TfrxLineView
          Left = 298.582870000000000000
          Height = 41.574830000000000000
          Frame.Typ = [ftLeft]
        end
        object Line13: TfrxLineView
          Left = 487.559370000000000000
          Height = 41.574803150000000000
          Frame.Typ = [ftLeft]
        end
        object Line14: TfrxLineView
          Left = 597.165740000000000000
          Height = 158.740260000000000000
          Frame.Typ = [ftLeft]
        end
        object Line15: TfrxLineView
          Left = 100.267780000000000000
          Top = 41.574829999999990000
          Height = 158.740260000000000000
          Frame.Typ = [ftLeft]
        end
        object Line11: TfrxLineView
          Left = 419.527830000000000000
          Height = 41.574830000000000000
          Frame.Typ = [ftLeft]
        end
        object Line12: TfrxLineView
          Left = 362.834880000000000000
          Height = 41.574830000000000000
          Frame.Typ = [ftLeft]
        end
        object Line16: TfrxLineView
          Left = 298.582870000000000000
          Top = 41.574829999999990000
          Height = 75.590600000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo16: TfrxMemoView
          Left = 105.826840000000000000
          Top = 90.708720000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          DataField = #32852#31995#30005#35805
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.Strings = (
            '[frxDBDataset1."'#32852#31995#30005#35805'"]')
        end
        object Memo17: TfrxMemoView
          Left = 11.338590000000000000
          Top = 90.708720000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #32852#31995#30005#35805)
        end
        object Memo18: TfrxMemoView
          Left = 370.393940000000000000
          Top = 86.929190000000010000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          DataField = #25163#26426
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.Strings = (
            '[frxDBDataset1."'#25163#26426'"]')
        end
        object Memo19: TfrxMemoView
          Left = 306.141930000000000000
          Top = 86.929190000000010000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #25163#26426)
        end
        object Line17: TfrxLineView
          Left = 1.779530000000000000
          Top = 158.740260000000000000
          Width = 714.331170000000000000
          Frame.Typ = [ftTop]
        end
        object Line18: TfrxLineView
          Left = 362.834880000000000000
          Top = 80.370129999999990000
          Height = 37.795275590000000000
          Frame.Typ = [ftLeft]
        end
        object Memo20: TfrxMemoView
          Left = 643.779943330000000000
          Top = 35.275613330000000000
          Width = 25.196866670000000000
          Height = 85.669346670000000000
          Memo.Strings = (
            #29031'      '#29255)
        end
        object Memo21: TfrxMemoView
          Left = 107.826840000000000000
          Top = 170.078850000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          DataField = #25345#39550#29031#31867#21035
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.Strings = (
            '[frxDBDataset1."'#25345#39550#29031#31867#21035'"]')
        end
        object Memo22: TfrxMemoView
          Left = 1.779530000000000000
          Top = 170.078850000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #25345#39550#29031#31867#21035)
        end
        object Memo23: TfrxMemoView
          Left = 308.023810000000000000
          Top = 170.078850000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          DataField = #21021#27425#39046#35777#26085#26399
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.Strings = (
            '[frxDBDataset1."'#21021#27425#39046#35777#26085#26399'"]')
        end
        object Memo24: TfrxMemoView
          Left = 158.740260000000000000
          Top = 170.078850000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #21021#27425#39046#35777#26085#26399)
        end
        object Memo25: TfrxMemoView
          Left = 515.897960000000000000
          Top = 170.078850000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          DataField = #39550#29031#21495#30721
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.Strings = (
            '[frxDBDataset1."'#39550#29031#21495#30721'"]')
        end
        object Memo26: TfrxMemoView
          Left = 421.409710000000000000
          Top = 170.078850000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #39550#29031#21495#30721)
        end
        object Line19: TfrxLineView
          Left = 2.000000000000000000
          Top = 200.315090000000000000
          Width = 714.331170000000000000
          Frame.Typ = [ftTop]
        end
        object Line20: TfrxLineView
          Left = 300.464750000000000000
          Top = 158.740260000000000000
          Height = 173.858380000000000000
          Frame.Typ = [ftLeft]
        end
        object Line21: TfrxLineView
          Left = 413.850650000000000000
          Top = 159.519790000000000000
          Height = 83.149660000000000000
          Frame.Typ = [ftLeft]
        end
        object Line22: TfrxLineView
          Left = 508.338900000000000000
          Top = 158.740260000000000000
          Height = 41.574830000000000000
          Frame.Typ = [ftLeft]
        end
        object Line23: TfrxLineView
          Left = 151.181200000000000000
          Top = 158.740260000000000000
          Height = 83.149660000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo27: TfrxMemoView
          Left = 158.740260000000000000
          Top = 211.653680000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          DataField = #25311#21150#36164#26684#35777#31181#31867
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.Strings = (
            '[frxDBDataset1."'#25311#21150#36164#26684#35777#31181#31867'"]')
        end
        object Memo28: TfrxMemoView
          Left = 7.559060000000000000
          Top = 211.653680000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #25311#21150#36164#26684#35777#31181#31867)
        end
        object Memo29: TfrxMemoView
          Left = 425.189240000000000000
          Top = 211.653680000000000000
          Width = 306.141930000000000000
          Height = 18.897650000000000000
          DataField = #21407#27605#19994#23398#26657
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.Strings = (
            '[frxDBDataset1."'#21407#27605#19994#23398#26657'"]')
        end
        object Memo30: TfrxMemoView
          Left = 308.023810000000000000
          Top = 211.653680000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #21407#27605#19994#23398#26657)
        end
        object Line24: TfrxLineView
          Left = 2.000000000000000000
          Top = 241.889920000000000000
          Width = 714.331170000000000000
          Frame.Typ = [ftTop]
        end
        object Memo31: TfrxMemoView
          Left = 117.165430000000000000
          Top = 257.008040000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          DataField = #32467#19994#35777#21495#30721
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.Strings = (
            '[frxDBDataset1."'#32467#19994#35777#21495#30721'"]')
        end
        object Memo32: TfrxMemoView
          Left = 7.559060000000000000
          Top = 257.008040000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #32467#19994#35777#21495#30721)
        end
        object Memo33: TfrxMemoView
          Left = 371.055350000000000000
          Top = 257.008040000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = #32564#36153
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.Strings = (
            '[frxDBDataset1."'#32564#36153'"]')
        end
        object Memo34: TfrxMemoView
          Left = 310.582870000000000000
          Top = 257.008040000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #32564#36153)
        end
        object Memo35: TfrxMemoView
          Left = 515.236550000000000000
          Top = 257.008040000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          DataField = #29702#35770
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.Strings = (
            '[frxDBDataset1."'#29702#35770'"]')
        end
        object Memo36: TfrxMemoView
          Left = 462.543600000000000000
          Top = 257.008040000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #29702#35770)
        end
        object Memo37: TfrxMemoView
          Left = 645.520100000000000000
          Top = 257.008040000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DataField = #25805#20316
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.Strings = (
            '[frxDBDataset1."'#25805#20316'"]')
        end
        object Memo38: TfrxMemoView
          Left = 590.606680000000000000
          Top = 257.008040000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #25805#20316)
        end
        object Line25: TfrxLineView
          Left = 109.606370000000000000
          Top = 241.889920000000000000
          Height = 90.708720000000000000
          Frame.Typ = [ftLeft]
        end
        object Line26: TfrxLineView
          Left = 2.000000000000000000
          Top = 287.244280000000000000
          Width = 714.331170000000000000
          Frame.Typ = [ftTop]
        end
        object Line27: TfrxLineView
          Left = 362.716760000000000000
          Top = 241.889920000000000000
          Height = 45.354360000000000000
          Frame.Typ = [ftLeft]
        end
        object Line28: TfrxLineView
          Left = 457.984540000000000000
          Top = 241.889920000000000000
          Height = 45.354360000000000000
          Frame.Typ = [ftLeft]
        end
        object Line29: TfrxLineView
          Left = 510.677490000000000000
          Top = 241.889920000000000000
          Height = 45.354360000000000000
          Frame.Typ = [ftLeft]
        end
        object Line30: TfrxLineView
          Left = 578.268090000000000000
          Top = 241.889920000000000000
          Height = 45.354360000000000000
          Frame.Typ = [ftLeft]
        end
        object Line31: TfrxLineView
          Left = 639.961040000000000000
          Top = 241.889920000000000000
          Height = 45.354360000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo39: TfrxMemoView
          Left = 117.165430000000000000
          Top = 302.362400000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          DataField = #36164#26684#35777#21495
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.Strings = (
            '[frxDBDataset1."'#36164#26684#35777#21495'"]')
        end
        object Memo40: TfrxMemoView
          Left = 7.559060000000000000
          Top = 302.362400000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #36164#26684#35777#21495)
        end
        object Line32: TfrxLineView
          Left = 2.000000000000000000
          Top = 332.598640000000000000
          Width = 714.331170000000000000
          Frame.Typ = [ftTop]
        end
        object Memo41: TfrxMemoView
          Left = 402.512060000000000000
          Top = 302.362400000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = #21457#35777#36884#24452
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.Strings = (
            '[frxDBDataset1."'#21457#35777#36884#24452'"]')
        end
        object Memo42: TfrxMemoView
          Left = 308.023810000000000000
          Top = 302.362400000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #21457#35777#36884#24452)
        end
        object Memo43: TfrxMemoView
          Left = 139.842610000000000000
          Top = 347.716760000000000000
          Width = 559.370440000000000000
          Height = 18.897650000000000000
          DataField = #19981#33021#21457#35777#21407#22240
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.Strings = (
            '[frxDBDataset1."'#19981#33021#21457#35777#21407#22240'"]')
        end
        object Memo44: TfrxMemoView
          Left = 7.559060000000000000
          Top = 347.716760000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #19981#33021#21457#35777#21407#22240)
        end
        object Line33: TfrxLineView
          Left = 2.000000000000000000
          Top = 377.953000000000000000
          Width = 714.331170000000000000
          Frame.Typ = [ftTop]
        end
        object Line34: TfrxLineView
          Left = 394.953000000000000000
          Top = 287.244280000000000000
          Height = 45.354360000000000000
          Frame.Typ = [ftLeft]
        end
        object Line35: TfrxLineView
          Left = 132.283550000000000000
          Top = 332.598640000000000000
          Height = 45.354360000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo45: TfrxMemoView
          Left = 102.047310000000000000
          Top = 393.071120000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DataField = #38656#21578#30693#20154
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.Strings = (
            '[frxDBDataset1."'#38656#21578#30693#20154'"]')
        end
        object Memo46: TfrxMemoView
          Left = 7.559060000000000000
          Top = 393.071120000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #38656#21578#30693#20154)
        end
        object Line36: TfrxLineView
          Left = 2.000000000000000000
          Top = 423.307360000000000000
          Width = 714.330708660000000000
          Frame.Typ = [ftTop]
        end
        object Memo47: TfrxMemoView
          Left = 313.700990000000000000
          Top = 393.071120000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          DataField = #38656#21578#30693#20154#30005#35805
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.Strings = (
            '[frxDBDataset1."'#38656#21578#30693#20154#30005#35805'"]')
        end
        object Memo48: TfrxMemoView
          Left = 181.417440000000000000
          Top = 393.071120000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #38656#21578#30693#20154#30005#35805)
        end
        object Memo49: TfrxMemoView
          Left = 578.268090000000000000
          Top = 393.071120000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          DataField = #38656#21578#30693#20154#25163#26426
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.Strings = (
            '[frxDBDataset1."'#38656#21578#30693#20154#25163#26426'"]')
        end
        object Memo50: TfrxMemoView
          Left = 438.425480000000000000
          Top = 393.071120000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #38656#21578#30693#20154#25163#26426)
        end
        object Line37: TfrxLineView
          Left = 94.488250000000000000
          Top = 377.953000000000000000
          Height = 45.354360000000000000
          Frame.Typ = [ftLeft]
        end
        object Line38: TfrxLineView
          Left = 173.858380000000000000
          Top = 377.953000000000000000
          Height = 45.354360000000000000
          Frame.Typ = [ftLeft]
        end
        object Line39: TfrxLineView
          Left = 306.141930000000000000
          Top = 377.953000000000000000
          Height = 45.354360000000000000
          Frame.Typ = [ftLeft]
        end
        object Line40: TfrxLineView
          Left = 427.086890000000000000
          Top = 377.953000000000000000
          Height = 45.354360000000000000
          Frame.Typ = [ftLeft]
        end
        object Line41: TfrxLineView
          Left = 563.149970000000000000
          Top = 377.953000000000000000
          Height = 45.354360000000000000
          Frame.Typ = [ftLeft]
        end
        object Line42: TfrxLineView
          Left = 56.692950000000000000
          Top = 423.307360000000000000
          Height = 370.393940000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo51: TfrxMemoView
          Left = 13.858276670000000000
          Top = 575.748403330000000000
          Width = 25.196866670000000000
          Height = 117.165430000000000000
          Memo.Strings = (
            #22791'          '#27880)
        end
        object Line43: TfrxLineView
          Left = 2.000000000000000000
          Top = 793.701299999999900000
          Width = 714.330708660000000000
          Frame.Typ = [ftTop]
        end
      end
      object PageFooter1: TfrxPageFooter
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -14
        Font.Name = #23435#20307
        Font.Style = []
        Height = 34.015770000000000000
        ParentFont = False
        Top = 1009.134510000000000000
        Width = 718.110700000000000000
        object Memo52: TfrxMemoView
          Left = 493.858586670000000000
          Top = 7.559060000000045000
          Width = 221.732426670000000000
          Height = 17.637806670000000000
          Memo.Strings = (
            #25171#21360#26085#26399#65306'[Now]')
        end
        object Memo54: TfrxMemoView
          Left = 7.559060000000000000
          Top = 7.559060000000045000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #24314#26723#20154#65306'[frxDBDataset1."'#24314#26723#20154'"]')
        end
        object Memo56: TfrxMemoView
          Left = 136.063080000000000000
          Top = 7.559060000000045000
          Width = 185.196970000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #24314#26723#26085#26399#65306'[frxDBDataset1."'#24314#26723#26085#26399'"]')
        end
      end
    end
  end
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Left = 568
    Top = 16
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    DataSource = DataSource2
    Left = 600
    Top = 16
  end
  object Table4: TTable
    Active = True
    DatabaseName = 'jx'
    TableName = #20174#19994#36164#26684#35777#22521#35757#26723#26696
    Left = 632
    Top = 16
  end
  object DataSource2: TDataSource
    DataSet = Table4
    Left = 664
    Top = 16
  end
end
