inherited FykJzForm: TFykJzForm
  Left = 181
  Top = 29
  Width = 510
  Height = 504
  Caption = #32467#24080
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Width = 502
    Height = 149
    Font.Name = 'System'
    Font.Style = [fsBold]
    ParentFont = False
    object Bevel2: TBevel [0]
      Left = 8
      Top = 112
      Width = 489
      Height = 32
      Shape = bsFrame
    end
    inherited lblTitile: TLabel
      Left = 182
      Width = 156
      Caption = #38750#23507#23458#32467#24080
    end
    inherited Image1: TImage
      Left = 148
    end
    object Label2: TLabel
      Left = 14
      Top = 48
      Width = 64
      Height = 16
      Caption = #32467#24080#26085#26399
    end
    object Label3: TLabel
      Left = 115
      Top = 48
      Width = 64
      Height = 16
      Caption = #32467#24080#26102#38388
    end
    object Label1: TLabel
      Left = 16
      Top = 121
      Width = 61
      Height = 14
      Caption = #28040#36153#37329#39069
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = #24188#22278
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblXfje: TLabel
      Left = 128
      Top = 121
      Width = 21
      Height = 14
      Alignment = taRightJustify
      Caption = '0'#20803
      Font.Charset = GB2312_CHARSET
      Font.Color = clGreen
      Font.Height = -14
      Font.Name = #24188#22278
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 184
      Top = 121
      Width = 61
      Height = 14
      Caption = #20248#24800#37329#39069
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = #24188#22278
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblYhje: TLabel
      Left = 288
      Top = 121
      Width = 21
      Height = 14
      Alignment = taRightJustify
      Caption = '0'#20803
      Font.Charset = GB2312_CHARSET
      Font.Color = clGreen
      Font.Height = -14
      Font.Name = #24188#22278
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 352
      Top = 121
      Width = 61
      Height = 14
      Caption = #32467#31639#37329#39069
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = #24188#22278
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblJsje: TLabel
      Left = 456
      Top = 121
      Width = 21
      Height = 14
      Alignment = taRightJustify
      Caption = '0'#20803
      Font.Charset = GB2312_CHARSET
      Font.Color = clGreen
      Font.Height = -14
      Font.Name = #24188#22278
      Font.Style = []
      ParentFont = False
    end
    object edtJzrq: TMaskEdit
      Left = 14
      Top = 64
      Width = 99
      Height = 24
      EditMask = '!0000/99/99;1; '
      MaxLength = 10
      TabOrder = 0
      Text = '    -  -  '
      OnExit = edtJzrqExit
    end
    object edtJzsj: TMaskEdit
      Left = 115
      Top = 64
      Width = 100
      Height = 24
      EditMask = '!90:00;1; '
      MaxLength = 5
      TabOrder = 1
      Text = '  :  '
      OnExit = edtJzsjExit
    end
    object radJzfs: TRadioGroup
      Left = 222
      Top = 48
      Width = 267
      Height = 59
      Caption = ' '#32467' '#24080' '#26041' '#24335' '
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        #20154#27665#24065
        #20449#29992#21345
        #25903#31080
        #35760#24080
        #36149#23486#21345)
      TabOrder = 2
      OnClick = radJzfsClick
    end
    object cmbJz: TComboBox
      Left = 14
      Top = 87
      Width = 201
      Height = 24
      ItemHeight = 16
      TabOrder = 3
      OnDblClick = cmbJzDblClick
    end
  end
  inherited Panel2: TPanel
    Top = 149
    Width = 502
    Height = 293
    inherited Bevel1: TBevel
      Width = 492
      Height = 283
    end
    object DBGrid1: TDBGrid
      Left = 5
      Top = 5
      Width = 492
      Height = 283
      Align = alClient
      Color = clMoneyGreen
      DataSource = dsKrjz
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
      OnColEnter = DBGrid1ColEnter
      OnKeyPress = DBGrid1KeyPress
      Columns = <
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_XFXM'
          Title.Alignment = taCenter
          Title.Caption = #28040#36153#39033#30446
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_XFJE'
          Title.Alignment = taCenter
          Title.Caption = #28040#36153#37329#39069
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_YHJE'
          Title.Alignment = taCenter
          Title.Caption = #20248#24800#37329#39069
          Width = 120
          Visible = True
        end>
    end
  end
  inherited Panel3: TPanel
    Top = 442
    Width = 502
    inherited btnOK: TBitBtn
      Left = 342
      Caption = #32467#24080'(&O)'
      OnClick = btnOKClick
    end
    inherited btnCanc: TBitBtn
      Left = 422
      OnClick = btnCancClick
    end
    object btnPrint: TBitBtn
      Left = 262
      Top = 5
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #25171#21360
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
  object tblKrjz: TTable
    CachedUpdates = True
    AfterPost = tblKrjzAfterPost
    OnNewRecord = tblKrjzNewRecord
    DatabaseName = 'LfHotelUser'
    TableName = 'KRJZ'
    Left = 16
    Top = 8
    object tblKrjzD_XFXM: TStringField
      FieldKind = fkLookup
      FieldName = 'D_XFXM'
      LookupDataSet = HotelData.tblXMDM
      LookupKeyFields = 'D_XMBH'
      LookupResultField = 'D_XMMC'
      KeyFields = 'D_XMBH'
      Lookup = True
    end
    object tblKrjzD_JZBH: TStringField
      FieldName = 'D_JZBH'
      Required = True
      Size = 12
    end
    object tblKrjzD_HH: TIntegerField
      FieldName = 'D_HH'
    end
    object tblKrjzD_XMBH: TStringField
      FieldName = 'D_XMBH'
      OnValidate = tblKrjzD_XMBHValidate
      Size = 5
    end
    object tblKrjzD_XFDJ: TFloatField
      FieldName = 'D_XFDJ'
    end
    object tblKrjzD_XFSL: TFloatField
      FieldName = 'D_XFSL'
    end
    object tblKrjzD_XFGG: TStringField
      FieldName = 'D_XFGG'
      Size = 5
    end
    object tblKrjzD_XFJE: TFloatField
      FieldName = 'D_XFJE'
      OnValidate = tblKrjzD_XFJEValidate
      currency = True
    end
    object tblKrjzD_YJJE: TFloatField
      FieldName = 'D_YJJE'
      currency = True
    end
    object tblKrjzD_YHJE: TFloatField
      FieldName = 'D_YHJE'
      OnValidate = tblKrjzD_YHJEValidate
      currency = True
    end
    object tblKrjzD_JZFS: TStringField
      FieldName = 'D_JZFS'
      Size = 10
    end
    object tblKrjzD_JZLX: TStringField
      FieldName = 'D_JZLX'
      FixedChar = True
      Size = 1
    end
    object tblKrjzD_KHBH: TStringField
      FieldName = 'D_KHBH'
      Size = 5
    end
    object tblKrjzD_XYKBH: TStringField
      FieldName = 'D_XYKBH'
      Size = 5
    end
    object tblKrjzD_JZRQ: TDateTimeField
      FieldName = 'D_JZRQ'
    end
    object tblKrjzD_JZSJ: TDateTimeField
      FieldName = 'D_JZSJ'
    end
    object tblKrjzD_CZYXM: TStringField
      FieldName = 'D_CZYXM'
      Size = 8
    end
    object tblKrjzD_BZ: TStringField
      FieldName = 'D_BZ'
      Size = 30
    end
    object tblKrjzD_YSRQ: TStringField
      FieldName = 'D_YSRQ'
      Size = 8
    end
    object tblKrjzD_BMBH: TStringField
      FieldName = 'D_BMBH'
      Size = 5
    end
  end
  object dsKrjz: TDataSource
    DataSet = tblKrjz
    Left = 48
    Top = 8
  end
  object tblKrzd: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'KRZD'
    Left = 344
    Top = 8
  end
  object tblYsk: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'YSK'
    Left = 376
    Top = 8
  end
end
