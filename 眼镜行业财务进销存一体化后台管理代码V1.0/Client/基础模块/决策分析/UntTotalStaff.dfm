inherited fmTotalStaff: TfmTotalStaff
  Left = 33
  Top = 120
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = #38646#21806#32479#35745
  ClientHeight = 397
  ClientWidth = 742
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 0
    Top = 356
    Width = 742
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      742
      41)
    object BitBtn1: TBitBtn
      Left = 427
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #26597#23547#26465#20214
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
      Left = 501
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
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
      Left = 578
      Top = 8
      Width = 89
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #19979#19968#31508#25968#25454
      Enabled = False
      TabOrder = 2
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
      Left = 667
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
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
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 742
    Height = 315
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 0
      Top = 0
      Width = 742
      Height = 315
      Align = alClient
      DataSource = dsview
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnDrawDataCell = DBGrid1DrawDataCell
      OnDrawColumnCell = DBGrid1DrawColumnCell
      OnTitleClick = DBGrid1TitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'part_name'
          Title.Alignment = taCenter
          Title.Caption = #37096#38376
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = '01'#26376
          Title.Alignment = taCenter
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = '02'#26376
          Title.Alignment = taCenter
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = '03'#26376
          Title.Alignment = taCenter
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = '04'#26376
          Title.Alignment = taCenter
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = '05'#26376
          Title.Alignment = taCenter
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = '06'#26376
          Title.Alignment = taCenter
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = '07'#26376
          Title.Alignment = taCenter
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = '08'#26376
          Title.Alignment = taCenter
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = '09'#26376
          Title.Alignment = taCenter
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = '10'#26376
          Title.Alignment = taCenter
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = '11'#26376
          Title.Alignment = taCenter
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = '12'#26376
          Title.Alignment = taCenter
          Width = 70
          Visible = True
        end>
    end
    object DBGrid2: TDBGrid
      Left = 0
      Top = 0
      Width = 742
      Height = 315
      Align = alClient
      DataSource = dsview
      TabOrder = 1
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      Visible = False
      OnDrawDataCell = DBGrid2DrawDataCell
      OnDrawColumnCell = DBGrid2DrawColumnCell
      OnTitleClick = DBGrid2TitleClick
      Columns = <
        item
          Expanded = False
          Title.Alignment = taCenter
          Title.Caption = #37096#38376
          Width = 100
          Visible = True
        end>
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvSpace
    TabOrder = 2
    object Label1: TLabel
      Left = 13
      Top = 9
      Width = 92
      Height = 21
      Caption = #38646#21806#32479#35745
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = #38582#20070
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 160
      Top = 17
      Width = 65
      Height = 13
      Caption = #19979#36733#26465#25968#65306
      Visible = False
    end
    object cmbtop: TComboBox
      Left = 224
      Top = 12
      Width = 73
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      Visible = False
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
  object dsview: TDataSource
    DataSet = dmmain.dsquery
    Left = 560
    Top = 16
  end
end
