inherited KhxfmxForm: TKhxfmxForm
  Left = 140
  Top = 15
  Width = 650
  Height = 550
  Caption = #32479#35745
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Width = 642
    inherited lblTitle: TLabel
      Left = 255
      Width = 187
      Caption = #23458#25143#24212#25910#26126#32454
    end
    inherited Image1: TImage
      Left = 192
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
    Width = 642
    Height = 407
    inherited dbgMaster: TDBGrid
      Width = 632
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
      Width = 632
      Height = 225
      Color = clMoneyGreen
      FixedColor = clSkyBlue
      OnTitleClick = dbgDetailTitleClick
      Columns = <
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_XFXM'
          Title.Alignment = taCenter
          Title.Caption = #28040#36153#39033#30446
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_XFJE'
          Title.Alignment = taCenter
          Title.Caption = #28040#36153#37329#39069
          Width = 200
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_XFRQ'
          Title.Alignment = taCenter
          Title.Caption = #28040#36153#26085#26399
          Width = 100
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_XFSJ'
          Title.Alignment = taCenter
          Title.Caption = #28040#36153#26102#38388
          Width = 100
          Visible = True
        end>
    end
  end
  inherited Panel3: TPanel
    Top = 488
    Width = 642
    inherited btnHelp: TBitBtn
      Left = 483
    end
    inherited btnClose: TBitBtn
      Left = 562
    end
    object btnPrint: TBitBtn
      Left = 404
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
  end
  inherited qryMaster: TQuery
    DatabaseName = 'LfHotelUser'
    SQL.Strings = (
      'select * from KHDA order by D_FLBH')
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
      
        'select * from YSK where (D_KHBH=:D_KHBH)and(D_HH<>0) order by D_' +
        'XFRQ,D_XFSJ')
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
    object qryDetailD_KHBH: TStringField
      FieldName = 'D_KHBH'
      Origin = 'LFHOTELUSER.YSK.D_KHBH'
      Size = 5
    end
    object qryDetailD_ZDBH: TStringField
      FieldName = 'D_ZDBH'
      Origin = 'LFHOTELUSER.YSK.D_ZDBH'
      Size = 12
    end
    object qryDetailD_HH: TIntegerField
      FieldName = 'D_HH'
      Origin = 'LFHOTELUSER.YSK.D_HH'
    end
    object qryDetailD_XMBH: TStringField
      FieldName = 'D_XMBH'
      Origin = 'LFHOTELUSER.YSK.D_XMBH'
      Size = 5
    end
    object qryDetailD_XFDJ: TFloatField
      FieldName = 'D_XFDJ'
      Origin = 'LFHOTELUSER.YSK.D_XFDJ'
    end
    object qryDetailD_XFSL: TFloatField
      FieldName = 'D_XFSL'
      Origin = 'LFHOTELUSER.YSK.D_XFSL'
    end
    object qryDetailD_XFJE: TFloatField
      FieldName = 'D_XFJE'
      Origin = 'LFHOTELUSER.YSK.D_XFJE'
      DisplayFormat = '#.##'
    end
    object qryDetailD_XFRQ: TDateTimeField
      FieldName = 'D_XFRQ'
      Origin = 'LFHOTELUSER.YSK.D_XFRQ'
    end
    object qryDetailD_XFSJ: TDateTimeField
      FieldName = 'D_XFSJ'
      Origin = 'LFHOTELUSER.YSK.D_XFSJ'
      DisplayFormat = 'hh:nn:ss'
    end
    object qryDetailD_CZYXM: TStringField
      FieldName = 'D_CZYXM'
      Origin = 'LFHOTELUSER.YSK.D_CZYXM'
      Size = 8
    end
    object qryDetailD_BZ: TStringField
      FieldName = 'D_BZ'
      Origin = 'LFHOTELUSER.YSK.D_BZ'
      Size = 30
    end
  end
end
