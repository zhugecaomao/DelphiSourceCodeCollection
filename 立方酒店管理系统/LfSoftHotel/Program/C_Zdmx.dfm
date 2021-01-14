inherited ZdmxForm: TZdmxForm
  Left = 77
  Top = 63
  Width = 700
  Height = 450
  Caption = #24080#21333#26126#32454
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Width = 692
    Height = 43
    inherited lblTitle: TLabel
      Left = 289
      Top = 6
      Caption = #26434#21333#26126#32454
    end
    inherited Image1: TImage
      Left = 232
      Top = 6
    end
    inherited cmbOption: TComboBox
      Top = 8
      Visible = False
    end
    inherited cmbExpress: TComboBox
      Top = 8
      Visible = False
    end
    inherited edtValue: TEdit
      Top = 8
      Visible = False
    end
    inherited btnLoca: TBitBtn
      Top = 5
      Visible = False
    end
  end
  inherited Panel2: TPanel
    Top = 43
    Width = 692
    Height = 345
    inherited DBGrid1: TDBGrid
      Width = 682
      Height = 335
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      OnTitleClick = DBGrid1TitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'D_XFRQ'
          Title.Caption = #28040#36153#26085#26399
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_XFSJ'
          Title.Caption = #28040#36153#26102#38388
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_XMMC'
          Title.Caption = #39033#30446#21517#31216
          Width = 80
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
          FieldName = 'D_CZYXM'
          Title.Caption = #25805#20316#21592
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_BZ'
          Title.Caption = #24080#21333#22791#27880
          Visible = True
        end>
    end
  end
  inherited Panel3: TPanel
    Top = 388
    Width = 692
    object lblHj: TLabel [0]
      Left = 8
      Top = 9
      Width = 48
      Height = 16
      Caption = #21512#35745#65306
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited btnHelp: TBitBtn
      Left = 532
    end
    inherited btnClose: TBitBtn
      Left = 612
    end
    inherited btnPrint: TBitBtn
      Left = 452
    end
  end
  inherited qryWork: TQuery
    DatabaseName = 'LfHotelUser'
    SQL.Strings = (
      
        'select * from KRZDCX where (D_ZDBH=:ZDBH)and(D_HH<>0) order by D' +
        '_XFRQ,D_XFSJ')
    ParamData = <
      item
        DataType = ftString
        Name = 'ZDBH'
        ParamType = ptInput
      end>
    object qryWorkD_ZDBH: TStringField
      FieldName = 'D_ZDBH'
      Origin = 'LFHOTELUSER.KRZD.D_ZDBH'
      Size = 12
    end
    object qryWorkD_HH: TIntegerField
      FieldName = 'D_HH'
      Origin = 'LFHOTELUSER.KRZD.D_HH'
    end
    object qryWorkD_ZDLB: TStringField
      FieldName = 'D_ZDLB'
      Origin = 'LFHOTELUSER.KRZD.D_ZDLB'
      FixedChar = True
      Size = 1
    end
    object qryWorkD_KRBH: TStringField
      FieldName = 'D_KRBH'
      Origin = 'LFHOTELUSER.KRZD.D_KRBH'
      Size = 12
    end
    object qryWorkD_YJBH: TStringField
      FieldName = 'D_YJBH'
      Origin = 'LFHOTELUSER.KRZD.D_YJBH'
      Size = 12
    end
    object qryWorkD_KFBH: TStringField
      FieldName = 'D_KFBH'
      Origin = 'LFHOTELUSER.KRZD.D_KFBH'
      Size = 5
    end
    object qryWorkD_SJFJ: TFloatField
      FieldName = 'D_SJFJ'
      Origin = 'LFHOTELUSER.KRZD.D_SJFJ'
    end
    object qryWorkD_XMBH: TStringField
      FieldName = 'D_XMBH'
      Origin = 'LFHOTELUSER.KRZD.D_XMBH'
      Size = 5
    end
    object qryWorkD_XFDJ: TFloatField
      FieldName = 'D_XFDJ'
      Origin = 'LFHOTELUSER.KRZD.D_XFDJ'
    end
    object qryWorkD_XFSL: TFloatField
      FieldName = 'D_XFSL'
      Origin = 'LFHOTELUSER.KRZD.D_XFSL'
    end
    object qryWorkD_XFJE: TFloatField
      FieldName = 'D_XFJE'
      Origin = 'LFHOTELUSER.KRZD.D_XFJE'
      DisplayFormat = '#.##'
    end
    object qryWorkD_XFRQ: TDateTimeField
      FieldName = 'D_XFRQ'
      Origin = 'LFHOTELUSER.KRZD.D_XFRQ'
    end
    object qryWorkD_XFSJ: TDateTimeField
      FieldName = 'D_XFSJ'
      Origin = 'LFHOTELUSER.KRZD.D_XFSJ'
      DisplayFormat = 'hh:nn:ss'
    end
    object qryWorkD_YHJE: TFloatField
      FieldName = 'D_YHJE'
      Origin = 'LFHOTELUSER.KRZD.D_YHJE'
      DisplayFormat = '#.##'
    end
    object qryWorkD_JZRQ: TDateTimeField
      FieldName = 'D_JZRQ'
      Origin = 'LFHOTELUSER.KRZD.D_JZRQ'
    end
    object qryWorkD_JZSJ: TDateTimeField
      FieldName = 'D_JZSJ'
      Origin = 'LFHOTELUSER.KRZD.D_JZSJ'
    end
    object qryWorkD_JZBZ: TStringField
      FieldName = 'D_JZBZ'
      Origin = 'LFHOTELUSER.KRZD.D_JZBZ'
      FixedChar = True
      Size = 1
    end
    object qryWorkD_JSBZ: TStringField
      FieldName = 'D_JSBZ'
      Origin = 'LFHOTELUSER.KRZD.D_JSBZ'
      FixedChar = True
      Size = 1
    end
    object qryWorkD_DLR1: TStringField
      FieldName = 'D_DLR1'
      Origin = 'LFHOTELUSER.KRZD.D_DLR1'
      Size = 8
    end
    object qryWorkD_DLR2: TStringField
      FieldName = 'D_DLR2'
      Origin = 'LFHOTELUSER.KRZD.D_DLR2'
      Size = 8
    end
    object qryWorkD_DLR3: TStringField
      FieldName = 'D_DLR3'
      Origin = 'LFHOTELUSER.KRZD.D_DLR3'
      Size = 8
    end
    object qryWorkD_DLR4: TStringField
      FieldName = 'D_DLR4'
      Origin = 'LFHOTELUSER.KRZD.D_DLR4'
      Size = 8
    end
    object qryWorkD_CZYXM: TStringField
      FieldName = 'D_CZYXM'
      Origin = 'LFHOTELUSER.KRZD.D_CZYXM'
      Size = 8
    end
    object qryWorkD_JZYXM: TStringField
      FieldName = 'D_JZYXM'
      Origin = 'LFHOTELUSER.KRZD.D_JZYXM'
      Size = 8
    end
    object qryWorkD_TYR: TStringField
      FieldName = 'D_TYR'
      Origin = 'LFHOTELUSER.KRZD.D_TYR'
      Size = 8
    end
    object qryWorkD_BZ: TStringField
      FieldName = 'D_BZ'
      Origin = 'LFHOTELUSER.KRZD.D_BZ'
      Size = 30
    end
    object qryWorkD_YSRQ: TStringField
      FieldName = 'D_YSRQ'
      Origin = 'LFHOTELUSER.KRZD.D_YSRQ'
      Size = 8
    end
    object qryWorkD_JZBH: TStringField
      FieldName = 'D_JZBH'
      Origin = 'LFHOTELUSER.KRZD.D_JZBH'
      Size = 12
    end
    object qryWorkD_BMBH: TStringField
      FieldName = 'D_BMBH'
      Origin = 'LFHOTELUSER.KRZD.D_BMBH'
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
