object Fm_RemoteDb: TFm_RemoteDb
  Left = 49
  Top = 47
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #36828#31243#25805#20316
  ClientHeight = 495
  ClientWidth = 694
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 128
    Height = 16
    Caption = #36890#29992#36828#31243#25968#25454#26597#35810
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 46
    Top = 51
    Width = 35
    Height = 13
    AutoSize = False
    Caption = #34920#21517
  end
  object Label3: TLabel
    Left = 240
    Top = 48
    Width = 119
    Height = 14
    Caption = #27599#27425#19979#36733#25968#25454#26465#25968':'
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -14
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 40
    Top = 80
    Width = 56
    Height = 16
    Caption = 'SQL'#30011#26495
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 32
    Top = 176
    Width = 625
    Height = 273
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object EdtTable: TEdit
    Left = 96
    Top = 48
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object BtnSelect: TButton
    Left = 296
    Top = 464
    Width = 75
    Height = 25
    Caption = #26597#35810
    TabOrder = 2
    OnClick = BtnSelectClick
  end
  object edtRecNo: TEdit
    Left = 504
    Top = 45
    Width = 168
    Height = 22
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -14
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object ComboBox1: TComboBox
    Left = 392
    Top = 46
    Width = 87
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 10
    TabOrder = 4
    Text = '1000'
    Items.Strings = (
      '1'
      '100'
      '200'
      '300'
      '400'
      '500'
      '600'
      '700'
      '800'
      '900'
      '1000'
      '1500'
      '2000'
      '2500'
      '3000'
      '4000'
      '5000'
      '6000'
      #20840#37096)
  end
  object BtnDo: TButton
    Left = 472
    Top = 464
    Width = 75
    Height = 25
    Caption = #25191#34892
    TabOrder = 5
    OnClick = BtnDoClick
  end
  object Memo1: TMemo
    Left = 34
    Top = 96
    Width = 623
    Height = 73
    ScrollBars = ssBoth
    TabOrder = 6
  end
  object btnpagedown: TBitBtn
    Left = 381
    Top = 464
    Width = 89
    Height = 25
    Caption = #19979#19968#31508#25968#25454
    TabOrder = 7
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
  object BitBtn1: TBitBtn
    Left = 552
    Top = 464
    Width = 75
    Height = 25
    Caption = #25191#34892#25991#20214
    TabOrder = 8
  end
  object DataSource1: TDataSource
    DataSet = dmmain.dsquery
    Left = 16
    Top = 184
  end
end
