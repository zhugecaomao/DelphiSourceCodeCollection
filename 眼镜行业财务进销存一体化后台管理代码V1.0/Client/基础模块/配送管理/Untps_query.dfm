inherited fmps_query: Tfmps_query
  Left = 50
  Top = -14
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = #38376#24215#32570#36135#20998#26512
  ClientHeight = 425
  ClientWidth = 696
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 696
    Height = 44
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvSpace
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 11
      Width = 168
      Height = 20
      Caption = #38376#24215#32570#36135#30003#35831#20998#26512
      Font.Charset = GB2312_CHARSET
      Font.Color = clNavy
      Font.Height = -20
      Font.Name = #38582#20070
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 199
      Top = 17
      Width = 65
      Height = 13
      Caption = #19979#36733#26465#25968#65306
    end
    object cmbtop: TComboBox
      Left = 263
      Top = 12
      Width = 73
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      Items.Strings = (
        '100'
        '200'
        '500'
        '1000'
        '1500'
        '2000'
        '2500'
        '3000'
        '3500'
        '4000'
        '4500'
        '5000')
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 44
    Width = 696
    Height = 381
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 0
      Top = 0
      Width = 696
      Height = 345
      Align = alClient
      DataSource = dsps_query
      FixedColor = clSkyBlue
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnTitleClick = DBGrid1TitleClick
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'vcofficeid'
          Title.Alignment = taCenter
          Title.Caption = #30003#35831#38376#24215#32534#21495
          Width = 90
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'goods_no'
          Title.Alignment = taCenter
          Title.Caption = #21830#21697#32534#30721
          Width = 180
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Goods_Name'
          Title.Alignment = taCenter
          Title.Caption = #21830#21697#21517#31216
          Width = 200
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Stock_amount'
          Title.Alignment = taCenter
          Title.Caption = #24211#23384#25968#37327
          Width = 70
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Saleamount'
          Title.Alignment = taCenter
          Title.Caption = #39044#35745#24211#23384#25968#37327
          Width = 80
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'NQty'
          Title.Alignment = taCenter
          Title.Caption = #30003#35831#25968#37327
          Width = 70
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'NSendQty'
          Title.Alignment = taCenter
          Title.Caption = #24050#37197#36865#25968#37327
          Width = 70
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'totalamount'
          Title.Alignment = taCenter
          Title.Caption = #24046#39069#25968#37327
          Width = 70
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'dgetdate'
          Title.Alignment = taCenter
          Title.Caption = #30003#35831#26102#38388
          Visible = True
        end>
    end
    object DBGrid2: TDBGrid
      Left = 0
      Top = 0
      Width = 696
      Height = 345
      Align = alClient
      DataSource = dsps_query
      FixedColor = clSkyBlue
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      Visible = False
      OnTitleClick = DBGrid2TitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'goods_no'
          Title.Alignment = taCenter
          Title.Caption = #21830#21697#32534#30721
          Width = 180
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Goods_Name'
          Title.Alignment = taCenter
          Title.Caption = #21830#21697#21517#31216
          Width = 200
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Stock_amount'
          Title.Alignment = taCenter
          Title.Caption = #24211#23384#25968#37327
          Width = 70
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Saleamount'
          Title.Alignment = taCenter
          Title.Caption = #39044#35745#24211#23384#25968#37327
          Width = -1
          Visible = False
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'NQty'
          Title.Alignment = taCenter
          Title.Caption = #30003#35831#25968#37327
          Width = 70
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'NSendQty'
          Title.Alignment = taCenter
          Title.Caption = #24050#37197#36865#25968#37327
          Width = 70
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'totalamount'
          Title.Alignment = taCenter
          Title.Caption = #24046#39069#25968#37327
          Width = 70
          Visible = True
        end>
    end
    object Panel3: TPanel
      Left = 0
      Top = 345
      Width = 696
      Height = 36
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      DesignSize = (
        696
        36)
      object btnauto: TBitBtn
        Left = 5
        Top = 9
        Width = 75
        Height = 25
        Caption = #29983#25104#21333#25454
        Enabled = False
        PopupMenu = PopupMenu1
        TabOrder = 0
        OnClick = btnautoClick
        OnMouseDown = btnautoMouseDown
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
          000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
          00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
          F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
          0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
          FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
          FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
          0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
          00333377737FFFFF773333303300000003333337337777777333}
        NumGlyphs = 2
      end
      object btnprint: TBitBtn
        Left = 80
        Top = 9
        Width = 75
        Height = 25
        Caption = #25171#21360
        TabOrder = 1
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
      object BitBtn1: TBitBtn
        Left = 230
        Top = 9
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #26597#23547#26465#20214
        TabOrder = 2
        OnClick = BitBtn1Click
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000120B0000120B00001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
          DADAADADADADAD00ADAD000000000910000A0FFFF0FF9F10FF0D0FF00009F10F
          FF0A0F0787701088FF0D0078E7F70FFFFF0A008E878F08888F0D00EFE7E80FFF
          FF0A007FF78708888F0D0F07E770FFFFFF0A0F8000088888FF0D0FFFF0FFFFFF
          FF0A444444444444444D444444444444444A444444444444444D}
      end
      object BitBtn2: TBitBtn
        Left = 304
        Top = 9
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #26639#30446#24067#23616
        TabOrder = 3
        OnClick = BitBtn2Click
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000120B0000120B00001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
          DADAADADADADADADADADDADADAD000000000ADADADA0FFFFFFF0DADA0000F00F
          00F0ADAD0FF0FFFFFFF0D0000F00F00F00F0A0FF0FF0FFFFFFF0D0F00F00F00F
          00F0A0FF0FF0FFFFFFF0D0F00F0000000000A0FF0FFFFFFF0DADD0F000000000
          0ADAA0FFFFFFF0ADADADD000000000DADADAADADADADADADADAD}
      end
      object BitBtn3: TBitBtn
        Left = 378
        Top = 9
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #30003#35831#21830#21697
        TabOrder = 4
        OnClick = BitBtn3Click
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000120B0000120B00001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00000000000000
          00DA07FFFFFFFFFFFF0D08000F0007000070070CC00BB0099100070CC40BB309
          910A070CC40BB309910D070CC40BB309910A070CC40BB309910D080CC40BB309
          910A0780000BB309910D0870DA0BB309910A0780AD0BB300910D0F70DA0BB30A
          000AA0F0AD0BB80DADADDA00DAD0000ADADAADA0ADADADADADAD}
      end
      object BitBtn4: TBitBtn
        Left = 452
        Top = 9
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #38376#24215#30003#35831
        TabOrder = 5
        OnClick = BitBtn4Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
          333B33F333337F3333373B33333BB33333B337FF33377F33337F3BB3333BB333
          3BB3377FF3377F33377333BB777BB777BB333377FFF77FFF7733330000000000
          B3333377777777777333330FFFFFFFF03333337F3FF3FFF7F333330F00F000F0
          33333F7F77377737FFFFBB0FFF8FFFF0BBB3777F3F33FFF7777F3B0F08700000
          000B377F73F7777777773308880FFFFFF033337F377333333733330807FFFFF8
          033333737FFFFFFF7F33333000000000B3333337777777777FF333BB333BB333
          BB33337733377F3377FF3BB3333BB3333BB3377333377F33377F3B33333BB333
          33B33733333773333373B333333B3333333B7333333733333337}
        NumGlyphs = 2
      end
      object btnpagedown: TBitBtn
        Left = 527
        Top = 9
        Width = 89
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #19979#19968#31508#25968#25454
        TabOrder = 6
        OnClick = btnpagedownClick
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
      object BitBtn7: TBitBtn
        Left = 615
        Top = 9
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #36864#20986
        TabOrder = 7
        OnClick = BitBtn7Click
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333FFFFF333333000033333388888833333333333F888888FFF333
          000033338811111188333333338833FFF388FF33000033381119999111833333
          38F338888F338FF30000339119933331111833338F388333383338F300003391
          13333381111833338F8F3333833F38F3000039118333381119118338F38F3338
          33F8F38F000039183333811193918338F8F333833F838F8F0000391833381119
          33918338F8F33833F8338F8F000039183381119333918338F8F3833F83338F8F
          000039183811193333918338F8F833F83333838F000039118111933339118338
          F3833F83333833830000339111193333391833338F33F8333FF838F300003391
          11833338111833338F338FFFF883F83300003339111888811183333338FF3888
          83FF83330000333399111111993333333388FFFFFF8833330000333333999999
          3333333333338888883333330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
      end
    end
  end
  object dsps_query: TDataSource
    DataSet = dmmain.CDSquery
    Left = 288
    Top = 16
  end
  object PopupMenu1: TPopupMenu
    Left = 80
    Top = 256
    object nbatch: TMenuItem
      Caption = #21830#21697#38656#27714
      OnClick = nbatchClick
    end
    object Ngoods: TMenuItem
      Caption = #37197#36865#30003#35831
      Enabled = False
      OnClick = NgoodsClick
    end
  end
  object cdsmasterdata: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'PubProvider'
    RemoteServer = frm_Data.Socket_Connection
    Left = 288
    Top = 240
  end
  object cdsdetaildata: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'PubProvider'
    RemoteServer = frm_Data.Socket_Connection
    Left = 368
    Top = 240
  end
end
