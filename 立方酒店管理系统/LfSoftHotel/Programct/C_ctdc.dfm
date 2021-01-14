object CtdcForm: TCtdcForm
  Left = 224
  Top = 1
  Width = 535
  Height = 570
  Caption = #28857#33756
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 527
    Height = 64
    Align = alTop
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 0
    object ToolBar1: TToolBar
      Left = 0
      Top = 0
      Width = 527
      Height = 64
      Align = alClient
      ButtonHeight = 58
      Caption = 'ToolBar1'
      TabOrder = 0
      object btnDc: TBitBtn
        Left = 0
        Top = 2
        Width = 75
        Height = 58
        Caption = #28857#33756'(F2)'
        TabOrder = 0
        OnClick = btnDcClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          888800000000000088880FFFFFFFFFF088880F00F00000F088880FFFFFFFFFF0
          88880F00F00000F088880FFFFFFFFFF088880FFFFFFF0FF088880F00FFF080F0
          88880F080F08080008440FF08080808880440000080808888844888880808888
          8844888888088888804488888880000008448888888888888888}
        Layout = blGlyphTop
      end
      object btnSc: TBitBtn
        Left = 75
        Top = 2
        Width = 75
        Height = 58
        Caption = #21024#33756'(F3)'
        TabOrder = 1
        OnClick = btnScClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888888888888888808888888888088800088888888888880000888888
          8088888000888888088888880008888008888888800088008888888888000008
          8888888888800088888888888800000888888888800088008888888000088880
          0888880000888888008888000888888888088888888888888888}
        Layout = blGlyphTop
      end
      object btnTc: TBitBtn
        Left = 150
        Top = 2
        Width = 75
        Height = 58
        Caption = #36864#33756'(F4)'
        TabOrder = 2
        OnClick = btnTcClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888888888888888888888888888888888888888888888888888888888
          8888888888888887488888444448888847888844448888888488884448888888
          8488884484888888848888488844888847888888888844447888888888888888
          8888888888888888888888888888888888888888888888888888}
        Layout = blGlyphTop
      end
      object btnUndel: TBitBtn
        Left = 225
        Top = 2
        Width = 75
        Height = 58
        Caption = #24674#22797'(F8)'
        TabOrder = 3
        OnClick = btnUndelClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888888888888888888888888888888888888888888888888888888888
          8888888478888888888888748888844444888848888888444488884888888884
          4488884888888848448888748888448884888887444488888888888888888888
          8888888888888888888888888888888888888888888888888888}
        Layout = blGlyphTop
      end
      object btnJz: TBitBtn
        Left = 300
        Top = 2
        Width = 75
        Height = 58
        Caption = #32467#24080'(F5)'
        TabOrder = 4
        OnClick = btnJzClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
          73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
          0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
          0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
          0333337F777777737F333308888888880333337F333333337F33330888888888
          03333373FFFFFFFF733333700000000073333337777777773333}
        Layout = blGlyphTop
        NumGlyphs = 2
      end
      object btnDy: TBitBtn
        Left = 375
        Top = 2
        Width = 75
        Height = 58
        Caption = #25171#21360'(F6)'
        TabOrder = 5
        OnClick = btnDyClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          888F8800000000000888808888888880808800000000000008080888888BBB88
          0008088888877788080800000000000008800888888888808080800000000008
          0800880FFFFFFFF080808880F00000F000088880FFFFFFFF088888880F00000F
          088888880FFFFFFFF08888888000000000888888888888888888}
        Layout = blGlyphTop
      end
      object btnClose: TBitBtn
        Left = 450
        Top = 2
        Width = 75
        Height = 58
        Cancel = True
        Caption = #36820#22238
        ModalResult = 2
        TabOrder = 6
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
        Layout = blGlyphTop
        NumGlyphs = 2
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 64
    Width = 527
    Height = 457
    Align = alClient
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 0
      Top = 137
      Width = 527
      Height = 320
      Align = alClient
      DataSource = dsDcmx
      FixedColor = clSkyBlue
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
      OnDrawColumnCell = DBGrid1DrawColumnCell
      Columns = <
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_CDBH'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = #32534#21495
          Width = 40
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_CDMC'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = #33756#21517
          Visible = True
        end
        item
          Color = clMoneyGreen
          Expanded = False
          FieldName = 'D_DJ'
          Title.Alignment = taCenter
          Title.Caption = #21333#20215
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_XFSL'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = #28040#36153#25968#37327
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_THSL'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = #36864#36824#25968#37327
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_XJJE'
          Title.Alignment = taCenter
          Title.Caption = #23567#35745
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_XMMC'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = #31867#21035
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_DEL'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = #21024#38500
          Visible = True
        end>
    end
    object Panel4: TPanel
      Left = 0
      Top = 0
      Width = 527
      Height = 45
      Align = alTop
      AutoSize = True
      BevelOuter = bvNone
      BorderWidth = 5
      Color = clMoneyGreen
      TabOrder = 1
      object lblCtbh: TLabel
        Left = 8
        Top = 5
        Width = 60
        Height = 12
        Caption = #39184#21381#21488#21495#65306
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object lblKrxm: TLabel
        Left = 8
        Top = 28
        Width = 60
        Height = 12
        Caption = #23458#20154#22995#21517#65306
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object lblKrsl: TLabel
        Left = 256
        Top = 5
        Width = 60
        Height = 12
        Caption = #23458#20154#25968#37327#65306
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object lblYcsj: TLabel
        Left = 376
        Top = 5
        Width = 60
        Height = 12
        Caption = #29992#39184#26102#38388#65306
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object lblCzyxm: TLabel
        Left = 376
        Top = 28
        Width = 60
        Height = 12
        Caption = #25805' '#20316' '#21592#65306
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
    end
    object DBGrid2: TDBGrid
      Left = 0
      Top = 45
      Width = 527
      Height = 92
      Align = alTop
      Color = clMoneyGreen
      DataSource = dsCtdc
      FixedColor = clSkyBlue
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'System'
      Font.Style = [fsBold]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 2
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'System'
      TitleFont.Style = [fsBold]
      Columns = <
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_CTBH'
          Title.Alignment = taCenter
          Title.Caption = #32534#21495
          Width = 40
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_CTMC'
          Title.Alignment = taCenter
          Title.Caption = #39184#21381#21517#31216
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_KRSL'
          Title.Alignment = taCenter
          Title.Caption = #23458#20154#25968#37327
          Width = 70
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_KRXM'
          Title.Alignment = taCenter
          Title.Caption = #23458#20154#22995#21517
          Width = 120
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_XFSJ'
          Title.Alignment = taCenter
          Title.Caption = #29992#39184#26102#38388
          Width = 70
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_CZYXM'
          Title.Alignment = taCenter
          Title.Caption = #25805#20316#21592
          Visible = True
        end>
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 521
    Width = 527
    Height = 22
    Align = alBottom
    AutoSize = True
    BevelOuter = bvNone
    BorderWidth = 5
    ParentColor = True
    TabOrder = 2
    object lblHjje: TLabel
      Left = 8
      Top = 5
      Width = 60
      Height = 12
      Caption = #21512#35745#37329#39069#65306
      Font.Charset = GB2312_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
  end
  object dsDcmx: TDataSource
    DataSet = tblDcmx
    Left = 64
    Top = 184
  end
  object tblDcmx: TTable
    AfterPost = tblDcmxAfterPost
    OnCalcFields = tblDcmxCalcFields
    OnNewRecord = tblDcmxNewRecord
    DatabaseName = 'LfHotelUser'
    FieldDefs = <
      item
        Name = 'D_HH'
        Attributes = [faRequired]
        DataType = ftString
        Size = 12
      end
      item
        Name = 'D_DCBH'
        Attributes = [faRequired]
        DataType = ftString
        Size = 12
      end
      item
        Name = 'D_CTBH'
        Attributes = [faRequired]
        DataType = ftString
        Size = 5
      end
      item
        Name = 'D_CDBH'
        Attributes = [faRequired]
        DataType = ftString
        Size = 5
      end
      item
        Name = 'D_XMBH'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'D_CDMC'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'D_XFSL'
        DataType = ftFloat
      end
      item
        Name = 'D_THSL'
        DataType = ftFloat
      end
      item
        Name = 'D_DJ'
        DataType = ftFloat
      end
      item
        Name = 'D_XFRQ'
        DataType = ftDateTime
      end
      item
        Name = 'D_DEL'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'D_BZ'
        DataType = ftString
        Size = 30
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY84'
        Fields = 'D_HH'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'D_DCMX'
        Fields = 'D_HH'
      end>
    IndexFieldNames = 'D_DCBH;D_CTBH;D_HH'
    MasterFields = 'D_DCBH;D_CTBH'
    MasterSource = dsCtdc
    StoreDefs = True
    TableName = 'DCMX'
    Left = 32
    Top = 184
    object tblDcmxD_HH: TStringField
      FieldName = 'D_HH'
      Required = True
      Size = 12
    end
    object tblDcmxD_DCBH: TStringField
      FieldName = 'D_DCBH'
      Required = True
      Size = 12
    end
    object tblDcmxD_CTBH: TStringField
      FieldName = 'D_CTBH'
      Required = True
      Size = 5
    end
    object tblDcmxD_CDBH: TStringField
      FieldName = 'D_CDBH'
      Required = True
      Size = 5
    end
    object tblDcmxD_XMBH: TStringField
      FieldName = 'D_XMBH'
      Size = 5
    end
    object tblDcmxD_CDMC: TStringField
      FieldName = 'D_CDMC'
    end
    object tblDcmxD_XFSL: TFloatField
      FieldName = 'D_XFSL'
      DisplayFormat = '0.00'
    end
    object tblDcmxD_THSL: TFloatField
      FieldName = 'D_THSL'
      DisplayFormat = '0.00'
    end
    object tblDcmxD_DJ: TFloatField
      FieldName = 'D_DJ'
      DisplayFormat = '#.##'
    end
    object tblDcmxD_XFRQ: TDateTimeField
      FieldName = 'D_XFRQ'
    end
    object tblDcmxD_DEL: TStringField
      FieldName = 'D_DEL'
      FixedChar = True
      Size = 1
    end
    object tblDcmxD_BZ: TStringField
      FieldName = 'D_BZ'
      Size = 30
    end
    object tblDcmxD_XMMC: TStringField
      FieldKind = fkLookup
      FieldName = 'D_XMMC'
      LookupDataSet = CtData.tblCtxm
      LookupKeyFields = 'D_XMBH'
      LookupResultField = 'D_XMMC'
      KeyFields = 'D_XMBH'
      Lookup = True
    end
    object tblDcmxD_XJJE: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'D_XJJE'
      DisplayFormat = '#.##'
      Currency = False
      Calculated = True
    end
  end
  object tblCtdc: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'CTDC'
    Left = 96
    Top = 184
    object tblCtdcD_CTMC: TStringField
      FieldKind = fkLookup
      FieldName = 'D_CTMC'
      LookupDataSet = CtData.tblCtdm
      LookupKeyFields = 'D_CTBH'
      LookupResultField = 'D_CTMC'
      KeyFields = 'D_CTBH'
      Lookup = True
    end
    object tblCtdcD_DCBH: TStringField
      FieldName = 'D_DCBH'
      Required = True
      Size = 12
    end
    object tblCtdcD_CTBH: TStringField
      FieldName = 'D_CTBH'
      Required = True
      Size = 5
    end
    object tblCtdcD_XMBH: TStringField
      FieldName = 'D_XMBH'
      Required = True
      Size = 5
    end
    object tblCtdcD_DCLB: TStringField
      FieldName = 'D_DCLB'
      FixedChar = True
      Size = 1
    end
    object tblCtdcD_XFRQ: TDateTimeField
      FieldName = 'D_XFRQ'
    end
    object tblCtdcD_XFSJ: TDateTimeField
      FieldName = 'D_XFSJ'
      DisplayFormat = 'hh:mm:ss'
    end
    object tblCtdcD_SJDM: TStringField
      FieldName = 'D_SJDM'
      FixedChar = True
      Size = 4
    end
    object tblCtdcD_KRSL: TIntegerField
      FieldName = 'D_KRSL'
    end
    object tblCtdcD_YCBZ: TStringField
      FieldName = 'D_YCBZ'
      Size = 30
    end
    object tblCtdcD_KRXM: TStringField
      FieldName = 'D_KRXM'
      Size = 30
    end
    object tblCtdcD_JSBZ: TStringField
      FieldName = 'D_JSBZ'
      FixedChar = True
      Size = 1
    end
    object tblCtdcD_JZFS: TStringField
      FieldName = 'D_JZFS'
      Size = 10
    end
    object tblCtdcD_KHBH: TStringField
      FieldName = 'D_KHBH'
      Size = 5
    end
    object tblCtdcD_XYKBH: TStringField
      FieldName = 'D_XYKBH'
      Size = 5
    end
    object tblCtdcD_XFJE: TFloatField
      FieldName = 'D_XFJE'
      DisplayFormat = '#.##'
    end
    object tblCtdcD_YHJE: TFloatField
      FieldName = 'D_YHJE'
      DisplayFormat = '#.##'
    end
    object tblCtdcD_CZYXM: TStringField
      FieldName = 'D_CZYXM'
      Size = 8
    end
    object tblCtdcD_YDBH: TStringField
      FieldName = 'D_YDBH'
      Size = 12
    end
    object tblCtdcD_BZ: TStringField
      FieldName = 'D_BZ'
      Size = 30
    end
  end
  object dsCtdc: TDataSource
    DataSet = tblCtdc
    OnDataChange = dsCtdcDataChange
    Left = 128
    Top = 184
  end
  object DosMove1: TDosMove
    Active = True
    Options = [moUpDn]
    Left = 160
    Top = 184
  end
end
