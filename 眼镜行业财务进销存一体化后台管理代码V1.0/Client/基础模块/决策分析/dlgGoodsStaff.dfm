inherited dlgGoodsStaffS: TdlgGoodsStaffS
  Left = 331
  Top = 184
  Caption = #26597#35810#26465#20214
  ClientHeight = 309
  ClientWidth = 248
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 248
    Height = 281
    Align = alTop
    Caption = #35831#35774#32622#26597#35810#26465#20214
    TabOrder = 0
    object Label3: TLabel
      Left = 224
      Top = 197
      Width = 13
      Height = 13
      Caption = #36215
    end
    object Label8: TLabel
      Left = 224
      Top = 221
      Width = 13
      Height = 13
      Caption = #27490
    end
    object ckbCode: TCheckBox
      Left = 10
      Top = 24
      Width = 81
      Height = 17
      Caption = #21830#21697#32534#21495
      TabOrder = 0
      OnClick = ckbCodeClick
    end
    object edtCode: TEdit
      Left = 91
      Top = 22
      Width = 150
      Height = 21
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 1
    end
    object ckbName: TCheckBox
      Left = 10
      Top = 48
      Width = 72
      Height = 17
      Caption = #21830#21697#21517#31216
      TabOrder = 2
      OnClick = ckbNameClick
    end
    object edtName: TEdit
      Left = 91
      Top = 45
      Width = 150
      Height = 21
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 3
    end
    object ckbtype: TCheckBox
      Left = 10
      Top = 72
      Width = 82
      Height = 17
      Caption = #31867#21035
      TabOrder = 4
      OnClick = ckbtypeClick
    end
    object ckbbrand: TCheckBox
      Left = 10
      Top = 96
      Width = 74
      Height = 17
      Caption = #21697#29260
      TabOrder = 5
      OnClick = ckbbrandClick
    end
    object edtbrand: TEdit
      Left = 91
      Top = 93
      Width = 151
      Height = 21
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 6
    end
    object edttype: TEdit
      Left = 91
      Top = 68
      Width = 151
      Height = 21
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 7
    end
    object Cbbreed: TCheckBox
      Left = 10
      Top = 121
      Width = 74
      Height = 17
      Caption = #21697#31181
      TabOrder = 8
      OnClick = CbbreedClick
    end
    object Edtbreed: TEdit
      Left = 91
      Top = 118
      Width = 151
      Height = 21
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 9
    end
    object Cbstorage: TCheckBox
      Left = 10
      Top = 143
      Width = 74
      Height = 17
      Caption = #20179#24211#32534#21495
      TabOrder = 10
      OnClick = CbstorageClick
    end
    object Edtstorage: TEdit
      Left = 91
      Top = 140
      Width = 151
      Height = 21
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 11
    end
    object cbamount: TCheckBox
      Left = 10
      Top = 167
      Width = 74
      Height = 17
      Caption = #24211#23384#25968#37327
      TabOrder = 12
      OnClick = cbamountClick
    end
    object edtamount: TEdit
      Left = 91
      Top = 164
      Width = 151
      Height = 21
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 13
      OnKeyPress = edtamountKeyPress
    end
    object ckbnewDate: TCheckBox
      Left = 10
      Top = 193
      Width = 72
      Height = 17
      Caption = #38144#21806#26085#26399
      Checked = True
      State = cbChecked
      TabOrder = 14
      OnClick = ckbnewDateClick
    end
    object dtpBegin: TDateTimePicker
      Left = 92
      Top = 189
      Width = 130
      Height = 21
      CalAlignment = dtaLeft
      Date = 37921.4816629977
      Time = 37921.4816629977
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 15
    end
    object dtpEnd: TDateTimePicker
      Left = 92
      Top = 213
      Width = 130
      Height = 21
      CalAlignment = dtaLeft
      Date = 37921.4816629977
      Time = 37921.4816629977
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 16
    end
    object Rbt: TRadioButton
      Left = 10
      Top = 248
      Width = 113
      Height = 17
      Caption = #21463#24433#21709#21830#21697
      TabOrder = 17
    end
  end
  object btnOk: TBitBtn
    Left = 98
    Top = 284
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 1
    OnClick = btnOkClick
    Kind = bkOK
  end
  object btnCancel: TBitBtn
    Left = 172
    Top = 284
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 2
    OnClick = btnCancelClick
    Kind = bkCancel
  end
end
