object Form4_1: TForm4_1
  Left = 256
  Top = 78
  Width = 544
  Height = 424
  BorderIcons = [biSystemMenu]
  Caption = #36710#36742#32500#20462#20445#20859#35760#24405'  '#36755#20837#31383#21475
  Color = 12615808
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 136
    Top = 16
    Width = 233
    Height = 27
    Caption = #36710#36742#32500#20462#20445#20859#35760#24405
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clYellow
    Font.Height = -27
    Font.Name = #26999#20307'_GB2312'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 56
    Width = 505
    Height = 289
    TabOrder = 0
    object Label2: TLabel
      Left = 16
      Top = 16
      Width = 39
      Height = 16
      Caption = #36710#21495#65306
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clYellow
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 160
      Top = 16
      Width = 39
      Height = 16
      Caption = #36710#20027#65306
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clYellow
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 280
      Top = 16
      Width = 39
      Height = 16
      Caption = #36710#22411#65306
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clYellow
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 16
      Top = 64
      Width = 99
      Height = 16
      Caption = #26085#26399#65288#24180'-'#26376'-'#26085#65289
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clYellow
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 160
      Top = 64
      Width = 52
      Height = 16
      Caption = #20445#20859#32423#21035
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clYellow
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 280
      Top = 64
      Width = 39
      Height = 16
      Caption = #25215#20462#20154
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clYellow
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 16
      Top = 168
      Width = 95
      Height = 16
      Caption = #32500#20462'/'#20445#20859#20869#23481#65306
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clYellow
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 328
      Top = 168
      Width = 39
      Height = 16
      Caption = #22791#27880#65306
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clYellow
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 16
      Top = 112
      Width = 39
      Height = 16
      Caption = #36335#30721#65306
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clYellow
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object DBEdit1: TDBEdit
      Left = 16
      Top = 32
      Width = 121
      Height = 21
      DataField = #36710#21495
      DataSource = DataSource1
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 160
      Top = 32
      Width = 97
      Height = 24
      DataField = #36710#20027
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 280
      Top = 32
      Width = 209
      Height = 24
      DataField = #36710#22411
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 16
      Top = 80
      Width = 121
      Height = 24
      DataField = #26085#26399
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object DBEdit5: TDBEdit
      Left = 280
      Top = 80
      Width = 121
      Height = 24
      DataField = #25215#20462#20154
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object DBMemo1: TDBMemo
      Left = 16
      Top = 184
      Width = 281
      Height = 89
      DataField = #32500#20462'/'#20445#20859#20869#23481
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object DBMemo2: TDBMemo
      Left = 328
      Top = 184
      Width = 169
      Height = 89
      DataField = #22791#27880
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
    object DBEdit6: TDBEdit
      Left = 16
      Top = 128
      Width = 265
      Height = 24
      DataField = #36335#30721
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
    end
    object DBComboBox1: TDBComboBox
      Left = 160
      Top = 80
      Width = 105
      Height = 21
      DataField = #20445#20859#32423#21035
      DataSource = DataSource1
      ItemHeight = 13
      Items.Strings = (
        'A'#32423
        'B'#32423
        'C'#32423
        'D'#32423
        'E'#32423
        #20854#20182)
      TabOrder = 8
    end
  end
  object DBNavigator1: TDBNavigator
    Left = 32
    Top = 360
    Width = 231
    Height = 25
    DataSource = DataSource1
    VisibleButtons = [nbPrior, nbNext, nbInsert, nbEdit, nbPost, nbCancel, nbRefresh]
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 360
    Top = 360
    Width = 113
    Height = 25
    Cancel = True
    Caption = #36820#22238#20027#31383#21475
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = BitBtn1Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      33333FF3333333333333447333333333333377FFF33333333333744473333333
      333337773FF3333333333444447333333333373F773FF3333333334444447333
      33333373F3773FF3333333744444447333333337F333773FF333333444444444
      733333373F3333773FF333334444444444733FFF7FFFFFFF77FF999999999999
      999977777777777733773333CCCCCCCCCC3333337333333F7733333CCCCCCCCC
      33333337F3333F773333333CCCCCCC3333333337333F7733333333CCCCCC3333
      333333733F77333333333CCCCC333333333337FF7733333333333CCC33333333
      33333777333333333333CC333333333333337733333333333333}
    NumGlyphs = 2
  end
  object Table1: TTable
    DatabaseName = 'car'
    TableName = #36710#36742#32500#20462#20445#20859#32426#24405'.DB'
    Left = 48
    Top = 312
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 88
    Top = 312
  end
end
