inherited YxjzForm: TYxjzForm
  Width = 430
  Height = 326
  ActiveControl = edtKfh
  Caption = #32467#24080
  Font.Name = 'System'
  Font.Style = [fsBold]
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited Panel1: TPanel
    Width = 422
    inherited lblTitile: TLabel
      Left = 151
      Width = 125
      Caption = #39044#20808#32467#24080
    end
    inherited Image1: TImage
      Left = 113
    end
  end
  inherited Panel2: TPanel
    Width = 422
    Height = 222
    inherited Bevel1: TBevel
      Width = 412
      Height = 212
    end
    object Label2: TLabel
      Left = 30
      Top = 16
      Width = 64
      Height = 16
      Caption = #32467#24080#26085#26399
    end
    object Label3: TLabel
      Left = 131
      Top = 16
      Width = 64
      Height = 16
      Caption = #32467#24080#26102#38388
    end
    object Label4: TLabel
      Left = 248
      Top = 112
      Width = 48
      Height = 16
      Caption = #35831#36873#25321
    end
    object Label1: TLabel
      Left = 132
      Top = 64
      Width = 64
      Height = 16
      Caption = #32467#24080#39033#30446
    end
    object edtJzrq: TMaskEdit
      Left = 30
      Top = 32
      Width = 100
      Height = 24
      EditMask = '!0000/99/99;1; '
      MaxLength = 10
      TabOrder = 0
      Text = '    -  -  '
      OnExit = edtJzrqExit
    end
    object edtJzsj: TMaskEdit
      Left = 131
      Top = 32
      Width = 100
      Height = 24
      EditMask = '!90:00;1; '
      MaxLength = 5
      TabOrder = 1
      Text = '  :  '
      OnExit = edtJzsjExit
    end
    object edtKfh: TLabeledEdit
      Left = 30
      Top = 80
      Width = 100
      Height = 24
      EditLabel.Width = 64
      EditLabel.Height = 16
      EditLabel.Caption = #32467#24080#23458#25151
      LabelPosition = lpAbove
      LabelSpacing = 3
      TabOrder = 2
      OnExit = edtKfhExit
      OnKeyPress = edtKfhKeyPress
    end
    object edtJzje: TLabeledEdit
      Left = 30
      Top = 127
      Width = 100
      Height = 24
      EditLabel.Width = 64
      EditLabel.Height = 16
      EditLabel.Caption = #32467#24080#37329#39069
      LabelPosition = lpAbove
      LabelSpacing = 3
      TabOrder = 4
      OnExit = edtJzjeExit
      OnKeyPress = edtKfhKeyPress
    end
    object radJzfs: TRadioGroup
      Left = 246
      Top = 16
      Width = 150
      Height = 84
      Caption = ' '#32467' '#24080' '#26041' '#24335' '
      ItemIndex = 0
      Items.Strings = (
        #20154#27665#24065
        #20449#29992#21345
        #25903#31080)
      TabOrder = 5
      OnClick = radJzfsClick
    end
    object cmbJz: TComboBox
      Left = 246
      Top = 127
      Width = 150
      Height = 24
      ItemHeight = 16
      TabOrder = 6
    end
    object edtTfje: TLabeledEdit
      Left = 296
      Top = 174
      Width = 100
      Height = 24
      EditLabel.Width = 64
      EditLabel.Height = 16
      EditLabel.Caption = #36864#20184#37329#39069
      Enabled = False
      LabelPosition = lpAbove
      LabelSpacing = 3
      TabOrder = 7
      Visible = False
      OnKeyPress = edtKfhKeyPress
    end
    object chkYjtf: TCheckBox
      Left = 203
      Top = 179
      Width = 86
      Height = 17
      Caption = #25276#37329#36864#20184
      TabOrder = 8
      Visible = False
      OnClick = chkYjtfClick
    end
    object edtFkfs: TLabeledEdit
      Left = 30
      Top = 176
      Width = 171
      Height = 24
      Color = clBtnFace
      EditLabel.Width = 64
      EditLabel.Height = 16
      EditLabel.Caption = #25276#37329#26041#24335
      LabelPosition = lpAbove
      LabelSpacing = 3
      ReadOnly = True
      TabOrder = 9
    end
    object cmbXfxm: TComboBox
      Left = 131
      Top = 80
      Width = 101
      Height = 24
      Style = csDropDownList
      ItemHeight = 16
      TabOrder = 3
      OnExit = cmbXfxmExit
    end
  end
  inherited Panel3: TPanel
    Top = 264
    Width = 422
    inherited btnOK: TBitBtn
      Left = 262
      OnClick = btnOKClick
    end
    inherited btnCanc: TBitBtn
      Left = 342
    end
  end
  inherited DosMove1: TDosMove
    Left = 56
  end
  object tblKrzd: TTable
    CachedUpdates = True
    DatabaseName = 'LfHotelUser'
    TableName = 'KRZD'
    Left = 296
    Top = 8
    object tblKrzdD_ZDBH: TStringField
      FieldName = 'D_ZDBH'
      Required = True
      Size = 12
    end
    object tblKrzdD_HH: TIntegerField
      FieldName = 'D_HH'
    end
    object tblKrzdD_ZDLB: TStringField
      FieldName = 'D_ZDLB'
      FixedChar = True
      Size = 1
    end
    object tblKrzdD_KRBH: TStringField
      FieldName = 'D_KRBH'
      Size = 12
    end
    object tblKrzdD_YJBH: TStringField
      FieldName = 'D_YJBH'
      Size = 12
    end
    object tblKrzdD_KFBH: TStringField
      FieldName = 'D_KFBH'
      Size = 5
    end
    object tblKrzdD_SJFJ: TFloatField
      FieldName = 'D_SJFJ'
    end
    object tblKrzdD_XMBH: TStringField
      FieldName = 'D_XMBH'
      Size = 5
    end
    object tblKrzdD_XFDJ: TFloatField
      FieldName = 'D_XFDJ'
    end
    object tblKrzdD_XFSL: TFloatField
      FieldName = 'D_XFSL'
    end
    object tblKrzdD_XFJE: TFloatField
      FieldName = 'D_XFJE'
    end
    object tblKrzdD_XFRQ: TDateTimeField
      FieldName = 'D_XFRQ'
    end
    object tblKrzdD_XFSJ: TDateTimeField
      FieldName = 'D_XFSJ'
    end
    object tblKrzdD_YHJE: TFloatField
      FieldName = 'D_YHJE'
    end
    object tblKrzdD_JZRQ: TDateTimeField
      FieldName = 'D_JZRQ'
    end
    object tblKrzdD_JZSJ: TDateTimeField
      FieldName = 'D_JZSJ'
    end
    object tblKrzdD_JZBZ: TStringField
      FieldName = 'D_JZBZ'
      FixedChar = True
      Size = 1
    end
    object tblKrzdD_JSBZ: TStringField
      FieldName = 'D_JSBZ'
      FixedChar = True
      Size = 1
    end
    object tblKrzdD_DLR1: TStringField
      FieldName = 'D_DLR1'
      Size = 8
    end
    object tblKrzdD_DLR2: TStringField
      FieldName = 'D_DLR2'
      Size = 8
    end
    object tblKrzdD_DLR3: TStringField
      FieldName = 'D_DLR3'
      Size = 8
    end
    object tblKrzdD_DLR4: TStringField
      FieldName = 'D_DLR4'
      Size = 8
    end
    object tblKrzdD_CZYXM: TStringField
      FieldName = 'D_CZYXM'
      Size = 8
    end
    object tblKrzdD_JZYXM: TStringField
      FieldName = 'D_JZYXM'
      Size = 8
    end
    object tblKrzdD_TYR: TStringField
      FieldName = 'D_TYR'
      Size = 8
    end
    object tblKrzdD_BZ: TStringField
      FieldName = 'D_BZ'
      Size = 30
    end
    object tblKrzdD_YSRQ: TStringField
      FieldName = 'D_YSRQ'
      Size = 8
    end
    object tblKrzdD_JZBH: TStringField
      FieldName = 'D_JZBH'
      Size = 12
    end
    object tblKrzdD_BMBH: TStringField
      FieldName = 'D_BMBH'
      Size = 5
    end
  end
  object tblKrjz: TTable
    CachedUpdates = True
    DatabaseName = 'LfHotelUser'
    TableName = 'KRJZ'
    Left = 328
    Top = 8
    object tblKrjzD_JZBH: TStringField
      FieldName = 'D_JZBH'
      Required = True
      Size = 12
    end
    object tblKrjzD_HH: TIntegerField
      FieldName = 'D_HH'
    end
    object tblKrjzD_XMBH: TStringField
      FieldName = 'D_XMBH'
      Size = 5
    end
    object tblKrjzD_XFDJ: TFloatField
      FieldName = 'D_XFDJ'
    end
    object tblKrjzD_XFSL: TFloatField
      FieldName = 'D_XFSL'
    end
    object tblKrjzD_XFGG: TStringField
      FieldName = 'D_XFGG'
      Size = 5
    end
    object tblKrjzD_XFJE: TFloatField
      FieldName = 'D_XFJE'
    end
    object tblKrjzD_YJJE: TFloatField
      FieldName = 'D_YJJE'
    end
    object tblKrjzD_YHJE: TFloatField
      FieldName = 'D_YHJE'
    end
    object tblKrjzD_JZFS: TStringField
      FieldName = 'D_JZFS'
      Size = 10
    end
    object tblKrjzD_JZLX: TStringField
      FieldName = 'D_JZLX'
      FixedChar = True
      Size = 1
    end
    object tblKrjzD_KHBH: TStringField
      FieldName = 'D_KHBH'
      Size = 5
    end
    object tblKrjzD_XYKBH: TStringField
      FieldName = 'D_XYKBH'
      Size = 5
    end
    object tblKrjzD_JZRQ: TDateTimeField
      FieldName = 'D_JZRQ'
    end
    object tblKrjzD_JZSJ: TDateTimeField
      FieldName = 'D_JZSJ'
    end
    object tblKrjzD_CZYXM: TStringField
      FieldName = 'D_CZYXM'
      Size = 8
    end
    object tblKrjzD_BZ: TStringField
      FieldName = 'D_BZ'
      Size = 30
    end
    object tblKrjzD_YSRQ: TStringField
      FieldName = 'D_YSRQ'
      Size = 8
    end
    object tblKrjzD_BMBH: TStringField
      FieldName = 'D_BMBH'
      Size = 5
    end
  end
  object tblKryj: TTable
    CachedUpdates = True
    DatabaseName = 'LfHotelUser'
    TableName = 'KRYJ'
    Left = 360
    Top = 8
  end
end
