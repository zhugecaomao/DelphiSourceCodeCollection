inherited KhjzmxForm: TKhjzmxForm
  Left = 104
  Top = -7
  Width = 700
  Height = 550
  Caption = #32479#35745
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Width = 692
    inherited lblTitle: TLabel
      Left = 282
      Width = 187
      Caption = #23458#25143#32467#24080#26126#32454
    end
    inherited Image1: TImage
      Left = 208
    end
    inherited cmbOption: TComboBox
      Text = #23458#25143#32534#21495
      Items.Strings = (
        #23458#25143#32534#21495
        #23458#25143#21517#31216)
    end
    inherited btnLoca: TBitBtn
      OnClick = btnLocaClick
    end
  end
  inherited Panel2: TPanel
    Width = 692
    Height = 407
    inherited dbgMaster: TDBGrid
      Width = 682
      Color = clMoneyGreen
      FixedColor = clSkyBlue
      Columns = <
        item
          Expanded = False
          FieldName = 'D_KHBH'
          Title.Alignment = taCenter
          Title.Caption = #23458#25143#32534#21495
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_KHMC'
          Title.Alignment = taCenter
          Title.Caption = #23458#25143#21517#31216
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_DWDZ'
          Title.Alignment = taCenter
          Title.Caption = #21333#20301#22320#22336
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_LXDH'
          Title.Alignment = taCenter
          Title.Caption = #32852#31995#30005#35805
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_FR'
          Title.Alignment = taCenter
          Title.Caption = #27861#20154
          Visible = True
        end>
    end
    inherited dbgDetail: TDBGrid
      Width = 682
      Height = 225
      Color = clMoneyGreen
      FixedColor = clSkyBlue
      Columns = <
        item
          Expanded = False
          FieldName = 'D_BZ'
          Title.Caption = #28040#36153#26085#26399
          Width = 80
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_XFXM'
          Title.Alignment = taCenter
          Title.Caption = #28040#36153#39033#30446
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_XFJE'
          Title.Alignment = taCenter
          Title.Caption = #28040#36153#37329#39069
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_YHJE'
          Title.Alignment = taCenter
          Title.Caption = #20248#24800#37329#39069
          Width = 100
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_JZRQ'
          Title.Alignment = taCenter
          Title.Caption = #32467#24080#26085#26399
          Width = 80
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_JZSJ'
          Title.Alignment = taCenter
          Title.Caption = #32467#24080#26102#38388
          Width = 80
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_JZFS'
          Title.Alignment = taCenter
          Title.Caption = #32467#24080#26041#24335
          Width = 80
          Visible = True
        end>
    end
  end
  inherited Panel3: TPanel
    Top = 488
    Width = 692
    object lblYsk: TLabel [0]
      Left = 8
      Top = 12
      Width = 60
      Height = 12
      Caption = #25910#22238#24635#39069#65306
    end
    object DBText1: TDBText [1]
      Left = 72
      Top = 11
      Width = 42
      Height = 12
      AutoSize = True
      DataField = 'SUM'
      DataSource = dsHj
    end
    inherited btnHelp: TBitBtn
      Left = 533
    end
    inherited btnClose: TBitBtn
      Left = 612
    end
    object btnPrint: TBitBtn
      Left = 454
      Top = 5
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #25171#21360'(&P)'
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
    object btnYszz: TBitBtn
      Left = 350
      Top = 5
      Width = 100
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #32467#24080#24635#24080
      TabOrder = 3
      OnClick = btnYszzClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333300030003
        0003333377737773777333333333333333333FFFFFFFFFFFFFFF770000000000
        0000777777777777777733039993BBB3CCC3337F737F737F737F37039993BBB3
        CCC3377F737F737F737F33039993BBB3CCC33F7F737F737F737F77079997BBB7
        CCC77777737773777377330399930003CCC3337F737F7773737F370399933333
        CCC3377F737F3333737F330399933333CCC33F7F737FFFFF737F770700077777
        CCC77777777777777377330333333333CCC3337F33333333737F370333333333
        0003377F33333333777333033333333333333F7FFFFFFFFFFFFF770777777777
        7777777777777777777733333333333333333333333333333333}
      NumGlyphs = 2
    end
  end
  inherited qryMaster: TQuery
    DatabaseName = 'LfHotelUser'
    SQL.Strings = (
      'select * from KHDA')
    object qryMasterD_KHBH: TStringField
      FieldName = 'D_KHBH'
      Origin = 'LFHOTELUSER.KHDA.D_KHBH'
      Size = 5
    end
    object qryMasterD_KHMC: TStringField
      FieldName = 'D_KHMC'
      Origin = 'LFHOTELUSER.KHDA.D_KHMC'
      Size = 30
    end
    object qryMasterD_FLBH: TStringField
      FieldName = 'D_FLBH'
      Origin = 'LFHOTELUSER.KHDA.D_FLBH'
      Size = 5
    end
    object qryMasterD_DWDZ: TStringField
      FieldName = 'D_DWDZ'
      Origin = 'LFHOTELUSER.KHDA.D_DWDZ'
      Size = 30
    end
    object qryMasterD_FR: TStringField
      FieldName = 'D_FR'
      Origin = 'LFHOTELUSER.KHDA.D_FR'
      Size = 8
    end
    object qryMasterD_LXDH: TStringField
      FieldName = 'D_LXDH'
      Origin = 'LFHOTELUSER.KHDA.D_LXDH'
      Size = 16
    end
    object qryMasterD_JDRQ: TDateTimeField
      FieldName = 'D_JDRQ'
      Origin = 'LFHOTELUSER.KHDA.D_JDRQ'
    end
    object qryMasterD_DM: TStringField
      FieldName = 'D_DM'
      Origin = 'LFHOTELUSER.KHDA.D_DM'
      Size = 10
    end
  end
  inherited qryDetail: TQuery
    DatabaseName = 'LfHotelUser'
    SQL.Strings = (
      'select * from YSKJZ where D_KHBH=:D_KHBH')
    ParamData = <
      item
        DataType = ftString
        Name = 'D_KHBH'
        ParamType = ptUnknown
        Size = 6
      end>
    object qryDetailD_XFXM: TStringField
      FieldKind = fkLookup
      FieldName = 'D_XFXM'
      LookupDataSet = HotelData.tblXMDM
      LookupKeyFields = 'D_XMBH'
      LookupResultField = 'D_XMMC'
      KeyFields = 'D_XMBH'
      Lookup = True
    end
    object qryDetailD_JZBH: TStringField
      FieldName = 'D_JZBH'
      Origin = 'LFHOTELUSER.YSKJZ.D_JZBH'
      Size = 12
    end
    object qryDetailD_KHBH: TStringField
      FieldName = 'D_KHBH'
      Origin = 'LFHOTELUSER.YSKJZ.D_KHBH'
      Size = 5
    end
    object qryDetailD_HH: TIntegerField
      FieldName = 'D_HH'
      Origin = 'LFHOTELUSER.YSKJZ.D_HH'
    end
    object qryDetailD_XMBH: TStringField
      FieldName = 'D_XMBH'
      Origin = 'LFHOTELUSER.YSKJZ.D_XMBH'
      Size = 5
    end
    object qryDetailD_XFJE: TFloatField
      FieldName = 'D_XFJE'
      Origin = 'LFHOTELUSER.YSKJZ.D_XFJE'
      DisplayFormat = '#.##'
    end
    object qryDetailD_YJJE: TFloatField
      FieldName = 'D_YJJE'
      Origin = 'LFHOTELUSER.YSKJZ.D_YJJE'
      DisplayFormat = '#.##'
    end
    object qryDetailD_YHJE: TFloatField
      FieldName = 'D_YHJE'
      Origin = 'LFHOTELUSER.YSKJZ.D_YHJE'
      DisplayFormat = '#.##'
    end
    object qryDetailD_JZJE: TFloatField
      FieldName = 'D_JZJE'
      Origin = 'LFHOTELUSER.YSKJZ.D_JZJE'
      DisplayFormat = '#.##'
    end
    object qryDetailD_JZFS: TStringField
      FieldName = 'D_JZFS'
      Origin = 'LFHOTELUSER.YSKJZ.D_JZFS'
      Size = 10
    end
    object qryDetailD_XYKBH: TStringField
      FieldName = 'D_XYKBH'
      Origin = 'LFHOTELUSER.YSKJZ.D_XYKBH'
      Size = 5
    end
    object qryDetailD_JZRQ: TDateTimeField
      FieldName = 'D_JZRQ'
      Origin = 'LFHOTELUSER.YSKJZ.D_JZRQ'
    end
    object qryDetailD_JZSJ: TDateTimeField
      FieldName = 'D_JZSJ'
      Origin = 'LFHOTELUSER.YSKJZ.D_JZSJ'
      DisplayFormat = 'hh:nn:ss'
    end
    object qryDetailD_CZYXM: TStringField
      FieldName = 'D_CZYXM'
      Origin = 'LFHOTELUSER.YSKJZ.D_CZYXM'
      Size = 8
    end
    object qryDetailD_BZ: TStringField
      FieldName = 'D_BZ'
      Origin = 'LFHOTELUSER.YSKJZ.D_BZ'
      Size = 30
    end
  end
  inherited dsMaster: TDataSource
    OnDataChange = dsMasterDataChange
  end
  object qryHj: TQuery
    DatabaseName = 'LfHotelUser'
    DataSource = dsMaster
    SQL.Strings = (
      
        'select sum(D_XFJE-D_YHJE) from YSKJZ where (D_KHBH=:D_KHBH)and(D' +
        '_HH<>0)')
    Left = 496
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'D_KHBH'
        ParamType = ptUnknown
        Size = 6
      end>
    object qryHjSUM: TFloatField
      FieldName = 'SUM'
      Origin = 'LFHOTELUSER.YSK.D_XFJE'
      currency = True
    end
  end
  object dsHj: TDataSource
    DataSet = qryHj
    Left = 536
    Top = 8
  end
end
