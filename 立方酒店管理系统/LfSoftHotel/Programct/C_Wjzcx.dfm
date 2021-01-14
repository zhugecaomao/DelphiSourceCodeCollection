object WjzCxForm: TWjzCxForm
  Left = 192
  Top = 107
  Width = 544
  Height = 375
  Caption = #26410#32467#24080#26597#35810
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'System'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 184
    Top = 8
    Width = 126
    Height = 24
    Caption = #26410#32467#24080#26597#35810
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = #26999#20307'_GB2312'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 48
    Width = 536
    Height = 300
    Align = alBottom
    DataSource = dsKrzd
    TabOrder = 0
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'System'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'D_XFRQ'
        Title.Caption = #26085#26399
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'D_XFSJ'
        Title.Caption = #26102#38388
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
        FieldName = 'D_BZ'
        Title.Caption = #22791#27880
        Width = 180
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'D_CZYXM'
        Title.Caption = #25805#20316#21592
        Visible = True
      end>
  end
  object qryKrzd: TQuery
    DatabaseName = 'LfHotelUser'
    SQL.Strings = (
      'select * from KRZD')
    Left = 344
    Top = 16
    object qryKrzdD_ZDBH: TStringField
      FieldName = 'D_ZDBH'
      Origin = 'LFHOTELUSER.KRZD.D_ZDBH'
      Size = 12
    end
    object qryKrzdD_HH: TIntegerField
      FieldName = 'D_HH'
      Origin = 'LFHOTELUSER.KRZD.D_HH'
    end
    object qryKrzdD_ZDLB: TStringField
      FieldName = 'D_ZDLB'
      Origin = 'LFHOTELUSER.KRZD.D_ZDLB'
      FixedChar = True
      Size = 1
    end
    object qryKrzdD_KRBH: TStringField
      FieldName = 'D_KRBH'
      Origin = 'LFHOTELUSER.KRZD.D_KRBH'
      Size = 12
    end
    object qryKrzdD_YJBH: TStringField
      FieldName = 'D_YJBH'
      Origin = 'LFHOTELUSER.KRZD.D_YJBH'
      Size = 12
    end
    object qryKrzdD_KFBH: TStringField
      FieldName = 'D_KFBH'
      Origin = 'LFHOTELUSER.KRZD.D_KFBH'
      Size = 5
    end
    object qryKrzdD_SJFJ: TFloatField
      FieldName = 'D_SJFJ'
      Origin = 'LFHOTELUSER.KRZD.D_SJFJ'
    end
    object qryKrzdD_XMBH: TStringField
      FieldName = 'D_XMBH'
      Origin = 'LFHOTELUSER.KRZD.D_XMBH'
      Size = 5
    end
    object qryKrzdD_XFDJ: TFloatField
      FieldName = 'D_XFDJ'
      Origin = 'LFHOTELUSER.KRZD.D_XFDJ'
    end
    object qryKrzdD_XFSL: TFloatField
      FieldName = 'D_XFSL'
      Origin = 'LFHOTELUSER.KRZD.D_XFSL'
    end
    object qryKrzdD_XFJE: TFloatField
      FieldName = 'D_XFJE'
      Origin = 'LFHOTELUSER.KRZD.D_XFJE'
      DisplayFormat = '#.##'
    end
    object qryKrzdD_XFRQ: TDateTimeField
      FieldName = 'D_XFRQ'
      Origin = 'LFHOTELUSER.KRZD.D_XFRQ'
      DisplayFormat = 'yyyy-mm-dd'
    end
    object qryKrzdD_XFSJ: TDateTimeField
      FieldName = 'D_XFSJ'
      Origin = 'LFHOTELUSER.KRZD.D_XFSJ'
      DisplayFormat = 'hh:nn:ss'
    end
    object qryKrzdD_YHJE: TFloatField
      FieldName = 'D_YHJE'
      Origin = 'LFHOTELUSER.KRZD.D_YHJE'
    end
    object qryKrzdD_JZRQ: TDateTimeField
      FieldName = 'D_JZRQ'
      Origin = 'LFHOTELUSER.KRZD.D_JZRQ'
    end
    object qryKrzdD_JZSJ: TDateTimeField
      FieldName = 'D_JZSJ'
      Origin = 'LFHOTELUSER.KRZD.D_JZSJ'
    end
    object qryKrzdD_JZBZ: TStringField
      FieldName = 'D_JZBZ'
      Origin = 'LFHOTELUSER.KRZD.D_JZBZ'
      FixedChar = True
      Size = 1
    end
    object qryKrzdD_JSBZ: TStringField
      FieldName = 'D_JSBZ'
      Origin = 'LFHOTELUSER.KRZD.D_JSBZ'
      FixedChar = True
      Size = 1
    end
    object qryKrzdD_DLR1: TStringField
      FieldName = 'D_DLR1'
      Origin = 'LFHOTELUSER.KRZD.D_DLR1'
      Size = 8
    end
    object qryKrzdD_DLR2: TStringField
      FieldName = 'D_DLR2'
      Origin = 'LFHOTELUSER.KRZD.D_DLR2'
      Size = 8
    end
    object qryKrzdD_DLR3: TStringField
      FieldName = 'D_DLR3'
      Origin = 'LFHOTELUSER.KRZD.D_DLR3'
      Size = 8
    end
    object qryKrzdD_DLR4: TStringField
      FieldName = 'D_DLR4'
      Origin = 'LFHOTELUSER.KRZD.D_DLR4'
      Size = 8
    end
    object qryKrzdD_CZYXM: TStringField
      FieldName = 'D_CZYXM'
      Origin = 'LFHOTELUSER.KRZD.D_CZYXM'
      Size = 8
    end
    object qryKrzdD_JZYXM: TStringField
      FieldName = 'D_JZYXM'
      Origin = 'LFHOTELUSER.KRZD.D_JZYXM'
      Size = 8
    end
    object qryKrzdD_TYR: TStringField
      FieldName = 'D_TYR'
      Origin = 'LFHOTELUSER.KRZD.D_TYR'
      Size = 8
    end
    object qryKrzdD_BZ: TStringField
      FieldName = 'D_BZ'
      Origin = 'LFHOTELUSER.KRZD.D_BZ'
      Size = 60
    end
    object qryKrzdD_YSRQ: TStringField
      FieldName = 'D_YSRQ'
      Origin = 'LFHOTELUSER.KRZD.D_YSRQ'
      Size = 8
    end
    object qryKrzdD_JZBH: TStringField
      FieldName = 'D_JZBH'
      Origin = 'LFHOTELUSER.KRZD.D_JZBH'
      Size = 12
    end
    object qryKrzdD_BMBH: TStringField
      FieldName = 'D_BMBH'
      Origin = 'LFHOTELUSER.KRZD.D_BMBH'
      Size = 5
    end
  end
  object dsKrzd: TDataSource
    DataSet = qryKrzd
    Left = 384
    Top = 16
  end
end
