inherited fmOrderQuery: TfmOrderQuery
  Left = 37
  Top = 49
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = #35746#21333#21830#21697#26597#35810
  ClientHeight = 483
  ClientWidth = 733
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 733
    Height = 144
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvSpace
    TabOrder = 0
    object Label1: TLabel
      Left = 13
      Top = 8
      Width = 138
      Height = 21
      Caption = #35746#21333#21830#21697#26597#35810
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = #38582#20070
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 232
      Top = 12
      Width = 65
      Height = 13
      Caption = #19979#36733#26465#25968#65306
    end
    object cmbtop: TComboBox
      Left = 296
      Top = 7
      Width = 73
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 0
      Text = '100'
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
      Top = 32
      Width = 729
      Height = 110
      Align = alBottom
      BevelInner = bvLowered
      BevelOuter = bvSpace
      TabOrder = 1
      object Label5: TLabel
        Left = 562
        Top = 36
        Width = 13
        Height = 13
        Caption = #21040
      end
      object Label6: TLabel
        Left = 391
        Top = 63
        Width = 13
        Height = 13
        Caption = #21040
      end
      object Label3: TLabel
        Left = 226
        Top = 88
        Width = 13
        Height = 13
        Caption = #36215
      end
      object Label8: TLabel
        Left = 384
        Top = 90
        Width = 13
        Height = 13
        Caption = #27490
      end
      object CBType: TComboBox
        Left = 69
        Top = 9
        Width = 112
        Height = 21
        Style = csDropDownList
        Color = cl3DLight
        ItemHeight = 13
        TabOrder = 0
        OnChange = CBTypeChange
      end
      object cbBrand: TComboBox
        Left = 303
        Top = 9
        Width = 113
        Height = 21
        Style = csDropDownList
        Color = cl3DLight
        ItemHeight = 13
        Sorted = True
        TabOrder = 1
        OnChange = cbBrandChange
      end
      object CbBreed: TComboBox
        Left = 508
        Top = 7
        Width = 125
        Height = 21
        Style = csDropDownList
        Color = cl3DLight
        ItemHeight = 13
        Sorted = True
        TabOrder = 2
      end
      object ckbtype: TCheckBox
        Left = 11
        Top = 10
        Width = 51
        Height = 17
        Caption = #31867#21035
        TabOrder = 3
        OnClick = ckbtypeClick
      end
      object ckbbreed: TCheckBox
        Left = 458
        Top = 8
        Width = 49
        Height = 17
        Caption = #21697#31181
        TabOrder = 4
        OnClick = ckbbreedClick
      end
      object ckbbrand: TCheckBox
        Left = 250
        Top = 10
        Width = 47
        Height = 17
        Caption = #21697#29260
        TabOrder = 5
        OnClick = ckbbrandClick
      end
      object cbamount: TCheckBox
        Left = 10
        Top = 62
        Width = 74
        Height = 17
        Caption = #21830#21697#32534#30721
        TabOrder = 6
        OnClick = cbamountClick
      end
      object edtamount: TEdit
        Left = 88
        Top = 58
        Width = 121
        Height = 21
        Color = cl3DLight
        ReadOnly = True
        TabOrder = 7
      end
      object cbball: TCheckBox
        Left = 407
        Top = 36
        Width = 71
        Height = 17
        Caption = #29699#38754#24230#25968
        TabOrder = 8
        OnClick = cbballClick
      end
      object edtBbegin: TEdit
        Left = 480
        Top = 34
        Width = 76
        Height = 21
        Color = cl3DLight
        ReadOnly = True
        TabOrder = 9
      end
      object edtBEND: TEdit
        Left = 582
        Top = 34
        Width = 71
        Height = 21
        Color = cl3DLight
        ReadOnly = True
        TabOrder = 10
      end
      object cbpoll: TCheckBox
        Left = 236
        Top = 62
        Width = 71
        Height = 17
        Caption = #26609#38754#24230#25968
        TabOrder = 11
        OnClick = cbpollClick
      end
      object EDTPBEGIN: TEdit
        Left = 309
        Top = 60
        Width = 74
        Height = 21
        Color = cl3DLight
        ReadOnly = True
        TabOrder = 12
      end
      object EDTPEND: TEdit
        Left = 411
        Top = 60
        Width = 80
        Height = 21
        Color = cl3DLight
        ReadOnly = True
        TabOrder = 13
      end
      object cbnroms: TCheckBox
        Left = 498
        Top = 62
        Width = 74
        Height = 17
        Caption = #35268#26684#22411#21495
        TabOrder = 14
        OnClick = cbnromsClick
      end
      object EDTNORMS: TEdit
        Left = 579
        Top = 58
        Width = 142
        Height = 21
        Color = cl3DLight
        ReadOnly = True
        TabOrder = 15
      end
      object Cbmstorage: TCheckBox
        Left = 10
        Top = 34
        Width = 72
        Height = 17
        Caption = #22320#21306#20179#24211
        TabOrder = 16
        OnClick = CbmstorageClick
      end
      object cmbmstorage: TComboBox
        Left = 87
        Top = 32
        Width = 103
        Height = 21
        Style = csDropDownList
        Color = cl3DLight
        ItemHeight = 13
        TabOrder = 17
        OnChange = cmbmstorageChange
      end
      object cbstorages: TCheckBox
        Left = 210
        Top = 34
        Width = 72
        Height = 17
        Caption = #19979#23646#20179#24211
        TabOrder = 18
        OnClick = cbstoragesClick
      end
      object cmbstorages: TComboBox
        Left = 287
        Top = 32
        Width = 103
        Height = 21
        Style = csDropDownList
        Color = cl3DLight
        ItemHeight = 13
        TabOrder = 19
      end
      object ckbnewDate: TCheckBox
        Left = 10
        Top = 88
        Width = 72
        Height = 17
        Caption = #35746#21333#26085#26399
        TabOrder = 20
        OnClick = ckbnewDateClick
      end
      object dtpBegin: TDateTimePicker
        Left = 92
        Top = 84
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
        TabOrder = 21
      end
      object dtpEnd: TDateTimePicker
        Left = 244
        Top = 84
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
        TabOrder = 22
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 445
    Width = 733
    Height = 38
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      733
      38)
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
      Caption = #21830#21697#20998#24067'(F1)'
      TabOrder = 2
      OnClick = BitBtn3Click
      OnMouseDown = BitBtn3MouseDown
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
      OnClick = btnprintClick
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
  object Panel2: TPanel
    Left = 0
    Top = 144
    Width = 733
    Height = 301
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object DBGrid1: TDBGrid
      Left = 0
      Top = 0
      Width = 733
      Height = 301
      Align = alClient
      Ctl3D = False
      DataSource = dssort
      FixedColor = clSkyBlue
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
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
          FieldName = 'Storage_Name'
          Title.Alignment = taCenter
          Title.Caption = #20179#24211
          Width = 129
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Goods_NO'
          Title.Alignment = taCenter
          Title.Caption = #21830#21697#32534#21495
          Width = 178
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Goods_Name'
          Title.Alignment = taCenter
          Title.Caption = #21830#21697#21517#31216
          Width = 133
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'Stock_amount'
          Title.Alignment = taCenter
          Title.Caption = #24211#23384#25968#37327
          Width = 68
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'OrderAmount'
          Title.Alignment = taCenter
          Title.Caption = #35746#21333#25968#37327
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BarCode'
          Title.Alignment = taCenter
          Title.Caption = #26465#30721
          Width = 133
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'type'
          Title.Alignment = taCenter
          Title.Caption = #31867#22411
          Width = 131
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Brand'
          Title.Alignment = taCenter
          Title.Caption = #21697#29260
          Width = 119
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Breed'
          Title.Alignment = taCenter
          Title.Caption = #21697#31181
          Width = 114
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Base_Unit'
          Title.Alignment = taCenter
          Title.Caption = #22522#26412#21333#20301
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Provider'
          Title.Alignment = taCenter
          Title.Caption = #29983#20135#21378#21830
          Width = 134
          Visible = True
        end>
    end
    object StringGrid1: TStringGrid
      Left = 0
      Top = 0
      Width = 733
      Height = 301
      Align = alClient
      Ctl3D = False
      FixedColor = cl3DLight
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goColMoving]
      ParentCtl3D = False
      TabOrder = 1
      Visible = False
      OnDrawCell = StringGrid1DrawCell
      ColWidths = (
        64
        165
        194
        125
        139)
    end
  end
  object cdspart: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 560
  end
  object cdssort: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 616
    Top = 8
  end
  object dssort: TDataSource
    DataSet = cdssort
    Left = 480
  end
  object PopupMenu2: TPopupMenu
    Left = 296
    Top = 344
    object N3: TMenuItem
      Caption = #32437#21521#26174#31034
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = #27178#21521#26174#31034
      OnClick = N4Click
    end
  end
end
