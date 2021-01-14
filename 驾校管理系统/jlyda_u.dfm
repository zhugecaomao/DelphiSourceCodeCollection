object jlyda: Tjlyda
  Left = 295
  Top = 120
  BorderStyle = bsSingle
  Caption = #25945#32451#21592#26723#26696
  ClientHeight = 546
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
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object Label10: TLabel
    Left = 264
    Top = 0
    Width = 145
    Height = 29
    Caption = #25945#32451#21592#26723#26696
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -29
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 32
    Width = 713
    Height = 513
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #24405#20837
      object GroupBox1: TGroupBox
        Left = 8
        Top = 8
        Width = 667
        Height = 161
        Caption = #22522#26412#20449#24687
        TabOrder = 0
        object Label1: TLabel
          Left = 12
          Top = 27
          Width = 36
          Height = 12
          Caption = #32534#21495#65306
          FocusControl = DBEdit1
        end
        object Label2: TLabel
          Left = 305
          Top = 27
          Width = 36
          Height = 12
          Caption = #24180#40836#65306
          FocusControl = DBEdit2
        end
        object Label3: TLabel
          Left = 377
          Top = 27
          Width = 60
          Height = 12
          Caption = #25345#29031#31867#21035#65306
        end
        object Label4: TLabel
          Left = 497
          Top = 27
          Width = 84
          Height = 12
          Caption = #39550#29031#26377#25928#26399#38480#65306
          FocusControl = DBEdit4
        end
        object Label5: TLabel
          Left = 172
          Top = 59
          Width = 84
          Height = 12
          Caption = #20934#25945#24320#22987#26085#26399#65306
          FocusControl = DBEdit5
        end
        object Label6: TLabel
          Left = 348
          Top = 59
          Width = 84
          Height = 12
          Caption = #20934#25945#25130#27490#26085#26399#65306
          FocusControl = DBEdit6
        end
        object Label7: TLabel
          Left = 12
          Top = 93
          Width = 60
          Height = 12
          Caption = #32852#31995#30005#35805#65306
          FocusControl = DBEdit7
        end
        object Label8: TLabel
          Left = 172
          Top = 93
          Width = 60
          Height = 12
          Caption = #36890#35759#22320#22336#65306
          FocusControl = DBEdit8
        end
        object Label11: TLabel
          Left = 20
          Top = 126
          Width = 48
          Height = 12
          Caption = #24314#26723#20154#65306
        end
        object Label12: TLabel
          Left = 144
          Top = 126
          Width = 60
          Height = 12
          Caption = #24314#26723#26085#26399#65306
        end
        object Label14: TLabel
          Left = 112
          Top = 28
          Width = 36
          Height = 12
          Caption = #22995#21517#65306
          FocusControl = DBEdit11
        end
        object Label15: TLabel
          Left = 221
          Top = 28
          Width = 36
          Height = 12
          Caption = #24615#21035#65306
        end
        object Label16: TLabel
          Left = 527
          Top = 60
          Width = 36
          Height = 12
          Caption = #25163#26426#65306
          FocusControl = DBEdit13
        end
        object Label17: TLabel
          Left = 13
          Top = 60
          Width = 60
          Height = 12
          Caption = #20934#25945#31867#21035#65306
        end
        object DBEdit1: TDBEdit
          Left = 44
          Top = 24
          Width = 49
          Height = 20
          DataField = #32534#21495
          DataSource = DataSource1
          Enabled = False
          TabOrder = 0
        end
        object DBEdit2: TDBEdit
          Left = 337
          Top = 24
          Width = 32
          Height = 20
          DataField = #24180#40836
          DataSource = DataSource1
          TabOrder = 1
        end
        object DBEdit4: TDBEdit
          Left = 577
          Top = 24
          Width = 65
          Height = 20
          DataField = #39550#29031#26377#25928#26399#38480
          DataSource = DataSource1
          MaxLength = 10
          TabOrder = 2
        end
        object DBEdit5: TDBEdit
          Left = 252
          Top = 56
          Width = 69
          Height = 20
          DataField = #20934#25945#24320#22987#26085#26399
          DataSource = DataSource1
          MaxLength = 10
          TabOrder = 3
        end
        object DBEdit6: TDBEdit
          Left = 428
          Top = 56
          Width = 69
          Height = 20
          DataField = #20934#25945#25130#27490#26085#26399
          DataSource = DataSource1
          MaxLength = 10
          TabOrder = 4
        end
        object DBEdit7: TDBEdit
          Left = 68
          Top = 90
          Width = 85
          Height = 20
          DataField = #32852#31995#30005#35805
          DataSource = DataSource1
          TabOrder = 5
        end
        object DBEdit8: TDBEdit
          Left = 232
          Top = 90
          Width = 425
          Height = 20
          DataField = #36890#35759#22320#22336
          DataSource = DataSource1
          TabOrder = 6
        end
        object DBEdit9: TDBEdit
          Left = 72
          Top = 123
          Width = 65
          Height = 20
          DataField = #24314#26723#20154
          DataSource = DataSource1
          Enabled = False
          TabOrder = 7
        end
        object DBEdit10: TDBEdit
          Left = 208
          Top = 123
          Width = 73
          Height = 20
          DataField = #24314#26723#26085#26399
          DataSource = DataSource1
          Enabled = False
          TabOrder = 8
        end
        object DBEdit11: TDBEdit
          Left = 144
          Top = 24
          Width = 65
          Height = 20
          DataField = #22995#21517
          DataSource = DataSource1
          TabOrder = 9
        end
        object DBEdit13: TDBEdit
          Left = 560
          Top = 56
          Width = 97
          Height = 20
          DataField = #25163#26426
          DataSource = DataSource1
          TabOrder = 10
        end
        object DBComboBox1: TDBComboBox
          Left = 256
          Top = 24
          Width = 41
          Height = 20
          DataField = #24615#21035
          DataSource = DataSource1
          ItemHeight = 12
          TabOrder = 11
          OnDropDown = DBComboBox1DropDown
        end
        object DBComboBox2: TDBComboBox
          Left = 432
          Top = 24
          Width = 49
          Height = 20
          DataField = #25345#29031#31867#21035
          DataSource = DataSource1
          ItemHeight = 12
          TabOrder = 12
          OnDropDown = DBComboBox2DropDown
        end
        object DateTimePicker1: TDateTimePicker
          Left = 640
          Top = 24
          Width = 21
          Height = 20
          Date = 38337.684806481480000000
          Time = 38337.684806481480000000
          TabOrder = 13
          OnChange = DateTimePicker1Change
        end
        object DateTimePicker2: TDateTimePicker
          Left = 320
          Top = 56
          Width = 21
          Height = 20
          Date = 38337.684806481480000000
          Time = 38337.684806481480000000
          TabOrder = 14
          OnChange = DateTimePicker2Change
        end
        object DateTimePicker3: TDateTimePicker
          Left = 496
          Top = 56
          Width = 21
          Height = 20
          Date = 38337.684806481480000000
          Time = 38337.684806481480000000
          TabOrder = 15
          OnChange = DateTimePicker3Change
        end
        object DBComboBox3: TDBComboBox
          Left = 72
          Top = 56
          Width = 89
          Height = 20
          DataField = #20934#25945#31867#21035
          DataSource = DataSource1
          ItemHeight = 12
          TabOrder = 16
          OnDropDown = DBComboBox3DropDown
        end
      end
      object GroupBox2: TGroupBox
        Left = 8
        Top = 176
        Width = 667
        Height = 113
        Caption = #22791#27880#20449#24687
        TabOrder = 1
        object Label9: TLabel
          Left = 12
          Top = 53
          Width = 36
          Height = 12
          Caption = #22791#27880#65306
          FocusControl = DBMemo1
        end
        object DBMemo1: TDBMemo
          Left = 54
          Top = 23
          Width = 601
          Height = 74
          Color = clSkyBlue
          DataField = #22791#27880
          DataSource = DataSource1
          ScrollBars = ssBoth
          TabOrder = 0
        end
      end
      object Panel1: TPanel
        Left = 8
        Top = 300
        Width = 667
        Height = 41
        BevelInner = bvLowered
        BevelOuter = bvNone
        TabOrder = 2
        object Label13: TLabel
          Left = 223
          Top = 15
          Width = 60
          Height = 12
          Caption = #26597#35810#26465#20214#65306
        end
        object DBNavigator1: TDBNavigator
          Left = 7
          Top = 8
          Width = 210
          Height = 25
          DataSource = DataSource1
          TabOrder = 0
        end
        object BitBtn1: TBitBtn
          Left = 574
          Top = 9
          Width = 45
          Height = 25
          Caption = #25171#21360
          TabOrder = 1
          OnClick = BitBtn1Click
        end
        object BitBtn2: TBitBtn
          Left = 619
          Top = 9
          Width = 45
          Height = 25
          Caption = #36864#20986
          TabOrder = 2
          OnClick = BitBtn2Click
        end
        object BitBtn3: TBitBtn
          Left = 513
          Top = 9
          Width = 60
          Height = 25
          Caption = #23548#20986'EXCEL'
          TabOrder = 3
          OnClick = BitBtn3Click
        end
        object ComboBox1: TComboBox
          Left = 279
          Top = 11
          Width = 81
          Height = 20
          ItemHeight = 12
          TabOrder = 4
          Items.Strings = (
            #32534#21495
            #22995#21517
            #24615#21035
            #25345#29031#31867#21035
            #39550#29031#26377#25928#26399#38480
            #20934#25945#24320#22987#26085#26399
            #20934#25945#25130#27490#26085#26399
            #32852#31995#30005#35805
            #24314#26723#20154
            #24314#26723#26085#26399)
        end
        object Edit1: TEdit
          Left = 399
          Top = 11
          Width = 65
          Height = 20
          TabOrder = 5
        end
        object BitBtn4: TBitBtn
          Left = 472
          Top = 9
          Width = 41
          Height = 25
          Caption = #26597#35810
          TabOrder = 6
          OnClick = BitBtn4Click
        end
        object ComboBox2: TComboBox
          Left = 360
          Top = 11
          Width = 37
          Height = 20
          ItemHeight = 12
          TabOrder = 7
          Items.Strings = (
            '='
            '>='
            '<='
            '<>')
        end
      end
      object DBGridEh1: TDBGridEh
        Left = 8
        Top = 349
        Width = 673
        Height = 137
        FooterColor = clWindow
        FooterFont.Charset = ANSI_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -12
        FooterFont.Name = #23435#20307
        FooterFont.Style = []
        TabOrder = 3
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
      end
    end
    object TabSheet2: TTabSheet
      Caption = #26597#35810
      ImageIndex = 1
    end
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 48
  end
  object Table1: TTable
    Active = True
    BeforeInsert = Table1BeforeInsert
    AfterInsert = Table1AfterInsert
    AfterPost = Table1AfterPost
    AfterCancel = Table1AfterCancel
    BeforeRefresh = Table1BeforeRefresh
    DatabaseName = 'jx'
    FieldDefs = <
      item
        Name = #32534#21495
        DataType = ftString
        Size = 6
      end
      item
        Name = #22995#21517
        DataType = ftString
        Size = 10
      end
      item
        Name = #24615#21035
        DataType = ftString
        Size = 5
      end
      item
        Name = #24180#40836
        DataType = ftSmallint
      end
      item
        Name = #25345#29031#31867#21035
        DataType = ftString
        Size = 5
      end
      item
        Name = #39550#29031#26377#25928#26399#38480
        DataType = ftDateTime
      end
      item
        Name = #20934#25945#31867#21035
        DataType = ftString
        Size = 15
      end
      item
        Name = #20934#25945#24320#22987#26085#26399
        DataType = ftDateTime
      end
      item
        Name = #20934#25945#25130#27490#26085#26399
        DataType = ftDateTime
      end
      item
        Name = #25163#26426
        DataType = ftString
        Size = 13
      end
      item
        Name = #32852#31995#30005#35805
        DataType = ftString
        Size = 13
      end
      item
        Name = #36890#35759#22320#22336
        DataType = ftString
        Size = 50
      end
      item
        Name = #22791#27880
        DataType = ftMemo
        Size = 1
      end
      item
        Name = #24314#26723#20154
        DataType = ftString
        Size = 10
      end
      item
        Name = #24314#26723#26085#26399
        DataType = ftDateTime
      end>
    IndexDefs = <
      item
        Name = 'PrimaryKey'
        Fields = #32534#21495
        Options = [ixUnique]
      end>
    StoreDefs = True
    TableName = #25945#32451#21592#26723#26696
    Left = 80
    object Table1BDEDesigner: TStringField
      FieldName = #32534#21495
      Size = 6
    end
    object Table1BDEDesigner12: TStringField
      FieldName = #22995#21517
      Size = 10
    end
    object Table1BDEDesigner13: TStringField
      FieldName = #24615#21035
      Size = 5
    end
    object Table1BDEDesigner2: TSmallintField
      FieldName = #24180#40836
    end
    object Table1BDEDesigner3: TStringField
      FieldName = #25345#29031#31867#21035
      Size = 5
    end
    object Table1BDEDesigner4: TDateTimeField
      FieldName = #39550#29031#26377#25928#26399#38480
      EditMask = '0000\-00\-00;1;_'
    end
    object Table1BDEDesigner15: TStringField
      FieldName = #20934#25945#31867#21035
      Size = 15
    end
    object Table1BDEDesigner5: TDateTimeField
      FieldName = #20934#25945#24320#22987#26085#26399
      EditMask = '0000\-00\-00;1;_'
    end
    object Table1BDEDesigner6: TDateTimeField
      FieldName = #20934#25945#25130#27490#26085#26399
      EditMask = '0000\-00\-00;1;_'
    end
    object Table1BDEDesigner14: TStringField
      FieldName = #25163#26426
      Size = 13
    end
    object Table1BDEDesigner7: TStringField
      FieldName = #32852#31995#30005#35805
      Size = 13
    end
    object Table1BDEDesigner8: TStringField
      FieldName = #36890#35759#22320#22336
      Size = 50
    end
    object Table1BDEDesigner9: TMemoField
      FieldName = #22791#27880
      BlobType = ftMemo
      Size = 1
    end
    object Table1BDEDesigner10: TStringField
      FieldName = #24314#26723#20154
      Size = 10
    end
    object Table1BDEDesigner11: TDateTimeField
      FieldName = #24314#26723#26085#26399
    end
  end
  object Database1: TDatabase
    AliasName = 'jx'
    Connected = True
    DatabaseName = 'jx'
    LoginPrompt = False
    SessionName = 'Default'
    Left = 16
  end
  object Table2: TTable
    Active = True
    DatabaseName = 'jx'
    TableName = #21442#25968#35774#32622
    Left = 112
  end
  object Table3: TTable
    Active = True
    DatabaseName = 'jx'
    TableName = #35745#25968#22120
    Left = 144
    object Table3jlyda: TIntegerField
      FieldName = 'jlyda'
    end
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
      #25945#32451#21592#26723#26696)
    PageHeader.Font.Charset = ANSI_CHARSET
    PageHeader.Font.Color = clWindowText
    PageHeader.Font.Height = -29
    PageHeader.Font.Name = #23435#20307
    PageHeader.Font.Style = []
    Units = MM
    Left = 72
    Top = 488
  end
end
