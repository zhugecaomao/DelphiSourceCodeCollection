inherited fmguestset: Tfmguestset
  Left = 250
  Top = 210
  Caption = #29992#25143#31649#29702
  ClientHeight = 172
  ClientWidth = 382
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 378
    Height = 137
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 26
      Width = 52
      Height = 13
      Caption = #37096#38376#32534#21495
    end
    object Label2: TLabel
      Left = 16
      Top = 58
      Width = 52
      Height = 13
      Caption = #29992#25143#32534#21495
    end
    object Label3: TLabel
      Left = 16
      Top = 85
      Width = 52
      Height = 13
      Caption = #25805#20316#31867#22411
    end
    object Label4: TLabel
      Left = 184
      Top = 58
      Width = 52
      Height = 13
      Caption = #29992#25143#22995#21517
    end
    object cmbpart: TComboBox
      Left = 72
      Top = 23
      Width = 126
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      OnChange = cmbpartChange
    end
    object cmbno: TComboBox
      Left = 72
      Top = 55
      Width = 100
      Height = 21
      ItemHeight = 13
      TabOrder = 1
      OnChange = cmbnoChange
    end
    object cmbtype: TComboBox
      Left = 72
      Top = 82
      Width = 100
      Height = 21
      ItemHeight = 13
      TabOrder = 2
    end
    object edtpwd: TLabeledEdit
      Left = 241
      Top = 82
      Width = 121
      Height = 21
      EditLabel.Width = 52
      EditLabel.Height = 13
      EditLabel.Caption = #30331#38470#23494#30721
      LabelPosition = lpLeft
      LabelSpacing = 3
      PasswordChar = '*'
      TabOrder = 3
    end
    object cmbname: TComboBox
      Left = 240
      Top = 54
      Width = 123
      Height = 21
      Enabled = False
      ItemHeight = 13
      TabOrder = 4
      OnChange = cmbnoChange
    end
  end
  object btnOk: TBitBtn
    Left = 230
    Top = 144
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 1
    OnClick = btnOkClick
    Kind = bkOK
  end
  object btnCancel: TBitBtn
    Left = 304
    Top = 144
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 2
    OnClick = btnCancelClick
    Kind = bkCancel
  end
end
