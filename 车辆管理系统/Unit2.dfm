object Form2: TForm2
  Left = 7
  Top = 75
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #20250#21592#26723#26696#30331#35760#34920
  ClientHeight = 456
  ClientWidth = 687
  Color = clBtnShadow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlue
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  DesignSize = (
    687
    456)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 224
    Top = 24
    Width = 246
    Height = 33
    Alignment = taCenter
    Caption = #20250#21592#26723#26696#30331#35760#34920
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clYellow
    Font.Height = -33
    Font.Name = #26999#20307'_GB2312'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 72
    Width = 667
    Height = 302
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBlue
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = #24207#21495
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = #22995#21517
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = #25143#21475#26412
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = #36523#20221#35777
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = #39550#39542#35777
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = #31199#36710#26102#38388
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = #32852#31995#30005#35805
        Width = 120
        Visible = True
      end>
  end
  object BitBtn4: TBitBtn
    Left = 328
    Top = 408
    Width = 113
    Height = 25
    Caption = #25171' '#21360
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = BitBtn4Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
      00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
      8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
      8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
      8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
      03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
      03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
      33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
      33333337FFFF7733333333300000033333333337777773333333}
    NumGlyphs = 2
  end
  object BitBtn5: TBitBtn
    Left = 536
    Top = 408
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
    TabOrder = 2
    OnClick = BitBtn5Click
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
  object DBNavigator1: TDBNavigator
    Left = 24
    Top = 408
    Width = 216
    Height = 25
    DataSource = DataSource1
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
    Hints.Strings = (
      #39318#35760#24405
      #21069#19968#26465#35760#24405
      #19979#19968#26465#35760#24405
      #25554#20837#19968#26465#35760#24405
      #21024#38500#19968#26465#35760#24405
      #32534#36753#35813#26465#35760#24405
      #25552#20132#32534#36753#36864#20986#32534#36753
      #21047#26032)
    TabOrder = 3
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 16
    Top = 8
  end
  object Table1: TTable
    DatabaseName = 'car'
    TableName = #20250#21592#26723#26696#30331#35760#34920'.DB'
    Left = 64
    Top = 8
  end
end
