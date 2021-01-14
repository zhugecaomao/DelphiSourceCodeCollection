inherited WjzjzForm: TWjzjzForm
  Width = 600
  Height = 298
  Caption = #32467#24080
  Font.Name = 'System'
  Font.Style = [fsBold]
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited Panel1: TPanel
    Width = 592
    inherited lblTitile: TLabel
      Left = 227
      Width = 125
      Caption = #38646#23458#26410#32467
    end
    inherited Image1: TImage
      Left = 179
    end
  end
  inherited Panel2: TPanel
    Width = 592
    Height = 194
    inherited Bevel1: TBevel
      Left = 361
      Width = 226
      Height = 184
    end
    object Label2: TLabel
      Left = 374
      Top = 16
      Width = 64
      Height = 16
      Caption = #32467#24080#26085#26399
    end
    object Label3: TLabel
      Left = 475
      Top = 16
      Width = 64
      Height = 16
      Caption = #32467#24080#26102#38388
    end
    object Label4: TLabel
      Left = 376
      Top = 143
      Width = 48
      Height = 16
      Caption = #35831#36873#25321
    end
    object edtJzrq: TMaskEdit
      Left = 374
      Top = 32
      Width = 99
      Height = 24
      EditMask = '!0000/99/99;1; '
      MaxLength = 10
      TabOrder = 0
      Text = '    -  -  '
      OnExit = edtJzrqExit
    end
    object edtJzsj: TMaskEdit
      Left = 475
      Top = 32
      Width = 100
      Height = 24
      EditMask = '!90:00;1; '
      MaxLength = 5
      TabOrder = 1
      Text = '  :  '
      OnExit = edtJzsjExit
    end
    object radJzfs: TRadioGroup
      Left = 374
      Top = 60
      Width = 203
      Height = 77
      Caption = ' '#32467' '#24080' '#26041' '#24335' '
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #20154#27665#24065
        #20449#29992#21345
        #25903#31080
        #35760#24080
        #36149#23486#21345)
      TabOrder = 2
      OnClick = radJzfsClick
    end
    object cmbJz: TComboBox
      Left = 374
      Top = 158
      Width = 203
      Height = 24
      ItemHeight = 16
      TabOrder = 3
    end
    object DBGrid1: TDBGrid
      Left = 5
      Top = 5
      Width = 356
      Height = 184
      Align = alLeft
      Color = clMoneyGreen
      DataSource = dsKrzd
      FixedColor = clSkyBlue
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'System'
      Font.Style = [fsBold]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 4
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'System'
      TitleFont.Style = [fsBold]
      Columns = <
        item
          Expanded = False
          FieldName = 'D_KFBH'
          Title.Alignment = taCenter
          Title.Caption = #25151#21495
          Width = 40
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'D_KRXM'
          Title.Alignment = taCenter
          Title.Caption = #23458#20154#22995#21517
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_JZRQ'
          Title.Caption = #36864#25151#26085#26399
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D_JZSJ'
          Title.Caption = #36864#25151#26102#38388
          Width = 80
          Visible = True
        end>
    end
  end
  inherited Panel3: TPanel
    Top = 236
    Width = 592
    inherited btnOK: TBitBtn
      Left = 432
      OnClick = btnOKClick
    end
    inherited btnCanc: TBitBtn
      Left = 512
    end
  end
  object qryKrzd: TQuery
    DatabaseName = 'LfHotelUser'
    SQL.Strings = (
      'select * from KRZD where (D_JSBZ="3")and(D_HH=0)')
    Left = 16
    Top = 8
    object qryKrzdD_KRXM: TStringField
      FieldKind = fkLookup
      FieldName = 'D_KRXM'
      LookupDataSet = HotelData.tblKrxx
      LookupKeyFields = 'D_KRBH'
      LookupResultField = 'D_KRXM'
      KeyFields = 'D_KRBH'
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
      DisplayFormat = 'yyyy-mm-dd'
    end
    object qryKrzdD_JZSJ: TDateTimeField
      FieldName = 'D_JZSJ'
      Origin = 'LFHOTELUSER.KRZD.D_JZSJ'
      DisplayFormat = 'hh:nn:ss'
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
  object dsKrzd: TDataSource
    DataSet = qryKrzd
    Left = 48
    Top = 8
  end
end
