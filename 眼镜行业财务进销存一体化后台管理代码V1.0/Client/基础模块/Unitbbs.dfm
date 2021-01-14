object frmbbs: Tfrmbbs
  Left = 17
  Top = 108
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsSingle
  Caption = #20844#21578#26495#20869#23481#26597#30475
  ClientHeight = 392
  ClientWidth = 692
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 145
    Top = 41
    Width = 547
    Height = 313
    Align = alClient
    BevelOuter = bvNone
    Color = clCream
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 0
      Top = 0
      Width = 547
      Height = 313
      Align = alClient
      Color = clCream
      DataSource = dsview
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnDblClick = wwDBGrid1DblClick
      OnTitleClick = DBGrid1TitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'lmzt'
          Title.Alignment = taCenter
          Title.Caption = #26639#30446#20027#39064
          Width = 239
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'memo'
          Title.Alignment = taCenter
          Title.Caption = #26639#30446#20869#23481
          Width = 269
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'date'
          Title.Alignment = taCenter
          Title.Caption = #21457#24067#26102#38388
          Visible = True
        end>
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 354
    Width = 692
    Height = 38
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      692
      38)
    object BitBtn2: TBitBtn
      Left = 452
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #26639#30446#24067#23616
      Enabled = False
      TabOrder = 0
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
      Left = 528
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
    object BitBtn7: TBitBtn
      Left = 617
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #36864#20986
      TabOrder = 2
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
    Top = 0
    Width = 692
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object Label1: TLabel
      Left = 32
      Top = 8
      Width = 100
      Height = 19
      Alignment = taCenter
      Caption = #20844#21578#26495#26597#30475
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = #21326#25991#34892#26999
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 464
      Top = 8
      Width = 13
      Height = 13
      Caption = #36215
    end
    object Label8: TLabel
      Left = 624
      Top = 9
      Width = 13
      Height = 13
      Caption = #27490
    end
    object Label2: TLabel
      Left = 272
      Top = 8
      Width = 52
      Height = 13
      Caption = #21457#24067#26102#38388
    end
    object dtpBegin: TDateTimePicker
      Left = 332
      Top = 4
      Width = 130
      Height = 21
      CalAlignment = dtaLeft
      Date = 37921.4816629977
      Time = 37921.4816629977
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 0
      OnChange = dtpBeginChange
    end
    object dtpEnd: TDateTimePicker
      Left = 484
      Top = 4
      Width = 130
      Height = 21
      CalAlignment = dtaLeft
      Date = 37921.4816629977
      Time = 37921.4816629977
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 1
      OnChange = dtpBeginChange
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 41
    Width = 145
    Height = 313
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 3
    object DBGrid2: TDBGrid
      Left = 0
      Top = 0
      Width = 145
      Height = 313
      Align = alClient
      Color = clCream
      DataSource = dsLMdata
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnDblClick = DBGrid2DblClick
      OnTitleClick = DBGrid2TitleClick
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'lmno'
          Title.Alignment = taCenter
          Title.Caption = #26639#30446#32534#21495
          Width = 70
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'lmname'
          Title.Alignment = taCenter
          Title.Caption = #26639#30446#21517#31216
          Width = 70
          Visible = True
        end>
    end
  end
  object dsview: TDataSource
    DataSet = cdsdata
    Left = 208
    Top = 16
  end
  object cdsdata: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 256
    Top = 24
  end
  object dsLMdata: TDataSource
    DataSet = cdsLmdata
    Left = 160
    Top = 16
  end
  object cdsLmdata: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 144
    Top = 8
  end
end
