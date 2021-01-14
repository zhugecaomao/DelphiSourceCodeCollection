object jlcqktjb: Tjlcqktjb
  Left = 274
  Top = 139
  Width = 699
  Height = 559
  Caption = #25945#35757#36710#24773#20917#32479#35745#34920
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
  object Label15: TLabel
    Left = 248
    Top = 0
    Width = 232
    Height = 29
    Caption = #25945#32451#36710#24773#20917#32479#35745#34920
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
    Width = 689
    Height = 497
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #24405#20837
      object GroupBox1: TGroupBox
        Left = 8
        Top = 0
        Width = 665
        Height = 129
        Caption = #22522#26412#20449#24687
        TabOrder = 0
        object Label1: TLabel
          Left = 16
          Top = 24
          Width = 36
          Height = 12
          Caption = #32534#21495#65306
          FocusControl = DBEdit1
        end
        object Label2: TLabel
          Left = 112
          Top = 24
          Width = 36
          Height = 12
          Caption = #36710#21495#65306
          FocusControl = DBEdit2
        end
        object Label3: TLabel
          Left = 224
          Top = 24
          Width = 36
          Height = 12
          Caption = #23398#21495#65306
          FocusControl = DBEdit3
        end
        object Label4: TLabel
          Left = 336
          Top = 24
          Width = 60
          Height = 12
          Caption = #21457#21160#26426#21495#65306
          FocusControl = DBEdit4
        end
        object Label5: TLabel
          Left = 520
          Top = 24
          Width = 48
          Height = 12
          Caption = #36710#26550#21495#65306
          FocusControl = DBEdit5
        end
        object Label6: TLabel
          Left = 16
          Top = 56
          Width = 60
          Height = 12
          Caption = #20837#25143#26085#26399#65306
          FocusControl = DBEdit6
        end
        object Label7: TLabel
          Left = 168
          Top = 56
          Width = 60
          Height = 12
          Caption = #20445#38505#26085#26399#65306
          FocusControl = DBEdit7
        end
        object Label8: TLabel
          Left = 320
          Top = 56
          Width = 72
          Height = 12
          Caption = #20859#36335#36153#26085#26399#65306
          FocusControl = DBEdit8
        end
        object Label9: TLabel
          Left = 488
          Top = 56
          Width = 72
          Height = 12
          Caption = #36890#34892#35777#26085#26399#65306
          FocusControl = DBEdit9
        end
        object Label10: TLabel
          Left = 16
          Top = 88
          Width = 36
          Height = 12
          Caption = #29992#36884#65306
        end
        object Label12: TLabel
          Left = 168
          Top = 88
          Width = 48
          Height = 12
          Caption = #24314#26723#20154#65306
          FocusControl = DBEdit11
        end
        object Label13: TLabel
          Left = 288
          Top = 88
          Width = 60
          Height = 12
          Caption = #24314#26723#26085#26399#65306
          FocusControl = DBEdit12
        end
        object DBEdit1: TDBEdit
          Left = 48
          Top = 24
          Width = 49
          Height = 20
          DataField = #32534#21495
          DataSource = DataSource1
          TabOrder = 0
        end
        object DBEdit2: TDBEdit
          Left = 144
          Top = 24
          Width = 65
          Height = 20
          DataField = #36710#21495
          DataSource = DataSource1
          TabOrder = 1
        end
        object DBEdit3: TDBEdit
          Left = 256
          Top = 24
          Width = 65
          Height = 20
          DataField = #23398#21495
          DataSource = DataSource1
          TabOrder = 2
        end
        object DBEdit4: TDBEdit
          Left = 392
          Top = 24
          Width = 113
          Height = 20
          DataField = #21457#21160#26426#21495
          DataSource = DataSource1
          TabOrder = 3
        end
        object DBEdit5: TDBEdit
          Left = 568
          Top = 24
          Width = 89
          Height = 20
          DataField = #36710#26550#21495
          DataSource = DataSource1
          TabOrder = 4
        end
        object DBEdit6: TDBEdit
          Left = 72
          Top = 56
          Width = 65
          Height = 20
          DataField = #20837#25143#26085#26399
          DataSource = DataSource1
          MaxLength = 10
          TabOrder = 5
        end
        object DBEdit7: TDBEdit
          Left = 224
          Top = 56
          Width = 65
          Height = 20
          DataField = #20445#38505#26085#26399
          DataSource = DataSource1
          MaxLength = 10
          TabOrder = 6
        end
        object DBEdit8: TDBEdit
          Left = 392
          Top = 56
          Width = 65
          Height = 20
          DataField = #20859#36335#36153#26085#26399
          DataSource = DataSource1
          MaxLength = 10
          TabOrder = 7
        end
        object DBEdit9: TDBEdit
          Left = 560
          Top = 56
          Width = 65
          Height = 20
          DataField = #36890#34892#35777#26085#26399
          DataSource = DataSource1
          MaxLength = 10
          TabOrder = 8
        end
        object DBEdit11: TDBEdit
          Left = 216
          Top = 88
          Width = 57
          Height = 20
          DataField = #24314#26723#20154
          DataSource = DataSource1
          TabOrder = 9
        end
        object DBEdit12: TDBEdit
          Left = 352
          Top = 88
          Width = 81
          Height = 20
          DataField = #24314#26723#26085#26399
          DataSource = DataSource1
          TabOrder = 10
        end
        object DBComboBox1: TDBComboBox
          Left = 48
          Top = 88
          Width = 105
          Height = 20
          DataField = #29992#36884
          DataSource = DataSource1
          ItemHeight = 12
          TabOrder = 11
          OnDropDown = DBComboBox1DropDown
        end
        object DateTimePicker1: TDateTimePicker
          Left = 136
          Top = 56
          Width = 22
          Height = 20
          Date = 38338.008069479170000000
          Time = 38338.008069479170000000
          TabOrder = 12
          OnChange = DateTimePicker1Change
        end
        object DateTimePicker2: TDateTimePicker
          Left = 288
          Top = 56
          Width = 22
          Height = 20
          Date = 38338.008069479170000000
          Time = 38338.008069479170000000
          TabOrder = 13
          OnChange = DateTimePicker2Change
        end
        object DateTimePicker3: TDateTimePicker
          Left = 456
          Top = 56
          Width = 22
          Height = 20
          Date = 38338.008069479170000000
          Time = 38338.008069479170000000
          TabOrder = 14
          OnChange = DateTimePicker3Change
        end
        object DateTimePicker4: TDateTimePicker
          Left = 624
          Top = 56
          Width = 22
          Height = 20
          Date = 38338.008069479170000000
          Time = 38338.008069479170000000
          TabOrder = 15
          OnChange = DateTimePicker4Change
        end
      end
      object GroupBox2: TGroupBox
        Left = 8
        Top = 136
        Width = 665
        Height = 113
        Caption = #22791#27880#20449#24687
        TabOrder = 1
        object Label11: TLabel
          Left = 16
          Top = 45
          Width = 36
          Height = 12
          Caption = #22791#27880#65306
          FocusControl = DBMemo1
        end
        object DBMemo1: TDBMemo
          Left = 48
          Top = 24
          Width = 609
          Height = 73
          DataField = #22791#27880
          DataSource = DataSource1
          ScrollBars = ssBoth
          TabOrder = 0
        end
      end
      object Panel1: TPanel
        Left = 7
        Top = 260
        Width = 666
        Height = 41
        BevelInner = bvLowered
        BevelOuter = bvNone
        TabOrder = 2
        object Label14: TLabel
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
            #36710#21495
            #23398#21495
            #21457#21160#26426#21495
            #36710#26550#21495
            #20837#25143#26085#26399
            #20445#38505#26085#26399
            #20859#36335#26085#26399
            #36890#34892#35777#26085#26399
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
        Top = 309
        Width = 673
        Height = 153
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
    Left = 16
  end
  object Table1: TTable
    Active = True
    BeforeInsert = Table1BeforeInsert
    AfterInsert = Table1AfterInsert
    AfterPost = Table1AfterPost
    BeforeCancel = Table1BeforeCancel
    BeforeRefresh = Table1BeforeRefresh
    DatabaseName = 'jx'
    TableName = #25945#32451#36710#24773#20917#32479#35745#34920
    Left = 48
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
    object Table1BDEDesigner4: TStringField
      FieldName = #21457#21160#26426#21495
      Size = 15
    end
    object Table1BDEDesigner5: TStringField
      FieldName = #36710#26550#21495
      Size = 12
    end
    object Table1BDEDesigner6: TDateTimeField
      FieldName = #20837#25143#26085#26399
      EditMask = '0000\-00\-00;1;_'
    end
    object Table1BDEDesigner7: TDateTimeField
      FieldName = #20445#38505#26085#26399
      EditMask = '0000\-00\-00;1;_'
    end
    object Table1BDEDesigner8: TDateTimeField
      FieldName = #20859#36335#36153#26085#26399
      EditMask = '0000\-00\-00;1;_'
    end
    object Table1BDEDesigner9: TDateTimeField
      FieldName = #36890#34892#35777#26085#26399
      EditMask = '0000\-00\-00;1;_'
    end
    object Table1BDEDesigner10: TStringField
      FieldName = #29992#36884
    end
    object Table1BDEDesigner11: TMemoField
      FieldName = #22791#27880
      BlobType = ftMemo
      Size = 1
    end
    object Table1BDEDesigner12: TStringField
      FieldName = #24314#26723#20154
      Size = 10
    end
    object Table1BDEDesigner13: TDateTimeField
      FieldName = #24314#26723#26085#26399
    end
  end
  object Database1: TDatabase
    AliasName = 'jx'
    Connected = True
    DatabaseName = 'jx'
    LoginPrompt = False
    SessionName = 'Default'
    Left = 80
  end
  object Table2: TTable
    Active = True
    DatabaseName = 'jx'
    TableName = #21442#25968#35774#32622
    Left = 112
  end
  object Table3: TTable
    DatabaseName = 'jx'
    TableName = #35745#25968#22120
    Left = 144
    object Table3jlcqktjb: TIntegerField
      FieldName = 'jlcqktjb'
    end
  end
  object PrintDBGridEh1: TPrintDBGridEh
    DBGridEh = DBGridEh1
    Options = [pghFitGridToPageWidth, pghRowAutoStretch, pghOptimalColWidths]
    Page.BottomMargin = 1.000000000000000000
    Page.LeftMargin = 1.000000000000000000
    Page.RightMargin = 1.000000000000000000
    Page.TopMargin = 1.000000000000000000
    PageFooter.CenterText.Strings = (
      '')
    PageFooter.Font.Charset = ANSI_CHARSET
    PageFooter.Font.Color = clWindowText
    PageFooter.Font.Height = -29
    PageFooter.Font.Name = #23435#20307
    PageFooter.Font.Style = []
    PageHeader.CenterText.Strings = (
      #25945#32451#36710#24773#20917#32479#35745#34920)
    PageHeader.Font.Charset = ANSI_CHARSET
    PageHeader.Font.Color = clWindowText
    PageHeader.Font.Height = -29
    PageHeader.Font.Name = #23435#20307
    PageHeader.Font.Style = []
    PageHeader.LeftText.Strings = (
      '')
    PageHeader.LineType = pcltSingleLine
    Units = MM
    Left = 200
    Top = 424
  end
end
