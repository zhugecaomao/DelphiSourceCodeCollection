inherited SkyjbgForm: TSkyjbgForm
  Left = 211
  Top = 111
  Width = 450
  Height = 317
  ActiveControl = edtKfh
  Caption = #32467#24080
  Font.Name = 'System'
  Font.Style = [fsBold]
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited Panel2: TPanel [0]
    Width = 442
    Height = 213
    inherited Bevel1: TBevel
      Width = 432
      Height = 203
    end
    object Label2: TLabel
      Left = 14
      Top = 64
      Width = 64
      Height = 16
      Caption = #21464#26356#26085#26399
    end
    object Label3: TLabel
      Left = 115
      Top = 64
      Width = 64
      Height = 16
      Caption = #21464#26356#26102#38388
    end
    object Label4: TLabel
      Left = 224
      Top = 110
      Width = 48
      Height = 16
      Caption = #35831#36873#25321
    end
    object edtJzrq: TMaskEdit
      Left = 14
      Top = 80
      Width = 98
      Height = 24
      EditMask = '!0000/99/99;1; '
      MaxLength = 10
      TabOrder = 1
      Text = '    -  -  '
      OnExit = edtJzrqExit
    end
    object edtJzsj: TMaskEdit
      Left = 115
      Top = 80
      Width = 100
      Height = 24
      EditMask = '!90:00;1; '
      MaxLength = 5
      TabOrder = 2
      Text = '  :  '
      OnExit = edtJzsjExit
    end
    object radJzfs: TRadioGroup
      Left = 222
      Top = 18
      Width = 203
      Height = 71
      Caption = ' '#39044' '#20184' '#26041' '#24335' '
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #20154#27665#24065
        #20449#29992#21345
        #25903#31080
        #35760#24080)
      TabOrder = 3
      OnClick = radJzfsClick
    end
    object cmbJz: TComboBox
      Left = 222
      Top = 127
      Width = 203
      Height = 24
      ItemHeight = 16
      TabOrder = 5
    end
    object edtKfh: TLabeledEdit
      Left = 14
      Top = 32
      Width = 203
      Height = 24
      EditLabel.Width = 48
      EditLabel.Height = 16
      EditLabel.Caption = #23458#25151#21495
      LabelPosition = lpAbove
      LabelSpacing = 3
      TabOrder = 0
      OnExit = edtKfhExit
      OnKeyPress = edtKfhKeyPress
    end
    object edtFkfs: TLabeledEdit
      Left = 14
      Top = 176
      Width = 411
      Height = 24
      Color = clBtnFace
      EditLabel.Width = 80
      EditLabel.Height = 16
      EditLabel.Caption = #21407#25276#37329#26041#24335
      LabelPosition = lpAbove
      LabelSpacing = 3
      ReadOnly = True
      TabOrder = 6
    end
    object edtYfje: TLabeledEdit
      Left = 16
      Top = 128
      Width = 201
      Height = 24
      EditLabel.Width = 64
      EditLabel.Height = 16
      EditLabel.Caption = #39044#20184#37329#39069
      LabelPosition = lpAbove
      LabelSpacing = 3
      TabOrder = 4
      OnExit = edtYfjeExit
      OnKeyPress = edtKfhKeyPress
    end
    object edtTdmc: TLabeledEdit
      Left = 14
      Top = 32
      Width = 203
      Height = 24
      EditLabel.Width = 64
      EditLabel.Height = 16
      EditLabel.Caption = #22242#38431#21517#31216
      LabelPosition = lpAbove
      LabelSpacing = 3
      ReadOnly = True
      TabOrder = 7
      Visible = False
    end
  end
  inherited Panel1: TPanel [1]
    Width = 442
    inherited lblTitile: TLabel
      Left = 140
      Width = 187
      Caption = #25276#37329#26041#24335#21464#26356
    end
    inherited Image1: TImage
      Left = 98
    end
  end
  inherited Panel3: TPanel
    Top = 255
    Width = 442
    inherited btnOK: TBitBtn
      Left = 282
      OnClick = btnOKClick
    end
    inherited btnCanc: TBitBtn
      Left = 362
    end
  end
  inherited DosMove1: TDosMove
    Left = 40
  end
  object tblKryj: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'KRYJ'
    Left = 344
    Top = 8
    object tblKryjD_YJBH: TStringField
      FieldName = 'D_YJBH'
      Required = True
      Size = 12
    end
    object tblKryjD_HH: TIntegerField
      FieldName = 'D_HH'
    end
    object tblKryjD_FKFS: TStringField
      FieldName = 'D_FKFS'
      Size = 10
    end
    object tblKryjD_XYKBH: TStringField
      FieldName = 'D_XYKBH'
      Size = 5
    end
    object tblKryjD_KHBH: TStringField
      FieldName = 'D_KHBH'
      Size = 5
    end
    object tblKryjD_YFJE: TFloatField
      FieldName = 'D_YFJE'
    end
    object tblKryjD_YFRQ: TDateTimeField
      FieldName = 'D_YFRQ'
    end
    object tblKryjD_YFSJ: TDateTimeField
      FieldName = 'D_YFSJ'
    end
    object tblKryjD_BZ: TStringField
      FieldName = 'D_BZ'
      Size = 30
    end
  end
end
