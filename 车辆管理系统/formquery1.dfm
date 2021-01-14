object form_query1: Tform_query1
  Left = 188
  Top = 120
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #20250#21592#30331#35760#26723#26696'   '#26597#35810#31383#21475
  ClientHeight = 381
  ClientWidth = 536
  Color = clInactiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clYellow
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object DBGrid1: TDBGrid
    Left = 16
    Top = 208
    Width = 505
    Height = 152
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object BitBtn1: TBitBtn
    Left = 96
    Top = 160
    Width = 113
    Height = 25
    Caption = #24320#22987#26597#35810
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
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
  object GroupBox1: TGroupBox
    Left = 16
    Top = 16
    Width = 505
    Height = 121
    Caption = #26597#35810#26465#20214
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clYellow
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 26
      Height = 16
      Caption = #24207#21495
    end
    object Label2: TLabel
      Left = 24
      Top = 72
      Width = 39
      Height = 16
      Caption = #36523#20221#35777
    end
    object Label3: TLabel
      Left = 144
      Top = 16
      Width = 26
      Height = 16
      Caption = #22995#21517
    end
    object Label4: TLabel
      Left = 160
      Top = 72
      Width = 39
      Height = 16
      Caption = #39550#39542#35777
    end
    object Label5: TLabel
      Left = 232
      Top = 16
      Width = 39
      Height = 16
      Caption = #25143#21475#26412
    end
    object Label7: TLabel
      Left = 368
      Top = 16
      Width = 52
      Height = 16
      Caption = #32852#31995#30005#35805
    end
    object Label6: TLabel
      Left = 387
      Top = 88
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
    object Label8: TLabel
      Left = 328
      Top = 72
      Width = 52
      Height = 16
      Caption = #31199#36710#26102#38388
    end
    object Edit1: TEdit
      Left = 24
      Top = 32
      Width = 105
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 144
      Top = 32
      Width = 73
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object Edit3: TEdit
      Left = 232
      Top = 32
      Width = 121
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object Edit4: TEdit
      Left = 24
      Top = 88
      Width = 121
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object Edit5: TEdit
      Left = 160
      Top = 88
      Width = 121
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object Edit7: TEdit
      Left = 368
      Top = 32
      Width = 121
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object dtp_date1: TDateTimePicker
      Left = 304
      Top = 88
      Width = 81
      Height = 24
      CalAlignment = dtaLeft
      Date = 37206.9523539352
      Time = 37206.9523539352
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 6
    end
    object dtp_date2: TDateTimePicker
      Left = 408
      Top = 88
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
    object CheckBox1: TCheckBox
      Left = 304
      Top = 72
      Width = 17
      Height = 17
      TabOrder = 8
    end
  end
  object BitBtn2: TBitBtn
    Left = 312
    Top = 160
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
  object Table1: TTable
    DatabaseName = 'car'
    TableName = #20250#21592#26723#26696#30331#35760#34920'.DB'
    Left = 96
    Top = 352
  end
  object Query1: TQuery
    DatabaseName = 'car'
    SQL.Strings = (
      'select * from '#20250#21592#26723#26696#30331#35760#34920)
    Left = 56
    Top = 352
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 16
    Top = 352
  end
end
