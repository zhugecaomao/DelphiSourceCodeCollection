object HcjscxForm: THcjscxForm
  Left = 103
  Top = 101
  Width = 640
  Height = 480
  Caption = #20250#22330#32467#31639#26597#35810
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
    Left = 224
    Top = 8
    Width = 151
    Height = 24
    Caption = #20250#22330#32467#31639#26597#35810
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = #26999#20307'_GB2312'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 40
    Width = 632
    Height = 413
    Align = alBottom
    DataSource = dsYdhc
    TabOrder = 0
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'System'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'D_SYRQ'
        Title.Caption = #26085#26399
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'D_SJDM'
        Title.Caption = #26102#38388
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'D_HCMC'
        Title.Caption = #20250#22330#21517#31216
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'D_KRXM'
        Title.Caption = #23458#20154#22995#21517
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'D_HCZJ'
        Title.Caption = #20250#22330#31199#37329
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'D_HFJE'
        Title.Caption = #27178#24133#37329#39069
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'D_SGJE'
        Title.Caption = #27700#26524#37329#39069
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'D_XHJE'
        Title.Caption = #40092#33457#37329#39069
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'D_QTJE'
        Title.Caption = #20854#20182#37329#39069
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'D_CZYXM'
        Title.Caption = #25805#20316#21592
        Visible = True
      end>
  end
  object qryYdhc: TQuery
    DatabaseName = 'LfHotelUser'
    SQL.Strings = (
      'select * from YDHC where D_JSBZ="2" order by D_SYRQ,D_SYSJ')
    Left = 400
    Top = 40
    object qryYdhcD_YDBH: TStringField
      FieldName = 'D_YDBH'
      Origin = 'LFHOTELUSER.YDHC.D_YDBH'
      Size = 12
    end
    object qryYdhcD_KRBH: TStringField
      FieldName = 'D_KRBH'
      Origin = 'LFHOTELUSER.YDHC.D_KRBH'
      Size = 12
    end
    object qryYdhcD_KRXM: TStringField
      FieldName = 'D_KRXM'
      Origin = 'LFHOTELUSER.YDHC.D_KRXM'
      Size = 30
    end
    object qryYdhcD_YDRQ: TDateTimeField
      FieldName = 'D_YDRQ'
      Origin = 'LFHOTELUSER.YDHC.D_YDRQ'
    end
    object qryYdhcD_SYRQ: TDateTimeField
      FieldName = 'D_SYRQ'
      Origin = 'LFHOTELUSER.YDHC.D_SYRQ'
    end
    object qryYdhcD_SYSJ: TDateTimeField
      FieldName = 'D_SYSJ'
      Origin = 'LFHOTELUSER.YDHC.D_SYSJ'
    end
    object qryYdhcD_SJDM: TStringField
      FieldName = 'D_SJDM'
      Origin = 'LFHOTELUSER.YDHC.D_SJDM'
      FixedChar = True
      Size = 4
    end
    object qryYdhcD_HCBH: TStringField
      FieldName = 'D_HCBH'
      Origin = 'LFHOTELUSER.YDHC.D_HCBH'
      Size = 5
    end
    object qryYdhcD_HCMC: TStringField
      FieldName = 'D_HCMC'
      Origin = 'LFHOTELUSER.YDHC.D_HCMC'
      Size = 10
    end
    object qryYdhcD_HCZJ: TFloatField
      FieldName = 'D_HCZJ'
      Origin = 'LFHOTELUSER.YDHC.D_HCZJ'
    end
    object qryYdhcD_HCRS: TIntegerField
      FieldName = 'D_HCRS'
      Origin = 'LFHOTELUSER.YDHC.D_HCRS'
    end
    object qryYdhcD_HCRS1: TIntegerField
      FieldName = 'D_HCRS1'
      Origin = 'LFHOTELUSER.YDHC.D_HCRS1'
    end
    object qryYdhcD_HFSL: TFloatField
      FieldName = 'D_HFSL'
      Origin = 'LFHOTELUSER.YDHC.D_HFSL'
    end
    object qryYdhcD_HFJE: TFloatField
      FieldName = 'D_HFJE'
      Origin = 'LFHOTELUSER.YDHC.D_HFJE'
    end
    object qryYdhcD_HFBZ: TStringField
      FieldName = 'D_HFBZ'
      Origin = 'LFHOTELUSER.YDHC.D_HFBZ'
      Size = 30
    end
    object qryYdhcD_XHSL: TFloatField
      FieldName = 'D_XHSL'
      Origin = 'LFHOTELUSER.YDHC.D_XHSL'
    end
    object qryYdhcD_XHJE: TFloatField
      FieldName = 'D_XHJE'
      Origin = 'LFHOTELUSER.YDHC.D_XHJE'
    end
    object qryYdhcD_XHBZ: TStringField
      FieldName = 'D_XHBZ'
      Origin = 'LFHOTELUSER.YDHC.D_XHBZ'
      Size = 30
    end
    object qryYdhcD_SGSL: TFloatField
      FieldName = 'D_SGSL'
      Origin = 'LFHOTELUSER.YDHC.D_SGSL'
    end
    object qryYdhcD_SGJE: TFloatField
      FieldName = 'D_SGJE'
      Origin = 'LFHOTELUSER.YDHC.D_SGJE'
    end
    object qryYdhcD_SGBZ: TStringField
      FieldName = 'D_SGBZ'
      Origin = 'LFHOTELUSER.YDHC.D_SGBZ'
      Size = 30
    end
    object qryYdhcD_QTJE: TFloatField
      FieldName = 'D_QTJE'
      Origin = 'LFHOTELUSER.YDHC.D_QTJE'
    end
    object qryYdhcD_QTBZ: TStringField
      FieldName = 'D_QTBZ'
      Origin = 'LFHOTELUSER.YDHC.D_QTBZ'
      Size = 30
    end
    object qryYdhcD_HTSL: TFloatField
      FieldName = 'D_HTSL'
      Origin = 'LFHOTELUSER.YDHC.D_HTSL'
    end
    object qryYdhcD_HTBZ: TStringField
      FieldName = 'D_HTBZ'
      Origin = 'LFHOTELUSER.YDHC.D_HTBZ'
      Size = 30
    end
    object qryYdhcD_BZ: TBlobField
      FieldName = 'D_BZ'
      Origin = 'LFHOTELUSER.YDHC.D_BZ'
      Size = 1
    end
    object qryYdhcD_RZBZ: TStringField
      FieldName = 'D_RZBZ'
      Origin = 'LFHOTELUSER.YDHC.D_RZBZ'
      FixedChar = True
      Size = 1
    end
    object qryYdhcD_JSBZ: TStringField
      FieldName = 'D_JSBZ'
      Origin = 'LFHOTELUSER.YDHC.D_JSBZ'
      FixedChar = True
      Size = 1
    end
    object qryYdhcD_CZYXM: TStringField
      FieldName = 'D_CZYXM'
      Origin = 'LFHOTELUSER.YDHC.D_CZYXM'
      Size = 8
    end
  end
  object dsYdhc: TDataSource
    DataSet = qryYdhc
    Left = 360
    Top = 40
  end
end
