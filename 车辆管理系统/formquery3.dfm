object form_query3: Tform_query3
  Left = 167
  Top = 59
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #36710#36742#32500#20462#20445#20859#35760#24405' '#26597#35810#31383#21475
  ClientHeight = 461
  ClientWidth = 542
  Color = clBtnShadow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Label7: TLabel
    Left = 424
    Top = 248
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
  object Label8: TLabel
    Left = 16
    Top = 392
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
  object GroupBox1: TGroupBox
    Left = 16
    Top = 16
    Width = 497
    Height = 161
    Caption = #26597#35810#26465#20214
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clYellow
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 26
      Height = 16
      Caption = #36710#21495
    end
    object Label2: TLabel
      Left = 152
      Top = 16
      Width = 26
      Height = 16
      Caption = #36710#20027
    end
    object Label3: TLabel
      Left = 256
      Top = 16
      Width = 26
      Height = 16
      Caption = #36710#22411
    end
    object Label4: TLabel
      Left = 16
      Top = 72
      Width = 26
      Height = 16
      Caption = #36335#30721
    end
    object Label5: TLabel
      Left = 256
      Top = 72
      Width = 52
      Height = 16
      Caption = #20445#20859#32423#21035
    end
    object Label6: TLabel
      Left = 360
      Top = 72
      Width = 39
      Height = 16
      Caption = #25215#20462#20154
    end
    object Label9: TLabel
      Left = 40
      Top = 136
      Width = 26
      Height = 16
      Caption = #26085#26399
    end
    object Label10: TLabel
      Left = 171
      Top = 136
      Width = 15
      Height = 18
      Caption = #33267
      Font.Charset = ANSI_CHARSET
      Font.Color = clYellow
      Font.Height = -15
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Edit1: TEdit
      Left = 16
      Top = 32
      Width = 121
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clInfoText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 152
      Top = 32
      Width = 89
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clInfoText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object Edit3: TEdit
      Left = 256
      Top = 32
      Width = 225
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clInfoText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object Edit4: TEdit
      Left = 16
      Top = 88
      Width = 217
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clInfoText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object Edit5: TEdit
      Left = 360
      Top = 88
      Width = 121
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clInfoText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object ComboBox1: TComboBox
      Left = 256
      Top = 88
      Width = 89
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clInfoText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 5
      Items.Strings = (
        'A'#32423
        'B'#32423
        'C'#32423
        'D'#32423
        'E'#32423
        #20854#20182)
    end
    object CheckBox1: TCheckBox
      Left = 16
      Top = 136
      Width = 17
      Height = 17
      TabOrder = 6
    end
    object dtp_date1: TDateTimePicker
      Left = 80
      Top = 128
      Width = 81
      Height = 24
      CalAlignment = dtaLeft
      Date = 37206.9523539352
      Time = 37206.9523539352
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 7
    end
    object dtp_date2: TDateTimePicker
      Left = 200
      Top = 128
      Width = 81
      Height = 24
      CalAlignment = dtaLeft
      Date = 37206.9523539352
      Time = 37206.9523539352
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 8
    end
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 240
    Width = 393
    Height = 144
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object BitBtn1: TBitBtn
    Left = 88
    Top = 200
    Width = 129
    Height = 25
    Caption = #26597' '#35810
    Default = True
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
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333FF3FF3333333333CC30003333333333773777333333333C33
      3000333FF33337F33777339933333C3333333377F33337F3333F339933333C33
      33003377333337F33377333333333C333300333F333337F33377339333333C33
      3333337FF3333733333F33993333C33333003377FF33733333773339933C3333
      330033377FF73F33337733339933C33333333FF377F373F3333F993399333C33
      330077F377F337F33377993399333C33330077FF773337F33377399993333C33
      33333777733337F333FF333333333C33300033333333373FF7773333333333CC
      3000333333333377377733333333333333333333333333333333}
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 336
    Top = 200
    Width = 121
    Height = 25
    Cancel = True
    Caption = #36820#22238#20027#31383#21475
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = BitBtn2Click
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
  object DBMemo1: TDBMemo
    Left = 16
    Top = 408
    Width = 513
    Height = 41
    DataField = #32500#20462'/'#20445#20859#20869#23481
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 4
  end
  object DBMemo2: TDBMemo
    Left = 424
    Top = 264
    Width = 105
    Height = 121
    DataField = #22791#27880
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 5
  end
  object Query1: TQuery
    DatabaseName = 'car'
    SQL.Strings = (
      'select * from '#36710#36742#32500#20462#20445#20859#32426#24405)
    Left = 128
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 80
  end
end
