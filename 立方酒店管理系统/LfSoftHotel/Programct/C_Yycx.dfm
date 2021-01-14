object YycxForm: TYycxForm
  Left = 166
  Top = 21
  Width = 800
  Height = 550
  Caption = #26597#35810#32479#35745
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
    Width = 792
    Height = 62
    Align = alTop
    AutoSize = True
    BevelOuter = bvNone
    BorderWidth = 5
    ParentColor = True
    TabOrder = 0
    DesignSize = (
      792
      62)
    object lblTitle: TLabel
      Left = 330
      Top = 5
      Width = 93
      Height = 21
      Anchors = [akTop]
      Caption = #33829#19994#26597#35810
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = #26999#20307'_GB2312'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 8
      Top = 45
      Width = 60
      Height = 12
      Caption = #26597#35810#26085#26399#65306
    end
    object DateTimePicker1: TDateTimePicker
      Left = 72
      Top = 37
      Width = 121
      Height = 20
      CalAlignment = dtaLeft
      Date = 37439.4570512732
      Time = 37439.4570512732
      DateFormat = dfLong
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 0
      OnChange = DateTimePicker1Change
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 62
    Width = 792
    Height = 426
    Align = alClient
    AutoSize = True
    BevelOuter = bvNone
    BorderWidth = 5
    ParentColor = True
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 5
      Top = 5
      Width = 782
      Height = 225
      Align = alTop
      Color = clMoneyGreen
      DataSource = dsMaster
      FixedColor = clSkyBlue
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'System'
      Font.Style = [fsBold]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'System'
      TitleFont.Style = [fsBold]
      Columns = <
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_SJDM'
          Title.Alignment = taCenter
          Title.Caption = #28040#36153#26102#38388
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_CTMC'
          Title.Alignment = taCenter
          Title.Caption = #28040#36153#37096#20301
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_DCLB'
          Title.Alignment = taCenter
          Title.Caption = #31867#21035
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_XFJE'
          Title.Alignment = taCenter
          Title.Caption = #28040#36153#37329#39069
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_YHJE'
          Title.Alignment = taCenter
          Title.Caption = #20248#24800#37329#39069
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_KRXM'
          Title.Alignment = taCenter
          Title.Caption = #23458#20154#22995#21517
          Width = 100
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_YCBZ'
          Title.Alignment = taCenter
          Title.Caption = #29992#39184#26631#20934
          Width = 100
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_JZFS'
          Title.Alignment = taCenter
          Title.Caption = #32467#24080#26041#24335
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_CZYXM'
          Title.Caption = #25805#20316#21592
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_BZ'
          Title.Alignment = taCenter
          Title.Caption = #22791#27880
          Visible = True
        end>
    end
    object DBGrid2: TDBGrid
      Left = 5
      Top = 230
      Width = 782
      Height = 191
      Align = alClient
      Color = clMoneyGreen
      DataSource = dsDetail
      FixedColor = clSkyBlue
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'System'
      Font.Style = [fsBold]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 1
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'System'
      TitleFont.Style = [fsBold]
      OnDrawColumnCell = DBGrid2DrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'D_CDBH'
          Title.Caption = #33756#21333#32534#21495
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_CDMC'
          Title.Caption = #33756#21517
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_DJ'
          Title.Caption = #21333#20215
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_XFSL'
          Title.Caption = #28040#36153#25968#37327
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_THSL'
          Title.Caption = #36864#36824#25968#37327
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_DEL'
          Title.Caption = #21024#38500#26631#24535
          Visible = True
        end>
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 488
    Width = 792
    Height = 35
    Align = alBottom
    AutoSize = True
    BevelOuter = bvNone
    BorderWidth = 5
    ParentColor = True
    TabOrder = 2
    DesignSize = (
      792
      35)
    object btnClose: TBitBtn
      Left = 704
      Top = 5
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
    object btnPrint: TBitBtn
      Left = 624
      Top = 5
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #25171#21360'(&P)'
      TabOrder = 1
      OnClick = btnPrintClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888F8800000000000888808888888880808800000000000008080888888BBB88
        0008088888877788080800000000000008800888888888808080800000000008
        0800880FFFFFFFF080808880F00000F000088880FFFFFFFF088888880F00000F
        088888880FFFFFFFF08888888000000000888888888888888888}
    end
  end
  object qryMaster: TQuery
    DatabaseName = 'LfHotelUser'
    SQL.Strings = (
      
        'select * from CTDC where (D_XFRQ=:XFRQ)and(D_CTBH<>"0")and(D_XMB' +
        'H="0")')
    Left = 320
    Top = 16
    ParamData = <
      item
        DataType = ftDate
        Name = 'XFRQ'
        ParamType = ptInput
      end>
    object qryMasterD_DCBH: TStringField
      FieldName = 'D_DCBH'
      Origin = 'LFHOTELUSER."CTDC.DB".D_DCBH'
      Size = 12
    end
    object qryMasterD_XMBH: TStringField
      FieldName = 'D_XMBH'
      Origin = 'LFHOTELUSER."CTDC.DB".D_XMBH'
      Size = 5
    end
    object qryMasterD_DCLB: TStringField
      FieldName = 'D_DCLB'
      Origin = 'LFHOTELUSER."CTDC.DB".D_DCLB'
      OnGetText = qryMasterD_DCLBGetText
      Size = 1
    end
    object qryMasterD_CTBH: TStringField
      FieldName = 'D_CTBH'
      Origin = 'LFHOTELUSER."CTDC.DB".D_CTBH'
      Size = 5
    end
    object qryMasterD_XFRQ: TDateField
      FieldName = 'D_XFRQ'
      Origin = 'LFHOTELUSER."CTDC.DB".D_XFRQ'
    end
    object qryMasterD_XFSJ: TTimeField
      FieldName = 'D_XFSJ'
      Origin = 'LFHOTELUSER."CTDC.DB".D_XFSJ'
    end
    object qryMasterD_SJDM: TStringField
      FieldName = 'D_SJDM'
      Origin = 'LFHOTELUSER."CTDC.DB".D_SJDM'
      Size = 4
    end
    object qryMasterD_KRSL: TIntegerField
      FieldName = 'D_KRSL'
      Origin = 'LFHOTELUSER."CTDC.DB".D_KRSL'
    end
    object qryMasterD_YCBZ: TStringField
      FieldName = 'D_YCBZ'
      Origin = 'LFHOTELUSER."CTDC.DB".D_YCBZ'
    end
    object qryMasterD_KRXM: TStringField
      FieldName = 'D_KRXM'
      Origin = 'LFHOTELUSER."CTDC.DB".D_KRXM'
      Size = 30
    end
    object qryMasterD_JSBZ: TStringField
      FieldName = 'D_JSBZ'
      Origin = 'LFHOTELUSER."CTDC.DB".D_JSBZ'
      Size = 1
    end
    object qryMasterD_JZFS: TStringField
      FieldName = 'D_JZFS'
      Origin = 'LFHOTELUSER."CTDC.DB".D_JZFS'
      Size = 10
    end
    object qryMasterD_KHBH: TStringField
      FieldName = 'D_KHBH'
      Origin = 'LFHOTELUSER."CTDC.DB".D_KHBH'
      Size = 5
    end
    object qryMasterD_XYKBH: TStringField
      FieldName = 'D_XYKBH'
      Origin = 'LFHOTELUSER."CTDC.DB".D_XYKBH'
      Size = 5
    end
    object qryMasterD_XFJE: TCurrencyField
      FieldName = 'D_XFJE'
      Origin = 'LFHOTELUSER."CTDC.DB".D_XFJE'
      DisplayFormat = '#.##'
      Currency = False
    end
    object qryMasterD_YHJE: TCurrencyField
      FieldName = 'D_YHJE'
      Origin = 'LFHOTELUSER."CTDC.DB".D_YHJE'
      DisplayFormat = '#.##'
      Currency = False
    end
    object qryMasterD_CZYXM: TStringField
      FieldName = 'D_CZYXM'
      Origin = 'LFHOTELUSER."CTDC.DB".D_CZYXM'
      Size = 8
    end
    object qryMasterD_YDBH: TStringField
      FieldName = 'D_YDBH'
      Origin = 'LFHOTELUSER."CTDC.DB".D_YDBH'
      Size = 12
    end
    object qryMasterD_BZ: TStringField
      FieldName = 'D_BZ'
      Origin = 'LFHOTELUSER."CTDC.DB".D_BZ'
    end
    object qryMasterD_XMMC: TStringField
      FieldKind = fkLookup
      FieldName = 'D_XMMC'
      LookupDataSet = CtData.tblCtxm
      LookupKeyFields = 'D_XMBH'
      LookupResultField = 'D_XMMC'
      KeyFields = 'D_XMBH'
      Lookup = True
    end
    object qryMasterD_CTMC: TStringField
      FieldKind = fkLookup
      FieldName = 'D_CTMC'
      LookupDataSet = CtData.tblCtdm
      LookupKeyFields = 'D_CTBH'
      LookupResultField = 'D_CTMC'
      KeyFields = 'D_CTBH'
      Lookup = True
    end
  end
  object qryDetail: TQuery
    DatabaseName = 'LfHotelUser'
    DataSource = dsMaster
    SQL.Strings = (
      'select * from DCMX where (D_DCBH=:D_DCBH)and(D_CTBH=:D_CTBH)')
    Left = 360
    Top = 16
    ParamData = <
      item
        DataType = ftString
        Name = 'D_DCBH'
        ParamType = ptUnknown
        Size = 13
      end
      item
        DataType = ftString
        Name = 'D_CTBH'
        ParamType = ptUnknown
        Size = 6
      end>
    object qryDetailD_DCBH: TStringField
      FieldName = 'D_DCBH'
      Origin = 'LFHOTELUSER.DCMX.D_DCBH'
      Size = 12
    end
    object qryDetailD_CTBH: TStringField
      FieldName = 'D_CTBH'
      Origin = 'LFHOTELUSER.DCMX.D_CTBH'
      Size = 5
    end
    object qryDetailD_CDBH: TStringField
      FieldName = 'D_CDBH'
      Origin = 'LFHOTELUSER.DCMX.D_CDBH'
      Size = 5
    end
    object qryDetailD_XMBH: TStringField
      FieldName = 'D_XMBH'
      Origin = 'LFHOTELUSER.DCMX.D_XMBH'
      Size = 5
    end
    object qryDetailD_CDMC: TStringField
      FieldName = 'D_CDMC'
      Origin = 'LFHOTELUSER.DCMX.D_CDMC'
    end
    object qryDetailD_XFSL: TFloatField
      FieldName = 'D_XFSL'
      Origin = 'LFHOTELUSER.DCMX.D_XFSL'
      DisplayFormat = '#.##'
    end
    object qryDetailD_THSL: TFloatField
      FieldName = 'D_THSL'
      Origin = 'LFHOTELUSER.DCMX.D_THSL'
      DisplayFormat = '#.##'
    end
    object qryDetailD_DJ: TFloatField
      FieldName = 'D_DJ'
      Origin = 'LFHOTELUSER.DCMX.D_DJ'
      DisplayFormat = '#.##'
    end
    object qryDetailD_XFRQ: TDateTimeField
      FieldName = 'D_XFRQ'
      Origin = 'LFHOTELUSER.DCMX.D_XFRQ'
    end
    object qryDetailD_DEL: TStringField
      FieldName = 'D_DEL'
      Origin = 'LFHOTELUSER.DCMX.D_DEL'
      FixedChar = True
      Size = 1
    end
    object qryDetailD_BZ: TStringField
      FieldName = 'D_BZ'
      Origin = 'LFHOTELUSER.DCMX.D_BZ'
      Size = 30
    end
  end
  object dsMaster: TDataSource
    DataSet = qryMaster
    Left = 400
    Top = 16
  end
  object dsDetail: TDataSource
    DataSet = qryDetail
    Left = 440
    Top = 16
  end
end
