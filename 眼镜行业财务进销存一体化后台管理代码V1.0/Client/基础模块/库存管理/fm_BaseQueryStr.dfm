inherited fmBaseQueryStr: TfmBaseQueryStr
  Left = 32
  Top = 50
  Caption = #36890#29992#26597#35810#30028#38754
  ClientHeight = 480
  ClientWidth = 728
  OldCreateOrder = True
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 439
    Width = 728
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    BevelOuter = bvLowered
    Color = 16573127
    TabOrder = 0
    object btnExit: TBitBtn
      Left = 536
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
    object btnQuery: TBitBtn
      Left = 31
      Top = 8
      Width = 75
      Height = 25
      Caption = #26597#35810#26465#20214
      TabOrder = 1
      OnClick = btnQueryClick
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
    object btnColumn: TBitBtn
      Left = 187
      Top = 8
      Width = 75
      Height = 25
      Caption = #26639#30446#24067#23616
      TabOrder = 2
      OnClick = btnColumnClick
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
    object btnPrivew: TBitBtn
      Left = 266
      Top = 8
      Width = 75
      Height = 25
      Caption = #25171#21360#39044#35272
      TabOrder = 3
      OnClick = btnPrivewClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
        DADAADADADADADADADADD0000000000000DA067676767676760D076700000007
        670A06760FFFFF06760D07670F444F07670A06760FFFFF06760D07670F44FF07
        670A06760FFFFF06760D07670F444F07670A06760FFFFF06760D076700000007
        670A067676767676760DD0000000000000DAADADADADADADADAD}
    end
    object btnChart: TBitBtn
      Left = 344
      Top = 8
      Width = 75
      Height = 25
      Caption = #32479#35745#35270#22270
      TabOrder = 4
      OnClick = btnChartClick
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
      Left = 423
      Top = 8
      Width = 89
      Height = 25
      Caption = #19979#19968#31508#25968#25454
      TabOrder = 5
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
      Left = 109
      Top = 8
      Width = 75
      Height = 25
      Caption = #25490#24207#26465#20214
      TabOrder = 6
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
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 82
    Width = 728
    Height = 354
    Color = clCream
    FixedColor = clSkyBlue
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'SG_Code'
        ReadOnly = True
        Title.Caption = #39038#23458#32534#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SG_Name'
        ReadOnly = True
        Title.Caption = #39038#23458#22995#21517
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SG_Sex'
        ReadOnly = True
        Title.Caption = #24615#21035
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SG_Age'
        ReadOnly = True
        Title.Caption = #24180#40836
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SG_Month'
        ReadOnly = True
        Title.Caption = #20986#29983#26376#20221
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SG_Address'
        ReadOnly = True
        Title.Caption = #32852#31995#22320#22336
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SG_PostCode'
        ReadOnly = True
        Title.Caption = #37038#25919#32534#30721
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SG_Area'
        ReadOnly = True
        Title.Caption = #25152#22312#22320#21306
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SG_Province'
        ReadOnly = True
        Title.Caption = #25152#22312#30465
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SG_City'
        ReadOnly = True
        Title.Caption = #25152#22312#22478#24066
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sg_id'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 728
    Height = 81
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvLowered
    Color = 16573127
    TabOrder = 2
    object Label1: TLabel
      Left = 56
      Top = 16
      Width = 136
      Height = 16
      Caption = #27599#27425#19979#36733#25968#25454#26465#25968':'
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object LblSort: TLabel
      Left = 55
      Top = 50
      Width = 128
      Height = 16
      Caption = #24403#21069#25490#24207#26041#24335#26159#65306
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Bevel1: TBevel
      Left = 2
      Top = 46
      Width = 724
      Height = 2
      Style = bsRaised
    end
    object ComboBox1: TComboBox
      Left = 200
      Top = 16
      Width = 87
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 10
      TabOrder = 0
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
    object edtRecNo: TEdit
      Left = 312
      Top = 14
      Width = 265
      Height = 28
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImeName = #12356#12421' ('#32649#30768') - '#31325#29460#57646
      ParentFont = False
      TabOrder = 1
    end
    object edtTime: TEdit
      Left = 600
      Top = 14
      Width = 94
      Height = 28
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImeName = #12356#12421' ('#32649#30768') - '#31325#29460#57646
      ParentFont = False
      TabOrder = 2
    end
  end
end
