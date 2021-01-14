object frm_yhgl: Tfrm_yhgl
  Left = 0
  Top = 0
  Caption = #29992#25143#31649#29702
  ClientHeight = 404
  ClientWidth = 615
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
    Left = 256
    Top = 16
    Width = 116
    Height = 29
    Caption = #29992#25143#31649#29702
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -29
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 24
    Top = 64
    Width = 64
    Height = 16
    Caption = #29992#25143'ID'#65306
    FocusControl = DBEdit1
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 208
    Top = 64
    Width = 72
    Height = 16
    Caption = #22995'   '#21517#65306
    FocusControl = DBEdit2
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 24
    Top = 108
    Width = 64
    Height = 16
    Caption = #23494'  '#30721#65306
    FocusControl = DBEdit3
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 410
    Top = 64
    Width = 64
    Height = 16
    Caption = #37096'  '#38376#65306
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 24
    Top = 144
    Width = 80
    Height = 16
    Caption = #21150#20844#30005#35805#65306
    FocusControl = DBEdit5
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 312
    Top = 144
    Width = 80
    Height = 16
    Caption = #25163'    '#26426#65306
    FocusControl = DBEdit6
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 312
    Top = 106
    Width = 80
    Height = 16
    Caption = #30830#35748#23494#30721#65306
    FocusControl = DBEdit3
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label9: TLabel
    Left = 35
    Top = 380
    Width = 24
    Height = 13
    Caption = #39318#26465
  end
  object Label10: TLabel
    Left = 74
    Top = 380
    Width = 36
    Height = 13
    Caption = #31532#19968#26465
  end
  object Label11: TLabel
    Left = 118
    Top = 380
    Width = 36
    Height = 13
    Caption = #19979#19968#26465
  end
  object Label12: TLabel
    Left = 171
    Top = 380
    Width = 24
    Height = 13
    Caption = #23614#26465
  end
  object Label13: TLabel
    Left = 214
    Top = 380
    Width = 24
    Height = 13
    Caption = #26032#22686
  end
  object Label14: TLabel
    Left = 256
    Top = 380
    Width = 24
    Height = 13
    Caption = #21024#38500
  end
  object Label15: TLabel
    Left = 304
    Top = 380
    Width = 24
    Height = 13
    Caption = #32534#36753
  end
  object Label16: TLabel
    Left = 352
    Top = 380
    Width = 24
    Height = 13
    Caption = #20445#23384
  end
  object Label17: TLabel
    Left = 397
    Top = 380
    Width = 24
    Height = 13
    Caption = #21462#28040
  end
  object Label18: TLabel
    Left = 440
    Top = 380
    Width = 24
    Height = 13
    Caption = #21047#26032
  end
  object DBEdit1: TDBEdit
    Left = 88
    Top = 61
    Width = 97
    Height = 24
    DataField = 'userid'
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
    Left = 278
    Top = 61
    Width = 107
    Height = 24
    DataField = 'yhm'
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
    Left = 88
    Top = 103
    Width = 169
    Height = 24
    DataField = 'mm'
    DataSource = DataSource1
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 2
    OnExit = DBEdit3Exit
  end
  object DBEdit5: TDBEdit
    Left = 104
    Top = 141
    Width = 134
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
  object DBEdit6: TDBEdit
    Left = 390
    Top = 141
    Width = 201
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
  object GroupBox1: TGroupBox
    Left = 23
    Top = 184
    Width = 568
    Height = 137
    Caption = #22791#27880
    TabOrder = 5
    object DBMemo1: TDBMemo
      Left = 16
      Top = 16
      Width = 537
      Height = 105
      DataField = 'bz'
      DataSource = DataSource1
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 0
    end
  end
  object BitBtn2: TBitBtn
    Left = 516
    Top = 336
    Width = 75
    Height = 41
    Caption = #20851#38381'(&C)'
    TabOrder = 6
    OnClick = BitBtn2Click
  end
  object DBNavigator1: TDBNavigator
    Left = 24
    Top = 335
    Width = 450
    Height = 41
    DataSource = DataSource1
    TabOrder = 7
  end
  object Edit1: TEdit
    Left = 390
    Top = 103
    Width = 201
    Height = 24
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 8
    OnExit = Edit1Exit
  end
  object DBComboBox1: TDBComboBox
    Left = 473
    Top = 61
    Width = 118
    Height = 24
    DataField = 'bm'
    DataSource = DataSource1
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = []
    ItemHeight = 16
    Items.Strings = (
      #20449#24687#24037#31243#37096
      #27979#32472#38431
      #36130#21153#23460
      #21150#20844#23460)
    ParentFont = False
    TabOrder = 9
  end
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'E:\tjz\delphi_app\ghj\'#26381#21153#20013#24515#19994#21153#31995#32479'\conn.udl'
    Left = 8
  end
  object ADOTable1: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'tbl_user'
    Left = 40
    object ADOTable1userid: TWideStringField
      FieldName = 'userid'
    end
    object ADOTable1yhm: TWideStringField
      FieldName = 'yhm'
      Size = 50
    end
    object ADOTable1mm: TWideStringField
      FieldName = 'mm'
    end
    object ADOTable1bm: TWideStringField
      FieldName = 'bm'
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
    object ADOTable1qx: TIntegerField
      FieldName = 'qx'
    end
    object ADOTable1bz: TWideMemoField
      FieldName = 'bz'
      BlobType = ftWideMemo
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 72
  end
end
