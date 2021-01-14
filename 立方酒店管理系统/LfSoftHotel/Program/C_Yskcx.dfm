object YskcxForm: TYskcxForm
  Left = 78
  Top = 32
  Width = 720
  Height = 500
  Caption = #24212#25910#27454#26597#35810
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'System'
  Font.Style = [fsBold]
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 712
    Height = 115
    Align = alTop
    AutoSize = True
    BevelOuter = bvNone
    BorderWidth = 5
    TabOrder = 0
    object Label1: TLabel
      Left = 280
      Top = 5
      Width = 156
      Height = 29
      Caption = #24212#25910#27454#26597#35810
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = #26999#20307'_GB2312'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 8
      Top = 61
      Width = 64
      Height = 16
      Caption = #23458#25143#32534#21495
    end
    object SpeedButton1: TSpeedButton
      Left = 136
      Top = 54
      Width = 23
      Height = 22
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
      OnClick = SpeedButton1Click
    end
    object Label3: TLabel
      Left = 168
      Top = 61
      Width = 64
      Height = 16
      Caption = #28040#36153#39033#30446
    end
    object Label4: TLabel
      Left = 336
      Top = 57
      Width = 84
      Height = 16
      Caption = #28040#36153#26085#26399' '#20174
    end
    object Label5: TLabel
      Left = 520
      Top = 57
      Width = 16
      Height = 16
      Caption = #21040
    end
    object lblHjje: TLabel
      Left = 8
      Top = 91
      Width = 214
      Height = 19
      Caption = #21512#35745#37329#39069'('#19981#21547#39044#20132#27454'):'
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = #40657#20307
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblJe: TLabel
      Left = 232
      Top = 94
      Width = 31
      Height = 16
      Caption = 'lblJe'
    end
    object edtKhbh: TEdit
      Left = 72
      Top = 53
      Width = 65
      Height = 24
      TabOrder = 0
      OnExit = edtKhbhExit
    end
    object cmbXfxm: TComboBox
      Left = 232
      Top = 53
      Width = 97
      Height = 24
      ItemHeight = 16
      TabOrder = 1
      OnExit = cmbXfxmExit
    end
    object edtBd: TMaskEdit
      Left = 424
      Top = 53
      Width = 87
      Height = 24
      EditMask = '!0000/00/99;1; '
      MaxLength = 10
      TabOrder = 2
      Text = '    -  -  '
    end
    object edtEd: TMaskEdit
      Left = 540
      Top = 53
      Width = 87
      Height = 24
      EditMask = '!0000/00/99;1; '
      MaxLength = 10
      TabOrder = 3
      Text = '    -  -  '
    end
    object btnQuery: TBitBtn
      Left = 632
      Top = 52
      Width = 100
      Height = 25
      Caption = #26597#35810'(&Q)'
      TabOrder = 4
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
    object BitBtn1: TBitBtn
      Left = 632
      Top = 24
      Width = 100
      Height = 25
      Caption = #37325#26597'(&E)'
      TabOrder = 5
      OnClick = BitBtn1Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
        3333333777777777F3333330F777777033333337F3F3F3F7F3333330F0808070
        33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
        33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
        333333F7F7F7F7F7F3F33030F080707030333737F7F7F7F7F7333300F0808070
        03333377F7F7F7F773333330F080707033333337F7F7F7F7F333333070707070
        33333337F7F7F7F7FF3333000000000003333377777777777F33330F88877777
        0333337FFFFFFFFF7F3333000000000003333377777777777333333330777033
        3333333337FFF7F3333333333000003333333333377777333333}
      NumGlyphs = 2
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 115
    Width = 712
    Height = 323
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 5
    TabOrder = 1
    object Splitter1: TSplitter
      Left = 5
      Top = 259
      Width = 702
      Height = 8
      Cursor = crVSplit
      Align = alTop
    end
    object DBGridEh1: TDBGridEh
      Left = 5
      Top = 5
      Width = 702
      Height = 254
      Align = alTop
      Color = clMoneyGreen
      DataSource = dsWork
      FixedColor = clSkyBlue
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'System'
      Font.Style = [fsBold]
      FooterColor = 4227327
      FooterFont.Charset = GB2312_CHARSET
      FooterFont.Color = clNavy
      FooterFont.Height = -11
      FooterFont.Name = 'System'
      FooterFont.Style = [fsBold]
      FooterRowCount = 1
      ParentFont = False
      SumList.Active = True
      TabOrder = 0
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'System'
      TitleFont.Style = [fsBold]
      UseMultiTitle = True
      GridLineColor = clGreen
      Columns = <
        item
          EditButtons = <>
          FieldName = 'D_KHBH'
          Footers = <
            item
              Value = #21512#35745
              ValueType = fvtStaticText
            end>
          Title.Caption = #32534#21495
          Width = 40
        end
        item
          EditButtons = <>
          FieldName = 'D_KHMC'
          Footers = <>
          Title.Caption = #21517#31216
          Width = 150
        end
        item
          EditButtons = <>
          FieldName = 'D_XMMC'
          Footers = <>
          Title.Caption = #28040#36153#39033#30446
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'D_XFJE'
          Footers = <
            item
              FieldName = 'D_XFJE'
              ValueType = fvtSum
            end>
          Title.Caption = #28040#36153#37329#39069
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'D_XFRQ'
          Footers = <>
          Title.Caption = #28040#36153#26085#26399
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'D_XFSJ'
          Footers = <>
          Title.Caption = #28040#36153#26102#38388
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'D_CZYXM'
          Footers = <>
          Title.Caption = #25805#20316#21592
          Width = 60
        end
        item
          EditButtons = <>
          FieldName = 'D_BZ'
          Footers = <>
          Title.Caption = #22791#27880
          Width = 80
        end>
    end
    object DBGridEh2: TDBGridEh
      Left = 5
      Top = 267
      Width = 702
      Height = 51
      Align = alClient
      AutoFitColWidths = True
      Color = clMoneyGreen
      DataSource = dsZz
      FixedColor = clSkyBlue
      FooterColor = 4227327
      FooterFont.Charset = GB2312_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'System'
      FooterFont.Style = [fsBold]
      FooterRowCount = 1
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghEnterAsTab]
      SumList.Active = True
      TabOrder = 1
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'System'
      TitleFont.Style = [fsBold]
      UseMultiTitle = True
      GridLineColor = clGreen
      FixedLineColor = clBtnFace
      Columns = <
        item
          EditButtons = <>
          FieldName = 'D_KHBH'
          Footers = <
            item
              Value = #21512#35745
              ValueType = fvtStaticText
            end>
          Title.Caption = #32534#21495
          Width = 40
        end
        item
          EditButtons = <>
          FieldName = 'D_KHMC'
          Footers = <>
          Title.Caption = #21517#31216
          Width = 160
        end
        item
          EditButtons = <>
          FieldName = 'D_XMMC'
          Footers = <>
          Title.Caption = #28040#36153#39033#30446
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'SUM'
          Footers = <
            item
              FieldName = 'SUM'
              ValueType = fvtSum
            end>
          Title.Caption = #28040#36153#37329#39069
          Width = 100
        end>
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 438
    Width = 712
    Height = 35
    Align = alBottom
    AutoSize = True
    BevelOuter = bvNone
    BorderWidth = 5
    TabOrder = 2
    DesignSize = (
      712
      35)
    object btnClose: TBitBtn
      Left = 216
      Top = 5
      Width = 75
      Height = 25
      Anchors = [akTop]
      Cancel = True
      Caption = #20851#38381'(&O)'
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
    object btnPrint: TBitBtn
      Left = 5
      Top = 5
      Width = 100
      Height = 25
      Caption = #25171#21360#26126#32454'(&P)'
      TabOrder = 1
      OnClick = OnPrintMx
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
    object btnPrintzz: TBitBtn
      Left = 111
      Top = 5
      Width = 100
      Height = 25
      Caption = #25171#21360#24635#24080'(&Z)'
      TabOrder = 2
      OnClick = OnPrintZz
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
  end
  object DosMove1: TDosMove
    Active = True
    Left = 384
    Top = 16
  end
  object qryWork: TQuery
    DatabaseName = 'LfHotelUser'
    SQL.Strings = (
      'select * from YSK')
    Left = 432
    Top = 24
    object qryWorkD_KHBH: TStringField
      FieldName = 'D_KHBH'
      Origin = 'LFHOTELUSER.YSK.D_KHBH'
      Size = 5
    end
    object qryWorkD_ZDBH: TStringField
      FieldName = 'D_ZDBH'
      Origin = 'LFHOTELUSER.YSK.D_ZDBH'
      Size = 12
    end
    object qryWorkD_HH: TIntegerField
      FieldName = 'D_HH'
      Origin = 'LFHOTELUSER.YSK.D_HH'
    end
    object qryWorkD_XMBH: TStringField
      FieldName = 'D_XMBH'
      Origin = 'LFHOTELUSER.YSK.D_XMBH'
      Size = 5
    end
    object qryWorkD_XFDJ: TFloatField
      FieldName = 'D_XFDJ'
      Origin = 'LFHOTELUSER.YSK.D_XFDJ'
    end
    object qryWorkD_XFSL: TFloatField
      FieldName = 'D_XFSL'
      Origin = 'LFHOTELUSER.YSK.D_XFSL'
    end
    object qryWorkD_XFJE: TFloatField
      FieldName = 'D_XFJE'
      Origin = 'LFHOTELUSER.YSK.D_XFJE'
      DisplayFormat = '#.##'
    end
    object qryWorkD_XFRQ: TDateTimeField
      FieldName = 'D_XFRQ'
      Origin = 'LFHOTELUSER.YSK.D_XFRQ'
      DisplayFormat = 'yyyy-mm-dd'
    end
    object qryWorkD_XFSJ: TDateTimeField
      FieldName = 'D_XFSJ'
      Origin = 'LFHOTELUSER.YSK.D_XFSJ'
      DisplayFormat = 'hh:nn:ss'
    end
    object qryWorkD_CZYXM: TStringField
      FieldName = 'D_CZYXM'
      Origin = 'LFHOTELUSER.YSK.D_CZYXM'
      Size = 8
    end
    object qryWorkD_BZ: TStringField
      FieldName = 'D_BZ'
      Origin = 'LFHOTELUSER.YSK.D_BZ'
      Size = 30
    end
    object qryWorkD_KHMC: TStringField
      FieldKind = fkLookup
      FieldName = 'D_KHMC'
      LookupDataSet = HotelData.tblKHDA
      LookupKeyFields = 'D_KHBH'
      LookupResultField = 'D_KHMC'
      KeyFields = 'D_KHBH'
      Lookup = True
    end
    object qryWorkD_XMMC: TStringField
      FieldKind = fkLookup
      FieldName = 'D_XMMC'
      LookupDataSet = HotelData.tblXMDM
      LookupKeyFields = 'D_XMBH'
      LookupResultField = 'D_XMMC'
      KeyFields = 'D_XMBH'
      Lookup = True
    end
  end
  object dsWork: TDataSource
    DataSet = qryWork
    Left = 464
    Top = 24
  end
  object qryZz: TQuery
    DatabaseName = 'LfHotelUser'
    SQL.Strings = (
      'select D_KHBH,D_XMBH,sum(D_XFJE) from YSK group by D_KHBH,D_XMBH')
    Left = 112
    Top = 24
    object qryZzD_KHBH: TStringField
      FieldName = 'D_KHBH'
      Origin = 'LFHOTELUSER.YSK.D_KHBH'
      Size = 5
    end
    object qryZzD_XMBH: TStringField
      FieldName = 'D_XMBH'
      Origin = 'LFHOTELUSER.YSK.D_XMBH'
      Size = 5
    end
    object qryZzSUM: TFloatField
      FieldName = 'SUM'
      Origin = 'LFHOTELUSER.YSK.D_XFJE'
      DisplayFormat = '#.##'
    end
    object qryZzD_KHMC: TStringField
      FieldKind = fkLookup
      FieldName = 'D_KHMC'
      LookupDataSet = HotelData.tblKHDA
      LookupKeyFields = 'D_KHBH'
      LookupResultField = 'D_KHMC'
      KeyFields = 'D_KHBH'
      Lookup = True
    end
    object qryZzD_XMMC: TStringField
      FieldKind = fkLookup
      FieldName = 'D_XMMC'
      LookupDataSet = HotelData.tblXMDM
      LookupKeyFields = 'D_XMBH'
      LookupResultField = 'D_XMMC'
      KeyFields = 'D_XMBH'
      Lookup = True
    end
  end
  object dsZz: TDataSource
    DataSet = qryZz
    Left = 160
    Top = 24
  end
end
