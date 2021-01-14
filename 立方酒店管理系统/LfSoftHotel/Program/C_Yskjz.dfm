inherited YskjzForm: TYskjzForm
  Width = 400
  Height = 400
  Caption = #32467#24080
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Width = 392
    Height = 80
    inherited lblTitile: TLabel
      Left = 131
      Width = 156
      Caption = #24212#25910#27454#32467#24080
    end
    inherited Image1: TImage
      Left = 87
    end
    object Label1: TLabel
      Left = 11
      Top = 56
      Width = 94
      Height = 19
      Caption = #23458#25143#21517#31216#65306
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = #26999#20307'_GB2312'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblKhmc: TLabel
      Left = 110
      Top = 56
      Width = 78
      Height = 19
      Caption = 'lblKhmc'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -19
      Font.Name = #26999#20307'_GB2312'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
    end
  end
  inherited Panel2: TPanel
    Top = 80
    Width = 392
    Height = 252
    inherited Bevel1: TBevel
      Width = 382
      Height = 242
    end
    object Label2: TLabel
      Left = 30
      Top = 24
      Width = 48
      Height = 12
      Caption = #32467#24080#26085#26399
    end
    object Label3: TLabel
      Left = 131
      Top = 24
      Width = 48
      Height = 12
      Caption = #32467#24080#26102#38388
    end
    object Label4: TLabel
      Left = 32
      Top = 176
      Width = 36
      Height = 12
      Caption = #35831#36873#25321
    end
    object edtJzrq: TMaskEdit
      Left = 30
      Top = 40
      Width = 97
      Height = 20
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
      Height = 20
      EditMask = '!90:00;1; '
      MaxLength = 5
      TabOrder = 1
      Text = '  :  '
      OnExit = edtJzsjExit
    end
    object radJzfs: TRadioGroup
      Left = 30
      Top = 80
      Width = 150
      Height = 84
      Caption = ' '#32467' '#24080' '#26041' '#24335' '
      ItemIndex = 0
      Items.Strings = (
        #20154#27665#24065
        #20449#29992#21345
        #25903#31080)
      TabOrder = 2
      OnClick = radJzfsClick
    end
    object cmbJz: TComboBox
      Left = 30
      Top = 191
      Width = 150
      Height = 20
      ItemHeight = 12
      TabOrder = 3
    end
  end
  inherited Panel3: TPanel
    Top = 332
    Width = 392
    inherited btnOK: TBitBtn
      Left = 232
      OnClick = btnOKClick
    end
    inherited btnCanc: TBitBtn
      Left = 312
    end
  end
  inherited DosMove1: TDosMove
    Left = 56
  end
end
