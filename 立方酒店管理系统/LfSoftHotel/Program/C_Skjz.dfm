inherited SkjzForm: TSkjzForm
  Left = 229
  Top = 98
  Width = 500
  Height = 376
  Caption = #32467#24080
  Font.Name = 'System'
  Font.Style = [fsBold]
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited Panel2: TPanel [0]
    Width = 492
    Height = 272
    inherited Bevel1: TBevel
      Width = 482
      Height = 262
    end
    object Label1: TLabel
      Left = 16
      Top = 64
      Width = 128
      Height = 16
      Caption = #38656#32467#24080#30340#23458#25151#21015#34920
    end
    object Label2: TLabel
      Left = 270
      Top = 16
      Width = 64
      Height = 16
      Caption = #32467#24080#26085#26399
    end
    object Label3: TLabel
      Left = 371
      Top = 16
      Width = 64
      Height = 16
      Caption = #32467#24080#26102#38388
    end
    object Bevel2: TBevel
      Left = 240
      Top = 7
      Width = 9
      Height = 258
      Shape = bsLeftLine
    end
    object Label4: TLabel
      Left = 272
      Top = 195
      Width = 48
      Height = 16
      Caption = #35831#36873#25321
    end
    object edtKfh: TLabeledEdit
      Left = 16
      Top = 32
      Width = 121
      Height = 24
      EditLabel.Width = 64
      EditLabel.Height = 16
      EditLabel.Caption = #32467#24080#23458#25151
      LabelPosition = lpAbove
      LabelSpacing = 3
      TabOrder = 0
    end
    object btnInsert: TBitBtn
      Left = 143
      Top = 28
      Width = 75
      Height = 25
      Caption = #28155#21152
      TabOrder = 1
      OnClick = btnInsertClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333333333FFFFFFFFF333333000000000033333377777777773333330FFFFF
        FFF03333337F333333373333330FFFFFFFF03333337F3FF3FFF73333330F00F0
        00F03333F37F773777373330330FFFFFFFF03337FF7F3F3FF3F73339030F0800
        F0F033377F7F737737373339900FFFFFFFF03FF7777F3FF3FFF70999990F00F0
        00007777777F7737777709999990FFF0FF0377777777FF37F3730999999908F0
        F033777777777337F73309999990FFF0033377777777FFF77333099999000000
        3333777777777777333333399033333333333337773333333333333903333333
        3333333773333333333333303333333333333337333333333333}
      NumGlyphs = 2
    end
    object ListBox1: TListBox
      Left = 16
      Top = 80
      Width = 73
      Height = 177
      ItemHeight = 16
      TabOrder = 2
    end
    object edtJzrq: TMaskEdit
      Left = 270
      Top = 32
      Width = 100
      Height = 24
      EditMask = '!0000/99/99;1; '
      MaxLength = 10
      TabOrder = 3
      Text = '    -  -  '
      OnExit = edtJzrqExit
    end
    object edtJzsj: TMaskEdit
      Left = 371
      Top = 32
      Width = 100
      Height = 24
      EditMask = '!90:00;1; '
      MaxLength = 5
      TabOrder = 4
      Text = '  :  '
      OnExit = edtJzsjExit
    end
    object radJzfs: TRadioGroup
      Left = 270
      Top = 74
      Width = 203
      Height = 105
      Caption = ' '#32467' '#24080' '#26041' '#24335' '
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #20154#27665#24065
        #20449#29992#21345
        #25903#31080
        #35760#24080
        #25346#25955#23458
        #25346#22242#38431
        #26410#32467#24080
        #36149#23486#21345)
      TabOrder = 5
      OnClick = radJzfsClick
    end
    object cmbJz: TComboBox
      Left = 270
      Top = 212
      Width = 203
      Height = 24
      AutoDropDown = True
      ItemHeight = 16
      Sorted = True
      TabOrder = 6
      OnDblClick = cmbJzDblClick
    end
    object chkYjtf: TCheckBox
      Left = 270
      Top = 240
      Width = 97
      Height = 17
      Caption = #25276#37329#36864#20184
      Checked = True
      State = cbChecked
      TabOrder = 7
      Visible = False
      OnClick = chkYjtfClick
    end
    object ListBox2: TListBox
      Left = 88
      Top = 80
      Width = 139
      Height = 177
      ItemHeight = 16
      TabOrder = 8
    end
  end
  inherited Panel1: TPanel [1]
    Width = 492
    inherited lblTitile: TLabel
      Width = 125
      Caption = #25955#23458#32467#24080
    end
    inherited Image1: TImage
      Left = 146
    end
  end
  inherited Panel3: TPanel
    Top = 314
    Width = 492
    inherited btnOK: TBitBtn
      Left = 332
      OnClick = btnOKClick
    end
    inherited btnCanc: TBitBtn
      Left = 411
    end
  end
  object tblKfzt: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'KFZT'
    Left = 360
    Top = 8
  end
  object tblKrxx: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'KRXX'
    Left = 400
    Top = 8
  end
end
