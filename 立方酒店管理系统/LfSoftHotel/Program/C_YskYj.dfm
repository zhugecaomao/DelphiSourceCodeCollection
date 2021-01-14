inherited YskyjForm: TYskyjForm
  Width = 400
  Height = 332
  Caption = #32467#24080
  Font.Name = 'System'
  Font.Style = [fsBold]
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited Panel1: TPanel
    Width = 392
    Height = 85
    inherited lblTitile: TLabel
      Left = 155
      Width = 94
      Caption = #39044#20132#27454
    end
    inherited Image1: TImage
      Left = 120
    end
    object edtKhmc: TLabeledEdit
      Left = 8
      Top = 56
      Width = 377
      Height = 24
      EditLabel.Width = 64
      EditLabel.Height = 16
      EditLabel.Caption = #23458#25143#21517#31216
      LabelPosition = lpAbove
      LabelSpacing = 3
      ReadOnly = True
      TabOrder = 0
    end
  end
  inherited Panel2: TPanel
    Top = 85
    Width = 392
    Height = 185
    inherited Bevel1: TBevel
      Width = 382
      Height = 175
    end
    object Label2: TLabel
      Left = 30
      Top = 22
      Width = 64
      Height = 16
      Caption = #32467#24080#26085#26399
    end
    object Label3: TLabel
      Left = 131
      Top = 22
      Width = 64
      Height = 16
      Caption = #32467#24080#26102#38388
    end
    object Label4: TLabel
      Left = 32
      Top = 128
      Width = 48
      Height = 16
      Caption = #35831#36873#25321
    end
    object edtJzrq: TMaskEdit
      Left = 30
      Top = 40
      Width = 98
      Height = 24
      EditMask = '!0000/99/99;1; '
      MaxLength = 10
      TabOrder = 0
      Text = '    -  -  '
      OnExit = edtJzrqExit
    end
    object edtJzsj: TMaskEdit
      Left = 131
      Top = 40
      Width = 100
      Height = 24
      EditMask = '!90:00;1; '
      MaxLength = 5
      TabOrder = 1
      Text = '  :  '
      OnExit = edtJzsjExit
    end
    object edtJzje: TLabeledEdit
      Left = 233
      Top = 40
      Width = 100
      Height = 24
      EditLabel.Width = 64
      EditLabel.Height = 16
      EditLabel.Caption = #32467#24080#37329#39069
      LabelPosition = lpAbove
      LabelSpacing = 3
      TabOrder = 2
      OnExit = edtJzjeExit
      OnKeyPress = edtJzjeKeyPress
    end
    object radJzfs: TRadioGroup
      Left = 30
      Top = 72
      Width = 307
      Height = 49
      Caption = ' '#32467' '#24080' '#26041' '#24335' '
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        #20154#27665#24065
        #20449#29992#21345
        #25903#31080)
      TabOrder = 3
      OnClick = radJzfsClick
    end
    object cmbJz: TComboBox
      Left = 30
      Top = 143
      Width = 307
      Height = 24
      ItemHeight = 16
      TabOrder = 4
    end
  end
  inherited Panel3: TPanel
    Top = 270
    Width = 392
    inherited btnOK: TBitBtn
      Left = 232
      OnClick = btnOKClick
    end
    inherited btnCanc: TBitBtn
      Left = 312
    end
  end
  object tblYsk: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'YSK'
    Left = 16
    Top = 16
  end
  object tblKrjz: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'KRJZ'
    Left = 48
    Top = 16
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
