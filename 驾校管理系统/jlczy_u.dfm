object jlczy: Tjlczy
  Left = 267
  Top = 177
  BorderStyle = bsSingle
  Caption = #25945#32451#36710#19987#39029
  ClientHeight = 490
  ClientWidth = 705
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
    Left = 240
    Top = 8
    Width = 125
    Height = 24
    Caption = #25945#32451#36710#19987#39029
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 32
    Width = 705
    Height = 457
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #24405#20837
      object Label2: TLabel
        Left = 8
        Top = 20
        Width = 36
        Height = 12
        Caption = #25945#32451#65306
      end
      object Label3: TLabel
        Left = 128
        Top = 20
        Width = 36
        Height = 12
        Caption = #36710#21495#65306
      end
      object Label4: TLabel
        Left = 264
        Top = 20
        Width = 36
        Height = 12
        Caption = #23398#21495#65306
      end
      object Label5: TLabel
        Left = 400
        Top = 20
        Width = 60
        Height = 12
        Caption = #21378#29260#22411#21495#65306
        FocusControl = DBEdit4
      end
      object SpeedButton1: TSpeedButton
        Left = 88
        Top = 16
        Width = 25
        Height = 22
        Caption = '...'
        OnClick = SpeedButton1Click
      end
      object SpeedButton2: TSpeedButton
        Left = 224
        Top = 16
        Width = 25
        Height = 22
        Caption = '...'
        OnClick = SpeedButton2Click
      end
      object SpeedButton3: TSpeedButton
        Left = 360
        Top = 16
        Width = 25
        Height = 22
        Caption = '...'
        OnClick = SpeedButton3Click
      end
      object DBEdit4: TDBEdit
        Left = 456
        Top = 16
        Width = 131
        Height = 20
        DataField = #21378#29260#22411#21495
        DataSource = DataSource3
        TabOrder = 0
      end
      object GroupBox1: TGroupBox
        Left = 8
        Top = 48
        Width = 211
        Height = 177
        TabOrder = 1
        object Label6: TLabel
          Left = 16
          Top = 27
          Width = 96
          Height = 12
          Caption = #21457#21160#26426#22823#20462#26102#38388#65306
          FocusControl = DBEdit5
        end
        object Label7: TLabel
          Left = 16
          Top = 56
          Width = 96
          Height = 12
          Caption = #26356#25442#38646#37197#20214#24773#20917#65306
          FocusControl = DBMemo1
        end
        object DBEdit5: TDBEdit
          Left = 112
          Top = 24
          Width = 68
          Height = 20
          DataField = #21457#21160#26426#22823#20462#26102#38388
          DataSource = DataSource3
          MaxLength = 10
          TabOrder = 0
        end
        object DBMemo1: TDBMemo
          Left = 16
          Top = 72
          Width = 185
          Height = 89
          DataField = #26356#25442#38646#37197#20214#24773#20917'1'
          DataSource = DataSource3
          TabOrder = 1
        end
        object DateTimePicker1: TDateTimePicker
          Left = 176
          Top = 24
          Width = 25
          Height = 20
          Date = 38375.996184895830000000
          Time = 38375.996184895830000000
          TabOrder = 2
          OnChange = DateTimePicker1Change
        end
      end
      object GroupBox2: TGroupBox
        Left = 240
        Top = 48
        Width = 211
        Height = 177
        TabOrder = 2
        object Label8: TLabel
          Left = 14
          Top = 27
          Width = 84
          Height = 12
          Caption = #24213#30424#22823#20462#26102#38388#65306
          FocusControl = DBEdit6
        end
        object Label9: TLabel
          Left = 17
          Top = 56
          Width = 96
          Height = 12
          Caption = #26356#25442#38646#37197#20214#24773#20917#65306
          FocusControl = DBMemo2
        end
        object DBEdit6: TDBEdit
          Left = 96
          Top = 24
          Width = 68
          Height = 20
          DataField = #24213#30424#22823#20462#26102#38388
          DataSource = DataSource3
          MaxLength = 10
          TabOrder = 0
        end
        object DBMemo2: TDBMemo
          Left = 16
          Top = 72
          Width = 185
          Height = 89
          DataField = #26356#25442#38646#37197#20214#24773#20917'2'
          DataSource = DataSource3
          TabOrder = 1
        end
        object DateTimePicker2: TDateTimePicker
          Left = 160
          Top = 24
          Width = 25
          Height = 20
          Date = 38376.002124918980000000
          Time = 38376.002124918980000000
          TabOrder = 2
          OnChange = DateTimePicker2Change
        end
      end
      object GroupBox3: TGroupBox
        Left = 472
        Top = 48
        Width = 211
        Height = 177
        TabOrder = 3
        object Label10: TLabel
          Left = 16
          Top = 24
          Width = 60
          Height = 12
          Caption = #23567#20462#26102#38388#65306
          FocusControl = DBEdit7
        end
        object Label11: TLabel
          Left = 17
          Top = 53
          Width = 120
          Height = 12
          Caption = #26356#25442#20027#35201#38646#37197#20214#24773#20917#65306
          FocusControl = DBMemo3
        end
        object DBEdit7: TDBEdit
          Left = 72
          Top = 21
          Width = 68
          Height = 20
          DataField = #23567#20462#26102#38388
          DataSource = DataSource3
          MaxLength = 10
          TabOrder = 0
        end
        object DBMemo3: TDBMemo
          Left = 16
          Top = 72
          Width = 185
          Height = 89
          DataField = #26356#25442#20027#35201#38646#37197#20214#24773#20917
          DataSource = DataSource3
          TabOrder = 1
        end
        object DateTimePicker3: TDateTimePicker
          Left = 137
          Top = 21
          Width = 25
          Height = 20
          Date = 38376.002953912040000000
          Time = 38376.002953912040000000
          TabOrder = 2
          OnChange = DateTimePicker3Change
        end
      end
      object GroupBox4: TGroupBox
        Left = 8
        Top = 232
        Width = 156
        Height = 97
        Caption = #26356#25442#28070#28369#27833#24773#20917
        TabOrder = 4
        object DBMemo4: TDBMemo
          Left = 8
          Top = 16
          Width = 145
          Height = 73
          DataField = #26356#25442#28070#28369#27833#24773#20917
          DataSource = DataSource3
          TabOrder = 0
        end
      end
      object GroupBox5: TGroupBox
        Left = 184
        Top = 232
        Width = 156
        Height = 97
        Caption = #25439#22351#24773#20917
        TabOrder = 5
        object DBMemo5: TDBMemo
          Left = 8
          Top = 16
          Width = 145
          Height = 73
          DataField = #25439#22351#24773#20917
          DataSource = DataSource3
          TabOrder = 0
        end
      end
      object GroupBox6: TGroupBox
        Left = 360
        Top = 232
        Width = 156
        Height = 97
        Caption = #25439#22351#21407#22240
        TabOrder = 6
        object DBMemo6: TDBMemo
          Left = 8
          Top = 16
          Width = 145
          Height = 73
          DataField = #25439#22351#21407#22240
          DataSource = DataSource3
          TabOrder = 0
        end
      end
      object GroupBox7: TGroupBox
        Left = 536
        Top = 232
        Width = 147
        Height = 97
        TabOrder = 7
        object Label12: TLabel
          Left = 13
          Top = 26
          Width = 60
          Height = 12
          Caption = #25439#22833#37329#39069#65306
          FocusControl = DBEdit8
        end
        object Label13: TLabel
          Left = 17
          Top = 58
          Width = 48
          Height = 12
          Caption = #20445#31649#20154#65306
          FocusControl = DBEdit9
        end
        object DBEdit8: TDBEdit
          Left = 72
          Top = 21
          Width = 65
          Height = 20
          DataField = #25439#22833#37329#39069
          DataSource = DataSource3
          TabOrder = 0
        end
        object DBEdit9: TDBEdit
          Left = 72
          Top = 53
          Width = 65
          Height = 20
          DataField = #20445#31649#20154
          DataSource = DataSource3
          TabOrder = 1
        end
      end
      object GroupBox8: TGroupBox
        Left = 8
        Top = 336
        Width = 675
        Height = 41
        Caption = #24314#26723#20449#24687
        TabOrder = 8
        object Label14: TLabel
          Left = 17
          Top = 17
          Width = 48
          Height = 12
          Caption = #24314#26723#20154#65306
          FocusControl = DBEdit10
        end
        object Label15: TLabel
          Left = 137
          Top = 17
          Width = 60
          Height = 12
          Caption = #24314#26723#26085#26399#65306
          FocusControl = DBEdit11
        end
        object DBEdit10: TDBEdit
          Left = 64
          Top = 13
          Width = 57
          Height = 20
          DataField = #24314#26723#20154
          DataSource = DataSource3
          TabOrder = 0
        end
        object DBEdit11: TDBEdit
          Left = 192
          Top = 13
          Width = 89
          Height = 20
          DataField = #24314#26723#26085#26399
          DataSource = DataSource3
          TabOrder = 1
        end
      end
      object Panel1: TPanel
        Left = 8
        Top = 380
        Width = 675
        Height = 41
        BevelInner = bvLowered
        TabOrder = 9
        object DBNavigator1: TDBNavigator
          Left = 8
          Top = 8
          Width = 240
          Height = 25
          DataSource = DataSource3
          TabOrder = 0
        end
        object BitBtn2: TBitBtn
          Left = 512
          Top = 8
          Width = 75
          Height = 25
          Caption = #23548#20986'EXCEL'
          TabOrder = 1
        end
        object BitBtn3: TBitBtn
          Left = 592
          Top = 8
          Width = 75
          Height = 25
          Caption = #36864#20986
          TabOrder = 2
          OnClick = BitBtn3Click
        end
        object BitBtn4: TBitBtn
          Left = 432
          Top = 8
          Width = 75
          Height = 25
          Caption = #20462#25913
          TabOrder = 3
          OnClick = BitBtn4Click
        end
      end
      object Edit1: TEdit
        Left = 40
        Top = 16
        Width = 43
        Height = 20
        TabOrder = 10
        OnExit = Edit1Exit
        OnKeyPress = Edit1KeyPress
      end
      object Edit2: TEdit
        Left = 160
        Top = 16
        Width = 59
        Height = 20
        TabOrder = 11
        OnExit = Edit2Exit
        OnKeyPress = Edit2KeyPress
      end
      object Edit3: TEdit
        Left = 296
        Top = 16
        Width = 59
        Height = 20
        TabOrder = 12
        OnExit = Edit3Exit
        OnKeyPress = Edit3KeyPress
      end
    end
    object TabSheet2: TTabSheet
      Caption = #26597#35810
      ImageIndex = 1
      object GroupBox9: TGroupBox
        Left = 0
        Top = 0
        Width = 697
        Height = 57
        Caption = #26597#35810#26465#20214
        TabOrder = 0
        object Label16: TLabel
          Left = 267
          Top = 22
          Width = 48
          Height = 12
          Caption = #26085#26399#33258#65306
        end
        object Label17: TLabel
          Left = 403
          Top = 22
          Width = 24
          Height = 12
          Caption = #33267#65306
        end
        object ComboBox1: TComboBox
          Left = 8
          Top = 19
          Width = 73
          Height = 20
          ItemHeight = 12
          TabOrder = 0
          Items.Strings = (
            #32534#21495
            #22995#21517
            #25163#26426
            #30005#35805
            #38382#35810#22788#25152
            #22788#29702#32467#26524
            #24314#26723#20154)
        end
        object Edit4: TEdit
          Left = 136
          Top = 19
          Width = 81
          Height = 20
          TabOrder = 1
        end
        object DateTimePicker4: TDateTimePicker
          Left = 312
          Top = 19
          Width = 89
          Height = 20
          BevelOuter = bvNone
          Date = 38334.877195451390000000
          Time = 38334.877195451390000000
          TabOrder = 2
        end
        object DateTimePicker5: TDateTimePicker
          Left = 424
          Top = 19
          Width = 89
          Height = 20
          Date = 38334.877195451390000000
          Time = 38334.877195451390000000
          Checked = False
          TabOrder = 3
        end
        object BitBtn1: TBitBtn
          Left = 528
          Top = 19
          Width = 50
          Height = 25
          Caption = #26597#35810
          TabOrder = 4
          OnClick = BitBtn4Click
        end
        object BitBtn5: TBitBtn
          Left = 584
          Top = 19
          Width = 50
          Height = 25
          Caption = #25171#21360
          TabOrder = 5
          OnClick = BitBtn5Click
        end
        object BitBtn6: TBitBtn
          Left = 640
          Top = 19
          Width = 50
          Height = 25
          Caption = #36864#20986
          TabOrder = 6
        end
        object ComboBox2: TComboBox
          Left = 88
          Top = 19
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
          Top = 19
          Width = 17
          Height = 17
          TabOrder = 8
        end
      end
      object DBGridEh1: TDBGridEh
        Left = 0
        Top = 64
        Width = 697
        Height = 369
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
    Left = 8
  end
  object Table1: TTable
    Active = True
    DatabaseName = 'jx'
    IndexFieldNames = #32534#21495
    TableName = #25945#32451#21592#26723#26696
    Left = 40
    object Table1BDEDesigner: TStringField
      FieldName = #32534#21495
      Size = 6
    end
    object Table1BDEDesigner2: TStringField
      FieldName = #22995#21517
      Size = 10
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
  object DataSource2: TDataSource
    DataSet = Table2
    Left = 104
  end
  object Table2: TTable
    Active = True
    DatabaseName = 'jx'
    IndexFieldNames = #32534#21495
    MasterFields = #32534#21495'_jlc'
    TableName = #25945#32451#36710#24773#20917#32479#35745#34920
    Left = 136
    object Table2BDEDesigner: TStringField
      FieldName = #32534#21495
      Size = 6
    end
    object Table2BDEDesigner2: TStringField
      FieldName = #36710#21495
      Size = 9
    end
    object Table2BDEDesigner3: TStringField
      FieldName = #23398#21495
      Size = 10
    end
  end
  object DataSource3: TDataSource
    DataSet = Table3
    Left = 168
  end
  object Table3: TTable
    Active = True
    AfterInsert = Table3AfterInsert
    BeforePost = Table3BeforePost
    AfterScroll = Table3AfterScroll
    DatabaseName = 'jx'
    TableName = #25945#32451#36710#19987#39029
    Left = 200
    object Table3_jly: TStringField
      FieldName = #32534#21495'_jly'
      Size = 6
    end
    object Table3_jlc: TStringField
      FieldName = #32534#21495'_jlc'
      Size = 6
    end
    object Table3BDEDesigner: TStringField
      FieldName = #21378#29260#22411#21495
      Size = 15
    end
    object Table3BDEDesigner2: TDateTimeField
      FieldName = #21457#21160#26426#22823#20462#26102#38388
      EditMask = '!9999/99/00;1;_'
    end
    object Table3BDEDesigner1: TMemoField
      FieldName = #26356#25442#38646#37197#20214#24773#20917'1'
      BlobType = ftMemo
      Size = 1
    end
    object Table3BDEDesigner3: TDateTimeField
      FieldName = #24213#30424#22823#20462#26102#38388
      EditMask = '!9999/99/00;1;_'
    end
    object Table3BDEDesigner22: TMemoField
      FieldName = #26356#25442#38646#37197#20214#24773#20917'2'
      BlobType = ftMemo
      Size = 1
    end
    object Table3BDEDesigner4: TDateTimeField
      FieldName = #23567#20462#26102#38388
      EditMask = '!9999/99/00;1;_'
    end
    object Table3BDEDesigner5: TMemoField
      FieldName = #26356#25442#20027#35201#38646#37197#20214#24773#20917
      BlobType = ftMemo
      Size = 1
    end
    object Table3BDEDesigner6: TMemoField
      FieldName = #26356#25442#28070#28369#27833#24773#20917
      BlobType = ftMemo
      Size = 1
    end
    object Table3BDEDesigner7: TMemoField
      FieldName = #25439#22351#24773#20917
      BlobType = ftMemo
      Size = 1
    end
    object Table3BDEDesigner8: TMemoField
      FieldName = #25439#22351#21407#22240
      BlobType = ftMemo
      Size = 1
    end
    object Table3BDEDesigner9: TFloatField
      FieldName = #25439#22833#37329#39069
    end
    object Table3BDEDesigner10: TStringField
      FieldName = #20445#31649#20154
      Size = 8
    end
    object Table3BDEDesigner11: TStringField
      FieldName = #24314#26723#20154
      Size = 8
    end
    object Table3BDEDesigner12: TDateTimeField
      FieldName = #24314#26723#26085#26399
    end
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
    PageHeader.CenterText.Strings = (
      #25945#32451#36710#19987#39029)
    PageHeader.Font.Charset = ANSI_CHARSET
    PageHeader.Font.Color = clWindowText
    PageHeader.Font.Height = -29
    PageHeader.Font.Name = #23435#20307
    PageHeader.Font.Style = []
    Units = MM
    Left = 512
  end
  object Query1: TQuery
    DatabaseName = 'jx'
    SessionName = 'Default'
    SQL.Strings = (
      
        'SELECT '#25945#32451#21592#26723#26696'.'#22995#21517', '#25945#32451#36710#24773#20917#32479#35745#34920'.'#36710#21495', '#25945#32451#36710#24773#20917#32479#35745#34920'.'#23398#21495', '#25945#32451#36710#19987#39029'.'#21378#29260#22411#21495', '#25945#32451#36710#19987#39029'.'#21457#21160#26426 +
        #22823#20462#26102#38388', '#25945#32451#36710#19987#39029'.'#26356#25442#38646#37197#20214#24773#20917'1, '#25945#32451#36710#19987#39029'.'#24213#30424#22823#20462#26102#38388', '#25945#32451#36710#19987#39029'.'#26356#25442#38646#37197#20214#24773#20917'2, '#25945#32451#36710#19987#39029'.'#23567#20462#26102#38388', ' +
        #25945#32451#36710#19987#39029'.'#26356#25442#20027#35201#38646#37197#20214#24773#20917', '#25945#32451#36710#19987#39029'.'#26356#25442#28070#28369#27833#24773#20917', '#25945#32451#36710#19987#39029'.'#25439#22351#24773#20917', '#25945#32451#36710#19987#39029'.'#25439#22351#21407#22240', '#25945#32451#36710#19987#39029'.'#25439#22833 +
        #37329#39069', '#25945#32451#36710#19987#39029'.'#20445#31649#20154', '#25945#32451#36710#19987#39029'.'#24314#26723#20154', '#25945#32451#36710#19987#39029'.'#24314#26723#26085#26399
      'FROM '#25945#32451#36710#24773#20917#32479#35745#34920' '#25945#32451#36710#24773#20917#32479#35745#34920', '#25945#32451#36710#19987#39029' '#25945#32451#36710#19987#39029', '#25945#32451#21592#26723#26696' '#25945#32451#21592#26723#26696
      'WHERE  ('#25945#32451#36710#19987#39029'.'#32534#21495'_jly = '#25945#32451#21592#26723#26696'.'#32534#21495')  '
      '   AND  ('#25945#32451#36710#19987#39029'.'#32534#21495'_jlc = '#25945#32451#36710#24773#20917#32479#35745#34920'.'#32534#21495')  ')
    Left = 480
  end
  object DataSource4: TDataSource
    DataSet = Query1
    Left = 448
  end
end
