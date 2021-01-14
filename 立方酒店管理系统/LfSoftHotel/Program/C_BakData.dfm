inherited BakDataForm: TBakDataForm
  Width = 404
  Height = 228
  Caption = #31995#32479
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Width = 396
    inherited lblTitile: TLabel
      Left = 137
      Width = 125
      Caption = #25968#25454#22791#20221
    end
    inherited Image1: TImage
      Left = 96
    end
  end
  inherited Panel2: TPanel
    Width = 396
    Height = 124
    inherited Bevel1: TBevel
      Width = 386
      Height = 114
    end
    object SpeedButton1: TSpeedButton
      Left = 360
      Top = 32
      Width = 23
      Height = 22
      Caption = '...'
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 360
      Top = 72
      Width = 23
      Height = 22
      Caption = '...'
      OnClick = SpeedButton2Click
    end
    object edtSdir: TLabeledEdit
      Left = 16
      Top = 32
      Width = 345
      Height = 20
      EditLabel.Width = 72
      EditLabel.Height = 12
      EditLabel.Caption = #25968#25454#24211#28304#36335#24452
      LabelPosition = lpAbove
      LabelSpacing = 3
      TabOrder = 0
    end
    object edtDdir: TLabeledEdit
      Left = 16
      Top = 72
      Width = 345
      Height = 20
      EditLabel.Width = 84
      EditLabel.Height = 12
      EditLabel.Caption = #25968#25454#24211#30446#30340#36335#24452
      LabelPosition = lpAbove
      LabelSpacing = 3
      TabOrder = 1
    end
  end
  inherited Panel3: TPanel
    Top = 166
    Width = 396
    inherited btnOK: TBitBtn
      Left = 236
      OnClick = btnOKClick
    end
    inherited btnCanc: TBitBtn
      Left = 316
    end
  end
  inherited DosMove1: TDosMove
    Left = 16
  end
end
