object lkcycj: Tlkcycj
  Left = 302
  Top = 189
  Width = 700
  Height = 521
  Caption = #36335#32771#27979#39564#25104#32489
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
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
    Left = 257
    Top = 5
    Width = 174
    Height = 29
    Caption = #36335#32771#27979#39564#25104#32489
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -29
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 34
    Width = 689
    Height = 455
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #24405#20837
      object Label8: TLabel
        Left = 128
        Top = 123
        Width = 60
        Height = 12
        Caption = #27979#39564#26102#38388#65306
        FocusControl = DBEdit6
      end
      object Label7: TLabel
        Left = 288
        Top = 123
        Width = 48
        Height = 12
        Caption = #24314#26723#20154#65306
        FocusControl = DBEdit7
      end
      object Label9: TLabel
        Left = 408
        Top = 123
        Width = 60
        Height = 12
        Caption = #24314#26723#26085#26399#65306
        FocusControl = DBEdit8
      end
      object GroupBox1: TGroupBox
        Left = 8
        Top = 8
        Width = 657
        Height = 89
        Caption = #22522#26412#20449#24687
        TabOrder = 0
        object Label2: TLabel
          Left = 16
          Top = 28
          Width = 36
          Height = 12
          Caption = #22995#21517#65306
        end
        object SpeedButton1: TSpeedButton
          Left = 112
          Top = 24
          Width = 25
          Height = 22
          Caption = '...'
          OnClick = SpeedButton1Click
        end
        object Label3: TLabel
          Left = 176
          Top = 28
          Width = 36
          Height = 12
          Caption = #24615#21035#65306
        end
        object Label4: TLabel
          Left = 264
          Top = 28
          Width = 36
          Height = 12
          Caption = #35777#21035#65306
        end
        object Label5: TLabel
          Left = 416
          Top = 28
          Width = 60
          Height = 12
          Caption = #36523#20221#35777#21495#65306
        end
        object SpeedButton2: TSpeedButton
          Left = 616
          Top = 24
          Width = 23
          Height = 22
          Caption = '...'
          OnClick = SpeedButton2Click
        end
        object Label6: TLabel
          Left = 416
          Top = 59
          Width = 60
          Height = 12
          Caption = #20934#32771#35777#21495#65306
        end
        object SpeedButton3: TSpeedButton
          Left = 616
          Top = 51
          Width = 23
          Height = 22
          Caption = '...'
          OnClick = SpeedButton3Click
        end
        object Edit5: TEdit
          Left = 472
          Top = 53
          Width = 137
          Height = 20
          TabOrder = 0
          Text = 'Edit5'
          OnExit = Edit5Exit
          OnKeyPress = Edit5KeyPress
        end
        object Edit4: TEdit
          Left = 472
          Top = 25
          Width = 137
          Height = 20
          TabOrder = 1
          Text = 'Edit4'
          OnExit = Edit4Exit
          OnKeyPress = Edit4KeyPress
        end
        object Edit3: TEdit
          Left = 296
          Top = 25
          Width = 57
          Height = 20
          Enabled = False
          TabOrder = 2
          Text = 'Edit3'
        end
        object Edit2: TEdit
          Left = 208
          Top = 25
          Width = 25
          Height = 20
          Enabled = False
          TabOrder = 3
          Text = 'Edit2'
        end
        object Edit1: TEdit
          Left = 48
          Top = 25
          Width = 57
          Height = 20
          TabOrder = 4
          Text = 'Edit1'
          OnExit = Edit1Exit
          OnKeyPress = Edit1KeyPress
        end
      end
      object DBEdit6: TDBEdit
        Left = 184
        Top = 120
        Width = 65
        Height = 20
        DataField = #27979#39564#26102#38388
        DataSource = DataSource2
        TabOrder = 1
      end
      object DateTimePicker1: TDateTimePicker
        Left = 248
        Top = 120
        Width = 23
        Height = 20
        Date = 38347.837607060190000000
        Time = 38347.837607060190000000
        TabOrder = 2
        OnChange = DateTimePicker1Change
      end
      object DBRadioGroup1: TDBRadioGroup
        Left = 8
        Top = 104
        Width = 81
        Height = 49
        Caption = #25104#32489
        DataField = #25104#32489
        DataSource = DataSource2
        Items.Strings = (
          #21450#26684
          #19981#21450#26684)
        TabOrder = 3
        Values.Strings = (
          'true'
          'false')
      end
      object GroupBox2: TGroupBox
        Left = 8
        Top = 160
        Width = 657
        Height = 217
        Caption = #19981#21450#26684#21407#22240#65306
        TabOrder = 4
        object DBCheckBox1: TDBCheckBox
          Left = 16
          Top = 24
          Width = 65
          Height = 17
          Caption = #19981#20851#36710#38376
          DataField = #19981#20851#36710#38376
          DataSource = DataSource2
          TabOrder = 0
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object DBCheckBox2: TDBCheckBox
          Left = 96
          Top = 24
          Width = 89
          Height = 17
          Caption = #21518#28316#22823#20110'30CM'
          DataField = #21518#28316#22823#20110'30CM'
          DataSource = DataSource2
          TabOrder = 1
          ValueChecked = 'false'
          ValueUnchecked = 'true'
        end
        object DBCheckBox3: TDBCheckBox
          Left = 208
          Top = 24
          Width = 57
          Height = 17
          Caption = #36305#26041#21521
          DataField = #36305#26041#21521
          DataSource = DataSource2
          TabOrder = 2
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object DBCheckBox4: TDBCheckBox
          Left = 288
          Top = 24
          Width = 65
          Height = 17
          Caption = #21452#25163#33073#25226
          DataField = #21452#25163#33073#25226
          DataSource = DataSource2
          TabOrder = 3
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object DBCheckBox5: TDBCheckBox
          Left = 368
          Top = 24
          Width = 65
          Height = 17
          Caption = #20302#22836#30475#26723
          DataField = #20302#22836#30475#26723
          DataSource = DataSource2
          TabOrder = 4
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object DBCheckBox6: TDBCheckBox
          Left = 456
          Top = 24
          Width = 65
          Height = 17
          Caption = #31354#26723#28369#34892
          DataField = #31354#26723#28369#34892
          DataSource = DataSource2
          TabOrder = 5
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object DBCheckBox7: TDBCheckBox
          Left = 544
          Top = 24
          Width = 57
          Height = 17
          Caption = #25346#38169#26723
          DataField = #25346#38169#26723
          DataSource = DataSource2
          TabOrder = 6
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object DBCheckBox8: TDBCheckBox
          Left = 16
          Top = 48
          Width = 41
          Height = 17
          Caption = #29060#28779
          DataField = #29060#28779
          DataSource = DataSource2
          TabOrder = 7
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object DBCheckBox9: TDBCheckBox
          Left = 96
          Top = 48
          Width = 41
          Height = 17
          Caption = #21709#40831
          DataField = #21709#40831
          DataSource = DataSource2
          TabOrder = 8
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object DBCheckBox10: TDBCheckBox
          Left = 208
          Top = 48
          Width = 57
          Height = 17
          Caption = #21327#35843#24046
          DataField = #21327#35843#24046
          DataSource = DataSource2
          TabOrder = 9
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object DBCheckBox11: TDBCheckBox
          Left = 288
          Top = 48
          Width = 41
          Height = 17
          Caption = #25481#26725
          DataField = #25481#26725
          DataSource = DataSource2
          TabOrder = 10
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object DBCheckBox12: TDBCheckBox
          Left = 368
          Top = 48
          Width = 65
          Height = 17
          Caption = #25250#26723#19981#20837
          DataField = #25250#26723#19981#20837
          DataSource = DataSource2
          TabOrder = 11
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object DBCheckBox13: TDBCheckBox
          Left = 456
          Top = 48
          Width = 65
          Height = 17
          Caption = #25166#20013#24515#32447
          DataField = #25166#20013#24515#32447
          DataSource = DataSource2
          TabOrder = 12
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object DBCheckBox14: TDBCheckBox
          Left = 544
          Top = 48
          Width = 65
          Height = 17
          Caption = #24378#34892#36229#36710
          DataField = #24378#34892#36229#36710
          DataSource = DataSource2
          TabOrder = 13
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object DBCheckBox15: TDBCheckBox
          Left = 16
          Top = 72
          Width = 57
          Height = 17
          Caption = #19981#40483#21495
          DataField = #19981#40483#21495
          DataSource = DataSource2
          TabOrder = 14
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object DBCheckBox16: TDBCheckBox
          Left = 96
          Top = 72
          Width = 105
          Height = 17
          Caption = #36710#36523#20301#32622#24863#35273#24046
          DataField = #36710#36523#20301#32622#24863#35273#24046
          DataSource = DataSource2
          TabOrder = 15
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object DBCheckBox17: TDBCheckBox
          Left = 208
          Top = 72
          Width = 73
          Height = 17
          Caption = #19981#25289#25163#21049
          DataField = #19981#25289#25163#21049
          DataSource = DataSource2
          TabOrder = 16
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object DBCheckBox18: TDBCheckBox
          Left = 288
          Top = 72
          Width = 65
          Height = 17
          Caption = #19981#26494#25163#21049
          DataField = #19981#26494#25163#21049
          DataSource = DataSource2
          TabOrder = 17
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object DBCheckBox19: TDBCheckBox
          Left = 368
          Top = 72
          Width = 81
          Height = 17
          Caption = #19981#26816#26597#20202#34920
          DataField = #19981#26816#26597#20202#34920
          DataSource = DataSource2
          TabOrder = 18
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object DBCheckBox20: TDBCheckBox
          Left = 456
          Top = 72
          Width = 81
          Height = 17
          Caption = #21046#21160#19981#24179#39034
          DataField = #21046#21160#19981#24179#39034
          DataSource = DataSource2
          TabOrder = 19
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object DBCheckBox21: TDBCheckBox
          Left = 544
          Top = 72
          Width = 105
          Height = 17
          Caption = #19981#20250#20351#29992#36716#21521#28783
          DataField = #19981#20250#20351#29992#36716#21521#28783
          DataSource = DataSource2
          TabOrder = 20
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object DBCheckBox22: TDBCheckBox
          Left = 16
          Top = 96
          Width = 129
          Height = 17
          Caption = #19981#20250#20351#29992#20108#33050#31163#21512#22120
          DataField = #19981#20250#20351#29992#20108#33050#31163#21512#22120
          DataSource = DataSource2
          TabOrder = 21
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object DBCheckBox23: TDBCheckBox
          Left = 208
          Top = 96
          Width = 89
          Height = 17
          Caption = #36215#27493#27833#38376#36807#22823
          DataField = #36215#27493#27833#38376#36807#22823
          DataSource = DataSource2
          TabOrder = 22
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object DBCheckBox24: TDBCheckBox
          Left = 368
          Top = 96
          Width = 65
          Height = 17
          Caption = #36710#36718#20986#32447
          DataField = #36710#36718#20986#32447
          DataSource = DataSource2
          TabOrder = 23
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object DBCheckBox25: TDBCheckBox
          Left = 544
          Top = 96
          Width = 89
          Height = 17
          Caption = #23450#28857#20572#36710#36807#28857
          DataField = #23450#28857#20572#36710#36807#28857
          DataSource = DataSource2
          TabOrder = 24
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object DBCheckBox26: TDBCheckBox
          Left = 16
          Top = 120
          Width = 153
          Height = 17
          Caption = #20572#36710#27178#32437#21521#36317#31163#22823#20110'50CM'
          DataField = #20572#36710#27178#32437#21521#36317#31163#22823#20110'50CM'
          DataSource = DataSource2
          TabOrder = 25
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object DBCheckBox27: TDBCheckBox
          Left = 208
          Top = 120
          Width = 137
          Height = 17
          Caption = #20572#36710#36317#21491#36793#32447#22823#20110'30CM'
          DataField = #20572#36710#36317#21491#36793#32447#22823#20110'30CM'
          DataSource = DataSource2
          TabOrder = 26
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object DBCheckBox28: TDBCheckBox
          Left = 544
          Top = 120
          Width = 81
          Height = 17
          Caption = #19981#31995#20445#38505#24102
          DataField = #19981#31995#20445#38505#24102
          DataSource = DataSource2
          TabOrder = 27
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object DBCheckBox29: TDBCheckBox
          Left = 368
          Top = 120
          Width = 137
          Height = 17
          Caption = #36807#38480#21046#38376#36710#36895#20302#20110'20KM'
          DataField = #36807#38480#21046#38376#36710#36895#20302#20110'20KM'
          DataSource = DataSource2
          TabOrder = 28
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object DBCheckBox30: TDBCheckBox
          Left = 16
          Top = 144
          Width = 129
          Height = 17
          Caption = #30334#31859#19981#33021#23436#25104#21152#20943#26723
          DataField = #30334#31859#19981#33021#23436#25104#21152#20943#26723
          DataSource = DataSource2
          TabOrder = 29
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object DBCheckBox31: TDBCheckBox
          Left = 208
          Top = 144
          Width = 65
          Height = 17
          Caption = #25250#36947#34892#39542
          DataField = #25250#36947#34892#39542
          DataSource = DataSource2
          TabOrder = 30
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object DBCheckBox32: TDBCheckBox
          Left = 368
          Top = 144
          Width = 89
          Height = 17
          Caption = #36829#36820#36335#21475#35268#23450
          DataField = #36829#36820#36335#21475#35268#23450
          DataSource = DataSource2
          TabOrder = 31
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object DBCheckBox33: TDBCheckBox
          Left = 544
          Top = 144
          Width = 105
          Height = 17
          Caption = #19981#25353#23548#21521#32447#34892#36710
          DataField = #19981#25353#23548#21521#32447#34892#36710
          DataSource = DataSource2
          TabOrder = 32
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object DBCheckBox34: TDBCheckBox
          Left = 16
          Top = 168
          Width = 81
          Height = 17
          Caption = #21152#26723#19981#21152#27833
          DataField = #21152#26723#19981#21152#27833
          DataSource = DataSource2
          TabOrder = 33
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object DBCheckBox35: TDBCheckBox
          Left = 208
          Top = 168
          Width = 81
          Height = 17
          Caption = #20943#26723#19981#26494#27833
          DataField = #20943#26723#19981#26494#27833
          DataSource = DataSource2
          TabOrder = 34
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object DBCheckBox36: TDBCheckBox
          Left = 368
          Top = 168
          Width = 129
          Height = 17
          Caption = #31354#27833#26102#26426#19982#22823#23567#27424#20934
          DataField = #31354#27833#26102#26426#19982#22823#23567#27424#20934
          DataSource = DataSource2
          TabOrder = 35
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object DBCheckBox37: TDBCheckBox
          Left = 544
          Top = 168
          Width = 65
          Height = 17
          Caption = #36215#27493#31388#21160
          DataField = #36215#27493#31388#21160
          DataSource = DataSource2
          TabOrder = 36
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object DBCheckBox38: TDBCheckBox
          Left = 16
          Top = 192
          Width = 153
          Height = 17
          Caption = #19981#33021#26681#25454#30446#26631#20570#30456#24212#21160#20316
          DataField = #19981#33021#26681#25454#30446#26631#20570#30456#24212#21160#20316
          DataSource = DataSource2
          TabOrder = 37
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
      end
      object Panel1: TPanel
        Left = 8
        Top = 383
        Width = 657
        Height = 41
        BevelOuter = bvLowered
        TabOrder = 5
        object DBNavigator1: TDBNavigator
          Left = 8
          Top = 8
          Width = 240
          Height = 25
          DataSource = DataSource2
          TabOrder = 0
        end
        object BitBtn1: TBitBtn
          Left = 480
          Top = 8
          Width = 75
          Height = 25
          Caption = #25171#21360
          TabOrder = 1
        end
        object BitBtn2: TBitBtn
          Left = 568
          Top = 8
          Width = 75
          Height = 25
          Caption = #36864#20986
          TabOrder = 2
          OnClick = BitBtn2Click
        end
      end
      object DBEdit7: TDBEdit
        Left = 336
        Top = 120
        Width = 57
        Height = 20
        DataField = #24314#26723#20154
        DataSource = DataSource2
        TabOrder = 6
      end
      object DBEdit8: TDBEdit
        Left = 464
        Top = 120
        Width = 65
        Height = 20
        DataField = #24314#26723#26085#26399
        DataSource = DataSource2
        TabOrder = 7
      end
    end
    object TabSheet2: TTabSheet
      Caption = #26597#35810
      ImageIndex = 1
      object Panel2: TPanel
        Left = 0
        Top = 7
        Width = 681
        Height = 41
        BevelOuter = bvLowered
        TabOrder = 0
        object Label10: TLabel
          Left = 8
          Top = 15
          Width = 60
          Height = 12
          Caption = #26597#35810#26465#20214#65306
        end
        object Label11: TLabel
          Left = 197
          Top = 14
          Width = 12
          Height = 12
          Caption = #65306
        end
        object BitBtn3: TBitBtn
          Left = 520
          Top = 8
          Width = 75
          Height = 25
          Caption = #25171#21360'(&P)'
          TabOrder = 0
        end
        object BitBtn4: TBitBtn
          Left = 600
          Top = 8
          Width = 75
          Height = 25
          Caption = #36864#20986'(&X)'
          TabOrder = 1
          OnClick = BitBtn2Click
        end
        object ComboBox1: TComboBox
          Left = 68
          Top = 11
          Width = 89
          Height = 20
          ItemHeight = 0
          TabOrder = 2
          Text = 'ComboBox1'
        end
        object ComboBox2: TComboBox
          Left = 156
          Top = 11
          Width = 41
          Height = 20
          ItemHeight = 12
          ItemIndex = 0
          TabOrder = 3
          Text = '='
          Items.Strings = (
            '='
            '>'
            '<'
            '>='
            '<='
            '<>'
            'like')
        end
        object Edit6: TEdit
          Left = 209
          Top = 11
          Width = 113
          Height = 20
          TabOrder = 4
        end
        object BitBtn5: TBitBtn
          Left = 440
          Top = 8
          Width = 75
          Height = 25
          Caption = #26597#35810'(&S)'
          TabOrder = 5
          OnClick = BitBtn5Click
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 392
        Width = 681
        Height = 32
        BevelOuter = bvLowered
        TabOrder = 1
        object DBNavigator3: TDBNavigator
          Left = 1
          Top = 4
          Width = 680
          Height = 24
          DataSource = DataSource3
          TabOrder = 0
        end
      end
      object DBGridEh1: TDBGridEh
        Left = 0
        Top = 56
        Width = 681
        Height = 329
        FooterColor = clWindow
        FooterFont.Charset = GB2312_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -12
        FooterFont.Name = #23435#20307
        FooterFont.Style = []
        TabOrder = 2
        TitleFont.Charset = GB2312_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 32
  end
  object Table1: TTable
    Active = True
    DatabaseName = 'jx'
    TableName = 'student'
    Left = 64
    object Table1BDEDesigner6: TStringField
      FieldName = #22995#21517
      Size = 8
    end
    object Table1BDEDesigner2: TStringField
      FieldName = #24615#21035
      Size = 2
    end
    object Table1BDEDesigner3: TStringField
      FieldName = #36523#20221#35777#21495
    end
    object Table1BDEDesigner4: TStringField
      FieldName = #23398#20064#36710#22411
      Size = 4
    end
    object Table1BDEDesigner5: TStringField
      FieldName = #20934#32771#35777#32534#21495
      Size = 15
    end
    object Table1BDEDesigner: TStringField
      FieldName = #23398#21495
      Size = 6
    end
  end
  object Database1: TDatabase
    AliasName = 'jx'
    Connected = True
    DatabaseName = 'jx'
    LoginPrompt = False
    SessionName = 'Default'
  end
  object DataSource2: TDataSource
    DataSet = Table2
    Left = 96
  end
  object Table2: TTable
    Active = True
    AfterInsert = Table2AfterInsert
    BeforePost = Table2BeforePost
    AfterScroll = Table2AfterScroll
    DatabaseName = 'jx'
    TableName = #36335#32771#27979#39564#25104#32489
    Left = 128
    object Table2BDEDesigner: TStringField
      FieldName = #23398#21495
      Size = 7
    end
    object Table2BDEDesigner2: TBooleanField
      FieldName = #25104#32489
      Required = True
    end
    object Table2BDEDesigner3: TDateTimeField
      FieldName = #27979#39564#26102#38388
    end
    object Table2BDEDesigner38: TStringField
      FieldName = #24314#26723#20154
      Size = 8
    end
    object Table2BDEDesigner39: TDateTimeField
      FieldName = #24314#26723#26085#26399
    end
    object Table2BDEDesigner4: TBooleanField
      FieldName = #19981#20851#36710#38376
      Required = True
    end
    object Table2BDEDesigner30CM: TBooleanField
      FieldName = #21518#28316#22823#20110'30CM'
      Required = True
    end
    object Table2BDEDesigner5: TBooleanField
      FieldName = #36305#26041#21521
      Required = True
    end
    object Table2BDEDesigner6: TBooleanField
      FieldName = #21452#25163#33073#25226
      Required = True
    end
    object Table2BDEDesigner7: TBooleanField
      FieldName = #20302#22836#30475#26723
      Required = True
    end
    object Table2BDEDesigner8: TBooleanField
      FieldName = #31354#26723#28369#34892
      Required = True
    end
    object Table2BDEDesigner9: TBooleanField
      FieldName = #25346#38169#26723
      Required = True
    end
    object Table2BDEDesigner10: TBooleanField
      FieldName = #29060#28779
      Required = True
    end
    object Table2BDEDesigner11: TBooleanField
      FieldName = #21709#40831
      Required = True
    end
    object Table2BDEDesigner12: TBooleanField
      FieldName = #21327#35843#24046
      Required = True
    end
    object Table2BDEDesigner13: TBooleanField
      FieldName = #25481#26725
      Required = True
    end
    object Table2BDEDesigner14: TBooleanField
      FieldName = #25250#26723#19981#20837
      Required = True
    end
    object Table2BDEDesigner15: TBooleanField
      FieldName = #25166#20013#24515#32447
      Required = True
    end
    object Table2BDEDesigner16: TBooleanField
      FieldName = #24378#34892#36229#36710
      Required = True
    end
    object Table2BDEDesigner17: TBooleanField
      FieldName = #19981#40483#21495
      Required = True
    end
    object Table2BDEDesigner18: TBooleanField
      FieldName = #36710#36523#20301#32622#24863#35273#24046
      Required = True
    end
    object Table2BDEDesigner19: TBooleanField
      FieldName = #19981#25289#25163#21049
      Required = True
    end
    object Table2BDEDesigner20: TBooleanField
      FieldName = #19981#26494#25163#21049
      Required = True
    end
    object Table2BDEDesigner21: TBooleanField
      FieldName = #19981#26816#26597#20202#34920
      Required = True
    end
    object Table2BDEDesigner22: TBooleanField
      FieldName = #21046#21160#19981#24179#39034
      Required = True
    end
    object Table2BDEDesigner23: TBooleanField
      FieldName = #19981#20250#20351#29992#36716#21521#28783
      Required = True
    end
    object Table2BDEDesigner24: TBooleanField
      FieldName = #19981#20250#20351#29992#20108#33050#31163#21512#22120
      Required = True
    end
    object Table2BDEDesigner25: TBooleanField
      FieldName = #36215#27493#27833#38376#36807#22823
      Required = True
    end
    object Table2BDEDesigner26: TBooleanField
      FieldName = #36710#36718#20986#32447
      Required = True
    end
    object Table2BDEDesigner27: TBooleanField
      FieldName = #23450#28857#20572#36710#36807#28857
      Required = True
    end
    object Table2BDEDesigner50CM: TBooleanField
      FieldName = #20572#36710#27178#32437#21521#36317#31163#22823#20110'50CM'
      Required = True
    end
    object Table2BDEDesigner30CM2: TBooleanField
      FieldName = #20572#36710#36317#21491#36793#32447#22823#20110'30CM'
      Required = True
    end
    object Table2BDEDesigner28: TBooleanField
      FieldName = #19981#31995#20445#38505#24102
      Required = True
    end
    object Table2BDEDesigner20KM: TBooleanField
      FieldName = #36807#38480#21046#38376#36710#36895#20302#20110'20KM'
      Required = True
    end
    object Table2BDEDesigner29: TBooleanField
      FieldName = #30334#31859#19981#33021#23436#25104#21152#20943#26723
      Required = True
    end
    object Table2BDEDesigner30: TBooleanField
      FieldName = #25250#36947#34892#39542
      Required = True
    end
    object Table2BDEDesigner31: TBooleanField
      FieldName = #36829#36820#36335#21475#35268#23450
      Required = True
    end
    object Table2BDEDesigner32: TBooleanField
      FieldName = #19981#25353#23548#21521#32447#34892#36710
      Required = True
    end
    object Table2BDEDesigner33: TBooleanField
      FieldName = #21152#26723#19981#21152#27833
      Required = True
    end
    object Table2BDEDesigner34: TBooleanField
      FieldName = #20943#26723#19981#26494#27833
      Required = True
    end
    object Table2BDEDesigner35: TBooleanField
      FieldName = #31354#27833#26102#26426#19982#22823#23567#27424#20934
      Required = True
    end
    object Table2BDEDesigner36: TBooleanField
      FieldName = #36215#27493#31388#21160
      Required = True
    end
    object Table2BDEDesigner37: TBooleanField
      FieldName = #19981#33021#26681#25454#30446#26631#20570#30456#24212#21160#20316
      Required = True
    end
  end
  object DataSource3: TDataSource
    DataSet = Query1
    Left = 488
    Top = 8
  end
  object Query1: TQuery
    Active = True
    CachedUpdates = True
    DatabaseName = 'jx'
    SQL.Strings = (
      
        'SELECT a.'#22995#21517', a.'#24615#21035', a.'#36523#20221#35777#21495', a.'#23398#20064#36710#22411', a.'#20934#32771#35777#32534#21495', b.* FROM Student a, ' +
        #36335#32771#27979#39564#25104#32489'  b WHERE  (a.'#23398#21495' = b.'#23398#21495')  ')
    Left = 520
    Top = 8
  end
  object frxReport1: TfrxReport
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38558.856423067100000000
    ReportOptions.LastChange = 38558.995310509300000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxReport1GetValue
    OnProgressStart = frxReport1ProgressStart
    Left = 552
    Top = 8
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object PageHeader1: TfrxPageHeader
        Height = 64.252010000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo54: TfrxMemoView
          Left = 322.519893330000000000
          Top = 1.259843329999999000
          Width = 216.693053330000000000
          Height = 40.314986670000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -35
          Font.Name = #23435#20307
          Font.Style = []
          HAlign = haCenter
          Memo.Strings = (
            #36335#32771#27979#39564#25104#32489)
          ParentFont = False
          VAlign = vaCenter
        end
        object Line1: TfrxLineView
          Left = 328.819110000000000000
          Top = 41.574830000000000000
          Width = 204.094620000000000000
          Frame.Style = fsDouble
          Frame.Typ = [ftTop]
          Frame.Width = 1.500000000000000000
        end
      end
      object MasterData1: TfrxMasterData
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = #23435#20307
        Font.Style = []
        Height = 483.779840000000000000
        ParentFont = False
        Top = 143.622140000000000000
        Width = 1046.929810000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Memo1: TfrxMemoView
          Left = 65.385900000000000000
          Top = 6.779529999999994000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DataField = #22995#21517
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.Strings = (
            '[frxDBDataset1."'#22995#21517'"]')
        end
        object Memo2: TfrxMemoView
          Left = 1.133890000000000000
          Top = 6.779529999999994000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Memo.Strings = (
            #22995#21517':')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 235.464750000000000000
          Top = 7.559059999999931000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataField = #24615#21035
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.Strings = (
            '[frxDBDataset1."'#24615#21035'"]')
        end
        object Memo4: TfrxMemoView
          Left = 167.433210000000000000
          Top = 7.559059999999988000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Memo.Strings = (
            #24615#21035':')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 583.181510000000000000
          Top = 7.559059999999931000
          Width = 222.992270000000000000
          Height = 18.897650000000000000
          DataField = #36523#20221#35777#21495
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.Strings = (
            '[frxDBDataset1."'#36523#20221#35777#21495'"]')
        end
        object Memo6: TfrxMemoView
          Left = 481.134200000000000000
          Top = 7.559059999999988000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Memo.Strings = (
            #36523#20221#35777#21495':')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 613.417750000000000000
          Top = 45.354359999999900000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          DataField = #20934#32771#35777#32534#21495
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.Strings = (
            '[frxDBDataset1."'#20934#32771#35777#32534#21495'"]')
        end
        object Memo8: TfrxMemoView
          Left = 484.913730000000000000
          Top = 45.354360000000010000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Memo.Strings = (
            #20934#32771#35777#32534#21495':')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 0.692950000000000000
          Top = 45.354360000000010000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Memo.Strings = (
            #25104#32489':')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 64.944960000000000000
          Top = 45.354360000000010000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          DataField = #25104#32489
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.Strings = (
            '[frxDBDataset1."'#25104#32489'"]')
        end
        object Memo11: TfrxMemoView
          Left = 269.039580000000000000
          Top = 45.354360000000010000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          DataField = #27979#39564#26102#38388
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.Strings = (
            '[frxDBDataset1."'#27979#39564#26102#38388'"]')
        end
        object Memo12: TfrxMemoView
          Left = 166.992270000000000000
          Top = 45.354360000000010000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Memo.Strings = (
            #27979#39564#26102#38388':')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 408.882190000000000000
          Top = 7.559059999999931000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          DataField = #23398#20064#36710#22411
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.Strings = (
            '[frxDBDataset1."'#23398#20064#36710#22411'"]')
        end
        object Memo14: TfrxMemoView
          Left = 344.630180000000000000
          Top = 7.559059999999988000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Memo.Strings = (
            #35777#21035':')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = -0.566893330000000000
          Top = 86.929190000000000000
          Width = 123.464646670000000000
          Height = 25.196866670000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Memo.Strings = (
            #19981#21450#26684#21407#22240':')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 0.692950000000000000
          Top = 128.504020000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #19981#20851#36710#38376)
        end
        object Memo19: TfrxMemoView
          Left = 191.874150000000000000
          Top = 128.504020000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #21518#28316#22823#20110'30CM')
        end
        object CheckBox1: TfrxCheckBoxView
          Left = 104.803149610000000000
          Top = 130.283550000000000000
          Width = 15.118110240000000000
          Height = 15.118110240000000000
          CheckColor = clBlack
          CheckStyle = csCross
          DataField = #19981#20851#36710#38376
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object CheckBox2: TfrxCheckBoxView
          Left = 309.102362204724000000
          Top = 132.283550000000000000
          Width = 15.118110240000000000
          Height = 15.118110240000000000
          CheckColor = clBlack
          CheckStyle = csCross
          DataField = #21518#28316#22823#20110'30CM'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo16: TfrxMemoView
          Left = 408.748300000000000000
          Top = 132.283550000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #36305' '#26041' '#21521)
        end
        object CheckBox3: TfrxCheckBoxView
          Left = 491.409448820000000000
          Top = 136.063080000000000000
          Width = 15.118110240000000000
          Height = 15.118110240000000000
          CheckColor = clBlack
          CheckStyle = csCross
          DataField = #36305#26041#21521
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo18: TfrxMemoView
          Left = 0.692950000000000000
          Top = 162.740260000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #25346'  '#38169'  '#26723)
        end
        object CheckBox4: TfrxCheckBoxView
          Left = 104.803149610000000000
          Top = 167.767038000000000000
          Width = 15.118110240000000000
          Height = 15.118110240000000000
          CheckColor = clBlack
          CheckStyle = csCross
          DataField = #25346#38169#26723
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo20: TfrxMemoView
          Left = 4.472480000000000000
          Top = 200.535560000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #25166#20013#24515#32447)
        end
        object CheckBox5: TfrxCheckBoxView
          Left = 104.803149610000000000
          Top = 205.250526000000000000
          Width = 15.118110240000000000
          Height = 15.118110240000000000
          CheckColor = clBlack
          CheckStyle = csCross
          DataField = #25166#20013#24515#32447
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo21: TfrxMemoView
          Left = 4.472480000000000000
          Top = 238.330860000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #19981#26816#26597#20202#34920)
        end
        object CheckBox6: TfrxCheckBoxView
          Left = 104.803149610000000000
          Top = 242.734014000000000000
          Width = 15.118110240000000000
          Height = 15.118110240000000000
          CheckColor = clBlack
          CheckStyle = csCross
          DataField = #19981#26816#26597#20202#34920
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo22: TfrxMemoView
          Left = 4.472480000000000000
          Top = 279.905690000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #36710#36718#20986#32447' ')
        end
        object CheckBox7: TfrxCheckBoxView
          Left = 104.803149610000000000
          Top = 280.217502000000000000
          Width = 15.118110240000000000
          Height = 15.118110240000000000
          CheckColor = clBlack
          CheckStyle = csCross
          DataField = #36710#36718#20986#32447
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo23: TfrxMemoView
          Left = 226.330860000000000000
          Top = 385.732530000000100000
          Width = 192.756030000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #36807#38480#21046#38376#36710#36895#20302#20110'20KM')
        end
        object CheckBox8: TfrxCheckBoxView
          Left = 422.866420000000000000
          Top = 389.512059999999900000
          Width = 15.118110240000000000
          Height = 15.118110240000000000
          CheckColor = clBlack
          CheckStyle = csCross
          DataField = #36807#38480#21046#38376#36710#36895#20302#20110'20KM'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo24: TfrxMemoView
          Left = 191.874150000000000000
          Top = 162.740260000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #29060'      '#28779)
        end
        object CheckBox9: TfrxCheckBoxView
          Left = 309.102362204724000000
          Top = 166.519790000000000000
          Width = 15.118110240000000000
          Height = 15.118110240000000000
          CheckColor = clBlack
          CheckStyle = csCross
          DataField = #29060#28779
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo25: TfrxMemoView
          Left = 191.874150000000000000
          Top = 200.535560000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #24378' '#34892' '#36229' '#36710)
        end
        object CheckBox10: TfrxCheckBoxView
          Left = 309.102362204724000000
          Top = 204.315090000000000000
          Width = 15.118110240000000000
          Height = 15.118110240000000000
          CheckColor = clBlack
          CheckStyle = csCross
          DataField = #24378#34892#36229#36710
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo26: TfrxMemoView
          Left = 191.874150000000000000
          Top = 238.330860000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #21046#21160#19981#24179#39034)
        end
        object CheckBox11: TfrxCheckBoxView
          Left = 309.102362204724000000
          Top = 242.110390000000000000
          Width = 15.118110240000000000
          Height = 15.118110240000000000
          CheckColor = clBlack
          CheckStyle = csCross
          DataField = #21046#21160#19981#24179#39034
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo27: TfrxMemoView
          Left = 191.874150000000000000
          Top = 276.126160000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #23450#28857#20572#36710#36807#28857)
        end
        object CheckBox12: TfrxCheckBoxView
          Left = 309.102362204724000000
          Top = 279.905690000000000000
          Width = 15.118110240000000000
          Height = 15.118110240000000000
          CheckColor = clBlack
          CheckStyle = csCross
          DataField = #23450#28857#20572#36710#36807#28857
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo28: TfrxMemoView
          Left = 4.472480000000000000
          Top = 313.921460000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #21152#26723#19981#21152#27833)
        end
        object CheckBox13: TfrxCheckBoxView
          Left = 104.803149610000000000
          Top = 317.700990000000000000
          Width = 15.118110240000000000
          Height = 15.118110240000000000
          CheckColor = clBlack
          CheckStyle = csCross
          DataField = #21152#26723#19981#21152#27833
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo29: TfrxMemoView
          Left = 192.094620000000000000
          Top = 313.921460000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #20943#26723#19981#26494#27833)
        end
        object CheckBox14: TfrxCheckBoxView
          Left = 309.102362204724000000
          Top = 317.700990000000000000
          Width = 15.118110240000000000
          Height = 15.118110240000000000
          CheckColor = clBlack
          CheckStyle = csCross
          DataField = #20943#26723#19981#26494#27833
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo30: TfrxMemoView
          Left = 229.362400000000000000
          Top = 351.716760000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #30334#31859#19981#33021#23436#25104#21152#20943#26723)
        end
        object CheckBox15: TfrxCheckBoxView
          Left = 403.220780000000000000
          Top = 355.496290000000000000
          Width = 15.118110240000000000
          Height = 15.118110240000000000
          CheckColor = clBlack
          CheckStyle = csCross
          DataField = #30334#31859#19981#33021#23436#25104#21152#20943#26723
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo31: TfrxMemoView
          Left = 408.748300000000000000
          Top = 166.519790000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #21709'    '#40831)
        end
        object CheckBox16: TfrxCheckBoxView
          Left = 491.409448820000000000
          Top = 170.299320000000000000
          Width = 15.118110240000000000
          Height = 15.118110240000000000
          CheckColor = clBlack
          CheckStyle = csCross
          DataField = #21709#40831
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo32: TfrxMemoView
          Left = 408.748300000000000000
          Top = 200.535560000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #19981' '#40483' '#21495)
        end
        object CheckBox17: TfrxCheckBoxView
          Left = 491.409448820000000000
          Top = 204.315090000000000000
          Width = 15.118110240000000000
          Height = 15.118110240000000000
          CheckColor = clBlack
          CheckStyle = csCross
          DataField = #19981#40483#21495
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo33: TfrxMemoView
          Left = 778.291900000000000000
          Top = 389.512059999999900000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #19981#20250#20351#29992#36716#21521#28783)
        end
        object CheckBox18: TfrxCheckBoxView
          Left = 914.354980000000000000
          Top = 393.291590000000000000
          Width = 15.118110240000000000
          Height = 15.118110240000000000
          CheckColor = clBlack
          CheckStyle = csCross
          DataField = #19981#20250#20351#29992#36716#21521#28783
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo34: TfrxMemoView
          Left = 472.795610000000000000
          Top = 351.496290000000000000
          Width = 211.653680000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #20572#36710#27178#32437#21521#36317#31163#22823#20110'50CM')
        end
        object CheckBox19: TfrxCheckBoxView
          Left = 684.449290000000000000
          Top = 355.275820000000000000
          Width = 15.118110240000000000
          Height = 15.118110240000000000
          CheckColor = clBlack
          CheckStyle = csCross
          DataField = #20572#36710#27178#32437#21521#36317#31163#22823#20110'50CM'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo35: TfrxMemoView
          Left = 408.748300000000000000
          Top = 276.126160000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #25250#36947#34892#39542)
        end
        object CheckBox20: TfrxCheckBoxView
          Left = 491.409448820000000000
          Top = 279.905690000000000000
          Width = 15.118110240000000000
          Height = 15.118110240000000000
          CheckColor = clBlack
          CheckStyle = csCross
          DataField = #25250#36947#34892#39542
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo36: TfrxMemoView
          Left = 778.126470000000000000
          Top = 313.921460000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #31354#27833#26102#26426#19982#22823#23567#27424#20934)
        end
        object CheckBox21: TfrxCheckBoxView
          Left = 955.000620000000000000
          Top = 317.700990000000000000
          Width = 15.118110240000000000
          Height = 15.118110240000000000
          CheckColor = clBlack
          CheckStyle = csCross
          DataField = #31354#27833#26102#26426#19982#22823#23567#27424#20934
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo37: TfrxMemoView
          Left = 587.724800000000000000
          Top = 132.283550000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #21452#25163#33073#25226)
        end
        object CheckBox22: TfrxCheckBoxView
          Left = 666.401574803150000000
          Top = 136.063080000000000000
          Width = 15.118110240000000000
          Height = 15.118110240000000000
          CheckColor = clBlack
          CheckStyle = csCross
          DataField = #21452#25163#33073#25226
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo38: TfrxMemoView
          Left = 587.724800000000000000
          Top = 162.519790000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #21327' '#35843' '#24046)
        end
        object CheckBox23: TfrxCheckBoxView
          Left = 666.401574803150000000
          Top = 166.299320000000000000
          Width = 15.118110240000000000
          Height = 15.118110240000000000
          CheckColor = clBlack
          CheckStyle = csCross
          DataField = #21327#35843#24046
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo39: TfrxMemoView
          Left = 778.110700000000000000
          Top = 136.063080000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #20302#22836#30475#26723)
        end
        object CheckBox24: TfrxCheckBoxView
          Left = 864.275590550000000000
          Top = 139.842610000000000000
          Width = 15.118110240000000000
          Height = 15.118110240000000000
          CheckColor = clBlack
          CheckStyle = csCross
          DataField = #20302#22836#30475#26723
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo40: TfrxMemoView
          Left = 409.039580000000000000
          Top = 234.330860000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #31354#26723#28369#34892)
        end
        object CheckBox25: TfrxCheckBoxView
          Left = 491.409448820000000000
          Top = 238.110390000000000000
          Width = 15.118110240000000000
          Height = 15.118110240000000000
          CheckColor = clBlack
          CheckStyle = csCross
          DataField = #31354#26723#28369#34892
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo41: TfrxMemoView
          Top = 389.291590000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #36710#36523#20301#32622#24863#35273#24046)
        end
        object CheckBox26: TfrxCheckBoxView
          Left = 136.063080000000000000
          Top = 393.071120000000000000
          Width = 15.118110240000000000
          Height = 15.118110240000000000
          CheckColor = clBlack
          CheckStyle = csCross
          DataField = #36710#36523#20301#32622#24863#35273#24046
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo42: TfrxMemoView
          Top = 351.496290000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #19981#20250#20351#29992#20108#33050#31163#21512#22120)
        end
        object CheckBox27: TfrxCheckBoxView
          Left = 173.858380000000000000
          Top = 355.275820000000000000
          Width = 15.118110240000000000
          Height = 15.118110240000000000
          CheckColor = clBlack
          CheckStyle = csCross
          DataField = #19981#20250#20351#29992#20108#33050#31163#21512#22120
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo43: TfrxMemoView
          Left = 775.772110000000000000
          Top = 351.496290000000000000
          Width = 192.756030000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #20572#36710#36317#21491#36793#32447#22823#20110'30CM')
        end
        object CheckBox28: TfrxCheckBoxView
          Left = 968.528140000000000000
          Top = 355.275820000000000000
          Width = 15.118110240000000000
          Height = 15.118110240000000000
          CheckColor = clBlack
          CheckStyle = csCross
          DataField = #20572#36710#36317#21491#36793#32447#22823#20110'30CM'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo44: TfrxMemoView
          Left = 404.260050000000000000
          Top = 313.700990000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #36829#36820#36335#21475#35268#23450)
        end
        object CheckBox29: TfrxCheckBoxView
          Left = 521.425480000000000000
          Top = 317.480520000000000000
          Width = 15.118110240000000000
          Height = 15.118110240000000000
          CheckColor = clBlack
          CheckStyle = csCross
          DataField = #36829#36820#36335#21475#35268#23450
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo45: TfrxMemoView
          Left = 587.031850000000000000
          Top = 275.905690000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #36215#27493#31388#21160)
        end
        object CheckBox30: TfrxCheckBoxView
          Left = 666.401574803150000000
          Top = 279.685220000000000000
          Width = 15.118110240000000000
          Height = 15.118110240000000000
          CheckColor = clBlack
          CheckStyle = csCross
          DataField = #36215#27493#31388#21160
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo46: TfrxMemoView
          Left = 587.031850000000000000
          Top = 200.315090000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #25481'    '#26725)
        end
        object CheckBox31: TfrxCheckBoxView
          Left = 666.401574803150000000
          Top = 204.094620000000000000
          Width = 15.118110240000000000
          Height = 15.118110240000000000
          CheckColor = clBlack
          CheckStyle = csCross
          DataField = #25481#26725
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo47: TfrxMemoView
          Left = 587.031850000000000000
          Top = 234.330860000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #19981#25289#25163#21049)
        end
        object CheckBox32: TfrxCheckBoxView
          Left = 666.401574803150000000
          Top = 238.110390000000000000
          Width = 15.118110240000000000
          Height = 15.118110240000000000
          CheckColor = clBlack
          CheckStyle = csCross
          DataField = #19981#25289#25163#21049
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo48: TfrxMemoView
          Left = 778.110700000000000000
          Top = 166.299320000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #25250#26723#19981#20837)
        end
        object CheckBox33: TfrxCheckBoxView
          Left = 864.275590550000000000
          Top = 170.078850000000000000
          Width = 15.118110240000000000
          Height = 15.118110240000000000
          CheckColor = clBlack
          CheckStyle = csCross
          DataField = #25250#26723#19981#20837
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo49: TfrxMemoView
          Left = 778.110700000000000000
          Top = 200.315090000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #19981#26494#25163#21049)
        end
        object CheckBox34: TfrxCheckBoxView
          Left = 864.275590550000000000
          Top = 204.094620000000000000
          Width = 15.118110240000000000
          Height = 15.118110240000000000
          CheckColor = clBlack
          CheckStyle = csCross
          DataField = #19981#26494#25163#21049
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo50: TfrxMemoView
          Left = 778.110700000000000000
          Top = 234.330860000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #36215#27493#27833#38376#36807#22823)
        end
        object CheckBox35: TfrxCheckBoxView
          Left = 895.275590551181100000
          Top = 238.110390000000000000
          Width = 15.118110240000000000
          Height = 15.118110240000000000
          CheckColor = clBlack
          CheckStyle = csCross
          DataField = #36215#27493#27833#38376#36807#22823
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo51: TfrxMemoView
          Left = 778.110700000000000000
          Top = 272.126160000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #19981#31995#20445#38505#24102)
        end
        object CheckBox36: TfrxCheckBoxView
          Left = 895.275590550000000000
          Top = 275.905690000000000000
          Width = 15.118110240000000000
          Height = 15.118110240000000000
          CheckColor = clBlack
          CheckStyle = csCross
          DataField = #19981#31995#20445#38505#24102
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo52: TfrxMemoView
          Left = 586.338900000000000000
          Top = 309.921460000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #19981#25353#23548#21521#32447#34892#36710)
        end
        object CheckBox37: TfrxCheckBoxView
          Left = 722.401980000000000000
          Top = 313.700990000000000000
          Width = 15.118110240000000000
          Height = 15.118110240000000000
          CheckColor = clBlack
          CheckStyle = csCross
          DataField = #19981#25353#23548#21521#32447#34892#36710
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo53: TfrxMemoView
          Left = 472.441250000000000000
          Top = 389.291590000000000000
          Width = 211.653680000000000000
          Height = 18.897650000000000000
          Memo.Strings = (
            #19981#33021#26681#25454#30446#26631#20570#30456#24212#21160#20316)
        end
        object CheckBox38: TfrxCheckBoxView
          Left = 684.094930000000000000
          Top = 393.071120000000000000
          Width = 15.118110240000000000
          Height = 15.118110240000000000
          CheckColor = clBlack
          CheckStyle = csCross
          DataField = #19981#33021#26681#25454#30446#26631#20570#30456#24212#21160#20316
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
      end
    end
  end
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Left = 584
    Top = 8
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    DataSource = DataSource3
    Left = 616
    Top = 8
  end
  object frxCheckBoxObject1: TfrxCheckBoxObject
    Left = 336
    Top = 248
  end
end
