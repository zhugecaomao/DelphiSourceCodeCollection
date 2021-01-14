inherited TdjzForm: TTdjzForm
  Width = 267
  Height = 299
  Caption = #32467#24080
  Font.Name = 'System'
  Font.Style = [fsBold]
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited Panel1: TPanel
    Width = 259
    inherited lblTitile: TLabel
      Left = 80
      Width = 125
      Caption = #22242#38431#32467#24080
    end
    inherited Image1: TImage
      Left = 44
    end
  end
  inherited Panel2: TPanel
    Width = 259
    Height = 195
    inherited Bevel1: TBevel
      Width = 249
      Height = 185
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
      Left = 32
      Top = 139
      Width = 48
      Height = 16
      Caption = #35831#36873#25321
    end
    object edtJzrq: TMaskEdit
      Left = 30
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
    object radJzfs: TRadioGroup
      Left = 30
      Top = 58
      Width = 203
      Height = 71
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
      Left = 30
      Top = 156
      Width = 203
      Height = 24
      ItemHeight = 16
      TabOrder = 3
      OnDblClick = cmbJzDblClick
    end
  end
  inherited Panel3: TPanel
    Top = 237
    Width = 259
    inherited btnOK: TBitBtn
      Left = 99
      OnClick = btnOKClick
    end
    inherited btnCanc: TBitBtn
      Left = 179
    end
  end
  inherited DosMove1: TDosMove
    Left = 56
  end
end
