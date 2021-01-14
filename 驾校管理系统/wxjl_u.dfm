object wxjl: Twxjl
  Left = 120
  Top = 143
  Width = 883
  Height = 562
  Caption = #38382#35810#35760#24405
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
  object Label13: TLabel
    Left = 368
    Top = 8
    Width = 116
    Height = 29
    Caption = #38382#35810#35760#24405
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -29
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 40
    Width = 873
    Height = 489
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #24405#20837
      object DBGrid1: TDBGrid
        Left = 8
        Top = 156
        Width = 849
        Height = 281
        DataSource = DataSource1
        PopupMenu = PopupMenu1
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        OnCellClick = DBGrid1CellClick
        Columns = <
          item
            Expanded = False
            FieldName = #32534#21495
            Visible = True
          end
          item
            Expanded = False
            FieldName = #22995#21517
            Visible = True
          end
          item
            Expanded = False
            FieldName = #24615#21035
            Visible = True
          end
          item
            Expanded = False
            FieldName = #25163#26426
            Visible = True
          end
          item
            Expanded = False
            FieldName = #30005#35805
            Visible = True
          end
          item
            Expanded = False
            FieldName = #25311#23398#35777#31867
            PickList.Strings = (
              'A1'
              'A2'
              'B1'
              'B2'
              'C1')
            Visible = True
          end
          item
            Expanded = False
            FieldName = #36523#20221#35777#21495
            Visible = True
          end
          item
            Expanded = False
            FieldName = #20303#22336#25110#21333#20301
            Visible = True
          end
          item
            Expanded = False
            FieldName = #38382#35810#22788#25152
            PickList.Strings = (
              #24066#21306'1'
              #24066#21306'2'
              #26657#26412#37096
              #27494#38517#28304
              #31227#21160#25253#21517
              #20854#23427
              '')
            Visible = True
          end
          item
            Expanded = False
            FieldName = #38382#35810#26102#38388
            Visible = True
          end
          item
            Expanded = False
            FieldName = #22788#29702#32467#26524
            PickList.Strings = (
              #26410#25253#21517
              #24050#25253#21517)
            Visible = True
          end
          item
            Expanded = False
            FieldName = #24314#26723#20154
            Visible = True
          end>
      end
      object DBNavigator1: TDBNavigator
        Left = 8
        Top = 120
        Width = 490
        Height = 25
        DataSource = DataSource1
        TabOrder = 1
      end
      object GroupBox1: TGroupBox
        Left = 8
        Top = 8
        Width = 849
        Height = 105
        Caption = #22522#26412#20449#24687
        TabOrder = 2
        object Label1: TLabel
          Left = 8
          Top = 24
          Width = 36
          Height = 12
          Caption = #32534#21495#65306
          FocusControl = DBEdit1
        end
        object Label2: TLabel
          Left = 104
          Top = 24
          Width = 36
          Height = 12
          Caption = #22995#21517#65306
          FocusControl = DBEdit2
        end
        object Label3: TLabel
          Left = 208
          Top = 24
          Width = 36
          Height = 12
          Caption = #24615#21035#65306
        end
        object Label4: TLabel
          Left = 288
          Top = 24
          Width = 36
          Height = 12
          Caption = #25163#26426#65306
          FocusControl = DBEdit4
        end
        object Label5: TLabel
          Left = 424
          Top = 24
          Width = 36
          Height = 12
          Caption = #30005#35805#65306
          FocusControl = DBEdit5
        end
        object Label6: TLabel
          Left = 552
          Top = 24
          Width = 60
          Height = 12
          Caption = #25311#23398#35777#31867#65306
        end
        object Label7: TLabel
          Left = 672
          Top = 24
          Width = 60
          Height = 12
          Caption = #36523#20221#35777#21495#65306
          FocusControl = DBEdit7
        end
        object Label8: TLabel
          Left = 8
          Top = 64
          Width = 72
          Height = 12
          Caption = #20303#22336#25110#21333#20301#65306
          FocusControl = DBEdit8
        end
        object Label9: TLabel
          Left = 320
          Top = 64
          Width = 60
          Height = 12
          Caption = #38382#35810#22788#25152#65306
        end
        object Label10: TLabel
          Left = 600
          Top = 64
          Width = 60
          Height = 12
          Caption = #38382#35810#26102#38388#65306
          FocusControl = DBEdit10
        end
        object Label11: TLabel
          Left = 464
          Top = 64
          Width = 60
          Height = 12
          Caption = #22788#29702#32467#26524#65306
        end
        object Label12: TLabel
          Left = 736
          Top = 64
          Width = 48
          Height = 12
          Caption = #24314#26723#20154#65306
          FocusControl = DBEdit12
        end
        object DBEdit1: TDBEdit
          Left = 40
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
          Width = 57
          Height = 20
          DataField = #22995#21517
          DataSource = DataSource1
          TabOrder = 1
        end
        object DBEdit4: TDBEdit
          Left = 320
          Top = 24
          Width = 89
          Height = 20
          DataField = #25163#26426
          DataSource = DataSource1
          TabOrder = 2
        end
        object DBEdit5: TDBEdit
          Left = 456
          Top = 24
          Width = 89
          Height = 20
          DataField = #30005#35805
          DataSource = DataSource1
          TabOrder = 3
        end
        object DBEdit7: TDBEdit
          Left = 736
          Top = 24
          Width = 105
          Height = 20
          DataField = #36523#20221#35777#21495
          DataSource = DataSource1
          TabOrder = 4
        end
        object DBEdit8: TDBEdit
          Left = 88
          Top = 64
          Width = 225
          Height = 20
          DataField = #20303#22336#25110#21333#20301
          DataSource = DataSource1
          TabOrder = 5
        end
        object DBEdit10: TDBEdit
          Left = 656
          Top = 64
          Width = 73
          Height = 20
          DataField = #38382#35810#26102#38388
          DataSource = DataSource1
          TabOrder = 6
        end
        object DBEdit12: TDBEdit
          Left = 784
          Top = 64
          Width = 57
          Height = 20
          DataField = #24314#26723#20154
          DataSource = DataSource1
          TabOrder = 7
        end
        object DBComboBox2: TDBComboBox
          Left = 608
          Top = 24
          Width = 57
          Height = 20
          DataField = #25311#23398#35777#31867
          DataSource = DataSource1
          ItemHeight = 12
          TabOrder = 8
          OnDropDown = DBComboBox2DropDown
        end
      end
      object BitBtn1: TBitBtn
        Left = 672
        Top = 120
        Width = 75
        Height = 25
        Caption = #25171#21360
        TabOrder = 3
      end
      object BitBtn2: TBitBtn
        Left = 760
        Top = 120
        Width = 75
        Height = 25
        Caption = #36864#20986
        TabOrder = 4
        OnClick = BitBtn2Click
      end
      object DBComboBox1: TDBComboBox
        Left = 248
        Top = 32
        Width = 41
        Height = 20
        DataField = #24615#21035
        DataSource = DataSource1
        ItemHeight = 12
        TabOrder = 5
        OnDropDown = DBComboBox1DropDown
      end
      object DBComboBox3: TDBComboBox
        Left = 384
        Top = 72
        Width = 81
        Height = 20
        DataField = #38382#35810#22788#25152
        DataSource = DataSource1
        ItemHeight = 12
        TabOrder = 6
        OnDropDown = DBComboBox3DropDown
      end
      object DBComboBox4: TDBComboBox
        Left = 528
        Top = 72
        Width = 73
        Height = 20
        DataField = #22788#29702#32467#26524
        DataSource = DataSource1
        ItemHeight = 12
        TabOrder = 7
        OnDropDown = DBComboBox4DropDown
      end
      object BitBtn3: TBitBtn
        Left = 584
        Top = 120
        Width = 75
        Height = 25
        Caption = #23548#20986'EXCEL'
        TabOrder = 8
        OnClick = BitBtn3Click
      end
    end
    object TabSheet2: TTabSheet
      Caption = #24405#20837
      ImageIndex = 1
      object DBGrid2: TDBGrid
        Left = 8
        Top = 112
        Width = 841
        Height = 337
        DataSource = DataSource3
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
      end
      object GroupBox2: TGroupBox
        Left = 8
        Top = 8
        Width = 841
        Height = 65
        Caption = #26597#35810#26465#20214
        TabOrder = 1
        object Label15: TLabel
          Left = 267
          Top = 27
          Width = 48
          Height = 12
          Caption = #26085#26399#33258#65306
        end
        object Label16: TLabel
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
          Items.Strings = (
            #32534#21495
            #22995#21517
            #25163#26426
            #30005#35805
            #38382#35810#22788#25152
            #22788#29702#32467#26524
            #24314#26723#20154)
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
          Left = 600
          Top = 24
          Width = 73
          Height = 25
          Caption = #26597#35810
          TabOrder = 4
          OnClick = BitBtn4Click
        end
        object BitBtn5: TBitBtn
          Left = 680
          Top = 24
          Width = 73
          Height = 25
          Caption = #25171#21360
          TabOrder = 5
        end
        object BitBtn6: TBitBtn
          Left = 760
          Top = 24
          Width = 73
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
      object DBNavigator2: TDBNavigator
        Left = 8
        Top = 80
        Width = 264
        Height = 26
        DataSource = DataSource3
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        TabOrder = 2
      end
      object BitBtn7: TBitBtn
        Left = 272
        Top = 80
        Width = 73
        Height = 26
        Caption = #20462#25913
        TabOrder = 3
        OnClick = BitBtn7Click
      end
      object BitBtn8: TBitBtn
        Left = 416
        Top = 80
        Width = 73
        Height = 26
        Caption = #28155#21152
        TabOrder = 4
        OnClick = BitBtn8Click
      end
      object BitBtn9: TBitBtn
        Left = 344
        Top = 80
        Width = 73
        Height = 26
        Caption = #25554#20837
        TabOrder = 5
        OnClick = BitBtn9Click
      end
      object BitBtn10: TBitBtn
        Left = 488
        Top = 80
        Width = 73
        Height = 26
        Caption = #21024#38500
        TabOrder = 6
        OnClick = BitBtn10Click
      end
      object BitBtn11: TBitBtn
        Left = 632
        Top = 80
        Width = 73
        Height = 26
        Caption = #21462#28040
        TabOrder = 7
        OnClick = BitBtn11Click
      end
      object BitBtn12: TBitBtn
        Left = 704
        Top = 80
        Width = 73
        Height = 26
        Caption = #21047#26032
        TabOrder = 8
        OnClick = BitBtn12Click
      end
      object BitBtn13: TBitBtn
        Left = 560
        Top = 80
        Width = 73
        Height = 26
        Caption = #20445#23384
        TabOrder = 9
        OnClick = BitBtn13Click
      end
      object BitBtn14: TBitBtn
        Left = 776
        Top = 80
        Width = 73
        Height = 26
        Caption = #23548#20986'EXCLE'
        TabOrder = 10
        OnClick = BitBtn14Click
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 40
  end
  object Table1: TTable
    Active = True
    AfterInsert = Table1AfterInsert
    AfterPost = Table1AfterPost
    AfterCancel = Table1AfterCancel
    DatabaseName = 'jx'
    TableName = #38382#35810#35760#24405
    Left = 72
    object Table1BDEDesigner: TStringField
      FieldName = #32534#21495
      Size = 6
    end
    object Table1BDEDesigner2: TStringField
      FieldName = #22995#21517
      Size = 8
    end
    object Table1BDEDesigner3: TStringField
      FieldName = #24615#21035
      Size = 5
    end
    object Table1BDEDesigner4: TStringField
      FieldName = #25163#26426
      Size = 13
    end
    object Table1BDEDesigner5: TStringField
      FieldName = #30005#35805
      Size = 13
    end
    object Table1BDEDesigner6: TStringField
      FieldName = #25311#23398#35777#31867
      Size = 8
    end
    object Table1BDEDesigner7: TStringField
      FieldName = #36523#20221#35777#21495
    end
    object Table1BDEDesigner8: TStringField
      FieldName = #20303#22336#25110#21333#20301
      Size = 50
    end
    object Table1BDEDesigner9: TStringField
      FieldName = #38382#35810#22788#25152
      Size = 12
    end
    object Table1BDEDesigner10: TDateTimeField
      FieldName = #38382#35810#26102#38388
    end
    object Table1BDEDesigner11: TStringField
      FieldName = #22788#29702#32467#26524
      Size = 8
    end
    object Table1BDEDesigner12: TStringField
      FieldName = #24314#26723#20154
      Size = 8
    end
  end
  object Database1: TDatabase
    AliasName = 'jx'
    Connected = True
    DatabaseName = 'jx'
    LoginPrompt = False
    SessionName = 'Default'
    Left = 104
  end
  object Table2: TTable
    DatabaseName = 'jx'
    TableName = #21442#25968#35774#32622
    Left = 568
  end
  object DataSource2: TDataSource
    DataSet = Table2
    Left = 536
  end
  object PopupMenu1: TPopupMenu
    Left = 136
    object N1: TMenuItem
      Caption = #36716#20026#23398#21592#26723#26696
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #25554#20837
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #28155#21152
      OnClick = N3Click
    end
    object N5: TMenuItem
      Caption = #21024#38500
      OnClick = N5Click
    end
    object N6: TMenuItem
      Caption = #21462#28040
      OnClick = N6Click
    end
  end
  object Query1: TQuery
    BeforeInsert = Query1BeforeInsert
    AfterEdit = Query1AfterEdit
    DatabaseName = 'jx'
    RequestLive = True
    Left = 328
    Top = 8
  end
  object DataSource3: TDataSource
    DataSet = Query1
    Left = 296
    Top = 8
  end
  object Table3: TTable
    DatabaseName = 'jx'
    TableName = #35745#25968#22120
    Left = 176
    object Table3wxjl: TIntegerField
      FieldName = 'wxjl'
    end
  end
end
