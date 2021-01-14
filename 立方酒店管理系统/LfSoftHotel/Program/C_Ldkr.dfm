object LdkrForm: TLdkrForm
  Left = 111
  Top = 92
  Width = 640
  Height = 480
  Caption = #31163#24215#23458#20154#26597#35810
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'System'
  Font.Style = [fsBold]
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 200
    Top = 8
    Width = 187
    Height = 29
    Caption = #31163#24215#23458#20154#26597#35810
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -29
    Font.Name = #26999#20307'_GB2312'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 48
    Width = 32
    Height = 16
    Caption = #25151#21495
  end
  object Label3: TLabel
    Left = 168
    Top = 48
    Width = 32
    Height = 16
    Caption = #22995#21517
  end
  object Label4: TLabel
    Left = 8
    Top = 73
    Width = 32
    Height = 16
    Caption = #22320#22336
  end
  object Label5: TLabel
    Left = 168
    Top = 73
    Width = 32
    Height = 16
    Caption = #21333#20301
  end
  object Label6: TLabel
    Left = 328
    Top = 48
    Width = 64
    Height = 16
    Caption = #21040#24215#26085#26399
  end
  object Label7: TLabel
    Left = 328
    Top = 73
    Width = 64
    Height = 16
    Caption = #31163#24215#26085#26399
  end
  object Label8: TLabel
    Left = 8
    Top = 98
    Width = 64
    Height = 16
    Caption = #35777#20214#21495#30721
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 128
    Width = 632
    Height = 193
    Align = alBottom
    DataSource = dsKrxx
    TabOrder = 0
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'System'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'D_KFBH'
        Title.Caption = #25151#21495
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'D_SJFJ'
        Title.Caption = #25151#20215
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'D_KRXM'
        Title.Caption = #23458#20154#22995#21517
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'D_DDRQ'
        Title.Caption = #21040#24215#26085#26399
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'D_LDRQ'
        Title.Caption = #31163#24215#26085#26399
        Width = 80
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
      end
      item
        Expanded = False
        FieldName = 'D_ZJHM'
        Title.Caption = #35777#20214#21495#30721
        Visible = True
      end>
  end
  object edtKfbh: TEdit
    Left = 40
    Top = 44
    Width = 121
    Height = 24
    TabOrder = 1
  end
  object edtKrxm: TEdit
    Left = 200
    Top = 44
    Width = 121
    Height = 24
    TabOrder = 2
  end
  object edtJtdz: TEdit
    Left = 40
    Top = 69
    Width = 121
    Height = 24
    TabOrder = 3
  end
  object edtDwmc: TEdit
    Left = 200
    Top = 69
    Width = 121
    Height = 24
    TabOrder = 4
  end
  object edtDdrq: TEdit
    Left = 400
    Top = 44
    Width = 121
    Height = 24
    TabOrder = 5
  end
  object edtLdrq: TEdit
    Left = 400
    Top = 69
    Width = 121
    Height = 24
    TabOrder = 6
  end
  object edtZjhm: TEdit
    Left = 72
    Top = 94
    Width = 249
    Height = 24
    TabOrder = 7
  end
  object btnQuery: TButton
    Left = 552
    Top = 40
    Width = 75
    Height = 25
    Caption = #26597#35810'(&Q)'
    TabOrder = 8
    OnClick = OnQuery
  end
  object Panel1: TPanel
    Left = 0
    Top = 412
    Width = 632
    Height = 41
    Align = alBottom
    TabOrder = 9
    object btnXxzl: TButton
      Left = 16
      Top = 8
      Width = 75
      Height = 25
      Caption = #35814#32454#36164#26009
      TabOrder = 0
      OnClick = OnXxzl
    end
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 321
    Width = 632
    Height = 91
    Align = alBottom
    DataSource = dsKrzd
    TabOrder = 10
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'System'
    TitleFont.Style = [fsBold]
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
        FieldName = 'D_XMMC'
        Title.Caption = #39033#30446#21517#31216
        Width = 100
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
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'D_CZYXM'
        Title.Caption = #25805#20316#21592
        Visible = True
      end>
  end
  object qryKrxx: TQuery
    BeforeOpen = qryKrxxBeforeOpen
    BeforeClose = qryKrxxBeforeClose
    DatabaseName = 'LfHotelUser'
    SQL.Strings = (
      'select a.*,b.D_KFBH,b.D_SJFJ from KRXXDA a,KRZDDA b')
    Left = 384
    Top = 24
    object qryKrxxD_KRBH: TStringField
      FieldName = 'D_KRBH'
      Origin = 'LFHOTELUSER.KRXXDA.D_KRBH'
      Size = 12
    end
    object qryKrxxD_KRXM: TStringField
      FieldName = 'D_KRXM'
      Origin = 'LFHOTELUSER.KRXXDA.D_KRXM'
      Size = 30
    end
    object qryKrxxD_KRLX: TStringField
      FieldName = 'D_KRLX'
      Origin = 'LFHOTELUSER.KRXXDA.D_KRLX'
      FixedChar = True
      Size = 1
    end
    object qryKrxxD_DDRQ: TDateTimeField
      FieldName = 'D_DDRQ'
      Origin = 'LFHOTELUSER.KRXXDA.D_DDRQ'
      DisplayFormat = 'yyyy-mm-dd'
    end
    object qryKrxxD_DDSJ: TDateTimeField
      FieldName = 'D_DDSJ'
      Origin = 'LFHOTELUSER.KRXXDA.D_DDSJ'
    end
    object qryKrxxD_LDRQ: TDateTimeField
      FieldName = 'D_LDRQ'
      Origin = 'LFHOTELUSER.KRXXDA.D_LDRQ'
      DisplayFormat = 'yyyy-mm-dd'
    end
    object qryKrxxD_LDSJ: TDateTimeField
      FieldName = 'D_LDSJ'
      Origin = 'LFHOTELUSER.KRXXDA.D_LDSJ'
    end
    object qryKrxxD_YWX: TStringField
      FieldName = 'D_YWX'
      Origin = 'LFHOTELUSER.KRXXDA.D_YWX'
      Size = 8
    end
    object qryKrxxD_YWM: TStringField
      FieldName = 'D_YWM'
      Origin = 'LFHOTELUSER.KRXXDA.D_YWM'
      Size = 8
    end
    object qryKrxxD_XB: TStringField
      FieldName = 'D_XB'
      Origin = 'LFHOTELUSER.KRXXDA.D_XB'
      Size = 2
    end
    object qryKrxxD_MZBH: TStringField
      FieldName = 'D_MZBH'
      Origin = 'LFHOTELUSER.KRXXDA.D_MZBH'
      Size = 5
    end
    object qryKrxxD_DQBH: TStringField
      FieldName = 'D_DQBH'
      Origin = 'LFHOTELUSER.KRXXDA.D_DQBH'
      Size = 5
    end
    object qryKrxxD_GBBH: TStringField
      FieldName = 'D_GBBH'
      Origin = 'LFHOTELUSER.KRXXDA.D_GBBH'
      Size = 5
    end
    object qryKrxxD_NZTS: TIntegerField
      FieldName = 'D_NZTS'
      Origin = 'LFHOTELUSER.KRXXDA.D_NZTS'
    end
    object qryKrxxD_TLSY: TStringField
      FieldName = 'D_TLSY'
      Origin = 'LFHOTELUSER.KRXXDA.D_TLSY'
      Size = 10
    end
    object qryKrxxD_ZJBH: TStringField
      FieldName = 'D_ZJBH'
      Origin = 'LFHOTELUSER.KRXXDA.D_ZJBH'
      Size = 5
    end
    object qryKrxxD_ZJHM: TStringField
      FieldName = 'D_ZJHM'
      Origin = 'LFHOTELUSER.KRXXDA.D_ZJHM'
      Size = 18
    end
    object qryKrxxD_CSNY: TDateTimeField
      FieldName = 'D_CSNY'
      Origin = 'LFHOTELUSER.KRXXDA.D_CSNY'
    end
    object qryKrxxD_HCL: TStringField
      FieldName = 'D_HCL'
      Origin = 'LFHOTELUSER.KRXXDA.D_HCL'
      Size = 10
    end
    object qryKrxxD_HCQ: TStringField
      FieldName = 'D_HCQ'
      Origin = 'LFHOTELUSER.KRXXDA.D_HCQ'
      Size = 10
    end
    object qryKrxxD_QZBH: TStringField
      FieldName = 'D_QZBH'
      Origin = 'LFHOTELUSER.KRXXDA.D_QZBH'
      Size = 5
    end
    object qryKrxxD_QZYXQ: TDateTimeField
      FieldName = 'D_QZYXQ'
      Origin = 'LFHOTELUSER.KRXXDA.D_QZYXQ'
    end
    object qryKrxxD_ZY: TStringField
      FieldName = 'D_ZY'
      Origin = 'LFHOTELUSER.KRXXDA.D_ZY'
      Size = 10
    end
    object qryKrxxD_LXDH: TStringField
      FieldName = 'D_LXDH'
      Origin = 'LFHOTELUSER.KRXXDA.D_LXDH'
      Size = 16
    end
    object qryKrxxD_DWMC: TStringField
      FieldName = 'D_DWMC'
      Origin = 'LFHOTELUSER.KRXXDA.D_DWMC'
      Size = 30
    end
    object qryKrxxD_JTDZ: TStringField
      FieldName = 'D_JTDZ'
      Origin = 'LFHOTELUSER.KRXXDA.D_JTDZ'
      Size = 30
    end
    object qryKrxxD_JDR: TStringField
      FieldName = 'D_JDR'
      Origin = 'LFHOTELUSER.KRXXDA.D_JDR'
      Size = 8
    end
    object qryKrxxD_JDDW: TStringField
      FieldName = 'D_JDDW'
      Origin = 'LFHOTELUSER.KRXXDA.D_JDDW'
      Size = 30
    end
    object qryKrxxD_BZ: TStringField
      FieldName = 'D_BZ'
      Origin = 'LFHOTELUSER.KRXXDA.D_BZ'
      Size = 30
    end
    object qryKrxxD_QDR1: TStringField
      FieldName = 'D_QDR1'
      Origin = 'LFHOTELUSER.KRXXDA.D_QDR1'
      Size = 8
    end
    object qryKrxxD_QDR2: TStringField
      FieldName = 'D_QDR2'
      Origin = 'LFHOTELUSER.KRXXDA.D_QDR2'
      Size = 8
    end
    object qryKrxxD_QDR3: TStringField
      FieldName = 'D_QDR3'
      Origin = 'LFHOTELUSER.KRXXDA.D_QDR3'
      Size = 8
    end
    object qryKrxxD_QDR4: TStringField
      FieldName = 'D_QDR4'
      Origin = 'LFHOTELUSER.KRXXDA.D_QDR4'
      Size = 8
    end
    object qryKrxxD_KFBH: TStringField
      FieldName = 'D_KFBH'
      Origin = 'LFHOTELUSER.KRZDDA.D_KFBH'
      Size = 5
    end
    object qryKrxxD_SJFJ: TFloatField
      FieldName = 'D_SJFJ'
      Origin = 'LFHOTELUSER.KRZDDA.D_SJFJ'
      DisplayFormat = '#.##'
    end
  end
  object dsKrxx: TDataSource
    DataSet = qryKrxx
    Left = 432
    Top = 24
  end
  object DosMove1: TDosMove
    Active = True
    Left = 152
    Top = 8
  end
  object qryKrzd: TQuery
    DatabaseName = 'LfHotelUser'
    DataSource = dsKrxx
    SQL.Strings = (
      'select * from KRZDDA where (D_KRBH=:D_KRBH)and(D_HH<>0)')
    Left = 488
    Top = 24
    ParamData = <
      item
        DataType = ftString
        Name = 'D_KRBH'
        ParamType = ptUnknown
        Size = 13
      end>
    object qryKrzdD_ZDBH: TStringField
      FieldName = 'D_ZDBH'
      Origin = 'LFHOTELUSER.KRZDDA.D_ZDBH'
      Size = 12
    end
    object qryKrzdD_HH: TIntegerField
      FieldName = 'D_HH'
      Origin = 'LFHOTELUSER.KRZDDA.D_HH'
    end
    object qryKrzdD_ZDLB: TStringField
      FieldName = 'D_ZDLB'
      Origin = 'LFHOTELUSER.KRZDDA.D_ZDLB'
      FixedChar = True
      Size = 1
    end
    object qryKrzdD_KRBH: TStringField
      FieldName = 'D_KRBH'
      Origin = 'LFHOTELUSER.KRZDDA.D_KRBH'
      Size = 12
    end
    object qryKrzdD_YJBH: TStringField
      FieldName = 'D_YJBH'
      Origin = 'LFHOTELUSER.KRZDDA.D_YJBH'
      Size = 12
    end
    object qryKrzdD_KFBH: TStringField
      FieldName = 'D_KFBH'
      Origin = 'LFHOTELUSER.KRZDDA.D_KFBH'
      Size = 5
    end
    object qryKrzdD_SJFJ: TFloatField
      FieldName = 'D_SJFJ'
      Origin = 'LFHOTELUSER.KRZDDA.D_SJFJ'
    end
    object qryKrzdD_XMBH: TStringField
      FieldName = 'D_XMBH'
      Origin = 'LFHOTELUSER.KRZDDA.D_XMBH'
      Size = 5
    end
    object qryKrzdD_XFDJ: TFloatField
      FieldName = 'D_XFDJ'
      Origin = 'LFHOTELUSER.KRZDDA.D_XFDJ'
    end
    object qryKrzdD_XFSL: TFloatField
      FieldName = 'D_XFSL'
      Origin = 'LFHOTELUSER.KRZDDA.D_XFSL'
    end
    object qryKrzdD_XFJE: TFloatField
      FieldName = 'D_XFJE'
      Origin = 'LFHOTELUSER.KRZDDA.D_XFJE'
      DisplayFormat = '#.##'
    end
    object qryKrzdD_XFRQ: TDateTimeField
      FieldName = 'D_XFRQ'
      Origin = 'LFHOTELUSER.KRZDDA.D_XFRQ'
      DisplayFormat = 'yyyy-mm-dd'
    end
    object qryKrzdD_XFSJ: TDateTimeField
      FieldName = 'D_XFSJ'
      Origin = 'LFHOTELUSER.KRZDDA.D_XFSJ'
    end
    object qryKrzdD_YHJE: TFloatField
      FieldName = 'D_YHJE'
      Origin = 'LFHOTELUSER.KRZDDA.D_YHJE'
    end
    object qryKrzdD_JZRQ: TDateTimeField
      FieldName = 'D_JZRQ'
      Origin = 'LFHOTELUSER.KRZDDA.D_JZRQ'
    end
    object qryKrzdD_JZSJ: TDateTimeField
      FieldName = 'D_JZSJ'
      Origin = 'LFHOTELUSER.KRZDDA.D_JZSJ'
    end
    object qryKrzdD_JZBZ: TStringField
      FieldName = 'D_JZBZ'
      Origin = 'LFHOTELUSER.KRZDDA.D_JZBZ'
      FixedChar = True
      Size = 1
    end
    object qryKrzdD_JSBZ: TStringField
      FieldName = 'D_JSBZ'
      Origin = 'LFHOTELUSER.KRZDDA.D_JSBZ'
      FixedChar = True
      Size = 1
    end
    object qryKrzdD_DLR1: TStringField
      FieldName = 'D_DLR1'
      Origin = 'LFHOTELUSER.KRZDDA.D_DLR1'
      Size = 8
    end
    object qryKrzdD_DLR2: TStringField
      FieldName = 'D_DLR2'
      Origin = 'LFHOTELUSER.KRZDDA.D_DLR2'
      Size = 8
    end
    object qryKrzdD_DLR3: TStringField
      FieldName = 'D_DLR3'
      Origin = 'LFHOTELUSER.KRZDDA.D_DLR3'
      Size = 8
    end
    object qryKrzdD_DLR4: TStringField
      FieldName = 'D_DLR4'
      Origin = 'LFHOTELUSER.KRZDDA.D_DLR4'
      Size = 8
    end
    object qryKrzdD_CZYXM: TStringField
      FieldName = 'D_CZYXM'
      Origin = 'LFHOTELUSER.KRZDDA.D_CZYXM'
      Size = 8
    end
    object qryKrzdD_JZYXM: TStringField
      FieldName = 'D_JZYXM'
      Origin = 'LFHOTELUSER.KRZDDA.D_JZYXM'
      Size = 8
    end
    object qryKrzdD_TYR: TStringField
      FieldName = 'D_TYR'
      Origin = 'LFHOTELUSER.KRZDDA.D_TYR'
      Size = 8
    end
    object qryKrzdD_BZ: TStringField
      FieldName = 'D_BZ'
      Origin = 'LFHOTELUSER.KRZDDA.D_BZ'
      Size = 30
    end
    object qryKrzdD_YSRQ: TStringField
      FieldName = 'D_YSRQ'
      Origin = 'LFHOTELUSER.KRZDDA.D_YSRQ'
      Size = 8
    end
    object qryKrzdD_JZBH: TStringField
      FieldName = 'D_JZBH'
      Origin = 'LFHOTELUSER.KRZDDA.D_JZBH'
      Size = 12
    end
    object qryKrzdD_BMBH: TStringField
      FieldName = 'D_BMBH'
      Origin = 'LFHOTELUSER.KRZDDA.D_BMBH'
      Size = 5
    end
    object qryKrzdD_XMMC: TStringField
      FieldKind = fkLookup
      FieldName = 'D_XMMC'
      LookupDataSet = HotelData.tblXMDM
      LookupKeyFields = 'D_XMBH'
      LookupResultField = 'D_XMMC'
      KeyFields = 'D_XMBH'
      Lookup = True
    end
  end
  object dsKrzd: TDataSource
    DataSet = qryKrzd
    Left = 520
    Top = 24
  end
end
