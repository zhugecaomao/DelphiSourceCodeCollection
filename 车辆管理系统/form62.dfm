object form6_2: Tform6_2
  Left = 207
  Top = 55
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #36710#36742#20986#20837#24211#30331#35760#34920'  '#35760#24405#27983#35272
  ClientHeight = 440
  ClientWidth = 626
  Color = clBtnShadow
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
    Left = 192
    Top = 16
    Width = 233
    Height = 27
    Caption = #36710#36742#20986#20837#24211#30331#35760#34920
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clYellow
    Font.Height = -27
    Font.Name = #26999#20307'_GB2312'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 328
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
  object DBGrid1: TDBGrid
    Left = 8
    Top = 64
    Width = 609
    Height = 257
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = #21512#21516#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = #36710#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = #36710#22411
        Visible = True
      end
      item
        Expanded = False
        FieldName = #31199#36710#21333#20301
        Visible = True
      end
      item
        Expanded = False
        FieldName = #20986#24211#26085#26399
        Visible = True
      end
      item
        Expanded = False
        FieldName = #20986#24211#26102#38388
        Visible = True
      end
      item
        Expanded = False
        FieldName = #20986#24211#37324#31243
        Visible = True
      end
      item
        Expanded = False
        FieldName = #20986#24211#27833#26009
        Visible = True
      end
      item
        Expanded = False
        FieldName = #20986#24211#21496#26426
        Visible = True
      end
      item
        Expanded = False
        FieldName = #20986#24211#20132#25509#20154
        Visible = True
      end
      item
        Expanded = False
        FieldName = #20837#24211#26085#26399
        Visible = True
      end
      item
        Expanded = False
        FieldName = #20837#24211#26102#38388
        Visible = True
      end
      item
        Expanded = False
        FieldName = #20837#24211#37324#31243
        Visible = True
      end
      item
        Expanded = False
        FieldName = #20837#24211#27833#26009
        Visible = True
      end
      item
        Expanded = False
        FieldName = #20837#24211#21496#26426
        Visible = True
      end
      item
        Expanded = False
        FieldName = #20837#24211#20132#25509#20154
        Visible = True
      end>
  end
  object DBMemo1: TDBMemo
    Left = 8
    Top = 344
    Width = 185
    Height = 89
    DataField = #22791#27880
    DataSource = DataSource1
    TabOrder = 1
  end
  object DBNavigator1: TDBNavigator
    Left = 296
    Top = 344
    Width = 234
    Height = 25
    DataSource = DataSource1
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
    TabOrder = 2
  end
  object BitBtn1: TBitBtn
    Left = 256
    Top = 400
    Width = 121
    Height = 25
    Caption = #25171#21360
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = BitBtn1Click
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
  object BitBtn2: TBitBtn
    Left = 448
    Top = 400
    Width = 123
    Height = 25
    Cancel = True
    Caption = #36820#22238#20027#31383#21475
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
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
    TableName = #36710#36742#20986#20837#24211#30331#35760#34920'.DB'
    Left = 16
    Top = 8
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 56
    Top = 8
  end
end
