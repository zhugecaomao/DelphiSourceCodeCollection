inherited SkqxForm: TSkqxForm
  Width = 299
  Height = 231
  ActiveControl = edtKfh
  Caption = #25509#24453
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 12
  inherited Panel1: TPanel
    Width = 291
    inherited lblTitile: TLabel
      Left = 84
      Width = 125
      Caption = #25955#23458#21462#28040
    end
    inherited Image1: TImage
      Left = 53
    end
  end
  inherited Panel2: TPanel
    Width = 291
    Height = 127
    Font.Name = 'System'
    Font.Style = [fsBold]
    ParentFont = False
    inherited Bevel1: TBevel
      Width = 281
      Height = 117
    end
    object lblKrxm: TLabel
      Left = 120
      Top = 22
      Width = 64
      Height = 16
      Caption = #23458#20154#22995#21517
    end
    object edtKfh: TLabeledEdit
      Left = 22
      Top = 40
      Width = 91
      Height = 24
      EditLabel.Width = 64
      EditLabel.Height = 16
      EditLabel.Caption = #21462#28040#23458#25151
      LabelPosition = lpAbove
      LabelSpacing = 3
      TabOrder = 0
      OnExit = edtKfhExit
    end
    object edtFkfs: TLabeledEdit
      Left = 22
      Top = 88
      Width = 251
      Height = 24
      Color = clBtnFace
      EditLabel.Width = 64
      EditLabel.Height = 16
      EditLabel.Caption = #25276#37329#26041#24335
      LabelPosition = lpAbove
      LabelSpacing = 3
      ReadOnly = True
      TabOrder = 2
    end
    object Edit1: TEdit
      Left = 120
      Top = 40
      Width = 153
      Height = 24
      ReadOnly = True
      TabOrder = 1
    end
  end
  inherited Panel3: TPanel
    Top = 169
    Width = 291
    inherited btnOK: TBitBtn
      Left = 131
      OnClick = btnOKClick
    end
    inherited btnCanc: TBitBtn
      Left = 211
    end
  end
  inherited DosMove1: TDosMove
    Left = 8
  end
  object tblBqj: TTable
    DatabaseName = 'LfHotelUser'
    TableName = 'BQJ'
    Left = 208
    Top = 8
  end
end
