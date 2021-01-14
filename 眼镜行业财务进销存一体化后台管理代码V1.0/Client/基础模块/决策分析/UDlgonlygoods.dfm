inherited DlgOnlyGoods: TDlgOnlyGoods
  Caption = #26597#35810#26465#20214
  ClientHeight = 263
  ClientWidth = 245
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 245
    Height = 233
    Align = alTop
    Caption = #35831#35774#32622#26597#35810#26465#20214
    TabOrder = 0
    object ckbnewDate: TCheckBox
      Left = 18
      Top = 211
      Width = 72
      Height = 17
      Caption = #38144#21806#24180#20221
      Checked = True
      State = cbChecked
      TabOrder = 0
      OnClick = ckbnewDateClick
    end
    object Cbstorage: TCheckBox
      Left = 18
      Top = 186
      Width = 72
      Height = 17
      Caption = #23384#25918#20179#24211
      TabOrder = 1
      OnClick = CbstorageClick
    end
    object cmbstorage: TComboBox
      Left = 100
      Top = 184
      Width = 128
      Height = 21
      Style = csDropDownList
      Color = cl3DLight
      ItemHeight = 13
      TabOrder = 2
    end
    object cmbyear: TComboBox
      Left = 100
      Top = 208
      Width = 128
      Height = 21
      ItemHeight = 13
      Sorted = True
      TabOrder = 3
      OnKeyPress = cmbyearKeyPress
      Items.Strings = (
        '2000'
        '2001'
        '2002'
        '2003'
        '2004'
        '2005'
        '2006'
        '2007'
        '2008'
        '2009'
        '2010'
        '2011')
    end
    object ckbCode: TCheckBox
      Left = 18
      Top = 162
      Width = 81
      Height = 17
      Caption = #21830#21697#32534#21495
      Checked = True
      State = cbChecked
      TabOrder = 4
      OnClick = ckbCodeClick
    end
    object edtCode: TEdit
      Left = 100
      Top = 160
      Width = 127
      Height = 21
      TabOrder = 5
    end
    object CBType: TComboBox
      Left = 101
      Top = 83
      Width = 124
      Height = 21
      Style = csDropDownList
      Color = cl3DLight
      ItemHeight = 13
      Sorted = True
      TabOrder = 6
      OnChange = CBTypeChange
    end
    object ckbtype: TCheckBox
      Left = 18
      Top = 84
      Width = 51
      Height = 17
      Caption = #31867#21035
      TabOrder = 7
      OnClick = ckbtypeClick
    end
    object cbBrand: TComboBox
      Left = 101
      Top = 109
      Width = 124
      Height = 21
      Style = csDropDownList
      Color = cl3DLight
      ItemHeight = 13
      Sorted = True
      TabOrder = 8
      OnChange = cbBrandChange
    end
    object ckbbrand: TCheckBox
      Left = 18
      Top = 111
      Width = 47
      Height = 17
      Caption = #21697#29260
      TabOrder = 9
      OnClick = ckbbrandClick
    end
    object CbBreed: TComboBox
      Left = 101
      Top = 135
      Width = 125
      Height = 21
      Style = csDropDownList
      Color = cl3DLight
      ItemHeight = 13
      Sorted = True
      TabOrder = 10
    end
    object ckbbreed: TCheckBox
      Left = 18
      Top = 136
      Width = 49
      Height = 17
      Caption = #21697#31181
      TabOrder = 11
      OnClick = ckbbreedClick
    end
    object RDg: TRadioGroup
      Left = 12
      Top = 16
      Width = 227
      Height = 62
      Caption = #21333#21697#31181#25110#21333#21830#21697
      ItemIndex = 1
      Items.Strings = (
        #21333#21697#31181
        #21333#21830#21697)
      TabOrder = 12
      OnClick = RDgClick
    end
  end
  object btnOk: TBitBtn
    Left = 95
    Top = 236
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 1
    OnClick = btnOkClick
    Kind = bkOK
  end
  object btnCancel: TBitBtn
    Left = 169
    Top = 236
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
    Top = 200
  end
end
