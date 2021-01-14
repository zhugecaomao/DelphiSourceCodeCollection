object FcfJzForm: TFcfJzForm
  Left = 171
  Top = 27
  Width = 545
  Height = 500
  Caption = #32467#24080
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 537
    Height = 155
    Align = alTop
    AutoSize = True
    BevelOuter = bvNone
    BorderWidth = 5
    ParentColor = True
    TabOrder = 0
    object Bevel1: TBevel
      Left = 8
      Top = 29
      Width = 521
      Height = 121
      Shape = bsFrame
    end
    object lblTitle: TLabel
      Left = 208
      Top = 5
      Width = 116
      Height = 21
      Caption = #38750#39184#36153#32467#24080
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = #26999#20307'_GB2312'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 272
      Top = 85
      Width = 69
      Height = 14
      Caption = #20248#24800#37329#39069':'
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = #24188#22278
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 272
      Top = 45
      Width = 76
      Height = 14
      Caption = #28040#36153#37329#39069#65306
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = #24188#22278
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 272
      Top = 125
      Width = 76
      Height = 14
      Caption = #23454#32467#37329#39069#65306
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = #24188#22278
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblXfje: TLabel
      Left = 424
      Top = 45
      Width = 49
      Height = 14
      Caption = 'lblXfje'
      Font.Charset = GB2312_CHARSET
      Font.Color = clGreen
      Font.Height = -14
      Font.Name = #24188#22278
      Font.Style = []
      ParentFont = False
    end
    object lblSjje: TLabel
      Left = 424
      Top = 125
      Width = 49
      Height = 14
      Caption = 'lblSjje'
      Font.Charset = GB2312_CHARSET
      Font.Color = clGreen
      Font.Height = -14
      Font.Name = #24188#22278
      Font.Style = []
      ParentFont = False
    end
    object lblYhje: TLabel
      Left = 424
      Top = 85
      Width = 49
      Height = 14
      Caption = 'lblYhje'
      Font.Charset = GB2312_CHARSET
      Font.Color = clGreen
      Font.Height = -14
      Font.Name = #24188#22278
      Font.Style = []
      ParentFont = False
    end
    object radJzfs: TRadioGroup
      Left = 24
      Top = 37
      Width = 185
      Height = 81
      Caption = ' '#32467' '#24080' '#26041' '#24335' '
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #20154#27665#24065
        #20449#29992#21345
        #25903#31080
        #35760#24080
        #25346#25955#23458
        #25346#22242#38431
        #23486#39302#25307#24453
        #36149#23486#21345)
      TabOrder = 0
      OnClick = radJzfsClick
    end
    object cmbJz: TComboBox
      Left = 24
      Top = 125
      Width = 185
      Height = 20
      ItemHeight = 12
      TabOrder = 1
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 438
    Width = 537
    Height = 35
    Align = alBottom
    AutoSize = True
    BevelOuter = bvNone
    BorderWidth = 5
    ParentColor = True
    TabOrder = 1
    object btnOk: TBitBtn
      Left = 376
      Top = 5
      Width = 75
      Height = 25
      Caption = #30830#23450
      TabOrder = 0
      OnClick = btnOkClick
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
    object btnCanc: TBitBtn
      Left = 456
      Top = 5
      Width = 75
      Height = 25
      Cancel = True
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object btnPrint: TBitBtn
      Left = 296
      Top = 5
      Width = 75
      Height = 25
      Caption = #24080#21333#25171#21360
      TabOrder = 2
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
  object Panel2: TPanel
    Left = 0
    Top = 155
    Width = 537
    Height = 283
    Align = alClient
    AutoSize = True
    BevelOuter = bvNone
    BorderWidth = 5
    ParentColor = True
    TabOrder = 2
    object DBGrid1: TDBGrid
      Left = 5
      Top = 5
      Width = 527
      Height = 273
      Align = alClient
      DataSource = dsCtjz
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
      Columns = <
        item
          Alignment = taRightJustify
          Color = clMoneyGreen
          Expanded = False
          FieldName = 'D_XMMC'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = #28040#36153#39033#30446
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_XFJE'
          Title.Alignment = taCenter
          Title.Caption = #28040#36153#37329#39069
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_YHJE'
          Title.Alignment = taCenter
          Title.Caption = #20248#24800#37329#39069
          Width = 150
          Visible = True
        end>
    end
  end
  object tblCtjz: TTable
    BeforeInsert = tblCtjzBeforeInsert
    AfterPost = tblCtjzAfterPost
    BeforeDelete = tblCtjzBeforeDelete
    DatabaseName = 'LfHotelUser'
    TableName = 'CTJZ'
    Left = 48
    Top = 192
    object tblCtjzD_XMMC: TStringField
      FieldKind = fkLookup
      FieldName = 'D_XMMC'
      LookupDataSet = CtData.tblCtxm
      LookupKeyFields = 'D_XMBH'
      LookupResultField = 'D_XMMC'
      KeyFields = 'D_XMBH'
      Lookup = True
    end
    object tblCtjzD_XMBH: TStringField
      FieldName = 'D_XMBH'
      Size = 5
    end
    object tblCtjzD_XFJE: TFloatField
      FieldName = 'D_XFJE'
      DisplayFormat = '#.##'
    end
    object tblCtjzD_YHJE: TFloatField
      FieldName = 'D_YHJE'
      DisplayFormat = '#.##'
    end
    object tblCtjzD_BZ: TStringField
      FieldName = 'D_BZ'
      FixedChar = True
      Size = 1
    end
  end
  object dsCtjz: TDataSource
    DataSet = tblCtjz
    Left = 88
    Top = 192
  end
  object tblCtxm: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'CTXM'
    Left = 128
    Top = 192
  end
  object DosMove1: TDosMove
    Active = True
    Options = [moEnter]
    Left = 176
    Top = 192
  end
  object tblKrxx: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'KRXX'
    Left = 216
    Top = 192
  end
  object tblKrzd: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'KRZD'
    Left = 48
    Top = 240
  end
  object tblKrjz: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'KRJZ'
    Left = 88
    Top = 240
  end
  object tblCtdc: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'CTDC'
    Left = 128
    Top = 240
  end
  object tblYsk: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'YSK'
    Left = 176
    Top = 240
  end
end
