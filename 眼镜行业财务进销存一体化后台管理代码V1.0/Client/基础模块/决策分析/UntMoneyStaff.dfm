inherited fmMoneyStaff: TfmMoneyStaff
  Left = 120
  Top = 58
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = #24448#26469#20998#26512
  ClientHeight = 384
  ClientWidth = 617
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 617
    Height = 42
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvSpace
    TabOrder = 0
    object Label1: TLabel
      Left = 11
      Top = 10
      Width = 138
      Height = 21
      Caption = #24448#26469#19994#21153#20998#26512
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = #38582#20070
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 205
      Top = 12
      Width = 11
      Height = 19
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = #38582#20070
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 312
      Top = 18
      Width = 65
      Height = 13
      Caption = #19979#36733#26465#25968#65306
    end
    object cmbtop: TComboBox
      Left = 376
      Top = 15
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
    Top = 42
    Width = 617
    Height = 305
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object Gridbase: TStringGrid
      Left = 0
      Top = 0
      Width = 617
      Height = 305
      Align = alClient
      RowCount = 2
      TabOrder = 0
      Visible = False
    end
    object DBGrid1: TDBGrid
      Left = 0
      Top = 0
      Width = 617
      Height = 305
      Align = alClient
      DataSource = dsview
      TabOrder = 1
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'supply_NO'
          Title.Alignment = taCenter
          Title.Caption = #21333#20301#32534#21495
          Width = 172
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'supply_name'
          Title.Alignment = taCenter
          Title.Caption = #21333#20301#21517#31216
          Width = 204
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Pay_gather'
          Title.Alignment = taCenter
          Title.Caption = #26399#21021#24212#20184
          Width = 70
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Must_gather'
          Title.Alignment = taCenter
          Title.Caption = #26399#21021#24212#25910
          Width = 70
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'totalrise'
          Title.Alignment = taCenter
          Title.Caption = #26412#26399#24212#20184
          Width = 70
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'receivables'
          Title.Alignment = taCenter
          Title.Caption = #26412#26399#24212#25910
          Width = 70
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'total_Pay'
          Title.Alignment = taCenter
          Title.Caption = #32047#35745#24212#20184
          Width = 70
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'total_geher'
          Title.Alignment = taCenter
          Title.Caption = #32047#35745#24212#25910
          Width = 70
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'balance'
          Title.Alignment = taCenter
          Title.Caption = #32047#35745#20313#39069
          Width = 70
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'contact'
          Title.Alignment = taCenter
          Title.Caption = #20449#29992#39069#24230
          Width = 70
          Visible = True
        end>
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 347
    Width = 617
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      617
      37)
    object BitBtn1: TBitBtn
      Left = 302
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #26597#23547#26465#20214
      TabOrder = 0
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
      Left = 376
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
    object btnpagedown: TBitBtn
      Left = 451
      Top = 8
      Width = 89
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #19979#19968#31508#25968#25454
      TabOrder = 2
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
      Left = 539
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #36864#20986
      TabOrder = 3
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
  object dsview: TDataSource
    DataSet = dmmain.CDSquery
    Left = 336
    Top = 64
  end
end
