inherited LdkrcxForm: TLdkrcxForm
  Caption = #26597#35810
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Height = 70
    inherited lblTitle: TLabel
      Width = 187
      Caption = #31163#24215#23458#20154#24080#21333
    end
    inherited cmbOption: TComboBox
      Top = 43
      Items.Strings = (
        #22995#21517)
    end
    inherited cmbExpress: TComboBox
      Top = 43
    end
    inherited edtValue: TEdit
      Top = 43
    end
    inherited btnLoca: TBitBtn
      Top = 40
      OnClick = btnLocaClick
    end
  end
  inherited Panel2: TPanel
    Top = 70
    Height = 368
    inherited dbgMaster: TDBGrid
      Color = clMoneyGreen
      FixedColor = clSkyBlue
      OnDblClick = btnXxzlClick
      Columns = <
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
          FieldName = 'D_DDRQ'
          Title.Alignment = taCenter
          Title.Caption = #21040#24215#26085#26399
          Width = 105
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_DDSJ'
          Title.Alignment = taCenter
          Title.Caption = #21040#24215#26102#38388
          Width = 105
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_LDRQ'
          Title.Alignment = taCenter
          Title.Caption = #31163#24215#26085#26399
          Width = 105
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_LDSJ'
          Title.Alignment = taCenter
          Title.Caption = #31163#24215#26102#38388
          Width = 105
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_DWMC'
          Title.Caption = #24037#20316#21333#20301
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_JTDZ'
          Title.Caption = #23478#24237#22320#22336
          Visible = True
        end>
    end
    inherited dbgDetail: TDBGrid
      Height = 186
      Color = clMoneyGreen
      FixedColor = clSkyBlue
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
          Width = 75
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_YHJE'
          Title.Alignment = taCenter
          Title.Caption = #20248#24800#37329#39069
          Width = 75
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_XFRQ'
          Title.Alignment = taCenter
          Title.Caption = #28040#36153#26085#26399
          Width = 75
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_XFSJ'
          Title.Alignment = taCenter
          Title.Caption = #28040#36153#26102#38388
          Width = 75
          Visible = True
        end>
    end
  end
  inherited Panel3: TPanel
    object btnXxzl: TBitBtn
      Left = 8
      Top = 5
      Width = 100
      Height = 25
      Caption = #35814#32454#36164#26009
      TabOrder = 2
      OnClick = btnXxzlClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888844488888444888884F4800084F4800084488888844888888888888888888
        8888888888888888888844488888444888884F4800084F480008448888884488
        88888888888888888888888888888888888844488888444888884F4800084F48
        0008448888884488888888888888888888888888888888888888}
    end
  end
  inherited qryMaster: TQuery
    DatabaseName = 'LfHotelUser'
    SQL.Strings = (
      'select * from KRXXDA')
    object qryMasterD_KRBH: TStringField
      FieldName = 'D_KRBH'
      Origin = 'LFHOTELUSER.KRXXDA.D_KRBH'
      Size = 12
    end
    object qryMasterD_KRXM: TStringField
      FieldName = 'D_KRXM'
      Origin = 'LFHOTELUSER.KRXXDA.D_KRXM'
      Size = 30
    end
    object qryMasterD_KRLX: TStringField
      FieldName = 'D_KRLX'
      Origin = 'LFHOTELUSER.KRXXDA.D_KRLX'
      FixedChar = True
      Size = 1
    end
    object qryMasterD_DDRQ: TDateTimeField
      FieldName = 'D_DDRQ'
      Origin = 'LFHOTELUSER.KRXXDA.D_DDRQ'
      DisplayFormat = 'yyyy-mm-dd'
    end
    object qryMasterD_DDSJ: TDateTimeField
      FieldName = 'D_DDSJ'
      Origin = 'LFHOTELUSER.KRXXDA.D_DDSJ'
      DisplayFormat = 'hh:nn:ss'
    end
    object qryMasterD_LDRQ: TDateTimeField
      FieldName = 'D_LDRQ'
      Origin = 'LFHOTELUSER.KRXXDA.D_LDRQ'
      DisplayFormat = 'yyyy-mm-dd'
    end
    object qryMasterD_LDSJ: TDateTimeField
      FieldName = 'D_LDSJ'
      Origin = 'LFHOTELUSER.KRXXDA.D_LDSJ'
      DisplayFormat = 'hh:nn:ss'
    end
    object qryMasterD_YWX: TStringField
      FieldName = 'D_YWX'
      Origin = 'LFHOTELUSER.KRXXDA.D_YWX'
      Size = 8
    end
    object qryMasterD_YWM: TStringField
      FieldName = 'D_YWM'
      Origin = 'LFHOTELUSER.KRXXDA.D_YWM'
      Size = 8
    end
    object qryMasterD_XB: TStringField
      FieldName = 'D_XB'
      Origin = 'LFHOTELUSER.KRXXDA.D_XB'
      Size = 2
    end
    object qryMasterD_MZBH: TStringField
      FieldName = 'D_MZBH'
      Origin = 'LFHOTELUSER.KRXXDA.D_MZBH'
      Size = 5
    end
    object qryMasterD_DQBH: TStringField
      FieldName = 'D_DQBH'
      Origin = 'LFHOTELUSER.KRXXDA.D_DQBH'
      Size = 5
    end
    object qryMasterD_GBBH: TStringField
      FieldName = 'D_GBBH'
      Origin = 'LFHOTELUSER.KRXXDA.D_GBBH'
      Size = 5
    end
    object qryMasterD_NZTS: TIntegerField
      FieldName = 'D_NZTS'
      Origin = 'LFHOTELUSER.KRXXDA.D_NZTS'
    end
    object qryMasterD_TLSY: TStringField
      FieldName = 'D_TLSY'
      Origin = 'LFHOTELUSER.KRXXDA.D_TLSY'
      Size = 10
    end
    object qryMasterD_ZJBH: TStringField
      FieldName = 'D_ZJBH'
      Origin = 'LFHOTELUSER.KRXXDA.D_ZJBH'
      Size = 5
    end
    object qryMasterD_ZJHM: TStringField
      FieldName = 'D_ZJHM'
      Origin = 'LFHOTELUSER.KRXXDA.D_ZJHM'
      Size = 18
    end
    object qryMasterD_CSNY: TDateTimeField
      FieldName = 'D_CSNY'
      Origin = 'LFHOTELUSER.KRXXDA.D_CSNY'
    end
    object qryMasterD_HCL: TStringField
      FieldName = 'D_HCL'
      Origin = 'LFHOTELUSER.KRXXDA.D_HCL'
      Size = 10
    end
    object qryMasterD_HCQ: TStringField
      FieldName = 'D_HCQ'
      Origin = 'LFHOTELUSER.KRXXDA.D_HCQ'
      Size = 10
    end
    object qryMasterD_QZBH: TStringField
      FieldName = 'D_QZBH'
      Origin = 'LFHOTELUSER.KRXXDA.D_QZBH'
      Size = 5
    end
    object qryMasterD_QZYXQ: TDateTimeField
      FieldName = 'D_QZYXQ'
      Origin = 'LFHOTELUSER.KRXXDA.D_QZYXQ'
    end
    object qryMasterD_ZY: TStringField
      FieldName = 'D_ZY'
      Origin = 'LFHOTELUSER.KRXXDA.D_ZY'
      Size = 10
    end
    object qryMasterD_LXDH: TStringField
      FieldName = 'D_LXDH'
      Origin = 'LFHOTELUSER.KRXXDA.D_LXDH'
      Size = 16
    end
    object qryMasterD_DWMC: TStringField
      FieldName = 'D_DWMC'
      Origin = 'LFHOTELUSER.KRXXDA.D_DWMC'
      Size = 30
    end
    object qryMasterD_JTDZ: TStringField
      FieldName = 'D_JTDZ'
      Origin = 'LFHOTELUSER.KRXXDA.D_JTDZ'
      Size = 30
    end
    object qryMasterD_JDR: TStringField
      FieldName = 'D_JDR'
      Origin = 'LFHOTELUSER.KRXXDA.D_JDR'
      Size = 8
    end
    object qryMasterD_JDDW: TStringField
      FieldName = 'D_JDDW'
      Origin = 'LFHOTELUSER.KRXXDA.D_JDDW'
      Size = 30
    end
    object qryMasterD_BZ: TStringField
      FieldName = 'D_BZ'
      Origin = 'LFHOTELUSER.KRXXDA.D_BZ'
      Size = 30
    end
    object qryMasterD_QDR1: TStringField
      FieldName = 'D_QDR1'
      Origin = 'LFHOTELUSER.KRXXDA.D_QDR1'
      Size = 8
    end
    object qryMasterD_QDR2: TStringField
      FieldName = 'D_QDR2'
      Origin = 'LFHOTELUSER.KRXXDA.D_QDR2'
      Size = 8
    end
    object qryMasterD_QDR3: TStringField
      FieldName = 'D_QDR3'
      Origin = 'LFHOTELUSER.KRXXDA.D_QDR3'
      Size = 8
    end
    object qryMasterD_QDR4: TStringField
      FieldName = 'D_QDR4'
      Origin = 'LFHOTELUSER.KRXXDA.D_QDR4'
      Size = 8
    end
  end
  inherited qryDetail: TQuery
    DatabaseName = 'LfHotelUser'
    SQL.Strings = (
      'select * from KRZDDA where (D_KRBH=:D_KRBH)and(D_HH<>0)')
    ParamData = <
      item
        DataType = ftString
        Name = 'D_KRBH'
        ParamType = ptUnknown
        Size = 13
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
    object qryDetailD_ZDBH: TStringField
      FieldName = 'D_ZDBH'
      Origin = 'LFHOTELUSER.KRZDDA.D_ZDBH'
      Size = 12
    end
    object qryDetailD_HH: TIntegerField
      FieldName = 'D_HH'
      Origin = 'LFHOTELUSER.KRZDDA.D_HH'
    end
    object qryDetailD_ZDLB: TStringField
      FieldName = 'D_ZDLB'
      Origin = 'LFHOTELUSER.KRZDDA.D_ZDLB'
      FixedChar = True
      Size = 1
    end
    object qryDetailD_KRBH: TStringField
      FieldName = 'D_KRBH'
      Origin = 'LFHOTELUSER.KRZDDA.D_KRBH'
      Size = 12
    end
    object qryDetailD_YJBH: TStringField
      FieldName = 'D_YJBH'
      Origin = 'LFHOTELUSER.KRZDDA.D_YJBH'
      Size = 12
    end
    object qryDetailD_KFBH: TStringField
      FieldName = 'D_KFBH'
      Origin = 'LFHOTELUSER.KRZDDA.D_KFBH'
      Size = 5
    end
    object qryDetailD_SJFJ: TFloatField
      FieldName = 'D_SJFJ'
      Origin = 'LFHOTELUSER.KRZDDA.D_SJFJ'
      currency = True
    end
    object qryDetailD_XMBH: TStringField
      FieldName = 'D_XMBH'
      Origin = 'LFHOTELUSER.KRZDDA.D_XMBH'
      Size = 5
    end
    object qryDetailD_XFDJ: TFloatField
      FieldName = 'D_XFDJ'
      Origin = 'LFHOTELUSER.KRZDDA.D_XFDJ'
    end
    object qryDetailD_XFSL: TFloatField
      FieldName = 'D_XFSL'
      Origin = 'LFHOTELUSER.KRZDDA.D_XFSL'
    end
    object qryDetailD_XFJE: TFloatField
      FieldName = 'D_XFJE'
      Origin = 'LFHOTELUSER.KRZDDA.D_XFJE'
      currency = True
    end
    object qryDetailD_XFRQ: TDateTimeField
      FieldName = 'D_XFRQ'
      Origin = 'LFHOTELUSER.KRZDDA.D_XFRQ'
      DisplayFormat = 'yyyy-mm-dd'
    end
    object qryDetailD_XFSJ: TDateTimeField
      FieldName = 'D_XFSJ'
      Origin = 'LFHOTELUSER.KRZDDA.D_XFSJ'
      DisplayFormat = 'hh:nn:ss'
    end
    object qryDetailD_YHJE: TFloatField
      FieldName = 'D_YHJE'
      Origin = 'LFHOTELUSER.KRZDDA.D_YHJE'
      currency = True
    end
    object qryDetailD_JZRQ: TDateTimeField
      FieldName = 'D_JZRQ'
      Origin = 'LFHOTELUSER.KRZDDA.D_JZRQ'
    end
    object qryDetailD_JZSJ: TDateTimeField
      FieldName = 'D_JZSJ'
      Origin = 'LFHOTELUSER.KRZDDA.D_JZSJ'
    end
    object qryDetailD_JZBZ: TStringField
      FieldName = 'D_JZBZ'
      Origin = 'LFHOTELUSER.KRZDDA.D_JZBZ'
      FixedChar = True
      Size = 1
    end
    object qryDetailD_JSBZ: TStringField
      FieldName = 'D_JSBZ'
      Origin = 'LFHOTELUSER.KRZDDA.D_JSBZ'
      FixedChar = True
      Size = 1
    end
    object qryDetailD_DLR1: TStringField
      FieldName = 'D_DLR1'
      Origin = 'LFHOTELUSER.KRZDDA.D_DLR1'
      Size = 8
    end
    object qryDetailD_DLR2: TStringField
      FieldName = 'D_DLR2'
      Origin = 'LFHOTELUSER.KRZDDA.D_DLR2'
      Size = 8
    end
    object qryDetailD_DLR3: TStringField
      FieldName = 'D_DLR3'
      Origin = 'LFHOTELUSER.KRZDDA.D_DLR3'
      Size = 8
    end
    object qryDetailD_DLR4: TStringField
      FieldName = 'D_DLR4'
      Origin = 'LFHOTELUSER.KRZDDA.D_DLR4'
      Size = 8
    end
    object qryDetailD_CZYXM: TStringField
      FieldName = 'D_CZYXM'
      Origin = 'LFHOTELUSER.KRZDDA.D_CZYXM'
      Size = 8
    end
    object qryDetailD_JZYXM: TStringField
      FieldName = 'D_JZYXM'
      Origin = 'LFHOTELUSER.KRZDDA.D_JZYXM'
      Size = 8
    end
    object qryDetailD_TYR: TStringField
      FieldName = 'D_TYR'
      Origin = 'LFHOTELUSER.KRZDDA.D_TYR'
      Size = 8
    end
    object qryDetailD_BZ: TStringField
      FieldName = 'D_BZ'
      Origin = 'LFHOTELUSER.KRZDDA.D_BZ'
      Size = 30
    end
    object qryDetailD_YSRQ: TStringField
      FieldName = 'D_YSRQ'
      Origin = 'LFHOTELUSER.KRZDDA.D_YSRQ'
      Size = 8
    end
    object qryDetailD_JZBH: TStringField
      FieldName = 'D_JZBH'
      Origin = 'LFHOTELUSER.KRZDDA.D_JZBH'
      Size = 12
    end
  end
end
