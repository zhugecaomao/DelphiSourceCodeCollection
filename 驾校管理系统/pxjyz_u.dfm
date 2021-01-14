object pxjyz: Tpxjyz
  Left = 277
  Top = 217
  Width = 705
  Height = 471
  Caption = #22521#35757#32467#19994#35777
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
  object Label1: TLabel
    Left = 184
    Top = 0
    Width = 300
    Height = 24
    Caption = #26680#21457#12298#22521#35757#32467#19994#35777#12299#33457#21517#20876
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 32
    Width = 697
    Height = 409
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #24405#20837
      object GroupBox1: TGroupBox
        Left = 8
        Top = 8
        Width = 673
        Height = 89
        Caption = #22522#26412#20449#24687
        TabOrder = 0
        object Label2: TLabel
          Left = 8
          Top = 24
          Width = 36
          Height = 12
          Caption = #22995#21517#65306
        end
        object Label3: TLabel
          Left = 184
          Top = 24
          Width = 60
          Height = 12
          Caption = #36523#20221#35777#21495#65306
        end
        object SpeedButton1: TSpeedButton
          Left = 120
          Top = 24
          Width = 23
          Height = 22
          Caption = '...'
          OnClick = SpeedButton1Click
        end
        object Label4: TLabel
          Left = 392
          Top = 24
          Width = 36
          Height = 12
          Caption = #29702#35770#65306
        end
        object Label5: TLabel
          Left = 504
          Top = 24
          Width = 60
          Height = 12
          Caption = #39550#39542#25805#20316#65306
        end
        object Label6: TLabel
          Left = 8
          Top = 56
          Width = 72
          Height = 12
          Caption = #32467#19994#35777#32534#21495#65306
          FocusControl = DBEdit3
        end
        object DBComboBox1: TDBComboBox
          Left = 424
          Top = 24
          Width = 65
          Height = 20
          DataField = #29702#35770
          DataSource = DataSource2
          ItemHeight = 12
          Items.Strings = (
            #21512#26684
            #19981#21512#26684)
          TabOrder = 0
        end
        object DBComboBox2: TDBComboBox
          Left = 560
          Top = 24
          Width = 65
          Height = 20
          DataField = #39550#39542#25805#20316
          DataSource = DataSource2
          ItemHeight = 12
          Items.Strings = (
            #21512#26684
            #19981#21512#26684)
          TabOrder = 1
        end
        object DBEdit3: TDBEdit
          Left = 80
          Top = 56
          Width = 153
          Height = 20
          DataField = #32467#19994#35777#32534#21495
          DataSource = DataSource2
          TabOrder = 2
        end
        object Edit2: TEdit
          Left = 40
          Top = 24
          Width = 73
          Height = 20
          TabOrder = 3
          OnExit = Edit2Exit
          OnKeyPress = Edit2KeyPress
        end
        object Edit3: TEdit
          Left = 240
          Top = 24
          Width = 137
          Height = 20
          Enabled = False
          TabOrder = 4
        end
      end
      object GroupBox2: TGroupBox
        Left = 8
        Top = 104
        Width = 673
        Height = 49
        Caption = #20854#23427
        TabOrder = 1
        object Label7: TLabel
          Left = 16
          Top = 21
          Width = 48
          Height = 12
          Caption = #24314#26723#20154#65306
          FocusControl = DBEdit4
        end
        object Label8: TLabel
          Left = 136
          Top = 21
          Width = 60
          Height = 12
          Caption = #24314#26723#26085#26399#65306
          FocusControl = DBEdit5
        end
        object DBEdit4: TDBEdit
          Left = 64
          Top = 13
          Width = 57
          Height = 20
          DataField = #24314#26723#20154
          DataSource = DataSource2
          Enabled = False
          TabOrder = 0
        end
        object DBEdit5: TDBEdit
          Left = 192
          Top = 13
          Width = 65
          Height = 20
          DataField = #24314#26723#26085#26399
          DataSource = DataSource2
          Enabled = False
          TabOrder = 1
        end
      end
      object Panel1: TPanel
        Left = 8
        Top = 160
        Width = 673
        Height = 41
        BevelInner = bvLowered
        TabOrder = 2
        object Label9: TLabel
          Left = 208
          Top = 16
          Width = 60
          Height = 12
          Caption = #26597#35810#26465#20214#65306
        end
        object DBNavigator1: TDBNavigator
          Left = 8
          Top = 8
          Width = 200
          Height = 25
          DataSource = DataSource2
          TabOrder = 0
        end
        object ComboBox1: TComboBox
          Left = 264
          Top = 12
          Width = 81
          Height = 20
          ItemHeight = 12
          TabOrder = 1
          Items.Strings = (
            #22995#21517
            #36523#20221#35777#21495
            #32467#19994#35777#32534#21495)
        end
        object ComboBox2: TComboBox
          Left = 344
          Top = 12
          Width = 41
          Height = 20
          ItemHeight = 12
          TabOrder = 2
          Items.Strings = (
            '='
            '>'
            '<'
            '>='
            '<='
            '<>')
        end
        object Edit1: TEdit
          Left = 385
          Top = 12
          Width = 72
          Height = 20
          TabOrder = 3
        end
        object BitBtn1: TBitBtn
          Left = 464
          Top = 8
          Width = 49
          Height = 25
          Caption = #26597#35810'(&S)'
          TabOrder = 4
          OnClick = BitBtn1Click
        end
        object BitBtn2: TBitBtn
          Left = 512
          Top = 8
          Width = 57
          Height = 25
          Caption = #23548#20986'EXCEL'
          TabOrder = 5
        end
        object BitBtn3: TBitBtn
          Left = 568
          Top = 8
          Width = 49
          Height = 25
          Caption = #25171#21360'(&P)'
          TabOrder = 6
          OnClick = BitBtn3Click
        end
        object BitBtn4: TBitBtn
          Left = 616
          Top = 8
          Width = 49
          Height = 25
          Caption = #36864#20986'(&X)'
          TabOrder = 7
          OnClick = BitBtn4Click
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #26597#35810
      ImageIndex = 1
    end
  end
  object DBGridEh1: TDBGridEh
    Left = 8
    Top = 256
    Width = 681
    Height = 177
    DataSource = DataSource3
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
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 8
  end
  object Table1: TTable
    Active = True
    DatabaseName = 'jx'
    TableName = 'student'
    Left = 40
    object Table1BDEDesigner: TStringField
      FieldName = #23398#21495
      Size = 6
    end
    object Table1BDEDesigner2: TStringField
      FieldName = #22995#21517
      Size = 8
    end
    object Table1BDEDesigner3: TStringField
      FieldName = #24615#21035
      Size = 2
    end
    object Table1BDEDesigner4: TDateTimeField
      FieldName = #20986#29983#26085#26399
    end
    object Table1BDEDesigner5: TStringField
      FieldName = #36523#20221#35777#21495
    end
  end
  object Database1: TDatabase
    AliasName = 'jx'
    Connected = True
    DatabaseName = 'jx'
    LoginPrompt = False
    SessionName = 'Default'
    Left = 72
  end
  object Table2: TTable
    AfterInsert = Table2AfterInsert
    BeforePost = Table2BeforePost
    AfterScroll = Table2AfterScroll
    DatabaseName = 'jx'
    TableName = #22521#35757#32467#19994#35777
    Left = 104
    object Table2BDEDesigner: TAutoIncField
      FieldName = #32534#21495
    end
    object Table2BDEDesigner2: TStringField
      FieldName = #23398#21495
      Size = 6
    end
    object Table2BDEDesigner3: TStringField
      FieldName = #29702#35770
      Size = 10
    end
    object Table2BDEDesigner4: TStringField
      FieldName = #39550#39542#25805#20316
      Size = 10
    end
    object Table2BDEDesigner5: TStringField
      FieldName = #32467#19994#35777#32534#21495
    end
    object Table2BDEDesigner6: TStringField
      FieldName = #24314#26723#20154
      Size = 10
    end
    object Table2BDEDesigner7: TDateTimeField
      FieldName = #24314#26723#26085#26399
    end
  end
  object DataSource2: TDataSource
    DataSet = Table2
    Left = 136
  end
  object Query1: TQuery
    AfterScroll = Query1AfterScroll
    DatabaseName = 'jx'
    Left = 512
  end
  object DataSource3: TDataSource
    DataSet = Query1
    Left = 480
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
      #26680#21457#12298#22521#35757#32467#19994#35777#12299#33457#21517#20876)
    PageHeader.Font.Charset = ANSI_CHARSET
    PageHeader.Font.Color = clWindowText
    PageHeader.Font.Height = -29
    PageHeader.Font.Name = #23435#20307
    PageHeader.Font.Style = []
    Units = MM
    Left = 568
    Top = 176
  end
end
