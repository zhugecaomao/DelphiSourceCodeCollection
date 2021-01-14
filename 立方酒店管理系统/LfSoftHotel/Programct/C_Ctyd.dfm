object CtydForm: TCtydForm
  Left = 49
  Top = 40
  Width = 700
  Height = 500
  Caption = #39184#21381#39044#23450
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 692
    Height = 90
    Align = alTop
    AutoSize = True
    BevelOuter = bvNone
    BorderWidth = 6
    TabOrder = 0
    object Bevel1: TBevel
      Left = 6
      Top = 40
      Width = 680
      Height = 44
      Align = alBottom
      Shape = bsFrame
    end
    object lblTitle: TLabel
      Left = 280
      Top = 6
      Width = 93
      Height = 21
      Caption = #39184#21381#39044#23450
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = #26999#20307'_GB2312'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 424
      Top = 58
      Width = 60
      Height = 12
      Caption = #29992#39184#26085#26399#65306
    end
    object btnQuery: TBitBtn
      Left = 600
      Top = 49
      Width = 75
      Height = 25
      Caption = #26597#35810
      TabOrder = 3
      OnClick = btnQueryClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333FF3FF3333333333CC30003333333333773777333333333C33
        3000333FF33337F33777339933333C3333333377F33337F3333F339933333C33
        33003377333337F33377333333333C333300333F333337F33377339333333C33
        3333337FF3333733333F33993333C33333003377FF33733333773339933C3333
        330033377FF73F33337733339933C33333333FF377F373F3333F993399333C33
        330077F377F337F33377993399333C33330077FF773337F33377399993333C33
        33333777733337F333FF333333333C33300033333333373FF7773333333333CC
        3000333333333377377733333333333333333333333333333333}
      NumGlyphs = 2
    end
    object dtpDate: TDateTimePicker
      Left = 480
      Top = 52
      Width = 113
      Height = 20
      CalAlignment = dtaLeft
      Date = 37582.7767958333
      Time = 37582.7767958333
      DateFormat = dfLong
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 0
    end
    object btnJryd: TBitBtn
      Left = 120
      Top = 50
      Width = 100
      Height = 25
      Caption = #20170#26085#39044#23450
      TabOrder = 2
      OnClick = btnJrydClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object btnYdAll: TBitBtn
      Left = 16
      Top = 50
      Width = 100
      Height = 25
      Caption = #25152#26377#39044#23450
      TabOrder = 1
      OnClick = btnYdAllClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 90
    Width = 692
    Height = 346
    Align = alClient
    AutoSize = True
    BevelOuter = bvNone
    BorderWidth = 6
    TabOrder = 1
    object Panel4: TPanel
      Left = 6
      Top = 6
      Width = 680
      Height = 203
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 680
        Height = 203
        Align = alClient
        DataSource = dsYdcysk
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'System'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = GB2312_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'System'
        TitleFont.Style = [fsBold]
        OnDblClick = btnYdktskClick
        Columns = <
          item
            Expanded = False
            FieldName = 'D_YDBZ'
            Title.Alignment = taCenter
            Title.Caption = #39044#23450#31867#22411
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'D_SYRQ'
            Title.Alignment = taCenter
            Title.Caption = #29992#39184#26085#26399
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'D_SJDM'
            Title.Alignment = taCenter
            Title.Caption = #29992#39184#26102#27573
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'D_KRXM'
            Title.Alignment = taCenter
            Title.Caption = #23458#20154#22995#21517
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'D_YCBZ'
            Title.Alignment = taCenter
            Title.Caption = #29992#39184#26631#20934
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'D_CZYXM'
            Title.Alignment = taCenter
            Title.Caption = #25805#20316#21592
            Visible = True
          end>
      end
    end
    object Panel5: TPanel
      Left = 6
      Top = 209
      Width = 680
      Height = 131
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object DBGrid2: TDBGrid
        Left = 0
        Top = 0
        Width = 680
        Height = 131
        Align = alClient
        DataSource = dsYdcytd
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'System'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = GB2312_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'System'
        TitleFont.Style = [fsBold]
        OnDblClick = btnYdkttdClick
        Columns = <
          item
            Expanded = False
            FieldName = 'D_YDBZ'
            Title.Alignment = taCenter
            Title.Caption = #39044#23450#31867#22411
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'D_SYRQ'
            Title.Alignment = taCenter
            Title.Caption = #29992#39184#26085#26399
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'D_SJDM'
            Title.Alignment = taCenter
            Title.Caption = #29992#39184#26102#27573
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'D_KRXM'
            Title.Alignment = taCenter
            Title.Caption = #23458#20154#22995#21517
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'D_YCBZ'
            Title.Alignment = taCenter
            Title.Caption = #29992#39184#26631#20934
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'D_CZYXM'
            Title.Alignment = taCenter
            Title.Caption = #25805#20316#21592
            Visible = True
          end>
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 436
    Width = 692
    Height = 37
    Align = alBottom
    AutoSize = True
    BevelOuter = bvNone
    BorderWidth = 6
    TabOrder = 2
    DesignSize = (
      692
      37)
    object btnClose: TBitBtn
      Left = 609
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = #20851#38381
      ModalResult = 2
      TabOrder = 0
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
        F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
        000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
        338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
        45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
        3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
        F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
        000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
        338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
        4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
        8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
        333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
        0000}
      NumGlyphs = 2
    end
    object btnYdktsk: TBitBtn
      Left = 505
      Top = 6
      Width = 100
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #25955#23458#24320#21488
      TabOrder = 1
      OnClick = btnYdktskClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333333333FFFFFFFFF333333000000000033333377777777773333330FFFFF
        FFF03333337F333333373333330FFFFFFFF03333337F3FF3FFF73333330F00F0
        00F03333F37F773777373330330FFFFFFFF03337FF7F3F3FF3F73339030F0800
        F0F033377F7F737737373339900FFFFFFFF03FF7777F3FF3FFF70999990F00F0
        00007777777F7737777709999990FFF0FF0377777777FF37F3730999999908F0
        F033777777777337F73309999990FFF0033377777777FFF77333099999000000
        3333777777777777333333399033333333333337773333333333333903333333
        3333333773333333333333303333333333333337333333333333}
      NumGlyphs = 2
    end
    object btnYdkttd: TBitBtn
      Left = 400
      Top = 6
      Width = 100
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #22242#38431#24320#21488
      TabOrder = 2
      OnClick = btnYdkttdClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333333333FFFFFFFFF333333000000000033333377777777773333330FFFFF
        FFF03333337F333333373333330FFFFFFFF03333337F3FF3FFF73333330F00F0
        00F03333F37F773777373330330FFFFFFFF03337FF7F3F3FF3F73339030F0800
        F0F033377F7F737737373339900FFFFFFFF03FF7777F3FF3FFF70999990F00F0
        00007777777F7737777709999990FFF0FF0377777777FF37F3730999999908F0
        F033777777777337F73309999990FFF0033377777777FFF77333099999000000
        3333777777777777333333399033333333333337773333333333333903333333
        3333333773333333333333303333333333333337333333333333}
      NumGlyphs = 2
    end
  end
  object qryYdcysk: TQuery
    DatabaseName = 'LfHotelUser'
    SQL.Strings = (
      'select * from YDCY')
    Left = 24
    Top = 8
    object qryYdcyskD_YDBH: TStringField
      FieldName = 'D_YDBH'
      Origin = 'LFHOTELUSER.YDCY.D_YDBH'
      Size = 12
    end
    object qryYdcyskD_CTBH: TStringField
      FieldName = 'D_CTBH'
      Origin = 'LFHOTELUSER.YDCY.D_CTBH'
      Size = 5
    end
    object qryYdcyskD_CTMC: TStringField
      FieldName = 'D_CTMC'
      Origin = 'LFHOTELUSER.YDCY.D_CTMC'
      Size = 10
    end
    object qryYdcyskD_KRBH: TStringField
      FieldName = 'D_KRBH'
      Origin = 'LFHOTELUSER.YDCY.D_KRBH'
      Size = 12
    end
    object qryYdcyskD_KRXM: TStringField
      FieldName = 'D_KRXM'
      Origin = 'LFHOTELUSER.YDCY.D_KRXM'
      Size = 30
    end
    object qryYdcyskD_YDRQ: TDateTimeField
      FieldName = 'D_YDRQ'
      Origin = 'LFHOTELUSER.YDCY.D_YDRQ'
    end
    object qryYdcyskD_SYRQ: TDateTimeField
      FieldName = 'D_SYRQ'
      Origin = 'LFHOTELUSER.YDCY.D_SYRQ'
    end
    object qryYdcyskD_SYSJ: TDateTimeField
      FieldName = 'D_SYSJ'
      Origin = 'LFHOTELUSER.YDCY.D_SYSJ'
    end
    object qryYdcyskD_SJDM: TStringField
      FieldName = 'D_SJDM'
      Origin = 'LFHOTELUSER.YDCY.D_SJDM'
      FixedChar = True
      Size = 4
    end
    object qryYdcyskD_YCBZ: TStringField
      FieldName = 'D_YCBZ'
      Origin = 'LFHOTELUSER.YDCY.D_YCBZ'
      Size = 30
    end
    object qryYdcyskD_YCLX: TIntegerField
      FieldName = 'D_YCLX'
      Origin = 'LFHOTELUSER.YDCY.D_YCLX'
    end
    object qryYdcyskD_RS: TIntegerField
      FieldName = 'D_RS'
      Origin = 'LFHOTELUSER.YDCY.D_RS'
    end
    object qryYdcyskD_DJ: TFloatField
      FieldName = 'D_DJ'
      Origin = 'LFHOTELUSER.YDCY.D_DJ'
    end
    object qryYdcyskD_XFSL: TFloatField
      FieldName = 'D_XFSL'
      Origin = 'LFHOTELUSER.YDCY.D_XFSL'
    end
    object qryYdcyskD_XFJE: TFloatField
      FieldName = 'D_XFJE'
      Origin = 'LFHOTELUSER.YDCY.D_XFJE'
    end
    object qryYdcyskD_YDBZ: TStringField
      FieldName = 'D_YDBZ'
      Origin = 'LFHOTELUSER.YDCY.D_YDBZ'
      OnGetText = qryYdcyskD_YDBZGetText
      FixedChar = True
      Size = 1
    end
    object qryYdcyskD_RZBZ: TStringField
      FieldName = 'D_RZBZ'
      Origin = 'LFHOTELUSER.YDCY.D_RZBZ'
      FixedChar = True
      Size = 1
    end
    object qryYdcyskD_KTBZ: TStringField
      FieldName = 'D_KTBZ'
      Origin = 'LFHOTELUSER.YDCY.D_KTBZ'
      FixedChar = True
      Size = 1
    end
    object qryYdcyskD_JSBZ: TStringField
      FieldName = 'D_JSBZ'
      Origin = 'LFHOTELUSER.YDCY.D_JSBZ'
      FixedChar = True
      Size = 1
    end
    object qryYdcyskD_BZ: TBlobField
      FieldName = 'D_BZ'
      Origin = 'LFHOTELUSER.YDCY.D_BZ'
      Size = 1
    end
    object qryYdcyskD_CZYXM: TStringField
      FieldName = 'D_CZYXM'
      Origin = 'LFHOTELUSER.YDCY.D_CZYXM'
      Size = 8
    end
  end
  object qryYdcytd: TQuery
    DatabaseName = 'LfHotelUser'
    SQL.Strings = (
      'select * from YDCY')
    Left = 96
    Top = 8
    object qryYdcytdD_YDBH: TStringField
      FieldName = 'D_YDBH'
      Origin = 'LFHOTELUSER.YDCY.D_YDBH'
      Size = 12
    end
    object qryYdcytdD_CTBH: TStringField
      FieldName = 'D_CTBH'
      Origin = 'LFHOTELUSER.YDCY.D_CTBH'
      Size = 5
    end
    object qryYdcytdD_CTMC: TStringField
      FieldName = 'D_CTMC'
      Origin = 'LFHOTELUSER.YDCY.D_CTMC'
      Size = 10
    end
    object qryYdcytdD_KRBH: TStringField
      FieldName = 'D_KRBH'
      Origin = 'LFHOTELUSER.YDCY.D_KRBH'
      Size = 12
    end
    object qryYdcytdD_KRXM: TStringField
      FieldName = 'D_KRXM'
      Origin = 'LFHOTELUSER.YDCY.D_KRXM'
      Size = 30
    end
    object qryYdcytdD_YDRQ: TDateTimeField
      FieldName = 'D_YDRQ'
      Origin = 'LFHOTELUSER.YDCY.D_YDRQ'
    end
    object qryYdcytdD_SYRQ: TDateTimeField
      FieldName = 'D_SYRQ'
      Origin = 'LFHOTELUSER.YDCY.D_SYRQ'
    end
    object qryYdcytdD_SYSJ: TDateTimeField
      FieldName = 'D_SYSJ'
      Origin = 'LFHOTELUSER.YDCY.D_SYSJ'
    end
    object qryYdcytdD_SJDM: TStringField
      FieldName = 'D_SJDM'
      Origin = 'LFHOTELUSER.YDCY.D_SJDM'
      FixedChar = True
      Size = 4
    end
    object qryYdcytdD_YCBZ: TStringField
      FieldName = 'D_YCBZ'
      Origin = 'LFHOTELUSER.YDCY.D_YCBZ'
      Size = 30
    end
    object qryYdcytdD_YCLX: TIntegerField
      FieldName = 'D_YCLX'
      Origin = 'LFHOTELUSER.YDCY.D_YCLX'
    end
    object qryYdcytdD_RS: TIntegerField
      FieldName = 'D_RS'
      Origin = 'LFHOTELUSER.YDCY.D_RS'
    end
    object qryYdcytdD_DJ: TFloatField
      FieldName = 'D_DJ'
      Origin = 'LFHOTELUSER.YDCY.D_DJ'
    end
    object qryYdcytdD_XFSL: TFloatField
      FieldName = 'D_XFSL'
      Origin = 'LFHOTELUSER.YDCY.D_XFSL'
    end
    object qryYdcytdD_XFJE: TFloatField
      FieldName = 'D_XFJE'
      Origin = 'LFHOTELUSER.YDCY.D_XFJE'
    end
    object qryYdcytdD_YDBZ: TStringField
      FieldName = 'D_YDBZ'
      Origin = 'LFHOTELUSER.YDCY.D_YDBZ'
      OnGetText = qryYdcyskD_YDBZGetText
      FixedChar = True
      Size = 1
    end
    object qryYdcytdD_RZBZ: TStringField
      FieldName = 'D_RZBZ'
      Origin = 'LFHOTELUSER.YDCY.D_RZBZ'
      FixedChar = True
      Size = 1
    end
    object qryYdcytdD_KTBZ: TStringField
      FieldName = 'D_KTBZ'
      Origin = 'LFHOTELUSER.YDCY.D_KTBZ'
      FixedChar = True
      Size = 1
    end
    object qryYdcytdD_JSBZ: TStringField
      FieldName = 'D_JSBZ'
      Origin = 'LFHOTELUSER.YDCY.D_JSBZ'
      FixedChar = True
      Size = 1
    end
    object qryYdcytdD_BZ: TBlobField
      FieldName = 'D_BZ'
      Origin = 'LFHOTELUSER.YDCY.D_BZ'
      Size = 1
    end
    object qryYdcytdD_CZYXM: TStringField
      FieldName = 'D_CZYXM'
      Origin = 'LFHOTELUSER.YDCY.D_CZYXM'
      Size = 8
    end
  end
  object dsYdcysk: TDataSource
    DataSet = qryYdcysk
    Left = 64
    Top = 8
  end
  object dsYdcytd: TDataSource
    DataSet = qryYdcytd
    Left = 128
    Top = 8
  end
  object qryCtbh: TQuery
    DatabaseName = 'LfHotelUser'
    Left = 216
    Top = 8
  end
end
