inherited frmselect: Tfrmselect
  Left = 334
  Top = 95
  Caption = #20837#24211#21333#26597#35810
  ClientHeight = 215
  ClientWidth = 264
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited spbexit: TSpeedButton
    Left = 480
    Visible = False
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 264
    Height = 185
    Align = alTop
    Caption = #35831#35774#32622#26597#35810#26465#20214
    TabOrder = 0
    object Label3: TLabel
      Left = 242
      Top = 124
      Width = 13
      Height = 13
      Caption = #36215
    end
    object Label8: TLabel
      Left = 242
      Top = 149
      Width = 13
      Height = 13
      Caption = #27490
    end
    object ckbCode: TCheckBox
      Left = 25
      Top = 24
      Width = 81
      Height = 17
      Caption = #20837#24211#21333#21495
      TabOrder = 0
      OnClick = ckbCodeClick
    end
    object edtCode: TEdit
      Left = 106
      Top = 22
      Width = 150
      Height = 21
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 1
    end
    object ckbName: TCheckBox
      Left = 25
      Top = 48
      Width = 72
      Height = 17
      Caption = #32463#25163#20154
      TabOrder = 2
      OnClick = ckbNameClick
    end
    object edtName: TEdit
      Left = 106
      Top = 45
      Width = 150
      Height = 21
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 3
    end
    object ckbzdr: TCheckBox
      Left = 25
      Top = 72
      Width = 82
      Height = 17
      Caption = #21046#21333#20154
      TabOrder = 4
      OnClick = ckbzdrClick
    end
    object ckbstock: TCheckBox
      Left = 25
      Top = 96
      Width = 74
      Height = 17
      Caption = #25910#36135#20179#24211
      TabOrder = 5
      OnClick = ckbstockClick
    end
    object edtstock: TEdit
      Left = 106
      Top = 93
      Width = 151
      Height = 21
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 6
    end
    object edtzdr: TEdit
      Left = 106
      Top = 68
      Width = 151
      Height = 21
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 7
    end
    object ckbDate: TCheckBox
      Left = 25
      Top = 121
      Width = 72
      Height = 17
      Caption = #24405#21333#26085#26399
      TabOrder = 8
      OnClick = ckbDateClick
    end
    object dtpBegin: TDateTimePicker
      Left = 106
      Top = 121
      Width = 130
      Height = 21
      CalAlignment = dtaLeft
      Date = 37921.4816629977
      Time = 37921.4816629977
      Color = cl3DLight
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 9
    end
    object dtpEnd: TDateTimePicker
      Left = 106
      Top = 146
      Width = 130
      Height = 21
      CalAlignment = dtaLeft
      Date = 37921.4816629977
      Time = 37921.4816629977
      Color = cl3DLight
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 10
    end
  end
  object btnOk: TBitBtn
    Left = 111
    Top = 187
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 1
    OnClick = btnOkClick
    Kind = bkOK
  end
  object btnCancel: TBitBtn
    Left = 188
    Top = 187
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 2
    Kind = bkCancel
  end
end
