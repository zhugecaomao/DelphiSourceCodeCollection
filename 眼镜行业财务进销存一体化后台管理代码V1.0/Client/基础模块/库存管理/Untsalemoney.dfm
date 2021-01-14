inherited fmsalemoney: Tfmsalemoney
  Left = 40
  Top = 41
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = #20215#26684#31649#29702
  ClientHeight = 480
  ClientWidth = 728
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 728
    Height = 87
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 56
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
    object Bevel1: TBevel
      Left = 2
      Top = 47
      Width = 724
      Height = 2
      Align = alTop
      Style = bsRaised
    end
    object ComboBox1: TComboBox
      Left = 176
      Top = 54
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
      Top = 54
      Width = 33
      Height = 28
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImeName = #12356#12421' ('#32649#30768') - '#31325#29460#57646
      ParentFont = False
      TabOrder = 2
      Visible = False
    end
    object Panel3: TPanel
      Left = 2
      Top = 2
      Width = 724
      Height = 45
      Align = alTop
      BevelOuter = bvLowered
      Color = 16573127
      TabOrder = 3
      object Label2: TLabel
        Left = 23
        Top = 15
        Width = 48
        Height = 16
        Caption = #31867#21035#65306
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 194
        Top = 15
        Width = 48
        Height = 16
        Caption = #21697#29260#65306
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 364
        Top = 15
        Width = 48
        Height = 16
        Caption = #21697#31181#65306
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object CBType: TComboBox
        Left = 69
        Top = 15
        Width = 112
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        Sorted = True
        TabOrder = 0
        OnChange = CBTypeChange
      end
      object cbBrand: TComboBox
        Left = 239
        Top = 15
        Width = 113
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        Sorted = True
        TabOrder = 1
        OnChange = cbBrandChange
      end
      object CbBreed: TComboBox
        Left = 412
        Top = 15
        Width = 125
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        Sorted = True
        TabOrder = 2
        OnChange = CbBreedChange
      end
    end
    object edtRecNo: TEdit
      Left = 548
      Top = 16
      Width = 168
      Height = 22
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 87
    Width = 728
    Height = 352
    Align = alClient
    Color = clCream
    DataSource = ds_salemoney
    FixedColor = clSkyBlue
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnDblClick = DBGrid1DblClick
    OnTitleClick = DBGrid1TitleClick
    Columns = <
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
        Alignment = taCenter
        Expanded = False
        FieldName = 'inputprice'
        Title.Alignment = taCenter
        Title.Caption = #26368#36817#36827#36135#21333#20215
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'basePrice'
        Title.Alignment = taCenter
        Title.Caption = #25104#26412#22343#20215
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'singleprice'
        Title.Alignment = taCenter
        Title.Caption = #38646#21806#21333#20215
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'batchprice'
        Title.Alignment = taCenter
        Title.Caption = #25209#21457#21333#20215
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'agion'
        Title.Caption = #21830#21697#25240#25187#29575
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'prices1'
        Title.Alignment = taCenter
        Title.Caption = #39044#21806#20215#26684'1'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'prices2'
        Title.Alignment = taCenter
        Title.Caption = #39044#21806#20215#26684'2'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'prices3'
        Title.Alignment = taCenter
        Title.Caption = #39044#21806#20215#26684'3'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'prices4'
        Title.Alignment = taCenter
        Title.Caption = #39044#21806#20215#26684'4'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'prices5'
        Title.Alignment = taCenter
        Title.Caption = #39044#21806#20215#26684'5'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'prices6'
        Title.Alignment = taCenter
        Title.Caption = #39044#21806#20215#26684'6'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'prices7'
        Title.Caption = #39044#21806#20215#26684'7'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'prices8'
        Title.Caption = #39044#21806#20215#26684'8'
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 439
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
      Anchors = [akTop, akRight]
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
      Anchors = [akTop, akRight]
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
      Anchors = [akTop, akRight]
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
    object btnAdd: TBitBtn
      Left = 4
      Top = 8
      Width = 75
      Height = 25
      Caption = #26032#22686
      TabOrder = 3
      OnClick = btnAddClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        5555555FFFFFFFFFF5555550000000000555557777777777F5555550FFFFFFFF
        0555557F5FFFF557F5555550F0000FFF0555557F77775557F5555550FFFFFFFF
        0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
        0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
        0555557F5FFF5557F5555550F000FFFF0555557F77755FF7F5555550FFFFF000
        0555557F5FF5777755555550F00FF0F05555557F77557F7555555550FFFFF005
        5555557FFFFF7755555555500000005555555577777775555555555555555555
        5555555555555555555555555555555555555555555555555555}
      NumGlyphs = 2
    end
    object btnEdit: TBitBtn
      Left = 78
      Top = 8
      Width = 75
      Height = 25
      Caption = #20462#25913
      TabOrder = 4
      OnClick = btnEditClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
        DADA000000000000000D088888888888880A080808080808080D000000000000
        000AA0EEEEEEEE0DADADD0E0000EE0DADADAA0E0A0EE00ADADADD0E00EE0D00A
        DADAA0E0EE0DA000ADADD0EEE0DAD0B70ADAA0EE0DADA0B80DADD0E0DADADA0B
        70DAA00DADADAD0B00ADD0DADADADAD0110AADADADADADA000AD}
    end
    object btnDelete: TBitBtn
      Left = 152
      Top = 8
      Width = 75
      Height = 25
      Caption = #21024#38500
      TabOrder = 5
      OnClick = btnDeleteClick
      Glyph.Data = {
        EE000000424DEE000000000000007600000028000000100000000F0000000100
        04000000000078000000130B0000130B00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888888888888888881F88881F8888888888888991F8888889F8888191F888881
        F888888199F88891F8888888191F819F88888888819199F88888888888919F88
        88888888891911F888888888191F89F88888889191F88819F88881919F888881
        9F88891F8888888819F88888888888888888}
    end
    object BitBtn1: TBitBtn
      Left = 402
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #26597#23547#26465#20214
      Enabled = False
      TabOrder = 6
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
      Left = 226
      Top = 8
      Width = 75
      Height = 25
      Caption = #25209#37327#20462#25913
      TabOrder = 7
      OnClick = BitBtn2Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333330000000
        00003333377777777777333330FFFFFFFFF03FF3F7FFFF33FFF7003000000FF0
        00F077F7777773F77737E00FBFBFB0FFFFF07773333FF7FF33F7E0FBFB00000F
        F0F077F333777773F737E0BFBFBFBFB0FFF077F3333FFFF733F7E0FBFB00000F
        F0F077F333777773F737E0BFBFBFBFB0FFF077F33FFFFFF733F7E0FB0000000F
        F0F077FF777777733737000FB0FFFFFFFFF07773F7F333333337333000FFFFFF
        FFF0333777F3FFF33FF7333330F000FF0000333337F777337777333330FFFFFF
        0FF0333337FFFFFF7F37333330CCCCCC0F033333377777777F73333330FFFFFF
        0033333337FFFFFF773333333000000003333333377777777333}
      NumGlyphs = 2
    end
    object BitBtn4: TBitBtn
      Left = 300
      Top = 8
      Width = 75
      Height = 25
      Hint = #25351#23450#38144#21806#20215#26684
      Anchors = [akTop, akRight]
      Caption = #20215#26684#26041#24335
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
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
  end
  object ds_salemoney: TDataSource
    DataSet = dmmain.dsquery
    Left = 496
    Top = 64
  end
end
