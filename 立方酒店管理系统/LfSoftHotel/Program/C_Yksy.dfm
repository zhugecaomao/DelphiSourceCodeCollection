inherited YksyForm: TYksyForm
  Left = 153
  Top = 33
  Width = 568
  Height = 525
  ActiveControl = edtKfh
  Caption = #32467#24080
  Font.Name = 'System'
  Font.Style = [fsBold]
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited Panel1: TPanel
    Width = 560
    Height = 151
    inherited lblTitile: TLabel
      Left = 220
      Width = 125
      Caption = #26434#21333#24405#20837
    end
    inherited Image1: TImage
      Left = 181
    end
    object Bevel2: TBevel
      Left = 8
      Top = 41
      Width = 545
      Height = 105
      ParentShowHint = False
      Shape = bsFrame
      ShowHint = False
    end
    object Label1: TLabel
      Left = 16
      Top = 96
      Width = 112
      Height = 16
      Caption = #22995#21517#25110#22242#38431#21517#31216
    end
    object Label2: TLabel
      Left = 231
      Top = 96
      Width = 64
      Height = 16
      Caption = #31614#21333#20154#19968
    end
    object Label3: TLabel
      Left = 311
      Top = 96
      Width = 64
      Height = 16
      Caption = #31614#21333#20154#20108
    end
    object Label4: TLabel
      Left = 391
      Top = 96
      Width = 64
      Height = 16
      Caption = #31614#21333#20154#19977
    end
    object Label5: TLabel
      Left = 471
      Top = 96
      Width = 64
      Height = 16
      Caption = #31614#21333#20154#22235
    end
    object Label6: TLabel
      Left = 150
      Top = 48
      Width = 64
      Height = 16
      Caption = #28040#36153#26085#26399
    end
    object Label7: TLabel
      Left = 280
      Top = 48
      Width = 64
      Height = 16
      Caption = #28040#36153#26102#38388
    end
    object edtKfh: TLabeledEdit
      Left = 16
      Top = 64
      Width = 130
      Height = 24
      EditLabel.Width = 48
      EditLabel.Height = 16
      EditLabel.Caption = #25151#38388#21495
      LabelPosition = lpAbove
      LabelSpacing = 3
      TabOrder = 0
      OnExit = edtKfhExit
    end
    object edtCzyxm: TLabeledEdit
      Left = 416
      Top = 64
      Width = 130
      Height = 24
      Color = cl3DLight
      EditLabel.Width = 48
      EditLabel.Height = 16
      EditLabel.Caption = #25805#20316#21592
      LabelPosition = lpAbove
      LabelSpacing = 3
      ReadOnly = True
      TabOrder = 8
    end
    object DBEdit1: TDBEdit
      Left = 16
      Top = 112
      Width = 209
      Height = 24
      Color = cl3DLight
      DataField = 'D_KRXM'
      DataSource = dsKrxx
      ReadOnly = True
      TabOrder = 3
    end
    object DBEdit2: TDBEdit
      Left = 231
      Top = 112
      Width = 75
      Height = 24
      Color = cl3DLight
      DataField = 'D_QDR1'
      DataSource = dsKrxx
      ReadOnly = True
      TabOrder = 4
    end
    object DBEdit3: TDBEdit
      Left = 311
      Top = 112
      Width = 75
      Height = 24
      Color = cl3DLight
      DataField = 'D_QDR2'
      DataSource = dsKrxx
      ReadOnly = True
      TabOrder = 5
    end
    object DBEdit4: TDBEdit
      Left = 391
      Top = 112
      Width = 75
      Height = 24
      Color = cl3DLight
      DataField = 'D_QDR3'
      DataSource = dsKrxx
      ReadOnly = True
      TabOrder = 6
    end
    object DBEdit5: TDBEdit
      Left = 471
      Top = 112
      Width = 75
      Height = 24
      Color = cl3DLight
      DataField = 'D_QDR4'
      DataSource = dsKrxx
      ReadOnly = True
      TabOrder = 7
    end
    object edtXfrq: TMaskEdit
      Left = 149
      Top = 64
      Width = 130
      Height = 24
      EditMask = '!0000/99/99;1; '
      MaxLength = 10
      TabOrder = 1
      Text = '    -  -  '
      OnExit = edtXfrqExit
    end
    object edtXfsj: TMaskEdit
      Left = 282
      Top = 64
      Width = 130
      Height = 24
      EditMask = '!90:00;1; '
      MaxLength = 5
      TabOrder = 2
      Text = '  :  '
      OnExit = edtXfsjExit
    end
  end
  inherited Panel2: TPanel
    Top = 151
    Width = 560
    Height = 312
    inherited Bevel1: TBevel
      Width = 550
      Height = 302
    end
    object DBGrid1: TDBGrid
      Left = 5
      Top = 5
      Width = 550
      Height = 302
      Align = alClient
      Color = clMoneyGreen
      DataSource = dsKrzd
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
          Width = 240
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_XFJE'
          Title.Alignment = taCenter
          Title.Caption = #28040#36153#37329#39069
          Width = 240
          Visible = True
        end>
    end
  end
  inherited Panel3: TPanel
    Top = 463
    Width = 560
    object Label8: TLabel [0]
      Left = 8
      Top = 8
      Width = 76
      Height = 14
      Caption = #21512#35745#37329#39069#65306
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = #24188#22278
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblHj: TLabel [1]
      Left = 140
      Top = 8
      Width = 21
      Height = 14
      Caption = '0'#20803
      Font.Charset = GB2312_CHARSET
      Font.Color = clGreen
      Font.Height = -14
      Font.Name = #24188#22278
      Font.Style = []
      ParentFont = False
    end
    inherited btnOK: TBitBtn
      Left = 396
      OnClick = btnOKClick
    end
    inherited btnCanc: TBitBtn
      Left = 474
      OnClick = btnCancClick
    end
  end
  object tblKrxx: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'KRXX'
    Left = 416
    Top = 8
  end
  object dsKrzd: TDataSource
    DataSet = qryKrzd
    Left = 384
    Top = 8
  end
  object dsKrxx: TDataSource
    DataSet = tblKrxx
    Left = 448
    Top = 8
  end
  object qryKrzd: TQuery
    CachedUpdates = True
    BeforePost = qryKrzdBeforePost
    AfterPost = qryKrzdAfterPost
    DatabaseName = 'LfHotelUser'
    RequestLive = True
    SQL.Strings = (
      'select * from KRZD where (D_ZDBH=:ZDBH)and(D_HH>=:HH)')
    Left = 352
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'ZDBH'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'HH'
        ParamType = ptInput
      end>
    object qryKrzdD_XFXM: TStringField
      FieldKind = fkLookup
      FieldName = 'D_XFXM'
      LookupDataSet = HotelData.tblXMDM
      LookupKeyFields = 'D_XMBH'
      LookupResultField = 'D_XMMC'
      KeyFields = 'D_XMBH'
      Lookup = True
    end
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
      OnValidate = qryKrzdD_XMBHValidate
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
      OnValidate = qryKrzdD_XFJEValidate
      currency = True
    end
    object qryKrzdD_XFRQ: TDateTimeField
      FieldName = 'D_XFRQ'
      Origin = 'LFHOTELUSER.KRZD.D_XFRQ'
    end
    object qryKrzdD_XFSJ: TDateTimeField
      FieldName = 'D_XFSJ'
      Origin = 'LFHOTELUSER.KRZD.D_XFSJ'
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
      Size = 30
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
  object tblKrzd: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'KRZD'
    Left = 496
    Top = 8
  end
end
