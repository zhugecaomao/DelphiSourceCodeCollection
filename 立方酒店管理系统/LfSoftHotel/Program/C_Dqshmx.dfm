inherited DqshmxForm: TDqshmxForm
  Width = 600
  Height = 450
  ActiveControl = DBGrid1
  Caption = #25910#22238#26126#32454
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Width = 592
    inherited lblTitle: TLabel
      Left = 238
      Caption = #25910#22238#26126#32454
    end
    inherited Image1: TImage
      Left = 196
    end
  end
  inherited Panel2: TPanel
    Width = 592
    Height = 314
    inherited DBGrid1: TDBGrid
      Width = 582
      Height = 304
      Columns = <
        item
          Expanded = False
          FieldName = 'D_HH'
          Title.Caption = #34892#21495
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_XMMC'
          Title.Caption = #39033#30446#21517#31216
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_XFJE'
          Title.Caption = #28040#36153#37329#39069
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_YHJE'
          Title.Caption = #20248#24800#37329#39069
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_BZ'
          Title.Caption = #22791#27880
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_JZSJ'
          Title.Caption = #25910#22238#26102#38388
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_CZYXM'
          Title.Caption = #25805#20316#21592
          Visible = True
        end>
    end
  end
  inherited Panel3: TPanel
    Top = 388
    Width = 592
    inherited btnHelp: TBitBtn
      Left = 432
    end
    inherited btnClose: TBitBtn
      Left = 512
    end
    inherited btnPrint: TBitBtn
      Left = 352
    end
  end
  inherited qryWork: TQuery
    DatabaseName = 'LfHotelUser'
    SQL.Strings = (
      'select * from KRJZ where (D_JZBH=:JZBH)and(D_HH<>0)')
    ParamData = <
      item
        DataType = ftString
        Name = 'JZBH'
        ParamType = ptInput
      end>
    object qryWorkD_JZBH: TStringField
      FieldName = 'D_JZBH'
      Origin = 'LFHOTELUSER.KRJZ.D_JZBH'
      Size = 12
    end
    object qryWorkD_HH: TIntegerField
      FieldName = 'D_HH'
      Origin = 'LFHOTELUSER.KRJZ.D_HH'
    end
    object qryWorkD_XMBH: TStringField
      FieldName = 'D_XMBH'
      Origin = 'LFHOTELUSER.KRJZ.D_XMBH'
      Size = 5
    end
    object qryWorkD_XFDJ: TFloatField
      FieldName = 'D_XFDJ'
      Origin = 'LFHOTELUSER.KRJZ.D_XFDJ'
    end
    object qryWorkD_XFSL: TFloatField
      FieldName = 'D_XFSL'
      Origin = 'LFHOTELUSER.KRJZ.D_XFSL'
    end
    object qryWorkD_XFGG: TStringField
      FieldName = 'D_XFGG'
      Origin = 'LFHOTELUSER.KRJZ.D_XFGG'
      Size = 5
    end
    object qryWorkD_XFJE: TFloatField
      FieldName = 'D_XFJE'
      Origin = 'LFHOTELUSER.KRJZ.D_XFJE'
      DisplayFormat = '#.##'
    end
    object qryWorkD_YJJE: TFloatField
      FieldName = 'D_YJJE'
      Origin = 'LFHOTELUSER.KRJZ.D_YJJE'
      DisplayFormat = '#.##'
    end
    object qryWorkD_YHJE: TFloatField
      FieldName = 'D_YHJE'
      Origin = 'LFHOTELUSER.KRJZ.D_YHJE'
      DisplayFormat = '#.##'
    end
    object qryWorkD_JZFS: TStringField
      FieldName = 'D_JZFS'
      Origin = 'LFHOTELUSER.KRJZ.D_JZFS'
      Size = 10
    end
    object qryWorkD_JZLX: TStringField
      FieldName = 'D_JZLX'
      Origin = 'LFHOTELUSER.KRJZ.D_JZLX'
      FixedChar = True
      Size = 1
    end
    object qryWorkD_KHBH: TStringField
      FieldName = 'D_KHBH'
      Origin = 'LFHOTELUSER.KRJZ.D_KHBH'
      Size = 5
    end
    object qryWorkD_XYKBH: TStringField
      FieldName = 'D_XYKBH'
      Origin = 'LFHOTELUSER.KRJZ.D_XYKBH'
      Size = 5
    end
    object qryWorkD_JZRQ: TDateTimeField
      FieldName = 'D_JZRQ'
      Origin = 'LFHOTELUSER.KRJZ.D_JZRQ'
    end
    object qryWorkD_JZSJ: TDateTimeField
      FieldName = 'D_JZSJ'
      Origin = 'LFHOTELUSER.KRJZ.D_JZSJ'
      DisplayFormat = 'hh:nn:ss'
    end
    object qryWorkD_CZYXM: TStringField
      FieldName = 'D_CZYXM'
      Origin = 'LFHOTELUSER.KRJZ.D_CZYXM'
      Size = 8
    end
    object qryWorkD_BZ: TStringField
      FieldName = 'D_BZ'
      Origin = 'LFHOTELUSER.KRJZ.D_BZ'
      Size = 30
    end
    object qryWorkD_YSRQ: TStringField
      FieldName = 'D_YSRQ'
      Origin = 'LFHOTELUSER.KRJZ.D_YSRQ'
      Size = 8
    end
    object qryWorkD_BMBH: TStringField
      FieldName = 'D_BMBH'
      Origin = 'LFHOTELUSER.KRJZ.D_BMBH'
      Size = 5
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
end
