inherited dlgGoodsSale: TdlgGoodsSale
  Left = 241
  Top = 234
  Caption = #26597#35810#26465#20214
  ClientHeight = 196
  ClientWidth = 240
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 240
    Height = 171
    Align = alTop
    Caption = #35831#35774#32622#26597#35810#26465#20214
    TabOrder = 0
    object Label3: TLabel
      Left = 224
      Top = 83
      Width = 13
      Height = 13
      Caption = #36215
    end
    object Label8: TLabel
      Left = 224
      Top = 107
      Width = 13
      Height = 13
      Caption = #27490
    end
    object ckbnewDate: TCheckBox
      Left = 10
      Top = 83
      Width = 72
      Height = 17
      Caption = #38144#21806#26085#26399
      Checked = True
      State = cbChecked
      TabOrder = 0
      OnClick = ckbnewDateClick
    end
    object dtpBegin: TDateTimePicker
      Left = 92
      Top = 79
      Width = 130
      Height = 21
      CalAlignment = dtaLeft
      Date = 37921.4816629977
      Time = 37921.4816629977
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 1
    end
    object dtpEnd: TDateTimePicker
      Left = 92
      Top = 103
      Width = 130
      Height = 21
      CalAlignment = dtaLeft
      Date = 37921.4816629977
      Time = 37921.4816629977
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 2
    end
    object Rbt: TRadioButton
      Left = 130
      Top = 133
      Width = 102
      Height = 17
      Caption = #21463#24433#21709#21830#21697
      Checked = True
      TabOrder = 3
      TabStop = True
    end
    object rball: TRadioButton
      Left = 10
      Top = 131
      Width = 79
      Height = 17
      Caption = #25152#26377#21830#21697
      TabOrder = 4
    end
    object Cbstorage: TCheckBox
      Left = 10
      Top = 58
      Width = 72
      Height = 17
      Caption = #19979#23646#20179#24211
      TabOrder = 5
      OnClick = CbstorageClick
    end
    object cmbstorage: TComboBox
      Left = 93
      Top = 56
      Width = 128
      Height = 21
      Style = csDropDownList
      Color = cl3DLight
      ItemHeight = 13
      TabOrder = 6
    end
    object cbmstorage: TCheckBox
      Left = 10
      Top = 34
      Width = 72
      Height = 17
      Caption = #22320#21306#20179#24211
      TabOrder = 7
      OnClick = cbmstorageClick
    end
    object cmbmstorage: TComboBox
      Left = 93
      Top = 32
      Width = 128
      Height = 21
      Style = csDropDownList
      Color = cl3DLight
      ItemHeight = 13
      TabOrder = 8
      OnChange = cmbmstorageChange
    end
  end
  object btnOk: TBitBtn
    Left = 91
    Top = 172
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 1
    OnClick = btnOkClick
    Kind = bkOK
  end
  object btnCancel: TBitBtn
    Left = 165
    Top = 172
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 2
    OnClick = btnCancelClick
    Kind = bkCancel
  end
  object cdspart: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 40
    Top = 144
  end
end
