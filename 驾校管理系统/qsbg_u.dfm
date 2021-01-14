object qsbg: Tqsbg
  Left = 233
  Top = 253
  Width = 763
  Height = 353
  Caption = #35831#31034#25253#21578
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 12
  object Label12: TLabel
    Left = 312
    Top = 8
    Width = 116
    Height = 29
    Caption = #35831#31034#25253#21578
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
    Width = 753
    Height = 281
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #24405#20837
      object GroupBox1: TGroupBox
        Left = 8
        Top = 8
        Width = 729
        Height = 177
        Caption = #22522#26412#20449#24687
        TabOrder = 0
        object Label1: TLabel
          Left = 16
          Top = 27
          Width = 36
          Height = 12
          Caption = #32534#21495#65306
          FocusControl = DBEdit1
        end
        object Label2: TLabel
          Left = 144
          Top = 27
          Width = 48
          Height = 12
          Caption = #35831#31034#20154#65306
          FocusControl = DBEdit2
        end
        object Label3: TLabel
          Left = 264
          Top = 27
          Width = 60
          Height = 12
          Caption = #35831#31034#22788#25152#65306
          FocusControl = DBEdit3
        end
        object Label4: TLabel
          Left = 408
          Top = 27
          Width = 60
          Height = 12
          Caption = #35831#31034#23545#35937#65306
          FocusControl = DBEdit4
        end
        object Label5: TLabel
          Left = 584
          Top = 27
          Width = 60
          Height = 12
          Caption = #35831#31034#26102#38388#65306
          FocusControl = DBEdit5
        end
        object Label6: TLabel
          Left = 16
          Top = 67
          Width = 60
          Height = 12
          Caption = #35831#31034#20107#30001#65306
          FocusControl = DBEdit6
        end
        object Label7: TLabel
          Left = 16
          Top = 104
          Width = 48
          Height = 12
          Caption = #25209#20934#20154#65306
          FocusControl = DBEdit7
        end
        object Label8: TLabel
          Left = 208
          Top = 104
          Width = 60
          Height = 12
          Caption = #25209#20934#24847#35265#65306
          FocusControl = DBEdit8
        end
        object Label9: TLabel
          Left = 16
          Top = 144
          Width = 60
          Height = 12
          Caption = #22788#29702#32467#26524#65306
          FocusControl = DBEdit9
        end
        object Label10: TLabel
          Left = 344
          Top = 144
          Width = 60
          Height = 12
          Caption = #24314#26723#26085#26399#65306
          FocusControl = DBEdit10
        end
        object Label11: TLabel
          Left = 504
          Top = 144
          Width = 48
          Height = 12
          Caption = #24314#26723#20154#65306
          FocusControl = DBEdit11
        end
        object DBEdit1: TDBEdit
          Left = 48
          Top = 24
          Width = 82
          Height = 20
          DataField = #32534#21495
          DataSource = DataSource1
          Enabled = False
          TabOrder = 0
        end
        object DBEdit2: TDBEdit
          Left = 192
          Top = 24
          Width = 57
          Height = 20
          DataField = #35831#31034#20154
          DataSource = DataSource1
          TabOrder = 1
        end
        object DBEdit3: TDBEdit
          Left = 328
          Top = 24
          Width = 65
          Height = 20
          DataField = #35831#31034#22788#25152
          DataSource = DataSource1
          TabOrder = 2
        end
        object DBEdit4: TDBEdit
          Left = 472
          Top = 24
          Width = 97
          Height = 20
          DataField = #35831#31034#23545#35937
          DataSource = DataSource1
          TabOrder = 3
        end
        object DBEdit5: TDBEdit
          Left = 648
          Top = 24
          Width = 73
          Height = 20
          DataField = #35831#31034#26102#38388
          DataSource = DataSource1
          TabOrder = 4
        end
        object DBEdit6: TDBEdit
          Left = 72
          Top = 64
          Width = 641
          Height = 20
          DataField = #35831#31034#20107#30001
          DataSource = DataSource1
          TabOrder = 5
        end
        object DBEdit7: TDBEdit
          Left = 64
          Top = 103
          Width = 134
          Height = 20
          DataField = #25209#20934#20154
          DataSource = DataSource1
          TabOrder = 6
        end
        object DBEdit8: TDBEdit
          Left = 264
          Top = 103
          Width = 273
          Height = 20
          DataField = #25209#20934#24847#35265
          DataSource = DataSource1
          TabOrder = 7
        end
        object DBEdit9: TDBEdit
          Left = 71
          Top = 142
          Width = 264
          Height = 20
          DataField = #22788#29702#32467#26524
          DataSource = DataSource1
          TabOrder = 8
        end
        object DBEdit10: TDBEdit
          Left = 409
          Top = 142
          Width = 81
          Height = 20
          DataField = #24314#26723#26085#26399
          DataSource = DataSource1
          Enabled = False
          TabOrder = 9
        end
        object DBEdit11: TDBEdit
          Left = 552
          Top = 142
          Width = 65
          Height = 20
          DataField = #24314#26723#20154
          DataSource = DataSource1
          Enabled = False
          TabOrder = 10
        end
      end
      object Panel1: TPanel
        Left = 8
        Top = 200
        Width = 729
        Height = 41
        BevelInner = bvLowered
        TabOrder = 1
        object DBNavigator1: TDBNavigator
          Left = 16
          Top = 8
          Width = 240
          Height = 25
          DataSource = DataSource1
          TabOrder = 0
        end
        object BitBtn1: TBitBtn
          Left = 560
          Top = 8
          Width = 75
          Height = 25
          Caption = #25171#21360
          TabOrder = 1
        end
        object BitBtn2: TBitBtn
          Left = 648
          Top = 8
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
    end
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 64
    Top = 8
  end
  object Table1: TTable
    Active = True
    AfterInsert = Table1AfterInsert
    AfterPost = Table1AfterPost
    AfterCancel = Table1AfterCancel
    DatabaseName = 'jx'
    TableName = #35831#31034#25253#21578
    Left = 88
    Top = 8
    object Table1BDEDesigner: TStringField
      FieldName = #32534#21495
      Size = 6
    end
    object Table1BDEDesigner2: TStringField
      FieldName = #35831#31034#20154
      Size = 8
    end
    object Table1BDEDesigner3: TStringField
      FieldName = #35831#31034#22788#25152
      Size = 12
    end
    object Table1BDEDesigner4: TStringField
      FieldName = #35831#31034#23545#35937
      Size = 50
    end
    object Table1BDEDesigner5: TDateTimeField
      FieldName = #35831#31034#26102#38388
    end
    object Table1BDEDesigner6: TStringField
      FieldName = #35831#31034#20107#30001
      Size = 50
    end
    object Table1BDEDesigner7: TStringField
      FieldName = #25209#20934#20154
      Size = 10
    end
    object Table1BDEDesigner8: TStringField
      FieldName = #25209#20934#24847#35265
      Size = 50
    end
    object Table1BDEDesigner9: TStringField
      FieldName = #22788#29702#32467#26524
    end
    object Table1BDEDesigner10: TDateTimeField
      FieldName = #24314#26723#26085#26399
    end
    object Table1BDEDesigner11: TStringField
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
    Left = 120
    Top = 8
  end
  object Table3: TTable
    DatabaseName = 'jx'
    TableName = #35745#25968#22120
    Left = 152
    Top = 8
    object Table3qsbg: TIntegerField
      FieldName = 'qsbg'
    end
  end
end
