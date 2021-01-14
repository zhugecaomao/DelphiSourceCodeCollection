inherited YxjzTdForm: TYxjzTdForm
  Width = 375
  Height = 388
  ActiveControl = cmbXfxm
  Caption = #32467#24080
  Font.Name = 'System'
  Font.Style = [fsBold]
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited Panel1: TPanel
    Width = 367
    inherited lblTitile: TLabel
      Left = 122
      Width = 125
      Caption = #39044#20808#32467#24080
    end
    inherited Image1: TImage
      Left = 89
    end
  end
  inherited Panel2: TPanel
    Width = 367
    Height = 284
    inherited Bevel1: TBevel
      Width = 357
      Height = 274
    end
    object Label2: TLabel
      Left = 30
      Top = 64
      Width = 64
      Height = 16
      Caption = #32467#24080#26085#26399
    end
    object Label3: TLabel
      Left = 131
      Top = 64
      Width = 64
      Height = 16
      Caption = #32467#24080#26102#38388
    end
    object Label4: TLabel
      Left = 32
      Top = 228
      Width = 48
      Height = 16
      Caption = #35831#36873#25321
    end
    object Label1: TLabel
      Left = 30
      Top = 112
      Width = 64
      Height = 16
      Caption = #32467#24080#39033#30446
    end
    object edtJzrq: TMaskEdit
      Left = 30
      Top = 80
      Width = 99
      Height = 24
      EditMask = '!0000/99/99;1; '
      MaxLength = 10
      TabOrder = 1
      Text = '    -  -  '
      OnExit = edtJzrqExit
    end
    object edtJzsj: TMaskEdit
      Left = 131
      Top = 80
      Width = 100
      Height = 24
      EditMask = '!90:00;1; '
      MaxLength = 5
      TabOrder = 2
      Text = '  :  '
      OnExit = edtJzsjExit
    end
    object edtJzje: TLabeledEdit
      Left = 131
      Top = 128
      Width = 100
      Height = 24
      EditLabel.Width = 64
      EditLabel.Height = 16
      EditLabel.Caption = #32467#24080#37329#39069
      LabelPosition = lpAbove
      LabelSpacing = 3
      TabOrder = 4
      OnExit = edtJzjeExit
      OnKeyPress = edtJzjeKeyPress
    end
    object radJzfs: TRadioGroup
      Left = 30
      Top = 168
      Width = 303
      Height = 49
      Caption = ' '#32467' '#24080' '#26041' '#24335' '
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        #20154#27665#24065
        #20449#29992#21345
        #25903#31080)
      TabOrder = 5
      OnClick = radJzfsClick
    end
    object cmbJz: TComboBox
      Left = 30
      Top = 247
      Width = 303
      Height = 24
      ItemHeight = 16
      TabOrder = 6
    end
    object edtTdmc: TLabeledEdit
      Left = 30
      Top = 32
      Width = 303
      Height = 24
      EditLabel.Width = 64
      EditLabel.Height = 16
      EditLabel.Caption = #22242#38431#21517#31216
      LabelPosition = lpAbove
      LabelSpacing = 3
      ReadOnly = True
      TabOrder = 0
    end
    object cmbXfxm: TComboBox
      Left = 29
      Top = 128
      Width = 101
      Height = 24
      Style = csDropDownList
      ItemHeight = 16
      TabOrder = 3
      OnExit = cmbXfxmExit
    end
  end
  inherited Panel3: TPanel
    Top = 326
    Width = 367
    inherited btnOK: TBitBtn
      Left = 207
      OnClick = btnOKClick
    end
    inherited btnCanc: TBitBtn
      Left = 287
    end
  end
  inherited DosMove1: TDosMove
    Left = 64
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
end
