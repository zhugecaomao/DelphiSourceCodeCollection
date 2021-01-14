inherited fmBacthQuery: TfmBacthQuery
  Left = 40
  Top = 20
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = #37197#36865#25968#25454#26597#35810
  ClientHeight = 483
  ClientWidth = 733
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 733
    Height = 91
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 13
      Top = 8
      Width = 138
      Height = 21
      Caption = #37197#36865#25968#25454#26597#35810
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = #38582#20070
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 185
      Top = 15
      Width = 65
      Height = 13
      Caption = #19979#36733#26465#25968#65306
    end
    object cmbtop: TComboBox
      Left = 249
      Top = 10
      Width = 73
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = cmbtopChange
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
    object Panel4: TPanel
      Left = 2
      Top = 34
      Width = 729
      Height = 55
      Align = alBottom
      BevelInner = bvLowered
      TabOrder = 1
      object Label3: TLabel
        Left = 230
        Top = 8
        Width = 13
        Height = 13
        Caption = #36215
      end
      object Label8: TLabel
        Left = 388
        Top = 8
        Width = 13
        Height = 13
        Caption = #27490
      end
      object SpeedButton7: TSpeedButton
        Left = 254
        Top = 27
        Width = 22
        Height = 20
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333333333333333333333333333333333333333333333333FF333333333333
          3000333333FFFFF3F77733333000003000B033333777773777F733330BFBFB00
          E00033337FFF3377F7773333000FBFB0E000333377733337F7773330FBFBFBF0
          E00033F7FFFF3337F7773000000FBFB0E000377777733337F7770BFBFBFBFBF0
          E00073FFFFFFFF37F777300000000FB0E000377777777337F7773333330BFB00
          000033333373FF77777733333330003333333333333777333333333333333333
          3333333333333333333333333333333333333333333333333333333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 2
        OnClick = SpeedButton7Click
      end
      object ckbnewDate: TCheckBox
        Left = 14
        Top = 8
        Width = 72
        Height = 17
        Caption = #21046#21333#26085#26399
        TabOrder = 0
        OnClick = ckbnewDateClick
      end
      object dtpBegin: TDateTimePicker
        Left = 96
        Top = 4
        Width = 130
        Height = 21
        CalAlignment = dtaLeft
        Date = 37921.4816629977
        Time = 37921.4816629977
        Color = cl3DLight
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 1
      end
      object dtpEnd: TDateTimePicker
        Left = 248
        Top = 4
        Width = 130
        Height = 21
        CalAlignment = dtaLeft
        Date = 37921.4816629977
        Time = 37921.4816629977
        Color = cl3DLight
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 2
      end
      object cbamount: TCheckBox
        Left = 418
        Top = 8
        Width = 74
        Height = 17
        Caption = #21333#25454#32534#21495
        TabOrder = 3
        OnClick = cbamountClick
      end
      object edtamount: TEdit
        Left = 496
        Top = 4
        Width = 209
        Height = 21
        Color = cl3DLight
        ReadOnly = True
        TabOrder = 4
      end
      object Cbproposer: TCheckBox
        Left = 14
        Top = 31
        Width = 74
        Height = 17
        Caption = #21046#21333#20154
        TabOrder = 5
        OnClick = CbproposerClick
      end
      object Edtproposer: TEdit
        Left = 95
        Top = 27
        Width = 151
        Height = 21
        Color = cl3DLight
        ReadOnly = True
        TabOrder = 6
      end
      object R1: TRadioButton
        Left = 304
        Top = 30
        Width = 81
        Height = 17
        Caption = #37197#36865#30003#35831
        Checked = True
        TabOrder = 7
        TabStop = True
      end
      object R2: TRadioButton
        Tag = 1
        Left = 391
        Top = 29
        Width = 66
        Height = 17
        Caption = #37197#36865#21333
        TabOrder = 8
      end
      object R3: TRadioButton
        Tag = 2
        Left = 464
        Top = 29
        Width = 81
        Height = 17
        Caption = #39044#23450#37197#36865
        TabOrder = 9
      end
      object R4: TRadioButton
        Tag = 3
        Left = 543
        Top = 29
        Width = 74
        Height = 17
        Caption = #37197#36865#36864#36135
        TabOrder = 10
      end
      object R5: TRadioButton
        Tag = 4
        Left = 623
        Top = 29
        Width = 74
        Height = 17
        Caption = #37197#36865#25910#36135
        TabOrder = 11
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 442
    Width = 733
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      733
      41)
    object BitBtn1: TBitBtn
      Left = 323
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #26597#23547
      TabOrder = 0
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
      Left = 397
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #26639#30446#24067#23616
      TabOrder = 1
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
      Left = 472
      Top = 8
      Width = 97
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #21830#21697#32479#35745
      Enabled = False
      TabOrder = 2
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
    object btnpagedown: TBitBtn
      Left = 569
      Top = 8
      Width = 89
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #19979#19968#31508#25968#25454
      TabOrder = 3
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
      Left = 658
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #36864#20986
      TabOrder = 4
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
    object btnprint: TBitBtn
      Left = 248
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #25171#21360
      TabOrder = 5
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        0003377777777777777308888888888888807F33333333333337088888888888
        88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
        8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
        8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 91
    Width = 733
    Height = 351
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object DBGrid1: TDBGrid
      Left = 0
      Top = 0
      Width = 733
      Height = 351
      Align = alClient
      Ctl3D = False
      DataSource = DsMtable
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnDblClick = DBGrid1DblClick
      OnTitleClick = DBGrid1TitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'billno'
          Title.Alignment = taCenter
          Title.Caption = #21333#25454#32534#21495
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'newdate'
          Title.Alignment = taCenter
          Title.Caption = #21046#21333#26085#26399
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'newman'
          Title.Alignment = taCenter
          Title.Caption = #21046#21333#20154
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Tid'
          Title.Alignment = taCenter
          Title.Caption = #32463#25163#20154
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Status'
          Title.Alignment = taCenter
          Title.Caption = #23457#26680#29366#24577
          Width = 70
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'storageid'
          Title.Alignment = taCenter
          Title.Caption = #37197#36865#20179#24211
          Width = 70
          Visible = True
        end>
    end
    object DBGrid2: TDBGrid
      Left = 0
      Top = 0
      Width = 733
      Height = 351
      Align = alClient
      Ctl3D = False
      DataSource = DsDtable
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnTitleClick = DBGrid2TitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'goods_no'
          Title.Alignment = taCenter
          Title.Caption = #21830#21697#32534#30721
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'goods_name'
          Title.Alignment = taCenter
          Title.Caption = #21830#21697#21517#31216
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'type'
          Title.Alignment = taCenter
          Title.Caption = #21830#21697#31867#21035
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'brand'
          Title.Alignment = taCenter
          Title.Caption = #21697#29260
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'breed'
          Title.Alignment = taCenter
          Title.Caption = #21697#31181
          Width = 80
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'amount'
          Title.Alignment = taCenter
          Title.Caption = #25968#37327
          Width = 70
          Visible = True
        end>
    end
    object DBGrid3: TDBGrid
      Left = 0
      Top = 0
      Width = 733
      Height = 351
      Align = alClient
      Ctl3D = False
      DataSource = DsTotal
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 2
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnTitleClick = DBGrid3TitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'goods_no'
          Title.Alignment = taCenter
          Title.Caption = #21830#21697#32534#30721
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'goods_name'
          Title.Alignment = taCenter
          Title.Caption = #21830#21697#21517#31216
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'type'
          Title.Alignment = taCenter
          Title.Caption = #21830#21697#31867#21035
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'brand'
          Title.Alignment = taCenter
          Title.Caption = #21697#29260
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'breed'
          Title.Alignment = taCenter
          Title.Caption = #21697#31181
          Width = 80
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'amount'
          Title.Alignment = taCenter
          Title.Caption = #25968#37327
          Width = 70
          Visible = True
        end>
    end
  end
  object DsMtable: TDataSource
    DataSet = CDSmTABLE
    Left = 296
    Top = 80
  end
  object DsDtable: TDataSource
    DataSet = CDSDTABLE
    Left = 624
    Top = 96
  end
  object CDSmTABLE: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 312
    Top = 152
  end
  object CDSDTABLE: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 200
    Top = 112
  end
  object CDSTotal: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 520
    Top = 88
  end
  object DsTotal: TDataSource
    DataSet = CDSTotal
    Left = 584
    Top = 96
  end
end
