object frmkqsj: Tfrmkqsj
  Left = 137
  Top = 96
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = #32771#21220#26426#25968#25454#26597#35810
  ClientHeight = 339
  ClientWidth = 625
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 59
    Width = 625
    Height = 241
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvSpace
    Color = clBtnShadow
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 2
      Top = 2
      Width = 621
      Height = 237
      Align = alClient
      DataSource = dsview
      TabOrder = 0
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'person_no'
          Title.Alignment = taCenter
          Title.Caption = #21592#24037#32534#21495
          Width = 119
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'p_name'
          Title.Alignment = taCenter
          Title.Caption = #21592#24037#22995#21517
          Width = 119
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'p_icno'
          Title.Alignment = taCenter
          Title.Caption = 'IC'#21345#21495
          Width = 106
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'SKTIME'
          Title.Alignment = taCenter
          Title.Caption = #31614#21040#26102#38388
          Width = 106
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'SKDATE'
          Title.Alignment = taCenter
          Title.Caption = #31614#21040#26085#26399
          Width = 110
          Visible = True
        end>
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 625
    Height = 59
    Align = alTop
    BevelOuter = bvNone
    Color = clCream
    TabOrder = 1
    object Label1: TLabel
      Left = 6
      Top = 12
      Width = 98
      Height = 13
      Caption = #32771#21220#26426#25968#25454#26597#35810
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 194
      Top = 36
      Width = 52
      Height = 13
      Caption = #20174#21592#24037#21495
    end
    object Label3: TLabel
      Left = 361
      Top = 35
      Width = 52
      Height = 13
      Caption = #21040#21592#24037#21495
    end
    object Label4: TLabel
      Left = 528
      Top = 36
      Width = 13
      Height = 13
      Caption = #27490
    end
    object spdcx: TSpeedButton
      Left = 552
      Top = 32
      Width = 65
      Height = 22
      Caption = #26597#35810
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333000003333333333F777773FF333333008877700
        33333337733FFF773F33330887000777033333733F777FFF73F330880F9F9F07
        703337F37733377FF7F33080F00000F07033373733777337F73F087F0091100F
        77037F3737333737FF7F08090919110907037F737F3333737F7F0F0F0999910F
        07037F737F3333737F7F0F090F99190908037F737FF33373737F0F7F00FF900F
        780373F737FFF737F3733080F00000F0803337F73377733737F330F80F9F9F08
        8033373F773337733733330F8700078803333373FF77733F733333300FFF8800
        3333333773FFFF77333333333000003333333333377777333333}
      NumGlyphs = 2
      OnClick = spdcxClick
    end
    object Label5: TLabel
      Left = 192
      Top = 10
      Width = 52
      Height = 13
      Caption = #19979#36733#26465#25968
    end
    object cbqsbh: TComboBox
      Left = 248
      Top = 32
      Width = 111
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
    end
    object cbjzbh: TComboBox
      Left = 413
      Top = 32
      Width = 111
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
    end
    object cmbtop: TComboBox
      Left = 248
      Top = 7
      Width = 73
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
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
  object Panel3: TPanel
    Left = 0
    Top = 300
    Width = 625
    Height = 39
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object BitBtn4: TBitBtn
      Left = 321
      Top = 10
      Width = 75
      Height = 25
      Caption = #23548#20986
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BitBtn4Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333330B7FFF
        FFB0333333777F3333773333330B7FFFFFB0333333777F3333773333330B7FFF
        FFB0333333777F3333773333330B7FFFFFB03FFFFF777FFFFF77000000000077
        007077777777777777770FFFFFFFF00077B07F33333337FFFF770FFFFFFFF000
        7BB07F3FF3FFF77FF7770F00F000F00090077F77377737777F770FFFFFFFF039
        99337F3FFFF3F7F777FF0F0000F0F09999937F7777373777777F0FFFFFFFF999
        99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
        99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
        93337FFFF7737777733300000033333333337777773333333333}
      NumGlyphs = 2
    end
    object BitBtn5: TBitBtn
      Left = 395
      Top = 10
      Width = 75
      Height = 25
      Caption = #21024#38500
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtn5Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333333333333333333FFF33FF333FFF339993370733
        999333777FF37FF377733339993000399933333777F777F77733333399970799
        93333333777F7377733333333999399933333333377737773333333333990993
        3333333333737F73333333333331013333333333333777FF3333333333910193
        333333333337773FF3333333399000993333333337377737FF33333399900099
        93333333773777377FF333399930003999333337773777F777FF339993370733
        9993337773337333777333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
    end
    object BitBtn6: TBitBtn
      Left = 469
      Top = 10
      Width = 75
      Height = 25
      Caption = #25171#21360
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 2
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
    object BitBtn7: TBitBtn
      Left = 543
      Top = 10
      Width = 75
      Height = 25
      Caption = #20851#38381
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = BitBtn7Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
        03333377777777777F333301BBBBBBBB033333773F3333337F3333011BBBBBBB
        0333337F73F333337F33330111BBBBBB0333337F373F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337FF3337F33330111B0BBBB
        0333337F337733337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F3F7F33337F333301E10BBBBB0333337F7F7F33337F333301EE0BBBBB
        0333337F777FFFFF7F3333000000000003333377777777777333}
      NumGlyphs = 2
    end
  end
  object dsview: TDataSource
    DataSet = dmmain.cdsKQdoc
    Left = 448
    Top = 72
  end
end
