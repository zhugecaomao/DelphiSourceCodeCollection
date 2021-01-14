inherited KlszForm: TKlszForm
  Left = 186
  Top = 102
  VertScrollBar.Range = 0
  BorderStyle = bsDialog
  Caption = #21475#20196#35774#32622
  ClientHeight = 193
  ClientWidth = 264
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Width = 264
    inherited lblTitile: TLabel
      Left = 80
      Width = 125
      Caption = #21475#20196#35774#32622
    end
    inherited Image1: TImage
      Left = 42
    end
  end
  inherited Panel2: TPanel
    Width = 264
    Height = 116
    inherited Bevel1: TBevel
      Width = 254
      Height = 106
    end
    object edtOldPass: TLabeledEdit
      Left = 40
      Top = 32
      Width = 185
      Height = 20
      EditLabel.Width = 36
      EditLabel.Height = 12
      EditLabel.Caption = #26087#21475#20196
      LabelPosition = lpAbove
      LabelSpacing = 3
      PasswordChar = '*'
      TabOrder = 0
    end
    object edtNewPass: TLabeledEdit
      Left = 40
      Top = 76
      Width = 185
      Height = 20
      EditLabel.Width = 36
      EditLabel.Height = 12
      EditLabel.Caption = #26032#21475#20196
      LabelPosition = lpAbove
      LabelSpacing = 3
      PasswordChar = '*'
      TabOrder = 1
    end
  end
  inherited Panel3: TPanel
    Top = 158
    Width = 264
    inherited btnOK: TBitBtn
      Left = 104
      OnClick = btnOKClick
    end
    inherited btnCanc: TBitBtn
      Left = 184
    end
  end
  inherited DosMove1: TDosMove
    Left = 232
  end
  object tblYgda: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'YGDA'
    Left = 16
    Top = 8
  end
end
