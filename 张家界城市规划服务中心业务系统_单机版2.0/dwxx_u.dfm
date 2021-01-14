object frm_dwxx: Tfrm_dwxx
  Left = 0
  Top = 0
  Caption = #21333#20301#20449#24687
  ClientHeight = 458
  ClientWidth = 649
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 264
    Top = 16
    Width = 140
    Height = 35
    Caption = #21333#20301#20449#24687
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -35
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 40
    Top = 80
    Width = 80
    Height = 16
    Caption = #21333#20301#21517#31216#65306
    FocusControl = DBEdit1
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 40
    Top = 120
    Width = 80
    Height = 16
    Caption = #39033#30446#21517#31216#65306
    FocusControl = DBEdit2
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 40
    Top = 160
    Width = 80
    Height = 16
    Caption = #36127' '#36131' '#20154#65306
    FocusControl = DBEdit3
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 252
    Top = 160
    Width = 80
    Height = 16
    Caption = #21150#20844#30005#35805#65306
    FocusControl = DBEdit4
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 456
    Top = 160
    Width = 48
    Height = 16
    Caption = #25163#26426#65306
    FocusControl = DBEdit5
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 40
    Top = 200
    Width = 48
    Height = 16
    Caption = #22320#22336#65306
    FocusControl = DBEdit6
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 40
    Top = 240
    Width = 48
    Height = 16
    Caption = 'EMAIL:'
    FocusControl = DBEdit7
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label9: TLabel
    Left = 40
    Top = 320
    Width = 48
    Height = 16
    Caption = #22791#27880#65306
    FocusControl = DBMemo1
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label10: TLabel
    Left = 48
    Top = 438
    Width = 24
    Height = 13
    Caption = #39318#26465
  end
  object Label11: TLabel
    Left = 84
    Top = 438
    Width = 36
    Height = 13
    Caption = #19978#19968#26465
  end
  object Label12: TLabel
    Left = 126
    Top = 438
    Width = 36
    Height = 13
    Caption = #19979#19968#26465
  end
  object Label13: TLabel
    Left = 168
    Top = 438
    Width = 24
    Height = 13
    Caption = #23614#26465
  end
  object Label14: TLabel
    Left = 207
    Top = 438
    Width = 24
    Height = 13
    Caption = #26032#22686
  end
  object Label15: TLabel
    Left = 249
    Top = 438
    Width = 24
    Height = 13
    Caption = #21024#38500
  end
  object Label16: TLabel
    Left = 287
    Top = 438
    Width = 24
    Height = 13
    Caption = #32534#36753
  end
  object Label17: TLabel
    Left = 328
    Top = 438
    Width = 24
    Height = 13
    Caption = #20445#23384
  end
  object Label18: TLabel
    Left = 368
    Top = 438
    Width = 24
    Height = 13
    Caption = #21462#28040
  end
  object Label19: TLabel
    Left = 409
    Top = 438
    Width = 24
    Height = 13
    Caption = #21047#26032
  end
  object DBEdit1: TDBEdit
    Left = 120
    Top = 77
    Width = 497
    Height = 24
    DataField = 'dw'
    DataSource = DataSource1
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 120
    Top = 117
    Width = 497
    Height = 24
    DataField = 'xmmc'
    DataSource = DataSource1
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object DBEdit3: TDBEdit
    Left = 126
    Top = 157
    Width = 105
    Height = 24
    DataField = 'fzr'
    DataSource = DataSource1
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object DBEdit4: TDBEdit
    Left = 328
    Top = 157
    Width = 105
    Height = 24
    DataField = 'bgdh'
    DataSource = DataSource1
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object DBEdit5: TDBEdit
    Left = 510
    Top = 157
    Width = 107
    Height = 24
    DataField = 'sj'
    DataSource = DataSource1
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object DBEdit6: TDBEdit
    Left = 94
    Top = 197
    Width = 523
    Height = 24
    DataField = 'dz'
    DataSource = DataSource1
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object DBEdit7: TDBEdit
    Left = 94
    Top = 237
    Width = 523
    Height = 24
    DataField = 'email'
    DataSource = DataSource1
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 6
  end
  object DBMemo1: TDBMemo
    Left = 94
    Top = 280
    Width = 523
    Height = 89
    DataField = 'bz'
    DataSource = DataSource1
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 7
  end
  object BitBtn1: TBitBtn
    Left = 510
    Top = 392
    Width = 91
    Height = 41
    Caption = #20851#38381'(&C)'
    TabOrder = 8
    OnClick = BitBtn1Click
  end
  object DBNavigator1: TDBNavigator
    Left = 40
    Top = 391
    Width = 400
    Height = 41
    DataSource = DataSource1
    TabOrder = 9
  end
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
  end
  object ADOTable1: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'tbl_dwxx'
    Left = 32
    object ADOTable1dw: TWideStringField
      FieldName = 'dw'
      Size = 50
    end
    object ADOTable1xmmc: TWideStringField
      FieldName = 'xmmc'
      Size = 50
    end
    object ADOTable1fzr: TWideStringField
      FieldName = 'fzr'
      Size = 50
    end
    object ADOTable1bgdh: TWideStringField
      FieldName = 'bgdh'
      Size = 50
    end
    object ADOTable1sj: TWideStringField
      FieldName = 'sj'
      Size = 50
    end
    object ADOTable1dz: TWideStringField
      FieldName = 'dz'
      Size = 50
    end
    object ADOTable1email: TWideStringField
      FieldName = 'email'
      Size = 50
    end
    object ADOTable1bz: TWideMemoField
      FieldName = 'bz'
      BlobType = ftWideMemo
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 64
  end
end
