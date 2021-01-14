inherited fmlimitgoods: Tfmlimitgoods
  Left = 41
  Top = 77
  Caption = #39044#35686#26126#32454
  ClientHeight = 437
  ClientWidth = 728
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 728
    Height = 47
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 16
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
    object LblSort: TLabel
      Left = 367
      Top = 18
      Width = 112
      Height = 14
      Caption = #24403#21069#25490#24207#26041#24335#26159#65306
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object ComboBox1: TComboBox
      Left = 176
      Top = 14
      Width = 87
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      Items.Strings = (
        '10'
        '20'
        '30'
        '50'
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
    object edtTime: TEdit
      Left = 656
      Top = 14
      Width = 33
      Height = 28
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImeName = #12356#12421' ('#32649#30768') - '#31325#29460#57646
      ParentFont = False
      TabOrder = 1
      Visible = False
    end
    object edtRecNo: TEdit
      Left = 348
      Top = 16
      Width = 168
      Height = 22
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
  end
  object DBGrid1: TDBGrid
    Left = -1
    Top = 47
    Width = 727
    Height = 349
    Color = clCream
    Ctl3D = False
    DataSource = ds_warn_limit
    FixedColor = clSkyBlue
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Storage_NO'
        Title.Alignment = taCenter
        Title.Caption = #20179#24211#32534#21495
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Storage_Name'
        Title.Alignment = taCenter
        Title.Caption = #20179#24211#21517#31216
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Type'
        Title.Alignment = taCenter
        Title.Caption = #21830#21697#31867#21035
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Goods_NO'
        Title.Alignment = taCenter
        Title.Caption = #21830#21697#32534#21495
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
        Expanded = False
        FieldName = 'BarCode'
        Title.Alignment = taCenter
        Title.Caption = #21830#21697#26465#30721
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'stock_amount'
        Title.Alignment = taCenter
        Title.Caption = #24211#23384#25968#37327
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'up_amount'
        Title.Alignment = taCenter
        Title.Caption = #24211#23384#19978#38480
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'down_amount'
        Title.Alignment = taCenter
        Title.Caption = #24211#23384#19979#38480
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'overflow'
        Title.Alignment = taCenter
        Title.Caption = #35843#25972#25968#37327
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 396
    Width = 728
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    BevelOuter = bvLowered
    Color = 16573127
    TabOrder = 2
    DesignSize = (
      728
      41)
    object btnExit: TBitBtn
      Left = 645
      Top = 8
      Width = 75
      Height = 25
      Caption = #36864#20986
      TabOrder = 0
      OnClick = btnExitClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033BBBBBBBBBB
        BB33337777777777777F33BB00BBBBBBBB33337F77333333F37F33BB0BBBBBB0
        BB33337F73F33337FF7F33BBB0BBBB000B33337F37FF3377737F33BBB00BB00B
        BB33337F377F3773337F33BBBB0B00BBBB33337F337F7733337F33BBBB000BBB
        BB33337F33777F33337F33EEEE000EEEEE33337F3F777FFF337F33EE0E80000E
        EE33337F73F77773337F33EEE0800EEEEE33337F37377F33337F33EEEE000EEE
        EE33337F33777F33337F33EEEEE00EEEEE33337F33377FF3337F33EEEEEE00EE
        EE33337F333377F3337F33EEEEEE00EEEE33337F33337733337F33EEEEEEEEEE
        EE33337FFFFFFFFFFF7F33EEEEEEEEEEEE333377777777777773}
      NumGlyphs = 2
    end
    object btnpagedown: TBitBtn
      Left = 555
      Top = 8
      Width = 89
      Height = 25
      Caption = #19979#19968#31508#25968#25454
      TabOrder = 1
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
    object BtnSort: TBitBtn
      Left = 479
      Top = 8
      Width = 75
      Height = 25
      Caption = #26639#30446#24067#23616
      TabOrder = 2
      OnClick = BtnSortClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FFFFFFFFFFF
        FFFF33333333333FFFFF3FFFFFFFFF00000F333333333377777F33FFFFFFFF09
        990F33333333337F337F333FFFFFFF09990F33333333337F337F3333FFFFFF09
        990F33333333337FFF7F33333FFFFF00000F3333333333777773333333FFFFFF
        FFFF3FFFFF3333333F330000033FFFFF0FFF77777F3333337FF30EEE0333FFF0
        00FF7F337FFF333777FF0EEE00033F00000F7F33777F3777777F0EEE0E033000
        00007FFF7F7FF777777700000E00033000FF777773777F3777F3330EEE0E0330
        00FF337FFF7F7F3777F33300000E033000FF337777737F37773333330EEE0300
        03FF33337FFF77777333333300000333333F3333777773333333}
      NumGlyphs = 2
    end
    object BitBtn1: TBitBtn
      Left = 403
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #26597#23547#26465#20214
      TabOrder = 3
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
    object btnauto: TBitBtn
      Left = 328
      Top = 8
      Width = 75
      Height = 25
      Hint = #20302#20110#19979#38480#29983#25104#21333#25454
      Caption = #29983#25104#21333#25454
      Enabled = False
      TabOrder = 4
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
  end
  object ds_warn_limit: TDataSource
    DataSet = dmmain.CDSquery
    Left = 544
    Top = 160
  end
  object PopupMenu1: TPopupMenu
    Left = 248
    Top = 408
    object Ngoods: TMenuItem
      Caption = #21830#21697#38656#27714'(&R)'
      OnClick = NgoodsClick
    end
    object Nbatch: TMenuItem
      Caption = #37197#36865#30003#35831'(&B)'
      Enabled = False
      OnClick = NbatchClick
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
