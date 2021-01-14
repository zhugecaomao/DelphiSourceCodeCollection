object gzgl: Tgzgl
  Left = 271
  Top = 153
  BorderStyle = bsSingle
  Caption = #24037#36164#31649#29702
  ClientHeight = 509
  ClientWidth = 729
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
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object Label21: TLabel
    Left = 304
    Top = 8
    Width = 100
    Height = 32
    Caption = #24037'  '#36164
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 40
    Width = 729
    Height = 473
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #24405#20837
      object GroupBox1: TGroupBox
        Left = 8
        Top = 16
        Width = 705
        Height = 153
        Caption = #24037#36164
        TabOrder = 0
        object Label2: TLabel
          Left = 168
          Top = 28
          Width = 60
          Height = 12
          Caption = #32844'    '#21153#65306
        end
        object Label1: TLabel
          Left = 32
          Top = 28
          Width = 36
          Height = 12
          Caption = #22995#21517#65306
        end
        object Label3: TLabel
          Left = 304
          Top = 28
          Width = 60
          Height = 12
          Caption = #22522#26412#24037#36164#65306
          FocusControl = DBEdit3
        end
        object Label4: TLabel
          Left = 440
          Top = 28
          Width = 60
          Height = 12
          Caption = #35757#32451#24037#36164#65306
          FocusControl = DBEdit4
        end
        object Label5: TLabel
          Left = 576
          Top = 28
          Width = 60
          Height = 12
          Caption = #22870#21169#24037#36164#65306
          FocusControl = DBEdit5
        end
        object Label6: TLabel
          Left = 32
          Top = 60
          Width = 60
          Height = 12
          Caption = #34917#20241#24037#36164#65306
          FocusControl = DBEdit6
        end
        object Label7: TLabel
          Left = 168
          Top = 60
          Width = 60
          Height = 12
          Caption = #21152#29677#24037#36164#65306
          FocusControl = DBEdit7
        end
        object Label8: TLabel
          Left = 304
          Top = 60
          Width = 54
          Height = 12
          Caption = #36807#33410#36153' '#65306
          FocusControl = DBEdit8
        end
        object Label9: TLabel
          Left = 440
          Top = 60
          Width = 54
          Height = 12
          Caption = #20511'   '#27454#65306
          FocusControl = DBEdit9
        end
        object Label10: TLabel
          Left = 576
          Top = 60
          Width = 60
          Height = 12
          Caption = #20107#25925#25187#38500#65306
          FocusControl = DBEdit10
        end
        object Label11: TLabel
          Left = 32
          Top = 92
          Width = 60
          Height = 12
          Caption = #25928#26524#25187#38500#65306
          FocusControl = DBEdit11
        end
        object Label12: TLabel
          Left = 168
          Top = 92
          Width = 60
          Height = 12
          Caption = #20241#20551#25187#38500#65306
          FocusControl = DBEdit12
        end
        object Label13: TLabel
          Left = 304
          Top = 92
          Width = 60
          Height = 12
          Caption = #39118#38505#25187#38500#65306
          FocusControl = DBEdit13
        end
        object Label14: TLabel
          Left = 440
          Top = 92
          Width = 60
          Height = 12
          Caption = #20854#23427#25187#38500#65306
          FocusControl = DBEdit14
        end
        object SpeedButton1: TSpeedButton
          Left = 128
          Top = 24
          Width = 23
          Height = 22
          Caption = '...'
          OnClick = SpeedButton1Click
        end
        object DBEdit3: TDBEdit
          Left = 360
          Top = 24
          Width = 65
          Height = 20
          DataField = #22522#26412#24037#36164
          DataSource = DataSource2
          TabOrder = 0
        end
        object DBEdit4: TDBEdit
          Left = 496
          Top = 24
          Width = 65
          Height = 20
          DataField = #35757#32451#24037#36164
          DataSource = DataSource2
          TabOrder = 1
        end
        object DBEdit5: TDBEdit
          Left = 632
          Top = 24
          Width = 65
          Height = 20
          DataField = #22870#21169#24037#36164
          DataSource = DataSource2
          TabOrder = 2
        end
        object DBEdit6: TDBEdit
          Left = 88
          Top = 56
          Width = 65
          Height = 20
          DataField = #34917#20241#24037#36164
          DataSource = DataSource2
          TabOrder = 3
        end
        object DBEdit7: TDBEdit
          Left = 224
          Top = 56
          Width = 65
          Height = 20
          DataField = #21152#29677#24037#36164
          DataSource = DataSource2
          TabOrder = 4
        end
        object DBEdit8: TDBEdit
          Left = 360
          Top = 56
          Width = 65
          Height = 20
          DataField = #36807#33410#36153
          DataSource = DataSource2
          TabOrder = 5
        end
        object DBEdit9: TDBEdit
          Left = 496
          Top = 56
          Width = 65
          Height = 20
          DataField = #20511#27454
          DataSource = DataSource2
          TabOrder = 6
        end
        object DBEdit10: TDBEdit
          Left = 632
          Top = 56
          Width = 65
          Height = 20
          DataField = #20107#25925#25187#38500
          DataSource = DataSource2
          TabOrder = 7
        end
        object DBEdit11: TDBEdit
          Left = 88
          Top = 88
          Width = 65
          Height = 20
          DataField = #25928#26524#25187#38500
          DataSource = DataSource2
          TabOrder = 8
        end
        object DBEdit12: TDBEdit
          Left = 224
          Top = 88
          Width = 65
          Height = 20
          DataField = #20241#20551#25187#38500
          DataSource = DataSource2
          TabOrder = 9
        end
        object DBEdit13: TDBEdit
          Left = 360
          Top = 88
          Width = 65
          Height = 20
          DataField = #39118#38505#25187#38500
          DataSource = DataSource2
          TabOrder = 10
        end
        object DBEdit14: TDBEdit
          Left = 496
          Top = 88
          Width = 65
          Height = 20
          DataField = #20854#23427#25187#38500
          DataSource = DataSource2
          TabOrder = 11
        end
        object Edit3: TEdit
          Left = 224
          Top = 24
          Width = 65
          Height = 20
          Enabled = False
          TabOrder = 12
        end
        object Edit2: TEdit
          Left = 64
          Top = 24
          Width = 57
          Height = 20
          TabOrder = 13
          OnExit = Edit2Exit
          OnKeyPress = Edit2KeyPress
        end
      end
      object Panel1: TPanel
        Left = 8
        Top = 224
        Width = 705
        Height = 41
        BevelInner = bvLowered
        TabOrder = 1
        object Label17: TLabel
          Left = 256
          Top = 16
          Width = 60
          Height = 12
          Caption = #26597#35810#26465#20214#65306
        end
        object DBNavigator1: TDBNavigator
          Left = 8
          Top = 8
          Width = 240
          Height = 25
          DataSource = DataSource2
          TabOrder = 0
        end
        object ComboBox1: TComboBox
          Left = 313
          Top = 10
          Width = 73
          Height = 20
          ItemHeight = 12
          TabOrder = 1
          Items.Strings = (
            #22995#21517
            #32844#21153
            #22522#26412#24037#36164
            #24314#26723#20154
            #24314#26723#26085#26399)
        end
        object ComboBox2: TComboBox
          Left = 385
          Top = 10
          Width = 41
          Height = 20
          ItemHeight = 12
          TabOrder = 2
          Items.Strings = (
            '='
            '>='
            '<='
            '<>')
        end
        object Edit1: TEdit
          Left = 433
          Top = 10
          Width = 73
          Height = 20
          TabOrder = 3
        end
        object BitBtn1: TBitBtn
          Left = 552
          Top = 8
          Width = 65
          Height = 25
          Caption = #23548#20986'Excel'
          TabOrder = 4
        end
        object BitBtn2: TBitBtn
          Left = 616
          Top = 8
          Width = 41
          Height = 25
          Caption = #25171#21360
          TabOrder = 5
          OnClick = BitBtn2Click
        end
        object BitBtn3: TBitBtn
          Left = 656
          Top = 8
          Width = 41
          Height = 25
          Caption = #36864#20986
          TabOrder = 6
          OnClick = BitBtn3Click
        end
        object BitBtn4: TBitBtn
          Left = 512
          Top = 8
          Width = 41
          Height = 25
          Caption = #26597#35810
          TabOrder = 7
        end
      end
      object DBGrid1: TDBGrid
        Left = 8
        Top = 272
        Width = 705
        Height = 161
        TabOrder = 2
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = #32534#21495
            Visible = True
          end
          item
            ButtonStyle = cbsEllipsis
            Expanded = False
            FieldName = #22995#21517
            Visible = True
          end
          item
            Expanded = False
            FieldName = #32844#21153
            Visible = True
          end>
      end
      object GroupBox2: TGroupBox
        Left = 8
        Top = 176
        Width = 705
        Height = 41
        Caption = #21512#35745
        TabOrder = 3
        object Label18: TLabel
          Left = 16
          Top = 18
          Width = 60
          Height = 12
          Caption = #24212#21457#21512#35745#65306
          FocusControl = DBEdit1
        end
        object Label19: TLabel
          Left = 152
          Top = 18
          Width = 60
          Height = 12
          Caption = #24212#25187#21512#35745#65306
          FocusControl = DBEdit2
        end
        object Label20: TLabel
          Left = 288
          Top = 18
          Width = 60
          Height = 12
          Caption = #23454#21457#24037#36164#65306
          FocusControl = DBEdit17
        end
        object Label15: TLabel
          Left = 454
          Top = 17
          Width = 48
          Height = 12
          Caption = #24314#26723#20154#65306
          FocusControl = DBEdit15
        end
        object Label16: TLabel
          Left = 574
          Top = 17
          Width = 60
          Height = 12
          Caption = #24314#26723#26085#26399#65306
          FocusControl = DBEdit16
        end
        object DBEdit1: TDBEdit
          Left = 71
          Top = 13
          Width = 66
          Height = 20
          DataField = #24212#21457#21512#35745
          DataSource = DataSource2
          Enabled = False
          TabOrder = 0
        end
        object DBEdit2: TDBEdit
          Left = 207
          Top = 13
          Width = 66
          Height = 20
          DataField = #24212#25187#21512#35745
          DataSource = DataSource2
          Enabled = False
          TabOrder = 1
        end
        object DBEdit17: TDBEdit
          Left = 343
          Top = 13
          Width = 66
          Height = 20
          DataField = #23454#21457#24037#36164
          DataSource = DataSource2
          Enabled = False
          TabOrder = 2
        end
        object DBEdit15: TDBEdit
          Left = 504
          Top = 13
          Width = 57
          Height = 20
          DataField = #24314#26723#20154
          DataSource = DataSource2
          Enabled = False
          TabOrder = 3
        end
        object DBEdit16: TDBEdit
          Left = 632
          Top = 13
          Width = 65
          Height = 20
          DataField = #24314#26723#26085#26399
          DataSource = DataSource2
          Enabled = False
          TabOrder = 4
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #26597#35810
      ImageIndex = 1
    end
  end
  object DataSource1: TDataSource
    AutoEdit = False
    DataSet = Table1
  end
  object Database1: TDatabase
    AliasName = 'jx'
    Connected = True
    DatabaseName = 'jx'
    LoginPrompt = False
    SessionName = 'Default'
    Left = 64
  end
  object Table1: TTable
    Active = True
    DatabaseName = 'jx'
    TableName = #32844#24037#26723#26696
    Left = 32
    object Table1BDEDesigner: TStringField
      FieldName = #32534#21495
      Size = 50
    end
    object Table1BDEDesigner2: TStringField
      FieldName = #22995#21517
      Size = 8
    end
    object Table1BDEDesigner3: TStringField
      FieldName = #32844#21153
      Size = 10
    end
  end
  object Table2: TTable
    AfterInsert = Table2AfterInsert
    BeforePost = Table2BeforePost
    AfterScroll = Table2AfterScroll
    DatabaseName = 'jx'
    TableName = #24037#36164#31995#32479
    Left = 128
    object Table2BDEDesigner: TStringField
      FieldName = #32534#21495
      Size = 6
    end
    object Table2BDEDesigner3: TFloatField
      FieldName = #22522#26412#24037#36164
      currency = True
    end
    object Table2BDEDesigner4: TFloatField
      FieldName = #35757#32451#24037#36164
      currency = True
    end
    object Table2BDEDesigner5: TFloatField
      AutoGenerateValue = arDefault
      FieldName = #22870#21169#24037#36164
      currency = True
    end
    object Table2BDEDesigner6: TFloatField
      FieldName = #34917#20241#24037#36164
      currency = True
    end
    object Table2BDEDesigner7: TFloatField
      FieldName = #21152#29677#24037#36164
      currency = True
    end
    object Table2BDEDesigner8: TFloatField
      FieldName = #36807#33410#36153
      currency = True
    end
    object Table2BDEDesigner16: TFloatField
      FieldName = #24212#21457#21512#35745
    end
    object Table2BDEDesigner9: TFloatField
      FieldName = #20511#27454
      currency = True
    end
    object Table2BDEDesigner10: TFloatField
      FieldName = #20107#25925#25187#38500
      currency = True
    end
    object Table2BDEDesigner11: TFloatField
      FieldName = #25928#26524#25187#38500
      currency = True
    end
    object Table2BDEDesigner12: TFloatField
      FieldName = #20241#20551#25187#38500
      currency = True
    end
    object Table2BDEDesigner13: TFloatField
      FieldName = #39118#38505#25187#38500
      currency = True
    end
    object Table2BDEDesigner14: TFloatField
      FieldName = #20854#23427#25187#38500
      currency = True
    end
    object Table2BDEDesigner15: TFloatField
      FieldName = #24212#25187#21512#35745
    end
    object Table2BDEDesigner2: TFloatField
      FieldName = #23454#21457#24037#36164
    end
    object Table2BDEDesigner17: TStringField
      FieldName = #31614#21517
      Size = 8
    end
    object Table2BDEDesigner18: TStringField
      FieldName = #24314#26723#20154
      Size = 8
    end
    object Table2BDEDesigner19: TDateTimeField
      FieldName = #24314#26723#26085#26399
    end
  end
  object DataSource2: TDataSource
    DataSet = Table2
    Left = 96
  end
  object Query1: TQuery
    Active = True
    DatabaseName = 'jx'
    SQL.Strings = (
      
        'SELECT '#32844#24037#26723#26696'.'#22995#21517', '#32844#24037#26723#26696'.'#32844#21153', '#24037#36164#31995#32479'.'#22522#26412#24037#36164', '#24037#36164#31995#32479'.'#35757#32451#24037#36164', '#24037#36164#31995#32479'.'#22870#21169#24037#36164', '#24037#36164#31995#32479'.'#34917 +
        #20241#24037#36164', '#24037#36164#31995#32479'.'#21152#29677#24037#36164', '#24037#36164#31995#32479'.'#36807#33410#36153', '#24037#36164#31995#32479'.'#24212#21457#21512#35745', '#24037#36164#31995#32479'.'#20511#27454', '#24037#36164#31995#32479'.'#20107#25925#25187#38500', '#24037#36164#31995#32479'.'#25928#26524 +
        #25187#38500', '#24037#36164#31995#32479'.'#20241#20551#25187#38500', '#24037#36164#31995#32479'.'#39118#38505#25187#38500', '#24037#36164#31995#32479'.'#20854#23427#25187#38500', '#24037#36164#31995#32479'.'#24212#25187#21512#35745', '#24037#36164#31995#32479'.'#23454#21457#24037#36164', '#24037#36164#31995#32479'.' +
        #31614#21517', '#24037#36164#31995#32479'.'#24314#26723#20154', '#24037#36164#31995#32479'.'#24314#26723#26085#26399
      'FROM '#32844#24037#26723#26696' '#32844#24037#26723#26696', '#24037#36164#31995#32479' '#24037#36164#31995#32479
      'WHERE  ('#32844#24037#26723#26696'.'#32534#21495' = '#24037#36164#31995#32479'.'#32534#21495')  ')
    Left = 488
    Top = 8
  end
  object frxReport1: TfrxReport
    DataSet = frxDBDataset1
    DataSetName = 'frxDBDataset1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38485.905515405100000000
    ReportOptions.LastChange = 38485.975875104200000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 520
    Top = 8
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object DetailData1: TfrxDetailData
        Height = 113.385900000000000000
        Top = 45.354360000000000000
        Width = 1046.929810000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Memo2: TfrxMemoView
          Left = 117.165430000000000000
          Top = 71.811070000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = #22522#26412#24037#36164
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."'#22522#26412#24037#36164'"]')
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 117.165430000000000000
          Top = 52.913420000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #22522#26412#24037#36164)
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 177.637910000000000000
          Top = 71.811070000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = #35757#32451#24037#36164
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."'#35757#32451#24037#36164'"]')
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 177.637910000000000000
          Top = 52.913420000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #35757#32451#24037#36164)
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 238.110390000000000000
          Top = 71.811070000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = #22870#21169#24037#36164
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."'#22870#21169#24037#36164'"]')
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 238.110390000000000000
          Top = 52.913420000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #22870#21169#24037#36164)
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 298.582870000000000000
          Top = 71.811070000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = #34917#20241#24037#36164
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."'#34917#20241#24037#36164'"]')
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 298.582870000000000000
          Top = 52.913420000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #34917#20241#24037#36164)
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 359.055350000000000000
          Top = 71.811070000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = #21152#29677#24037#36164
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."'#21152#29677#24037#36164'"]')
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 359.055350000000000000
          Top = 52.913420000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #21152#29677#24037#36164)
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 419.527830000000000000
          Top = 71.811070000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."'#36807#33410#36153'"]')
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 419.527830000000000000
          Top = 52.913420000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #36807#33410#36153)
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 540.472790000000000000
          Top = 71.811070000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = #20511#27454
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."'#20511#27454'"]')
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 540.472790000000000000
          Top = 52.913420000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #20511'  '#27454)
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 600.945270000000000000
          Top = 71.811070000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = #20107#25925#25187#38500
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."'#20107#25925#25187#38500'"]')
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 600.945270000000000000
          Top = 52.913420000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #20107#25925#25187#38500)
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 661.417750000000000000
          Top = 71.811070000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = #25928#26524#25187#38500
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."'#25928#26524#25187#38500'"]')
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 661.417750000000000000
          Top = 52.913420000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #25928#26524#25187#38500)
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 721.890230000000000000
          Top = 71.811070000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = #20241#20551#25187#38500
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."'#20241#20551#25187#38500'"]')
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 721.890230000000000000
          Top = 52.913420000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #20241#20551#25187#38500)
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 782.362710000000000000
          Top = 71.811070000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = #39118#38505#25187#38500
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."'#39118#38505#25187#38500'"]')
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 782.362710000000000000
          Top = 52.913420000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #39118#38505#25187#38500)
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Top = 71.811070000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DataField = #22995#21517
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."'#22995#21517'"]')
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Top = 52.913420000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #22995#21517)
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 64.252010000000000000
          Top = 71.811070000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          DataField = #32844#21153
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."'#32844#21153'"]')
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 64.252010000000000000
          Top = 52.913420000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #32844#21153)
          VAlign = vaCenter
        end
        object Line2: TfrxLineView
          Top = 26.456710000000000000
          Width = 1024.252630000000000000
          Frame.Typ = [ftTop]
        end
        object Memo28: TfrxMemoView
          Left = 480.000310000000000000
          Top = 71.811070000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."'#24212#21457#21512#35745'"]')
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 480.000310000000000000
          Top = 52.913420000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #24212#21457#21512#35745)
          VAlign = vaCenter
        end
        object Line3: TfrxLineView
          Left = 540.472790000000000000
          Top = 26.456710000000000000
          Height = 64.251968500000000000
          Frame.Typ = [ftLeft]
        end
        object Line4: TfrxLineView
          Left = 117.165430000000000000
          Top = 26.456710000000000000
          Height = 64.252010000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo30: TfrxMemoView
          Left = 842.835190000000000000
          Top = 71.811070000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = #20854#23427#25187#38500
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."'#20854#23427#25187#38500'"]')
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 842.835190000000000000
          Top = 52.913420000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #20854#23427#25187#38500)
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 903.307670000000000000
          Top = 71.811070000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = #24212#25187#21512#35745
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."'#24212#25187#21512#35745'"]')
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 903.307670000000000000
          Top = 52.913420000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #24212#25187#21512#35745)
          VAlign = vaCenter
        end
        object Line7: TfrxLineView
          Left = 963.780150000000000000
          Top = 26.456710000000000000
          Height = 64.252010000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo34: TfrxMemoView
          Left = 963.780150000000000000
          Top = 71.811070000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = #23454#21457#24037#36164
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            '[frxDBDataset1."'#23454#21457#24037#36164'"]')
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 963.780150000000000000
          Top = 52.913420000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.Strings = (
            #23454#21457#24037#36164)
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          Left = 302.362400000000000000
          Top = 26.456710000000000000
          Width = 41.574830000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.Strings = (
            #24212'   '#21457)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Left = 740.787880000000000000
          Top = 30.236239999999990000
          Width = 45.354360000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            #24212'   '#25187)
          ParentFont = False
        end
        object Line1: TfrxLineView
          Left = 1024.252630000000000000
          Top = 26.456710000000000000
          Height = 26.456710000000000000
          Frame.Typ = [ftLeft]
        end
        object Line5: TfrxLineView
          Top = 26.456710000000000000
          Height = 26.456710000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo1: TfrxMemoView
          Left = 434.645950000000000000
          Top = 3.779530000000001000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.Strings = (
            #24037#36164#26465)
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 3.779530000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        RowCount = 1
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    DataSet = Query1
    Left = 552
    Top = 8
  end
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Left = 584
    Top = 8
  end
end
