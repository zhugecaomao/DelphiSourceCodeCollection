inherited dlgps_select: Tdlgps_select
  Left = 275
  Top = 94
  Caption = #26597#35810#26465#20214
  ClientHeight = 363
  ClientWidth = 251
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 251
    Height = 337
    Align = alTop
    Caption = #35831#35774#32622#26597#35810#26465#20214
    TabOrder = 0
    object Label3: TLabel
      Left = 222
      Top = 286
      Width = 13
      Height = 13
      Caption = #36215
    end
    object Label8: TLabel
      Left = 222
      Top = 311
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
    object Cbprovider: TCheckBox
      Left = 10
      Top = 144
      Width = 74
      Height = 17
      Caption = #29983#20135#21378#21830
      TabOrder = 10
      OnClick = CbproviderClick
    end
    object Edtprovider: TEdit
      Left = 91
      Top = 141
      Width = 151
      Height = 21
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 11
    end
    object Cboffice: TCheckBox
      Left = 10
      Top = 168
      Width = 74
      Height = 17
      Caption = #30003#35831#38376#24215
      TabOrder = 12
      OnClick = CbofficeClick
    end
    object Edtoffice: TEdit
      Left = 91
      Top = 165
      Width = 151
      Height = 21
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 13
    end
    object cbamount: TCheckBox
      Left = 10
      Top = 192
      Width = 74
      Height = 17
      Caption = #24211#23384#25968#37327
      TabOrder = 14
      OnClick = cbamountClick
    end
    object edtamount: TEdit
      Left = 91
      Top = 189
      Width = 151
      Height = 21
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 15
    end
    object cbshenq: TCheckBox
      Left = 10
      Top = 216
      Width = 74
      Height = 17
      Caption = #30003#35831#25968#37327
      TabOrder = 16
      OnClick = cbshenqClick
    end
    object edtshenq: TEdit
      Left = 91
      Top = 213
      Width = 151
      Height = 21
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 17
    end
    object cbpsamount: TCheckBox
      Left = 10
      Top = 240
      Width = 87
      Height = 17
      Caption = #24050#37197#36865#25968#37327
      TabOrder = 18
      OnClick = cbpsamountClick
    end
    object edtpsamount: TEdit
      Left = 101
      Top = 237
      Width = 141
      Height = 21
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 19
    end
    object cbtotal: TCheckBox
      Left = 10
      Top = 264
      Width = 74
      Height = 17
      Caption = #24046#39069#25968#37327
      TabOrder = 20
      OnClick = cbtotalClick
    end
    object edttotal: TEdit
      Left = 91
      Top = 261
      Width = 151
      Height = 21
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 21
    end
    object ckbnewDate: TCheckBox
      Left = 9
      Top = 285
      Width = 72
      Height = 17
      Caption = #30003#35831#26085#26399
      TabOrder = 22
      OnClick = ckbnewDateClick
    end
    object dtpBegin: TDateTimePicker
      Left = 90
      Top = 283
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
      TabOrder = 23
    end
    object dtpEnd: TDateTimePicker
      Left = 90
      Top = 307
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
      TabOrder = 24
    end
  end
  object btnOk: TBitBtn
    Left = 102
    Top = 337
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 1
    OnClick = btnOkClick
    Kind = bkOK
  end
  object btnCancel: TBitBtn
    Left = 176
    Top = 337
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 2
    OnClick = btnCancelClick
    Kind = bkCancel
  end
end
