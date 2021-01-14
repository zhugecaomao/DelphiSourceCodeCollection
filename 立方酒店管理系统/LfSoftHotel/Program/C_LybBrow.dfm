object LybBrowForm: TLybBrowForm
  Left = 123
  Top = 89
  Width = 640
  Height = 480
  Caption = #30041#35328#26495
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
    Left = 240
    Top = 8
    Width = 126
    Height = 24
    Caption = #30041#35328#26495#26597#35810
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = #26999#20307'_GB2312'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 96
    Width = 632
    Height = 357
    Align = alBottom
    DataSource = dsLyb
    TabOrder = 0
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'System'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'D_RQ'
        Title.Caption = #30041#35328#26085#26399
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'D_SJ'
        Title.Caption = #30041#35328#26102#38388
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'D_XM'
        Title.Caption = #30041#35328#20154
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'D_NRBZ'
        Title.Caption = #30041#35328#20869#23481
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'D_YDRBZ'
        Title.Caption = #24050#38405#20154
        Visible = True
      end>
  end
  object btnNew: TButton
    Left = 8
    Top = 64
    Width = 75
    Height = 25
    Caption = #26032#22686#30041#35328
    TabOrder = 1
    OnClick = OnNew
  end
  object btnEdit: TButton
    Left = 96
    Top = 64
    Width = 75
    Height = 25
    Caption = #38405#35835#30041#35328
    TabOrder = 2
    OnClick = OnEdit
  end
  object btnDel: TButton
    Left = 184
    Top = 64
    Width = 75
    Height = 25
    Caption = #21024#38500#30041#35328
    TabOrder = 3
    OnClick = OnDelete
  end
  object qryLyb: TQuery
    OnCalcFields = qryLybCalcFields
    DatabaseName = 'LfHotelUser'
    SQL.Strings = (
      'select * from LYB order by D_RQ DESC,D_SJ DESC ')
    Left = 440
    Top = 24
    object qryLybD_LYBID: TIntegerField
      FieldName = 'D_LYBID'
      Origin = 'LFHOTELUSER.LYB.D_LYBID'
    end
    object qryLybD_XM: TStringField
      FieldName = 'D_XM'
      Origin = 'LFHOTELUSER.LYB.D_XM'
      Size = 8
    end
    object qryLybD_RQ: TDateTimeField
      FieldName = 'D_RQ'
      Origin = 'LFHOTELUSER.LYB.D_RQ'
      DisplayFormat = 'yyyy-mm-dd'
    end
    object qryLybD_SJ: TDateTimeField
      FieldName = 'D_SJ'
      Origin = 'LFHOTELUSER.LYB.D_SJ'
      DisplayFormat = 'hh:nn:ss'
    end
    object qryLybD_NR: TBlobField
      FieldName = 'D_NR'
      Origin = 'LFHOTELUSER.LYB.D_NR'
      Size = 1
    end
    object qryLybD_YDR: TBlobField
      FieldName = 'D_YDR'
      Origin = 'LFHOTELUSER.LYB.D_YDR'
      Size = 1
    end
    object qryLybD_NRBZ: TStringField
      FieldKind = fkCalculated
      FieldName = 'D_NRBZ'
      Size = 60
      Calculated = True
    end
    object qryLybD_YDRBZ: TStringField
      FieldKind = fkCalculated
      FieldName = 'D_YDRBZ'
      Size = 60
      Calculated = True
    end
  end
  object dsLyb: TDataSource
    DataSet = qryLyb
    Left = 480
    Top = 24
  end
end
