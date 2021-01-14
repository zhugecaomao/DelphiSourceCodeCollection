object xydt: Txydt
  Left = 296
  Top = 216
  Width = 721
  Height = 471
  Caption = #23398#21592#21160#24577
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
    Left = 288
    Top = 0
    Width = 168
    Height = 29
    Caption = #23398' '#21592' '#21160' '#24577
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -29
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 32
    Width = 713
    Height = 409
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #24405#20837
      object Label2: TLabel
        Left = 8
        Top = 12
        Width = 48
        Height = 12
        Caption = #32534'  '#21495#65306
        FocusControl = DBEdit1
      end
      object Label3: TLabel
        Left = 184
        Top = 12
        Width = 60
        Height = 12
        Caption = #32451#26729#23398#21592#65306
      end
      object Label4: TLabel
        Left = 336
        Top = 12
        Width = 84
        Height = 12
        Caption = #22522#30784#36335#35757#23398#21592#65306
      end
      object Label5: TLabel
        Left = 336
        Top = 44
        Width = 84
        Height = 12
        Caption = #22522#22320#36335#35757#23398#21592#65306
      end
      object Label6: TLabel
        Left = 512
        Top = 12
        Width = 96
        Height = 12
        Caption = '1801'#32447#36335#35757#23398#21592#65306
      end
      object Label7: TLabel
        Left = 8
        Top = 44
        Width = 84
        Height = 12
        Caption = #25903#38431#19978#35838#23398#21592#65306
      end
      object Label8: TLabel
        Left = 184
        Top = 44
        Width = 60
        Height = 12
        Caption = #22812#35757#23398#21592#65306
      end
      object Label9: TLabel
        Left = 512
        Top = 44
        Width = 96
        Height = 12
        Caption = #33410#20551#26085#35757#32451#23398#21592#65306
      end
      object SpeedButton1: TSpeedButton
        Left = 304
        Top = 8
        Width = 23
        Height = 22
        Caption = '...'
        OnClick = SpeedButton1Click
      end
      object SpeedButton2: TSpeedButton
        Left = 480
        Top = 8
        Width = 23
        Height = 22
        Caption = '...'
        OnClick = SpeedButton2Click
      end
      object SpeedButton3: TSpeedButton
        Left = 672
        Top = 8
        Width = 23
        Height = 22
        Caption = '...'
        OnClick = SpeedButton3Click
      end
      object SpeedButton4: TSpeedButton
        Left = 152
        Top = 40
        Width = 23
        Height = 22
        Caption = '...'
        OnClick = SpeedButton4Click
      end
      object SpeedButton5: TSpeedButton
        Left = 304
        Top = 40
        Width = 23
        Height = 22
        Caption = '...'
        OnClick = SpeedButton5Click
      end
      object SpeedButton6: TSpeedButton
        Left = 480
        Top = 40
        Width = 23
        Height = 22
        Caption = '...'
        OnClick = SpeedButton6Click
      end
      object SpeedButton7: TSpeedButton
        Left = 672
        Top = 40
        Width = 23
        Height = 22
        Caption = '...'
        OnClick = SpeedButton7Click
      end
      object DBEdit1: TDBEdit
        Left = 56
        Top = 8
        Width = 50
        Height = 20
        DataField = #32534#21495
        DataSource = DataSource1
        Enabled = False
        TabOrder = 0
      end
      object Edit1: TEdit
        Left = 240
        Top = 8
        Width = 57
        Height = 20
        TabOrder = 1
      end
      object Edit2: TEdit
        Left = 416
        Top = 8
        Width = 57
        Height = 20
        TabOrder = 2
      end
      object Edit3: TEdit
        Left = 608
        Top = 8
        Width = 57
        Height = 20
        TabOrder = 3
      end
      object Edit4: TEdit
        Left = 88
        Top = 40
        Width = 57
        Height = 20
        TabOrder = 4
      end
      object Edit5: TEdit
        Left = 240
        Top = 40
        Width = 57
        Height = 20
        TabOrder = 5
      end
      object Edit6: TEdit
        Left = 416
        Top = 40
        Width = 57
        Height = 20
        TabOrder = 6
      end
      object Edit7: TEdit
        Left = 608
        Top = 40
        Width = 57
        Height = 20
        TabOrder = 7
      end
      object GroupBox1: TGroupBox
        Left = 456
        Top = 72
        Width = 241
        Height = 113
        Caption = #20854#23427
        TabOrder = 8
        object Label11: TLabel
          Left = 16
          Top = 32
          Width = 48
          Height = 12
          Caption = #24314#26723#20154#65306
          FocusControl = DBEdit2
        end
        object Label12: TLabel
          Left = 16
          Top = 72
          Width = 60
          Height = 12
          Caption = #24314#26723#26085#26399#65306
          FocusControl = DBEdit3
        end
        object DBEdit2: TDBEdit
          Left = 72
          Top = 29
          Width = 65
          Height = 20
          DataField = #24314#26723#20154
          DataSource = DataSource1
          Enabled = False
          TabOrder = 0
        end
        object DBEdit3: TDBEdit
          Left = 72
          Top = 69
          Width = 73
          Height = 20
          DataField = #24314#26723#26085#26399
          DataSource = DataSource1
          Enabled = False
          TabOrder = 1
        end
      end
      object GroupBox2: TGroupBox
        Left = 8
        Top = 72
        Width = 313
        Height = 113
        Caption = #22791#27880
        TabOrder = 9
        object DBMemo1: TDBMemo
          Left = 16
          Top = 17
          Width = 281
          Height = 89
          DataField = #22791#27880
          DataSource = DataSource1
          ScrollBars = ssBoth
          TabOrder = 0
        end
      end
      object Panel1: TPanel
        Left = 8
        Top = 192
        Width = 689
        Height = 41
        BevelInner = bvLowered
        TabOrder = 10
        object Label10: TLabel
          Left = 214
          Top = 14
          Width = 60
          Height = 12
          Caption = #26597#35810#26465#20214#65306
        end
        object DBNavigator1: TDBNavigator
          Left = 8
          Top = 8
          Width = 200
          Height = 25
          DataSource = DataSource1
          TabOrder = 0
        end
        object ComboBox1: TComboBox
          Left = 272
          Top = 10
          Width = 81
          Height = 20
          ItemHeight = 12
          TabOrder = 1
          Items.Strings = (
            #32451#26729#23398#21592
            #22522#30784#36335#35757#23398#21592
            '1801'#32447#36335#35757#23398#21592
            #25903#38431#19978#35838#23398#21592
            #22812#35757#23398#21592
            #22522#22320#36335#35757#23398#21592
            #33410#20551#26085#35757#32451#23398#21592
            #24314#26723#20154
            #24314#26723#26085#26399)
        end
        object ComboBox2: TComboBox
          Left = 352
          Top = 10
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
        object Edit8: TEdit
          Left = 392
          Top = 10
          Width = 57
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
          Width = 57
          Height = 25
          Caption = #25171#21360'(&P)'
          TabOrder = 6
        end
        object BitBtn4: TBitBtn
          Left = 624
          Top = 8
          Width = 57
          Height = 25
          Caption = #36864#20986'(&X)'
          TabOrder = 7
          OnClick = BitBtn4Click
        end
      end
      object DBGrid1: TDBGrid
        Left = 8
        Top = 244
        Width = 689
        Height = 129
        TabOrder = 11
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
    Left = 8
  end
  object Table1: TTable
    Active = True
    BeforeInsert = Table1BeforeInsert
    AfterInsert = Table1AfterInsert
    BeforePost = Table1BeforePost
    AfterScroll = Table1AfterScroll
    DatabaseName = 'jx'
    TableName = #23398#21592#21160#24577
    Left = 40
    object Table1BDEDesigner: TStringField
      FieldName = #32534#21495
      Size = 6
    end
    object Table1BDEDesigner2: TStringField
      FieldName = #32451#26729#23398#21592
      Size = 6
    end
    object Table1BDEDesigner3: TStringField
      FieldName = #22522#30784#36335#35757#23398#21592
      Size = 6
    end
    object Table1BDEDesigner4: TStringField
      FieldName = #22522#22320#36335#35757#23398#21592
      Size = 6
    end
    object Table1BDEDesigner1801: TStringField
      FieldName = '1801'#32447#36335#35757#23398#21592
      Size = 6
    end
    object Table1BDEDesigner5: TStringField
      FieldName = #25903#38431#19978#35838#23398#21592
      Size = 6
    end
    object Table1BDEDesigner6: TStringField
      FieldName = #22812#35757#23398#21592
      Size = 6
    end
    object Table1BDEDesigner7: TStringField
      FieldName = #33410#20551#26085#35757#32451#23398#21592
      Size = 6
    end
    object Table1BDEDesigner8: TMemoField
      FieldName = #22791#27880
      BlobType = ftMemo
      Size = 1
    end
    object Table1BDEDesigner9: TStringField
      FieldName = #24314#26723#20154
      Size = 8
    end
    object Table1BDEDesigner10: TDateTimeField
      FieldName = #24314#26723#26085#26399
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
    Active = True
    DatabaseName = 'jx'
    TableName = 'student'
    Left = 104
    object Table2BDEDesigner: TStringField
      FieldName = #23398#21495
      Size = 6
    end
    object Table2BDEDesigner2: TStringField
      FieldName = #22995#21517
      Size = 8
    end
  end
end
